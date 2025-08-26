Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C8B35087
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 02:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093758.1449163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyH-0000kU-7F; Tue, 26 Aug 2025 00:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093758.1449163; Tue, 26 Aug 2025 00:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyH-0000hK-0r; Tue, 26 Aug 2025 00:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1093758;
 Tue, 26 Aug 2025 00:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uqhyF-0000gy-0I
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 00:55:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58f85198-8217-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 02:55:25 +0200 (CEST)
Received: from CH2PR05CA0043.namprd05.prod.outlook.com (2603:10b6:610:38::20)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 00:55:21 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::91) by CH2PR05CA0043.outlook.office365.com
 (2603:10b6:610:38::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 00:55:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 00:55:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 19:55:19 -0500
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
X-Inumbo-ID: 58f85198-8217-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5Uo5202k/fGARldPK1j/edqp2lO1XQLiJppMfsh0Xx1iXQcD/5AyEhYP917n4xKDRXtgjKRujq5rrTNqV3wsp4f1PlkK3BW10M0mPq5yEwxR3ISwu0U2ZHOid/sbn6lDai0voTYiXQRBhhcuWYi8LD7eMZvSqvPn6EzIcJOKUMXTSpwO0nAs38k9iwQzx84obHtO7SvEPRuTvJRlM4ATFnrxNgL2akKRWOoMejdHWBQrY6xn/l6eKPBd/sNChf+baOal7fSk+3E1XSwzsJWamaHr1qifnYFymCpoGzOBrIjMs5dcyQ8iEbCfJ3LXEKugdMhmEGvU8wzqogWjuoq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMrZfLwjbfhI3aWmscLOLpXst3rpqtydGi3dGVmj0C0=;
 b=n9y61cLqP6rmvK/FMaq/xphMPkR41H7EQoedS3lVjxZtKr0GBa8/4Ygp6i9Y3ENTvbxIZL8VV0mWVtvhN+gwPuOgj3Ig7VueDktpqk0xzzhhL7QPobraAWTIIMheNqglIEyNCOtieCEF8lGRQJYZTIyLGj+6EYNBdwN7NivqDj6aIyq5ZvALdAwLehskb+FwXlBTrDqBkk7jPKi9v4Dk2VB5blyatrjfF/OItR7p+XKOwzOJP5+p+tp/TMu6wTgnl1TrUZvAxDIf5YJBaddYtBRMu98XvtGQczY9cACeTd/P3bjcsSPj+P/Take+FSvTarO1onK+CNB4HruyK1RG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMrZfLwjbfhI3aWmscLOLpXst3rpqtydGi3dGVmj0C0=;
 b=NCVvLWutsKI97VE5EzTHZPytl6d7I/zieCyi2onT7fduaB0Y3ltau1clV6NmfOb3R8nBum22t50Gh09ZpRCs3PubfrHgZQEnz1GByFak+CdN8V5lSU7w1wBo3iNvDbaunSzDJSDCLTuoZMbUXLjcs1yIy1AT+tLr4PHDqn8aAyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] xen/events: Fix Global and Domain VIRQ tracking
Date: Mon, 25 Aug 2025 20:55:12 -0400
Message-ID: <20250826005517.41547-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aad6dd8-9834-4a60-a024-08dde43b3b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZcdB3z6dhWDlBhdWJgcFO5CSCaEIzfLMlO1c8yRlep4eJEaM27YF+N/QuP4k?=
 =?us-ascii?Q?8ilV2v7Gq6PKzoVpvL9ZKIeMS5CZDvwWPVNfZAG7V4ndIezZIsc4c/4eXbLe?=
 =?us-ascii?Q?ElotbD7SfK8tQ6PHeoeD82mhfut01tXEUB6T2axWvVjOqiDa21kGhhJTR7uD?=
 =?us-ascii?Q?iFrXkQDbH0TdZcxRvYXOoYLWZ323cVHusK0owSCH+Nt1DlIAnbq00fede92c?=
 =?us-ascii?Q?HcqZ0JqEi2HW4tfmnlg73aff9Rjr0ugPAKM9SNpVFx83vvmbrG2eQ/7RSlbo?=
 =?us-ascii?Q?SH6AMfG5l5kz5uLKAPcFGGRcB0LrpixdzRfo373oFwMKODxOXqlimoawY0km?=
 =?us-ascii?Q?m9puWwD/FZ4aUS1VrXrdgljCrO+q5FtVcM56hXOY8ekkOhzsjZxoxWhNzHyG?=
 =?us-ascii?Q?LMhDt7431oG16NubCXGRFAV+sP1Y16iKPCP/o5BS7QgLIQ8T2ybBQINuRQT3?=
 =?us-ascii?Q?4XXP9nizCse3fpdxEYECsPKZZ/HMSBg+VXnwzep/RUCuC48jUI/abJDskk/B?=
 =?us-ascii?Q?kzewuQECgmsSLXp6bWd7XEnXbquodE19nKzYYe7H3gv9In1cAX1c2HWGo5o2?=
 =?us-ascii?Q?BA0tHxb+TfKUniu5/e11FQ2BXxlAKFVhc3n1K2OLpSLcZq4rvXGWFYm9xPgr?=
 =?us-ascii?Q?eIVzvdi49CTl0jDAFKjCFH9FRP9HiMLMYEqzpn4SAYQndGlRsNS1iPZEbN+8?=
 =?us-ascii?Q?/338EFmSmDAQoOLqVR8J8Snp+hT/bKCU8/VMUw91jUiC1h1Cfc1DBlDPd1+P?=
 =?us-ascii?Q?A9NRxmGZkl9EdwHknXBjxUJcBlYNzhYgHSyNCY9cvop31keyzK9IwXhJzyYL?=
 =?us-ascii?Q?EJrcSoBvgGrmFh2gjSgBq6JKUB9JuHYkB18KBe0947PSRf3Bz3c+qsW7truj?=
 =?us-ascii?Q?6f36AFgAcmQC+ao2DrN7LJy78O4kKqgLxkqMwCWAJkNI2F+CS/XHV6mnd15D?=
 =?us-ascii?Q?bjrFtb/PP7HYTTkfsiqIsb+Sb/AhxhwJe8bwGNF5t/e4JKZHZOpVcxb+7Vb8?=
 =?us-ascii?Q?cTwzDEULb2QITFkW2tt8Y2q/Hngx0wJ1R3kqsS7RTrD+mhKQoIN6pJD/Z6zN?=
 =?us-ascii?Q?CjdZerwMD9A6CuopPfYfSMxRQZjtx0f7LBEP+uOLF/dxnW8Hv/Ty5YPYjRDA?=
 =?us-ascii?Q?nfR/SCYQNhBC2kV8rAbyE3c/hx5qEVO0HdG0MaPmNO4XKDKuWRYJdjzlt/Gf?=
 =?us-ascii?Q?HnAW1Za4b9LllfrJR5aISNKrCnZrjxy4teRx90eBwLphT7t0rjHzB//DBz53?=
 =?us-ascii?Q?YqCmKCuIP6Ye3LDkjtQbq5MqO1IWhavzefDvuvmHIzApFCgyaZR53cKc7It9?=
 =?us-ascii?Q?JBV/faKoG1n/RMc+WJ8pz92zfF1sDAzhyVx1VqhcPmR3XZ8kYyIhE15xcV/F?=
 =?us-ascii?Q?fEIGJPQDfnPr/vzBCLJ3w/BEl83XOqAMkPRFjPUstA34TGwwXe1r+TSUmv2q?=
 =?us-ascii?Q?AbLQU/P2CiQBHlvrWYjEo/6g8nxu5RYXlc1Hmw26j3/9omKx9R2/+XLdMWSm?=
 =?us-ascii?Q?JmADNkRfSP5rzocDTTWqAzo5nYT7/UMsTpOw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:55:20.7097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aad6dd8-9834-4a60-a024-08dde43b3b6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626

v2 is now a series first changing find_virq() to return -EEXIST in some
cases, and then tracking cpu movement of VIRQs.  This keeps ensures the
cpu is correct when calling unbind_from_irq().

Jason Andryuk (3):
  xen/events: Cleanup find_virq() return codes
  xen/events: Return -EEXIST for bound VIRQs
  xen/events: Update virq_to_irq on migration

 drivers/xen/events/events_base.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
2.50.1


