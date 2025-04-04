Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A9A7BA3A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 11:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938000.1338841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dgF-00055J-Sm; Fri, 04 Apr 2025 09:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938000.1338841; Fri, 04 Apr 2025 09:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dgF-00053J-Or; Fri, 04 Apr 2025 09:49:43 +0000
Received: by outflank-mailman (input) for mailman id 938000;
 Fri, 04 Apr 2025 09:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoQk=WW=bounce.vates.tech=bounce-md_30504962.67efab2f.v1-c3e6aab71ed94423bea11c3c0a6a19ba@srs-se1.protection.inumbo.net>)
 id 1u0dgE-0004pH-1U
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 09:49:42 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1de0ab3a-113a-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 11:49:36 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZTYjW1nSvzS62PwT
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 09:49:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c3e6aab71ed94423bea11c3c0a6a19ba; Fri, 04 Apr 2025 09:49:35 +0000
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
X-Inumbo-ID: 1de0ab3a-113a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743760175; x=1744030175;
	bh=L6j027iimQgxGcnmldIIXGn1WhbaXyI2jdeQ52zotUM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ke4Q9YBpahNvj6SX0beD4t4f6eTW79lJByjoNk/qYYCcJRENMiyMVMMCm6j5sMWVp
	 CHlkdSFfhbxAqJ+O1p6uSSl8x204nOaoKhQmPLEskLsFOKYHosBfIaa1w8FQ4o7TEp
	 3XLp0sjMEMaON3Os034DJZFyw+cABLE8r26rWzwQoAxc6OXd2SJcCwqIT4TtB6zaSP
	 MnyO1+OHEjazvjVLp32maXXRntZ0njO6nXd0SWSiOE0/DxPEcVdcfW/fIJzSoGxjaa
	 VOkFJlXoiairinZQvOHCKWTtsNBhWtp1n48xcSPv2FZDFwGcKIV/dSo/SaiKgjn5m1
	 8WSFkSsBvSD/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743760175; x=1744020675; i=teddy.astie@vates.tech;
	bh=L6j027iimQgxGcnmldIIXGn1WhbaXyI2jdeQ52zotUM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M9TEAbZx34JpPJfz1gHk2GzHZmQxKFd2+n3ZWaOQ7bl7RzIteCwtz0o8fHBzOHo1L
	 HIb/xk0C7UUC8MrwBkU9vlz4GKdcJsdWSxvvtn+MCtGRXcPd0KKKfQf+/4mtD6nHvy
	 IWdfYZPBieChbYNu0uJivHvx/phLycPViSzatuJCDcG98Tx6bB1+A41WJLm5fOnyNB
	 RmXDN9d+PzQ+KrqrUvNGNtAkJYF7usgR13iAJnDK4KDexWlPq1OsmdtVTrySJEmzU8
	 rxeQ+yzCFFXXpCl/ItxgZ5Cncv8awSTnwhLd01V2LD5wNaEaZP7fTSYqOvrwTtH0Jb
	 Nf29GRb+rSelg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=201/2]=20x86/amd:=20Add=20guest=20support=20for=20AMD=20TCE?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743760173257
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <885867a86eb41fd78df24b6599312b54be8e20ca.1743756934.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1743756934.git.teddy.astie@vates.tech>
References: <cover.1743756934.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c3e6aab71ed94423bea11c3c0a6a19ba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 09:49:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

AMD Translation Cache Extension is a flag that can be enabled in the EFER MSR to optimize
some TLB flushes. Expose this flag to guest if supported by hardware.

AMD Architecture Developer Manual describe this feature as follow
> Setting this bit to 1 changes how the INVLPG, INVLPGB, and INVPCID instructions operate
> on TLB entries. When this bit is 0, these instructions remove the target PTE from the
> TLB as well as all upper-level table entries that are cached in the TLB, whether or not
> they are associated with the target PTE. When this bit is set, these instructions will
> remove the target PTE and only those upper-level entries that lead to the target PTE in
> the page table hierarchy, leaving unrelated upper-level entries intact. This may provide
> a performance benefit.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 CHANGELOG.md                                | 1 +
 xen/arch/x86/hvm/hvm.c                      | 3 +++
 xen/arch/x86/include/asm/msr-index.h        | 3 ++-
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

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



 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


