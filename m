Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AD6457D9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456161.713893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rg5-0006pd-6T; Wed, 07 Dec 2022 10:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456161.713893; Wed, 07 Dec 2022 10:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rg5-0006mk-2m; Wed, 07 Dec 2022 10:29:25 +0000
Received: by outflank-mailman (input) for mailman id 456161;
 Wed, 07 Dec 2022 10:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9USZ=4F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2rg3-0006mZ-CQ
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:29:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029f606e-761a-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 11:29:21 +0100 (CET)
Received: from BN8PR03CA0028.namprd03.prod.outlook.com (2603:10b6:408:94::41)
 by SJ0PR12MB5503.namprd12.prod.outlook.com (2603:10b6:a03:37f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:29:17 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::e1) by BN8PR03CA0028.outlook.office365.com
 (2603:10b6:408:94::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 10:29:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Wed, 7 Dec 2022 10:29:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 04:29:16 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Dec 2022 04:29:15 -0600
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
X-Inumbo-ID: 029f606e-761a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6ZCS4+xDwZANG+TIYMBVb99bvGGfJHREIJ8NC3PlUfP3s/2tfHpyu5Xmd3BOCTecyFrswQR9gSWGWxfWGSvs4AUtNSkby9Zp1dNYf0VKQV9+czNphg7sxN948OKfI0tFb9FCXGjGNpuERF86rlNDLomELiGMtNvwXIPwTaZ4AKMzq+nAQAa/FtHrR7eBPw6X4I56njI7ZnOssPZA+FhGVtxdK4GMtuMlbj0kta0m6HWYsVFXqFLm0AzkmZ0mFy681sFUPy/Fhwwxo41rcw86XvfiiDLW8MJPW528tWITdKL5ulpzE8pXd6ROHBZYvxHGJpicv/WoSqA3Re7I4JoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzCm0T8TgsnX/v1lIUm06IzvzdKhH6rJ3JrNtijnIMQ=;
 b=bcRtr4rXq0JPMnI+5QgTiJZrmd6XlBPKKHZYQQomUIcqNT6NZwupzAzF7YXS/BUSO3Ndj/BK8ORB2/3Z1w9qGtMwdr0PHFG9ii9gvOqmpB4Y5jG14pK3D930gP6Z77j/sxPZNGvXmdkWzGoFU6fAiTiP2Au1JVlXwmNm0cuqLZ8jLHY2BhFA6FI/5qyNL/pOwGO4w2QCTyia8M9TRKeMts8/eqlHRHPYBbFNow6HnTytskW39IrvJwhS92ljyLIar/QgTrM71iDPq+/86D5eOJQnaOLAwyT4ANlSqMdwg8ZD3e4zDiYbKVL2BNv1f49GRGLylhHP5hdBfio+KofdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzCm0T8TgsnX/v1lIUm06IzvzdKhH6rJ3JrNtijnIMQ=;
 b=vP5XPTvLjfWJCclUaV/mvCdHthwBB4GmH4UzGlNj+6XjVAAXvRUPrkCnBJgM8XEmiVTvAbx6xO+9+qG7SD4oBlbqkiI/VJvmKIac7VC/ppCJVhFVOoHJDBUp3/pURxfkgKc6qjRAlkOwoj+I0SOsemZNWe40mtyY2ASmQMZST+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/platform: Protect XENPF_get_dom0_console if CONFIG_VIDEO not set
Date: Wed, 7 Dec 2022 11:29:09 +0100
Message-ID: <20221207102909.17794-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|SJ0PR12MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1989bd-57b5-4117-1930-08dad83de4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGH++aZC0uS2CQkY/wFfarrZ5/8+hfFt4VUUYYrWAbK4/uZGbjjaJBsIeptzIs1dDwp++HalIyZIrFMG6uoS/2jQYUfqnLqOk3wEV/jnTf0SNdpn0UxoEsuyoJR9kefpuwN/f8E4foY0JoxDMvER+ZV3Bfw1wGkIz9vvL9YiJ4KqwS2h+yKiV5XgPM+udsHZbGj8GlMNG/vfUp/jVMlMz+PzI4UaBXfUEWi0/0AXqv6Q1V2KxDCPTP3Uk5OOexDcqGtgfgRW00mliLE21i46saUyjHPNrTWUl3EMIumjP0/40N2ZLgT3A4azL+IsAj9+8+M1aI0amCvoxtwlfYRo+QIJYhiX7gmqadwQe/4TSn75kfTtruYipIcLLT0OYrkwzwpfuWAm2y3fLaqSM7zk4oUG0FiStC1Ut/uL0kV5bxX++pbWUE3mknll8ux1kqX7PBD422rAYjieLiy5K1Z1bmKNJ1hvoDn40UO5Jsude8qih9kPCYoEWFYVZCG3gxxy0LvU1Pvk7aYpCFY7T1d1lVsnpOxWe1d2wAVseEs66DA5JyDyXI/69yB9vkwFI07XveBQp6OGh7dB2ynbPaQ6v4tp5T6wQPfIJWnWkJHWxk5wci5eM4lpJz0ZDzCT1Vx55QnKjgNUkD21520k5c4bEzSJ3RQRH3VnU9ExhSKChATMMKRvBFh8kCKSOLPu3erSZ9YicUMLvzZ1SV+UOEmFJNBHIXpbcjDusfAyFzQEwgu36yPKnlnU9YsTdEeG4fFTS4MSlldlb2Z+rgkINcYgVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(26005)(966005)(4326008)(6916009)(40460700003)(70586007)(2616005)(82740400003)(8676002)(70206006)(36756003)(36860700001)(86362001)(40480700001)(81166007)(316002)(54906003)(478600001)(6666004)(82310400005)(356005)(2906002)(83380400001)(44832011)(336012)(1076003)(8936002)(426003)(41300700001)(5660300002)(47076005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:29:17.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1989bd-57b5-4117-1930-08dad83de4fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5503

A build failure [1] is observed if CONFIG_VGA (and thus CONFIG_VIDEO) is
not set. This is because XENPF_get_dom0_console cmd of platform hypercall
makes a call to fill_console_start_info, which is defined in video/vga.c
and built only if CONFIG_VGA is set.

To fix this issue, protect XENPF_get_dom0_console with CONFIG_VIDEO
ifdefery.

[1]:
ld: prelink.o: in function `do_platform_op':
(.text.do_platform_op+0x1a7): undefined reference to `fill_console_start_info'

Fixes: 4dd160583c79 ("x86/platform: introduce hypercall to get initial video console settings")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
CI job failure:
https://gitlab.com/xen-project/xen/-/jobs/3430825994
---
 xen/arch/x86/platform_hypercall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 3f0d0389af44..08ab2fea622c 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -839,6 +839,7 @@ ret_t do_platform_op(
     }
     break;
 
+#ifdef CONFIG_VIDEO
     case XENPF_get_dom0_console:
         if ( !fill_console_start_info(&op->u.dom0_console) )
         {
@@ -849,6 +850,7 @@ ret_t do_platform_op(
         if ( copy_field_to_guest(u_xenpf_op, op, u.dom0_console) )
             ret = -EFAULT;
         break;
+#endif
 
     default:
         ret = -ENOSYS;
-- 
2.25.1


