Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3BE87ECE6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694855.1084026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFPD-0002vD-QD; Mon, 18 Mar 2024 16:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694855.1084026; Mon, 18 Mar 2024 16:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFPD-0002t5-NH; Mon, 18 Mar 2024 16:00:07 +0000
Received: by outflank-mailman (input) for mailman id 694855;
 Mon, 18 Mar 2024 16:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFPC-00010X-Jg
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:00:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c297b6-e540-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:00:04 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso591541966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:00:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a1709061cda00b00a46baa4723asm1556486ejh.119.2024.03.18.09.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:00:03 -0700 (PDT)
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
X-Inumbo-ID: 95c297b6-e540-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777604; x=1711382404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HbzZscfp2/Mm7Ud1ZYajdefYIS3C3CLwkbOLfjXB1Y=;
        b=KqtK6CEsy6VG2OC1XrVGJUR4GU0fp9izr7nUHD2NvoBs9CQMGKMvi086CADpXSg1of
         /DaN9VWMq1xY7BY5eCDVRYiPfiHAQZnlj2n46/QoFeSXDd9X5UT9BM5bJXtqYAH13tz3
         8AnH/WZ7FKTtAEKnSEmITGfun5DX2c0doH2g1/tjcDml2shuCR0PEY2XVaSO724RBzt/
         9poHz9xDD9e6YAvIsgxJv+PEoqF7S4YPjsS3Y+RbXYFESXNfTqbmwLpkQejwHsXJakFu
         LCeNJhSuupcqFTIdijnf0psxz+kAiwfWGo6OY9J93DBsTUgdwgL8klCaZwrE1HbeZ1Zf
         E0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777604; x=1711382404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HbzZscfp2/Mm7Ud1ZYajdefYIS3C3CLwkbOLfjXB1Y=;
        b=cHT3po0Tyd0e9HAWyYIp7Rh4xagpSW4LvFfg9vX+fiBK2Ed+uB4MSBcHLtKC7H7Q/R
         Q+INKEPTXbRR3Br6Kko8J7VX01wlFibhM5AS3IxAq3aYujjVU5OtlRdk2WuFan28M5OK
         l+BCJdwZ8XZmeNnNBiIWK0YqNbT8/u4563U4qykxmblAOwgwk96/MhT+i0wjosGdPN6p
         29EGYsqkctiT9Ap7Jz54/cCRJtm8d/6IaUlW42iGAcQPVnQ8Td9i528TobectqvFJmpc
         ezuhKqgHystlxVrAEpQuYIvZBXa6uFS1fffDi6LxOKj3S2jRusDqDg9xFQnXvnvTbSRb
         xRxg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPg750WXLMtQSYqsC+TogNjrP4tKzQfUQBt7POSYMCS2t4mb33UQi6Ofus5ZoWBUEglHcEBSRvnDDjHiQY9kNSUzk2kWul89DshU4Hus=
X-Gm-Message-State: AOJu0YzGe0GubUYstW1nkKUP6fTZVk8bI8Fii9i/bkrJLkZD3TaH4Eul
	WtXx8x4IuZXN8ID6KABa6/ZJWMCesD5REBIrZxc0h4kXsEGamBdLy0oe4QNQiLk=
X-Google-Smtp-Source: AGHT+IGyTlOC3pRf5WIC+HFxyf//D44oVOGRSP99lU4wZoYYaOT/Y7j4ofoUwiaIPWdYzk8khWuxrQ==
X-Received: by 2002:a17:906:7f10:b0:a45:f705:777c with SMTP id d16-20020a1709067f1000b00a45f705777cmr7637596ejr.40.1710777603836;
        Mon, 18 Mar 2024 09:00:03 -0700 (PDT)
Message-ID: <4ee88d53-4b2f-4768-951c-7080680df337@suse.com>
Date: Mon, 18 Mar 2024 17:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-13-jgross@suse.com>
 <fc1b15e7-8ffc-4bc5-90dd-9f501a0e169d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <fc1b15e7-8ffc-4bc5-90dd-9f501a0e169d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.24 16:39, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> The rwlock handling is limiting the number of cpus to 4095 today. The
>> main reason is the use of the atomic_t data type for the main lock
>> handling, which needs 2 bits for the locking state (writer waiting or
>> write locked), 12 bits for the id of a possible writer, and a 12 bit
>> counter for readers. The limit isn't 4096 due to an off by one sanity
>> check.
>>
>> The atomic_t data type is 32 bits wide, so in theory 15 bits for the
>> writer's cpu id and 15 bits for the reader count seem to be fine, but
>> via read_trylock() more readers than cpus are possible.
> 
> As a result, afaict you choose to use just 14 bits for the CPU, but
> still 15 bits (with the 16th to deal with overflow) for the reader count.
> That could do with making explicit here, as a question is whether we
> deem as sufficient that there is just one extra bit for the reader
> count.

Okay, I'll add a sentence to the commit message.

> 
>> --- a/xen/include/xen/rwlock.h
>> +++ b/xen/include/xen/rwlock.h
>> @@ -23,12 +23,12 @@ typedef struct {
>>   #define rwlock_init(l) (*(l) = (rwlock_t)RW_LOCK_UNLOCKED)
>>   
>>   /* Writer states & reader shift and bias. */
>> -#define    _QW_CPUMASK  0xfffU             /* Writer CPU mask */
>> -#define    _QW_SHIFT    12                 /* Writer flags shift */
>> -#define    _QW_WAITING  (1U << _QW_SHIFT)  /* A writer is waiting */
>> -#define    _QW_LOCKED   (3U << _QW_SHIFT)  /* A writer holds the lock */
>> -#define    _QW_WMASK    (3U << _QW_SHIFT)  /* Writer mask */
>> -#define    _QR_SHIFT    14                 /* Reader count shift */
>> +#define    _QW_SHIFT    14                      /* Writer flags shift */
>> +#define    _QW_CPUMASK  ((1U << _QW_SHIFT) - 1) /* Writer CPU mask */
>> +#define    _QW_WAITING  (1U << _QW_SHIFT)       /* A writer is waiting */
>> +#define    _QW_LOCKED   (3U << _QW_SHIFT)       /* A writer holds the lock */
>> +#define    _QW_WMASK    (3U << _QW_SHIFT)       /* Writer mask */
>> +#define    _QR_SHIFT    (_QW_SHIFT + 2)         /* Reader count shift */
>>   #define    _QR_BIAS     (1U << _QR_SHIFT)
> 
> Btw, seeing all the uppercase U suffixes here, I think you had some
> lowercase ones earlier in the series. While Misra doesn't demand
> uppercase for U, it does for L and iirc we decided to use all
> uppercase suffixes as a result. Would be nice if what goes in could
> have this correct right away.

I'll rescan all the patches and change them accordingly.

> 
>> @@ -36,14 +36,16 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>>   
>>   static inline bool _is_write_locked_by_me(unsigned int cnts)
>>   {
>> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
>> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
>> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>>       return (cnts & _QW_WMASK) == _QW_LOCKED &&
>>              (cnts & _QW_CPUMASK) == smp_processor_id();
>>   }
>>   
>>   static inline bool _can_read_lock(unsigned int cnts)
>>   {
>> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
>> +    return cnts <= INT_MAX &&
>> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>>   }
> 
> I view this as problematic: Code knowing that a write lock is being held
> may invoke a function using read_trylock() and expect the lock to be
> available there.

So you expect it to be fine that someone is using read_trylock() 32768 times
recursively while holding a lock as a writer? Sure, I can change the condition,
but OTOH ...


Juergen


