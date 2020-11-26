Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932142C59F0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38863.71639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfN-0004Uh-Pf; Thu, 26 Nov 2020 17:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38863.71639; Thu, 26 Nov 2020 17:02:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfN-0004Ts-Lv; Thu, 26 Nov 2020 17:02:45 +0000
Received: by outflank-mailman (input) for mailman id 38863;
 Thu, 26 Nov 2020 17:02:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kiKfM-0004PR-NH
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1f79dbbc-b2c6-426c-a820-b1905ac42e53;
 Thu, 26 Nov 2020 17:02:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3778B1597;
 Thu, 26 Nov 2020 09:02:40 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5483F3F23F;
 Thu, 26 Nov 2020 09:02:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kiKfM-0004PR-NH
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:44 +0000
X-Inumbo-ID: 1f79dbbc-b2c6-426c-a820-b1905ac42e53
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 1f79dbbc-b2c6-426c-a820-b1905ac42e53;
	Thu, 26 Nov 2020 17:02:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3778B1597;
	Thu, 26 Nov 2020 09:02:40 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5483F3F23F;
	Thu, 26 Nov 2020 09:02:39 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
Date: Thu, 26 Nov 2020 17:02:03 +0000
Message-Id: <cfc6cbe23f05162d5c62df9db09fef3f8e0b8e14.1606406359.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>

XEN does not support MSI on ARM platforms, therefore remove the MSI
support from SMMUv3 driver.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 176 +-------------------------
 1 file changed, 3 insertions(+), 173 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cec304e51a..401f7ae006 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -416,31 +416,6 @@ enum pri_resp {
 	PRI_RESP_SUCC = 2,
 };
 
-enum arm_smmu_msi_index {
-	EVTQ_MSI_INDEX,
-	GERROR_MSI_INDEX,
-	PRIQ_MSI_INDEX,
-	ARM_SMMU_MAX_MSIS,
-};
-
-static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
-	[EVTQ_MSI_INDEX] = {
-		ARM_SMMU_EVTQ_IRQ_CFG0,
-		ARM_SMMU_EVTQ_IRQ_CFG1,
-		ARM_SMMU_EVTQ_IRQ_CFG2,
-	},
-	[GERROR_MSI_INDEX] = {
-		ARM_SMMU_GERROR_IRQ_CFG0,
-		ARM_SMMU_GERROR_IRQ_CFG1,
-		ARM_SMMU_GERROR_IRQ_CFG2,
-	},
-	[PRIQ_MSI_INDEX] = {
-		ARM_SMMU_PRIQ_IRQ_CFG0,
-		ARM_SMMU_PRIQ_IRQ_CFG1,
-		ARM_SMMU_PRIQ_IRQ_CFG2,
-	},
-};
-
 struct arm_smmu_cmdq_ent {
 	/* Common fields */
 	u8				opcode;
@@ -504,10 +479,6 @@ struct arm_smmu_cmdq_ent {
 		} pri;
 
 		#define CMDQ_OP_CMD_SYNC	0x46
-		struct {
-			u32			msidata;
-			u64			msiaddr;
-		} sync;
 	};
 };
 
@@ -649,12 +620,6 @@ struct arm_smmu_device {
 
 	struct arm_smmu_strtab_cfg	strtab_cfg;
 
-	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
-	union {
-		u32			sync_count;
-		u64			padding;
-	};
-
 	/* IOMMU core code handle */
 	struct iommu_device		iommu;
 };
@@ -945,20 +910,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
 		break;
 	case CMDQ_OP_CMD_SYNC:
-		if (ent->sync.msiaddr)
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
-		else
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
-		/*
-		 * Commands are written little-endian, but we want the SMMU to
-		 * receive MSIData, and thus write it back to memory, in CPU
-		 * byte order, so big-endian needs an extra byteswap here.
-		 */
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA,
-				     cpu_to_le32(ent->sync.msidata));
-		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
 		break;
 	default:
 		return -ENOENT;
@@ -1054,50 +1006,6 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
 	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
 }
 
-/*
- * The difference between val and sync_idx is bounded by the maximum size of
- * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmetic.
- */
-static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 sync_idx)
-{
-	ktime_t timeout;
-	u32 val;
-
-	timeout = ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
-	val = smp_cond_load_acquire(&smmu->sync_count,
-				    (int)(VAL - sync_idx) >= 0 ||
-				    !ktime_before(ktime_get(), timeout));
-
-	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
-}
-
-static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
-{
-	u64 cmd[CMDQ_ENT_DWORDS];
-	unsigned long flags;
-	struct arm_smmu_cmdq_ent  ent = {
-		.opcode = CMDQ_OP_CMD_SYNC,
-		.sync	= {
-			.msiaddr = virt_to_phys(&smmu->sync_count),
-		},
-	};
-
-	spin_lock_irqsave(&smmu->cmdq.lock, flags);
-
-	/* Piggy-back on the previous command if it's a SYNC */
-	if (smmu->prev_cmd_opcode == CMDQ_OP_CMD_SYNC) {
-		ent.sync.msidata = smmu->sync_nr;
-	} else {
-		ent.sync.msidata = ++smmu->sync_nr;
-		arm_smmu_cmdq_build_cmd(cmd, &ent);
-		arm_smmu_cmdq_insert_cmd(smmu, cmd);
-	}
-
-	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
-
-	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
-}
-
 static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
 {
 	u64 cmd[CMDQ_ENT_DWORDS];
@@ -1119,12 +1027,9 @@ static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
 static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
 {
 	int ret;
-	bool msi = (smmu->features & ARM_SMMU_FEAT_MSI) &&
-		   (smmu->features & ARM_SMMU_FEAT_COHERENCY);
 
-	ret = msi ? __arm_smmu_cmdq_issue_sync_msi(smmu)
-		  : __arm_smmu_cmdq_issue_sync(smmu);
-	if (ret)
+	ret = __arm_smmu_cmdq_issue_sync(smmu);
+	if ( ret )
 		dev_err_ratelimited(smmu->dev, "CMD_SYNC timeout\n");
 	return ret;
 }
@@ -2898,83 +2803,10 @@ static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 	return ret;
 }
 
-static void arm_smmu_free_msis(void *data)
-{
-	struct device *dev = data;
-	platform_msi_domain_free_irqs(dev);
-}
-
-static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
-{
-	phys_addr_t doorbell;
-	struct device *dev = msi_desc_to_dev(desc);
-	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
-	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->platform.msi_index];
-
-	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
-	doorbell &= MSI_CFG0_ADDR_MASK;
-
-	writeq_relaxed(doorbell, smmu->base + cfg[0]);
-	writel_relaxed(msg->data, smmu->base + cfg[1]);
-	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
-}
-
-static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
-{
-	struct msi_desc *desc;
-	int ret, nvec = ARM_SMMU_MAX_MSIS;
-	struct device *dev = smmu->dev;
-
-	/* Clear the MSI address regs */
-	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
-	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
-
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
-	else
-		nvec--;
-
-	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
-		return;
-
-	if (!dev->msi_domain) {
-		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
-		return;
-	}
-
-	/* Allocate MSIs for evtq, gerror and priq. Ignore cmdq */
-	ret = platform_msi_domain_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
-	if (ret) {
-		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
-		return;
-	}
-
-	for_each_msi_entry(desc, dev) {
-		switch (desc->platform.msi_index) {
-		case EVTQ_MSI_INDEX:
-			smmu->evtq.q.irq = desc->irq;
-			break;
-		case GERROR_MSI_INDEX:
-			smmu->gerr_irq = desc->irq;
-			break;
-		case PRIQ_MSI_INDEX:
-			smmu->priq.q.irq = desc->irq;
-			break;
-		default:	/* Unknown */
-			continue;
-		}
-	}
-
-	/* Add callback to free MSIs on teardown */
-	devm_add_action(dev, arm_smmu_free_msis, dev);
-}
-
 static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 {
 	int irq, ret;
 
-	arm_smmu_setup_msis(smmu);
-
 	/* Request interrupt lines */
 	irq = smmu->evtq.q.irq;
 	if (irq) {
@@ -3250,8 +3082,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR0_SEV)
 		smmu->features |= ARM_SMMU_FEAT_SEV;
 
-	if (reg & IDR0_MSI)
-		smmu->features |= ARM_SMMU_FEAT_MSI;
 
 	if (reg & IDR0_HYP)
 		smmu->features |= ARM_SMMU_FEAT_HYP;
-- 
2.17.1


