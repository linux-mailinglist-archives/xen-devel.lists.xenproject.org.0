Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B41F99D6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpuE-0007yW-OR; Mon, 15 Jun 2020 14:16:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpuD-0007qe-5j
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:09 +0000
X-Inumbo-ID: b9b798b6-af12-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9b798b6-af12-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2lfisGOrd28c2GHAkOxBetBR4iUWm8SYG26l+LvzWyEiWbJePzyrFu8YSqnIWQt7VhZpV3f5Qp
 6cjLb0bru0DW2nnuPoOXWqO51adVrVcHkWN+V7Xlhe+IKMP/fG4iqhytYUN2pHXdJZWxupvQz2
 z5nialtJnULBif0S2RTGHZ371kp4MjU9O2tYVeL10Y5wL+ThjK0qtlG4iOi7djdwfUhg5bjPJs
 mOyd4IKjyS2zx5bwiugaVrKwZziG+BbpkxDscjSl7739tiSqCVnLTg+bin7TgXutUSZAqJrQmQ
 mF4=
X-SBRS: 2.7
X-MesageID: 20064839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064839"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 5/9] tools/libx[cl]: Plumb bool restore down into
 xc_cpuid_apply_policy()
Date: Mon, 15 Jun 2020 15:15:28 +0100
Message-ID: <20200615141532.1927-6-andrew.cooper3@citrix.com>
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

In order to safely disable some features by default, without breaking
migration from 4.13 or older, the CPUID logic needs to distinguish the two
cases.

Plumb a restore boolean down from the two callers of libxl__cpuid_legacy() all
the way down into xc_cpuid_apply_policy().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>

Ideally, I'd have started the brand new CPUID/MSR interface for the boot path
before cleaning up the legacy path, but that's far too much work to squeeze
into 4.14 at this point.  The restore boolean will do for now, and will
disappear eventually.
---
 tools/libxc/include/xenctrl.h | 7 ++++++-
 tools/libxc/xc_cpuid_x86.c    | 2 +-
 tools/libxl/libxl_cpuid.c     | 4 ++--
 tools/libxl/libxl_create.c    | 2 +-
 tools/libxl/libxl_dom.c       | 2 +-
 tools/libxl/libxl_internal.h  | 2 +-
 tools/libxl/libxl_nocpuid.c   | 2 +-
 7 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 5f0978e0e5..634be88ac1 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1822,13 +1822,18 @@ struct xc_xend_cpuid {
 /*
  * Make adjustments to the CPUID settings for a domain.
  *
+ * This path is used in two cases.  First, for fresh boots of the domain, and
+ * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
+ * missing from the stream).  The @restore parameter distinguishes these
+ * cases, and the generated policy must be compatible with a 4.13.
+ *
  * Either pass a full new @featureset (and @nr_features), or adjust individual
  * features (@pae).
  *
  * Then (optionally) apply legacy XEND overrides (@xend) to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid,
+                          uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae,
                           const struct xc_xend_cpuid *xend);
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index 26a7b94dcf..e017abffce 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -425,7 +425,7 @@ static int xc_cpuid_xend_policy(
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
+int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae,
                           const struct xc_xend_cpuid *xend)
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index edfcf315ca..db2f12d115 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -416,7 +416,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
+void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                          libxl_domain_build_info *info)
 {
     bool pae = true;
@@ -434,7 +434,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
     if (info->type == LIBXL_DOMAIN_TYPE_HVM)
         pae = libxl_defbool_val(info->u.hvm.pae);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, NULL, 0, pae, info->cpuid);
+    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0, pae, info->cpuid);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 75862dc6ed..2814818e34 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1447,7 +1447,7 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
      * stream doesn't contain any CPUID data.
      */
     if (missing & XGR_SDD_MISSING_CPUID)
-        libxl__cpuid_legacy(ctx, dcs->guest_domid, info);
+        libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
 
     return 0;
 }
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index dd1aff89a3..f8661e90d4 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -391,7 +391,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
     if (!state->restore)
-        libxl__cpuid_legacy(ctx, domid, info);
+        libxl__cpuid_legacy(ctx, domid, false, info);
 
     return rc;
 }
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 79c2bf5f5e..94a23179d3 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2056,7 +2056,7 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
-_hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
+_hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                  libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
diff --git a/tools/libxl/libxl_nocpuid.c b/tools/libxl/libxl_nocpuid.c
index 3f30e148be..f47336565b 100644
--- a/tools/libxl/libxl_nocpuid.c
+++ b/tools/libxl/libxl_nocpuid.c
@@ -34,7 +34,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
+void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                          libxl_domain_build_info *info)
 {
 }
-- 
2.11.0


