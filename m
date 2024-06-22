Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221791311E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 02:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745698.1152855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKoOp-0001Xc-Qm; Sat, 22 Jun 2024 00:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745698.1152855; Sat, 22 Jun 2024 00:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKoOp-0001Vz-O2; Sat, 22 Jun 2024 00:14:35 +0000
Received: by outflank-mailman (input) for mailman id 745698;
 Sat, 22 Jun 2024 00:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/K8=NY=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sKoOo-0001Vr-JZ
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2024 00:14:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b243f1-302c-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 02:14:31 +0200 (CEST)
Received: from PH8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:510:2d2::9)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Sat, 22 Jun
 2024 00:14:27 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::7c) by PH8PR15CA0024.outlook.office365.com
 (2603:10b6:510:2d2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Sat, 22 Jun 2024 00:14:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sat, 22 Jun 2024 00:14:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Jun
 2024 19:14:24 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 21 Jun 2024 19:14:23 -0500
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
X-Inumbo-ID: 65b243f1-302c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT6a+CuTBJXei+tT/ct46Rhgd7mUgIJ4dg78/Iua/RDmMus/0o1YXwhCAy7LdtCT1TLMWg57qak9SmIB8dpIUpLeWzFTtzNd299NVCeYcJhedJ/4Te+lVFobgfd4c5tA9trHLt3lZNNHQO0iHqs2MijEcT/6ZsP1o8eIl2MqimE54XJFKTD2RJGMMWGKguE9qaYF1y5+KZAf50RZGrRFOMQK+lyQwsEYEY48xOikBpR3tPrzb+3B31j64ACfEjpjhQXcLKvsFkcXIwekpwsWgIW9jZtTsQyr1sZVmXBbPywBgWhAJLS3Ka/op2ZowTErUf7ybSHIfRFOSw7kgMfQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj4Slr3V2fdHolN+j+c/+W5Lbdyo17aak37rymkcfgA=;
 b=MUkYAP+O1NHWJxrVNwg/ddK8y3H1C1CWYfkg80178YvAPOv29H4Tx/ko6mhQHeZomiqaXpcdEHVN06Ve8mXY6pd/rbrPZqsfO8gSoYGBbksYiPov3V2/Cn/M80Hka5K+6fwrUz96psAXrFdiyg7FnoGEVyJGDFkFNuCQVgUHCQpe3n2waRDIfyyBuXHf1NKuT6Pflc2qbAZU/bVTK/7ypsRf2mn5WrB4hMOoklquJ61dgGEbOgrb0ntKzR2h/UybD/kk6f24AnrgdeXFLcMcVo37kl/L1Z2Lum4Zf8FY5/Jcf1rFJek9xyFrwRTalztRkM9y5RAS9qYQCik6GYmVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj4Slr3V2fdHolN+j+c/+W5Lbdyo17aak37rymkcfgA=;
 b=2uUP5fZ/9K+3sjfx123GEnFb0xWj+CcjV1TokkDoqzhl3wU7q0pmAHmcIg1MWsOU8Ww36r7xQ0VtF5ZFSaV8ymPyiXiG6hn/fty8E8bmd5LOtqmUKBF2pw+wTKV6HhIuB8ZkSdZIW9bucJPkrl8Ms/StrHzmjH9JCtLsvhFkF6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <sstabellini@kernel.org>,
	<andrew.cooper3@citrix.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<bertrand.marquis@arm.com>, <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: rules for mass adoption
Date: Fri, 21 Jun 2024 17:14:22 -0700
Message-ID: <20240622001422.3852207-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8de61b-770d-4d36-dc56-08dc92504635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|36860700010|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y8YPdVfcTEwjHHvnryncb46idKUksHCtKNya/7pJCcy5CFryPdZf3bOcEgyV?=
 =?us-ascii?Q?liqtVwG2MIdkY89iOBq2Y1QRgk5FK2lrQMyasG+Ov6GlRyNf2fBqXPYqn6bb?=
 =?us-ascii?Q?YSRc4sMneU9p471Qd2TXkeXHk4wwzpeUFWzOu7pPR40PT7yvtE95dy08DXKo?=
 =?us-ascii?Q?uwoBxSPR8jtXbt/PiQueCzHln4/UL88LoJ3j/NlZbihoj/xMiXOHqBYujwR/?=
 =?us-ascii?Q?fZ1KS6Yk8/eNTl7UEMiaUwyZqeDVI4zA3HAJ8dGAsTgNGnlWDq4Nj6NrSuk5?=
 =?us-ascii?Q?YiJjYb1evNK9FUfpt5rAsfbxnqq34OdpYkaRcbkhiLWwAgfzZcHalq31Jnk0?=
 =?us-ascii?Q?VODUUyEte9pVLVHkkOS4Bf8EoaxMiIg+H/SNo07HArVF0Tx1XJqk8ugPCeF+?=
 =?us-ascii?Q?chuJyrQbfrJZToHFmelgGPIpk3Kds55L2lX6SUKDGrFLSmlGYJK3/QNwt1yn?=
 =?us-ascii?Q?ZjMneYszZe5STak0zlJU1hQpoGfNIUo2CH5y/47aKOe3DaNLJdRzAld115j0?=
 =?us-ascii?Q?KjiiFk/tMAVeJ9UPxuUrHqvTOPo8hmiHETNSkdz0tei2SrZgYDKSBsWzh860?=
 =?us-ascii?Q?fdm6w8g9AaJttCuPc+rUgJuZvPGrZcc8ct3vADYrhJHTOtz+WCDoqjDy71Az?=
 =?us-ascii?Q?sziX9V3t0ODDHLUfiR2F1q4YC0VhZX1JMXh9iwRbITY4HiaFtFgfKzrT1v8I?=
 =?us-ascii?Q?2MFiXN9hU2vd1Zdxi09bt6BLijoWWDb7RypV8vj/f8WLD93m3qSBzedRWuX7?=
 =?us-ascii?Q?i4ggUQ8CdWS398hPz0SlORI2+rKw85Gny20vrL+10PDRewBkoQjRztq5sEU9?=
 =?us-ascii?Q?6MVx+48WhI2bG40KPmpWlz7LJMYqPwcdTLXHv1yCR8a+HfWCWT47M0YUxOsy?=
 =?us-ascii?Q?LTYKvViQjn0pXDMRheRmVAIVLv1P9bDGjEF4EBkUd1UXh0+kzbEAFFro8LT1?=
 =?us-ascii?Q?wxOvWUXdX30ye9cJ8qERii7t3an376xhYqPEB/pYXkFPnJ8tvTImkxv3zkCb?=
 =?us-ascii?Q?o2Ih4AT1ENw964dYg2ED096P8Kb1RNgNPK4A0juFW72OWrYsmozHQAMgNn7L?=
 =?us-ascii?Q?3fHfcGTocGYvRB3bfc3miD3i8JdRPnH9JaJVpG3bGvk6Trb9y+TXoS5vTn9f?=
 =?us-ascii?Q?wItc+HQs9nZQmzmcVhTg893Bxk7A48vN0BEWwDMRjn3iMjupJcJAaRD1DM08?=
 =?us-ascii?Q?qjyE/Nzuw4vWX33Pcfyf0HghYMevEI3pKW1J9+/YRIl/HOBO1w9+2+pY/qQZ?=
 =?us-ascii?Q?9hkhSTe8xgOpMRe7okQWMTtOUIiC74DXgCqGd+pBSDWTYK4FTqjNY8Mi1Cwz?=
 =?us-ascii?Q?5xcsWjRqoYoiezFdOaw1BQG45WqcVQS9cIte4YlyBAzxWNOLx9MoNTooOfPP?=
 =?us-ascii?Q?ZgTFUD8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 00:14:25.1491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8de61b-770d-4d36-dc56-08dc92504635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603

From: Stefano Stabellini <sstabellini@kernel.org>

This patch adds a bunch of rules to rules.rst that are uncontroversial
and have zero violations in Xen. As such, they have been approved for
adoption.

All the ones that regard the standard library have the link to the
existing footnote in the notes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- replicate the Xen doesn't provide a stdlib message for 22.8, 22.9, 22.10
- remove stray empty bullet for 22.1
---
 docs/misra/rules.rst | 99 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..6158bad31c 100644
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
@@ -666,6 +723,11 @@ maintainers if you want to suggest a change.
      - The Standard Library time and date routines shall not be used
      - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
 
+   * - `Rule 21.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_12.c>`_
+     - Advisory
+     - The exception handling features of <fenv.h> should not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
      - Mandatory
      - Any value passed to a function in <ctype.h> shall be representable as an
@@ -725,12 +787,24 @@ maintainers if you want to suggest a change.
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
@@ -748,6 +822,31 @@ maintainers if you want to suggest a change.
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


