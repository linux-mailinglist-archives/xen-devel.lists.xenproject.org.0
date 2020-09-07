Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734C25F868
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 12:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERj-0003e2-Uh; Mon, 07 Sep 2020 10:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERi-0003d0-6F
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:22 +0000
X-Inumbo-ID: 367b00db-bd3a-4ff4-b668-8cc0a50fde81
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 367b00db-bd3a-4ff4-b668-8cc0a50fde81;
 Mon, 07 Sep 2020 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCAXR8J1S116BXr4h3iOtSzLFt4qLz1NctDhz+CxumY=;
 b=Fmexj6g0msP1MCNfLLJIwtw50QVkORlCD0P2qE3Wcfzy6fLmHO4hYbJu
 1GKYnQW9RkBCU++ec+wX6R3lrLzjbZLBQeg9lMQ5l6fHUFCS28BNNWc1l
 alJs4ceIXZVEhU3kEIKOp1yhRtzKt1tlQmkoJhX1ZJLmMJbSaQvnL+gZN Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: x5VHlbst6Fcg2DPrupmNdTiqKIta63Lm58fQ3OA7+CaFIwFZ+V1WaeLMqA8i9VFhCi7NRpKCVl
 hpV4ZAWrUUn/f8fWM0z6f2DTOuf1K6pyoNwgMcO60kzey3plY5NY5eT0UDxGFdszpY8dxL3cff
 Jwk2s3KYvCV1MjYmfBPwDdqWwSTIGfr5mlyvQL+ltuoAcfnnMz7CLDbg7vp6RIydV7a0FYrz5L
 Hz+/cwlul3KNVrmC/TDEQ5bn1VsPJHDR3c8G50HXuN5IjtYjuZlHV6GyLmbFWixu4wniBDgo4V
 /Q4=
X-SBRS: 2.7
X-MesageID: 26247477
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26247477"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 4/5] x86/hvm: Disallow access to unknown MSRs
Date: Mon, 7 Sep 2020 12:31:42 +0200
Message-ID: <20200907103143.58845-5-roger.pau@citrix.com>
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

From: Andrew Cooper <andrew.cooper3@citrix.com>

Change the catch-all behavior for MSR not explicitly handled. Instead
of allow full read-access to the MSR space and silently dropping
writes return an exception when the MSR is not explicitly handled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
[remove rdmsr_safe from default case in svm_msr_read_intercept]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Changes since v1:
 - Fold chunk to remove explicit write handling of VMX MSRs just to
   #GP.
 - Remove catch-all rdmsr_safe in svm_msr_read_intercept.
---
 xen/arch/x86/hvm/svm/svm.c | 10 ++++------
 xen/arch/x86/hvm/vmx/vmx.c | 16 ++++------------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e6fcb734b6..108c71785c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1964,8 +1964,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
-        if ( rdmsr_safe(msr, *msr_content) == 0 )
-            break;
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
 
@@ -2150,10 +2149,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
-        /* Match up with the RDMSR side; ultimately this should go away. */
-        if ( rdmsr_safe(msr, msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 msr, msr_content);
         goto gpf;
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 709ea149d1..a3aadce4d8 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3015,9 +3015,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
-        if ( rdmsr_safe(msr, *msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
 
@@ -3290,11 +3288,6 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
         break;
 
-    case MSR_IA32_FEATURE_CONTROL:
-    case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
-        /* None of these MSRs are writeable. */
-        goto gp_fault;
-
     case MSR_IA32_MISC_ENABLE:
         /*
          * Silently drop writes that don't change the reported value: At least
@@ -3324,10 +3317,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
-        /* Match up with the RDMSR side; ultimately this should go away. */
-        if ( rdmsr_safe(msr, msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 msr, msr_content);
         goto gp_fault;
     }
 
-- 
2.28.0


