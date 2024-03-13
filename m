Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E622887B209
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 20:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692751.1080188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURK-0007MM-V8; Wed, 13 Mar 2024 19:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692751.1080188; Wed, 13 Mar 2024 19:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURK-0007JN-S5; Wed, 13 Mar 2024 19:39:02 +0000
Received: by outflank-mailman (input) for mailman id 692751;
 Wed, 13 Mar 2024 19:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOmT=KT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkURJ-0007JH-Ou
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 19:39:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 564bc085-e171-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 20:39:00 +0100 (CET)
Received: from BN1PR10CA0012.namprd10.prod.outlook.com (2603:10b6:408:e0::17)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 19:38:57 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::46) by BN1PR10CA0012.outlook.office365.com
 (2603:10b6:408:e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Wed, 13 Mar 2024 19:38:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.0 via Frontend Transport; Wed, 13 Mar 2024 19:38:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:38:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:38:55 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Mar 2024 14:38:55 -0500
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
X-Inumbo-ID: 564bc085-e171-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY35FrMSL9AQQ4+xljyowJsW74P4wtsdMvqzVcTh6CSAuOLBdb4gpJ18dM/P4oQ+v+USlWYEVbC3FIzyW43TxrTUXwDDjTSn7HaOu7ZzW4O1bKYv6G4NpgrW/4k0LLamNjm0qFMLnZna1ujoBsrCI1L1482CPk3jUYjnWrnrX5SFc/9aA7OyfZNWGP5STJM/tuA30uKzmIjON1ukzhCbwPxzcOePsrBv9PDNpdmPZR4e3QLnQ1481gxNfkUI/BkaNKo53phn/QGDRjztZ7WQjPmbiXcMv0eqCmKfp0n96DbsFGVTCVC0tNTTMFz4hTZwI+poV4Wnx8KtwGaN0F6+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz4h54/N/vGW4eVNNvLMe6hEsmbsEffwEzT057PZlXs=;
 b=cobKFs16vqbSl/boAwlV/bgvQqvu2Nswg8is3wJOXgBi7SNIHxe7DB/ddIg44sQmDpbyIghW+stT90ZtRxoo5cAzw6v/gz/AYC5ZhMp2x/cBDwcMGPwmOczupAyeHDQOFJQuHncWh6I26SkxfZwPrCBXUMku2sjRXfrzV9v33U5w5R3FCP/+gk2FF+9mIoeFbllgxoi8At6tbUOxVeALpQP+gRIiQ+zJp/aXl2+Xvq9qbC1EB38XO9Ctdd+5ZD0CJ7997TKP3TmPsFF/+NTQUiEcfmu/LU3/tHxzBmMDCSJF4+TAWuY+gmo+Cjp6Lxso7E0x8gqfW33VWtYEHrpwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz4h54/N/vGW4eVNNvLMe6hEsmbsEffwEzT057PZlXs=;
 b=JFrAHE1fKxniWaUIZvIM7fGZAT3OzBbfTTU8xLYtsvlFGCafEi03IndHAeHnup1grOIj+319OFNHWf9EVXJllt2lDqQ/KVl1TH5290Uo/cWOvjY9N4bB+na94hHkQDgcMajK8afmZIj61lr1CAYwcgA7DPbJapYYrTBb42nrd8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] x86/pvh: Support relocating dom0 kernel
Date: Wed, 13 Mar 2024 15:30:18 -0400
Message-ID: <20240313193021.241764-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 07128a3d-93b0-48b5-66af-08dc439538f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NI0tetK6zEeojuZ1GrjDoEuynu0nAvJagg2FOO67ScBtTzDvGvJD8rC28a7VH+R5vXw8XsCOx1ZXUB8o7hh7gtPKO3TIGaAcEDYHrnOZsrVcOdzM1OB/u7C9sDXMaUx+eHw3zejWPoyLsO1RBSTy9D90EGJjQ+z0uybrolXJRVgxT3crF2+lSEl7Uq4td3cZtxhpUeWm+4PddeoVYZxsukQGBZlhbQvJdcGSQKOBcPrayJbJ4NG/oOMHE8w4kEqzqI3d/3aArx01BRsT1oVd7wecOCNa3n/9u6GwOMmu+05vuq1AmM5PjOM2s9BiX3+GTgvGYcK5B4VESVb7Rn+CvgkDZIuJWrM4ZLV0huUXQoI28oQE/PO1UcTTZxpV2pH7Qv9R+e30sfgZIBF3CQSWP+GhAoiuVk2uxOn3MOHvas1+7q3TrjE93KnAYyn907tAfMNvSr36ymkGk3crVE7bc+c3b8gE7is8kM1oy52XLtzyOr05x8guF9/Gt/mhW1aVihGBvvLxGOmz5+/C5VOHiIgUSs2lIFud/7gx1aT+kEBkbWRdLjaR2vtfBrh1wH6og4mu6D9McLf8XB58W/0ymfL0APagNM1LDdJHiFV117O9IvA56gmSVP2LnDa8cJG6cMx45dWehHnVgOghC6CJEF/jhPp4JZDKYo3eraGhZj5F3qRVxAsGm2TYZ1xJqW8OZ9aI/anWcDpyv7uugW1891x0FYHCi6WpTO4U9KilzSL4vIOnPFhAuGz3cf8y9tRh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:38:56.4093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07128a3d-93b0-48b5-66af-08dc439538f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The other issue is that the Linux PVH entry point is not
position-independent.  It expects to run at the compiled
CONFIG_PHYSICAL_ADDRESS.

This patch set expands the PVH dom0 builder to try to relocate the
kernel if needed and possible.  XEN_ELFNOTE_PVH_RELOCATION is added for
kernels to indicate they are relocatable and their acceptable address
range and alignment.

The first patch reverts "xen/x86: bzImage parse kernel_alignment" since
the alignment will be specified by the ELF note.

The second patch expands ELF note printing so arrays of values can be
handled.

The third patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (3):
  Revert "xen/x86: bzImage parse kernel_alignment"
  libelf: Expand ELF note printing
  x86/PVH: Support relocatable dom0 kernels

 xen/arch/x86/bzimage.c             |   4 +-
 xen/arch/x86/hvm/dom0_build.c      | 112 ++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/bzimage.h |   2 +-
 xen/arch/x86/pv/dom0_build.c       |   2 +-
 xen/common/libelf/libelf-dominfo.c |  72 +++++++++++++------
 xen/include/public/elfnote.h       |  11 +++
 xen/include/xen/libelf.h           |   3 +
 7 files changed, 177 insertions(+), 29 deletions(-)

-- 
2.44.0


