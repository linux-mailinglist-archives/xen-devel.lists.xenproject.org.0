Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D535772634
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578442.905943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0UR-0001ku-Mt; Mon, 07 Aug 2023 13:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578442.905943; Mon, 07 Aug 2023 13:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0UR-0001i0-KA; Mon, 07 Aug 2023 13:41:43 +0000
Received: by outflank-mailman (input) for mailman id 578442;
 Mon, 07 Aug 2023 13:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gLe/=DY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qT0UQ-0001hu-Gf
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:41:42 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e83::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23482e17-3528-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 15:41:41 +0200 (CEST)
Received: from CY5PR15CA0179.namprd15.prod.outlook.com (2603:10b6:930:81::27)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:41:33 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:81:cafe::a) by CY5PR15CA0179.outlook.office365.com
 (2603:10b6:930:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Mon, 7 Aug 2023 13:41:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Mon, 7 Aug 2023 13:41:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 08:41:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 06:41:34 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 7 Aug 2023 08:41:33 -0500
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
X-Inumbo-ID: 23482e17-3528-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1QjybxcGP+Yfj5WNvnyZCiPFOrMFWMrM2BpDROf5P+VsdyCJm8KwMAVM7A9G2ZOZqHO0qsdTBvqHVR6k+UJJul9QId4x4zwVmrTgDXHVBlr5sn+IMB4sH01961kEieOH9jBddMD3uuYFSA2BE/0ZpMny9Uk7g1zoi82eyb39krVLT/1i+8F6W0W1RkHxWob4d+8HlXP2RcnJouYhPDaW3fIT0yNC0968wUq+8vF2hkBJDCfV3Su0Qo+01b54QvnhZTD+gTdCRkFqrgEkAiDcrN++UE7sCKVqyDO942j5Vmcu/9yaS24Apmbjxd3P6zb+dP7aVmOc2TVgjzvONsjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3uu11JQaiojEo/DtcwB3/CLv1cRTFZuFWDUyFuXyn0=;
 b=l7VHCpo7q1WDBcdMY0T7LpOSclKLhwEDmZkYGLg3tERXqzOODViIvO+6h8Xn6vtTMqbS+rm70ycnvPespSENHn33B6mmCib+qzTkrTZjW9AK4fE0jDgfCS5SMffj7qAwij+aj4f9AQjbhMd+WGbCTstHM/K+W+8D9zVNfmDEEf9KKNPwFAHHrvLp41QOSMJqwp2e5N437KGqRHZ4cOK1Z86VBFMqlQsS9xWwVeNs11+h3BqHNUiHMW2mgpRM4B8yAsY6Z58Jpnoh3Jep3DBuTwivMKMR+imtftGDQEI1Qm4ISg8ETv3IktWs+gnRBp/dmqbTjYBqhKJluef/9Sj/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3uu11JQaiojEo/DtcwB3/CLv1cRTFZuFWDUyFuXyn0=;
 b=hsVyiWi3mX5RJHiyC7Anf4Ezzsh8Dlf+Ud1bRgaXjM9c/Ri4sO4TPRo/y8KHKdjY8jn/QZEi2x44icaLlnKNr/A25GoUItLXP+GvJY6TiS5lPZ1XhNCZq5P/O6Tw7LEZKJEA1PAjgnOkUdCbVURS+3kdop/tx2uNfeOBuuDx16k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Simone Ballarin
	<simone.ballarin@bugseng.com>
Subject: [PATCH] automation: Advertise that ECLAIR jobs do not need prerequisites
Date: Mon, 7 Aug 2023 15:41:22 +0200
Message-ID: <20230807134122.10878-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec2a4f4-9e16-4504-900f-08db974c049b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lk05EqxiIpr2k6rIaHkCNCiMRFhSnUH/w2vPiYIEpHOi3HtUjow/bqig+g33aTzS8xydCUw2qdMWslV3DWciUb5y16Lxagmd77s5Iq6vGM9mO2bn70wJIHHFI9A0RXIgGlBGwzLWgSRLHlGqKsh27ljntFoJ0lI4MJZ1HzjuT/vznNzPELxIEcahTAN4HF82mibU2Qx6Voa1qcaQTktJaohhnZcUTsj9vv4LIQDmVq+8HWciLydbeCjofpyo/o1dCQ4fYWRZJM92ZeggRYHpF2/c/vo0CHtO6N2nRQUaW6yH+Jlo5d1EIVjFkuCgTOOLvoDHnoYs56/pz/gfyt4kgK3BmI1avokI860MgW8jWfhHjj9FZP0m5RMtLRn1TfngRD6xWwNNOeC2Ri2fv0egwQaIYlh9QqvXbyYGNDU/teriqyvgkBiam4rVj0OqEEFTTFNLZ8yQGzXunSeT8F1pUyXpcV1WWwptnWZpsxnRQiXTrf5lugMgFptLOfsJhz5aejG45kGhrw7mv6dVchG0FDSP8EeJ9KfRavWoJE+Tnbj7p2oioeYsa/jEQvs7F3dsBSLz8wXksLPaTxE/n5fS79RD+8KdOrSCNtNWBViRsOZPnZcgQlg5KpjA0u6ATZTqVS9aRkVS3nf1JDq7sEOEnTkqCGakW/tlYGFIIlsPyONd80uwkWFSdOuaYjDP74II5JnemRrtTTdqdBZ9EMKLQ6dEXE6iOtlaVkj5od19hFKCfI6TGkKgmQ0AHRh2RdxLcWyY062aCVs/Qf+RwzXXSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(82310400008)(186006)(1800799003)(40470700004)(46966006)(36840700001)(82740400003)(478600001)(40480700001)(356005)(81166007)(54906003)(426003)(2616005)(40460700003)(86362001)(1076003)(26005)(36756003)(6666004)(336012)(6916009)(4326008)(47076005)(2906002)(70206006)(70586007)(44832011)(36860700001)(5660300002)(8676002)(8936002)(316002)(41300700001)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:41:35.2575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec2a4f4-9e16-4504-900f-08db974c049b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128

While not required today (ECLAIR jobs come first), add "needs: []" for
future-proofing and consistency with other jobs in the pipeline.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/analyze.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 3325ef9d9a44..4aa4abe2ee18 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -18,6 +18,7 @@
       - '*.log'
     reports:
       codequality: gl-code-quality-report.json
+  needs: []
 
 eclair-x86_64:
   extends: .eclair-analysis
-- 
2.25.1


