Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B819C1C600C
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 20:27:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW2Gc-0000dU-SU; Tue, 05 May 2020 18:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jW2Gb-0000dP-V6
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 18:26:05 +0000
X-Inumbo-ID: de76600e-8efd-11ea-9de6-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de76600e-8efd-11ea-9de6-12813bfff9fa;
 Tue, 05 May 2020 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588703160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ozbTOxlqkPrt33bDOSsjlry+LZ5xJKDHpuhB5Brbp+4=;
 b=iPkDnDdPtyl4S8f9C0W/7KHrL/8NkiXgZi3bbVzt7xJtibQlPfpWD6sM
 xqTU30OKTLcRsiVr9YVBEfP39R4y8jTeXg1cPLrOKBa0XB2Ka6y0t0x1i
 z+Opz6XjNmnFMs9qgOJ9LlE91+376ZI9oH41xoYqhlzkw24ZhMpGSpwvk 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NzTDGMX+nHT7lgCRmFpXIaAAlMbE74v4a8FfpBFqO8jqZkVPiTNV275vF85+kVH7egwwd3xEhr
 pq4gtmxVkIhlBUTHOVMq1tmnn11xd3s/F+04B3746mysXtKy1QRq4X+Gpi0KF0u4AQ35v1os7y
 XuZdDCP48BlmpkhswZgK0UUPWCljIKNLRigOQkoCnIjph5o0+9/FYlMBI7Rn2VJFzUt8WQQf2Z
 t/4dVIQEvc9GsEMEBk9AtONcm1Q2wRDz+qbciu695xD9aIA2mO/LXT8K+GoLk1ZtmfFvbanGxz
 ivA=
X-SBRS: 2.7
X-MesageID: 17067254
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,356,1583211600"; d="scan'208";a="17067254"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: Use flush-by-asid when available
Date: Tue, 5 May 2020 19:25:39 +0100
Message-ID: <20200505182539.12247-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

AMD Fam15h processors introduced the flush-by-asid feature, for more fine
grain flushing purposes.

Flushing everything including ASID 0 (i.e. Xen context) is an an unnecesserily
large hammer, and never necessary in the context of guest TLBs needing
invalidating.

When available, use TLB_CTRL_FLUSH_ASID in preference to TLB_CTRL_FLUSH_ALL.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

The APM currently describes tlb_control encoding 1 as "Flush entire
TLB (Should be used only by legacy hypervisors.)".  AMD have agreed that this
is misleading and should say "legacy hardware" instead.

This change does come with a minor observed perf improvement on Fam17h
hardware, of ~0.6s over ~22s for my XTF pagewalk test.  This test will spot
TLB flushing issues, but isn't optimal for spotting the perf increase from
better flushing.  There were no observed differences for Fam15h, but this
could simply mean that the measured code footprint was larger than the TLB on
this CPU.
---
 xen/arch/x86/hvm/svm/asid.c       | 9 ++++++---
 xen/include/asm-x86/hvm/svm/svm.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 9be90058c7..ab06dd3f3a 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -18,6 +18,7 @@
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/asid.h>
+#include <asm/hvm/svm/svm.h>
 
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
@@ -47,15 +48,17 @@ void svm_asid_handle_vmrun(void)
     if ( p_asid->asid == 0 )
     {
         vmcb_set_guest_asid(vmcb, 1);
-        /* TODO: investigate using TLB_CTRL_FLUSH_ASID here instead. */
-        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
+        vmcb->tlb_control =
+            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
         return;
     }
 
     if ( vmcb_get_guest_asid(vmcb) != p_asid->asid )
         vmcb_set_guest_asid(vmcb, p_asid->asid);
 
-    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
+    vmcb->tlb_control =
+        !need_flush ? TLB_CTRL_NO_FLUSH :
+        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index 16a994ec74..cd71402cbb 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -79,6 +79,7 @@ extern u32 svm_feature_flags;
 #define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
 #define cpu_has_svm_nrips     cpu_has_svm_feature(SVM_FEATURE_NRIPS)
 #define cpu_has_svm_cleanbits cpu_has_svm_feature(SVM_FEATURE_VMCBCLEAN)
+#define cpu_has_svm_flushbyasid cpu_has_svm_feature(SVM_FEATURE_FLUSHBYASID)
 #define cpu_has_svm_decode    cpu_has_svm_feature(SVM_FEATURE_DECODEASSISTS)
 #define cpu_has_svm_vgif      cpu_has_svm_feature(SVM_FEATURE_VGIF)
 #define cpu_has_pause_filter  cpu_has_svm_feature(SVM_FEATURE_PAUSEFILTER)
-- 
2.11.0


