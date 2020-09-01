Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA33258D37
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4Ba-0000ZT-C7; Tue, 01 Sep 2020 11:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BY-0000VB-Ec
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:44 +0000
X-Inumbo-ID: 4dc66d48-a97a-41a7-868b-b0013b3a38f6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dc66d48-a97a-41a7-868b-b0013b3a38f6;
 Tue, 01 Sep 2020 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E3jeYzrTbVvHtqEv2Ls5J9K9ynGLS4FHP+N0UrriWms=;
 b=hPJgy7BehiOddMzkN5o81O2LCoogc1yFpu1W1fpV4hsQYM54HkACJCen
 5cYbSRE5GcIz/AuZWiL1jnbtqu716vzuCQo3SfDNfXQKPiMIvEXva0Qt3
 luPYEeSI5b1cRt8ZKzri6W7pL4GkgV+eilkv6Sa/7BqJpS92db8aTFws9 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lLfVdKCRlzCApa0D2xmXz0BzXvmerCAvdrXWfkwG42+VYyoo5xpmZ0ov/aae8aQZQWMcb6ACXo
 i6OZemeN4a9vVveDN41SqvB+bSLPdC4IRSj7nZk0siFXmp3Ndhn9hnA5Cp3PqEEdrztwGxZk/S
 3VcrOAcq1eHQHwoIgBngBHgEFVnLlNn5p/71CkDWWf4Tbngh+3ZdQJCAvu13llf9uef7ZHez9g
 59BuieQqctgsubTiwMNOQjsIfj+vLO5sbxZUEPzNjQHha7KzcmeS5FxycrhOFSYyjLf3dNTUFs
 gnA=
X-SBRS: 2.7
X-MesageID: 25738158
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="25738158"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
Date: Tue, 1 Sep 2020 12:54:44 +0200
Message-ID: <20200901105445.22277-8-roger.pau@citrix.com>
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

From: Andrew Cooper <andrew.cooper3@citrix.com>

Change the catch-all behavior for MSR not explicitly handled. Instead
of allow full read-access to the MSR space and silently dropping
writes return an exception when the MSR is not explicitly handled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
[remove rdmsr_safe from default case in svm_msr_read_intercept]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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
index 0e43154c7e..66b22efdab 100644
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
index f6657af923..9cc9d81c41 100644
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
         /* Silently drop writes that don't change the reported value. */
         if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||
@@ -3320,10 +3313,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
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


