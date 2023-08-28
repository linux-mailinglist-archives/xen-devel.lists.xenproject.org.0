Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9978BAD5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591813.924334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakSV-00081d-Bf; Mon, 28 Aug 2023 22:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591813.924334; Mon, 28 Aug 2023 22:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakSV-0007zF-7r; Mon, 28 Aug 2023 22:11:43 +0000
Received: by outflank-mailman (input) for mailman id 591813;
 Mon, 28 Aug 2023 22:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakST-0007z1-2F
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:11:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc135407-45ef-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:11:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49FAB61ABD;
 Mon, 28 Aug 2023 22:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17CCC433C7;
 Mon, 28 Aug 2023 22:11:36 +0000 (UTC)
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
X-Inumbo-ID: dc135407-45ef-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693260697;
	bh=RrkerXCa2V1rL3A94jU4nW2iYWJHke/xWyRu2zklrB4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AFYH5BqZ6TPa7rR4weXn+Fk7A6sHkjDX7zsQo1BMsN3bM5oxelG6JfO/GAfqPJK4c
	 YNVE+UPsYMb4EmKx+bZbm/hbNIPqp5gDzX6r6nwKDQMtOZO2V8lxEU1Nu5YbvpL2MC
	 rJ7nvV/AOQERo2DNcTGzZ0gMCkYwDv1NSUhRxTIiCeH1YYT/OYIpnjys8hdI16mvGl
	 RKCULuWQfDqpqcG01RyG5cma7+BQd6OM50kz8ZqnjUlrVOZ4hdBaB0/RArXFY3Chgf
	 WjofS7nskXd/W0iDM4CnSamsMhuWgWmF0oWqGZAvTxz1fAZ8CZvV8zP0h6klgxCSNe
	 ZKUSuprFA3jSA==
Date: Mon, 28 Aug 2023 15:11:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 04/13] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <d2f0b1184ac9d2a79cc4651e6e4469bc38a6c24a.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281505050.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <d2f0b1184ac9d2a79cc4651e6e4469bc38a6c24a.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
> 
> Also C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/Makefile                  | 8 ++++----
>  xen/arch/x86/cpu/cpu.h                 | 5 +++++
>  xen/arch/x86/physdev.c                 | 4 ++++
>  xen/arch/x86/platform_hypercall.c      | 5 +++++
>  xen/arch/x86/x86_64/compat/mm.c        | 5 +++++
>  xen/arch/x86/x86_64/mmconfig.h         | 5 +++++
>  xen/arch/x86/x86_emulate/private.h     | 5 +++++
>  xen/arch/x86/x86_emulate/x86_emulate.c | 5 +++++
>  8 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index e642ad6c55..f956b7f0cd 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -259,17 +259,17 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
>  	$(call filechk,asm-macros.h)
>  
>  define filechk_asm-macros.h
> +    echo '#ifndef __ASM_MACROS_H__'; \
> +    echo '#define __ASM_MACROS_H__'; \
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
> +    echo '#endif /* __ASM_MACROS_H__ */'
>  endef
  
This looks OK but it needs to be reviewed by an x86 maintainer


>  $(obj)/efi.lds: AFLAGS-y += -DEFI
> diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
> index e3d06278b3..95939c7fb6 100644
> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -1,3 +1,6 @@
> +#ifndef __X86_CPU_CPU_H__
> +#define __X86_CPU_CPU_H__
> +
>  /* attempt to consolidate cpu attributes */
>  struct cpu_dev {
>  	void		(*c_early_init)(struct cpuinfo_x86 *c);
> @@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
>  void amd_init_ssbd(const struct cpuinfo_x86 *c);
>  void amd_init_spectral_chicken(void);
>  void detect_zen2_null_seg_behaviour(void);
> +
> +#endif /* __X86_CPU_CPU_H__ */
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 2f1d955a96..08b391d8f3 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -1,3 +1,5 @@
> +#ifndef  __X86_PHYSDEV_C__
> +#define  __X86_PHYSDEV_C__

NIT: double " "

everything else looks OK


>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -623,6 +625,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return ret;
>  }
>  
> +#endif /* __X86_PHYSDEV_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index 9ff2da8fc3..11aa084887 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -6,6 +6,9 @@
>   * Copyright (c) 2002-2006, K Fraser
>   */
>  
> +#ifndef __X86_PLATFORM_HYPERCALL_C__
> +#define __X86_PLATFORM_HYPERCALL_C__
> +
>  #include <xen/types.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
> @@ -899,6 +902,8 @@ ret_t do_platform_op(
>      return ret;
>  }
>  
> +#endif /* __X86_PLATFORM_HYPERCALL_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/x86_64/compat/mm.c b/xen/arch/x86/x86_64/compat/mm.c
> index d54efaad21..24f7eb8788 100644
> --- a/xen/arch/x86/x86_64/compat/mm.c
> +++ b/xen/arch/x86/x86_64/compat/mm.c
> @@ -1,3 +1,6 @@
> +#ifndef __X86_X86_64_COMPAT_MM_C__
> +#define __X86_X86_64_COMPAT_MM_C__
> +
>  #include <xen/event.h>
>  #include <xen/hypercall.h>
>  #include <xen/mem_access.h>
> @@ -326,6 +329,8 @@ int compat_mmuext_op(
>  }
>  #endif /* CONFIG_PV */
>  
> +#endif /* __X86_X86_64_COMPAT_MM_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
> index 2d49fc79a0..c562879c76 100644
> --- a/xen/arch/x86/x86_64/mmconfig.h
> +++ b/xen/arch/x86/x86_64/mmconfig.h
> @@ -5,6 +5,9 @@
>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>   */
>  
> +#ifndef __X86_X86_64_MMCONFIG_H__
> +#define __X86_X86_64_MMCONFIG_H__
> +
>  #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
>  #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
>  
> @@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
>  int pci_mmcfg_arch_init(void);
>  int pci_mmcfg_arch_enable(unsigned int);
>  void pci_mmcfg_arch_disable(unsigned int);
> +
> +#endif /* __X86_X86_64_MMCONFIG_H__ */
> diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
> index 719dad59cd..ffa134f297 100644
> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -6,6 +6,9 @@
>   * Copyright (c) 2005-2007 XenSource Inc.
>   */
>  
> +#ifndef __X86_X86_EMULATE_PRIVATE_H__
> +#define __X86_X86_EMULATE_PRIVATE_H__
> +
>  #ifdef __XEN__
>  
>  # include <xen/kernel.h>
> @@ -831,3 +834,5 @@ static inline int read_ulong(enum x86_segment seg,
>      *val = 0;
>      return ops->read(seg, offset, val, bytes, ctxt);
>  }
> +
> +#endif /* __X86_X86_EMULATE_PRIVATE_H__ */
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index e88245eae9..8977a1b82e 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8,6 +8,9 @@
>   * Copyright (c) 2005-2007 XenSource Inc.
>   */
>  
> +#ifndef __X86_X86_EMULATE_EMULATE_C__
> +#define __X86_X86_EMULATE_EMULATE_C__
> +
>  #include "private.h"
>  
>  /*
> @@ -8678,3 +8681,5 @@ int x86_emulate_wrapper(
>      return rc;
>  }
>  #endif
> +
> +#endif /* __X86_X86_EMULATE_EMULATE_C__ */
> -- 
> 2.34.1
> 

