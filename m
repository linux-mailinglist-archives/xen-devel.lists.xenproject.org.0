Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6C62F3F7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 12:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445619.700883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpc-00017r-PW; Fri, 18 Nov 2022 11:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445619.700883; Fri, 18 Nov 2022 11:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpc-00011w-JB; Fri, 18 Nov 2022 11:46:52 +0000
Received: by outflank-mailman (input) for mailman id 445619;
 Fri, 18 Nov 2022 11:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovzpb-0000xU-Iw
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 11:46:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af16e647-6736-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 12:46:49 +0100 (CET)
Received: from BN0PR04CA0153.namprd04.prod.outlook.com (2603:10b6:408:eb::8)
 by CH0PR12MB5058.namprd12.prod.outlook.com (2603:10b6:610:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:46:46 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::53) by BN0PR04CA0153.outlook.office365.com
 (2603:10b6:408:eb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 11:46:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 11:46:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 18 Nov 2022 05:46:05 -0600
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
X-Inumbo-ID: af16e647-6736-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6dSACjMvHcoDfSOd7uN2KwloXX3sZ6QNv+WWwNAXGIBZ41ycS94ghmKPVILN8OpiQKvKDyyYKzPbea+gJ2+VVqm/qTLic8gO5GYGDcoAjldR2UR7SbY1t6aIVPkZzhZ4MiEGrT04r9g1rmNyIJJJyA3T+gmZSl9tBA2nI6HJTgYPzZ/JktQf3W6PQSyl6gA0vHOgoW7iHkzc4v7aHQE8VQ8EHner0CgPRQkRr3DrphjcIKk7zQy1FF2byyI9GdOWFksCpelaKzStmCohuy+IMTk20jwKz1GiFmv0XQDmOJvqebr+QztKnbvjqmLkt8wBuLwsZvNhb4CjDRbaBC7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCabUovbIK/LcTCWyof1xhmRsubFjNLqtDEaA0izGK8=;
 b=DBMxWf6SAREXzrIt0XLTORldGyYzm/q7+sM2Bnw70HEdVps7DR7i9ntHLkBdTmlLxexiDmGLA3JizCxraV044IsZPUje+BdgwzPJs34vmuiI37YDWuHs/Faj86s1nUF3T7IeVauN3auW93ZHJmzKyzrxgd4xZqmcaEofKYE6LIemDEq5tBkDwsnAlHRu+OABdV6LFh94wZOOeDeq7l+GAzpBA0X1QmpqzecOD4YuSOZ7cIN42SIBjtSV5HghvhdiVweMNOZHooU8Z2BDpvhm497yZW+Y6P777MVaEFH3op/s1Uo36TBq4bfFbo900af0DqkbmSZUxBBXBmcuI+/S6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCabUovbIK/LcTCWyof1xhmRsubFjNLqtDEaA0izGK8=;
 b=a6Xe14efqJAOV/uGQozIDPXCokB/ZbbO7j7g1t7OU+qXv32kcBWQ6o2b1kFkOLhnvQ/JKuV8RVHf9rmvQmz88dF0SvpKq/mY1E+BcOIkepzDjwxcJd6gL7XpPs82KWPf55S7teCQhIm35GutbsdyVzP7UeNG89wCij/NH6tlIIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Date: Fri, 18 Nov 2022 12:45:54 +0100
Message-ID: <20221118114554.20696-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|CH0PR12MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 55514897-b243-4a99-2213-08dac95a914f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+K+Mc8xL6doJJJT4C+t2Tfnh2iZ38Gyo6fZu8FYNSeDJ132aMrWvk/0JdSMgN/6YNGc8ojhvJf6HPA3gd7816TJVMcFO/F3l0LXSYOuAMc9rWrwkc4060PUvYCp1qSwFAl3pFCCYkenPY4TandB4EfQGQ+eBeNXEK3QVFZkbhRcRg2LUDm64vyzjNC1OluvRU13avSon26V5SwO6z1gm/9vc3GS/lySnWASdksBa/UIUtGIzb2M6KGmBAC3X+OZP359kZ/0gJ1DHz4oJfJU5Glkr01sJD2zLcCmLas8TB3JHSfyYNsOSuI1sHID5N6geSu09bLylYCyxA50CC46iyojnVbVBQgIWHDYqGjFV44eze8EoidEduJxQyJD9UYHI1I2SGL0DXfIyiLGEa2z28EVw8Sz6nB/p121AttLC0Nc044dOA2Sf06fItj4pYSjyzrXiY68QWX4KlS7buOxKVZu484RToUUne9DlFW42LK1Rde7ILrJmNjjlQg7/iMAhd0tkV9m56OykKcwv0oYZXA7vhn9NRmgvVunM6AQLOissAV9qz45ethFKQnMXnv8SY4TVKdGMm6gIlvdMdjIZi0HKBvWnQnC98el7Z5oFdzOyvBL4robm89Zlcr3zJZZvTPAgIFJ7aoaAKm90Uev9Dyz0ATPRSTlomwhzf19gubIRlC3nnSelmzJQ/XlIc/CntlMwd4uVqt2h/a74Flh0sK2NXXggIl0b9ambHWnw/K9meP/Ha/qMiMvcFkWcno3kTWDmFKOzMZqSEwI90WYuRYiDei7O6BW7vxztEsLSQ1UNSirthvJcxEVK8QHk99va
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(316002)(2906002)(26005)(6916009)(54906003)(70206006)(8676002)(70586007)(4326008)(41300700001)(2616005)(966005)(5660300002)(8936002)(186003)(1076003)(44832011)(47076005)(336012)(83380400001)(19625735003)(426003)(36860700001)(36756003)(86362001)(40480700001)(82310400005)(82740400003)(6666004)(40460700003)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:46:44.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55514897-b243-4a99-2213-08dac95a914f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5058

Some time ago, Linux switched the format of docs to ReST and the format
of device-tree bindings to json-schema.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/booting.txt     | 8 ++++----
 docs/misc/arm/passthrough.txt | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index d3f6ce4755f6..3e0c03e06596 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -34,8 +34,8 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
 * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
 
 
-[1] linux/Documentation/arm/Booting
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/Booting
+[1] linux/Documentation/arm/booting.rst
+Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
 
-[2] linux/Documentation/arm64/booting.txt
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.txt
+[2] linux/Documentation/arm64/booting.rst
+Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
diff --git a/docs/misc/arm/passthrough.txt b/docs/misc/arm/passthrough.txt
index 219d1cca571b..4f0a024818a2 100644
--- a/docs/misc/arm/passthrough.txt
+++ b/docs/misc/arm/passthrough.txt
@@ -71,8 +71,8 @@ Please refer to your platform docs for the MMIO ranges and interrupts.
 They can also be calculated from the original device tree (not
 recommended). You can read about the "interrupts" property format in the
 device tree bindings of the interrupt controller of your platform. For
-example, in the case of GICv2 see [arm,gic.txt]; in the case of GICv3
-see [arm,gic-v3.txt] in the Linux repository. For both GICv2 and GICv3
+example, in the case of GICv2 see [arm,gic.yaml]; in the case of GICv3
+see [arm,gic-v3.yaml] in the Linux repository. For both GICv2 and GICv3
 the "interrupts" property format is the same: the first cell is the
 interrupt type, and the second cell is the interrupt number.  Given that
 SPI numbers start from 32, in this example 80 + 32 = 112.
@@ -187,6 +187,6 @@ assign a network card to a dom0-less guest on Xilinx Ultrascale+ MPSoC:
 };
 
 
-[arm,gic.txt]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
-[arm,gic-v3.txt]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+[arm,gic.yaml]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+[arm,gic-v3.yaml]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
 [xl.cfg]: https://xenbits.xen.org/docs/unstable/man/xl.cfg.5.html
-- 
2.25.1


