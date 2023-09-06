Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C27939EA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 12:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596454.930358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdpo2-0006e7-I5; Wed, 06 Sep 2023 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596454.930358; Wed, 06 Sep 2023 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdpo2-0006bM-ES; Wed, 06 Sep 2023 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 596454;
 Wed, 06 Sep 2023 10:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7I91=EW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdpo0-0006bC-V1
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 10:30:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be20e9a-4ca0-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 12:30:39 +0200 (CEST)
Received: from SA1P222CA0147.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::11)
 by DM6PR12MB5023.namprd12.prod.outlook.com (2603:10b6:5:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 10:30:35 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::17) by SA1P222CA0147.outlook.office365.com
 (2603:10b6:806:3c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36 via Frontend
 Transport; Wed, 6 Sep 2023 10:30:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 10:30:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 05:30:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 05:30:34 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 6 Sep 2023 05:30:32 -0500
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
X-Inumbo-ID: 6be20e9a-4ca0-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j16RLfOW9C4YiaH7BB6MMRcFU42D1+U1SQcp/GDdtLxhSlRBA0SMvahdDG21hfEfx0Jb1931rci4I7vIXpPeGjphKvhZFKY9812BxxZmpZ/ya6vVobft22b+q3FPb5oAWNvC6oRsZ8sYoHWtsbr6/SPCEBe8OnwL8+1f64ZygCVPcorumcYiFyKwzTrFD9NCMwq89rVxuBZZFufVelq6aXBUmaqRQLu62373350ArOKBT5ZdOZ0zn4VmgjzwBY84ZtCc+KeX1ug1hG1roAW3VwB59kdIGclCwkNaAnuYolfHEDPmysgb7bG5KDEhwXr+aWLd/fB7bwVkLYhfdbPwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdAtjaar4ROIVXVYKTPqVQwFRkWwqzCrYvtnNpQFYjI=;
 b=AU+yNmewweewP5q0iEa+Ss9UtvgctCdiBWKwdOdOdk5cZT05jJS03yzBMeb6qpIe4MEGkcrvyaM7zBFTcMly5aojAbor/xkVNXzAjJdsP7b7gmNwn6nKHhGSaRpzNjVeRMV190T5Uw6bgRaPBMWcnvsw3sBIaIU4kldkCsd3ie6++R4PpQ6JZdP/0BNz1iAj2j8IUj2+8h9Z4mcIGfvOxu9I+XFBQrvM65Vl8ORc5ZKK4HDWiaISNJ4ZS6d0VCtQE3KZL8kKmYzN9WZc71yl9cq4YAg/d3o5RUhu8obqzk+56wFbS0r2KUGloY2Tetg3104S39oWf8LYcmAb2jIrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdAtjaar4ROIVXVYKTPqVQwFRkWwqzCrYvtnNpQFYjI=;
 b=Rd5vys58nk8N6XO/QArCXNBAHo+Pf105yM7W/FxzoCcrolHhEGIlwkY0YZGcu9rtw7KWfXfKHjBn0jTTyR7Vj6RpCXgldQNbs5NyTz8aa6ZJmrYB15FPWHxEdW2d7Y7n+blKU/tmguVxQmtZ+UhwPd2/HIkfuDNoZoB0UZq5iQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	<vikram.garhwal@amd.com>
Subject: [PATCH] xen/arm: Fix printk specifiers and arguments in iomem_remove_cb()
Date: Wed, 6 Sep 2023 12:30:14 +0200
Message-ID: <20230906103014.19574-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM6PR12MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: d52bd04d-ddc1-411f-5d60-08dbaec44df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qs7hlqg0BkaBAuOfigZyWtTLSdA74PBXArA+lXNIYv3+mF9mbX0UlsXQH03H6hS14z38quoXdJ+qfgjSA4mfLL3jngsEzu/roqA5siaF/sSfpOm9B887q1UmbbXQ4fUGsI57L6/FsvwnWTgVfgJ8JwkHQeiVKmqM8AcSMfQM7HJCsi/MQ7D7ti5uw1Vsa0F6f1WKnivD3BbM3Yh26NiDPvMGcfPzsftOSjJDuo2yX4I9dd7RwiG/m3hUftLG+wB7/mU48Hcd4yindhJ9w/YfZ1HmeC3cD/MwEaoop4FUXvCt/xjcm18Nw7j9ovnmIfGO3rsgq4e/EYBjpO6VuNcxrBbLPkvHs0DoxX/ysHd7YU8bur4woFeySCqqp0BjqtP4HyuQkYaEWcnKn88waScKC2kUc+kLo8olwVVmK5g1c5YS26o39UMDxfwbssU5E8J/5hBRHDaPAYAJ5C4dgU7TaoRvcCtTW2uXZcK1ZVE5EaQTWe3bp66xrMcTnwgNYh32y5REmodIeBv+1HyNvIS3IBpfrYn77F2Vp5m/j8F3r+W6wG5h/RCjh/udZXveGXYywiQxjmCwBwe2Kyqsm9AcMTaKXvpSsPqGj1Q6S/h0ASJW2ERcaGxfG06ePxiUdoZOuJgJgAJHIiaBdA+YUqPiE+vvCXZmTEi36p2klsrVRjzaTR5bRDseb5fxBy3E+v5w+CW8SWEJpA5IRl7a314mM8F3b7CwrNV7S4HZ4aJvf+qTa7/WZIMjxpmSS6tJcVxLULiYv9tvBOWhSioV7pYzig==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(2906002)(40460700003)(70586007)(44832011)(54906003)(6916009)(70206006)(316002)(41300700001)(40480700001)(8676002)(4326008)(8936002)(36756003)(5660300002)(966005)(6666004)(86362001)(426003)(336012)(47076005)(2616005)(1076003)(36860700001)(26005)(478600001)(81166007)(82740400003)(356005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 10:30:34.6752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52bd04d-ddc1-411f-5d60-08dbaec44df8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5023

When building Xen for arm32 with CONFIG_DTB_OVERLAY, the following
error is printed:

common/dt-overlay.c: In function ‘iomem_remove_cb’:
././include/xen/config.h:55:24: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘long unsigned int’ [-Werror=format=]

Function parameters s and e (denoting MMIO region) are of type unsigned
long and indicate frame numbers and not addresses. This also means that
the arguments passed to printk() are incorrect (using PAGE_ALIGN() or
PAGE_MASK ANDed with a frame number results in unwanted output). Fix it.

Take the opportunity to switch to %pd specifier to print domain id in
a consolidated way.

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
After this patch (and the one for xl), we are left with one issue breaking CI:
https://gitlab.com/xen-project/patchew/xen/-/jobs/5026938514
---
 xen/common/dt-overlay.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index b07a6128dc99..5663a049e90a 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -251,10 +251,8 @@ static int iomem_remove_cb(unsigned long s, unsigned long e, void *dom,
     rc = iomem_deny_access(d, s, e);
     if ( rc )
     {
-        printk(XENLOG_ERR "Unable to remove dom%d access to"
-               " 0x%"PRIx64" - 0x%"PRIx64"\n",
-               d->domain_id,
-               s & PAGE_MASK, PAGE_ALIGN(e) - 1);
+        printk(XENLOG_ERR "Unable to remove %pd access to %#lx - %#lx\n",
+               d, s, e);
     }
     else
         *c += e - s + 1;
-- 
2.25.1


