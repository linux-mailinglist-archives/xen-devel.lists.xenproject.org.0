Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF367F33E
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 01:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486017.753485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLZF6-0004wP-Dw; Sat, 28 Jan 2023 00:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486017.753485; Sat, 28 Jan 2023 00:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLZF6-0004tH-AL; Sat, 28 Jan 2023 00:38:52 +0000
Received: by outflank-mailman (input) for mailman id 486017;
 Sat, 28 Jan 2023 00:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k5Ro=5Z=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pLZF5-0004sT-Ns
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 00:38:51 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1faad50f-9ea4-11ed-b8d1-410ff93cb8f0;
 Sat, 28 Jan 2023 01:38:47 +0100 (CET)
Received: from [64.186.27.43] (helo=srivatsa-dev.eng.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpa (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pLZER-000elb-VP;
 Fri, 27 Jan 2023 19:38:12 -0500
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
X-Inumbo-ID: 1faad50f-9ea4-11ed-b8d1-410ff93cb8f0
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: tglx@linutronix.de,
	mingo@redhat.com,
	x86@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	rafael.j.wysocki@intel.com,
	paulmck@kernel.org,
	jgross@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	linux-kernel@vger.kernel.org,
	imammedo@redhat.com,
	amakhalov@vmware.com,
	ganb@vmware.com,
	ankitja@vmware.com,
	bordoloih@vmware.com,
	keerthanak@vmware.com,
	blamoreaux@vmware.com,
	namit@vmware.com,
	wyes.karny@amd.com,
	lewis.carroll@amd.com,
	pv-drivers@vmware.com,
	virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	srivatsa@csail.mit.edu
Subject: [PATCH] x86/hotplug: Remove incorrect comment about mwait_play_dead()
Date: Fri, 27 Jan 2023 16:37:51 -0800
Message-Id: <20230128003751.141317-1-srivatsa@csail.mit.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>

The comment that says mwait_play_dead() returns only on failure is a
bit misleading because mwait_play_dead() could actually return for
valid reasons (such as mwait not being supported by the platform) that
do not indicate a failure of the CPU offline operation. So, remove the
comment.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
---
 arch/x86/kernel/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55cad72715d9..9013bb28255a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1833,7 +1833,7 @@ void native_play_dead(void)
 	play_dead_common();
 	tboot_shutdown(TB_SHUTDOWN_WFS);
 
-	mwait_play_dead();	/* Only returns on failure */
+	mwait_play_dead();
 	if (cpuidle_play_dead())
 		hlt_play_dead();
 }
-- 
2.25.1


