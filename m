Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A766DF8D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479420.743262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPl-0000ZX-Q3; Tue, 17 Jan 2023 13:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479420.743262; Tue, 17 Jan 2023 13:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPl-0000XU-MR; Tue, 17 Jan 2023 13:54:13 +0000
Received: by outflank-mailman (input) for mailman id 479420;
 Tue, 17 Jan 2023 13:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPj-0000F6-VZ
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679b7d47-966e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 14:54:05 +0100 (CET)
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
X-Inumbo-ID: 679b7d47-966e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZqFqnz0+1fOZwU/dhH9PGLPysacHFErPc/30UTcR1D4=;
  b=Azz1uy/c5+2+HCC+YXXFszlKyYozhzQEvsldUOoX/koePwtTGhV9eXfa
   LjYbJO92V9RDMtSNrIakSuhFERanjJKtRIqoAV2tO+ZRdfqQOGu7JItI1
   rCvrROv8/7rtRtTaJ5CPCoQH2MKCv6PobAIxkUTcy4KlKw8+5mlFMleKg
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898366
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BCp8cKoZ2eYew1u3xms3v0bEsT1eBmJgZRIvgKrLsJaIsI4StFCzt
 garIBmBOv+PZmXzL48gbdzn9UpS7Z7dxtU2TgBr/y0wE38S8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHziZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACoWbDTTocKY++KqFulNnv4mANbtGZxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOfrzWpWU9EXDCZ4Qii22uHmODqph72H5MqO4GTqNxonkLGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ul7Cmdx6yS5ByWbkAGQSRGc8cOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewceVgkhs//Djrpjn07Pb85ZFYKqiPjqTGSYL
 y+xkMQuu1kCpZdViP7qpwqf3GLESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp1lvixSYy1B6mFNbKih6SdkyferElTibO4hTixwCDAb4liU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/qt9DfQpUcyZhW/gbaaV/L4a+H+avI0l5Y9e5/F/rU9A+90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:t+4G/awqb7XrLUEP6eIdKrPw6r1zdoMgy1knxilNoHxuH/Bw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxedZjLcKqweKJ8SUzJ8+6U
 4PSchD4N2bNykGse/KpDOWPvxl6uOhmZrY4ts3zR1WPH1Xg3cL1XYHNu6ZeHcGOjWvHfACZf
 yhDlIsnUvbRZwQBP7Lf0XsD4D41qX2fIuNW298OyIa
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898366"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/6] tools/libxc: Move xc_version() out of xc_private.c into its own file
Date: Tue, 17 Jan 2023 13:53:31 +0000
Message-ID: <20230117135336.11662-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

kexec-tools uses xc_version(), meaning that it is not a private API.  As we're
going to extend the functionality substantially, move it to its own file.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_private.c    | 66 --------------------------------
 tools/libs/ctrl/xc_private.h    |  7 ----
 tools/libs/ctrl/xc_version.c    | 83 +++++++++++++++++++++++++++++++++++++++++
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
index 2f99a7d2cfb5..cb22da604fe8 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -489,72 +489,6 @@ int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl)
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
index ed960c6f30e6..6404077903f0 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -215,13 +215,6 @@ void xc__hypercall_buffer_cache_release(xc_interface *xch);
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
2.11.0


