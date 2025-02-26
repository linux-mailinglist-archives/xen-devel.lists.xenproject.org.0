Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB917A453FF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 04:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896140.1304818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn85M-0002mZ-2A; Wed, 26 Feb 2025 03:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896140.1304818; Wed, 26 Feb 2025 03:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn85L-0002jS-UV; Wed, 26 Feb 2025 03:27:47 +0000
Received: by outflank-mailman (input) for mailman id 896140;
 Wed, 26 Feb 2025 03:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EFW=VR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tn85K-0002fX-Ku
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 03:27:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4308fb4-f3f1-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 04:27:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9CC3D8288411;
 Tue, 25 Feb 2025 21:27:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 18ZKiPHWhyh8; Tue, 25 Feb 2025 21:27:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AEEF282886E7;
 Tue, 25 Feb 2025 21:27:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jXeB_irwf8gD; Tue, 25 Feb 2025 21:27:42 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BFA138288411;
 Tue, 25 Feb 2025 21:27:40 -0600 (CST)
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
X-Inumbo-ID: a4308fb4-f3f1-11ef-9897-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com AEEF282886E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740540462; bh=AEKDtTFwX1VTaqn7kEatwGo3pagvns0+InJkFsE1Gic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=rTiiBxlVodi9+fVATg+OJdz4xKRMzI7xMnVB2KLRRZd6+aw+yG1YfnZbm+OlWGSHX
	 hl8/dEsGdF92enqJ1EThyGNqu7Pkgj6Xz7gU2WIaOeAywY1Ow97f+SfZmioZ/cEq6k
	 3T/0LTqjTUHnT4+6VaGQc3ktohm6jGFKRlRmFN30=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 1/1] PPC: Activate UBSAN in testing
Date: Tue, 25 Feb 2025 21:27:33 -0600
Message-Id: <a1bc84821cf9018549fb1dc0aeb8fd8f9bfeb002.1740540262.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1740540262.git.sanastasio@raptorengineering.com>
References: <cover.1740540262.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Also enable -fno-sanitize=alignment like x86 since support for unaligned
accesses is guaranteed by the ISA and the existing OPAL setup code
relies on it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v2:
  - Add -fno-sanitize=alignment flag per discussion in v1

 automation/gitlab-ci/build.yaml      | 3 +++
 xen/arch/ppc/Kconfig                 | 1 +
 xen/arch/ppc/arch.mk                 | 6 ++++++
 xen/arch/ppc/include/asm/processor.h | 2 ++
 xen/arch/ppc/stubs.c                 | 2 +-
 5 files changed, 13 insertions(+), 1 deletion(-)

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
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 917ad0e6a8..c2ca419242 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -7,3 +7,9 @@ CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
 CFLAGS += -mstrict-align -mcmodel=medium -mabi=elfv2 -fPIC -mno-altivec -mno-vsx -msoft-float

 LDFLAGS += -m elf64lppc
+
+ifeq ($(CONFIG_UBSAN),y)
+# Don't enable alignment sanitisation since Power ISA guarantees hardware
+# support for unaligned accesses.
+$(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
+endif
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


