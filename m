Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA568BD7D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490416.759094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1Bl-0003Oy-Vc; Mon, 06 Feb 2023 13:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490416.759094; Mon, 06 Feb 2023 13:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1Bl-0003NH-SY; Mon, 06 Feb 2023 13:05:41 +0000
Received: by outflank-mailman (input) for mailman id 490416;
 Mon, 06 Feb 2023 13:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8u9=6C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pP1Bk-0003N9-Cr
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:05:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f31833cd-a61e-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 14:05:39 +0100 (CET)
Received: from BN8PR15CA0052.namprd15.prod.outlook.com (2603:10b6:408:80::29)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 13:05:35 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::9) by BN8PR15CA0052.outlook.office365.com
 (2603:10b6:408:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 13:05:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 13:05:35 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 07:05:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 05:05:30 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 6 Feb 2023 07:05:29 -0600
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
X-Inumbo-ID: f31833cd-a61e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRVf8Bonfm0clHVZ7uDfJGSEaPs9judjQOlECFFj7gF5CLqV6uIOQxmEEzidhF77Qevaup3WCkLXuVkQ67VcxMR9gV5XorJXF3wM4zQ3bYBVMG9T1ZBacpyCvFcsiZzIkP3sOydPlPKARPVp57jEaHavrNf0ncg9MBK1Iw2vuKZ4wNBbxP3+1Tta2uZwSsA8wkQ4qFG0b8YW9yPzhVoGQ4GgiAq0Sp/RqoZDvnSMGXRqM14T+MWyE8k+OvOWym591WQhP6yeN09ukalPGXXAbLSMyOdmY0Sn3ndCIMk6JXufqZ1HgWHZ0AoWgnXF9pLC0g/1Psi7h3RY1wnvXmmDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUmcsFJe6MF83JwgO6YoYfEPn008C6+sQIYoOesLnJY=;
 b=DhYgs2ZLkac416MgWA2EfpQlg4yLI8dMrgw1ZSR7AyvU9RDAK4wvFEIhAOCIkFxHmS7AysLPC6ElfIumoIepAfsVQgLisv1jxQJSQnICZ0Mj94rb4/EX7WXZNiNLgDXt8gAWL/oH/iwRYY7xTNo5OY0to8D81G2gzdb6dCkCT71yrd+Dgxht/3rpEuLv3nklSXZMsIhu5l6bYSkFehTl/tYnktV79D8450lA7nrBm77oOxtSaadRF3TtepBb5ZKB/7bwVfF7I+hoPO0HGxhTdKC2TMq0BTrfw/KnuzI2bH8A9m60WvyVLQEAm+6TVW3FS5ege27cGHODk+GtwR+pQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUmcsFJe6MF83JwgO6YoYfEPn008C6+sQIYoOesLnJY=;
 b=keNqaKx5ibD0evTcJ4qMdneoidgR3ZPcGOxRAy9dg38iJkpeUkUF62MnWhKxOQhQz6b6lFnVoyIfDh7dLblodda1dKAt05vKnzTW5luqMo8EIU83wiXOa1BxK2CpaZHvTqg7M9nqLGE7XIUa8CjdeF7eZSNI6qRyGUNiUS5eaTA=
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
Subject: [PATCH] xen/arm: Print return code from domain_create and construct_dom{0,U} on panic
Date: Mon, 6 Feb 2023 14:05:28 +0100
Message-ID: <20230206130528.22401-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7ff0bc-e7f9-4a3a-957c-08db0842d5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/R3nVme2bDifSazrMMVFz7mu6gCZCbSCcfYqZFgZySO3HdN4GJ7CIEXM6JY+0dN9uIBJsEGf2usRinjkEhvOTlo/W/Ee5D95CjXziapDsOVFutRM+ebk82Pe80220QPcgVYFnH3lQUH0aKI6MaH7B1FpBMha3nmwFxpl/tQqaQ+4dzHWVWz3J5gB9fSAhNSX2bCJIy3fXQHSt+CjBpnKWzTBlR8QEehXzp9rl/rTY+icuP5D/V2yVH1++yqviPyBNZ1anLB1S7MiLOEBDXzXNUPUpU54+uRx1ch3YJn1OGdhoMFMHxmrApZGjORM9Fw8D4MvNygfKsybVg99QyvxAUd4TN2Vrz8n1nQ5SSupIWShhjMMifkARl7Y1UkRrzcMxOh//gH2pJac/j+9LpMyG1h+TP5TyWwdaL3rc3vMyQ07JdUmynuiroLN6LdE+huOMdb2U6CWTTK9Ziz11SfDq6eQfD4oCvnj5a7PHSznueA4WH/kNlFLkCak27DZ4hALtOwTMtuQPsJoqU87XFk4MNcuhiONqrHKXiY09vxJVkOAOqhcVZFw61P8iyK7WmGfCPtj3We0AhX7pSa7s1nouazsE52vJsqnDZgNYZgEnbwJYIWmJYxqzdsluTKUA+3ZFB2xmD0aVvSNQPn2blC8kP0kucgJ2Y32h5OlF/VJu4TOmSrxJL3FmFNRWuRjXvBFe4QY4Z6mHXKBuOnMaSn1st+gTVhZxALyZjvTYw1Na8Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(83380400001)(82310400005)(186003)(426003)(40460700003)(36756003)(356005)(40480700001)(86362001)(82740400003)(36860700001)(26005)(336012)(47076005)(81166007)(2616005)(41300700001)(478600001)(70206006)(316002)(54906003)(6916009)(44832011)(4326008)(1076003)(70586007)(8676002)(5660300002)(8936002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:05:35.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7ff0bc-e7f9-4a3a-957c-08db0842d5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323

This might be helpful in providing additional debugging information (in
most cases, at least to distinguish -EINVAL from -ENOMEM), so modify the
code to include printing return code in panic message. In create_dom0,
move the call to alloc_dom0_vcpu0() to a separate condition and call a
meaningful panic message.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c2b97fa21e20..edca23b986d2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3874,6 +3874,7 @@ void __init create_domUs(void)
         };
         unsigned int flags = 0U;
         uint32_t val;
+        int rc;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
@@ -3966,13 +3967,16 @@ void __init create_domUs(void)
          */
         d = domain_create(++max_init_domid, &d_cfg, flags);
         if ( IS_ERR(d) )
-            panic("Error creating domain %s\n", dt_node_name(node));
+            panic("Error creating domain %s (rc = %ld)\n",
+                  dt_node_name(node), PTR_ERR(d));
 
         d->is_console = true;
         dt_device_set_used_by(node, d->domain_id);
 
-        if ( construct_domU(d, node) != 0 )
-            panic("Could not set up domain %s\n", dt_node_name(node));
+        rc = construct_domU(d, node);
+        if ( rc )
+            panic("Could not set up domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
     }
 }
 
@@ -4060,6 +4064,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
@@ -4077,11 +4082,15 @@ void __init create_dom0(void)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
-    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
-        panic("Error creating domain 0\n");
+    if ( IS_ERR(dom0) )
+        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
+
+    if ( alloc_dom0_vcpu0(dom0) == NULL )
+        panic("Error creating domain 0 vcpu0\n");
 
-    if ( construct_dom0(dom0) != 0)
-        panic("Could not set up DOM0 guest OS\n");
+    rc = construct_dom0(dom0);
+    if ( rc )
+        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
 }
 
 /*
-- 
2.25.1


