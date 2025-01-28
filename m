Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6BA20962
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878402.1288579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjYF-0000S2-Co; Tue, 28 Jan 2025 11:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878402.1288579; Tue, 28 Jan 2025 11:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjYF-0000QG-AE; Tue, 28 Jan 2025 11:14:39 +0000
Received: by outflank-mailman (input) for mailman id 878402;
 Tue, 28 Jan 2025 11:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcjYE-0000QA-2B
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:14:38 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6c33fc-dd69-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 12:14:35 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab633d9582aso992149166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:14:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e12d5bsm758746266b.36.2025.01.28.03.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 03:14:34 -0800 (PST)
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
X-Inumbo-ID: 0e6c33fc-dd69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738062875; x=1738667675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NyZNG64s9cXy53YmnMSX23SVcQKgzG6tniYUQRcI02M=;
        b=Hc0i2PKWV5PRhy6frnYwbNnsjcKnN+kmEalnCs/pIewe/SnSic3MGaBmORxEgvA6y8
         pCetBDdAPLBeRsHbXxvUp53ERO1gD3NBPCgx/Fe7kKne3xh31mSGDI0PWpANXiwIbt6N
         M/9noVuYoLlfGDt7DkMwIqwoWTP23/NpReU5CnV+sHt7GImmuYequpTXK2v8fyR5KFOW
         MPRDnWYL+lgwWPTUqRyKfFWIPhQxPVxwHsBWexUPsxcJ2MfQtIOF22jwIIquN8yRNBIU
         uZM84AwXsvASHw4Ou7knYMumFT5HKQCI0o0hhKdP3IuWXTBeBniKpIFzxHluA99U2xiF
         w6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062875; x=1738667675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyZNG64s9cXy53YmnMSX23SVcQKgzG6tniYUQRcI02M=;
        b=sxh18Nli/oN8IQZKNDC0qiguSoLN3LtMi0l5jZitpP3BkM50pNW42/Ft0NyayrQ//7
         Yve5OaxYJxm+VI6jxAaS4vwRfmr+LlV4Y+Dl7xEJtflEVluWwMIRmX+w/sMTkAP2X1Tw
         Ky44kjHAHYn36g6REtEi9kDTfvozlOhEfxWNr3cgU3/vj5z3dncZCMmsiNkIo4ZtXHZ3
         ql7d7tbJHd6sMYSHh33ZBcieecjY9wgTwWOkvSVDSvDNjSpe2Qq4SmY3JVXlx24evWJJ
         Yo86oS1Oo8l/sSTk3HjvzZvbqYgWFZfECWMhyslTEBFmWZuAP1jmU5jJOF4AHQqGFa1d
         t3cw==
X-Forwarded-Encrypted: i=1; AJvYcCWnrdXYxLHE4bwBLlTe4ZR/wUzPd+kS9wBRDPX3N/VABLBCI4RvrpV9V64UiDOWw3CBJpab19CJQkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY5IvO7Krxn+mDk7dUomx6cRdEZ+XF3WrvF+V8c9giWshK0jgv
	YXbAuR2tAZIdgZv/Q93WWiksKJJhACHUpsb82O0RqeowL5ZBpir+8VOcmMR7HPKNPehUk6AWcMI
	=
X-Gm-Gg: ASbGnctvcnZ59H7IsDiwWWMiAP9RsCcFGVfYLZi4j5focezNLxxz8wN3yHkXumtd9x6
	qXJ03cJpZxmrMHrs55lIk6H/PEBnP0Lea2xe4WvW3MCe003x3aGOmVe4uysX6cHPL3FUay4P0Z3
	GQXJkzBFXU3z0z1t39zilurdEsZC7imd7R8NNIfGPrSArC9tuOVQawDzdaxGrjv1S0L+mIqIkWr
	qmV5DKhjNyMtW8CdmKrUdwKfj+RuKD4yzYSNX58z04L0rX2hAPVHyvj6jUzHpVnnts9DpyP6A4C
	c4oLtcoycsBs6SGwAM30NlQ6Ch6+pe76NgtGRbAInMC7/Yw+xh0jrbVCzM7ZnjCIqOvNoua1T8t
	k
X-Google-Smtp-Source: AGHT+IF7GiwWH8LCsOqA6J6cz6/jexPdH7tHuUfevQc3FNqWDrfFHdTiXDpq4/i8HxiuBuRcm0HDBA==
X-Received: by 2002:a17:907:969f:b0:ab2:b863:b7fa with SMTP id a640c23a62f3a-ab38b43b915mr4243596566b.44.1738062875381;
        Tue, 28 Jan 2025 03:14:35 -0800 (PST)
Message-ID: <ef1e6ff9-e5ae-41ef-9ca1-d4fa7f2e74b8@suse.com>
Date: Tue, 28 Jan 2025 12:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] xen/domain: introduce hardware emulation flags
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> @@ -8,7 +9,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> +        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
> +
>          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
>              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
>          break;

You're merely writing the same thing differently here, aren't you? Why
is this needed?

> @@ -159,9 +160,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
>  
>  #if defined (__i386) || defined(__x86_64__)
>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> -        config.arch.emulation_flags = XEN_X86_EMU_ALL &
> -                                      ~(XEN_X86_EMU_VPCI |
> -                                        XEN_X86_EMU_USE_PIRQ);
> +        config.arch.emulation_flags = XEN_X86_EMU_BASELINE;

While less direct here, same question as above.

> --- a/tools/tests/paging-mempool/test-paging-mempool.c
> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
> @@ -9,6 +9,7 @@
>  #include <xenforeignmemory.h>
>  #include <xengnttab.h>
>  #include <xen-tools/common-macros.h>
> +#include <xen/virtdev.h>
>  
>  static unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -8,6 +8,7 @@
>  #include <xenforeignmemory.h>
>  #include <xengnttab.h>
>  #include <xen-tools/common-macros.h>
> +#include <xen/virtdev.h>
>  
>  static unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
> --- a/tools/tests/tsx/test-tsx.c
> +++ b/tools/tests/tsx/test-tsx.c
> @@ -29,6 +29,7 @@
>  #include <xenctrl.h>
>  #include <xenguest.h>
>  #include <xen-tools/common-macros.h>
> +#include <xen/virtdev.h>
>  
>  #include "xg_private.h"
>  

Throughout these in particular - it's not really nice to require the extra
#include everywhere now.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -753,9 +753,7 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>               emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
>              return false;
>          if ( !is_hardware_domain(d) &&
> -             /* HVM PIRQ feature is user-selectable. */
> -             (emflags & ~X86_EMU_USE_PIRQ) !=
> -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> +             xen_emflags_allowable(emflags) != XEN_X86_EMU_BASELINE &&

What is or is not allowable doesn't depend on just the flags. Either the
name needs to be more specific, or the domain needs passing in.

> @@ -456,7 +457,7 @@ struct arch_domain
>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>      bool msr_relaxed;
>  
> -    /* Emulated devices enabled bitmap. */
> +    /* Hardware emulation flags. */
>      uint32_t emulation_flags;
>  } __cacheline_aligned;

The original comment isn't good enough because of what?

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -15,6 +15,7 @@ headers-y := \
>      compat/sched.h \
>      compat/vcpu.h \
>      compat/version.h \
> +    compat/virtdev.h \
>      compat/xen.h \
>      compat/xlat.h

This shouldn't be needed, as ...

> --- /dev/null
> +++ b/xen/include/public/virtdev.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__PUBLIC_VIRTDEV_H
> +#define XEN__PUBLIC_VIRTDEV_H

... this should in no case be generally exposed: You moved the flags
from a tools-only section of arch-x86/xen.h, and hence they should
remain tools-only.

> +/*
> + * Domain hardware emulation flags.
> + */
> +enum {
> +    VIRTDEV_LAPIC      = 1U << 0,
> +    VIRTDEV_HPET       = 1U << 1,
> +    VIRTDEV_PM         = 1U << 2,
> +    VIRTDEV_RTC        = 1U << 3,
> +    VIRTDEV_IOAPIC     = 1U << 4,
> +    VIRTDEV_PIC        = 1U << 5,
> +    VIRTDEV_VGA        = 1U << 6,
> +    VIRTDEV_IOMMU      = 1U << 7,
> +    VIRTDEV_PIT        = 1U << 8,
> +    VIRTDEV_PIRQ       = 1U << 9,
> +    VIRTDEV_PCI        = 1U << 10,
> +};
> +
> +#if defined(__i386__) || defined(__x86_64__)

Why does this conditional live only here? Almost the entire enum above
is x86-specific, too.

Bottom line: I remain yet to be convinced of the need for the new header.

Jan

