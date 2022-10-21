Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88570607AD4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427783.677206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu3J-0006RH-Iz; Fri, 21 Oct 2022 15:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427783.677206; Fri, 21 Oct 2022 15:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu3J-0006Ox-DP; Fri, 21 Oct 2022 15:35:17 +0000
Received: by outflank-mailman (input) for mailman id 427783;
 Fri, 21 Oct 2022 15:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0j-0000AU-Rk
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:38 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969c6a9c-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:36 +0200 (CEST)
Received: from BN9PR03CA0668.namprd03.prod.outlook.com (2603:10b6:408:10e::13)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 15:32:33 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::d8) by BN9PR03CA0668.outlook.office365.com
 (2603:10b6:408:10e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:32 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:30 -0500
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
X-Inumbo-ID: 969c6a9c-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXR9udSPO1VIxLfy0Eib8Gmn8jzDPzhDN8GM8uh+DYFRv3H912QVNAqDuVGwGPji0k89eBCPSbghlRQ3L10mlcX4262wIhGQz8K03A1BRDaVUivtZwODKpwwPvIFJ+gd033wdHOWt2oGkxzVAmmENtFQDnZmxTaLKtdP7P1A3NvK3gmHGJjd98BODLvRu0x+2hPckec4i4mShoccDYGYw8C1hKg0rn0crqiCG1HmBgHrdRTXmo+nC/PDJBl6GdmeYFXl0E8js+x9Qb5FZUgAyDBz6U6ULYHSBDcomiuCHcjqEgvN60ygPHdPrX2S3Nbs+pMomu9zKAMbKBM04e+lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfSatt3fhyxCfsYWEQ3wGF9JEz5WBpn1wXBs+rdPAtQ=;
 b=mYtynWzztFAIXMiFBRmGDMsfojwqUak9vqh4L+2oMZLFWxHEQNPxxt6a7c60wUYbsA4QMFWCRF/QUKPBZkT+48GQmslFRbzhNAEwqpawMD4ZZYP56dBzXq017KideDVEZ2JnUewna7EQ5bqXGapfk7EdCAURDlJdmI6Njqud4e2soMn/kYbSwINv2Rf35nlCFEFQy5chozx+LF6CKS49ehQ7bYUf1jczCHenrABWwgGATCqQIl0lyqrxISZ03xT/+laSm1MasRz3ENLod0M33DVvlwW6tDTA2xyzW1GsxJrAW2fhHZrZph5F2nIQi5GoXuDfzoyFL8y8eguqB25efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfSatt3fhyxCfsYWEQ3wGF9JEz5WBpn1wXBs+rdPAtQ=;
 b=VTVRbs/1YNpzqD2+loG+LhTGnmw35nhiu31WO42kp0KkRkTl9VnGzLO6spin36pkNWitVBZyncxkJPivXIV+EFDuxRoCJ3DBWjZDSQOl6YHBuGbbJlxV+cQDFvHWwz7CjmIOCEX0hb6xgTZEL1zog3g9/4GN8bcE+XLjxs04sxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 10/12] Arm: GICv3: Use ULL instead of UL for 64bits
Date: Fri, 21 Oct 2022 16:31:26 +0100
Message-ID: <20221021153128.44226-11-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee603b3-888e-414e-b599-08dab379790d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NMQxIhQKx73s8kdC3DZ7VaYVPnLcgQz6jk0QIrAVKDOs53IXcDE6hM4E8i0fIXteDSHo5dNcV6cGWFWkKYqICaxD4dVeRh53B/tL8eWChw9SR3s5Y+IEnvWCw0NNnWgkBddGajx+i6/c4ySxd0/w5e2TtRYvgG4AmLEBhL3NER95b/KipVJCBj1CFqBaDCpyGIYSVPfDKZygxGtd+KLh8LwbNhcTjqnQbTf3pWiU7ixy72c4v8OovmpWQwkeJg+zTVQgWwWC2xAX+ldK/kZ39o1qfainAVDzodZ/aDIiAiw/weH0+4z+9UpF0T3nCpBHil9X+k3HW89w+h0p89/egovMoqBXuDkRIHGziGNDTB7hOkxmv/cTR46F09V8veq7BLaSwZEJB1v874RRFHWfxBPxiPkFBRVmYlBTdOxjT/DrUUBBNtw5vZmOW/0LVup24mf/6XoLv1Q2YCxcsSw1PsD9sMF4d9jIM6pBboQ+dTWNya50Rzjav5U1MOlv1k0gUAgB4PyOGKAon2QgbTbqWi/v4Vys94vja/8pp1lRrowdVNEg98lN3emEstq9GMM2wgfFPbTnUkWPc2gqOVIFGMgBZlMYyQvZSHXqaiIiyDAd6/v+OEbt/cTqbWrLA9+VEiYZrbR/Vt4H/YEzZ5fOMoOem01x34atv/CqCSkJNVKjeOrHnoVRxBP3VZ6Tbf0fYzN0L8IpqV+LMJCxKd16S0ppChTz56P+iu49E/MyN9lXkHlPTHpYj9XGJzuVU9ByYJCL9nHxEv1mB1+QdlpFNA2wQgATua5jtIDSqAEK5BE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(4326008)(2906002)(336012)(8936002)(41300700001)(186003)(40460700003)(1076003)(5660300002)(6666004)(36756003)(26005)(478600001)(426003)(2616005)(47076005)(8676002)(70206006)(70586007)(356005)(83380400001)(81166007)(82310400005)(316002)(82740400003)(6916009)(54906003)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:32.9390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee603b3-888e-414e-b599-08dab379790d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918

"unsigned long long" is defined as 64 bits on AArch64 and AArch32
Thus, one should this instead of "unsigned long" which is 32 bits
on AArch32.

Also use 'PRIu64' instead of 'lx' to print uint64_t.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/gic-v3-its.c              | 20 ++++++++++----------
 xen/arch/arm/gic-v3-lpi.c              |  8 ++++----
 xen/arch/arm/gic-v3.c                  |  4 ++--
 xen/arch/arm/include/asm/gic_v3_defs.h |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h  |  2 +-
 xen/arch/arm/vgic-v3-its.c             | 17 +++++++++--------
 6 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index e217c21bf8..dd056a3140 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -163,7 +163,7 @@ static int gicv3_its_wait_commands(struct host_its *hw_its)
 static uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu,
                               uint64_t reg)
 {
-    reg &= ~GENMASK(51, 16);
+    reg &= ~GENMASK_ULL(51, 16);
 
     reg |= gicv3_get_redist_address(cpu, hw_its->flags & HOST_ITS_USES_PTA);
 
@@ -219,7 +219,7 @@ static int its_send_cmd_mapd(struct host_its *its, uint32_t deviceid,
     {
         ASSERT(size_bits <= its->evid_bits);
         ASSERT(size_bits > 0);
-        ASSERT(!(itt_addr & ~GENMASK(51, 8)));
+        ASSERT(!(itt_addr & ~GENMASK_ULL(51, 8)));
 
         /* The number of events is encoded as "number of bits minus one". */
         size_bits--;
@@ -273,9 +273,9 @@ int gicv3_its_setup_collection(unsigned int cpu)
 
 #define BASER_ATTR_MASK                                           \
         ((0x3UL << GITS_BASER_SHAREABILITY_SHIFT)               | \
-         (0x7UL << GITS_BASER_OUTER_CACHEABILITY_SHIFT)         | \
-         (0x7UL << GITS_BASER_INNER_CACHEABILITY_SHIFT))
-#define BASER_RO_MASK   (GENMASK(58, 56) | GENMASK(52, 48))
+         (0x7ULL << GITS_BASER_OUTER_CACHEABILITY_SHIFT)         | \
+         (0x7ULL << GITS_BASER_INNER_CACHEABILITY_SHIFT))
+#define BASER_RO_MASK   (GENMASK_ULL(58, 56) | GENMASK_ULL(52, 48))
 
 /* Check that the physical address can be encoded in the PROPBASER register. */
 static bool check_baser_phys_addr(void *vaddr, unsigned int page_bits)
@@ -287,13 +287,13 @@ static bool check_baser_phys_addr(void *vaddr, unsigned int page_bits)
 
 static uint64_t encode_baser_phys_addr(paddr_t addr, unsigned int page_bits)
 {
-    uint64_t ret = addr & GENMASK(47, page_bits);
+    uint64_t ret = addr & GENMASK_ULL(47, page_bits);
 
     if ( page_bits < 16 )
         return ret;
 
     /* For 64K pages address bits 51-48 are encoded in bits 15-12. */
-    return ret | ((addr & GENMASK(51, 48)) >> (48 - 12));
+    return ret | ((addr & GENMASK_ULL(51, 48)) >> (48 - 12));
 }
 
 static void *its_map_cbaser(struct host_its *its)
@@ -310,7 +310,7 @@ static void *its_map_cbaser(struct host_its *its)
     if ( !buffer )
         return NULL;
 
-    if ( virt_to_maddr(buffer) & ~GENMASK(51, 12) )
+    if ( virt_to_maddr(buffer) & ~GENMASK_ULL(51, 12) )
     {
         xfree(buffer);
         return NULL;
@@ -446,7 +446,7 @@ static int gicv3_disable_its(struct host_its *hw_its)
         udelay(1);
     } while ( NOW() <= deadline );
 
-    printk(XENLOG_ERR "ITS@%lx not quiescent.\n", hw_its->addr);
+    printk(XENLOG_ERR "ITS@%" PRIu64 " not quiescent.\n", hw_its->addr);
 
     return -ETIMEDOUT;
 }
@@ -999,7 +999,7 @@ static void add_to_host_its_list(paddr_t addr, paddr_t size,
     its_data->size = size;
     its_data->dt_node = node;
 
-    printk("GICv3: Found ITS @0x%lx\n", addr);
+    printk("GICv3: Found ITS 0x%" PRIu64 "\n", addr);
 
     list_add_tail(&its_data->entry, &host_its_list);
 }
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
index 8b4b168e78..35eaa30c67 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%" PRIu64 "\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%" PRIu64 "\n", i, v->arch.gic.v3.lr[i]);
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
index 58d939b85f..2b7bb17800 100644
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
+                                  (0x1fLL << GITS_BASER_ENTRY_SIZE_SHIFT))
 
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
+    gdprintk(XENLOG_WARNING, "  cmd 0x%" PRIu64 ": %" PRIu64
+             "%" PRIu64 "%" PRIu64 "%" PRIu64 "\n",
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


