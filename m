Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744906C33A8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512684.792821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccH-0008IU-Ff; Tue, 21 Mar 2023 14:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512684.792821; Tue, 21 Mar 2023 14:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccH-0008GC-Bn; Tue, 21 Mar 2023 14:05:33 +0000
Received: by outflank-mailman (input) for mailman id 512684;
 Tue, 21 Mar 2023 14:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccF-0005Xe-M7
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 704d1fda-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:05:31 +0100 (CET)
Received: from DS7PR03CA0041.namprd03.prod.outlook.com (2603:10b6:5:3b5::16)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:05:28 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::3) by DS7PR03CA0041.outlook.office365.com
 (2603:10b6:5:3b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:05:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:05:27 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:25 -0500
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
X-Inumbo-ID: 704d1fda-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKQkFU6qLgeXsZSkzbsYKSUCw+eAg2PjpPUJwphMFl2Fd4cN2E7ZbdPCGhegR9Rmas1laObM0UB6mRdIhwutaelI704zce2gYVcfr1Q8O41Oq1uXIQRI4xvj0En+SIyyLoPOKLhLBAbuRo/u4FJipeLwHMBbt5w/JkjjARmTGH9JdBC6y1/lp4JYOEYMWhukK2ae2wEL3s+NFmGgZM45z8i3WDJ4UkmMQB0p/jeNNQDTykphkQZWuTHNMq+dnTr4z3YbIpPDXPVJBTEwDCofBkh2MNcJwuTXD+lM+kupjjNo8GlLn/6zbMQqVxPpHZgxsotyK05D1y3RHHT4rutVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xotrsbhl/FLSUoI3qOBJKeSy4Rd9/LSb5Psg/+0wEqU=;
 b=bUzfJM1zV+yvkVC0kxWJLCcsItL4rvcTP+U5ZswMGS08JAbCGvfUgR0AB5NPTS6cXOxJbhtbezO7B76cte3v7VV6Amj3VwU7LCKrWDxGEYW38UFSbDaq+5oEFS3vOyK/hSmFR2pHC9f59rEqcWxK0fwlvVFoZgvnMIkK47JpwXWEpB9IPvxU0evVpa1uS7bDPHDoRyXef72INohWEtgWAm3DeYYk5Pwn0Fz32agFv2H6qEov/U++GS8wD7NkK0T8Gddixs8x2u4sL84MKryItcqlqeySiGQP5PN5hr55RVk0EjwvYtiLsj/LegVEr/8IZWIp+afdU+BefNwXRQcr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xotrsbhl/FLSUoI3qOBJKeSy4Rd9/LSb5Psg/+0wEqU=;
 b=UJegmBtONBMdn8jgImCM1TXmpzonBv6AAiueDvVkVWynJOKOXw0P557KDY2Gu/CBLaakrj7OtirbhexPNVMjsVosamGBdP1IrUC8AIiEchHwWFLfnRse/V54qQPrpnzIuTGt/ajBBNPvbrbj4K2Ccq7xYudA1Mi0FUpFr9SXn6U=
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
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 08/11] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
Date: Tue, 21 Mar 2023 14:03:54 +0000
Message-ID: <20230321140357.24094-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eedad3-5752-4a2e-a25d-08db2a15535c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CkiNa0e6jA+iwUsJ8pNb0VrmRzsXrTGXY0VVNugihxXXm+jVQW8GgoLHOktiJZiEGlVVRXckKStjw5X0rLvxlEtrBvceAiPVjY1Pu43FxgoUHpirdf6Rdbi8E3vjdv7nB43OXQ6QFP9jZa66qWF/TQ1qMsr0YKQLDpWG2xZoO4uHWwo//B4UZFkmxaCQ80cSXLwCcWBPbJ/iavbMTUfRdn2GofDh6pB3DjzHJd1d+fduJIza6eGHI94IP8Q7lbyiqlw2JN4C6utW9nSRtv/ejgQ4KbLH4I4YLfJMvHJuJ7UO81wCMScq392DcR2qmU4gqpQj71EEwMETYWsAFW22I+cwqW/9RYofOKDDQrMP6S084N5L1u4Uf29J4JdKyVHJ9noijBoGCXcehljV89seYiKEqnxGb6H6iOOsCPi6tTENOJW07Dm95yQMyastqQbplEepjgsC8v7T6464xr2DYTFZLuC1+xmoC+vd2cXZJXTj2UBoJUqsEqSrBZkxhFADK81I9PtrVVKgOdOreJ/fxzWE+sB3GMYj7qlbGSABaUCilff+heNtYhoeT9ZSAfXAawr553UIZ0CeFpZgfnMrjmGpwMr4Ru26A2YbD/Du032F4tXwTwellBCGojPdDE7z4Y8oQUDJFsk0dZwUc9rLn6s4rPKue6qcr36SE5FTWVnVBAB3QMUBQDCJ5SmdHkg4ynxy5OQ7emweg/jvvmi84HUK/XWx9PqUFe0qDcTrqaE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(7416002)(36860700001)(41300700001)(356005)(40480700001)(36756003)(82310400005)(103116003)(86362001)(82740400003)(40460700003)(81166007)(2906002)(4326008)(47076005)(426003)(186003)(336012)(83380400001)(6666004)(478600001)(2616005)(1076003)(54906003)(26005)(316002)(8676002)(70586007)(6916009)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:28.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eedad3-5752-4a2e-a25d-08db2a15535c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418

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


