Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81CB78BAC9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591801.924313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakJq-0005l6-5U; Mon, 28 Aug 2023 22:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591801.924313; Mon, 28 Aug 2023 22:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakJq-0005iW-2O; Mon, 28 Aug 2023 22:02:46 +0000
Received: by outflank-mailman (input) for mailman id 591801;
 Mon, 28 Aug 2023 22:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakJo-0005iQ-Gt
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:02:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bc9db90-45ee-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:02:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE81D61ABD;
 Mon, 28 Aug 2023 22:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEA6C433C7;
 Mon, 28 Aug 2023 22:02:39 +0000 (UTC)
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
X-Inumbo-ID: 9bc9db90-45ee-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693260160;
	bh=kwFumCRNVldwEdOA1NgYy7OYxopfX5uMnkzvrcwOnCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MzLM1daO/sc/HwlQigf7PFfYxXRMfFVTHE+v4pjxCJxsexFidLBNiQjybUMFI4LAn
	 T8s5ZFszlXcTz1xRmrsrok2Gwjugu1S1GXHgkUKI1BwpcjK8ukUfv7jjyPmpIVNtI7
	 38ZOfWGAV5t5h0Rt7oiKTWwxX/E+u/tnRdgAB/LDwQHvno+t5EgT1icapPDlG6IyWg
	 jPodM27TVfFTgwU+UaCHpPud2BZhq5dBddhnpxlS3/8M/AUJaDmxfxBpgOJv3VX6lO
	 YE2jXJviMUHM9opN5vBmUCJ2uJzvxeERXhNy0/7d4F3uTW4nomPkx+g5HgVgWzWfdK
	 HvIKDKB7vmg1Q==
Date: Mon, 28 Aug 2023 15:02:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281502270.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
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
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/efi/efi-boot.h          | 6 ++++++
>  xen/arch/arm/include/asm/hypercall.h | 6 +++---
>  xen/arch/arm/include/asm/iocap.h     | 6 +++---
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 1c3640bb65..aba522ead5 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef __ARM_EFI_EFI_BOOT_H__
> +#define __ARM_EFI_EFI_BOOT_H__
> +
>  #include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <asm/setup.h>
> @@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
>      __flush_dcache_area(vaddr, size);
>  }
>  
> +#endif /* __ARM_EFI_EFI_BOOT_H__*/
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
> index ccd26c5184..4f4d96f1f2 100644
> --- a/xen/arch/arm/include/asm/hypercall.h
> +++ b/xen/arch/arm/include/asm/hypercall.h
> @@ -1,10 +1,10 @@
> +#ifndef __ASM_ARM_HYPERCALL_H__
> +#define __ASM_ARM_HYPERCALL_H__
> +
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
>  
> -#ifndef __ASM_ARM_HYPERCALL_H__
> -#define __ASM_ARM_HYPERCALL_H__
> -
>  #include <public/domctl.h> /* for arch_do_domctl */
>  
>  long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> diff --git a/xen/arch/arm/include/asm/iocap.h b/xen/arch/arm/include/asm/iocap.h
> index 276fefbc59..4db1b16839 100644
> --- a/xen/arch/arm/include/asm/iocap.h
> +++ b/xen/arch/arm/include/asm/iocap.h
> @@ -1,10 +1,10 @@
> -#ifndef __X86_IOCAP_H__
> -#define __X86_IOCAP_H__
> +#ifndef __ASM_ARM_IOCAP_H__
> +#define __ASM_ARM_IOCAP_H__
>  
>  #define cache_flush_permitted(d)                        \
>      (!rangeset_is_empty((d)->iomem_caps))
>  
> -#endif
> +#endif /* __ASM_ARM_IOCAP_H__ */
>  
>  /*
>   * Local variables:
> -- 
> 2.34.1
> 

