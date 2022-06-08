Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09454209A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 03:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343586.568950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nykC0-00072q-Nd; Wed, 08 Jun 2022 01:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343586.568950; Wed, 08 Jun 2022 01:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nykC0-0006zv-J5; Wed, 08 Jun 2022 01:09:04 +0000
Received: by outflank-mailman (input) for mailman id 343586;
 Wed, 08 Jun 2022 01:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nykBz-0006yD-09
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 01:09:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9448e9e3-e6c7-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 03:09:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F50761755;
 Wed,  8 Jun 2022 01:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FB4C34114;
 Wed,  8 Jun 2022 01:08:58 +0000 (UTC)
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
X-Inumbo-ID: 9448e9e3-e6c7-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654650538;
	bh=UCRrUBCvkRAHHH8YBFR6ClbMWiZGaosAvN0eiDdDXK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TZunASziJLqT9SQGPmjEAi1TsSPf8dhnUodaLFxPxaLI+/q82H7hfKW10zOaRHrTD
	 e6RE+fayzCgTo3EY2MZmnBQ09COvKOm/ITZY9K9GLlKFTV5Lprw8GYUM4IYeKSZEE3
	 DwfGgYFR/wGOPoLdY49ILDk9zkH0XgV996zlECs6cLWuGG4dy8xIW5QWxWbOTzct2M
	 FtIdKAIYmKfPNepjQKHBK+KqUMqnHEhaX2HEyunYv7vC/LKt+dIOKz3dzemH8D0T3t
	 2QdGuNNNP6g08xKlw7/SLL5eT+1pWggRP2Ew57lJZEpjHr2z6dJtJujoVHgPnat72Y
	 gNw33FEbgmqjQ==
Date: Tue, 7 Jun 2022 18:08:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 09/16] xen/arm: Move fixmap definitions in a separate
 header
In-Reply-To: <20220520120937.28925-10-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206071808350.21215@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-10-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> To use properly the fixmap definitions, their user would need
> also new to include <xen/acpi.h>. This is not very great when
> the user itself is not meant to directly use ACPI definitions.
> 
> Including <xen/acpi.h> in <asm/config.h> is not option because
> the latter header is included by everyone. So move out the fixmap
> entries definition in a new header.
> 
> Take the opportunity to also move {set, clear}_fixmap() prototypes
> in the new header.
> 
> Note that most of the definitions in <xen/acpi.h> now need to be
> surrounded with #ifndef __ASSEMBLY__ because <asm/fixmap.h> will
> be used in assembly (see EARLY_UART_VIRTUAL_ADDRESS).
> 
> The split will become more helpful in a follow-up patch where new
> fixmap entries will be defined.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
>     There was some disagreement with Stefano on whether fixmap.h
>     should include acpi.h or this should be the other way around.
> 
>     I chose the former because each components should decide how
>     much entries in the fixmap they need and also because this is
>     the current behavior on x86. We should stay consitent
>     between arch to avoid any headers mess.
> 
>     Jan acked this patch, so I am assuming he is happy with this
>     approach. I would be OK to rework it if others agree with
>     Stefano's view.

noone is speaking so:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



>     Changes in v4:
>         - Add Jan's acked-by
>         - Record Stefano's disagreement on the approach
> 
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/acpi/lib.c                 |  2 ++
>  xen/arch/arm/include/asm/config.h       |  6 ------
>  xen/arch/arm/include/asm/early_printk.h |  1 +
>  xen/arch/arm/include/asm/fixmap.h       | 24 ++++++++++++++++++++++++
>  xen/arch/arm/include/asm/mm.h           |  4 ----
>  xen/arch/arm/kernel.c                   |  1 +
>  xen/arch/arm/mm.c                       |  1 +
>  xen/include/xen/acpi.h                  | 18 +++++++++++-------
>  8 files changed, 40 insertions(+), 17 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/fixmap.h
> 
> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
> index a59cc4074cfb..41d521f720ac 100644
> --- a/xen/arch/arm/acpi/lib.c
> +++ b/xen/arch/arm/acpi/lib.c
> @@ -25,6 +25,8 @@
>  #include <xen/init.h>
>  #include <xen/mm.h>
>  
> +#include <asm/fixmap.h>
> +
>  static bool fixmap_inuse;
>  
>  char *__acpi_map_table(paddr_t phys, unsigned long size)
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index b25c9d39bb32..3e2a55a91058 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -169,12 +169,6 @@
>  
>  #endif
>  
> -/* Fixmap slots */
> -#define FIXMAP_CONSOLE  0  /* The primary UART */
> -#define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
> -#define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
> -#define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
> -
>  #define NR_hypercalls 64
>  
>  #define STACK_ORDER 3
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index 8dc911cf48a3..c5149b2976da 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -11,6 +11,7 @@
>  #define __ARM_EARLY_PRINTK_H__
>  
>  #include <xen/page-size.h>
> +#include <asm/fixmap.h>
>  
>  #ifdef CONFIG_EARLY_PRINTK
>  
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> new file mode 100644
> index 000000000000..1cee51e52ab9
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -0,0 +1,24 @@
> +/*
> + * fixmap.h: compile-time virtual memory allocation
> + */
> +#ifndef __ASM_FIXMAP_H
> +#define __ASM_FIXMAP_H
> +
> +#include <xen/acpi.h>
> +
> +/* Fixmap slots */
> +#define FIXMAP_CONSOLE  0  /* The primary UART */
> +#define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
> +#define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
> +#define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Map a page in a fixmap entry */
> +extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
> +/* Remove a mapping from a fixmap entry */
> +extern void clear_fixmap(unsigned map);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_FIXMAP_H */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf28230b..045a8ba4bb63 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -191,10 +191,6 @@ extern void mmu_init_secondary_cpu(void);
>  extern void setup_xenheap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
>  /* Map a frame table to cover physical addresses ps through pe */
>  extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
> -/* Map a 4k page in a fixmap entry */
> -extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
> -/* Remove a mapping from a fixmap entry */
> -extern void clear_fixmap(unsigned map);
>  /* map a physical range in virtual memory */
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned attributes);
>  
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 8f43caa1866d..25ded1c056d9 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -15,6 +15,7 @@
>  #include <xen/vmap.h>
>  
>  #include <asm/byteorder.h>
> +#include <asm/fixmap.h>
>  #include <asm/kernel.h>
>  #include <asm/setup.h>
>  
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 6b7b72de27fe..52b2a0394047 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -41,6 +41,7 @@
>  #include <xen/sizes.h>
>  #include <xen/libfdt/libfdt.h>
>  
> +#include <asm/fixmap.h>
>  #include <asm/setup.h>
>  
>  /* Override macros from asm/page.h to make them work with mfn_t */
> diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
> index 39d51fcd01dd..1b9c75e68fc4 100644
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -28,6 +28,15 @@
>  #define _LINUX
>  #endif
>  
> +/*
> + * Fixmap pages to reserve for ACPI boot-time tables (see
> + * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/fixmap.h),
> + * 64 pages(256KB) is large enough for most cases.)
> + */
> +#define NUM_FIXMAP_ACPI_PAGES  64
> +
> +#ifndef __ASSEMBLY__
> +
>  #include <xen/list.h>
>  
>  #include <acpi/acpi.h>
> @@ -39,13 +48,6 @@
>  #define ACPI_MADT_GET_POLARITY(inti)	ACPI_MADT_GET_(POLARITY, inti)
>  #define ACPI_MADT_GET_TRIGGER(inti)	ACPI_MADT_GET_(TRIGGER, inti)
>  
> -/*
> - * Fixmap pages to reserve for ACPI boot-time tables (see
> - * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/config.h,
> - * 64 pages(256KB) is large enough for most cases.)
> - */
> -#define NUM_FIXMAP_ACPI_PAGES  64
> -
>  #define BAD_MADT_ENTRY(entry, end) (                                        \
>                  (!(entry)) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||  \
>                  (entry)->header.length < sizeof(*(entry)))
> @@ -207,4 +209,6 @@ void acpi_reboot(void);
>  void acpi_dmar_zap(void);
>  void acpi_dmar_reinstate(void);
>  
> +#endif /* __ASSEMBLY__ */
> +
>  #endif /*_LINUX_ACPI_H*/
> -- 
> 2.32.0
> 

