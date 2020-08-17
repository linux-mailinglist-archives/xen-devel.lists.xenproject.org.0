Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E32463C3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:50:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bmA-0004S3-Bb; Mon, 17 Aug 2020 09:49:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bm9-00046j-0e
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:57 +0000
X-Inumbo-ID: 5ba70a82-228c-4aea-b628-3c6574037f79
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba70a82-228c-4aea-b628-3c6574037f79;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8EA0AF01;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 12/17] tools/libxc: move xc_[un]map_domain_meminfo()
 into new source xg_domain.c
Date: Mon, 17 Aug 2020 11:49:17 +0200
Message-Id: <20200817094922.15768-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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

Move xc_[un]map_domain_meminfo() functions to new source xg_domain.c as
they are defined in include/xenguest.h and should be in libxenguest.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/Makefile    |   4 +-
 tools/libxc/xc_domain.c | 126 ---------------------------------
 tools/libxc/xg_domain.c | 149 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+), 127 deletions(-)
 create mode 100644 tools/libxc/xg_domain.c

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index c1e41a8ee9..f3f1edc07b 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -52,7 +52,9 @@ CTRL_SRCS-y       += xc_gnttab_compat.c
 CTRL_SRCS-y       += xc_devicemodel_compat.c
 
 GUEST_SRCS-y :=
-GUEST_SRCS-y += xg_private.c xc_suspend.c
+GUEST_SRCS-y += xg_private.c
+GUEST_SRCS-y += xg_domain.c
+GUEST_SRCS-y += xc_suspend.c
 ifeq ($(CONFIG_MIGRATE),y)
 GUEST_SRCS-y += xc_sr_common.c
 GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86.c
diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
index 71829c2bce..fbc22c4df6 100644
--- a/tools/libxc/xc_domain.c
+++ b/tools/libxc/xc_domain.c
@@ -1892,132 +1892,6 @@ int xc_domain_unbind_pt_spi_irq(xc_interface *xch,
                                         PT_IRQ_TYPE_SPI, 0, 0, 0, 0, spi));
 }
 
-int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
-{
-    struct domain_info_context _di = { .guest_width = minfo->guest_width,
-                                       .p2m_size = minfo->p2m_size};
-    struct domain_info_context *dinfo = &_di;
-
-    free(minfo->pfn_type);
-    if ( minfo->p2m_table )
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
-    minfo->p2m_table = NULL;
-
-    return 0;
-}
-
-int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
-                          struct xc_domain_meminfo *minfo)
-{
-    struct domain_info_context _di;
-    struct domain_info_context *dinfo = &_di;
-
-    xc_dominfo_t info;
-    shared_info_any_t *live_shinfo;
-    xen_capabilities_info_t xen_caps = "";
-    int i;
-
-    /* Only be initialized once */
-    if ( minfo->pfn_type || minfo->p2m_table )
-    {
-        errno = EINVAL;
-        return -1;
-    }
-
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
-    {
-        PERROR("Could not get domain info");
-        return -1;
-    }
-
-    if ( xc_domain_get_guest_width(xch, domid, &minfo->guest_width) )
-    {
-        PERROR("Could not get domain address size");
-        return -1;
-    }
-    _di.guest_width = minfo->guest_width;
-
-    /* Get page table levels (see get_platform_info() in xg_save_restore.h */
-    if ( xc_version(xch, XENVER_capabilities, &xen_caps) )
-    {
-        PERROR("Could not get Xen capabilities (for page table levels)");
-        return -1;
-    }
-    if ( strstr(xen_caps, "xen-3.0-x86_64") )
-        /* Depends on whether it's a compat 32-on-64 guest */
-        minfo->pt_levels = ( (minfo->guest_width == 8) ? 4 : 3 );
-    else if ( strstr(xen_caps, "xen-3.0-x86_32p") )
-        minfo->pt_levels = 3;
-    else if ( strstr(xen_caps, "xen-3.0-x86_32") )
-        minfo->pt_levels = 2;
-    else
-    {
-        errno = EFAULT;
-        return -1;
-    }
-
-    /* We need the shared info page for mapping the P2M */
-    live_shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
-                                       info.shared_info_frame);
-    if ( !live_shinfo )
-    {
-        PERROR("Could not map the shared info frame (MFN 0x%lx)",
-               info.shared_info_frame);
-        return -1;
-    }
-
-    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,
-                                       live_shinfo, &minfo->p2m_table,
-                                       &minfo->p2m_size) )
-    {
-        PERROR("Could not map the P2M table");
-        munmap(live_shinfo, PAGE_SIZE);
-        return -1;
-    }
-    munmap(live_shinfo, PAGE_SIZE);
-    _di.p2m_size = minfo->p2m_size;
-
-    /* Make space and prepare for getting the PFN types */
-    minfo->pfn_type = calloc(sizeof(*minfo->pfn_type), minfo->p2m_size);
-    if ( !minfo->pfn_type )
-    {
-        PERROR("Could not allocate memory for the PFN types");
-        goto failed;
-    }
-    for ( i = 0; i < minfo->p2m_size; i++ )
-        minfo->pfn_type[i] = xc_pfn_to_mfn(i, minfo->p2m_table,
-                                           minfo->guest_width);
-
-    /* Retrieve PFN types in batches */
-    for ( i = 0; i < minfo->p2m_size ; i+=1024 )
-    {
-        int count = ((minfo->p2m_size - i ) > 1024 ) ?
-                        1024: (minfo->p2m_size - i);
-
-        if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
-        {
-            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
-            goto failed;
-        }
-    }
-
-    return 0;
-
-failed:
-    if ( minfo->pfn_type )
-    {
-        free(minfo->pfn_type);
-        minfo->pfn_type = NULL;
-    }
-    if ( minfo->p2m_table )
-    {
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
-        minfo->p2m_table = NULL;
-    }
-
-    return -1;
-}
-
 int xc_domain_memory_mapping(
     xc_interface *xch,
     uint32_t domid,
diff --git a/tools/libxc/xg_domain.c b/tools/libxc/xg_domain.c
new file mode 100644
index 0000000000..58713cd35d
--- /dev/null
+++ b/tools/libxc/xg_domain.c
@@ -0,0 +1,149 @@
+/******************************************************************************
+ * xg_domain.c
+ *
+ * API for manipulating and obtaining information on domains.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2003, K A Fraser.
+ */
+
+#include "xg_private.h"
+#include "xc_core.h"
+
+int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
+{
+    struct domain_info_context _di = { .guest_width = minfo->guest_width,
+                                       .p2m_size = minfo->p2m_size};
+    struct domain_info_context *dinfo = &_di;
+
+    free(minfo->pfn_type);
+    if ( minfo->p2m_table )
+        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+    minfo->p2m_table = NULL;
+
+    return 0;
+}
+
+int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
+                          struct xc_domain_meminfo *minfo)
+{
+    struct domain_info_context _di;
+    struct domain_info_context *dinfo = &_di;
+
+    xc_dominfo_t info;
+    shared_info_any_t *live_shinfo;
+    xen_capabilities_info_t xen_caps = "";
+    int i;
+
+    /* Only be initialized once */
+    if ( minfo->pfn_type || minfo->p2m_table )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    {
+        PERROR("Could not get domain info");
+        return -1;
+    }
+
+    if ( xc_domain_get_guest_width(xch, domid, &minfo->guest_width) )
+    {
+        PERROR("Could not get domain address size");
+        return -1;
+    }
+    _di.guest_width = minfo->guest_width;
+
+    /* Get page table levels (see get_platform_info() in xg_save_restore.h */
+    if ( xc_version(xch, XENVER_capabilities, &xen_caps) )
+    {
+        PERROR("Could not get Xen capabilities (for page table levels)");
+        return -1;
+    }
+    if ( strstr(xen_caps, "xen-3.0-x86_64") )
+        /* Depends on whether it's a compat 32-on-64 guest */
+        minfo->pt_levels = ( (minfo->guest_width == 8) ? 4 : 3 );
+    else if ( strstr(xen_caps, "xen-3.0-x86_32p") )
+        minfo->pt_levels = 3;
+    else if ( strstr(xen_caps, "xen-3.0-x86_32") )
+        minfo->pt_levels = 2;
+    else
+    {
+        errno = EFAULT;
+        return -1;
+    }
+
+    /* We need the shared info page for mapping the P2M */
+    live_shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+                                       info.shared_info_frame);
+    if ( !live_shinfo )
+    {
+        PERROR("Could not map the shared info frame (MFN 0x%lx)",
+               info.shared_info_frame);
+        return -1;
+    }
+
+    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,
+                                       live_shinfo, &minfo->p2m_table,
+                                       &minfo->p2m_size) )
+    {
+        PERROR("Could not map the P2M table");
+        munmap(live_shinfo, PAGE_SIZE);
+        return -1;
+    }
+    munmap(live_shinfo, PAGE_SIZE);
+    _di.p2m_size = minfo->p2m_size;
+
+    /* Make space and prepare for getting the PFN types */
+    minfo->pfn_type = calloc(sizeof(*minfo->pfn_type), minfo->p2m_size);
+    if ( !minfo->pfn_type )
+    {
+        PERROR("Could not allocate memory for the PFN types");
+        goto failed;
+    }
+    for ( i = 0; i < minfo->p2m_size; i++ )
+        minfo->pfn_type[i] = xc_pfn_to_mfn(i, minfo->p2m_table,
+                                           minfo->guest_width);
+
+    /* Retrieve PFN types in batches */
+    for ( i = 0; i < minfo->p2m_size ; i+=1024 )
+    {
+        int count = ((minfo->p2m_size - i ) > 1024 ) ?
+                        1024: (minfo->p2m_size - i);
+
+        if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
+        {
+            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
+            goto failed;
+        }
+    }
+
+    return 0;
+
+failed:
+    if ( minfo->pfn_type )
+    {
+        free(minfo->pfn_type);
+        minfo->pfn_type = NULL;
+    }
+    if ( minfo->p2m_table )
+    {
+        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+        minfo->p2m_table = NULL;
+    }
+
+    return -1;
+}
-- 
2.26.2


