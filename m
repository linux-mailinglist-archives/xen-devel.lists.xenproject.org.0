Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49178BB33
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591877.924434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qal4w-0001Tq-Dl; Mon, 28 Aug 2023 22:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591877.924434; Mon, 28 Aug 2023 22:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qal4w-0001RE-Ab; Mon, 28 Aug 2023 22:51:26 +0000
Received: by outflank-mailman (input) for mailman id 591877;
 Mon, 28 Aug 2023 22:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qal4u-0001R8-UF
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:51:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 691451f8-45f5-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:51:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 203A161136;
 Mon, 28 Aug 2023 22:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9DDC433C8;
 Mon, 28 Aug 2023 22:51:20 +0000 (UTC)
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
X-Inumbo-ID: 691451f8-45f5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693263081;
	bh=oOKanjnaBP5scZ1IOtXv6nEcOzv1shCXHLxQDKx6MXw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JNmfxe4wFMwvjKKrKGXdC2m73DVkZMu+DEM12GSttUcCqexGo/+6X2wdwGfnLu1CG
	 Mza9/2dyKjkzNd6vOtHeBq04osNnY0tlyvVjndVsqxu48AvRWT5nlZ59uMqYNHtAdi
	 QHANuu0KSI4XSlMgZBV+AdteZPTBkvLQjHTnW06jwjYHrJt9s4oVYTKLHULHxz9HKb
	 zHwmIHoueRwIR1iSfrA1jjBh+KLCZHZqBl03gGCd9pmx5w7xnfIZq+stC/wE2C3Vmy
	 awABMnxJ+TTrJQt7eQ3MpGOxJOdL5Z5676Tw2Gva1+xnHLZ5lD2XDh5P3PKNwjGE0v
	 ICvmd3SSXP48w==
Date: Mon, 28 Aug 2023 15:51:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Move or amended inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/include/xen/err.h       | 4 +++-
>  xen/include/xen/pci_ids.h   | 5 +++++
>  xen/include/xen/softirq.h   | 4 +++-
>  xen/include/xen/unaligned.h | 7 ++++---
>  xen/include/xen/vmap.h      | 4 +++-
>  5 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
> index 2f29b57d28..a6323d82d7 100644
> --- a/xen/include/xen/err.h
> +++ b/xen/include/xen/err.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> +#if !defined(__XEN_ERR_H__)
>  #define __XEN_ERR_H__
> +#if !defined(__ASSEMBLY__)

The original pattern was also guarding the header file sufficiently,
protecting it from double-inclusion. In fact, it is posing stricter
restrictions than usual (not laxer). This change is unnecessary?


>  #include <xen/compiler.h>
>  #include <xen/errno.h>
> @@ -54,4 +55,5 @@ static inline int __must_check PTR_RET(const void *ptr)
>  	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
>  }
>  
> +#endif /* __ASSEMBLY__ */
>  #endif /* __XEN_ERR_H__ */
> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> index e798477a7e..1a739d4c92 100644
> --- a/xen/include/xen/pci_ids.h
> +++ b/xen/include/xen/pci_ids.h
> @@ -1,3 +1,6 @@
> +#ifndef __XEN_PCI_IDS_H__
> +#define __XEN_PCI_IDS_H__
> +
>  #define PCI_VENDOR_ID_AMD                0x1022
>  
>  #define PCI_VENDOR_ID_NVIDIA             0x10de
> @@ -11,3 +14,5 @@
>  #define PCI_VENDOR_ID_BROADCOM           0x14e4
>  
>  #define PCI_VENDOR_ID_INTEL              0x8086
> +
> +#endif /* __XEN_PCI_IDS_H__ */
> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> index 33d6f2ecd2..092ec733b7 100644
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
> +#if !defined(__XEN_SOFTIRQ_H__)
>  #define __XEN_SOFTIRQ_H__
> +#if !defined(__ASSEMBLY__)

same here


>  /* Low-latency softirqs come first in the following list. */
>  enum {
> @@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
>   */
>  void process_pending_softirqs(void);
>  
> +#endif /* __ASSEMBLY__ */
>  #endif /* __XEN_SOFTIRQ_H__ */
> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
> index 0a2b16d05d..45f03b3f1b 100644
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -3,13 +3,14 @@
>   * without faulting, and at least reasonably efficiently.  Other architectures
>   * will need to have a custom asm/unaligned.h.
>   */
> -#ifndef __ASM_UNALIGNED_H__
> -#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
> -#endif
>  
>  #ifndef __XEN_UNALIGNED_H__
>  #define __XEN_UNALIGNED_H__
>  
> +#ifndef __ASM_UNALIGNED_H__
> +#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
> +#endif
> +
>  #ifdef __XEN__
>  #include <xen/types.h>
>  #include <asm/byteorder.h>
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index b0f7632e89..7a61dea54a 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> +#if !defined(__XEN_VMAP_H__)
>  #define __XEN_VMAP_H__
> +#if defined(VMAP_VIRT_START)

same here


>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
> @@ -38,4 +39,5 @@ static inline void vm_init(void)
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>  }
>  
> +#endif /* VMAP_VIRT_START */
>  #endif /* __XEN_VMAP_H__ */
> -- 
> 2.34.1
> 

