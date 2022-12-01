Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43163F4EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450995.708563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mBC-0000b6-0J; Thu, 01 Dec 2022 16:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450995.708563; Thu, 01 Dec 2022 16:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mBB-0000ZK-Ti; Thu, 01 Dec 2022 16:12:53 +0000
Received: by outflank-mailman (input) for mailman id 450995;
 Thu, 01 Dec 2022 16:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mBA-0008UE-Gz
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:12:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0111fe4b-7193-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:12:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48158D6E;
 Thu,  1 Dec 2022 08:12:57 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D934D3F73B;
 Thu,  1 Dec 2022 08:12:49 -0800 (PST)
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
X-Inumbo-ID: 0111fe4b-7193-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 12/21] xen/arm: vsmmuv3: Add support for event queue and global error
Date: Thu,  1 Dec 2022 16:02:36 +0000
Message-Id: <2826699f4bac16359531f43e9e6b3c71885b1ebb.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event queue is used to send the events to guest when there is an events/
faults. Add support for event queue to send events to guest.

Global error in SMMUv3 hw will be updated in smmu_gerror and
smmu_gerrorn register. Add support for global error registers to send
global error to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 163 ++++++++++++++++++++++++-
 xen/include/public/arch-arm.h          |   5 +-
 3 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index 50a050408b..b598cdeb72 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -348,6 +348,26 @@
 
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
 
+#define EVT_ID_BAD_STREAMID		0x02
+#define EVT_ID_BAD_STE		    	0x04
+#define EVT_ID_TRANSLATION_FAULT	0x10
+#define EVT_ID_ADDR_SIZE_FAULT		0x11
+#define EVT_ID_ACCESS_FAULT		0x12
+#define EVT_ID_PERMISSION_FAULT		0x13
+
+#define EVTQ_0_SSV			(1UL << 11)
+#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
+#define EVTQ_0_SID			GENMASK_ULL(63, 32)
+#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
+#define EVTQ_1_STALL			(1UL << 31)
+#define EVTQ_1_PnU			(1UL << 33)
+#define EVTQ_1_InD			(1UL << 34)
+#define EVTQ_1_RnW			(1UL << 35)
+#define EVTQ_1_S2			(1UL << 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
+#define EVTQ_1_TT_READ			(1UL << 44)
+#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
+#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
 #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index 5188181929..031c1f74b6 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -43,6 +43,7 @@ extern const struct viommu_desc __read_mostly *cur_viommu;
 
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_get_evtq_enabled(x)    FIELD_GET(CR0_EVTQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
 #define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
 #define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
@@ -51,6 +52,35 @@ extern const struct viommu_desc __read_mostly *cur_viommu;
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
 
+/* event queue entry */
+struct arm_smmu_evtq_ent {
+    /* Common fields */
+    uint8_t     opcode;
+    uint32_t    sid;
+
+    /* Event-specific fields */
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+        } c_bad_ste_streamid;
+
+        struct {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            uint64_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            uint64_t addr2;
+        } f_translation;
+    };
+};
+
 /* stage-1 translation configuration */
 struct arm_vsmmu_s1_trans_cfg {
     paddr_t s1ctxptr;
@@ -81,6 +111,7 @@ struct virt_smmu {
     uint32_t    strtab_base_cfg;
     uint64_t    strtab_base;
     uint32_t    irq_ctrl;
+    uint32_t    virq;
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
@@ -88,6 +119,12 @@ struct virt_smmu {
 };
 
 /* Queue manipulation functions */
+static bool queue_full(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
+}
+
 static bool queue_empty(struct arm_vsmmu_queue *q)
 {
     return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
@@ -100,11 +137,105 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q)
     q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
 
+static void queue_inc_prod(struct arm_vsmmu_queue *q)
+{
+    u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
+    q->prod = Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
 static void dump_smmu_command(uint64_t *command)
 {
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+
+static void arm_vsmmu_inject_irq(struct virt_smmu *smmu, bool is_gerror,
+                                uint32_t gerror_err)
+{
+    uint32_t new_gerrors, pending;
+
+    if ( is_gerror )
+    {
+        /* trigger global error irq to guest */
+        pending = smmu->gerror ^ smmu->gerrorn;
+        new_gerrors = ~pending & gerror_err;
+
+        /* only toggle non pending errors */
+        if (!new_gerrors)
+            return;
+
+        smmu->gerror ^= new_gerrors;
+    }
+
+    vgic_inject_irq(smmu->d, NULL, smmu->virq, true);
+}
+
+static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
+{
+    struct arm_vsmmu_queue *q = &smmu->evtq;
+    struct domain *d = smmu->d;
+    paddr_t addr;
+    int ret;
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return -EINVAL;
+
+    if ( queue_full(q) )
+        return -EINVAL;
+
+    addr = Q_PROD_ENT(q);
+    ret = access_guest_memory_by_ipa(d, addr, evt,
+                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true);
+    if ( ret )
+        return ret;
+
+    queue_inc_prod(q);
+
+    /* trigger eventq irq to guest */
+    if ( !queue_empty(q) )
+        arm_vsmmu_inject_irq(smmu, false, 0);
+
+    return 0;
+}
+
+void arm_vsmmu_send_event(struct virt_smmu *smmu,
+                          struct arm_smmu_evtq_ent *ent)
+{
+    uint64_t evt[EVTQ_ENT_DWORDS];
+    int ret;
+
+    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return;
+
+    evt[0] |= FIELD_PREP(EVTQ_0_ID, ent->opcode);
+    evt[0] |= FIELD_PREP(EVTQ_0_SID, ent->sid);
+
+    switch (ent->opcode)
+    {
+    case EVT_ID_BAD_STREAMID:
+    case EVT_ID_BAD_STE:
+        evt[0] |= FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
+        evt[0] |= FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
+        break;
+    case EVT_ID_TRANSLATION_FAULT:
+    case EVT_ID_ADDR_SIZE_FAULT:
+    case EVT_ID_ACCESS_FAULT:
+    case EVT_ID_PERMISSION_FAULT:
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
+        break;
+    }
+
+    ret = arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -113,11 +244,22 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
     uint32_t log2size;
     int strtab_size_shift;
     int ret;
+    struct arm_smmu_evtq_ent ent = {
+        .sid = sid,
+        .c_bad_ste_streamid = {
+            .ssid = 0,
+            .ssv = false,
+        },
+    };
 
     log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg);
 
     if ( sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+    {
+        ent.opcode = EVT_ID_BAD_STE;
+        arm_vsmmu_send_event(smmu, &ent);
         return -EINVAL;
+    }
 
     if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
     {
@@ -155,6 +297,8 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
         {
             gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
                      idx, max_l2_ste);
+            ent.opcode = EVT_ID_BAD_STREAMID;
+            arm_vsmmu_send_event(smmu, &ent);
             return -EINVAL;
         }
         addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
@@ -182,6 +326,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
                                 uint64_t *ste)
 {
     uint64_t val = ste[0];
+    struct arm_smmu_evtq_ent ent = {
+        .opcode = EVT_ID_BAD_STE,
+        .sid = sid,
+        .c_bad_ste_streamid = {
+            .ssid = 0,
+            .ssv = false,
+        },
+    };
 
     if ( !(val & STRTAB_STE_0_V) )
         return -EAGAIN;
@@ -216,6 +368,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
     return 0;
 
 bad_ste:
+    arm_vsmmu_send_event(smmu, &ent);
     return -EINVAL;
 }
 
@@ -572,7 +725,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
     .write = vsmmuv3_mmio_write,
 };
 
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
+                               paddr_t size, uint32_t virq)
 {
     struct virt_smmu *smmu;
 
@@ -581,6 +735,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
         return -ENOMEM;
 
     smmu->d = d;
+    smmu->virq = virq;
     smmu->cmdq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
@@ -607,14 +762,16 @@ int domain_vsmmuv3_init(struct domain *d)
 
         list_for_each_entry(hw_iommu, &host_iommu_list, entry)
         {
-            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
+            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
+                                      hw_iommu->irq);
             if ( ret )
                 return ret;
         }
     }
     else
     {
-        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE,
+                                  GUEST_VSMMU_SPI);
         if ( ret )
             return ret;
     }
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24b52fa017..634f689e77 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -488,9 +488,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_EVTCHN_PPI        31
 
 #define GUEST_VPL011_SPI        32
+#define GUEST_VSMMU_SPI         33
 
-#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
-#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   34
+#define GUEST_VIRTIO_MMIO_SPI_LAST    44
 
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
-- 
2.25.1


