Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D1BD2CE3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142268.1476456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GsV-0001qa-CG; Mon, 13 Oct 2025 11:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142268.1476456; Mon, 13 Oct 2025 11:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GsV-0001o8-9W; Mon, 13 Oct 2025 11:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1142268;
 Mon, 13 Oct 2025 11:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8GsU-0001o2-JR
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:38:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135aa150-a829-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:38:02 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso3456100f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:38:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe4esm17526222f8f.26.2025.10.13.04.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:38:01 -0700 (PDT)
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
X-Inumbo-ID: 135aa150-a829-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760355481; x=1760960281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3S+u4aBNcuobhuXiIFmgY10NRAtcnxDfCMlzyjopPYY=;
        b=DnhUB2mR3bX9/JVYwAcLopJZyeifFJ3eteHkkmUHZ2Ul66kUfXCPO1l5z5Lm+qpKbZ
         P2+PSoDgb5LIKMSITl6opNM6KqBvdkgef0hyKolIAEMaQJ/6dyXEOkYulP0pshv3WafT
         RnQvZZi6cL3noh/xH4sRziKgBD4FJCYafz0XhtXdall8O6l1CiXYzfNZgeXg0/eoSpp8
         OoFB/ZXvKJrdhANkZmB5lDyY5k1lgHxf3/nP6goWS5ZFck4AZCXLA+Vuk+cjrYu8jh6z
         knSx2ssDtdUHVIoZsCFz5MpDzyrvT+93QicU6kqoU+qdSBH6hmg0p3XwWCYayKpj+nFX
         zwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355481; x=1760960281;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S+u4aBNcuobhuXiIFmgY10NRAtcnxDfCMlzyjopPYY=;
        b=lASnFCquYM9z/FGtSx661RjGPaZatUOXnbNoHHHorsXpnMXBMLTftGHAsT8pz/2tXm
         bG/wOHoPmfQuvKpIM/jcEeHebRs1D710YJIS/Gq6n+/y02vq8z25EHcDUj6urTG4UGwI
         S9sSMtXiNIQi88+7/LeAi8mASKr7VdwXUtkZ/+lPqFKAfBYv4p341xf657G2I5eGK+da
         h1B4/kkMKw2yHCFS71xmXGBKqPiiOgfJiCBGfm6RB99PPddvoIC2zXFLOQ+c2AIL7x7m
         NZxGoB86GTMaeq7hF0SL2bb5diJMMo+TXLj7qmTkEcphDztzJkUed5QxpkWGPv+R4WAU
         XPhg==
X-Forwarded-Encrypted: i=1; AJvYcCWoKdsya8heBt0Gf0ARFWT9eTZPHA/Zkpt3EZshUYZl2cSeEqQmOQMxyax6wKhpII8/Drv/timDfHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCqXDOq0qlooXig5El2DW9DdR9pY7aZK6RJZtVVzf8oVV8t+3p
	u/phtgDKo/O2RQxT2rlbPEokZMJje/fRP2D2872L7aTpw28anjWx8JWwxmm6SfoydA==
X-Gm-Gg: ASbGncvtvQ1GgU1j0r8VhXFfmuCRSN6S1HmTKS7Nh0E16Kc9fsKLPgYkJnxJQ6CJ8NY
	E42sUjRtkzLDro6grR3au9kT2ITBw6NgFVCHK/oCcWxsX9+SbD9Q5HwSfY1xjREwsJx4oxO8BEj
	muGm3Z7ZC2g9QzQenXO4rRLGVrY7GfUhOxU9FKxlRY3KvW+KLK+4brF2Q1hi4RgU47sEYYfuiKb
	+7CmbqC/UY78ca57UrKfLtnz48jn96X4EHwANiP37ajv0XDQQKjF9F/tLEaj/Byd3teoRSlQkOA
	LrZ3T3vI+X6pvrcaKBhMn2G6uYtT7JTK4CopfqmA7VHdFrWicK/tcvaNIYYE+/d47npt/Tmll+N
	FdQKiOTOh5hhtEUEz74EPNP48oQN2yEjJbadNxlW+ppa+QXs1bE3eRS6b2byF3Zo9SkKT4p7vmy
	t6kzp5JDdcYJApiiifO3dyH3untg==
X-Google-Smtp-Source: AGHT+IG61xEJzr+7WCklsw6Af+o15xjLuYcZXoCeGXfTG/BNdY1gFNKr9slTqJDe4zTIuLwQhJYB1w==
X-Received: by 2002:a05:6000:2891:b0:403:8633:b7e3 with SMTP id ffacd0b85a97d-4266e7d461emr14801857f8f.30.1760355481470;
        Mon, 13 Oct 2025 04:38:01 -0700 (PDT)
Message-ID: <ac7ccf2d-163c-447f-9c2a-951b33c0b139@suse.com>
Date: Mon, 13 Oct 2025 13:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: fix xen.efi boot crash from some bootloaders
From: Jan Beulich <jbeulich@suse.com>
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech>
 <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
 <4936cb0d-0898-4171-b8e1-ed3a57bcfc0a@vates.tech>
 <9b7b70e5-9b1b-446e-9dcc-310f1c1f4b47@suse.com>
Content-Language: en-US
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
In-Reply-To: <9b7b70e5-9b1b-446e-9dcc-310f1c1f4b47@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 16:29, Jan Beulich wrote:
> On 25.08.2025 16:17, Yann Sionneau wrote:
>> On 8/4/25 11:34, Jan Beulich wrote:
>>> On 24.07.2025 16:07, Yann Sionneau wrote:
>>>> xen.efi PE does not boot when loaded from shim or some patched
>>>> downstream grub2.
>>>>
>>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>>> flag of the .reloc section meaning it would not load its content
>>>> into memory.
>>>>
>>>> But Xen is parsing the .reloc section content twice at boot:
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>>
>>>> Therefore it would crash with the following message:
>>>> "Unsupported relocation type" as reported there:
>>>>
>>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>>
>>>> This commit adds a small C host tool named keeprelocs
>>>> that is called after xen.efi is produced by the build system
>>>> in order to remove this bit from its .reloc section header.
>>>>
>>>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>>>
>>> So I found a way to deal with this at the linker side, without any new command
>>> line options. Behavior is solely driven by the attributes of any incoming .reloc
>>> sections (of which there would be none by default, retaining original behavior).
>>> The important patch is [1], but at least the first patch of the series [2] would
>>> in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
>>> for the main patch). Need for other of the prereqs there depends on the scope
>>> and purpose of one's binutils build(s).
>>>
>>> [1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
>>> [2] https://sourceware.org/pipermail/binutils/2025-August/143141.html
>>
>> That sounds great!
>> It's clearly better to fix the issue by changing/improving binutils.
>> Let's drop my patch in Xen if this gets accepted in binutils!
> 
> Luckily I'm in a position where I don't need "acceptance", but merely
> "absence of objections". The sole reason for the present delay is with
> a colliding MIPS patch, which I'd rather see go in first.
> 
>> It would be nice if you could keep us posted in xen-devel of the 
>> status/progress of the binutils patches.
> 
> I'll try to remember.

Here you go - the series went in late last week.

Jan

