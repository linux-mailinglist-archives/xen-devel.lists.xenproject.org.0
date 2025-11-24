Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCAC82AB7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 23:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171536.1496558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9x-0006Uj-Uh; Mon, 24 Nov 2025 22:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171536.1496558; Mon, 24 Nov 2025 22:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9x-0006Om-R9; Mon, 24 Nov 2025 22:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1171536;
 Mon, 24 Nov 2025 22:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvF/=6A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vNf9w-0006MK-5L
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 22:35:48 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e986716b-c985-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 23:35:46 +0100 (CET)
Received: from BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::15)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 22:35:39 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::72) by BL1P222CA0010.outlook.office365.com
 (2603:10b6:208:2c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 22:35:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 22:35:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 24 Nov
 2025 16:35:38 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Nov
 2025 16:35:37 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 24 Nov 2025 14:35:36 -0800
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
X-Inumbo-ID: e986716b-c985-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVnmqCiV958fxvlFj43jBENctdD4r1jKvhL1k9MxFdkKZcc9KchesUmYtBGKurjFwg2PsPwqI/0omX9xzfC9YEB1bBuOXFHugrhrlj1BJvrMAcNFN/yfZsD2dkxrlwX8Nwfud3yr32lm3nDF4QLcZgcPvTC7Ui/0mCv6rw/pzVBuhdDFUWR8u7zC2ai0eoIrDRlnbo27R0NtMQCWcdHAGVN5obuByFGIKIC0FAC5k1qB/aus/LhpdHteVf5HQPtfS8sX4kxGoCITf4ln1JzJLc9ue1WKXA69DrDhYWEszzKWxPX3J4Avow6xo7o2n7bHyGL5lbWLvJsrqxTZ2IbIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmKtN+g+zysIOxJaxR3zvdU1oJbPHq/n0XqRmdJtjQ8=;
 b=v4gZEMFo+GLBLpdgcVbXsJ9VecDQiOxUCj8kmvFExDXLnJG/5EfjGF2Iup5iGRfbBlDFxiYww7W31+ZxTcZl978KtoUn55eBd8BpAoq/u0KNWu/b/tz0/Csv6v/V5ac0d36Z/WPKVbqLPT4eGOQwZSaTwfhqzqiBnvgjoCJjEWzZbYZ83e2aU/r05Mg4OFS564yg0ejdKPVojXsVhmbQMfo4B6n6Icz9wruIPAT03nWJV0Vg4oqBH3aOw802Q4KHaB9R5EpjXM/YNXU+57BAsj56LkKc0khvOADtOMOrxP/d9CqD19Gprk6hjQBmwnNDtSSA1Gu/mjquVjhBJm3zmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmKtN+g+zysIOxJaxR3zvdU1oJbPHq/n0XqRmdJtjQ8=;
 b=l+ORkzQubm4o1kgFWeYPOndnKaTR5Xp0xOM4Nj44zDtOG3lTTMvGWHhvcmAgr6F0PqTr9/BXHYS1bzsGqTOCoJm9IfDQlH4vTBe2GrLE3ZXGYw+pXapjVqUqcUlH+GqYkTgkoSlJX0kwnehsy3k8G846o1LeM0ggbqjCduhAx+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN][PATCH 0/2] xenstored fixes
Date: Mon, 24 Nov 2025 17:35:31 -0500
Message-ID: <20251124223533.31613-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: f14f8edc-ed35-49eb-809f-08de2ba9cad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+3Nihbrgsw7XObCe3acDZaVPL516CpFIpQgZkYSiYU6/ag2aZS+dXv/e9/f?=
 =?us-ascii?Q?frFKEIvLCE5aLL8smevaBEVefAhtBCwL7tou4m2B9tI6q3zCJQ8Wb92/VUol?=
 =?us-ascii?Q?KSdg1NqRNF54lj++B11f3bUfw2PJgWykc78PBCfZaeYdRn8hhtiiBsE/wh1Y?=
 =?us-ascii?Q?Hg93QgNnMCSvNP4SuZ/jxAxsJSr48cTCIZJmXJdUh70gw4BzbOu71I05ezMb?=
 =?us-ascii?Q?L4hyO/UU4NTMfBB7ObK/gzsibpEAR9SVU0Q9sw67aG5hfKOxts0fNkzxC7ex?=
 =?us-ascii?Q?Vsn/YGuRxVyPwzWbCw9+YVw7S59Qp9Kght6G1TCjGMBfVSJqmYEP3mcY1Zmu?=
 =?us-ascii?Q?aEUU8r9Dn7Bz0SlWG+Y0ERMPO9A6gcPaWOJX83V9CJC4j+So78/0v12xyTyT?=
 =?us-ascii?Q?Tb44mCtp4CQzU+rkjgINMtXfsFFr8gFK0sIfI/yv99mPhAh/TCKUYpD2/BTb?=
 =?us-ascii?Q?3K34Coam/p80rPAjuSO0upWJ9dRqCwnRzGcU7nJoHUGe0I0tXdEf58adLBZC?=
 =?us-ascii?Q?zVSmIdwmyy/Fqnf68J3ulNvhJnqNfX9hFbwu9mr20foOOBPHoKiCLUjQl82d?=
 =?us-ascii?Q?pjMILruO10//Oa/Mo20VYohJBuSHYEHgSbNhbnWr16rYka+AJFV0ldG+QfdX?=
 =?us-ascii?Q?ku5dolifqxQb0HHLE4RZCK17qz9HZqJFULJCCxT+6guoGAxD//OCNW+6w4l2?=
 =?us-ascii?Q?5tb1dYtM8eYGLl6LwdFVRV+8ljWLOjm652wCj03/wxPrqFkzTBVRABa/bbiT?=
 =?us-ascii?Q?4Jcpe6+EVyVxEXDm9AsaxbcE9PSEvisDOfutrZv5fOtBP0duHFV3vIR58Kne?=
 =?us-ascii?Q?R105o9BH8mIt8gPt33lXlUc8+Qvh9VJk2gIVpq04uJDel7pRSb7k1no/ExOV?=
 =?us-ascii?Q?UAM6ItqJiAwGVjg+hSpKEdcFqWbs3CBuMHLoRYiWlCYWwvCyqRQibAw28qLg?=
 =?us-ascii?Q?Tr1X5EulajMI8ECfIYRIV0g3FszRWFB+FnVXaELELE6aDhTdahIkVlG41TNv?=
 =?us-ascii?Q?+Z35+O+0mz0d1TzePIFOU9juhlZjLUpjes/DUNOoI+g2VWzkKSKl6eOdUtwy?=
 =?us-ascii?Q?wesxNhdZlg77oH3hdOxHEp2ejc46aXm8D+Lns8iLvcZXGRE3l/JePSpQt3s8?=
 =?us-ascii?Q?itD4jP9NSgo+AE0+MlHSniXf4kusk2lXjgyCUzG3dCHSldhM/Q0r6oPRO2ED?=
 =?us-ascii?Q?y/xK4iP66VlpgH2QYAPgnHFgEYyDPY2s0CZM+aPylPqt1Bgw+ud9hmWf6MvD?=
 =?us-ascii?Q?zFgEeRuXjBAsWTxvJV43Crq/zlsY5B4h9esBBzXFirHLavCeR6oQ7k8stW5r?=
 =?us-ascii?Q?7TT4T/FZiSPoVXztxXh+drwLmvsEjFhUGh8yl3VKKaVcgTcQAvpHD6ZxBJlz?=
 =?us-ascii?Q?CdEoiwDGy2pxQ2Jwy+RHejrarXtsR8+PKmuVrsTgnsfNJANaWk7SN+BBEK1W?=
 =?us-ascii?Q?TulExkjhB0ySD0Z+EySZ9VLOiX8T8CNrnTMRBiCxbHfzIKcVHy+a4SXDJln5?=
 =?us-ascii?Q?VM682W+dZsKWhH6gK2ZLubZHK+SOm03K67d4Tl09OopUZGJBipZHxURKpYA1?=
 =?us-ascii?Q?SKr+hYmOKx1mKRKFSAI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 22:35:38.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14f8edc-ed35-49eb-809f-08de2ba9cad4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

A fix for running xenstored without a control domain, and the addition
of a missing newline.

Jason Andryuk (2):
  xenstored: Default priv_domid to store_domid
  xenstored: Add newline to error message

 tools/xenstored/domain.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.51.1


