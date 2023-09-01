Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964ED78F7C4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594217.927486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGV-0003Zq-6q; Fri, 01 Sep 2023 05:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594217.927486; Fri, 01 Sep 2023 05:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGU-0003TB-Uf; Fri, 01 Sep 2023 05:00:14 +0000
Received: by outflank-mailman (input) for mailman id 594217;
 Fri, 01 Sep 2023 05:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGT-0001Hn-EX
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:13 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6df55f76-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:11 +0200 (CEST)
Received: from CY8PR10CA0029.namprd10.prod.outlook.com (2603:10b6:930:4b::10)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:00:06 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::7e) by CY8PR10CA0029.outlook.office365.com
 (2603:10b6:930:4b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.26 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:04 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:03 -0500
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
X-Inumbo-ID: 6df55f76-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxtIzzVeUDUjkTHCNTKOPrS4P+7I1RAtfBIkHmElRsSicW1JcoIKnQVajirH6i5FWcliRVf2jEmnEk3M58j00FWMjppggT6vI59yvhZQxuzXJwMRtMh6Ql9tmoJrXtDSEyq04QGUBouP/Clb4bx+I6wEgkbNSfPZGrn+2lh8eTEVqsFVN7Td8z2lXBZEbtTgml674qjtdVIlDyfgRddSkCbMl/WZhh/8JMbOoTW4lf+tANmhtpW2V2/7Mp3tlFLtCx04UgOGVsMiTJf898w+Thb0PpK8q2NDwQHfTJ5tK/PSWVwJmGx1yFdG1DqryRBcSkiZTYs+ZcT9DEqB7xEy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cro8idbWK6/j9Apeo95KJGwjFsR6k97QUgTNDxCH+H8=;
 b=XLlDgpRWF3Wx5s+0rQY1Z6Bj8ImZaVj1ic5goFQ2666XbARlznpBZun9TUyFE4Y6/C9earruSe32CQnXoiuxe8Q9yFU4Dubb5DvUjJuqSruJl6evCWnVMieE2jRthoNgVBfSo5ZWCPsIdSM2MjlEAAsTBqBQoSNypzJ1pBiyvPs39WGX4nh2tEfp2+rkGCG9GGp66sJOATdhb7NDQ4pMBmGNBxx05LMk6xyN/LYrBL+OfkiSriOkp15A9+6z4JEBw6Nk8dlDUDc2xR/ECwkrJfG9nnH+vvb1EN57GN9rlofZ/TFgy1WYTXMVHGk9PEwTwPROeJ74rNI+dKyEzm8ZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cro8idbWK6/j9Apeo95KJGwjFsR6k97QUgTNDxCH+H8=;
 b=E0gJYxDNBmIJ3MpQo3frVtGKgCSKC4ks1W9t/aHi/vfz9vpcJ5n4oq/z906XkL2iDv/YE+D+jpO+M8oVpzedkG1QKXUCCdI1gIvheJBoy8qBeqQkAzW/Tot7dQjA8N50R95E4pEzU4E1rnDh1FWQfpw616z/iuHPVZc+8tEkp94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 02/20] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Thu, 31 Aug 2023 21:59:29 -0700
Message-ID: <20230901045947.32351-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|BL1PR12MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: aa597767-0471-4327-40ba-08dbaaa84e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZrjKqd9zzJW/BMOvGBlpbW4RV50y2cVvRDendDY/FAsH85VfLDveKeuj1TjEZMmNKaNRjeBmhl5P8hcQgZ/i8snpYhZ6kozocsBOA+O1yLAqxf6lbZeXSSu6aGdf3tWNK5I1co1yyuY3kVfdIfrTv7rCDgeKXRVxq1T/OzqL9+rDo1ChLH6krWypaEMJBCY+Wy1TZUcN8IpmKEF8+xgMFWjbdB8xllB2AuYlUvyLGWKPzhXtm/zlC5spWE0vSjngMn+FKJW56qt7Zm3cS+E8E2RDCF3+fp4irUCCoFdjTfHeIDn1039guZrh0A9L6xjMwuSw2yAuoyK/Rqrrxh3SU8dc7qWKxAPcUQX0WXJhiE9O+tpvS3W9zFjiICjW+d17Oq06svxB1N/woSIxRHQfUQB7v5LDYG/euigw4PoHEA/Yi8z6SLwV0FgrLXo42lxLVLwfT6fI4A33vIIvwM+AEEya4WoJmJXIqSpLW8w2RquGL/WW+YYf5cfG8bUJf8LDx70hal6dq5VkBah4b3rtBj11gVOjKy38N056D9bTaFbRT8KJbd/TeFxBLFgYP0JVyGo9H++u8BFPFK5i6dOLjezn72p2lmReleze9qpa/QTAC947Vj8lt0pWGx74XpvbVQlHozhzIDxJlW3+xiasWjabLzVmAdNDt9FbX7tLU/4mIWQZXH17oyRCE8U2AkWWA1wb10ghgGj8y8bJf13VdrDRHzxDYrZFpbGPyWYq2zx6BrQ9ydVU313Jh8MGDxV424VWGdcVojhja2EVjOrWVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(6666004)(2906002)(5660300002)(86362001)(316002)(6916009)(478600001)(2616005)(4326008)(47076005)(8676002)(36860700001)(44832011)(8936002)(26005)(40460700003)(1076003)(82740400003)(40480700001)(41300700001)(426003)(336012)(36756003)(356005)(83380400001)(81166007)(54906003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:04.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa597767-0471-4327-40ba-08dbaaa84e58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729

This will be useful in dynamic node programming when new dt nodes are unflattend
during runtime. Invalid device tree node related errors should be propagated
back to the caller.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes from v9:
    Replace __be64 with void.
Changes from v7:
    Free allocated memory in case of errors when calling unflatten_dt_node.
---
---
 xen/common/device_tree.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 7c6b41c3b4..b6d9f018c6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2110,6 +2110,9 @@ static int __init __unflatten_device_tree(const void *fdt,
     /* First pass, scan for size */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
     size = (size | 3) + 1;
 
     dt_dprintk("  size is %#lx allocating...\n", size);
@@ -2127,11 +2130,21 @@ static int __init __unflatten_device_tree(const void *fdt,
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
-        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
-        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
-- 
2.17.1


