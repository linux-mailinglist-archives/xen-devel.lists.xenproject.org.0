Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E887EA601
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632030.985914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJd-0003Yg-J7; Mon, 13 Nov 2023 22:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632030.985914; Mon, 13 Nov 2023 22:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJd-0003W2-EV; Mon, 13 Nov 2023 22:21:57 +0000
Received: by outflank-mailman (input) for mailman id 632030;
 Mon, 13 Nov 2023 22:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fJb-0003AY-Nx
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:21:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c109f1c-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:21:54 +0100 (CET)
Received: from CH0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:b0::28)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Mon, 13 Nov
 2023 22:21:50 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::c4) by CH0PR03CA0023.outlook.office365.com
 (2603:10b6:610:b0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 22:21:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 22:21:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:21:49 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:21:47 -0600
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
X-Inumbo-ID: 0c109f1c-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDoBTFG9su1xMJljowgeksOdvzsbvlpzmCp3Bq+WVh1Q2q5AGJjSlNW5ASwCQVccci1g6djoHrOOkpBJmrUHEMGZbq9LG6wBzFp6c4GwF71uo1+cWw7PEZON2MfmRp6Be+dWMmgKOzUOHhdxJZQ9R7kgzpPG3/p1/X8NWer5DNMJmEUpbDqKXH8R/hH7P+nupo8GE5hy29b2Q/RsvVQ/wFlZ6URHsCz878ljHKsO7YXw6JzxMaKo+UXEebWcVs0DNRjkhhhOxBFu1J5Fj/nxnaenVHSLKu4mtce5wDPoicJMGLvHFjNbku7yRQAVc8sJAVC77+ucOaaNLcVZAv3Qng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d01MS5Ue/SUAYQwAAGRFoqPnpwVwUw5LXQKwJJmFc/E=;
 b=dwYkAE0SgrUdm3ETLqejTdsOhd05SowwKwb6IEVHszPdmenyijlFxhQZKhMT/lrDzHRul1qLk7e1l513Luz8M6F15oerzrMam1cZy99m+a/gDqRFiDWXU1hQ/KPHqvka0+AQtXdpwQAZa+LICjp/+Dt5LdyfoovT42SiEr5a+eCkHRfJ7EANWUa4u1XF50F/QUzQ8KdS+Lv6JmWdPt2tL8oUHiUoBXQzZssVtJ1TgtEZ9IBN8P33UpmEiwhI//W7fXhvHCFHDmnU0d/6WSj0x1repUsht3ppz928eRd5rYec5nti5qp7zY40t3afY90dOjgLep2cO1qScXdf/HFL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d01MS5Ue/SUAYQwAAGRFoqPnpwVwUw5LXQKwJJmFc/E=;
 b=IaHH9ZGc/459cCqO6NF70blYqu8+9b3aVjDOu8rGYEKp5v/qCHOqLudVq1/nl/W39HdBiOnojKsnrXohCVjudMqxaOYkSaBzmXK7urbuktjnrz49D8kDMCCyq1PHwSr6aKdh/rcOn7crNGDpxzXerUws+SWc1pePoIw4DpEipFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 1/5] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Mon, 13 Nov 2023 17:21:10 -0500
Message-ID: <20231113222118.825758-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113222118.825758-1-stewart.hildebrand@amd.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e75b07f-cc98-4ce4-2cea-08dbe496ee5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ppZtBsywqPPf2AklQ5Ct+xIRYbRQDuUroJW6mX5X/lhUWjWdk5PCJBikIGMww3q36LYlcUV9B39hJOU4qbxCGOvYgbazeGQlhuW4zkh2fzlQs/raxUuTbJ1rl2vHf3GeHvkXCmZB1wcx9iDBRveBYztMCWiTYbrEyGsOSooBcVwfdHY5f631HyfKpbtyLvI6C9RSIwvdca2Vmbr9qBChtlB0iemuZhPkuMYcTqMU6Rmy37E0MLiur/UyjPYS8VqGqZ88eK3vqM0PMnbzc/SYWabysl1ADbFV/xDpolqwLRYPSYmlk/40wzPhSueGVavyAjgcbfeOkrGGhelL6ZeULgWcc2dajb3f8i0hWiPupOyxs9UT4wURWHNtz/4ml+HNoR/sD1Og2Sj3POnRYXtKVvG3E55Zngy9YLNrR/CdkTOaU0R3wdk5AwgfODgPeyDbrPUBF9ZYwro/LnExL37Vpl1p1kuyR7hSI7DVIyMq/TL1QP74KsBGXVUGkBec+K6oycAWFsIlrny8Z1GgqQzVXhyLZ4ZGzbOH0nKYMpoDKUkczgfHhgntKQ5lZKXQqShIWwVPyc+Db796JoOjAMccm6k4ejPyyhCNMOEoQfnV0ns2szKs9RHjQSAp9fR9wrt6Cq1RTOlN0mGmSjw2/J2/SpBsGYYwHEQQj6SAs998pBzsbN5RIp2T8He+9NfFB7JbU8Da7Z/J+CmbsTd22fMHEs6TfREkXLlRsuNgw9RqvYhgzHJAHM3AjJVaD3Raplzmn1rUBm7w+uZ38CXIqv2Lxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(40470700004)(36840700001)(46966006)(41300700001)(2906002)(4326008)(8936002)(8676002)(44832011)(40460700003)(86362001)(5660300002)(36756003)(2616005)(478600001)(36860700001)(966005)(1076003)(336012)(6666004)(47076005)(426003)(82740400003)(356005)(81166007)(26005)(70206006)(54906003)(40480700001)(6916009)(316002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:21:49.7455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e75b07f-cc98-4ce4-2cea-08dbe496ee5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
the feature is not yet complete in the current upstream codebase. The purpose of
this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
testing and development of PCI passthrough on ARM.

Since PCI passthrough on ARM is still work in progress at this time, make it
depend on EXPERT.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* no change

v2->v3:
* add Julien's A-b

v1->v2:
* drop "ARM" naming since it is already in an ARM category
* depend on EXPERT instead of UNSUPPORTED

Changes from downstream to v1:
* depends on ARM_64 (Stefano)
* Don't select HAS_VPCI_GUEST_SUPPORT since this config option is not currently
  used in the upstream codebase. This will want to be re-added here once the
  vpci series [2] is merged.
* Don't select ARM_SMMU_V3 since this option can already be selected
  independently. While PCI passthrough on ARM depends on an SMMU, it does not
  depend on a particular version or variant of an SMMU.
* Don't select HAS_ITS since this option can already be selected independently.
  HAS_ITS may want to be added here once the MSI series [1] is merged.
* Don't select LATE_HWDOM since this option is unrelated to PCI passthrough.

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
---
 xen/arch/arm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b78..5ff68e5d5979 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -190,6 +190,15 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough" if EXPERT
+	depends on ARM_64
+	select HAS_PCI
+	select HAS_VPCI
+	default n
+	help
+	  This option enables PCI device passthrough
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
-- 
2.42.0


