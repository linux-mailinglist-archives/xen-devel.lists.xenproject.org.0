Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B339763AD16
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449012.705621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVY-0004b3-Dp; Mon, 28 Nov 2022 15:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449012.705621; Mon, 28 Nov 2022 15:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVY-0004XH-At; Mon, 28 Nov 2022 15:57:24 +0000
Received: by outflank-mailman (input) for mailman id 449012;
 Mon, 28 Nov 2022 15:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVX-0004G7-5j
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 576c74cc-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:57:22 +0100 (CET)
Received: from BN1PR12CA0005.namprd12.prod.outlook.com (2603:10b6:408:e1::10)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:19 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::ad) by BN1PR12CA0005.outlook.office365.com
 (2603:10b6:408:e1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.21 via Frontend Transport; Mon, 28 Nov 2022 15:57:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:17 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:15 -0600
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
X-Inumbo-ID: 576c74cc-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYTqpSPvNl5BmK3oF1P+lwPdmU7fA5G8YpYF8CXER7t+c+3KaIziLMOl3xfUCY5WcZ01ul12ht8xhSK78B+0E31tRq97xPsCs2lBzgkTp/6CXam8lfKyl/Upik0FlCTF2M6cx3leNncuD+X+0OaZM/uEAaxfu27P6jlvcWvP/b9IrUK6tzTMj8ddTKHJF88x26+YxwyTsARRN2ei/l4uzzcbpedNnsLM+VxhP20Z+5Qb1NwG9ff9e/+7/xUgF1xnp9MkGDIoD5N0rYX7CRYsqnkNS9ydcjoRvhUtd/m1BMDolY6slwTTxts+KiFW28SeZZHSanke3D2a4A9JxEtknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFXp0sPs0JxcYqGLbqqhGHuasdeiZ8ZsSBnPbFyCZpE=;
 b=lQy6RkmtNH0J2FvFo3V8Iit0jFwKI988t8OXKs0mhay2erPJ21NLAvWr/euyK/HO1LReaxluNEBWbO03LWxREaCGYE1ck5gUgaggoGMy+7lTma07/n7Uot9LyjceA8K0bJbBIg9g2cQiOEbrYyXJFaOkO10WTjDEkCACbemBXin2Xi1kEm0ouL4PQSAIKMTgx+QSYr2tFEJdPYk5HupE4+Z44mP/KHJ85rCC0gQ1xa8I91F+FJN9HUpTDGGJ3SZhDuLL+UGReByfxGpswJqqIxPfaQIiG1Bf3CazUbg9SGvdUdNRDYchy0uPZ65QaN7i4uGoQuRGk7Akcqi/QUQlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFXp0sPs0JxcYqGLbqqhGHuasdeiZ8ZsSBnPbFyCZpE=;
 b=swkdUCW2Ze6G3VkbI5ez1ech2T3QHli5PGX36sxJE7mVl/2fdGHy0T75/bEplBCwRAhtL4XtGuwCEC8yVZgjnAEEjCIKubsCSG3OvWLUwya3kUQSWEaRqI5iK+AQiXKfnWGGH705igrXV3GXNcK9t4pgLKPJ16AdqtaHnFyTh04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 02/11] xen/Arm: GICv3: Do not calculate affinity level 3 for AArch32
Date: Mon, 28 Nov 2022 15:56:40 +0000
Message-ID: <20221128155649.31386-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 99eb87ab-513e-416c-6058-08dad1593a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nv45T+TL7UM60CxgCltUE+Vr17EVjxkwEpe8EPSvbBK3kEggQzUZ0USDTeDd+zOdGt8aRqJbhxQtUVQzMfQuUITKlGKlpizDP69tWndz7tD6Bs+1PR96aarp+FcE8lwPUts7n0ht7CP+tPrq16/syYA4RjjVqqGWNexyPAF76vrxnxtYwfTW1J8GFrNSchEMxyNizPN7olKyUBQSjUUf0HnF5Op11n2a3PIq8gwlub4Oyun24AzsFmfHDLp6moXvD5hvbPWmLOmm1gulUQN+uYI3UAN82Cdc91F5E5w4TuvUIYBpdlnFsSXbZZD7o9fLVV9ofFabsiHx2oP0Sqit1+oJOHfV49XGudgpe+cxwwrZXJ/dj7S6VKTNACfPKRg39QotKX1f038LUNtYuSU2hSEom95e/6fFWI4AhA+9sBq77MDdFX3rVS3D9mFTfnKeGgiMHs1qeNCt4rv75wNDL9TJRxCgIWBZAXKqWCYh1ZgpSIwa6n85Ju1I0Ivk3q1uC9tTxXOweIA9FU9dAq5jlyJPSg7iRu1SpsDr17tV9JpY7owBxbftDZf6+bAlWyi11rcZa1G48pbZ0sgfJjMiMkpspFUcoqLULAzawuydOCp9s/9GQb0BtBFhjL0GJ0F8ncL5F5vUnRLUrZfwC74CbrpsnAeUa8WhB3DFXBJIChdcDEHiCxFQu/yMMZNLvAD6Ge542GZdIvPiueFACmvG+U4UOUkkVaTSj4QU4IN7cls=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(478600001)(86362001)(36860700001)(6666004)(316002)(26005)(103116003)(54906003)(8936002)(6916009)(40460700003)(336012)(41300700001)(2616005)(426003)(47076005)(5660300002)(40480700001)(356005)(81166007)(2906002)(82740400003)(8676002)(4326008)(36756003)(70586007)(1076003)(186003)(70206006)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:18.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99eb87ab-513e-416c-6058-08dad1593a04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
Affinity level 3 is not present in AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
Affinity level 3 is not present in Armv7 (ie arm32).
Thus, any access to affinity level 3 needs to be guarded within
"ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from -

v1 - NA (as it is a new patch)

v2 - NA (as it is a new patch)

v3 - Modified the title. Added Rb.

 xen/arch/arm/gic-v3.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 018fa0dfa0..64a76307dd 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -527,7 +527,10 @@ static void gicv3_set_pending_state(struct irq_desc *irqd, bool pending)
 static inline uint64_t gicv3_mpidr_to_affinity(int cpu)
 {
      uint64_t mpidr = cpu_logical_map(cpu);
-     return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
+     return (
+#ifdef CONFIG_ARM_64
+             MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
+#endif
              MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
              MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8  |
              MPIDR_AFFINITY_LEVEL(mpidr, 0));
@@ -720,7 +723,10 @@ static int __init gicv3_populate_rdist(void)
      * Convert affinity to a 32bit value that can be matched to GICR_TYPER
      * bits [63:32]
      */
-    aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+    aff = (
+#ifdef CONFIG_ARM_64
+           MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+#endif
            MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
            MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
            MPIDR_AFFINITY_LEVEL(mpidr, 0));
@@ -972,7 +978,10 @@ static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t *cpumask)
          * Prepare affinity path of the cluster for which SGI is generated
          * along with SGI number
          */
-        val = (MPIDR_AFFINITY_LEVEL(cluster_id, 3) << 48  |
+        val = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(cluster_id, 3) << 48  |
+#endif
                MPIDR_AFFINITY_LEVEL(cluster_id, 2) << 32  |
                sgi << 24                                  |
                MPIDR_AFFINITY_LEVEL(cluster_id, 1) << 16  |
-- 
2.17.1


