Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D37E5BE9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 18:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629371.981553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lws-0001D2-Ag; Wed, 08 Nov 2023 17:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629371.981553; Wed, 08 Nov 2023 17:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lws-0001B6-5W; Wed, 08 Nov 2023 17:02:38 +0000
Received: by outflank-mailman (input) for mailman id 629371;
 Wed, 08 Nov 2023 17:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZA2k=GV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r0lwq-0001B0-Nq
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 17:02:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c55a754-7e58-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 18:02:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so52445805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Nov 2023 09:02:34 -0800 (PST)
Received: from localhost (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b00407460234f9sm20298514wmp.21.2023.11.08.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 09:02:33 -0800 (PST)
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
X-Inumbo-ID: 9c55a754-7e58-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699462953; x=1700067753; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQ2+XV4dBu1cq9f+RwORT9M+/7K1LwjMn+kEqhK7XD4=;
        b=oNfkj4+z5HsmB1Cpqfb5Wy2ydoDBJwEjRCV5nFjhrBs983jiIznQmflk5JzC7DS39/
         +i69wGL1N4BlnD3QhjXyfm6lxULRYAjpAfWwOrPdUNtxnJ2j++f4oidXdhwf6PhTc53T
         iKblId7qd7nk7bnXG+mIXdUn7hCbP/+KZ+DSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462953; x=1700067753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQ2+XV4dBu1cq9f+RwORT9M+/7K1LwjMn+kEqhK7XD4=;
        b=VdXCaC9072mT58whvJjP3MZ0uw3cH/YRN2GRlfZgno8O2jpw6+oyXTvEpM/TDxAAAr
         0PoZthm3lZbKg8sMQgYgZEbBHi6IO7J0cQ7fftuFtrMywownN7s+O1ckjSvDFOQsLhFv
         3x5yWssYLP/jRodRFeFtFFovwBP6DoPlaxgGlHV1vaNqpg3UaZjc1+ks+G+5tfkf8wZc
         O3sil55do1XPsUDFLti+tkOHsvez8AhaYOw999RDsrSCbl34SK7M+Go5F+upi9orEQXE
         SdbC53q/8NwBu7CKMb8JwsWsEqzC0Yjn9KTHFZ5eAVE0M0kLPjQjB5mUVsRCuE4atKGP
         5Ehw==
X-Gm-Message-State: AOJu0YwH08LfgVYDVWDwyNnsLX7qPYgsm2T5FeawPdExTSBcRs6ZA4NY
	/XC5YB0SvjcCIHxyffqHD6QkNg==
X-Google-Smtp-Source: AGHT+IF5jqoBvi3qd1BxebWpXp5A0mscq2ySxXLD1o1w5SUmf63SxVEduVpYLNEyclnDzEn5dh7HMg==
X-Received: by 2002:a05:600c:314d:b0:409:85d:5a6e with SMTP id h13-20020a05600c314d00b00409085d5a6emr2390628wmo.29.1699462953571;
        Wed, 08 Nov 2023 09:02:33 -0800 (PST)
Date: Wed, 8 Nov 2023 17:02:32 +0000
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	michal.wilczynski@intel.com, stable@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] acpi/processor: sanitize _OSC/_PDC capabilities for
 Xen dom0
Message-ID: <ZUu-hAiqCie4wIO1@macbook>
References: <20231101134154.18336-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231101134154.18336-1-jandryuk@gmail.com>

On Wed, Nov 01, 2023 at 09:41:52AM -0400, Jason Andryuk wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> The Processor capability bits notify ACPI of the OS capabilities, and
> so ACPI can adjust the return of other Processor methods taking the OS
> capabilities into account.
> 
> When Linux is running as a Xen dom0, the hypervisor is the entity
> in charge of processor power management, and hence Xen needs to make
> sure the capabilities reported by _OSC/_PDC match the capabilities of
> the driver in Xen.
> 
> Introduce a small helper to sanitize the buffer when running as Xen
> dom0.
> 
> When Xen supports HWP, this serves as the equivalent of commit
> a21211672c9a ("ACPI / processor: Request native thermal interrupt
> handling via _OSC") to avoid SMM crashes.  Xen will set bit
> ACPI_PROC_CAP_COLLAB_PROC_PERF (bit 12) in the capability bits and the
> _OSC/_PDC call will apply it.
> 
> [ jandryuk: Mention Xen HWP's need.  Support _OSC & _PDC ]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v4:
> Use xen_santize_proc_cap_bits() name - Michal
> Rephrase comment - Michal
> 
> v3:
> Move xen_sanitize_pdc() call to arch_acpi_set_proc_cap_bits() to cover
> _OSC and _PDC.
> drivers/xen/pcpu.c is CONFIG_DOM0 && CONFIG_X86
> 
> v2:
> Move local variables in acpi_processor_eval_pdc() to reuse in both conditions.
> ---
>  arch/x86/include/asm/acpi.h           | 14 ++++++++++++++
>  arch/x86/include/asm/xen/hypervisor.h |  9 +++++++++
>  drivers/xen/pcpu.c                    | 21 +++++++++++++++++++++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> index c8a7fc23f63c..f896eed4516c 100644
> --- a/arch/x86/include/asm/acpi.h
> +++ b/arch/x86/include/asm/acpi.h
> @@ -16,6 +16,9 @@
>  #include <asm/x86_init.h>
>  #include <asm/cpufeature.h>
>  #include <asm/irq_vectors.h>
> +#include <asm/xen/hypervisor.h>
> +
> +#include <xen/xen.h>
>  
>  #ifdef CONFIG_ACPI_APEI
>  # include <asm/pgtable_types.h>
> @@ -127,6 +130,17 @@ static inline void arch_acpi_set_proc_cap_bits(u32 *cap)
>  	if (!cpu_has(c, X86_FEATURE_MWAIT) ||
>  	    boot_option_idle_override == IDLE_NOMWAIT)
>  		*cap &= ~(ACPI_PROC_CAP_C_C1_FFH | ACPI_PROC_CAP_C_C2C3_FFH);
> +
> +	if (xen_initial_domain()) {
> +		/*
> +		 * When Linux is running as Xen dom0, the hypervisor is the
> +		 * entity in charge of the processor power management, and so
> +		 * Xen needs to check the OS capabilities reported in the
> +		 * processor capabilities buffer matches what the hypervisor
> +		 * driver supports.
> +		 */
> +		xen_sanitize_proc_cap_bits(cap);
> +	}
>  }
>  
>  static inline bool acpi_has_cpu_in_madt(void)
> diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
> index 7048dfacc04b..a9088250770f 100644
> --- a/arch/x86/include/asm/xen/hypervisor.h
> +++ b/arch/x86/include/asm/xen/hypervisor.h
> @@ -100,4 +100,13 @@ static inline void leave_lazy(enum xen_lazy_mode mode)
>  
>  enum xen_lazy_mode xen_get_lazy_mode(void);
>  
> +#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI)
> +void xen_sanitize_proc_cap_bits(uint32_t *buf);
> +#else
> +static inline void xen_sanitize_proc_cap_bits(uint32_t *buf)
> +{
> +	BUG();
> +}
> +#endif
> +
>  #endif /* _ASM_X86_XEN_HYPERVISOR_H */
> diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
> index b3e3d1bb37f3..7000701dff8f 100644
> --- a/drivers/xen/pcpu.c
> +++ b/drivers/xen/pcpu.c
> @@ -47,6 +47,9 @@
>  #include <asm/xen/hypervisor.h>
>  #include <asm/xen/hypercall.h>
>  
> +#ifdef CONFIG_ACPI
> +#include <acpi/processor.h>
> +#endif
>  
>  /*
>   * @cpu_id: Xen physical cpu logic number
> @@ -400,4 +403,22 @@ bool __init xen_processor_present(uint32_t acpi_id)
>  
>  	return online;
>  }
> +
> +void xen_sanitize_proc_cap_bits(uint32_t *cap)
> +{
> +	struct xen_platform_op op = {
> +		.cmd			= XENPF_set_processor_pminfo,
> +		.u.set_pminfo.id	= -1,
> +		.u.set_pminfo.type	= XEN_PM_PDC,
> +	};
> +	u32 buf[3] = { ACPI_PDC_REVISION_ID, 1, *cap };
> +	int ret;
> +
> +	set_xen_guest_handle(op.u.set_pminfo.pdc, buf);
> +	ret = HYPERVISOR_platform_op(&op);
> +	if (ret)
> +		pr_err("sanitize of _PDC buffer bits from Xen failed: %d\n",
> +		       ret);
> +	*cap = buf[2];

FWIW, we might want to only update cap if the hypercall has been
successful, otherwise there's no guarantee of what's in the buffer, so
I would recommend to put the updating of cap in an else branch.

Anyway, not a strong opinion, as I think in practice even if the
hypercall fails it wouldn't corrupt the data in the buffer, but seems
more robust.

Thanks, Roger.

