Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD008A00D4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703593.1099303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwM-0000Qd-Dt; Wed, 10 Apr 2024 19:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703593.1099303; Wed, 10 Apr 2024 19:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwM-0000Ob-9r; Wed, 10 Apr 2024 19:49:02 +0000
Received: by outflank-mailman (input) for mailman id 703593;
 Wed, 10 Apr 2024 19:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkSW=LP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rudwK-0000OV-TL
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:49:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f333b46-f773-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 21:48:59 +0200 (CEST)
Received: from SN6PR08CA0007.namprd08.prod.outlook.com (2603:10b6:805:66::20)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 19:48:56 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::90) by SN6PR08CA0007.outlook.office365.com
 (2603:10b6:805:66::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 19:48:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 19:48:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 14:48:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 14:48:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 14:48:52 -0500
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
X-Inumbo-ID: 5f333b46-f773-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXg0/SvRmB2zsmOymhR4ZotI9taE1NG2IA/Inrr91VQHN49cD0gHLn1SeZ4JSKvu7ql397rkOM3QQvg58uYqhByxl1H9Hve9srBis8VNmybXeka90DUa76F/fgpV1I41q1OS6U60Ac73fhjjE/LNWwmJ7UgDPr5Aaoq7zqofV4wE8YYtNYEBFv+IJKHOpcZrsFv5Mh+c2Pg0fmNbyGGpK9tdqKrwsd+q5jmDve679dpJElj9tYS6TmfBI5hZdsnACwcPrYItlCjylbMlipcVIjn1ivNqDztMISXXPIXC/u4oP+bdegCk8Q1lzBLcYHtncTvdiKyn6xARrb767tghFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0LRVzS8grWUW2SXthNFTo83cUa9GynSeTFdqAUi4wo=;
 b=Ki3rMboSt47bv/SI6Yn0E9jgUWPets3Mo+LtgghrGljGftVZcKlKlXxnYpji/c3yrWb0bvyUVNaA4ijiMJUH4L0B+g++GBZJvPmb5IK5RfRCz87SHdiebgSABCyp5MzK485VvU23pTDSCUhaVJYuTs/m5VUXo0Fpw6NpEU3IioeEYzVx9Xbh/20iWM+EYstG4UJllJCU47Iwc/22JeQd+Y9RqmIBY1CXpvl0/GqPIgp7J9Q+Adfq99itxbW4VPlOrnOk31n73QvULDwViH4CEAN16I+lrudbPQH/4w8jw7S/64iuiZZzaDA60KtmWW99psxDEpM3D2eeGipi0SpWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0LRVzS8grWUW2SXthNFTo83cUa9GynSeTFdqAUi4wo=;
 b=xCEiiU4Mpg4Z2mCQw8yadmTbTodX1nU9r3WPt9mbIW4/SJRM7lVuS+R7yFxmEXin+4xRJS+RCXtIAZgoQsbNy0VSCnYkHRhk4P3bJpadac4PnMedo8KoUvATkm+NlvrI/+Tyt49P0YI+kpqubjXC2x6jqx7AxhXcLQFvDTlrq0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH 0/5] x86/pvh: Make PVH entry relocatable
Date: Wed, 10 Apr 2024 15:48:45 -0400
Message-ID: <20240410194850.39994-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 28717031-e15d-4c1a-2eb0-08dc599741d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H+zzQjvRY0w9QKyty8feI3ffpbd+kGRTEAPthS7CtX0N6qqYDcygx4O/wiOJYRNlx3f3dmZ1EsPfN4kka2sSq80/l97orx3EVos8OX50YhkJy+54apPHWQu3qk/DI9FoQEg/n9hLlQGOhoSo79pq9KDeWXg7nrr+l7XEyd+lQXUHpZF1+5LTjIte6SvMjfnR/wS019g6vyLntPh16yks8LB240wfhLQiT/f5Wuapeyfeh7Fw7kLwVhG0MIpctezwq2NnPi4m2fgrVtWhmSJe/qPamQq7eexaBG8ovN3zvcVRXGo4GyveFPu4/V3rBr0ckeAwctkBTFvb+hnfvdsAW9uN5tohTJk4ZxD8XwYTN0eY6GZ9pY06HjspmMioa8oZd74B9XGommmfTny5IpgMf8ljrMc1Oy9RlMyuBrdc21+C3nLz23fZzFeMJG1zs4bufPmTxMcYizhOvO192R3MKGcr8PUudMV3s3KfNFw5eerh8LXzFvkiY+N/+UkJ87SbOkkqT4+6WzW8ey6WVTVp5ierk5LjQSJbVgceFb/zkxh3Ml0dL7oTVyMDRWyqAz3bUx1pr6S4VylEsr9Ljln3gBwSgBVkLM5t8smWetnLpoL+puinDR7t7AZ2kZ0giWheqPnlbt/xfd2/yqdNU8fIzXMWwXrRSmaEmfxcfeCFRvgy/PRZWaAnsFBOVjA3vzEAHo9lU3o3mpSZF45iY/87CBreWyNi+EBtl9tDXp+xQn9FmSajxKNd9Q2w1QZsg2rukk/qn2n6d52zbxConuzhaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(82310400014)(36860700004)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 19:48:55.8697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28717031-e15d-4c1a-2eb0-08dc599741d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822

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

Jason Andryuk (5):
  xen: sync elfnote.h from xen tree
  x86/pvh: Make PVH entrypoint PIC for x86-64
  x86/pvh: Set phys_base when calling xen_prepare_pvh()
  x86/kernel: Move page table macros to new header
  x86/pvh: Add 64bit relocation page tables

 arch/x86/kernel/head_64.S            |  22 +---
 arch/x86/kernel/pgtable_64_helpers.h |  28 +++++
 arch/x86/platform/pvh/head.S         | 157 +++++++++++++++++++++++++--
 include/xen/interface/elfnote.h      |  93 +++++++++++++++-
 4 files changed, 265 insertions(+), 35 deletions(-)
 create mode 100644 arch/x86/kernel/pgtable_64_helpers.h

-- 
2.44.0


