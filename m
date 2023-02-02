Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E67687B8D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488663.756880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSF-0003rX-Re; Thu, 02 Feb 2023 11:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488663.756880; Thu, 02 Feb 2023 11:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSF-0003mZ-Mk; Thu, 02 Feb 2023 11:08:35 +0000
Received: by outflank-mailman (input) for mailman id 488663;
 Thu, 02 Feb 2023 11:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSE-0002sY-5K
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ee36cf06-a2e9-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:08:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E62A414BF;
 Thu,  2 Feb 2023 03:09:14 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C35FE3F64C;
 Thu,  2 Feb 2023 03:08:31 -0800 (PST)
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
X-Inumbo-ID: ee36cf06-a2e9-11ed-933c-83870f6b2ba8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 04/10] xen/arm: add SVE exception class handling
Date: Thu,  2 Feb 2023 11:08:10 +0000
Message-Id: <20230202110816.1252419-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202110816.1252419-1-luca.fancellu@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SVE has a new exception class with code 0x19, introduce the new code
and handle the exception.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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
2.25.1


