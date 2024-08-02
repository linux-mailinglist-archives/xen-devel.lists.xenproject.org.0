Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A0945B59
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770845.1181439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZorm-0008H0-Kp; Fri, 02 Aug 2024 09:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770845.1181439; Fri, 02 Aug 2024 09:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZorm-0008FU-Gj; Fri, 02 Aug 2024 09:46:30 +0000
Received: by outflank-mailman (input) for mailman id 770845;
 Fri, 02 Aug 2024 09:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZorl-00083o-2y
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:46:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1591fb04-50b4-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:46:27 +0200 (CEST)
Received: from SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 09:46:22 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::a9) by SJ0PR03CA0219.outlook.office365.com
 (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 09:46:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 09:46:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 04:46:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 04:46:19 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 04:46:18 -0500
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
X-Inumbo-ID: 1591fb04-50b4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWxpjV88gapLYVANCSieKzHsC+sRccOcqczRdTK2RfTSrh8tKuCkNDpPIzoDgh0WFQ7xWDP2e+LQF6//p/i31N19q5MOuLOQgOV3SAkjSOIpaj7ZRWVGOib6QkYnGoO0K/frdXz5+p2QgD9e2AsWuh73JgGwpxzCMoQoMgqrdEL28oWwEMOy+rmPHpltwr1DD9vdjIOGVgjJwkqiIGtlq1on38Z2i6+RKHS7MW8RPNYnvcXLju63ORi1vgrYvyuRywiyibsyq+uQEHMJwCpP7ukjqLLKxebCAqtaemixWeTydt3vvk9nRgENf6+SP/7zzvoZQulb6UkJly02W5MtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHQpMccu1yV6wAzWmUCoAEh7UVBNVQqXn3aoswC3wJg=;
 b=npvEqwAHk89VarIOOWHOccUJU98yOHD3epaxwmTnfAezndajSemUWvVdR0DcyAA8KgqpvC7SdhphSDxcyjeMpTpY5+Q9HhMhJneU8iXXLT+X3aodTRQZu/m3EKJR4BOR9p9k5sn26y8G/P1OTnO1l5c4wvD5iR4hhF64y4qiA5C7TkuAUlPlyQ3QwaJKgb1HrtD00bOadymsHdXnWWp5q8rjTs8qB2pxDwrUJDQlxCnNfbV1G/HSlboFq5o03vyAIhM2wLWij6oU1rQKSod/MESJ7s4aiwk0tZliMzTK/YN8VMVnQqWyw1shJZZPteLKuuoKG9uvehtaM9TnvDivvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHQpMccu1yV6wAzWmUCoAEh7UVBNVQqXn3aoswC3wJg=;
 b=Ipj6eWhabw/C2BO72LfHzYdjMWl+rJUzCkBd375LwtkRRy/2vmWW3Em6w3yYD0qHYnivvMrjjsHeTtTorJB6yBvHd89wtZCmHFcw7XgITmKhjzcRxWntJLQeQSq0775X/XP8kCDk5Az5zY8EDzGA3MZyB02iyOP8ujR2RM+jN/o=
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
Subject: [PATCH v2 0/3] Introduce functional safety related documents
Date: Fri, 2 Aug 2024 10:46:11 +0100
Message-ID: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 85653052-0ff8-417b-4a88-08dcb2d7f7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CN4LGdD4G6Omr2nbybuUnbo/KNL+2NMtMKumbpjKNIkuUuVtMEfWR2xIZrMm?=
 =?us-ascii?Q?DsLemrW0QhONwCBHARUiA0BEg+gvAF7c7zP6gd6z4bkeafJXHnItPSxe+p8Y?=
 =?us-ascii?Q?xhlGpE3CdntkJK+ad3USx/8z9ap5mEce6f05khbZ42TAblL9np11z6WTChXK?=
 =?us-ascii?Q?gYCmsgnptxf/waSRBeWiqCvKpsJxlAx17fK65VUSpuu6fyqlJlCN7iU37VdG?=
 =?us-ascii?Q?wbVhwOzGwPB77MaVRKAcPf9JqW554CBuM4rldnnWrkgOECKdRzDfAT8aMrZC?=
 =?us-ascii?Q?aayPM7XcMq9W5+vH9cPdfdYbSPTJeckkTlOfyh3zzA3wKS0K23D9v9zlBgG3?=
 =?us-ascii?Q?0jibjRC6sLlAwZqHjm5ixOnL8A7lorsiZjDPmAp5NLQaF4DxcTENk6NO+3Rv?=
 =?us-ascii?Q?FtD18VesaDfgpOYHjKQ9tKBzwnY4T9pitlmen0aJOe+Kh2bZnINQud0ZgZnI?=
 =?us-ascii?Q?QkcJg22EGRx70GOxpGW/tNuzqkazKffs80YlzGNolu1AM+oZt9xeOGB1rEdY?=
 =?us-ascii?Q?V43GOK1KYX2mBa1FT2RmL9Z+dUHcFCKwnchElzRIimzIRNEYaWemb1UU1+JE?=
 =?us-ascii?Q?jsqRW2wqtvLPa3xNbBeAzRIfYgLijjCMveu/Ig6Rmgz7bmHbHMos9NTCicKS?=
 =?us-ascii?Q?a6LHcnkgsNhXJIvDVe4a3EOZ4lW+AYq7LYTYc6+F+7DGQqn4SaRxGme0JYOa?=
 =?us-ascii?Q?t9R6wsTWfMzIlznwhdrqmMucmQnp4lrxzD5WhsoR2XYJzEghgDIGrV+Ex1Ar?=
 =?us-ascii?Q?ikgDvfGzYzpZy8hNwg9eGSJOcjsMGj+hJF8ZdI/nPz9vFnDmeyKUby3Rxakn?=
 =?us-ascii?Q?vDtDhUtU9aG6vd41l36fIuMFvG8EMJraXjOKiQL9PzkvucPGajM7gb7zIeTx?=
 =?us-ascii?Q?uFIGw0+PfyDdr6TGyf7hrIau1Lsz8RslsQLnbZchh3vbuso4LuHzu7VdV1Kx?=
 =?us-ascii?Q?0XsTiLLsxLzrA/lfOOk+F1vjBHhoRDjk4K6q/hl961OnEm7C/HveLmk0Xzhz?=
 =?us-ascii?Q?W7BCAuek860ZQMts52fnhmTvzSAtOEGbQZkAPGYP1/oibUl7QMtpAMuLb6PU?=
 =?us-ascii?Q?uKom7jFTti/YWRyu/OeHSDltnGTizGMMbscAOZvlC2RDctaeZ/7z+rvfGDgK?=
 =?us-ascii?Q?+XppbgiKImsmmpcaTt+Lx7Z4WxsZwDRgXbga6JCuo5QfUQGOKY8xgg8j1pS2?=
 =?us-ascii?Q?t/Am5HcGAnTzWoQFx3uwLEORuFkUIvrtNSnUWoq0aQ1rblC3O6uqUsXveHkK?=
 =?us-ascii?Q?dBaruxKIVHvPYCmQWxWNDPJtN4a4kmaeN2a+in0MHieiMTptvfCOGtwwkojc?=
 =?us-ascii?Q?3cL+fdwW3OhR6lMmNpHo44X/bNa0QJq7dLXYoWanelZf+VsDHerEgwx2pes5?=
 =?us-ascii?Q?m+WVOTogCAOTKKZgC9w3qyUH2cwT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:46:22.0390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85653052-0ff8-417b-4a88-08dcb2d7f7b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356

Hi,

In the Xen summit, we presented an update on Xen Functional Safety. For
details, please refer to 
https://youtu.be/eFRTHSGDMfQ?si=sYOdYfDI7qsgkcjE  ("Xen Functional
Safety - an Update - Ayan Kumar Halder & Michal Orzel, AMD")
 
We wish to start with upstreaming the requirements.

This patches illustrate how we are writing the requirements and provides
some examples.
The support level is experimental and it will be maintained on a best
effort basis.

Changes from v1 :-
1. Added "docs: fusa: reqs: Added a requirements writing style guide" in this
patch serie.

Ayan Kumar Halder (3):
  docs: Introduce Fusa Requirement and define maintainers
  docs: fusa : reqs: Added a sample of requirements [DO_NOT_MERGE]
  docs: fusa: reqs: Added a requirements writing style guide

 MAINTAINERS                                   |   9 +
 docs/fusa/reqs/README.md                      |  78 ++++++
 docs/fusa/reqs/REQUIREMENTS-STYLE             |  34 +++
 .../reqs/design-reqs/arm64/emulated-uart.rst  | 240 ++++++++++++++++++
 .../reqs/design-reqs/arm64/generic-timer.rst  | 146 +++++++++++
 docs/fusa/reqs/design-reqs/xen-version.rst    | 207 +++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  77 ++++++
 docs/fusa/reqs/product-reqs/reqs.rst          |  64 +++++
 8 files changed, 855 insertions(+)
 create mode 100644 docs/fusa/reqs/README.md
 create mode 100644 docs/fusa/reqs/REQUIREMENTS-STYLE
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
 create mode 100644 docs/fusa/reqs/design-reqs/xen-version.rst
 create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst

-- 
2.25.1


