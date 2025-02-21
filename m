Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035EBA40078
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894596.1303323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMV-0007Dr-IN; Fri, 21 Feb 2025 20:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894596.1303323; Fri, 21 Feb 2025 20:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMV-0007AN-FH; Fri, 21 Feb 2025 20:11:03 +0000
Received: by outflank-mailman (input) for mailman id 894596;
 Fri, 21 Feb 2025 20:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJx0=VM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tlZMT-0006u0-Nv
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:11:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7cb8cbc-f08f-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 21:11:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DF0D78288114;
 Fri, 21 Feb 2025 14:10:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bYNROfKU1iH6; Fri, 21 Feb 2025 14:10:58 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 645408287311;
 Fri, 21 Feb 2025 14:10:58 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UOxbH5jE_1pP; Fri, 21 Feb 2025 14:10:58 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 11A1982855D7;
 Fri, 21 Feb 2025 14:10:55 -0600 (CST)
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
X-Inumbo-ID: f7cb8cbc-f08f-11ef-9aa9-95dc52dad729
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 645408287311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740168658; bh=PVT5S3JxIplZ0/EkEwv5c8TjUHCTHa8lJ2rCk6uf0zQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NNexX9rnjIM/IyhjZ4Ob5Ez51yw/D6DM5KYiPpenMuIJp5/LWS1H2gT2edQDCAbUF
	 gSEa9+n0+SHKLY8fPocg4BMfup2NtfjN8fZC1MJfc7wWLF4U/tH4vMn2OxMKorr7xn
	 0pY08wa5Kocy5t3m8qGKCIDBEsfAHLc6exhoGVec=
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
Subject: [PATCH v3 1/2] asm-generic: Introduce mm-types.h header
Date: Fri, 21 Feb 2025 14:10:52 -0600
Message-Id: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Introduce a new header, mm-types.h, which will be used to define
architecture-specific types pertinent to memory management. This will be
used by a future commit to enable >32 bit PTE flags.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
  - Introduced this file per Jan's suggestion

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


