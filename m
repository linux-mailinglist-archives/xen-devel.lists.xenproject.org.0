Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41322A7BE5E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 15:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938259.1339189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hT8-0000tE-Lc; Fri, 04 Apr 2025 13:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938259.1339189; Fri, 04 Apr 2025 13:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hT8-0000rV-Ho; Fri, 04 Apr 2025 13:52:26 +0000
Received: by outflank-mailman (input) for mailman id 938259;
 Fri, 04 Apr 2025 13:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JJrA=WW=bounce.vates.tech=bounce-md_30504962.67efe412.v1-57e71f5af35149d8a34943717485ba4f@srs-se1.protection.inumbo.net>)
 id 1u0hT7-0000qo-4E
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 13:52:25 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0630c483-115c-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 15:52:19 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZTg5Z3Tbnz705mdc
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 13:52:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 57e71f5af35149d8a34943717485ba4f; Fri, 04 Apr 2025 13:52:18 +0000
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
X-Inumbo-ID: 0630c483-115c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743774738; x=1744044738;
	bh=LN9JfEv4G0O3BbLHkaCk2NpM2eltoGV6GWKw+Cf44zs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=a5ykMxaXpCa50WHQ4x280jHt4pItLfA86X+HDbUIdx4HLysFvFT6KPtUnflyUgLx3
	 uTzg0RihgL+sx+3X7VfKmJr5PbwHkfZ4ukULNvzficqAMKE9z27usEcDjsrrSaniRJ
	 CKTH7gs7pj47xTqOvOVmgjCNkzTWhrhe4TDRUITDJWileVQ/zzSpRXblgs5dhFOmwR
	 vq91sk4pP3wUmrRH6SywiUN9IRYYF15A+17EJufx5i3UfYxeyI2BmEEGWl2MROdRZ7
	 g7NECuQebq4VbBz2tivuyHP8PrxD/g9gWbjnHB/kfHdST1yndhN1T9oasr3/iuZKto
	 Ill9dOcpDqR/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743774738; x=1744035238; i=teddy.astie@vates.tech;
	bh=LN9JfEv4G0O3BbLHkaCk2NpM2eltoGV6GWKw+Cf44zs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fwtG2qpa6yJq9o/L0+O2EpFr1URgCOGYsE563ESYYKLO5k3jzfNk85ZEVrGnPG0sl
	 AawkUKMA6yks+j9dyrfYecfR/IpQSJuYcvkGDOpwMBJDNWWsIInppoZmL05b6U/jRo
	 xXYMyIr3hoodXvqUH5bxAZvM3M8AqX0mlTx+zOtXRQrYMsrHWhdcjDJsqUT858fYFe
	 t6YIZJH/0plj1SIiv8eyb6RA81F3lZESCQgEsyAVURV+zxP4FiIO+PS5wtuFT/S+v3
	 MntarkMVoGONYCGQ23zxzsLJTI6U7FCUPi6adG75nui3zY6jZntrSCVDJBif0M2zyG
	 BL4FUyXXU2vPQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=201/2]=20x86/amd:=20Add=20guest=20support=20for=20AMD=20TCE?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743774737788
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.57e71f5af35149d8a34943717485ba4f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 13:52:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

AMD Translation Cache Extension is a flag that can be enabled in the EFER MSR to optimize
some TLB flushes. Expose this flag to guest if supported by hardware.

Only expose this feature to HAP-enabled guests. Guests with shadow paging guests have
their TLB flush operations intercepted and handled separately, without taking account
to this flag. PV guest follows Xen TLB flush behavior.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v3:
 - hide from PV guests
 - review commit description
---
 CHANGELOG.md                                | 1 +
 xen/arch/x86/hvm/hvm.c                      | 3 +++
 xen/arch/x86/include/asm/msr-index.h        | 3 ++-
 xen/arch/x86/pv/emul-priv-op.c              | 4 ++--
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8f6afa5c85..dbfecefbd4 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
+   - Guest support for AMD Translation Cache Extension feature.
 
 ### Removed
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5950f3160f..184357b042 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -959,6 +959,9 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
     if ( (value & EFER_FFXSE) && !p->extd.ffxsr )
         return "FFXSE without feature";
 
+    if ( (value & EFER_TCE) && !p->extd.tce )
+        return "TCE without feature";
+
     if ( (value & EFER_AIBRSE) && !p->extd.auto_ibrs )
         return "AutoIBRS without feature";
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..d8576aec1c 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -200,11 +200,12 @@
 #define  EFER_NXE                           (_AC(1, ULL) << 11) /* No Execute Enable */
 #define  EFER_SVME                          (_AC(1, ULL) << 12) /* Secure Virtual Machine Enable */
 #define  EFER_FFXSE                         (_AC(1, ULL) << 14) /* Fast FXSAVE/FXRSTOR */
+#define  EFER_TCE                           (_AC(1, ULL) << 15) /* Translation Cache Extensions */
 #define  EFER_AIBRSE                        (_AC(1, ULL) << 21) /* Automatic IBRS Enable */
 
 #define EFER_KNOWN_MASK \
     (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
-     EFER_AIBRSE)
+     EFER_TCE | EFER_AIBRSE)
 
 #define MSR_STAR                            _AC(0xc0000081, U) /* legacy mode SYSCALL target */
 #define MSR_LSTAR                           _AC(0xc0000082, U) /* long mode SYSCALL target */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 70150c2722..531228b2da 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -857,8 +857,8 @@ static uint64_t guest_efer(const struct domain *d)
 {
     uint64_t val;
 
-    /* Hide unknown bits, and unconditionally hide SVME and AIBRSE from guests. */
-    val = read_efer() & EFER_KNOWN_MASK & ~(EFER_SVME | EFER_AIBRSE);
+    /* Hide unknown bits, and unconditionally hide SVME, TCE and AIBRSE from guests. */
+    val = read_efer() & EFER_KNOWN_MASK & ~(EFER_SVME | EFER_TCE | EFER_AIBRSE);
     /*
      * Hide the 64-bit features from 32-bit guests.  SCE has
      * vendor-dependent behaviour.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index cc6e984a88..8182d2dbed 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -170,6 +170,7 @@ XEN_CPUFEATURE(SKINIT,        3*32+12) /*   SKINIT/STGI instructions */
 XEN_CPUFEATURE(WDT,           3*32+13) /*   Watchdog timer */
 XEN_CPUFEATURE(LWP,           3*32+15) /*   Light Weight Profiling */
 XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
+XEN_CPUFEATURE(TCE,           3*32+17) /*H  Translation Cache Extension support */
 XEN_CPUFEATURE(NODEID_MSR,    3*32+19) /*   NodeId MSR */
 XEN_CPUFEATURE(TBM,           3*32+21) /*A  trailing bit manipulations */
 XEN_CPUFEATURE(TOPOEXT,       3*32+22) /*   topology extensions CPUID leafs */
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


