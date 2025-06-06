Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9DAD0A58
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008977.1388114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgfN-0005Uc-KW; Fri, 06 Jun 2025 23:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008977.1388114; Fri, 06 Jun 2025 23:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgfN-0005Sp-HP; Fri, 06 Jun 2025 23:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1008977;
 Fri, 06 Jun 2025 23:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNgfL-0004s7-77
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:40:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e442794-432f-11f0-a303-13f23c93f187;
 Sat, 07 Jun 2025 01:39:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D9515C4988;
 Fri,  6 Jun 2025 23:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3028C4CEEB;
 Fri,  6 Jun 2025 23:39:54 +0000 (UTC)
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
X-Inumbo-ID: 8e442794-432f-11f0-a303-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749253196;
	bh=7bugLH7yQWuKXLQIDqiHWCvYAlf5FJpAPgGIqIuVhWw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SXES9RuGD2JvVXwQCVXjUa0819EcWhuDZlRsbmpp3Hu1Ru0MaVhIqs7/Jv7uoZ6Hg
	 QHiiWU6BD639khBgvPomTduVMyRVhW5qHuGLqM/TuT6UotmgpQHMcsbHnDe4L4bvJ0
	 /6R5QEIpxIJtaS2wgsR3SrO7Z4WxQfxF24uws8TIVPXwZdZqbnzumyBbHiXoLGAfTl
	 DOY6cSV35oosVe73DztJHfSNkdOM7BNLRWMjmy8bhwWfszOq0dUB/3kQhMveI6nFVW
	 9U3BTcLqbPYCnE1db5EVpN8HQkyGwP102EIp26HgbIgNZzuPKI+Bqn6+NFY8tF31j+
	 mwR+jzg1XGcpw==
Date: Fri, 6 Jun 2025 16:39:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 09/15] xen/dt: Move bootinfo functions to a new
 bootinfo.h
In-Reply-To: <20250605194810.2782031-10-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061638050.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-10-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of
> bootinfo to a separate file for x86 to take.
> 
> With this, bootfdt.h can be cleanly included from x86. A later patch
> extracts the definitions so the functions may be called too.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/arm/domain_build.c             |   1 +
>  xen/arch/arm/mmu/mm.c                   |   1 +
>  xen/arch/arm/setup.c                    |   1 +
>  xen/arch/riscv/mm.c                     |   2 +-
>  xen/arch/riscv/setup.c                  |   2 +-
>  xen/common/device-tree/bootfdt.c        |   2 +-
>  xen/common/device-tree/bootinfo.c       |   2 +-
>  xen/common/device-tree/dom0less-build.c |   2 +-
>  xen/common/device-tree/domain-build.c   |   2 +-
>  xen/common/device-tree/kernel.c         |   2 +-
>  xen/include/xen/bootfdt.h               | 208 -----------------------
>  xen/include/xen/bootinfo.h              | 213 ++++++++++++++++++++++++
>  xen/include/xen/device_tree.h           |   2 +-
>  xen/include/xen/fdt-domain-build.h      |   2 +-
>  xen/include/xen/fdt-kernel.h            |   2 +-
>  15 files changed, 226 insertions(+), 218 deletions(-)
>  create mode 100644 xen/include/xen/bootinfo.h
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 5317665555..497cfbe860 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/init.h>
> +#include <xen/bootinfo.h>
>  #include <xen/compile.h>
>  #include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> index 9c50479c63..77f82757bb 100644
> --- a/xen/arch/arm/mmu/mm.c
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
> +#include <xen/bootinfo.h>

It doesn't look like this is needed.

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/macros.h>
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 734e23da44..439b1d9df2 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -8,6 +8,7 @@
>   * Copyright (c) 2011 Citrix Systems.
>   */
>  
> +#include <xen/bootinfo.h>
>  #include <xen/compile.h>
>  #include <xen/device_tree.h>
>  #include <xen/domain_page.h>
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 4047d67c0e..6ccd38091b 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/bug.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 8bcd19218d..3e99e2e194 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -2,7 +2,7 @@
>  
>  #include <xen/acpi.h>
>  #include <xen/bug.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/compile.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index ab449db8d6..7ff62e1e3e 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -5,7 +5,7 @@
>   * Copyright (C) 2012-2014 Citrix Systems, Inc.
>   */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/efi.h>
>  #include <xen/init.h>
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index 717cfa0962..69491bdb0b 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -10,7 +10,7 @@
>   */
>  
>  #include <xen/acpi.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/bug.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 809cb3c232..42165e78af 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/domain.h>
>  #include <xen/domain_page.h>
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index e602cb91c9..80235aa56a 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/fdt-domain-build.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
> index 3960f951f7..0463bfd8df 100644
> --- a/xen/common/device-tree/kernel.c
> +++ b/xen/common/device-tree/kernel.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/errno.h>
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 1b89986e10..a87b5212a6 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -4,9 +4,6 @@
>  
>  #include <xen/byteorder.h>
>  #include <xen/types.h>
> -#include <xen/kernel.h>
> -#include <xen/macros.h>
> -#include <xen/xmalloc.h>
>  
>  #if __has_include(<asm/bootfdt.h>)
>  #include <asm/bootfdt.h>
> @@ -14,15 +11,10 @@
>  
>  #define MIN_FDT_ALIGN 8
>  
> -#define NR_MEM_BANKS 256
> -#define NR_SHMEM_BANKS 32
> -
>  /* Default #address and #size cells */
>  #define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>  #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>  
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> -
>  #define DEVICE_TREE_MAX_DEPTH 16
>  
>  /* Helper to read a big number; size is in cells (not bytes) */
> @@ -75,78 +67,6 @@ typedef enum {
>      BOOTMOD_UNKNOWN
>  }  bootmodule_kind;
>  
> -enum membank_type {
> -    /*
> -     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> -     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> -     * the bank is in 'mem').
> -     */
> -    MEMBANK_DEFAULT,
> -    /*
> -     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> -     * bank is bound to a static Xen domain. It is only valid when the bank
> -     * is in reserved_mem.
> -     */
> -    MEMBANK_STATIC_DOMAIN,
> -    /*
> -     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> -     * bank is reserved as static heap. It is only valid when the bank is
> -     * in reserved_mem.
> -     */
> -    MEMBANK_STATIC_HEAP,
> -    /*
> -     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
> -     * bank is from the FDT reserve map.
> -     */
> -    MEMBANK_FDT_RESVMEM,
> -};
> -
> -enum region_type {
> -    MEMORY,
> -    RESERVED_MEMORY,
> -    STATIC_SHARED_MEMORY
> -};
> -
> -/* Indicates the maximum number of characters(\0 included) for shm_id */
> -#define MAX_SHM_ID_LENGTH 16
> -
> -struct shmem_membank_extra {
> -    char shm_id[MAX_SHM_ID_LENGTH];
> -    unsigned int nr_shm_borrowers;
> -};
> -
> -struct membank {
> -    paddr_t start;
> -    paddr_t size;
> -    union {
> -        enum membank_type type;
> -#ifdef CONFIG_STATIC_SHM
> -        struct shmem_membank_extra *shmem_extra;
> -#endif
> -    };
> -};
> -
> -struct membanks {
> -    __struct_group(membanks_hdr, common, ,
> -        unsigned int nr_banks;
> -        unsigned int max_banks;
> -        enum region_type type;
> -    );
> -    struct membank bank[];
> -};
> -
> -struct meminfo {
> -    struct membanks_hdr common;
> -    struct membank bank[NR_MEM_BANKS];
> -};
> -
> -struct shared_meminfo {
> -    struct membanks_hdr common;
> -    struct membank bank[NR_SHMEM_BANKS];
> -    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
> -};
> -
> -
>  struct bootdomain {
>      struct domain *d;
>  
> @@ -179,134 +99,6 @@ struct bootmodule {
>  #endif
>  };
>  
> -/* DT_MAX_NAME is the node name max length according the DT spec */
> -#define DT_MAX_NAME 41
> -struct bootcmdline {
> -    bootmodule_kind kind;
> -    bool domU;
> -    paddr_t start;
> -    char dt_name[DT_MAX_NAME];
> -    char cmdline[BOOTMOD_MAX_CMDLINE];
> -};
> -
> -struct bootmodules {
> -    int nr_mods;
> -    struct bootmodule module[MAX_MODULES];
> -};
> -
> -struct bootcmdlines {
> -    unsigned int nr_mods;
> -    struct bootcmdline cmdline[MAX_MODULES];
> -};
> -
> -struct bootinfo {
> -    struct meminfo mem;
> -    /* The reserved regions are only used when booting using Device-Tree */
> -    struct meminfo reserved_mem;
> -    struct bootmodules modules;
> -    struct bootcmdlines cmdlines;
> -#ifdef CONFIG_ACPI
> -    struct meminfo acpi;
> -#endif
> -#ifdef CONFIG_STATIC_SHM
> -    struct shared_meminfo shmem;
> -#endif
> -};
> -
> -#ifdef CONFIG_ACPI
> -#define BOOTINFO_ACPI_INIT                          \
> -    .acpi.common.max_banks = NR_MEM_BANKS,          \
> -    .acpi.common.type = MEMORY,
> -#else
> -#define BOOTINFO_ACPI_INIT
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -#define BOOTINFO_SHMEM_INIT                         \
> -    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
> -    .shmem.common.type = STATIC_SHARED_MEMORY,
> -#else
> -#define BOOTINFO_SHMEM_INIT
> -#endif
> -
> -#define BOOTINFO_INIT                               \
> -{                                                   \
> -    .mem.common.max_banks = NR_MEM_BANKS,           \
> -    .mem.common.type = MEMORY,                      \
> -    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> -    .reserved_mem.common.type = RESERVED_MEMORY,    \
> -    BOOTINFO_ACPI_INIT                              \
> -    BOOTINFO_SHMEM_INIT                             \
> -}
> -
> -extern struct bootinfo bootinfo;
> -
> -bool check_reserved_regions_overlap(paddr_t region_start,
> -                                    paddr_t region_size,
> -                                    bool allow_memreserve_overlap);
> -
> -struct bootmodule *add_boot_module(bootmodule_kind kind,
> -                                   paddr_t start, paddr_t size, bool domU);
> -struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> -struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> -                                                             paddr_t start);
> -void add_boot_cmdline(const char *name, const char *cmdline,
> -                      bootmodule_kind kind, paddr_t start, bool domU);
> -struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
> -struct bootcmdline * boot_cmdline_find_by_name(const char *name);
> -const char *boot_module_kind_as_string(bootmodule_kind kind);
> -
> -void populate_boot_allocator(void);
> -
> -size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> -
> -const char *boot_fdt_cmdline(const void *fdt);
> -int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> -
> -static inline struct membanks *bootinfo_get_reserved_mem(void)
> -{
> -    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
> -}
> -
> -static inline struct membanks *bootinfo_get_mem(void)
> -{
> -    return container_of(&bootinfo.mem.common, struct membanks, common);
> -}
> -
> -#ifdef CONFIG_ACPI
> -static inline struct membanks *bootinfo_get_acpi(void)
> -{
> -    return container_of(&bootinfo.acpi.common, struct membanks, common);
> -}
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -static inline struct membanks *bootinfo_get_shmem(void)
> -{
> -    return container_of(&bootinfo.shmem.common, struct membanks, common);
> -}
> -
> -static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> -{
> -    return bootinfo.shmem.extra;
> -}
> -#endif
> -
> -static inline struct membanks *membanks_xzalloc(unsigned int nr,
> -                                                enum region_type type)
> -{
> -    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
> -
> -    if ( !banks )
> -        goto out;
> -
> -    banks->max_banks = nr;
> -    banks->type = type;
> -
> - out:
> -    return banks;
> -}
> -
>  /*
>   * Interpret the property `prop_name` of `node` as a u32.
>   *
> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> new file mode 100644
> index 0000000000..670fe771a4
> --- /dev/null
> +++ b/xen/include/xen/bootinfo.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_BOOTINFO_H
> +#define XEN_BOOTINFO_H
> +
> +#include <xen/bootfdt.h>
> +#include <xen/kernel.h>
> +#include <xen/macros.h>
> +#include <xen/xmalloc.h>
> +
> +#define NR_MEM_BANKS 256
> +#define NR_SHMEM_BANKS 32
> +
> +#define MAX_MODULES 32 /* Current maximum useful modules */
> +
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> +     * the bank is in 'mem').
> +     */
> +    MEMBANK_DEFAULT,
> +    /*
> +     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> +     * bank is bound to a static Xen domain. It is only valid when the bank
> +     * is in reserved_mem.
> +     */
> +    MEMBANK_STATIC_DOMAIN,
> +    /*
> +     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> +     * bank is reserved as static heap. It is only valid when the bank is
> +     * in reserved_mem.
> +     */
> +    MEMBANK_STATIC_HEAP,
> +    /*
> +     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
> +     * bank is from the FDT reserve map.
> +     */
> +    MEMBANK_FDT_RESVMEM,
> +};
> +
> +enum region_type {
> +    MEMORY,
> +    RESERVED_MEMORY,
> +    STATIC_SHARED_MEMORY
> +};
> +
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +
> +struct shmem_membank_extra {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +};
> +
> +struct membank {
> +    paddr_t start;
> +    paddr_t size;
> +    union {
> +        enum membank_type type;
> +#ifdef CONFIG_STATIC_SHM
> +        struct shmem_membank_extra *shmem_extra;
> +#endif
> +    };
> +};
> +
> +struct membanks {
> +    __struct_group(membanks_hdr, common, ,
> +        unsigned int nr_banks;
> +        unsigned int max_banks;
> +        enum region_type type;
> +    );
> +    struct membank bank[];
> +};
> +
> +struct meminfo {
> +    struct membanks_hdr common;
> +    struct membank bank[NR_MEM_BANKS];
> +};
> +
> +struct shared_meminfo {
> +    struct membanks_hdr common;
> +    struct membank bank[NR_SHMEM_BANKS];
> +    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
> +};
> +
> +/* DT_MAX_NAME is the node name max length according the DT spec */
> +#define DT_MAX_NAME 41
> +struct bootcmdline {
> +    bootmodule_kind kind;
> +    bool domU;
> +    paddr_t start;
> +    char dt_name[DT_MAX_NAME];
> +    char cmdline[BOOTMOD_MAX_CMDLINE];
> +};
> +
> +struct bootmodules {
> +    int nr_mods;
> +    struct bootmodule module[MAX_MODULES];
> +};
> +
> +struct bootcmdlines {
> +    unsigned int nr_mods;
> +    struct bootcmdline cmdline[MAX_MODULES];
> +};
> +
> +struct bootinfo {
> +    struct meminfo mem;
> +    /* The reserved regions are only used when booting using Device-Tree */
> +    struct meminfo reserved_mem;
> +    struct bootmodules modules;
> +    struct bootcmdlines cmdlines;
> +#ifdef CONFIG_ACPI
> +    struct meminfo acpi;
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shmem;
> +#endif
> +};
> +
> +#ifdef CONFIG_ACPI
> +#define BOOTINFO_ACPI_INIT                          \
> +    .acpi.common.max_banks = NR_MEM_BANKS,          \
> +    .acpi.common.type = MEMORY,
> +#else
> +#define BOOTINFO_ACPI_INIT
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +#define BOOTINFO_SHMEM_INIT                         \
> +    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
> +    .shmem.common.type = STATIC_SHARED_MEMORY,
> +#else
> +#define BOOTINFO_SHMEM_INIT
> +#endif
> +
> +#define BOOTINFO_INIT                               \
> +{                                                   \
> +    .mem.common.max_banks = NR_MEM_BANKS,           \
> +    .mem.common.type = MEMORY,                      \
> +    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> +    .reserved_mem.common.type = RESERVED_MEMORY,    \
> +    BOOTINFO_ACPI_INIT                              \
> +    BOOTINFO_SHMEM_INIT                             \
> +}
> +
> +extern struct bootinfo bootinfo;
> +
> +bool check_reserved_regions_overlap(paddr_t region_start,
> +                                    paddr_t region_size,
> +                                    bool allow_memreserve_overlap);
> +
> +struct bootmodule *add_boot_module(bootmodule_kind kind,
> +                                   paddr_t start, paddr_t size, bool domU);
> +struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> +struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> +                                                             paddr_t start);
> +void add_boot_cmdline(const char *name, const char *cmdline,
> +                      bootmodule_kind kind, paddr_t start, bool domU);
> +struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
> +struct bootcmdline * boot_cmdline_find_by_name(const char *name);
> +const char *boot_module_kind_as_string(bootmodule_kind kind);
> +
> +void populate_boot_allocator(void);
> +
> +size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> +const char *boot_fdt_cmdline(const void *fdt);
> +int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> +
> +static inline struct membanks *bootinfo_get_reserved_mem(void)
> +{
> +    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
> +}
> +
> +static inline struct membanks *bootinfo_get_mem(void)
> +{
> +    return container_of(&bootinfo.mem.common, struct membanks, common);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static inline struct membanks *bootinfo_get_acpi(void)
> +{
> +    return container_of(&bootinfo.acpi.common, struct membanks, common);
> +}
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +static inline struct membanks *bootinfo_get_shmem(void)
> +{
> +    return container_of(&bootinfo.shmem.common, struct membanks, common);
> +}
> +
> +static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> +{
> +    return bootinfo.shmem.extra;
> +}
> +#endif
> +
> +static inline struct membanks *membanks_xzalloc(unsigned int nr,
> +                                                enum region_type type)
> +{
> +    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
> +
> +    if ( !banks )
> +        goto out;
> +
> +    banks->max_banks = nr;
> +    banks->type = type;
> +
> + out:
> +    return banks;
> +}
> +
> +#endif /* XEN_BOOTINFO_H */
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 0a22b1ba1d..7d1c8bc305 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,7 +10,7 @@
>  #ifndef __XEN_DEVICE_TREE_H__
>  #define __XEN_DEVICE_TREE_H__
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/byteorder.h>
>  
>  #include <asm/device.h>
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 45981dbec0..60565fdbf9 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -3,7 +3,7 @@
>  #ifndef __XEN_FDT_DOMAIN_BUILD_H__
>  #define __XEN_FDT_DOMAIN_BUILD_H__
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/mm.h>
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index dd009f01d0..cb211d242f 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -7,7 +7,7 @@
>  #ifndef __XEN_FDT_KERNEL_H__
>  #define __XEN_FDT_KERNEL_H__
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/types.h>
>  
> -- 
> 2.43.0
> 

