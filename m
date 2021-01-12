Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D272F26F0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 05:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65467.116005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzB83-00062t-Vb; Tue, 12 Jan 2021 04:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65467.116005; Tue, 12 Jan 2021 04:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzB83-00062R-Ri; Tue, 12 Jan 2021 04:17:59 +0000
Received: by outflank-mailman (input) for mailman id 65467;
 Tue, 12 Jan 2021 04:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPAB=GP=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kzB82-000625-B6
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 04:17:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d131cd43-bdbc-4a38-bd31-13ad004bc64a;
 Tue, 12 Jan 2021 04:17:54 +0000 (UTC)
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
X-Inumbo-ID: d131cd43-bdbc-4a38-bd31-13ad004bc64a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610425074;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=oIj35uounZ+rhol3JJbZuCDY/ZxNEEE5xnBrab6NsUY=;
  b=E0PDIKq0htX1OGUT5jsfvTjbcNJ5+hpvgmXjgEnsVnK7GDJToJ4dGycK
   cR3WconI6rAektHuQ8BLPGNW4H4ieMoEQD/UEYCEL8rQbYMQ5RsfDbev6
   kgaHrG5A+VULgR6hPKotRJ2m0Fqn51OpUJDbranBZ4gN9eTSao1pO/niA
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +rMQRbnFPeyg/Dqch+yN+E/DHjW1BoiIBNk1QAJmXhyWA3ACGkjTNI5QYOcb+OR5ow5osn3RlR
 mZunUJWG8FZR0qE971N/fHcbqoB+Sic5J8BfFWdLv9+BJjX6XAs+J7oIzLgZfM6BL6HLAWvaaL
 8rDYZGvp14JJ1C0apB1wNAth/ZZmyVSZnvXxRFsS2N17S8B/szjBKYskIAf0KEBDBeD4m2bLaz
 grdTRvSw+RORxxd0J7DOlTbRHGIiXIllHwTdvVv+8xqa7wfDBJszEeAMWR6W75Nhl9qCUrIU3F
 3rA=
X-SBRS: 5.2
X-MesageID: 35099494
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,340,1602561600"; 
   d="scan'208";a="35099494"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
	<roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Tue, 12 Jan 2021 04:17:27 +0000
Message-ID: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

TLFS 7.8.1 stipulates that "a virtual processor index must be less than
the maximum number of virtual processors per partition" that "can be obtained
through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
the Microsoft Hypervisor Interface" defines that starting from Windows Server
2012, which allowed more than 64 CPUs to be brought up, this leaf can now
contain a value -1 basically assuming the hypervisor has no restriction while
0 (that we currently expose) means the default restriction is still present.

Along with the previous changes exposing ExProcessorMasks this allows a recent
Windows VM with Viridian extension enabled to have more than 64 vCPUs without
going into BSOD in some cases.

Since we didn't expose the leaf before and to keep CPUID data consistent for
incoming streams from previous Xen versions - let's keep it behind an option.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- expose the option in libxl
---
 docs/man/xl.cfg.5.pod.in             |  9 ++++++++-
 tools/include/libxl.h                |  6 ++++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_x86.c         |  4 ++++
 xen/arch/x86/hvm/viridian/viridian.c | 23 +++++++++++++++++++++++
 xen/include/public/hvm/params.h      |  7 ++++++-
 6 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c8e017f..3467eae 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2260,11 +2260,18 @@ mask. Hence this enlightenment must be specified for guests with more
 than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are also
 specified.
 
+=item B<no_vp_limit>
+
+This group when set indicates to a guest that the hypervisor does not
+explicitly have any limits on the number of Virtual processors a guest
+is allowed to bring up. It is strongly recommended to keep this enabled
+for guests with more than 64 vCPUs.
+
 =item B<defaults>
 
 This is a special value that enables the default set of groups, which
 is currently the B<base>, B<freq>, B<time_ref_count>, B<apic_assist>,
-B<crash_ctl> and B<stimer> groups.
+B<crash_ctl>, B<stimer> and B<no_vp_limit> groups.
 
 =item B<all>
 
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3433c95..be1e288 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -452,6 +452,12 @@
 #define LIBXL_HAVE_VIRIDIAN_EX_PROCESSOR_MASKS 1
 
 /*
+ * LIBXL_HAVE_VIRIDIAN_NO_VP_LIMIT indicates that the 'no_vp_limit' value
+ * is present in the viridian enlightenment enumeration.
+ */
+#define LIBXL_HAVE_VIRIDIAN_NO_VP_LIMIT 1
+
+/*
  * LIBXL_HAVE_DEVICE_PCI_LIST_FREE indicates that the
  * libxl_device_pci_list_free() function is defined.
  */
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0532473..8502b29 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -239,6 +239,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
     (8, "stimer"),
     (9, "hcall_ipi"),
     (10, "ex_processor_masks"),
+    (11, "no_vp_limit"),
     ])
 
 libxl_hdtype = Enumeration("hdtype", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 86d2729..5c4c194 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -309,6 +309,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_TIME_REF_COUNT);
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
+        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
     }
 
     libxl_for_each_set_bit(v, info->u.hvm.viridian_enable) {
@@ -369,6 +370,9 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
     if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_EX_PROCESSOR_MASKS))
         mask |= HVMPV_ex_processor_masks;
 
+    if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT))
+        mask |= HVMPV_no_vp_limit;
+
     if (mask != 0 &&
         xc_hvm_param_set(CTX->xch,
                          domid,
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index ed97804..ae1ea86 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -209,6 +209,29 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->b = viridian_spinlock_retry_count;
         break;
 
+    case 5:
+        /*
+         * From "Requirements for Implementing the Microsoft Hypervisor
+         *  Interface":
+         *
+         * "On Windows operating systems versions through Windows Server
+         * 2008 R2, reporting the HV#1 hypervisor interface limits
+         * the Windows virtual machine to a maximum of 64 VPs, regardless of
+         * what is reported via CPUID.40000005.EAX.
+         *
+         * Starting with Windows Server 2012 and Windows 8, if
+         * CPUID.40000005.EAX containsa value of -1, Windows assumes that
+         * the hypervisor imposes no specific limit to the number of VPs.
+         * In this case, Windows Server 2012 guest VMs may use more than 64
+         * VPs, up to the maximum supported number of processors applicable
+         * to the specific Windows version being used."
+         *
+         * For compatibility we hide it behind an option.
+         */
+        if ( viridian_feature_mask(d) & HVMPV_no_vp_limit )
+            res->a = -1;
+        break;
+
     case 6:
         /* Detected and in use hardware features. */
         if ( cpu_has_vmx_virtualize_apic_accesses )
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 3b0a0f4..805f4ca 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -168,6 +168,10 @@
 #define _HVMPV_ex_processor_masks 10
 #define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
 
+/* Allow more than 64 VPs */
+#define _HVMPV_no_vp_limit 11
+#define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
+
 #define HVMPV_feature_mask \
         (HVMPV_base_freq | \
          HVMPV_no_freq | \
@@ -179,7 +183,8 @@
          HVMPV_synic | \
          HVMPV_stimer | \
          HVMPV_hcall_ipi | \
-         HVMPV_ex_processor_masks)
+         HVMPV_ex_processor_masks | \
+         HVMPV_no_vp_limit)
 
 #endif
 
-- 
2.7.4


