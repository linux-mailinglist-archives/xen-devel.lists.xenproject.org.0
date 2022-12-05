Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05264295B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453612.711192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUm-0004Cm-WE; Mon, 05 Dec 2022 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453612.711192; Mon, 05 Dec 2022 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUm-0004A3-SQ; Mon, 05 Dec 2022 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 453612;
 Mon, 05 Dec 2022 13:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2BUk-00049F-Fz
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:26:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e7f7da-74a0-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 14:26:43 +0100 (CET)
Received: from DM6PR10CA0012.namprd10.prod.outlook.com (2603:10b6:5:60::25) by
 PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 13:26:46 +0000
Received: from DS1PEPF0000E641.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::a0) by DM6PR10CA0012.outlook.office365.com
 (2603:10b6:5:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 13:26:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E641.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 13:26:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:26:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:26:45 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:26:43 -0600
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
X-Inumbo-ID: 74e7f7da-74a0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFyJLuYHDAIn48Sy2YpkbkjA4jezam42kxGxPe73uLF5ebb88lLvbg+3boSSvEPrMT7QOZDe0yLwsKknpBqfdwmHhinYiXwdJLxqpu4C5lxQ7kmOM1KsZgjH7puWNUWPmygSWqIfrwl0of3M6KTuk53K5PF7b0bHLwo+wVW1kaCQThm2J76AXPFLtsDuqi8T8EP5iByDrt8D86g29FjZiFowTCi8qd2crKUHhTviEbJnQkZlWvraCCRm5q63a4Lc5rxjwXUh2vIw5vUiWkrCkHhSEqlsGmUHaMM3Xxg+uXDMTLYFnLuKXVUzHPurX8SLF6PcRzoHJ9oe7s4XhlZKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfUXAZQrIKkiNagnHJ7wx2BrbdiMgcEKOEdkkFLHNBg=;
 b=ZCe0oI5AYCFt/kZpqYoCOOo7BBnSn7jzVwq8tEMfPH1PF+Prlr8pfZBA/RJR9WEIBGvKF0yowcXeVv0G3VzxIx1S7xsd6HXwfzu8qOiRC3ZXHC4duGpPMELOF/Ua8SuR7O9hf8mF1vZ9IkkuawSorSDl1UyOVL+Xe+IJv0qqyrNiswXG254bQ7dYQgCKIcc4QSvyDANmNfvLhSH5cPu5w6o4G/l8non5ubVoZ6fIUWqRbzWclr6tcfU7NR8LSsMDKoLJNPl+1IdJortOvKO0sqQ8ASmGxGunIH5StzSRQl06957X++SJ0/SHNfggu/Tt6cn0845tT73d92PCZlNtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfUXAZQrIKkiNagnHJ7wx2BrbdiMgcEKOEdkkFLHNBg=;
 b=FlapATERC5NBLJkpZI2R/5GB3J/OBJYsN4+KCK+P2W4MYMXW+Jmxd4NtojaIApmwbh7wp8kEMeBCW+i+RqoYimSRL53bIWgZYwnLUMknhJzzMkJwOg/9Ra3FLB747QQ9YYYIpLbXNw6xDi9NYrmyLwrJBg8ZQmGfpuItL3Yv4S0=
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
Subject: [XEN v5 01/11] xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only
Date: Mon, 5 Dec 2022 13:26:27 +0000
Message-ID: <20221205132637.26775-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E641:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7d4285-0378-4cef-0ee6-08dad6c45b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DtUG7Y2TKr+hHyLe/vUG95Qg5lghnfDgXdOLlHNWCyf2cBoAFvAQNRkLnfwLVJ9yanGO+CPB5OCh8bDoGN5MjLQqI3/yFbrTNtu280CQp9+fmwQezcQZX/7t583t7y8V7AwvRAIxZfx5i53MEK4oA62M6S5xqtRwYqpqqI/URTItI8j3TwWWHcCw1VO3LOaaxifp7BtAU60mkXuKSb+2TCvgnKAyHLkNkPrNZ415U2JIYMocttJ2GDQRwb9GLRIgXynCkyXKU+leW6MghafdG+qNjNe4S2Q8LdrIrqS4q6Zlp9dL4Jy/3cRAQxJz9KYIbgQm6Kvrb6FXeOD9mAUxIASvmAUskqQSnCLUtmzGCj+LV2YkxkOETmJOTi5y694ScjqcQRY+EmAgIA5ZMIRkQN7IIT9a2r87WuW2IALZ9WYP/wSMj44PQKtZEvU6bI2sJzIkMgh9euUy6eAVSdNWlHPCpjCLRH3ZqZrAAoDOUD5aTxrqp6ba5V0EbBpJmnhpXe6C1sQS/lz44u/tpUA2DsKmHsuwSu5pJj5GPqw9Qjsjui1nL8kCUjQ72VWWO3N8USXfTdAdIDQqM7hEDKU3A/5fZQ3feHTiVvIeAqLgme7bKdQf9E5RUfXs7N9ge94G7FncdghJ8GLMXGdcARCbIksF84wNGxmDtR/sAZ/PL3XGsh+wuCQ1mfE2sNQJqZZZPCzKJWQs6jfTUMg0uVu6iJqM7HRl3TtAW0HGx1esrNs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(4326008)(8676002)(336012)(82740400003)(81166007)(356005)(54906003)(6916009)(83380400001)(316002)(103116003)(40460700003)(26005)(186003)(426003)(5660300002)(47076005)(40480700001)(82310400005)(70206006)(70586007)(36756003)(2906002)(8936002)(36860700001)(41300700001)(1076003)(2616005)(6666004)(86362001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:26:45.6130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7d4285-0378-4cef-0ee6-08dad6c45b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E641.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

Sysreg emulation is 64-bit specific, so guard the calls to
vgic_v3_emulate_sysreg() as well as the function itself with
"#ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <julien@xen.org>
---
Changes from -
v1 - 1. Updated the commit message.

v2 - 1. Updated the commit message (removed the reference to Arm ARM as it is
not required).

v3 - No changes. Added Rb and Ack.

v4 - No changes.

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


