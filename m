Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B2A5DE6F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910352.1317166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWS-00012u-6I; Wed, 12 Mar 2025 13:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910352.1317166; Wed, 12 Mar 2025 13:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWS-0000y8-0T; Wed, 12 Mar 2025 13:53:24 +0000
Received: by outflank-mailman (input) for mailman id 910352;
 Wed, 12 Mar 2025 13:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWQ-0007NP-G7
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5b2b9233-ff49-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 14:53:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476E8152B;
 Wed, 12 Mar 2025 06:53:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EDBB3F5A1;
 Wed, 12 Mar 2025 06:53:18 -0700 (PDT)
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
X-Inumbo-ID: 5b2b9233-ff49-11ef-9898-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 09/10] xen/arm: introduce Kconfig HAS_PAGING_MEMPOOL
Date: Wed, 12 Mar 2025 13:52:57 +0000
Message-Id: <20250312135258.1815706-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

ARM MPU system doesn't need to use paging memory pool, as MPU memory
mapping table at most takes only one 4KB page, which is enough to
manage the maximum 255 MPU memory regions, for all EL2 stage 1
translation and EL1 stage 2 translation.

Introduce HAS_PAGING_MEMPOOL Kconfig symbol for Arm, selected for MMU
systems.

Wrap code accessing the 'struct paging_domain' paging member with
the new Kconfig, introduce arch_{get,set}_paging_mempool_size
implementation for MPU system, provide stubs for p2m_teardown and
p2m_teardown_allocation because they will not be used for MPU systems,
remove 'struct paging_domain' from Arm 'struct arch_domain' when the
field is not required.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig              |  4 ++++
 xen/arch/arm/dom0less-build.c     |  2 ++
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/arch/arm/mpu/Makefile         |  1 +
 xen/arch/arm/mpu/p2m.c            | 36 +++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 xen/arch/arm/mpu/p2m.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5ac6ec0212d2..89c099ff464b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -76,6 +76,7 @@ choice
 config MMU
 	bool "MMU"
 	select HAS_LLC_COLORING if !NUMA && ARM_64
+	select HAS_PAGING_MEMPOOL
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
@@ -158,6 +159,9 @@ config VGICV2
 config HVM
         def_bool y
 
+config HAS_PAGING_MEMPOOL
+	bool
+
 config NEW_VGIC
 	bool "Use new VGIC implementation"
 	select GICV2
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 31f31c38da3f..feaba576198b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -865,11 +865,13 @@ static int __init construct_domU(struct domain *d,
                 p2m_mem_mb << (20 - PAGE_SHIFT) :
                 domain_p2m_pages(mem, d->max_vcpus);
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     spin_lock(&d->arch.paging.lock);
     rc = p2m_set_allocation(d, p2m_pages, NULL);
     spin_unlock(&d->arch.paging.lock);
     if ( rc != 0 )
         return rc;
+#endif
 
     printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
            d->max_vcpus, mem);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 50b6a4b00982..fadec7d8fa9e 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -75,7 +75,9 @@ struct arch_domain
 
     struct hvm_domain hvm;
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     struct paging_domain paging;
+#endif
 
     struct vmmio vmmio;
 
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 04df0b2ee760..f1417cd1b9db 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,2 +1,3 @@
 obj-y += mm.o
+obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
new file mode 100644
index 000000000000..7525d9b00bcb
--- /dev/null
+++ b/xen/arch/arm/mpu/p2m.c
@@ -0,0 +1,36 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain.h>
+#include <asm/p2m.h>
+
+/* Not used on MPU system */
+int p2m_teardown(struct domain *d)
+{
+    return 0;
+}
+
+/* Not used on MPU system */
+int p2m_teardown_allocation(struct domain *d)
+{
+    return 0;
+}
+
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    return -EOPNOTSUPP;
+}
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    return -EOPNOTSUPP;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


