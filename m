Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A698252AC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662142.1032066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiHI-0002ir-DF; Fri, 05 Jan 2024 11:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662142.1032066; Fri, 05 Jan 2024 11:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiHI-0002gm-AR; Fri, 05 Jan 2024 11:22:16 +0000
Received: by outflank-mailman (input) for mailman id 662142;
 Fri, 05 Jan 2024 11:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BO+=IP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rLiHG-0002gg-J6
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 11:22:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7f55d7-abbc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 12:22:12 +0100 (CET)
Received: from BY5PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:1d0::18)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 11:22:05 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::dd) by BY5PR04CA0008.outlook.office365.com
 (2603:10b6:a03:1d0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 11:22:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 11:22:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 05:22:03 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 5 Jan 2024 05:22:02 -0600
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
X-Inumbo-ID: aa7f55d7-abbc-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf4+H0x2ddP44VqYKY+Zr+LFUr5sPOWz/ZlhwDWGJz+paDpsWshH9GXRN/nrvxsigP9x4kSNFe/5GSis28Nh0oA+OF817rswMmpDdFbNqbNupdcTBFcGKey2x7nr0I8kNNL/vQcI7UsY5Aa33KMlZGJxLd4k+++ivTeQByN1lAAApyNM854iE9qaLCpJsbwvcdzLHmZid0AJrQ0/Q/z2a/toIgRxjSpOA2vtmeTzq2G8EB1r0gQcdwxSCJ/pjF6x10dvrjfCIT8R1dt7L8pYv5CoHroC9IOi9aOkGVqT9yo+8gHGMuw4L8ntTrHrg93wnSXIPwKLSCI2fC5hLI9XGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSCPV8VAwCz21WRagwjp8pOvRQ1IEBsprgtBT3e6UMM=;
 b=aHxbHwgL4zyE2lLN7iT5zTUG2CclTJ8Mu1K2yFfBvo8xPofxAlucpzAvfKsxEujV1j1D73QxHrx2jApiqVbmcb0qfUaT5WdXF0QrkONYimB/ibXEsZY/f4nRu1R6fpUy8VMRg2FE8qz+c1nsRLXM949QsHVNZX7jg2e8uoFLSP1f5eQT0r4Rp2NnGTZkLXt0fkVxTtMgBAaghB++HqRmB5w7RHsx05hpVSZUhgJDmd5WNX2Z+zFsVBqRxoJxPbmh59hwhwgdE+y2FP1a7pSd7PHjyYw+wKMiwL8OVKyXfVXXr7FlTYqpVssGjvaqyUpoh37ebiimQf4RAe8H64cWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSCPV8VAwCz21WRagwjp8pOvRQ1IEBsprgtBT3e6UMM=;
 b=f6fouVp0XPUuHppBjLS4L4aaxri+g9JgnIKNwun6R1pFDz/a5XTkIwcHV0/QPWIwn9N7QoGKvtSK2bgYyZZoHsNuQ43bW40SnMAzQt5IC0JctNpxuY183sv1vMIyZ/U6Um4/vv3cs+Y7py66lRfooSWGtu7Uf7fu4I35JxkZY/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v3 0/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Fri, 5 Jan 2024 11:21:53 +0000
Message-ID: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: f1012798-9681-4929-ee78-08dc0de08b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvjJvuIp+gAWb9Hssq+Yq7A+4V/dCEowI0q1yU34YTD5ula0wV23MLWQzIHXDY5Zf9PNgcLXjdGDYfcmgHDNlUdynGXgcV2/0740/wRhPWubOcXSo/rr/CSQuoiz5t9PaDZty4WDPtAdx4oXFcqzG/InU83R7Ke0U4tDkt/EN/ft9AGGCT3V4o0YQPtJlNLy77Ku02bZnwER2ByY7XrNx3UjxdhMpFXaZIsH0IsiBlUHPO+saVl6YQJFA4OeRbdlaeJ7vGmXSRZwgOJP4BTmbucXmb+1+a23vXR4xinmjk4zo4E+Cwn7SRv2xXkPiIlndUx5YeuiDAZa2F6MVqfaJ5gPewtKD8xUnBfpyWuYh0R6rTq0JgA2PQaOoxL7wTCpwi8gdUvYHOOy/O2/SHMfjjuo7GJ8XZkb5K5cDpMls+C7YZbolsYU/dBwCc+yTZaJXJ8PVJDjcw9cJH6PT1RaxHjheZm3fpHucmyY8JVV/QKlFXY4UseIE4ideyW2vgt8N7ULlIW/8vxpRhbrY4tt49VGnx+MSako/ihZxQ+7EIeE20ilyyLOLi/olZHXbB4MeMTMcNUW8S7R/K8jGWlf16fe0yJPLEKa/3MqyDR/ZiQt5uh+o1rsV1a24M4plG92sswp3SxVyYkWaNrwAN3V789mnv/fOLNWWQd5IcZfWT1HlD5FhcOArxlwYNdLVPXsPG8Spgwaa8cnuKS8mWMKVjVO4sgDPQnqp264VDIdeLK3wdd2bvfT9TQCSgEQXoUIBxoggyNc9ylOK0pAqDH0tw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(46966006)(40470700004)(36840700001)(426003)(26005)(1076003)(336012)(2616005)(966005)(478600001)(6666004)(47076005)(83380400001)(2906002)(5660300002)(41300700001)(70586007)(54906003)(70206006)(316002)(8676002)(8936002)(4326008)(6916009)(36860700001)(82740400003)(36756003)(103116003)(86362001)(356005)(81166007)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 11:22:04.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1012798-9681-4929-ee78-08dc0de08b71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

Hi,

Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
for the previous discussion on this issue.

Also, the linux earlycon hvc driver has been fixed.
See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3

Changes from v1:-
1. Split the change across 3 patches as per the design consensus.

v2 :-
1. Reordered the patches.

Ayan Kumar Halder (2):
  xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation"
    cmd option
  xen/arm: arm32: Add emulation of Debug Data Transfer Registers

Michal Orzel (1):
  xen/arm: arm64: Add emulation of Debug Data Transfer Registers

 docs/misc/xen-command-line.pandoc    |  7 ++++++
 xen/arch/arm/Kconfig                 |  8 +++++++
 xen/arch/arm/arm64/vsysreg.c         | 25 +++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 xen/arch/arm/include/asm/cpregs.h    |  2 ++
 xen/arch/arm/include/asm/regs.h      |  6 +++++
 xen/arch/arm/traps.c                 |  3 +++
 xen/arch/arm/vcpreg.c                | 36 ++++++++++++++++++++--------
 8 files changed, 76 insertions(+), 14 deletions(-)

-- 
2.25.1


