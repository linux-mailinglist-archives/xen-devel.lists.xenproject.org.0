Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4F73D66B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555006.866572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4r-00060N-7A; Mon, 26 Jun 2023 03:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555006.866572; Mon, 26 Jun 2023 03:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4q-0005ss-NO; Mon, 26 Jun 2023 03:39:44 +0000
Received: by outflank-mailman (input) for mailman id 555006;
 Mon, 26 Jun 2023 03:39:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd30-0000HH-6q
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d1fab75a-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F31831FB;
 Sun, 25 Jun 2023 20:38:31 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 587093F64C;
 Sun, 25 Jun 2023 20:37:45 -0700 (PDT)
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
X-Inumbo-ID: d1fab75a-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 51/52] xen/mpu: create stubs of function/variables for UNSUPPORTED features
Date: Mon, 26 Jun 2023 11:34:42 +0800
Message-Id: <20230626033443.2943270-52-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we are not introduing features like SMP, SET/WAY emulation, etc,
in MPU system, so we create empty stubs of function/variables and
warnings for these UNSUPPORTED features.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/arm64/mpu/head.S |  6 ++++++
 xen/arch/arm/mpu/mm.c         | 16 ++++++++++++++++
 xen/arch/arm/mpu/p2m.c        | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 147a01e977..9f3c5b8990 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -241,6 +241,12 @@ ENTRY(setup_early_uart)
 #endif
 ENDPROC(setup_early_uart)
 
+ENTRY(enable_runtime_mm)
+    PRINT("- SMP NOT SUPPORTED -\r\n")
+1:  wfe
+    b     1b
+ENDPROC(enable_runtime_mm)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index ef8a327037..8a554a950b 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -933,6 +933,22 @@ void dump_hyp_walk(vaddr_t addr)
     }
 }
 
+void mm_init_secondary_cpu(void)
+{
+    printk(XENLOG_ERR "SMP not *SUPPORTED*\n");
+}
+
+int init_secondary_mm(int cpu)
+{
+    printk(XENLOG_ERR "mpu: SMP not *SUPPORTED*\n");
+    return -EINVAL;
+}
+
+void update_mm_mapping(bool enable)
+{
+    printk(XENLOG_ERR "mpu: SMP not *SUPPORTED*\n");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 87e350270d..4bc09326f5 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -492,6 +492,22 @@ void p2m_dump_info(struct domain *d)
     p2m_read_unlock(p2m);
 }
 
+void setup_virt_paging_one(void *data)
+{
+    printk(XENLOG_ERR "mpu: SMP not *SUPPORTED*\n");
+}
+
+void p2m_invalidate_root(struct p2m_domain *p2m)
+{
+    printk(XENLOG_ERR "mpu: p2m_invalidate_root() not *SUPPORTED*\n");
+}
+
+bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
+{
+    printk(XENLOG_ERR "mpu: p2m_resolve_translation_fault() not *SUPPORTED*\n");
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


