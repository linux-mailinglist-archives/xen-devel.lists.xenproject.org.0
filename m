Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B9708415
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536406.834722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoW-0002CA-RN; Thu, 18 May 2023 14:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536406.834722; Thu, 18 May 2023 14:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoW-00028O-N3; Thu, 18 May 2023 14:41:08 +0000
Received: by outflank-mailman (input) for mailman id 536406;
 Thu, 18 May 2023 14:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzeoU-00074K-K6
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:41:06 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e83::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ad2234-f58a-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:41:04 +0200 (CEST)
Received: from MW4PR02CA0022.namprd02.prod.outlook.com (2603:10b6:303:16d::15)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 14:41:01 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::4a) by MW4PR02CA0022.outlook.office365.com
 (2603:10b6:303:16d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:41:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.20 via Frontend Transport; Thu, 18 May 2023 14:41:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:41:00 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:40:58 -0500
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
X-Inumbo-ID: 03ad2234-f58a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS+z61dIEOh9wHoYQV5HXZhDJBTlh4TPoLbW+9gdcSiLp3XAhVn/tBxddyrVUTKUk4yq1AT/ovHB07PoVgvS99vV47y8G2dE7XfGsIhT7sUrLEMOSx+AA/YhLt/XirD4t8e1qEKICwLqEP0nUj4+voZ3vjdR/jOxiR64NEJV89nmJlN4bV3Wd3XbBLUGRhKgLmhoB7X3vjQPvujpbkjElB68qQyQICCnqNtpCAAmZsHFSUZjT0XqfRA8p7VzAV/atuxZDMZbqK4D3jMXVE4Pl0nlAx0jht8jhsIucB9zqc9JrG+HiNbBmRo5T5llVni8iXn7rE0ZCztJ4/9BsQfEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc/6ksSNIY14+cMIRv0fMrHzTXfYwm3DIOoQYaSFZAM=;
 b=mmIwTPUwjh0down3t8bHqjdQQblEEBW29Qv65oYd67eza7VGyDqQxU2Oy6ynaZSDbwrNUnpeKRlJBtnIryTiSA1Wv3RJ+mEtO5P4LevGyX/cAl5Q49AQN6CYgXnAQVQHvMTTA7OfJV0h7IosWdb+oDKtjDrXR9qLAVf9sxkeSV3u9KB8ufcZ4/tuo4TIrC4iRjiUgLXeSyXWLbHdOlXhXrsO35pripi3T6Tzjk6CHZv+r0xcufJy0O/DeBiHqaArAisCR8iu/eYW7sTPyJ6ujPdRk9k7UhKNXsRJQqKtNMOEPrVHPG/2B6gYIvZM8S/UMjSW5MaPLjsssVfsAN1BzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc/6ksSNIY14+cMIRv0fMrHzTXfYwm3DIOoQYaSFZAM=;
 b=HmA0QSxc/Gsqf83zKSAxc3OM9X71iHPC+SfCoVacqvu7aRu1yT9ptN4ocilEI31+bKTiCWlFexGXwZjpTD+q1lT79tscMYRIczWkpaTD+g7vTJXr++sanlK7ead8i6q7SJdCN7cX3BypzpB1MKmUFC6SuJxygs842R+RregMTms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 06/11] xen: dt: Replace u64 with uint64_t as the callback function parameters for dt_for_each_range()
Date: Thu, 18 May 2023 15:39:15 +0100
Message-ID: <20230518143920.43186-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 92281347-216f-4037-489d-08db57ade65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PSaiMIR0zR/aFHCVT2O4ZUfN99/cgRGDkD1kvTEAZTHQPU9uFnh/vZ+H9c9FlielH16tLEHYK67FgZ1zU3cSSlWDtNdC1wtsR1V2sqnRj+kERDJYtH4tiAh/PAbqElyoQybBpZ3Z61n5UO7YWqM1N0wGnlrkmEL7DZAElfN0L2SaD0k7xsN+QsR5VHEPgyviG7yJrS+YPuHRjdXVNYSaUTE4GqQIqfOzWjyHCNzNUShyagpWEjVVQAQsdsi4hhlYU6G4UrCfLoC/1j29P8G39qPplLY3SswB06ykBSkrq/GPVe+QOUgh0yg75kvOoeuOFBLhrAU8wbVt/z/60F7Dd0hnHJ4E6x3Bwlni9riHeAgUsya5NO7UO5NG0aKB43hA/W6ZXoCRZZWKZcvYx5obFn4ePsoK8jBBjeioFmDghyU1Vx7ueEapCCrpmZIc+QC+5T/JOr2wMA4jAAWG9J7TgiiACsO3KO23fix4FZlm/iSIPBKXEJrqg+VpHXwjzVb1ZUUmIl6vuMrnEh5CkcHdgmiFUKzmqvhSnHzxR+wojJSFkb1S80YaHw4AGX/rPMqmnnUPpzHbUjfBIuTH0KT+cITVEniCU8G58TFIX6495e5vhwxUACbWUJchyN2WHge4tjfK749Q+Bqh9LBbHHdgb+ape6fLZ4QkuD/D/uDQJz+HMy4fCSsp85uUEhNV42NTbQMJ9c5nPrJkFUjjnrrGVR0vW0GEaZyzGN6sjwHdopBEsU4/OtG7ReFTV88zanOlroEmFCGLFouqMo464H2lpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(86362001)(316002)(54906003)(82310400005)(7416002)(103116003)(5660300002)(81166007)(82740400003)(356005)(478600001)(2906002)(4326008)(6916009)(8676002)(8936002)(70586007)(70206006)(36756003)(6666004)(26005)(36860700001)(47076005)(1076003)(2616005)(336012)(40460700003)(426003)(186003)(83380400001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:41:00.7235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92281347-216f-4037-489d-08db57ade65e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037

In the callback functions invoked by dt_for_each_range() ie handle_pci_range(),
map_range_to_domain(), 'u64' should be replaced with 'uint64_t' as the data type
for the parameters. The reason being Xen coding style mentions that u32/u64
should be avoided.

Also dt_for_each_range() invokes the callback functions with 'uint64_t'
arguments. Thus, is_bar_valid() needs to change the parameter types accordingly.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :-

v1-v5 - New patch introduced in v6.

v6 - 1. Merged "[XEN v6 08/12] xen: dt: Replace u64 with uint64_t as the callback"
and "[XEN v6 09/12] xen/arm: pci: Use 'uint64_t' as the datatype for the .."

2. Added R-b.

 xen/arch/arm/domain_build.c        | 4 ++--
 xen/arch/arm/include/asm/setup.h   | 2 +-
 xen/arch/arm/pci/pci-host-common.c | 2 +-
 xen/common/device_tree.c           | 4 ++--
 xen/include/xen/device_tree.h      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cb23f531a8..3f4558ade6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1637,7 +1637,7 @@ out:
 }
 
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   u64 addr, u64 len, void *data)
+                                   uint64_t addr, uint64_t len, void *data)
 {
     struct rangeset *mem_holes = data;
     paddr_t start, end;
@@ -2334,7 +2334,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 }
 
 int __init map_range_to_domain(const struct dt_device_node *dev,
-                               u64 addr, u64 len, void *data)
+                               uint64_t addr, uint64_t len, void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 47ce565d87..fe17cb0a4a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -166,7 +166,7 @@ u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
 int map_range_to_domain(const struct dt_device_node *dev,
-                        u64 addr, u64 len, void *data);
+                        uint64_t addr, uint64_t len, void *data);
 
 extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 5dd62e8013..7cdfc89e52 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -381,7 +381,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
  * right place for alignment check.
  */
 static int is_bar_valid(const struct dt_device_node *dev,
-                        paddr_t addr, paddr_t len, void *data)
+                        uint64_t addr, uint64_t len, void *data)
 {
     struct pdev_bar_check *bar_data = data;
     paddr_t s = bar_data->start;
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 20bc369367..8da1052911 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -994,7 +994,7 @@ int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
 
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *,
-                                u64 addr, u64 length,
+                                uint64_t addr, uint64_t length,
                                 void *),
                       void *data)
 {
@@ -1057,7 +1057,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
 
     for ( ; rlen >= rone; rlen -= rone, ranges += rone )
     {
-        u64 a, s;
+        uint64_t a, s;
         int ret;
 
         memcpy(addr, ranges + na, 4 * pna);
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index d514c486a8..c2eada7489 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -681,7 +681,7 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
  */
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *,
-                                u64 addr, u64 length,
+                                uint64_t addr, uint64_t length,
                                 void *),
                       void *data);
 
-- 
2.17.1


