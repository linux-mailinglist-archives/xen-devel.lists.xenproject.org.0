Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952EEC3A45C
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156737.1485744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxI1-0007LY-Lv; Thu, 06 Nov 2025 10:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156737.1485744; Thu, 06 Nov 2025 10:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxI1-0007JD-IT; Thu, 06 Nov 2025 10:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1156737;
 Thu, 06 Nov 2025 10:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGxI0-0007J7-N1
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:32:24 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13e2558-bafb-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 11:32:22 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so130143666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 02:32:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f857839sm1566156a12.21.2025.11.06.02.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:32:21 -0800 (PST)
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
X-Inumbo-ID: e13e2558-bafb-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762425142; x=1763029942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dIvyeFrIArmJr1GH8+pAp9ORSEHiuvoXT7PzKji6mN0=;
        b=c+a8Aqg+aKuHJDDiMPlwCdgdazCCAyBTQ9VcAA840anOPp6FP3LJbNRsaPAWLxcvQ8
         p/QxgJXyTzfqfKaPaieWEuNJq/kTbIDfygV72JTqNWbDFqL6+TfkxjyTVyVEmWiRdIki
         M9RG9swfoSVgVY2V1dhhSHcuSlYwPBRowT2IYssRXD+dUFBh1Jyi1O5G+h+BmMEMK76s
         ATRZm4ZpK/al2U3AJcsnMTF80P4XN6PTOe0FEa/leufJdLv58qx/52oFCN0ojOSB9aCC
         Fo99CtMd+bG9HD6/cDNLdJZpUrdtumh9gzZSUVZF+tPb1B49tQInOgkSHnZnCSUsVgT1
         h/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425142; x=1763029942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIvyeFrIArmJr1GH8+pAp9ORSEHiuvoXT7PzKji6mN0=;
        b=e4zbMSLgLgTD7Man0UHnJuy6NMMue14KOSWbiorP4W11FHo+OVrvzZEb1eIzxw4S7q
         g78/9U9GbaGVrANg5GOvVQWUC71KUk935KrJcb6x4XqKRsFJmnpoYbh+3f3qI+dGvAzM
         RAok4uRZQi4kKU98HryxNNn8mirzq/kL8S9/u0OhlZyq3ser29gH1QjxQ2mzvAcH9T46
         8WEARDoXiMqM3zzELD4nRSA8mSDJlzkhF3rYrLXoppKv9L2+Mdd2CkLRJych9PuakLs8
         gwKKuUQvKwPV+v2kpVWVAjP62f0BbKqmf3IKHUwanKSevrr0ZYEiZwPggN0rot/5ZdYq
         uMAA==
X-Forwarded-Encrypted: i=1; AJvYcCUBBcFL5F0kpZheXdiYVHhl5zVGHv3/xM39wUYeYSCV8izY/9yihWOUuDGy+2/oMXm+Wkx0UvNGXts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRZYIBClEs7iVt+DZf5IMZXq+PlyRREPCfMMHDyjHEQCkWfaJh
	emZaQrjAjvnwGTVMfUnKIuhZKpKtl5wjgzqEPGwlKetzmGQDZxQ1ScAEDRkmyC4XhA==
X-Gm-Gg: ASbGncueXs7phCvbfIjuCFPhNOxZSAPyqRRCr2WD2bDc7eD05ejECd1J1txaPc1eTAq
	S8qbEwjElfzmI8I4Ft6p5eKGavHp10SB3GlYrxisoV5kbASkHzoEgireRMhuWyZBNSZvRacwgZN
	XHPcg+OHxj+WIAPLJzzXo4nBOa9vDontwQebo+iMbOTpS0SqvT5tlksNWzWhS97CIrchUzIoRoK
	qIBqMC8/b3OMKMWS6xtCjXAhZ0s8wXrMsBmBdajFyUuNc7UzmZI+eCiVkBrExOfAhy99DgDA2PW
	KA7c2dLLcJPhAyVm6uj8p4yExBWKY2JtQKSoQJtLmlnjMNNJ3yUV8oXXd3a/xbQgEZLUhlnjAdq
	vP6kloVWOSZZXv+f0s79jlXfidbwaIJ0890F90BhIJWt9+AJmhFhci6Spv7BkVws8p7wKD7bt2L
	FR5lkSPWEwY9P5GqkvimPP53a+r+xDh67VqWLqbfa6yv0T0pqOk1zrmzgL3YqcGbIke5Uer/sOt
	wQL95qOjA==
X-Google-Smtp-Source: AGHT+IElHNXiazwQHRAe3/ffHxNo6BGZxmA5nIbkC5HDZu1FCAFn3BRacEyqUcXJ63nCZOldeSE4OA==
X-Received: by 2002:a17:907:7f14:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b72655a6bf7mr662150566b.61.1762425142046;
        Thu, 06 Nov 2025 02:32:22 -0800 (PST)
Message-ID: <97611b79-228c-40a6-9fb2-4571b2447258@suse.com>
Date: Thu, 6 Nov 2025 11:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Frediano Ziglio <freddy77@gmail.com>
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20251105153808.20278-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2025 16:38, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
> 
> Changes since v2:
> - do not convert type but retain PE format;
> = use xen-syms.efi for new file name, more consistent with ELF.
> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile |  9 ++++++---
>  4 files changed, 9 insertions(+), 36 deletions(-)
> 
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
>  
>  The binary itself will require a configuration file (names with the `.efi`
>  extension of the binary's name replaced by `.cfg`, and - until an existing
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c5..58ee10ee3e 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>  	  Say Y here if you want to build Xen with debug information. This
>  	  information is needed e.g. for doing crash dump analysis of the
>  	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms and xen.efi.elf
> +	  binaries.

Why xen.efi.elf and not xen-syms.efi?

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -228,14 +228,17 @@ endif
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>  	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -	      $(note_file_option) -o $@
> -	$(NM) -pa --format=sysv $@ \
> +	      $(note_file_option) -o $@.tmp
> +	$(NM) -pa --format=sysv $@.tmp \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
> +        $@.tmp $(TARGET)-syms.efi
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
>  endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +	mv -f $@.tmp $@
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif

I see $@.tmp here, but no sign of xen-syms. Did you submit a stake patch? Am
I missing something?

I also think the mv should sit ahead of the cleaning-up rm.

Jan

Jan

