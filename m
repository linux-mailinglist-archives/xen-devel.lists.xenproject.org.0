Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C252D3F2
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 15:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332973.556741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgCM-0003YC-1z; Thu, 19 May 2022 13:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332973.556741; Thu, 19 May 2022 13:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgCL-0003WK-UM; Thu, 19 May 2022 13:28:13 +0000
Received: by outflank-mailman (input) for mailman id 332973;
 Thu, 19 May 2022 13:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q20b=V3=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrgCJ-0003WE-Tl
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 13:28:12 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 823b5a1a-d777-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 15:28:05 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 06:28:02 -0700
Received: from tlengyel-mobl3.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.213.172.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 06:28:00 -0700
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
X-Inumbo-ID: 823b5a1a-d777-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652966885; x=1684502885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zxkU79kiZQ0Xv31PEe8WAmmoX/6h53i+GCeRX9CU+x4=;
  b=U+XY/BmK18zZfAetjpeuwveLP1mngmvdKKCK+jqaVJ8F0C2GGliV+5jt
   M0P1ifKtVlMQOPsVnWSYk7IQ5wJUduLSrH4a1Atf7/SUOMLtL7IERzOPl
   kmx116gtiDZJGX2ID7PBV8ZSzLg42FAMyXfOryeJODNwq1HCtp4nL8l8Q
   id91VkXBgaDbizS/w5OgGSwNEuMK2szVRlU3lq+gRU/gxx+gcB7HC2mII
   tnrcK6/IgUtEQBM3WknoX1GfHCx7XjHQ8SvOey+53/AivLyxxWpgIxdWm
   CVYjA5C8XzFcx42njAEihBzWM0i6As6xz4W9cRQAVqKMtQFOurvFrfXct
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358608399"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="358608399"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="606486489"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libs/ctrl: add and export xc_memory_op
Date: Thu, 19 May 2022 09:27:49 -0400
Message-Id: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add and export xc_memory_op so that do_memory_op can be used by tools linking
with libxc. This is effectively in the same spirit as the existing xc_domctl
and xc_sysctl functions, which are already exported.

In this patch we move do_memory_op into xc_private.h as a static inline function
and convert its 'cmd' input from int to unsigned int to accurately reflect what
the hypervisor expects. No other changes are made to the function.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/include/xenctrl.h      |  1 +
 tools/libs/ctrl/xc_private.c | 63 +++---------------------------------
 tools/libs/ctrl/xc_private.h | 58 ++++++++++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..484e354412 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1597,6 +1597,7 @@ int xc_vmtrace_set_option(xc_interface *xch, uint32_t domid,
 
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
+long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len);
 
 int xc_version(xc_interface *xch, int cmd, void *arg);
 
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index c0422662f0..6a247d2b1f 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -326,64 +326,6 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu)
     return flush_mmu_updates(xch, mmu);
 }
 
-long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len)
-{
-    DECLARE_HYPERCALL_BOUNCE(arg, len, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    long ret = -1;
-
-    if ( xc_hypercall_bounce_pre(xch, arg) )
-    {
-        PERROR("Could not bounce memory for XENMEM hypercall");
-        goto out1;
-    }
-
-#if defined(__linux__) || defined(__sun__)
-    /*
-     * Some sub-ops return values which don't fit in "int". On platforms
-     * without a specific hypercall return value field in the privcmd
-     * interface structure, issue the request as a single-element multicall,
-     * to be able to capture the full return value.
-     */
-    if ( sizeof(long) > sizeof(int) )
-    {
-        multicall_entry_t multicall = {
-            .op = __HYPERVISOR_memory_op,
-            .args[0] = cmd,
-            .args[1] = HYPERCALL_BUFFER_AS_ARG(arg),
-        }, *call = &multicall;
-        DECLARE_HYPERCALL_BOUNCE(call, sizeof(*call),
-                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-
-        if ( xc_hypercall_bounce_pre(xch, call) )
-        {
-            PERROR("Could not bounce buffer for memory_op hypercall");
-            goto out1;
-        }
-
-        ret = do_multicall_op(xch, HYPERCALL_BUFFER(call), 1);
-
-        xc_hypercall_bounce_post(xch, call);
-
-        if ( !ret )
-        {
-            ret = multicall.result;
-            if ( multicall.result > ~0xfffUL )
-            {
-                errno = -ret;
-                ret = -1;
-            }
-        }
-    }
-    else
-#endif
-        ret = xencall2L(xch->xcall, __HYPERVISOR_memory_op,
-                        cmd, HYPERCALL_BUFFER_AS_ARG(arg));
-
-    xc_hypercall_bounce_post(xch, arg);
- out1:
-    return ret;
-}
-
 int xc_maximum_ram_page(xc_interface *xch, unsigned long *max_mfn)
 {
     long rc = do_memory_op(xch, XENMEM_maximum_ram_page, NULL, 0);
@@ -489,6 +431,11 @@ int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl)
     return do_sysctl(xch, sysctl);
 }
 
+long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len)
+{
+    return do_memory_op(xch, cmd, arg, len);
+}
+
 int xc_version(xc_interface *xch, int cmd, void *arg)
 {
     DECLARE_HYPERCALL_BOUNCE(arg, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT); /* Size unknown until cmd decoded */
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index ebdf78c2bf..cf6ad932b0 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -367,7 +367,63 @@ static inline int do_multicall_op(xc_interface *xch,
     return ret;
 }
 
-long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len);
+static inline long do_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len)
+{
+    DECLARE_HYPERCALL_BOUNCE(arg, len, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    long ret = -1;
+
+    if ( xc_hypercall_bounce_pre(xch, arg) )
+    {
+        PERROR("Could not bounce memory for XENMEM hypercall");
+        goto out1;
+    }
+
+#if defined(__linux__) || defined(__sun__)
+    /*
+     * Some sub-ops return values which don't fit in "int". On platforms
+     * without a specific hypercall return value field in the privcmd
+     * interface structure, issue the request as a single-element multicall,
+     * to be able to capture the full return value.
+     */
+    if ( sizeof(long) > sizeof(int) )
+    {
+        multicall_entry_t multicall = {
+            .op = __HYPERVISOR_memory_op,
+            .args[0] = cmd,
+            .args[1] = HYPERCALL_BUFFER_AS_ARG(arg),
+        }, *call = &multicall;
+        DECLARE_HYPERCALL_BOUNCE(call, sizeof(*call),
+                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+
+        if ( xc_hypercall_bounce_pre(xch, call) )
+        {
+            PERROR("Could not bounce buffer for memory_op hypercall");
+            goto out1;
+        }
+
+        ret = do_multicall_op(xch, HYPERCALL_BUFFER(call), 1);
+
+        xc_hypercall_bounce_post(xch, call);
+
+        if ( !ret )
+        {
+            ret = multicall.result;
+            if ( multicall.result > ~0xfffUL )
+            {
+                errno = -ret;
+                ret = -1;
+            }
+        }
+    }
+    else
+#endif
+        ret = xencall2L(xch->xcall, __HYPERVISOR_memory_op,
+                        cmd, HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_bounce_post(xch, arg);
+ out1:
+    return ret;
+}
 
 void *xc_map_foreign_ranges(xc_interface *xch, uint32_t dom,
                             size_t size, int prot, size_t chunksize,
-- 
2.34.1


