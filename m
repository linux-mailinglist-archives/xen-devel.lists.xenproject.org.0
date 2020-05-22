Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D31DE192
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 10:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc2kS-0005NJ-MO; Fri, 22 May 2020 08:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc2kR-0005NE-6d
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 08:09:43 +0000
X-Inumbo-ID: 96ddfa96-9c03-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ddfa96-9c03-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 08:09:42 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YOZoPeQ1Ubz6UHRo9X+yoS1foh4kVrSzE2tRnSH2NkMy/QxYRi99DRgFD3cuznlITZAZZMFKKN
 hMKbaRTSh0QC5Alis3eT/kBxQ+UrxlPaUOHP7OvLSkR/k73GabypOt6hpgWVBzim3K6E03vosK
 zcke2Aumn3k7unHOy9PFAZVULP226y/TB1nd5zmSTMlK+LQcL7XJF4QLykmkpSlyku2euXLiCj
 apRbl7VYbJCHScub3YAZSfU8qKGrZ6XETV2Q1WCjtEtpVprpdHISL8TM2pF50MLFkAXZngHv7l
 IUg=
X-SBRS: 2.7
X-MesageID: 18521085
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,420,1583211600"; d="scan'208";a="18521085"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/idle: prevent entering C3/C6 on some Intel CPUs due to
 errata
Date: Fri, 22 May 2020 10:09:28 +0200
Message-ID: <20200522080928.87786-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Apply a workaround for errata BA80, AAK120, AAM108, AAO67, BD59,
AAY54: Rapid Core C3/C6 Transition May Cause Unpredictable System
Behavior.

Limit maximum C state to C2 when SMT is enabled on the affected CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/intel.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index b77c1a78ed..69e99bb358 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -296,6 +296,41 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	ctxt_switch_levelling(NULL);
 }
 
+/*
+ * Errata BA80, AAK120, AAM108, AAO67, BD59, AAY54: Rapid Core C3/C6 Transition
+ * May Cause Unpredictable System Behavior
+ *
+ * Under a complex set of internal conditions, cores rapidly performing C3/C6
+ * transitions in a system with Intel Hyper-Threading Technology enabled may
+ * cause a machine check error (IA32_MCi_STATUS.MCACOD = 0x0106), system hang
+ * or unpredictable system behavior.
+ */
+static void probe_c3_errata(const struct cpuinfo_x86 *c)
+{
+#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
+    static const struct x86_cpu_id models[] = {
+        /* Nehalem */
+        INTEL_FAM6_MODEL(0x1a),
+        INTEL_FAM6_MODEL(0x1e),
+        INTEL_FAM6_MODEL(0x1f),
+        INTEL_FAM6_MODEL(0x2e),
+        /* Westmere (note Westmere-EX is not affected) */
+        INTEL_FAM6_MODEL(0x2c),
+        INTEL_FAM6_MODEL(0x25),
+        { }
+    };
+#undef INTEL_FAM6_MODEL
+
+    /* Serialized by the AP bringup code. */
+    if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
+         x86_match_cpu(models) )
+    {
+        printk(XENLOG_WARNING
+	       "Disabling C-states C3 and C6 due to CPU errata\n");
+        max_cstate = 1;
+    }
+}
+
 /*
  * P4 Xeon errata 037 workaround.
  * Hardware prefetcher may cause stale data to be loaded into the cache.
@@ -323,6 +358,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 
 	if (cpu_has_tsx_force_abort && opt_rtm_abort)
 		wrmsrl(MSR_TSX_FORCE_ABORT, TSX_FORCE_ABORT_RTM);
+
+	probe_c3_errata(c);
 }
 
 
-- 
2.26.2


