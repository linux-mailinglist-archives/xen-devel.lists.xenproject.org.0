Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041BD1E1AE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 11:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202870.1518283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyBt-0006wm-OB; Wed, 14 Jan 2026 10:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202870.1518283; Wed, 14 Jan 2026 10:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyBt-0006ti-Kj; Wed, 14 Jan 2026 10:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1202870;
 Wed, 14 Jan 2026 10:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfyBs-0006tc-36
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 10:33:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75199773-f134-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 11:33:25 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b870cbd1e52so510024366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 02:33:25 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870889ac26sm1040581266b.28.2026.01.14.02.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 02:33:24 -0800 (PST)
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
X-Inumbo-ID: 75199773-f134-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386805; x=1768991605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgAfa1yLWbGs9M2xhWgwMQab8J7/IoMLZh/Ypl2FAwA=;
        b=M/ZNzT/6mzE8n1bD9TTC2bC2FAZND7Pt5jaKuiPm6sMlbbRXRwMAmwaSCWiddEutTD
         z4DWZqfa4DdTNL+6e/2LhhgeYW8KO8ZF8A91Oznp+6E8hismVvgTyUJLkjhUCyOnNV/H
         npAum9S5vGUNnbz5B6omS4wjXeNADPFYlWY88uNFdW8baQluDopFadtOjc7gueem4ISR
         Utgv24fUzDeiGwvvC5E/R08Je4ch9aXQcF4ayC91vTsGAxNcYogoj7H061VFDATb256e
         OpP7VGXIyDGOidfhEhbyxR2WfP+JSw5BFlcbxsyyT5Kzq8UprnRU8wBrc2pBdjexGZfK
         aWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386805; x=1768991605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgAfa1yLWbGs9M2xhWgwMQab8J7/IoMLZh/Ypl2FAwA=;
        b=xNPltCfmqYuOsQ5E5mLWjp6paVRgM72Ty8smQpM6HswdASfZ0UfUhZ9CTNDSXzwd6K
         kCB1VlOjPF3vAJtUcWbk//zN1Z1Ms5BqyMBtPf1Rssfe+lyg+GzPu9awGY63bRR8wblp
         SsPhHrUmizptvlngCbT2MARvapRB5AHyxoxc2haX5GXkQ3uGbvMTEqGRl9uq6siqPgJ4
         ZYettZQTK093OfR6scsr8SZm4Y97kH70peo9CrXUn/Ta5zFnXA4rBSjv5qhDwz5BsoX1
         h1nUvZl+N8V77iAOl1T9PnYrE6NoiTxwscNI+73VKhBb0X8ed+DBKmCzw0pzNLgq8TZb
         ZVfg==
X-Forwarded-Encrypted: i=1; AJvYcCVtBNP8vSkWek3ynroLB5OPm4RjdEwfL2Ftuaa6LLL28dLBYrO9NGxoAKL8A+oUDXTgwysAICqbIOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynakzYXcj34AKsXJBRRiVR7ir9JBBk1M/72t9/dGKZkCnbY7ta
	uf7YtdJZSSMSDaxUBEjPApe3eOKjRAKkXXU62iRcVSiOdDCkqfEXudkk
X-Gm-Gg: AY/fxX7bXHko0ZPOJWHUS/pH9BjncCcwp0gMvIVq/wj5rtytLEqgBBQ0q8L6v2HB71M
	z1+gGCqRmsHNLKAJc5cH8VIYYaqdDqnw1wSvfqBj9Keko2Rdj0DsvKyK/6LF4UskonIzBPnZF5p
	7worR4CHzTZeF2I2uYxcWcev3koBgRgqIGfOfJ37XZCQp3E1ryM/E8K/iXu8IVrKQBMlIBYF72G
	+pZZ4QEtcDUWnYxbg3y4/On1jnP3cgfflTyaeGVspISreor+pLHv/K1kG0F2Ka7Yv9JdHlFcJ7H
	v9Fz8Bhq1vmHDvT3zAKCD/bq5RVxSwxDKni57VmfvHVyYUz7hyGs6dtUorBH8AdqiJKjz0AdCET
	bNB4Lx/hdxK3WNrBNzozxOpXRmH886oT/zbNb8TYeEZ9IoUJgWQPwNC1b2CrbH9keshjKgSka96
	wWQigoxX9LD83sJgONEJbJLKonyx2fZOeiaML6K3zRtbqQZcU8E3ewSfVPgKO3ELg=
X-Received: by 2002:a17:906:f049:b0:b84:42e5:2b8a with SMTP id a640c23a62f3a-b87612dbed6mr193184266b.58.1768386804491;
        Wed, 14 Jan 2026 02:33:24 -0800 (PST)
Message-ID: <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
Date: Wed, 14 Jan 2026 11:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
 <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
 <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 10:53 AM, Jan Beulich wrote:
> On 14.01.2026 10:41, Oleksii Kurochko wrote:
>> On 1/14/26 10:13 AM, Jan Beulich wrote:
>>> On 13.01.2026 17:50, Oleksii Kurochko wrote:
>>>> On 1/12/26 4:24 PM, Jan Beulich wrote:
>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>>>>>         cpu_khz = rate / 1000;
>>>>>>     }
>>>>>>     
>>>>>> +int reprogram_timer(s_time_t timeout)
>>>>>> +{
>>>>>> +    uint64_t deadline, now;
>>>>>> +    int rc;
>>>>>> +
>>>>>> +    if ( timeout == 0 )
>>>>>> +    {
>>>>>> +        /* Disable timers */
>>>>>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>>> +
>>>>>> +        return 1;
>>>>>> +    }
>>>>>> +
>>>>>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>>>>>> +    now = get_cycles();
>>>>>> +    if ( deadline <= now )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    /* Enable timer */
>>>>>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>> Still learning RISC-V, so question for my understanding: Even if the timeout
>>>>> is short enough to expire before the one SIE bit will be set, the interrupt
>>>>> will still occur (effectively immediately)? (Else the bit may need setting
>>>>> first.)
>>>> The interrupt will become pending first (when mtime >= mtimecmp or
>>>> mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
>>>> |SIE.STIE |(and global|SIE|) are enabled.
>>>>
>>>>>> +    if ( (rc = sbi_set_timer(deadline)) )
>>>>>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>>> Hmm, if this function ends up being used from any guest accessible path (e.g.
>>>>> a hypercall), such panic()-ing better shouldn't be there.
>>>> I don't have such use cases now and I don't expect that guest should use
>>>> this function.
>>> How do you envision supporting e.g. VCPUOP_set_singleshot_timer without
>>> involving this function?
>> Looking at what is in common code for VCPUOP_set_singleshot_timer, it doesn't
>> use reprogram_timer(), it is just activate/deactivate timer.
> And how would that work without, eventually, using reprogram_timer()? While not
> directly on a hypercall path, the use can still be guest-induced.

Of course, eventually|reprogram_timer()| will be used. I incorrectly thought
that we were talking about its direct use on the hypercall path.

I am not really sure what we should do in the case when rc != 0. Looking at the
OpenSBI call, it always returns 0, except when sbi_set_timer() is not supported,
in which case it returns -SBI_ENOTSUPP. With such a return value, I think it would
be acceptable to call domain_crash(current->domain). On the other hand, if some
other negative error code is returned, it might be better to return 0 and simply
allow the timer programming to be retried later.
However, if we look at the comments for other architectures, the meaning of a
return value of 0 from this function is:
  Returns 1 on success; 0 if the timeout is too soon or is in the past.
In that case, it becomes difficult to distinguish whether 0 was returned due to
an error or because the timeout was too soon or already in the past.

It seems like at the moment it is better to call domain_crash() and change it
if it will be necessity in the future as I expect that the only negative code
which will be returned by sbi_set_timer() will -SBI_ENOTSUPP and if this SBI
call isn't supported then we anyway need a different way to set a timer.

~ Oleksii


