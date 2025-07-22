Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459FB0CEB0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051887.1420331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lS-0007YL-Ql; Tue, 22 Jul 2025 00:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051887.1420331; Tue, 22 Jul 2025 00:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lS-0007Wu-OA; Tue, 22 Jul 2025 00:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1051887;
 Tue, 22 Jul 2025 00:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPIU=2D=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ue0lR-0007Wn-28
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:21:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d965440c-6691-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:21:47 +0200 (CEST)
Received: from BN9P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::32)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 00:21:41 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::bb) by BN9P223CA0027.outlook.office365.com
 (2603:10b6:408:10b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:21:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:21:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:39 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Jul 2025 19:21:38 -0500
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
X-Inumbo-ID: d965440c-6691-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D34WHPIFH+OhERQUmfYG1+MBV1X464cxnhauLY+J6BTdZxbJYvGcareznVtLIlVwqY5JRjOAp4MbAbCR5anf4UQUQCcNYvadLYHahYnz6w/xk7iH7fmEQjTiu7JnwkroLqin1AdcvYlsdoxfEUWt9ZfrxMj1Gbz+21WP1uK+ALsYUFPa6ntVFMjJiFt+eyNciVNlev+sWM15zRNQbhb3Ov2gw7oi2152tNV8R61QaHZDomxRbSqz3qusA/l6mP9gIscL95TKGAbLNF1b86w/hhvdl+fJr+Kb6jr9qISJapAfNHAldMzvs5Ue+dK/BSjhNsPmY6BoYfVHCgyAGvQ24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj7rkHpI2qeIdNyFNvaUWGJucNpDZx8IiGyHlGR9e7Q=;
 b=ZBVXuLQCJJ2pi/f00ASHRcNExafPsZg34blD7EsxG4kkf6wB1zPe9ueydaMKByHQaZ04cAw53VkskGqxyC09dKZKurpLDWhH1FuLjjjJpKDUxfNt/Hhq+KQLJl+jHpuSOqeX6Wvrr5ouEzUorpgQTnIuM9s7HKjjYlvbFNk9v/e/K7jEErUQvIVjoBespqyArm3J4pqrV21vFFrzXj/0AMDbwCscw5jlZVLSzr7TyvNWrtsrZ2Ap0xV6HPUCoYSfGgq9WClvygcXD3OQC+/Dh6yhMtxKcnutT4PZQI5YhFhW2Ytabs1Po4Ot5WZ7C/tNB8lz8LIbSYh8tg0K03JDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj7rkHpI2qeIdNyFNvaUWGJucNpDZx8IiGyHlGR9e7Q=;
 b=RsealeReTj1suw8b0jjPwT8AVaz4KKbS+dZWFl7+iDLJaLqkiIhwZbmPRiGYi/YPIDPiB3zgZPmpdgGOO8OjHHh6Rw2CN4bZM3yT+h8CEzNfGV8TssfgFKTS8FcKxw/C7mTF3y/Jbr6KgmHJpYIgbeTtW1sQVeHpGk7jbEYoqNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v3 0/2] Expose capabilities in get_domain_state
Date: Mon, 21 Jul 2025 20:19:56 -0400
Message-ID: <20250722001958.174294-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d23abaf-d728-43a4-929e-08ddc8b5baf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p1CrGYLxiQmBFKWYq3J4CpVOqINEUQbd310S/vfgw7RFdJX5iiUAPxK3kYWv?=
 =?us-ascii?Q?AkUa/pdg02lgZwCiCZlSUP1C9KtJ1TO6KERCvMJl2w7IlqrMFe8ToNOqCPzo?=
 =?us-ascii?Q?87cr1NZb5H1lH5d6zqexAmBLOH8dVTZw/dR491/o88bD5MZ4prnpusXM6PHA?=
 =?us-ascii?Q?+Vu0hxbRNwYK1vYfThfJs4zhXbl2B1RARdVFM0BVtJm+wKTlcQKudn05Ci/J?=
 =?us-ascii?Q?sWf0B2F+/T2lI3wi8lNs9M18JpKLde1gmVSOaXes084mzdp5qoCHl4TYrQsB?=
 =?us-ascii?Q?HEtI9PSWT0cHHxV8Nr6+aD5sUu5TDJtbCpNcEZ/ckQQcbpRKgYknLH9gKuz1?=
 =?us-ascii?Q?mSZkRn/TC/WpGdenKRj8LM9cjz19R0IFIhjNgioT0KZBPLkcCXVFH3HOdRkr?=
 =?us-ascii?Q?+SON3+qZB8arYNezx6avKK+vWyydMUgnykxNFxOMtfdjQ+6lFNIQPGqRQCnC?=
 =?us-ascii?Q?7jYmXDeISt20MIEh2P19RXp6YZ/8pXrqpz8ji799owWyxyuw0q71zuJyIpmk?=
 =?us-ascii?Q?v2IkyugNril8WJtv4VqHamWs4KMggEyVtD4M/ctrNpy0NwkdlsxxMJszOHAN?=
 =?us-ascii?Q?QPhzbQHR8hvJnaKdv3eQIsWjBdpmFGmWs/hrwrtGSu5297uMsCNl2YTWaTKe?=
 =?us-ascii?Q?NLeZY1x9R3c+FMAbSKd23sBCh4Eri1PpDnhR4P61l4db5z7zf/kC9VuOj1mc?=
 =?us-ascii?Q?8BnRK0Hyt1yXqIVQzIljzHFteyNOJ2ppjVf12i1P7wbhR8Cv76tQB0AYRy9P?=
 =?us-ascii?Q?ER95y8f2ZJE69AV7JpvWpzHMxBtKK1QFWVopNEhJe5l91y9qR0dXqiR7ECNA?=
 =?us-ascii?Q?gjMJiwQ6wnsRuzAZomXaN6fvQB52oL2WDAPuE/Ohmp4CpkiTuh9EUPgch/oe?=
 =?us-ascii?Q?js7/vpGgwPjIJUVMOxUU0NskHP2680z1CSDlph11osSP2oLwFq46U8k3hkrb?=
 =?us-ascii?Q?1YIsqsR7zRH0pVlOcQ6fIEr+rRSgRTutcqVlHsZIPk0vdKSRG01kvfsJ3NBm?=
 =?us-ascii?Q?dLSoM1ciKHSCU3xv4J7AmPkCxPM4y/b692yg61Sg4CJjcpX/ic3E+124IeiD?=
 =?us-ascii?Q?YTw7YxzsZFx3nLDvwAlLGbN6aM3s93RRnJ/NLyAlLnmNAOfhfvql36ZMNRUp?=
 =?us-ascii?Q?TcR6jR4hcBf5Z3SCgavnDk8UXGAYJEg+5W/ogKD8zU4rEnTO3Z9cGKTwdMQx?=
 =?us-ascii?Q?UKJ7pUbTAP1ZkL4GNE5uVKwawPe+H/ONykYtwhgiqrNiHucZhNdgLBCqf5yy?=
 =?us-ascii?Q?iPwNLIlSjMEtGXU/wyOjLIZLEl7jF//vR0iwz4P7jZjKtL/BfKkTKaqVeMzB?=
 =?us-ascii?Q?NEKfnKAU8+GtSfb6NI/D+tqY4vrHePKpj2qUw7u4l31osyRqEZGnSlOt6h4c?=
 =?us-ascii?Q?CFUvrhf1cVq+nNqADnG/shMwQDZJVRHfuj0DJzYl47Gw7knG2mpvQo795+uy?=
 =?us-ascii?Q?MTkGG+afCVykjCVj2GE3PKwA40RT44qV6lEdxJ0TPHjIF5KhfOTHHgQIUHKS?=
 =?us-ascii?Q?3OBIi/Na2I2XKIzJnAzGGfMl4uPgzRLu9H6s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:21:40.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d23abaf-d728-43a4-929e-08ddc8b5baf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

This is the capabilities patches split out from the larger series.
get_domain_state is new in 4.21.  If they go in before the release, the
library won't need to be changed in the future.

v3 is used since they are iterations from the other series.

Jason Andryuk (2):
  xen: Add capabilities to get_domain_state
  tools/manage: Expose domain capabilities

 tools/include/xenmanage.h   | 14 ++++++++++++--
 tools/libs/manage/core.c    | 21 +++++++++++++++++----
 tools/xenstored/domain.c    |  8 ++++----
 xen/common/domain.c         | 10 +++++++++-
 xen/include/public/domctl.h |  7 +++++--
 5 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.50.1


