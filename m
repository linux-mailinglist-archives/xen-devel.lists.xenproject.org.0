Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B68781614
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586693.917963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q8-0002NK-C1; Sat, 19 Aug 2023 00:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586693.917963; Sat, 19 Aug 2023 00:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q8-0002J0-31; Sat, 19 Aug 2023 00:29:16 +0000
Received: by outflank-mailman (input) for mailman id 586693;
 Sat, 19 Aug 2023 00:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q5-0001Sg-RT
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae6c5fb-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:13 +0200 (CEST)
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:06 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::59) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:04 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:03 -0500
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
X-Inumbo-ID: 6ae6c5fb-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbFpBghYRnJUKXtI3ClucqSvq2ZgMXiIlXOyOiAtWBQPlic/LuB/MVNdEL+EoDPe8j6YDQu4fA4Ao89yTLxdGU2zv0LkI1AtWTryjdmBgLi7BKoW+CPqsvmTuJZ8vLrVFtng97grhNj//HrD47OdZ4mESLlZvb6c7xOM5MVkadK7N8NKApgHmhQcF99pmkAR0FVEJJsCT/f8hzhWep7hutJoEOxbNmxQEwfegVVhJzTIDVnYBqrv9CtBdGsu0okfwohSKA7l8+PdyXJQcXZZrabxwWTI19MFSvRH2Wq9zANjoTbYThwXRIepOIiYZQd2phz3duBHec6Wwg93yTIXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNJuXj7ZBUQRHz29zlrzeHOa0+tHLK1DzkscWEXkjVw=;
 b=KDk+B6DFnG+U9VbQehjedPFB5g9ME/Hb4vGgWIffyZG/aTDoGJKaIDqE40nOuevEV5ZZvobnx1EmEL0t5FtANz5az6jMeFDLSxH2pDKIC/fGEcC+wqlKFC6J1+t87N7Jz6fDsGsS/RtCzp+d0paPbBf6Tkkrz4qCBC9WwgiGLyTxFjJ/BWBQUubQY6QG34QDHRiy21Jhp1bFp9yTzAzIC/ATu+n5PfWoePkfT9sT1AUQslD7PXem+Sms8xLj5H0np9Mh6hYbasGan116vkKyp3DtBeQxK73cI7bjEO4dc4FWerKCNr3jjYFZjZes0Cym1Myw5NYthPpcilfZFjC4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNJuXj7ZBUQRHz29zlrzeHOa0+tHLK1DzkscWEXkjVw=;
 b=Ne8DGQWMXygdCn+OWg7CqZ16BZ+e2YyXhnmAAD6vTZzMGGv3yq2Wh1dkozUCMdffxJ74zblon90gTeBaxkGQITVMVNSEEZ2zBEcdy4dnIocIHAVOeohYPHbPJPBMK4DViX6r/JBNecCQOgNi0vGeOYGE+4ZWn+Uxn0q7A0Dej8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 02/19] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Fri, 18 Aug 2023 17:28:33 -0700
Message-ID: <20230819002850.32349-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c81f05-ab15-499b-a562-08dba04b4b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUgHuXUpJ7zTA1Fi1DS2khempAAeqUtUfnioE2Yga5ZIjJWj6vpqT35hnF5Qox6Gc9vgTe+9uY0/uyrGvDBkbAd7Iz8U1EKF276kEyrLsZzMQkcGbhvedelMFxsQrJa84eBM94ZaYTZYGV6dIxVM7S5I4MeKvbvR2kLYwZ5UGZE4VP01EOTUQYcxdyyaurD07lHtzPl604gF8znjDQu0CWeZWR0l5I3JkFUOQzdXs824EXozclzHWm47z5z1txVROqfE9sFDh/63FtsTu7xM+V0TFpZOABjos4MP+c+bhJaWaqsHWgYwl6q520mIkyliUdmk3DNpUwzfEhJK+jzN1r8D+ynWP9hGlGYe2BmpoUizWu5lV9J2HBrgmTOJrK6ke5xkakJqz/NHdGGhlr0HusP/HK622VONn+Y6uAt+SJIWN5USz0xxkcZy2SHqLa4kwDuW/cPa/p2ntlGirgYQk32BnmBnWIAE8p+qIi2sgP8ZDI9gK0hDvZALD2DsIz4WCDInN/QzMj9Gk74drZRLXd56lF3D1fDo0mCVKri1W+h6r4pECdR0ok/fNcCvFU24JOErtfI8h1NNLf5x2amoQey1nAnvA1J9Ly0xE8PWfSfirHgOasAy22KHVoWN7C2HtxNRLAhnzM1cms30kOFW4BgUGWsrAZ+GMYO4vimUnEOh+HCJfkWr9cvF01KahnSCkB75CIqhIXsTJG/qcib7yVXPmqRdPPeuQ4bRnU00vsM/Rn9kwXJY6I6eL0sDG2hRH1LNC1hbK8PCkvEaQH5fUA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(36756003)(40460700003)(40480700001)(83380400001)(8936002)(4326008)(5660300002)(36860700001)(1076003)(2906002)(8676002)(41300700001)(26005)(44832011)(426003)(47076005)(6666004)(336012)(2616005)(356005)(478600001)(82740400003)(81166007)(316002)(70206006)(70586007)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:05.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c81f05-ab15-499b-a562-08dba04b4b85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540

This will be useful in dynamic node programming when new dt nodes are unflattend
during runtime. Invalid device tree node related errors should be propagated
back to the caller.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Free allocated memory in case of errors when calling unflatten_dt_node.
---
---
 xen/common/device_tree.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index c91d54c493..cd9a6a5c93 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2108,6 +2108,9 @@ static int __init __unflatten_device_tree(const void *fdt,
     /* First pass, scan for size */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
     size = (size | 3) + 1;
 
     dt_dprintk("  size is %#lx allocating...\n", size);
@@ -2125,11 +2128,21 @@ static int __init __unflatten_device_tree(const void *fdt,
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
-        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
+        xfree((__be64 *)mem);
+        return -EINVAL;
+    }
+
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
-        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
+        xfree((__be64 *)mem);
+        return -EINVAL;
+    }
+
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
-- 
2.17.1


