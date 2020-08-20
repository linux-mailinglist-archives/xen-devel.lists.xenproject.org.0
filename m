Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136EF24C16E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mCH-0003sm-Oy; Thu, 20 Aug 2020 15:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mCG-0003lg-2P
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:44 +0000
X-Inumbo-ID: 33fd808e-749d-48f2-b6d2-da44e8b11909
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33fd808e-749d-48f2-b6d2-da44e8b11909;
 Thu, 20 Aug 2020 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DgPYrIn2ueyNZtkxRfEph5bavhTq242QMrgpf1Jrbio=;
 b=G/IM78WzGbom0pfPBqc1d5+KI6JIRyl8PKTJQydrWfvvXgBvYBmBqrIe
 XwMLoTPNsoXsjS8h+xSJbXXIrBd6l6pLdJ0f5KaOQn6rbTKz2N09+EJGN
 Pyf9UhdOvrHsQrToCH1h9J6oGC0aQdmWZ+eCY8JE0OKOv4k5TAJP0kvOV Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z+vuYppG4zblNgHYnqXoqB9apxIWoO1kbkdRKj1Verxge6DD/1PqsHw2Tc+S3IlLv4FK1CfGBE
 t1R7zSuTjMI3xvQSZx0LiIjW74Qu2tgAkTwhH9a75mk8+8BvXdvSzbHKflZh14/Vgmsp6jJP76
 XC75oxk1vWsdTtYYCjuEX480Dh/4B33IH3Av/drft/Xpj2ACiExWMOxK+SRg+VB8bC7tY3gxqO
 Wx5MEYs+830o08UgL9rVFPUPzp4Tg/wizob8nDurDyPSq6AWg7wQcqaOWpH4iRMSYh2Du11bLl
 xew=
X-SBRS: 2.7
X-MesageID: 25266665
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25266665"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v2 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
Date: Thu, 20 Aug 2020 17:08:32 +0200
Message-ID: <20200820150835.27440-6-roger.pau@citrix.com>
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

Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
the handling done in VMX code into guest_rdmsr as it can be shared
between PV and HVM guests that way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes from v1:
 - Move the VMX implementation into guest_rdmsr.
---
 xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
 xen/arch/x86/msr.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4717e50d4a..f6657af923 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     case MSR_IA32_DEBUGCTLMSR:
         __vmread(GUEST_IA32_DEBUGCTL, msr_content);
         break;
-    case MSR_IA32_FEATURE_CONTROL:
-        *msr_content = IA32_FEATURE_CONTROL_LOCK;
-        if ( vmce_has_lmce(curr) )
-            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
-        if ( nestedhvm_enabled(curr->domain) )
-            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
-        break;
+
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a890cb9976..bb0dd5ff0a 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -25,6 +25,7 @@
 #include <xen/sched.h>
 
 #include <asm/debugreg.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
 #include <asm/setup.h>
@@ -181,6 +182,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         /* Not offered to guests. */
         goto gp_fault;
 
+    case MSR_IA32_FEATURE_CONTROL:
+        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
+            goto gp_fault;
+
+        *val = IA32_FEATURE_CONTROL_LOCK;
+        if ( vmce_has_lmce(v) )
+            *val |= IA32_FEATURE_CONTROL_LMCE_ON;
+        if ( nestedhvm_enabled(d) )
+            *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
+        break;
+
+
     case MSR_IA32_PLATFORM_ID:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
              !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
-- 
2.28.0


