Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8D66B715
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 07:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478317.741418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHIa5-000823-6r; Mon, 16 Jan 2023 06:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478317.741418; Mon, 16 Jan 2023 06:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHIa5-00080J-3x; Mon, 16 Jan 2023 06:02:53 +0000
Received: by outflank-mailman (input) for mailman id 478317;
 Mon, 16 Jan 2023 06:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGc4=5N=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pHIa3-00080D-Dy
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 06:02:51 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d3b344-9563-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 07:02:47 +0100 (CET)
Received: from [128.177.82.146] (helo=srivatsa-dev.eng.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpa (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pHIZd-00EV5m-KZ;
 Mon, 16 Jan 2023 01:02:25 -0500
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
X-Inumbo-ID: 65d3b344-9563-11ed-b8d0-410ff93cb8f0
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: linux-kernel@vger.kernel.org
Cc: amakhalov@vmware.com,
	ganb@vmware.com,
	ankitja@vmware.com,
	bordoloih@vmware.com,
	keerthanak@vmware.com,
	blamoreaux@vmware.com,
	namit@vmware.com,
	srivatsa@csail.mit.edu,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Wyes Karny <wyes.karny@amd.com>,
	Lewis Caroll <lewis.carroll@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>,
	x86@kernel.org,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle state
Date: Sun, 15 Jan 2023 22:01:34 -0800
Message-Id: <20230116060134.80259-1-srivatsa@csail.mit.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>

Under hypervisors that support mwait passthrough, a vCPU in mwait
CPU-idle state remains in guest context (instead of yielding to the
hypervisor via VMEXIT), which helps speed up wakeups from idle.

However, this runs into problems with CPU hotplug, because the Linux
CPU offline path prefers to put the vCPU-to-be-offlined in mwait
state, whenever mwait is available. As a result, since a vCPU in mwait
remains in guest context and does not yield to the hypervisor, an
offline vCPU *appears* to be 100% busy as viewed from the host, which
prevents the hypervisor from running other vCPUs or workloads on the
corresponding pCPU. [ Note that such a vCPU is not actually busy
spinning though; it remains in mwait idle state in the guest ].

Fix this by preventing the use of mwait idle state in the vCPU offline
play_dead() path for any hypervisor, even if mwait support is
available.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Wyes Karny <wyes.karny@amd.com>
Cc: Lewis Caroll <lewis.carroll@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Alexey Makhalov <amakhalov@vmware.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
Cc: virtualization@lists.linux-foundation.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
---

v1: https://lore.kernel.org/lkml/165843627080.142207.12667479241667142176.stgit@csail.mit.edu/

 arch/x86/kernel/smpboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55cad72715d9..125a5d4bfded 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1763,6 +1763,15 @@ static inline void mwait_play_dead(void)
 		return;
 	if (!this_cpu_has(X86_FEATURE_CLFLUSH))
 		return;
+
+	/*
+	 * Do not use mwait in CPU offline play_dead if running under
+	 * any hypervisor, to make sure that the offline vCPU actually
+	 * yields to the hypervisor (which may not happen otherwise if
+	 * the hypervisor supports mwait passthrough).
+	 */
+	if (this_cpu_has(X86_FEATURE_HYPERVISOR))
+		return;
 	if (__this_cpu_read(cpu_info.cpuid_level) < CPUID_MWAIT_LEAF)
 		return;
 
-- 
2.25.1


