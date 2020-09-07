Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CD25F86B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 12:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERd-0003cQ-DC; Mon, 07 Sep 2020 10:32:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERc-0003cB-Gj
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:16 +0000
X-Inumbo-ID: f4464927-a6c5-4881-9e4a-d42f82744206
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4464927-a6c5-4881-9e4a-d42f82744206;
 Mon, 07 Sep 2020 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNV86Ew3LjH2EpK4D+vMA6EdX9DQt3c+LWEiRgDNDAU=;
 b=VpNrSLsn6XVanN4YTjPLuu2rz3vlbxz0P6kWGSRpI+u07ZnT28R3pFEH
 AH4+jz5CzRQt2kSAcc7kZaZYB0EkCQSJJYBj29c2f/NGS8jSqdyHZa0qs
 lTH8GcYsSuxhcfouyHGTfSRlJ0G47dKvffdFwIXvoJJnzByLzBEjZfWwM U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: G/6hvgoHAuwvZtZ7xZ4mwP8HNzqsd9SBOh3RVN4sLFXmL4jsbYrKmBxGppBs6vk//3v+yZY+fv
 sEtecMD61/F7b7oO4aAH7oMXNeggoCIaXTX+ebmj/O08zE4ozhsK+/H/yxjVnLhw9fXeMOkJLa
 EOL8DL790VLQXAaijB9C/91EQi9eVt9i4SVnZgzZKEwFfRMZ3vwuWW1CzlKp0dqgiHkM25XRBY
 z2lF3Hi37VjVb8aOYHjXT/Wm4WHHGIOjvIri4qoVLVpg+wy1kzkNPTMcKUJOftJ+t8rD3P0ZFF
 p2Y=
X-SBRS: 2.7
X-MesageID: 26100625
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26100625"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/5] x86/svm: handle BU_CFG and BU_CFG2 with cases
Date: Mon, 7 Sep 2020 12:31:39 +0200
Message-ID: <20200907103143.58845-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907103143.58845-1-roger.pau@citrix.com>
References: <20200907103143.58845-1-roger.pau@citrix.com>
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
Changes since v3:
 - Adjust comment to match code.
 - Remove leading zeros from MSR value.

Changes since v2:
 - Move the handling of reads to it's own case.
 - Drop writes if the MSR is readable, else return a #GP.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 43 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index af584ff5d1..e6fcb734b6 100644
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
+             * throw a #GP for later writes, just use a plausible value here
+             * (the reset value from rev10h chips) if the real CPU didn't
+             * provide one.
+             */
+            *msr_content = 0x10200020;
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


