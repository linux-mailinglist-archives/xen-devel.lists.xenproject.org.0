Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD94943438
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768990.1179904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJj-0002Fn-G0; Wed, 31 Jul 2024 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768990.1179904; Wed, 31 Jul 2024 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJj-0002CW-Cm; Wed, 31 Jul 2024 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 768990;
 Wed, 31 Jul 2024 16:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDmI=O7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZCJi-0001qR-KW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:36:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1288490f-4f5b-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 18:36:45 +0200 (CEST)
Received: from CH0PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:76::19)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 16:36:40 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::a5) by CH0PR04CA0014.outlook.office365.com
 (2603:10b6:610:76::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 16:36:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 16:36:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 31 Jul
 2024 11:36:40 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 31 Jul 2024 11:36:39 -0500
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
X-Inumbo-ID: 1288490f-4f5b-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YicorYbtaks/ukoBzVpqtPHninXMG6ZAUdCNh54vyzUdQHkcKI/iW7wvaUbJVm9yacJDfxlPDU9dKBcpgpr6RUxv0C9tdNnsvEETZbn6zl/bpdwEFscgTNgigbzTbzIAhCSRXMTjre8unRgZsGeC6au6abHZTwQRJgLPcurBfTT2f/kcpiETt++aQQ4HIwoh99ySxD4HucKv+Y3WZEKupy3YKzJf+o4Zm/hdkgk9ZGPfgBP6BOwdecG4TlW7OD32zkWWbCGaK9/+CSOHU9cn54a2ilxm91Lp1glr220GX6zJt3d7meNChHlGRyPYPrOdpF9RXhL+TsIq0Ls2Fsj3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLp/88EN95cYWxifMrQBqlXRYpvzetOqFDwk8kg/LxI=;
 b=uIMfox6F4afM157fLYN7W12VtI+cqhbP0ipUDblz7JfcJdwCTeJFq/emUhyawb9bmSHHsIUap7tbNQF8/NRiJz3E6PBgbEHSO9nHBguVKv0F74xFwFRIRkBZCteZ+2lXtdFmYZSMn0uLxsDZgFL6FxgiCx7yDzRFDlobgBeoXb4qZcPKt0fWs23SLnzDvAtpzD2ed8M0rKfierqmz5bT3C1/56W2p46hNKnGb+tXB0MGKLzzZOTb8wifj9OcXuFTeqYRrYpXo6jZ9Huuy92DMqxf+L0j3nX6p0htPvLQBaEFiA+lGbgYSTePM1aT9lY+I96rdekKJ0nFLxDG/gDHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLp/88EN95cYWxifMrQBqlXRYpvzetOqFDwk8kg/LxI=;
 b=xtIFvuDpodWKp+DJdyEheKqJvbn+BE+vywiK9yX4wcLxJcwpU2ck5ab1e1vvyuIOzMQVWnJID6KHxtU3s1Xs16igUebgTCZnEne74sK9wx9XbpoFmgWEGeTAfqlmR/lhF/qElRG/KMlYv2wnZz+StMmX2RpcnbnoXKmJiyvzdWg=
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
Subject: [PATCH 1/2] docs: Introduce Fusa Requirement and define maintainers
Date: Wed, 31 Jul 2024 17:36:13 +0100
Message-ID: <20240731163614.616162-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
References: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bceec7-1d19-4732-d76a-08dcb17ef499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5WIQpQT6fs6caSaOS7X3uOQNsfyggOBkOv82tFRu9rBdeEiNUiQU9AQjAXSd?=
 =?us-ascii?Q?YrPpRXKeCYmuvVyQGgaJ3dCSEl5pFclWq3r+x9RONuhjBpMVQnrtNMv+4lRL?=
 =?us-ascii?Q?iNbPl9zTAPpKBnmc7u4bWb161m04KSIjIB8slPQ9Ttd1Jv8ULBUlUzAZkP6O?=
 =?us-ascii?Q?Qs9VU+dRj9YiokH57V75yn9HZ95pPYjC4CbltNvi9P9LKNZLVJwEj1RnYCBi?=
 =?us-ascii?Q?oM5AQTyjSgRMeAtkqiDglY1hE9cUvgBwbQdaLeSracs46N7858MVfsPT3SEe?=
 =?us-ascii?Q?O/c+a4aSCJ0dmOR6UbrV0MTxkgoJ0n1v0BBeub8X6qT1weI1pxbwJ9gXOG63?=
 =?us-ascii?Q?bdbnrgotfbVgxRrN90V19sN0u/PxU7phZ/1CtlKG7Dt4pSwPp38/xWI4jaal?=
 =?us-ascii?Q?Lltgw1xHbRLNBLgqWFW4BRALiZszxjlwAZxmFJ0H9DRH3VRyZxi4N4OsozFb?=
 =?us-ascii?Q?RK4y473T3Ak97Mcy4S+0zCXLOKVbjJmMdl5i9RfLeZQF2UDZiEK+covHsSOe?=
 =?us-ascii?Q?jZ6XzoUkxBSPinw41RpGYTubYG2SBsqe/LyJnNJF09EoTdWYX6UJhPlmRo4S?=
 =?us-ascii?Q?MDsSok7IZ3PZgjrC9rTkEBeWIj/ZQcCrB1IrlJU+mRj0psuE1Xno/SshsYmH?=
 =?us-ascii?Q?VGcO1q4LN/h8VnDUtK7sOzTchj8tPB1x42ld31kKPeOkyYTsR1vHVI0iDhS9?=
 =?us-ascii?Q?+IuyPSaysNAv9kqmLQKUeL6vpWB19ds309TYcLr48Z9AuMHTGXYzAno369SF?=
 =?us-ascii?Q?kqNPu0Wh6M/lk9uXOAmtKl9dQ8uYYsXvW3q4qU6RmnXXPCb8NE7IOzbKeSFp?=
 =?us-ascii?Q?PsTmcERuXioSY9tAXRXxCHsfz35fr/GBxn2fsF1xV850nXmjAU20ymUm+hGT?=
 =?us-ascii?Q?huvUyQ7X3Cxt5orVIrnaYUPAyWpLWnCNi3EMdfR/iBGrd7sTxP15vN+sMhAs?=
 =?us-ascii?Q?WeTehfOH1qJWAwZ1h+Wjm4E0q5rugiPSts2d0gaowG6V280YlAPNoSUWdBYE?=
 =?us-ascii?Q?gHIdbD+TJvT8f6tMrtA9haQEnqY6i1vdcaJQUixKRMDIYs/A2qcSxOGPlRY6?=
 =?us-ascii?Q?rUL0FVW8F9NL1lL6z//JmGorZ9LMzkqTTwY/k6JjFSs49Ixtk1Narn7WKCJR?=
 =?us-ascii?Q?niH8uKaSLAFq4VrKHT9xXHeaWoIp6MfF6fAeeJ/Ilm7MTciifYjqsXkRQxKr?=
 =?us-ascii?Q?kqVmbEJITkGZxf9G9zeadZrYa53LLKUbjT17mXxB3Rh1p/OI4arEESP6MSdj?=
 =?us-ascii?Q?8P+JHw0USm40lQy7fvqcFmyh2PQGa0yoV+Z+OXoz/mH+17/bw8NSAujb6PqN?=
 =?us-ascii?Q?JR+9Gr+gDWoa557bsulAIG8o1sqBXNswrdjrK2jG1hskYP0OnogGz6QfgJ1t?=
 =?us-ascii?Q?RwUFcel6/5GyzwqfqzdijsB1zupggd+iD0SdaGH+pzYzMtOcMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 16:36:40.6705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bceec7-1d19-4732-d76a-08dcb17ef499
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692

The FUSA folder is expected to contain requirements and other documents
to enable safety certification of Xen hypervisor.
Added a README to explain how the requirements are categorized, written
and their supported status.

Added maintainers for the same.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 MAINTAINERS              |  9 +++++
 docs/fusa/reqs/README.md | 75 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 docs/fusa/reqs/README.md

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c524a8a93..0d328e065c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -314,6 +314,15 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
 F:	xen/common/efi/
 F:	xen/include/efi/
 
+FUSA
+M:	Stefano Stabellini <sstabellini@kernel.org>
+M:	Bertrand Marquis <bertrand.marquis@arm.com>
+M:	Michal Orzel <michal.orzel@amd.com>
+M:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
+M:	Artem Mygaiev <artem_mygaiev@epam.com>
+S:	Supported
+F:	docs/fusa/
+
 GDBSX DEBUGGER
 M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
 S:	Supported
diff --git a/docs/fusa/reqs/README.md b/docs/fusa/reqs/README.md
new file mode 100644
index 0000000000..69b8d3a5c8
--- /dev/null
+++ b/docs/fusa/reqs/README.md
@@ -0,0 +1,75 @@
+This folder contains a set of requirements describing Xen and its implementation
+in a form suitable for a safety certification process.
+The status is experimental and it is maintained on a best effort basis.
+
+The requirements writing style is inspired from the ANSI/IEEE guide to Software
+Requirements Standard 830-1984.
+
+The requirements are categorized as follows :-
+
+1. Market requirements - They define the high level functionalities of the
+hypervisor without going into concepts specific to Xen. Those should allow a
+system architect to understand wether Xen is providing the functionalities it
+needs for its system. This is the top level of the requirements.
+
+2. Product requirements - They define the Xen specific concepts and interfaces
+provided by Xen without going into implementation details. One or several of
+those requirements are linked to each market requirement. An Architect can use
+them understand how Xen fulfils a market need and design how Xen should be used
+in his system.
+
+3. Design requirements - They describe what the software implementation is doing
+from a technical point of view. One or several design requirement together
+define how product requirements are fulfilled technically and are linked to
+them. An implementer can use them to know how to write or understand the Xen
+code.
+
+The requirements are linked using OpenFastTrace
+(https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md).
+OpenFastTrace parses through the requirements and generates a traceability
+report.
+
+The following is the skeleton for a requirement.
+
+Title  /* Title of the requirement */
+-----
+
+`unique_tag`
+/*
+ * Each requirement needs to have a unique tag associated. The format is
+ * req_type~name~revision.
+ *
+ * Thus, it consists of three components :-
+ * requirement type - This denotes the category of requirement. Thus, it shall
+ * be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or design
+ * requirement.
+ * name - This denotes name of the requirement. In case of architecture specific
+ * requirements, this starts with the architecture type (ie x86_64, arm64).
+ * revision number - This gets incremented each time the requirement is modified.
+ */
+
+Description:
+This shall describe the requirement in a definitive tone. In other words,
+the requirement begins with 'Xen shall ...'. Further, the description is
+expected to be unambiguous and consistent.
+
+Rationale:
+This describes a rationale explaining the reason of the presence of the
+requirement when this can help the reader. This field can be left blank.
+
+Comments:
+This describes the use cases for the requirement when this can help the
+reader. This field can be left blank as well.
+
+Covers:
+This denotes the unique_tag of the parent. This field is non existent for the
+market requirement as it is the top level.
+
+Needs:
+This denotes the requirement type of its children. This field is non existent
+for the design requirements as there are no subsequent requirements linked to
+them.
+
+
+The requirements are expected to the technically correct and follow the above
+guidelines.
-- 
2.25.1


