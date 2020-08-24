Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081A0250741
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 20:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAH0U-0003jD-VW; Mon, 24 Aug 2020 18:15:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kAH0T-0003j8-II
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 18:15:45 +0000
X-Inumbo-ID: aa501035-97df-450d-8764-1bda8b78e3c0
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa501035-97df-450d-8764-1bda8b78e3c0;
 Mon, 24 Aug 2020 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598292944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TMXiIDcPTnx3Q7Fcuo+WyrqNa8OBlA5Q9wSfKMlTFfw=;
 b=HYRPWXXXexnJSTA2b8tYA/2kJz+Af+VN19OLtkP9lhGfW340OO8mxyof
 dBl7T6KBC1ra5wO0gpVOJKpOUZG1g2AETVi4TZ1zcWBYRQdWEFdYteuaT
 xpRipDtxhlup+U988gQ68IKUvaw/RSPUe70Ajdql7hoM3iGe3cbGuWsWx g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: x4VKHe77yHGxjKuX8cc3dBmahMeqvOz2+Z5Emvyw/CwHFdZ1oq5fwohIjJY68sNnj6f84bYKSI
 HyAjNHZ2HpRf++NMfzg8mhVYFJCihPr6Qym2qaV10IA171I4OuZifjMc7Z5Gvaw/XQCKXk6yFu
 ItrHU0AWQumF3vKupiWac9CIwym4gYoT3bg0f4M7zRo/hWFHyyNoOoW/+9PvPW9eGvOSN648GR
 DklJCYwFDvtVaryrpvns7fP7RqAzp4QxFZAeBqMrRDvVuAsPyC+ef5Q9Ser0Bva0Nl6g2YSyO4
 6NU=
X-SBRS: 2.7
X-MesageID: 25489456
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="25489456"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/mm: Introduce CONFIG_M2P and provide common fallback logic
Date: Mon, 24 Aug 2020 19:15:24 +0100
Message-ID: <20200824181524.1111-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

Architectures which don't implement an M2P shouldn't be forced to implement
stubs.  Implement them in common code.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

I'm pretty sure the mfn_to_gmfn() stub is bogus before and after this change.
The two uses in common code are getdomaininfo and in memory_exchange(), which
result in junk.

I presume ARM toolstacks don't ever try to map info->shared_info_frame,
because I can't see how it would work.
---
 xen/arch/x86/Kconfig     |  1 +
 xen/common/Kconfig       |  3 +++
 xen/include/asm-arm/mm.h |  5 -----
 xen/include/xen/mm.h     | 10 ++++++++++
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a636a4bb1e..9bc97a1cf5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,6 +24,7 @@ config X86
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if !PV_SHIM_EXCLUSIVE && HVM
+	select M2P
 	select NEEDS_LIBELF
 	select NUMA
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 15e3b79ff5..0bc186d67b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -63,6 +63,9 @@ config HAS_IOPORTS
 config HAS_SCHED_GRANULARITY
 	bool
 
+config M2P
+	bool
+
 config NEEDS_LIBELF
 	bool
 
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index f8ba49b118..f4e1864703 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -326,11 +326,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 #define SHARED_M2P_ENTRY         (~0UL - 1UL)
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
-/* Xen always owns P2M on ARM */
-#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-#define mfn_to_gmfn(_d, mfn)  (mfn)
-
-
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 1061765bcd..8f6858f954 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -685,4 +685,14 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
+/*
+ * For architectures which don't maintain their own M2P, provide a stub
+ * implementation for common code to use.
+ */
+#ifndef CONFIG_M2P
+static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn) {}
+static inline unsigned long mfn_to_gmfn(
+    const struct domain *d, unsigned long mfn) { return mfn; }
+#endif
+
 #endif /* __XEN_MM_H__ */
-- 
2.11.0


