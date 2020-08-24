Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C425042D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 18:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAFnl-0004uk-OB; Mon, 24 Aug 2020 16:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kAFnj-0004uV-TR
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 16:58:31 +0000
X-Inumbo-ID: e7521044-942e-4b42-af6e-8f4a01416529
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7521044-942e-4b42-af6e-8f4a01416529;
 Mon, 24 Aug 2020 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598288311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ObJuIRrInORh9qk+UsMWbiANfGop0cNORS1CqiJBc8=;
 b=BQ7fCuLvWbkzuS/HZxADhgSUUHiISO1ppvuridifuH5gMOytLgwg9ruF
 EeHKIpK+ITO+Zry6kSPwH4YRCoelATxxAzmoV0o+ocvL0M0VkAxpHrS4a
 VxVDDMGykNyosEyv/8oxuV2+FtjIlVK8Jx3n2JrAP9DcBbWAvPF53qf/f E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Av/DD2ntSywgwa0TNc2xSH9TOo5QxiRXUT77yBM1AwTF0gys6lEAxq4P8NcZF1o6R1gZPNTzx9
 FFoJJY4r1oJGgy3hVIWXV9Sa0UlpYI3UHtjjlvCHW6p2YZpJ9PllG6Ju24T92f5MrzfAke2m9E
 CHhzpSUXnds9/CBGJ6Cf8te2nHYvutXyXBz0+Dpm4yYMthWrNnRhrQGjVZOaW0MrfsmRBvx7w9
 Uz9id3DFQWKl9nFy9UN75LGn6hnSqUVEpZioCVAmeIWyc+4F861IuKmG0NX0iXNKwkxnUUa3qM
 5FI=
X-SBRS: 2.7
X-MesageID: 25184580
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="25184580"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Begin to introduce support for MSR_ARCH_CAPS
Date: Mon, 24 Aug 2020 17:58:04 +0100
Message-ID: <20200824165804.17230-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

... including serialisation/deserialisation logic and unit tests.

There is no current way to configure this MSR correctly for guests.
The toolstack side this logic needs building, which is far easier to
do with it in place.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/tests/cpu-policy/test-cpu-policy.c    |  5 +++++
 xen/arch/x86/msr.c                          |  6 ++++--
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 xen/include/xen/lib/x86/msr.h               | 24 +++++++++++++++++++++++-
 xen/lib/x86/msr.c                           |  2 ++
 5 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 7ba9707236..0fa209f1ea 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -374,6 +374,11 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .val = ~0ull },
             .rc = -EOVERFLOW,
         },
+        {
+            .name = "truncated val",
+            .msr = { .idx = 0x10a, .val = ~0ull },
+            .rc = -EOVERFLOW,
+        },
     };
 
     printf("Testing MSR deserialise failure:\n");
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ca4307e19f..c3862033eb 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -220,8 +220,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_ARCH_CAPABILITIES:
-        /* Not implemented yet. */
-        goto gp_fault;
+        if ( !cp->feat.arch_caps )
+            goto gp_fault;
+        *val = mp->arch_caps.raw;
+        break;
 
     case MSR_INTEL_MISC_FEATURES_ENABLES:
         *val = msrs->misc_features_enables.raw;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index ce3deaa5c7..fc733e64f6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -268,7 +268,7 @@ XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*   IA32_ARCH_CAPABILITIES MSR */
+XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*a  IA32_ARCH_CAPABILITIES MSR */
 XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /*   IA32_CORE_CAPABILITIES MSR */
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 203c713320..f0a63b2a1a 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -3,7 +3,7 @@
 #define XEN_LIB_X86_MSR_H
 
 /* Maximum number of MSRs written when serialising msr_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 1
+#define MSR_MAX_SERIALISED_ENTRIES 2
 
 /* MSR policy object for shared per-domain MSRs */
 struct msr_policy
@@ -23,6 +23,28 @@ struct msr_policy
             bool cpuid_faulting:1;
         };
     } platform_info;
+
+    /*
+     * 0x0000010a - MSR_ARCH_CAPABILITIES
+     *
+     * This is an Intel-only MSR, which provides miscellaneous enumeration,
+     * including those which indicate that microarchitectrual sidechannels are
+     * fixed in hardware.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            bool rdcl_no:1;
+            bool ibrs_all:1;
+            bool rsba:1;
+            bool skip_l1dfl:1;
+            bool ssb_no:1;
+            bool mdd_no:1;
+            bool if_pschange_mc_no:1;
+            bool tsx_ctrl:1;
+            bool taa_no:1;
+        };
+    } arch_caps;
 };
 
 #ifdef __XEN__
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 171abf7008..7d71e92a38 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -39,6 +39,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *p,
     })
 
     COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw);
+    COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw);
 
 #undef COPY_MSR
 
@@ -99,6 +100,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 })
 
         case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
+        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
 
 #undef ASSIGN
 
-- 
2.11.0


