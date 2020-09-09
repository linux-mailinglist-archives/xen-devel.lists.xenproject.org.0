Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D9262E6C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:21:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFz5f-00088E-Vl; Wed, 09 Sep 2020 12:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFz5e-000889-Fa
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:20:42 +0000
X-Inumbo-ID: 85efbaef-0aff-44b0-94d5-106a956b20e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85efbaef-0aff-44b0-94d5-106a956b20e4;
 Wed, 09 Sep 2020 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599654040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQy6vCrFWEhhuVu7XZ/+ZwaNr6hixGTHjf6yvc8hSzg=;
 b=PoIPItl4TCEO/LMKK3c0jKeAnZg14QWyO82iG/btDnGTmqPwDpQqOM0P
 fpg9CCPm7NlWd6R93CVGSKMPhdQDrh2e5vEn/ejKnGJzo6mEhHluFp7HQ
 qvQk7VF7IMiO1n+rwyG79Lw6ON7bb21y3oSBnWxa5eTlgcke5D6SihAAv Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7LZHr+YMUPhC6Cdpj8bIKNFJaWNVp7ttfUhq2faFkB7iIOmGqQHejf+B21kt6JYCgURzTelP9J
 FaU0eR4dCpHmbCC+cO7UdoODHTEBGTMZdCI2iS3cFunX9EzJPfd4hy+GXXrdUpEb+BSCkI52Bc
 bOOAF2zrC8dl1kPEOt9wIfdFSpEVdm6JYHTb+l6xMfXHbhD4hY4KJEfOlT/2VOBP4JqBMEveQC
 qFmYLwGtap5giuuBz/k2xOVcZybrnXtiCaTuNm5Sq4fYdv2ZJ4ZBSNv+z5zQqXWe5Oy9GqjV+J
 5IY=
X-SBRS: 2.7
X-MesageID: 26584036
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26584036"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ian Jackson
 <Ian.Jackson@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/cpuid: Untangle Invariant TSC handling
Date: Wed, 9 Sep 2020 13:20:13 +0100
Message-ID: <20200909122013.20613-1-andrew.cooper3@citrix.com>
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

ITSC being visible to the guest is currently implicit with the toolstack
unconditionally asking for it, and Xen clipping it based on the vTSC and/or
XEN_DOMCTL_disable_migrate settings.

This is problematic for several reasons.

First, the implicit vTSC behaviour manifests as a real bug on migration to a
host with a different frequency, with ITSC but without TSC scaling
capabilities, whereby the ITSC feature becomes advertised to the guest.  ITSC
will disappear again if the guest migrates to server with the same frequency
as the original, or to one with TSC scaling support.

Secondly, disallowing ITSC unless the guest doesn't migrate is conceptually
wrong.  It is common to have migration pools of identical hardware, at which
point the TSC frequency is nominally the same, and more modern hardware has
TSC scaling support anyway.  In both cases, it is safe to advertise ITSC and
migrate the guest.

Remove all implicit logic logic in Xen, and make ITSC part of the max CPUID
policies for guests.  Plumb an itsc parameter into xc_cpuid_apply_policy() and
have libxl__cpuid_legacy() fill in the two cases where it can reasonably
expect ITSC to be safe for the guest to see.

This is a behaviour change for TSC_MODE_NATIVE, where the ITSC will now
reliably not appear, and for the case where the user explicitly requests ITSC,
in which case it will appear even if the guest isn't marked as nomigrate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * Rebase over library changes
---
 tools/libs/ctrl/include/xenctrl.h           |  4 ++--
 tools/libs/guest/xg_cpuid_x86.c             | 12 ++++++------
 tools/libxl/libxl_cpuid.c                   | 19 ++++++++++++++++++-
 xen/arch/x86/cpuid.c                        |  8 --------
 xen/arch/x86/time.c                         |  2 --
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 4c89b7294c..0a921a95fa 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -1828,14 +1828,14 @@ struct xc_xend_cpuid {
  * cases, and the generated policy must be compatible with a 4.13.
  *
  * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae).
+ * features (@pae, @itsc).
  *
  * Then (optionally) apply legacy XEND overrides (@xend) to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
-                          unsigned int nr_features, bool pae,
+                          unsigned int nr_features, bool pae, bool itsc,
                           const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 0f24d6dd08..dc50106975 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -427,7 +427,7 @@ static int xc_cpuid_xend_policy(
 
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
-                          bool pae,
+                          bool pae, bool itsc,
                           const struct xc_xend_cpuid *xend)
 {
     int rc;
@@ -556,6 +556,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
     else
     {
+        p->extd.itsc = itsc;
+
         if ( di.hvm )
             p->basic.pae = pae;
     }
@@ -625,12 +627,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
 
         /*
-         * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM /
-         * XEN_DOMCTL_disable_migrate settings to be reflected correctly in
-         * CPUID.  Xen will discard these bits if configuration hasn't been
-         * set for the domain.
+         * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM
+         * to be reflected correctly in CPUID.  Xen will discard these bits if
+         * configuration hasn't been set for the domain.
          */
-        p->extd.itsc = true;
         p->basic.vmx = true;
         p->extd.svm = true;
     }
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index 8b570b7e27..f54eb83a90 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -421,6 +421,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                          libxl_domain_build_info *info)
 {
     bool pae = true;
+    bool itsc;
 
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
@@ -435,7 +436,23 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     if (info->type == LIBXL_DOMAIN_TYPE_HVM)
         pae = libxl_defbool_val(info->u.hvm.pae);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0, pae, info->cpuid);
+    /*
+     * Advertising Invariant TSC to a guest means that the TSC frequency won't
+     * change at any point in the future.
+     *
+     * We do not have enough information about potential migration
+     * destinations to know whether advertising ITSC is safe, but if the guest
+     * isn't going to migrate, then the current hardware is all that matters.
+     *
+     * Alternatively, an internal property of vTSC is that the values read are
+     * invariant.  Advertise ITSC when we know the domain will have emualted
+     * TSC everywhere it goes.
+     */
+    itsc = (libxl_defbool_val(info->disable_migrate) ||
+            info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+
+    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
+                          pae, itsc, info->cpuid);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 4b424fac95..23425790e1 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -621,14 +621,6 @@ void recalculate_cpuid_policy(struct domain *d)
     }
 
     /*
-     * ITSC is masked by default (so domains are safe to migrate), but a
-     * toolstack which has configured disable_migrate or vTSC for a domain may
-     * safely select it, and needs a way of doing so.
-     */
-    if ( cpu_has_itsc && (d->disable_migrate || d->arch.vtsc) )
-        __set_bit(X86_FEATURE_ITSC, max_fs);
-
-    /*
      * On hardware with MSR_TSX_CTRL, the admin may have elected to disable
      * TSX and hide the feature bits.  Migrating-in VMs may have been booted
      * pre-mitigation when the TSX features were visbile.
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 505e54ebd7..8938c0f435 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2448,8 +2448,6 @@ int tsc_set_info(struct domain *d,
         }
     }
 
-    recalculate_cpuid_policy(d);
-
     return 0;
 }
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index fc733e64f6..abd18722ee 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -246,7 +246,7 @@ XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
-XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */
+XEN_CPUFEATURE(ITSC,          7*32+ 8) /*a  Invariant TSC */
 XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
 
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
-- 
2.11.0


