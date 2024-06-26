Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C364F9175C3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748238.1155841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHdG-00031W-Le; Wed, 26 Jun 2024 01:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748238.1155841; Wed, 26 Jun 2024 01:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHdG-0002yx-In; Wed, 26 Jun 2024 01:39:34 +0000
Received: by outflank-mailman (input) for mailman id 748238;
 Wed, 26 Jun 2024 01:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9lf=N4=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sMHdF-0002yr-Bp
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:39:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee765cd4-335c-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 03:39:31 +0200 (CEST)
Received: from MW4PR03CA0284.namprd03.prod.outlook.com (2603:10b6:303:b5::19)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 01:39:26 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::f9) by MW4PR03CA0284.outlook.office365.com
 (2603:10b6:303:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 01:39:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 01:39:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Jun
 2024 20:39:24 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Jun 2024 20:39:24 -0500
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
X-Inumbo-ID: ee765cd4-335c-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaSDu3jVgMgNO/gwe9ho8we22o0ZUMhlm5pFS6zBd7hgf6R88M8FWrINUUTl2uye1hfpzIUhFct6g8ZHbqgKQ30Fz5pK+qu5eFynJeeZ4CAeMTyJy9E8snkcWEB7GYxDdy861vqXiDWn5kmDX+hWt1/KtB+Y/10X11dq4mN9misfUcreD6gSUgXZiFJAyYuROCu1X4tuOi76qHyB1q9WbOl66Ju2KnsWJjzUmkWXfGBW3V9cnifITeUJq3X9xkOrw7p8ku7g7fNv0Tm83620D3U8PCFfhdA0PjxonRY0tlAi1oxrAIwUdI3jB3O1/i0SIEnD/cnXRXczxX7Qwuedng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uaA7rDWzroIcGQmI5b8PlLH7NpF7Sn3wlDKriPxvc0=;
 b=Qb8ekbc9uqSlIY9UQpu2IkAtXVJ08irob8OSdWxAj8FgJV7766xgZ1pF0o83C6i409FwYDb3SJmLZqlWl6+8/xPNZc+VeAwpHk/+kuDVTRGnlJi6/wogs93LjKOWVU/YQK7N4kNdANTxi1TwFxg1MAzeSjk2So3F+dIr0ae3s9zX2URrSbn1xgXTgBW4agxmS3rZUVGtCMb+f5AYqq44jZHyyLRcfCRAQCnMGbPyeOBp3FjF3AntONZLVye2s2H0V3u6jj7M1obcKfuCIAGxWlj11uYkBzDcWG9HwMaAYCFUVkeFklUnDyT3svFHrO5xutsjtq9wl5+q9XvqYepz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uaA7rDWzroIcGQmI5b8PlLH7NpF7Sn3wlDKriPxvc0=;
 b=K/c84thm4moAQ+QFroNMjrcIb5whbSVPCTwuDUrQEdfaYz4Jry0JWQKu0kirWfLog1Po749UeuIlo/DOcqdsmvEdTWuAp752DQUBmIx2anws7fKdoGQ7fkzhMVdAaNa1rwOQ8SJ6SkzB6miB44yY1HZaK5tD68LWH3tyTmA41GY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <sstabellini@kernel.org>,
	<andrew.cooper3@citrix.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<bertrand.marquis@arm.com>, <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v3] docs/misra: rules for mass adoption
Date: Tue, 25 Jun 2024 18:39:22 -0700
Message-ID: <20240626013922.92089-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 822fe646-3b7e-4ff8-0b0e-08dc9580d010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|376012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKYr6GK1VtTcIuBbjeXAZBWJIKLe4TnR26xnep2fffKQUoOSLbS8TjLYb3D1?=
 =?us-ascii?Q?//nSp1nZ3RXbAvY5PL4ywahloDbGBKinYUm92fAWxfdT+wMhBzfk+T2N9G7g?=
 =?us-ascii?Q?pEZ5Pdo/IO1HJDRkH3mExjg7R6r3PVkyrB6yXPkA4mp4qhiNPPEKSBaqyhW7?=
 =?us-ascii?Q?gIY9pWJgoCNxCEtZ7chwDxPDQqwE8djitektyI/O9u8OM4MsqRcEWXapwt+1?=
 =?us-ascii?Q?HhvYo0jhZzDFvJmPRUbsrSWEdBmAPk9vj+z1+BAiBztdVvfUQb0rdXzT8H5e?=
 =?us-ascii?Q?8n8bINsuwg86TXLVK5cFyirMR7CA1PVlD7BZdN4hTwD36CAr4iL6zpufriYs?=
 =?us-ascii?Q?c63KIoCOfJwD/7y5ozQb3U0GeFZ8NrU19aO1+7ynPWN7H5QVczmbki6ZsBnp?=
 =?us-ascii?Q?n4Ntp4RghGG4YOIvpE0CMNFZ3nV5OJJvZ4/JhGxTIq3PKcHtHV4vMlIQnvH2?=
 =?us-ascii?Q?ReJez1Z+nAwrz/nlF+Y6CL8IkJpjwCZYnSy2AG4UDO4xM/wy5zTvfVWvMPsk?=
 =?us-ascii?Q?lP5gCZMpAKhK3U7shLdXa8LSpbWTjdr8gIeMlBmSEZ4FfxAZW2YIVh6Nf42P?=
 =?us-ascii?Q?5LrvAdv3810VocrRuxJBy7kZXe8AK/aa+87i+mfyHNak33d8Vv/w1SfVKgBb?=
 =?us-ascii?Q?5t9mky9USYbBmB47Dq38QuUom0JneY8lPQYlEbkmWrBAKdCg2El5SgMzHppB?=
 =?us-ascii?Q?XzlwiCcoThi90w5eZJysthF5QB/Kk5DsXrfW347/lhszDJlBD7RdRMRZ/FN+?=
 =?us-ascii?Q?Z/tFChMVhsJg5Eh5glgEUNVDis2go9OhM70IPD4kUHNm8dem8ZUUH3QCy672?=
 =?us-ascii?Q?u9pbN0IV4U/U3lLriHdewACF92OdgXmsYmLAm2P1fO8tLYFKh0W7V9yOMWv0?=
 =?us-ascii?Q?YALb0Ud3wLaArmfdt4VUySjDkCS9vAAHJHQBQiajVH7QTwgPcpL4Z401QiAS?=
 =?us-ascii?Q?izUidlLuw5MuMiOQAph/P79zV6rz+9ExE5UnkbpxCXFcDXfQAgnPHA6mY17G?=
 =?us-ascii?Q?mpe1bBlO4/0M039THqPZ0/+OcCz7foXBlvIq+PwjqAwxKxbZeauEbHPFdY2+?=
 =?us-ascii?Q?HNnuA/eToz8KlcbgLXVSNwdSuyoSNxDo474Y3x+Uv3LmoBW12c92kPiOpubx?=
 =?us-ascii?Q?6Yat7f9s5Uz140aI3MyHI1WeNtCnMfoFSUIZ7hRR0JC0XTQOTYb8uYca/KpT?=
 =?us-ascii?Q?lGnrNHpEetj8hWboEjX8iAZgxYIYShmbp6W583xtDYum1FbAM3+z5pogjFhG?=
 =?us-ascii?Q?Fp+0kZQ+QVvw9RCGPWm4d/yEKF8A8ellhSn+n1uTvZfLHEOjZsHB2CR5x4dc?=
 =?us-ascii?Q?fqftRe/NGLPL6yj6F7WXaRcJoPBgJLx50JaduaQHQeVfYQYWzO8g9KPow2mf?=
 =?us-ascii?Q?/FAU04I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 01:39:25.7426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 822fe646-3b7e-4ff8-0b0e-08dc9580d010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

From: Stefano Stabellini <sstabellini@kernel.org>

This patch adds a bunch of rules to rules.rst that are uncontroversial
and have zero violations in Xen. As such, they have been approved for
adoption.

All the ones that regard the standard library have the link to the
existing footnote in the notes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- add 21.11

Changes in v2:
- replicate the Xen doesn't provide a stdlib message for 22.8, 22.9, 22.10
- remove stray empty bullet for 22.1
---
 docs/misra/rules.rst | 104 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..2e11566e20 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -580,6 +580,11 @@ maintainers if you want to suggest a change.
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
      -
 
+   * - `Rule 18.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_08.c>`_
+     - Required
+     - Variable-length array types shall not be used
+     -
+
    * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_19_01.c>`_
      - Mandatory
      - An object shall not be assigned or copied to an overlapping
@@ -589,11 +594,29 @@ maintainers if you want to suggest a change.
        instances where Eclair is unable to verify that the code is valid
        in regard to Rule 19.1. Caution reports are not violations.
 
+   * - `Rule 20.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_02.c>`_
+     - Required
+     - The ', " or \ characters and the /* or // character sequences
+       shall not occur in a header file name
+     -
+
+   * - `Rule 20.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_03.c>`_
+     - Required
+     - The #include directive shall be followed by either a <filename>
+       or "filename" sequence
+     -
+
    * - `Rule 20.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_04.c>`_
      - Required
      - A macro shall not be defined with the same name as a keyword
      -
 
+   * - `Rule 20.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_06.c>`_
+     - Required
+     - Tokens that look like a preprocessing directive shall not occur
+       within a macro argument
+     -
+
    * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
      - Required
      - Expressions resulting from the expansion of macro parameters
@@ -609,6 +632,12 @@ maintainers if you want to suggest a change.
        evaluation
      -
 
+   * - `Rule 20.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_11.c>`_
+     - Required
+     - A macro parameter immediately following a # operator shall not
+       immediately be followed by a ## operator
+     -
+
    * - `Rule 20.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
      - Required
      - A macro parameter used as an operand to the # or ## operators,
@@ -651,11 +680,39 @@ maintainers if you want to suggest a change.
        declared
      - See comment for Rule 21.1
 
+   * - `Rule 21.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_03.c>`_
+     - Required
+     - The memory allocation and deallocation functions of <stdlib.h>
+       shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_04.c>`_
+     - Required
+     - The standard header file <setjmp.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_05.c>`_
+     - Required
+     - The standard header file <signal.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
      - Required
      - The Standard Library input/output routines shall not be used
      - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
 
+   * - `Rule 21.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_07.c>`_
+     - Required
+     - The Standard Library functions atof, atoi, atol and atoll of
+       <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_08.c>`_
+     - Required
+     - The Standard Library functions abort, exit and system of
+       <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
      - Required
      - The library functions bsearch and qsort of <stdlib.h> shall not be used
@@ -666,6 +723,16 @@ maintainers if you want to suggest a change.
      - The Standard Library time and date routines shall not be used
      - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
 
+   * - `Rule 21.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_11.c>`_
+     - Required
+     - The standard header file <tgmath.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_12.c>`_
+     - Advisory
+     - The exception handling features of <fenv.h> should not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
      - Mandatory
      - Any value passed to a function in <ctype.h> shall be representable as an
@@ -725,12 +792,24 @@ maintainers if you want to suggest a change.
      - The Standard Library function system of <stdlib.h> shall not be used
      -
 
+   * - `Rule 22.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_01.c>`_
+     - Required
+     - All resources obtained dynamically by means of Standard Library
+       functions shall be explicitly released
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_02.c>`_
      - Mandatory
      - A block of memory shall only be freed if it was allocated by means of a
        Standard Library function
      -
 
+   * - `Rule 22.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_03.c>`_
+     - Required
+     - The same file shall not be open for read and write access at the
+       same time on different streams 
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 22.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_04.c>`_
      - Mandatory
      - There shall be no attempt to write to a stream which has been opened as
@@ -748,6 +827,31 @@ maintainers if you want to suggest a change.
        stream has been closed
      -
 
+   * - `Rule 22.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_07.c>`_
+     - Required
+     - The macro EOF shall only be compared with the unmodified return
+       value from any Standard Library function capable of returning EOF
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 22.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_08.c>`_
+     - Required
+     - The value of errno shall be set to zero prior to a call to an
+       errno-setting-function
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 22.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_09.c>`_
+     - Required
+     - The value of errno shall be tested against zero after calling an
+       errno-setting-function
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 22.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_10.c>`_
+     - Required
+     - The value of errno shall only be tested when the last function to
+       be called was an errno-setting-function
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+
 Terms & Definitions
 -------------------
 
-- 
2.25.1


