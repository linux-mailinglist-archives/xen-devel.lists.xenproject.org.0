Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219563F4DD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450966.708519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m8A-0005hH-O1; Thu, 01 Dec 2022 16:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450966.708519; Thu, 01 Dec 2022 16:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m8A-0005fU-Ky; Thu, 01 Dec 2022 16:09:46 +0000
Received: by outflank-mailman (input) for mailman id 450966;
 Thu, 01 Dec 2022 16:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m88-0005Wl-ID
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:09:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 912c8996-7192-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:09:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B3DED1;
 Thu,  1 Dec 2022 08:09:49 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 433683F73B;
 Thu,  1 Dec 2022 08:09:42 -0800 (PST)
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
X-Inumbo-ID: 912c8996-7192-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 09/21] xen/arm: vsmmuv3: Add support for cmdqueue handling
Date: Thu,  1 Dec 2022 16:02:33 +0000
Message-Id: <6976a8484515fe02e9c2bd65cfb6a93632a228eb.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for virtual cmdqueue handling for guests

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index c3f99657e6..cc651a2dc8 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
 
+#include <xen/guest_access.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
@@ -24,6 +25,26 @@
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
 
+/* SMMUv3 command definitions */
+#define CMDQ_OP_PREFETCH_CFG    0x1
+#define CMDQ_OP_CFGI_STE        0x3
+#define CMDQ_OP_CFGI_ALL        0x4
+#define CMDQ_OP_CFGI_CD         0x5
+#define CMDQ_OP_CFGI_CD_ALL     0x6
+#define CMDQ_OP_TLBI_NH_ASID    0x11
+#define CMDQ_OP_TLBI_NH_VA      0x12
+#define CMDQ_OP_TLBI_NSNH_ALL   0x30
+#define CMDQ_OP_CMD_SYNC        0x46
+
+/* Queue Handling */
+#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
+#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
+#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
+
+/* Helper Macros */
+#define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
     uint64_t    q_base; /* base register */
@@ -48,8 +69,80 @@ struct virt_smmu {
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
+    spinlock_t  cmd_queue_lock;
 };
 
+/* Queue manipulation functions */
+static bool queue_empty(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
+}
+
+static void queue_inc_cons(struct arm_vsmmu_queue *q)
+{
+    uint32_t cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+    q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static void dump_smmu_command(uint64_t *command)
+{
+    gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
+             smmu_cmd_get_command(command[0]), command[0], command[1]);
+}
+static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
+{
+    struct arm_vsmmu_queue *q = &smmu->cmdq;
+    struct domain *d = smmu->d;
+    uint64_t command[CMDQ_ENT_DWORDS];
+    paddr_t addr;
+
+    if ( !smmu_get_cmdq_enabled(smmu->cr[0]) )
+        return 0;
+
+    while ( !queue_empty(q) )
+    {
+        int ret;
+
+        addr = Q_CONS_ENT(q);
+        ret = access_guest_memory_by_ipa(d, addr, command,
+                                         sizeof(command), false);
+        if ( ret )
+            return ret;
+
+        switch ( smmu_cmd_get_command(command[0]) )
+        {
+        case CMDQ_OP_CFGI_STE:
+            break;
+        case CMDQ_OP_PREFETCH_CFG:
+        case CMDQ_OP_CFGI_CD:
+        case CMDQ_OP_CFGI_CD_ALL:
+        case CMDQ_OP_CFGI_ALL:
+        case CMDQ_OP_CMD_SYNC:
+            break;
+        case CMDQ_OP_TLBI_NH_ASID:
+        case CMDQ_OP_TLBI_NSNH_ALL:
+        case CMDQ_OP_TLBI_NH_VA:
+            if ( !iommu_iotlb_flush_all(smmu->d, 1) )
+                break;
+        default:
+            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
+            dump_smmu_command(command);
+            break;
+        }
+
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "vSMMUv3: command error %d while handling command\n",
+                     ret);
+            dump_smmu_command(command);
+        }
+        queue_inc_cons(q);
+    }
+    return 0;
+}
+
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
@@ -103,9 +196,15 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
         break;
 
     case VREG32(ARM_SMMU_CMDQ_PROD):
+        spin_lock(&smmu->cmd_queue_lock);
         reg32 = smmu->cmdq.prod;
         vreg_reg32_update(&reg32, r, info);
         smmu->cmdq.prod = reg32;
+
+        if ( arm_vsmmu_handle_cmds(smmu) )
+            gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
+
+        spin_unlock(&smmu->cmd_queue_lock);
         break;
 
     case VREG32(ARM_SMMU_CMDQ_CONS):
@@ -321,6 +420,8 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
     smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
     smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
 
+    spin_lock_init(&smmu->cmd_queue_lock);
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
 
     /* Register the vIOMMU to be able to clean it up later. */
-- 
2.25.1


