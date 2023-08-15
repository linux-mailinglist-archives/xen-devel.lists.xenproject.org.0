Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F177D4DD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584056.914514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fx-0006LQ-5K; Tue, 15 Aug 2023 21:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584056.914514; Tue, 15 Aug 2023 21:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fw-0006Bo-VA; Tue, 15 Aug 2023 21:07:12 +0000
Received: by outflank-mailman (input) for mailman id 584056;
 Tue, 15 Aug 2023 21:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fu-0004qk-LA
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b094ce54-3baf-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 23:07:07 +0200 (CEST)
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
X-Inumbo-ID: b094ce54-3baf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvCFpUc1O5soqHuUC/SvS++8o+N6bC9fqekuul4E2RI=;
  b=JMn/SVA5PuSUjdewXO2mLE+RiIegbHMtYmxy4C0k1JCFdi6vf8XBHL4B
   VUqzfFzsctw9rjB4uqqdOag5RwX0he1Fx8YkEIW5RbFfc8dK+vK9tysRL
   fIx7FNOktEDzeLwXGtc1XCoS0iNRCVgRA49sJEvyKn/BGrcYwu7a/bbUb
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118850005
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xvg/FKDNpFKUchVW/z7jw5YqxClBgxIJ4kV8jS/XYbTApDkh0TYHn
 2RKWD+DP6rZM2X0f49xOYTl8EsPu8WDyoIxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp/Z5LV1qy
 vciBgtcPhu9ve+a3qC/Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XaFZgNxh7Fz
 o7A1zm6WhNFD+O28hSY+3yTgODskgjxYqtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmPxbDT+B2xHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9uTPEhpx64t4sxvvKSY5EUs9bhUqdlpV6OfZra0tnBbQG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrWnFF52LJ9o4DNRCyKBBa59sRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QfOMErKFPWo3E3NSZ8OlwBd2B2zckC1
 WqzK57wXR7294w2pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29EN843K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe8JEKK7LbeFQ5QAnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:U805/K1+pLGA5+nhizu9lQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:gQU59Wygnj7WDSPzZpkjBgVJCs4JTlnix03+GB7oAlhTRZGLW1uPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AhVBQaQ8V6/dY/r0uRVz4uY2Qf5oru6bxM38kqrs?=
 =?us-ascii?q?bsse7MyNTNByXth3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118850005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v3 05/10] tools/libxc: Move xc_version() out of xc_private.c into its own file
Date: Tue, 15 Aug 2023 22:06:45 +0100
Message-ID: <20230815210650.2735671-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

kexec-tools uses xc_version(), meaning that it is not a private API.  As we're
going to extend the functionality substantially, move it to its own file.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_private.c    | 66 --------------------------
 tools/libs/ctrl/xc_private.h    |  7 ---
 tools/libs/ctrl/xc_version.c    | 83 +++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+), 73 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_version.c

diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
index 0a09c28fd369..4e3680c123f6 100644
--- a/tools/libs/ctrl/Makefile.common
+++ b/tools/libs/ctrl/Makefile.common
@@ -16,6 +16,7 @@ OBJS-y       += xc_pm.o
 OBJS-y       += xc_cpu_hotplug.o
 OBJS-y       += xc_vm_event.o
 OBJS-y       += xc_vmtrace.o
+OBJS-y       += xc_version.o
 OBJS-y       += xc_monitor.o
 OBJS-y       += xc_mem_paging.o
 OBJS-y       += xc_mem_access.o
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 6293a45531d8..fd4a13a57a9d 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -490,72 +490,6 @@ int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl)
     return do_sysctl(xch, sysctl);
 }
 
-int xc_version(xc_interface *xch, int cmd, void *arg)
-{
-    DECLARE_HYPERCALL_BOUNCE(arg, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT); /* Size unknown until cmd decoded */
-    size_t sz;
-    int rc;
-
-    switch ( cmd )
-    {
-    case XENVER_version:
-        sz = 0;
-        break;
-    case XENVER_extraversion:
-        sz = sizeof(xen_extraversion_t);
-        break;
-    case XENVER_compile_info:
-        sz = sizeof(xen_compile_info_t);
-        break;
-    case XENVER_capabilities:
-        sz = sizeof(xen_capabilities_info_t);
-        break;
-    case XENVER_changeset:
-        sz = sizeof(xen_changeset_info_t);
-        break;
-    case XENVER_platform_parameters:
-        sz = sizeof(xen_platform_parameters_t);
-        break;
-    case XENVER_get_features:
-        sz = sizeof(xen_feature_info_t);
-        break;
-    case XENVER_pagesize:
-        sz = 0;
-        break;
-    case XENVER_guest_handle:
-        sz = sizeof(xen_domain_handle_t);
-        break;
-    case XENVER_commandline:
-        sz = sizeof(xen_commandline_t);
-        break;
-    case XENVER_build_id:
-        {
-            xen_build_id_t *build_id = (xen_build_id_t *)arg;
-            sz = sizeof(*build_id) + build_id->len;
-            HYPERCALL_BOUNCE_SET_DIR(arg, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-            break;
-        }
-    default:
-        ERROR("xc_version: unknown command %d\n", cmd);
-        return -EINVAL;
-    }
-
-    HYPERCALL_BOUNCE_SET_SIZE(arg, sz);
-
-    if ( (sz != 0) && xc_hypercall_bounce_pre(xch, arg) )
-    {
-        PERROR("Could not bounce buffer for version hypercall");
-        return -ENOMEM;
-    }
-
-    rc = do_xen_version(xch, cmd, HYPERCALL_BUFFER(arg));
-
-    if ( sz != 0 )
-        xc_hypercall_bounce_post(xch, arg);
-
-    return rc;
-}
-
 unsigned long xc_make_page_below_4G(
     xc_interface *xch, uint32_t domid, unsigned long mfn)
 {
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8faabaea67f3..754da8840979 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -216,13 +216,6 @@ void xc__hypercall_buffer_cache_release(xc_interface *xch);
  * Hypercall interfaces.
  */
 
-static inline int do_xen_version(xc_interface *xch, int cmd, xc_hypercall_buffer_t *dest)
-{
-    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dest);
-    return xencall2(xch->xcall, __HYPERVISOR_xen_version,
-                    cmd, HYPERCALL_BUFFER_AS_ARG(dest));
-}
-
 static inline int do_physdev_op(xc_interface *xch, int cmd, void *op, size_t len)
 {
     int ret = -1;
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
new file mode 100644
index 000000000000..60e107dcee0b
--- /dev/null
+++ b/tools/libs/ctrl/xc_version.c
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
+/*
+ * xc_version.c
+ *
+ * Wrappers aound XENVER_* hypercalls
+ */
+
+#include "xc_private.h"
+#include <assert.h>
+
+static int do_xen_version(xc_interface *xch, int cmd,
+                          xc_hypercall_buffer_t *dest)
+{
+    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dest);
+    return xencall2(xch->xcall, __HYPERVISOR_xen_version,
+                    cmd, HYPERCALL_BUFFER_AS_ARG(dest));
+}
+
+int xc_version(xc_interface *xch, int cmd, void *arg)
+{
+    DECLARE_HYPERCALL_BOUNCE(arg, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT); /* Size unknown until cmd decoded */
+    size_t sz;
+    int rc;
+
+    switch ( cmd )
+    {
+    case XENVER_version:
+        sz = 0;
+        break;
+    case XENVER_extraversion:
+        sz = sizeof(xen_extraversion_t);
+        break;
+    case XENVER_compile_info:
+        sz = sizeof(xen_compile_info_t);
+        break;
+    case XENVER_capabilities:
+        sz = sizeof(xen_capabilities_info_t);
+        break;
+    case XENVER_changeset:
+        sz = sizeof(xen_changeset_info_t);
+        break;
+    case XENVER_platform_parameters:
+        sz = sizeof(xen_platform_parameters_t);
+        break;
+    case XENVER_get_features:
+        sz = sizeof(xen_feature_info_t);
+        break;
+    case XENVER_pagesize:
+        sz = 0;
+        break;
+    case XENVER_guest_handle:
+        sz = sizeof(xen_domain_handle_t);
+        break;
+    case XENVER_commandline:
+        sz = sizeof(xen_commandline_t);
+        break;
+    case XENVER_build_id:
+        {
+            xen_build_id_t *build_id = (xen_build_id_t *)arg;
+            sz = sizeof(*build_id) + build_id->len;
+            HYPERCALL_BOUNCE_SET_DIR(arg, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+            break;
+        }
+    default:
+        ERROR("xc_version: unknown command %d\n", cmd);
+        return -EINVAL;
+    }
+
+    HYPERCALL_BOUNCE_SET_SIZE(arg, sz);
+
+    if ( (sz != 0) && xc_hypercall_bounce_pre(xch, arg) )
+    {
+        PERROR("Could not bounce buffer for version hypercall");
+        return -ENOMEM;
+    }
+
+    rc = do_xen_version(xch, cmd, HYPERCALL_BUFFER(arg));
+
+    if ( sz != 0 )
+        xc_hypercall_bounce_post(xch, arg);
+
+    return rc;
+}
-- 
2.30.2


