Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC691F99D1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpu9-0007uK-1n; Mon, 15 Jun 2020 14:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpu8-0007qe-5t
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:04 +0000
X-Inumbo-ID: b92196c2-af12-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b92196c2-af12-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mIjdbp5dwfK4SNh/gtIzQUviUFY1+aoEexNg9HA4wjQnxRIKigFWSgQALaJLKqpjAvgXbq0T9X
 zOmMSjph7GeFokY7BEcVNQDr+sC8YDCXZ5Dc/yO+h0c1ql9vgHwMwU9CjD/Z1u62LisAAIt7TS
 E5PVQLCSyuqiE0xGXtCIjWpjf10/vGP5jdltHz0YM42JO5+4PHRZ3/L8tLkFosOYZyjp4cRMUo
 Dj/jt+/3GDPsJELVvtcuBPV3Vs1Tk5U9a4ICmtra0D/r33ukOBV8Ose34QxYYqJWg9LV4N7xPx
 AAM=
X-SBRS: 2.7
X-MesageID: 20064838
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064838"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 9/9] x86/spec-ctrl: Hide RDRAND by default on IvyBridge
Date: Mon, 15 Jun 2020 15:15:32 +0100
Message-ID: <20200615141532.1927-10-andrew.cooper3@citrix.com>
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

To combat the absence of mitigating microcode, arrange to hide RDRAND by
default on IvyBridge hardware.

Adjust the default feature derivation to hide RDRAND on IvyBridge client
parts, unless `cpuid=rdrand` is explicitly provided.

Adjust the restore path in xc_cpuid_apply_policy() to not hide RDRAND from VMs
which migrated from pre-4.14.

In all cases, individual guests can continue using RDRAND if explicitly
enabled in their config files.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 docs/misc/xen-command-line.pandoc           | 20 +++++++++++++++-----
 tools/libxc/xc_cpuid_x86.c                  |  3 +++
 xen/arch/x86/cpuid.c                        | 21 +++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 4 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index fde749c669..c8ebfaf813 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -512,11 +512,21 @@ The Speculation Control hardware features `srbds-ctrl`, `md-clear`, `ibrsb`,
 `stibp`, `ibpb`, `l1d-flush` and `ssbd` are used by default if available and
 applicable.  They can all be ignored.
 
-`rdrand` and `rdseed` can be ignored, as a mitigation to XSA-320 /
-CVE-2020-0543.  The RDRAND feature is disabled by default on certain AMD
-systems, due to possible malfunctions after ACPI S3 suspend/resume.  `rdrand`
-may be used in its positive form to override Xen's default behaviour on these
-systems, and make the feature fully usable.
+`rdrand` and `rdseed` have multiple interactions.
+
+*   For Special Register Buffer Data Sampling (SRBDS, XSA-320, CVE-2020-0543),
+    RDRAND and RDSEED can be ignored.
+
+    Due to the absence microcode to address SRBDS on IvyBridge hardware, the
+    RDRAND feature is hidden by default for guests, unless `rdrand` is used in
+    its positive form.  Irrespective of the default setting here, VMs can use
+    RDRAND if explicitly enabled in guest config file, and VMs already using
+    RDRAND can migrate in.
+
+*   The RDRAND feature is disabled by default on AMD Fam15/16 systems, due to
+    possible malfunctions after ACPI S3 suspend/resume.  `rdrand` may be used
+    in its positive form to override Xen's default behaviour on these systems,
+    and make the feature fully usable.
 
 ### cpuid_mask_cpu
 > `= fam_0f_rev_[cdefg] | fam_10_rev_[bc] | fam_11_rev_b`
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index 5649913e69..877a5601f3 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -503,6 +503,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
      */
     if ( restore )
     {
+        if ( test_bit(X86_FEATURE_RDRAND, host_featureset) && !p->basic.rdrand )
+            p->basic.rdrand = true;
+
         if ( di.hvm )
         {
             p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index f2fc0aa895..6a4a787b68 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -340,6 +340,25 @@ static void __init calculate_host_policy(void)
     }
 }
 
+static void __init guest_common_default_feature_adjustments(uint32_t *fs)
+{
+    /*
+     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
+     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
+     * compensate.
+     *
+     * Mitigate by hiding RDRAND from guests by default, unless explicitly
+     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
+     * default setting, guests can use RDRAND if explicitly enabled
+     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
+     * previously using RDRAND can migrate in.
+     */
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
+         cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
+        __clear_bit(X86_FEATURE_RDRAND, fs);
+}
+
 static void __init guest_common_feature_adjustments(uint32_t *fs)
 {
     /* Unconditionally claim to be able to set the hypervisor bit. */
@@ -403,6 +422,7 @@ static void __init calculate_pv_def_policy(void)
         pv_featureset[i] &= pv_def_featuremask[i];
 
     guest_common_feature_adjustments(pv_featureset);
+    guest_common_default_feature_adjustments(pv_featureset);
 
     sanitise_featureset(pv_featureset);
     cpuid_featureset_to_policy(pv_featureset, p);
@@ -485,6 +505,7 @@ static void __init calculate_hvm_def_policy(void)
         hvm_featureset[i] &= hvm_featuremask[i];
 
     guest_common_feature_adjustments(hvm_featureset);
+    guest_common_default_feature_adjustments(hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index af1b8a96a6..fe7492a225 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -149,7 +149,7 @@ XEN_CPUFEATURE(XSAVE,         1*32+26) /*A  XSAVE/XRSTOR/XSETBV/XGETBV */
 XEN_CPUFEATURE(OSXSAVE,       1*32+27) /*!  OSXSAVE */
 XEN_CPUFEATURE(AVX,           1*32+28) /*A  Advanced Vector Extensions */
 XEN_CPUFEATURE(F16C,          1*32+29) /*A  Half-precision convert instruction */
-XEN_CPUFEATURE(RDRAND,        1*32+30) /*A  Digital Random Number Generator */
+XEN_CPUFEATURE(RDRAND,        1*32+30) /*!A Digital Random Number Generator */
 XEN_CPUFEATURE(HYPERVISOR,    1*32+31) /*!A Running under some hypervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000001.edx, word 2 */
-- 
2.11.0


