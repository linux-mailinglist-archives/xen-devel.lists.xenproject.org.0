Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177EF97A212
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 14:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799460.1209449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAhK-0005nA-Od; Mon, 16 Sep 2024 12:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799460.1209449; Mon, 16 Sep 2024 12:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAhK-0005kh-LM; Mon, 16 Sep 2024 12:19:18 +0000
Received: by outflank-mailman (input) for mailman id 799460;
 Mon, 16 Sep 2024 12:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeT2=QO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqAhJ-0005ka-9C
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 12:19:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e32c1f43-7425-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 14:19:14 +0200 (CEST)
Received: from BN9PR03CA0522.namprd03.prod.outlook.com (2603:10b6:408:131::17)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 12:19:10 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::55) by BN9PR03CA0522.outlook.office365.com
 (2603:10b6:408:131::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Mon, 16 Sep 2024 12:19:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 12:19:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 07:19:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 07:19:09 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 16 Sep 2024 07:19:08 -0500
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
X-Inumbo-ID: e32c1f43-7425-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isdBnKKjbiKtKGdAlD4xpI6eQzHzhCmb/wibgeoUTY7uBEnVYDTs/x+u5DWcxBdd/NvbjyN6zjmOketzQdQxpk3v7Jzm2nU31H6ilZAG1gt9YyeKur0OQ2CSNgDyNqiRzfglEt7AtjNjbym1ML8U5P4ai3wWXeFk64GRa6t5wdfY3WSQIPPxNZ3JTTTT1Dsh48TrTTjsuQsXfahdCkHxIbuJa+06Bm83fCwgcnPKJyUkoRVPKPhTnP3axF8lH9bXPHNTKIRlptkeZ4D8qyEGI9wHIJhEfCfMZL6gMnJmwV2bt4C5F0OMJYRgvgsr8TJ5+VbC6pf6+COm1HXbYjPt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DerKJB4DpMjB60pSbx3jJXl2oQobnHY2AaURhP3AS9E=;
 b=n2YeERWj8HWLONj4S2xsrkAx7iwsoj4v6IuNRtmOjvGyQUzXF/q0wBBh+zTtNhN2DLV2K9SWsWcalLTD0heDaOr3Eg4kclav3V0qg99ap/gPtzQ4H9IvFP4RFK8DIb3HJ9m8h+uk7DN+KT2mh232ZQ4b3c74j00qsLoSzVjeb2uWyT8gVyHu1Z60E5dI0z9TLY3GN7tMuuJcD0j6X0teGa1i0dQv0RN330BB/lZI26wzsX+p1JCAuRq0WeoGNM80k33WhD2Ix4a6plxC2lpJCNlLFYix0TNQKO/7NgYhPKPfCejig1mGBHttxr6Dgu3zNvAYOSD67xY2gV96yNkh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DerKJB4DpMjB60pSbx3jJXl2oQobnHY2AaURhP3AS9E=;
 b=QbjisRRPG0y6NWRCniuJG4PSnIfuCDLSpOGNB6QY16lJb+Kq3VR2ChTQQrqM+zfavnf8H1W9dYi+6Dwnfu02jrIvai7Xf7oHKBSfAldPpq82njO7wGERIKm+uK8JOjwMbjeYWm9Src2xiDFLilodXJAa47NYVGCoDiEnV7rMJwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Date: Mon, 16 Sep 2024 13:18:51 +0100
Message-ID: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b34096-26d1-478f-2b3b-08dcd649c4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+LZEgWA9lw3qkr7Dta3HtcPLMHtv8Ug4RZlL5DlrJEE6vv38KK6SLVXmTivs?=
 =?us-ascii?Q?kt0MH8uZhME/JvhFry6kH/Qqn2BwVBvsvoHewn+l04bpZ0yDuxYqIHjW3Rbu?=
 =?us-ascii?Q?6NZlQGjQuTWGQ1CuXRaSDAAfesS1NEfT2Coqb91dBTcgYF0IMpd+U34zSAP7?=
 =?us-ascii?Q?hE1rljni8oaCMWK9LU4LxXyTjDUvrA31d5hRK1wFXWNPf2BrAWd0MQoFYtrK?=
 =?us-ascii?Q?esAXhjfZVFspqkyaSiHokVvcXaYYBjbtQMSRRb/8Ltx50E8WohlVT+RAv3Be?=
 =?us-ascii?Q?Tnk8IlD050SZbd11DXXbIx0LDzGWHVAP5wtt3TOVR8VA2ubqoWoRnX/IrhvT?=
 =?us-ascii?Q?sTVX1Dqan4vwCV+jDAKgXzuGDfrxcyX/nL8/SqZ4BO5SSOj23LpUwAkmA9oE?=
 =?us-ascii?Q?0aKEeUaEzuMsc5MC2t9IktKtFXYschS0vNSSE1WH2JeB2sSDiQshl4zzRNss?=
 =?us-ascii?Q?oT8XjEqCewp/kjG0Vjg8krYXTsH7YpHqxhB8/6JHnnw7nMWTT6fvp8hNhecY?=
 =?us-ascii?Q?rDF7uKCyXItfOTeNILEDnJ0Y1ScVCDzjNCrnchOCosNqB8EZu1BU+ue9ThO6?=
 =?us-ascii?Q?IuHPRAg/QcTQuP+n9wELCl6hzoT2c5B716saYP6RInd5UmotC9zGUDJ9XOy6?=
 =?us-ascii?Q?2MDzX+JqsQT1Y2pZ/OzVGBrqxzbZADp3NsKk3HaLnQ7qK/fSx0mTITaBexTA?=
 =?us-ascii?Q?4dRx2Xxp+B847MlkDXuRKhRg7UmDZl3o8BKYVbb5tzhwdC210HQwcnYLFxma?=
 =?us-ascii?Q?gYNLINuR2wFgRskGuSYpHXaSRLdZqDqF+lXUm01dC9ON5K5EXMNlkewOrt7s?=
 =?us-ascii?Q?rKkO77U5LJYG4MLxz4MhtyEnlAIeWIIuc8JvI4g8mfU8TSbH35YmsUFF2B2K?=
 =?us-ascii?Q?dp2Jal9a3GOvalaxWdqSehzcDrtr792dHXEkFlNz1bXA3cJFw/uJIAdnUhxq?=
 =?us-ascii?Q?idKf8JwcDfPydyMVepSpBth8D9xatNcdh+kcL+zsf+1KG8WBu04V26PVz0l8?=
 =?us-ascii?Q?HvEmVNLSi1FGv6tw0Tiw2A73SUCMkXfzX8ym+mr2+pJeNGxDFUIWDmn3XIX0?=
 =?us-ascii?Q?WPH/7ZecYNl8AE9XAVouz4ZlFbgYEgFQUUH982G03EgYGuqud+3AYgLE+f3e?=
 =?us-ascii?Q?pU3zRSji5mwEsG5EW+GnNIQmmxHh0xOUlkqOo2j8HrDMX8b93AFRwNmo3O5f?=
 =?us-ascii?Q?b2IEF6HCLv02SLAhTU8g4AnsqNH+dJWP5UAONFpz5VactGnUPS0g7VWSElmO?=
 =?us-ascii?Q?0CIHVJvvj0Z1m1w6eaMuHH8Bbf4e0jabUZRmJpAyqXYak1N6r4Ev8hKxlYKj?=
 =?us-ascii?Q?BIfTTPCpxZh0yIdNf3ZSBSWADpcfi4jSvma7MEQ4q4ZMHGQDIlzTmSH+fzyf?=
 =?us-ascii?Q?u+IC0ScSGow56nrVjk8MBBm8uSp4bU5VN5drHi+Uhh7+w8up4xss2WnECzaU?=
 =?us-ascii?Q?uwxNKIFqXbynXV4YKNur4hkFGoRwkKc3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 12:19:09.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b34096-26d1-478f-2b3b-08dcd649c4ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015

From: Michal Orzel <michal.orzel@amd.com>

AoU are the assumptions that Xen relies on other components (eg platform
platform, domains)
to fulfill its requirements. In our case, platform means a combination
of hardware, firmware and bootloader.

We have defined AoU in the intro.rst and added AoU for the generic
timer.

Also, fixed a requirement to denote that Xen shall **not** expose the
system counter frequency via the "clock-frequency" device tree property.
The reason being the device tree documentation strongly discourages the
use of this peoperty. Further if the "clock-frequency" is exposed, then
it overrides the value programmed in the CNTFRQ_EL0 register.

So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
consequently there is an assumption on the platform to program the
register correctly.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-

v1 - 1. Removed the part of requirement which states that Xen exposes the
frequency of the system timer by reading the "clock-frequency" property.

2. Added a rationale for AoU.

3. Reworded the AoU.

v2 - 1. Reworded the commit message. Added R-b.

 .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
 docs/fusa/reqs/intro.rst                      | 10 ++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
index f2a0cd7fb8..86d84a3c40 100644
--- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -30,7 +30,7 @@ Read system counter frequency
 
 Description:
 Xen shall expose the frequency of the system counter to the domains in
-CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" property.
+CNTFRQ_EL0 register.
 
 Rationale:
 
@@ -116,6 +116,28 @@ Rationale:
 
 Comments:
 
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Assumption of Use on the Platform
+=================================
+
+Expose system timer frequency via register
+------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
+
+Description:
+Underlying platform shall program CNTFRQ_EL0 register with the value of system
+timer frequency.
+
+Rationale:
+Xen reads the CNTFRQ_EL0 register to get the value of system timer frequency.
+While there is a provision to get this value by reading the "clock-frequency"
+dt property [2], the use of this property is strongly discouraged.
+
+Comments:
+
 Covers:
  - `XenProd~emulated_timer~1`
 
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
index 245a219ff2..aa85ff821c 100644
--- a/docs/fusa/reqs/intro.rst
+++ b/docs/fusa/reqs/intro.rst
@@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
 OpenFastTrace parses through the requirements and generates a traceability
 report.
 
+Assumption of Use
+=================
+
+To fulfill one or more design requirements, there may be underlying assumptions
+on one or more components that Xen interacts with directly or indirectly. For
+eg, there may be assumptions on the underlying platform (hardware + firmware +
+bootloader) to set certain registers, etc. The important thing here is that
+anyone who validates these requirements, need to consider the assumption on the
+other components.
+
 The following is the skeleton for a requirement.
 
 Title of the requirement
-- 
2.25.1


