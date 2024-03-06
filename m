Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85CD873FFC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689469.1074475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwLv-0007m9-OP; Wed, 06 Mar 2024 18:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689469.1074475; Wed, 06 Mar 2024 18:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwLv-0007kB-LY; Wed, 06 Mar 2024 18:50:55 +0000
Received: by outflank-mailman (input) for mailman id 689469;
 Wed, 06 Mar 2024 18:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toy5=KM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rhwLt-0007k1-Tq
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:50:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20615.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73923d18-dbea-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:50:51 +0100 (CET)
Received: from BY3PR10CA0013.namprd10.prod.outlook.com (2603:10b6:a03:255::18)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 18:50:47 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::4f) by BY3PR10CA0013.outlook.office365.com
 (2603:10b6:a03:255::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 18:50:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 18:50:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:45 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 12:50:44 -0600
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
X-Inumbo-ID: 73923d18-dbea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUko/WRHKKy4khx/gNd6FIZb6OTcYmxUc56ULo6LbLSygrtZGNCn1jYvlwo+/8GDDjvqVICJobuI/jN4DZI8ap3BICpjp2d5Gh0zIwhS6AtPCK3aBhwrngpC2PV13EzmLrF6HUlh2ER+kkU7mz9N5y5hsAc/Dy2SYpKq783Q9mbWHJO8kbt0map2cvdGoh2x3HEq1wXnYM1OZcdOvyK4Cg7WRy7XrPvgGIC5GW2mlzX9MdRq6KRqQV6ZqIgnUc32F5NAGL1VZ5Bv1fOjSSUtoV1gDsLUZcMbBNSsaRj1hlbqlKCg6/PCWzsO0JBA/FdNbVlEdC/3dh+sgmzZrZ7HKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXHnUUkP0I4VeoKV7/n47noRYWOiKkviRFLs6MBrGmU=;
 b=FmbQqw004F3CuzhI2HYEsqlBILPWJz1rt8ssFzTycTIlC+GSflBoTa8+NjDNl5Ib4gPEYoo0AaoqTtBOTuo9nD2A+BAj4geyAjmCWizB3DFIGjN3VGhtWUP0EwsOzJxOvSOEwsYfzp0ctQchpsDUhPy9ShslXBnVopuLd79T8/aAajTNJqg5VLiqBqiYQoRo002vFy1IoNfEkwlzpvQSze5yOdySHMJLgsoS8b5ZuHAEOqqOBU6FtdlYpEJ6n+fldAwQxeb/BuBl4tvjDWt7cBcsc9WTVrl5t2d/wPPnV5/fvUFgn+3oH/YvpvOwiuzJWM93H+7ePhV+O15G6/heYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXHnUUkP0I4VeoKV7/n47noRYWOiKkviRFLs6MBrGmU=;
 b=Ss+RV/atmNx1YgCBe/9QLqV/+GEdZy2V6cx1u35BGLXfYZHaVD2Im3MOEGHLYjFQMwvNUXKImsZqrRdU5B5Fs1lLZAI393uMRYbhkUp7YCR+1bu5ER/U6h/HBQagYB32uQrviyGGKTIJWumhBR1KMNKHWCw4ugp2vFz7QdOVRA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
Date: Wed, 6 Mar 2024 13:50:29 -0500
Message-ID: <20240306185032.103216-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e4a1b4-af04-4651-4b1d-08dc3e0e5598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pl4qjhsryXvRh5yMGIJ3kaizq/WN9iqLE4A8pnHbGPNod2NMO3JNEGms/gOPYQyDIHEXOB5kazUr+QmkRZhmrgJrVFuhijGECLQfEfjxTvQsb1pgbNaft/9u/TOqs0W6/5GcbfxPuSFHontEZUKMWJgMPUDc9ckZ1vl/Hra5tnC66gpkh1jniVQ1d86xWRPettYR5Aag/80W3G5hOohKSDZT1i4CVuZg1KtxU8FALQiB66SC4oScueb2S4sflhfZgWKFJ4m519mLqhncaFbiLoei+AEZcWl4+bS06FzY/Dv9cBF08elFvLgHaHoEctGJl8e7KkJDXXx8A8ynRcbsx10Qg+UKle9YSkOZI0m4toNti7qlzl9pxTD3h+CsFG1Te9DkIB0vKrXQgeB08lVfmyDtLaXS93vNwGq9izClwjTGD13CCsZzMOfaN/giP95UydDKtYkdmFRwZGKX1pHX4sW86DJF8Mq0cgWi4/Y34DB4v5zlflyI1uaNrLhNI4dIeVSmWkwRSUZLiWeHHm15tNeFqIrq1g7UarUh4NtfqGz+x1tzXjhTcCE0JNgT1TKBuHERxz3bFAGeW1C6Uxtbv/glGs59IXmHsUv//YsLy5Bcx3YBaiMIfB+BP371Nks5nxMiA78o5j5G9m3ol2CGHK6QLJKFFvBG6pqBKpw0pvkRFTkS8SwMqkwbTRBT3EJAQjn4xELpva7j46DIA6uruc7bF7kK8dQg+Z2uLXH4mu3Z/vCW7wRl/BZjYzy7hDqx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:50:46.4869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e4a1b4-af04-4651-4b1d-08dc3e0e5598
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The other issue is that the Linux PVH entry point is not
position-independent.  It expects to run at the compiled
CONFIG_PHYSICAL_ADDRESS.

This patch set expands the PVH dom0 builder to try to relocate the
kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
kernels to indicate they are relocatable.  However, we may want to
switch to an additional ELF note with the kernel alignment.  Linux
specifies a kernel alignment in the bzImage boot_params.setup_header,
but that is not present the ELF vmlinux file.

The first patch fixes some whitespace in features.h

The second patch enhances bzimage_parse to pull the kernel_alignment into
an optional align pointer.

The third patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.  

Jason Andryuk (3):
  features.h: Replace hard tabs
  xen/x86: bzImage parse kernel_alignment
  x86/PVH: Support relocatable dom0 kernels

 xen/arch/x86/bzimage.c             |   4 +-
 xen/arch/x86/hvm/dom0_build.c      | 113 ++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/bzimage.h |   3 +-
 xen/arch/x86/pv/dom0_build.c       |   2 +-
 xen/include/public/features.h      |   9 ++-
 5 files changed, 124 insertions(+), 7 deletions(-)

-- 
2.44.0


