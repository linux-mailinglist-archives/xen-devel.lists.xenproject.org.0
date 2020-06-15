Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E51F99D8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpuO-00086L-CL; Mon, 15 Jun 2020 14:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpuN-0007qe-69
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:19 +0000
X-Inumbo-ID: bb625930-af12-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb625930-af12-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:58 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Snr8vaAfNSSAS8IA9g4PvhVBkLH0/PnPWvuDbtoqmonYGzjyOxXbL5wmjTDu+yzBJzr05Wh2+w
 n6WuIWB0krml7vYplkf6Inoh7/0f691r4YyDhewmBa1Jgm0W2qrkPOaWhORhbQfJJXNSY5sRy3
 MfIycaEWwjkFZeYR/Vc78H930aT6tvGJWkqC8BrJEFrqd5iVzNjtVxhd3cPgIqvvXGtebQ+Rdr
 BcPydlb2/A+cDKDPoc+KLFDIlOWNB9ki6tOLMckpvMzGYaWlgh+H/HReULnLs/yUXoaiPHeumZ
 x18=
X-SBRS: 2.7
X-MesageID: 20839539
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20839539"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 4/9] tools/libx[cl]: Merge xc_cpuid_set() into
 xc_cpuid_apply_policy()
Date: Mon, 15 Jun 2020 15:15:27 +0100
Message-ID: <20200615141532.1927-5-andrew.cooper3@citrix.com>
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

This reduces the number of CPUID handling entry-points to just one.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 tools/libxc/include/xenctrl.h | 9 ++++-----
 tools/libxc/xc_cpuid_x86.c    | 8 ++++++--
 tools/libxl/libxl_cpuid.c     | 8 +-------
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 178144e8e2..5f0978e0e5 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1819,20 +1819,19 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-int xc_cpuid_set(xc_interface *xch,
-                 uint32_t domid,
-                 const struct xc_xend_cpuid *xend);
-
 /*
  * Make adjustments to the CPUID settings for a domain.
  *
  * Either pass a full new @featureset (and @nr_features), or adjust individual
  * features (@pae).
+ *
+ * Then (optionally) apply legacy XEND overrides (@xend) to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid,
                           const uint32_t *featureset,
-                          unsigned int nr_features, bool pae);
+                          unsigned int nr_features, bool pae,
+                          const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index e827c48fd1..26a7b94dcf 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -280,7 +280,7 @@ static xen_cpuid_leaf_t *find_leaf(
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
 
-int xc_cpuid_set(
+static int xc_cpuid_xend_policy(
     xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
 {
     int rc;
@@ -427,7 +427,8 @@ int xc_cpuid_set(
 
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
                           const uint32_t *featureset, unsigned int nr_features,
-                          bool pae)
+                          bool pae,
+                          const struct xc_xend_cpuid *xend)
 {
     int rc;
     xc_dominfo_t di;
@@ -637,6 +638,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
         goto out;
     }
 
+    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
+        goto out;
+
     rc = 0;
 
 out:
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index 6f7cf2054e..edfcf315ca 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -419,7 +419,6 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
 void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
                          libxl_domain_build_info *info)
 {
-    libxl_cpuid_policy_list cpuid = info->cpuid;
     bool pae = true;
 
     /*
@@ -435,12 +434,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
     if (info->type == LIBXL_DOMAIN_TYPE_HVM)
         pae = libxl_defbool_val(info->u.hvm.pae);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, NULL, 0, pae);
-
-    if (!cpuid)
-        return;
-
-    xc_cpuid_set(ctx->xch, domid, info->cpuid);
+    xc_cpuid_apply_policy(ctx->xch, domid, NULL, 0, pae, info->cpuid);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.11.0


