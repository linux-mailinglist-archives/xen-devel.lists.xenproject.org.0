Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F894959C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772953.1183409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6h-0006Qv-VL; Tue, 06 Aug 2024 16:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772953.1183409; Tue, 06 Aug 2024 16:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6h-0006OB-SY; Tue, 06 Aug 2024 16:32:19 +0000
Received: by outflank-mailman (input) for mailman id 772953;
 Tue, 06 Aug 2024 16:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kzDu=PF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sbN6f-0005tQ-Vg
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:32:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ca58e3-5411-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 18:32:16 +0200 (CEST)
Received: from SN7PR04CA0093.namprd04.prod.outlook.com (2603:10b6:806:122::8)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 6 Aug
 2024 16:32:09 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::f1) by SN7PR04CA0093.outlook.office365.com
 (2603:10b6:806:122::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Tue, 6 Aug 2024 16:32:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 16:32:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 11:32:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 6 Aug 2024 11:32:07 -0500
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
X-Inumbo-ID: 70ca58e3-5411-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUiPdNjtq71VDGuDDiFw/uDIoHEWHLezKBWhbj+ZjNs/TSe5St03Jzkm56pks+ApOFJSIfPpcsIUtTPPwBlYXY4RqTdvxSpQxTEKNgM1Bb0f83GRlX5SrJ5t3WqzlRyVZ9b8+k0ucn8rDoxfM8dCrfufj/B/fkcf08D/dt9ydF8jJK+e6c1ZzxZPmsabOqpqxrbb7+K00ZLLKrH4DvkYk7MZZ4sC0Cd6Fu2pC7tJ0Oek5Af2K456uQ1cdB7IFo5A4BgVbwMp5yIhgjmcrEiuVI/Po+ER8CKYtaA/TMYqV3BAnYftYh42TsYJkzVp5ry+g8IqLqMG7RsbfMRt6PVnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG75xyPT6ImZGBvR/mVd+v4hrOggcpDGgSesNfGn4jU=;
 b=jbqmNhiUY6SqwWYXeuvnF2rrQrTXVJgfgS67FV4Ndj5HDwMFYATiuaQJ62Qt6AM7yD18bnDZeeQ8cJdtcSEy6o4+4LewoYM2I1fX/r8RhiPUxhkacIYl044Mzud5sWgaaAnyyWbXLTEgLQpckAWiGcb6EYryjYeojEPu6aSYkJw/cEuKtnWWu0SC9NTqAsV53pcQ4/FTEocQI4JO56J9CNrTGOvNogqIf/UZ2FQ7ZqR9KYuzJdxGm4hagndTv/JscF8RqPBtn6W+ceowu2HMBJQUK0IVa0PjVLKj3TUPRWVUijk07ozPsFpU9fpbTGmiLIwxamZ38ilU2x8XQ53VIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG75xyPT6ImZGBvR/mVd+v4hrOggcpDGgSesNfGn4jU=;
 b=B9RKplne18juSTA3X6bV9RMQNi7GIZIonRuHO0xdyJfH5LG+aXR0DlPImQhdllPZkqWUImJo1lX9bSaSRjGeSaiXnZaLzHqOnSDMxBdewo11v0wDUhcxvgWlYxDtdAlReUmCC6dBc9JlmFZbgPW+on5PzlIU9XLaACZ0K7QVJDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 2/3] docs: fusa: reqs: Added a requirements writing style guide
Date: Tue, 6 Aug 2024 17:31:56 +0100
Message-ID: <20240806163157.2850636-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
References: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8501c3c9-f32c-46ad-c0c1-08dcb6355135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7BhZAtE0jRUpJrZqOzjriDctfDxJk25HMrrr/0FOaPMjkb4Rj0wqAiKORAuP?=
 =?us-ascii?Q?r3dy16zGgvtOXyuIZxf85z+sGDTAroVXqG5QxYiB9EPw1fsSbK/AFshutHl6?=
 =?us-ascii?Q?Zo63J2mOyKaq1zOYfV2B58WZdH/C61Vc9LTzyXxjhXNO+ZkJtPyZxley94Yp?=
 =?us-ascii?Q?FVfmmtqR53CtDLSjms+iknUqqZQeVMvKKP7L+om6hf2Up8kPkcg7bfpSR1TE?=
 =?us-ascii?Q?7PBWYz4bWVNtc3NArYBN4CTXsd/9fg+AcTelc/DFG5ZNldhdF9x8oT5fdcEc?=
 =?us-ascii?Q?RlGo32zhEuGI5fEsK3SlL/rAav0n4XoGDA3YdXzpjsjQQsyg3WyyxT4ARV2x?=
 =?us-ascii?Q?JyLErmUiZFY4GMfTWqfD2yqThve+Su6uV7fyCHWYw24I32MDWGuptAl0sYyD?=
 =?us-ascii?Q?H8PVkgOvQOhYDsfTHtNVwQ2pPE7ARoPbEWOacOd5oGgb0gn9W/rFSLExoB7Q?=
 =?us-ascii?Q?gV+oe/2oNK8wBLbNwCvoVg1RTsl1uBYB9xZ0FK54nZxKCPbGUmXVD2v56AMk?=
 =?us-ascii?Q?77MSVoNVJVVff3/6EdBWpcby26/ZEV66T4yNBgicyIAe4O9isJNIaxeuWUwD?=
 =?us-ascii?Q?x+HJd+cDb6jqp5mKWX+ZwG7445CX1ZTC0HOXqQ/FCdRh0r78dKlzU4mYDViG?=
 =?us-ascii?Q?fMuOpCnW2M36CPxFyOkaWaqkTyAQaIRUmezZlQahP4z42Es/uT7L/DJMueJ/?=
 =?us-ascii?Q?DXIox5rsczDHPV3Ad76ICg679tZuHy3WNT8PGtA7L0hIRyCpnzQ00pA2/hPT?=
 =?us-ascii?Q?21Cq66VfJ37iYs70K4Avl0cnMcprBdn/NqjWJMpv4qKVeUSha186aSDwS86P?=
 =?us-ascii?Q?wevIpid4keUVYH2D+GFaeKd6SvLTxmb0UNvYshIjdonGSOu5HHWu6CZrsOnc?=
 =?us-ascii?Q?AOs1rluY6BB5ijvbLvRNGIWrFLemq0v27ndpLnw5VjjjF9QQrbcE5m7snJq+?=
 =?us-ascii?Q?CYuRsPLQQ+Zb9tbaGJWyXMzfDuaBBazJJ1D8OMjXRUSy0hMZ0wAHbxkJ/9ur?=
 =?us-ascii?Q?u+abODo0LjyKtkORqKB3b3etZZOeKE/E4Z7AUdsaDEW2rOnWp0ocSNL2g8fD?=
 =?us-ascii?Q?hKOxo/oa9v4eBT7818HmzXYBg2SAZxzpIwTGDwTbLruPNqEktOnaVs9fP2AF?=
 =?us-ascii?Q?kNNsVm3HVd969ya9hCsZ7y37ruQKtvszYueMM2JwLF/7OhsvBLNWKDbHpFsN?=
 =?us-ascii?Q?JcwDHDynB+YRtD7OS31cWKUo+OLxUtrlTVL+bszfdTgfvwEK5pkDMpVBodcS?=
 =?us-ascii?Q?bBS3Ckb5QpjdmOoPRv67sfqW9DMW9oclLhbSQmFSbwgHTl5E6e/YP6hOJ3oy?=
 =?us-ascii?Q?/YSODfpdQsZZraeUGfQufBrrkzqQR7Jmrf/e8FlREBiTXy2mi0QnQm2OD34X?=
 =?us-ascii?Q?DSAC/zraJV/U6k+ZVMGr3K2+zZDZ//p5kjnywZaOtQOSyGI6CYTuWN9jcCMm?=
 =?us-ascii?Q?CZtbrj2t3x69Yljy9dwpfzrXPG0CY+OX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:32:09.0985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8501c3c9-f32c-46ad-c0c1-08dcb6355135
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

Added a guide to help write and review requirements. The requirements
are written to enable safety certification of Xen hypervisor.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes from -

v1, v2 - No changes.

 docs/fusa/reqs/REQUIREMENTS-STYLE | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 docs/fusa/reqs/REQUIREMENTS-STYLE

diff --git a/docs/fusa/reqs/REQUIREMENTS-STYLE b/docs/fusa/reqs/REQUIREMENTS-STYLE
new file mode 100644
index 0000000000..cd2408b9f2
--- /dev/null
+++ b/docs/fusa/reqs/REQUIREMENTS-STYLE
@@ -0,0 +1,34 @@
+Requirements writing style for the Xen Hypervisor
+=================================================
+
+The requirements writing style described below is the style used for writing the
+requirements of the Xen hypervisor to enable functional safety certification.
+
+The requirements writing style is inspired from the ANSI/IEEE guide to Software
+Requirements Standard. Specifically, the requirements should satisfy the
+following validation checklist.
+(Source - https://www.nasa.gov/reference/appendix-c-how-to-write-a-good-requirement)
+
+Clarity -
+The requirements should be clear, unambiguous, consise and simple. Each
+requirement should express a single thought. Each requirement stated should have
+a single interpretation.
+
+Consistency -
+Any requirement shouldn't contradict with any other requirement. The requirements
+should be categorized correctly (the categories have been explained in the
+README). The tone of each requirement should be definitive (ie "Xen shall ..."
+should be present in each requirement).
+
+Traceability -
+Any market requirement should be linked to the product requirement/s and
+vice versa. Any product requirement should be linked to the design requirement/s
+and vice versa. Full bi-directional traceability should be maintained between
+market, product and design requirements.
+
+Correctness -
+The requirements should be feasible and technically correct (at the time of
+writing). However, it is not expected that the requirements will be kept upto
+date with the code.
+
+The requirements follow the same license and line length as the code.
-- 
2.25.1


