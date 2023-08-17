Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02C77EE64
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584986.915938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3g-0002tY-4j; Thu, 17 Aug 2023 00:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584986.915938; Thu, 17 Aug 2023 00:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3f-0002rK-W6; Thu, 17 Aug 2023 00:40:15 +0000
Received: by outflank-mailman (input) for mailman id 584986;
 Thu, 17 Aug 2023 00:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR3e-0002YP-73
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0abbf1c-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:13 +0200 (CEST)
Received: from CY8PR11CA0035.namprd11.prod.outlook.com (2603:10b6:930:4a::21)
 by CH0PR12MB5076.namprd12.prod.outlook.com (2603:10b6:610:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 00:40:07 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::1f) by CY8PR11CA0035.outlook.office365.com
 (2603:10b6:930:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:06 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:05 -0500
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
X-Inumbo-ID: a0abbf1c-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf9Mj3Io8VeqRps2D5PsKJ8PgrKlRx6PhFoJt6Pazdm2rM1fBdHf3WPU2oGkObjPSz97wsP5NBAzojpqb5mr5P1r7AqM9PR8DucYGyHkfkQ2Wc66HLV71dKNfSv7yniJWSLeyWu3R5wa/oFaFEc9Ef95xs2GOPhTHJklSA15ROpT3Ma43Qj6wvXO+3FRd97fJRJTpdW0sjn3EkMtlhx02OJkETnSeH1cU5pUoJ3kvx0AJUdmbH5mG0F/5QkkQlWNe0rgyenRTCOEQNM9JhCtBPUf9waBY3yKH9MeoplZ5kuevxt2Gpg49YbYdKKzK3KSGt7i+IucVpaX3fyel4OVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNJuXj7ZBUQRHz29zlrzeHOa0+tHLK1DzkscWEXkjVw=;
 b=ZwU47WiDLVyJHGgHGAfPew5vkZTbO7QEMqSLccakl4Q2kdL1OrE5kLDWqR1uuc4k9WNlYXry/aCB5E/GC6bnfVru8aBYrfDoRpkIxYS8GiUuzAYVACARISFMRi5tlgkShysrHxq7qv6QKDoQ7tjzU60c5/mQp+ZDubv2Uas+cvW0tXw5mpJO8GDzZP1f2sv9kM8IVjAWLtehpiN8c/P7vj39GIK5vC/OYkDaVLyH7w/iOpW5lUm4nWux+mCmjv3K11xC4Op7u8M0uhn+ujF4KhKVnfByl5mNCOORr+WVUc4JrNFMbo+YsTQ7C+7V+S1sQ97grAO77EDpkLBEZ6L73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNJuXj7ZBUQRHz29zlrzeHOa0+tHLK1DzkscWEXkjVw=;
 b=bPasNlpaADE6LiHFviJ0vV120hFxOL5zS+vrMCUwsJD+L5sxOXUNq9QW8FXl6xA9a+cAs4wc9n90MeZDCSXYYnZsYJH8xv/zZ/Z8AL8HOBr4aOXOOlAJKNKGE0UTgM2lgLuR593ECn+5dvwe/Xw6gtxLVbTx6dST7nnoCkvuUmI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 02/19] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Wed, 16 Aug 2023 17:39:30 -0700
Message-ID: <20230817003947.3849-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|CH0PR12MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9fde22-5bb5-40bc-ebb3-08db9eba812a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zK6FcWf8Uaa2AACUTMiEogXy8LUyJZ6Y4W3VbBZwAr5TRJcIl17aGmkL8szfqx5FiI8ESMGgdptUHl0rArpbbyo37M2i5cOF+Gf+ETBbURnM1H+0EVGgxpwCMelEmAQV6XRnJTC7v7mX9leo9R5WFun/B9uS20SJa7q9mdQvCVrAjpLQWLFUNDttSi+q3h2n3hC/J7HCUDbg7pWo/cwwIyPb7vrU374kxz9OsyzJx4nHZPd/Q6vOFGYsF4mwT4RSQ0EW8xIxUZzd/3eplmY3RaU2mafHmv/yTQYxl8rtlKXv0NCoWEIo137YVl08keXiLfCBys7oR8lB4bmyb5BbJ6JnjlfXhnqOdLna/X3g1e3nVPd/mjySno4cMZrqa42A52AZWjpfOtKcovk5NGXEFsPg23V3AtmIIhvthS9Exjba08ShAu2x5vPtgTqXN9OW1SFMxbYI8mXaPFWvjdzjnE02zJ2hc0su4pLxV0KUvm+cbHfiAEkwinUTM+GGZL2apTwgWSY++ieFXIXlXO8vAzH3YOQBqJy7h+J8LFgr7zLb2mlyIVLHRLBqoeFPtJqWwD9s02oR/AatwUrclmM1jrivwKMJwWS8JV2tv1H61l1Bt+C22AoQuO94oGKUnJge21xyevAifPQ+zn97FK7hO5h4QUk4wXeYKgQvHv8S+ALRBp1dpj0nbF/nmXO/Q51dWcgdMWUKppfesrwqTgFHzikug2jO9DWI15WdPN5at3N4fZQQp48g/ULqa9vVkd1vJunhtZ3J3KpznHpPi8gO/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:07.0142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9fde22-5bb5-40bc-ebb3-08db9eba812a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5076

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


