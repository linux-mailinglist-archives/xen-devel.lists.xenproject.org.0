Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66E4F4023
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299291.509897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqU3-0005ej-95; Tue, 05 Apr 2022 21:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299291.509897; Tue, 05 Apr 2022 21:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqU3-0005cc-63; Tue, 05 Apr 2022 21:13:03 +0000
Received: by outflank-mailman (input) for mailman id 299291;
 Tue, 05 Apr 2022 21:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbqU1-0005cW-NW
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:13:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b2d5fc9-b525-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 23:12:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1650C60B5E;
 Tue,  5 Apr 2022 21:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0736C385A1;
 Tue,  5 Apr 2022 21:12:56 +0000 (UTC)
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
X-Inumbo-ID: 2b2d5fc9-b525-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649193177;
	bh=+JnNFKGo5X4hDVNR7BQcrPDAjrsJgobr8EFpq5B5bEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iDiTjOLXHUuibc2vuFJ5cTuCXI0el+EbpZF8ECExKEWM/FpjdiTPuKKfg5TaUTwUG
	 8nC2sKmfjVIqdKjrXUZnr+TV5zqmamZKWl/yizzn6P+oDP27IPAIvy9hW4Lkms2xsr
	 8U6RFHJapEqfPEYRbrv7fg2NMQ4NspNUlfLhofjmUBL3dTNCrPkBbUPQ2vM6ypFPOr
	 I8r5vu6pwqCu/n43i1VT6Er+Exj0EzF4v5E61ntLSGEP/mp6qg9x0CkMmkM5NfB7Q+
	 UW5p3b4tJ5RpRcWObM21GJCry5bXtPJsPg7dhwxeeOG4JxL5/rSA8FfA8/jRss9+NO
	 HpNvCSZ+C1pBw==
Date: Tue, 5 Apr 2022 14:12:56 -0700 (PDT)
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
Subject: Re: [PATCH v3 13/19] xen/arm: Move fixmap definitions in a separate
 header
In-Reply-To: <20220221102218.33785-14-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051411510.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-14-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
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
> 
> ---
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
> index 85d4a510ce8a..51908bf9422c 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -175,12 +175,6 @@
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


It is a good idea to create fixmap.h, but I think it should be acpi.h to
include fixmap.h, not the other way around.

The appended changes build correctly on top of this patch.


diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 1cee51e52a..8cf9dbb618 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -4,8 +4,6 @@
 #ifndef __ASM_FIXMAP_H
 #define __ASM_FIXMAP_H
 
-#include <xen/acpi.h>
-
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
@@ -14,6 +12,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/mm-frame.h>
+
 /* Map a page in a fixmap entry */
 extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
 /* Remove a mapping from a fixmap entry */
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 1b9c75e68f..148673e77c 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -28,6 +28,8 @@
 #define _LINUX
 #endif
 
+#include <asm/fixmap.h>
+
 /*
  * Fixmap pages to reserve for ACPI boot-time tables (see
  * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/fixmap.h),

