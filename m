Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E391476E5C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247798.427348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTO-0006BW-3L; Thu, 16 Dec 2021 09:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247798.427348; Thu, 16 Dec 2021 09:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTN-00065i-Sj; Thu, 16 Dec 2021 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 247798;
 Thu, 16 Dec 2021 09:54:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTK-00058M-C9
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328129be-5e56-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 10:54:45 +0100 (CET)
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
X-Inumbo-ID: 328129be-5e56-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y7yij6K+XUWatRCxO0dFSLXD8ZxBgFCf9pYhU1zZkmY=;
  b=X9i4S3rXzH4D8sxr9SIL0wKe05bz7JlgxJZvVLSQGgAvoP4w8tXLZEBG
   1a8gGvgNDxgs9JgBnSHrotrkcJSGZB4BmXE4jr+LLohMNJOoWADcTlhoQ
   ibQl7vYUEsedsXu+K5iriWD4/+YMejVlqnr9rxYnMINkLYaBQWoIoVMrR
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4QpB0e8eTB9eFeUQMI67lhP8GTDW39DEZtsCOZrcQAvzVpALrBVM42xR1ia0MjPQPLDwNvGVSI
 FcTvbiAhIywEOmkLv1l9gzHQN6ZtWrUt0f/0SRKHI8DT5Bk1htJ8Ru7PY12qxpNd8AHUegrZlq
 s9BNXvQbnJgdAtf0O5e2DzoiwE8Xy95mVbkdXkCeYaOD6unz1i8G65pOCisHLUdy4b9FrZgVTC
 8SW4QxDGjZ14KYEc4sjmap1Ly3k6K2FeV2YNRrInRqGJMjV656rJTBYiJmsuLpqQL1aBmAMs/5
 vh2WxkWGEcEszJiTfoeuPuVA
X-SBRS: 5.1
X-MesageID: 60174028
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kc5xpqmAxX+Uz5JzJ+jYPbro5gxaIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKDGuGPv7eZDbzKot0Oti1oxkBuZCDnNIwSgZsqixnFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JZwjN+XEyEnBYeSmcMEagZ9Dn1uFJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ66HO
 JZBM2oHgBLoZERPA20lS4AEuKSkmimiUAQCqHSVjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z6Dw8bMpqDyDOD2nOqmuLL2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIMh6Uv8E2gTvHmQga15nWDu3Yht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIO9/IPBhtw8
 FGytY3oIiVWr5iIFWK0z+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qmf22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUcHleM+lGrxl8FSVCxCtame0bblHRcZJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsMt/gUJt6kPK4TrwJs8w4iPIUOPCdkyfdo0lTibO4hTixwCDAb4lhU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI6Qjx8UKGInut6E2Gn9owM/tr1E
 riGchcw4DLCabfvc21ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:wo+oN6tZO3Ll6TngaX67xfiW7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60174028"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH 4/6] x86/hvm: Enable guest access to MSR_PKRS
Date: Thu, 16 Dec 2021 09:54:19 +0000
Message-ID: <20211216095421.12871-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have guest_{rd,wr}msr() access either the live register, or stashed state,
depending on context.  Include MSR_PKRS for migration, and let the guest have
full access.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/hvm.c     |  1 +
 xen/arch/x86/hvm/vmx/vmx.c |  5 +++++
 xen/arch/x86/msr.c         | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 63eaa3c5a66b..e75245f36dce 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1372,6 +1372,7 @@ static int hvm_load_cpu_xsave_states(struct domain *d, hvm_domain_context_t *h)
 static const uint32_t msrs_to_send[] = {
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
+    MSR_PKRS,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
     MSR_AMD64_DR0_ADDRESS_MASK,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2e6af1e1c033..2288ea54f0b5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -632,6 +632,11 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
         vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
     else
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+
+    if ( cp->feat.pks )
+        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+    else
+        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 }
 
 int vmx_guest_x86_mode(struct vcpu *v)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b834456c7b02..d2569a81b7ba 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -28,6 +28,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
+#include <asm/prot-key.h>
 #include <asm/setup.h>
 
 #include <public/hvm/params.h>
@@ -315,6 +316,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = 0;
         break;
 
+    case MSR_PKRS:
+        if ( !cp->feat.pks )
+            goto gp_fault;
+
+        *val = (v == curr) ? rdpkrs() : msrs->pkrs;
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
@@ -581,6 +589,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             break;
         goto gp_fault;
 
+    case MSR_PKRS:
+        if ( !cp->feat.pks || val != (uint32_t)val )
+            goto gp_fault;
+
+        msrs->pkrs = val;
+        if ( v == curr )
+            wrmsr(MSR_PKRS, val, 0);
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
-- 
2.11.0


