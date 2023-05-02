Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282C6F4DA0
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528857.822548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYr-00066p-MB; Tue, 02 May 2023 23:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528857.822548; Tue, 02 May 2023 23:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYr-000640-J1; Tue, 02 May 2023 23:37:33 +0000
Received: by outflank-mailman (input) for mailman id 528857;
 Tue, 02 May 2023 23:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYq-0004sC-9f
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ea29618-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:31 +0200 (CEST)
Received: from DS7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::31) by
 MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:28 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::f8) by DS7P222CA0025.outlook.office365.com
 (2603:10b6:8:2e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:24 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:24 -0500
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
X-Inumbo-ID: 4ea29618-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya559k3ytzE58QL3KyvkDHWlCou/EpLMtnHz+AfDNesZbJBVQrHCVd9O/X2sfYs05nR0ZAZjqOqgqkRLwnTBn8PpcVmbtU0aopomIApedhGmB/llatC44tqLNBQcHF2dCqtBKIa8XLArx4gGhnW2qK1RbrGhIGqwPHPmb1s2YNb7D9543ZkB9Zlt+sZJv6s+rdx8Wy87BkrDiJD5I7XsjPtr+Vf9b5F8Q+mFGoFu9ICQkq24m3mQrsWcygnqvnH9icSZR8tERgym2WX49BiGJ8FGcasSlWzdsiSdzlJYWPE/lC+KElJ5/0v8NktQghL2FkC3kM2ZyQKZFZYSCqQ5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjb1ox/OK8Kv1DTBbQ9Lbk0Z1Hvt88hsPr+KDuGNW5w=;
 b=Hz+rdkM/wfTd9fxqtd5x1iefsXZ5mWlTJ5i6ondLuEz2ceyHntIcRRSyW2xPHYCNdoO/FphYeMbP+AZcZoJtHp6s9p4jlAWFXTA3fEcpAXjpfvsf5BTEopY8T35mBYsXyruxraWInqxT8jGrWsrSKsWMfA2SKolXZxiEem64KeSU6hGDMIgXP7f3SEEHOnqi2kq9OOcemoTSZZwNjQGWja1kPKIZaa4d2oav8TC96FZr/MuJG7i68c+62fGEoqhrxj5BnLWdRKyWcpqQeS6ptJtAcZNIInrEI9BYFv6vVal2PGQBwa25PVZ2uW/OHC73Khk//DWjUug+5c1c9n8LhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjb1ox/OK8Kv1DTBbQ9Lbk0Z1Hvt88hsPr+KDuGNW5w=;
 b=ZvkjLJX73yjR4ZHX+wK0pLnIZu3fH6j8wQsc5N42hg8/AmY1r3cFKaB1XlyFRKWL+Oi8LCuu1F0BHRwFcZyTdtns+Lqx4vw1oHrJNhx1kzwEP9wL+1EW0XjNuy1D+bOoh5xsTiu9vgbC7Ov8cG0SeIJ776NQu1jZ1i9n7KM5wkU=
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
Subject: [XEN][PATCH v6 04/19] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Tue, 2 May 2023 16:36:35 -0700
Message-ID: <20230502233650.20121-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cd3dcb-bc7d-4e88-029a-08db4b6630be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/5YqEmdxPxt4isXUmi0aJJ8EK8xbb5p6mWWsxsKih3OJ7jlhYqr0NqHve5493P80TN1pNTDEc1DFblP0Ouzpycrjd+LxkKTEBzbvEtnMN3e0b7KRPMzUypiUo1vK+QbjbHQu8UHfGQM8NKRkzonnvO3DNpIbFFS0Q2vHARa5V8/28bunJXzQWBvd0hF7eHvL5qYHtwBHQfv7GHoTO60+FXPdw52gIbEgSQ6WIYdZzi3QBYV84eZnztPFccpZmoSzu8WlFMg5urAVsfzVEi7cxT7bY58p1ZVfa7j6fvM2TGV5srEiFU+CMjpOgP3oaYNhY5ljK2uilqsJ1IfqqCs0/oahIy8D4bleeMBMspvgbdk2z1x6kn2GVB6SsMRMLa27qzSivp/hx+g851UudOrtAONbpdmXccibs5dRHZnWoC/CDpCTjZKkGwfTnD+X+4XvOTwdvAst1hLtvNA1W5WpR2DkM9VUt9berrNsbMgKu9qnSpfqY8I97Gb0Xpj3RRSyqBF6YGAzlB/81X6dmsZMol/XnQFpbI8Jl3Fpnr+5vAqguHj/viIo1z0gLEXKMpq727MJbJ+7EhcG6ho3W2NDCLaxLfE+2p7vfy+crx/n8ecnpGU0IE3rHw7ZZTiXI6OQo6rd2/cGv6nJyIlL/R65zS1oXPtnok9SYBCJGIQdHge/pqel7XfAsGb4Wy2Wu00lpiWlZigbAN71hL/xve1Ga5PRwfYWRocifoMJu88U9Mc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(6916009)(70586007)(70206006)(356005)(82740400003)(316002)(4326008)(40460700003)(478600001)(82310400005)(54906003)(36756003)(86362001)(186003)(6666004)(40480700001)(1076003)(26005)(36860700001)(5660300002)(2616005)(44832011)(83380400001)(336012)(426003)(8676002)(8936002)(41300700001)(81166007)(2906002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:27.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cd3dcb-bc7d-4e88-029a-08db4b6630be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

This will be useful in dynamic node programming when new dt nodes are unflatten
during runtime. Invalid device tree node related errors should be propagated
back to the caller.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 5daf5197bd..47ab2f7940 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2071,6 +2071,9 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     /* First pass, scan for size */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
     size = (size | 3) + 1;
 
     dt_dprintk("  size is %#lx allocating...\n", size);
@@ -2088,11 +2091,19 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
-        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
+        return -EINVAL;
+    }
+
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
-        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
+        return -EINVAL;
+    }
+
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
-- 
2.17.1


