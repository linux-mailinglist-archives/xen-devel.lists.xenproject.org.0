Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B832FC682
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 02:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71170.127294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22Gi-0001v3-DL; Wed, 20 Jan 2021 01:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71170.127294; Wed, 20 Jan 2021 01:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22Gi-0001uR-9F; Wed, 20 Jan 2021 01:26:44 +0000
Received: by outflank-mailman (input) for mailman id 71170;
 Wed, 20 Jan 2021 01:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AECs=GX=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1l22Gg-0001r2-C9
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 01:26:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e65c0f8-e924-457d-aaf9-3d5be99be93d;
 Wed, 20 Jan 2021 01:26:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35F6A2333D;
 Wed, 20 Jan 2021 01:26:36 +0000 (UTC)
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
X-Inumbo-ID: 2e65c0f8-e924-457d-aaf9-3d5be99be93d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611105997;
	bh=Y0y4RiRCOTkbxzR1OuKcUy8g7sjPnEEbdSQgPF7jO/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gq1GVMovyw2turFiy7eHW+Z1ggwKF0QCdhSxCuSTnqmGRwTdZwaZsJ0NhIrPUK5/v
	 gw0fofy1nb5m6goba6GjM+D6R8ZsmxMGHQR/Dng97cPWdI2myWHFEeLiARyDGqEMcx
	 UEvzMMEFiHCI+0SNkcFuHR/m92QpmpgNOC35h0IH6nKFbfdlPVQQCg5+pgBldfcvgn
	 O0fSXmnTxg4hYYZcnZSskCaYrHMd78x/gk1QfdYcSJSW4WbIzBKOzdxEoqeXO5lpRc
	 N88XbWbY980TBw+fztV14w56S0M9nuoDvN8GDyiyeURM3zaYskBbz2+pDJcoJE5nof
	 K7HSV+scKIpLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 26/45] x86/xen: Fix xen_hvm_smp_init() when vector callback not available
Date: Tue, 19 Jan 2021 20:25:43 -0500
Message-Id: <20210120012602.769683-26-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: David Woodhouse <dwmw@amazon.co.uk>

[ Upstream commit 3d7746bea92530e8695258a3cf3ddec7a135edd6 ]

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
Link: https://lore.kernel.org/r/20210106153958.584169-6-dwmw2@infradead.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/smp_hvm.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index f5e7db4f82abb..056430a1080bb 100644
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
2.27.0


