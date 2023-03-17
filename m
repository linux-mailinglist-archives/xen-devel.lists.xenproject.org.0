Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAC6BE9F2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 14:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511066.789853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdA07-0006nW-MC; Fri, 17 Mar 2023 13:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511066.789853; Fri, 17 Mar 2023 13:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdA07-0006ij-IO; Fri, 17 Mar 2023 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 511066;
 Fri, 17 Mar 2023 13:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfIU=7J=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pdA06-0005tG-2P
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 13:20:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6e3cb33f-c4c6-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 14:20:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C61C1A00;
 Fri, 17 Mar 2023 06:20:48 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFF813F64C;
 Fri, 17 Mar 2023 06:20:03 -0700 (PDT)
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
X-Inumbo-ID: 6e3cb33f-c4c6-11ed-87f5-c1b5be75604c
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 04/10] xen/arm: add SVE exception class handling
Date: Fri, 17 Mar 2023 13:19:43 +0000
Message-Id: <20230317131949.4031014-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317131949.4031014-1-luca.fancellu@arm.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SVE has a new exception class with code 0x19, introduce the new code
and handle the exception.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - No changes
Changes from v1:
 - No changes
Changes from RFC:
 - No changes
---
 xen/arch/arm/include/asm/processor.h |  1 +
 xen/arch/arm/traps.c                 | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 0e38926b94db..625c2bd0cd6c 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -426,6 +426,7 @@
 #define HSR_EC_HVC64                0x16
 #define HSR_EC_SMC64                0x17
 #define HSR_EC_SYSREG               0x18
+#define HSR_EC_SVE                  0x19
 #endif
 #define HSR_EC_INSTR_ABORT_LOWER_EL 0x20
 #define HSR_EC_INSTR_ABORT_CURR_EL  0x21
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index a78a99ddadd0..c2e30feafd5a 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2160,6 +2160,13 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
         perfc_incr(trap_sysreg);
         do_sysreg(regs, hsr);
         break;
+    case HSR_EC_SVE:
+        GUEST_BUG_ON(regs_mode_is_32bit(regs));
+        gprintk(XENLOG_WARNING,
+                "Domain id %d tried to use SVE while not allowed\n",
+                current->domain->domain_id);
+        inject_undef_exception(regs, hsr);
+        break;
 #endif
 
     case HSR_EC_INSTR_ABORT_LOWER_EL:
@@ -2189,6 +2196,11 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
     case HSR_EC_BRK:
         do_trap_brk(regs, hsr);
         break;
+    case HSR_EC_SVE:
+        /* An SVE exception is a bug somewhere in hypervisor code */
+        printk("SVE trap at EL2.\n");
+        do_unexpected_trap("Hypervisor", regs);
+        break;
 #endif
     case HSR_EC_DATA_ABORT_CURR_EL:
     case HSR_EC_INSTR_ABORT_CURR_EL:
-- 
2.34.1


