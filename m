Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D76E63F4E0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450973.708531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m9R-00078a-2s; Thu, 01 Dec 2022 16:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450973.708531; Thu, 01 Dec 2022 16:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m9Q-00076H-VU; Thu, 01 Dec 2022 16:11:04 +0000
Received: by outflank-mailman (input) for mailman id 450973;
 Thu, 01 Dec 2022 16:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m9O-00075z-Vj
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:11:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bfb615b2-7192-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:11:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC905ED1;
 Thu,  1 Dec 2022 08:11:07 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49E053F73B;
 Thu,  1 Dec 2022 08:11:00 -0800 (PST)
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
X-Inumbo-ID: bfb615b2-7192-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 10/21] xen/arm: vsmmuv3: Add support for command CMD_CFGI_STE
Date: Thu,  1 Dec 2022 16:02:34 +0000
Message-Id: <d08de970e285221cb9a2e4dd0dfd4bf07bfdbba2.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
driver in XEN will read the STE from the guest memory space and capture
the Stage-1 configuration required to support nested translation.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 148 +++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index cc651a2dc8..916b97b8a2 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -44,6 +44,21 @@ extern const struct viommu_desc __read_mostly *cur_viommu;
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
+#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
+#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
+#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
+#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
+                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
+
+/* stage-1 translation configuration */
+struct arm_vsmmu_s1_trans_cfg {
+    paddr_t s1ctxptr;
+    uint8_t s1fmt;
+    uint8_t s1cdmax;
+    bool    bypassed;             /* translation is bypassed */
+    bool    aborted;              /* translation is aborted */
+};
 
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
@@ -90,6 +105,138 @@ static void dump_smmu_command(uint64_t *command)
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
+                              uint64_t *ste)
+{
+    paddr_t addr, strtab_base;
+    struct domain *d = smmu->d;
+    uint32_t log2size;
+    int strtab_size_shift;
+    int ret;
+
+    log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg);
+
+    if ( sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+        return -EINVAL;
+
+    if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
+    {
+        int idx, max_l2_ste, span;
+        paddr_t l1ptr, l2ptr;
+        uint64_t l1std;
+
+        strtab_size_shift = MAX(5, (int)log2size - smmu->sid_split - 1 + 3);
+        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                        ~GENMASK_ULL(strtab_size_shift, 0);
+        idx = (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
+        l1ptr = (paddr_t)(strtab_base + idx * sizeof(l1std));
+
+        ret = access_guest_memory_by_ipa(d, l1ptr, &l1std,
+                                         sizeof(l1std), false);
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
+            return ret;
+        }
+
+        span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
+        if ( !span )
+        {
+            gdprintk(XENLOG_ERR, "Bad StreamID span\n");
+            return -EINVAL;
+        }
+
+        max_l2_ste = (1 << span) - 1;
+        l2ptr = FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
+                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
+        idx = sid & ((1 << smmu->sid_split) - 1);
+        if ( idx > max_l2_ste )
+        {
+            gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
+                     idx, max_l2_ste);
+            return -EINVAL;
+        }
+        addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    else
+    {
+        strtab_size_shift = log2size + 5;
+        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                      ~GENMASK_ULL(strtab_size_shift, 0);
+        addr = strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    ret = access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste), false);
+    if ( ret )
+    {
+        gdprintk(XENLOG_ERR,
+                "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
+                                struct arm_vsmmu_s1_trans_cfg *cfg,
+                                uint64_t *ste)
+{
+    uint64_t val = ste[0];
+
+    if ( !(val & STRTAB_STE_0_V) )
+        return -EAGAIN;
+
+    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
+    {
+    case STRTAB_STE_0_CFG_BYPASS:
+        cfg->bypassed = true;
+        return 0;
+    case STRTAB_STE_0_CFG_ABORT:
+        cfg->aborted = true;
+        return 0;
+    case STRTAB_STE_0_CFG_S1_TRANS:
+        break;
+    case STRTAB_STE_0_CFG_S2_TRANS:
+        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
+        goto bad_ste;
+    default:
+        BUG(); /* STE corruption */
+    }
+
+    cfg->s1ctxptr = smmu_get_ste_s1ctxptr(val);
+    cfg->s1fmt = smmu_get_ste_s1fmt(val);
+    cfg->s1cdmax = smmu_get_ste_s1cdmax(val);
+    if ( cfg->s1cdmax != 0 )
+    {
+        gdprintk(XENLOG_ERR,
+                 "vSMMUv3 does not support multiple context descriptors\n");
+        goto bad_ste;
+    }
+
+    return 0;
+
+bad_ste:
+    return -EINVAL;
+}
+
+static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
+{
+    int ret;
+    uint64_t ste[STRTAB_STE_DWORDS];
+    struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
+    uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
+
+    ret = arm_vsmmu_find_ste(smmu, sid, ste);
+    if ( ret )
+        return ret;
+
+    ret = arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
+    if ( ret )
+        return (ret == -EAGAIN ) ? 0 : ret;
+
+    return 0;
+}
+
 static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
 {
     struct arm_vsmmu_queue *q = &smmu->cmdq;
@@ -113,6 +260,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
         switch ( smmu_cmd_get_command(command[0]) )
         {
         case CMDQ_OP_CFGI_STE:
+            ret = arm_vsmmu_handle_cfgi_ste(smmu, command);
             break;
         case CMDQ_OP_PREFETCH_CFG:
         case CMDQ_OP_CFGI_CD:
-- 
2.25.1


