Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDEFAEAFBE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 09:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027311.1402006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV3AF-0003VB-Kp; Fri, 27 Jun 2025 07:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027311.1402006; Fri, 27 Jun 2025 07:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV3AF-0003Sm-H3; Fri, 27 Jun 2025 07:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1027311;
 Fri, 27 Jun 2025 07:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uV3AE-0003Sg-0B
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 07:06:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38e2699b-5325-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 09:06:19 +0200 (CEST)
Received: from BYAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:a02:a8::44)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Fri, 27 Jun
 2025 07:06:14 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::b4) by BYAPR03CA0031.outlook.office365.com
 (2603:10b6:a02:a8::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 07:06:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 07:06:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 02:06:12 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 27 Jun 2025 02:06:11 -0500
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
X-Inumbo-ID: 38e2699b-5325-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq9BPlkHFyO7V9O3NBFUWJO0XsHLdRE8PENJIGGDEl0qAPyB+Caia8zH5kY/BeOHIssA2wRwqrUcWRTOUvJRuG8HXyi8dNIgL7p/whsIqNZyBMoA+FcMxASBNR0oUEPReQ1qwkn6DcdjFVXT1KsIh4c1DEy2iEetS1uArOpZsTWU05sl3c/jtOXvHCwpwabdmNAK2PhdMUQ2AOwHqb9GQCapmkQa22kgU7UBnxBk4iheiyTGKg18EE936NktaAe8Ir390G3rQY3OWJLrCM3Jk5J40lg0ExO8FErdRtb144IPOz18LQxEko99osHbLPNK4CtRbtL8RmXjtbU9L4VXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNfuWQNBrKEQi09oANPuBniM1En1eo376mdyGs8FzsU=;
 b=v5qJgpG2atsKDbq5dRfKEXIUpHfzXpnwGrl8HlMUoCsKWzU+wgzQIolwGRjlLN8bps5nFKWln/BiaK+Gc5y88ETgx57OlRI7gU7a6+c/hPJNOIw6reEsPv4WNBObiCNJqoF4WKxU0GAlGq48TJHQsdAIVTr86P7oHeMfAjIGqK+6HGjXn4b3SNtQ53/AGfpRxI9aUAqsklFHmoSrZEvoEgiaiKyDNe7X/NcVfFBUDlR5Mb3QgylYfxUq+MwdmChj5znFjYUpxn8KRAsyEc+FxBPuzgPQH1H20estnjdNEhAXoxgjmmBJBv1cX/fgD2htlJnodi/2bykcGk/2+NqAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNfuWQNBrKEQi09oANPuBniM1En1eo376mdyGs8FzsU=;
 b=k98GuFJGb2B6TK4lUqud8Qtp4igic7JH1gwXeKWfJFhWsRK4V219HGc74F2qtD7Isbqj3QlIBiZHba6Ih0Sl4QWQRvBmSekCHD3jm0g1FsEJKbLZRXkmMNuT8BzJZJ0+xR+3EDZ41jjFesIRImO639JCSm69iIWAx6awe5dKD78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] docs: cmdline: Update serial_tx_buffer default value
Date: Fri, 27 Jun 2025 09:06:04 +0200
Message-ID: <20250627070604.6580-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d3076c-8f87-4adf-b08d-08ddb5491a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T4BKY3f3K8XdOlW6jGP8zMc8/US3KoOuVsg/cOrcyaz+jQQ9LVs2ZvwPlf4s?=
 =?us-ascii?Q?Ve74+TNc06tFGGIBeMHQSJj9tZW/sbsmFnsPR+aqQEhYI8/frEFUxo6BAks6?=
 =?us-ascii?Q?2Zb5EIVqqC8KLMPvrkQmKoCQIEwLZga+Wbo+vH/Gh4jNMSMGUIpAIMa6mRVm?=
 =?us-ascii?Q?GjjglCv1UuXqCGzEJy0KWbDJTTAzIE+19KkJPYpLM45QaXIr0ZpF8SP/b+jy?=
 =?us-ascii?Q?0TXw7QIOaEIwKc8PlMuSXJ3mfRHKsdaRZzVOhXkMwjHl0KZgkWk0mthR2SKC?=
 =?us-ascii?Q?Q161O5eJORWovu72z76mctPj4+msWsPfuatqPirwKwTwDuixuqqPRKbMTvSq?=
 =?us-ascii?Q?uC8NTa0mbl3Cp+SStka5tHVol0r/O4GYhyGe4+Wd3w6zgbr/r9ktsUF6+KAd?=
 =?us-ascii?Q?u1tE+UPMDX+O65GIIIjCrnhmJr3seXv7lMyXo6JrlROBsPfBngmuGfw1AkZJ?=
 =?us-ascii?Q?aB3f/aeO3Pfd264MtafVua6e7TSXoehZKxlKiagla9rNZ48h2Z9j6BYDIg4b?=
 =?us-ascii?Q?zH/+Z3J1vXBb919u4R7jDpuKr/PFC8+q/eH6YSC63/t7N97zV8SPgeRswnDt?=
 =?us-ascii?Q?OiVAewF0tSEbYlKiJtzR6xVQbReoEjsvR3Cnp900GJr4ocZQmWwaLYilmRef?=
 =?us-ascii?Q?HpbMeZDGxNEpMY23wrJsDoKAzodu+GPQbzjndFJ0WjIJw0hklR27xQT0zAkD?=
 =?us-ascii?Q?JNkxoA/vSKfJNBsWfu90RdbP7vNoaFmYSkYz/yCypgdUE7d2ZsH0YJo9h37G?=
 =?us-ascii?Q?mRc3F7r2c5QJOzqpefQh1PBbLIf30pEYttGDJOP8c4vZeQPt+a+FPvtKESvs?=
 =?us-ascii?Q?j3TXNmM87Sz8MRlF5z5GE6gn2ywNN3kVawlaBKulBDTMB7C6V6I9YdzZ89Ak?=
 =?us-ascii?Q?+DKRtnLpSvOzfQmnv6g+bp2E6bZ5mgff0joPpMA76vTxYpIXelUVF1ieZgRs?=
 =?us-ascii?Q?SkvBO5rzh9i3BCJSUj+ppNcgPbB8J+PNnyJpwOjWndK1o3G7DBP7qwtTDLe8?=
 =?us-ascii?Q?IpVnCxGyMjLkuTzrWSQVZq2F549DtLu/l1VhTQGafhryQ+Z+1L5Ee2yGTdha?=
 =?us-ascii?Q?+RMnWf6uJGHwtgrZ9J93reuAkyo/zrwOIbCMO2OBCZFONTNyQIaKG2zcyolz?=
 =?us-ascii?Q?acJE3bnmY4j8rq7olVuK/y7BLqkBOpEF6LezkgZsVu5VO1B5T1tppat9htN1?=
 =?us-ascii?Q?pNgL1sex4PvrPN9TwWxPn4nco2nxOMy9s8mq7O3PdtS9F3RwXy3nwAUc9Ot7?=
 =?us-ascii?Q?qBvRH86yz7p2gEO7eqtjl80D44hVWc3NLH9uOdN1SVCralBY++NcaWpPUqbx?=
 =?us-ascii?Q?nv3O0/igFd4NA6sjglG7p+5ws7UxoO3p4up6f+Peevw5DuJyxy2kYY82XL2k?=
 =?us-ascii?Q?An+uxkBeCKPhDCuqzjL2MyP2bmVTzwGkuj2ZfKUnqgqE8JmR+PkvVGvPKA2c?=
 =?us-ascii?Q?0B6a5CB0gBNWBLBS7H6CL2VFXE+MLUUsWgHcBVE81S40qb9dE5Zh7ESE+gy5?=
 =?us-ascii?Q?zGl3yPITG+4kH42YpND7XN7BVvox+DmwDhO/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:06:13.1921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d3076c-8f87-4adf-b08d-08ddb5491a31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358

After commit 4df2e99d7314 ("console/serial: set the default transmit
buffer size in Kconfig"), the default value is set by Kconfig option
CONFIG_SERIAL_TX_BUFSIZE. Moreover it was bumped to 32KB by commit
d09e44e5d8fd ("console/serial: bump buffer from 16K to 32K").

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b0eadd2c5d58..6865a61220ca 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2370,7 +2370,7 @@ accidentally leaking secrets by releasing pages without proper sanitization.
 ### serial_tx_buffer
 > `= <size>`
 
-> Default: `16kB`
+> Default: `CONFIG_SERIAL_TX_BUFSIZE`
 
 Set the serial transmit buffer size.
 
-- 
2.25.1


