Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74825625CC8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442567.696862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUr8-0007P3-Qz; Fri, 11 Nov 2022 14:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442567.696862; Fri, 11 Nov 2022 14:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUr8-0007LN-NG; Fri, 11 Nov 2022 14:18:06 +0000
Received: by outflank-mailman (input) for mailman id 442567;
 Fri, 11 Nov 2022 14:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUr6-0006iO-FL
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a725e825-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:18:03 +0100 (CET)
Received: from BN0PR04CA0206.namprd04.prod.outlook.com (2603:10b6:408:e9::31)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:18:00 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::79) by BN0PR04CA0206.outlook.office365.com
 (2603:10b6:408:e9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:17:56 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:17:55 -0600
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
X-Inumbo-ID: a725e825-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CO5fa6Rz3XtdJioO9GQMDMVkMdHj/oQZEjmU43fCOn4bIIJj6jV1YyeITMp1/LeuXtFGtXggfd5LAN1o/mEkMPonKNYhLj6I6y5aoD6aTG9KyRrI0EXebe3xExmcVyNMYiQQUnBRQ8S+utXzQqH6CMDOHwx2iDjBqlIzfViFPZJaDubcQ3oY06l4t97FmHkcWfZ0YVhLOANV93iYUpONK9MJnn7j5uFLoYPKG7ubVH2mUMqDE9pjM4R+Si5598fadyERCWNDVfqvWLNxbo1hfB5rsH6GMTTvl8knjIeegQDd5+RHnJm6ADRMhztfA/RqVsETAMMuMOEuY2fDiyq3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxCh5IDTqC9PMIY7uCyOxr731NE746qnqsoe38S3DXU=;
 b=S8ZT9f6UWWJpYHQf6Ci6DaK71ffCOKikPsIwklX5GS7xixo4uMmgRXZumsz2UmaIWNPFkrKLswjL+0f/YSHaE3VWEec0mppKoxUIulShpOL/wycC5prR0C28eoY5mgSQtn0ONcYnS/R9XxpPoa2lgKBqI/Vp3NiOSeZqpj1G3wt4t3CcD0LCnSezpmVU8rwefh85DaDxxfejxBgx6VLJpeebWxptqkCqU3uA91JVTusLpQsqde4pVWcPcFqYVFmirH1RyQL4CRMqjp5GiCSez9Fma3uzUCCaqD1uFaBLoIPQoFXXT1seu3T8ELDQ74AT1P97TMIr7EUByThSPjemJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxCh5IDTqC9PMIY7uCyOxr731NE746qnqsoe38S3DXU=;
 b=KZ/uuSWDxtSMkpPtlBDQoIuYyBGjZF4hskfOaUFY4fU+5ptqNiCpPSi0B/Uh4tEzer+PKQKJULksM79Z7AvObudMYEElCFUi1PE7BYVw5cEU33+TBipTvgxM2EXRNq3rfDwPJdfd+nxthJ4MbxYmwS17NGYSJqLFeem6CtYjO8M=
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
Subject: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register for AArch32
Date: Fri, 11 Nov 2022 14:17:29 +0000
Message-ID: <20221111141739.2872-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: a50614c5-522b-4cc4-0801-08dac3ef89e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H4ZYvbFSXLsI7le10NxAY/UAQ8CTwKME+uDCkhArhc9RNc0Tn+cPBYwlHhQGaBjsU/Z/y0b+EpPaNWm1wcwJfPo7nkp3fRw6UuwjDn4ZXwq1uzLqt6jRY1h8k+MBdFhRNQq/6u+lu6HlqypfHNeEHcHZ3yMmXNEKA1O4ilf+XSFuRIdHtxxJ7XZ+2nno2SznoCX/8eiqf7DQFJq6AU+Gems2pD0XCO+/NWMGk+ynu0cV5TUQdgQWpGO9bokiDOZaUojKMqwNwVj9QYXck0/zLTZqYGqJNNFzxHEACFqC4LzN4kpB50yoH7XvwXePNygdI+3fLUJ5ZZf+sHIk24YNVxipxKBo5oG9rApzFcoOw0JFXe1j8YMcXuZUsb/v8A3YmPJDGGCjm78Hv16B0ZjHvhEXrZRTRLG+s434IpB30A59wVWMXU0Ufxy/1rW46o4DWxUjvBqFiD7gRAje7BxvOpOaAvEXNb1M1uJ/EfeVUt03Q8NcDjS+DZW0FLbgl4N5RmRGWzu8ri88bQXYTRt1xVCQQJjszYCjBZ0SCYrHVIiVkbUz76yy14rRBFcu1pfEEVmUwccos+hPnxiFhbPkPG4EZe4nd8j1CCJuu3Q3qt29Cgr3kZmhHQrqq7lMB4dJ8LmqmRlYzVdlVd/keiOmbwVr32tlz10XaFBHwsbgLEGvl4tQR+JjDusLmEWa2nwSIwuQG9qSfos5OVY7X+i9rTVCBvho+K8C/RWxSlGGwQeVJq4DlXtu/4+e34TgQUv90Gl2mqbi2mvykpko+s6TcN/A1j7jrNDt0Bqchg1GAYYiroO4kmVLvvSPaJY3Sr5A
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(86362001)(82740400003)(356005)(5660300002)(81166007)(2906002)(8676002)(4326008)(41300700001)(8936002)(82310400005)(40480700001)(70586007)(47076005)(26005)(6666004)(426003)(336012)(316002)(2616005)(1076003)(186003)(54906003)(6916009)(40460700003)(478600001)(70206006)(36756003)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:00.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a50614c5-522b-4cc4-0801-08dac3ef89e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695

Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
Affinity level 3 is not present in AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
Affinity level 3 is not present in Armv7 (ie arm32).
Thus, any access to affinity level 3 needs to be guarded within
"ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - NA (as it is a new patch)

v2 - NA (as it is a new patch)

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


