Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160C2CC013
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42808.77052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTSn-0004og-Nh; Wed, 02 Dec 2020 14:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42808.77052; Wed, 02 Dec 2020 14:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTSn-0004oG-JZ; Wed, 02 Dec 2020 14:50:37 +0000
Received: by outflank-mailman (input) for mailman id 42808;
 Wed, 02 Dec 2020 14:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkTSm-0004nm-T7
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:50:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ecea57c-c1d9-4e4f-8a57-dddf8277fe9f;
 Wed, 02 Dec 2020 14:50:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CDE2ACC3;
 Wed,  2 Dec 2020 14:50:31 +0000 (UTC)
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
X-Inumbo-ID: 7ecea57c-c1d9-4e4f-8a57-dddf8277fe9f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606920631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHnA0jwUib1BTdgfMxgCIDNTuw+txuIpBV3gHXdrMEk=;
	b=BkESPxBEKvBcMktSuI8jpK4IsXRhEjxcLecUJl0O9VvZJbJMpdhEgCbVXIuhuvtmr3R3et
	YtKGMxtHgO5DUh4JqG2SZY2k4yw010BFb8jfklC5tOae2Krq1LppnkKZpQ7hzbnvDcP4cu
	9qtwQ+jLdQghcwPd92tnItRepdAkPpw=
Subject: [PATCH 2/2] mm: split out mfn_t / gfn_t / pfn_t definitions and
 helpers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Hongyan Xia <hx242@xen.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
Message-ID: <fb4de786-7302-3336-dcb4-1a388bee34bc@suse.com>
Date: Wed, 2 Dec 2020 15:50:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

xen/mm.h has heavy dependencies, while in a number of cases only these
type definitions are needed. This separation then also allows pulling in
these definitions when including xen/mm.h would cause cyclic
dependencies.

Replace xen/mm.h inclusion where possible in include/xen/. (In
xen/iommu.h also take the opportunity and correct the few remaining
sorting issues.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -10,7 +10,6 @@
  * Slimmed with Xen specific support.
  */
 
-#include <asm/io.h>
 #include <xen/acpi.h>
 #include <xen/errno.h>
 #include <xen/iocap.h>
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -18,7 +18,9 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/errno.h>
 #include <xen/irq.h>
+#include <xen/mm.h>
 #include <xen/serial.h>
 #include <xen/vmap.h>
 #include <asm/io.h>
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -18,7 +18,9 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/errno.h>
 #include <xen/irq.h>
+#include <xen/mm.h>
 #include <xen/serial.h>
 #include <xen/vmap.h>
 #include <asm/io.h>
--- a/xen/include/asm-x86/io.h
+++ b/xen/include/asm-x86/io.h
@@ -49,6 +49,7 @@ __OUT(l,,int)
 
 /* Function pointer used to handle platform specific I/O port emulation. */
 #define IOEMUL_QUIRK_STUB_BYTES 9
+struct cpu_user_regs;
 extern unsigned int (*ioemul_handle_quirk)(
     u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
 
--- /dev/null
+++ b/xen/include/xen/frame-num.h
@@ -0,0 +1,96 @@
+#ifndef __XEN_FRAME_NUM_H__
+#define __XEN_FRAME_NUM_H__
+
+#include <xen/kernel.h>
+#include <xen/typesafe.h>
+
+TYPE_SAFE(unsigned long, mfn);
+#define PRI_mfn          "05lx"
+#define INVALID_MFN      _mfn(~0UL)
+/*
+ * To be used for global variable initialization. This workaround a bug
+ * in GCC < 5.0.
+ */
+#define INVALID_MFN_INITIALIZER { ~0UL }
+
+#ifndef mfn_t
+#define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
+#define _mfn
+#define mfn_x
+#undef mfn_t
+#undef _mfn
+#undef mfn_x
+#endif
+
+static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
+{
+    return _mfn(mfn_x(mfn) + i);
+}
+
+static inline mfn_t mfn_max(mfn_t x, mfn_t y)
+{
+    return _mfn(max(mfn_x(x), mfn_x(y)));
+}
+
+static inline mfn_t mfn_min(mfn_t x, mfn_t y)
+{
+    return _mfn(min(mfn_x(x), mfn_x(y)));
+}
+
+static inline bool_t mfn_eq(mfn_t x, mfn_t y)
+{
+    return mfn_x(x) == mfn_x(y);
+}
+
+TYPE_SAFE(unsigned long, gfn);
+#define PRI_gfn          "05lx"
+#define INVALID_GFN      _gfn(~0UL)
+/*
+ * To be used for global variable initialization. This workaround a bug
+ * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
+ */
+#define INVALID_GFN_INITIALIZER { ~0UL }
+
+#ifndef gfn_t
+#define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
+#define _gfn
+#define gfn_x
+#undef gfn_t
+#undef _gfn
+#undef gfn_x
+#endif
+
+static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
+{
+    return _gfn(gfn_x(gfn) + i);
+}
+
+static inline gfn_t gfn_max(gfn_t x, gfn_t y)
+{
+    return _gfn(max(gfn_x(x), gfn_x(y)));
+}
+
+static inline gfn_t gfn_min(gfn_t x, gfn_t y)
+{
+    return _gfn(min(gfn_x(x), gfn_x(y)));
+}
+
+static inline bool_t gfn_eq(gfn_t x, gfn_t y)
+{
+    return gfn_x(x) == gfn_x(y);
+}
+
+TYPE_SAFE(unsigned long, pfn);
+#define PRI_pfn          "05lx"
+#define INVALID_PFN      (~0UL)
+
+#ifndef pfn_t
+#define pfn_t /* Grep fodder: pfn_t, _pfn() and pfn_x() are defined above */
+#define _pfn
+#define pfn_x
+#undef pfn_t
+#undef _pfn
+#undef pfn_x
+#endif
+
+#endif /* __XEN_FRAME_NUM_H__ */
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -23,7 +23,7 @@
 #ifndef __XEN_GRANT_TABLE_H__
 #define __XEN_GRANT_TABLE_H__
 
-#include <xen/mm.h>
+#include <xen/frame-num.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
 #include <asm/grant_table.h>
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -19,14 +19,13 @@
 #ifndef _IOMMU_H_
 #define _IOMMU_H_
 
+#include <xen/frame-num.h>
 #include <xen/init.h>
 #include <xen/page-defs.h>
-#include <xen/spinlock.h>
 #include <xen/pci.h>
-#include <xen/typesafe.h>
-#include <xen/mm.h>
-#include <public/hvm/ioreq.h>
+#include <xen/spinlock.h>
 #include <public/domctl.h>
+#include <public/hvm/ioreq.h>
 #include <asm/device.h>
 
 TYPE_SAFE(uint64_t, dfn);
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -51,103 +51,13 @@
 #define __XEN_MM_H__
 
 #include <xen/compiler.h>
+#include <xen/frame-num.h>
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
-#include <xen/typesafe.h>
-#include <xen/kernel.h>
 #include <xen/perfc.h>
 #include <public/memory.h>
 
-TYPE_SAFE(unsigned long, mfn);
-#define PRI_mfn          "05lx"
-#define INVALID_MFN      _mfn(~0UL)
-/*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0.
- */
-#define INVALID_MFN_INITIALIZER { ~0UL }
-
-#ifndef mfn_t
-#define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
-#define _mfn
-#define mfn_x
-#undef mfn_t
-#undef _mfn
-#undef mfn_x
-#endif
-
-static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
-{
-    return _mfn(mfn_x(mfn) + i);
-}
-
-static inline mfn_t mfn_max(mfn_t x, mfn_t y)
-{
-    return _mfn(max(mfn_x(x), mfn_x(y)));
-}
-
-static inline mfn_t mfn_min(mfn_t x, mfn_t y)
-{
-    return _mfn(min(mfn_x(x), mfn_x(y)));
-}
-
-static inline bool_t mfn_eq(mfn_t x, mfn_t y)
-{
-    return mfn_x(x) == mfn_x(y);
-}
-
-TYPE_SAFE(unsigned long, gfn);
-#define PRI_gfn          "05lx"
-#define INVALID_GFN      _gfn(~0UL)
-/*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
- */
-#define INVALID_GFN_INITIALIZER { ~0UL }
-
-#ifndef gfn_t
-#define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
-#define _gfn
-#define gfn_x
-#undef gfn_t
-#undef _gfn
-#undef gfn_x
-#endif
-
-static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
-{
-    return _gfn(gfn_x(gfn) + i);
-}
-
-static inline gfn_t gfn_max(gfn_t x, gfn_t y)
-{
-    return _gfn(max(gfn_x(x), gfn_x(y)));
-}
-
-static inline gfn_t gfn_min(gfn_t x, gfn_t y)
-{
-    return _gfn(min(gfn_x(x), gfn_x(y)));
-}
-
-static inline bool_t gfn_eq(gfn_t x, gfn_t y)
-{
-    return gfn_x(x) == gfn_x(y);
-}
-
-TYPE_SAFE(unsigned long, pfn);
-#define PRI_pfn          "05lx"
-#define INVALID_PFN      (~0UL)
-
-#ifndef pfn_t
-#define pfn_t /* Grep fodder: pfn_t, _pfn() and pfn_x() are defined above */
-#define _pfn
-#define pfn_x
-#undef pfn_t
-#undef _pfn
-#undef pfn_x
-#endif
-
 struct page_info;
 
 void put_page(struct page_info *);
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -1,7 +1,7 @@
 #ifndef _XEN_P2M_COMMON_H
 #define _XEN_P2M_COMMON_H
 
-#include <xen/mm.h>
+#include <xen/frame-num.h>
 
 /* Remove a page from a domain's p2m table */
 int __must_check
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,7 +1,7 @@
 #if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
 #define __XEN_VMAP_H__
 
-#include <xen/mm.h>
+#include <xen/frame-num.h>
 #include <xen/page-size.h>
 
 enum vmap_region {


