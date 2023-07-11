Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE274E91E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 10:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561603.878048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kk-0001kM-Uw; Tue, 11 Jul 2023 08:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561603.878048; Tue, 11 Jul 2023 08:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kk-0001ff-QL; Tue, 11 Jul 2023 08:29:46 +0000
Received: by outflank-mailman (input) for mailman id 561603;
 Tue, 11 Jul 2023 08:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGx4=C5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qJ8kj-0001cj-8H
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 08:29:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 159936a3-1fc5-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 10:29:42 +0200 (CEST)
Received: from BN9PR03CA0349.namprd03.prod.outlook.com (2603:10b6:408:f6::24)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 08:29:39 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::61) by BN9PR03CA0349.outlook.office365.com
 (2603:10b6:408:f6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 08:29:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 08:29:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 03:29:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 11 Jul
 2023 01:29:37 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Tue, 11 Jul 2023 03:29:36 -0500
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
X-Inumbo-ID: 159936a3-1fc5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhNCSmuNj52GxjfeSx4MF9ZlobOGcqD+ZANrfmmnsStJjICkdhx46OFSnQ+f1Y+xhJmRbwmi8kon/ejOsp/Ws4Nt117+kzC72inXFDavjUaXuBTxS2DeF5nHqI06W5F/5pVbn63waNK+acZVEkR0iA/4xPfHn3vkbZTRjxkSMkQmwbP6ujgBjmz+AmKtM6OXJfgJlL0ccOhNmabwYcT6H3t5R5vlABbBmJZ3M+lycep3oGOPFQpYwKoLtPtYY21yB7G4blO7ANVZwXP9YtAPdEjZWXAf8iSRJ1Cyc0VazPpJg7ZlmrS6rs5c1cciUgfNWFG0wVBTjh6RGjlnILNf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk3lg1kmifrQv5WMidBKQfd64VXe9Ntgkfwp5vhYxrY=;
 b=l8xePGT4laCgPZk5GHjg4HGin0pnz0wpx30VMUMPfShLvqLr6bXBay9951p3PiK/oaaSxPQMTDeCx9K+bFGDX723t35O5v8YsEjqQm5giw2HWdKIYAHhJHKP+3fgWGxPLBbYie/Jd5yxroWcD8sO8/a2R1aN+ngPqGO6Vr9O4tz081RYnlcvAyOStEhlX39ZZRMyW5+0zZAMrr1tcpeFr8iRusSGxqP8B9le/JdALeq4C3/OdiKY/Ly++nLKuH1nd9B6sI8Ba7SJu04sJMkQiLKgxp0bnLvSzlGae/zix0xbBzPaWVSEvuhEuKX+hNJ7KFlyaH1NGUJKdmLRxifAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk3lg1kmifrQv5WMidBKQfd64VXe9Ntgkfwp5vhYxrY=;
 b=QdrvXWhjednhsfhd2GVUjZYlpPNCY+Y3Xm7DBmk4yjbsjWtwx/eZGI/eW2E7yr8ikw4BsfqEpnpPeFyjJf77wttdhaCWN3dvfBsC/Jkcdqb0ERPR7/0OvAg5k5HlsiRpwlHe6mGs3QWvUA8QkLEmE+LyVJeb8i9/w4KlyHCN0pI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: Fix domain_handle_dtb_bootmodule() error path
Date: Tue, 11 Jul 2023 10:29:30 +0200
Message-ID: <20230711082931.5402-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230711082931.5402-1-michal.orzel@amd.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e52833c-9f40-459f-fc3f-08db81e8f71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RfwkPY8KkBo/zyKRfFJJDTXT7PQUwAiwRgHIIyTFecYcmUWyBGTtvbm4OMglbfyojSD4h0AZLEdi+lBjx+U6FytmLbXvIHFBpVYSmQ1DkZK8b2IOgp8kRJNpkzCiz85TS4zft68d5PN6X7dyJU3O3Vys4nZsJGLNJl2GQ+5Aq9YFl8m3Oe6JtLQVlKsA/ypkUM575+V2+izep9836Xsh4gkB3rhAKA/URkKldoIv3O0KOCC10o/UnFLhoNccRnqWEMdQwOnsY6U+VtkInyFr26GJShOX4+tj+bNAR3MQChs2PQDevJwM89urhONw6scMJjODumV3ZAksV2hGgM0V9t9RnJXK9UQLgE6MIrdkybY/0i0BYL7WeUugWA1dJm7anTBd9aq2gObAbWSVTYJErhvw4FaWAvWF0VIRURfxZBfCtoGrPneCZc8SRRLfviQinWjvaOV6X5AdBcLTut7BjpgMT9KVFlMahjWk6DaBn/xeO41BadJXkvyGQRH8A5tAk0XRBs/rVjrG3kmWTd6CJdv9EgWpAZKYpWpmjLUCBbBkqGpom8xBME5mXgkCR0vFsw5rmk2RvD2nkw6lYX9535V9OJEr+To0Z3gqj1USvrzCptCMpmO1eVU91oG1aTVp4z2FY03duuvMROTHmV2jMhuotmGLeup+BoGXg9uZ1iudJUXsM7SNcfnNBRvgQah5jlGQpRQWSN97bEhcYiFy1wEl7MxA48lTywQlB+VIfg1Mm2MiDsJLinL11GGyR7Jd4YbwezhzuPfPOBYL470+8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(186003)(336012)(1076003)(44832011)(8936002)(8676002)(26005)(5660300002)(40460700003)(41300700001)(86362001)(54906003)(2616005)(40480700001)(81166007)(316002)(426003)(2906002)(82740400003)(6916009)(356005)(4326008)(83380400001)(6666004)(47076005)(70586007)(70206006)(36756003)(36860700001)(478600001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:29:38.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e52833c-9f40-459f-fc3f-08db81e8f71e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459

Fix the error path in domain_handle_dtb_bootmodule(), so that the memory
previously mapped is unmapped before returning the error code. This is
because the function shall not make assumptions on the way of handling
its error code in the callers. Today we call panic in case of domU
creation failure, so having memory not unmapped is not a bug, but it can
change.

Similarly, fix prepare_dtb_domU() so that the memory allocated is freed
before returning the error code from domain_handle_dtb_bootmodule().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0d6be922db1..f2134f24b971 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3204,7 +3204,7 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
 
     res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
     if ( res < 0 )
-        return res;
+        goto out;
 
     for ( node_next = fdt_first_subnode(pfdt, 0); 
           node_next > 0;
@@ -3235,7 +3235,7 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
                                  false);
             if ( res )
-                return res;
+                goto out;
             continue;
         }
         if ( dt_node_cmp(name, "passthrough") == 0 )
@@ -3245,11 +3245,12 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
                                  true);
             if ( res )
-                return res;
+                goto out;
             continue;
         }
     }
 
+ out:
     iounmap(pfdt);
 
     return res;
@@ -3326,7 +3327,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     {
         ret = domain_handle_dtb_bootmodule(d, kinfo);
         if ( ret )
-            return ret;
+            goto err;
     }
 
     ret = make_gic_domU_node(kinfo);
-- 
2.25.1


