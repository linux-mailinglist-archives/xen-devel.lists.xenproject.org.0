Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC96E2A55
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521213.809635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcA-0001Qa-4H; Fri, 14 Apr 2023 18:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521213.809635; Fri, 14 Apr 2023 18:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcA-0001O7-1W; Fri, 14 Apr 2023 18:57:42 +0000
Received: by outflank-mailman (input) for mailman id 521213;
 Fri, 14 Apr 2023 18:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWbr=AF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pnOc8-0001O1-Rs
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:57:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3968bfd1-daf6-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 20:57:39 +0200 (CEST)
Received: from CY8PR19CA0012.namprd19.prod.outlook.com (2603:10b6:930:44::29)
 by BN9PR12MB5178.namprd12.prod.outlook.com (2603:10b6:408:11b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 18:57:35 +0000
Received: from CY4PEPF0000C976.namprd02.prod.outlook.com
 (2603:10b6:930:44:cafe::23) by CY8PR19CA0012.outlook.office365.com
 (2603:10b6:930:44::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 18:57:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C976.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Fri, 14 Apr 2023 18:57:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 14 Apr 2023 13:57:32 -0500
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
X-Inumbo-ID: 3968bfd1-daf6-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo4FIzpxPgNZ1XanipsY1GEBnOSLUWDAEhh97vvlXlmbf1j5WK7XmyMtqzEmueEid1dPUG00no7Pa7uOt9ABqrxZqvwVsoIUYdAxuH1oURdX8DlVDgVlBCZzUHm857cBef7Rx3ePy2b/QbhidfdcPFJvJ1VeFEimmoM9QAhYugMN0X7Gx//UlP0cFYIWgqAkDTSX570UpDvNBx+5zqPThsVMG+ZsoKX/mjq5otMkG2UUCkDVny0TMvDFlqLtGyHeOwo4AyJK0Nwp5WdSSQ7W72WoyP7i7Oqs7poznMhcy7lC49ThUsXH6NXEbiD/aomVDhKjN30UEjMQO7v5CuvdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aUhBbT3JP8LmVuEIaDIRl2xT4DCvnOTPAPCN1AMiXg=;
 b=NfXLuFZlxzDgTjaMQPeu7y1iSi3ARY9jKvZgKwW/p6JzGKpYg9Al0oSGOsvqOtX9GNqgLCY2X+/rNalBTTyh+/bvd3APEHVbtlXzcoSWc10QrW3cZgwfgthExHMsjc2LFdsTcCD3p176tVqUUKr0g2yxWgZQ/qOiuWf2J2tB52d+MM6FZ6PwR7smgec8brM0R/WG2z616euTuCSW8y+aGA8Gz8GJK966RbUk7dsP4sofS/kOqepyw6uq+HZTzqI/WGYg35a5Wt1y3Sp6f/C5yrLOOiEPTeFTCNqvgngFFey3niUoulb4gRNXrYd7TEWHO6xzCgEmgZTOsRpZ30k/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aUhBbT3JP8LmVuEIaDIRl2xT4DCvnOTPAPCN1AMiXg=;
 b=FGtNZlN6MHo5VXCjo1vawLFCpM6C39KNjdC96AjHYGuqX5T7Dz0wyBru1QKRe3FnlPGmTOZfrRuJ2RPGtCsZL0YPyo1KF5J5Jn4b6e8gaM7je1mjQMYYaRbPnkbZKVneA7kTsYaAD+7CvXpOyxxzYYRLwM3hr83KLlm0GGcVCTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] xen/arm: fix build errors with -Og
Date: Fri, 14 Apr 2023 14:57:11 -0400
Message-ID: <20230414185714.292881-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C976:EE_|BN9PR12MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: e570a07e-02ef-42c7-deef-08db3d1a1bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o+OxKV0EcSK6N1GOgBSsp2B2Rk0UtQA+Gnsaw2RC32GktQXVo5gt3kYXcFiZIC+vQJzPI1EPUNpCemnlVwQYA+HGygb9tPqGy8a06pT+jP3vvzvdovD1IS5Zz4EYsOG4aJ7lWXidnRrJ0N9Su8mw8foFmLg5yxb8VWCpSQDt1Nhs231FZJgsmPRi4yoZ5a5BeugAAm7EShsvGbh7OE7ef/XbNtNfnjRJ8FrkBDxJ2UR2pu2qoCnQUrQpuc3BG7nAAyeHBo6VOAOprzr+ahK9C/sWmAjHBDfpGW+MjWBNlWhto61mCTt8AEMKkAIizUq6zt19SbK+2dcr7tMUMS/eEcLZVtJtQm2HEeKjbw3nbuJgL6Ph2ix3GNRXyM7mXypa03R8snW1AwFVX9pfJIJzhbo8kPl9gmV579WrfzaboqggG95mDuW2hiRxIu0JEIPq8WcpMiXU8CDf36GF4Wm1TVmKCvTZx5MxrkDh99hHKHYIfB2nH52CPjvpwJWrqNTgcsQHbOyIRZMb3C02zm09vBKdFG9pbeuP4BPvWMkV9Q8y3rF8fbvY9wN9tI8Vo3OT5lDpiOFExNp/Xy2tm0PrhLUYL2gbI1ntAD6ZDKLRgANKk3VoAPLdcFVyvAPMwj8xOEvAAcw3+cp0MySy4mb+cl7Q6woKFaeJZ9wR+AdA/2XGta/QBpz86EI7JLYVCZ8tzs1lmXWPqUd+Y+7V8xYvAA146ljG9uh2j6tUsLIFEvY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(5660300002)(40460700003)(4744005)(6916009)(2906002)(36756003)(4326008)(70586007)(70206006)(44832011)(86362001)(81166007)(41300700001)(82310400005)(356005)(8676002)(316002)(8936002)(82740400003)(478600001)(40480700001)(54906003)(26005)(1076003)(336012)(426003)(36860700001)(2616005)(47076005)(186003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:57:34.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e570a07e-02ef-42c7-deef-08db3d1a1bec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C976.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5178

This is a collection of fixes needed to build the hypervisor with -Og for arm64.

I build-tested this with the following command:

make -j $(nproc) \
    EXTRA_CFLAGS_XEN_CORE="-Og" \
    XEN_TARGET_ARCH=arm64 \
    CROSS_COMPILE=aarch64-none-linux-gnu- \
    dist-xen


Stewart Hildebrand (3):
  xen/arm: mark __guest_cmpxchg always_inline
  xen/efi: fix unitialized use warning
  xen/arm: fix unitialized use warning

 xen/arch/arm/domain_build.c              |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h | 10 +++++-----
 xen/common/efi/boot.c                    |  9 +++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.40.0


