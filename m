Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DABE4AE068
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268587.462487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwJ-000537-AH; Tue, 08 Feb 2022 18:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268587.462487; Tue, 08 Feb 2022 18:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwI-0004vQ-Vu; Tue, 08 Feb 2022 18:10:06 +0000
Received: by outflank-mailman (input) for mailman id 268587;
 Tue, 08 Feb 2022 18:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwG-0003Sy-94
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5558c99a-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:10:03 +0100 (CET)
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
X-Inumbo-ID: 5558c99a-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2Tu+0ZH5IK1WnPkeaZM/73l9bKZI3OnKw4WhQyYT/iw=;
  b=edVmEVSq38VzxZihXdBhC4u4BW2aNtdmsnfMMxLxnP0vrfzREo2EX/Qe
   o1Kd3I49lyQ1+pfRb+DtBDOjXWZYI5/f3xLn3xtJsRxI6ljeGzzx3oOWr
   KM0zfwm9lBdiDbLlQQ4qnVW9/JJ6KnFRtD6bTYbq2NvYo6qX14mt//u6R
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: f2B6KjaCFSB7Z04T9jYgUSa845KXeJRfQlW5XJ+OGlfBSnpBcniU+oSFTQt4RAL7WomC+ZvBOG
 bzFZARTO8hGTAf7+9CqtungXvLkbObngdLDWBOiH0RwdEb+WONWKo3R4nsfOuC/GYElp0aqSD5
 pjigXSnHAOxq46GhCRNHw1JOEVOidoAcKyoZeItmxEce/bCrbxPBZmxDlHysVm3eo8JrPC4/tm
 MS3LtNNNEI6B0uMDwn1R3izm6KH3Gy+1frFe56hFCxY3KC2QQRP02XDDbf6LTd9OvybCIUjucK
 PWh3C3jBVeKC00f8CsbXDPCx
X-SBRS: 5.1
X-MesageID: 63217625
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2t5viKw+GI5e9/tR3Lx6t+cUwSrEfRIJ4+MujC+fZmUNrF6WrkUOz
 DZKUG+CM/6LNjT2c41/b47loB8H75fTn4RgGgVkpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZp2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9826
 NQW6K2tcgd3P6+WpfgxWiRITT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JsURKmAP
 ZdxhTxHbk6QbUFUPG4uA7EOwvyTjWGnTX5zkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelifb+qk/lBuNCE
 ExK+yh0kLQe/XG7EMaoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
 nfMxoq0XmI37NV5XFrAru/8kN+kBcQCwYbujwcgRBBN3dTsqZpbYvnnHoc6S/7dYjEY9FjNL
 9G2QMoW2u97YS0jjfzTEbX7b9WE/Mmhc+LNzl+LNl9JFysgDGJfW6Sm6ELA8dFLJ5uDQ1+Ks
 RAswpbCsLlfVMjTxXbUG43h+Y1FAN7fYVXhbaNHRcF9p1xBBVb/FWyv3N2ODBgwaZtVEdMYS
 ETSpRlQ9Pdu0IiCNsdKj3aKI51yl8DITI29PtiNN4YmSsUhJWevoXA1DWbNjj+FuBZ3y8kXZ
 8zEGftA+F5HUMyLOhLtHLxDuVLqrwhjrV7uqWfTlUz4iOHDPy7MEt/o8jKmN4gE0U9Nmy2Nm
 /43CidA40k3vDTWbnaF/IgNA0oNKHRnV5n6p9YOLryIIxZ8GXFnAPjUmOtzd4tglqVTt+HJ4
 nDiBRMIlAuh3SXKeVeQd3RuSLLzRpIj/3g1CjMhYASz0H85bIfxsKpGL8krfaMq/fBIxOJvS
 6VXYN2JB/lCE2yV+zkUYZTngpZlcRCn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZ+POvy1zl63sXwMo85IXhPFcotJZUHh0Il2MCit3PU5FN4BdEfYzTyA2
 gfIXRpB/bvRo5U4+cXijLyfq9v7CPN3G0dXEjWJ7buyMiWGrGOvzZUZDbSNdDHZEmj15L+jd
 aNeyPSlaK8Lm1NDsoxdFbd3zP1hu4uz9uEClgk0Tm/Wa1mLC697JijU1MZCgaRB27tFtFbkQ
 UmI4NRbZe2ENc6N/IT9/+b5gjBvDc0ppwQ=
IronPort-HdrOrdr: A9a23:rtFV0KHYTyU1by84pLqE7MeALOsnbusQ8zAXP0AYc31om62j5r
 iTdZsgpHzJYVoqN03I3OrwXJVoIkmsjKKdg7NhX4tKNTOO0ADDQe1fBMnZslrd8kXFh4hgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63217625"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 6/6] x86/spec-ctrl: Support Intel PSFD for guests
Date: Tue, 8 Feb 2022 18:09:42 +0000
Message-ID: <20220208180942.14871-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The Feb 2022 microcode from Intel retrofits AMD's MSR_SPEC_CTRL.PSFD interface
to Sunny Cove (IceLake) and later cores.

Update the MSR_SPEC_CTRL emulation, and expose it to guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 tools/libs/light/libxl_cpuid.c              | 2 ++
 tools/misc/xen-cpuid.c                      | 1 +
 xen/arch/x86/msr.c                          | 2 +-
 xen/arch/x86/spec_ctrl.c                    | 7 +++++--
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/tools/gen-cpuid.py                      | 2 +-
 6 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648db4..d462f9e421ed 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -234,6 +234,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
 
+        {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
+
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
         {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 40626296984b..0b1b3333fe71 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -202,6 +202,7 @@ static const char *const str_7b1[32] =
 
 static const char *const str_7d2[32] =
 {
+    [ 0] = "intel-psfd",
 };
 
 static const struct {
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 4ac5b5a048eb..01a15857b740 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -443,7 +443,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
 {
     bool ssbd = cp->feat.ssbd || cp->extd.amd_ssbd;
-    bool psfd = cp->extd.psfd;
+    bool psfd = cp->feat.intel_psfd || cp->extd.psfd;
 
     /*
      * Note: SPEC_CTRL_STIBP is specified as safe to use (i.e. ignored)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 2b93468d396e..cbeeb199037e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -307,11 +307,13 @@ custom_param("pv-l1tf", parse_pv_l1tf);
 
 static void __init print_details(enum ind_thunk thunk, uint64_t caps)
 {
-    unsigned int _7d0 = 0, e8b = 0, tmp;
+    unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, max = 0, tmp;
 
     /* Collect diagnostics about available mitigations. */
     if ( boot_cpu_data.cpuid_level >= 7 )
-        cpuid_count(7, 0, &tmp, &tmp, &tmp, &_7d0);
+        cpuid_count(7, 0, &max, &tmp, &tmp, &_7d0);
+    if ( max >= 2 )
+        cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
     if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
         cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
 
@@ -345,6 +347,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_SSBD)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))           ? " SSBD"           : "",
+           (_7d2 & cpufeat_mask(X86_FEATURE_INTEL_PSFD)) ||
            (e8b  & cpufeat_mask(X86_FEATURE_PSFD))           ? " PSFD"           : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH))      ? " L1D_FLUSH"      : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR))       ? " MD_CLEAR"       : "",
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 81b0f5e0aad3..9cee4b439e9f 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -303,6 +303,7 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
+XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 
 #endif /* XEN_CPUFEATURE */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 39c8b0c77465..e0e3f2f46386 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -287,7 +287,7 @@ def crunch_numbers(state):
         # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
-        IBRSB: [STIBP, SSBD],
+        IBRSB: [STIBP, SSBD, INTEL_PSFD],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         AMD_STIBP: [STIBP_ALWAYS],
-- 
2.11.0


