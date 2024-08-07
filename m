Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C528194A830
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773480.1183914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbgJc-0006Rc-F4; Wed, 07 Aug 2024 13:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773480.1183914; Wed, 07 Aug 2024 13:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbgJc-0006Ps-C8; Wed, 07 Aug 2024 13:02:56 +0000
Received: by outflank-mailman (input) for mailman id 773480;
 Wed, 07 Aug 2024 13:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNf5=PG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sbgJb-0006PW-D6
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:02:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d813da-54bd-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 15:02:50 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7389E4EE0738;
 Wed,  7 Aug 2024 15:02:49 +0200 (CEST)
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
X-Inumbo-ID: 59d813da-54bd-11ef-bc04-fd08da9f4363
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 15:02:49 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2 1/2] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
In-Reply-To: <811f6e0001e7a83ea9282a98513407aa19d26256.1722941799.git.oleksii.kurochko@gmail.com>
References: <cover.1722941799.git.oleksii.kurochko@gmail.com>
 <811f6e0001e7a83ea9282a98513407aa19d26256.1722941799.git.oleksii.kurochko@gmail.com>
Message-ID: <c6804c838a08408412a6cdc2fa91777a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-06 13:41, Oleksii Kurochko wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Also, common/device_tree.c has been moved to the device-tree folder 
> with
> the corresponding updates to common/Makefile and 
> common/device-tree/Makefile.
> 
> Mentioning of arm32 is changed to CONFIG_SEPARATE_XENHEAP in comparison 
> with
> original ARM's code as now it is moved in common code.
> 

Hi,

chiming in to this thread to note that fw_unreserved_regions is probably 
a leftover from this commit that ought to be moved to bootdft.h, as it 
generates a MISRA C Rule 8.4 violation [1] (non-blocking).

I made a tentative patch here [2], but not all builds are passing.

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/ARM64/7520607251/PROJECT.ecd;/by_service/MC3R1.R8.4.html

[2] 
https://gitlab.com/xen-project/people/bugseng/xen/-/commits/MC3R1.R8.4

> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in V9:
>  - rename xen/common/device_tree.c to xen/common/device-tree.c
>  - update MAINTAINERS file: drop xen/common/device_tree.c from it.
> ---
> Changes in V8:
>  - add the version of Xen from which bootinfo.c was derived from.
>  - update the commit message.
>  - add Acked-by: Julien Grall <jgrall@amazon.com>.
> ---
> Changes in V7:
>  - move obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/ to proper place 
> in common/Makefile.
>  - rename macros __XEN_BOOTFDT_H__ to XEN_BOOTFDT_H to not violate 
> MISRA rule 21.1.
>  - drop definition of "#define MAX_FDT_SIZE SZ_2M" in xen/bootfdt.h as 
> it is expected to
>    be arch-specific. Back "#define MAX_FDT_SIZE SZ_2M" to arm/setup.h 
> where it was before
>    these changes.
>  - git mv xen/common/device_tree.c xen/common/device-tree/ and update 
> correspondingly
>    Makefiles of common/ and common/device-tree
>  - update the commit message
> ---
> Changes in V6:
>  - update the version of the patch to v6.
> ---
> Changes in V5:
>  - After rebase the Shawn's patch v4 on top of current staging the 
> following
>    was done:
>    - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>    - drop message "Early device tree parsing and".
>    - After rebase on top of the current staging the following changes 
> were done:
>      - init bootinfo variable in <common/device-tree/bootinfo.c> with 
> BOOTINFO_INIT;
>      - update the code of dt_unreserved_regions():
>          CONFIG_STATIC_SHM related changes and getting of reserved_mem
>          bootinfo_get_shmem()
>      - update the code of meminfo_overlap_check():
>          add check ( INVALID_PADDR == bank_start ) to if case.
>      - update the code of check_reserved_regions_overlap():
>          CONFIG_STATIC_SHM related changes.
>      - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>      - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>      - struct struct membanks was update with __struct group so 
> <xen/kernel> is
>        neeeded to be included in bootfdt.h
>      - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to 
> generic bootfdt.h
>      - bootinfo_get_reserved_mem(), bootinfo_get_mem(), 
> bootinfo_get_acpi(),
>        bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved 
> to xen/bootfdt.h
>    - s/arm32/CONFIG_SEPARATE_XENHEAP/
>    - add inclusion of <xen/macros.h> because there are function in 
> <xen/bootfdt.h> which
>      are using container_of().
>  ---
> Changes in v4:
>   - create new xen/include/bootinfo.h rather than relying on arch's
>     asm/setup.h to provide required definitions for bootinfo.c
>   - build bootinfo.c as .init.o
>   - clean up and sort bootinfo.c's #includes
>   - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
>     xenheap-specific behavior of populate_boot_allocator
>   - (MAINTAINERS) include all of common/device-tree rather than just
>     bootinfo.c
> ---
>  MAINTAINERS                                   |   3 +-
>  xen/arch/arm/include/asm/setup.h              | 185 +------
>  xen/arch/arm/setup.c                          | 432 -----------------
>  xen/common/Makefile                           |   2 +-
>  xen/common/device-tree/Makefile               |   2 +
>  xen/common/device-tree/bootinfo.c             | 459 ++++++++++++++++++
>  .../device-tree.c}                            |   0
>  xen/include/xen/bootfdt.h                     | 195 ++++++++
>  8 files changed, 660 insertions(+), 618 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  create mode 100644 xen/common/device-tree/bootinfo.c
>  rename xen/common/{device_tree.c => device-tree/device-tree.c} (100%)
>  create mode 100644 xen/include/xen/bootfdt.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c524a8a93..89be48fdf9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -291,9 +291,10 @@ M:	Bertrand Marquis <bertrand.marquis@arm.com>
>  M:	Michal Orzel <michal.orzel@amd.com>
>  S:	Supported
>  F:	xen/common/libfdt/
> -F:	xen/common/device_tree.c
> +F:	xen/common/device-tree/
>  F:	xen/common/dt-overlay.c
>  F:	xen/include/xen/libfdt/
> +F:	xen/include/xen/bootfdt.h
>  F:	xen/include/xen/device_tree.h
>  F:	xen/drivers/passthrough/device_tree.c
> 
> diff --git a/xen/arch/arm/include/asm/setup.h 
> b/xen/arch/arm/include/asm/setup.h
> index c34179da93..1748be29e5 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -3,159 +3,11 @@
> 
>  #include <public/version.h>
>  #include <asm/p2m.h>
> +#include <xen/bootfdt.h>
>  #include <xen/device_tree.h>
> 
> -#define MIN_FDT_ALIGN 8
>  #define MAX_FDT_SIZE SZ_2M
> 
> -#define NR_MEM_BANKS 256
> -#define NR_SHMEM_BANKS 32
> -
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> -
> -typedef enum {
> -    BOOTMOD_XEN,
> -    BOOTMOD_FDT,
> -    BOOTMOD_KERNEL,
> -    BOOTMOD_RAMDISK,
> -    BOOTMOD_XSM,
> -    BOOTMOD_GUEST_DTB,
> -    BOOTMOD_UNKNOWN
> -}  bootmodule_kind;
> -
> -enum membank_type {
> -    /*
> -     * The MEMBANK_DEFAULT type refers to either reserved memory for 
> the
> -     * device/firmware (when the bank is in 'reserved_mem') or any RAM 
> (when
> -     * the bank is in 'mem').
> -     */
> -    MEMBANK_DEFAULT,
> -    /*
> -     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the 
> memory
> -     * bank is bound to a static Xen domain. It is only valid when the 
> bank
> -     * is in reserved_mem.
> -     */
> -    MEMBANK_STATIC_DOMAIN,
> -    /*
> -     * The MEMBANK_STATIC_HEAP type is used to indicate whether the 
> memory
> -     * bank is reserved as static heap. It is only valid when the bank 
> is
> -     * in reserved_mem.
> -     */
> -    MEMBANK_STATIC_HEAP,
> -    /*
> -     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the 
> memory
> -     * bank is from the FDT reserve map.
> -     */
> -    MEMBANK_FDT_RESVMEM,
> -};
> -
> -/* Indicates the maximum number of characters(\0 included) for shm_id 
> */
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
> -/*
> - * The domU flag is set for kernels and ramdisks of "xen,domain" 
> nodes.
> - * The purpose of the domU flag is to avoid getting confused in
> - * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.
> - */
> -#define BOOTMOD_MAX_CMDLINE 1024
> -struct bootmodule {
> -    bootmodule_kind kind;
> -    bool domU;
> -    paddr_t start;
> -    paddr_t size;
> -};
> -
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
> -    /* The reserved regions are only used when booting using 
> Device-Tree */
> -    struct meminfo reserved_mem;
> -    struct bootmodules modules;
> -    struct bootcmdlines cmdlines;
> -#ifdef CONFIG_ACPI
> -    struct meminfo acpi;
> -#endif
> -#ifdef CONFIG_STATIC_SHM
> -    struct shared_meminfo shmem;
> -#endif
> -    bool static_heap;
> -};
> -
> -#ifdef CONFIG_ACPI
> -#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
> -#else
> -#define BOOTINFO_ACPI_INIT
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
> -#else
> -#define BOOTINFO_SHMEM_INIT
> -#endif
> -
> -#define BOOTINFO_INIT                               \
> -{                                                   \
> -    .mem.common.max_banks = NR_MEM_BANKS,           \
> -    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> -    BOOTINFO_ACPI_INIT                              \
> -    BOOTINFO_SHMEM_INIT                             \
> -}
> -
>  struct map_range_data
>  {
>      struct domain *d;
> @@ -167,39 +19,8 @@ struct map_range_data
>      struct rangeset *irq_ranges;
>  };
> 
> -extern struct bootinfo bootinfo;
> -
>  extern domid_t max_init_domid;
> 
> -static inline struct membanks *bootinfo_get_mem(void)
> -{
> -    return container_of(&bootinfo.mem.common, struct membanks, 
> common);
> -}
> -
> -static inline struct membanks *bootinfo_get_reserved_mem(void)
> -{
> -    return container_of(&bootinfo.reserved_mem.common, struct 
> membanks, common);
> -}
> -
> -#ifdef CONFIG_ACPI
> -static inline struct membanks *bootinfo_get_acpi(void)
> -{
> -    return container_of(&bootinfo.acpi.common, struct membanks, 
> common);
> -}
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -static inline struct membanks *bootinfo_get_shmem(void)
> -{
> -    return container_of(&bootinfo.shmem.common, struct membanks, 
> common);
> -}
> -
> -static inline struct shmem_membank_extra 
> *bootinfo_get_shmem_extra(void)
> -{
> -    return bootinfo.shmem.extra;
> -}
> -#endif
> -
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> 
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> @@ -220,9 +41,6 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>                             void (*cb)(paddr_t ps, paddr_t pe),
>                             unsigned int first);
> 
> -size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> -const char *boot_fdt_cmdline(const void *fdt);
> -
>  bool check_reserved_regions_overlap(paddr_t region_start, paddr_t 
> region_size);
> 
>  struct bootmodule *add_boot_module(bootmodule_kind kind,
> @@ -237,7 +55,6 @@ struct bootcmdline * boot_cmdline_find_by_name(const 
> char *name);
>  const char *boot_module_kind_as_string(bootmodule_kind kind);
> 
>  void init_pdx(void);
> -void populate_boot_allocator(void);
>  void setup_mm(void);
> 
>  extern uint32_t hyp_traps_vector[];
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 0c2fdaceaf..cb2c0a16b8 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -48,8 +48,6 @@
>  #include <xsm/xsm.h>
>  #include <asm/acpi.h>
> 
> -struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
> -
>  /*
>   * Sanitized version of cpuinfo containing only features available on 
> all
>   * cores (only on arm64 as there is no sanitization support on arm32).
> @@ -203,321 +201,6 @@ static void __init processor_id(void)
>      processor_setup();
>  }
> 
> -static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> -                                         void (*cb)(paddr_t ps, 
> paddr_t pe),
> -                                         unsigned int first)
> -{
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> -#ifdef CONFIG_STATIC_SHM
> -    const struct membanks *shmem = bootinfo_get_shmem();
> -    unsigned int offset;
> -#endif
> -    unsigned int i;
> -
> -    /*
> -     * i is the current bootmodule we are evaluating across all 
> possible
> -     * kinds.
> -     */
> -    for ( i = first; i < reserved_mem->nr_banks; i++ )
> -    {
> -        paddr_t r_s = reserved_mem->bank[i].start;
> -        paddr_t r_e = r_s + reserved_mem->bank[i].size;
> -
> -        if ( s < r_e && r_s < e )
> -        {
> -            dt_unreserved_regions(r_e, e, cb, i + 1);
> -            dt_unreserved_regions(s, r_s, cb, i + 1);
> -            return;
> -        }
> -    }
> -
> -#ifdef CONFIG_STATIC_SHM
> -    /*
> -     * When retrieving the corresponding shared memory addresses
> -     * below, we need to index the shmem->bank starting from 0, hence
> -     * we need to use i - reserved_mem->nr_banks.
> -    */
> -    offset = reserved_mem->nr_banks;
> -    for ( ; i - offset < shmem->nr_banks; i++ )
> -    {
> -        paddr_t r_s, r_e;
> -
> -        r_s = shmem->bank[i - offset].start;
> -
> -        /* Shared memory banks can contain INVALID_PADDR as start */
> -        if ( INVALID_PADDR == r_s )
> -            continue;
> -
> -        r_e = r_s + shmem->bank[i - offset].size;
> -
> -        if ( s < r_e && r_s < e )
> -        {
> -            dt_unreserved_regions(r_e, e, cb, i + 1);
> -            dt_unreserved_regions(s, r_s, cb, i + 1);
> -            return;
> -        }
> -    }
> -#endif
> -
> -    cb(s, e);
> -}
> -
> -/*
> - * TODO: '*_end' could be 0 if the bank/region is at the end of the 
> physical
> - * address space. This is for now not handled as it requires more 
> rework.
> - */
> -static bool __init meminfo_overlap_check(const struct membanks *mem,
> -                                         paddr_t region_start,
> -                                         paddr_t region_size)
> -{
> -    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> -    paddr_t region_end = region_start + region_size;
> -    unsigned int i, bank_num = mem->nr_banks;
> -
> -    for ( i = 0; i < bank_num; i++ )
> -    {
> -        bank_start = mem->bank[i].start;
> -        bank_end = bank_start + mem->bank[i].size;
> -
> -        if ( INVALID_PADDR == bank_start || region_end <= bank_start 
> ||
> -             region_start >= bank_end )
> -            continue;
> -        else
> -        {
> -            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
> with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> -                   region_start, region_end, i, bank_start, bank_end);
> -            return true;
> -        }
> -    }
> -
> -    return false;
> -}
> -
> -/*
> - * TODO: '*_end' could be 0 if the module/region is at the end of the 
> physical
> - * address space. This is for now not handled as it requires more 
> rework.
> - */
> -static bool __init bootmodules_overlap_check(struct bootmodules 
> *bootmodules,
> -                                             paddr_t region_start,
> -                                             paddr_t region_size)
> -{
> -    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> -    paddr_t region_end = region_start + region_size;
> -    unsigned int i, mod_num = bootmodules->nr_mods;
> -
> -    for ( i = 0; i < mod_num; i++ )
> -    {
> -        mod_start = bootmodules->module[i].start;
> -        mod_end = mod_start + bootmodules->module[i].size;
> -
> -        if ( region_end <= mod_start || region_start >= mod_end )
> -            continue;
> -        else
> -        {
> -            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
> with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> -                   region_start, region_end, i, mod_start, mod_end);
> -            return true;
> -        }
> -    }
> -
> -    return false;
> -}
> -
> -void __init fw_unreserved_regions(paddr_t s, paddr_t e,
> -                                  void (*cb)(paddr_t ps, paddr_t pe),
> -                                  unsigned int first)
> -{
> -    if ( acpi_disabled )
> -        dt_unreserved_regions(s, e, cb, first);
> -    else
> -        cb(s, e);
> -}
> -
> -/*
> - * Given an input physical address range, check if this range is 
> overlapping
> - * with the existing reserved memory regions defined in bootinfo.
> - * Return true if the input physical address range is overlapping with 
> any
> - * existing reserved memory regions, otherwise false.
> - */
> -bool __init check_reserved_regions_overlap(paddr_t region_start,
> -                                           paddr_t region_size)
> -{
> -    const struct membanks *mem_banks[] = {
> -        bootinfo_get_reserved_mem(),
> -#ifdef CONFIG_ACPI
> -        bootinfo_get_acpi(),
> -#endif
> -#ifdef CONFIG_STATIC_SHM
> -        bootinfo_get_shmem(),
> -#endif
> -    };
> -    unsigned int i;
> -
> -    /*
> -     * Check if input region is overlapping with reserved memory banks 
> or
> -     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or 
> static
> -     * shared memory banks (when static shared memory feature is 
> enabled)
> -     */
> -    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> -        if ( meminfo_overlap_check(mem_banks[i], region_start, 
> region_size) )
> -            return true;
> -
> -    /* Check if input region is overlapping with bootmodules */
> -    if ( bootmodules_overlap_check(&bootinfo.modules,
> -                                   region_start, region_size) )
> -        return true;
> -
> -    return false;
> -}
> -
> -struct bootmodule __init *add_boot_module(bootmodule_kind kind,
> -                                          paddr_t start, paddr_t size,
> -                                          bool domU)
> -{
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> -    unsigned int i;
> -
> -    if ( mods->nr_mods == MAX_MODULES )
> -    {
> -        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" 
> (too many)\n",
> -               boot_module_kind_as_string(kind), start, start + size);
> -        return NULL;
> -    }
> -
> -    if ( check_reserved_regions_overlap(start, size) )
> -        return NULL;
> -
> -    for ( i = 0 ; i < mods->nr_mods ; i++ )
> -    {
> -        mod = &mods->module[i];
> -        if ( mod->kind == kind && mod->start == start )
> -        {
> -            if ( !domU )
> -                mod->domU = false;
> -            return mod;
> -        }
> -    }
> -
> -    mod = &mods->module[mods->nr_mods++];
> -    mod->kind = kind;
> -    mod->start = start;
> -    mod->size = size;
> -    mod->domU = domU;
> -
> -    return mod;
> -}
> -
> -/*
> - * boot_module_find_by_kind can only be used to return Xen modules 
> (e.g
> - * XSM, DTB) or Dom0 modules. This is not suitable for looking up 
> guest
> - * modules.
> - */
> -struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind 
> kind)
> -{
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> -    int i;
> -    for (i = 0 ; i < mods->nr_mods ; i++ )
> -    {
> -        mod = &mods->module[i];
> -        if ( mod->kind == kind && !mod->domU )
> -            return mod;
> -    }
> -    return NULL;
> -}
> -
> -void __init add_boot_cmdline(const char *name, const char *cmdline,
> -                             bootmodule_kind kind, paddr_t start, bool 
> domU)
> -{
> -    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> -    struct bootcmdline *cmd;
> -
> -    if ( cmds->nr_mods == MAX_MODULES )
> -    {
> -        printk("Ignoring %s cmdline (too many)\n", name);
> -        return;
> -    }
> -
> -    cmd = &cmds->cmdline[cmds->nr_mods++];
> -    cmd->kind = kind;
> -    cmd->domU = domU;
> -    cmd->start = start;
> -
> -    ASSERT(strlen(name) <= DT_MAX_NAME);
> -    safe_strcpy(cmd->dt_name, name);
> -
> -    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
> -        panic("module %s command line too long\n", name);
> -    safe_strcpy(cmd->cmdline, cmdline);
> -}
> -
> -/*
> - * boot_cmdline_find_by_kind can only be used to return Xen modules 
> (e.g
> - * XSM, DTB) or Dom0 modules. This is not suitable for looking up 
> guest
> - * modules.
> - */
> -struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind 
> kind)
> -{
> -    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> -    struct bootcmdline *cmd;
> -    int i;
> -
> -    for ( i = 0 ; i < cmds->nr_mods ; i++ )
> -    {
> -        cmd = &cmds->cmdline[i];
> -        if ( cmd->kind == kind && !cmd->domU )
> -            return cmd;
> -    }
> -    return NULL;
> -}
> -
> -struct bootcmdline * __init boot_cmdline_find_by_name(const char 
> *name)
> -{
> -    struct bootcmdlines *mods = &bootinfo.cmdlines;
> -    struct bootcmdline *mod;
> -    unsigned int i;
> -
> -    for (i = 0 ; i < mods->nr_mods ; i++ )
> -    {
> -        mod = &mods->cmdline[i];
> -        if ( strcmp(mod->dt_name, name) == 0 )
> -            return mod;
> -    }
> -    return NULL;
> -}
> -
> -struct bootmodule * __init 
> boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> -                                                             paddr_t 
> start)
> -{
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> -    unsigned int i;
> -
> -    for (i = 0 ; i < mods->nr_mods ; i++ )
> -    {
> -        mod = &mods->module[i];
> -        if ( mod->kind == kind && mod->start == start )
> -            return mod;
> -    }
> -    return NULL;
> -}
> -
> -const char * __init boot_module_kind_as_string(bootmodule_kind kind)
> -{
> -    switch ( kind )
> -    {
> -    case BOOTMOD_XEN:     return "Xen";
> -    case BOOTMOD_FDT:     return "Device Tree";
> -    case BOOTMOD_KERNEL:  return "Kernel";
> -    case BOOTMOD_RAMDISK: return "Ramdisk";
> -    case BOOTMOD_XSM:     return "XSM";
> -    case BOOTMOD_GUEST_DTB:     return "DTB";
> -    case BOOTMOD_UNKNOWN: return "Unknown";
> -    default: BUG();
> -    }
> -}
> -
>  void __init discard_initial_modules(void)
>  {
>      struct bootmodules *mi = &bootinfo.modules;
> @@ -556,40 +239,6 @@ static void * __init relocate_fdt(paddr_t 
> dtb_paddr, size_t dtb_size)
>      return fdt;
>  }
> 
> -/*
> - * Return the end of the non-module region starting at s. In other
> - * words return s the start of the next modules after s.
> - *
> - * On input *end is the end of the region which should be considered
> - * and it is updated to reflect the end of the module, clipped to the
> - * end of the region if it would run over.
> - */
> -static paddr_t __init next_module(paddr_t s, paddr_t *end)
> -{
> -    struct bootmodules *mi = &bootinfo.modules;
> -    paddr_t lowest = ~(paddr_t)0;
> -    int i;
> -
> -    for ( i = 0; i < mi->nr_mods; i++ )
> -    {
> -        paddr_t mod_s = mi->module[i].start;
> -        paddr_t mod_e = mod_s + mi->module[i].size;
> -
> -        if ( !mi->module[i].size )
> -            continue;
> -
> -        if ( mod_s < s )
> -            continue;
> -        if ( mod_s > lowest )
> -            continue;
> -        if ( mod_s > *end )
> -            continue;
> -        lowest = mod_s;
> -        *end = min(*end, mod_e);
> -    }
> -    return lowest;
> -}
> -
>  void __init init_pdx(void)
>  {
>      const struct membanks *mem = bootinfo_get_mem();
> @@ -635,87 +284,6 @@ void __init init_pdx(void)
>      }
>  }
> 
> -/*
> - * Populate the boot allocator.
> - * If a static heap was not provided by the admin, all the RAM but the
> - * following regions will be added:
> - *  - Modules (e.g., Xen, Kernel)
> - *  - Reserved regions
> - *  - Xenheap (arm32 only)
> - * If a static heap was provided by the admin, populate the boot
> - * allocator with the corresponding regions only, but with Xenheap 
> excluded
> - * on arm32.
> - */
> -void __init populate_boot_allocator(void)
> -{
> -    unsigned int i;
> -    const struct membanks *banks = bootinfo_get_mem();
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> -    paddr_t s, e;
> -
> -    if ( bootinfo.static_heap )
> -    {
> -        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
> -        {
> -            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
> -                continue;
> -
> -            s = reserved_mem->bank[i].start;
> -            e = s + reserved_mem->bank[i].size;
> -#ifdef CONFIG_ARM_32
> -            /* Avoid the xenheap, note that the xenheap cannot across 
> a bank */
> -            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
> -                 e >= mfn_to_maddr(directmap_mfn_end) )
> -            {
> -                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
> -                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
> -            }
> -            else
> -#endif
> -                init_boot_pages(s, e);
> -        }
> -
> -        return;
> -    }
> -
> -    for ( i = 0; i < banks->nr_banks; i++ )
> -    {
> -        const struct membank *bank = &banks->bank[i];
> -        paddr_t bank_end = bank->start + bank->size;
> -
> -        s = bank->start;
> -        while ( s < bank_end )
> -        {
> -            paddr_t n = bank_end;
> -
> -            e = next_module(s, &n);
> -
> -            if ( e == ~(paddr_t)0 )
> -                e = n = bank_end;
> -
> -            /*
> -             * Module in a RAM bank other than the one which we are
> -             * not dealing with here.
> -             */
> -            if ( e > bank_end )
> -                e = bank_end;
> -
> -#ifdef CONFIG_ARM_32
> -            /* Avoid the xenheap */
> -            if ( s < mfn_to_maddr(directmap_mfn_end) &&
> -                 mfn_to_maddr(directmap_mfn_start) < e )
> -            {
> -                e = mfn_to_maddr(directmap_mfn_start);
> -                n = mfn_to_maddr(directmap_mfn_end);
> -            }
> -#endif
> -
> -            fw_unreserved_regions(s, e, init_boot_pages, 0);
> -            s = n;
> -        }
> -    }
> -}
> -
>  size_t __read_mostly dcache_line_bytes;
> 
>  /* C entry point for boot CPU */
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index f12a474d40..7e66802a9e 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -6,7 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
> +obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> diff --git a/xen/common/device-tree/Makefile 
> b/xen/common/device-tree/Makefile
> new file mode 100644
> index 0000000000..f813f7555f
> --- /dev/null
> +++ b/xen/common/device-tree/Makefile
> @@ -0,0 +1,2 @@
> +obj-y += bootinfo.init.o
> +obj-y += device-tree.o
> diff --git a/xen/common/device-tree/bootinfo.c 
> b/xen/common/device-tree/bootinfo.c
> new file mode 100644
> index 0000000000..f2e6a1145b
> --- /dev/null
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -0,0 +1,459 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Xen 4.19's $xen/arch/arm/setup.c.
> + *
> + * bookkeeping routines.
> + *
> + * Tim Deegan <tim@xen.org>
> + * Copyright (c) 2011 Citrix Systems.
> + * Copyright (c) 2024 Raptor Engineering LLC
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/bootfdt.h>
> +#include <xen/bug.h>
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/libfdt/libfdt-xen.h>
> +#include <xen/mm.h>
> +
> +struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
> +
> +const char * __init boot_module_kind_as_string(bootmodule_kind kind)
> +{
> +    switch ( kind )
> +    {
> +    case BOOTMOD_XEN:     return "Xen";
> +    case BOOTMOD_FDT:     return "Device Tree";
> +    case BOOTMOD_KERNEL:  return "Kernel";
> +    case BOOTMOD_RAMDISK: return "Ramdisk";
> +    case BOOTMOD_XSM:     return "XSM";
> +    case BOOTMOD_GUEST_DTB:     return "DTB";
> +    case BOOTMOD_UNKNOWN: return "Unknown";
> +    default: BUG();
> +    }
> +}
> +
> +static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> +                                         void (*cb)(paddr_t ps, 
> paddr_t pe),
> +                                         unsigned int first)
> +{
> +    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +#ifdef CONFIG_STATIC_SHM
> +    const struct membanks *shmem = bootinfo_get_shmem();
> +    unsigned int offset;
> +#endif
> +    unsigned int i;
> +
> +    /*
> +     * i is the current bootmodule we are evaluating across all 
> possible
> +     * kinds.
> +     */
> +    for ( i = first; i < reserved_mem->nr_banks; i++ )
> +    {
> +        paddr_t r_s = reserved_mem->bank[i].start;
> +        paddr_t r_e = r_s + reserved_mem->bank[i].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            dt_unreserved_regions(r_e, e, cb, i + 1);
> +            dt_unreserved_regions(s, r_s, cb, i + 1);
> +            return;
> +        }
> +    }
> +
> +#ifdef CONFIG_STATIC_SHM
> +    /*
> +     * When retrieving the corresponding shared memory addresses
> +     * below, we need to index the shmem->bank starting from 0, hence
> +     * we need to use i - reserved_mem->nr_banks.
> +    */
> +    offset = reserved_mem->nr_banks;
> +    for ( ; i - offset < shmem->nr_banks; i++ )
> +    {
> +        paddr_t r_s, r_e;
> +
> +        r_s = shmem->bank[i - offset].start;
> +
> +        /* Shared memory banks can contain INVALID_PADDR as start */
> +        if ( INVALID_PADDR == r_s )
> +            continue;
> +
> +        r_e = r_s + shmem->bank[i - offset].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            dt_unreserved_regions(r_e, e, cb, i + 1);
> +            dt_unreserved_regions(s, r_s, cb, i + 1);
> +            return;
> +        }
> +    }
> +#endif
> +
> +    cb(s, e);
> +}
> +
> +/*
> + * TODO: '*_end' could be 0 if the bank/region is at the end of the 
> physical
> + * address space. This is for now not handled as it requires more 
> rework.
> + */
> +static bool __init meminfo_overlap_check(const struct membanks *mem,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)
> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, bank_num = mem->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = mem->bank[i].start;
> +        bank_end = bank_start + mem->bank[i].size;
> +
> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start 
> ||
> +             region_start >= bank_end )
> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
> with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> +                   region_start, region_end, i, bank_start, bank_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * TODO: '*_end' could be 0 if the module/region is at the end of the 
> physical
> + * address space. This is for now not handled as it requires more 
> rework.
> + */
> +static bool __init bootmodules_overlap_check(struct bootmodules 
> *bootmodules,
> +                                             paddr_t region_start,
> +                                             paddr_t region_size)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
> with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> +                   region_start, region_end, i, mod_start, mod_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +void __init fw_unreserved_regions(paddr_t s, paddr_t e,
> +                                  void (*cb)(paddr_t ps, paddr_t pe),
> +                                  unsigned int first)
> +{
> +    if ( acpi_disabled )
> +        dt_unreserved_regions(s, e, cb, first);
> +    else
> +        cb(s, e);
> +}
> +
> +/*
> + * Given an input physical address range, check if this range is 
> overlapping
> + * with the existing reserved memory regions defined in bootinfo.
> + * Return true if the input physical address range is overlapping with 
> any
> + * existing reserved memory regions, otherwise false.
> + */
> +bool __init check_reserved_regions_overlap(paddr_t region_start,
> +                                           paddr_t region_size)
> +{
> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_reserved_mem(),
> +#ifdef CONFIG_ACPI
> +        bootinfo_get_acpi(),
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +        bootinfo_get_shmem(),
> +#endif
> +    };
> +    unsigned int i;
> +
> +    /*
> +     * Check if input region is overlapping with reserved memory banks 
> or
> +     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or 
> static
> +     * shared memory banks (when static shared memory feature is 
> enabled)
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +        if ( meminfo_overlap_check(mem_banks[i], region_start, 
> region_size) )
> +            return true;
> +
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_overlap_check(&bootinfo.modules,
> +                                   region_start, region_size) )
> +        return true;
> +
> +    return false;
> +}
> +
> +struct bootmodule __init *add_boot_module(bootmodule_kind kind,
> +                                          paddr_t start, paddr_t size,
> +                                          bool domU)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +
> +    if ( mods->nr_mods == MAX_MODULES )
> +    {
> +        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" 
> (too many)\n",
> +               boot_module_kind_as_string(kind), start, start + size);
> +        return NULL;
> +    }
> +
> +    if ( check_reserved_regions_overlap(start, size) )
> +        return NULL;
> +
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        if ( mod->kind == kind && mod->start == start )
> +        {
> +            if ( !domU )
> +                mod->domU = false;
> +            return mod;
> +        }
> +    }
> +
> +    mod = &mods->module[mods->nr_mods++];
> +    mod->kind = kind;
> +    mod->start = start;
> +    mod->size = size;
> +    mod->domU = domU;
> +
> +    return mod;
> +}
> +
> +/*
> + * boot_module_find_by_kind can only be used to return Xen modules 
> (e.g
> + * XSM, DTB) or Dom0 modules. This is not suitable for looking up 
> guest
> + * modules.
> + */
> +struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind 
> kind)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    int i;
> +    for (i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        if ( mod->kind == kind && !mod->domU )
> +            return mod;
> +    }
> +    return NULL;
> +}
> +
> +void __init add_boot_cmdline(const char *name, const char *cmdline,
> +                             bootmodule_kind kind, paddr_t start, bool 
> domU)
> +{
> +    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> +    struct bootcmdline *cmd;
> +
> +    if ( cmds->nr_mods == MAX_MODULES )
> +    {
> +        printk("Ignoring %s cmdline (too many)\n", name);
> +        return;
> +    }
> +
> +    cmd = &cmds->cmdline[cmds->nr_mods++];
> +    cmd->kind = kind;
> +    cmd->domU = domU;
> +    cmd->start = start;
> +
> +    ASSERT(strlen(name) <= DT_MAX_NAME);
> +    safe_strcpy(cmd->dt_name, name);
> +
> +    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
> +        panic("module %s command line too long\n", name);
> +    safe_strcpy(cmd->cmdline, cmdline);
> +}
> +
> +/*
> + * boot_cmdline_find_by_kind can only be used to return Xen modules 
> (e.g
> + * XSM, DTB) or Dom0 modules. This is not suitable for looking up 
> guest
> + * modules.
> + */
> +struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind 
> kind)
> +{
> +    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> +    struct bootcmdline *cmd;
> +    int i;
> +
> +    for ( i = 0 ; i < cmds->nr_mods ; i++ )
> +    {
> +        cmd = &cmds->cmdline[i];
> +        if ( cmd->kind == kind && !cmd->domU )
> +            return cmd;
> +    }
> +    return NULL;
> +}
> +
> +struct bootcmdline * __init boot_cmdline_find_by_name(const char 
> *name)
> +{
> +    struct bootcmdlines *mods = &bootinfo.cmdlines;
> +    struct bootcmdline *mod;
> +    unsigned int i;
> +
> +    for (i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->cmdline[i];
> +        if ( strcmp(mod->dt_name, name) == 0 )
> +            return mod;
> +    }
> +    return NULL;
> +}
> +
> +struct bootmodule * __init 
> boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> +                                                             paddr_t 
> start)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +
> +    for (i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        if ( mod->kind == kind && mod->start == start )
> +            return mod;
> +    }
> +    return NULL;
> +}
> +
> +/*
> + * Return the end of the non-module region starting at s. In other
> + * words return s the start of the next modules after s.
> + *
> + * On input *end is the end of the region which should be considered
> + * and it is updated to reflect the end of the module, clipped to the
> + * end of the region if it would run over.
> + */
> +static paddr_t __init next_module(paddr_t s, paddr_t *end)
> +{
> +    struct bootmodules *mi = &bootinfo.modules;
> +    paddr_t lowest = ~(paddr_t)0;
> +    int i;
> +
> +    for ( i = 0; i < mi->nr_mods; i++ )
> +    {
> +        paddr_t mod_s = mi->module[i].start;
> +        paddr_t mod_e = mod_s + mi->module[i].size;
> +
> +        if ( !mi->module[i].size )
> +            continue;
> +
> +        if ( mod_s < s )
> +            continue;
> +        if ( mod_s > lowest )
> +            continue;
> +        if ( mod_s > *end )
> +            continue;
> +        lowest = mod_s;
> +        *end = min(*end, mod_e);
> +    }
> +    return lowest;
> +}
> +
> +/*
> + * Populate the boot allocator.
> + * If a static heap was not provided by the admin, all the RAM but the
> + * following regions will be added:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + *  - Xenheap (CONFIG_SEPARATE_XENHEAP only)
> + * If a static heap was provided by the admin, populate the boot
> + * allocator with the corresponding regions only, but with Xenheap 
> excluded
> + * on CONFIG_SEPARATE_XENHEAP.
> + */
> +void __init populate_boot_allocator(void)
> +{
> +    unsigned int i;
> +    const struct membanks *banks = bootinfo_get_mem();
> +    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +    paddr_t s, e;
> +
> +    if ( bootinfo.static_heap )
> +    {
> +        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
> +        {
> +            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
> +                continue;
> +
> +            s = reserved_mem->bank[i].start;
> +            e = s + reserved_mem->bank[i].size;
> +#ifdef CONFIG_SEPARATE_XENHEAP
> +            /* Avoid the xenheap, note that the xenheap cannot across 
> a bank */
> +            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
> +                 e >= mfn_to_maddr(directmap_mfn_end) )
> +            {
> +                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
> +                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
> +            }
> +            else
> +#endif
> +                init_boot_pages(s, e);
> +        }
> +
> +        return;
> +    }
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
> +
> +        s = bank->start;
> +        while ( s < bank_end )
> +        {
> +            paddr_t n = bank_end;
> +
> +            e = next_module(s, &n);
> +
> +            if ( e == ~(paddr_t)0 )
> +                e = n = bank_end;
> +
> +            /*
> +             * Module in a RAM bank other than the one which we are
> +             * not dealing with here.
> +             */
> +            if ( e > bank_end )
> +                e = bank_end;
> +
> +#ifdef CONFIG_SEPARATE_XENHEAP
> +            /* Avoid the xenheap */
> +            if ( s < mfn_to_maddr(directmap_mfn_end) &&
> +                 mfn_to_maddr(directmap_mfn_start) < e )
> +            {
> +                e = mfn_to_maddr(directmap_mfn_start);
> +                n = mfn_to_maddr(directmap_mfn_end);
> +            }
> +#endif
> +
> +            fw_unreserved_regions(s, e, init_boot_pages, 0);
> +            s = n;
> +        }
> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/device_tree.c 
> b/xen/common/device-tree/device-tree.c
> similarity index 100%
> rename from xen/common/device_tree.c
> rename to xen/common/device-tree/device-tree.c
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> new file mode 100644
> index 0000000000..c39428d5f5
> --- /dev/null
> +++ b/xen/include/xen/bootfdt.h
> @@ -0,0 +1,195 @@
> +#ifndef XEN_BOOTFDT_H
> +#define XEN_BOOTFDT_H
> +
> +#include <xen/types.h>
> +#include <xen/kernel.h>
> +#include <xen/macros.h>
> +
> +#define MIN_FDT_ALIGN 8
> +
> +#define NR_MEM_BANKS 256
> +#define NR_SHMEM_BANKS 32
> +
> +#define MAX_MODULES 32 /* Current maximum useful modules */
> +
> +typedef enum {
> +    BOOTMOD_XEN,
> +    BOOTMOD_FDT,
> +    BOOTMOD_KERNEL,
> +    BOOTMOD_RAMDISK,
> +    BOOTMOD_XSM,
> +    BOOTMOD_GUEST_DTB,
> +    BOOTMOD_UNKNOWN
> +}  bootmodule_kind;
> +
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for 
> the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM 
> (when
> +     * the bank is in 'mem').
> +     */
> +    MEMBANK_DEFAULT,
> +    /*
> +     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the 
> memory
> +     * bank is bound to a static Xen domain. It is only valid when the 
> bank
> +     * is in reserved_mem.
> +     */
> +    MEMBANK_STATIC_DOMAIN,
> +    /*
> +     * The MEMBANK_STATIC_HEAP type is used to indicate whether the 
> memory
> +     * bank is reserved as static heap. It is only valid when the bank 
> is
> +     * in reserved_mem.
> +     */
> +    MEMBANK_STATIC_HEAP,
> +    /*
> +     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the 
> memory
> +     * bank is from the FDT reserve map.
> +     */
> +    MEMBANK_FDT_RESVMEM,
> +};
> +
> +/* Indicates the maximum number of characters(\0 included) for shm_id 
> */
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
> +/*
> + * The domU flag is set for kernels and ramdisks of "xen,domain" 
> nodes.
> + * The purpose of the domU flag is to avoid getting confused in
> + * kernel_probe, where we try to guess which is the dom0 kernel and
> + * initrd to be compatible with all versions of the multiboot spec.
> + */
> +#define BOOTMOD_MAX_CMDLINE 1024
> +struct bootmodule {
> +    bootmodule_kind kind;
> +    bool domU;
> +    paddr_t start;
> +    paddr_t size;
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
> +    /* The reserved regions are only used when booting using 
> Device-Tree */
> +    struct meminfo reserved_mem;
> +    struct bootmodules modules;
> +    struct bootcmdlines cmdlines;
> +#ifdef CONFIG_ACPI
> +    struct meminfo acpi;
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shmem;
> +#endif
> +    bool static_heap;
> +};
> +
> +#ifdef CONFIG_ACPI
> +#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
> +#else
> +#define BOOTINFO_ACPI_INIT
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
> +#else
> +#define BOOTINFO_SHMEM_INIT
> +#endif
> +
> +#define BOOTINFO_INIT                               \
> +{                                                   \
> +    .mem.common.max_banks = NR_MEM_BANKS,           \
> +    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> +    BOOTINFO_ACPI_INIT                              \
> +    BOOTINFO_SHMEM_INIT                             \
> +}
> +
> +extern struct bootinfo bootinfo;
> +
> +void populate_boot_allocator(void);
> +
> +size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> +
> +const char *boot_fdt_cmdline(const void *fdt);
> +
> +static inline struct membanks *bootinfo_get_reserved_mem(void)
> +{
> +    return container_of(&bootinfo.reserved_mem.common, struct 
> membanks, common);
> +}
> +
> +static inline struct membanks *bootinfo_get_mem(void)
> +{
> +    return container_of(&bootinfo.mem.common, struct membanks, 
> common);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static inline struct membanks *bootinfo_get_acpi(void)
> +{
> +    return container_of(&bootinfo.acpi.common, struct membanks, 
> common);
> +}
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +static inline struct membanks *bootinfo_get_shmem(void)
> +{
> +    return container_of(&bootinfo.shmem.common, struct membanks, 
> common);
> +}
> +
> +static inline struct shmem_membank_extra 
> *bootinfo_get_shmem_extra(void)
> +{
> +    return bootinfo.shmem.extra;
> +}
> +#endif
> +
> +#endif /* XEN_BOOTFDT_H */

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

