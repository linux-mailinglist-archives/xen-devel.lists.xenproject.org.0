Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2005566473E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474876.736296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH3-0003jB-0P; Tue, 10 Jan 2023 17:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474876.736296; Tue, 10 Jan 2023 17:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH2-0003Zm-RE; Tue, 10 Jan 2023 17:18:56 +0000
Received: by outflank-mailman (input) for mailman id 474876;
 Tue, 10 Jan 2023 17:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH1-0003S0-PK
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da896568-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:53 +0100 (CET)
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
X-Inumbo-ID: da896568-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QpOw3C6VwM8FcX6hHOXRu7/mibwXlAuu3I7T3tZcU2Y=;
  b=OgrY0uZ3A7NGVTz6QwsutsL1L79JMqEB2hMV9187F5tbW+a/OlZmv5t5
   NLWm93VR+G3t7qjJsM9cL2EvgEtahExvhYQNHh+i684lJd0oZS7agFOg0
   Z5XBmBlqnpF43xvsQlNNcA9cvzx1ZwhM0GJknMX3Z/iCIWngK4NAs+MdM
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91449590
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Li9XpKpB6kbN4mSMqhYPLdNVOKZeBmIxZRIvgKrLsJaIsI4StFCzt
 garIBnTaavYajekfdp3b4u+908H7JHdzNUwSws4/y0xFH8T9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHziFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB9TV1egpr+4++rlWuQ2i8lyHOW3M7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 zuaozWkU0ly2Nq3wDi7wFCsjNHzrxj3UpgYMLL7r65YuQjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAx+VKqSJ/hXhS+iH+CohMYHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRNmrCITXOW9p+PsCi/fyMSKAc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdNm/Jh
 BOr8SYF3+sDgJQG2vSL0QzIumf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCHxBUOUS9jrYyjP8UQHPYqNaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChFUv43nWLpGrpEi9fHIxzSI0uJHfgXKDz+j9KjiIO9E+9ZYDNikMhlhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3iGbeFTbNy09M9sCn/9X9BoGAMDlBn7ws1BLXGplxP13m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:oTZoiq3aFgb5AX9qgrmu5gqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="91449590"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Date: Tue, 10 Jan 2023 17:18:43 +0000
Message-ID: <20230110171845.20542-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have guest_{rd,wr}msr(), via hvm_{get,set}_reg(), access either the live
register, or stashed state, depending on context.  Include MSR_PKRS for
migration, and let the guest have full access.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>

v2:
 * Rebase over the get/set_reg() infrastructure.
---
 xen/arch/x86/hvm/hvm.c     |  1 +
 xen/arch/x86/hvm/vmx/vmx.c | 17 +++++++++++++++++
 xen/arch/x86/msr.c         | 10 ++++++++++
 3 files changed, 28 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 927a221660e8..c6c1eea18003 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1333,6 +1333,7 @@ static int cf_check hvm_load_cpu_xsave_states(
 static const uint32_t msrs_to_send[] = {
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
+    MSR_PKRS,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
     MSR_VIRT_SPEC_CTRL,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b1f493f009fd..57827779c305 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -657,6 +657,11 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     else
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
 
+    if ( cp->feat.pks )
+        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+    else
+        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+
  out:
     vmx_vmcs_exit(v);
 
@@ -2455,6 +2460,7 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
     const struct vcpu *curr = current;
     struct domain *d = v->domain;
+    const struct vcpu_msrs *msrs = v->arch.msrs;
     uint64_t val = 0;
     int rc;
 
@@ -2471,6 +2477,9 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
         }
         return val;
 
+    case MSR_PKRS:
+        return (v == curr) ? rdpkrs() : msrs->pkrs;
+
     case MSR_SHADOW_GS_BASE:
         if ( v != curr )
             return v->arch.hvm.vmx.shadow_gs;
@@ -2499,6 +2508,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 
 static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
+    const struct vcpu *curr = current;
+    struct vcpu_msrs *msrs = v->arch.msrs;
     struct domain *d = v->domain;
     int rc;
 
@@ -2514,6 +2525,12 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
             domain_crash(d);
         }
         return;
+
+    case MSR_PKRS:
+        msrs->pkrs = val;
+        if ( v == curr )
+            wrpkrs(val);
+        return;
     }
 
     /* Logic which maybe requires remote VMCS acquisition. */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 317b154d244d..7ddf0078c3a2 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -325,6 +325,11 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = 0;
         break;
 
+    case MSR_PKRS:
+        if ( !cp->feat.pks )
+            goto gp_fault;
+        goto get_reg;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
@@ -616,6 +621,11 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             break;
         goto gp_fault;
 
+    case MSR_PKRS:
+        if ( !cp->feat.pks || val != (uint32_t)val )
+            goto gp_fault;
+        goto set_reg;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
-- 
2.11.0


