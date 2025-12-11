Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B3CB5192
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 09:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183651.1506268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc1J-000326-Tj; Thu, 11 Dec 2025 08:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183651.1506268; Thu, 11 Dec 2025 08:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc1J-0002zg-R8; Thu, 11 Dec 2025 08:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1183651;
 Thu, 11 Dec 2025 08:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTc1I-0002za-46
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 08:27:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 392d34f0-d66b-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 09:27:25 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477770019e4so5677775e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 00:27:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b259sm4050319f8f.41.2025.12.11.00.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 00:27:24 -0800 (PST)
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
X-Inumbo-ID: 392d34f0-d66b-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765441645; x=1766046445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jOL0TVLdzuzrbFMtV2QPKKu9e9th0pShxUmuLVzu94A=;
        b=ADeCb5XXAdRmifotgBx9nJaSXRTwE+kx0RG1858OUYw4BgkVo2b4WGF4yJ/n1j3jj0
         xWOJ+S5KVzzk6bFK/9ZxTWOl7ToTckeM0kZSaRSAULwqHDEFDf/LHjyun7B82XOQ8S52
         1HFMGFmSPgq61jK5c/FzkunQ03XhPG9/ItsUS+zckT8X0aoyeDVGWQKDqRn4dPw7P6SK
         XgATomyhQEpk68Sbq2ZZ8hofTFrkV1KnB039KB0psvxPTnAGLETDWlUb3+j7ulUgSpQR
         urc/LcHPIxkUt9laCLYDt2epe9rEdYquVIKndhR66Ef+GPhQ2bNK61zq8BbQDa6ppiBo
         o/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441645; x=1766046445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOL0TVLdzuzrbFMtV2QPKKu9e9th0pShxUmuLVzu94A=;
        b=vB7kBHwAvJ0cBBIQ8QrN6n6/mla0YmPHrwpn0mCmpxZo0GBJauqmmT7STS4f9H7C4W
         MlC57VnD2QXORk/D6R0oMRL7UFX4DVtycJARZCF4zEIbuYafhFDHzA1KHDj56VEwhqgJ
         XA0lS1D3GCJBbKSu/73pLjj7lPPMaEyLmeIMKuwcBr208ALlpYKpfAahFYZXmsAWj154
         GGdDASohN7V5bSrN0uN/0bz6DP94Y9xRJeVg18r8aT7lICujdDpo07vRiJI/2hDQkZqA
         BPGdVQwwnB7tAiQqZIm06qp34o88SizeIXgD9uciPg6ENR/J2X+LGlvofwaivJThwj2p
         Gyfg==
X-Forwarded-Encrypted: i=1; AJvYcCXrq6u6Z3Q8IsUS2BmUIfDNUSa/x/HsjK7FIMiOvDk5BbMRRpWp9qALc1evxjvO51CEMuehP82cohs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxut1AdfIhRKUQ8vKuPMzEMLZLPxhPU43RSY/2rLICzmvKehaT8
	X9+LW98HcHvbjQDZfcW98FQNnoM+7LrPBSMja+oYIyQUH73O9BExozE8230lPuiZtA==
X-Gm-Gg: AY/fxX6BN4Mbbu9JLXoxSrwMN0Eqqhsz4/Yz1wMMCnMCeCZYcoFlrFhhPbVS1JQbVDy
	RlR5QOp2obJYg1WYtFUb4xLU4BxW3DY0ZQ3Mi816w1n6wX738hpLdwBypoOd2XYGJwJH3vTSEq6
	jRjkmL9rpjS2+W/qmNSvcO1oTt50C5DqrKoTvmWo8aMPmAPfBa/r6Zj+p8WHErKE9m0TNUbEXWH
	WE8R4ZOa7ELOkbVg1MCDiLPVZcp3FMS++xXD0+bqp+JqaD8CpEGf3mbv3Hue8kcMXiij7RHFicA
	TyJBlsV+IKFmHy7bWKAiQ5+BCf0VvShDieN6a4YM54QfXqIV/IDu9FacC9YTtG06dcgFYSVvC/I
	EHlu0NmfIMJZaQkbz88I9W3d5bmOPl3zTDunQ0ZXK6XaHhtVhoCgyPbOBvCjSbCMKoalFiBZ7Tr
	QpGnlrhfQok6w07TAbLNNbwzLRJMA97Pk/j3J5AyvcBqFBqmDE64YWC9wPNdoCmchvgqsZ5OzeO
	d/FUcJzNR46Pg==
X-Google-Smtp-Source: AGHT+IHi+uiGAB0eMnZVtcvtel8WdcGCtnwJvE6tty60YZvdK1MZvvPgtgrnWtfG2s4Vi8+Yfqy/gw==
X-Received: by 2002:a05:6000:402a:b0:42b:3c25:ccea with SMTP id ffacd0b85a97d-42fa3b07b61mr5564713f8f.42.1765441645162;
        Thu, 11 Dec 2025 00:27:25 -0800 (PST)
Message-ID: <9fffa010-536f-468a-8ae7-31a72bc36366@suse.com>
Date: Thu, 11 Dec 2025 09:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
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
In-Reply-To: <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 02:28, Jason Andryuk wrote:
> On 2025-12-10 11:55, Andrew Cooper wrote:
>> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>>          . = ALIGN(4);
>>>          __alt_instructions = .;
>>> -       *(.altinstructions)
>>> +       KEEP(*(.altinstructions))
>>>          __alt_instructions_end = .;
>>
>> Thinking about this, what we need is for there to be a reference tied to
>> the source location, referencing the replacement metadata and
>> replacement instructions.
>>
>> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
>> might be able to do this with .reloc of type none.  In fact,
>> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
>>
>> This means that if and only if the source function gets included, so
>> does the metadata and replacement.
> 
> With Jan's -Wa,--sectname-subst changes added to CFLAGS, this seems to 
> work somewhat.  I'm trying to make the ALTERNATIVE place relocations 
> against the .altinstructions.%%S and .altinstr_replacement sections:
> 
> diff --git c/xen/arch/x86/include/asm/alternative.h 
> w/xen/arch/x86/include/asm/alternative.h
> index 18109e3dc5..e871bfc04c 100644
> --- c/xen/arch/x86/include/asm/alternative.h
> +++ w/xen/arch/x86/include/asm/alternative.h
> @@ -90,18 +90,25 @@ extern void alternative_instructions(void);
>   /* alternative assembly primitive: */
>   #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>           OLDINSTR_1(oldinstr, 1)                                       \
> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
> +        ".reloc ., BFD_RELOC_NONE, 567f\n"                            \
> +        ".reloc ., BFD_RELOC_NONE, 568f\n"                            \

When I saw this, ...

> +        ".pushsection .altinstructions.%%S, \"a\", @progbits\n"       \
> +        "567:\n"                                                      \
>           ALTINSTR_ENTRY(feature, 1)                                    \
>           ".section .discard, \"a\", @progbits\n"                       \
>           ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>           DISCARD_ENTRY(1)                                              \
>           ".section .altinstr_replacement, \"ax\", @progbits\n"         \
> +        "568:\n"                                                      \
>           ALTINSTR_REPLACEMENT(newinstr, 1)                             \
>           ".popsection\n"
> 
> --print-gc-sections shows a few .altinstructions.%%S dropped - as an 
> example:
> 
> ld: removing unused section '.text.reserve_lapic_nmi' in file 'prelink.o'
> ld: removing unused section '.text.release_lapic_nmi' in file 'prelink.o'
> ...
> ld: removing unused section '.altinstructions..text.reserve_lapic_nmi' 
> in file 'prelink.o'
> ld: removing unused section '.altinstructions..text.release_lapic_nmi' 
> in file 'prelink.o'
> 
> The full list is below.
> 
> Unfortunately, EFI doesn't like it with ~14000 lines of:
> ld: error: 0-bit reloc in dll

... I immediately wanted to mention this. Another of the things on my binutils
todo list.

Jan

