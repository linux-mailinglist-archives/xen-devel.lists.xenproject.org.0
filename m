Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491F4E74EE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294780.501390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXknQ-00021C-NL; Fri, 25 Mar 2022 14:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294780.501390; Fri, 25 Mar 2022 14:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXknQ-0001yj-KB; Fri, 25 Mar 2022 14:20:08 +0000
Received: by outflank-mailman (input) for mailman id 294780;
 Fri, 25 Mar 2022 14:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hlgX=UE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXknP-0001uN-6K
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:20:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab0e5fc5-ac46-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 15:20:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC06721110;
 Fri, 25 Mar 2022 14:20:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6575B132E9;
 Fri, 25 Mar 2022 14:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dy1/F5TPPWL6EQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Mar 2022 14:20:04 +0000
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
X-Inumbo-ID: ab0e5fc5-ac46-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648218004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wwwyt1xK0HmXO1qRV3kfkubpFO7mwn/CtU9TCGfV+j0=;
	b=PaPT8GekWg7B8tp64vOUqB7V3ysZ3fzCtptcXK5/u/61zcFo9wBl058YL6CPvQom00Eroj
	3r0AP0nMj3iKhXN/U6bkubJY8ibdyLuACqUF//b2/+QknKPVDcZdCj4x2kTJKYjcDK+h6h
	hnDpz4dK6YeHEJc2EC0LTQPiTf3TQCo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] xen: fix is_xen_pmu()
Date: Fri, 25 Mar 2022 15:20:02 +0100
Message-Id: <20220325142002.31789-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

is_xen_pmu() is taking the cpu number as parameter, but it is not using
it. Instead it just tests whether the Xen PMU initialization on the
current cpu did succeed. As this test is done by checking a percpu
pointer, preemption needs to be disabled in order to avoid switching
the cpu while doing the test. While resuming from suspend() this seems
not to be the case:

[   88.082751] ACPI: PM: Low-level resume complete
[   88.087933] ACPI: EC: EC started
[   88.091464] ACPI: PM: Restoring platform NVS memory
[   88.097166] xen_acpi_processor: Uploading Xen processor PM info
[   88.103850] Enabling non-boot CPUs ...
[   88.108128] installing Xen timer for CPU 1
[   88.112763] BUG: using smp_processor_id() in preemptible [00000000] code: systemd-sleep/7138
[   88.122256] caller is is_xen_pmu+0x12/0x30
[   88.126937] CPU: 0 PID: 7138 Comm: systemd-sleep Tainted: G        W         5.16.13-2.fc32.qubes.x86_64 #1
[   88.137939] Hardware name: Star Labs StarBook/StarBook, BIOS 7.97 03/21/2022
[   88.145930] Call Trace:
[   88.148757]  <TASK>
[   88.151193]  dump_stack_lvl+0x48/0x5e
[   88.155381]  check_preemption_disabled+0xde/0xe0
[   88.160641]  is_xen_pmu+0x12/0x30
[   88.164441]  xen_smp_intr_init_pv+0x75/0x100

Fix that by replacing is_xen_pmu() by a simple boolean variable which
reflects the Xen PMU initialization state on cpu 0.

Modify xen_pmu_init() to return early in case it is being called for a
cpu other than cpu 0 and the boolean variable not being set.

Fixes: bf6dfb154d93 ("xen/PMU: PMU emulation code")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't reset is_xen_pmu when suspending (Boris Ostrovsky)
---
 arch/x86/xen/pmu.c    | 10 ++++------
 arch/x86/xen/pmu.h    |  3 ++-
 arch/x86/xen/smp_pv.c |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 89dd6b1708b0..21ecbe754cb2 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -506,10 +506,7 @@ irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
-bool is_xen_pmu(int cpu)
-{
-	return (get_xenpmu_data() != NULL);
-}
+bool is_xen_pmu;
 
 void xen_pmu_init(int cpu)
 {
@@ -520,7 +517,7 @@ void xen_pmu_init(int cpu)
 
 	BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
 
-	if (xen_hvm_domain())
+	if (xen_hvm_domain() || (cpu != 0 && !is_xen_pmu))
 		return;
 
 	xenpmu_data = (struct xen_pmu_data *)get_zeroed_page(GFP_KERNEL);
@@ -541,7 +538,8 @@ void xen_pmu_init(int cpu)
 	per_cpu(xenpmu_shared, cpu).xenpmu_data = xenpmu_data;
 	per_cpu(xenpmu_shared, cpu).flags = 0;
 
-	if (cpu == 0) {
+	if (!is_xen_pmu) {
+		is_xen_pmu = true;
 		perf_register_guest_info_callbacks(&xen_guest_cbs);
 		xen_pmu_arch_init();
 	}
diff --git a/arch/x86/xen/pmu.h b/arch/x86/xen/pmu.h
index 0e83a160589b..65c58894fc79 100644
--- a/arch/x86/xen/pmu.h
+++ b/arch/x86/xen/pmu.h
@@ -4,6 +4,8 @@
 
 #include <xen/interface/xenpmu.h>
 
+extern bool is_xen_pmu;
+
 irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
 #ifdef CONFIG_XEN_HAVE_VPMU
 void xen_pmu_init(int cpu);
@@ -12,7 +14,6 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool is_xen_pmu(int cpu);
 bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
 bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
 int pmu_apic_update(uint32_t reg);
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 4a6019238ee7..688aa8b6ae29 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -129,7 +129,7 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 	per_cpu(xen_irq_work, cpu).irq = rc;
 	per_cpu(xen_irq_work, cpu).name = callfunc_name;
 
-	if (is_xen_pmu(cpu)) {
+	if (is_xen_pmu) {
 		pmu_name = kasprintf(GFP_KERNEL, "pmu%d", cpu);
 		rc = bind_virq_to_irqhandler(VIRQ_XENPMU, cpu,
 					     xen_pmu_irq_handler,
-- 
2.34.1


