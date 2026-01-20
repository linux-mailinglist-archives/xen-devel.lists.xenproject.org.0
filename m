Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9FD3C4FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208613.1520761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8qo-0003pj-Vg; Tue, 20 Jan 2026 10:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208613.1520761; Tue, 20 Jan 2026 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8qo-0003mc-S7; Tue, 20 Jan 2026 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 1208613;
 Tue, 20 Jan 2026 10:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi8qn-0003mW-Qk
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:20:41 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaea433b-f5e9-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 11:20:39 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so224012f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 02:20:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cecasm26637728f8f.26.2026.01.20.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 02:20:38 -0800 (PST)
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
X-Inumbo-ID: aaea433b-f5e9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768904439; x=1769509239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AN6keBRBFgFoSLwk493Km5NqSYoTijt1jG98JbtbNLY=;
        b=fzKpyJWGLVKBx3oH2bFCmMr2cIBIojApUc2U9JFjgvmv3iBdMERx1dJ8AiTWOqXV52
         HiaEXeR1vZbf3xr/ISt/vx1Op1MOPAvc3aJvvvq7Wdu/P1UY57PR1Qec3WHfYmSIgJIW
         FhrEPorlXEMDuuHfnx1p8NqiMAze0rXogoQyKb4pQM9cIkudxkDF4YC/ctT/BWJhGeB0
         l+lXNHllw+13V2JnsOryiQExYew7IZk3Y1j+oXyDFVOqHikxT1CvQrwt+DnGCbmm6jEJ
         9ptt92OiWf1eJVIvuNDFGeIcE8pZwskeCkReZDnXZU0Q+mIwvn52hvVWju3WoE2zM8WR
         lwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904439; x=1769509239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN6keBRBFgFoSLwk493Km5NqSYoTijt1jG98JbtbNLY=;
        b=aLP2NUKgHSIOwmAKbF8OcuauTLJdPa/rlU0pUIzXirS/BOQzCj5/0nBfwTbmVgWGtu
         o8xCZ0/48MptJSnNUXxNGlCpjB/6S+bQsSKSQ2/EAmNwxVwh4fn8y22G4fd8h6iiFmvK
         swAOx6+osr4LDMVv6uI18ZXl11zAsLboRi09ZLgyPIv5rcC+lDfgpw+sGjkgcMdsGR8l
         a9EzcYAmnRCAdSTOc15h8ZFc7PnHSaKnYUJmU86S39niTA/2dhik86+8X77QiDh6ZOhZ
         ICfASnfqzN2oOZE7CA6lAbZzENPuzwjhV5AZnyzHs2/p65qlHTcK/c+sROBJP0DBF6LX
         oQGw==
X-Forwarded-Encrypted: i=1; AJvYcCVkmCOzcmJJdDKRvgSHS2OtyVVqlzAW8QKCaD10VtFdudAvFIQkif/K4N/GVB5Iqz3HCkBzeUGorI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqh6cY+hKW42Gc/XCk+aRh2c3UKPSwu9e3vJjX9StTstWbOIdc
	o4H98l2B5hOYriBxtH5TmvD4m34khZ03zdkGFyOi8GDCKCUbLKjGEfarDcqZbEXytw==
X-Gm-Gg: AZuq6aJKS6JNhUl+cuIVKttQpJNjotT1vzUD8wYPD50H7ghCe34dbse98AVjKVmi/xp
	I3wRgWEn5St27kkGGAurljqZq8isCLBalUr2I+kEAHmBp8t0HGvanPH7GSchA4Rjjh92BCudM8w
	kzrbZJOLlEidQGGSm6u8M0j6VHb3wgCrJiDedOziQLemqnSAc3ybdMuT/VozYZbPEdFBZUd59hQ
	zTKZ0NcrhqZxSz7gU8TYOHaYIJNOcFfj/q4bdqCtXgHMDKQJdwX2AgMuDg7aWHywBHsMWxCT3Mp
	g8HLtwoQME4wQWVEkA7tNW9KWvLRolrqBpxZhTWqB7WDae31uOvyaVlCTYzacCKFM2iPUeI8Feh
	TiJjiZ0Tydi2IT+ILMvv2kxhT/stokVjh86Vh1fSoJH0WYKOvoZFNGgN//rLU2KsUj54hi/DpmK
	mYbY4id5RZc53/gE8GZBFeOiAtjFtnxMad7wRiz66iMdC/viqa4q8bvhvid/4CGvHO73aJq6GeS
	qQ=
X-Received: by 2002:a05:6000:25c7:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-435699941abmr19821551f8f.15.1768904438820;
        Tue, 20 Jan 2026 02:20:38 -0800 (PST)
Message-ID: <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
Date: Tue, 20 Jan 2026 11:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Kconfig option to remove microcode loading
 support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 10:38, Alejandro Vallejo wrote:
> The only dependency here is patch 2 going in before patch 3. Everything else
> can be freely rearranged.

Is this correct? Didn't you say (confirming what I observed elsewhere a little
while back) that there's a complaint when a file listed in the exclusions doesn't
exist anymore (which may have been cppcheck, not Eclair, but still breaking CI)?
IOW can patch 4 really be separate from patch 3? Or, if its description was to
be trusted, wouldn't it need to go ahead of what is now patch 3?

> Cheers,
> Alejandro
> 
> Alejandro Vallejo (5):
>   x86/ucode: Add Kconfig option to remove microcode loading
>   xen: Allow lib-y targets to also be .init.o
>   earlycpio: lib-ify earlycpio.c
>   docs/misra: Remove earlycpio.c from the Eclair exclusion list.
>   automation: Disable ucode loading on AMD's analysis run
> 
>  automation/gitlab-ci/analyze.yaml      |  1 +
>  docs/admin-guide/microcode-loading.rst |  2 ++
>  docs/misc/efi.pandoc                   |  2 ++
>  docs/misc/xen-command-line.pandoc      |  7 ++++---
>  docs/misra/exclude-list.json           |  4 ----
>  xen/Rules.mk                           | 10 +++++-----
>  xen/arch/x86/Kconfig                   | 14 ++++++++++++++
>  xen/arch/x86/cpu/microcode/amd.c       | 16 +++++++++-------
>  xen/arch/x86/cpu/microcode/core.c      | 15 ++++++++++++---
>  xen/arch/x86/cpu/microcode/intel.c     | 11 +++++++----
>  xen/arch/x86/cpu/microcode/private.h   |  3 +++
>  xen/arch/x86/efi/efi-boot.h            |  3 ++-
>  xen/arch/x86/platform_hypercall.c      | 10 ++++++++--
>  xen/common/Makefile                    |  2 +-
>  xen/lib/Makefile                       |  1 +
>  xen/{common => lib}/earlycpio.c        |  0
>  16 files changed, 71 insertions(+), 30 deletions(-)
>  rename xen/{common => lib}/earlycpio.c (100%)
> 
> 
> base-commit: 7b3e1b4e848d34c9a5b6634009959a7b9dd42104


