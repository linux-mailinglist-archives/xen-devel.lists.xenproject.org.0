Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1B5B1879
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402995.644965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkC-0006cF-Jk; Thu, 08 Sep 2022 09:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402995.644965; Thu, 08 Sep 2022 09:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkC-0006Yv-G7; Thu, 08 Sep 2022 09:22:44 +0000
Received: by outflank-mailman (input) for mailman id 402995;
 Thu, 08 Sep 2022 09:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWDkB-00062s-Hl
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:22:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca847a7b-2f57-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 11:22:42 +0200 (CEST)
Received: from MW4PR03CA0346.namprd03.prod.outlook.com (2603:10b6:303:dc::21)
 by DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 09:22:39 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::b4) by MW4PR03CA0346.outlook.office365.com
 (2603:10b6:303:dc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 09:22:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:22:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 04:22:37 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 8 Sep 2022 04:22:36 -0500
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
X-Inumbo-ID: ca847a7b-2f57-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxN2pbZRREUTXnEVTnw+wReYdUTCGtUKqkFh3lS2t9pAYa6HIlTNXlofngLiIwSoq9do5Glzu06XxxJRqXwnM9d4Qzprg0yWnZr0oM2Wjqm3ojwrAQfgLfGpBIG7z8zFyDUVcrnxfnBB7rUuWwvCJrAM9oeTvwPQbQnmFgFqRiiZxtqGeANU3bXcPGtMoTY+53/saAz5BMhQNkmLpRhtMz0aeDHhADzmVNUrvzWK/hFDrflgJJbWhsaE3p7BUeUlgG0HWifrlme1U74l1dymtqyUx9XdbFx5lnOIfAJbtPKYjtXhDb4R+eJGxwGy7IVxGx4DvL5sfEnYtNb2DpJtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvUwy5NfFiVoeWjuPBA52OtQW6Tn5x/aILqdyOhSfG8=;
 b=djBgLSL1x9hA58gRko08qu811zYuagxl+4fuQWUA2OlQRsr1tSscg35JpFKxATVNMloEX97OExlkaHP5fKAkE7PZcDS93RMyIFcQLZQSie/PAl63a13Wt7wKPPiqIVBf1oxdKbCLK+iFqSHxR1KMSl1K2rZ+2fH6aHJ3JbHuZfttCu2AlA2EP0vDtYCPirTVCf7WzUGdM5U35pTwav9AUFue7w6rIr98XYYaUatoErzBJOtv24DehV7WksGsk/tN8+uI7WuGssX1F6ScmMjttecNSREWbj9VOMOXUReL2lHRyaNmLC0aS//M2dEgwpuvl4P2Z0OW+1jsAH/mSuksXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvUwy5NfFiVoeWjuPBA52OtQW6Tn5x/aILqdyOhSfG8=;
 b=rf0FY1gxBXhgoCo1QUc01zHERgeZ1G34lIjxARi4UtfqWnA68h8R1FeAdIVjM0FtNAuHLTFYb6B0y0BDpeUq5kkLhr+o/SmJEvmBLTElWi4H8/+DzeZ5rWxbrCiZuzq2V96vtZpsAyoKsWC5yx8M733sNoQ3SA0Lwi7aI5ZcsSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [for-4.17 v2 2/3] automation: qemu-smoke-arm64: Silence ifconfig error messages
Date: Thu, 8 Sep 2022 11:22:29 +0200
Message-ID: <20220908092230.21421-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908092230.21421-1-michal.orzel@amd.com>
References: <20220908092230.21421-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT064:EE_|DM4PR12MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cdd7fe-2187-4e0d-e258-08da917bacdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZGbRchYuTW71s6rPUZJj/3OkLRT5VOFprifrKEliSAW1ZAWtkFKL2KbvhiEORu5fu85sAonA0z6cITyPLGc4C/CDuMU5YEeMWJvMnykVjjx5610Af815IqUpGJse20f9hyGu0m3+vpcTQaBZ8WLQ+wmhvxf7vg4KcGP3NGnK+FC7vF+kcaLqk/bmipY+zW6cLj5p496KN/y2Op9ZIrwMt0WmAd/xKzHQNvsOIGtP7rSP0LGnHmsgZvk9Eb2+ggjrAOcBpI5HG6Uj0xNDFhPtkhYXHNpKBavuVdjaca6fzAvycK43mNUpZYwurbiY1jctPx+JAC7eqjk96LfR7YYPPvMnxFlR99ieadcP6Iwy56s43dluVW3KN5AH+0erSgzE3kZn4lGY1P+H6zyFJHhBW25e2aPML84u1Dr6yG1n64nMH4EaRlyW7nRhqf8FZ6X6QzGDg9Z46HeXAdF3WbMfK1glz17lfNHc7SBPMcSod3ZGryxtEMTXwbbnNR7gxcHdRYDQVZge2X7M4N4GUfvL/9sUCUw6RmhfDOt9lee+g0zyWnkjcMFtn7gvNX9dIB6BfkbJEP1gO1wCwWp4zckkSI+xyPvR1UYFm5tDVwI8LCDLguruSuCoSK3OOGO5/fYok/a7NW9Tl+4e4Q+E02rzfjg8p2Q9eApRNi0eXxv7wZ4Zy30iAtnqkUCWSrpiyLLA6KDjmxOzjHQLEc6KsHudcQxg3yhpl09rvPVlfAfnwie4Rb3MoNMWm/28RpCthYFjWfJ/S+lzCuVXDtsNnjQvt5d6GajpC5uMkW+VhmADClh8nXMgY3VnRJMaIlZyVAMC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(40470700004)(46966006)(36840700001)(5660300002)(6916009)(54906003)(316002)(36860700001)(36756003)(70586007)(44832011)(8676002)(2906002)(8936002)(4326008)(15650500001)(70206006)(82310400005)(478600001)(86362001)(2616005)(41300700001)(426003)(40480700001)(1076003)(82740400003)(186003)(47076005)(81166007)(83380400001)(26005)(336012)(40460700003)(356005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:22:39.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cdd7fe-2187-4e0d-e258-08da917bacdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5184

During the ping test, dom1 tries to assign an ip to eth0 in a loop.
Before setting up the network interface by dom0, this results in
printing the following error message several times:
(XEN) DOM1: ifconfig: SIOCSIFADDR: No such device

Silence this by redirecting stderr/stdout to /dev/null as we do not
care about the output and we should not pollute the log file.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
---
Changes in v2:
- none
---
 automation/scripts/qemu-smoke-arm64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index c80d9b2aee00..7ac96027760d 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -6,7 +6,7 @@ test_variant=$1
 
 passed="passed"
 check="
-until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
+until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
     sleep 30
 done
 echo \"${passed}\"
-- 
2.25.1


