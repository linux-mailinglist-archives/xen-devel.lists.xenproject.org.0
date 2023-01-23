Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B365678A1B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483272.749331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4t6-0001FQ-C8; Mon, 23 Jan 2023 22:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483272.749331; Mon, 23 Jan 2023 22:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4t6-0001DE-9I; Mon, 23 Jan 2023 22:02:00 +0000
Received: by outflank-mailman (input) for mailman id 483272;
 Mon, 23 Jan 2023 22:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pK4t4-0001D8-G0
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4t3-0004ql-FP; Mon, 23 Jan 2023 22:01:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4t3-0000fO-A4; Mon, 23 Jan 2023 22:01:57 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=yFpe2KVEJ2lFuASDCYbfpvVJtAEx0uiL7bNCS4k4EXE=; b=sjxZqaXQfExJhdjT33PvwQsfWh
	w+l9bi3FHC/OwAY31W2Zf4GKG01sI8hSsXvogOcYMwm6rwvFVkkkKCIKmX8EwwHum6V+0K2oFQykB
	bVZ6bjPKet5zTc1SqvYi1MSnNLkJ1u3Gkbc7tQNl6gwjRwRWAWhmYmqe2BmBSiz1XerI=;
Message-ID: <2dd5c041-ef70-64e0-dc22-25a0c813c5de@xen.org>
Date: Mon, 23 Jan 2023 22:01:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <alpine.DEB.2.22.394.2301231345010.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301231345010.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/01/2023 21:45, Stefano Stabellini wrote:
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index 68adcac9fa8d..2366928d71aa 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -406,6 +406,11 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>>   }
>>   
>> +static inline bool arch_has_directmap(void)
>> +{
>> +    return true;
> 
> Shoudn't arch_has_directmap return false for arm32?

We still have a directmap on Arm32, but it only covers the xenheap.

Cheers,

-- 
Julien Grall

