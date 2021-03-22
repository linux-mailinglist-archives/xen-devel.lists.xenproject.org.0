Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C2343EAC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100150.190686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIH0-0003Gu-Bi; Mon, 22 Mar 2021 10:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100150.190686; Mon, 22 Mar 2021 10:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIH0-0003Fv-52; Mon, 22 Mar 2021 10:59:02 +0000
Received: by outflank-mailman (input) for mailman id 100150;
 Mon, 22 Mar 2021 10:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lOIGy-0002uF-1S
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:59:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 947bfb90-8967-472a-9b6a-911f6106b9da;
 Mon, 22 Mar 2021 10:58:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EBA06AE1B;
 Mon, 22 Mar 2021 10:58:43 +0000 (UTC)
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
X-Inumbo-ID: 947bfb90-8967-472a-9b6a-911f6106b9da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616410724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/d1m/nwqJtLr2C9cFqF0W7SDbqgauwOmuYrIPpnLeM=;
	b=bcvOklLkydyG3egU54tomkEqfURs0yRAGppOBZOjvhucIw4mJLFWkTTInKdgsj4Yc7yBDq
	BZUVh3D8l33/QtL7M+yGEPKVjzmDA43hPexRRevMVdcWxppNe0OIbSZwFcMkf4WuCYLHaj
	dnvJH7wEnQ/xBHlT7p8prl17pTP8DvQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 6/6] tools/libs/guest: make some definitions private to libxenguest
Date: Mon, 22 Mar 2021 11:58:40 +0100
Message-Id: <20210322105840.11224-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322105840.11224-1-jgross@suse.com>
References: <20210322105840.11224-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some definitions which are used in libxenguest only now.
Move them from libxenctrl over to libxenguest.

Remove an unused macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/xc_private.h   | 32 --------------------------------
 tools/libs/guest/xg_core.h     |  2 +-
 tools/libs/guest/xg_core_x86.c | 16 +++++++++++++++-
 tools/libs/guest/xg_private.h  | 16 +++++++++++++++-
 tools/libs/guest/xg_resume.c   |  2 +-
 5 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index dff0f0289b..3e299b943f 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -65,38 +65,6 @@ struct iovec {
 
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 
-#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
-
-#define SET_FIELD(_p, _f, _v, _w) do {          \
-    if ((_w) == 8)                              \
-        (_p)->x64._f = (_v);                    \
-    else                                        \
-        (_p)->x32._f = (_v);                    \
-} while (0)
-
-/* XXX SMH: following skanky macros rely on variable p2m_size being set */
-/* XXX TJD: also, "guest_width" should be the guest's sizeof(unsigned long) */
-
-struct domain_info_context {
-    unsigned int guest_width;
-    unsigned int p2m_frames;
-    unsigned long p2m_size;
-};
-
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
-
 #define DECLARE_DOMCTL struct xen_domctl domctl
 #define DECLARE_SYSCTL struct xen_sysctl sysctl
 #define DECLARE_PHYSDEV_OP struct physdev_op physdev_op
diff --git a/tools/libs/guest/xg_core.h b/tools/libs/guest/xg_core.h
index f07584aaa6..aaca9e0a8b 100644
--- a/tools/libs/guest/xg_core.h
+++ b/tools/libs/guest/xg_core.h
@@ -21,7 +21,7 @@
 #define XC_CORE_H
 
 #include "xen/version.h"
-#include "xc_private.h"
+#include "xg_private.h"
 #include "xen/libelf/elfstructs.h"
 
 /* section names */
diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index 09f5d696ce..61106b98b8 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -18,10 +18,24 @@
  */
 
 #include <inttypes.h>
-#include "xc_private.h"
+#include "xg_private.h"
 #include "xg_core.h"
 #include <xen/hvm/e820.h>
 
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
+#define P2M_TOOLS_FL_SIZE ((P2M_FL_ENTRIES) * \
+                           max_t(size_t, sizeof(xen_pfn_t), dinfo->guest_width))
+
 int
 xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
                               unsigned long pfn)
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 8f9b257a2f..ff57f8b832 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -42,6 +42,21 @@
 #endif
 #endif
 
+#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
+
+#define SET_FIELD(_p, _f, _v, _w) do {          \
+    if ((_w) == 8)                              \
+        (_p)->x64._f = (_v);                    \
+    else                                        \
+        (_p)->x32._f = (_v);                    \
+} while (0)
+
+struct domain_info_context {
+    unsigned int guest_width;
+    unsigned int p2m_frames;
+    unsigned long p2m_size;
+};
+
 struct xc_dom_loader {
     char *name;
     /* Sadly the error returns from these functions are not consistent: */
@@ -139,7 +154,6 @@ static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
 /* Masks for PTE<->PFN conversions */
 #define MADDR_BITS_X86  ((dinfo->guest_width == 8) ? 52 : 44)
 #define MFN_MASK_X86    ((1ULL << (MADDR_BITS_X86 - PAGE_SHIFT_X86)) - 1)
-#define MADDR_MASK_X86  (MFN_MASK_X86 << PAGE_SHIFT_X86)
 
 int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
               uint32_t dom);
diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
index d201c1488d..77e2451a3c 100644
--- a/tools/libs/guest/xg_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -13,7 +13,7 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "xc_private.h"
+#include "xg_private.h"
 #include "xenguest.h"
 
 #if defined(__i386__) || defined(__x86_64__)
-- 
2.26.2


