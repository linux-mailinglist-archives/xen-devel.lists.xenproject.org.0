Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F339E8ED5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 10:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851078.1265229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKaBT-0005Qs-Mj; Mon, 09 Dec 2024 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851078.1265229; Mon, 09 Dec 2024 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKaBT-0005Nz-Jh; Mon, 09 Dec 2024 09:36:07 +0000
Received: by outflank-mailman (input) for mailman id 851078;
 Mon, 09 Dec 2024 09:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKaBS-0005Nt-Rl
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 09:36:06 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d3752b-b611-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 10:36:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38637614567so753587f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 01:36:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29caa6dsm7124171b3a.5.2024.12.09.01.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 01:36:02 -0800 (PST)
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
X-Inumbo-ID: 01d3752b-b611-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733736963; x=1734341763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4MyR++MqGUbw3sOgY+sB0OXVcgZQHdxm3Y8npC31QRA=;
        b=BAylYyU+L84biSYWI4WxkZ/awMgGG5Mrgs7KIIAFoy01yUskTTRQq6Tk1XHEf65HxF
         gUZ+g34JIoAXnTGwPFRm8pxgX7cVIRtx6/lcdSOoK99e4IkLtbAnFBlFoiLg8d3ISf+6
         3eus5aoUrx2UJQzLZuksDcjHW8D9S/zl4+dfI+59FRFU1LCyXTYnM5BexLS2PMEcG3dK
         mk7w/56dM0U+Pwx+/orNiihhjqStWtbQ65IMG3PpYJoM1OaLl6g1ie8cERyp6MmRUCHs
         Y9pl4WO96/f7KK9cJHIJYqdZGMyDRs1kigWlXsCFK0Bej2Jhk8znAd3Y4noyPEZJ8U3r
         plQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733736963; x=1734341763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MyR++MqGUbw3sOgY+sB0OXVcgZQHdxm3Y8npC31QRA=;
        b=ouLQC6dgBaHpH+t1aF52NvvFKah1955FZHg/JllVtLvSXrhGqU2higfNv4BiW56p2s
         UTISy+GrWqlciandouDvTlNX8EKFWvB0HKz1d3K+pBer+Fr0l1ZwruloGv2hQgK8VoF0
         +dsEpQwL3n5g07D4IUNTAx1TEQiDF760My6/+PdqB34UlixuK2XYGMDLggoJyXobMyL7
         +eehWabZ/UWkIiQvbSVf5hrQwyXdBnI1RgdCVMJFhyKj8ntWPz5AkzNaW2cs4pkcmLzk
         Q33j5G5ULccnzQLydFPOgG+b2d1I50eGt+xKntlqPvStLwBucC8fJLE9HhVoYtpJMzY3
         nMFA==
X-Forwarded-Encrypted: i=1; AJvYcCU35oiVR2coPkIpuxgoBT96vHCmqeN/p+z03fKCyvWspBVCqi4XQCpl/2Qo/YIBeKtQH7DcXk58jZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKzIT2XsdbW5gcYW9S0jpX66FYfbskF0yKxrVai9dWyW1po6Qc
	p3msWaVeQ/NunRYF8xRE6weVyodDaAcAb4TPfIv3I5LHhxRLJWyjCcxUpT5Pnw==
X-Gm-Gg: ASbGncszX+9c6cpqAkqnotm6zaLkd5hmR5Pm2hI0ywNHVdUxtVfXFezMsUfVNK24i83
	YlvlsoemOEBUw7sCfwNAS50AAZO6crctk7WdUw6Z5056fwMNUpXwAz46WPVQ1Lzu1pmqsrq2xvQ
	6xwro7/Ncm7gULVK5zwSSgvTQ9KH49eEatp0p1TAilq25JdH6+ouLihPMRfnd7X/Nq+FUFrnb5d
	dhGFqBfDdCu1vqQeHJcwQjydDWeCQsMwQwbfafxmclNs5Jzhuz/lklYZXshP1W7Q4K9OelErDB3
	btOLiAVmDSwZSgnKQFWzILe5gxjo5POUF0s=
X-Google-Smtp-Source: AGHT+IEtwqmgtUf7i9PFreWCQfnT5GS+R735A68IzyvL4zsrYMnF4xpgcr3GrZff9M7HvivjUeYclg==
X-Received: by 2002:a5d:59a9:0:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-3862b33f3dbmr8817750f8f.11.1733736962866;
        Mon, 09 Dec 2024 01:36:02 -0800 (PST)
Message-ID: <0de3796a-b2b4-4661-b6d7-eee32be66014@suse.com>
Date: Mon, 9 Dec 2024 10:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen: arm: enable stack protector feature
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-4-volodymyr_babchuk@epam.com>
 <d6f17723-8503-4e6e-bd5e-0a42a7149ac3@citrix.com>
 <CAJ=z9a2v-96CSjpRSfn2s+BydcC=boFt7RGhU+BRXpaVphG8MQ@mail.gmail.com>
 <79bb69b0-b00d-4e3c-966e-a341eac59499@citrix.com> <87a5d94dwk.fsf@epam.com>
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
In-Reply-To: <87a5d94dwk.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2024 05:46, Volodymyr Babchuk wrote:
> So, apart from already present
> 
> static always_inline void boot_stack_chk_guard_setup(void);
> 
> I did this:
> 
> /*
>  * Initial value is chosen by fair dice roll.
>  * It will be updated during boot process.
>  */
> #if BITS_PER_LONG == 32
> unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927;

At least this and ...

> #else
> unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09c;
> #endif
> 
> /* This function should be called from ASM only */
> void __init asmlinkage boot_stack_chk_guard_setup_early(void)
> {
>     /*
>      * Linear congruent generator. Constant is taken from
>      * Tables Of Linear Congruential Generators
>      * Of Different Sizes And Good Lattice Structure by Pierre L’Ecuyer
>      */
> #if BITS_PER_LONG == 32
>     const unsigned long a = 2891336453;

... this will need a UL suffix for Misra. Probably best to add UL on all
four constants.

As to the comment, please adhere to ./CODING_STYLE.

> #else
>     const unsigned long a = 2862933555777941757;
> #endif
>     const unsigned c = 1;

I'm having a hard time seeing why this need to be a static variable. Its
sole use is ...

>     unsigned long cycles = get_cycles();
> 
>     if ( !cycles )
>         return;
> 
>     __stack_chk_guard = cycles * a + c;

... here, where you can as well write a literal 1.

Jan

