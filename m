Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0D64E1D4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463755.722046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyi-0007Yt-4D; Thu, 15 Dec 2022 19:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463755.722046; Thu, 15 Dec 2022 19:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyi-0007X9-1N; Thu, 15 Dec 2022 19:33:12 +0000
Received: by outflank-mailman (input) for mailman id 463755;
 Thu, 15 Dec 2022 19:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyg-0006KU-IG
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc8bd46-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:09 +0100 (CET)
Received: from DM6PR13CA0068.namprd13.prod.outlook.com (2603:10b6:5:134::45)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 19:33:06 +0000
Received: from DS1PEPF0000E645.namprd02.prod.outlook.com
 (2603:10b6:5:134:cafe::2) by DM6PR13CA0068.outlook.office365.com
 (2603:10b6:5:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E645.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Thu, 15 Dec 2022 19:33:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:05 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:03 -0600
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
X-Inumbo-ID: 4dc8bd46-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlM4cxQLfveT1rLygMd3K8Sj3cPltpuN/HPlMjnpts0qqsFkBmBt0Yp+23bh0c8qoP6vey2d7n7a166dOIwC1LkRS1Ly39IHc8fiXDQx+AP4r4XP1135TeinWZ1KeTGBxgKmG46Uv8063CeWB3+ASZfSZxqeWI38XaWKvSm2H/3xI2bmWGQZlKauvo1b6wyUbp4MGSIvSGMD2st5xTYbHa2O0HfKXX0x2H3L4R85bgz5rZr5LJ6acP+fOwCBbBb/ghQV18OMHetEHS0j8DEW3oOlal1RejEpH+m9rp9XkeV2kIj26xRjWKWrO7lXW6qUkv2HfHJRFE01rtWJ0Gjj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXUF4c1Lukzt7sJNL7fbo/yzZzcxYKrF0RRegx1oLLY=;
 b=ZwkfA+h49DaLDMWYOlMqzy7whUxpkO2wfK/N04dyYbmyPSmJ/2YzK2Ni6SpO/VTqJky+ZwroJKVRLeGNxX5eSzU+HqtxTs4RKQrR32tWqsg+EetRMe3wCK41FxxhTc14PqIX6f+98y/ZfmU8iY3fzJlta2tqbV/yLMQy4RNgmnmtEbUala9fuHJUdwotjcBxx9AOuSOCTwRL+Hy4Ukn+2AJYRlJ7YvTQ11842rr5v0DChfKGfb5Ntw77Vo0tnd1k1jYkZGrSZavzQ3kGMx7dLNF4g2sC8wnpEa94XFaEgl8yR8W1dFYNhM5YsoJywA4+fFBoSYPoXyL9EWYckJavDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXUF4c1Lukzt7sJNL7fbo/yzZzcxYKrF0RRegx1oLLY=;
 b=g2ELtZu8gIv2LPXFqAE7F/RPfdjAjDzdzh9XSe/iD9zxxvCsJAXIHqQ49/8HnudsA0gg1dlZqTiwnzfPkXoC0Mqx9GrBx4gRuaH0pK0Ugn2JDvdUMghZdsh0numbeq08k7I24+/Op+nV0n0NG8ZMxcLpUHwcIHqQExSSDcajbsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 5/9] xen/arm: Use 'PRIpaddr' to display 'paddr_t' variable
Date: Thu, 15 Dec 2022 19:32:41 +0000
Message-ID: <20221215193245.48314-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E645:EE_|CH0PR12MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2d1935-5f7d-4a7c-9f4a-08daded33067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsCFjAqXsuhOr2cOdhzmxp2ZqI/Zsx0AD7tYk2OldYxnfdff5JmtThzxAS+yMwnYV9zczCkhLDJ5uMivhvEw20hmwVY/BpASKhMef90vY5zTLiW4hjAqTF3ytvPVDEz94XnuPm7OxwwyONCuhmEM7KDGZetUHlwjfKPTlbnIACu/MUobp/H9pxSpWpp3Kao2QGjh14kepN+FJMPDmqDrOwcXWiWGL1NZnGGqBtVdZx8PTrDPxMZp8YjfnJEBFsXIydfm5ujVaGxjF5Lq9YhUPyZiCWyCW5ak7kjGUT52MqDj4IbjSqyU9NxnrUVfV3BM4ZYK+njxkohvDTlGRmGdgBX1fCx1vS3DISF1we4TWIdvr+gBS3UcguRdOgvt6PBVxtGjGQjjaMeu/lt2F1YaxGNFLTwdLZl3OQqIWASHYuCEnfIvoqnZEWsPslAAG4ftCNPBw6JGVMlPirqjizCj1b8973SRWgOZLDihoNHgbsuV4faS7or9iiLk75ASe7SLnhTxCe8SzYYY6nC3sGidVrC+CZybomU/DcW3uDmfa3k8PfsJhNNiBQ9LsPRfzgQoda0nA7zOSrI55dWaGjQ5m9vRV7h5e40SMdjwixBSWvHdPIDD92MRXaJ2OJ8j6aUPHuiHt2hk3ODmlfsaiA0z5uumWsa9RUrxKyYHpOyg8V/0Dw7nd+9OPU3e0eYcixj708gRJmxGdyAwtsb2q4P4CsAJHvRJyyZCZe1kTTRfBtM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82310400005)(8676002)(86362001)(2906002)(26005)(336012)(186003)(40480700001)(478600001)(41300700001)(2616005)(4326008)(70586007)(1076003)(103116003)(5660300002)(426003)(47076005)(8936002)(83380400001)(40460700003)(70206006)(6916009)(6666004)(54906003)(316002)(81166007)(82740400003)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:05.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2d1935-5f7d-4a7c-9f4a-08daded33067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E645.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300

One should use 'PRIpaddr' to display 'paddr_t' variables.
This may either be PRIx32 or PRIx64 depending of the type of architecture.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/domain_build.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1bb97cd337..c537514a52 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1325,7 +1325,7 @@ static int __init make_memory_node(const struct domain *d,
     dt_dprintk("Create memory node\n");
 
     /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
+    snprintf(buf, sizeof(buf), "memory@%"PRIpaddr, mem->bank[i].start);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
@@ -1393,7 +1393,7 @@ static int __init make_shm_memory_node(const struct domain *d,
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
+        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIpaddr, mem->bank[i].start);
         res = fdt_begin_node(fdt, buf);
         if ( res )
             return res;
@@ -2739,7 +2739,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
     char buf[38];
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
              vgic_dist_base(&d->arch.vgic));
     res = fdt_begin_node(fdt, buf);
     if ( res )
@@ -2795,7 +2795,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     char buf[38];
     unsigned int i, len = 0;
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
              vgic_dist_base(&d->arch.vgic));
 
     res = fdt_begin_node(fdt, buf);
@@ -2881,7 +2881,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
     char buf[27];
 
-    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIpaddr, d->arch.vpl011.base_addr);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
-- 
2.17.1


