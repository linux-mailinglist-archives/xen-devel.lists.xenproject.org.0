Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E963F51B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451035.708630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mHK-0004OJ-TT; Thu, 01 Dec 2022 16:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451035.708630; Thu, 01 Dec 2022 16:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mHK-0004Le-Qm; Thu, 01 Dec 2022 16:19:14 +0000
Received: by outflank-mailman (input) for mailman id 451035;
 Thu, 01 Dec 2022 16:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mHI-0003Vx-M5
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:19:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e3beadba-7193-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:19:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820CED6E;
 Thu,  1 Dec 2022 08:19:17 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F4073F73B;
 Thu,  1 Dec 2022 08:19:10 -0800 (PST)
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
X-Inumbo-ID: e3beadba-7193-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 19/21] xen/arm: vsmmuv3: Add support to send stage-1 event to guest
Date: Thu,  1 Dec 2022 16:02:43 +0000
Message-Id: <f5107e5545441aaf69584d096ed15df0baf11028.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stage-1 translation is handled by guest, therefore stage-1 fault has to
be forwarded to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
 xen/drivers/passthrough/arm/vsmmu-v3.c | 45 ++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h | 12 +++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index c4b4a5d86d..e17debc456 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -871,7 +871,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 	return 0;
 }
 
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -892,10 +891,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 	return NULL;
 }
 
+static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
+{
+	int ret;
+	struct arm_smmu_master *master;
+	u32 sid = FIELD_GET(EVTQ_0_SID, evt[0]);
+
+	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
+	case EVT_ID_TRANSLATION_FAULT:
+		break;
+	case EVT_ID_ADDR_SIZE_FAULT:
+		break;
+	case EVT_ID_ACCESS_FAULT:
+		break;
+	case EVT_ID_PERMISSION_FAULT:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Stage-2 event */
+	if (evt[1] & EVTQ_1_S2)
+		return -EFAULT;
+
+	mutex_lock(&smmu->streams_mutex);
+	master = arm_smmu_find_master(smmu, sid);
+	if (!master) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
+	if (ret) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&smmu->streams_mutex);
+	return ret;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_device *smmu = dev;
 	struct arm_smmu_queue *q = &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq = &q->llq;
@@ -905,6 +945,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
 		while (!queue_remove_raw(q, evt)) {
 			u8 id = FIELD_GET(EVTQ_0_ID, evt[0]);
 
+			ret = arm_smmu_handle_evt(smmu, evt);
+			if (!ret)
+				continue;
+
 			dev_info(smmu->dev, "event 0x%02x received:\n", id);
 			for (i = 0; i < ARRAY_SIZE(evt); ++i)
 				dev_info(smmu->dev, "\t0x%016llx\n",
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index b280b70da0..cd8b62d806 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -102,6 +102,7 @@ struct arm_vsmmu_queue {
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    paddr_t     addr;
     uint8_t     sid_split;
     uint32_t    features;
     uint32_t    cr[3];
@@ -236,6 +237,49 @@ void arm_vsmmu_send_event(struct virt_smmu *smmu,
     return;
 }
 
+static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t paddr)
+{
+    struct virt_smmu *smmu;
+
+    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
+    {
+        if ( smmu->addr == paddr )
+            return smmu;
+    }
+
+    return NULL;
+}
+
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt)
+{
+    int ret;
+    struct virt_smmu *smmu;
+
+    if ( is_hardware_domain(d) )
+    {
+        paddr_t paddr;
+        /* Base address */
+        ret = dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
+        if ( ret )
+            return -EINVAL;
+
+        smmu = vsmmuv3_find_by_addr(d, paddr);
+        if ( !smmu )
+            return -ENODEV;
+    }
+    else
+    {
+        smmu = list_entry(d->arch.viommu_list.next,
+                          struct virt_smmu, viommu_list);
+    }
+
+    ret = arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return 0;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -737,6 +781,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
 
     smmu->d = d;
     smmu->virq = virq;
+    smmu->addr = addr;
     smmu->cmdq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
index e11f85b431..c7bfd3fb59 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.h
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -8,6 +8,12 @@
 
 void vsmmuv3_set_type(void);
 
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #else
 
 static inline void vsmmuv3_set_type(void)
@@ -15,6 +21,12 @@ static inline void vsmmuv3_set_type(void)
     return;
 }
 
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
 
 #endif /* __ARCH_ARM_VSMMU_V3_H__ */
-- 
2.25.1


