Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0A78F7BD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 06:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594201.927448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwFv-0000xt-Lb; Fri, 01 Sep 2023 04:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594201.927448; Fri, 01 Sep 2023 04:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwFv-0000vc-Id; Fri, 01 Sep 2023 04:59:39 +0000
Received: by outflank-mailman (input) for mailman id 594201;
 Fri, 01 Sep 2023 04:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwFu-0000Nr-CM
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 04:59:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59c52397-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 06:59:37 +0200 (CEST)
Received: from CYZPR12CA0001.namprd12.prod.outlook.com (2603:10b6:930:8b::8)
 by CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 04:59:32 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8b:cafe::37) by CYZPR12CA0001.outlook.office365.com
 (2603:10b6:930:8b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.26 via Frontend
 Transport; Fri, 1 Sep 2023 04:59:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 04:59:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:59:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:59:30 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 23:59:29 -0500
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
X-Inumbo-ID: 59c52397-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDx174aM0GO6DnkPkhWJXu3LeOYu3CR0pH5qIMcvLtUKeFINcrT8LYibDZs8Q5+Vr4AIxeuycshUjb0hL06MHYFwKPWOXl9C5FM3+XILO7n8BT1ijF/+FzAsyajijAyuZspyaj4ADO+0KrnyJXdJTZC9wUavYbUl8hHToC9eyvEewJ6kJNYuv4pT8hzmIOoKvA8h5d+8egqTQ7EtjxxaL/WOFy9XyJ1Sdve8qd1fGK096yFVttJz7feDbw4mVeNslkOSVbOCWSUer4txudj1R90If9Bl0yDAFMCaetqDajnQh5M1Oe3bCFwodB/UtD0OtJd7tjX3P56uYtwPYtoapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTvGSsnvPNixHgnOIgBXlqmXYsXnEHucB1rNpscARZY=;
 b=JGYMBk8e6Er4wQ9/ct0jmSS6bjwg4QNEs8jseuIEHhcKhcT5tbAq6KDjqp34MnGa6oNO6saNIofPR1G7Kdjvt9FoSkMMTLzJD1itfjtOZXkWnl43lTCr+CCKdniJuMp2KgreUOCHnX8Q0Fb2vmLUGJgZb3wioPuS6s/XJcA7mLEFrScguDcG6v380QLPWftrQN1hsyMdo5Kbobvzmv/UIQzNUvaTbAiTi5ts6oAI1+x8UprnAN1sC03zGhAqx/qFUqsun8kT/UpUVk2fNftLlSY+HG48axQCMRp8faZ4/xCVgPfIPjq/0K0C45RNXJ6v+8obBhhZVri41NE5BEf4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTvGSsnvPNixHgnOIgBXlqmXYsXnEHucB1rNpscARZY=;
 b=uM8D7pxXsGzzPtBO06mWP6KTkZL47lMc3Pr7LkVJK884CenbQgOfwK7X0xCZ3JrEcZOHln7F0Uw+EVchSApxlT99ghlvPqRO5rGXak9jr8ArA21SxTBQEVk9Fi96ckv/OYgQDEtkDnk672814LPyA/JtVR8upvxOgebRm4M3Ndg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v5 2/5] x86/msi: rearrange read_pci_mem_bar slightly
Date: Fri, 1 Sep 2023 00:57:29 -0400
Message-ID: <20230901045742.235975-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901045742.235975-1-stewart.hildebrand@amd.com>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8f8675-5617-45a0-4b65-08dbaaa83aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1hzyOp105N6jwjYukE5RGKMDl14iUz+PlS7vvsKKTM26ODKP0xIbmjr5adzAEZiQM9AVc6r36G8IsWJU6GJugStzggfzUmDTfXu6OgvCkjqgf9e9fz1rVAq4SSBlluDUOfsX41o2coN88q5yPsJJzIV/P/guxOAJFMWdNfCwcrparCvL9SOY6rEY3WCYrvW0KOQoP65m54aHYTrQ9QCZrucqT+GWErviljnJ5apmEUJdNp5/AdKDwtDkjNYfd4CIqJ897a/DphdVkHPkkL9x8nKpKqaFHoKV/uLRKxL3Nh1eIpwKpIQ1Ky4J7NSKVUoG4Dg3EkSKRXIKw80i1ucKLescjJ8j8OxwSKeFPeHBvLAGxsNfqQM3NNQ/FYbMMlgAJooIwwYBdV7qMaNA2Wl8tMpU/9Y3iAtztA78zB/jXndHjYkEVvbf9gTOvc7DBJFP6Va7uMKIxHlOFwyqfWRC7B+VMhhgXytjSdaYKIU1XDsBLL2PNMf5dkT5gxyvbm70bQ16eHu56SaSuAlkXaFb4+mc2ZqV6sRSLHsRkKZ5/7m8SF3ExLhYf59KEl4AsqTjgYmOtHzjnD7zpt3ih4B9+Zuf06avajUsCMzU3BrYjg5Cmvn4M+l7C/isglnj+1SD5lLdKmpwKSoWi/nsnlvxINbCLQd60oPJ6+A1YZQt5KCManInyp7GS+2Uzn+NEYiCtkskX4qe4Im1IqZDu5VlfRMsmYdZf5Tv7gzGUvY+5FFF8F8Zp9t05uMhnMr7AzlaF0hzQvP09Rk6UQAjOHAzqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(82740400003)(36756003)(41300700001)(336012)(426003)(26005)(1076003)(966005)(40460700003)(54906003)(356005)(70586007)(70206006)(81166007)(83380400001)(316002)(6916009)(478600001)(2906002)(5660300002)(86362001)(44832011)(8936002)(2616005)(36860700001)(8676002)(47076005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 04:59:31.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8f8675-5617-45a0-4b65-08dbaaa83aa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393

Use pdev->sbdf instead of the PCI_SBDF macro in calls to pci_* functions
where appropriate. Move NULL check earlier.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4->v5:
* add Jan's R-b

v3->v4:
* new patch

Suggested-by tag added based on conversation at [1]

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg01886.html
---
 xen/arch/x86/msi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 8d4fd43b10a6..a78367d7cf5d 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -674,19 +674,19 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
     {
         struct pci_dev *pdev = pci_get_pdev(NULL,
                                             PCI_SBDF(seg, bus, slot, func));
-        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
-                                                            func),
-                                                   PCI_EXT_CAP_ID_SRIOV);
-        uint16_t ctrl = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                        pos + PCI_SRIOV_CTRL);
-        uint16_t num_vf = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_NUM_VF);
-        uint16_t offset = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_VF_OFFSET);
-        uint16_t stride = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_VF_STRIDE);
-
-        if ( !pdev || !pos ||
+        unsigned int pos;
+        uint16_t ctrl, num_vf, offset, stride;
+
+        if ( !pdev )
+            return 0;
+
+        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+
+        if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
-- 
2.42.0


