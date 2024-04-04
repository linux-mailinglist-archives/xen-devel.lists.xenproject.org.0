Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777E899033
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701000.1094961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaR-000342-RJ; Thu, 04 Apr 2024 21:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701000.1094961; Thu, 04 Apr 2024 21:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaR-00032V-OV; Thu, 04 Apr 2024 21:25:31 +0000
Received: by outflank-mailman (input) for mailman id 701000;
 Thu, 04 Apr 2024 21:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsUaQ-00032K-6q
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:25:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db057ca3-f2c9-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 23:25:28 +0200 (CEST)
Received: from CH0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:610:e5::9)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 21:25:24 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::dd) by CH0PR03CA0244.outlook.office365.com
 (2603:10b6:610:e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 4 Apr 2024 21:25:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 21:25:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 16:25:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 14:25:23 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 16:25:22 -0500
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
X-Inumbo-ID: db057ca3-f2c9-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA07AWByPcWNHvvjUHGNTH0jSM0M8TWZoiqQfDdsfBEV48gBV3VBR0xSuu6kCgD0OwgemhJTitM/wfc7OtMYWfKq1YxEuQDsUQVvbw7LIhH71ZVynCS9MNKhV4jTn+mT/vwoz0Dqbm7QXvrxtRY29ERpRon+4EweGKz1QJM/GEbItn7PATosr9UVnkStDW9v36Xy+HBrxYHzFS2kf2HEFHCQDfb+v4QOeKt1TRjZEKzGZbdCOuO/K1fIvchKZalfzI1+Q8HJUkR/WlbP5yFmk7913r7tlrp7WYVBdLEAO9I9shL8MoACefek5lgCcQWsCNA99DZXZLTnS2u+RiNbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sF4kys0nGuPC8w6rPwBoaTnZtRJEg8dPB/vYgFerY0=;
 b=GOdmeVtSsL07xAUdA+O1/BYBUVFxNCIJ2FSPNAh65kCyw8sW5NdIVefe2QvIW4b86VALKB6gw9xl09TkILVWveR7BHV5yKjlAqdPZBiq2uqk/+l/TywpCbg2BPvp+KD+eEnx8E8m9fMbi2Rz1H8IMHVhff4FuglTKyaI3S4cibK5fSpzw67mGKIGjsj3/+HUPVuSBJ1S1LLbC1vNGm04iO414znN7+FJOqQ9J/sAdFtoHwPq44lshpqHu6tgpwqsCJ82VjiaYBvNy/wuXrELx3AGdTl/aimdizaXAwLIVNVVY867xJxNoINIwltGHp0X0Az9NfJx0MV9QvDXad6Fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sF4kys0nGuPC8w6rPwBoaTnZtRJEg8dPB/vYgFerY0=;
 b=1fVqH+eM0MjqubNTf5cytBvd+mMAQalk6oI3zEz8wVEx3w5PbAN8aoHAR4FsI9OAcNxtTjRsz7044Hs6DzIPoA5ax2P0zd97CEJTiCPH7qptdQVrZUYzdbsYqQhg7jbLtQbSXjiD7aR0DcHWdKFnNM8fN0JmczvvXIAvkTOFIno=
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
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v7 0/2] x86/pvh: Support relocating dom0 kernel
Date: Thu, 4 Apr 2024 17:25:17 -0400
Message-ID: <20240404212519.16401-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: c869c98b-45ff-4afb-e406-08dc54edbd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwd0Xi8rBUpUTovc35CzFznnJKsg1m4/LfAJjC7itzrQT+qGsQhidPf6ttcyqF5XJdKw5TRrv93rlaBNZpOHLBusZiAQrm/Tr+OfXmUTWnlTs19wAXGleglolU9nDoI+LtT5iptBjXX/3lux9pkGYR+wKOiNJFSDjF2ZQJAzsX11NLn+QsUiF0fsNtYkFN1cK+JyhuDlVCdaUJueqNOp49XjKKn/GHcRUxiOEaei8jPo4Zchf0YYWqlweOvilmnWgj18BSE51JdFYUe5jNZkSGHelVcYIHUPcRg7hicFCGYab0wiVIK7zpdv1Rk+ghlBcN2WPZF+ZHFWSG4tAMFBaR3eJcp6TtOpWlfQywLZ79YqxxI6tehexzwUvoJokvHSK0OCbAdKZQZqwrdjCpJE/kXrH+tcuaeNZLiF2BdRMmcbaHpTxt3yqjw+uJqCizmNM/nOv7RdVs5gxKwv/TprNCXCkIhmvWPX2FgSk9TJUT5LcFuJk6Dq4qm+z0d5QlPbX6Txs6f6NIHbM4w9hIPQlKA10SyvtxbWvlXfbp+3vozzw5SVQoV3ABpttvZOLHZ0xLiTdMcUM5a9CGWs2xprsgvZrzm1k9ac7f1Rk3m/6BSm2L420POgraiJSWvd7vIYnuMGcQZeL8cbT7UoqK7JOu0O36Un3J2gPdLtw1510cjDIO4u9jPOmvhQXdk6bBtkz0HAR8eOUX+YcPBdhqqKYlL4IAPYOa30/WL00UKr7H34xiaIRYOmLYMJwti/Y/yA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:25:24.2229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c869c98b-45ff-4afb-e406-08dc54edbd99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The other issue is that the Linux PVH entry point is not
position-independent.  It expects to run at the compiled
CONFIG_PHYSICAL_ADDRESS.

This patch set expands the PVH dom0 builder to try to relocate the
kernel if needed and possible.  XEN_ELFNOTE_PHYS32_RELOC is added for
kernels to indicate they are relocatable and their acceptable address
range and alignment.

Choose the alignment from the Note if specified, or the Maximum PHDR
p_align value if greater than PAGE_SIZE.  Otherwise, it falls back to
the default 2MB.

Patches from v6 commited:
  tools/init-xenstore-domain: Replace variable MB() usage
  tools: Move MB/GB() to common-macros.h

The first patch stores the maximum p_align value from the ELF PHDRs.

The second patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (2):
  libelf: Store maximum PHDR p_align
  x86/PVH: Support relocatable dom0 kernels

 xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c |  35 ++++++++++
 xen/common/libelf/libelf-loader.c  |   5 ++
 xen/common/libelf/libelf-private.h |   1 +
 xen/include/public/elfnote.h       |  20 +++++-
 xen/include/xen/libelf.h           |   5 ++
 6 files changed, 173 insertions(+), 1 deletion(-)

-- 
2.44.0


