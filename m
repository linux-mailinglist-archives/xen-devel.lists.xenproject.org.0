Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AFA6D735
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925170.1328042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twe3S-0005lI-SD; Mon, 24 Mar 2025 09:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925170.1328042; Mon, 24 Mar 2025 09:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twe3S-0005jB-On; Mon, 24 Mar 2025 09:25:10 +0000
Received: by outflank-mailman (input) for mailman id 925170;
 Mon, 24 Mar 2025 09:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twe3Q-0005ik-W4
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:25:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de385b48-0891-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 10:25:04 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-399749152b4so1212124f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 02:25:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e35sm165757685e9.14.2025.03.24.02.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 02:25:03 -0700 (PDT)
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
X-Inumbo-ID: de385b48-0891-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742808303; x=1743413103; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EHZi3PeeiNk1F7JMhHvro11yFMWwmoHFX4Dhm0I83T0=;
        b=CvTKi727KyahO/31CXoyly1GYuIF1uG7i65tv7J/NCHuMBz92fEFhdskylx8C9txo+
         qS/XMNQ7IbNOhzUduEAnGPmWm0AUU52PIN+PJNroGUTI3oKqRJhtiPPbfxBFu3OTx1VP
         0wKbk7pLfgOp8V4boQt0WabbAbUiGiVPoNuSZOQ2QoNvYUFBp6AAHlgYW6S/MvQqbibY
         8Xpchl8NPcM/fjEFnD/ubB2bQwe23pM5dLW/l//n/ZyGxbQuJ6Gf9eqOpqNeDnJiTEbH
         vRKTXIDOu15U4UyQdgAQ5hfYV9rfUHz1nCv7jaFzCa9D6oz/3ikDitJ/i15IbtD1y8Cq
         kppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808303; x=1743413103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHZi3PeeiNk1F7JMhHvro11yFMWwmoHFX4Dhm0I83T0=;
        b=saQVMJaxlneiALyhE4ZFYyyY4zvSI3vwuCtAIuOil3YuttTAVcgPYmiuuEVOg9MImE
         yAYH+DLdJCq5MfSHB4GzQOE3HOKcZgWMGM9PLMw4mH0U0HpIFsmud/8CvdHyf2Y3uhKL
         BoLJTs3w4TNDaLDelvhsW7hE6F1IL4ZmsKHxIL/vBiedbi/tqcJf0AHw9CyWnbI7sJyw
         mXXtK+/ruOLTEBfuF802NP56FJkCnOmkpZ5jhrwW5nfV4/iz5/27AIueTf53V9qZjSc5
         5QagQVnr6NVBr+651AhzSOzqnD0z12MPmuQOYzTiOmSbYBCIeQJpblaXdCEQ03Ud4EJN
         6n9g==
X-Forwarded-Encrypted: i=1; AJvYcCVDaCHVUSWSBqbYQPMTUb6QFWZspc2+ihhkBotJPDEmDwgzT3/IAH0rPLip62Raw+DAyiMrV9vSONc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyjo/sWM9l3aI48SGUsdb4t54VwiOJ3cjNPyATxtbQHz1ll0cXn
	NC3uRkNDJreS+uCcJ5Fux53M4kTRoHx5RcoZQvMk28n1lJZUAOec3EU6JVxAYQ==
X-Gm-Gg: ASbGncsqOMztpKuIfu/wDTzvHmUvDE8R6/bl5iGUnHK2v3dJOZlJeTegHILkm7Bh7U2
	3kSi5Nu9dSxJXU40vQXoMAiABZrnB0kew77eZDIAovLniMcQH8Tt9QV8bQ1MTPwh6NhKlXgpro8
	A/FiAP4EmqexhqYOY5aRbX0xPjy0cVDNKL6gXhxEImsbFQ3tEd5K9pFhZBhRX22cKD9QSTpZiix
	bdz0s7IlJgCL6Umoiox5RySyVYpLOBGxWJFUi0hGaMm6tzfOIGymshSvDyiVbEYM+oLrkKJ5Udf
	V0ISuCy/vmFTGKiPh+lrNI5JX5TlwhDZlCEJCFL2k0W+aKZ85ZxL1ta7LITiBWNsMsut5WhSjFp
	NBLZ1D6D/ErnR+XMuSSn/XMUJHwmNBQ==
X-Google-Smtp-Source: AGHT+IFbbsFGCjyG3t72PV8ct0mM5c+W7Tk6feIZABFxSYtjQXaJ4FNIeUO74msGQ/D2jDOOslXh0g==
X-Received: by 2002:a5d:47c6:0:b0:391:2e31:c7e8 with SMTP id ffacd0b85a97d-3997f8f607emr11024176f8f.2.1742808303508;
        Mon, 24 Mar 2025 02:25:03 -0700 (PDT)
Message-ID: <678026b3-c794-4b60-83e6-ff2a54384171@suse.com>
Date: Mon, 24 Mar 2025 10:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 03/12] add elf.h
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-4-jgross@suse.com>
 <e616cf59-bcb6-478d-87b5-f35a51ce1dda@suse.com>
 <84fa74ee-70e4-4318-9aff-12dcb8db50c1@suse.com>
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
In-Reply-To: <84fa74ee-70e4-4318-9aff-12dcb8db50c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 16:53, Jürgen Groß wrote:
> On 21.03.25 14:51, Jan Beulich wrote:
>> On 21.03.2025 10:24, Juergen Gross wrote:
>>> +/* e_type */
>>> +#define ET_NONE      0           /* No file type */
>>> +#define ET_REL       1           /* relocatable file */
>>> +#define ET_EXEC      2           /* executable file */
>>> +#define ET_DYN       3           /* shared object file */
>>> +#define ET_CORE      4           /* core file */
>>> +#define ET_NUM       5           /* number of types */
>>> +#define ET_LOPROC    0xff00      /* reserved range for processor */
>>> +#define ET_HIPROC    0xffff      /*   specific e_type */
>>> +
>>> +/* e_machine */
>>> +#define EM_NONE      0           /* No Machine */
>>> +#define EM_M32       1           /* AT&T WE 32100 */
>>> +#define EM_SPARC     2           /* SPARC */
>>> +#define EM_386       3           /* Intel 80386 */
>>> +#define EM_68K       4           /* Motorola 68000 */
>>> +#define EM_88K       5           /* Motorola 88000 */
>>> +#define EM_486       6           /* Intel 80486 - unused? */
>>> +#define EM_860       7           /* Intel 80860 */
>>> +#define EM_MIPS      8           /* MIPS R3000 Big-Endian only */
>>> +/*
>>> + * Don't know if EM_MIPS_RS4_BE,
>>> + * EM_SPARC64, EM_PARISC,
>>> + * or EM_PPC are ABI compliant
>>> + */
>>> +#define EM_MIPS_RS4_BE 10        /* MIPS R4000 Big-Endian */
>>> +#define EM_SPARC64     11        /* SPARC v9 64-bit unoffical */
>>> +#define EM_PARISC      15        /* HPPA */
>>> +#define EM_SPARC32PLUS 18        /* Enhanced instruction set SPARC */
>>> +#define EM_PPC         20        /* PowerPC */
>>> +#define EM_PPC64       21        /* PowerPC 64-bit */
>>> +#define EM_ARM         40        /* Advanced RISC Machines ARM */
>>> +#define EM_ALPHA       41        /* DEC ALPHA */
>>> +#define EM_SPARCV9     43        /* SPARC version 9 */
>>> +#define EM_ALPHA_EXP   0x9026    /* DEC ALPHA */
>>> +#define EM_IA_64       50        /* Intel Merced */
>>> +#define EM_X86_64      62        /* AMD x86-64 architecture */
>>> +#define EM_VAX         75        /* DEC VAX */
>>> +#define EM_AARCH64    183        /* ARM 64-bit */
>>
>> Here I similarly think some stripping down might help. Doing so would then
>> also permit to leave out the comment in the middle.
> 
> Here I'm a little bit more on the edge. Some historical entries can
> probably be dropped, but which ones would want to stay?

The ones we presently need for any of the architectures we have (partial)
ports for in the hypervisor, or that the hypervisor targets for compatibility.

Jan

