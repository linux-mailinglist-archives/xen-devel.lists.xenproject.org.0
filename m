Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4171F748
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542796.847145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syV-0002pd-Qt; Fri, 02 Jun 2023 00:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542796.847145; Fri, 02 Jun 2023 00:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syV-0002ei-GB; Fri, 02 Jun 2023 00:49:03 +0000
Received: by outflank-mailman (input) for mailman id 542796;
 Fri, 02 Jun 2023 00:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syS-00018B-9x
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:00 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4128b33c-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:57 +0200 (CEST)
Received: from MW4P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::12)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Fri, 2 Jun
 2023 00:48:47 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::5) by MW4P222CA0007.outlook.office365.com
 (2603:10b6:303:114::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:45 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:44 -0500
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
X-Inumbo-ID: 4128b33c-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffYa3WlRtU+77/+yYuUP2S74YLoZuE8mEMXM+IXw8bPddd8ImRkWXyfWbAe3aNN9L6I4PexpRj17EHTUzuY7d0F8aiu7RK12Al3inyeeewhJY1ebzkhxTY/9TEgpabZARe6zztPpZcBiq4xG2miQm7Oz7lioYdPZ08/gzNgz6U99JtlNw/spIq7azqqAZVpiQarZPjKlokGDv/l9IDnuBuEtHHUyY6QzOzZtocFlBGBDHEcSeK0akDtm+U7IPdl7JI7JOppmo4TJQW4yM/R7fol1YZpr+pDtaF37NhgGCKNADHXmxweWInwp8rEFIwqsV7axH9PhhUSIFVLieT2ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hpi4GzxVUT91hfToDu51Ag2FWYqgV+Aa/GRAQWx9hg=;
 b=iMeH+0XM4CGz+aHOiSj2X4e7RBbyP2pePNksY01+JMXX6WLlLeXgEqmoxka8JCJXrvIWFSxMECW08q4+REY65aHKi0+2hqo4f5hCc2X4IN/THgkfd6HmJd8QBo3Ornc3stGDBRC0HxBBGeK8eb7sMxo2pxvkzYIoyxMLcNV1NYfAhdVtPG5FgTUGy86F//azeCzpx4m7rm3xQGpJh1u+tAKKPeSKImj8Q6ykwfeJ3it04q/ebFXr3gJ9RAmrtqM8DasMF+9PSnf9PkOJZGpbf0q3rz+9ET8SMXrjnMo8zrGyD8bgwC6y4S0pbu+NSw3yzrPgJxCVoMCnS4RhK74hEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hpi4GzxVUT91hfToDu51Ag2FWYqgV+Aa/GRAQWx9hg=;
 b=48YdkSEqLfOouJKojlJK7vDW4Rd5DKXsv9l5G2opAsGMpNyny41aBPzDzGBr43g4aQEbWCI5paiqdSX1YEUnFq6SdXGkxAIo1n/ULCvbIwzM7IMd08AbNkyG3LPNTGBrHUIqVfSeTJqWAlMBqRdMp3mjn0hDKsjjZWJ+LmjwR+E=
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
Subject: [XEN][PATCH v7 01/19] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Thu, 1 Jun 2023 17:48:06 -0700
Message-ID: <20230602004824.20731-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: f652c363-7d88-42dc-6e5e-08db63031f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nchpwUSPMqgyCLreph5U2KdLnH3dAzIASVUpvDdJEVm/3yG5+r3iDMG3H+qqQl4PRZiAWFcr3xIo+EdfSt4xv2W8Rb5Ou9zvxhVHl3+elirurJm3v69rJk+VELW5/zpD589TnrW8a6a1JqJg0ZfAPi0g1BzhoGB6d6j7DOoSRLuOQ88Xv4Uzg1EJmIdEYYObuvfw9sLof83DZOGlNj9VhiKUtkbRMk3qNH3f+Ceaf7B1JROYLa1jkbbTdcWSJVyYPbI1RFjzC+NXIDZotPw3X7ft/aaQaul+Q0yxuKnRB2VtA6efwQF2HVjZSNzitnBhRO49Yh/5sXSKwfn3UD0EQhXC2QbNOEOW3aCYp2oei4rx0B33J5SFT0VNE8EgEzVq/C53oUQttA+W+h4wifeBgS+2o27zkiwX5QB/49u+2DHcG334TxuJ9Xbg5OEVqaNJ5C0VTdaDLomFk2EgtgGXmcVkm6335GGE+Zm3AweQkgXgBiqqs++Ai1dC3aSrspp3hTgifD4JqUeAhtp9w/KljVZ72sDR5xC1dvaNa13eJEFdl6Idnmmn4Xzj3wnXQsaQFDGaW+CK6SVHe9lnh/Le0+xN5D/QfC14rQaQutCS1L24+IMkGejOo+6GLcXmiUccOonhn1SXEtr6xFM+S5T4y5eANlCq/Yb+nDHpcu+OpeO1CHKocp4eeCx7TDNXqRFpVHIBDsn6Vrrvn89BpXMHmfFQlzrn6poMf843skxQVJZulJoU2+wjjk5EKzXfKht6umV3OSfwfKy2Ww5VaUqoFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(26005)(1076003)(186003)(6666004)(36860700001)(2616005)(83380400001)(336012)(47076005)(426003)(41300700001)(316002)(2906002)(44832011)(8936002)(5660300002)(8676002)(478600001)(6916009)(4326008)(70586007)(70206006)(54906003)(36756003)(40480700001)(86362001)(82740400003)(356005)(81166007)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:46.1035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f652c363-7d88-42dc-6e5e-08db63031f31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/common/device_tree.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 8da1052911..dfdb10e488 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2092,8 +2092,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
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
@@ -2114,6 +2114,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
 
@@ -2131,6 +2133,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2215,7 +2219,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+
+    if ( error )
+        panic("__unflatten_device_tree failed with error %d\n", error);
+
     dt_alias_scan();
 }
 
-- 
2.17.1


