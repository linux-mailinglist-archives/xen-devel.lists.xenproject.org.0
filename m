Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50BE74E91D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 10:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561604.878062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kx-0002FG-6y; Tue, 11 Jul 2023 08:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561604.878062; Tue, 11 Jul 2023 08:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kx-0002D6-2u; Tue, 11 Jul 2023 08:29:59 +0000
Received: by outflank-mailman (input) for mailman id 561604;
 Tue, 11 Jul 2023 08:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGx4=C5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qJ8ku-0001cj-Rh
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 08:29:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c64cfa5-1fc5-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 10:29:55 +0200 (CEST)
Received: from MW4PR03CA0125.namprd03.prod.outlook.com (2603:10b6:303:8c::10)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 08:29:50 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::89) by MW4PR03CA0125.outlook.office365.com
 (2603:10b6:303:8c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Tue, 11 Jul 2023 08:29:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Tue, 11 Jul 2023 08:29:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 03:29:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 11 Jul
 2023 01:29:39 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Tue, 11 Jul 2023 03:29:37 -0500
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
X-Inumbo-ID: 1c64cfa5-1fc5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7ZQwkn5k2R8LG32eKvVujZx/LGb923XsnbaztCxw8t7AwbkprxLwx6YfGtJXTBv4dcflHq/iVmYHD82EdExKZp6QFqgYRlPBElfnuzmKHldRWFWtXhrjUo4u+U7s066Ai3v8c0eyRD0Dmhat+uBBD2EWDkloChOV9y7GX4TQBsft/vOOkCqjYvhno2aMQTRtlSk1sYXDi3KIaFFs5KRNIHQFizfRI5xu9R17nOqw5H48IhE+S0uFqtVzsf+GjWGjdUVzCnmrjj9lp1Pm25dUXD/mJoH2r8WFbrIqMMVrQdRYRvFcBfBhdM93G/lW0Ja34aEcHWYDNvScAvfKVx4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFJtVBokWQOgsGyRuqtzu1MVYHpDtHoyB0Kjiu13Ozg=;
 b=H2aC1leHpsENWD3DMzmY2gldE0D8fCymfO/jnrpDaCGfszgUpwwzzgmuzEHQO0o7dRYuRjA9zti09zrJHLHe4EJSZkXaba4PTRwyBu9iFY8912BnRWJbhTnRpSVtBi95GXKgNMgtYLmDseeUpyBceCVeeE8p7F7xADyDr/yz+eK/zy3EbBisbm1IBQysemkCobWL9xNFBIhC0pmB8HnwjpSnP9kibM9ZpPnxKf1IUgh13HCPFokEw+X3kB4fKIDgsYVHL3YJ8yslQT6G/dBimdgcxrMQ9vZPzRI/fCJHLSJ/Vlx1dY7hRS0B0UX+Hv6bxeqtVztXYcWPP6Crj1JfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFJtVBokWQOgsGyRuqtzu1MVYHpDtHoyB0Kjiu13Ozg=;
 b=gaGBgKgq7IteaQFjm56EFQu9aDxWLyU96zL56+hbdkXj/Es6XifOlxvGKbhqpU1Y59fXUxrO/QqCPI12xWUFdqTjM62w4oUpo9lsXjjKjkHwwELes9uVXl8X1Bhon1sgkmKkncbTPue/AvGTPuluuJc1+0CAjWmlP0Ru+db6o4g=
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
Subject: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size separately
Date: Tue, 11 Jul 2023 10:29:31 +0200
Message-ID: <20230711082931.5402-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230711082931.5402-1-michal.orzel@amd.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d2e356-099a-468b-e17f-08db81e8fde3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	32N8AXTmIXJCkHIn7MtqV/g/Pn+cFwEFd8wL01It2PleCqijOx2jAwGUXN9fDWPO6lrJP513NRlk+pWYoNEPsP3aHhFWDiGNWs75QC3CqR0Vgy77fLJYasu/wwspVWw9Wa7Mxi9lZfGVZgpbJkqEgPmBmfoNcMJOkE9+63Sk4APULuiZw9r2dvbbdOHatXtHp0Pj1oglsn+Lt6e+5c67hQ8/cNSBXi5JdyAgtjXbyrEa7pDIcIILLvMFnrJZV4Kpg8VGesm+dA/j2lVLZX+YHXyMnUcEQiDMLsDcN7ZfG9SgPvHh7lFescsqXYJwcXex3HjCWbqhiAeTIwxwPblWrCxDeDurUIT/4tUrd6ahXhl2ymVwlttUCOUcIFmKLXpoXU3cPcCH0HNK5Xvqg1QRNG/j8Q1OS7HfFvY7yQdCw24WdRZCA0IcQfFxAWTfVdW+npzQ+SFku70pZ1HmVHtkBSBT+hXc/Sn9GUdbmpZ01Ep0UepiR7aC+008G8tqSUj+Xsg1D3aXrGhJcoO+rqyNQtvk86dNlZmqZXFS3WktXrSLTlJPnsC6ctlo56kM7rqUHjDHRiKjZ4SNliosFjYVplNWuel08qOXO11T5x9qXRaTmBQht8UtGgvVU9S6ClqevPL3gdNvPyl+TDecgA97C36zwJeXjqNlgIz+CzFfvAqOH1IWiuQzfSvHzSR9+6i1mIc1TqPIhZGB297+xj1acRLO2Ja287AxuQ3EzJ02MBSLzHHErkMvHjJhnWeaHDGZbFs2eC+3v0vungBn3ar8yA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(70206006)(6916009)(70586007)(2616005)(356005)(81166007)(86362001)(316002)(26005)(54906003)(1076003)(40480700001)(186003)(36756003)(40460700003)(82310400005)(4326008)(82740400003)(15650500001)(47076005)(8676002)(2906002)(8936002)(6666004)(44832011)(5660300002)(36860700001)(83380400001)(426003)(336012)(478600001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:29:49.3616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d2e356-099a-468b-e17f-08db81e8fde3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870

At the moment, we limit the allocation size when creating a domU dtb to
4KB, which is not enough when using a passthrough dtb with several nodes.
Improve the handling by accounting for a dtb bootmodule (if present)
size separately, while keeping 4KB for the Xen generated nodes (still
plenty of space for new nodes). Also, cap the allocation size to 2MB,
which is the max dtb size allowed.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Note for the future:
As discussed with Julien, really the best way would be to generate dtb directly
in the guest memory, where no allocation would be necessary. This of course
requires some rework. The solution in this patch is good enough for now and
can be treated as an intermediated step to support dtb creation of various
sizes.
---
 xen/arch/arm/domain_build.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f2134f24b971..1dc0eca37bd6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3257,14 +3257,15 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
 }
 
 /*
- * The max size for DT is 2MB. However, the generated DT is small, 4KB
- * are enough for now, but we might have to increase it in the future.
+ * The max size for DT is 2MB. However, the generated DT is small (not including
+ * domU passthrough DT nodes whose size we account separately), 4KB are enough
+ * for now, but we might have to increase it in the future.
  */
 #define DOMU_DTB_SIZE 4096
 static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
 {
     int addrcells, sizecells;
-    int ret;
+    int ret, fdt_size = DOMU_DTB_SIZE;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
@@ -3273,11 +3274,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
 
-    kinfo->fdt = xmalloc_bytes(DOMU_DTB_SIZE);
+    /* Account for domU passthrough DT size */
+    if ( kinfo->dtb_bootmodule )
+        fdt_size += kinfo->dtb_bootmodule->size;
+
+    /* Cap to max DT size if needed */
+    fdt_size = min(fdt_size, SZ_2M);
+
+    kinfo->fdt = xmalloc_bytes(fdt_size);
     if ( kinfo->fdt == NULL )
         return -ENOMEM;
 
-    ret = fdt_create(kinfo->fdt, DOMU_DTB_SIZE);
+    ret = fdt_create(kinfo->fdt, fdt_size);
     if ( ret < 0 )
         goto err;
 
-- 
2.25.1


