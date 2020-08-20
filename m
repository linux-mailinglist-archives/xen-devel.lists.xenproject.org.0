Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4824C173
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mCN-0003wK-8Y; Thu, 20 Aug 2020 15:09:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mCL-0003lg-2T
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:49 +0000
X-Inumbo-ID: 8f02a0cd-ee48-4d2d-a496-e4fc73382743
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f02a0cd-ee48-4d2d-a496-e4fc73382743;
 Thu, 20 Aug 2020 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SVndl4pASR8SDk46ofH1FSd8rv6zJbPHsqBTIDOsayY=;
 b=iBOICu/t6Vg3RxvBQNJaoaZHoVPRep4qOjiB29I8KgLGOKkFDTzaqWN1
 9i504spEfPFr8j8UYvcYoPRxBNk5LwM/rexY/JLc8cQHqqnDk0pwDGQNB
 y+0v+5TXWh1hNKAj+lcXZuX0RoX5RwnJqnSEs8QSrHwlzfj2mXBhqGSyI 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WC8Phs4G2OE1+xbh74B68s9+1JUr4rg7TGkxrf2xHD0JuVOyA2KMSEag4c0DcoYXrXk9JJ/1W8
 yF0iSKW1e86GPOISJ8MczKKj6TgZvcZrMNhm23m8Ww3da42Qc6ar4QjMgfA8fl7QX5IQPA7i5g
 V2ytyZfvbZytU1gey9V5A67W1sdt67XR634LQlV/6QF3onAvnNuKsVpim1YrEmxrXDe1MXMFuw
 p4iRATwkqy2RH/Qd74z8g/vYE5P748RqW5XYxrY3qjHx7CHZfmb8MGgaHbzCCX4mIU+hpZollq
 +yU=
X-SBRS: 2.7
X-MesageID: 25108124
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25108124"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 7/8] x86/hvm: Disallow access to unknown MSRs
Date: Thu, 20 Aug 2020 17:08:34 +0200
Message-ID: <20200820150835.27440-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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
 xen/arch/x86/hvm/svm/svm.c | 11 ++++-------
 xen/arch/x86/hvm/vmx/vmx.c | 16 ++++------------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 7586b77268..1e4458c184 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1952,9 +1952,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
-        if ( rdmsr_safe(msr, *msr_content) == 0 )
-            break;
-
         if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
         {
             /* Win2k8 x64 reads this MSR on revF chips, where it
@@ -1967,6 +1964,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
 
@@ -2154,10 +2152,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
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


