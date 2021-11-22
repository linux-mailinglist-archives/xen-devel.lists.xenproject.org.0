Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6A45919A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 16:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228993.396304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBXL-0003Iz-Dx; Mon, 22 Nov 2021 15:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228993.396304; Mon, 22 Nov 2021 15:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBXL-0003GG-A3; Mon, 22 Nov 2021 15:47:19 +0000
Received: by outflank-mailman (input) for mailman id 228993;
 Mon, 22 Nov 2021 15:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iXZ=QJ=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1mpBXK-0003GA-1U
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 15:47:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e3baa0-4bab-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 16:47:16 +0100 (CET)
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
X-Inumbo-ID: 77e3baa0-4bab-11ec-a9d2-d9f7a1cc8784
Date: Mon, 22 Nov 2021 16:47:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637596035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=BEoYoKO1FJBa2ukBy23+bj3uF+7X+WvM0sv+jH9o6GY=;
	b=ZUGKHWh5Cws9FzM8WnZZFWuVIu10DS5k+RyUyJTEhFaLzhPDt5yVuREv+l1mAFo5M7/CEz
	9eDTJWLD6aqbgRfzOys8i6Mzlx6LiHKBTufdSTpRFiXd/qFi+rk0m7aHKUNgl+5CTgE9HI
	rPYlXwLn3O6kCXtmiBCJLh80NdbUqhNVIrnbGZWHZH1Ge8qSRma/zH4+kXdubMD26xHV1H
	3TZ9t7bmyf/7xRdSyObEd/20CemC56TGdkaLf7+Ubav8SH0fcT2KKCyeC5omjwpYBM644D
	/uVPDsWTQmuo1XUEeAL/uLFjyCblJ57kMDNx6JG0kZ8DJp0S/53eBMWD4TtULg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637596035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=BEoYoKO1FJBa2ukBy23+bj3uF+7X+WvM0sv+jH9o6GY=;
	b=let+1knIfa2gh2XASxf6daDfL3UJiKCPCwp+ezq0bLm721yygvSfMZN5U8VWQPHhd/OyFg
	AV4vqOpn+gw4mXCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Message-ID: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

From: "Longpeng(Mike)" <longpeng2@huawei.com>

A CPU will not show up in virtualized environment which includes an
Enclave. The VM splits its resources into a primary VM and a Enclave
VM. While the Enclave is active, the hypervisor will ignore all requests
to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
The kernel will wait up to ten seconds for CPU to show up
(do_boot_cpu()) and then rollback the hotplug state back to
CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.

After the Enclave VM terminates, the primary VM can bring up the CPU
again.

Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.

[bigeasy: Rewrite commit description.]

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.com
---

For XEN: this changes the behaviour as it allows to invoke
cpu_initialize_context() again should it have have earlier. I *think*
this is okay and would to bring up the CPU again should the memory
allocation in cpu_initialize_context() fail.

 kernel/smpboot.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index f6bc0bc8a2aab..34958d7fe2c1c 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
 		 */
 		return -EAGAIN;
 
+	case CPU_UP_PREPARE:
+		/*
+		 * Timeout while waiting for the CPU to show up. Allow to try
+		 * again later.
+		 */
+		return 0;
+
 	default:
 
 		/* Should not happen.  Famous last words. */
-- 
2.33.1


