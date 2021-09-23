Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A314155D4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193321.344407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9l-0007hQ-4J; Thu, 23 Sep 2021 03:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193321.344407; Thu, 23 Sep 2021 03:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9k-0007d9-To; Thu, 23 Sep 2021 03:12:16 +0000
Received: by outflank-mailman (input) for mailman id 193321;
 Thu, 23 Sep 2021 03:12:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9j-0004kC-Bo
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8101ccc-0dfd-4e35-a006-8d585399b83c;
 Thu, 23 Sep 2021 03:12:00 +0000 (UTC)
Received: from AM6P192CA0048.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::25)
 by DB9PR08MB6876.eurprd08.prod.outlook.com (2603:10a6:10:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:57 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::33) by AM6P192CA0048.outlook.office365.com
 (2603:10a6:209:82::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:57 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:57 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Thu, 23 Sep 2021 03:11:55 +0000
Received: from b3afd8bf3d71.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCDD71CF-1E59-4F18-8D71-18350386DE32.1; 
 Thu, 23 Sep 2021 03:11:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3afd8bf3d71.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:48 +0000
Received: from AS9PR06CA0264.eurprd06.prod.outlook.com (2603:10a6:20b:45f::9)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:46 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::ae) by AS9PR06CA0264.outlook.office365.com
 (2603:10a6:20b:45f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:46 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:46 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:43 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:41 +0000
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
X-Inumbo-ID: f8101ccc-0dfd-4e35-a006-8d585399b83c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAbBmE5YC0L/wCZCeTP5xeKcnHHT51Doj9fGx2jLAUo=;
 b=ybdTvmcD1KnSg0dXZBdL2ulsqEH70PJ0fBkuFVwN45EZaQBLH6DwUCuQRckO7VaXWdFI1qN0tYvGytfHZdQ0SapoTANkFbEyi0QW/AFiqS8qLXN34b3GXBwurE7hsF3f4CP2TA2Wzm6DgylgHYdkwtA0cQv32bo9jRW8q6Mwa5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a97663ed7ac83a69
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zaz15hzZZSlMhQ4YFfEthi4nY9dElSqwFpV2sHFsYWlxwwjFGm4VcYfh5f5nDjVhSOg3Ae7IPuQMj4rWB1S3HHmb1jEjl0Etft+uf54B3piG+E16TrHfCaoy5C5Og2uBNkZh0iFLRCP1gcosc5IKpX5hpLI5sHdFtSN3VUYEiATrLg2QlX2FCkj3jqG9hrf/3KLOifAmUTFqyVuU8NoYd6q4hDhdlgYYVB/Au0JBmRqdo35TR3Ht12HIuljrFnj2hXjB+DaYz4zgXa4Nce7fBYAi8ox1y72W1Bg9C2aEd++6RYSioQxwAT+X95Hu4RRYiTOk0xQ2lHshnZ9WldlqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bAbBmE5YC0L/wCZCeTP5xeKcnHHT51Doj9fGx2jLAUo=;
 b=KXAf/Oa/kU0o/AzsXWmE8EzUSqCo1gzQVDv+XP6pELLejgt7LdcI0jErGYiwfi9RNbhTWtfqMb+MK0JZY4yfbxfDutZtt4ZP8qM5fXdwt73jlPojHdjjgr2cY3Y7CjX9rdtPPr8L1ZJQqZVXqX0XcoHcw/4/mXZilLQ3nq43gru98EWeAo1RzGxdi4voaR+tHEwvs21+U0X0EGutVL8R4XtD10yHyHU0pGPWCfgLRvg9XWCi56rDBxqBhDVNBcI1B3RCFezx2XitgA5mMiW9KO5BRD2dT+kSOOjIdegUSBqkYPrv2/ocUKZlu11tIg8Llq0Iw4RU0iNCCA0tSGp+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAbBmE5YC0L/wCZCeTP5xeKcnHHT51Doj9fGx2jLAUo=;
 b=ybdTvmcD1KnSg0dXZBdL2ulsqEH70PJ0fBkuFVwN45EZaQBLH6DwUCuQRckO7VaXWdFI1qN0tYvGytfHZdQ0SapoTANkFbEyi0QW/AFiqS8qLXN34b3GXBwurE7hsF3f4CP2TA2Wzm6DgylgHYdkwtA0cQv32bo9jRW8q6Mwa5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 09/11] xen/arm: if 1:1 direct-map domain use native UART address and IRQ number for vPL011
Date: Thu, 23 Sep 2021 03:11:13 +0000
Message-ID: <20210923031115.1429719-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b66eb1-e189-4e68-bb77-08d97e3fe6f4
X-MS-TrafficTypeDiagnostic: AM0PR08MB3137:|DB9PR08MB6876:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB687684EFEDFE3F1EB58A8048F7A39@DB9PR08MB6876.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +gvpXnSrQEDEXBET3ZqY/6IWO7ZXSB6V8r7f9mJ/vxxWKulcYBDZQZPItP/x0FubJB3sT+m7wWKuEsAnDy9asxpXhtVkOFujEjA+FdTJL+vJYR3b5EE2TLVfOtIsFeI5E5CfjDSAyQOIT6booKtYnk0Jizh+FfNX0hXoFJPHXelZqM/1pQWaGWAv1bsg0PKIu6blYDKWZ+aATvnbxKRSj5RgHhcJeAu5NfTyrGTXeTTT5n1gEZRKbQE1kNIzPnq9xHtzzb0TbcFnBlPhDjwB3w0FIgycFGyPTxjtUfz9Y8aiGK2uvmNd2aOnMhWh6vp0Sc4TgSEe4/juxGMY/RMKLZHrQjAogJSCkORi6+BZ4MwFxi2nFbLbToibCcp4LVlL4teSZAyBRfi7tmookYvtdcxZyS8iYYCx4CPq/IDVYk1ttqxs6k+JzQtJEpFLbh7cNpgIfxZ0+U8a5ob3KvbTrT1jlFn0KfC4NipfGhTie+xOg3ufFCzHPQLG2gOuL2AD0gt+CQgVaA3vvM6VfhTLe285DfQzVgPDFoQF6L36zXhZC62KEVI4X2L1giRfALEa0qA1IYGX7zU1iwIzWtkXx+bL1Zg4FAx7UR1iwiFlW6jg460vbo4OMnWWmXtueOv4vV8XzGxRJdfuKz2FsMpxuIW7J/iMSEYDxXlKZFL0jHL7nKkZFAV+kYaKLNbtLT9WPuWj1e4kPQKQr3OZG4eNAjHyjVCet7FIgYQweLhAjKk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(2906002)(2616005)(1076003)(36756003)(82310400003)(4326008)(316002)(54906003)(5660300002)(8936002)(426003)(356005)(508600001)(26005)(6666004)(7696005)(86362001)(36860700001)(70586007)(186003)(8676002)(81166007)(70206006)(44832011)(83380400001)(336012)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3137
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a16817f1-73a7-44f2-73f6-08d97e3fe098
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdtXs0k4ZcwUxSCMSJ2ycoT7Tj4RYPiJDnzof3W/VGq+GiOK9NLqP/xu4trwAVggUUXrj4MQ4SCNfGklBVtB+FUSsKq+zLr1CaCaa3hd5/J3E48z5ceQNemk1YSTXQcdrOUae0kVWp15UxVNBnVHfDuoHeMCFkjR5nGzyez3xDpXBtO0Udz5oO40u6NhlgADfjORHpIJHX5A1G2RjjFmfBkWDMKk3Vov8QhAkuItjXDBjsERoSSeD/qFqsVklhzkEtJwwGX9RZDc1QEhuvfeXfVZGnteFIrPbObap/tEdUiWvW5Ce0eyRIOuAd7ElNrbHPAwx09ABNpdJxJvPV9RAA7CE+wikBaxJAQblSssE+/9SVRJKudwxNOaZWjKtoAbhPCH3+veTmS2bflCjYBucA7dJpZxitm11vhHY1z2jcM8OvuWGjMpsWlAJfdoysKzVjs2G1BavAlJsMV6F/l+bS8kUGUdzEPNKwiWUXKV9giOcY60v4zUryvCeWk8ZBfDHD65QWsZxfveMcDBQmL4PCRF4WuIxVJfJ2peZy1QzgOLudEZPpdTQSQCSPkNwYkkl5xvFZdtBiv8YOfaQ6TwhCkiql+2tupVBYXYFs36mXSxZBj9juHWw58HA6iG4aCXAIw6G9YNcj/8eJktC+M8isaZlBwkpPcNDo+qz14qrK6LPPTS6VAqeGtXTyafqpWXM+WAh24ZHRuD4vh+iagIxQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(110136005)(54906003)(316002)(44832011)(2906002)(186003)(86362001)(508600001)(81166007)(26005)(7696005)(2616005)(5660300002)(4326008)(70586007)(36756003)(336012)(426003)(8676002)(70206006)(82310400003)(8936002)(36860700001)(6666004)(47076005)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:57.1714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b66eb1-e189-4e68-bb77-08d97e3fe6f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6876

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for domains that are directly mapped.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c  | 34 +++++++++++++++++++++++++++-------
 xen/arch/arm/vpl011.c        | 34 +++++++++++++++++++++++++++-------
 xen/include/asm-arm/vpl011.h |  2 ++
 3 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 120f1ae575..c92e510ae7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -1942,8 +1943,11 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1953,14 +1957,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
 
-    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
 
     res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
@@ -2670,6 +2674,13 @@ static int __init construct_domU(struct domain *d,
     else
         allocate_static_memory(d, &kinfo, node);
 
+    /*
+     * Initialization before creating its device
+     * tree node in prepare_dtb_domU.
+     */
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -2678,9 +2689,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -2723,15 +2731,27 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map in
+             * set, in which case we'll try to match the hardware.
+             *
+             * Typically, d->arch.vpl011.virq has the vpl011 irq number
+             * but at this point of the boot sequence it is not
+             * initialized yet.
+             */
+            if ( direct_map && serial_irq(SERHND_DTUART) > 0 )
+                vpl011_virq = serial_irq(SERHND_DTUART);
+
             /*
              * vpl011 uses one emulated SPI. If vpl011 is requested, make
              * sure that we allocate enough SPIs for it.
              */
             if ( dt_property_read_bool(node, "vpl011") )
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         GUEST_VPL011_SPI - 32 + 1);
+                                         vpl011_virq - 32 + 1);
         }
 
         /*
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..10df25f098 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
+#include <xen/serial.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
      * status bit has been set since the last time.
      */
     if ( uartmis & ~vpl011->shadow_uartmis )
-        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
+        vgic_inject_irq(d, NULL, vpl011->virq, true);
 
     vpl011->shadow_uartmis = uartmis;
 #else
-    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
+    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
 #endif
 }
 
@@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -622,10 +625,27 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 {
     int rc;
     struct vpl011 *vpl011 = &d->arch.vpl011;
+    const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
 
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    vpl011->base_addr = GUEST_PL011_BASE;
+    vpl011->virq = GUEST_VPL011_SPI;
+    if ( is_domain_direct_mapped(d) )
+    {
+        if ( uart != NULL && serial_irq(SERHND_DTUART) > 0 )
+        {
+            vpl011->base_addr = uart->base_addr;
+            vpl011->virq = serial_irq(SERHND_DTUART);
+        }
+        else
+            printk(XENLOG_ERR
+                   "Unable to reuse physical UART address and irq for vPL011.\n"
+                   "Defaulting to addr %#"PRIpaddr" and IRQ %u\n",
+                   vpl011->base_addr, vpl011->virq);
+    }
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -661,7 +681,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
+    rc = vgic_reserve_virq(d, vpl011->virq);
     if ( !rc )
     {
         rc = -EINVAL;
@@ -673,12 +693,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
 out2:
-    vgic_free_virq(d, GUEST_VPL011_SPI);
+    vgic_free_virq(d, vpl011->virq);
 
 out1:
     if ( vpl011->backend_in_domain )
diff --git a/xen/include/asm-arm/vpl011.h b/xen/include/asm-arm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/include/asm-arm/vpl011.h
+++ b/xen/include/asm-arm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
-- 
2.25.1


