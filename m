Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B81945B57
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770846.1181445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZorm-0008Ou-U2; Fri, 02 Aug 2024 09:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770846.1181445; Fri, 02 Aug 2024 09:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZorm-0008HT-Qt; Fri, 02 Aug 2024 09:46:30 +0000
Received: by outflank-mailman (input) for mailman id 770846;
 Fri, 02 Aug 2024 09:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZorm-00083o-3B
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:46:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e88::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 163822dc-50b4-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:46:28 +0200 (CEST)
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 09:46:23 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::fe) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 09:46:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 09:46:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 04:46:20 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 04:46:20 -0500
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
X-Inumbo-ID: 163822dc-50b4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyZ9shV5hb3FjOcnS8jNaM7e4o11EwPzPbh53TEqkbPEJGRyZbHk+SCLzZPNfFfIBSn4e79auUoxRJsJNP6xpBrzSs7vA7MR1ZeddaUYH9ILbmKyHdZ/p4bIMe30fakx2SfBa7+xiBIKAl2ALk9rmEkewyTNKepAIZfVDrbLfNOMUmKBEvTusAuNu+S3lMBB1AzqybVBVAIKZeqkecjMul3UII2mLwtAU70O6f9x8fsvkAw45L+F96vxDiX/dMPUioUO1HZt4N4IXCsbGFNgW4Qs3RW1cc9sB3gVeltgr7XcmaFfnhypE7GxgP3hfbB9rGVwh9LIJPSlJ1jumYl3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFFqgAkmdyOuJy5JYhvhPk6hTFrLiUYeXIC7Vd/14p0=;
 b=WqNGy8ZvXJeQf3UHrnRQum6GN+mHZxa3+4oVbeGLU0BTdws4gFWM480HEMuRWFq4iIqkUgvnvPsjw+dCUHBaNGG8og04NvG6OYavIBfWTsgsJ2be0PCa432QSoHWXcvXHCzAa0FfHF6ebAKohM2TuOpVo6KRKd+Bi265RMAywzbjdp0vJ5xgtS3m8ndYAXptueeLtQ180uEBoxGqwnTnP2p/HF1wfdMiL4wGn21Oh42l+nQ0hg7r+K1R7ZoRBV4g9Z7lLrN2G4UaH+vtUz/nWp+0bsXdhowLLgzP6pNLL/358f0elX+wfTTskR6LRGxRolD+axHqVRr7rWRCfX7LgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFFqgAkmdyOuJy5JYhvhPk6hTFrLiUYeXIC7Vd/14p0=;
 b=tfQOt4xAVuF3Yct6Ca2dkoJ8/gVJJfC0oatji2I52p8GqATRqXAY9oCKvqlwuD1dcr70scUVkO4nDirQrKKNAbnhVg3wxGxBLU6txdFfoldzQ9BU2S/sA0Dof4RdVzWt/g177c3rbv33hXunPcinW8+pVJqrMEn+0gjfDC9jR/I=
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
Subject: [PATCH v2 1/3] docs: Introduce Fusa Requirement and define maintainers
Date: Fri, 2 Aug 2024 10:46:12 +0100
Message-ID: <20240802094614.1114227-2-ayan.kumar.halder@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 1907e77b-087e-4ec7-1afc-08dcb2d7f866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TKgxOJLfwoGsBGRweiVrLRa++kchUkRfy45ZjWZT/EbgBWLakQTTA/ikCEoy?=
 =?us-ascii?Q?uhBNnSnQRVIawYv9Es5ugl1IfD8zFVwmTx3OdTe0NmpUF1R5AZu9TVGFEeZf?=
 =?us-ascii?Q?lF8/Xj2GQW5gPhfegCydI6Z4d9TyGqBvTONl++hrUt4zJli7Ukxn0Tm09KcU?=
 =?us-ascii?Q?p0SXvmKj7RAYqqrlg5/Gt9V99SzykedVgvtxiQx5HLU5WcxiUsbcWNc1EyIS?=
 =?us-ascii?Q?IoMwLZIQTAJEeI4cSUbbR0LuTQRsHo9stC+lT/HCTVRXqF/bJ6IqHAZG46M3?=
 =?us-ascii?Q?RbA051SJrjQ9fdlVSov8SVu0zjXuzIwc17zllD6DpIIC1nyHJESBFaT/NRye?=
 =?us-ascii?Q?zyrW4EY0N/Z1KNj+wLMvGJ4A4jPy65UNvpNjDVKk+lnFgUvt5hmEl6H+41o4?=
 =?us-ascii?Q?bmhQcmHaiJU/uzgMFWKUSEch53b1RkUXM5E4yYHwcjciI+V+uE7ZEUclVy3W?=
 =?us-ascii?Q?lcfwfMfZkUia4G3mQpoNi3Jng9uKrj0Dv5EEv+8MG7uo50QZjuQmCjBc+jbX?=
 =?us-ascii?Q?c0ZbjXdun8FvY4SRYnk9Q8UwtnWmu+GFsjjKR7jEjjODd3TvUG3SO5O+vv+C?=
 =?us-ascii?Q?0IVqfiZPOAsBtlvlnHDABIfD6tpcNN8IEmrJgVKzAATlqHK3qfWZIw0T00vK?=
 =?us-ascii?Q?7PbezplzEBkjaRFzY31BdUDlSq9giozEwO0imVgYjuViPAp/xNd5hynMkNoB?=
 =?us-ascii?Q?Sf6qi6Nb9gT5AWzj7mZgSJbuugpQdlmhVGCqrOVVOBhrT061v3iH9Uhz2rZd?=
 =?us-ascii?Q?aBxi9296leowe4maalnkiWhBSgsbUCRjHZzC9H2Ft4w3mTbIAAh/E6agKu59?=
 =?us-ascii?Q?wxUvYhXyEMAwO3oTjT/+sXEgvK7Z7Tc8I6jl1zOTQBxwxhpMm1YKWAYeX5/T?=
 =?us-ascii?Q?SdK3yH3dZ54gOIqXflTXulNosWECS6eUbCwoIBfISCJRQWZOBB6ns/3EwuYz?=
 =?us-ascii?Q?7YXMqfWlC3lD6FtAACny1c5JtJ0SnvcAb2xJwX4bEGJRrBQm0OKDDdtkxJTS?=
 =?us-ascii?Q?RwegbqcfOfNJAEd3EHyXCS5l9qSlNX+JOqhkVIXoSbGNtJxtD8PlZ28C6QR9?=
 =?us-ascii?Q?NFxZ/dN41S3nS1+i+JSIa3HMcgLuLK8qwB8YeQKdO4wuUGbFfMqRpnhR7U1r?=
 =?us-ascii?Q?360RFpTinMpWphIRa0SchzBmgkr7LYPXuud4CbKHCXpGbJXzn9Jzy4Ah/SQ2?=
 =?us-ascii?Q?XoSmoAK747qrSibHl+szNcgTbQUVu6fVWRkYiyEAMmGpDpsnx3o+wSlcWufN?=
 =?us-ascii?Q?QoU6zVsPbt6V0f75YIxDXVtO5ezod9M5AtYXgiq+C5wWYIeBYIEqgb/N91yo?=
 =?us-ascii?Q?LHD+u99N7mT3i5krpEqsWFD1okMpt+LY/7gAF4JwpkQ26mh/FbTmgto+/ryO?=
 =?us-ascii?Q?10m25KGTFwN2QJoaePq8otQBHhDImISIoLD/zyhrlvB3CzP4sQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:46:23.2421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1907e77b-087e-4ec7-1afc-08dcb2d7f866
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

The FUSA folder is expected to contain requirements and other documents
to enable safety certification of Xen hypervisor.
Added a README to explain how the requirements are categorized, written
and their supported status.

Added maintainers for the same.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes from :-

v1 - 1. Added a comment from Stefano.
2. Added Ack.

 MAINTAINERS              |  9 +++++
 docs/fusa/reqs/README.md | 78 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
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
index 0000000000..651f0a4e00
--- /dev/null
+++ b/docs/fusa/reqs/README.md
@@ -0,0 +1,78 @@
+This folder contains a set of requirements describing Xen and its implementation
+in a form suitable for a safety certification process.
+
+The status is experimental and it is maintained on a best effort basis. The
+requirements may get slightly out of sync with the code. We are actively working
+on a process to keep them updated, more details to follow.
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


