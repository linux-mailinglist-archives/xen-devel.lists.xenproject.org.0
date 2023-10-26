Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A87D7CFD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 08:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623485.971353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvu7y-0002iP-DA; Thu, 26 Oct 2023 06:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623485.971353; Thu, 26 Oct 2023 06:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvu7y-0002fr-9O; Thu, 26 Oct 2023 06:45:58 +0000
Received: by outflank-mailman (input) for mailman id 623485;
 Thu, 26 Oct 2023 06:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qvu7x-0002fl-A8
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 06:45:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef2aa82-73cb-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 08:45:54 +0200 (CEST)
Received: from DS7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::33) by
 SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Thu, 26 Oct 2023 06:45:49 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::63) by DS7P222CA0018.outlook.office365.com
 (2603:10b6:8:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 06:45:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 06:45:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 01:45:48 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 26 Oct 2023 01:45:47 -0500
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
X-Inumbo-ID: 4ef2aa82-73cb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDmY3j6d424QovQ8UZy0TsneEQKvdf8iUzeJoC1ZYaSQUNH/cm0U7vQkchQoelBduQobC/kKvFs7W8H7xGKvq6/W7pHmr1dTfxxzoFncsKws5BbzzN4oYNyPhrdHhKX3VXfF1pNFv2fNA+1zskroE/pkQxHSypbeAnojOAHXfcIECoahItCV7o8JXZPozG5q8gbE2uYiS/n+O/jg7Me3Da7eJirhL+vzF+uLuaUaJGwW/cn6xnEeL4aSrCD6jgCmoZlPF7Qjv3VL5c/ULO3t+33xsJbux3ND80mJ70Ynr7qym9Wjxv+0rHWPhxv23fHllA153Go/n/oanOutk8n2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZmZu8VfwSbwtFpJZOvSNULRvtAyCT7XDIOBfHqGsio=;
 b=M3C9PpnRfTiiiOwMEAVrtkzuglY2sfoGOEHX4RhUfW0eJl22lpKtPVMiN3kDMknUtQLiObl+DmnYq5gm9fd6BC7Cpx6Hxq/m+sjmrFgs8q9cAcjX51G9adHVNT7Lm2Ua1f+1SWE7HO+tCaa/kHJg2Vfa3kcoq/j5knazL1kFP2inve/ifoy1AwyfrKFA/4Pb4rsuM+seMj32uTYzM2bLPPyvgqYiQC3lx8I9oTSsGOJ87S+PmhbGxKDP9psqkTAyn6lay8GwYxExsYDDUrSj7PAU1jO6IKfiO7X8o845mQOScwWP3pN03L5eId7f/g55DsVON2yjniHRcTNvTzcOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZmZu8VfwSbwtFpJZOvSNULRvtAyCT7XDIOBfHqGsio=;
 b=sZ8X2HavPKJNj4zbVXEQqc5xCL97vVSVdyiYlaufUynbws0LBvJxy/kppxg3WCxI9750UiFOSPhxEgpTGibJbcq20wk+g2l+VISX8szxCkk4apXTsV2NRg3fCdQd2HTwut9nfPuXukDTi6BzAlv8tUaGc+5XFEm6YrwgwN6yuJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Date: Thu, 26 Oct 2023 09:45:43 +0300
Message-ID: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f471ce7-4b27-4e09-edd3-08dbd5ef3094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nVNliQe6fAgg2gH/AmJ2Ik/z4Mlqr6Aeqok3z8gQARI6+qBKEF8q8j2CfE3aBRxfqUQ2iLvAZKF/Ju1Zdt/xazwt4xjrXj2C+SsLlAHjFH4tBdLIRU+57aMeXbAjzlN4xVVmyW6LCR6YyEBfLPz3yHiOPiRBKmY+Jgh/xCqRRIqF38CHAKavIE5Ii54htD/AwzSJxKFEKRsAZZVfNqWiD3v8N4YLnrM11D0EZVOYHLTapL5zCyvLLIsruGH/02W+Bwt7aSIGVDDAis0mSxI72PWHnLKh3FWHUoxUCvJBVML6xFxw4k72F9AvsUozRlyfNeC+kUavBsvdbzrvAeT4jfjf7e7vim8o8VDwpxJx45W6SgT9yVNyyjF+86Ac2511WG/yhdzh5idfqBDxlF5GAghnzx4m0VZbxF5faJv61brZYgRaAILFn2+cj4AUegWoapstgT7/w6V3DTiGk/sDnt0AsF+gfe8zvmU3wC7k2TPCgMppq5/WLiDvt6ZhmjzHQVWusTJaR/bmor+BLggui2honlD65VD1GDO/tpFsdQxeib0x5BUtojJyLrq40qrcWKZWTse7rveY6KkJbqAdH1hiFcWP/+N9S7humw53L4n+ss0AtoPxaqpiAxQJhw3iAe+s8eKGF8kDfb7/s3eM0VgCOAnUUaK1FWxGe+AUMnIllBcHkBnUCLdy/ym8Ir6Dn1HYpXWYA8kweLowuYdj8F/qBODh51hrGyIJFiM77Cnxe2lcQy2L200Loa/CCx++OGSDj6Hf2/X/9yPmakOwnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(336012)(66899024)(426003)(26005)(478600001)(1076003)(316002)(6666004)(40480700001)(86362001)(6916009)(16576012)(70206006)(40460700003)(70586007)(54906003)(36756003)(36860700001)(47076005)(2616005)(356005)(44832011)(81166007)(2906002)(83380400001)(4326008)(8676002)(8936002)(82740400003)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:45:49.1242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f471ce7-4b27-4e09-edd3-08dbd5ef3094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445

Given that start < kernel_end and end > kernel_start, the logic that
determines the best placement for dom0 initrd and metadata, does not
take into account the two cases below:
(1) start > kernel_start && end > kernel_end
(2) start < kernel_start && end < kernel_end

In case (1), the evaluation will result in end = kernel_start
i.e. end < start, and will load initrd in the middle of the kernel.
In case (2), the evaluation will result in start = kernel_end
i.e. end < start, and will load initrd at kernel_end, that is out
of the memory region under evaluation.

This patch rephrases the if condition to include the above two cases
without affecting the behaviour for the case where
start < kernel_start && end > kernel_end

Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index c7d47d0d4c..5fc2c12f3a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -518,7 +518,7 @@ static paddr_t __init find_memory(
         if ( end <= kernel_start || start >= kernel_end )
             ; /* No overlap, nothing to do. */
         /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
+        else if ( kernel_start + kernel_end > start + end )
             end = kernel_start;
         else
             start = kernel_end;
-- 
2.34.1


