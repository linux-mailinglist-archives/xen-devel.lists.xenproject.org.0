Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21709642AA4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453797.711407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ClO-0001hb-01; Mon, 05 Dec 2022 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453797.711407; Mon, 05 Dec 2022 14:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ClN-0001eL-SF; Mon, 05 Dec 2022 14:48:09 +0000
Received: by outflank-mailman (input) for mailman id 453797;
 Mon, 05 Dec 2022 14:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2ClM-0001AR-Ve
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:48:08 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d36c13e7-74ab-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:48:07 +0100 (CET)
Received: from MW4PR04CA0342.namprd04.prod.outlook.com (2603:10b6:303:8a::17)
 by DM4PR12MB5376.namprd12.prod.outlook.com (2603:10b6:5:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 14:47:59 +0000
Received: from CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::b2) by MW4PR04CA0342.outlook.office365.com
 (2603:10b6:303:8a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13 via Frontend
 Transport; Mon, 5 Dec 2022 14:47:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT091.mail.protection.outlook.com (10.13.175.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 14:47:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:32 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:27:31 -0600
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
X-Inumbo-ID: d36c13e7-74ab-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+yllKUEWM4T0u+H0T+7lz/QXJgi++CAmnrDFQUJxMOMgsrh/lo5avv2tJf0G6ZhQDF4GigXGXDjbEG6lK+PklxE3wcpAESoUsdrrrtfzYs3lP+BaOTj1NNkgScEqGHZVV1c19Nuhgv2JdSmxxcpY8LMq9Zfg+hL0jWmuSTk548fCyCe18p5AgQlZ6Tx/fcNho0x5jof4Bp/Bwqx0AT2fb/QGiNUi9PorIAc7SHVhJo+7nVqtn5Grn1TIlxgaWGBQJUc+xWfQXZZD8/AdtG0xC0Xjnb4do0PjjeMUFAWFo+a3RYfx2bFCKhbf607kMSJyu9q7wvt7xudw028aR3Ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KHxmnWmNgQroEJqBI6LTdMkMgVnjuq8fRljQdPYe+4=;
 b=fRLzH3zv4xcE/2PNy+oAu45PfU29XK4VjErpG+7HFJI0Uy+OS3bZQAjlfy6jixbrpcUKmizCE5TkJrJlIDCSujAHdpWcYXUqRCFdZeksRSiTgRxaRTn/32UmDNEhazl2TntfX9ECO3mbRnFfX+kAotmGcLxRRthYlB3d/peHiXBEXzafJ5IYzmwPQ0n76uG5N9ReukH9jDWPDzo/Nt8jyaFR+XGwUekJ4WTtmhMCp8+cuv1d5S1rzLM9VVtdjDzWiePZT7W44QWYkybAJQNiCsV4k+uXR/UEOlAEUh2CbuH5qB4S2PF4WsOFtj5d+NSSnVxq1KUDeH3i9LEmm1p5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KHxmnWmNgQroEJqBI6LTdMkMgVnjuq8fRljQdPYe+4=;
 b=SUwniUfv3X3k0NoPVsszxR2BKesK/mQvyFs635j4qRpD4eRepnYZC+F0cFUKIUtSm+gE3Le+BcZ5i7daOgYMa4WbR8BF+LTZzK4FzoYAN2JNFD/S8fJL4pLR0KE9isYlJFqvJuYXnwsOsj4GgHegOGtrSzASO2IydM0yLdNkbbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 05/11] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host
Date: Mon, 5 Dec 2022 13:26:31 +0000
Message-ID: <20221205132637.26775-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT091:EE_|DM4PR12MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8cf1d7-4ed6-4bcb-ebea-08dad6cfb386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	seRSQV338OlO0CSqDLx2X6SBpwp+vpEmZMYPqqGUgodKC95ZDP+eIxW1p7RymlYzmZd9XaHq8btGJHvOSk8kaO/ANMtSkUO8uD3ZdJa6klEQKrjt5AN89VcP5wY4qbnPqbsigDx0pZDbr2hjR88w2H2qNzgtO8Ny505NxjnxG3dIv2rky+wgIR1li2k7nUH75S68E9oTMkGoxhKYYnrljfK4S0ZMozhyF8NNeViCcgW0dje5sPWIMW3ur2mmLjGA9vXcqj+hH6tKEDkR8JptzyY3OBdnqDkzx/L76RYBdC6XiMG3Qs/sJpP+iq/fCCfHETmslHrgHaHfMkyRyymdkGat79dZ7us9vDETBaBAzTl8udchPIIIyq6eXe62E6MXkNbarJQxUYdjM+k2/TPsjGyA5zIXx4RaoAx1K9H+wEjTwM80dukLEnU8cIpR+LrhyRauD9Tg5PABlV1KSjwNtXzjvy8xIRjUILH6A2uVT4OhZAZ7WGHgcqk0tgVyIawjjgseOvYKoVd9AYDiw0qnxcPnzA1tQr0J9zNm+/H7e11GebdvqkhRqZEWg3tT72vzdTi2NK9QQHyR9nF12IsccM0wHV5m7LMHS0mFlyvB3lUHD7QFX1GHgyihu8ACDadUQnO4WHaz/96rZvqHeAsgZr5N1OZN73HRfdndMsEiqV9mwcbzP6cVv1PfbWvPOL8oFq2Qm5+FCpSMnXylHv25tlGwOCf/nIy1BWBuNmWSEyJ49Msd+tQLVmI21KdSGXC1jvFpJf6fMzN7RoT6PB2jnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(82740400003)(86362001)(81166007)(356005)(2906002)(41300700001)(40460700003)(8936002)(4326008)(5660300002)(36860700001)(83380400001)(103116003)(478600001)(70206006)(70586007)(966005)(2616005)(316002)(54906003)(6916009)(40480700001)(8676002)(82310400005)(336012)(47076005)(1076003)(426003)(186003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:47:58.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8cf1d7-4ed6-4bcb-ebea-08dad6cfb386
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376

'unsigned long long' is defined as 64 bit across both AArch32 and AArch64.
So, use 'ULL' for 64 bit word instead of UL which is 32 bits for AArch32.
GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from -
v1 - 1. Extract the bug fix for incorrect bit clearing (GICR_PENDBASER_PTZ)
into a separate patch fix.
https://patchwork.kernel.org/project/xen-devel/patch/20221027185555.46125-1-ayankuma@amd.com/

v2 - No changes.

v3 - No changes.

v4 - No changes.

 xen/arch/arm/include/asm/gic_v3_defs.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 728e28d5e5..48a1bc401e 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -134,15 +134,15 @@
 
 #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
 #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
-        (7UL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
+        (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
 #define GICR_PROPBASER_SHAREABILITY_SHIFT               10
 #define GICR_PROPBASER_SHAREABILITY_MASK                     \
-        (3UL << GICR_PROPBASER_SHAREABILITY_SHIFT)
+        (3ULL << GICR_PROPBASER_SHAREABILITY_SHIFT)
 #define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         7
 #define GICR_PROPBASER_INNER_CACHEABILITY_MASK               \
-        (7UL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
+        (7ULL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
 #define GICR_PROPBASER_RES0_MASK                             \
-        (GENMASK(63, 59) | GENMASK(55, 52) | GENMASK(6, 5))
+        (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
 
 #define GICR_PENDBASER_SHAREABILITY_SHIFT               10
 #define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT         7
@@ -152,11 +152,11 @@
 #define GICR_PENDBASER_INNER_CACHEABILITY_MASK               \
 	(7UL << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT)
 #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK               \
-        (7UL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
-#define GICR_PENDBASER_PTZ                              BIT(62, UL)
+        (7ULL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
+#define GICR_PENDBASER_PTZ                              BIT(62, ULL)
 #define GICR_PENDBASER_RES0_MASK                             \
-        (BIT(63, UL) | GENMASK(61, 59) | GENMASK(55, 52) |  \
-         GENMASK(15, 12) | GENMASK(6, 0))
+        (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |  \
+         GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))
 
 #define DEFAULT_PMR_VALUE            0xff
 
-- 
2.17.1


