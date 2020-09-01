Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE30258D33
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4BX-0000Xn-1L; Tue, 01 Sep 2020 11:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BV-0000V0-Ei
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:41 +0000
X-Inumbo-ID: 03185e43-8547-49d8-b993-550fe45a27ad
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03185e43-8547-49d8-b993-550fe45a27ad;
 Tue, 01 Sep 2020 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8HvuS2IX/VG66e6Pirdx+5CTSqndx03agTLark1mhbU=;
 b=MHv6riaZuHbduFfLocfaC2Uykbk7ctA8ckZbs+02guWT8fVqZSM1ZIQe
 cdUJp7evaIbZtCLArVRRuD+rDVgKu990/Nex0h7ljdLo55/oqzH5TDxXw
 S2EWQ1amdhD15EeFn1cgnA8J98XnrTbt2Ogv5GwQj6SywNB2b0gzQF43Q M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IOipEql4F+KsdYjDsrwAh/JCZOSJZovOmaDaRNzVMhL4fdKyy6FSF7XJ0nrhJDqCnr+wnQ4P+Y
 0XA3HE/Bwvt7ooLQTH9lxnM8wSabAcaWRTc9uRI6Hre+FYzM7jzQu1jivRKqt8sZ44PvUouHHo
 RG+Kzl4GECpSvwnoMZnkbhZ2hBGbrRDlAMxpRuO/HkQQsf6q4rTi+IQSWBYvdPaHTtKSCxMXQl
 +MKn4rLQUGfcDyhUx5tiQi+IUOefux6wk+4Cp1ZGQMgVn5Yxm+Ud9bm85F8b2+WGo5+Ukc2X32
 tu8=
X-SBRS: 2.7
X-MesageID: 26025440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26025440"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/8] x86/svm: handle BU_CFG and BU_CFG2 with cases
Date: Tue, 1 Sep 2020 12:54:41 +0200
Message-ID: <20200901105445.22277-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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

Move the special handling of reads to it's own switch case, and also
add support for BU_CFG2. On the write side ignore writes if the MSR is
readable, otherwise return a #GP.

This is in preparation for changing the default MSR read/write
behavior, which will instead return #GP on not explicitly handled
cases.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Move the handling of reads to it's own case.
 - Drop writes if the MSR is readable, else return a #GP.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 43 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index af584ff5d1..0e43154c7e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1864,6 +1864,30 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         *msr_content = 1ULL << 61; /* MC4_MISC.Locked */
         break;
 
+    case MSR_F10_BU_CFG:
+        if ( !rdmsr_safe(msr, *msr_content) )
+            break;
+
+        if ( boot_cpu_data.x86 == 0xf )
+        {
+            /*
+             * Win2k8 x64 reads this MSR on revF chips, where it wasn't
+             * publically available; it uses a magic constant in %rdi as a
+             * password, which we don't have in rdmsr_safe().  Since we'll
+             * ignore the later writes, just use a plausible value here (the
+             * reset value from rev10h chips) if the real CPU didn't provide
+             * one.
+             */
+            *msr_content = 0x0000000010200020ull;
+            break;
+        }
+        goto gpf;
+
+    case MSR_F10_BU_CFG2:
+        if ( rdmsr_safe(msr, *msr_content) )
+            goto gpf;
+        break;
+
     case MSR_IA32_EBC_FREQUENCY_ID:
         /*
          * This Intel-only register may be accessed if this HVM guest
@@ -1942,19 +1966,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     default:
         if ( rdmsr_safe(msr, *msr_content) == 0 )
             break;
-
-        if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
-        {
-            /* Win2k8 x64 reads this MSR on revF chips, where it
-             * wasn't publically available; it uses a magic constant
-             * in %rdi as a password, which we don't have in
-             * rdmsr_safe().  Since we'll ignore the later writes,
-             * just use a plausible value here (the reset value from
-             * rev10h chips) if the real CPU didn't provide one. */
-            *msr_content = 0x0000000010200020ull;
-            break;
-        }
-
         goto gpf;
     }
 
@@ -2110,6 +2121,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         nsvm->ns_msr_hsavepa = msr_content;
         break;
 
+    case MSR_F10_BU_CFG:
+    case MSR_F10_BU_CFG2:
+        if ( rdmsr_safe(msr, msr_content) )
+            goto gpf;
+        break;
+
     case MSR_AMD64_TSC_RATIO:
         if ( msr_content & TSC_RATIO_RSVD_BITS )
             goto gpf;
-- 
2.28.0


