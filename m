Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DE945B58
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770848.1181469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZort-0000jD-KA; Fri, 02 Aug 2024 09:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770848.1181469; Fri, 02 Aug 2024 09:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZort-0000fy-G0; Fri, 02 Aug 2024 09:46:37 +0000
Received: by outflank-mailman (input) for mailman id 770848;
 Fri, 02 Aug 2024 09:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZorr-0000IF-Up
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:46:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a357734-50b4-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:46:35 +0200 (CEST)
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 09:46:30 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::68) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 09:46:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 09:46:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 04:46:28 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 04:46:28 -0500
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
X-Inumbo-ID: 1a357734-50b4-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzMsOsh6m+1P9nXHgp/vZfvRcpIZ+qGnptm0MFiNMasn/ZkaKH7tVR3KVXrAFf/MZWylh4NVnTvgeu38D6Iv1fKtcpYCRy+p26siIJ0m6lELz3B088rKFPNWt87itpwLIFuEvj/NAWqIKwu70X0O37RVN9jHi/FjE2svBqDXG/1GOM46CwzNwjmEYSgeRA8adM7/j8elrMgfte58B6v5b1/y73kaw6SvvxfzXfrOQwpCcNVgfeiIcyGmLnclQKhdgYDKcmE6LNrIKBpZpBJE1aXjca6xXL2KktMD1O9u1xTFWgvsHt7VIj0r6D+/soAOGZgeTJJstVPL4WjweiiDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PH+usP0G5xTrCqcAYiKhBQS5kLnoQhrAx4bS3grPWU=;
 b=ZLQAUaMgplfwLYT7Md7aS4xkKhkMJF/zesUwNXj/T+kqJG5trz+OV7s5qz0FoOcNLqbhGkx5vCitElBb5PgaILduSXBrv4/L5Dj5j4eg2HTYOj8S3BjRwVK/XXDQzS1G6Wukpg1nqwLIM+aqmziS8gxo3J8IGvxKLeIZzpyAQnQnbtwWgCuFgv7dHE7zjSs3KpAkqQEl7eEjHSQi3kSfNVPpIUwunnvZgDmP8AIkadBF4DMSkFZZjIf/+f3rcDk0O40SXVaQGBt9eLMRfBiKNTmNw8qDiEGQk3BSkGDAG88JvUzA8FuxGMr1hCjBQrcSBPvZo4vw0lr+QcfqzakYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PH+usP0G5xTrCqcAYiKhBQS5kLnoQhrAx4bS3grPWU=;
 b=f/KMXBU2Ylsveor7OW+Iag7LUO9FscbC9IwWa5a5Va889dXMIfX1EDP0oJ9k83tn/b0P59LBrtiYBN4ZBW7C0+kjjgnOLn7OTQPssfRb3B+MlETBU/isaTWebxNc/5JPGfJXbvr0GTYqnUBNqwdN5l5P6JvyYqJLRxM7nXFE4NA=
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
Subject: [PATCH v2 3/3] docs: fusa: reqs: Added a requirements writing style guide
Date: Fri, 2 Aug 2024 10:46:14 +0100
Message-ID: <20240802094614.1114227-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
References: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a92b44-4c90-457f-601c-08dcb2d7fc99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2G6eOntsc83bzXk3z5whKCebIWycyvprIq77dBLZiyi6CxBvPgTDsP6bRBFV?=
 =?us-ascii?Q?iuqdnIkMpwiRWeM4swmOf2JkvzKwsRavHYfNNEDjglVtYEbJaKFhDymsEyJZ?=
 =?us-ascii?Q?hoGhlqb8yaI/FZ/XBXVYTHqc1hutrtOHLiNtmugtac59tRNFFR3IclfcY8yQ?=
 =?us-ascii?Q?c2YlMRTyKk7jyzBc6PfJJIVk7oEwu46bX9p9iVCOjg6K3L+50YONvgd5QBgN?=
 =?us-ascii?Q?A5/ml9sT4wPzKM7bNYPt7ipfS0bcQa7bH3H7VVYrgCB9Ag677Cc+2/6jcuFs?=
 =?us-ascii?Q?ERyadC3gdlNGwTYxTGocYxk2wW9gJQshrbzYS2GwLv/e9nkHYyHbaZyPQHua?=
 =?us-ascii?Q?ZkRDvQhZoU/x2eAUTO5hQ/kOZDEbf5228mZYHZqMT82a9/gy6aOn/YZVmaSe?=
 =?us-ascii?Q?/V0KYzMzWi3weOx+xjDwSuPplBpxhDHUAGwiKz48p8K1DUmoF1NLt0HLKHKW?=
 =?us-ascii?Q?AcFUqKWlFMScQmqqLeG/5+oy52ZZSnURnNYR4zDflCxDXV+AegMN3xcuYYFh?=
 =?us-ascii?Q?JzKFtdmjEO4DRi8CTRKAIyUN7OrndN87Kx6TYvIHMVKM7zUWUPdnroo10duL?=
 =?us-ascii?Q?9t84927qSwbvoAIHHf+ZR8hjPUGWe4gqCe27CH6CmdeIfxE2WYNa6WTldj1t?=
 =?us-ascii?Q?RpAdKjk9qcap5JHOWHEQ3/TvmMXDET9MGfJG+BDsoj6/d9sNbUoGJdTTfIAP?=
 =?us-ascii?Q?mhuexlgt6gcCBjP7xvzH78O6K9mKkjNbXPiept6u9KvJT5VTye7auHwUSoaH?=
 =?us-ascii?Q?o84LB9bLz5h0zhQ4jidCwy4Xif9VhXbldUX5Ed2OsiRNTYCAR7CzypcqlLQK?=
 =?us-ascii?Q?65jh422HZM0y4qtx5OgBd/Kp5RoApGVuJf9dVvlwxAZWAXas0mX5sKP1ZZf1?=
 =?us-ascii?Q?kgd9AYP3Qi87l2FU6MdypXeeU8D0CbN9+r0rRoRY3o7IOKRA/R5rMfZZ5sIg?=
 =?us-ascii?Q?ZSKVLNwJep4zKh/M5zYw4C65WZ7cZBjb7rfk+1Fz2gCjutnXX7q1EL2dcDXR?=
 =?us-ascii?Q?WVvCgldBt9LojjnB0oybCrtodkpmS4aWnwY0yA9UNtW1AF6kwnuImR4UySie?=
 =?us-ascii?Q?Z1qx6K6lK+w1oaRNTVX4mrUCS66fGlzlCUFi5IvI9tRl1sr8tS9FFWRZ9tCY?=
 =?us-ascii?Q?Zr2ypgUPMfgNM/auqBNhBCrbWYP5u8c4jJmbP2EemL1SAIBQLJe3b0SJfTJu?=
 =?us-ascii?Q?7R0rABpHGNPHmjy4NMwcy3g0yldK2bgYGb1M6rhR6jyiIRVKCKEnSzqIjQ9n?=
 =?us-ascii?Q?kx4aleyc9quXZ+DuI3YRLHfH+pk30zqYFqL9juuAqKhzh+O6BKOR8WGiV6Hg?=
 =?us-ascii?Q?hf8Sfezorlg3IGZx4Ta6f0GzkJ0HiuVXWaGv9HZu6R3ZyUVkD+X2zQkriPjg?=
 =?us-ascii?Q?7bg/F1GhZFvh1/igYlX8mDTN1qfWDlvJvIQgy3xXjdbtBMhuhOxMrlVg4rYs?=
 =?us-ascii?Q?bPljRmb0huzVjm4mY2mQgqOfh/ldAFt5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:46:30.2578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a92b44-4c90-457f-601c-08dcb2d7fc99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712

Added a guide to help write and review requirements. The requirements
are written to enable safety certification of Xen hypervisor.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. No change.

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


