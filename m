Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F2725A5E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544576.850462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pS8-0007r1-9G; Wed, 07 Jun 2023 09:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544576.850462; Wed, 07 Jun 2023 09:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pS8-0007pM-6N; Wed, 07 Jun 2023 09:27:40 +0000
Received: by outflank-mailman (input) for mailman id 544576;
 Wed, 07 Jun 2023 09:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6pS7-0007p9-7g
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:27:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eab::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88a7d203-0515-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:27:35 +0200 (CEST)
Received: from BN9P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::31)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:27:31 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::b6) by BN9P223CA0026.outlook.office365.com
 (2603:10b6:408:10b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 09:27:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 09:27:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 04:27:30 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Jun 2023 04:27:29 -0500
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
X-Inumbo-ID: 88a7d203-0515-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSWQUHUtDYoz60l0jIfuqn9hy0453lsOQQZaaCMFhdB69ClRpQ20Y1B9AabYSnS5LpGFfbv67YCp6A0MUjwN0s4+hK+ojNIehcAu5beVEffPGJbFdGIsZtkqP45GzHVLOSfT/wivg+hUMjHcIfJZ70jZdUo88AzkTM+dkrihD3OchADuCFj1XJdQ670DzkoBq9IkitmC5MzhccivAROfKRb/se190SxH1l8Toum4hJnO0UAflgK3h+NC7ZXk9zDVhKTivj30QWnOe3zub1JUr28j0Ac7489W4MYBQoxVKonWwko9bLR3ScTAjsb76givuyViQqK/qMnWKGN5UByv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZbvHWkBcc8kAxTc1427ad6bE2o+h4yuG/qDarpDUxQ=;
 b=c+E7bMjnLdiI3wSXP5SRZwR7mlDuXJXgViS5wMTegv+O2HJGD0JlvjSZcNnHZ0rwA2XcFWUexc+UeU12KsrbMXTL74VliJ9rIovlpQsJfxW2WtdGRbSeul+7pnLfwF0TsUshRnf1YFRiiZd0HDcbvHPVr7PBDNKwBNgUoJ6DMKvauD72REcVkSZHJEDCbITU+fw2OFt43UG+oYyQSG2E23mYmTBfbrjEUBKaDI1QBUZv9AQmBK6BB4Wz3DGe8AbtmUNUGX21VVnsgOHRcc6y/zjhZbmhqLIgXnQPYWECm7DfeVpwx4cK1VkC49ZQrODp+6VTFemVELXlMzW5AjPjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZbvHWkBcc8kAxTc1427ad6bE2o+h4yuG/qDarpDUxQ=;
 b=yW8s4bzBD0jIpb2qErvTPMIWDwej9vqLlKdLmjGSbJTgkyFSHC5NuJZK7veqmYDm/eeJFdcevAKH173cgJYgiaPZ2m4yMPajj260Wx7Yuhlo80zUh9CmIu3GcCC/oE5ZF8JHUsOA3XNjLeAjCdTrdNVJnoRkNEbOLBi7CEf6xfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] xen/arm: pl011: Use correct accessors
Date: Wed, 7 Jun 2023 11:27:23 +0200
Message-ID: <20230607092727.19654-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: cc697075-15ac-4b10-bf2a-08db67396b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFsm9IqRDlaOM2k1jAcqivmokPhFYoP0kwbZ6pwXQVKiXw+bsgBU2rdZMpMN5MlI9JmhxoodAL3nESpO0sDP07IHTwM+E47F6too4kg/Pc5PHitogfXkPat50ZEmi6UIg+0btwZO3wXAnA4AqFQEvxBr0PhThgCOyDjJlNloDwLWC4J7qtGwkxRs4Ygv87aagwPtBDz9TreucE1pTVJVgqxojOkzR54sGBHapEJgrYR7LD2gfhm/Ulpc1uSTiKm9a6cpXM6ayJg48YtzVkdFvMLU2D305AiXQ6dTJj5wKCXTHd2xd3NgAmrMJ/qVIBhj+7Sd4P1U4sF4XdBs/1+umrxCtybK1z4tRBoR2nSWSordhTMkisl+v5xuELl54Ls+Sah7cpPZxH56FF38IBLZnoOCgMa+AWr7nA+uw3VshD6QKa+v7u8xp+i6sLUo4tgYrtKhnLq2OmEMZ1yO+u6Y1jLwbes4KY96v2jDXB8t2LcXt0pj9++GwV3tUUtwwczJ1qOhfJU0ycDzUnSeDMwzph0wN6XHempJ1cs6ulgAZfIJhJzCtc9ee8wKJtwRhd7udqdvdMRfnIBo3vckBD4PBkQ9oTk9hlh0oxSmuWRcSozaZ3hnhGniZH8aVXsCpGgaQMkoqX5pD4FM9FfabuJ9tWIQgFYaxsMjCtVENeXBM2wu3oNcSoCTsj7c/PdAGxVOJiGp4p+a4uYIyLiY+rrwqJyibT6EfHVofQ0WD7fjdbOYuAtk2WN27C+lqe5E38qt+CstCcOQzAV1BvZzryoMr+nvjweJ0Y3W059Pmpmx/KlNDHhyNk6xOjrzVxo2E/Dv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(47076005)(83380400001)(966005)(336012)(426003)(82740400003)(44832011)(54906003)(40480700001)(478600001)(8676002)(8936002)(41300700001)(316002)(70206006)(70586007)(356005)(81166007)(5660300002)(6916009)(4326008)(86362001)(40460700003)(36756003)(6666004)(2906002)(82310400005)(36860700001)(186003)(1076003)(26005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:27:30.9644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc697075-15ac-4b10-bf2a-08db67396b10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

At the moment we have a real mix of accessors used for PL011 registers across
early printk and runtime driver resulting in a) not spec compliant behavior
and b) inconsistency. This series:
 - switches to use the 8/16-bit accessors in normal case,
 - adds support to use 32-bit only accessors.

The behavior is now the same as in Linux.

The last patch adding support for SBSA UART in dt boot was added to make
the merge process easier. Also, arm,sbsa-uart property is usually present
next to arm,pl011 which would casue the pl011 driver to believe it is driving
PL011 and not SBSA, therefore resulting in accessing the registers that shall
not be touched (as oppose to just failing).

Discussion:
https://lore.kernel.org/xen-devel/b31a9f06-1ad8-b882-2fb0-84a84a1accb8@xen.org/T/#

Michal Orzel (4):
  xen/arm: debug-pl011: Use correct accessors
  xen/arm: debug-pl011: Add support for 32-bit only MMIO
  xen/arm: pl011: Use correct accessors
  xen/arm: pl011: Add SBSA UART device-tree support

 docs/misc/arm/early-printk.txt        |  3 ++
 xen/arch/arm/Kconfig.debug            |  7 ++++
 xen/arch/arm/arm32/debug-pl011.inc    | 12 +++---
 xen/arch/arm/arm64/debug-pl011.inc    | 12 +++---
 xen/arch/arm/include/asm/pl011-uart.h | 19 +++++++++
 xen/drivers/char/pl011.c              | 57 ++++++++++++++++++++++++---
 6 files changed, 92 insertions(+), 18 deletions(-)

-- 
2.25.1


