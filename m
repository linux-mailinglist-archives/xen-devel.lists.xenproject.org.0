Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E214399039C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810404.1223103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi4A-0000VL-0e; Fri, 04 Oct 2024 13:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810404.1223103; Fri, 04 Oct 2024 13:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi49-0000Ss-UH; Fri, 04 Oct 2024 13:09:53 +0000
Received: by outflank-mailman (input) for mailman id 810404;
 Fri, 04 Oct 2024 13:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiC3=RA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swi48-0000SW-GO
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:09:52 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f090679e-8251-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 15:09:51 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso31338321fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:09:51 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b4bcfsm223869566b.138.2024.10.04.06.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 06:09:50 -0700 (PDT)
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
X-Inumbo-ID: f090679e-8251-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728047391; x=1728652191; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnxb7QU9O8EisVsWM7vO+5waVFhI0EzzuPLHSXN758c=;
        b=Boz/+3a1+wAREGgpNpRo2/8jxeBM4CD1bQC9DeMWqhN+A6hHmziJUAsVGFmoBWCqdD
         tWeBfE8J+8XMPjKyxC2rUlEswt/1QBrsFXBMMRA2GhaFU5/SDFRuTtAnNJIKdlBmvpk/
         3FVutbX1JxKR8FEvgvpDjWY7wOmJdHU6r52Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047391; x=1728652191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnxb7QU9O8EisVsWM7vO+5waVFhI0EzzuPLHSXN758c=;
        b=YgI3n1SkfloTf8zXwP6ai0eSqaXNhoe5la/0aP/Sk9fb3WZJoZ0YZULpbM9Fwt46XY
         bRJyL1ftFyzsc70z3cSFiNwAQRr8n5mBUyks1QvP44EdRs2GFyHWbPecFpr3Ft8yEW/u
         JW89/gZ0ijCKCnt70FOewRko28cT+q95wYsni9otJaRMrh7MtMRdoS3WW3hHcVaqcYTP
         gtGuUfPf6b3DmINaSRlUDa6ZZODFDBQ/B3cXbb0P3NN8hgo+GI6R0DtxTKB9MtmGQYY6
         yPKdI7q6lfTb/J3V7OeIyouRX7CAR6WAcCBl7f4ylnCImmYfuYDaykdwEpfl0n24abXk
         ch+Q==
X-Gm-Message-State: AOJu0YxwlSH5OkvqBzPmKfbxfIHJcFpPsgbxhg1HhnthfqOaCW44229e
	2hlcrkG0ZqHQxAJjjo6YMbgHdDcZOp7ddHE8ePnMd6jQvG2rDwOhP0xGOsxwmZw=
X-Google-Smtp-Source: AGHT+IFA8t5HKKDq6LjtdGzdF4mUa67DBjJch281hDq2KGNu7GI9Y2AArBbUrZlkI6mA4ORnzBmDIQ==
X-Received: by 2002:a05:651c:a0b:b0:2fa:e52f:4476 with SMTP id 38308e7fff4ca-2faf3d897b9mr18422001fa.45.1728047390454;
        Fri, 04 Oct 2024 06:09:50 -0700 (PDT)
Date: Fri, 4 Oct 2024 15:09:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v1 1/3] x86/hvm: introduce config option for ACPI PM
 timer
Message-ID: <Zv_pHR8gUrcHQU5I@macbook.local>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com>

On Fri, Oct 04, 2024 at 12:31:50PM +0300, Sergiy Kibrik wrote:
> Introduce config option X86_PMTIMER so that pmtimer emulation driver can later
> be made configurable and be disabled on systems that don't need it.
> 
> As a first step the option is hidden from user, thus not making any functional
> changes here.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/arch/x86/Kconfig               |  3 +++
>  xen/arch/x86/hvm/Makefile          |  2 +-
>  xen/arch/x86/include/asm/acpi.h    |  5 +++++
>  xen/arch/x86/include/asm/domain.h  |  3 ++-
>  xen/arch/x86/include/asm/hvm/vpt.h | 10 ++++++++++
>  5 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721a..95275dc17e 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -144,6 +144,9 @@ config INTEL_VMX
>  	  If your system includes a processor with Intel VT-x support, say Y.
>  	  If in doubt, say Y.
>  
> +config X86_PMTIMER
> +	def_bool HVM

The chunk in patch 3 that fill this option needs to be moved here,
together with the updated checks in emulation_flags_ok().

>  config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 4c1fa5c6c2..321241f0bf 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -18,7 +18,7 @@ obj-y += irq.o
>  obj-y += monitor.o
>  obj-y += mtrr.o
>  obj-y += nestedhvm.o
> -obj-y += pmtimer.o
> +obj-$(CONFIG_X86_PMTIMER) += pmtimer.o

I think you can also make the hvm_hw_acpi field in struct hvm_domain
presence dependent on CONFIG_X86_PMTIMER being enabled.

>  obj-y += quirks.o
>  obj-y += rtc.o
>  obj-y += save.o
> diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
> index 217819dd61..8d92014ae9 100644
> --- a/xen/arch/x86/include/asm/acpi.h
> +++ b/xen/arch/x86/include/asm/acpi.h
> @@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
>  /* Incremented whenever we transition through S3. Value is 1 during boot. */
>  extern uint32_t system_reset_counter;
>  
> +#ifdef CONFIG_X86_PMTIMER
>  void hvm_acpi_power_button(struct domain *d);
>  void hvm_acpi_sleep_button(struct domain *d);
> +#else
> +static inline void hvm_acpi_power_button(struct domain *d) {}
> +static inline void hvm_acpi_sleep_button(struct domain *d) {}
> +#endif

It would be best if those functions returned -ENODEV when the
interface is not available, but that's an existing issue, so won't
insist in you fixing it here.

>  /* suspend/resume */
>  void save_rest_processor_state(void);
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index bdcdb8de09..3f65bfd190 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -496,7 +496,8 @@ struct arch_domain
>  
>  #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
>  #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
> +#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
> +                            !!((d)->arch.emulation_flags & X86_EMU_PM))

Do you really need the IS_ENABLED() here?  If you modify
emulation_flags_ok() to reject the flag if not available it won't be
possible for any domain to have it set.

Thanks, Roger.

