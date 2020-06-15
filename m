Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C61F99D7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpuJ-00081k-2D; Mon, 15 Jun 2020 14:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpuI-0007qe-5u
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:14 +0000
X-Inumbo-ID: b9e8f80c-af12-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9e8f80c-af12-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UDaqbc4TbHeYODtc+HkmveLoGbw/Tno3hC+KDZcJ96XhD748wssAHbyq/SyAnFuaZFPhHX+vxB
 bf1cOvEcp0XrYwqCjk25x88wV+9yrTrLLVnlEusbDIxnZ4PpdUg3a+Z87VhFRZFkHFN6X0fQXZ
 YOh1W6DRzAxgseB+FrUBfXJJ6zSxXo8A1nqKicOdIjaC0SInshwv1/D2pHwHSRMXxnEMCLs7Kj
 hkSjdhOwRY/mg9PzaAnrJ9vWkzMzIdWiK9nyKAvWl0IulfEsBIVT4PZwFNMarlVr63uUEv1R2Y
 SOY=
X-SBRS: 2.7
X-MesageID: 20064840
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064840"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/9] tools/libx[cl]: Introduce struct xc_xend_cpuid for
 xc_cpuid_set()
Date: Mon, 15 Jun 2020 15:15:24 +0100
Message-ID: <20200615141532.1927-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to combine the functionality of xc_cpuid_set() with
xc_cpuid_apply_policy(), arrange to pass the data in a single contained
struct, rather than two arrays.

libxl__cpuid_policy is the ideal structure to use, but that would introduce a
reverse dependency between libxc and libxl.  Introduce xc_xend_cpuid (with a
transparent union to provide more useful names for the inputs), and use this
structure in libxl.

The public API has libxl_cpuid_policy as an opaque type referencing
libxl__cpuid_policy.  Drop the inappropriate comment about its internals, and
use xc_xend_cpuid as a differently named opaque backing object.  Users of both
libxl and libxc are not permitted to look at the internals.

No change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 tools/libxc/include/xenctrl.h | 30 ++++++++++++++++++++++++++++--
 tools/libxc/xc_cpuid_x86.c    | 39 +++++++++++----------------------------
 tools/libxl/libxl.h           |  8 ++++----
 tools/libxl/libxl_cpuid.c     |  7 +++----
 tools/libxl/libxl_internal.h  | 10 ----------
 5 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 113ddd935d..178144e8e2 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1792,10 +1792,36 @@ int xc_domain_debug_control(xc_interface *xch,
                             uint32_t vcpu);
 
 #if defined(__i386__) || defined(__x86_64__)
+
+/*
+ * CPUID policy data, expressed in the legacy XEND format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct xc_xend_cpuid {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 int xc_cpuid_set(xc_interface *xch,
                  uint32_t domid,
-                 const unsigned int *input,
-                 const char **config);
+                 const struct xc_xend_cpuid *xend);
 
 /*
  * Make adjustments to the CPUID settings for a domain.
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index b42edd6457..edc2ad9b47 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -259,27 +259,8 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-/*
- * Configure a single input with the informatiom from config.
- *
- * Config is an array of strings:
- *   config[0] = eax
- *   config[1] = ebx
- *   config[2] = ecx
- *   config[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- *
- * In all cases, the returned string consists of just '0' and '1'.
- */
 int xc_cpuid_set(
-    xc_interface *xch, uint32_t domid, const unsigned int *input,
-    const char **config)
+    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
 {
     int rc;
     unsigned int i, j, regs[4] = {}, polregs[4] = {};
@@ -324,7 +305,8 @@ int xc_cpuid_set(
         goto fail;
     }
     for ( i = 0; i < policy_leaves; ++i )
-        if ( leaves[i].leaf == input[0] && leaves[i].subleaf == input[1] )
+        if ( leaves[i].leaf == xend->leaf &&
+             leaves[i].subleaf == xend->subleaf )
         {
             polregs[0] = leaves[i].a;
             polregs[1] = leaves[i].b;
@@ -345,7 +327,8 @@ int xc_cpuid_set(
         goto fail;
     }
     for ( i = 0; i < policy_leaves; ++i )
-        if ( leaves[i].leaf == input[0] && leaves[i].subleaf == input[1] )
+        if ( leaves[i].leaf == xend->leaf &&
+             leaves[i].subleaf == xend->subleaf )
         {
             regs[0] = leaves[i].a;
             regs[1] = leaves[i].b;
@@ -356,7 +339,7 @@ int xc_cpuid_set(
 
     for ( i = 0; i < 4; i++ )
     {
-        if ( config[i] == NULL )
+        if ( xend->policy[i] == NULL )
         {
             regs[i] = polregs[i];
             continue;
@@ -375,14 +358,14 @@ int xc_cpuid_set(
             unsigned char polval = !!((polregs[i] & (1U << (31 - j))));
 
             rc = -EINVAL;
-            if ( !strchr("10xks", config[i][j]) )
+            if ( !strchr("10xks", xend->policy[i][j]) )
                 goto fail;
 
-            if ( config[i][j] == '1' )
+            if ( xend->policy[i][j] == '1' )
                 val = 1;
-            else if ( config[i][j] == '0' )
+            else if ( xend->policy[i][j] == '0' )
                 val = 0;
-            else if ( config[i][j] == 'x' )
+            else if ( xend->policy[i][j] == 'x' )
                 val = polval;
 
             if ( val )
@@ -393,7 +376,7 @@ int xc_cpuid_set(
     }
 
     /* Feed the transformed leaf back up to Xen. */
-    leaves[0] = (xen_cpuid_leaf_t){ input[0], input[1],
+    leaves[0] = (xen_cpuid_leaf_t){ xend->leaf, xend->subleaf,
                                     regs[0], regs[1], regs[2], regs[3] };
     rc = xc_set_domain_cpu_policy(xch, domid, 1, leaves, 0, NULL,
                                   &err_leaf, &err_subleaf, &err_msr);
diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 71709dc585..1cd6c38e83 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -1310,11 +1310,11 @@ typedef struct {
 void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
-/* libxl_cpuid_policy_list is a dynamic array storing CPUID policies
- * for multiple leafs. It is terminated with an entry holding
- * XEN_CPUID_INPUT_UNUSED in input[0]
+/*
+ * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
+ * libxc may not make assumptions about xc_xend_cpuid.
  */
-typedef struct libxl__cpuid_policy libxl_cpuid_policy;
+typedef struct xc_xend_cpuid libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index 796ec4f2d9..e001cbcd4f 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -288,7 +288,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct libxl__cpuid_policy *entry;
+    struct xc_xend_cpuid *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -366,7 +366,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct libxl__cpuid_policy *entry;
+    struct xc_xend_cpuid *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -442,8 +442,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
         return;
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++)
-        xc_cpuid_set(ctx->xch, domid, cpuid[i].input,
-                     (const char**)cpuid[i].policy);
+        xc_cpuid_set(ctx->xch, domid, &cpuid[i]);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index c7ece066c4..79c2bf5f5e 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2056,16 +2056,6 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
-  /* holds the CPUID response for a single CPUID leaf
-   * input contains the value of the EAX and ECX register,
-   * and each policy string contains a filter to apply to
-   * the host given values for that particular leaf.
-   */
-struct libxl__cpuid_policy {
-    uint32_t input[2];
-    char *policy[4];
-};
-
 _hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
                                  libxl_domain_build_info *info);
 
-- 
2.11.0


