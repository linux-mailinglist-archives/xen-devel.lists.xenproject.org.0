Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770A4D5B79
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288759.489798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZf-00074u-Lt; Fri, 11 Mar 2022 06:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288759.489798; Fri, 11 Mar 2022 06:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZf-00072D-HM; Fri, 11 Mar 2022 06:16:27 +0000
Received: by outflank-mailman (input) for mailman id 288759;
 Fri, 11 Mar 2022 06:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWO-0008Q3-Gn
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:13:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ea01581-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:13:02 +0100 (CET)
Received: from AS9PR04CA0107.eurprd04.prod.outlook.com (2603:10a6:20b:50e::19)
 by AM8PR08MB6433.eurprd08.prod.outlook.com (2603:10a6:20b:36b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 11 Mar
 2022 06:12:58 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::fc) by AS9PR04CA0107.outlook.office365.com
 (2603:10a6:20b:50e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:57 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Fri, 11 Mar 2022 06:12:57 +0000
Received: from 72911b43b740.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D503CA3B-063E-4A24-9456-542ADE790B96.1; 
 Fri, 11 Mar 2022 06:12:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72911b43b740.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:50 +0000
Received: from AS9PR06CA0209.eurprd06.prod.outlook.com (2603:10a6:20b:45d::14)
 by AS8PR08MB6744.eurprd08.prod.outlook.com (2603:10a6:20b:397::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 06:12:49 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::a2) by AS9PR06CA0209.outlook.office365.com
 (2603:10a6:20b:45d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:40 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:38 +0000
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
X-Inumbo-ID: 4ea01581-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHzNODlA8XFx6CtjhuogInLZztAvYsmJNbcr6OVan/s=;
 b=Y/1NVxZ1E5Mc/sCB41/i3FsXtlVVTLHavshd+Mc28BQ3lzYpVWz9Cfd4V0zTI7zxBZ+3hFl6hidGH+kQEFIRfbxtL9o0Kqa+u4ph90tF81ZiuqJCOzv9Jorb3OjYs9oU5FGtENR1IVCFqQMtkakuxX8Tz1SBIxQMPnkcPxn877M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c88ce1e8792f6c7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHjZnPQGR6vT2b//6gT3RJ7a4mApyEWbIMoiX1lBiyY+gDhxj9IPlgL8z0nB0qGetNlZFWcjqRg7N/EFkXdQ/+U2hGzbwf2PZc3TdZBgIXltredigv+hDI19Ny7KsI9pGBk5V41kST4m/vkRDUVRSY63T8u+8QBcbyvvbvkuAaQGoUu94kqGztXUygIrO6/PdTcnBj+V2olKy7Wbj4UYyRkb5GCiif/ELydsoxZ/2ujh6C7gnmYDKWgB6Q15iTvQD/1ikgjZCMcYYkcuP6zBLhgAgDfrP3Hmg1Jm98PdcAjy9ZCRePbMcVC0q3oKP3WPblK0+q3DVzwnZkvlmxeQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHzNODlA8XFx6CtjhuogInLZztAvYsmJNbcr6OVan/s=;
 b=PvLWA++5/l1ZqLySqabS7OTUcUqYWPpp4t1aAdJdDY7A+YfYZXFckd1V7HkbrhU1qtf3Q/dzQDNEuf4mOO12QRRDM6ihljz6AxsdEYECOu7eDwYZh3aJ7dnNT0sQRH0c7gxI68YUrhpeNTJVrQsj0KHfs154iKo4fpuHEvamzOErEhDKkiHSUobl1c2NhprPVum8SeIasiJKLLaTgir85K6iV4Chz6TcDOm+fDO7iLQTGE/z3EMVxxYnRT0H/ihKb+hYEIfXoyPUu260vBAs09eNXdQyCVmSfhB+sa6FELZu1LDK5wJpgbzyugoSPJ9fshyl6iFrvvCTMmbADHj1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHzNODlA8XFx6CtjhuogInLZztAvYsmJNbcr6OVan/s=;
 b=Y/1NVxZ1E5Mc/sCB41/i3FsXtlVVTLHavshd+Mc28BQ3lzYpVWz9Cfd4V0zTI7zxBZ+3hFl6hidGH+kQEFIRfbxtL9o0Kqa+u4ph90tF81ZiuqJCOzv9Jorb3OjYs9oU5FGtENR1IVCFqQMtkakuxX8Tz1SBIxQMPnkcPxn877M=
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
Subject: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign memory map
Date: Fri, 11 Mar 2022 14:11:21 +0800
Message-ID: <20220311061123.1883189-12-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 6d96fbbe-a24b-4f3d-ed69-08da03263036
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6744:EE_|VE1EUR03FT010:EE_|AM8PR08MB6433:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB64339A8AF19AFDFBE5B30E69F70C9@AM8PR08MB6433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JEBS0f4v+iM5xNbUs+L13Q4fX4gPJ4ixcOZfmaM9IB1fvyMu3W3t51Biave4BCG44IwjgtinSjoy7Bi1MQpBxJjHQ07CyE/kYqk01g+wV8K+NFwL5ZmFFSrWj4q1CXK6HKtjHl0ENvF/ElAKsPivP+/POQ+3mIIzNX80ha+bwF4y1EL8rDUEw3imnc1CEFl8ycBjXnDu0GVxcRyMGc08v3hnpL86mgr8aiMfyUpkIzOGIN1JfEGwOs3rjrFD2lk6OvLcKwMA/TV3jZpNeroC1u2gJyE7jAnnY+N3Q64IwZSjRboyvULFffkE5eoEIha+5q+jKnZ1vOu+DN7GMK3KbqiQ7Uh8z8IVsqUjbigd60XZzi580S/ZHzvKsapyC6lMstOM4uWNHfpUjetWA1AO5ELTOPwaw++AhtWRtT8kb5twe9V0JNTG5wNQI87MmTGejvVNyk27+Y+GOzq/kLhA2uPdeZpZPc3GltPudp9Zua4QuhSP2BMJAjMq6LrmTd7AYvapMk/xk2tYCMiLL7Plidx7M1e2wZ24OwSBayJS/ib/0KW/73UR5P7zAw4RgWJ3DKXymTq/fnQGvtY60GdtIfNcJ6vbsZHeCo6IiAFlhijyz3/yAFM+Eu4usmm5xpoJ5LJOxBmz2SbOKhovDpq7zlei235Q5ieV81a7s6Yb6Yxh1Y0Idgd7mdM2Vx4YETUe2b1dNNKcqfJCvnNHzM/pQg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(83380400001)(508600001)(5660300002)(82310400004)(8936002)(6666004)(7696005)(70206006)(36860700001)(2906002)(70586007)(426003)(4326008)(8676002)(1076003)(2616005)(336012)(186003)(26005)(86362001)(36756003)(40460700003)(316002)(356005)(81166007)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6744
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efc1c244-41de-4514-78b9-08da03262b04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vz5PxjbypBpLD4FIRVZDURRwxw0w3Ty81Mpn9SyTEo+/cjwL7lLYh/Cm3n79s2wYGc7yw7rsneatr0k7p7xTM07NZp8vfj2XO/nAgs/Eq6ea/wp6cpOwMhavyO30w9kPFIpqid5zPgQEdzFUpaLS8Qo+QrgCwBNe1R0Juoz550Fdknv1HEAL6rUEWJ9NSaAVTUZ9UxJiLF99pYQQ7zQ77UkKsLna6bwJY9UZF8Vp3LAeVY4pVViCEEQnrg2LqcHm65qfT5nmWdJbh7+6C32FZEp/F1Uoh6BJ70fuOz9HqYF1O6miPEbfgNACEj0FKVr9qUWF7RJfd7icHlFfZWCMoiCV8sWdhYSE0r1DFVdU4NtwrseaH7RD9AH3yE9Tul/Exs94+iDu/5k5ngOkjuqyrMV384ZvWk4Qlm3FbzNOJQMcW2c2f59BDM/xKoxOQPnv356aKUohD/l3oCUXXLGUtiCaA9vCXNXs80JD1noU5eJcxqo4rKZpCSoCY1x6nDhkvkgfUZ/1mkIjmjH+/CcGjcJYOYW3n9WDpzZRnTGpkNoEW6XXdmoQg6vPYJjWn0cx7+HiBbCXspgP+f+1CTsqGUl8H4A4IgFJQiofhYqMfiTYKxpIqjnKKvwv5TAX/IMXPy3zCl3mKWwS4xPRjjZwxYZDXPTTiWBoPPgE9vphgOPoIicxW40Y/gtI6XiZyiM8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(6666004)(2616005)(186003)(36860700001)(107886003)(26005)(1076003)(426003)(82310400004)(336012)(83380400001)(36756003)(2906002)(8936002)(5660300002)(40460700003)(8676002)(47076005)(4326008)(54906003)(6916009)(316002)(508600001)(70206006)(70586007)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:57.7799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d96fbbe-a24b-4f3d-ed69-08da03263036
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6433

From: Penny Zheng <penny.zheng@arm.com>

In a few scenarios where owner domain, is defined after borrower domain in
device tree configuration, then statically shared pages haven't been properly
allocated if borrower domain tries to do foreign memory map during
domain construction.

In order to cover such scenario, we defer all borrower domains' foreign
memory map after all domain construction finished, then only need to store
shm-info during domain construction.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain.c             |  3 +++
 xen/arch/arm/domain_build.c       | 34 ++++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h | 25 +++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index f0bfd67fe5..73ffbfb918 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -47,6 +47,9 @@ DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
 #ifdef CONFIG_STATIC_SHM
 struct domain *__read_mostly dom_shared;
+
+shm_info_t shm_list[NR_MEM_BANKS];
+DECLARE_BITMAP(shm_list_mask, NR_MEM_BANKS);
 #endif
 
 static void do_idle(void)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ee4d33e0b..4b19160674 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -771,7 +771,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
 }
 
-static int __init allocate_shared_memory(struct domain *d,
+static int __init allocate_shared_memory(struct domain *d, u32 shm_id,
                                          u32 addr_cells, u32 size_cells,
                                          paddr_t pbase, paddr_t psize,
                                          paddr_t gbase)
@@ -795,6 +795,18 @@ static int __init allocate_shared_memory(struct domain *d,
         return ret;
     }
 
+    /*
+     * If owner domain is not default dom_shared, shm-info of owner domain
+     * shall also be recorded for later deferred foreign memory map.
+     */
+    if ( d != dom_shared )
+    {
+        shm_list[shm_id].owner_dom = d->domain_id;
+        shm_list[shm_id].owner_gbase = gbase;
+        shm_list[shm_id].size = psize;
+        set_bit(shm_id, shm_list_mask);
+    }
+
     return ret;
 }
 
@@ -962,6 +974,26 @@ static int __init process_shm(struct domain *d,
             if ( ret )
                 return ret;
         }
+        else
+        {
+            if ( strcmp(role_str, "borrower") == 0 )
+            {
+                /*
+                 * In a few scenarios where owner domain, is defined after
+                 * borrower domain in device tree configuration, statically
+                 * shared pages haven't been properly allocated if borrower
+                 * domain here tries to do foreign memory map.
+                 * In order to cover such scenario, we defer all borrower
+                 * domains'foreign memory map after all domain construction
+                 * finished, and only store shm-info here for later use.
+                 */
+                shm_list[shm_id].borrower_dom[shm_list[shm_id].nr_borrower] =
+                                                                d->domain_id;
+                shm_list[shm_id].borrower_gbase[shm_list[shm_id].nr_borrower] =
+                                                                gbase;
+                shm_list[shm_id].nr_borrower++;
+            }
+        }
 
         /*
          * Record static shared memory region info for later setting
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 6df37d2c46..1c0f2e22ca 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <asm/setup.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -33,6 +34,30 @@ enum domain_type {
 
 #ifdef CONFIG_STATIC_SHM
 extern struct domain *dom_shared;
+
+/* Maximum number of borrower domains. */
+#define NR_SHM_DOMAIN 32
+/*
+ * shm_list is indexed by unique identifier "xen,shm-id", but it only stores
+ * a subset of static shared memory regions, of which owner domain is not the
+ * default dom_shared.
+ * shm_list_mask bitmask is to record the position of these static shared
+ * memory regions.
+ * Per bit represents a entry in shm_list, and setting it 1 means the
+ * static shared memory region here is owned by a specific domain, then bit 0
+ * means the static shared memory region here is either owned by the default
+ * dom_shared or no static shared memory region here at all.
+ */
+typedef struct {
+    domid_t owner_dom;
+    paddr_t owner_gbase;
+    paddr_t size;
+    domid_t borrower_dom[NR_SHM_DOMAIN];
+    paddr_t borrower_gbase[NR_SHM_DOMAIN];
+    unsigned long nr_borrower;
+} shm_info_t;
+extern shm_info_t shm_list[NR_MEM_BANKS];
+extern unsigned long shm_list_mask[BITS_TO_LONGS(NR_MEM_BANKS)];
 #else
 #define dom_shared NULL
 #endif
-- 
2.25.1


