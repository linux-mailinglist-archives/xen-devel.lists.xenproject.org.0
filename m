Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42D6F1DBC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527451.820064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSN6-0008UE-DT; Fri, 28 Apr 2023 17:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527451.820064; Fri, 28 Apr 2023 17:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSN6-0008QW-A3; Fri, 28 Apr 2023 17:59:04 +0000
Received: by outflank-mailman (input) for mailman id 527451;
 Fri, 28 Apr 2023 17:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSN4-0006vK-NU
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e88::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5acc86fe-e5ee-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 19:59:01 +0200 (CEST)
Received: from BN9PR03CA0152.namprd03.prod.outlook.com (2603:10b6:408:f4::7)
 by DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 17:58:58 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::31) by BN9PR03CA0152.outlook.office365.com
 (2603:10b6:408:f4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:58:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 17:58:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:58:57 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:58:56 -0500
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
X-Inumbo-ID: 5acc86fe-e5ee-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrwn3ccYQHQI9TX+zs2bgb1Gx5Y9vuLDx8x0W2MjHB3B7LU3ypiDMjuK1IUVwL+V65K0HiSry4ezRULdqtERBGvvdehDV9O7/t8G8bOchfhEPuyUma3Z8l6nOOzn5siZnK+EgJqmpcRAWbM6RCiNDExe6DMInghq8cHbrzz2/QPGgsaqESw5KcnXx3HATmf3GgK6aBCqldVH3LwCBWwK9YCzqaxcmxiO4NQQhXKwd8fX7Dx1bYnq11b8lTX83RnpwwtQKgSkG7f3zooraaTZ+7fPvo9D5F8cWslJUgJWN25Z+VpOMoWRDyV28qVLuCjkwaiGDRvW8oZKpXnth3NZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8UR0Sc7OfEDIVIoizf2pWazrciBj/wXI6Khj5u0U5s=;
 b=R10jD4q1l7S2yp1dmFuXHHDlQ7kyfZrEA7lp/bJK+upL7e2weyv7gD6Q4h4kan7xhCXm08Qc4aCKz67C+lNJAGzXMiAY1HI4j4PwAtCmpwi5LMB6VWWQWucC4c5bVb663Pese7H/fCBh4iwJvO13CEU8iuOpxJ8hMZNi5D8AWq5VeUS0X5CXWtKWLb2wE89CZQLJ3xBqVKuqUuQ5ETLVIRwjcA4bYOlTomqT/lFIHV1MHC3Umb6dbkp0UTK79NLIg4gG9p9YG62r9JoeFFdvF0S8N+9z9CNgP4XlYVwlkV1fLxxPww7Wj9q14xVtO2IdacE2d9dLpnKtOIRQUfULaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8UR0Sc7OfEDIVIoizf2pWazrciBj/wXI6Khj5u0U5s=;
 b=pRA0Hp1CDSM7uXFM7GwYnZhGAxuANrlT+1R1QMPPMC/XFTselGjG6P9JS53rwyvflvLgCs1mXg3H3y9S3n25CuhytZqaKjwdAe0LkN5EYg9o0ymv3IBZyw11RjJQl1+uAh0wRkiIjHkNeplTJ2229cMYB8/6axp6IWszZ12CrFc=
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
Subject: [XEN v6 06/12] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
Date: Fri, 28 Apr 2023 18:55:37 +0100
Message-ID: <20230428175543.11902-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT061:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 436a378f-56cc-45aa-5f0a-08db48123d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evl6DS4tKw5v8G8yo12wqc2ACZzNvyAWHI95RHglsfTYn865W+tTw5VKZZSUdORZPDHXSYeLJQPWNbDhK4N8tX9a+nBjmxW6ISFtOMkW6sjy65zJmswtXuj/kfMal/VF8fC7w8F05+vhIl9JSpYawOKg0bbUzZzi1kGS0lVzL9wg6NL81JXBb+75GejBRXOseI3K2rvRLwJfFWF0/d+fruzcjaka9e8/0NHeXXNOiJrzAuwEpt5fzUph05D25D2yCZpE8LU+9LdJdvEHmmSMMZ/qlTCUSi4hkrgaihEdjcPg6keeFfiml7Trcb3PZr5WyRRCAuAdSgNpXp/dkl23YC2XjKydd9qdmakJR0iz5B/m2eM8NMipb3TNNlKMKaCJu+46I3FMmGeBwVMIV7FGZCXF4Ud9IqO1nzFHYsYLx4cSXrWjIQkMWxdWQvDEvpKz20bT83rDd2L5JdkZSz1cxUlh1Lw630VWXlPViTHTIfBOCItIsFOVHvhiqMkeufSXwEVRJvxVI5ojhgw1lQopRePBfFcdtTkglpc4L7B9r6K9S+pM/BrlARryZpAyb8m5RiFhkWEFe0e72ZU+WtlHDwbhQ10nbjW1grRM/U73tu0G5TlFGPIdBiUD0HKTYaasMNXBhZCZj3mzqpNSqQx9F8Uo25rXZrH/I+A1x5kA43+RTRsxr/ttP80haz0GYAoBARQO6+9AAHgryV5iMylNa1jiknu3Yn3u6wqDMaCyumQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(54906003)(478600001)(5660300002)(8676002)(8936002)(36756003)(2906002)(103116003)(86362001)(82310400005)(7416002)(70206006)(70586007)(6916009)(40480700001)(4326008)(316002)(82740400003)(81166007)(41300700001)(356005)(186003)(1076003)(26005)(36860700001)(336012)(47076005)(83380400001)(426003)(2616005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:58:57.8860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 436a378f-56cc-45aa-5f0a-08db48123d5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281

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


