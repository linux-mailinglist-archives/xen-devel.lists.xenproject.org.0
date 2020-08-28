Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19429255DC1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:22:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgCw-00008n-Ff; Fri, 28 Aug 2020 15:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzl-0004eL-J8
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:49 +0000
X-Inumbo-ID: 820c01cc-571d-4eed-95e0-b0e0bd70b196
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 820c01cc-571d-4eed-95e0-b0e0bd70b196;
 Fri, 28 Aug 2020 15:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A4B3AF83;
 Fri, 28 Aug 2020 15:08:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 15/31] tools/libxc: untangle libxenctrl from libxenguest
Date: Fri, 28 Aug 2020 17:07:31 +0200
Message-Id: <20200828150747.25305-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

Sources of libxenctrl and libxenguest are completely entangled. In
practice libxenguest is a user of libxenctrl, so don't let any source
libxenctrl include xg_private.h.

This can be achieved by moving all definitions used by libxenctrl from
xg_private.h to xc_private.h.

Export xenctrl_dom.h as it will now be included by other public
headers.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxc/Makefile              |  3 ++-
 tools/libxc/include/xenctrl_dom.h | 10 +++++++--
 tools/libxc/include/xenguest.h    |  8 ++-----
 tools/libxc/xc_core.c             |  5 +++--
 tools/libxc/xc_core.h             |  2 +-
 tools/libxc/xc_core_arm.c         |  2 +-
 tools/libxc/xc_core_x86.c         |  6 ++----
 tools/libxc/xc_domain.c           |  3 +--
 tools/libxc/xc_hcall_buf.c        |  1 -
 tools/libxc/xc_private.c          |  1 -
 tools/libxc/xc_private.h          | 36 +++++++++++++++++++++++++++++++
 tools/libxc/xc_resume.c           |  2 --
 tools/libxc/xg_private.h          | 22 -------------------
 tools/libxc/xg_save_restore.h     |  9 --------
 14 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index 0fd5511143..faf2639894 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -215,7 +215,7 @@ install: build
 	$(INSTALL_DATA) libxenctrl.a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
 	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenctrl.so
-	$(INSTALL_DATA) include/xenctrl.h include/xenctrl_compat.h $(DESTDIR)$(includedir)
+	$(INSTALL_DATA) include/xenctrl.h include/xenctrl_compat.h include/xenctrl_dom.h $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
 	$(INSTALL_DATA) libxenguest.a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
@@ -235,6 +235,7 @@ uninstall:
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xencontrol.pc
 	rm -f $(DESTDIR)$(includedir)/xenctrl.h
 	rm -f $(DESTDIR)$(includedir)/xenctrl_compat.h
+	rm -f $(DESTDIR)$(includedir)/xenctrl_dom.h
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR).$(MINOR)
diff --git a/tools/libxc/include/xenctrl_dom.h b/tools/libxc/include/xenctrl_dom.h
index 52a4d6c8c0..40b85b7755 100644
--- a/tools/libxc/include/xenctrl_dom.h
+++ b/tools/libxc/include/xenctrl_dom.h
@@ -17,9 +17,7 @@
 #define _XC_DOM_H
 
 #include <xen/libelf/libelf.h>
-#include <xenguest.h>
 
-#define INVALID_PFN ((xen_pfn_t)-1)
 #define X86_HVM_NR_SPECIAL_PAGES    8
 #define X86_HVM_END_SPECIAL_REGION  0xff000u
 #define XG_MAX_MODULES 2
@@ -38,6 +36,12 @@ struct xc_dom_seg {
     xen_pfn_t pages;
 };
 
+struct xc_hvm_firmware_module {
+    uint8_t  *data;
+    uint32_t  length;
+    uint64_t  guest_addr_out;
+};
+
 struct xc_dom_mem {
     struct xc_dom_mem *next;
     void *ptr;
@@ -255,6 +259,8 @@ struct xc_dom_arch {
     int (*setup_pgtables) (struct xc_dom_image * dom);
 
     /* arch-specific data structs setup */
+    /* in Mini-OS environment start_info might be a macro, avoid collision. */
+#undef start_info
     int (*start_info) (struct xc_dom_image * dom);
     int (*shared_info) (struct xc_dom_image * dom, void *shared_info);
     int (*vcpu) (struct xc_dom_image * dom);
diff --git a/tools/libxc/include/xenguest.h b/tools/libxc/include/xenguest.h
index 7a12d21ff2..4643384790 100644
--- a/tools/libxc/include/xenguest.h
+++ b/tools/libxc/include/xenguest.h
@@ -22,6 +22,8 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
+#include <xenctrl_dom.h>
+
 #define XC_NUMA_NO_NODE   (~0U)
 
 #define XCFLAGS_LIVE      (1 << 0)
@@ -249,12 +251,6 @@ int xc_linux_build(xc_interface *xch,
                    unsigned int console_evtchn,
                    unsigned long *console_mfn);
 
-struct xc_hvm_firmware_module {
-    uint8_t  *data;
-    uint32_t  length;
-    uint64_t  guest_addr_out;
-};
-
 /*
  * Sets *lockfd to -1.
  * Has deallocated everything even on error.
diff --git a/tools/libxc/xc_core.c b/tools/libxc/xc_core.c
index 7df1fccd62..e8c6fb96f9 100644
--- a/tools/libxc/xc_core.c
+++ b/tools/libxc/xc_core.c
@@ -60,12 +60,13 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
-#include "xenctrl_dom.h"
 #include <stdlib.h>
 #include <unistd.h>
 
+#include <xen/libelf/libelf.h>
+
 /* number of pages to write at a time */
 #define DUMP_INCREMENT (4 * 1024)
 
diff --git a/tools/libxc/xc_core.h b/tools/libxc/xc_core.h
index ed7ed53ca5..36fb755da2 100644
--- a/tools/libxc/xc_core.h
+++ b/tools/libxc/xc_core.h
@@ -21,7 +21,7 @@
 #define XC_CORE_H
 
 #include "xen/version.h"
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xen/libelf/elfstructs.h"
 
 /* section names */
diff --git a/tools/libxc/xc_core_arm.c b/tools/libxc/xc_core_arm.c
index c3c492c971..7b587b4cc5 100644
--- a/tools/libxc/xc_core_arm.c
+++ b/tools/libxc/xc_core_arm.c
@@ -16,7 +16,7 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
 
 #include <xen-tools/libs.h>
diff --git a/tools/libxc/xc_core_x86.c b/tools/libxc/xc_core_x86.c
index 54852a2d1a..cb76e6207b 100644
--- a/tools/libxc/xc_core_x86.c
+++ b/tools/libxc/xc_core_x86.c
@@ -17,12 +17,10 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
 #include <xen/hvm/e820.h>
 
-#define GET_FIELD(_p, _f) ((dinfo->guest_width==8) ? ((_p)->x64._f) : ((_p)->x32._f))
-
 int
 xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
                               unsigned long pfn)
@@ -98,7 +96,7 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc
 
     live_p2m_frame_list_list =
         xc_map_foreign_range(xch, dom, PAGE_SIZE, PROT_READ,
-                             GET_FIELD(live_shinfo, arch.pfn_to_mfn_frame_list_list));
+                             GET_FIELD(live_shinfo, arch.pfn_to_mfn_frame_list_list, dinfo->guest_width));
 
     if ( !live_p2m_frame_list_list )
     {
diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
index fbc22c4df6..43fab50c06 100644
--- a/tools/libxc/xc_domain.c
+++ b/tools/libxc/xc_domain.c
@@ -21,8 +21,7 @@
 
 #include "xc_private.h"
 #include "xc_core.h"
-#include "xg_private.h"
-#include "xg_save_restore.h"
+#include "xc_private.h"
 #include <xen/memory.h>
 #include <xen/hvm/hvm_op.h>
 
diff --git a/tools/libxc/xc_hcall_buf.c b/tools/libxc/xc_hcall_buf.c
index c1230a1e2b..200671f36f 100644
--- a/tools/libxc/xc_hcall_buf.c
+++ b/tools/libxc/xc_hcall_buf.c
@@ -19,7 +19,6 @@
 #include <string.h>
 
 #include "xc_private.h"
-#include "xg_private.h"
 
 xc_hypercall_buffer_t XC__HYPERCALL_BUFFER_NAME(HYPERCALL_BUFFER_NULL) = {
     .hbuf = NULL,
diff --git a/tools/libxc/xc_private.c b/tools/libxc/xc_private.c
index 6ecdf6953f..8af96b1b7e 100644
--- a/tools/libxc/xc_private.c
+++ b/tools/libxc/xc_private.c
@@ -18,7 +18,6 @@
  */
 
 #include "xc_private.h"
-#include "xg_private.h"
 #include "xenctrl_dom.h"
 #include <stdarg.h>
 #include <stdlib.h>
diff --git a/tools/libxc/xc_private.h b/tools/libxc/xc_private.h
index c77edb3c4c..f0b5f83ac8 100644
--- a/tools/libxc/xc_private.h
+++ b/tools/libxc/xc_private.h
@@ -26,6 +26,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <stdlib.h>
+#include <limits.h>
 #include <sys/ioctl.h>
 
 #include "_paths.h"
@@ -62,6 +63,39 @@ struct iovec {
 #include <sys/uio.h>
 #endif
 
+#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
+
+#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
+
+#define SET_FIELD(_p, _f, _v, _w) do {          \
+    if ((_w) == 8)                              \
+        (_p)->x64._f = (_v);                    \
+    else                                        \
+        (_p)->x32._f = (_v);                    \
+} while (0)
+
+/* XXX SMH: following skanky macros rely on variable p2m_size being set */
+/* XXX TJD: also, "guest_width" should be the guest's sizeof(unsigned long) */
+
+struct domain_info_context {
+    unsigned int guest_width;
+    unsigned long p2m_size;
+};
+
+/* Number of xen_pfn_t in a page */
+#define FPP             (PAGE_SIZE/(dinfo->guest_width))
+
+/* Number of entries in the pfn_to_mfn_frame_list_list */
+#define P2M_FLL_ENTRIES (((dinfo->p2m_size)+(FPP*FPP)-1)/(FPP*FPP))
+
+/* Number of entries in the pfn_to_mfn_frame_list */
+#define P2M_FL_ENTRIES  (((dinfo->p2m_size)+FPP-1)/FPP)
+
+/* Size in bytes of the pfn_to_mfn_frame_list     */
+#define P2M_GUEST_FL_SIZE ((P2M_FL_ENTRIES) * (dinfo->guest_width))
+#define P2M_TOOLS_FL_SIZE ((P2M_FL_ENTRIES) *                           \
+                           max_t(size_t, sizeof(xen_pfn_t), dinfo->guest_width))
+
 #define DECLARE_DOMCTL struct xen_domctl domctl
 #define DECLARE_SYSCTL struct xen_sysctl sysctl
 #define DECLARE_PHYSDEV_OP struct physdev_op physdev_op
@@ -75,6 +109,8 @@ struct iovec {
 #define PAGE_SIZE               XC_PAGE_SIZE
 #define PAGE_MASK               XC_PAGE_MASK
 
+#define INVALID_PFN ((xen_pfn_t)-1)
+
 /*
 ** Define max dirty page cache to permit during save/restore -- need to balance 
 ** keeping cache usage down with CPU impact of invalidating too often.
diff --git a/tools/libxc/xc_resume.c b/tools/libxc/xc_resume.c
index c169204fac..94c6c9fb31 100644
--- a/tools/libxc/xc_resume.c
+++ b/tools/libxc/xc_resume.c
@@ -14,8 +14,6 @@
  */
 
 #include "xc_private.h"
-#include "xg_private.h"
-#include "xg_save_restore.h"
 
 #if defined(__i386__) || defined(__x86_64__)
 
diff --git a/tools/libxc/xg_private.h b/tools/libxc/xg_private.h
index 40b5baecde..0000b2b9b6 100644
--- a/tools/libxc/xg_private.h
+++ b/tools/libxc/xg_private.h
@@ -97,15 +97,6 @@ typedef uint64_t x86_pgentry_t;
 
 #define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
 
-
-/* XXX SMH: following skanky macros rely on variable p2m_size being set */
-/* XXX TJD: also, "guest_width" should be the guest's sizeof(unsigned long) */
-
-struct domain_info_context {
-    unsigned int guest_width;
-    unsigned long p2m_size;
-};
-
 static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
                                       unsigned gwidth)
 {
@@ -121,19 +112,6 @@ static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
     }
 }
 
-/* Number of xen_pfn_t in a page */
-#define FPP             (PAGE_SIZE/(dinfo->guest_width))
-
-/* Number of entries in the pfn_to_mfn_frame_list_list */
-#define P2M_FLL_ENTRIES (((dinfo->p2m_size)+(FPP*FPP)-1)/(FPP*FPP))
-
-/* Number of entries in the pfn_to_mfn_frame_list */
-#define P2M_FL_ENTRIES  (((dinfo->p2m_size)+FPP-1)/FPP)
-
-/* Size in bytes of the pfn_to_mfn_frame_list     */
-#define P2M_GUEST_FL_SIZE ((P2M_FL_ENTRIES) * (dinfo->guest_width))
-#define P2M_TOOLS_FL_SIZE ((P2M_FL_ENTRIES) *                           \
-                           max_t(size_t, sizeof(xen_pfn_t), dinfo->guest_width))
 
 /* Masks for PTE<->PFN conversions */
 #define MADDR_BITS_X86  ((dinfo->guest_width == 8) ? 52 : 44)
diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
index b904296997..88120eb54b 100644
--- a/tools/libxc/xg_save_restore.h
+++ b/tools/libxc/xg_save_restore.h
@@ -109,15 +109,6 @@ static inline int get_platform_info(xc_interface *xch, uint32_t dom,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
-
-#define SET_FIELD(_p, _f, _v, _w) do {          \
-    if ((_w) == 8)                              \
-        (_p)->x64._f = (_v);                    \
-    else                                        \
-        (_p)->x32._f = (_v);                    \
-} while (0)
-
 #define UNFOLD_CR3(_c)                                                  \
   ((uint64_t)((dinfo->guest_width == 8)                                 \
               ? ((_c) >> 12)                                            \
-- 
2.26.2


