Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2194DB2A
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 09:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775036.1185400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4a-0007OL-90; Sat, 10 Aug 2024 06:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775036.1185400; Sat, 10 Aug 2024 06:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4a-0007LD-6N; Sat, 10 Aug 2024 06:59:32 +0000
Received: by outflank-mailman (input) for mailman id 775036;
 Sat, 10 Aug 2024 06:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkHu=PJ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1scg4Y-0007L7-Mk
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2024 06:59:30 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1608041c-56e6-11ef-bc04-fd08da9f4363;
 Sat, 10 Aug 2024 08:59:28 +0200 (CEST)
Received: from DM6PR05CA0040.namprd05.prod.outlook.com (2603:10b6:5:335::9) by
 PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Sat, 10 Aug
 2024 06:59:23 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::14) by DM6PR05CA0040.outlook.office365.com
 (2603:10b6:5:335::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.10 via Frontend
 Transport; Sat, 10 Aug 2024 06:59:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Sat, 10 Aug 2024 06:58:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 10 Aug
 2024 01:58:39 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 10 Aug 2024 01:58:39 -0500
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
X-Inumbo-ID: 1608041c-56e6-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqiBFOS80Zjd50XIMh9+lee+eulHHqk69NQVWfPmNGQB+Ry0zpGQp/l8HE2bx4J9un8EZZXm1BGcRc+7onpZKrvWNTt8QG82stJh6sqvdv1/CJmJe8Ow5bc1v0ldQOGQxOm09DkU0Pwz2XJEaD6OtZb+eA+DiqcY6Yi+7jlLIgGYLalTU5Hd1IOpyGPdxXV+LSdcfjor3pjQpA4xQJWlvjYdepb6V1FZzoJdcHe/oLgQR0l939/LMhFWz89rzTOktYNrUAo3OGjP9nmG9T+lDxlRZmKTRJwQ233VtIgFanjYR7P37T/KpbtUYSH9doYo5qyjUchWGiqI8jzrVOYApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA1IX9t7SEDpbsDMnPj76j30u2PPvC5xIm67jnALTNk=;
 b=meIyE+JuTHfQ2vpJ4U+LR5DFvodvLRA17UoMQJUOOGhgmlKm03An+0JdQbvbv8ebGHM/xZrvJyOHUF3wQZXqaqI8ZcWtUQRnpnURfbRCZfvzHIc58EJUno8EBe4jXbKznywReK/5KSBOQKK5xvPCyeKocPz1RxkTXaVKKZGEy7OFI2k3NsBeHdlAk4qa1hM8RX7r0arndna1BH7iJuA+lC1j3A8hZCuk109S4f0+IQYlcNfWy2mvQyQSGjhe/4H9Njn3NINTJQI+xFkwesbfDvQUoK58pB/sXw73r4LDFAtC5vRxGrB7eRSY3v6EZifAmYWiGLmRPWi/8DvpGyQ3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA1IX9t7SEDpbsDMnPj76j30u2PPvC5xIm67jnALTNk=;
 b=KQ3tbuUuLglHR5bfLfQg004Pscci4lCzti35+4Lv8z50p5c8oZHgcsLTnNa1xYCH9giZ9R1wH4bfo2j2VbHe4+n+EAVcMdoqiMqoF3wANANyjxxgd4mHj27Ln3PiYmLDVfOKRTsVuCR2LcnB/OpKPfjGEkTS/k5Pc0ZrxBIJv8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 9 Aug 2024 23:58:38 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH 0/3] automation: improve pipeline
Message-ID: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3711fabd-608f-4034-77e9-08dcb909f732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2KKkH4THkybMmLHvzQCiSLj4eMh/y/MSCTT/gS8sBWijVPgYEVmLc2OaPFdC?=
 =?us-ascii?Q?MCXiuSkwP9UUjsoyAy/W3fDqg3B0WDIBFIgRO7BSr8tCqaN9Q8euYv6Txw0Z?=
 =?us-ascii?Q?yaVnMK1OHiFlFMW3PtLNQ1Y+EoC5PI1Joxr0OGrr478M01cGS4/aXJZbJRwl?=
 =?us-ascii?Q?Od3GXUtkEcZNpeDkvRTxrlGad+DGJa/RWF6kjny6SuErnwUH/W84a8UrGx91?=
 =?us-ascii?Q?8LaujXe81am2RZ5zMBsqKe35flIMZf9KQotsdosSsAwej5fHhufS4+x9yji1?=
 =?us-ascii?Q?BUiyO7IuGjSikb+RKzVjaDZqbOhv0YLEIaO7DRN1SoYh1hpjPA/b81eyeLJt?=
 =?us-ascii?Q?fGiOqPKUpWavZC9Ymd2PIBbimWvlnqEfY7HuSxluC3q103fMs/VG6EkYnnee?=
 =?us-ascii?Q?+oDYTfGft4EfZOAf1Va+pibQAU39aovS9IcdLYF6I3XKfIXb+i9yD+fOPIY2?=
 =?us-ascii?Q?SNIGMB+//qPZAidkG402Aniwx2AdVHMRPRZakVdcxfmwIup11TuDitd6YKH8?=
 =?us-ascii?Q?Lpn6gUnemEgD3oB+vkmS3C3zSzd2WMZPiDymqbsdQ6HcSDyr3I6sjhNtLAFS?=
 =?us-ascii?Q?ki+NQ7gnAQ/xPS+3iLDuGL8gBImFz1tX3af4BfocPkXFjr9htPJIxEqLuHmx?=
 =?us-ascii?Q?ffl8Kf/Y1JY+I6UE4eTK3BcGx4nzIT901I3X8BsAxpVg/hUMYS8xhaQtR943?=
 =?us-ascii?Q?/3zPn/EVx0zGW+ny+0ZUxtuWI2/ueTDU9lsBTPArojkcW8J2xrwPDa81/Nse?=
 =?us-ascii?Q?zhitVN998aJAV3r0m0ZzSWZ277hNlZl4BeUfcsPsPDOw1/Re7Irz3tFhGtb4?=
 =?us-ascii?Q?58rQAlWuvIkEfJs0iYNTqdF6+Wy/GiGjyOzoxpXS/gMbYcH/fLCebecblpe7?=
 =?us-ascii?Q?x3SUYMdcZjDfzsZZ/8KedEIAGqfa1Ij0QIDBF+qIdEURby3e82p7Blh2+2DB?=
 =?us-ascii?Q?3OCfe/6RqBXXJBuBj5MrRuhyFTYPPi4esz9UOY38OZZMfMLicCWovetchVul?=
 =?us-ascii?Q?yxS/9qfaMmT3lAFPIt26v4JVy+1pey5wI8sCSXFBEsSPToLGSlDC2pMfYO3r?=
 =?us-ascii?Q?iYuw9OLOHBAF2GpW1ZrJhom+MXrvL+IflpRITH8fRnHiDqTrAYwjDvcjwAii?=
 =?us-ascii?Q?tnSBjOKuTRuw1Lge4ZnzKv6UfGUQy5ZBUgdQnTo3UhIC+lx3XmDLzn1WGbYH?=
 =?us-ascii?Q?ebHmLKYqQn0lm4vvi/zhF42ex+OkL84kFqFJ0nQDnPCDs8SvHICkP5it41Hq?=
 =?us-ascii?Q?IxPn1IUKzPZe61LFqOKJqnOTzA2fC4GmNn+6o3zJCdjXlC6P2RLvb8FceH9U?=
 =?us-ascii?Q?ncnMMte7blmQpF6/yrNncpXjkVKtpBbdpIG9YbMJp2NPo0xup3JWUgrKMAXJ?=
 =?us-ascii?Q?h6IrA7TLm4CY5YH4VjKFS7ffoTTxk/M7Q/YYwHBa/GwP4Hxs1AqhXyHiZBJN?=
 =?us-ascii?Q?q2MDXKH/wjkibGCiNVgVgUprIzQs3bvB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 06:58:40.5239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3711fabd-608f-4034-77e9-08dcb909f732
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

Hi all,

Given the recent change in ARM64 runners, moving a way from a fast
baremetal ARM64 server to multiple slower ARM64 VMs and server, this
patch series makes the Gitlab pipeline more resilient to random
infrastructure failures by:

- temporarily disabling the Yocto jobs
- increasing the max timeout of QEMU jobs
- introducing "expect" so that QEMU jobs can stop as soon as the right
  string is received instead of waiting until the timeout

I am making all changes consistent across architectures, even thought
they are only required for arm64 right now.

Cheers,

Stefano


Stefano Stabellini (3):
      automation: disable Yocto jobs
      automation: add "expect" to containers used to run QEMU tests
      automation: use expect to run QEMU

 automation/build/debian/12-ppc64le.dockerfile      |  1 +
 automation/build/debian/12-riscv64.dockerfile      |  1 +
 .../build/debian/bookworm-arm64v8.dockerfile       |  1 +
 automation/build/debian/bookworm.dockerfile        |  1 +
 automation/gitlab-ci/build.yaml                    |  3 ++
 automation/scripts/qemu-alpine-x86_64.sh           | 15 ++++----
 automation/scripts/qemu-key.ex                     | 42 ++++++++++++++++++++++
 automation/scripts/qemu-smoke-dom0-arm32.sh        | 15 ++++----
 automation/scripts/qemu-smoke-dom0-arm64.sh        | 15 ++++----
 automation/scripts/qemu-smoke-dom0less-arm32.sh    | 14 ++++----
 automation/scripts/qemu-smoke-dom0less-arm64.sh    | 14 ++++----
 automation/scripts/qemu-smoke-ppc64le.sh           | 12 +++----
 automation/scripts/qemu-smoke-riscv64.sh           | 12 +++----
 automation/scripts/qemu-smoke-x86-64.sh            | 14 ++++----
 automation/scripts/qemu-xtf-dom0less-arm64.sh      | 14 ++++----
 15 files changed, 104 insertions(+), 70 deletions(-)
 create mode 100755 automation/scripts/qemu-key.ex

