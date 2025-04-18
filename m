Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3EFA93F4C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959414.1351787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suS-00052T-Sk; Fri, 18 Apr 2025 21:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959414.1351787; Fri, 18 Apr 2025 21:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suS-00050r-PG; Fri, 18 Apr 2025 21:06:04 +0000
Received: by outflank-mailman (input) for mailman id 959414;
 Fri, 18 Apr 2025 21:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+zk=XE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5suR-0004mK-6m
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 21:06:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebb56653-1c98-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 23:05:56 +0200 (CEST)
Received: from SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::13)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 21:05:52 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::a8) by SA1P222CA0162.outlook.office365.com
 (2603:10b6:806:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 21:05:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 21:05:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 16:05:50 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 16:05:50 -0500
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
X-Inumbo-ID: ebb56653-1c98-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhyv/4D2soGGWtgMBUdGxh4ye9aMP07/c4fat1qK9/O7MsguLlzxhuu1pDvV75KaRCCtE3K5kEcKzYVEVY2xc/9BJwmpuluC9dEJRlNJLF4nJYBlAONEa/cnDng8Ke+UVM1ufd5GNbmJGUoV2B8uyPEpnG3UJmP99rGlDvrtBl1BYv5eueQJaILy6tUSaMtLlzfGDZsBvbQ0LxB0QIxLk8AGn8ZgSKGjmNGJoPeRkbAVv9Wr0Z/uy2divbavafFHTTZwtRG/NIZRKKmSWYUMjzYMFTwloJfoV6/aXJX/rfZsPo3BNf1MXBbAXWFzb6GuUWxbFUMvKlPneZCbKy9GxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LNHh1Gj/ncIaYlPLuHd5135Y5DnhQOwxjiOr9VYFJE=;
 b=Xl3bj0FT/i/9r8U66LHUn1P1l7aCRJf4em5jueeXJwU+KfRlegczzTfCjAT9d/PJn8MJnQMMiv9KwcHO4dPo4vll36axLp+pPK3JuGSRFw0iggQqB6Yis8BM3iqXVZprdr/wsbRw4ooLpjf5Vqc7xihwvQDiuafOyfu74cYcmyMEZ4QOreQQmB7n8BcCWsdEFMN+0634GnuqTseW6ypzfWlsyYalfE8nd+gaukHlxGuvwASSr8283VU6A+LnfPl7gS8I7CSaFjDgO1I/ehPBQ1SVKgAdu/yDSAvetJ7MvWRXeSvnS2+yPI8NmnHgNjJ9naAf508MnTQ6GGpRjBO34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LNHh1Gj/ncIaYlPLuHd5135Y5DnhQOwxjiOr9VYFJE=;
 b=bZRVoHZRCL34jOAr03CyN0Cb9bl+3DhBMffPM11cvqQYTomTgR+x6KJooFf655JkgwzxWXcZLBGoXwTU++FuvZbM5A7BecHeg/n6/IaC3FgslW15zbTLLb4tntgso+hKl1UbOdwwdxjgUN0S+mX2TIV2WHy6VhVVxAKE8/a1YHo=
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
Subject: [PATCH v2 0/2] libxl: Skip invalid IRQs
Date: Fri, 18 Apr 2025 17:05:48 -0400
Message-ID: <20250418210550.542456-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eedb0c0-f6d8-47aa-a2d4-08dd7ebccd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/JB+oohD0mRM3ajMhobRHXuixzMHr+iBk2qHUt3cd0aZoP08JJj9lRNPDqi5?=
 =?us-ascii?Q?RqnW+rrm14njW9fjUaqvuBiuOIYgb2YR2e8ObKBJXwRMA6qd/nyQJNhAqmtq?=
 =?us-ascii?Q?zcRy9x/qX1nOVKhgIzrThBsXW560ez6cyb8ZZvFc3xRrMSfh4T7W/9OuaMN3?=
 =?us-ascii?Q?Ro+kfOXHY3KOo68rx6LdTExczG8XfiWV32LGJ6slJHBBNFS+5NeSa3ofAuI/?=
 =?us-ascii?Q?hYyKMfxo46K+TFqBxBlZoZC6gScM4Rjtr+Km+R0CZKBQF1eKzAWCdFtJ4F3M?=
 =?us-ascii?Q?BaOdj5vidXdfIQd5gW7dHpKoBFFReE86UbWjzfIezJvk3+8PORQZcAP6QMgV?=
 =?us-ascii?Q?fkrUVSVk5HXd0aEdsg2KtYeAvVi4w+/E/SyaD9F/C9J/S897OoBzqociWqdJ?=
 =?us-ascii?Q?meYZ+s5z50vNZYqgOPbtAA+/U7p72XG5aqn8anyHoLGOXpqCUIrEs5eJ+/Tm?=
 =?us-ascii?Q?1AUi0dqbcR7zxez7jERd2NcMI3pzfssf265vzQVm5eiGOcrri1/sHzYeo3/X?=
 =?us-ascii?Q?NdxEQgTU0bx5H04KGq1VORF5A+bXxyd/fVXq1HKOsZbfFelV+xDaTlNoXjBR?=
 =?us-ascii?Q?FrNJwT+Ul+SwwcZBWEX+jVoVEA0ZPtg45za6n65xS1tWVLh6VwypvWj4T/K3?=
 =?us-ascii?Q?PDTuKqi1KdzYjT/jDXFM2VQSAbv/F9lsAYuzB3oxdkja2sdXJxGSkbmE56K4?=
 =?us-ascii?Q?bu+pep/uf9u2Tuqj9fLyLBV6MKf2g5P9cL0EXymfpghR0moI1MIVVkznyZkU?=
 =?us-ascii?Q?fOhZJsjtyJGGiJXvq16t6sY//aEoTg6rCPkNo2ev7bVcPlrZHHVwKSmFAwFn?=
 =?us-ascii?Q?WekHOFVqEGGWWbLCgZQ/lwPeWOgFowhai3QKZ5xk7hO30Gl8bp90+hDOPx0k?=
 =?us-ascii?Q?qSjhVbQ99+gc7zkd4j6nQ+LhM97uN4TbTyK96uYZ9j5prOuc+Imh/yyZlQi0?=
 =?us-ascii?Q?xZVgS7s2OwhsNxk7jqMd7WYjawaPeUxqRtq6SIfuVXXpddOqFs09kMpq+sqZ?=
 =?us-ascii?Q?9VC2vvMt0QptZKXcnrJKNwcd/6MdjFuZcO/7tGwLw+0W/Sxy2iQ9i7mxnVSb?=
 =?us-ascii?Q?q5AtM0Q1j4chp3zY+5vmHRe3D1fTP0ZCGee9uhWNNO60Ge6s8nMEcr8DUutR?=
 =?us-ascii?Q?eHpQKO7spzslzoFYBcYkL/YPChXyJSuDyqs7BbYJGbJ99D3rat0Y4/7RRx+Q?=
 =?us-ascii?Q?T3TwHGNl90aVbJ/mylvI+FXXFXJfrmmweZphclK4bL6uYbN526sIUEdbHYN7?=
 =?us-ascii?Q?MIo7kO+82NY6JZSumg66BSqoZ1KtNHla3/6q3khCLMkIoEIA1qmQ2T+++zhn?=
 =?us-ascii?Q?oIZXBrvQURsirvh1NDtfq96C6WXReIaejsnp0ToOAR0Xv31El0bq4BG/48OI?=
 =?us-ascii?Q?SMlGUoRe9q3sUc9svFik80wBZqwv6KcLS3lvD3UNYMrnK7EzP5BpV4wrdQfH?=
 =?us-ascii?Q?J2v6ZLZ1NBLWDtffbigFSYq34+8xuveOHTzARQ6VAdeKfuUFo8QfYjrA/kVj?=
 =?us-ascii?Q?j+xyx0+MoBH1tQNvZKf2soVDTS2O/NobLpRH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 21:05:51.3959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eedb0c0-f6d8-47aa-a2d4-08dd7ebccd2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430

Allow assigning devices without a legacy IRQ.
v2 adds patch 2 to switch to unsigned int.

Jason Andryuk (2):
  tools/libxl: Skip invalid IRQs
  tools/libxl: Switch irq to unsigned int

 tools/libs/light/libxl_pci.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.49.0


