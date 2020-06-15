Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FCB1F99CF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpu2-0007rJ-7O; Mon, 15 Jun 2020 14:15:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpu0-0007r6-J6
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:15:56 +0000
X-Inumbo-ID: b9c24fe0-af12-11ea-b801-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9c24fe0-af12-11ea-b801-12813bfff9fa;
 Mon, 15 Jun 2020 14:15:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Cu6wRtIKUxbfA+SASgGLv5eUG0SxnSpIjVacZ6OtwFV4F0RbLAW+psJUueV6Jou3w6iMeCBwFo
 YLki+Un47YVfO0rixgihdqXVtmUF/PgnMYvUMNs7guNvoROf6vMjE8rcSHh9SKoF0IcYHsO22C
 KcbXu2oLXZMKWWF4eQsJEkJmwGIi7qFrIJO0e/XTsRjFN0lvc+IfB4DIBBJY0R4UT0dX5n6Q0r
 cFfRfY0VZbsmPIEgmp3LGrjUcpMUiCE1T4dMwFxf29C8Mvf26QpeJkMx5Gx2jNMh1jwxD/OlM6
 Cb0=
X-SBRS: 2.7
X-MesageID: 20064841
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064841"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/9] tools/libx[cl]: Move processing loop down into
 xc_cpuid_set()
Date: Mon, 15 Jun 2020 15:15:26 +0100
Message-ID: <20200615141532.1927-4-andrew.cooper3@citrix.com>
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

Currently, libxl__cpuid_legacy() passes each element of the policy list to
xc_cpuid_set() individually.  This is wasteful both in terms of the number of
hypercalls made, and the quantity of repeated merging/auditing work performed
by Xen.

Move the loop processing down into xc_cpuid_set(), which allows us to do one
set of hypercalls, rather than one per list entry.

In xc_cpuid_set(), obtain the full host, guest max and current policies to
begin with, and loop over the xend array, processing one leaf at a time.
Replace the linear search with a binary search, seeing as the serialised
leaves are sorted.

No change in behaviour from the guests point of view.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 tools/libxc/xc_cpuid_x86.c | 159 +++++++++++++++++++++++++++------------------
 tools/libxl/libxl_cpuid.c  |   4 +-
 2 files changed, 95 insertions(+), 68 deletions(-)

diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index edc2ad9b47..e827c48fd1 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -38,8 +38,6 @@ enum {
 
 #define bitmaskof(idx)      (1u << ((idx) & 31))
 #define featureword_of(idx) ((idx) >> 5)
-#define clear_feature(idx, dst) ((dst) &= ~bitmaskof(idx))
-#define set_feature(idx, dst)   ((dst) |=  bitmaskof(idx))
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 {
@@ -259,15 +257,42 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
+static int compare_leaves(const void *l, const void *r)
+{
+    const xen_cpuid_leaf_t *lhs = l;
+    const xen_cpuid_leaf_t *rhs = r;
+
+    if ( lhs->leaf != rhs->leaf )
+        return lhs->leaf < rhs->leaf ? -1 : 1;
+
+    if ( lhs->subleaf != rhs->subleaf )
+        return lhs->subleaf < rhs->subleaf ? -1 : 1;
+
+    return 0;
+}
+
+static xen_cpuid_leaf_t *find_leaf(
+    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
+    const struct xc_xend_cpuid *xend)
+{
+    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
+
+    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
+}
+
 int xc_cpuid_set(
     xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
 {
     int rc;
-    unsigned int i, j, regs[4] = {}, polregs[4] = {};
     xc_dominfo_t di;
-    xen_cpuid_leaf_t *leaves = NULL;
-    unsigned int nr_leaves, policy_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    /*
+     * Three full policies.  The host, domain max, and domain current for the
+     * domain type.
+     */
+    xen_cpuid_leaf_t *host = NULL, *max = NULL, *cur = NULL;
+    unsigned int nr_host, nr_max, nr_cur;
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -286,99 +311,101 @@ int xc_cpuid_set(
     }
 
     rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL )
+    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
+         (max  = calloc(nr_leaves, sizeof(*max)))  == NULL ||
+         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
     {
         ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
         goto fail;
     }
 
+    /* Get the domain's current policy. */
+    nr_msrs = 0;
+    nr_cur = nr_leaves;
+    rc = xc_get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
+    if ( rc )
+    {
+        PERROR("Failed to obtain d%d current policy", domid);
+        rc = -errno;
+        goto fail;
+    }
+
     /* Get the domain's max policy. */
     nr_msrs = 0;
-    policy_leaves = nr_leaves;
+    nr_max = nr_leaves;
     rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
                                               : XEN_SYSCTL_cpu_policy_pv_max,
-                                  &policy_leaves, leaves, &nr_msrs, NULL);
+                                  &nr_max, max, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s max policy", di.hvm ? "hvm" : "pv");
         rc = -errno;
         goto fail;
     }
-    for ( i = 0; i < policy_leaves; ++i )
-        if ( leaves[i].leaf == xend->leaf &&
-             leaves[i].subleaf == xend->subleaf )
-        {
-            polregs[0] = leaves[i].a;
-            polregs[1] = leaves[i].b;
-            polregs[2] = leaves[i].c;
-            polregs[3] = leaves[i].d;
-            break;
-        }
 
     /* Get the host policy. */
     nr_msrs = 0;
-    policy_leaves = nr_leaves;
+    nr_host = nr_leaves;
     rc = xc_get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                                  &policy_leaves, leaves, &nr_msrs, NULL);
+                                  &nr_host, host, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
         rc = -errno;
         goto fail;
     }
-    for ( i = 0; i < policy_leaves; ++i )
-        if ( leaves[i].leaf == xend->leaf &&
-             leaves[i].subleaf == xend->subleaf )
-        {
-            regs[0] = leaves[i].a;
-            regs[1] = leaves[i].b;
-            regs[2] = leaves[i].c;
-            regs[3] = leaves[i].d;
-            break;
-        }
 
-    for ( i = 0; i < 4; i++ )
+    rc = -EINVAL;
+    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
     {
-        if ( xend->policy[i] == NULL )
+        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
+        const xen_cpuid_leaf_t *max_leaf = find_leaf(max, nr_max, xend);
+        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+
+        if ( cur_leaf == NULL || max_leaf == NULL || host_leaf == NULL )
         {
-            regs[i] = polregs[i];
-            continue;
+            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
+            goto fail;
         }
 
-        /*
-         * Notes for following this algorithm:
-         *
-         * While it will accept any leaf data, it only makes sense to use on
-         * feature leaves.  regs[] initially contains the host values.  This,
-         * with the fall-through chain, is how the 's' and 'k' options work.
-         */
-        for ( j = 0; j < 32; j++ )
+        for ( int i = 0; i < 4; i++ )
         {
-            unsigned char val = !!((regs[i] & (1U << (31 - j))));
-            unsigned char polval = !!((polregs[i] & (1U << (31 - j))));
-
-            rc = -EINVAL;
-            if ( !strchr("10xks", xend->policy[i][j]) )
-                goto fail;
-
-            if ( xend->policy[i][j] == '1' )
-                val = 1;
-            else if ( xend->policy[i][j] == '0' )
-                val = 0;
-            else if ( xend->policy[i][j] == 'x' )
-                val = polval;
-
-            if ( val )
-                set_feature(31 - j, regs[i]);
-            else
-                clear_feature(31 - j, regs[i]);
+            uint32_t *cur_reg = &cur_leaf->a + i;
+            const uint32_t *max_reg = &max_leaf->a + i;
+            const uint32_t *host_reg = &host_leaf->a + i;
+
+            if ( xend->policy[i] == NULL )
+                continue;
+
+            for ( int j = 0; j < 32; j++ )
+            {
+                bool val;
+
+                if ( xend->policy[i][j] == '1' )
+                    val = true;
+                else if ( xend->policy[i][j] == '0' )
+                    val = false;
+                else if ( xend->policy[i][j] == 'x' )
+                    val = test_bit(31 - j, max_reg);
+                else if ( xend->policy[i][j] == 'k' ||
+                          xend->policy[i][j] == 's' )
+                    val = test_bit(31 - j, host_reg);
+                else
+                {
+                    ERROR("Bad character '%c' in policy[%d] string '%s'",
+                          xend->policy[i][j], i, xend->policy[i]);
+                    goto fail;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if ( val )
+                    set_bit(31 - j, cur_reg);
+            }
         }
     }
 
-    /* Feed the transformed leaf back up to Xen. */
-    leaves[0] = (xen_cpuid_leaf_t){ xend->leaf, xend->subleaf,
-                                    regs[0], regs[1], regs[2], regs[3] };
-    rc = xc_set_domain_cpu_policy(xch, domid, 1, leaves, 0, NULL,
+    /* Feed the transformed currrent policy back up to Xen. */
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
@@ -391,7 +418,9 @@ int xc_cpuid_set(
     /* Success! */
 
  fail:
-    free(leaves);
+    free(cur);
+    free(max);
+    free(host);
 
     return rc;
 }
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index e001cbcd4f..6f7cf2054e 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -420,7 +420,6 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
                          libxl_domain_build_info *info)
 {
     libxl_cpuid_policy_list cpuid = info->cpuid;
-    int i;
     bool pae = true;
 
     /*
@@ -441,8 +440,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
     if (!cpuid)
         return;
 
-    for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++)
-        xc_cpuid_set(ctx->xch, domid, &cpuid[i]);
+    xc_cpuid_set(ctx->xch, domid, info->cpuid);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.11.0


