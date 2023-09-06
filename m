Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EA793339
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595992.929729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9y-0007Zm-7H; Wed, 06 Sep 2023 01:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595992.929729; Wed, 06 Sep 2023 01:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9x-0007Rd-Vq; Wed, 06 Sep 2023 01:16:45 +0000
Received: by outflank-mailman (input) for mailman id 595992;
 Wed, 06 Sep 2023 01:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9w-00079K-JO
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:44 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084ec877-4c53-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:16:40 +0200 (CEST)
Received: from BL1PR13CA0247.namprd13.prod.outlook.com (2603:10b6:208:2ba::12)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:36 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::9a) by BL1PR13CA0247.outlook.office365.com
 (2603:10b6:208:2ba::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.25 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:35 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:35 -0500
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
X-Inumbo-ID: 084ec877-4c53-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLR2embtpmdoUiozsCHGJZh+jIIsbnREkrK8eI3Z5EKx8FjsfXgnbpql4XNUVb/M18mU83UXMlPa6mYSJG2CvzOlxLy6Uf1pSl73OdxJ4ViGBdhCcy48qrAHLdTSJwrdTTWGNriqcsUAIeM2oz49a6MLettbCB8f4TqFzB8coRrj7M/0yivuv1qIzDHjNX3TYVdbysLkVcP8nWd7D6ba0s4/byUXqzLCkg4mYSFFLEG4Qj/73euJHIWxgPLgYkTH4WQbz9ta3HmEauZHgOy4fAJo62oRNpAAPY0kfXooIOTLfpvbR8QsljsiSXgeAAJ1YUVk3G1GtgyS3ZC34I4yvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cro8idbWK6/j9Apeo95KJGwjFsR6k97QUgTNDxCH+H8=;
 b=H6WVFilQd4o0lho5Ejcru7/2NbI2L2QGziCT0eOw7VQ5ktuz6cEG09a2YakRzIGDO8TqyZHRdWR1JWbpVk3F6u6uk9rVQX0W9taMoJhfujkOW4nhEnSWtxFhcUiazTyU7u6kfq8RrotRkRWckFc7OJ374+WbGSbia5SKXeFHMIOalhHvpyiL/obavXoxiRXij2L0RXHg3a8LMhnx0df9Xrbp4gttCMXHBurlbBX+4Ktn7CrPL+SPhASy4A/0w/63ty0w5rD8SidYkInErhu/yEf1j25c8GXgUOLWxXOcj2I6wBa2BglGAFnJqi9DZkaevYtJMO1DkJIstYIRaM6jsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cro8idbWK6/j9Apeo95KJGwjFsR6k97QUgTNDxCH+H8=;
 b=aJx+zwGQYyF0BkSbDrE83uUW8Wdih6afDgfCegG+gHUHA9o7ZF1PCSD538tP1XV1OsRVT8KfgDXDWbP80O6d3eAYc6M/ilZUOT32kXmxiLeBUh2tWNkQsfA2yG5Fta0zfi4/pNbB6v3nh7eHYvkYqgM42kju4UOrz4DD3rhm/kI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 02/20] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Tue, 5 Sep 2023 18:16:12 -0700
Message-ID: <20230906011631.30310-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 716502bd-0a27-4d3a-873a-08dbae76ea24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1K+rXODlw3AOuVPQXHJlvvD0fqz2SfwcqwmzgnNZJvtNCnBQ8HwaXUZF/yoj3qxUFHMAW4D42jJEWWx/I4ziZKMy2SbYPdyUAwl4FW+Oen+zzJ28e3Aq2ja7TRu6ZbeX/ezM6ObJxuM72wrnDUm0wHyYLxXR0GO831iJWtO92saLdhJTY0uFMaT4c70B05nIszPpp/0l21RoJCKD0paNCK4GNy4laEBZzluz8c2EMRoRZjQYa3Ei/MK8Bl8cctgyXrDK10RzulUBW5Lng4QHHGHWx9OM1imfQZHGjtELw1VAIL5sYYQF+ESLkhUTycyBkFvAkM3fyKkSWaHQ1bGuxUQsYunH2QVjYcu5E2a5jRAWxICE+kTKEyZ2U8rjNOgtHW3bxVG/xvSy1g70mVkODxpAuXHTgbFWf4hNELr1IV/BueZxG2LTePrjOXFsLgYkVDiqyQnoJmjqFxMx+Dnl7v70d+AtHSXG16Nz496rYlHXH648PgPb2FgPkbcPi9u7J2jjE9ikftMf6f5TcudKw0jEu0++H4x6lCL0bmVFjRb36+qv4naXhoUTLPM93/ic31hB/KGUSgHfDYHTKBD74S6tmvcVAROgzip1npXrmpX1hMJAgjWSGCdrGo0nxeKB5dM5gzfeX/Yg40BMw3FvcjxiUtzoMVXKBi9rOfFYuzkxI4nRZe1TTvyyEYQDETWum0Ty5k8yKhISb4WYLNVLDlXs4JzC86U/7GZTS5qCjecjuFKJmgf+3Hu85vfHHqhigyb5HgnIC3ggmp4RXg1fLw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(6916009)(6666004)(70586007)(54906003)(70206006)(40480700001)(316002)(41300700001)(478600001)(44832011)(1076003)(4326008)(8676002)(40460700003)(2616005)(26005)(5660300002)(36860700001)(426003)(36756003)(82740400003)(356005)(81166007)(8936002)(336012)(2906002)(86362001)(83380400001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:36.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716502bd-0a27-4d3a-873a-08dbae76ea24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

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


