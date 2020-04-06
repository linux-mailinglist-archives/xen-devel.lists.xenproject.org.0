Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F619F3ED
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPRc-0000Bn-1r; Mon, 06 Apr 2020 10:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLPRa-0000BF-FA
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:57:30 +0000
X-Inumbo-ID: 68100e48-77f5-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68100e48-77f5-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xDyV2T4eBxzsTghP88Qw+tODGijc2LN55Bf5M9CvYA=;
 b=haNmC880Ns7yHoponrGs/0JRRaF6eKsZaKTmaM2nUbJe6jE8oQxrIKzz
 txX3atsbHerz/VAPsOWvUQC26uzuIBBrQQaKg/hgHL9jBV7NEYAtk4Bpr
 XIsLD81RSDvxr7vF7bTKxwVnBuS4B3TPbNuk8fK7U1dX6/cglHPy674r6 A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Anvi2ZOdYknQIEGho41bTjypWjKonVD29NSd2wDbK8eQmuKHpxE6v+TKcC6l2EqWvFM0igmNXJ
 aulG5GKZfszW5IttEr4duACQ2VvcR6+7h6oCq7wJtXZ26s1g9am7s+NtKDEL94jn6wMX2Xqce4
 NPle+pv8OtNlwSND5IX6HiCeN2KYn2knLnjQ/vYKxqVYAUrBSnphDCVIk5gXhh+1gIGqZ493Au
 9Lc8u3663HvQYWmPX2V744Jf9tD0Cjtt+YmNotSFwHlKQdbQQp7APgtUwYIJHoJP2S38uhjVaY
 Xeg=
X-SBRS: 2.7
X-MesageID: 15630973
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15630973"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v9 3/3] x86/tlb: use Xen L0 assisted TLB flush when available
Date: Mon, 6 Apr 2020 12:57:03 +0200
Message-ID: <20200406105703.79201-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406105703.79201-1-roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Use Xen's L0 HVMOP_flush_tlbs hypercall in order to perform flushes.
This greatly increases the performance of TLB flushes when running
with a high amount of vCPUs as a Xen guest, and is specially important
when running in shim mode.

The following figures are from a PV guest running `make -j32 xen` in
shim mode with 32 vCPUs and HAP.

Using x2APIC and ALLBUT shorthand:
real	4m35.973s
user	4m35.110s
sys	36m24.117s

Using L0 assisted flush:
real    1m2.596s
user    4m34.818s
sys     5m16.374s

The implementation adds a new hook to hypervisor_ops so other
enlightenments can also implement such assisted flush just by filling
the hook.

Note that the Xen implementation completely ignores the dirty CPU mask
and the linear address passed in, and always performs a global TLB
flush on all vCPUs. This is a limitation of the hypercall provided by
Xen. Also note that local TLB flushes are not performed using the
assisted TLB flush, only remote ones.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Wei Liu <wl@xen.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v5:
 - Clarify commit message.
 - Test for assisted flush at setup, do this for all hypervisors.
 - Return EOPNOTSUPP if assisted flush is not available.

Changes since v4:
 - Adjust order calculation.

Changes since v3:
 - Use an alternative call for the flush hook.

Changes since v1:
 - Add a L0 assisted hook to hypervisor ops.
---
 xen/arch/x86/guest/hypervisor.c        | 14 ++++++++++++++
 xen/arch/x86/guest/xen/xen.c           |  6 ++++++
 xen/arch/x86/smp.c                     |  7 +++++++
 xen/include/asm-x86/guest/hypervisor.h | 17 +++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index 647cdb1367..e46de42ded 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -18,6 +18,7 @@
  *
  * Copyright (c) 2019 Microsoft.
  */
+#include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/types.h>
 
@@ -51,6 +52,10 @@ void __init hypervisor_setup(void)
 {
     if ( ops.setup )
         ops.setup();
+
+    /* Check if assisted flush is available and disable the TLB clock if so. */
+    if ( !hypervisor_flush_tlb(cpumask_of(smp_processor_id()), NULL, 0) )
+        tlb_clk_enabled = false;
 }
 
 int hypervisor_ap_setup(void)
@@ -73,6 +78,15 @@ void __init hypervisor_e820_fixup(struct e820map *e820)
         ops.e820_fixup(e820);
 }
 
+int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
+                         unsigned int order)
+{
+    if ( ops.flush_tlb )
+        return alternative_call(ops.flush_tlb, mask, va, order);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index e74fd1e995..3bc01c8723 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -324,12 +324,18 @@ static void __init e820_fixup(struct e820map *e820)
         pv_shim_fixup_e820(e820);
 }
 
+static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int order)
+{
+    return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
+}
+
 static const struct hypervisor_ops __initconstrel ops = {
     .name = "Xen",
     .setup = setup,
     .ap_setup = ap_setup,
     .resume = resume,
     .e820_fixup = e820_fixup,
+    .flush_tlb = flush_tlb,
 };
 
 const struct hypervisor_ops *__init xg_probe(void)
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index bcead5d01b..1d9fec65de 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -15,6 +15,7 @@
 #include <xen/perfc.h>
 #include <xen/spinlock.h>
 #include <asm/current.h>
+#include <asm/guest.h>
 #include <asm/smp.h>
 #include <asm/mc146818rtc.h>
 #include <asm/flushtlb.h>
@@ -268,6 +269,12 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
     if ( (flags & ~FLUSH_ORDER_MASK) &&
          !cpumask_subset(mask, cpumask_of(cpu)) )
     {
+        if ( cpu_has_hypervisor &&
+             !(flags & ~(FLUSH_TLB | FLUSH_TLB_GLOBAL | FLUSH_VA_VALID |
+                         FLUSH_ORDER_MASK)) &&
+             !hypervisor_flush_tlb(mask, va, (flags - 1) & FLUSH_ORDER_MASK) )
+            return;
+
         spin_lock(&flush_lock);
         cpumask_and(&flush_cpumask, mask, &cpu_online_map);
         cpumask_clear_cpu(cpu, &flush_cpumask);
diff --git a/xen/include/asm-x86/guest/hypervisor.h b/xen/include/asm-x86/guest/hypervisor.h
index ade10e74ea..77a1d21824 100644
--- a/xen/include/asm-x86/guest/hypervisor.h
+++ b/xen/include/asm-x86/guest/hypervisor.h
@@ -19,6 +19,8 @@
 #ifndef __X86_HYPERVISOR_H__
 #define __X86_HYPERVISOR_H__
 
+#include <xen/cpumask.h>
+
 #include <asm/e820.h>
 
 struct hypervisor_ops {
@@ -32,6 +34,8 @@ struct hypervisor_ops {
     void (*resume)(void);
     /* Fix up e820 map */
     void (*e820_fixup)(struct e820map *e820);
+    /* L0 assisted TLB flush */
+    int (*flush_tlb)(const cpumask_t *mask, const void *va, unsigned int order);
 };
 
 #ifdef CONFIG_GUEST
@@ -41,6 +45,14 @@ void hypervisor_setup(void);
 int hypervisor_ap_setup(void);
 void hypervisor_resume(void);
 void hypervisor_e820_fixup(struct e820map *e820);
+/*
+ * L0 assisted TLB flush.
+ * mask: cpumask of the dirty vCPUs that should be flushed.
+ * va: linear address to flush, or NULL for global flushes.
+ * order: order of the linear address pointed by va.
+ */
+int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
+                         unsigned int order);
 
 #else
 
@@ -52,6 +64,11 @@ static inline void hypervisor_setup(void) { ASSERT_UNREACHABLE(); }
 static inline int hypervisor_ap_setup(void) { return 0; }
 static inline void hypervisor_resume(void) { ASSERT_UNREACHABLE(); }
 static inline void hypervisor_e820_fixup(struct e820map *e820) {}
+static inline int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
+                                       unsigned int order)
+{
+    return -EOPNOTSUPP;
+}
 
 #endif  /* CONFIG_GUEST */
 
-- 
2.26.0


