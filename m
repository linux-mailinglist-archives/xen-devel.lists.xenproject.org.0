Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039C625CC5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442566.696852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUr0-000735-H6; Fri, 11 Nov 2022 14:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442566.696852; Fri, 11 Nov 2022 14:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUr0-0006zn-D9; Fri, 11 Nov 2022 14:17:58 +0000
Received: by outflank-mailman (input) for mailman id 442566;
 Fri, 11 Nov 2022 14:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUqz-0006iO-24
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:17:57 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a280a751-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:17:56 +0100 (CET)
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:17:52 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ec) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:17:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:17:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:17:51 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:17:50 -0600
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
X-Inumbo-ID: a280a751-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrkJpRu+NyjLPEmr87NhX3otYxqvPQb7F/ZAg0Jspkc2ZIIB+sDuDL46dmJp6KTP1R92//FEssHF0pYROuUAKv40tZzWbYFWvr2fHDWVo1YhGPq9xYFvIM4VpqIN2UyA1roZ+gn5NMborj1GX0rcZH/FQa1NsAG0cRyfLQu9//DiwV91sKB3zCNNMgUh2gMkOgHPTm3za/mmpmXLJCF76d9yc7V/5Hsuq22t4rn0azbWMEivMyJmKO2FWqRlpxVgvqs1/ZyrM+fV/z9Vtqo0dLTEfssxUDnBVdhiO/XmVnt5L1fEFx+t+E1s9U4V9S1LMwkSwujCeT0rAI7Qes7U4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYhqWJyHaM087JXotqIXKs3EOmyezlCfEHykNXyKFgM=;
 b=HMr3Y/mIGg+M7X3FmcpDrVekJhQOlJ9rjIjPjpt1zn8H6cBHxr2sss2L+dqHGGlqN0hYgM/jJg1jdilJazqurwDGn4tHtmfotK7hJJhXVFBLe7bW/YQVf5mRJN3aerSKkRNPL3EKEdR/rAbVGQWxn+xGe8CVuKOgQfEU91AjnajOEXZ+v9ANkEnlYqNzsfkN519zA8UVOgxh52aH/rjkTUEjP7YmKbpmKwQb6HJXdXN0EoHYc7YeXgQwi2Ua38E4XbYjykteUparJe7FrayiSCuMtVZd6mKTCjBaYC5Lg/hLd5p8KAjUwVFiHFxJe1kvUyN7lE1G+GCYYtm4sNbnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYhqWJyHaM087JXotqIXKs3EOmyezlCfEHykNXyKFgM=;
 b=HGUgDDBMYzMbWfx+gcvZGOdZSDRcl8wm7vA+8tFulo6K2xmBE3iDevvt5fpCjldsXNL+pBsfp1soJ2xFKB+xpa3iq97OO1eSkKekmPoRiJo87yDlKXhmUV6wNXgJBUtDA4CafoJyCf6/ItDeDuuAASO4rHcEwKqbaNC9DekR1ak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v3 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only
Date: Fri, 11 Nov 2022 14:17:28 +0000
Message-ID: <20221111141739.2872-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT057:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 937cc39e-55e3-4c99-3922-08dac3ef851f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+IewGGV8Ju5CHU5Wzj5url6mxu2PKE013VUfmQOVVEB9yl1un9Zvbuh7DW+KK03S3shgEDgkHml1OJZhYUpGfEuVaE8Zgm04MY8T2oKkMRyXe3Z+LQF1Ze1mY0gj/L2Ik+N4/Myk78WyzqOObz9as43HNydkF7Q3x9t09WDYOmsbAdA4mPbXfdUHMYwRlujNyqd/Pkjl34cDaapqWKuoByXQ5ZiWL46vny+ylt++O9uRVYXxj1ol+YjyHDedsY17Jw4tlpRYUjMB9aJIyGH96VK5SVjBwI9RsZsY8PuVimzRU/aQH/i0YHfWluQl+htMs9ublOLZmA8ZZ/NfqdcweN6DfT38ZkWwmpcoULsAAtvTWUDN/ScwkXFMhk5si3GyfcqDSW0cK9k82BL5JbfhGJwzz8s1GVnRon8nt2JF+MggHq4Td24dAT0/TbZ6uGOg5uU5BqC7a3iz3FkahJPGtsd1KdL2xqgmmh33TaxWxgnqruauJDAd3ZYp5NBzGk+Kj2VqqufWTG2fyQVH+tbOjaNWKqhSf8vFMXeKjQKYxCs29eE18d43skrLzkqzTPxikfwqwbPLDW/AqpkwQJZirU7alnbxLOEhxyWsu5MVwaxqCSyPVEi+NjDipPV8TNfNFbrhkrbrp6SbX64uBlW3GBQlEd0J46DC4Yq3qr4azO84uuIWbwhhVHIW0rwfSJlBQuDSfbGVQS4R0phY6iT68EctUKzpAUIQ48dMHTWywCooEovb4YQT1B4adjLBXjfNfJUT2XNKxY4FiUDkdHYVv5ThJJtX5L9YZosEtoYe5gA5bdA6P2IJwHiCAsSNP1xQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(81166007)(356005)(316002)(6916009)(82740400003)(54906003)(478600001)(8936002)(83380400001)(2616005)(36860700001)(36756003)(47076005)(26005)(6666004)(40480700001)(103116003)(70586007)(426003)(41300700001)(2906002)(70206006)(86362001)(82310400005)(8676002)(1076003)(4326008)(186003)(5660300002)(40460700003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:17:52.3893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 937cc39e-55e3-4c99-3922-08dac3ef851f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044

Sysreg emulation is 64-bit specific, so guard the calls to
vgic_v3_emulate_sysreg() as well as the function itself with
"#ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -
v1 - 1. Updated the commit message.

v2 - 1. Updated the commit message (removed the reference to Arm ARM as it is
not required).

 xen/arch/arm/vgic-v3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 015446be17..3f4509dcd3 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1519,6 +1519,7 @@ static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
     }
 }
 
+#ifdef CONFIG_ARM_64
 static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
 {
     struct hsr_sysreg sysreg = hsr.sysreg;
@@ -1539,6 +1540,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
         return false;
     }
 }
+#endif
 
 static bool vgic_v3_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr)
 {
@@ -1562,8 +1564,10 @@ static bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
 {
     switch (hsr.ec)
     {
+#ifdef CONFIG_ARM_64
     case HSR_EC_SYSREG:
         return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
     case HSR_EC_CP15_64:
         return vgic_v3_emulate_cp64(regs, hsr);
     default:
-- 
2.17.1


