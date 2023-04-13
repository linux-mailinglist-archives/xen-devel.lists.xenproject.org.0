Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAF6E13A6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520870.808988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u2-00042O-CY; Thu, 13 Apr 2023 17:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520870.808988; Thu, 13 Apr 2023 17:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u2-0003x8-7w; Thu, 13 Apr 2023 17:38:34 +0000
Received: by outflank-mailman (input) for mailman id 520870;
 Thu, 13 Apr 2023 17:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0u0-0000rf-43
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b15c15-da22-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:30 +0200 (CEST)
Received: from BN9PR03CA0464.namprd03.prod.outlook.com (2603:10b6:408:139::19)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:38:27 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::75) by BN9PR03CA0464.outlook.office365.com
 (2603:10b6:408:139::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:38:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 10:38:26 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:25 -0500
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
X-Inumbo-ID: 00b15c15-da22-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH+Zr849Fo64fg+pXGsVYf5EHX5ceYm9v4BSa/xIJEgJySUpm/TpwUvcclB6UglPqEbI2T9x28+ki+kzBGxtG+hLW7e0oshtjWcOVlNt2XPxpBAgrFaM8s+wQlVNwQeU67sX13QgtJz1xqEB01dY+FKyhkZKOOiXuHBPye3I0Z77y1dA6za2TvBbqmvwRQgwuB/SNaW97xKacVXXiVQ1/Xk/4OBqkivCV3EgZSNPE2hEDu+0XUM9xFnNZopUefD8hghPBDpsXVBgtUZHCacJMEVoDsuaP9Jr7BVlojoPGtpWMLoqIiNYVRMCDK6JjqFDapz00N7PI0jX5i3aXm8yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DOUnV1l7YFE+Fgge1cDptrXAMS0Z5E0PBq8a/I6OGs=;
 b=JdS3NgRtL+UpNBoW+sWqzDwtV9iViFx/ZYPAmtqpfFF4SokOHjj4wbTt+7YuGlJ7SdE7b/Vo5m6x7Ws2YsqpPdof+ekcrbb1p9i+4+xx3TlhvH8EYrF/2Wlx6eokrx4fu1SrNP46EXn5aXwHwAjet21IrEbLyX5VkoFy8kUmddVJ3RAg/oJEgUObHN5L3zbL1dnALhHQ8aBj5rpQasIjRDgTL1b0F+7Ie3rIcmF6+UTThd3PZweliXboJBZednVP5eZGQhanyXaTnst6PdIzIDyFxnD1eCcoFCnoqy89Pzy25pBXiI5KSzKzHt7qmAfAH4tliDQAGlL9GzVd9hTHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DOUnV1l7YFE+Fgge1cDptrXAMS0Z5E0PBq8a/I6OGs=;
 b=MsdUC9FOjQo0KMvXQ8Yj50daQlpRrKzCmyMX4QbJhGKuw3uc/STM+JVy1JKdTKzvhO/L0770htzBZkOaReYSg956Gah8r8mgIgidudSw0Wsb+fVVY7dUkipXilMQtjoAx0rFHR6MuKyBkYH6HkseYSu3z3vyHWp6J4dDIH+UV/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5 08/10] xen/arm: domain_build: Check if the address fits the range of physical address
Date: Thu, 13 Apr 2023 18:37:33 +0100
Message-ID: <20230413173735.48387-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|CH0PR12MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e40bd9-7988-4fb9-219f-08db3c45e389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vaf4P9OhiNSluRFPCbbs7OSxO7iGI4TRH6O1mrpYku5q1HrBOkngH2ehaCCyjBEOjy/+E5I+zHN01gSTLz911cDtkQFw6PXLnF0ofZH/fjXysb7OqyPs3hcEEt3onqgffjqMfDIvn1xOf9XDh4U06ZqxB0ieUl2hAXCcFI8PEZuboZhgTWTXn/Q1XnPomNTiftSlFiP/vxDLRaj7qULQun1+7js0ffSkp5miloQQhGUtTYX/8AWIELNINdiuGMDU9WSly53NKyK4kntAtHASS2mnc977t7SyE9WBYne9b8aDdu0cl0UtiumfrmwN1V1ffW8G7zmNgCfNOC2PB4dyML7IqaWmtX3TfKsYqjJPk0E1I/P9+/zMG5fEafAnHVTrRazQ9KWfW0mEn++Whr7zqElqfrTQY4y/lB9BMIKNwOvCoHXLgvwaDVNefgR+j3YeDlEy7d3oheBVXRTl6rxEjt8d7IjQdlUxjOnF25cD9qkjAWxuSCjM6AXCKHJGEG+VqK2UOw5U/Ss+S0/3KzWNq1wSpyZa1Q+56FAEZrATgok8SvuLrmYJy9+CZe7vKVZ+ojyKmO3Y62CVUJ5yxj0LUzjpqvGzY1ZgjH9zGa1RMRYWObzZEkePVvhRBHKuCWz0sVBIa0YVedIQYeGx/sdik6nsG3juUJSk0o5uZbo819u+rxDppwUXD8TR6jsuwShJO9xzmEgzkcG82AwfZt8qYxqvgQusO61W7UbhOl0XEXY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(103116003)(36756003)(86362001)(41300700001)(316002)(4326008)(478600001)(8676002)(70206006)(6916009)(54906003)(70586007)(82310400005)(6666004)(7416002)(40480700001)(5660300002)(82740400003)(8936002)(2906002)(356005)(36860700001)(186003)(81166007)(83380400001)(1076003)(336012)(426003)(2616005)(26005)(47076005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:27.0413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e40bd9-7988-4fb9-219f-08db3c45e389
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106

handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
parameters. Then frame numbers are obtained from addr and len by right shifting
with PAGE_SHIFT. The page frame numbers are saved using unsigned long.

Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
when the result is stored as 'unsigned long'.

To mitigate this issue, we check if the starting and end address can be
contained within the range of physical address supported on the system. If not,
then an appropriate error is returned.

Also, the end address is computed once and used when required. And replaced u64
with uint64_t.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1...v4 - NA. New patch introduced in v5.

 xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7d28b75517..b98ee506a8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1637,15 +1637,23 @@ out:
 }
 
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   u64 addr, u64 len, void *data)
+                                   uint64_t addr, uint64_t len, void *data)
 {
     struct rangeset *mem_holes = data;
     paddr_t start, end;
     int res;
+    uint64_t end_addr = addr + len - 1;
+
+    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
+    {
+        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for physical address\n",
+               addr, end_addr, CONFIG_PADDR_BITS);
+        return -ERANGE;
+    }
 
     start = addr & PAGE_MASK;
-    end = PAGE_ALIGN(addr + len);
-    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
+    end = PAGE_ALIGN(end_addr);
+    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -2330,11 +2338,19 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 }
 
 int __init map_range_to_domain(const struct dt_device_node *dev,
-                               u64 addr, u64 len, void *data)
+                               uint64_t addr, uint64_t len, void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
     int res;
+    uint64_t end_addr = addr + len - 1;
+
+    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
+    {
+        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for physical address\n",
+               addr, end_addr, CONFIG_PADDR_BITS);
+        return -ERANGE;
+    }
 
     /*
      * reserved-memory regions are RAM carved out for a special purpose.
@@ -2345,13 +2361,13 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
                      strlen("/reserved-memory/")) != 0 )
     {
         res = iomem_permit_access(d, paddr_to_pfn(addr),
-                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+                paddr_to_pfn(PAGE_ALIGN(end_addr)));
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
                     " 0x%"PRIx64" - 0x%"PRIx64"\n",
                     d->domain_id,
-                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
+                    addr & PAGE_MASK, PAGE_ALIGN(end_addr) - 1);
             return res;
         }
     }
@@ -2368,7 +2384,7 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
         {
             printk(XENLOG_ERR "Unable to map 0x%"PRIx64
                    " - 0x%"PRIx64" in domain %d\n",
-                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
+                   addr & PAGE_MASK, PAGE_ALIGN(end_addr) - 1,
                    d->domain_id);
             return res;
         }
-- 
2.17.1


