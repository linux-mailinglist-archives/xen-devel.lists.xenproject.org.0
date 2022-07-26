Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE75813AD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 14:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375283.607579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGK7u-0001No-UR; Tue, 26 Jul 2022 12:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375283.607579; Tue, 26 Jul 2022 12:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGK7u-0001Kd-Rd; Tue, 26 Jul 2022 12:57:30 +0000
Received: by outflank-mailman (input) for mailman id 375283;
 Tue, 26 Jul 2022 12:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l70u=X7=citrix.com=prvs=19948b9cc=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oGK7t-0001KX-17
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 12:57:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eb5b352-0ce2-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 14:57:26 +0200 (CEST)
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
X-Inumbo-ID: 7eb5b352-0ce2-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658840246;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nVsswOXwuLaTALgLmNaZg4gcGwG6EGeds9Y3uPMNHLc=;
  b=hNlv+4NZWRfxC98orPE3G+kq+g4QIb/o9AeDCMhyyjW/hBrnDlgS6Nkl
   wKPeWGS+Xq6w3xbwExAKtNPrsv/XtM6J5NR9QOYJsgrUvFrOJcZcQ5ReK
   A7LledihzakDfNI6MGMd4Cqvb2UyP8RkALX6GOB+fIvt5NU8F2N3/HGuV
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75926172
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DiEUdq5Dm0wQ5UfgUO9DFAxRtETAchMFZxGqfqrLsTDasY5as4F+v
 msZUTqAPKzeNDDzfI13bom//EMEu5Hcx4VlQQtrqXhnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ksw5qmq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJFNmA5YZ3t96OF9tq
 +0YcDcyN1edv+3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESz9GPFpRLZs6leOhgHTXeDxEslOF46Ew5gA/ySQujem3boOKILRmQ+1wxEifu
 Eifwl34C1YGOPuj5yq+2G2F07qncSTTB9tJSezQGuRRqFiTy30VBTUfUFKppv//hkPWc9VbJ
 k8P8ywit58u5VerRdnwWR6/iHOctxtaUN1Ve8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQo2
 UWOhMjBHiF0vfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adhdrxGDe2w
 DGMowA/gakeiYgA0KDT1VLNji+op5PJZhUo/QiRVWWghitpNNCNZIGy71Xfq/FaI+6xUlaFr
 FAAms6D8PoJC5Cd0iCAKM0HG6uo/LCCKyHGhkB0HIgJ8C6k8HquO4tX5VlWIEZvL9ZBejLzZ
 kLXkR1e6YUVP3awa6JzJYWrBKwCyKnmGtPNTP3YbtNSJJN2cWev/DlnTVyBw2f31kMrlMkXN
 Z6FfICsBHABBKJPyDuwWvdb0Lk3yyR4zmTWLbjx1zyu1buTYi7TRbptDbeVRrlntuXe+lyTq
 osBcZvRo/lCbAHgSjuHz5USCWkHFEYYW4H288toL6mdGgUzTQnNFMTtLaMdl51NxvoIxreQp
 ivmAye023Kk2ySZdFzihmRLLeq2AM0h9S9T0TkEZw7A5pQ1XWq4AE7znbMTdKJvyuFsxOUco
 xItK5TZWaQnptgqFl0ggXjBQG9KLk3DafqmZXbNXdTGV8cIq/b10tHlZBDz0yIFEzC6s8Azy
 5X5iF6LHsVfHlQyU5uIAB5K879WlSFG8N+eomOSeoUDEKkS2NMCx9PNYg8ffJhXdESrKsqy3
 AeKGxYIzdTwT3sO2ICQ3cis8tb2e9aS62IAQAE3G57qanSBlodiqKccONu1kcf1Dzuupv/9N
 LgEkJkR8pQvxT53jma1KJ4zpYpW2jclj+YyIthMdJkTU2mWNw==
IronPort-HdrOrdr: A9a23:OBZm46+cer3TyLayyEJuk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+sjztCWE7wr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQYhEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="75926172"
From: Jane Malalane <jane.malalane@citrix.com>
To: LKML <linux-kernel@vger.kernel.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Maximilian Heyne <mheyne@amazon.de>, "Jan
 Beulich" <jbeulich@suse.com>, Colin Ian King <colin.king@intel.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/xen: Add support for HVMOP_set_evtchn_upcall_vector
Date: Tue, 26 Jul 2022 13:56:57 +0100
Message-ID: <20220726125657.12151-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Implement support for the HVMOP_set_evtchn_upcall_vector hypercall in
order to set the per-vCPU event channel vector callback on Linux and
use it in preference of HVM_PARAM_CALLBACK_IRQ.

If the per-VCPU vector setup is successful on BSP, use this method
for the APs. If not, fallback to the global vector-type callback.

Also register callback_irq at per-vCPU event channel setup to trick
toolstack to think the domain is enlightened.

Suggested-by: "Roger Pau Monné" <roger.pau@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: x86@kernel.org
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Jane Malalane <jane.malalane@citrix.com>
CC: Maximilian Heyne <mheyne@amazon.de>
CC: Jan Beulich <jbeulich@suse.com>
CC: Colin Ian King <colin.king@intel.com>
CC: xen-devel@lists.xenproject.org

v2:
 * remove no_vector_callback
 * make xen_have_vector_callback a bool
 * rename xen_ack_upcall to xen_percpu_upcall
 * fail to bring CPU up on init instead of crashing kernel
 * add and use xen_set_upcall_vector where suitable
 * xen_setup_upcall_vector -> xen_init_setup_upcall_vector for clarity
---
 arch/x86/include/asm/xen/cpuid.h   |  2 ++
 arch/x86/include/asm/xen/events.h  |  3 ++-
 arch/x86/xen/enlighten.c           |  2 +-
 arch/x86/xen/enlighten_hvm.c       | 24 ++++++++++++++-----
 arch/x86/xen/suspend_hvm.c         | 10 +++++++-
 drivers/xen/events/events_base.c   | 49 ++++++++++++++++++++++++++++++++++----
 include/xen/hvm.h                  |  2 ++
 include/xen/interface/hvm/hvm_op.h | 15 ++++++++++++
 8 files changed, 93 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/xen/cpuid.h b/arch/x86/include/asm/xen/cpuid.h
index 78e667a31d6c..6daa9b0c8d11 100644
--- a/arch/x86/include/asm/xen/cpuid.h
+++ b/arch/x86/include/asm/xen/cpuid.h
@@ -107,6 +107,8 @@
  * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
  */
 #define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
+/* Per-vCPU event channel upcalls */
+#define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
 /*
  * Leaf 6 (0x40000x05)
diff --git a/arch/x86/include/asm/xen/events.h b/arch/x86/include/asm/xen/events.h
index 068d9b067c83..62bdceb594f1 100644
--- a/arch/x86/include/asm/xen/events.h
+++ b/arch/x86/include/asm/xen/events.h
@@ -23,7 +23,7 @@ static inline int xen_irqs_disabled(struct pt_regs *regs)
 /* No need for a barrier -- XCHG is a barrier on x86. */
 #define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
 
-extern int xen_have_vector_callback;
+extern bool xen_have_vector_callback;
 
 /*
  * Events delivered via platform PCI interrupts are always
@@ -34,4 +34,5 @@ static inline bool xen_support_evtchn_rebind(void)
 	return (!xen_hvm_domain() || xen_have_vector_callback);
 }
 
+extern bool xen_percpu_upcall;
 #endif /* _ASM_X86_XEN_EVENTS_H */
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 30c6e986a6cd..b8db2148c07d 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -51,7 +51,7 @@ EXPORT_SYMBOL_GPL(xen_start_info);
 
 struct shared_info xen_dummy_shared_info;
 
-__read_mostly int xen_have_vector_callback;
+__read_mostly bool xen_have_vector_callback = true;
 EXPORT_SYMBOL_GPL(xen_have_vector_callback);
 
 /*
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 8b71b1dd7639..198d3cd3e9a5 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -7,6 +7,8 @@
 
 #include <xen/features.h>
 #include <xen/events.h>
+#include <xen/hvm.h>
+#include <xen/interface/hvm/hvm_op.h>
 #include <xen/interface/memory.h>
 
 #include <asm/apic.h>
@@ -30,6 +32,9 @@
 
 static unsigned long shared_info_pfn;
 
+__ro_after_init bool xen_percpu_upcall;
+EXPORT_SYMBOL_GPL(xen_percpu_upcall);
+
 void xen_hvm_init_shared_info(void)
 {
 	struct xen_add_to_physmap xatp;
@@ -125,6 +130,9 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_xen_hvm_callback)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
+	if (xen_percpu_upcall)
+		ack_APIC_irq();
+
 	inc_irq_stat(irq_hv_callback_count);
 
 	xen_hvm_evtchn_do_upcall();
@@ -168,6 +176,15 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 	if (!xen_have_vector_callback)
 		return 0;
 
+	if (xen_percpu_upcall) {
+		rc = xen_set_upcall_vector(cpu);
+		if (rc) {
+			WARN(1, "HVMOP_set_evtchn_upcall_vector"
+			     " for CPU %d failed: %d\n", cpu, rc);
+			return rc;
+		}
+	}
+
 	if (xen_feature(XENFEAT_hvm_safe_pvclock))
 		xen_setup_timer(cpu);
 
@@ -188,8 +205,6 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
 	return 0;
 }
 
-static bool no_vector_callback __initdata;
-
 static void __init xen_hvm_guest_init(void)
 {
 	if (xen_pv_domain())
@@ -211,9 +226,6 @@ static void __init xen_hvm_guest_init(void)
 
 	xen_panic_handler_init();
 
-	if (!no_vector_callback && xen_feature(XENFEAT_hvm_callback_vector))
-		xen_have_vector_callback = 1;
-
 	xen_hvm_smp_init();
 	WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
 	xen_unplug_emulated_devices();
@@ -239,7 +251,7 @@ early_param("xen_nopv", xen_parse_nopv);
 
 static __init int xen_parse_no_vector_callback(char *arg)
 {
-	no_vector_callback = true;
+	xen_have_vector_callback = false;
 	return 0;
 }
 early_param("xen_no_vector_callback", xen_parse_no_vector_callback);
diff --git a/arch/x86/xen/suspend_hvm.c b/arch/x86/xen/suspend_hvm.c
index 9d548b0c772f..0c4f7554b7cc 100644
--- a/arch/x86/xen/suspend_hvm.c
+++ b/arch/x86/xen/suspend_hvm.c
@@ -5,6 +5,7 @@
 #include <xen/hvm.h>
 #include <xen/features.h>
 #include <xen/interface/features.h>
+#include <xen/events.h>
 
 #include "xen-ops.h"
 
@@ -14,6 +15,13 @@ void xen_hvm_post_suspend(int suspend_cancelled)
 		xen_hvm_init_shared_info();
 		xen_vcpu_restore();
 	}
-	xen_setup_callback_vector();
+	if (xen_percpu_upcall) {
+		unsigned int cpu;
+
+		for_each_online_cpu(cpu)
+			BUG_ON(xen_set_upcall_vector(cpu));
+	} else {
+		xen_setup_callback_vector();
+	}
 	xen_unplug_emulated_devices();
 }
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 46d9295d9a6e..2ad93595d03a 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -48,6 +48,7 @@
 #include <asm/xen/pci.h>
 #endif
 #include <asm/sync_bitops.h>
+#include <asm/xen/cpuid.h>
 #include <asm/xen/hypercall.h>
 #include <asm/xen/hypervisor.h>
 #include <xen/page.h>
@@ -2195,11 +2196,48 @@ void xen_setup_callback_vector(void)
 		callback_via = HVM_CALLBACK_VECTOR(HYPERVISOR_CALLBACK_VECTOR);
 		if (xen_set_callback_via(callback_via)) {
 			pr_err("Request for Xen HVM callback vector failed\n");
-			xen_have_vector_callback = 0;
+			xen_have_vector_callback = false;
 		}
 	}
 }
 
+/* Setup per-vCPU vector-type callbacks and trick toolstack to think
+ * we are enlightened. If this setup is unavailable, fallback to the
+ * global vector-type callback. */
+static __init void xen_init_setup_upcall_vector(void)
+{
+	unsigned int cpu = 0;
+
+	if (!xen_have_vector_callback)
+		return;
+
+	if ((cpuid_eax(xen_cpuid_base() + 4) & XEN_HVM_CPUID_UPCALL_VECTOR) &&
+	    !xen_set_upcall_vector(cpu) && !xen_set_callback_via(1))
+		xen_percpu_upcall = true;
+	else if (xen_feature(XENFEAT_hvm_callback_vector))
+		xen_setup_callback_vector();
+	else
+		xen_have_vector_callback = false;
+}
+
+int xen_set_upcall_vector(unsigned int cpu)
+{
+	int rc;
+	xen_hvm_evtchn_upcall_vector_t op = {
+		.vector = HYPERVISOR_CALLBACK_VECTOR,
+		.vcpu = per_cpu(xen_vcpu_id, cpu),
+	};
+
+	rc = HYPERVISOR_hvm_op(HVMOP_set_evtchn_upcall_vector, &op);
+	if (rc)
+		return rc;
+
+	if (!cpu)
+		rc = xen_set_callback_via(1);
+
+	return rc;
+}
+
 static __init void xen_alloc_callback_vector(void)
 {
 	if (!xen_have_vector_callback)
@@ -2210,6 +2248,8 @@ static __init void xen_alloc_callback_vector(void)
 }
 #else
 void xen_setup_callback_vector(void) {}
+static inline void xen_init_setup_upcall_vector(void) {}
+int xen_set_upcall_vector(unsigned int cpu) {}
 static inline void xen_alloc_callback_vector(void) {}
 #endif
 
@@ -2271,10 +2311,9 @@ void __init xen_init_IRQ(void)
 		if (xen_initial_domain())
 			pci_xen_initial_domain();
 	}
-	if (xen_feature(XENFEAT_hvm_callback_vector)) {
-		xen_setup_callback_vector();
-		xen_alloc_callback_vector();
-	}
+	xen_init_setup_upcall_vector();
+	xen_alloc_callback_vector();
+
 
 	if (xen_hvm_domain()) {
 		native_init_IRQ();
diff --git a/include/xen/hvm.h b/include/xen/hvm.h
index b7fd7fc9ad41..8da7a6747058 100644
--- a/include/xen/hvm.h
+++ b/include/xen/hvm.h
@@ -60,4 +60,6 @@ static inline int hvm_get_parameter(int idx, uint64_t *value)
 
 void xen_setup_callback_vector(void);
 
+int xen_set_upcall_vector(unsigned int cpu);
+
 #endif /* XEN_HVM_H__ */
diff --git a/include/xen/interface/hvm/hvm_op.h b/include/xen/interface/hvm/hvm_op.h
index f3097e79bb03..e714d8b6ef89 100644
--- a/include/xen/interface/hvm/hvm_op.h
+++ b/include/xen/interface/hvm/hvm_op.h
@@ -46,4 +46,19 @@ struct xen_hvm_get_mem_type {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_hvm_get_mem_type);
 
+/*
+ * HVMOP_set_evtchn_upcall_vector: Set a <vector> that should be used for event
+ *                                 channel upcalls on the specified <vcpu>. If set,
+ *                                 this vector will be used in preference to the
+ *                                 domain global callback via (see
+ *                                 HVM_PARAM_CALLBACK_IRQ).
+ */
+#define HVMOP_set_evtchn_upcall_vector 23
+struct xen_hvm_evtchn_upcall_vector {
+    uint32_t vcpu;
+    uint8_t vector;
+};
+typedef struct xen_hvm_evtchn_upcall_vector xen_hvm_evtchn_upcall_vector_t;
+DEFINE_GUEST_HANDLE_STRUCT(xen_hvm_evtchn_upcall_vector_t);
+
 #endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
-- 
2.11.0


