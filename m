Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D8258D39
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4Bc-0000aq-Nz; Tue, 01 Sep 2020 11:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4Ba-0000V0-Er
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:46 +0000
X-Inumbo-ID: b4a32c02-3e24-4821-80ce-c62ed47c5edf
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4a32c02-3e24-4821-80ce-c62ed47c5edf;
 Tue, 01 Sep 2020 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HwL1hujKKkpV4RAoFw3wKEs/16rVlGWWGTnnzYIk2E=;
 b=ZucdF/IMtMDHyWwqbzVpoaMVwiFzIFQgY69/sIH4vCDsKKjJSG1xTima
 9/wHjRXp0s20m9dvASFzb4sBh1Kb7X3tKiarBUqwso4cvcIMK73GgNhqU
 dWNlazkahmJZ5++RIocewAvCf4YFFv9DeQAK3dKbtRpxxXii6Agss2UfY E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fOFVWvz8X0hf2Aq0WsNW70HpeGZbVyRTz8hQsOweEN5t0MV7TeH7unNIkSTXBQ1pij+Qhng6hH
 gbiFo8+XHuOamgk9XWzvgolDFhVGjFsYNxtlIxxyszcVAhdXiW6Ds9MrMhz5E3iLG/1zdbFwgU
 0eprqZoaAXI4v/f+FgvrTKWC0lPPj28exkcW+W7oqeGHaUv6cM5bFpgdDqyfV3Obp31f4U750y
 xufJGG5PXmAcNrN66m2SjPUm1MwwyreS9BFNYozITUceGM8oy3RR6fCisQ/Qc8+nXAPknX2Kk+
 j6s=
X-SBRS: 2.7
X-MesageID: 26025443
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26025443"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v3 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
Date: Tue, 1 Sep 2020 12:54:42 +0200
Message-ID: <20200901105445.22277-6-roger.pau@citrix.com>
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
index e84107ac7b..cc2f111a90 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -25,6 +25,7 @@
 #include <xen/sched.h>
 
 #include <asm/debugreg.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
 #include <asm/setup.h>
@@ -197,6 +198,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
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


