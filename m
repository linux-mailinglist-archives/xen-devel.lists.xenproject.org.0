Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35532687E8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkPh-0004qY-Dn; Mon, 14 Sep 2020 09:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LHiq=CX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kHkPg-0004qS-46
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:04:40 +0000
X-Inumbo-ID: 32a226ce-c471-44d3-9de4-c632d29fa128
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a226ce-c471-44d3-9de4-c632d29fa128;
 Mon, 14 Sep 2020 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=eyGsy5jZ2+w454Toz8frYA+/6ej0XHarCvFmep2QnHQ=; b=cRS2Yro9NZpMnnX3zF8o6nV50Q
 BzPL5DFZjGC4wrVlmjHNDHs/riVF3bn5JpofRLHwGZBMN8uFh1FOX66b+qcDjF3e201fsooC0nAhs
 FHqVE79SJih+6upB2OcWfK9+bRaVmEu39xEA/nivk9RDmQjCZYYCNOGbz2J7JDkFu6nU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkPS-0001PL-Ba; Mon, 14 Sep 2020 09:04:26 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkPQ-0002lX-GK; Mon, 14 Sep 2020 09:04:25 +0000
Subject: Re: [PATCH v2 2/2] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, oleksandr_tyshchenko@epam.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200911160622.19721-1-julien@xen.org>
 <20200911160622.19721-3-julien@xen.org>
 <403f8774-1ca9-560d-2ca5-fa00b64d2a98@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6cb6b747-5747-e069-8133-a5268efe71db@xen.org>
Date: Mon, 14 Sep 2020 10:04:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <403f8774-1ca9-560d-2ca5-fa00b64d2a98@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 14/09/2020 09:48, Jan Beulich wrote:
> On 11.09.2020 18:06, Julien Grall wrote:
>> --- a/xen/include/asm-x86/guest_atomics.h
>> +++ b/xen/include/asm-x86/guest_atomics.h
>> @@ -20,6 +20,7 @@
>>       ((void)(d), test_and_change_bit(nr, p))
>>   
>>   #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
>> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> 
> While them sitting side by side there's perhaps little risk of
> them going out of sync with one another, I still find it a
> little odd to open-code guest_cmpxchg() instead of using it,

It depends on how you view it... The implementation is indeed the same 
but they are meant to be used in different places.

Anyway... I can use:

#define guest_cmpxchg64 guest_cmpxchg

Cheers,

-- 
Julien Grall

