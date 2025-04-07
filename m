Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B1A7ED9E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941043.1340617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL2-00083E-6t; Mon, 07 Apr 2025 19:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941043.1340617; Mon, 07 Apr 2025 19:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL2-00080I-3C; Mon, 07 Apr 2025 19:40:56 +0000
Received: by outflank-mailman (input) for mailman id 941043;
 Mon, 07 Apr 2025 19:40:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL0-0007y6-Kx
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:40:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e00a8e-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:40:53 +0200 (CEST)
Received: from MW4PR03CA0067.namprd03.prod.outlook.com (2603:10b6:303:b6::12)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:40:48 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::37) by MW4PR03CA0067.outlook.office365.com
 (2603:10b6:303:b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 19:40:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:46 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:45 -0500
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
X-Inumbo-ID: 36e00a8e-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uahmsSet7qDFQIsMADESFvIIKTBQNQyXV577ljuUzEJpjmQEfE9NYNy1M+/9XOcQpUYW++ftMYHqXFfncsORGM1opzQZnbBgs0rA7Y9E/0pt3kxDg9Bbx53xqc6hvHBtc0DQIcAjMP3GdX+JbBg6Cw15ahH8D1EPuPgYmuBzcQprazZQTEy9yUcrIM+RpbENwqDzsXJGn1hVvkBvPauOtjmU0aYBP5IVxeq7AKKheP3qwzOB3S+SyGCDK11wnYSu9ItF+GGO8zIVGFOK5QnIzYkfjXbnOYmi5/8+MMOcT5veQLFP01RfneY7Dod+bAk+ydxVWrss4NNneBU1rRe7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejsmOXKBrbjqmaNCagfXX2dJXgSreeVEa39LmdbaGHI=;
 b=NZY9WYcgaoc6UyUnhoqo6vQdgIGtpSCDcj/ocBtpEzYxFsa426XAA0pOGvNbb3SAbKkVRh298TO9k5JbI7+iUFPAimWCtwEeRqPpcOdAN108ZtdIpcKO29QfBTWQbgpLSNSGnU7+n2XTgU0e1WvJhY5yLadmdPCaqlsiNGCPqxjamBpWCm3th4BAX5GRxiAoS/kyBOQz9csz+3sFJkjDiMBUpwqxhqDtp3qkHarAlfPS8xFZhHsJb1Tr7AxBMWLU9YkPcKkqtlWxtjS2925F3IFS0fB5TvycoetvngY0eqz8mFd3cSqcW/9UFdriqPjnpca0GuWMHRrU23UBIR1rMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejsmOXKBrbjqmaNCagfXX2dJXgSreeVEa39LmdbaGHI=;
 b=htRGEjJERwcw7xZGTiDPryxo3leKtywou1sftMKMSarOffjX2H1HFptW6rH2782V8FcsF5peKWN3IQV/XLvglqP1ouK0LZAe5NjpReYcciGo0OPIox05aJnRkMTc/d/bTrRbKMXAtllfD3WS3bN0NgDfohrhPkponcMvbZdpK8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 0/7] ARM split hardware and control domains
Date: Mon, 7 Apr 2025 15:40:31 -0400
Message-ID: <20250407194038.83860-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|BL3PR12MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 05654780-817b-4a5c-ebf6-08dd760c1852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KgQzxbnIveMQYZZ0t4+7amrO0e0Pj5MUEurSKvZYHOirNTkPKW3MaGrUlFVn?=
 =?us-ascii?Q?o7RRtUEdv3RUEuHcT6DtF4WFFFN0DtQVVAs3nVBpijLAA5YqfDkblVP2ussS?=
 =?us-ascii?Q?Jul9zCD2JwCal/GW/avSNYmEKY78vkKlpPL794P007fDADfSdMFdpuqjZuwF?=
 =?us-ascii?Q?BD3pK+L4JzmBEXlxxn03mxrRBnv3Gx/T2FAGl3azP99VksWrSCOZ+ucLoyWW?=
 =?us-ascii?Q?vavmLQPy16nSu79RL38WxUTCoOdFwdIH/RTziLmALHu3Q6CBQHG8L/ZQkAvc?=
 =?us-ascii?Q?r//w47USuxOGPtfFJMx6tJq+ueUrWMgrzb8a03BIRfyurhlec+uYzBRl5SPh?=
 =?us-ascii?Q?OG0n6buZHnHXJF8WV3omCutApTa08lXKr6ZsghQZ8uulq4z/KKKz1tO/eZEf?=
 =?us-ascii?Q?cvQ2TPlTFmM/Fco5VLDEwti425J951WgL7mkmspDBVCME50XaoRfKk7HzPha?=
 =?us-ascii?Q?Bl3gieFPYm3x1RzdjVi90fI1Sk+86JoED0t2bVZOuIAwyY2vcSQcvfWTRwfA?=
 =?us-ascii?Q?vGyZnVYbFqSCkH4fV2hdUGY1ddSjRd160ymakdhgXzAyxsVzJJjV0+TnpxSi?=
 =?us-ascii?Q?SIvJAEQb3M0cdg4DqSR/+KADyglGp+Tw6IT5LqLOxGJQmYSP5qK14CFallWt?=
 =?us-ascii?Q?h2yLhJwa/O38QvqYJy4kJ3pbRu5X21RmaxYK4hypeNAtF7N5g8b/Vr/2+7Zo?=
 =?us-ascii?Q?q8KGz491VakTWUjvmlxg3Dy/6tBBNB0X8Vmo5NRZn2Vl5g2yfeHLhlsP8qHN?=
 =?us-ascii?Q?fckYvg8eOYSgeZnA2TShar7DfZzFKxm9gfEs2THydCETn3M5MKIx4VWEamv8?=
 =?us-ascii?Q?LfKiztEfoP//5a537AOvUkOb9X2uGuMOjcZKLpIO/aRzqxX4SYmNspQ3crFp?=
 =?us-ascii?Q?EoPsVupT0WAWUHdfNZiiNuq/87qmzgPUZ3tsI+2qIWn3Qm2zy0XWfQRuPd7y?=
 =?us-ascii?Q?SoWwYpk1rInTKIBdP+lx/Q1llFVFgUvomXw4wQ7IhdCgvpGOhbSkQIdSLfuh?=
 =?us-ascii?Q?nSCp8BXWF7b3pbaAqf+0+pomKtoaSCAOescw6aLD/H13LNzWcpOIkK4n/6L4?=
 =?us-ascii?Q?iJ8ufjebtG10FoAmcOTB30QgsPW4wTbTI14l7kNH4EerMRczWj3YF0xNmxO/?=
 =?us-ascii?Q?/S+K9nplDYAR1X4y5Kfl7FosIK8R9TIdc3uRkdoalaB/xlBv5AXZDktfysmR?=
 =?us-ascii?Q?rKPB83FOV4xR0xoXqfFaEPwitw68mhIZ/cSlUg/s4rPIVP9QRSt17fw5JIQO?=
 =?us-ascii?Q?h7FjYUL6PvYmheH1BMBbHQ7J8BNccN9hk4iKMTVg6FEcznFJZHo/tWuELBL+?=
 =?us-ascii?Q?uiyn4nXGCr+yBDPKOtpBMZ5nj6HYj8n2BoUAUDD/faC+BWa57DuBpAfOKqlx?=
 =?us-ascii?Q?+3Z1EW68r4xXiyfJykBVIG5ww6jCXdEHHewQdiHN3XeiAJppnCOTXTHZtVU3?=
 =?us-ascii?Q?QUn/7tYHmeUSLtEs1coOkxTgFJACY7IrAegpd1BgjAwL28jrtduySLlY3tLT?=
 =?us-ascii?Q?lZuQxpQaYCaVFad0iaMi8r/g31Gy7rjGHYoG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:47.4688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05654780-817b-4a5c-ebf6-08dd760c1852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522

This series implements separation of dom0 into separate hardware and
control domains.  It uses the capabilities idea from Hyperlaunch -
hardware, control, and xenstore.  It's been tested with dom1 as
control, dom2 as a domU, and dom3 as hardware and xenstore.

To keep things more managable, this v4 is only the ARM hypervisor changes,
and one associated init-dom0less change.  The series is slightly
re-ordered to move xenstore changes ahead of adding the capabilities.

"xen/arm: dom0less use has_dtb local variable" is a new patch to
slightly simplify "xen/arm: Add capabilities to dom0less".

Setting hardware domain as domid 0 is removed.

I've been unable to run a combined control/xenstore.  Linux console
output stops shortly after the domain determines it should be XS_LOCAL.
I have not investigated further.

Daniel P. Smith (1):
  xen: introduce hardware domain create flag

Jason Andryuk (6):
  xen/arm: dom0less hwdom construction
  xen/arm: dom0less delay xenstore initialization
  xen/arm: dom0less seed xenstore grant table entry
  tools/init-dom0less: Only seed legacy xenstore grants
  xen/arm: dom0less use has_dtb local variable
  xen/arm: Add capabilities to dom0less

 docs/misc/arm/device-tree/booting.txt     |  11 ++
 tools/helpers/init-dom0less.c             |  10 +-
 xen/arch/arm/dom0less-build.c             | 197 ++++++++++++++++------
 xen/arch/arm/domain.c                     |   3 +-
 xen/arch/arm/domain_build.c               |  11 +-
 xen/arch/arm/include/asm/dom0less-build.h |   2 +
 xen/arch/arm/include/asm/domain_build.h   |   3 +-
 xen/arch/x86/setup.c                      |   3 +-
 xen/common/domain.c                       |  15 +-
 xen/common/grant_table.c                  |  14 ++
 xen/include/public/bootfdt.h              |  31 ++++
 xen/include/xen/domain.h                  |   2 +
 xen/include/xen/grant_table.h             |   4 +
 xen/include/xen/types.h                   |   1 +
 14 files changed, 243 insertions(+), 64 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

-- 
2.49.0


