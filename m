Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D0B149F8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062156.1427781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfXb-0003cE-Hy; Tue, 29 Jul 2025 08:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062156.1427781; Tue, 29 Jul 2025 08:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfXb-0003ZJ-F3; Tue, 29 Jul 2025 08:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1062156;
 Tue, 29 Jul 2025 08:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfXa-0003ZD-Ln
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:18:30 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b98090b-6c54-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:18:29 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so1422683f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:18:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe545087sm71309725ad.178.2025.07.29.01.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:18:28 -0700 (PDT)
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
X-Inumbo-ID: 9b98090b-6c54-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753777109; x=1754381909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LLTcmsdRXoVW2iI417GxJP4BtDa+v+FyZNsWcgks14k=;
        b=R6xLC27ZpXEvgeku9eh4LdKtgQaWZU7gbjqUiBkd4ILPv8UALv/DjPtv+5oEAUdtbh
         o+G6cP6vyGyj+IrkH8P7oaxsLCO6l8muqSdmhp7PU/fZjF/V5UiRQMwjEXIA3YlXq6v7
         4/VyzxmvO8RClx6dEUXuA3NfhIgjVKFOwIfguGLpr7e2ilnbBh5pai27KzKusDtv2cYa
         z00SBekzLCFDubsF9gVjdfiskoSvczOVEXnOy9ox/8irWFne9KLGs9n2BOFxOSBdx9tx
         PWF7q/kUrD17FB4uC+6KkXT/NbVV33ldXzpkGO0x2WYfhKS0ZZIh5JYiPNWIhtUG3vcP
         c1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777109; x=1754381909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLTcmsdRXoVW2iI417GxJP4BtDa+v+FyZNsWcgks14k=;
        b=qDflHFZC1ERk5Gh3vs6D3eQp216kb4d58WNGrWJqR9s79Nkl1eCrSXqR7VcsAbqmNW
         6zvWPvwcUh3WnPza2+XuGe6W2I1LwWEBgbR+jTtc5u38VqyxwIfr58OKCVmaNSSQ5EJg
         jSURw/5r2nmIPohegjTP2Po/cK6eseysfU9h6Wy2SidV+MYsRyecrTVEVBs4m9CwoVc7
         7NzEAtMtyyDPUJeEJQU1RpY6lQA7N5cYcvRgeC/NWUi/Eihh8QOlNKQVrk4VSd0A3PNA
         Kz/y81wrAR6ZruF2zvt5qXkc4my/dUhhPLsSJZakYXYwAKd3hcQt+5FNzVpdETTA2zIa
         M+2g==
X-Forwarded-Encrypted: i=1; AJvYcCWr7lxcIASk8v7firW1zvOI3WofOtfFCYohr/tDOeaQY0VQJmr0jQ79J3EXnuMT8+6XF/70RlHcrDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/JiWzfJWe0rdD++KhHFMQEhivs3cLy7oyAf40LG1F1qg4qSOp
	Yp8MSYndpb40z/JdLhhl4jHjIDWWQ044Mkaf1ZXtD2fIOLmSRQnyMhwY1kvj4uSl8Q==
X-Gm-Gg: ASbGncs3FIpmm+TZ7VKChdoZw4pF1VaU6kx6ZhP4n9sMSAoW0E4kisa3lKNRg99fSh4
	KOGcCNjLS4V028C1f432xVUEd1vTLQJk4Qzr8zZpPKCtcVT8+ftqhhopQPK7v2AvR6Ooy78Kn1S
	ONepKlB/YZ8Rke8yZy0i9YwL6v0WFyHMaRZ+5fQF+zn9s89bNWlnXGRkbnh0uA733gb0yoVU+au
	DPjrZGmtbnnE+DX+ze7KOjb7Hv7EXDs586A+iOZDBJPrUFQT/+g614uqXVeMYgHRaO3Q3cXbHDj
	BqccY9KD5ccGx9Eky3mi4gyFFbKxVbvAIxGhC8Sk/AsEs3Pgzwu6ZXdOD7ZcTLHMoMNPP1rGD1L
	a6tJCftQn64RrJudkhbnQVh2MOEmVoYOGGlfCwvLF8jSDLoGxZP9hxeb1Sr4gVPQjvldxoWoPu4
	bbofFcjfk=
X-Google-Smtp-Source: AGHT+IFOZeQ/TB8PKmH7RT8b03i/50ulHu2i89bhST+mTZWtavUlcaqV4ZXmNR5DJoxI7Y9eVnVvlQ==
X-Received: by 2002:a05:6000:2508:b0:3b7:8410:22b6 with SMTP id ffacd0b85a97d-3b78410258dmr5142298f8f.6.1753777108746;
        Tue, 29 Jul 2025 01:18:28 -0700 (PDT)
Message-ID: <e9c02a0a-6be7-4e19-9301-fb824d76b6c5@suse.com>
Date: Tue, 29 Jul 2025 10:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 19:07, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> ---
> 
> Changes in v2:
> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
> suggested in ML) because in this case HAS_DOM0LESS should be renamed
> either.
> - fix order of HAS_DOM0 config parameter
> - add HAS_DOM0 option to x86 architecture.

I question the way changes were made. I don't see the value of ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -18,6 +18,7 @@ config X86
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
>  	select HAS_DIT
> +	select HAS_DOM0
>  	select HAS_EHCI
>  	select HAS_EX_TABLE
>  	select HAS_FAST_MULTIPLY

... this, as it has no effect ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -21,6 +21,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS

... here due to the further dependencies, and ..,

> +	default y

... hence this option still doesn't end up constant-Y for x86.

Jan

