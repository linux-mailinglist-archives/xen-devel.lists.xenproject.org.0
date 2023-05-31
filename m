Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23D71780A
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541555.844458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GCA-00060m-36; Wed, 31 May 2023 07:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541555.844458; Wed, 31 May 2023 07:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GC9-0005un-Tf; Wed, 31 May 2023 07:24:33 +0000
Received: by outflank-mailman (input) for mailman id 541555;
 Wed, 31 May 2023 07:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKzP=BU=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q4GC8-0005os-Ey
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:24:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2de467be-ff84-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 09:24:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39258165C;
 Wed, 31 May 2023 00:25:14 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBF0F3F663;
 Wed, 31 May 2023 00:24:27 -0700 (PDT)
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
X-Inumbo-ID: 2de467be-ff84-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 04/12] xen/arm: add SVE exception class handling
Date: Wed, 31 May 2023 08:24:05 +0100
Message-Id: <20230531072413.868673-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531072413.868673-1-luca.fancellu@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SVE has a new exception class with code 0x19, introduce the new code
and handle the exception.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes from v6:
 - Add R-by Julien
Changes from v5:
 - modified error messages (Julien)
 - add R-by Bertrand
Changes from v4:
 - No changes
Changes from v3:
 - No changes
Changes from v2:
 - No changes
Changes from v1:
 - No changes
Changes from RFC:
 - No changes
---
 xen/arch/arm/include/asm/processor.h | 1 +
 xen/arch/arm/traps.c                 | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index bc683334125c..7e42ff8811fc 100644
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
index 3393e10b52e6..f6437f6aa9c9 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2172,6 +2172,11 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
         perfc_incr(trap_sysreg);
         do_sysreg(regs, hsr);
         break;
+    case HSR_EC_SVE:
+        GUEST_BUG_ON(regs_mode_is_32bit(regs));
+        gprintk(XENLOG_WARNING, "Domain tried to use SVE while not allowed\n");
+        inject_undef_exception(regs, hsr);
+        break;
 #endif
 
     case HSR_EC_INSTR_ABORT_LOWER_EL:
@@ -2201,6 +2206,10 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
     case HSR_EC_BRK:
         do_trap_brk(regs, hsr);
         break;
+    case HSR_EC_SVE:
+        /* An SVE exception is a bug somewhere in hypervisor code */
+        do_unexpected_trap("SVE trap at EL2", regs);
+        break;
 #endif
     case HSR_EC_DATA_ABORT_CURR_EL:
     case HSR_EC_INSTR_ABORT_CURR_EL:
-- 
2.34.1


