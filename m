Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49DFAB58F1
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 17:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983059.1369428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEroN-0004jc-Sx; Tue, 13 May 2025 15:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983059.1369428; Tue, 13 May 2025 15:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEroN-0004gy-PG; Tue, 13 May 2025 15:44:55 +0000
Received: by outflank-mailman (input) for mailman id 983059;
 Tue, 13 May 2025 15:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ffC3=X5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uEroM-0004dN-LP
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 15:44:54 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35486684-3011-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 17:44:52 +0200 (CEST)
Received: from CH2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:610:57::12)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 15:44:46 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::43) by CH2PR12CA0002.outlook.office365.com
 (2603:10b6:610:57::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.22 via Frontend Transport; Tue,
 13 May 2025 15:44:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 15:44:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 10:44:45 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 10:44:44 -0500
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
X-Inumbo-ID: 35486684-3011-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvNqk7c5V3W9kX40lc+e7i0qVLuX9U/fumAF1DPsVFHmg8f1WzYiYX3BDxU38S1H/tDFg8fmhD3bdulErXL4XRP3vNCNvUYkhCXx9GSfGXU/NOrEVn+RawjfCigUBXWUin+uazCiSKrWVDTE1HdQrURQ24mt0U+IcqR7E4Lw/B3jCcoxCSTajLjSRqC6/I4JA9oxe13dW2JVhqYPb5sqjTSdOJuJ1qtNHVcXPh+Mw/xydWWB6yo6H+BIT8CcdjrWdNWpvYsaVH/Nmzr9gz9LJkJGZUgSo5jeWkaOxtjclLM9LpaIhvlhe+pDW3dDl0NTNWajoc/SmhgH32uFQPwwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enXK7WDmRHrwdQGLUmkJKQ17xE1Qn3TxOFzOTixdoVc=;
 b=ZYZ7qEfQUyRmkHwCLCtWl5DZw4Ru2fFG/lWfRnTs89Ov4aCxxaWINaIYfmHAWN0rv3VMasOkVEVxrNNpgPDzWtRNWLK9nMutzd5WL9XpyKd9Eu4klO57u5TQ3tK/eiu/GSmsBvsZUuhvgYtFRzGDfZeHXCipJPUbsDvlPQlmpUwNnoCiNvQSjQ4+cINozhf9n8ZQUukne+f+cUydRHPlhMlDLX7NnXBo2NEh+hpqVew9RbpNueScHhiKlTZjl9lW8/iypObtgIVU/PChMl2/U/N3eRlphsfNGHuo3JoghiFmS/wZqWAd8iW3zvvO09752zpS3sZ3H8BzauDez81qQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enXK7WDmRHrwdQGLUmkJKQ17xE1Qn3TxOFzOTixdoVc=;
 b=w9mKLRI221hpQe3IpuSjTDX2V0K5E2GXN/tVL21tC8X5KUiknXv6KMF0yKll5GWmdNuVhtkseTBLlN3vxC5eKPHOM/SQVI+LtKtkgjSj7FPrigwoR27qxk0PjIsmy7OM5JsX4JWyKfb29pMXtRu/ubbug+/ogMRDLXTmCoiFjNQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] tools/libxl: Only access legacy altp2m on HVM
Date: Tue, 13 May 2025 11:44:19 -0400
Message-ID: <20250513154419.27860-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cdd52e-6620-4bcd-b7fc-08dd9235160d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2+bXlOHjG5KoAmBKjEJJrvjlOFSa1abpbOhY7MlZRSDV+WAJ0PgZMXxc+4cW?=
 =?us-ascii?Q?S47PxUmkOTwtq8LyzlprNwWlYfPrbTxBIT8SjqYs3Fo998HMXmhVTkvcszhr?=
 =?us-ascii?Q?OqYJ3ypFp2eRH8VSpvP3mVLRmaf0Fl2Z0tj/hHHKg5tBBS/Y81jMbrYPGAC9?=
 =?us-ascii?Q?rrb0a4YbD+ZasdxNoBhYFQQqltmWWY7yzglBTs6WgoKU0wZvDu1sieOxyzES?=
 =?us-ascii?Q?xG6NYuvdrKHQFrHsyjYjSQVmuIgrqyvByoHVpz/+2Fb1VJzUHNGFONp23T0Q?=
 =?us-ascii?Q?NGktSp21ewva6BJcp2e/M2oP2Bedh0scvT3u8o1JMo68McM3PTozsqlfLPqo?=
 =?us-ascii?Q?8UiJ0vjsZR9NRgsNbDvCEByIzwWDcyKMWp7cSXy4vKzl7DmAsQpfxIIceDdl?=
 =?us-ascii?Q?kLy9cR9zDJqhqtdFCTajgjVko+tTyu0gC2uCQ/X2t38pGJV4mGsOSQtnCLB6?=
 =?us-ascii?Q?MNasR96rCnguWsLbVNlQoEyErYdkAdgKZ8f11lbit97hVvvvAfnB3GHz5gXx?=
 =?us-ascii?Q?mOI23PPpLr4AIoOuY7nS/t/7PiV6LuLOd7VXesHEy2yzuirTuG5fNj2bAg2A?=
 =?us-ascii?Q?+4x3Ew1AVUOFv84n9hn7Ei7lZ4J/9mKi6N2TgY9nsP+aEOGTScbCx0YA7E65?=
 =?us-ascii?Q?bolJviP1wNs+9a9Bsfb4jMbrLfDxEBZU/AhkxrN9nLF/1V8FqFp+ijxq3q9N?=
 =?us-ascii?Q?QpJRMDxmkNmzEiiokyubci9Yut7/MZQdO73bPur0L5bfw84ctA/GQkaAFbf7?=
 =?us-ascii?Q?oiiLdofToqvREiCA1g0ePfiW2WkKI94PksD3iZvmRczAJeNCZZHlYZH4I7L+?=
 =?us-ascii?Q?XJboLI4rLxopRMgxyXQqMUCngFRnGskenCYIwKQQKGayM9O7+TwroU2YgF/e?=
 =?us-ascii?Q?DZai5Nd0+siffCB/lcdpbYs3oQQKP2+Wnr3jZpSnU8bivJh9Gyf6K5D0R9Lk?=
 =?us-ascii?Q?wIrbzMe3xPZrRK/gYyQk28StPdFUhrbMlO48HJfHQvTxRQk5XcdRNf2xjXqR?=
 =?us-ascii?Q?+j893YAGf7j6UfuSkSQNiIcLz4wWh8iSGyy1xlGIhJR2GcAwj+D8x2qjQCv+?=
 =?us-ascii?Q?vmi/w/24SNchMeYmEfRcMhAlScPs+68CAbPbOqPKdsekziVNlKguQd83USrl?=
 =?us-ascii?Q?qBG/ADcN6HJ5d07dJoQpdHGeHSUjd2ZmdYwdMMDyKd8qSy4o1YB6n2G5MLIp?=
 =?us-ascii?Q?L7Z0XdZj38bz67cB4QjYgyL3CR+3EVKHWH8YNKDssia7KqQJJ/h1kXP6KZBs?=
 =?us-ascii?Q?b1CwNi02nNUB6jw914ZSYpfSHLbef9C5DqEqF3+nBTPbbbHZzhWhEBPxmL/R?=
 =?us-ascii?Q?ph9QjN8eLXSOkhg2hNW4tdjtuM/OSEV83Q0mY+hHOwkIEMLGE+Br62XzuahN?=
 =?us-ascii?Q?dfx8oF8Fm6PuMJkHOceuWuViMMDkzIExsfN9Y19NIDj157+G84sVQLGOZ0F2?=
 =?us-ascii?Q?MFQ6Fwj21NHxo+TBm6qAPhux3erEcwvyfnK8QklcNHFEO6sv+qEcb+JetAFt?=
 =?us-ascii?Q?KpLnd5tke9zC0TgKQ9FH1zKsvkS10bC0zNcE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:44:45.6855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cdd52e-6620-4bcd-b7fc-08dd9235160d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406

Only access the HVM union b_info->u.hvm on HVM guests.  The union
access is not guarded, so this reads and sets the default even on
non-HVM guests.  Usually this doesn't matter as PV and PVH unions are
smaller and zero-initialized, but the zero default will be re-written as
a -1 boolean.  Generally, it could incorrectly set b_info->altp2m
through aliased data.

Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Move comment.
---
 tools/libs/light/libxl_x86.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 0b1c2d3a96..867addfcab 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -814,17 +814,19 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 
-    /*
-     * The config parameter "altp2m" replaces the parameter "altp2mhvm".
-     * For legacy reasons, both parameters are accepted on x86 HVM guests.
-     *
-     * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
-     * Otherwise set altp2m based on the field info->altp2m.
-     */
-    libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
-    if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
-        libxl_defbool_val(b_info->u.hvm.altp2m))
-        b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
+    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
+        /*
+         * The config parameter "altp2m" replaces the parameter "altp2mhvm".
+         * For legacy reasons, both parameters are accepted on x86 HVM guests.
+         *
+         * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
+         * Otherwise set altp2m based on the field info->altp2m.
+         */
+        libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
+        if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
+            libxl_defbool_val(b_info->u.hvm.altp2m))
+            b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
+    }
 
     return 0;
 }
-- 
2.49.0


