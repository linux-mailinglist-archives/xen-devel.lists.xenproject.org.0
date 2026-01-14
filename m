Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B8D1E591
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 12:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202932.1518322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfysk-0005ll-Kp; Wed, 14 Jan 2026 11:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202932.1518322; Wed, 14 Jan 2026 11:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfysk-0005jI-I7; Wed, 14 Jan 2026 11:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1202932;
 Wed, 14 Jan 2026 11:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfysj-0005dl-BU
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 11:17:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a070a907-f13a-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 12:17:35 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso42931905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 03:17:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee57b0749sm24700425e9.7.2026.01.14.03.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:17:34 -0800 (PST)
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
X-Inumbo-ID: a070a907-f13a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768389454; x=1768994254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYU+vXXGEPlDg0hNe/wDoms5L+2v5rMPyCY4NMStuI=;
        b=FC8v7h5zFLL3kIXkY3mtp6o0Gs9kzuiVQj5vDbmznjViZR6EFH4IKMLX5fGolhlFnr
         yx626rRxLsNN0sZ0zdZ9wTHxlCdDCvqAnzahidLZDH2VhtllN0kChXDccVkGNmetbmR/
         ds9QZoHclc3k1IooJ8SmU+ASmJZNkkyBkaFIKza++OW46J5FrBy1o0TwTGEOLRowXOMS
         D4zY0oMaVZLE7j6ep2MjIXAmx/JngneKrV9ybRzMT+0sdPc1XD9uR54mZPKZrqSnwZWW
         tDOPaWV8gkvF3Nbzw5sZQ/z2Fn3kxTQS+WD8IFgaoKIKRfDkB1WyPFc/2Q+PgBwdMuMI
         NmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768389454; x=1768994254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoYU+vXXGEPlDg0hNe/wDoms5L+2v5rMPyCY4NMStuI=;
        b=w2OLHo8HRHqsDqWzESnonl1CcLKIC+G4SYBKnwTPv7UNuYLG7O3D4L3af3AfCxheFp
         cEh8CWnZF8qk6bJneu75pwLvyDMZz3eXWXWRJil9kPhmvgf8rM2lmj5an6HLK91kO1tN
         zVyjYqbodpC+cwN5SW89YeFFivpCqEt75jDmR79HhfWMAoVXH7/cSFqazI5mXDvotS+g
         R1AlZZz4f9msHZ1ouhEkmdWAivaQq+17o5ThKbyW5x53puSc7fuKHwCvGDUo1iqEMOc6
         LaQiZfm35wdFbDzjO1cNZlSbBWQkdpIrwW2rT0d+7dNYW/UBm/qT9PpS0LbcXRmv5cXf
         YnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfGow8XwW0YHR8LAZVoXdJ5aNmllyiVMpJRwOHER5ykEq8Q74CuC8Otkx80AAY4jn4mU1wRSzsKjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye/1ljTXyhLwoVFP3ZT3eXGCSGmaRgDfvsOB+b4BFxZu3ODX9c
	/D/S5U1KJvgPC7T5Eq+C51gEiweLQwSRcOUy4/DW29fHH8U1UOOvB4N+aVHCieRujw==
X-Gm-Gg: AY/fxX7WMrPJIpI4AoA+xjA+Gahxymf9o9XelZp1c3miS2teDK4XFQ/Bg1ebT7CEmJ8
	X+Se6KSK0sDCDYYCKLT4lJUDYnr7azNPQv7yp6g7Nbhvmch8MI0MFWL3rT4Sicp2Axgay/GzJNU
	jAl2R3a91yDcBugBGGZUAf016DtyJf4vi4GYD7eUPdFl/+ob+s3v8yJMWhCwsZ+Z7jpg4pMvLaA
	CivwRkW+Y5KmGTeJzkMFvwtDqjZ/hCOZq8d5iVh106tg4M2+MjGX15R7wCFkjDB/PJZ7UZVjdbp
	F1LCeRGQNrmxhobNpmSuxo88IWkblVIxnJGzoskuXIy3c22ts0n/x6mBbxb0TIP3yBN1D7nB9HK
	Pzwrdx/OCOPEBJyPrMCcO/Y5RH2IxYwPXfaTmAJ1K0E0SqDdLivNigK+JzUnPH5imgHZHXlQ7LI
	LdA+FQ6Iu7qJZqxWUtMtmMcQ9QxqPX/8e0gQNia+NnmPXqPTz51wo1oubqUpuUD1sGYHnFPU3l+
	OI=
X-Received: by 2002:a05:600c:8b52:b0:47e:e20e:bbbf with SMTP id 5b1f17b1804b1-47ee335646fmr26668175e9.24.1768389454633;
        Wed, 14 Jan 2026 03:17:34 -0800 (PST)
Message-ID: <c29d03ec-e83f-4594-9ef6-fcc7b99a318b@suse.com>
Date: Wed, 14 Jan 2026 12:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 11:33, Oleksii Kurochko wrote:
> 
> On 1/14/26 10:53 AM, Jan Beulich wrote:
>> On 14.01.2026 10:41, Oleksii Kurochko wrote:
>>> On 1/14/26 10:13 AM, Jan Beulich wrote:
>>>> On 13.01.2026 17:50, Oleksii Kurochko wrote:
>>>>> On 1/12/26 4:24 PM, Jan Beulich wrote:
>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>>>>>>         cpu_khz = rate / 1000;
>>>>>>>     }
>>>>>>>     
>>>>>>> +int reprogram_timer(s_time_t timeout)
>>>>>>> +{
>>>>>>> +    uint64_t deadline, now;
>>>>>>> +    int rc;
>>>>>>> +
>>>>>>> +    if ( timeout == 0 )
>>>>>>> +    {
>>>>>>> +        /* Disable timers */
>>>>>>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>>>> +
>>>>>>> +        return 1;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>>>>>>> +    now = get_cycles();
>>>>>>> +    if ( deadline <= now )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    /* Enable timer */
>>>>>>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>>> Still learning RISC-V, so question for my understanding: Even if the timeout
>>>>>> is short enough to expire before the one SIE bit will be set, the interrupt
>>>>>> will still occur (effectively immediately)? (Else the bit may need setting
>>>>>> first.)
>>>>> The interrupt will become pending first (when mtime >= mtimecmp or
>>>>> mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
>>>>> |SIE.STIE |(and global|SIE|) are enabled.
>>>>>
>>>>>>> +    if ( (rc = sbi_set_timer(deadline)) )
>>>>>>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>>>> Hmm, if this function ends up being used from any guest accessible path (e.g.
>>>>>> a hypercall), such panic()-ing better shouldn't be there.
>>>>> I don't have such use cases now and I don't expect that guest should use
>>>>> this function.
>>>> How do you envision supporting e.g. VCPUOP_set_singleshot_timer without
>>>> involving this function?
>>> Looking at what is in common code for VCPUOP_set_singleshot_timer, it doesn't
>>> use reprogram_timer(), it is just activate/deactivate timer.
>> And how would that work without, eventually, using reprogram_timer()? While not
>> directly on a hypercall path, the use can still be guest-induced.
> 
> Of course, eventually|reprogram_timer()| will be used. I incorrectly thought
> that we were talking about its direct use on the hypercall path.
> 
> I am not really sure what we should do in the case when rc != 0. Looking at the
> OpenSBI call, it always returns 0, except when sbi_set_timer() is not supported,
> in which case it returns -SBI_ENOTSUPP. With such a return value, I think it would
> be acceptable to call domain_crash(current->domain).

How is current->domain related to a failure in reprogram_timer()?

> On the other hand, if some
> other negative error code is returned, it might be better to return 0 and simply
> allow the timer programming to be retried later.
> However, if we look at the comments for other architectures, the meaning of a
> return value of 0 from this function is:
>   Returns 1 on success; 0 if the timeout is too soon or is in the past.
> In that case, it becomes difficult to distinguish whether 0 was returned due to
> an error or because the timeout was too soon or already in the past.

Well, your problem is that neither Arm nor x86 can actually fail. Hence
calling code isn't presently prepared for that. With panic() (and hence
also BUG()) and domain_crash() ruled out, maybe generic infrastructure
needs touching first (in a different way than making the function's return
type "bool")?

Jan

