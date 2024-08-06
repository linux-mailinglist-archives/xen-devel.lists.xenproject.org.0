Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71D94959B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772951.1183389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6d-0005wC-G0; Tue, 06 Aug 2024 16:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772951.1183389; Tue, 06 Aug 2024 16:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6d-0005ta-DO; Tue, 06 Aug 2024 16:32:15 +0000
Received: by outflank-mailman (input) for mailman id 772951;
 Tue, 06 Aug 2024 16:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kzDu=PF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sbN6c-0005tQ-GI
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:32:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce4ca88-5411-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 18:32:10 +0200 (CEST)
Received: from SN7PR04CA0091.namprd04.prod.outlook.com (2603:10b6:806:122::6)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 16:32:05 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::f8) by SN7PR04CA0091.outlook.office365.com
 (2603:10b6:806:122::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 16:32:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 16:32:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 11:32:04 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 6 Aug 2024 11:32:03 -0500
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
X-Inumbo-ID: 6ce4ca88-5411-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBLB6b4mFhC5Mz+4dGlup34y0QoZVckgukzX9+lUxe9sfPNrA7IB6rf9jeFS8ok5wt16n0anw3SaBmtqwyyk0yx9/M9mhKbdw78IGq8ho67VxCuN0BtXp3wS8FCTeuLSMG7hPS7Daae9rVl2lONwCjZpwseYfVXU5/3V6tJhohG7OXPMzppvk5hT40B8A1LIABIVpAVXFL7yB5+kH2APTG5IVindY0uI5q5gnqZrdpXejSbFtWX2rXCw5dAj59oLcN6eASD9XYWWBhW1c+KeMRn6XbR7auU5W996m72bRlgZKY7DVhlXPHtaL3xw6dXnM4pTeOqtIKhH2vBryDKZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bb26WuaFZVbtVLb9SlV+3buAosHUSgsuXTVaggE8UA=;
 b=hcbFO3Ap5ZEUKvvAPK5R3f0ITL5E3ufjBL8oeaE67/WWfEA7A8GuiRmStr96Be40fxloHahgNZHcfkuSTLexjHVmN3ZNb7yMyAHm3TvRD8dmCW+W+mmS+IiUG3DpVg/L/L4m0EtZHUb9CAotVxFRdzVtEc4yxB2xNQ7Jn8mPfz6m93ijYGj2cDkV2MRxK6VZE2FGp5aHbkZ6CFVdGa65U65Q9xaBYtTkqZRrWYgjx2wQQZm6XThaudFzQ8xpbiHebIt+UHa/TYR0Rfolsy27clQI0jnE2ehFmeHv7YFzlLe5kvu+4n5vrBTY0iZcZzDdTtbcQIP797k3/WxhnDf5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bb26WuaFZVbtVLb9SlV+3buAosHUSgsuXTVaggE8UA=;
 b=REXePFuqSSv6Pe0gFDNXIT1Zscz5H5pXOPzPz2gUIpwfYwE9Nlcso7bxplaPwaAe/QK6Ao+GHr8YwaZJ7Cr5Q05Tv1zJtTpStTDIVKVehZfO590R+IwG0wX6W1nBd2yJZ00SZwwPQAsKCX/BlRJLNLOTM6WvuQBLNfCqSZqLSFM=
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
Subject: [PATCH v3 0/3] Introduce functional safety related documents
Date: Tue, 6 Aug 2024 17:31:54 +0100
Message-ID: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 43622a85-7e75-4ec3-a15a-08dcb6354ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vh7YITdKp1GUJRfJ6iKWY8ZYdCBe/pB39vmxfveYtdg/b5deyodL7xc+L/kE?=
 =?us-ascii?Q?e6gTXYb8z7FFxSqp/FS55FLdXAmBjY+7QB9ntFuRGvNRRdTP0aNcui76Ex9G?=
 =?us-ascii?Q?3oKXVeDzHH/IHprmzqzXNguW2lSiRkqU5+M3Dpo7n2zrc1h1j2RnTFjoEHJ8?=
 =?us-ascii?Q?YQVQZ0BG2YaIaPcK83IfgDQvjHlITDhuAH2Ow24VlxIdt+ko5ilXHoPQ5yOQ?=
 =?us-ascii?Q?OdsoCQ3hH7xS3CyPdZGdysXjTszJFVWCy+X+BXqVJbx+Kvc2LEEvFGwT8E6V?=
 =?us-ascii?Q?OOfAAD2LSsBU5X9kbo2Wl/2sbbBcbXaH0XWGzz+9GxLBSSFezoAafTTWdAIi?=
 =?us-ascii?Q?QfIY9wcuiyS8GNbx6WzHTroZVdQ1BOuzabLUazWRxK+OxPbwZ13r7jp6hj4x?=
 =?us-ascii?Q?EfY6Lel+S33iThqPsRhaUDpk/5CKThTh4FGDaER2oby444xXmfQYdCnwDOG4?=
 =?us-ascii?Q?OIt5+CdmX9zcoke3W39iBiYOLct53ySLQUY9lDGqGlXeucTv7AOhZCOV5yFT?=
 =?us-ascii?Q?qiHXETzggL84h3OF7wIbnvt/fX51KIYt50XY8G3MZtGF5nNNmByk96fme1/K?=
 =?us-ascii?Q?ox+Tzo0iiF3owAOt6cei2A6wrmM8SYoLEJEBOyyV5EBueQQRvl2TDAsvrQcn?=
 =?us-ascii?Q?m/87h3u2Ci07SoiQWJxtdvC4VLtlfNgZgZsfC4ZPAfdRRUxan47VEs841Gjv?=
 =?us-ascii?Q?qMOzA8dLZ2L+LVrAanP8W/l/xOPm78sp0Zc569V1Dx8niwd1ZPvNIG3d4NlH?=
 =?us-ascii?Q?+UGEcd+NHrBTc7f6hthOOMite3O9YW6ooqKOyodV6UkuQIvP5Kau8vmNd6bf?=
 =?us-ascii?Q?S7iin3Tq4bSl3frS38ZhquVNXmkKgff7mpIGAQV/PoQ6yAeWBkZrYgvP+oo/?=
 =?us-ascii?Q?sa/GfBR8W/G7v3eldZv4rrDVc0guPZS7ftEJMNhJZ1JcLM2LPJ1PekiJnoGu?=
 =?us-ascii?Q?akD6Dz1ewfmLBY9s4eHArRRfyGhCWGVLEE5G8u/JLfAKeA1B1WPvfwhdYi+U?=
 =?us-ascii?Q?85q6O6EjmSAidm0ysum3iIwvCdbWvAZir9wfu9QnxDEeSS95dYIMr5S/vPZJ?=
 =?us-ascii?Q?71oRnXuanOkNhHgjFGXlnIIcYwNo1a07FC3z9HtHCzWFLHO1J641kUZAtBXq?=
 =?us-ascii?Q?Jg2VLWxSoHCq/o07QVOi0ane1HxOj4gSvxK2gkegdbJHpaV7mwFubc5DZSxC?=
 =?us-ascii?Q?3ZUKlWohxiaYUPXLwqn8FSurLsXdDNFElKtEGQjxX0ZMwT8oK8se7QcPKaCh?=
 =?us-ascii?Q?RIG0ljrDV0NdViXzy8VsbxPEbzNno6KfhpdsDvXzHczTHZPyov84rp1o7F9n?=
 =?us-ascii?Q?yinhlIP3fih72zLpT/2j80guM1/sIX4ZuL3iT2fyl+9Uz4WKnKytcKI07eBg?=
 =?us-ascii?Q?zp7/wcDzyw3nHb6wdSaWJXocW+nc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:32:05.0516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43622a85-7e75-4ec3-a15a-08dcb6354ece
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

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

v2 :-
1. Reordered patches 2 and 3.
2. Changes mentioned in individual files.


Ayan Kumar Halder (3):
  docs: Introduce Fusa Requirement and define maintainers
  docs: fusa: reqs: Added a requirements writing style guide
  docs: fusa : reqs: Added a sample of requirements [DO_NOT_MERGE]

 MAINTAINERS                                   |   9 +
 docs/fusa/index.rst                           |   9 +
 docs/fusa/reqs/REQUIREMENTS-STYLE             |  34 +++
 .../reqs/design-reqs/arm64/emulated-uart.rst  | 240 ++++++++++++++++++
 .../reqs/design-reqs/arm64/generic-timer.rst  | 146 +++++++++++
 docs/fusa/reqs/design-reqs/xen-version.rst    | 207 +++++++++++++++
 docs/fusa/reqs/index.rst                      |   9 +
 docs/fusa/reqs/intro.rst                      |  86 +++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  77 ++++++
 docs/fusa/reqs/product-reqs/reqs.rst          |  64 +++++
 10 files changed, 881 insertions(+)
 create mode 100644 docs/fusa/index.rst
 create mode 100644 docs/fusa/reqs/REQUIREMENTS-STYLE
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
 create mode 100644 docs/fusa/reqs/design-reqs/xen-version.rst
 create mode 100644 docs/fusa/reqs/index.rst
 create mode 100644 docs/fusa/reqs/intro.rst
 create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst

-- 
2.25.1


