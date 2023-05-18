Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6D708432
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536430.834761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeul-00052D-Hr; Thu, 18 May 2023 14:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536430.834761; Thu, 18 May 2023 14:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeul-00050p-AQ; Thu, 18 May 2023 14:47:35 +0000
Received: by outflank-mailman (input) for mailman id 536430;
 Thu, 18 May 2023 14:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzepP-0000Pw-5W
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:42:03 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26296225-f58a-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 16:42:02 +0200 (CEST)
Received: from MW2PR2101CA0029.namprd21.prod.outlook.com (2603:10b6:302:1::42)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 14:41:59 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::7d) by MW2PR2101CA0029.outlook.office365.com
 (2603:10b6:302:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.6 via Frontend
 Transport; Thu, 18 May 2023 14:41:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:41:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:41:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 07:41:57 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:41:56 -0500
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
X-Inumbo-ID: 26296225-f58a-11ed-b22c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxljZyJCoDuKiwjuzQwORT+0OarCdHjVU5cRm/0sqKn2D5JLiOwF3KZkPNLpMtA3uVx8Vw0W8KW8zCrdnHj69mle55n9q/NFNmdu5giN3K0VzVzR7FD8ZxxcxwLa0dWELcAS07SztYIUYAodG7Qt384rEJSY4JTXzR06zg4JZmk+ER31v+RcozkuqQDW7l5GgMl3jMOHK555wQK4WgwJRojhnYtrSb+DxFmbe+5o8647i8W+UP1FNv80Z0cyF4xBhmsTRPGAqD642NlI+CEGevYkLVfXTPO/W3rx116rPKT5kZjGltnM2Clg0RWgvEpGMGCyu6LvsrF63hG88mhNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXMycSPCMoOkBk7CFnL74O37ftF1ESExFvr5Bqg0mxU=;
 b=UKEDB6pSB7tlAHpUpvDxLi9GylDEOGzTcV2pBrL3w6QTUO6ewvALKzyxe8afEVPDhUR9nVY1ysDKH5GuagYhE0SDRBnJIJ+qP9FVT239oRCjEHByOwk2cSo8V/Mr8L202tVSTppbW/hSKlTnLoYGY0jANgqUvROnaVqhlmHenFsGg+LgirLrptR4eSLoRtOpZyRGuyZ8rVQ9gLPQTEnuSp62Bdis7gcPdzfcKvp7ilvlyukuwYBiTJeMAxYTx+kAurhWfjicMraoEmRCfuR/rPEOfMsDJKxqy8tUmTpPzLUN6+Ee+ztywCP3LQ8rlDXaPoWAsYbAEf4p2TaAu9PTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXMycSPCMoOkBk7CFnL74O37ftF1ESExFvr5Bqg0mxU=;
 b=s1v+xe6V4xa89bZ+XG7/a1/1i7GpxU0ONiQ5dk0Pwas4qtJwdSavRh7zErod5VxbCZpwNY6m5+rTRHHncZ3KeUwY/Qhs2f6Wxp3YNbFpVbsdYKeiQtM6ODsaEmRtDYwrJAp9xHi8GO8xC+CSuvbXPXDeYA6ZqzaMcQ4xG+NcGR8=
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
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 09/11] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
Date: Thu, 18 May 2023 15:39:18 +0100
Message-ID: <20230518143920.43186-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: d91d4848-3879-4e23-c422-08db57ae08d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ZSHmTx+EeRWpab+dReGyHtsuWWdQ5XcBVv9SyWuxsgmUAVUDTgD6OBmx4XUok+7htNOm0IiSYGueeTH0+enGRxsP3CiHYBnDxjy4LtSTqSO3wSHU1hF0gtR1xrt8Ifp2FRcIrMQ8L6TeeL38FeJeGAeI/eW11IC1nmwpFIN1rke6w/RsmK0hvaNIh+b8EoqZjqdRJTJoY8iu2Mcvw15G+Ta0k8W+0wU4pNw3FAlzf4GjDEurrf+NoZE0Bvl+GBhmfYG6iH7bx88ej4GhFOekRX7SI1YpvQ8kP9LgIJo5yP5uTZYBFvAufYEuKJFs5eXO7RJM/UqlPUKw5WZnMm5MTvX7yprEHr2CVg7i0ArhIU2P3aQFZ3+4MgJBo+K8i8YjYPlQko1+1waJEWAr2xUOa7Kr7DuY/PemyEmyeGL/WPk6a6LUWVoCrc4lZqjC9ByoOW9+o6vA1K/+h6CcEuMQ11ycDVSFChAlQdf4sKfhu6fm5TZTTmV7CpwtCv1TpIiazNa3gVa5RORwT+6LWuRuggagSM5ZConGr1fjrie+V4G++ODircD38WUmQr6HYQNOQJXL+hG9MmYs8BoyhOlnB1NgO4W3joiHG/FG8yFhCZuPBXbISQwd/7rS7Nd+6ngWLs77DoKw83VGGMaK3BwvArIbV141ZSKD/c0lFuh8dlkbhvm8UzlWR1bJthw+R3SzXagMWV3j3oA21ZBvksWauFRTXnR4MU12pofuCDpU6omN/6qhWvHthuwOnGZeocBLcbfNCGoRd3XutoTmXsqsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(6916009)(36756003)(4326008)(2906002)(7416002)(8676002)(426003)(336012)(5660300002)(86362001)(8936002)(40460700003)(41300700001)(70206006)(54906003)(6666004)(103116003)(70586007)(316002)(40480700001)(478600001)(356005)(2616005)(82740400003)(83380400001)(47076005)(1076003)(36860700001)(82310400005)(26005)(81166007)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:41:58.5778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d91d4848-3879-4e23-c422-08db57ae08d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895

As the previous patch introduces CONFIG_PHYS_ADDR_T_32 to support 32 bit
physical addresses, the code specific to "Large Physical Address Extension"
(ie LPAE) should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32".

Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
are supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Reordered this patch so that it appears after CONFIG_ARM_PA_32 is
introduced (in 6/9).

v3 - 1. Updated the commit message.
2. Added Ack.

v4 - 1. No changes.

v5 - 1. No changes.

v6 - 1. No changes.

 xen/arch/arm/guest_walk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..c80a0ce55b 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
             *ipa = gva & mask;
             *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
+#ifndef CONFIG_PHYS_ADDR_T_32
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
+#endif /* CONFIG_PHYS_ADDR_T_32 */
         }
 
         /* Set permissions so that the caller can check the flags by herself. */
-- 
2.17.1


