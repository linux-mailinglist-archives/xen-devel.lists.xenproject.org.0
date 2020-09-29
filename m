Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8B27CFD3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 15:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212.493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNG0T-0006xT-UT; Tue, 29 Sep 2020 13:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212.493; Tue, 29 Sep 2020 13:49:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNG0T-0006x4-RB; Tue, 29 Sep 2020 13:49:25 +0000
Received: by outflank-mailman (input) for mailman id 212;
 Tue, 29 Sep 2020 13:49:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhT6=DG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNG0S-0006wz-La
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:49:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38801b58-c978-4da6-989b-b80416297ff5;
 Tue, 29 Sep 2020 13:49:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dhT6=DG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNG0S-0006wz-La
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:49:24 +0000
X-Inumbo-ID: 38801b58-c978-4da6-989b-b80416297ff5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 38801b58-c978-4da6-989b-b80416297ff5;
	Tue, 29 Sep 2020 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601387362;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=HC6SnQwiIswEb/tmrOppoZWsZUS9u8+dTDPCo4DGq8I=;
  b=Aq9XdewgYz6v7Eq972nvzg+skJrdLs6fNPNaEgrLPbC18RDvXR3URpeG
   5aNvRZRFNJMeipZJGHbzAy+I25JTPBCZDmM8amE2WRnWn8fcDyx+9rQDY
   WrNbzZrqSiWGu2G9NaZqORLMl2/s1S4Pd6mdTzuFeQnHKgymRUUafSQry
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GW8zXtrP6E+5JtP8oyRke7XsDkYobemc9lbpl37BByomVijQ51uc2IEmUOGX/yp8HALSw8Ljdz
 LcJkgTOY1/eyvsxyU9e9kFQEurakNGBYDrejZbyryFkh+xFNzxMSgm6pOcVUNIJWfBj4wIk+s6
 0yQEPNZoYusQzQXyZOGZIhehOEHiGIHpnVfcDCg6n0m0oSKjFxXAvWqyJ5vk495YWpIU1jeGwZ
 kP/OtpQEGXc8Cy9q5W+JB0KrhFQ4Sm/7lQFOpDQwHHvYHXs3SnOAuaTyMZc+Mmp3EMpjBiusPA
 8Jw=
X-SBRS: None
X-MesageID: 28194556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="28194556"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH] tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
Date: Tue, 29 Sep 2020 14:48:52 +0100
Message-ID: <20200929134852.9235-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Nested Virt is the final special case in legacy CPUID handling.  Pass the
(poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
the semantic dependency on HVM_PARAM_NESTEDHVM.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/ctrl/include/xenctrl.h |  4 ++--
 tools/libs/guest/xg_cpuid_x86.c   | 14 +++++---------
 tools/libxl/libxl_cpuid.c         |  3 ++-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 73e9535fc8..ba70bec9c4 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -1826,7 +1826,7 @@ struct xc_xend_cpuid {
  * cases, and the generated policy must be compatible with a 4.13.
  *
  * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc).
+ * features (@pae, @itsc, @nested_virt).
  *
  * Then (optionally) apply legacy XEND overrides (@xend) to the result.
  */
@@ -1834,7 +1834,7 @@ int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
-                          const struct xc_xend_cpuid *xend);
+                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index dc50106975..aae6931a11 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -427,7 +427,7 @@ static int xc_cpuid_xend_policy(
 
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc,
+                          bool pae, bool itsc, bool nested_virt,
                           const struct xc_xend_cpuid *xend)
 {
     int rc;
@@ -559,7 +559,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         p->extd.itsc = itsc;
 
         if ( di.hvm )
+        {
             p->basic.pae = pae;
+            p->basic.vmx = nested_virt;
+            p->extd.svm = nested_virt;
+        }
     }
 
     if ( !di.hvm )
@@ -625,14 +629,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             }
             break;
         }
-
-        /*
-         * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM
-         * to be reflected correctly in CPUID.  Xen will discard these bits if
-         * configuration hasn't been set for the domain.
-         */
-        p->basic.vmx = true;
-        p->extd.svm = true;
     }
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index f54eb83a90..08e85dcffb 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -422,6 +422,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 {
     bool pae = true;
     bool itsc;
+    bool nested_virt = libxl_defbool_val(info->nested_hvm);
 
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
@@ -452,7 +453,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                          pae, itsc, info->cpuid);
+                          pae, itsc, nested_virt, info->cpuid);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.11.0


