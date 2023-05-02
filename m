Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C4A6F4D9D
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528856.822537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYp-0005nq-Dq; Tue, 02 May 2023 23:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528856.822537; Tue, 02 May 2023 23:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYp-0005kp-AR; Tue, 02 May 2023 23:37:31 +0000
Received: by outflank-mailman (input) for mailman id 528856;
 Tue, 02 May 2023 23:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYn-0004sC-M7
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c196cac-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:28 +0200 (CEST)
Received: from DS7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::14) by
 DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Tue, 2 May 2023 23:37:22 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::b0) by DS7P222CA0004.outlook.office365.com
 (2603:10b6:8:2e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:17 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:16 -0500
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
X-Inumbo-ID: 4c196cac-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+Jo3aZ/KXfCpID5n2MqwuEg+k/PJWPStk/V7ThEjUdZSxD2n071o+4GiDyi7VQShAVY17IRY7Ygfy2XcBUTIEmJs0AUzAi+Fnktq7MGgARIkko7gEphpqHdWdZ7OE5/VhUK5LRMpnQThG34+rszzv/22fhLnNqzN/+7Pzldq0Muno6B553aa2LvDjmv+IBqyBfCl1PXWMUSqtZY3aOdnS+XotN2TdwdmXXCQ2A+k+3iQcdjgBfnmrm5B4A8n5GKu4s9i6HkjlKMgjDyfb/Jtd6wB+TFceuEhm7elEcPXrJS+G9ICJovNLTohBfS4myaVSYHLTJGDl1hj6QSAnh5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzddX9TV10ndAd/6iE6kCNK/WBOdnTL0B9KxpRRHgRI=;
 b=j3fsZJ9IS3+TAhj6342U+O5MPJm3D1bTxoachuuFo/r8ed1CYRt4rNRKAn9gD9n0krpTmCoebLydEExor4KfOcxoANBbt3fUieHqEAKR1t0CTUoqzdF80prbHe7a1Txqvz1yGL5JOBlgNKdtAlH1JdFggaU8Fdj3KgGz/OF6ulbE6PMMgPqiVGLQWlcYGv/zOj/KKcwimlVJL+oerHgfQ6rFa5k2ghnpXwHbkoZ80NmtxpJBKJIl2oICsPg0FtlN2TFxS2wgA9bbwe8KB50uqY4ZjyWMxxYOO7DPeZyurt/2WWGFzVwL5Maw0kDemxiYUKBl+FwoL7De839WZvrX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzddX9TV10ndAd/6iE6kCNK/WBOdnTL0B9KxpRRHgRI=;
 b=zTMm0RzZVvXES+Lc4cafDnZ6fs6J9ghbOAfPJXcrA7fJUAzCobmGtkkaJqH7E2PgoOoihXEnWr+Kh1+BdT7ujmx1hBYb36qg6bhudH5Rk1JZlgBk0IhPz7cJpjqEfzLOA4+xylCoZRhU1X/smL9grrElU3tAmjUoQCPgiexGxic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 02/19] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Tue, 2 May 2023 16:36:33 -0700
Message-ID: <20230502233650.20121-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c59c3d-252e-446b-6218-08db4b662d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bXZpaaDpLqpx3roIliDKqmF4bmnR5HXhmhZVM2NqaPcDVBz31GEC/P2lYHnGwskM3ttHDDta60GqtlFtTIBtKvOWiU5BFy3nB0+4yngPumQS6bNottUnxA+rZkIBx4GUOjkWuFzuDkFaapJG8Cha2wE1Rs1l3NZ3Kwl+GD8NAWwjLVK7dExeGwbJww/zmNuRW/1DpZ6S53DTOyWWbEx0cyMxkuD+2GsmLp8U3mvihdVWbrcOCMJJvgBxnqGSPy1eF8+hKrTvyitW9TuJGXIDA0cN83Q8aqbfa+NyW6Q2nzp/5iP7wMe3v5ofIgM+Lvhkkeq7FOAaTObKqS9xEV4GOmF3wDpBT3T19HYOFii1fJcAoxb8lXIgVxrGO982BogbCI3DdjJD2iPUU+Upywx3hAwhcDPcQwmf87l7UJQ3aFkfHQndWb0hw1pNQNvbwBNgAtwUqdDmFPSpzQNnPVhDUpZSNI0sehU2LBu7WKz+a1eUokDVs1L4nVcU5Er1bR03dOcV2gpt6yn4DWC4cJEVjPHb36XXbAdJoQw41qZyl2jteQx9cX3Btr4AiNOIsU7ZKp74sqW4Ns9H7kpvZCG/ZIV/ogC9rEekq7qZesxjsGau3cT+2b/aoImpD/5EKH7t7rLX+WUzX9q3mwdz3udItMPeHZjy5ekkdMXaQSKMeGhGrOPq845wG/bn+LwGKLPWnduD3troODuoJ0ZZDrZTtHtGBYO+Fxg3RikM9XX1iuU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(83380400001)(47076005)(36860700001)(2616005)(40480700001)(41300700001)(40460700003)(81166007)(356005)(36756003)(70206006)(70586007)(82740400003)(6916009)(316002)(4326008)(186003)(478600001)(1076003)(86362001)(336012)(426003)(54906003)(26005)(5660300002)(8936002)(8676002)(44832011)(2906002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:22.2380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c59c3d-252e-446b-6218-08db4b662d61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 5f7ae45304..fc38a0b3dd 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2056,8 +2056,8 @@ static unsigned long unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+static int __init __unflatten_device_tree(const void *fdt,
+                                          struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2078,6 +2078,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
 
@@ -2095,6 +2097,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2179,7 +2183,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+    if ( error )
+        panic("__unflatten_device_tree failed with error %d\n", error);
+
     dt_alias_scan();
 }
 
-- 
2.17.1


