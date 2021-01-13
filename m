Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A842F4C2E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66515.118168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAL-0002bh-Px; Wed, 13 Jan 2021 13:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66515.118168; Wed, 13 Jan 2021 13:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAL-0002b5-Mr; Wed, 13 Jan 2021 13:26:25 +0000
Received: by outflank-mailman (input) for mailman id 66515;
 Wed, 13 Jan 2021 13:26:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g0Bu=GQ=merlin.srs.infradead.org=batv+bb699a031bde933ae53d+6352+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kzgAH-0002b0-JS
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:26:24 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0847f02a-fbde-46bc-a9de-1d961f881292;
 Wed, 13 Jan 2021 13:26:17 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzgA6-0007Xv-1g; Wed, 13 Jan 2021 13:26:10 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzgA4-001m3I-Vn; Wed, 13 Jan 2021 13:26:08 +0000
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
X-Inumbo-ID: 0847f02a-fbde-46bc-a9de-1d961f881292
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=Y4zmIg7u/h9MHqeM4gjTkQQySHu05FosItAdEAKmRis=; b=RufyiL/GIwWsux2Ru6gogAORBV
	a65xJVPOwz3qatqWk3zzNwtOYg0i3MKn4wFACQg6qP2D6R/KvTSylaYy74r1r70G87qoVy5p2uE3r
	w0ic8bkGTB5yJRbdMGspt8U1e/MT+CfXhy0T0q3aIRH0xf7KRrW4DxkD7/s35O94o6kGXcSTDsJFn
	EoaC19Iz6gcgu+dLZI2cNOEXzDN17I7L/iXV4XLyzzvgW52gcSna0e3051eZ6RZC1kALIuN2aAbV4
	vfTxLZuTZcWrbpymZIDADDWbeNVrZLs2cKEWaZesU4DeeWiMzczPjWw2X5d0FfBv+qc2Uqe6h1ha/
	4JXHGvCg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v4 5/5] x86/xen: Fix xen_hvm_smp_init() when vector callback not available
Date: Wed, 13 Jan 2021 13:26:06 +0000
Message-Id: <20210113132606.422794-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Only the IPI-related functions in the smp_ops should be conditional
on the vector callback being available. The rest should still happen:

 • xen_hvm_smp_prepare_boot_cpu()

   This function does two things, both of which should still happen if
   there is no vector callback support.

   The call to xen_vcpu_setup() for vCPU0 should still happen as it just
   sets up the vcpu_info for CPU0. That does happen for the secondary
   vCPUs too, from xen_cpu_up_prepare_hvm().

   The second thing it does is call xen_init_spinlocks(), which perhaps
   counter-intuitively should *also* still be happening in the case
   without vector callbacks, so that it can clear its local xen_pvspin
   flag and disable the virt_spin_lock_key accordingly.

   Checking xen_have_vector_callback in xen_init_spinlocks() itself
   would affect PV guests, so set the global nopvspin flag in
   xen_hvm_smp_init() instead, when vector callbacks aren't available.

 • xen_hvm_smp_prepare_cpus()

   This does some IPI-related setup by calling xen_smp_intr_init() and
   xen_init_lock_cpu(), which can be made conditional. And it sets the
   xen_vcpu_id to XEN_VCPU_ID_INVALID for all possible CPUS, which does
   need to happen.

 • xen_smp_cpus_done()

   This offlines any vCPUs which doesn't fit in the global shared_info
   page, if separate vcpu_info placement isn't available. That part also
   needs to happen regardless of vector callback support.

 • xen_hvm_cpu_die()

   This doesn't actually do anything other than commin_cpu_die() right
   right now in the !vector_callback case; all three teardown functions
   it calls should be no-ops. But to guard against future regressions
   it's useful to call it anyway, and for it to explicitly check for
   xen_have_vector_callback before calling those additional functions.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/xen/smp_hvm.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index f5e7db4f82ab..056430a1080b 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -33,9 +33,11 @@ static void __init xen_hvm_smp_prepare_cpus(unsigned int max_cpus)
 	int cpu;
 
 	native_smp_prepare_cpus(max_cpus);
-	WARN_ON(xen_smp_intr_init(0));
 
-	xen_init_lock_cpu(0);
+	if (xen_have_vector_callback) {
+		WARN_ON(xen_smp_intr_init(0));
+		xen_init_lock_cpu(0);
+	}
 
 	for_each_possible_cpu(cpu) {
 		if (cpu == 0)
@@ -50,9 +52,11 @@ static void __init xen_hvm_smp_prepare_cpus(unsigned int max_cpus)
 static void xen_hvm_cpu_die(unsigned int cpu)
 {
 	if (common_cpu_die(cpu) == 0) {
-		xen_smp_intr_free(cpu);
-		xen_uninit_lock_cpu(cpu);
-		xen_teardown_timer(cpu);
+		if (xen_have_vector_callback) {
+			xen_smp_intr_free(cpu);
+			xen_uninit_lock_cpu(cpu);
+			xen_teardown_timer(cpu);
+		}
 	}
 }
 #else
@@ -64,14 +68,17 @@ static void xen_hvm_cpu_die(unsigned int cpu)
 
 void __init xen_hvm_smp_init(void)
 {
-	if (!xen_have_vector_callback)
+	smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
+	smp_ops.smp_prepare_cpus = xen_hvm_smp_prepare_cpus;
+	smp_ops.smp_cpus_done = xen_smp_cpus_done;
+	smp_ops.cpu_die = xen_hvm_cpu_die;
+
+	if (!xen_have_vector_callback) {
+		nopvspin = true;
 		return;
+	}
 
-	smp_ops.smp_prepare_cpus = xen_hvm_smp_prepare_cpus;
 	smp_ops.smp_send_reschedule = xen_smp_send_reschedule;
-	smp_ops.cpu_die = xen_hvm_cpu_die;
 	smp_ops.send_call_func_ipi = xen_smp_send_call_function_ipi;
 	smp_ops.send_call_func_single_ipi = xen_smp_send_call_function_single_ipi;
-	smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
-	smp_ops.smp_cpus_done = xen_smp_cpus_done;
 }
-- 
2.29.2


