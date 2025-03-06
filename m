Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E17A554E3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 19:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903945.1311876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqFvD-0005IK-UB; Thu, 06 Mar 2025 18:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903945.1311876; Thu, 06 Mar 2025 18:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqFvD-0005Gy-RJ; Thu, 06 Mar 2025 18:26:15 +0000
Received: by outflank-mailman (input) for mailman id 903945;
 Thu, 06 Mar 2025 18:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fwM=VZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tqFvB-000530-Nr
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 18:26:13 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 787b9019-fab8-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 19:26:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C0FB7828855E;
 Thu,  6 Mar 2025 12:26:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YQ1WodaQ9498; Thu,  6 Mar 2025 12:26:03 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B26438287F65;
 Thu,  6 Mar 2025 12:26:03 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fpwSD352x5sh; Thu,  6 Mar 2025 12:26:02 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E69438287EC8;
 Thu,  6 Mar 2025 12:26:01 -0600 (CST)
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
X-Inumbo-ID: 787b9019-fab8-11ef-9898-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B26438287F65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1741285563; bh=C3efZ9zdciiAYbBh5SKSwZQiHsvax9h+QfR6X1lykOQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=qSkmeU5DMmnDJ+rjZ5/CoUeMMMiR3mUObhNxFeQwHBReChfhk7hrlazJuqoCFsGFa
	 ZlUt0UVQRsVSIXFCMjO6+bhSEo8i1nPPozjUD2WpDu3GMrfu4vsY/o1Kcf6JJ4BGbz
	 OXmBLqJfkiv8alGRklm1yw/AKVpj1Vgq5ZoPQsSM=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 1/2] asm-generic: Introduce mm-types.h header
Date: Thu,  6 Mar 2025 12:25:58 -0600
Message-Id: <a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Introduce a new header, mm-types.h, which will be used to define
architecture-specific types pertinent to memory management. This will be
used by a future commit to enable >32 bit PTE flags.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
  - Add Jan's Acked-by

 xen/arch/arm/include/asm/Makefile   | 1 +
 xen/arch/ppc/include/asm/Makefile   | 1 +
 xen/arch/riscv/include/asm/Makefile | 1 +
 xen/arch/x86/include/asm/Makefile   | 1 +
 xen/include/asm-generic/mm-types.h  | 5 +++++
 5 files changed, 9 insertions(+)
 create mode 100644 xen/include/asm-generic/mm-types.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4a4036c951..f8249b2439 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -3,6 +3,7 @@ generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c989a7f89b..c0dbc68ac6 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index c989a7f89b..c0dbc68ac6 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
index 2c27787d31..26650707e6 100644
--- a/xen/arch/x86/include/asm/Makefile
+++ b/xen/arch/x86/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += div64.h
+generic-y += mm-types.h
diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
new file mode 100644
index 0000000000..26490e48db
--- /dev/null
+++ b/xen/include/asm-generic/mm-types.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_MM_TYPES_H__
+#define __ASM_GENERIC_MM_TYPES_H__
+
+#endif /* __ASM_GENERIC_MM_TYPES_H__ */
--
2.30.2


