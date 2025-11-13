Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E726C5612E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 08:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160683.1488743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRsY-0008B0-Mw; Thu, 13 Nov 2025 07:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160683.1488743; Thu, 13 Nov 2025 07:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRsY-00088p-Je; Thu, 13 Nov 2025 07:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1160683;
 Thu, 13 Nov 2025 07:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJRsW-00088j-VO
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 07:36:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7464bfa9-c063-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 08:36:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b735487129fso43360366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 23:36:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a6dsm105689366b.47.2025.11.12.23.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 23:36:23 -0800 (PST)
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
X-Inumbo-ID: 7464bfa9-c063-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763019383; x=1763624183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l4lYzfBwuVBBaYXQk2HXq2XAaL01PNUOBEPgjYVMHQo=;
        b=brtGbDy+5SY9+tU3587djE/xJAAzU0SnwsQGnkUxjO+75gSl3blPyOk5Sb/0TO58/i
         N4szH+1hP/PA8WnwhkiEL2PbN3EQNrkuKhZNxuQ/isq9yltCj5DGUco8cuP4saLslIuM
         T9lkEnVmWV+zSZQ4RpTKIHlpAtusauty5KHUnIwELjM0A6fB6BhvQvxQySYYE1vbMZ3T
         ZzTr4Ff9K5OF+3XCdN2vHiUZtvAjaHh0Ru4GjNnx8TeuPV7EB2Eki1H5iKQkh5wy+ywN
         vnI6YT1zwRjaIzI5Fq7v9tJmTheIO7Tt77nCS4X0GiQjwOJqIoKsNls0E9j+3ijxckil
         gmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763019383; x=1763624183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4lYzfBwuVBBaYXQk2HXq2XAaL01PNUOBEPgjYVMHQo=;
        b=KAlJlzHfYP797epLII70ZtfJZQElbBDZZ+a0dLcuy09OvVI1uDW0Qh1JxtLtq5YexN
         uiR5Fz9J/pL2ZzJyjVmkqCiWyFSPilVer4JoMgtXFxS0gb599+BbNBRJI9FHQQ5KK32P
         d9DI40nRmXlevP+19L9sPISByhI+HMcztMYQNqr+woJuialXgtXWWJO0oGa4DoqD0eHQ
         yh8XM3cQEMqQleZSHyz1S/bXX6MrhcoInJ1PCeaIO425ByGODeIwPZbQjQa2fEzCiBXR
         OkDhl6cqg0zj4PQOHc8bEKdQVfO6zi+Aq5zQOpqLSjyPkz5mVU09QDZOF+L4NbLuzD1B
         +ZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkgeanIFdQ+XtvR9q0p/hKsWZC0RkzQuwzieSekpSueuVYyinXGqTClPCbyaEts2ENDV31FiCnh0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSnTnKAIDn8QNFnynP8Vq6vLzlOXYrJVWXJoBZk6e+D4KUbqVT
	jaR2bfNwLdKZCiFovaV+l9CehJJELyh8nB5FcbgQmnbwxFOShTLvE9ab6nl02QmJhA==
X-Gm-Gg: ASbGnctEo1SgNm91esqqkYhP+waYJo2K53kezar1rXw+P8liGE+MIRrDWMVvmCe8NZT
	OPfFQxkHbMUC59bDohJjwQ+zfiL+4sqAySx5ixi3grTxwvmbe2TNayZpvOuyiHrZ1PMz0s3gkoO
	gsmOVFMU5ZNYejhJN1YPtBBY6YyzVHskFuVV4L02bq30OU8nesxsXDDVwZwd9VftzV/zMsr2L/2
	Kh6fXS9Jio8F3C6nF7fvN9MME4Daq8feVpUKPTVsKY9QUO6N6EMwAwK/61ptX89WCT+Vy7t8b2f
	stzuxNTJQzC92sKX8YqvAktwm8FqE6oVVEuC3YiRPIOfS9ke7ny/lE95s7WL2H8da+QRE3yWEOJ
	JSeDiHRpcehHSNRZtimDDVtiBfFwcANKBxyRP4MALZ6fgj6hh7D0JraF4L+hKFlOyhc8S7Wj7bn
	u8IMZsJSUsRjYaoD9IRhwpHCPChh1+djDEroZgmUyKV3Ph4yq91UDhiQQ3i+fh+vbQhEPbkqA3l
	Zs=
X-Google-Smtp-Source: AGHT+IEtyS2aG1IhYt6x/h8xdG1/XyYuD2UNH7t73WWHSh6NcJ3y17nQVOQ5CzBMd7Lxyw4ldER64w==
X-Received: by 2002:a17:906:6a16:b0:b73:246d:cf1c with SMTP id a640c23a62f3a-b7331af0e07mr624322466b.63.1763019383365;
        Wed, 12 Nov 2025 23:36:23 -0800 (PST)
Message-ID: <248593ca-e24a-4518-800e-2c58e3197937@suse.com>
Date: Thu, 13 Nov 2025 08:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 17:22, Alejandro Vallejo wrote:
> Hi,
> 
> The series is mostly a refactor between everything needed to load microcode and
> the bare minimum to probe the current microcode revision.
> 
> The Kconfig option keeps the reading of microcode rev data around, as it's very
> relevant for security and debuggability in order to deduce which erratas apply
> to the current platform.
> 
> The idea is to move everything that must still be compiled with !CONFIG_UCODE
> onto {,amd-,intel-}base.c, then remove everything else conditionally at the
> Makefile level.
> 
> Renaming files (e.g: s/base/core/ and s/core/common/) would better reflect
> post-series reality, but it'd be annoying for later backports in this general
> area.
> 
> Cheers,
> Alejandro
> 
> Alejandro Vallejo (4):
>   x86: Split out AMD-specific code to be executed without ucode loading
>   x86: Split out Intel-specific code to be executed without ucode
>     loading
>   x86: Split out early_microcode_load() and microcode_load_one()
>   x86: Add Kconfig option to disable microcode loading
> 
>  xen/arch/x86/Kconfig                    | 12 ++++
>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>  xen/arch/x86/platform_hypercall.c       |  2 +
>  13 files changed, 259 insertions(+), 158 deletions(-)
>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h

Purely based on this diffstat: A doc update likely is necessary as well, as
the ucode= command line option now becomes only conditionally applicable (aiui,
i.e. without having looked at the patches them selves).

Jan

