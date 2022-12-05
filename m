Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964264295A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453613.711200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUn-0004Ku-Bq; Mon, 05 Dec 2022 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453613.711200; Mon, 05 Dec 2022 13:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUn-0004DF-83; Mon, 05 Dec 2022 13:26:57 +0000
Received: by outflank-mailman (input) for mailman id 453613;
 Mon, 05 Dec 2022 13:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2BUm-0003tw-15
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:26:56 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b894013-74a0-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:26:55 +0100 (CET)
Received: from CY5PR22CA0096.namprd22.prod.outlook.com (2603:10b6:930:65::18)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 13:26:50 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:65:cafe::9d) by CY5PR22CA0096.outlook.office365.com
 (2603:10b6:930:65::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Mon, 5 Dec 2022 13:26:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 13:26:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:26:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 05:26:49 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:26:47 -0600
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
X-Inumbo-ID: 7b894013-74a0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjbTYsUjb+nLHquy43Grsrz+CI1ubK8odms74Dv3qf5Wg/FzvlmSNTHyDfxpt6fWTraTK0kGNoK9o7sRDN09xCXChpeivmhMB8wecJ1muVvM50xoewgde7sitPvkjVp0eRyG5oPa59lGNuM/2Z6Ru9uppTkTa7FZu7mTdtLzNtgpDHnD+88TfpbaH3uFxOKuWOz6G34TlYFfhLM9B9IBBH6AsSxho8YYyVIBexcgt1IGZLAqa9AYu+0ecQG9LmVGp2NKUrI4mm58/07O0k/TWJlrQJPFweO6ajEQZKxTqOKzQFTHFF+YOwO7W056CHelapWjNOuN7sblKJHYWpNhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvCRxtMbB9wFwtRZRm0PuriMjLF60alBSHXkTWtslew=;
 b=d9W72t9cYlWX4ZiH/ly7QA1h9GeERjJfVH5shiA9mwvK72JvxzZCCbFPtbw1V2X0aCe1oMTgD7zxDW3Rg8bs4MusXy7tZU3SlqMdeL+jRSvkmvEpq5pbv4idze+sTU/LcD6UWZ/8ub7nfY/D4xg3JrDI5EcPPNz4HiVxhuK5GNG23OlZZ7ncd7+VrbagiN5iFkrg38wCWUrQWTtM8Zq6ZRW1h2qpYT/0LFW7H7NJiM/9TficvrahewNF/JDY++5qtalEuEzel1OVbgFVn1r0RwH2tvJlEqpvUwEdj3bnCANNCOCBcMOdiLD2wcixyx3tL1H25CF2t7hf7J8EYpzwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvCRxtMbB9wFwtRZRm0PuriMjLF60alBSHXkTWtslew=;
 b=C79XHFX6ld8jInchh+n9qG147LRf7oBhvi7rjzp2VNDf5FDdE6j+yODScl0vqX+dOgHUjSCZ4gocEJ1gaCDC77OlBb0Zb3HimoGmF2gYD2mu9niKnX0sIGYIY5AFvLjkMJpZ6bZEPpUJmPer23b43W5gLqqDkPM5v6ZGrGkucic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 02/11] xen/Arm: GICv3: Do not calculate affinity level 3 for AArch32
Date: Mon, 5 Dec 2022 13:26:28 +0000
Message-ID: <20221205132637.26775-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 3025d731-b757-47ab-cc91-08dad6c45dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lahkle87zdiX0/Kcna0OxU0OfyiSiADg/Dxg7IScQnzRtjcSHZewdh6WQcR6WGKOar0LhgCexQoH5JT412o1MSbcYksyERNB6kw0nv3QG9vfDyuIP99hTid04AnS2ny9+Tf5K+oxIxDSKBgeng5jdDOHXuPzOjuY/CrH/OJxXgvyx1K3yVbY7Nl+P74wAqOGuVy7Q1XXGea2Z3BNvX3kDWiOK3w+lNAj2SW5Mw/Zb5qGuqiF6uExdyU0QLZBpn/upVSWLtRmMZWkF2MtbdRb4Ozp9dWjUNu/bQI7VcxHTgKOanIJCnMHkxzHB7AeqE/M+DyKvPcZ/H7kpsMMRGejRMz6ZnK9pwRoh+BU3jHv/aWMybFiD9/k5o0g1EIE2j0Ohdtk7qx0eKm4cp5VZEjO/kWgm1HtNphEfVK2Ipkw1eIYhzfAHXTAqUmGZy4cCCLLjf7w4L7rHt5g3IP6nZp7tOnGdjzParT8ykmLjMuYkg7c//5leQSDMcoMT30aNXh1Zkw88fmlXXM8eUBFXBWajeZUtpaTFSMtXpnUjhuF5os8TCNd2jlgFfl6RWj/E9WZ2i1j+ZimtUVmushswFveJEmQMIniDLvXNLgbl7VQ+W3QIb/rZSPNfL8dg6/iHr5Z3Vw1v/sGYNYizfd/lU5skTi3rMTZTpuLJPrW35po5fitWmVNHpDO8IiEV4IskqCgh46UzDpXO/aqGdgeKAUwyXIghugVxndvqhCx/+ZMWJM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(6916009)(83380400001)(54906003)(70586007)(70206006)(478600001)(2616005)(6666004)(316002)(103116003)(82310400005)(40480700001)(1076003)(40460700003)(36860700001)(86362001)(186003)(36756003)(2906002)(26005)(8676002)(4326008)(41300700001)(356005)(47076005)(5660300002)(81166007)(426003)(8936002)(82740400003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:26:49.8923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3025d731-b757-47ab-cc91-08dad6c45dae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
Affinity level 3 is not present in AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
Affinity level 3 is not present in Armv7 (ie arm32).
Thus, any access to affinity level 3 needs to be guarded within
"ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from -

v1 - NA (as it is a new patch)

v2 - NA (as it is a new patch)

v3 - Modified the title. Added Rb.

v4 - Added Ack.

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


