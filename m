Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F161A244ED3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 21:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6fKY-0001yj-BB; Fri, 14 Aug 2020 19:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6fKW-0001ye-Uc
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:25:32 +0000
X-Inumbo-ID: 885017a7-7f93-4b70-80b4-4bd653fd29cf
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 885017a7-7f93-4b70-80b4-4bd653fd29cf;
 Fri, 14 Aug 2020 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=X+1wj7CZ2mb9Mwb3vXsw6OK5ZO/1zN8ByjX4rM9Zq6k=; b=gcYW2wGDyNuI8+JMOUSULtdDdN
 EiTS8X21dN2+PoKlCw0EOe8kjNSiWXgKNP0PylH8Vby4spVTESx1r9AMIztrg75xUXbD5QPoAcZu2
 EmvfBZtdu+0k1GEgl1JYGap/xdk0efDXL54TZHbTV30yjisyht2T92eeZMrmpt8Wcg/g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fKU-00058z-D6; Fri, 14 Aug 2020 19:25:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fKU-0002nK-4z; Fri, 14 Aug 2020 19:25:30 +0000
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
Date: Fri, 14 Aug 2020 20:25:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

Sorry for the late answer.

On 23/07/2020 14:59, Andrew Cooper wrote:
> On 23/07/2020 14:22, Julien Grall wrote:
>> Hi Jan,
>>
>> On 23/07/2020 12:23, Jan Beulich wrote:
>>> On 22.07.2020 18:53, Julien Grall wrote:
>>>> --- a/xen/arch/x86/irq.c
>>>> +++ b/xen/arch/x86/irq.c
>>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>>          for ( ; ; )
>>>>        {
>>>> -        int irq = pirq->arch.irq;
>>>> +        int irq = read_atomic(&pirq->arch.irq);
>>>
>>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>>> would want this to be ACCESS_ONCE(). So I guess now is the time
>>> to settle which one to prefer in new code (or which criteria
>>> there are to prefer one over the other).
>>
>> I would prefer if we have a single way to force the compiler to do a
>> single access (read/write).
> 
> Unlikely to happen, I'd expect.
> 
> But I would really like to get rid of (or at least rename)
> read_atomic()/write_atomic() specifically because they've got nothing to
> do with atomic_t's and the set of functionality who's namespace they share.

Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I 
would also suggest to move them implementation in a new header asm/lib.h.

Cheers,

-- 
Julien Grall

