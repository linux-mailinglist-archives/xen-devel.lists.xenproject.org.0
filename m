Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC8A40069
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894566.1303302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZKK-0004e6-QA; Fri, 21 Feb 2025 20:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894566.1303302; Fri, 21 Feb 2025 20:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZKK-0004c4-MD; Fri, 21 Feb 2025 20:08:48 +0000
Received: by outflank-mailman (input) for mailman id 894566;
 Fri, 21 Feb 2025 20:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJx0=VM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tlZKI-00049e-W4
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:08:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a71eedbd-f08f-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 21:08:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 75222828714E;
 Fri, 21 Feb 2025 14:08:44 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id usZ911c4BZFo; Fri, 21 Feb 2025 14:08:44 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D75F18286E9D;
 Fri, 21 Feb 2025 14:08:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vGHF0shFT-mT; Fri, 21 Feb 2025 14:08:43 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 78D4A828714E;
 Fri, 21 Feb 2025 14:08:42 -0600 (CST)
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
X-Inumbo-ID: a71eedbd-f08f-11ef-9896-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D75F18286E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740168523; bh=VKiNhIhFzhXjck7mqEqrWgb9EZDd1QiPkU136TnDXEg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Ic/DoOLWezLMIjPewnE5jrx4iBz7A1FLynpZFyVxSCZyzROgntOiay9e5/RxTQ4Pg
	 afDJXtVlNFjL58m/YtpoC/uRr6H5GrfTlnqwYJYMTP8c2jN6+mylw9UcujL5fF7ay3
	 pjB7rvYL4ot1iA0f9q2C7q4s32u+yMbBGK4XGyWQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/2] PPC: Activate UBSAN in testing
Date: Fri, 21 Feb 2025 14:08:37 -0600
Message-Id: <6610afb521d2af1bfe4ad7710e469666d318a0c6.1740168326.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1740168326.git.sanastasio@raptorengineering.com>
References: <cover.1740168326.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes from Andrew's v1:
  - Define dump_execution_state in the same manner as risc-v

 automation/gitlab-ci/build.yaml      | 3 +++
 xen/arch/ppc/Kconfig                 | 1 +
 xen/arch/ppc/include/asm/processor.h | 2 ++
 xen/arch/ppc/stubs.c                 | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 35e224366f..6a2e491534 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -352,6 +352,9 @@ debian-12-ppc64le-gcc-debug:
     CONTAINER: debian:12-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y

 debian-12-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index 6db575a48d..917f5d53a6 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -2,6 +2,7 @@ config PPC
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_DEVICE_TREE
+	select HAS_UBSAN
 	select HAS_VMAP

 config PPC64
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index a01b62b8a4..50161cc32d 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -219,6 +219,8 @@ static inline void noreturn die(void)
  */
 #define cpu_relax() asm volatile ( "or %r1, %r1, %r1; or %r2, %r2, %r2" )

+#define dump_execution_state() run_in_exception_handler(show_execution_state)
+
 #endif /* __ASSEMBLY__ */

 #endif /* _ASM_PPC_PROCESSOR_H */
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index fff82f5cf3..671e71aa0a 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -47,7 +47,7 @@ void send_timer_event(struct vcpu *v)

 void show_execution_state(const struct cpu_user_regs *regs)
 {
-    BUG_ON("unimplemented");
+    printk("TODO: Implement show_execution_state(regs)\n");
 }

 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
--
2.30.2


