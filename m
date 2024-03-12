Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9051878F86
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 09:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691697.1077935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxJ3-0001tn-99; Tue, 12 Mar 2024 08:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691697.1077935; Tue, 12 Mar 2024 08:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxJ3-0001rm-6X; Tue, 12 Mar 2024 08:16:17 +0000
Received: by outflank-mailman (input) for mailman id 691697;
 Tue, 12 Mar 2024 08:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjxJ1-0001rg-Qs
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 08:16:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb337277-e048-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 09:16:14 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso675124366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 01:16:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bx4-20020a170906a1c400b00a4528658771sm3583024ejb.31.2024.03.12.01.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:16:14 -0700 (PDT)
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
X-Inumbo-ID: cb337277-e048-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710231374; x=1710836174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHUPVSZdHdGTzLpbsHNy6U5mXwZPXvdL9s1XdjkN5jQ=;
        b=HmQFMSixKpyQIxVG2IWL2v4gHISIjgXfV4/jrrQ5q8CZHeuPOHUA/7MqXSKStfc3Vq
         OKYxBw4Dl3dAQpf3uqfDE1kqew+SjWOXo6WuGC6Yttbr0sYiRCkz9gushd/Ae3CLtwp4
         ipaiUMbF34BdeoIHBuRCrjoLUn6rfg+tw2b61k6gXL6v3btiQ7emMCCTtp3SUkXze8Re
         mQXNrv0bv7ARjjK5inmp+Yt5OxUsBo7y/5LoYX4j+hGsF0GcTU714w0lKjzgvkHzX4oj
         uI7H7W4gDESIr0Jrlq17kQZW85CCP17dKXUIGPtnSE1XN++3NhAE5Eh6+ilG4frFbFGU
         O2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710231374; x=1710836174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHUPVSZdHdGTzLpbsHNy6U5mXwZPXvdL9s1XdjkN5jQ=;
        b=g+vlmkSKKKXcLuxG7lcyc0PE7z6C/KWOsUkE3DCUR0NEgaYRysaM0r430Byl5w4X6J
         Pkedp4NhjaNxKRS/D4iuA/6IrxbiYXRITfWuIJNEG3ScjYqT5n1aNNThG97dnR1bX3hM
         ZoRy9pzyQuGH5dcq/B29/THFSo4GxEjuVLGhuiVK0ZndSCYsUjUwnpJoZhpokMYwsniz
         dVLLV6UN2MfCcy7myVvM6WwXjPWxq9i466QADwo64Vjvp7MNY2q87XjG0MU5ZiMxxDN6
         kx5ZkIXaHlALbc4D7hGj6kBriN9sST4G2ZrDHuuYiSZcBTOV2AT9riJOUkEPY3kAVez/
         tBsA==
X-Forwarded-Encrypted: i=1; AJvYcCXqx9vtGibbPDi20Nluh+/JSr8JKL5Fjs4lEFXXkR/eYpNFU3qZqJ1WgcmYGUddaTLwlZLTp3/twemTBGwhSSlyy452WtzXOTwjzs3mnRc=
X-Gm-Message-State: AOJu0YzqIcZk1WgSSOywwJhRoVk5nhVIdO5vMLKAccp7tHRe2E656dUm
	uVE5esSGQwZVUep930waErvS2te3fRs4BCQ6U/Ze3uDab31SvBj/AdkcSRqtsw==
X-Google-Smtp-Source: AGHT+IGs2MwUWq/GrdGiPqTwMy1+KOrNXuO+h8cw5hh9U+3JGieWPWXQlNtK80EZyxxw2dyA3ewx+A==
X-Received: by 2002:a17:907:cb87:b0:a46:2692:a026 with SMTP id un7-20020a170907cb8700b00a462692a026mr3257769ejc.34.1710231374285;
        Tue, 12 Mar 2024 01:16:14 -0700 (PDT)
Message-ID: <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
Date: Tue, 12 Mar 2024 09:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
>  	$(call filechk,asm-macros.h)
>  
> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)

This wants to use :=, I think - there's no reason to invoke the shell ...

>  define filechk_asm-macros.h
> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>      echo '#if 0'; \
>      echo '.if 0'; \
>      echo '#endif'; \
> -    echo '#ifndef __ASM_MACROS_H__'; \
> -    echo '#define __ASM_MACROS_H__'; \
>      echo 'asm ( ".include \"$@\"" );'; \
> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>      echo '#if 0'; \
>      echo '.endif'; \
>      cat $<; \
> -    echo '#endif'
> +    echo '#endif'; \
> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>  endef

... three times while expanding this macro. Alternatively (to avoid
an unnecessary shell invocation when this macro is never expanded at
all) a shell variable inside the "define" above would want introducing.
Whether this 2nd approach is better depends on whether we anticipate
further uses of ARCHDIR.

> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -1,3 +1,6 @@
> +#ifndef XEN_ARCH_X86_CPU_CPU_H
> +#define XEN_ARCH_X86_CPU_CPU_H
> +
>  /* attempt to consolidate cpu attributes */
>  struct cpu_dev {
>  	void		(*c_early_init)(struct cpuinfo_x86 *c);
> @@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
>  void amd_init_ssbd(const struct cpuinfo_x86 *c);
>  void amd_init_spectral_chicken(void);
>  void detect_zen2_null_seg_behaviour(void);
> +
> +#endif /* XEN_ARCH_X86_CPU_CPU_H */

Leaving aside the earlier voiced request to get rid of the XEN_ prefixes
here, ...

> --- a/xen/arch/x86/x86_64/mmconfig.h
> +++ b/xen/arch/x86/x86_64/mmconfig.h
> @@ -5,6 +5,9 @@
>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>   */
>  
> +#ifndef XEN_ARCH_X86_X86_64_MMCONFIG_H
> +#define XEN_ARCH_X86_X86_64_MMCONFIG_H
> +
>  #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
>  #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
>  
> @@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
>  int pci_mmcfg_arch_init(void);
>  int pci_mmcfg_arch_enable(unsigned int idx);
>  void pci_mmcfg_arch_disable(unsigned int idx);
> +
> +#endif /* XEN_ARCH_X86_X86_64_MMCONFIG_H */

... in a case like this and maybe even ...

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -6,6 +6,9 @@
>   * Copyright (c) 2005-2007 XenSource Inc.
>   */
>  
> +#ifndef XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
> +#define XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
> +
>  #ifdef __XEN__
>  
>  # include <xen/bug.h>
> @@ -836,3 +839,5 @@ static inline int read_ulong(enum x86_segment seg,
>      *val = 0;
>      return ops->read(seg, offset, val, bytes, ctxt);
>  }
> +
> +#endif /* XEN_ARCH_X86_X86_EMULATE_PRIVATE_H */

... this I wonder whether they are too strictly sticking to the base
scheme (or whether the base scheme itself isn't flexible enough): I'm
not overly happy with the "_X86_X86_" in there. Especially in the
former case, where it's the sub-arch path, like for arm/arm<NN> I'd
like to see that folded to just "_X86_64_" here as well.

Jan

