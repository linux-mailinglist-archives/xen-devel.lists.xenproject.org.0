Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A024639F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:43:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bfU-0003kM-2Z; Mon, 17 Aug 2020 09:43:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GDTU=B3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7bfR-0003kE-Tb
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:43:01 +0000
X-Inumbo-ID: fe7f0bbd-3354-4710-9140-6f668cef31bf
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe7f0bbd-3354-4710-9140-6f668cef31bf;
 Mon, 17 Aug 2020 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Yc0rbvsdPh+YupcEFWzw07mb2tlR+BW1aJfU7ftvPTk=; b=FCh/fSwwyeEu8dXzgKAsGBkibm
 JQT2a1x6Oo25/HEuzt5XbJcRMJgV5DRpBxhAm8ja1XICvnu9od0V3teELtVJRCV5+hjymMQyNngos
 ucxH1iaCP6xrylb/Q0pZ1C6zpp+YFfjXZBbVcD2SYOuviHIkez/ukBe2DMdl/0fvUpRU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7bfN-0004Ph-78; Mon, 17 Aug 2020 09:42:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7bfM-00088f-TF; Mon, 17 Aug 2020 09:42:57 +0000
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
Date: Mon, 17 Aug 2020 10:42:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817092406.GO975@Air-de-Roger>
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

Hi,

On 17/08/2020 10:24, Roger Pau Monné wrote:
> On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
>> is x86 code, but there is plan to make it common.
>>
>> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
>> cmpxchg.
>>
>> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
>> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
>> index 029417c8ffc1..f4de9d3631ff 100644
>> --- a/xen/include/asm-x86/guest_atomics.h
>> +++ b/xen/include/asm-x86/guest_atomics.h
>> @@ -20,6 +20,8 @@
>>       ((void)(d), test_and_change_bit(nr, p))
>>   
>>   #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
>> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
>> +
>>   
>>   #endif /* _X86_GUEST_ATOMICS_H */
>>   /*
>> diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
>> index f471859c19cc..c1b16105e9f2 100644
>> --- a/xen/include/asm-x86/x86_64/system.h
>> +++ b/xen/include/asm-x86/x86_64/system.h
>> @@ -5,6 +5,8 @@
>>       ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
>>                                      (unsigned long)(n),sizeof(*(ptr))))
>>   
>> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> 
> Why do you need to introduce an explicitly sized version of cmpxchg
> for 64bit values?
> 
> There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
> handled by cmpxchg detecting the size of the parameter passed to the
> function.
That works quite well for 64-bit arches. However, for 32-bit, you would 
need to take some detour so 32-bit and 64-bit can cohabit (you cannot 
simply replace unsigned long with uint64_t).

I couldn't come up with a way to do it. Do you have any suggestion?

Cheers,

-- 
Julien Grall

