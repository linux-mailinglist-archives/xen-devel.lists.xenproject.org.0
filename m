Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2129D4AEA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841292.1256779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4S5-0002uM-Tw; Thu, 21 Nov 2024 10:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841292.1256779; Thu, 21 Nov 2024 10:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4S5-0002sC-R3; Thu, 21 Nov 2024 10:30:21 +0000
Received: by outflank-mailman (input) for mailman id 841292;
 Thu, 21 Nov 2024 10:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE4S3-0002rL-Sb
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:30:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 982f3e75-a7f3-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 11:30:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso8285865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 02:30:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d395asm49942745e9.19.2024.11.21.02.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 02:30:13 -0800 (PST)
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
X-Inumbo-ID: 982f3e75-a7f3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk4MmYzZTc1LWE3ZjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg1MDE0LjU4ODYxMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732185014; x=1732789814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bKEAH3fAy+SlsSI3d4/qlK+dwWIag00PjqkGCn3prh8=;
        b=ePzwQFOZo+ZJrrTTp7slxm1GMQDkUH25DAyqYZtlnU6FeNt7Bfmh8x0LloQX4S/kbq
         aX5S2DlwZWr9qoiOjwry5/4hjMbaPdTqj5GOOwrvjbUw4FcI7GuoWqt+JJcgErnJAfAB
         NsBCaUT8eTSqRjvvKjF6URScX6FFOXVAVSHAyOp9Ixdwvj/foe1OvFq3CjhUgWhF1WI/
         /gDmguYXwPcIn7ZnGWFXA0tXJk+fuWwQApwkI6zivXysr4HM7S13kuF7aiG69tFmrU0i
         kapQ82rqekk/6kzFi0tAbgs9mNQGcgqfErdVPplrmRp6R9vJbeKALrWhJPH/fSUXJx9a
         ktvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732185014; x=1732789814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKEAH3fAy+SlsSI3d4/qlK+dwWIag00PjqkGCn3prh8=;
        b=rXtGhpvXJo+BlaTsY93jFlzLws2zYLNLUbNyPsSF14r0qXzk98l23myVWGR3S7QZMu
         TjWQVMmZOdEE4Kd0RdPp+qTU6oBVQYIk0F8RiTAaPTOXa+ExogbX/7dA5QDj+NaF7EmY
         V5msyXNJHllmxD1u7SUMPqMEHDc2Vq3ph3sneRFkpJtqwzP9ktdAE45DdERVQeJ7vMqJ
         gtuBgzqazvEIrHlctCfTOEztWzwMdzEEL9c7VFAtj0Se7TVcGprtvbqr9FG1HNoMDqkE
         jYWtjWp3BD/9aE4HF8Uv8iokdFzbeFbgPKqDXfvS4LBp8eXI/uJQPoliv6Dibz7TRVQX
         J2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXoRjocNYf2/FtiadEOmwDLbEDQVq6G95JSYvhFEdK8maTgfezI7k+ZTOaEKsBBENINdRZoR3NZ27g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYrXTQsJG4iYTFmlybp5IQxAUiYk6+MH95+bm7810V2S5RCVhR
	XSw5TV+WcZunNI2E7Zon2JfX5/SPsdtorRQuLl88AITqeRxSFX3S5Re/rXBZNQ==
X-Google-Smtp-Source: AGHT+IH31Kmv6MVgR2tUbT7xfZO0FCHDan2dBlQ4TDGD+BEv/0j8X1CCPNQTtua8Z28I2iLkA73d2w==
X-Received: by 2002:a05:600c:4ec6:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-4334f01d8cdmr66607015e9.31.1732185014002;
        Thu, 21 Nov 2024 02:30:14 -0800 (PST)
Message-ID: <ca243df6-ccd8-434b-ad93-abd58f85cfc1@suse.com>
Date: Thu, 21 Nov 2024 11:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Load microcode much earlier on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119215708.2890691-1-andrew.cooper3@citrix.com>
 <7ffe1d78-188b-495b-914a-663181d9faa8@suse.com>
 <39c24cf2-73ac-4da2-84e3-8caee653e83d@citrix.com>
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
In-Reply-To: <39c24cf2-73ac-4da2-84e3-8caee653e83d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 12:24, Andrew Cooper wrote:
> On 20/11/2024 10:44 am, Jan Beulich wrote:
>> On 19.11.2024 22:57, Andrew Cooper wrote:
>>> Following commit cd7cc5320bb2 ("x86/boot: add start and size fields to struct
>>> boot_module"), bootstrap_map*() works as soon as boot_info is populated.
>> I'm struggling with following where this connection is coming from.
> 
> Specifically, the final hunk:
> 
>> @@ -1416,12 +1420,6 @@ void asmlinkage __init noreturn
>> __start_xen(void) if ( bi->mods[i].start & (PAGE_SIZE - 1) )
>> panic("Bootloader didn't honor module alignment request\n"); - /* - *
>> TODO: load ucode earlier once multiboot modules become accessible - *
>> at an earlier stage. - */ - early_microcode_init(bi); - if (
>> xen_phys_start ) { struct boot_module *xen = &bi->mods[bi->nr_modules];
> 
> The context with panic() used to read:
> 
>     panic("Bootloader didn't honor module alignment request\n");
>     bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
>     bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
> 
> and calling bootstrap_map() prior to that mapped junk because the start
> is wrong by PAGE_SHIFT.
> 
> This is why the TODO was inserted the last time around when we couldn't
> move loading as early as wanted.

Hmm, I see. It wasn't really that they were inaccessible, it merely was
that adjustments of internally maintained data would have been needed.
Which could have been as easy as instantiating a local mod variable,
fill it with suitably adjusted data, and pass an address thereof to
bootstrap_map().

In any event:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm surprised though that you didn't comment at all on the other aspect
I raised.

Jan

