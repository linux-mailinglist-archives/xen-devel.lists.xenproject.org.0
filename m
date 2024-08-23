Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D195D618
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782598.1192107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5W-0002Qs-Et; Fri, 23 Aug 2024 19:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782598.1192107; Fri, 23 Aug 2024 19:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5W-0002Ol-CG; Fri, 23 Aug 2024 19:36:46 +0000
Received: by outflank-mailman (input) for mailman id 782598;
 Fri, 23 Aug 2024 19:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sha5U-0002Oa-OP
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:36:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2417::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c11546-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:36:42 +0200 (CEST)
Received: from BN0PR04CA0194.namprd04.prod.outlook.com (2603:10b6:408:e9::19)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 19:36:36 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::26) by BN0PR04CA0194.outlook.office365.com
 (2603:10b6:408:e9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 19:36:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 19:36:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 14:36:32 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 14:36:30 -0500
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
X-Inumbo-ID: 05c11546-6187-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phzclxUEcNieUgcjJC3lGJWS6Rf+FjnbRSCBVXVOFLzZNPujw4UB5iMdG8PO+/J7kqa3fCvDE0hmMIe6ZTaddH93HZgB7LN73d1h8jmW8ZgnuNKFkNFom2A2lABTD058zr/5k8Qs17FFmEFmU3i4cFxpvNCHDgpyDhuycVcouWTMeNpcemH63qIP9aE6MwTuuC+H3c6tJFlrzQTm5YrENiStzQ2b7ZgeeFQScYQawF6vzlUcyTH9glPlrJL+2Fu/kJanUt3y1J6Q3UEMrQvxhdaKi/gcDQDK1kcVIX1ldcfaC+W2O6XYeNhvMKVMSv3r3+wfEPzq2bUAy1aGmeR1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE/FHW+MnLIK9zq/+3hrk0lf43oLDdOIR+bTH4i7kl8=;
 b=XU6BlZWhUttTWeHoMC0Ztg7lQmiiOHDMG90yfygJEUgQ05AJSxTtrh7QodYxg1m1Ng5igPkZjfiDJGGHXkGaGkCeu2uQTrkKe1URIaOaJXEce6Vu0o2RCHXt56zl8a1SUBBSnPiexVLvPJpaS+T/JwrXdcN2PmKfhHWZL4RhGlh4tOZhJa2NRcoJeZ2+vOZuNcJhvhAGFuuYl1drjY96m6vGl4MhbuJVgtRbE1DJzHOQrpV9lATn1aTyj4VPKVouCXHtwAeD8wnE527jEjEwbfkfZdF2vPu/4Dzux8DMeBleD727GXCPzREocne65+amDYvYWZwcVfaFHQPTi88pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE/FHW+MnLIK9zq/+3hrk0lf43oLDdOIR+bTH4i7kl8=;
 b=M+iQS0RK+4m48b7YoGmwD2vO4r8QIJ4a1CzmnsdlVCD3KOWbZstHBqUSg3V4wQ5Ck7DBJcWvlR8Jak51iYHMmoB5vdLDIGbrnNOW+5qikvvAfP52353fEkb9AwA/1kEj8d/lCfVkpmqVXIwqvrnHz5OX4FG3PDTEi1yMSvqqHl0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v3 0/5] x86/pvh: Make 64bit PVH entry relocatable
Date: Fri, 23 Aug 2024 15:36:25 -0400
Message-ID: <20240823193630.2583107-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 94032644-194a-4adf-e661-08dcc3aae662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/mKgLiFErO75DiugM2+mk9cPaSZAThHW2l+SH1EaRbYhrc+xhfZGggr7tHz/?=
 =?us-ascii?Q?I0H0ITH61c20kcnevbmb5xAC7dnfbl1fkPaMhLoN52M1ZciH1b+xVA14AImz?=
 =?us-ascii?Q?zt/niUWYiacn9wmYzACIzOib1jpaFmBlhF7kE1Arb+lnye7q+v4fZpKWSJlP?=
 =?us-ascii?Q?VeoraliDMQoF/nIRBM3WkjNRWaXwOW3yEUEyYRpVgYJxjL8P5Cs8qC+D4n3y?=
 =?us-ascii?Q?nulXkrnE8r8fTr1iz5n6DTPAD50ubhFxp9OMG3XanW56NwoClALlaZQmZtAS?=
 =?us-ascii?Q?fdZN4HLZ5WYxxsLGY2IAM4saOe5fy4kk2KlbLQ86g5FnkS2vZsMY2pqdQPjn?=
 =?us-ascii?Q?9pvToYw4H1hsjAD6f8ywR4RZoSntt42ZhYCeB+lWSQW47yOvv0lMvkpp7qIw?=
 =?us-ascii?Q?hiLE+qv1o8fu8TwjRIve+loSUcZs60yQTTA9icYzLOB6o8QH1CNaa7zKZ+Sx?=
 =?us-ascii?Q?fRrz5jxCsVoRqRmkHfEBVBlciiruRKwhqAdxybiqLERyOLTEsoiQ0pD0u4Yq?=
 =?us-ascii?Q?/dhnLxQ/hoRW8U+IdgC5sSs2R2LbdUUqEVGlOlTYZgtdxajoXCJVfSJJXQpU?=
 =?us-ascii?Q?agUx4s2WpN1gbZpqC3ng9Ty8GKH+Dt7OIBKFHKd5p/fobTqon8FcP5QbY78G?=
 =?us-ascii?Q?iMGpU1OMzkdq1gHHXtP5rr87tVVrjn5smExFhWp3MoJUFnJE0tah8t6Z+2ap?=
 =?us-ascii?Q?uBgSi3BuTSsbOetZt+CoY/U3OVHa7Iy4lephxWyiQ9nZYwA0PAD1se64M0b8?=
 =?us-ascii?Q?wAQZtiUM7OXoDra1LoCola+Hj2QJudB+9i+4G4iKlUyd78mVWpTyQQaKynum?=
 =?us-ascii?Q?88ncUxw5fIgUqbj1ZKxOGhGeNa2p4kino0P+lG/WGArz3ae74ZmXdZAbyehL?=
 =?us-ascii?Q?2RKV23JM2qrT0gHLwX+esUn9dnnQGJ1GesGpdWQvdC5SihTDFtoxFxIKi4AV?=
 =?us-ascii?Q?1arU3saVFNYpXAlyaLeHRoPQqlsOZoNlb0TzIhma0exOB8ST7UQwgFpl7nrp?=
 =?us-ascii?Q?DkmUn6c8jAOc1WYjMdZ9ChY04cogmHLCqtMlbvIND7mvL30sh4nPfNHrCCmY?=
 =?us-ascii?Q?EDnKPhOBT5Nm0uFUE68z3vPk7s13NuPJcg/TyEOv+ERTWwkbd8o/xmNfJFmT?=
 =?us-ascii?Q?VE0idqu/CSp8klmBxK8H0OvEuoT+sfMTmzNlwoIhqVRTm/AIQD3pg9pEbj/x?=
 =?us-ascii?Q?x0UVHHvdI8I5h1fQEJA0hGPErv/AfSQheFGxNrK4mwiq2WKuy8Gb+TRx7qga?=
 =?us-ascii?Q?j9XKXGstKCqMAQzBQnGBPLKBU9rqCLHHJZACFt5nrgqfX8ickm6bw0CcpXXX?=
 =?us-ascii?Q?k/yLPE0tUvJJEOMLgPJIy/eSWjoGD/8cnDLd/Ar4mUp6s19q0J74jBpQPhpE?=
 =?us-ascii?Q?qH1YS+rvZOEZaDKuTtozHZb82uARvoX5GZAHb0LKdBWzdhCDiFMoBjeHjvKH?=
 =?us-ascii?Q?1gYJmWqO1m+wOYSIBz+JJiSTON6PcKG9+YpdJzqyfAUiqiGse7nOiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:36:35.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94032644-194a-4adf-e661-08dcc3aae662
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960

Using the PVH entry point, the uncompressed vmlinux is loaded at
LOAD_PHYSICAL_ADDR, and execution starts in 32bit mode at the
address in XEN_ELFNOTE_PHYS32_ENTRY, pvh_start_xen, with paging
disabled.

Loading at LOAD_PHYSICAL_ADDR has not been a problem in the past as
virtual machines don't have conflicting memory maps.  But Xen now
supports a PVH dom0, which uses the host memory map, and there are
Coreboot/EDK2 firmwares that have reserved regions conflicting with
LOAD_PHYSICAL_ADDR.  Xen recently added XEN_ELFNOTE_PHYS32_RELOC to
specify an alignment, minimum and maximum load address when
LOAD_PHYSICAL_ADDR cannot be used.  This patch series makes the PVH
entry path PIC to support relocation.

Only x86-64 is converted.  The 32bit entry path calling into vmlinux,
which is not PIC, will not support relocation.

The entry path needs pages tables to switch to 64bit mode.  A new
pvh_init_top_pgt is added to make the transition into the startup_64
when the regular init_top_pgt pagetables are setup.  This duplication is
unfortunate, but it keeps the changes simpler.  __startup_64() can't be
used to setup init_top_pgt for PVH entry because it is 64bit code - the
32bit entry code doesn't have page tables to use.

This is the straight forward implementation to make it work.  Other
approaches could be pursued.

checkpatch.pl gives an error: "ERROR: Macros with multiple statements
should be enclosed in a do - while loop" about the moved PMDS macro.
But PMDS is an assembler macro, so its not applicable.  There are some
false positive warnings "WARNING: space prohibited between function name
and open parenthesis '('" about the macro, too.

v2 addresses review feedback.  It also replace LOAD_PHYSICAL_ADDR with
_pa(pvh_start_xen) in some offset calculations.  They happened to be
equal in my original builds.  When the two values differ,
_pa(pvh_start_xen) is the correct one to use.

v3: Fix build error for 32bit.  Add Juergen's R-b to patch 4.

Jason Andryuk (5):
  xen: sync elfnote.h from xen tree
  x86/pvh: Make PVH entrypoint PIC for x86-64
  x86/pvh: Set phys_base when calling xen_prepare_pvh()
  x86/kernel: Move page table macros to header
  x86/pvh: Add 64bit relocation page tables

 arch/x86/include/asm/pgtable_64.h |  23 ++++-
 arch/x86/kernel/head_64.S         |  20 ----
 arch/x86/platform/pvh/head.S      | 161 +++++++++++++++++++++++++++---
 include/xen/interface/elfnote.h   |  93 ++++++++++++++++-
 4 files changed, 259 insertions(+), 38 deletions(-)


base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
-- 
2.34.1


