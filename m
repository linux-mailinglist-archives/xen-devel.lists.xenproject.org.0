Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C86139D0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433053.685963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWVT-0006WD-4e; Mon, 31 Oct 2022 15:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433053.685963; Mon, 31 Oct 2022 15:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWVT-0006SW-1R; Mon, 31 Oct 2022 15:15:19 +0000
Received: by outflank-mailman (input) for mailman id 433053;
 Mon, 31 Oct 2022 15:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUY-0008Dn-3L
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b153b81a-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:21 +0100 (CET)
Received: from BN9PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:fb::7)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 15:14:17 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::42) by BN9PR03CA0032.outlook.office365.com
 (2603:10b6:408:fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:16 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:15 -0500
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
X-Inumbo-ID: b153b81a-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbkmMuIK9oaqEfZSQCumgAodClTb8ZADs6gxEGMCZnY0UxfYCiXEgtAJqHGSCxfKuhdmOlWb7d4LExgBvYuJoPDIJl+e1CK6S8IBWT80VdmopGow4nz4lCTu1B90lWH7nnRUskHMQwjpYG6KzhKrfMczpo9ITQosXG6Wb0tXERHl4x9PX/MWh22MyKgu+rWfZA4D427Lj1yEUP3ztXNcDbVglKvHU5LYv/Ahwwx9AUO23J+xWdYYudlpdrjGidQI7F/iQTpz2fA1VQJIjgY0Z391TvqkRTyas/cu6OWDjgzXPDgU0TRgUdbRFUOtZj/QaohWSASkIi8VPs+lUrFwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHAPEWS3Ul1UwQcVWsmr+QDrrCPSDU3SzxfOHJarRiM=;
 b=O0IblExXSX3peEscDuJmVHq8SkT1HFqFukRukxV2M1KaqH0KMYpaKhFAcWQN+KCYe3o4VVAOfk9T1RIJmf2Sa5nkfRGDm3oQiqnWf/1J2Jpbrcqhf+5cPupnPuhAl9tMGNoow1cW1zjZT/PXmUAb6Ji9UlRQYc+LstYKFpbAo3KU030BteWXwpTTlbJc7S59MpqpLHHipBcN9aE9QC8JFMPHl+ZcF0SBLNuL1dUqzRrsYD5dse9xuySFU38bt/T2QY1xSQCYqsGUlMq8UCU6wdKiGRm4ORgI+u3dgSkvIpU0kRZupywUNboOt0AmkmT1CXF1Kf0KKSKEU4dPogMyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHAPEWS3Ul1UwQcVWsmr+QDrrCPSDU3SzxfOHJarRiM=;
 b=SRNLAlMeqZg9XjWooa3dOY8YC9IxFXgappA5xBpCwYN6p/QWQOFG4Z86eBSJEQke7bTMT8szapE811UXIbo05p6e1wXethV2i4p/3wsuGE87gBq5dah7BOaPIP61pBbvXQdO9n50LkvuG6iuP2LXeAzzDDmXUBJLvJZ+Any+jj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 10/12] xen/Arm: GICv3: Use ULL instead of UL for 64bits
Date: Mon, 31 Oct 2022 15:13:24 +0000
Message-ID: <20221031151326.22634-11-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: d00e45a5-6ea6-4571-ac77-08dabb5293c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q3OU0pAqCKkVKEeX8Y++UZd2d4tIyKmJMc24hD+SdYuwPBeceZ/y+8mvJIiNNWwP/ypVdgLLnrRGb5OaSxlBZFfKCQCBgCNf1Rpj6vsVFBajMQyLfUF/f3leiaGIKuPZST26IaHvTS7muvamN8/KoD4hFO9kUjIqPtMg8wL4V9lg6WlO75J0Vg7uCD8Z1T5rIgccsV77ymIPVGaCd3rYFcF54Bdv6zXj44ktS1Iei0N3QVqe1w1clvvN7CJyGelzUkkb2Rde7N586QWnp5p/7wJgqQIqdBC/iHb2mxUeAYg3molsAmnPxH/AIzmlC0kPv2vTlwqaYXGlMIMgF7vZW8nPAWYVWn7A1x66RfR1uu3gTEdqon2u8bwSLaoSyDlQeajHC7Bxdy7kUdtV1EWVNEcz3W3zdrADVEYnBKTK1bW6xv/FnKQdVhu8ifnc8H/+dvdhnJZOuNnIY+znbWSKyDcHkr8W0iPHhtT68r/SiBlMv9f0d6QsiI9UJpM/gBm+a9Kq3xJRwNwVnscqmdsoIGScjFadXMSDO8GYAR83RKghtDORuj1qbu25iNUTMxQeOzjHI539+2H8xJMrbwszkUltNE8t8jppOegKb1579q/LHaZmX4XwZC6rDABzKZqQ4YbHtMgOUzLGIDtxJCODkSulTi9L+lxBSOIZ4GDWdRQa695oD9ryBy5v6v+ZvE+V6VXUj3vqU9vJOcN4ke2TfVzc9FjPkPEG8JSDF/PJ3kF3p/oml1s7thq0h0Ph2j58GSHWX7f2gpM1ZlEO8FlM1zuZxXhwdkxWsIsRRQUcHeFtcL+uISE/i7KhZh3g+Ok1
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(2616005)(40480700001)(336012)(5660300002)(82740400003)(26005)(2906002)(6916009)(316002)(1076003)(83380400001)(36756003)(186003)(478600001)(6666004)(54906003)(81166007)(47076005)(4326008)(8676002)(8936002)(36860700001)(70586007)(82310400005)(426003)(40460700003)(70206006)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:16.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d00e45a5-6ea6-4571-ac77-08dabb5293c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

"unsigned long long" is defined as 64 bits on AArch64 and AArch32
Thus, one should this instead of "unsigned long" which is 32 bits
on AArch32.

Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changed from :-
v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in hex as
desired.
2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.

 xen/arch/arm/gic-v3-lpi.c              |  8 ++++----
 xen/arch/arm/gic-v3.c                  |  4 ++--
 xen/arch/arm/include/asm/gic_v3_defs.h |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h  |  2 +-
 xen/arch/arm/vgic-v3-its.c             | 17 +++++++++--------
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 61d90eb386..9ca74bc321 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -134,7 +134,7 @@ void gicv3_set_redist_address(paddr_t address, unsigned int redist_id)
 uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta)
 {
     if ( use_pta )
-        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK(51, 16);
+        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK_ULL(51, 16);
     else
         return per_cpu(lpi_redist, cpu).redist_id << 16;
 }
@@ -253,7 +253,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
         return -ENOMEM;
 
     /* Make sure the physical address can be encoded in the register. */
-    if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
+    if ( virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16) )
     {
         xfree(pendtable);
         return -ERANGE;
@@ -281,7 +281,7 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
         return -ENOMEM;
     }
 
-    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
+    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16)));
 
     val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
     val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
@@ -329,7 +329,7 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
             return -ENOMEM;
 
         /* Make sure the physical address can be encoded in the register. */
-        if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
+        if ( (virt_to_maddr(table) & ~GENMASK_ULL(51, 12)) )
         {
             xfree(table);
             return -ERANGE;
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 8b4b168e78..d8ce0f46c6 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 87115f8b25..3a24bd4825 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -195,7 +195,7 @@
 
 #define ICH_SGI_IRQMODE_SHIFT        40
 #define ICH_SGI_IRQMODE_MASK         0x1
-#define ICH_SGI_TARGET_OTHERS        1UL
+#define ICH_SGI_TARGET_OTHERS        1ULL
 #define ICH_SGI_TARGET_LIST          0
 #define ICH_SGI_IRQ_SHIFT            24
 #define ICH_SGI_IRQ_MASK             0xf
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fae3f6ecef..5ae50b18ea 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -38,7 +38,7 @@
 #define GITS_PIDR2                      GICR_PIDR2
 
 /* Register bits */
-#define GITS_VALID_BIT                  BIT(63, UL)
+#define GITS_VALID_BIT                  BIT(63, ULL)
 
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 58d939b85f..c5e02b2c41 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -96,13 +96,13 @@ typedef uint16_t coll_table_entry_t;
  * in the lowest 5 bits of the word.
  */
 typedef uint64_t dev_table_entry_t;
-#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK(51, 8))
+#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK_ULL(51, 8))
 #define DEV_TABLE_ITT_SIZE(x) (BIT(((x) & GENMASK(4, 0)) + 1, UL))
 #define DEV_TABLE_ENTRY(addr, bits)                     \
         (((addr) & GENMASK(51, 8)) | (((bits) - 1) & GENMASK(4, 0)))
 
 #define GITS_BASER_RO_MASK       (GITS_BASER_TYPE_MASK | \
-                                  (0x1fL << GITS_BASER_ENTRY_SIZE_SHIFT))
+                                  (0x1ULL << GITS_BASER_ENTRY_SIZE_SHIFT))
 
 /*
  * The physical address is encoded slightly differently depending on
@@ -112,10 +112,10 @@ typedef uint64_t dev_table_entry_t;
 static paddr_t get_baser_phys_addr(uint64_t reg)
 {
     if ( reg & BIT(9, UL) )
-        return (reg & GENMASK(47, 16)) |
+        return (reg & GENMASK_ULL(47, 16)) |
                 ((reg & GENMASK(15, 12)) << 36);
     else
-        return reg & GENMASK(47, 12);
+        return reg & GENMASK_ULL(47, 12);
 }
 
 /* Must be called with the ITS lock held. */
@@ -414,7 +414,7 @@ static int update_lpi_property(struct domain *d, struct pending_irq *p)
     if ( !d->arch.vgic.rdists_enabled )
         return 0;
 
-    addr = d->arch.vgic.rdist_propbase & GENMASK(51, 12);
+    addr = d->arch.vgic.rdist_propbase & GENMASK_ULL(51, 12);
 
     ret = access_guest_memory_by_ipa(d, addr + p->irq - LPI_OFFSET,
                                      &property, sizeof(property), false);
@@ -897,7 +897,8 @@ out_unlock:
 
 static void dump_its_command(uint64_t *command)
 {
-    gdprintk(XENLOG_WARNING, "  cmd 0x%02lx: %016lx %016lx %016lx %016lx\n",
+    gdprintk(XENLOG_WARNING, "  cmd 0x%" PRIx64 ": %" PRIx64
+             "%" PRIx64 "%" PRIx64 "%" PRIx64 "\n",
              its_cmd_get_command(command),
              command[0], command[1], command[2], command[3]);
 }
@@ -909,7 +910,7 @@ static void dump_its_command(uint64_t *command)
  */
 static int vgic_its_handle_cmds(struct domain *d, struct virt_its *its)
 {
-    paddr_t addr = its->cbaser & GENMASK(51, 12);
+    paddr_t addr = its->cbaser & GENMASK_ULL(51, 12);
     uint64_t command[4];
 
     ASSERT(spin_is_locked(&its->vcmd_lock));
@@ -1122,7 +1123,7 @@ read_as_zero_64:
 
 read_impl_defined:
     printk(XENLOG_G_DEBUG
-           "%pv: vGITS: RAZ on implementation defined register offset %#04lx\n",
+           "%pv: vGITS: RAZ on implementation defined register offset %" PRIx64 "#04llx\n",
            v, info->gpa & 0xffff);
     *r = 0;
     return 1;
-- 
2.17.1


