Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C694D5B6D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288714.489721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW4-0001SK-SM; Fri, 11 Mar 2022 06:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288714.489721; Fri, 11 Mar 2022 06:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW4-0001Pd-Lu; Fri, 11 Mar 2022 06:12:44 +0000
Received: by outflank-mailman (input) for mailman id 288714;
 Fri, 11 Mar 2022 06:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYW2-0000Fh-49
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4200c9dc-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:41 +0100 (CET)
Received: from AM6PR10CA0093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::34)
 by DBAPR08MB5719.eurprd08.prod.outlook.com (2603:10a6:10:1a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 06:12:34 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::57) by AM6PR10CA0093.outlook.office365.com
 (2603:10a6:209:8c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:33 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 11 Mar 2022 06:12:32 +0000
Received: from 33cc58f73ad5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BFEBA997-4473-4E5C-95AF-94CE27DFF97C.1; 
 Fri, 11 Mar 2022 06:12:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33cc58f73ad5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:26 +0000
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by AM6PR08MB3880.eurprd08.prod.outlook.com (2603:10a6:20b:86::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.20; Fri, 11 Mar
 2022 06:12:24 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::1d) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:18 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:16 +0000
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
X-Inumbo-ID: 4200c9dc-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91p2GRq5kBZZuDWk4lf3po8ltidBgbVkId9fQw4+bdE=;
 b=A4nd4mmwyY85RQToWZ3KddKo3t7LB0y92Ix0cmJcNgG6CL9qUEyNQYnKBSbUFENY3xxAmy9/EtPVeuufm1GC6+IS11aZkkFx2wlZPMB6AsmJ0PKbL8e1vmGNqCUElptzMn9RWP9S/+iBsMsIMm8JNK4g4/qaYclSseY0AP4BaQc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13f0d65bc3c1ec0e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYelD2S5agAVL35WbK2fxtx2CI2Tpd25vM3omDZZVoG4dneHUNOHwTlkv6nX7F1w6sg/O024/uMACdjcVD6WBgWHevheaXlkPmEBRa6WPA2RF4J9sfFYf7jqWbSKSD8wlSdI5c2Xc3Fs5qyLQh8LQ8PyQA+a9rbMTaR336/6uoPUmssl9tPH07jgf4psBb42+bk/XUYkkeTpmkO5ZSpDKqlRh79oSBXse8s1MDDDpqRmuf1XG1+Csdv7wtYrPB0q5WIt6areXK6uuumYywYJe3gDNCMDyIuZFjC25v8jSYEB9FDzr++ETRfJYxyfMyL+HTH7g9O/5Na2THh6TopRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91p2GRq5kBZZuDWk4lf3po8ltidBgbVkId9fQw4+bdE=;
 b=RF0OzEN+KnmqOdFEFQ8w+NgnCr5yxONPQzh/BWf5DGDTPWB90Ut00Pf8kmWE7OW8qQNdKn0NBTt1seviWICBzf2i1S2rHAf6ewJaMmTqtiAzYuu3i86dO5wjft+iWGr3sRhHu6IBL4mpqcCSIC43cu0bnnOsPiQDG3YQPtWysdBpcNxMHWlW5wNdNQxhEtLJbhp8icErTh+2GwAWChia7ZCAENryzwqXaj76LUUIKTnpmfMyXQwAYZPas7FgCFKsrqTDr6hFZ2Dj1C1RW3WKVL63JHilIsmQddgeps90MxWAGDvYrVkjuNDQXw6bgo8HtgTD9Fh/0y/eAE0KlHnrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91p2GRq5kBZZuDWk4lf3po8ltidBgbVkId9fQw4+bdE=;
 b=A4nd4mmwyY85RQToWZ3KddKo3t7LB0y92Ix0cmJcNgG6CL9qUEyNQYnKBSbUFENY3xxAmy9/EtPVeuufm1GC6+IS11aZkkFx2wlZPMB6AsmJ0PKbL8e1vmGNqCUElptzMn9RWP9S/+iBsMsIMm8JNK4g4/qaYclSseY0AP4BaQc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 03/13] xen/arm: allocate static shared memory to dom_shared
Date: Fri, 11 Mar 2022 14:11:13 +0800
Message-ID: <20220311061123.1883189-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 049b94ea-7735-445a-5c1c-08da032621a6
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3880:EE_|AM5EUR03FT043:EE_|DBAPR08MB5719:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5719D7AE1C6568D386D41966F70C9@DBAPR08MB5719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9gUABD4unzlPK0n5bgmqPSGpvMufjcfPSFn1Le8hqVv8dMCipCdkuye/c+HDLj9MrJPt0eGYpFoyFxEHPfwl3mpw6T16SI4tyR9yqa49iA0zww6kMzNlNjKYVJpBe7Cw7BaKpb3i5t5e4KSTlvVEG6HqudYDl1bhXHAJsula0cnh3AugoSOvRX3XeXCwGc3y7rQgCcxSP7M57Nl66CkMS2ZU4z/yChIGTuQ+po60BdtWdjYmqSi9ACFr8FsLG1lwbZff9R1a3kindFzAJLP90AeE1NLsFjvKQKhh1/VQTpRBEXyhF/8wDyryordE3mzq55WqaXUM2pK60W4YfYMA8g7OGdSMSMc9b/RiQ+7V0P40QreoZ8yz2CDXcseidrVWJj9bnTDvEmrwwahdSb1zX6LIcTQMln57eZqojFBRIIpTFsG6mOCmVDDxwSN3LuoWrq1ITKTakU/ztQb5YhHd6dTAjCGjuw/bVRv+wxNEjYO47TS9Tga1diuYN7bM6b2JlMDOWUGVFK69gwz+P6jg8Uf30Bl7/fX7aOpMPf0rxIS6P4Y13wRnsjlChP9cDGBaTolT6ke8Dqhys9PZPyw1oRCwkR7+U6jpT6dfrYl2JHGV/RlKaH+Y7IxAEzp8JvtMcfzZDiNVReZV5V6Be81lgsikbw9duoRCVOPvkE9pb50zkG08TLE0RcGH0d0n7LqLnOdNDWypXgI0nu5yM2DhZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(1076003)(82310400004)(2616005)(86362001)(426003)(83380400001)(26005)(186003)(336012)(2906002)(47076005)(36860700001)(8936002)(70586007)(81166007)(40460700003)(356005)(54906003)(5660300002)(6666004)(316002)(508600001)(70206006)(4326008)(6916009)(8676002)(36756003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3880
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05a25351-5397-450d-f8ee-08da03261c8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CNOf+/AaVXiibGEj3AyW4ln2CKNCi6QsjuHvw7av+ZxxKTyjdF+jzamA162AaA16v4UXi3XNjZMK7BdrSMQ4Zj+PkXhg0X8jaI1WKCf4kFm+TebMeM8SjANZ0sxxgfiikzg4QHDUzXoKm1ABbPt0JYzZxlrPvV+3Q3akWWT97gVlx0+NTnK0GxWVnFhW/VDD6X3+vm/uvlMqVR2YrHmY2c1MWsDwClMuRXKuWCPfPRG3m73KGyUqHqobkat7acYju0Z46eL0pbvioLOWmsb55mlg1X9qn4PbMuiW5cVnomoYITRXyPt9Q3NcaRhKB/gxyZft9T0dcd/yrdKS7ZTVj2/Dj9RUhqSSCfPI6znhyKw0thOqxpq3bXqUvBXmwmIxd1OfcUiDLbSgPdlUnsVlrkO0xZMPEaWhVE1onOVGFp8P4ROEUIvjVvrVNdRs/6QRCKw7FaT0KXSZwWi/rRha9uK469qu/k1XxJgchvs+buLn/w5ooJnHKWZM/sgbt501ubmVLHNlyWu2cB2Av9n1derDiSa855GQc+xH/+6Net79EdYJxjWUP3vxjAAn2ZGek/87dmfaYhUwM0cs0HqT1kDy39xSgjgYXgir0KCYZ2fANKI8ravc196ANuzg3nnX4/lNiFpMf0Di3EPJH7R9siN6MIWUeKQIb73WCS9i0xZ1d7VucloiH9hKgRJs9N6n
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(6666004)(5660300002)(4326008)(47076005)(36860700001)(508600001)(8676002)(70206006)(70586007)(54906003)(8936002)(6916009)(316002)(2616005)(107886003)(186003)(26005)(36756003)(40460700003)(336012)(426003)(86362001)(83380400001)(81166007)(82310400004)(1076003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:33.3912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 049b94ea-7735-445a-5c1c-08da032621a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5719

From: Penny Zheng <penny.zheng@arm.com>

This commit introduces process_shm to cope with static shared memory in
domain construction.

This commit only considers allocating static shared memory to dom_shared
when owner domain is not explicitly defined in device tree, the other
scenario will be covered in the following patches.

Static shared memory could reuse acquire_static_memory_bank() to acquire
and allocate static memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 116 +++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..6e6349caac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -527,7 +527,8 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
     mfn_t smfn;
     int res;
 
-    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
+    if ( cell )
+        device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
     ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
     if ( PFN_DOWN(*psize) > UINT_MAX )
     {
@@ -751,6 +752,113 @@ static void __init assign_static_memory_11(struct domain *d,
     panic("Failed to assign requested static memory for direct-map domain %pd.",
           d);
 }
+
+#ifdef CONFIG_STATIC_SHM
+static __initdata DECLARE_BITMAP(shm_mask, NR_MEM_BANKS);
+
+static mfn_t __init acquire_shared_memory_bank(struct domain *d,
+                                               u32 addr_cells, u32 size_cells,
+                                               paddr_t *pbase, paddr_t *psize)
+{
+    /*
+     * Pages of statically shared memory shall be included
+     * in domain_tot_pages().
+     */
+    d->max_pages += PFN_DOWN(*psize);
+
+    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
+                                      pbase, psize);
+
+}
+
+static int __init allocate_shared_memory(struct domain *d,
+                                         u32 addr_cells, u32 size_cells,
+                                         paddr_t pbase, paddr_t psize,
+                                         paddr_t gbase)
+{
+    mfn_t smfn;
+    int ret = 0;
+
+    printk(XENLOG_INFO "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr"\n",
+           pbase, pbase + psize);
+
+    smfn = acquire_shared_memory_bank(d, addr_cells, size_cells, &pbase,
+                                      &psize);
+    if ( mfn_eq(smfn, INVALID_MFN) )
+        return -EINVAL;
+
+    ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
+    if ( ret )
+    {
+        dprintk(XENLOG_ERR, "Failed to map shared memory to %pd.\n", d);
+        return ret;
+    }
+
+    return ret;
+}
+
+static int __init process_shm(struct domain *d,
+                              const struct dt_device_node *node)
+{
+    struct dt_device_node *shm_node;
+    int ret = 0;
+    const struct dt_property *prop;
+    const __be32 *cells;
+    u32 shm_id;
+    u32 addr_cells, size_cells;
+    paddr_t gbase, pbase, psize;
+
+    dt_for_each_child_node(node, shm_node)
+    {
+        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
+            continue;
+
+        if ( !dt_property_read_u32(shm_node, "xen,shm-id", &shm_id) )
+        {
+            printk("Shared memory node does not provide \"xen,shm-id\" property.\n");
+            return -ENOENT;
+        }
+
+        addr_cells = dt_n_addr_cells(shm_node);
+        size_cells = dt_n_size_cells(shm_node);
+        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
+        if ( !prop )
+        {
+            printk("Shared memory node does not provide \"xen,shared-mem\" property.\n");
+            return -ENOENT;
+        }
+        cells = (const __be32 *)prop->value;
+        /* xen,shared-mem = <pbase, psize, gbase>; */
+        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &psize);
+        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
+        gbase = dt_read_number(cells, addr_cells);
+
+        /* TODO: Consider owner domain is not the default dom_shared. */
+        /*
+         * Per shared memory region could be shared between multiple domains.
+         * In case re-allocating the same shared memory region, we use bitmask
+         * shm_mask to record whether this shared memory region has ever been
+         * allocated already.
+         */
+        if ( !test_bit(shm_id, shm_mask) )
+        {
+            /*
+             * Allocate statically shared pages to the default dom_shared.
+             * Set up P2M, and dom_shared is a direct-map domain,
+             * so GFN == PFN.
+             */
+            ret = allocate_shared_memory(dom_shared, addr_cells, size_cells,
+                                         pbase, psize, pbase);
+            if ( ret )
+                return ret;
+
+            set_bit(shm_id, shm_mask);
+        }
+    }
+
+    return 0;
+}
+#endif /* CONFIG_STATIC_SHM */
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
@@ -3150,6 +3258,12 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
+#ifdef CONFIG_STATIC_SHM
+    rc = process_shm(d, node);
+    if ( rc < 0 )
+        return rc;
+#endif
+
     /*
      * Base address and irq number are needed when creating vpl011 device
      * tree node in prepare_dtb_domU, so initialization on related variables
-- 
2.25.1


