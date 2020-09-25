Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D4278078
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLh63-0006LV-Rk; Fri, 25 Sep 2020 06:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLh63-0006JG-1g
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:20:43 +0000
X-Inumbo-ID: a70a1dc4-9c72-40a1-ad6e-b10536132f32
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a70a1dc4-9c72-40a1-ad6e-b10536132f32;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601014836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9uKH7Y1aSUXoEizt0jp5SGpOgTGh6jHR4XevtYTm/k=;
 b=pI96JG8WO6C/fvnIgScyqdVl2c1ddDoNZkGrQ+vVzDDxoSs25jtIIxnWwd/CYfvZ2EwVUY
 UtgBUAQCaWq4YSnmDMYsnzawk/+glpmITUK7yGtHtpnoNI/aLgJOdZpJtctJ1I5OXw1bSA
 IIMkrbNdkHTD/07/Wr+ruT/Da98VvkM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32FEEAB9F;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 1/3] tools/libs: merge xenctrl_dom.h into xenguest.h
Date: Fri, 25 Sep 2020 08:20:29 +0200
Message-Id: <20200925062031.12200-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925062031.12200-1-jgross@suse.com>
References: <20200925062031.12200-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today xenctrl_dom.h is part of libxenctrl as it is included by
xc_private.c. This seems not to be needed, so merge xenctrl_dom.h into
xenguest.h where its contents really should be.

Replace all #includes of xenctrl_dom.h by xenguest.h ones or drop them
if xenguest.h is already included.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/grub/kexec.c                        |   2 +-
 tools/helpers/init-xenstore-domain.c        |   2 +-
 tools/libs/ctrl/Makefile                    |   2 +-
 tools/libs/ctrl/include/xenctrl_dom.h       | 455 --------------------
 tools/libs/ctrl/xc_private.c                |   1 -
 tools/libs/guest/include/xenguest.h         | 426 +++++++++++++++++-
 tools/libs/guest/xg_dom_arm.c               |   1 -
 tools/libs/guest/xg_dom_armzimageloader.c   |   1 -
 tools/libs/guest/xg_dom_binloader.c         |   1 -
 tools/libs/guest/xg_dom_boot.c              |   1 -
 tools/libs/guest/xg_dom_compat_linux.c      |   1 -
 tools/libs/guest/xg_dom_core.c              |   1 -
 tools/libs/guest/xg_dom_decompress.h        |   4 +-
 tools/libs/guest/xg_dom_decompress_unsafe.h |   2 -
 tools/libs/guest/xg_dom_elfloader.c         |   1 -
 tools/libs/guest/xg_dom_hvmloader.c         |   1 -
 tools/libs/guest/xg_dom_x86.c               |   1 -
 tools/libs/guest/xg_offline_page.c          |   1 -
 tools/libs/guest/xg_sr_common.h             |   1 -
 tools/libxl/libxl_arm.c                     |   1 -
 tools/libxl/libxl_arm.h                     |   2 -
 tools/libxl/libxl_create.c                  |   1 -
 tools/libxl/libxl_dm.c                      |   1 -
 tools/libxl/libxl_dom.c                     |   1 -
 tools/libxl/libxl_internal.h                |   1 -
 tools/libxl/libxl_vnuma.c                   |   2 -
 tools/libxl/libxl_x86.c                     |   2 -
 tools/libxl/libxl_x86_acpi.c                |   2 -
 tools/python/xen/lowlevel/xc/xc.c           |   2 +-
 29 files changed, 430 insertions(+), 490 deletions(-)
 delete mode 100644 tools/libs/ctrl/include/xenctrl_dom.h

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index 24001220a9..e9a69d2a32 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -20,7 +20,7 @@
 #include <sys/mman.h>
 
 #include <xenctrl.h>
-#include <xenctrl_dom.h>
+#include <xenguest.h>
 
 #include <kernel.h>
 #include <console.h>
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 5bdb48dc80..bcaa0e6fa9 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -8,7 +8,7 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <xenctrl.h>
-#include <xenctrl_dom.h>
+#include <xenguest.h>
 #include <xenstore.h>
 #include <xen/sys/xenbus_dev.h>
 #include <xen-xsm/flask/flask.h>
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index ec93fb5b73..0071226d2a 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -49,7 +49,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
 # Needed for posix_fadvise64() in xc_linux.c
 CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
 
-LIBHEADER := xenctrl.h xenctrl_compat.h xenctrl_dom.h
+LIBHEADER := xenctrl.h xenctrl_compat.h
 PKG_CONFIG := xencontrol.pc
 PKG_CONFIG_NAME := Xencontrol
 
diff --git a/tools/libs/ctrl/include/xenctrl_dom.h b/tools/libs/ctrl/include/xenctrl_dom.h
deleted file mode 100644
index 40b85b7755..0000000000
--- a/tools/libs/ctrl/include/xenctrl_dom.h
+++ /dev/null
@@ -1,455 +0,0 @@
-/*
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation;
- * version 2.1 of the License.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef _XC_DOM_H
-#define _XC_DOM_H
-
-#include <xen/libelf/libelf.h>
-
-#define X86_HVM_NR_SPECIAL_PAGES    8
-#define X86_HVM_END_SPECIAL_REGION  0xff000u
-#define XG_MAX_MODULES 2
-
-/* --- typedefs and structs ---------------------------------------- */
-
-typedef uint64_t xen_vaddr_t;
-typedef uint64_t xen_paddr_t;
-
-#define PRIpfn PRI_xen_pfn
-
-struct xc_dom_seg {
-    xen_vaddr_t vstart;
-    xen_vaddr_t vend;
-    xen_pfn_t pfn;
-    xen_pfn_t pages;
-};
-
-struct xc_hvm_firmware_module {
-    uint8_t  *data;
-    uint32_t  length;
-    uint64_t  guest_addr_out;
-};
-
-struct xc_dom_mem {
-    struct xc_dom_mem *next;
-    void *ptr;
-    enum {
-        XC_DOM_MEM_TYPE_MALLOC_INTERNAL,
-        XC_DOM_MEM_TYPE_MALLOC_EXTERNAL,
-        XC_DOM_MEM_TYPE_MMAP,
-    } type;
-    size_t len;
-    unsigned char memory[0];
-};
-
-struct xc_dom_phys {
-    struct xc_dom_phys *next;
-    void *ptr;
-    xen_pfn_t first;
-    xen_pfn_t count;
-};
-
-struct xc_dom_module {
-    void *blob;
-    size_t size;
-    void *cmdline;
-    /* If seg.vstart is non zero then the module will be loaded at that
-     * address, otherwise it will automatically placed.
-     *
-     * If automatic placement is used and the module is gzip
-     * compressed then it will be decompressed as it is loaded. If the
-     * module has been explicitly placed then it is loaded as is
-     * otherwise decompressing risks undoing the manual placement.
-     */
-    struct xc_dom_seg seg;
-};
-
-struct xc_dom_image {
-    /* files */
-    void *kernel_blob;
-    size_t kernel_size;
-    unsigned int num_modules;
-    struct xc_dom_module modules[XG_MAX_MODULES];
-    void *devicetree_blob;
-    size_t devicetree_size;
-
-    size_t max_kernel_size;
-    size_t max_module_size;
-    size_t max_devicetree_size;
-
-    /* arguments and parameters */
-    char *cmdline;
-    size_t cmdline_size;
-    uint32_t f_requested[XENFEAT_NR_SUBMAPS];
-
-    /* info from (elf) kernel image */
-    struct elf_dom_parms parms;
-    char *guest_type;
-
-    /* memory layout */
-    struct xc_dom_seg kernel_seg;
-    struct xc_dom_seg p2m_seg;
-    struct xc_dom_seg pgtables_seg;
-    struct xc_dom_seg devicetree_seg;
-    struct xc_dom_seg start_info_seg;
-    xen_pfn_t start_info_pfn;
-    xen_pfn_t console_pfn;
-    xen_pfn_t xenstore_pfn;
-    xen_pfn_t shared_info_pfn;
-    xen_pfn_t bootstack_pfn;
-    xen_pfn_t pfn_alloc_end;
-    xen_vaddr_t virt_alloc_end;
-    xen_vaddr_t bsd_symtab_start;
-
-    /*
-     * initrd parameters as specified in start_info page
-     * Depending on capabilities of the booted kernel this may be a virtual
-     * address or a pfn. Type is neutral and large enough to hold a virtual
-     * address of a 64 bit kernel even with 32 bit toolstack.
-     */
-    uint64_t initrd_start;
-    uint64_t initrd_len;
-
-    unsigned int alloc_bootstack;
-    xen_vaddr_t virt_pgtab_end;
-
-    /* other state info */
-    uint32_t f_active[XENFEAT_NR_SUBMAPS];
-
-    /*
-     * pv_p2m is specific to x86 PV guests, and maps GFNs to MFNs.  It is
-     * eventually copied into guest context.
-     */
-    xen_pfn_t *pv_p2m;
-
-    /* physical memory
-     *
-     * An x86 PV guest has one or more blocks of physical RAM,
-     * consisting of total_pages starting at 0. The start address and
-     * size of each block is controlled by vNUMA structures.
-     *
-     * An ARM guest has GUEST_RAM_BANKS regions of RAM, with
-     * rambank_size[i] pages in each. The lowest RAM address
-     * (corresponding to the base of the p2m arrays above) is stored
-     * in rambase_pfn.
-     */
-    xen_pfn_t rambase_pfn;
-    xen_pfn_t total_pages;
-    xen_pfn_t p2m_size;         /* number of pfns covered by p2m */
-    struct xc_dom_phys *phys_pages;
-#if defined (__arm__) || defined(__aarch64__)
-    xen_pfn_t rambank_size[GUEST_RAM_BANKS];
-#endif
-
-    /* malloc memory pool */
-    struct xc_dom_mem *memblocks;
-
-    /* memory footprint stats */
-    size_t alloc_malloc;
-    size_t alloc_mem_map;
-    size_t alloc_file_map;
-    size_t alloc_domU_map;
-
-    /* misc xen domain config stuff */
-    unsigned long flags;
-    unsigned int console_evtchn;
-    unsigned int xenstore_evtchn;
-    uint32_t console_domid;
-    uint32_t xenstore_domid;
-    xen_pfn_t shared_info_mfn;
-
-    xc_interface *xch;
-    uint32_t guest_domid;
-    int claim_enabled; /* 0 by default, 1 enables it */
-
-    int xen_version;
-    xen_capabilities_info_t xen_caps;
-
-    /* kernel loader, arch hooks */
-    struct xc_dom_loader *kernel_loader;
-    void *private_loader;
-
-    /* vNUMA information */
-    xen_vmemrange_t *vmemranges;
-    unsigned int nr_vmemranges;
-    unsigned int *vnode_to_pnode;
-    unsigned int nr_vnodes;
-
-    /* domain type/architecture specific data */
-    void *arch_private;
-
-    /* kernel loader */
-    struct xc_dom_arch *arch_hooks;
-    /* allocate up to pfn_alloc_end */
-    int (*allocate) (struct xc_dom_image * dom);
-
-    /* Container type (HVM or PV). */
-    enum {
-        XC_DOM_PV_CONTAINER,
-        XC_DOM_HVM_CONTAINER,
-    } container_type;
-
-    /* HVM specific fields. */
-    xen_pfn_t target_pages;
-    xen_paddr_t mmio_start;
-    xen_paddr_t mmio_size;
-    xen_paddr_t lowmem_end;
-    xen_paddr_t highmem_end;
-    xen_pfn_t vga_hole_size;
-
-    /* If unset disables the setup of the IOREQ pages. */
-    bool device_model;
-
-    /* BIOS/Firmware passed to HVMLOADER */
-    struct xc_hvm_firmware_module system_firmware_module;
-
-    /* Extra ACPI tables */
-#define MAX_ACPI_MODULES        4
-    struct xc_hvm_firmware_module acpi_modules[MAX_ACPI_MODULES];
-
-    /* Extra SMBIOS structures passed to HVMLOADER */
-    struct xc_hvm_firmware_module smbios_module;
-
-#if defined(__i386__) || defined(__x86_64__)
-    struct e820entry *e820;
-    unsigned int e820_entries;
-#endif
-
-    xen_pfn_t vuart_gfn;
-
-    /* Number of vCPUs */
-    unsigned int max_vcpus;
-};
-
-/* --- pluggable kernel loader ------------------------------------- */
-
-struct xc_dom_loader {
-    char *name;
-    /* Sadly the error returns from these functions are not consistent: */
-    elf_negerrnoval (*probe) (struct xc_dom_image * dom);
-    elf_negerrnoval (*parser) (struct xc_dom_image * dom);
-    elf_errorstatus (*loader) (struct xc_dom_image * dom);
-
-    struct xc_dom_loader *next;
-};
-
-#define __init __attribute__ ((constructor))
-void xc_dom_register_loader(struct xc_dom_loader *loader);
-
-/* --- arch specific hooks ----------------------------------------- */
-
-struct xc_dom_arch {
-    int (*alloc_magic_pages) (struct xc_dom_image * dom);
-
-    /* pagetable setup - x86 PV only */
-    int (*alloc_pgtables) (struct xc_dom_image * dom);
-    int (*alloc_p2m_list) (struct xc_dom_image * dom);
-    int (*setup_pgtables) (struct xc_dom_image * dom);
-
-    /* arch-specific data structs setup */
-    /* in Mini-OS environment start_info might be a macro, avoid collision. */
-#undef start_info
-    int (*start_info) (struct xc_dom_image * dom);
-    int (*shared_info) (struct xc_dom_image * dom, void *shared_info);
-    int (*vcpu) (struct xc_dom_image * dom);
-    int (*bootearly) (struct xc_dom_image * dom);
-    int (*bootlate) (struct xc_dom_image * dom);
-
-    /* arch-specific memory initialization. */
-    int (*meminit) (struct xc_dom_image * dom);
-
-    char *guest_type;
-    char *native_protocol;
-    int page_shift;
-    int sizeof_pfn;
-    int p2m_base_supported;
-    int arch_private_size;
-
-    struct xc_dom_arch *next;
-};
-void xc_dom_register_arch_hooks(struct xc_dom_arch *hooks);
-
-#define XC_DOM_PAGE_SHIFT(dom)  ((dom)->arch_hooks->page_shift)
-#define XC_DOM_PAGE_SIZE(dom)   (1LL << (dom)->arch_hooks->page_shift)
-
-/* --- main functions ---------------------------------------------- */
-
-struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
-                                     const char *cmdline, const char *features);
-void xc_dom_release_phys(struct xc_dom_image *dom);
-void xc_dom_release(struct xc_dom_image *dom);
-int xc_dom_rambase_init(struct xc_dom_image *dom, uint64_t rambase);
-int xc_dom_mem_init(struct xc_dom_image *dom, unsigned int mem_mb);
-
-/* Set this larger if you have enormous modules/kernels. Note that
- * you should trust all kernels not to be maliciously large (e.g. to
- * exhaust all dom0 memory) if you do this (see CVE-2012-4544 /
- * XSA-25). You can also set the default independently for
- * modules/kernels in xc_dom_allocate() or call
- * xc_dom_{kernel,module}_max_size.
- */
-#ifndef XC_DOM_DECOMPRESS_MAX
-#define XC_DOM_DECOMPRESS_MAX (1024*1024*1024) /* 1GB */
-#endif
-
-int xc_dom_kernel_check_size(struct xc_dom_image *dom, size_t sz);
-int xc_dom_kernel_max_size(struct xc_dom_image *dom, size_t sz);
-
-int xc_dom_module_max_size(struct xc_dom_image *dom, size_t sz);
-
-int xc_dom_devicetree_max_size(struct xc_dom_image *dom, size_t sz);
-
-size_t xc_dom_check_gzip(xc_interface *xch,
-                     void *blob, size_t ziplen);
-int xc_dom_do_gunzip(xc_interface *xch,
-                     void *src, size_t srclen, void *dst, size_t dstlen);
-int xc_dom_try_gunzip(struct xc_dom_image *dom, void **blob, size_t * size);
-
-int xc_dom_kernel_file(struct xc_dom_image *dom, const char *filename);
-int xc_dom_module_file(struct xc_dom_image *dom, const char *filename,
-                       const char *cmdline);
-int xc_dom_kernel_mem(struct xc_dom_image *dom, const void *mem,
-                      size_t memsize);
-int xc_dom_module_mem(struct xc_dom_image *dom, const void *mem,
-                       size_t memsize, const char *cmdline);
-int xc_dom_devicetree_file(struct xc_dom_image *dom, const char *filename);
-int xc_dom_devicetree_mem(struct xc_dom_image *dom, const void *mem,
-                          size_t memsize);
-
-int xc_dom_parse_image(struct xc_dom_image *dom);
-int xc_dom_set_arch_hooks(struct xc_dom_image *dom);
-int xc_dom_build_image(struct xc_dom_image *dom);
-
-int xc_dom_boot_xen_init(struct xc_dom_image *dom, xc_interface *xch,
-                         uint32_t domid);
-int xc_dom_boot_mem_init(struct xc_dom_image *dom);
-void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
-                           xen_pfn_t count);
-int xc_dom_boot_image(struct xc_dom_image *dom);
-int xc_dom_compat_check(struct xc_dom_image *dom);
-int xc_dom_gnttab_init(struct xc_dom_image *dom);
-int xc_dom_gnttab_seed(xc_interface *xch, uint32_t guest_domid,
-                       bool is_hvm,
-                       xen_pfn_t console_gfn,
-                       xen_pfn_t xenstore_gfn,
-                       uint32_t console_domid,
-                       uint32_t xenstore_domid);
-bool xc_dom_translated(const struct xc_dom_image *dom);
-
-/* --- debugging bits ---------------------------------------------- */
-
-int xc_dom_loginit(xc_interface *xch);
-
-void xc_dom_printf(xc_interface *xch, const char *fmt, ...)
-     __attribute__ ((format(printf, 2, 3)));
-void xc_dom_panic_func(xc_interface *xch,
-                      const char *file, int line, xc_error_code err,
-                      const char *fmt, ...)
-    __attribute__ ((format(printf, 5, 6)));
-
-#define xc_dom_panic(xch, err, fmt, args...) \
-    xc_dom_panic_func(xch, __FILE__, __LINE__, err, fmt, ## args)
-#define xc_dom_trace(mark) \
-    xc_dom_printf("%s:%d: trace %s\n", __FILE__, __LINE__, mark)
-
-void xc_dom_log_memory_footprint(struct xc_dom_image *dom);
-
-/* --- simple memory pool ------------------------------------------ */
-
-void *xc_dom_malloc(struct xc_dom_image *dom, size_t size);
-int xc_dom_register_external(struct xc_dom_image *dom, void *ptr, size_t size);
-void *xc_dom_malloc_page_aligned(struct xc_dom_image *dom, size_t size);
-void *xc_dom_malloc_filemap(struct xc_dom_image *dom,
-                            const char *filename, size_t * size,
-                            const size_t max_size);
-char *xc_dom_strdup(struct xc_dom_image *dom, const char *str);
-
-/* --- alloc memory pool ------------------------------------------- */
-
-xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, char *name);
-int xc_dom_alloc_segment(struct xc_dom_image *dom,
-                         struct xc_dom_seg *seg, char *name,
-                         xen_vaddr_t start, xen_vaddr_t size);
-
-/* --- misc bits --------------------------------------------------- */
-
-void *xc_dom_pfn_to_ptr(struct xc_dom_image *dom, xen_pfn_t first,
-                        xen_pfn_t count);
-void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image *dom, xen_pfn_t first,
-                                 xen_pfn_t count, xen_pfn_t *count_out);
-void xc_dom_unmap_one(struct xc_dom_image *dom, xen_pfn_t pfn);
-void xc_dom_unmap_all(struct xc_dom_image *dom);
-
-static inline void *xc_dom_seg_to_ptr_pages(struct xc_dom_image *dom,
-                                      struct xc_dom_seg *seg,
-                                      xen_pfn_t *pages_out)
-{
-    void *retval;
-
-    retval = xc_dom_pfn_to_ptr(dom, seg->pfn, seg->pages);
-
-    *pages_out = retval ? seg->pages : 0;
-    return retval;
-}
-
-static inline void *xc_dom_seg_to_ptr(struct xc_dom_image *dom,
-                                      struct xc_dom_seg *seg)
-{
-    xen_pfn_t dummy;
-
-    return xc_dom_seg_to_ptr_pages(dom, seg, &dummy);
-}
-
-static inline void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
-                                        xen_vaddr_t vaddr,
-                                        size_t *safe_region_out)
-{
-    unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
-    xen_pfn_t page = (vaddr - dom->parms.virt_base) / page_size;
-    unsigned int offset = (vaddr - dom->parms.virt_base) % page_size;
-    xen_pfn_t safe_region_count;
-    void *ptr;
-
-    *safe_region_out = 0;
-    ptr = xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count);
-    if ( ptr == NULL )
-        return ptr;
-    *safe_region_out = (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) - offset;
-    return ptr + offset;
-}
-
-static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
-{
-    if ( xc_dom_translated(dom) )
-        return pfn;
-
-    /* x86 PV only now. */
-    if ( pfn >= dom->total_pages )
-        return INVALID_MFN;
-
-    return dom->pv_p2m[pfn];
-}
-
-#endif /* _XC_DOM_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 8af96b1b7e..ef3ef53fbd 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -18,7 +18,6 @@
  */
 
 #include "xc_private.h"
-#include "xenctrl_dom.h"
 #include <stdarg.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
index 4643384790..279f06345c 100644
--- a/tools/libs/guest/include/xenguest.h
+++ b/tools/libs/guest/include/xenguest.h
@@ -22,7 +22,7 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
-#include <xenctrl_dom.h>
+#include <xen/libelf/libelf.h>
 
 #define XC_NUMA_NO_NODE   (~0U)
 
@@ -32,6 +32,430 @@
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
 
+#define X86_HVM_NR_SPECIAL_PAGES    8
+#define X86_HVM_END_SPECIAL_REGION  0xff000u
+#define XG_MAX_MODULES 2
+
+/* --- typedefs and structs ---------------------------------------- */
+
+typedef uint64_t xen_vaddr_t;
+typedef uint64_t xen_paddr_t;
+
+#define PRIpfn PRI_xen_pfn
+
+struct xc_dom_seg {
+    xen_vaddr_t vstart;
+    xen_vaddr_t vend;
+    xen_pfn_t pfn;
+    xen_pfn_t pages;
+};
+
+struct xc_hvm_firmware_module {
+    uint8_t  *data;
+    uint32_t  length;
+    uint64_t  guest_addr_out;
+};
+
+struct xc_dom_mem {
+    struct xc_dom_mem *next;
+    void *ptr;
+    enum {
+        XC_DOM_MEM_TYPE_MALLOC_INTERNAL,
+        XC_DOM_MEM_TYPE_MALLOC_EXTERNAL,
+        XC_DOM_MEM_TYPE_MMAP,
+    } type;
+    size_t len;
+    unsigned char memory[0];
+};
+
+struct xc_dom_phys {
+    struct xc_dom_phys *next;
+    void *ptr;
+    xen_pfn_t first;
+    xen_pfn_t count;
+};
+
+struct xc_dom_module {
+    void *blob;
+    size_t size;
+    void *cmdline;
+    /* If seg.vstart is non zero then the module will be loaded at that
+     * address, otherwise it will automatically placed.
+     *
+     * If automatic placement is used and the module is gzip
+     * compressed then it will be decompressed as it is loaded. If the
+     * module has been explicitly placed then it is loaded as is
+     * otherwise decompressing risks undoing the manual placement.
+     */
+    struct xc_dom_seg seg;
+};
+
+struct xc_dom_image {
+    /* files */
+    void *kernel_blob;
+    size_t kernel_size;
+    unsigned int num_modules;
+    struct xc_dom_module modules[XG_MAX_MODULES];
+    void *devicetree_blob;
+    size_t devicetree_size;
+
+    size_t max_kernel_size;
+    size_t max_module_size;
+    size_t max_devicetree_size;
+
+    /* arguments and parameters */
+    char *cmdline;
+    size_t cmdline_size;
+    uint32_t f_requested[XENFEAT_NR_SUBMAPS];
+
+    /* info from (elf) kernel image */
+    struct elf_dom_parms parms;
+    char *guest_type;
+
+    /* memory layout */
+    struct xc_dom_seg kernel_seg;
+    struct xc_dom_seg p2m_seg;
+    struct xc_dom_seg pgtables_seg;
+    struct xc_dom_seg devicetree_seg;
+    struct xc_dom_seg start_info_seg;
+    xen_pfn_t start_info_pfn;
+    xen_pfn_t console_pfn;
+    xen_pfn_t xenstore_pfn;
+    xen_pfn_t shared_info_pfn;
+    xen_pfn_t bootstack_pfn;
+    xen_pfn_t pfn_alloc_end;
+    xen_vaddr_t virt_alloc_end;
+    xen_vaddr_t bsd_symtab_start;
+
+    /*
+     * initrd parameters as specified in start_info page
+     * Depending on capabilities of the booted kernel this may be a virtual
+     * address or a pfn. Type is neutral and large enough to hold a virtual
+     * address of a 64 bit kernel even with 32 bit toolstack.
+     */
+    uint64_t initrd_start;
+    uint64_t initrd_len;
+
+    unsigned int alloc_bootstack;
+    xen_vaddr_t virt_pgtab_end;
+
+    /* other state info */
+    uint32_t f_active[XENFEAT_NR_SUBMAPS];
+
+    /*
+     * pv_p2m is specific to x86 PV guests, and maps GFNs to MFNs.  It is
+     * eventually copied into guest context.
+     */
+    xen_pfn_t *pv_p2m;
+
+    /* physical memory
+     *
+     * An x86 PV guest has one or more blocks of physical RAM,
+     * consisting of total_pages starting at 0. The start address and
+     * size of each block is controlled by vNUMA structures.
+     *
+     * An ARM guest has GUEST_RAM_BANKS regions of RAM, with
+     * rambank_size[i] pages in each. The lowest RAM address
+     * (corresponding to the base of the p2m arrays above) is stored
+     * in rambase_pfn.
+     */
+    xen_pfn_t rambase_pfn;
+    xen_pfn_t total_pages;
+    xen_pfn_t p2m_size;         /* number of pfns covered by p2m */
+    struct xc_dom_phys *phys_pages;
+#if defined (__arm__) || defined(__aarch64__)
+    xen_pfn_t rambank_size[GUEST_RAM_BANKS];
+#endif
+
+    /* malloc memory pool */
+    struct xc_dom_mem *memblocks;
+
+    /* memory footprint stats */
+    size_t alloc_malloc;
+    size_t alloc_mem_map;
+    size_t alloc_file_map;
+    size_t alloc_domU_map;
+
+    /* misc xen domain config stuff */
+    unsigned long flags;
+    unsigned int console_evtchn;
+    unsigned int xenstore_evtchn;
+    uint32_t console_domid;
+    uint32_t xenstore_domid;
+    xen_pfn_t shared_info_mfn;
+
+    xc_interface *xch;
+    uint32_t guest_domid;
+    int claim_enabled; /* 0 by default, 1 enables it */
+
+    int xen_version;
+    xen_capabilities_info_t xen_caps;
+
+    /* kernel loader, arch hooks */
+    struct xc_dom_loader *kernel_loader;
+    void *private_loader;
+
+    /* vNUMA information */
+    xen_vmemrange_t *vmemranges;
+    unsigned int nr_vmemranges;
+    unsigned int *vnode_to_pnode;
+    unsigned int nr_vnodes;
+
+    /* domain type/architecture specific data */
+    void *arch_private;
+
+    /* kernel loader */
+    struct xc_dom_arch *arch_hooks;
+    /* allocate up to pfn_alloc_end */
+    int (*allocate) (struct xc_dom_image * dom);
+
+    /* Container type (HVM or PV). */
+    enum {
+        XC_DOM_PV_CONTAINER,
+        XC_DOM_HVM_CONTAINER,
+    } container_type;
+
+    /* HVM specific fields. */
+    xen_pfn_t target_pages;
+    xen_paddr_t mmio_start;
+    xen_paddr_t mmio_size;
+    xen_paddr_t lowmem_end;
+    xen_paddr_t highmem_end;
+    xen_pfn_t vga_hole_size;
+
+    /* If unset disables the setup of the IOREQ pages. */
+    bool device_model;
+
+    /* BIOS/Firmware passed to HVMLOADER */
+    struct xc_hvm_firmware_module system_firmware_module;
+
+    /* Extra ACPI tables */
+#define MAX_ACPI_MODULES        4
+    struct xc_hvm_firmware_module acpi_modules[MAX_ACPI_MODULES];
+
+    /* Extra SMBIOS structures passed to HVMLOADER */
+    struct xc_hvm_firmware_module smbios_module;
+
+#if defined(__i386__) || defined(__x86_64__)
+    struct e820entry *e820;
+    unsigned int e820_entries;
+#endif
+
+    xen_pfn_t vuart_gfn;
+
+    /* Number of vCPUs */
+    unsigned int max_vcpus;
+};
+
+/* --- pluggable kernel loader ------------------------------------- */
+
+struct xc_dom_loader {
+    char *name;
+    /* Sadly the error returns from these functions are not consistent: */
+    elf_negerrnoval (*probe) (struct xc_dom_image * dom);
+    elf_negerrnoval (*parser) (struct xc_dom_image * dom);
+    elf_errorstatus (*loader) (struct xc_dom_image * dom);
+
+    struct xc_dom_loader *next;
+};
+
+#define __init __attribute__ ((constructor))
+void xc_dom_register_loader(struct xc_dom_loader *loader);
+
+/* --- arch specific hooks ----------------------------------------- */
+
+struct xc_dom_arch {
+    int (*alloc_magic_pages) (struct xc_dom_image * dom);
+
+    /* pagetable setup - x86 PV only */
+    int (*alloc_pgtables) (struct xc_dom_image * dom);
+    int (*alloc_p2m_list) (struct xc_dom_image * dom);
+    int (*setup_pgtables) (struct xc_dom_image * dom);
+
+    /* arch-specific data structs setup */
+    /* in Mini-OS environment start_info might be a macro, avoid collision. */
+#undef start_info
+    int (*start_info) (struct xc_dom_image * dom);
+    int (*shared_info) (struct xc_dom_image * dom, void *shared_info);
+    int (*vcpu) (struct xc_dom_image * dom);
+    int (*bootearly) (struct xc_dom_image * dom);
+    int (*bootlate) (struct xc_dom_image * dom);
+
+    /* arch-specific memory initialization. */
+    int (*meminit) (struct xc_dom_image * dom);
+
+    char *guest_type;
+    char *native_protocol;
+    int page_shift;
+    int sizeof_pfn;
+    int p2m_base_supported;
+    int arch_private_size;
+
+    struct xc_dom_arch *next;
+};
+void xc_dom_register_arch_hooks(struct xc_dom_arch *hooks);
+
+#define XC_DOM_PAGE_SHIFT(dom)  ((dom)->arch_hooks->page_shift)
+#define XC_DOM_PAGE_SIZE(dom)   (1LL << (dom)->arch_hooks->page_shift)
+
+/* --- main functions ---------------------------------------------- */
+
+struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
+                                     const char *cmdline, const char *features);
+void xc_dom_release_phys(struct xc_dom_image *dom);
+void xc_dom_release(struct xc_dom_image *dom);
+int xc_dom_rambase_init(struct xc_dom_image *dom, uint64_t rambase);
+int xc_dom_mem_init(struct xc_dom_image *dom, unsigned int mem_mb);
+
+/* Set this larger if you have enormous modules/kernels. Note that
+ * you should trust all kernels not to be maliciously large (e.g. to
+ * exhaust all dom0 memory) if you do this (see CVE-2012-4544 /
+ * XSA-25). You can also set the default independently for
+ * modules/kernels in xc_dom_allocate() or call
+ * xc_dom_{kernel,module}_max_size.
+ */
+#ifndef XC_DOM_DECOMPRESS_MAX
+#define XC_DOM_DECOMPRESS_MAX (1024*1024*1024) /* 1GB */
+#endif
+
+int xc_dom_kernel_check_size(struct xc_dom_image *dom, size_t sz);
+int xc_dom_kernel_max_size(struct xc_dom_image *dom, size_t sz);
+
+int xc_dom_module_max_size(struct xc_dom_image *dom, size_t sz);
+
+int xc_dom_devicetree_max_size(struct xc_dom_image *dom, size_t sz);
+
+size_t xc_dom_check_gzip(xc_interface *xch,
+                     void *blob, size_t ziplen);
+int xc_dom_do_gunzip(xc_interface *xch,
+                     void *src, size_t srclen, void *dst, size_t dstlen);
+int xc_dom_try_gunzip(struct xc_dom_image *dom, void **blob, size_t * size);
+
+int xc_dom_kernel_file(struct xc_dom_image *dom, const char *filename);
+int xc_dom_module_file(struct xc_dom_image *dom, const char *filename,
+                       const char *cmdline);
+int xc_dom_kernel_mem(struct xc_dom_image *dom, const void *mem,
+                      size_t memsize);
+int xc_dom_module_mem(struct xc_dom_image *dom, const void *mem,
+                       size_t memsize, const char *cmdline);
+int xc_dom_devicetree_file(struct xc_dom_image *dom, const char *filename);
+int xc_dom_devicetree_mem(struct xc_dom_image *dom, const void *mem,
+                          size_t memsize);
+
+int xc_dom_parse_image(struct xc_dom_image *dom);
+int xc_dom_set_arch_hooks(struct xc_dom_image *dom);
+int xc_dom_build_image(struct xc_dom_image *dom);
+
+int xc_dom_boot_xen_init(struct xc_dom_image *dom, xc_interface *xch,
+                         uint32_t domid);
+int xc_dom_boot_mem_init(struct xc_dom_image *dom);
+void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
+                           xen_pfn_t count);
+int xc_dom_boot_image(struct xc_dom_image *dom);
+int xc_dom_compat_check(struct xc_dom_image *dom);
+int xc_dom_gnttab_init(struct xc_dom_image *dom);
+int xc_dom_gnttab_seed(xc_interface *xch, uint32_t guest_domid,
+                       bool is_hvm,
+                       xen_pfn_t console_gfn,
+                       xen_pfn_t xenstore_gfn,
+                       uint32_t console_domid,
+                       uint32_t xenstore_domid);
+bool xc_dom_translated(const struct xc_dom_image *dom);
+
+/* --- debugging bits ---------------------------------------------- */
+
+int xc_dom_loginit(xc_interface *xch);
+
+void xc_dom_printf(xc_interface *xch, const char *fmt, ...)
+     __attribute__ ((format(printf, 2, 3)));
+void xc_dom_panic_func(xc_interface *xch,
+                      const char *file, int line, xc_error_code err,
+                      const char *fmt, ...)
+    __attribute__ ((format(printf, 5, 6)));
+
+#define xc_dom_panic(xch, err, fmt, args...) \
+    xc_dom_panic_func(xch, __FILE__, __LINE__, err, fmt, ## args)
+#define xc_dom_trace(mark) \
+    xc_dom_printf("%s:%d: trace %s\n", __FILE__, __LINE__, mark)
+
+void xc_dom_log_memory_footprint(struct xc_dom_image *dom);
+
+/* --- simple memory pool ------------------------------------------ */
+
+void *xc_dom_malloc(struct xc_dom_image *dom, size_t size);
+int xc_dom_register_external(struct xc_dom_image *dom, void *ptr, size_t size);
+void *xc_dom_malloc_page_aligned(struct xc_dom_image *dom, size_t size);
+void *xc_dom_malloc_filemap(struct xc_dom_image *dom,
+                            const char *filename, size_t * size,
+                            const size_t max_size);
+char *xc_dom_strdup(struct xc_dom_image *dom, const char *str);
+
+/* --- alloc memory pool ------------------------------------------- */
+
+xen_pfn_t xc_dom_alloc_page(struct xc_dom_image *dom, char *name);
+int xc_dom_alloc_segment(struct xc_dom_image *dom,
+                         struct xc_dom_seg *seg, char *name,
+                         xen_vaddr_t start, xen_vaddr_t size);
+
+/* --- misc bits --------------------------------------------------- */
+
+void *xc_dom_pfn_to_ptr(struct xc_dom_image *dom, xen_pfn_t first,
+                        xen_pfn_t count);
+void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image *dom, xen_pfn_t first,
+                                 xen_pfn_t count, xen_pfn_t *count_out);
+void xc_dom_unmap_one(struct xc_dom_image *dom, xen_pfn_t pfn);
+void xc_dom_unmap_all(struct xc_dom_image *dom);
+
+static inline void *xc_dom_seg_to_ptr_pages(struct xc_dom_image *dom,
+                                      struct xc_dom_seg *seg,
+                                      xen_pfn_t *pages_out)
+{
+    void *retval;
+
+    retval = xc_dom_pfn_to_ptr(dom, seg->pfn, seg->pages);
+
+    *pages_out = retval ? seg->pages : 0;
+    return retval;
+}
+
+static inline void *xc_dom_seg_to_ptr(struct xc_dom_image *dom,
+                                      struct xc_dom_seg *seg)
+{
+    xen_pfn_t dummy;
+
+    return xc_dom_seg_to_ptr_pages(dom, seg, &dummy);
+}
+
+static inline void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
+                                        xen_vaddr_t vaddr,
+                                        size_t *safe_region_out)
+{
+    unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
+    xen_pfn_t page = (vaddr - dom->parms.virt_base) / page_size;
+    unsigned int offset = (vaddr - dom->parms.virt_base) % page_size;
+    xen_pfn_t safe_region_count;
+    void *ptr;
+
+    *safe_region_out = 0;
+    ptr = xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count);
+    if ( ptr == NULL )
+        return ptr;
+    *safe_region_out = (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) - offset;
+    return ptr + offset;
+}
+
+static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
+{
+    if ( xc_dom_translated(dom) )
+        return pfn;
+
+    /* x86 PV only now. */
+    if ( pfn >= dom->total_pages )
+        return INVALID_MFN;
+
+    return dom->pv_p2m[pfn];
+}
+
 /*
  * User not using xc_suspend_* / xc_await_suspent may not want to
  * include the full libxenevtchn API here.
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 3f66f1d890..615fc109b9 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -24,7 +24,6 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 
 #define NR_MAGIC_PAGES 4
 #define CONSOLE_PFN_OFFSET 0
diff --git a/tools/libs/guest/xg_dom_armzimageloader.c b/tools/libs/guest/xg_dom_armzimageloader.c
index 4246c8e5fa..ec42036ad2 100644
--- a/tools/libs/guest/xg_dom_armzimageloader.c
+++ b/tools/libs/guest/xg_dom_armzimageloader.c
@@ -25,7 +25,6 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 
 #include <arpa/inet.h> /* XXX ntohl is not the right function... */
 
diff --git a/tools/libs/guest/xg_dom_binloader.c b/tools/libs/guest/xg_dom_binloader.c
index 870a921427..ccc23b388f 100644
--- a/tools/libs/guest/xg_dom_binloader.c
+++ b/tools/libs/guest/xg_dom_binloader.c
@@ -83,7 +83,6 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 
 #define round_pgup(_p)    (((_p)+(PAGE_SIZE_X86-1))&PAGE_MASK_X86)
 #define round_pgdown(_p)  ((_p)&PAGE_MASK_X86)
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 1e31e92244..827f1ffccd 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -31,7 +31,6 @@
 #include <zlib.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 #include "xc_core.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
diff --git a/tools/libs/guest/xg_dom_compat_linux.c b/tools/libs/guest/xg_dom_compat_linux.c
index b645f0b14b..a0d9c7a04e 100644
--- a/tools/libs/guest/xg_dom_compat_linux.c
+++ b/tools/libs/guest/xg_dom_compat_linux.c
@@ -30,7 +30,6 @@
 
 #include "xenctrl.h"
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 
 /* ------------------------------------------------------------------------ */
 
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index 1c91cce315..c0d4a0aa2f 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -32,7 +32,6 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 #include "_paths.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libs/guest/xg_dom_decompress.h b/tools/libs/guest/xg_dom_decompress.h
index c5ab2e59eb..d7a45f730d 100644
--- a/tools/libs/guest/xg_dom_decompress.h
+++ b/tools/libs/guest/xg_dom_decompress.h
@@ -1,6 +1,4 @@
-#ifndef __MINIOS__
-# include "xenctrl_dom.h"
-#else
+#ifdef __MINIOS__
 # include "xg_dom_decompress_unsafe.h"
 #endif
 
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
index fb84b6add8..5dc18c896e 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -1,5 +1,3 @@
-#include "xenctrl_dom.h"
-
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
                           int (*flush)(void*, unsigned int),
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 7043c3bbba..851930f039 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -26,7 +26,6 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 #define XEN_VER "xen-3.0"
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index 995a0f3dc3..f3deedec41 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -26,7 +26,6 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 842dbcccdd..876802e2ed 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -38,7 +38,6 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xenctrl_dom.h"
 #include "xenctrl.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index 77e8889b11..d4722f0e8c 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -28,7 +28,6 @@
 #include <xc_core.h>
 
 #include "xc_private.h"
-#include "xenctrl_dom.h"
 #include "xg_private.h"
 #include "xg_save_restore.h"
 
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 13fcc47420..cc3ad1c394 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -5,7 +5,6 @@
 
 #include "xg_private.h"
 #include "xg_save_restore.h"
-#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 #include "xg_sr_stream_format.h"
diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 975a4d730a..66e8a065fe 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -3,7 +3,6 @@
 #include "libxl_libfdt_compat.h"
 #include "libxl_arm.h"
 
-#include <xenctrl_dom.h>
 #include <stdbool.h>
 #include <libfdt.h>
 #include <assert.h>
diff --git a/tools/libxl/libxl_arm.h b/tools/libxl/libxl_arm.h
index 52c2ab5e3a..4feca217ee 100644
--- a/tools/libxl/libxl_arm.h
+++ b/tools/libxl/libxl_arm.h
@@ -17,8 +17,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xenctrl_dom.h>
-
 _hidden
 int libxl__prepare_acpi(libxl__gc *gc, libxl_domain_build_info *info,
                         struct xc_dom_image *dom);
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 1031b75159..9a6e92b3a5 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -20,7 +20,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xenctrl_dom.h>
 #include <xenguest.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index fec4e0fbe5..a944181781 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -19,7 +19,6 @@
 
 #include "libxl_internal.h"
 
-#include <xenctrl_dom.h>
 #include <xen/hvm/e820.h>
 #include <sys/types.h>
 #include <pwd.h>
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index 597a6826d1..01d989a976 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -20,7 +20,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xenctrl_dom.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index e16ae9630b..2b69b8e9d9 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -57,7 +57,6 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <xenhypfs.h>
-#include <xenctrl_dom.h>
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxl/libxl_vnuma.c b/tools/libxl/libxl_vnuma.c
index c2e144ceae..d181574782 100644
--- a/tools/libxl/libxl_vnuma.c
+++ b/tools/libxl/libxl_vnuma.c
@@ -17,8 +17,6 @@
 #include "libxl_arch.h"
 #include <stdlib.h>
 
-#include <xenctrl_dom.h>
-
 bool libxl__vnuma_configured(const libxl_domain_build_info *b_info)
 {
     return b_info->num_vnuma_nodes != 0;
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index 7d95506e00..6ec6c27c83 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -1,8 +1,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xenctrl_dom.h>
-
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
index 3df86c7be5..1a4e9e98de 100644
--- a/tools/libxl/libxl_x86_acpi.c
+++ b/tools/libxl/libxl_x86_acpi.c
@@ -18,8 +18,6 @@
 #include <xen/hvm/e820.h>
 #include "libacpi/libacpi.h"
 
-#include <xenctrl_dom.h>
-
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
 
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index ce123f0409..13a7603809 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -7,6 +7,7 @@
 #include <Python.h>
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
+#include <xenguest.h>
 #include <fcntl.h>
 #include <netinet/in.h>
 #include <netinet/tcp.h>
@@ -17,7 +18,6 @@
 #include <arpa/inet.h>
 
 #include <xen/elfnote.h>
-#include "xenctrl_dom.h"
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/params.h>
 
-- 
2.26.2


