Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1903B2FE4A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088819.1446570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Au-0006nv-P5; Thu, 21 Aug 2025 15:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088819.1446570; Thu, 21 Aug 2025 15:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Au-0006iw-Dy; Thu, 21 Aug 2025 15:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1088819;
 Thu, 21 Aug 2025 15:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=palF=3B=bounce.vates.tech=bounce-md_30504962.68a73a82.v1-5565b7a84c614179b7558ba46b71cf8f@srs-se1.protection.inumbo.net>)
 id 1up7As-0005na-HO
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:58 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21836de1-7ea3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:25:56 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bQ0wjWzBsVD76
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5565b7a84c614179b7558ba46b71cf8f; Thu, 21 Aug 2025 15:25:54 +0000
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
X-Inumbo-ID: 21836de1-7ea3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789954; x=1756059954;
	bh=v9693aJ0tIn6PL/KSvi73SLKMBRME6s7Oodg2Swvg4k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iMHqtkLQWTccEKocnJ30gS94aO+FZnLgcKSPFIynoxhB5ye68HSCIWqqBgTI6648J
	 5PpdV7fXBTZ5+WY8MI7P6ZswZb8QT90Ou/S6fw7U349KlZIq+GnZRQbv24etXFW+8s
	 2TM3TEEsVgrPl3eBuyIBNBsrmqDZssHEKOOtpscJXc2oEbvXz4T9jY47Ntvos17siZ
	 J2lhV/AshFpx0f67qYVuCZbLWckervw1ZXrpZd5SXsfaxKcczchYJLUqwZJxCafYp5
	 yigRqUb+DExo0OMyo++ljNrnLznCo4sUKpcT6R9IetgxAS+cAxOLAM+xpjAogWxWjt
	 OS1RC6hNp1uDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789954; x=1756050454; i=teddy.astie@vates.tech;
	bh=v9693aJ0tIn6PL/KSvi73SLKMBRME6s7Oodg2Swvg4k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iH0BcE+QR1Uaoadh/SSpJyDJOpz7rEZOK9PHZRIcQcd7FQSuoHHsEP9YxnK6YLBJF
	 V9CZB7oqLjRzXWdUlCzhIzsOKBiYhkRHsQeXqSYpzn66U8dQneGlzgvNiEWWaZQYe5
	 N9/BPKoE+PMlOavuOwQdJ3idbHJ6kFXgKdokA1kZNnaN659ikq3g0JQq8nK5NqIOd3
	 DpAwBE/G0BStKl4dcWA5I0oD2QN5jBF4XihFwXY3/4mTxKix0hgOdw4JGkhbzUAvsr
	 SaV2sx1/QWthMhj0M6D4qYJ2WSDhOInkIvEWLpdQSJbY1n4E5Y4jioWoJkEXqB8z7+
	 /IzqH+tX3xp0w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=204/9]=20hvm:=20Introduce=20"fixed=20memory=20layout"=20feature?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789952853
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>
Message-Id: <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5565b7a84c614179b7558ba46b71cf8f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently, guests needs to explicitely map their shared info and
grant table through hypercalls. It has proved to be complicated
and had been traditionally placed in the Xen PCI Platform device
BAR, but has caused confusions regarding MTRR [1].

Introduce a optional feature to let the toolstack map these pages in
advance, and exposing their location through the memory map (i.e E820).

When this feature is active, guests are expected to not invalidate such
mappings (e.g by calling xen_remove_from_physmap); as they may be used
by the operating system or firmware (i.e OVMF).

Moreover, this feature is useful to allow having a working guest without
having to expose to it physmap manipulation.

[1] https://lore.kernel.org/xen-devel/20250610162930.89055-1-roger.pau@citrix.com/

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 .../x86/fixed-memory-layout.pandoc            | 24 ++++++
 docs/guest-guide/x86/index.rst                |  1 +
 tools/include/xen-tools/common-macros.h       |  4 +
 tools/libs/guest/xg_dom_x86.c                 | 84 +++++++++++++++++++
 tools/libs/light/libxl_create.c               |  1 +
 tools/libs/light/libxl_types.idl              |  1 +
 tools/libs/light/libxl_x86.c                  | 71 ++++++++++++++++
 tools/xl/xl_parse.c                           |  1 +
 xen/include/public/arch-x86/hvm/start_info.h  |  7 ++
 9 files changed, 194 insertions(+)
 create mode 100644 docs/guest-guide/x86/fixed-memory-layout.pandoc

diff --git a/docs/guest-guide/x86/fixed-memory-layout.pandoc b/docs/guest-guide/x86/fixed-memory-layout.pandoc
new file mode 100644
index 0000000000..b394dc1cff
--- /dev/null
+++ b/docs/guest-guide/x86/fixed-memory-layout.pandoc
@@ -0,0 +1,24 @@
+# Fixed memory layout
+
+When creating a guest with "fixed_mem_layout", the guest has additional special
+pages mapped in advance. These mappings may be required in some cases due to FastABI
+not providing the ability for the guest to modify its physical memory layout (which is
+usually used to map the shared info page or the grant table).
+
+The guest is informed of such mappings and their location through the memory map using
+Xen specific memory map types (in the OEM range of ACPI specification).
+
+It's expected that these mappings stay stable, therefore, the guest shouldn't try to
+modify such mappings as it may be actively used by guest firmware or operating system.
+
+    /* Xen-specific types (OEM-specific range of the ACPI spec) */
+    #define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page */
+    #define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages */
+    #define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
+    #define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
+                                                         /* and foreign mappings */
+
+These mappings are likely to be placed outside the 4G range.
+
+XEN_HVM_MEMMAP_TYPE_FOREIGN_REG is a special region which doesn't contain any mapping,
+but is safe to use for placing grant and foreign mappings.
diff --git a/docs/guest-guide/x86/index.rst b/docs/guest-guide/x86/index.rst
index 502968490d..6927271e53 100644
--- a/docs/guest-guide/x86/index.rst
+++ b/docs/guest-guide/x86/index.rst
@@ -7,3 +7,4 @@ x86
    :maxdepth: 2
 
    hypercall-abi
+   fixed-memory-layout
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 0088208c2e..8b286b3da5 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -72,6 +72,10 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef DIV_ROUNDUP
+#define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
+#endif
+
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae..ab1c5063a4 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -624,6 +624,82 @@ static void build_hvm_info(void *hvm_info_page, struct xc_dom_image *dom)
     hvm_info->checksum = -sum;
 }
 
+/* Prepare special (shared_info, grant table, ...) regions marked in E820. */
+static int prepare_fixed_special_regions(xc_interface *xch, struct xc_dom_image *dom)
+{
+    int rc = 0; unsigned int i;
+    uint32_t domid = dom->guest_domid;
+    gnttab_query_size_t gnttab_query;
+    size_t gnttab_frame_count, gnttab_status_frame_count;
+    
+    gnttab_query.dom = domid;
+    rc = xc_gnttab_query_size(xch, &gnttab_query);
+
+    if ( rc != 0 || gnttab_query.status != GNTST_okay )
+    {
+        DOMPRINTF("Unable to query grant table size.");
+        return rc;
+    }
+
+    gnttab_frame_count = gnttab_query.max_nr_frames;
+    gnttab_status_frame_count = DIV_ROUNDUP(
+        gnttab_frame_count * (XC_DOM_PAGE_SIZE(dom) / sizeof(grant_entry_v2_t)),
+        XC_DOM_PAGE_SIZE(dom) / sizeof(grant_status_t));
+
+    for ( i = 0; i < dom->e820_entries; i++ )
+    {
+        struct e820entry entry = dom->e820[i];
+        rc = 0;
+
+        switch ( entry.type ) {
+        case XEN_HVM_MEMMAP_TYPE_SHARED_INFO:
+            rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_shared_info,
+                                          0, entry.addr >> PAGE_SHIFT);
+            break;
+        case XEN_HVM_MEMMAP_TYPE_GRANT_TABLE:
+            if ( gnttab_frame_count != entry.size >> PAGE_SHIFT )
+            {
+                DOMPRINTF("Invalid grant table memmap region size");
+                return -EINVAL;
+            }
+
+            for ( i = 0; i < gnttab_frame_count; i++ )
+            {
+                rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_grant_table, i,
+                                              (entry.addr >> PAGE_SHIFT) + i);
+                
+                if ( rc !=  0 )
+                    break;
+            }
+            break;
+        case XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS:
+        {
+            if ( gnttab_status_frame_count != entry.size >> PAGE_SHIFT )
+            {
+                DOMPRINTF("Invalid grant table status memmap region size");
+                return -EINVAL;
+            }
+
+            for ( i = 0; i < gnttab_status_frame_count; i++ )
+            {
+                rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_grant_table,
+                                              i | XENMAPIDX_grant_table_status,
+                                              (entry.addr >> PAGE_SHIFT) + i);
+                
+                if ( rc !=  0 )
+                    break;
+            }
+            break;
+        }
+        }
+
+        if ( rc != 0 )
+            break;
+    }
+
+    return rc;
+}
+
 static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
 {
     unsigned long i;
@@ -718,6 +794,14 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
         goto out;
     }
 
+    rc = prepare_fixed_special_regions(xch, dom);
+
+    if ( rc != 0 )
+    {
+        DOMPRINTF("Unable to prepare fixed special regions");
+        goto out;
+    }
+
     /*
      * Identity-map page table is required for running with CR0.PG=0 when
      * using Intel EPT. Create a 32-bit non-PAE page directory of superpages.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8a85fba1cf..5e23e122fc 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2363,6 +2363,7 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
      * configuration.
      */
     libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true);
+    libxl_defbool_setdefault(&d_config->b_info.arch_x86.fixed_mem_layout, false);
     libxl_defbool_setdefault(&d_config->b_info.u.hvm.pirq, true);
 
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a3a79d12b2..74edfdebc1 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -727,6 +727,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("fixed_mem_layout", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60d4e8661c..de19f722ab 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -1,6 +1,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 #include <xen/arch-x86/cpuid.h>
+#include <xen/arch-x86/hvm/start_info.h>
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -50,6 +51,10 @@ static const char *e820_names(int type)
         case E820_ACPI: return "ACPI";
         case E820_NVS: return "ACPI NVS";
         case E820_UNUSABLE: return "Unusable";
+        case XEN_HVM_MEMMAP_TYPE_SHARED_INFO: return "HVM Shared Info";
+        case XEN_HVM_MEMMAP_TYPE_GRANT_TABLE: return "HVM Grant Table";
+        case XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS: return "HVM Grant Status";
+        case XEN_HVM_MEMMAP_TYPE_FOREIGN_REG: return "HVM Foreign mapping region";
         default: break;
     }
     return "Unknown";
@@ -686,10 +691,31 @@ static int domain_construct_memmap(libxl__gc *gc,
     /* We always own at least one lowmem entry. */
     unsigned int e820_entries = 1;
     struct e820entry *e820 = NULL;
+    uint64_t highmem_start = ((uint64_t)1 << 32);
     uint64_t highmem_size =
                     dom->highmem_end ? dom->highmem_end - (1ull << 32) : 0;
     uint32_t lowmem_start = dom->device_model ? GUEST_LOW_MEM_START_DEFAULT : 0;
     unsigned page_size = XC_DOM_PAGE_SIZE(dom);
+    /* Special region starts at the first 1G boundary after the highmem */
+    uint64_t special_region_start =
+        (highmem_start + highmem_size + GB(1) - 1) & ~(GB(1) - 1);
+    uint64_t special_region_offset = special_region_start;
+    size_t gnttab_frame_count, gnttab_status_frame_count;
+    gnttab_query_size_t gnttab_query;
+
+    gnttab_query.dom = domid;
+    rc = xc_gnttab_query_size(dom->xch, &gnttab_query);
+
+    if (rc != 0 || gnttab_query.status != GNTST_okay)
+    {
+        gnttab_frame_count = 0;
+        gnttab_status_frame_count = 0;
+    }
+
+    gnttab_frame_count = gnttab_query.max_nr_frames;
+    gnttab_status_frame_count = DIV_ROUNDUP(
+        gnttab_frame_count * (page_size / sizeof(grant_entry_v2_t)),
+        page_size / sizeof(grant_status_t));
 
     /* Add all rdm entries. */
     for (i = 0; i < d_config->num_rdms; i++)
@@ -703,6 +729,16 @@ static int domain_construct_memmap(libxl__gc *gc,
     /* If we should have a highmem range. */
     if (highmem_size)
         e820_entries++;
+    
+    if (libxl_defbool_val(d_config->b_info.arch_x86.fixed_mem_layout))
+    {
+        e820_entries++; /* XEN_HVM_MEMMAP_TYPE_SHARED_INFO */
+        if ( gnttab_frame_count )
+            e820_entries++; /* XEN_HVM_MEMMAP_TYPE_GRANT_TABLE */
+        if (d_config->b_info.max_grant_version >= 2 && gnttab_status_frame_count)
+            e820_entries++; /* XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS status */
+        e820_entries++; /* XEN_HVM_MEMMAP_TYPE_FOREIGN_REG */
+    }
 
     for (i = 0; i < MAX_ACPI_MODULES; i++)
         if (dom->acpi_modules[i].length)
@@ -769,6 +805,40 @@ static int domain_construct_memmap(libxl__gc *gc,
         e820[nr].type = E820_RAM;
     }
 
+    /* Special regions */
+    if (libxl_defbool_val(d_config->b_info.arch_x86.fixed_mem_layout))
+    {
+        e820[nr].type = XEN_HVM_MEMMAP_TYPE_SHARED_INFO;
+        e820[nr].addr = special_region_offset;
+        e820[nr].size = page_size;
+        special_region_offset += e820[nr].size;
+        nr++;
+
+        if ( gnttab_frame_count )
+        {
+            e820[nr].type = XEN_HVM_MEMMAP_TYPE_GRANT_TABLE;
+            e820[nr].addr = special_region_offset;
+            e820[nr].size = gnttab_frame_count * page_size;
+            special_region_offset += e820[nr].size;
+            nr++;
+        }
+
+        if (d_config->b_info.max_grant_version >= 2 && gnttab_status_frame_count)
+        {
+            e820[nr].type = XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS;
+            e820[nr].addr = special_region_offset;
+            e820[nr].size = gnttab_status_frame_count * page_size;
+            special_region_offset += e820[nr].size;
+            nr++;
+        }
+
+        e820[nr].type = XEN_HVM_MEMMAP_TYPE_FOREIGN_REG;
+        e820[nr].addr = special_region_offset;
+        e820[nr].size = MB(512);
+        special_region_offset += e820[nr].size;
+        nr++;
+    }
+
     if (xc_domain_set_memory_map(CTX->xch, domid, e820, e820_entries) != 0) {
         rc = ERROR_FAIL;
         goto out;
@@ -819,6 +889,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
+    libxl_defbool_setdefault(&b_info->arch_x86.fixed_mem_layout, false);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         /*
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 7e11c62ba0..a74cc577e9 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2992,6 +2992,7 @@ skip_usbdev:
                     "WARNING: msr_relaxed will be removed in future versions.\n"
                     "If it fixes an issue you are having please report to "
                     "xen-devel@lists.xenproject.org.\n");
+    xlu_cfg_get_defbool(config, "fixed_mem_layout", &b_info->arch_x86.fixed_mem_layout, 0);
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
diff --git a/xen/include/public/arch-x86/hvm/start_info.h b/xen/include/public/arch-x86/hvm/start_info.h
index e33557c0b4..0b3dfe91af 100644
--- a/xen/include/public/arch-x86/hvm/start_info.h
+++ b/xen/include/public/arch-x86/hvm/start_info.h
@@ -99,6 +99,13 @@
 #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
 #define XEN_HVM_MEMMAP_TYPE_PMEM      7
 
+/* Xen-specific types (OEM-specific range of the ACPI spec) */
+#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page */
+#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages */
+#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
+#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
+                                                     /* and foreign mappings */
+
 /*
  * C representation of the x86/HVM start info layout.
  *
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


