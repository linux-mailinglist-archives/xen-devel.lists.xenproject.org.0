Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39755CB13AF
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 22:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182190.1505107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Yc-00035s-Qy; Tue, 09 Dec 2025 21:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182190.1505107; Tue, 09 Dec 2025 21:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Yc-00034N-Nz; Tue, 09 Dec 2025 21:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1182190;
 Tue, 09 Dec 2025 21:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT5Yb-00034H-EM
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 21:47:41 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf04f39-d548-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 22:47:39 +0100 (CET)
Received: from BN9PR03CA0176.namprd03.prod.outlook.com (2603:10b6:408:f4::31)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 21:47:32 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::26) by BN9PR03CA0176.outlook.office365.com
 (2603:10b6:408:f4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 21:47:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 21:47:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 15:47:31 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 13:47:30 -0800
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
X-Inumbo-ID: adf04f39-d548-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdkRvLRwFDdL+aIddrVtPQVJE42FC6kW9eXnYGgWBP1JXoVMLYBtvnXMqAjNDD8zdOULSYpI21WDN1rqg8Mai+gY33eHwKeRLrZx2QghGkK+1kZ7w7iBH0DeaBLJOUd602KOmrfF+uIfo7ppdhmDnp31jHUcQFMy58ZDpFWof6ZYgvM6f0o3A0Bavl5GWVUmeVSnO5DRzmTJch10InW54gtDGdHk/rGkW1jRzyir7CHMwDOh+7kWZyHqZLe36L9JjPFy64jx56ieqQRt1p4Kz1qfVestSYi/DbjhZR0/NJ5CC/olMPgE880dmjymmlpz+P4l0lA9rUTUztPXKmWr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SJ58LU45zdDA8YS4eiI6xbsxRyKM1Ha3NQQHN6scAc=;
 b=OKGGfe7ymLJfjQFRMQoJn93C6JyEGUzGbiCX8nnYOD0ga4AMW5Mxx4sESyQLR/3k6mjDFfHmas8Ur99XHp6/ZMZWcfufZ1wVGrus/+Ckw4k+UAq97xGJX2DVXHxlCQ3G2qjakbYNwbthfT6qJyNKgzgyoHeDliQWm5k7vwhyCrT6tIDyJxz30gk30ktR39AwVWHJEXdPa1RDtDHfTF9qR/FaoO3oF21RHs4qfWwwxx9nn/gFo4gRusi3qudbVkPAl0unFZO3r+mA06tYAh/VzU23W3x6uruePQys9DZp1/d/Pkvv3AmjnFJeM6Y/xnh5ms0to6afvTuM4EoI7rpjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SJ58LU45zdDA8YS4eiI6xbsxRyKM1Ha3NQQHN6scAc=;
 b=hayoTaV2ForAp0MnRq0Y17LphmjHHnfCR84NWOXmj1csNJi8PcGk0ahXoLvEuQOzsA3vbqVABltcMMYWHa5mo/VXFW6VgU+rKUUz7w/uDdYC+i1R4zJhMJ+Ng4CIqS9RjgyR4em/syMjUAlqd5cPiAx1vAvx2hg+kvneBw/DL44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Grygorii Strashko" <grygorii_strashko@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] Enable --gc-sections
Date: Tue, 9 Dec 2025 16:47:26 -0500
Message-ID: <20251209214728.278949-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: e95421e6-7c67-47ac-1b03-08de376c8e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YRoekf9Ax+e1Z2NHmpf6N+poFCxgn3gmmfIfwU9YB1gU0c3kuQqHpjAHpw2C?=
 =?us-ascii?Q?a7hh1xm0/hBZQHDM0QH4iQUZiZ82uOjiBFjmyesvXIwE8GLq+28b5mw7vHEy?=
 =?us-ascii?Q?4eo34yDmr3x7JPLDFbfeiaH342YbM2Z4wkHZC5mWvYJQhnOwqgICjRemUZ6+?=
 =?us-ascii?Q?AwKZbjJ1DAkwc+qhglS4Br3m3nb+ieab0hDJnw8uAq17siUDYirJnUDrB18O?=
 =?us-ascii?Q?vmfv6uZIrqcRVcTGMcyt/+dROz/VyMaBo9W87PY39mBGo1ExBm+p2p0y/m40?=
 =?us-ascii?Q?yajFwu1Be4eWt8/B/fOFWF1KzUjF44ESNAlCtOhn4swW3BSXoDuFG38aL9uV?=
 =?us-ascii?Q?JdFKJOtUGpQd7jv9p9WkkasM9/NUsh8GjXfDFcXk5Vng2SN6HDLZx67vhF3a?=
 =?us-ascii?Q?FCJA3xLNwxBYPNROKJb6t8SY5yaiAwff6Crsk6/LOd+5kxcnI1k0ezOwEiQw?=
 =?us-ascii?Q?6rTETxdEcVa8CXROWDGs6SR0zKZ91I55a1thLH0mVHiwaC9GCKYJpr9JcF2X?=
 =?us-ascii?Q?ExhoRLd1hLmVFLYDSVpViuMDDSMz/rLye0NVxLuOt/kfSvxqDxsoL+KjEuhQ?=
 =?us-ascii?Q?yWWhO6nTYbYSZCyv1sZnpCBMu4KwiEhelUZsfbdBHs8wXhNexShGnML6Q0YG?=
 =?us-ascii?Q?IW9taVcBcCG6AXcBSp54vzOcfdcQHQllpBj8UlYPsw8FCUo+v75Rd7Y8tY2t?=
 =?us-ascii?Q?GmtjGce6UXqMZp3xPQsIWKFCryvaZ+DIvOhKAp8sFsnCRSb39p1QIfpm6dGI?=
 =?us-ascii?Q?W9hXdacPZqou2UY3fvYYm8X0dZyHGQgyPW4e7hUa8XOqwOr/4WGA5vQf9Yfb?=
 =?us-ascii?Q?wTKzQWeN8geP729F5MoX68j3rf5M2zHRx5jtcT9oga+W5N90UqxFcd+Bkwdf?=
 =?us-ascii?Q?cvmpePovI1gthc8K4OLYuSYLY55m2QT1ivwn6MsWwcUQ4xmgtG44xRsNGpE6?=
 =?us-ascii?Q?RqaNSG7AzV9y+IpYat9TqFi+V77yTLVN5+5NDWJsGAoHFLyR0MRIXdlptnn+?=
 =?us-ascii?Q?0Kt/58A3sBNo3v6OPDmQkQXY9BSHTV8fm7GkeMChAVXO5vmrEh6W/x8ktpzf?=
 =?us-ascii?Q?apVUo4+SbBIEpLm7MB9nS7mAZw7ZBhiguAR2O284jXwppec9C5gRZ2QLkU24?=
 =?us-ascii?Q?Y6/NFB4/PTC8KCtFspNC9max86afaYAGgshdFxfiZhiSM3Jq/+mNZ1oWtfSx?=
 =?us-ascii?Q?mOYdvnzD/Q8NmGT2ln7a6CfGOyM943QuYaB/U5wqxOedEq1qN0zj1bfaaX6P?=
 =?us-ascii?Q?2/CkEh6NxY53fpcQE5uWINMdKj6vdd5JPPQRkqFuE2uR+1I26aRSkpiloq4G?=
 =?us-ascii?Q?QzLUKVSJLy6KRzunk3xXIMFnjRQB3/J2G6Hzz6D10ocykB35wXEGRbMKuiV9?=
 =?us-ascii?Q?zENPDack0RBqAnsANHhQF3rR32/qm76m9mgtPBz/RFJKAlcHY16w5ae7r/sV?=
 =?us-ascii?Q?hEZ0CeFBIWSZCmmkRinlcYlwA4n6RrZcsmKvJ1cDKmXlS2qAxumKSgcmv95D?=
 =?us-ascii?Q?+/7YDWqbTfI5+6wVJMS4pVVU/DAt/3/B7lffIxg9AwTmHsBoWOqAtB0WGx6v?=
 =?us-ascii?Q?bCgGgcb8jpYnK9X+UFE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:47:31.9922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e95421e6-7c67-47ac-1b03-08de376c8e86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051

The first patch removes the scheduler duplication in the linker script.
The second patch adds CONFIG_GC_SECTIONS and makes it available for all
architectures.

Pipeline here:
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/pipelines/2205223331

--print-gc-sections is enabled, and ARM builds in particular show a good
bit of removal.

Jason Andryuk (2):
  xen: Centralize scheduler linker definition
  xen: Add CONFIG_GC_SECTIONS

 xen/Makefile              |  3 +++
 xen/arch/arm/Makefile     |  6 +++---
 xen/arch/arm/xen.lds.S    | 27 ++++++++++++---------------
 xen/arch/ppc/Makefile     |  6 +++---
 xen/arch/ppc/xen.lds.S    | 19 ++++++++-----------
 xen/arch/riscv/Makefile   |  6 +++---
 xen/arch/riscv/xen.lds.S  | 19 ++++++++-----------
 xen/arch/x86/Makefile     |  6 +++---
 xen/arch/x86/xen.lds.S    | 39 ++++++++++++++++++---------------------
 xen/common/Kconfig        |  9 +++++++++
 xen/include/xen/xen.lds.h | 24 +++++++++++++++---------
 11 files changed, 85 insertions(+), 79 deletions(-)

-- 
2.52.0


