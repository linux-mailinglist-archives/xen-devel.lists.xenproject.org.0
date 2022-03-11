Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F94D5B7A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288773.489808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZx-0007oZ-V1; Fri, 11 Mar 2022 06:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288773.489808; Fri, 11 Mar 2022 06:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZx-0007lD-RE; Fri, 11 Mar 2022 06:16:45 +0000
Received: by outflank-mailman (input) for mailman id 288773;
 Fri, 11 Mar 2022 06:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWS-0008Q3-Cy
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:13:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511f6752-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:13:07 +0100 (CET)
Received: from AM5PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::34)
 by DB7PR08MB3067.eurprd08.prod.outlook.com (2603:10a6:5:1d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 06:13:02 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::10) by AM5PR1001CA0021.outlook.office365.com
 (2603:10a6:206:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:13:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:13:01 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 11 Mar 2022 06:13:01 +0000
Received: from e580bba4a969.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B64F63F4-0DB4-4524-AAEA-BA24E649C067.1; 
 Fri, 11 Mar 2022 06:12:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e580bba4a969.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:54 +0000
Received: from AS9PR06CA0188.eurprd06.prod.outlook.com (2603:10a6:20b:45d::15)
 by DB9PR08MB7493.eurprd08.prod.outlook.com (2603:10a6:10:36e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 06:12:53 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::c1) by AS9PR06CA0188.outlook.office365.com
 (2603:10a6:20b:45d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:52 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:43 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:41 +0000
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
X-Inumbo-ID: 511f6752-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPsPOvzho2nUCB0RDRsUprWjaTqQDf6F4G+auSec2gA=;
 b=zEXBBooENPXWwekxMPsivO4mQ9vcO7ewOle//u+gAAEZcndROf8GcjflzM9v9jm/hXGZHT2tQUZynTKLhv2GOddP7J2NpQox/+p9BYkvPy0/R+pg/wCYH71YBN/lT7e3Ly+YP0kBpIRU1ph/aa6xBtthRHm/Czs5BhKAltRJvUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08a5aae35ab4c662
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp16z6s2RNHzOatsFZZSsANhotpnk41e3Gd5cV9oIOJx4xPonMx+e3y83lKDganBe4i0CFQ8xLL+uHANPQCr3Z+kHQV+8wSdStHS66Sztd5qtEvZU2NFBPdeEknIqnS7RnhKDuWiggrVAojux34RUZMmCYQE/kIYjZ/BuLPStxHIfpBLcVJwNEy8l45hglxkqxJlC5dh5audxcksB06gh35cCPbhjz4h630qFaYt14DxfD1uIBdGV0hl1NQhMq3knDpA8dgaICxkbWEKIFn2V/zmGgOoZAV995Hzo6H40YI/DxwQEsaJkz3z5e1RgD04XmrMo8ZshQF7sXOvomcHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPsPOvzho2nUCB0RDRsUprWjaTqQDf6F4G+auSec2gA=;
 b=TpDq0G5H+cW6Zig2cadDJLIAc6WBP/xVoy+at+5Okb7G8wLhbHkYHBs8jDPY1+NSs1YoGXyFpcpdDCHfLKo/+J6+LLX3q3OR1vbmBevHc1ZLIMcYaHBlU/wKc6PAa3HP+Te/ZuPkH4SrnkmYLaYdjJCQvX7RqxOvkJKanyUXJrrPlBdc9OZzP6Lb+5rrTfk3w/zVKUofRnO0IQ4WWeU5ce3M2roM0qxBNU3CkjFPQ0LcRWmKAiDPxarBQF0fLMU5hitOunH106AgKmbRiy2TURjPXz6FZvbV2GJHyMJpFD2jfh01RaM0gdNPrM3Z/jPtbTG1Gd552KQAMgrfdvTaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPsPOvzho2nUCB0RDRsUprWjaTqQDf6F4G+auSec2gA=;
 b=zEXBBooENPXWwekxMPsivO4mQ9vcO7ewOle//u+gAAEZcndROf8GcjflzM9v9jm/hXGZHT2tQUZynTKLhv2GOddP7J2NpQox/+p9BYkvPy0/R+pg/wCYH71YBN/lT7e3Ly+YP0kBpIRU1ph/aa6xBtthRHm/Czs5BhKAltRJvUk=
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
Subject: [PATCH v1 12/13] xen/arm: defer foreign memory map in shm_init_late
Date: Fri, 11 Mar 2022 14:11:22 +0800
Message-ID: <20220311061123.1883189-13-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 293c8bf2-dbcb-4bb9-54d6-08da032632aa
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7493:EE_|VE1EUR03FT019:EE_|DB7PR08MB3067:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3067686C5FD1F8964C542102F70C9@DB7PR08MB3067.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JPxrKIaAFxGmKKwyp7HDtTYaiXV0KAtgUsLrD72CHRJYc4WPaS40DtYbPIJFkUNwgadegv3IWkIvXNJxzW60osx9njTD4hAcBVPdgsJJZPnLJwdvH4bGWKqouzFUSHcPNqXrfzbH5zFFowHk2KKk9m33/Md7Q87NytkhtwgSkE9dl5ZG+0YA+/I0AWEv0uHQXslwr6Qc85Rnnk5hGdNbcwQSxOe+XWqyl8jYWrfTij/du5uLcb/cvTuzGvFFcrpb9HAyUNNKqrInZ4BqkBJVngjqeYBsIRToRS0eAbTH9+3nDwSuZRDQfiOU7HcNzmwneAEuWyzBHNmz+qfrtdIDFGdW+7KUy4FoOLnmKYAIOSC8h8tOikE+GbWtHJftvnKPt9MSPEt+JyAQTzYK7fhrhDGarlp3yOgOL5Jw/tWedU1hxDS+ViRxmLSlTC7XyjlW97wG9AbW8yhuKhW6pQBdsEM/c0o83PeK4GTkAkSye5ePdUP8mJId/As+C/on7IXr9SxItuseHYTGTBSXtyGTqxU9laH0s9KgZ7sRVaEPbkVRKQAvKZs9x5VH8prFSZc5M4L8ROFLHDrz5z3bg8YA4+I2JsUF8LD0K/970MFh6zIdtBZZiqtBU39Xvjt/qJNGAJMkWRzpiMZuJHvVfTcCndKuarUbzXaCsfUB8HxSH4aCEBGOCQNapAuKZa39zc0zzdjlqvk2cBNsvdyu9BRJ9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(1076003)(2616005)(426003)(83380400001)(186003)(26005)(356005)(36756003)(81166007)(82310400004)(36860700001)(47076005)(8676002)(4326008)(508600001)(70206006)(70586007)(40460700003)(316002)(6916009)(54906003)(2906002)(5660300002)(8936002)(6666004)(7696005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7493
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01a6c042-a16b-44b8-ce6d-08da03262d47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YxTMMdNC3aoe+Gv3nlYhY/9/8KhZimixGHuxAdOmoMcY6iMGmprDsn9rw5HFMXNtDn8TwJetcvVVcSPII0N3ZIuRetrBMIgWoxlOOFOwAaVowQjAcM/63mQGkVCgO02ccHAT+xnwY+cL87IZ8ClO0LH1Abaq3E1LMLJ4koL3KMcIq8QZWOsBWioPO6yNh0UGpruZFHRI7d93tuhvpZZ2I8h2yGH2MFyO9DJSQdv/6xh/LoC6iS+EMLmcKBHoxRYZvF/7eBScO68Ri1TrS7XV3IDdp4bw38jJdMcMo7CTTE6XWBvB/b/eIgLfFhr5TzoaN6MELuBthD3sL+OYYkn0faDIu7qYPd7PAecLRG5sC/LVMUdvLc7fWRXUwQ6iTZwRlUwGHh89DB/pISSbFzqkWik+vxZ8PuYNzCKjNUKgjWK3Ywv9b1TresMT5r12DzzYUkYl4hioeXL8uh7kzKkDpwdCiVN70tI3moNDXDQMzLuADkm2Sq8qqCIGz1zeYYSvjEZINWapaMxB5kT+KILTYp7vkN7LnJsXxnLTeJJOyaqhCC14lfD3npW3wMS4rk804tgSiQzXMSUGWqHwZxnG3SWtgBUthS6X1UYmSVbmkOo9XEs21iaMrbrH1Vb6jXlYdMbGbhx+qnV+pOHBfLjnCY0w3Q+TR/f3kf7xT3G/1n7ow+iTQ+2ejC/NtywKmu19
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(8936002)(4326008)(508600001)(8676002)(5660300002)(36860700001)(7696005)(6666004)(107886003)(70206006)(1076003)(26005)(186003)(426003)(83380400001)(336012)(2616005)(70586007)(54906003)(81166007)(86362001)(47076005)(40460700003)(2906002)(82310400004)(316002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:13:01.8917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293c8bf2-dbcb-4bb9-54d6-08da032632aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3067

From: Penny Zheng <penny.zheng@arm.com>

This commit introduces a new helper shm_init_late to implement
deferred foreign memory mapping of static shared memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c       | 51 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |  1 +
 xen/arch/arm/setup.c              |  6 ++++
 3 files changed, 58 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4b19160674..f6ef5a702f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1006,6 +1006,57 @@ static int __init process_shm(struct domain *d,
 
     return 0;
 }
+
+int __init shm_init_late(void)
+{
+    unsigned long i = 0UL, shm_id;
+    int ret = 0;
+    struct domain *od, **bd = NULL;
+    unsigned long o_gfn, b_gfn, nr_gfns;
+
+    for ( shm_id = find_first_bit(shm_list_mask, NR_MEM_BANKS);
+          shm_id < NR_MEM_BANKS;
+          shm_id = find_next_bit(shm_list_mask, NR_MEM_BANKS, shm_id + 1) )
+
+    {
+        /* Acquire the only owner domain. */
+        od = get_domain_by_id(shm_list[shm_id].owner_dom);
+        if ( od == NULL )
+            return -ESRCH;
+        o_gfn = PFN_DOWN(shm_list[shm_id].owner_gbase);
+        nr_gfns = PFN_DOWN(shm_list[shm_id].size);
+
+        bd = xmalloc_array(struct domain *, shm_list[shm_id].nr_borrower);
+        if ( !bd )
+            return -ENOMEM;
+        /* Set up foreign memory map for all borrower domains. */
+        for ( i = 0; i < shm_list[shm_id].nr_borrower; i++ )
+        {
+            bd[i] = get_domain_by_id(shm_list[shm_id].borrower_dom[i]);
+            if ( bd[i] == NULL )
+            {
+                return -ESRCH;
+                goto fail;
+            }
+
+            b_gfn = PFN_DOWN(shm_list[shm_id].borrower_gbase[i]);
+            ret = guest_physmap_add_shm(od, bd[i], o_gfn, b_gfn, nr_gfns);
+            if ( ret )
+            {
+                ret = -EINVAL;
+                goto fail;
+            }
+        }
+
+        xfree(bd);
+    }
+    return ret;
+
+ fail:
+    xfree(bd);
+
+    return ret;
+}
 #endif /* CONFIG_STATIC_SHM */
 #else
 static void __init allocate_static_memory(struct domain *d,
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 1c0f2e22ca..c3f2155f5c 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -58,6 +58,7 @@ typedef struct {
 } shm_info_t;
 extern shm_info_t shm_list[NR_MEM_BANKS];
 extern unsigned long shm_list_mask[BITS_TO_LONGS(NR_MEM_BANKS)];
+extern int shm_init_late(void);
 #else
 #define dom_shared NULL
 #endif
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f6a3b04958..4987b71111 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1051,7 +1051,13 @@ void __init start_xen(unsigned long boot_phys_offset,
         printk(XENLOG_INFO "Xen dom0less mode detected\n");
 
     if ( acpi_disabled )
+    {
         create_domUs();
+#ifdef CONFIG_STATIC_SHM
+        if ( shm_init_late() )
+            panic("Failed to set up deferred foreign memory mapping of static shared memory.\n");
+#endif
+    }
 
     /*
      * This needs to be called **before** heap_init_late() so modules
-- 
2.25.1


