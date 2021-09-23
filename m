Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4C415DE5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193871.345469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVs-0007R9-To; Thu, 23 Sep 2021 12:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193871.345469; Thu, 23 Sep 2021 12:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVs-0007Lt-MR; Thu, 23 Sep 2021 12:07:40 +0000
Received: by outflank-mailman (input) for mailman id 193871;
 Thu, 23 Sep 2021 12:07:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNUz-0006xV-Su
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 727f9472-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:48 +0000 (UTC)
Received: from DB3PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:8::27) by
 AM5PR0802MB2404.eurprd08.prod.outlook.com (2603:10a6:203:a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:43 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8::4) by DB3PR08CA0014.outlook.office365.com (2603:10a6:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Thu, 23 Sep 2021 12:04:43 +0000
Received: from e69a35bcc9b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0723BDA-A389-46C5-B2F4-4B4EABD18756.1; 
 Thu, 23 Sep 2021 12:04:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e69a35bcc9b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:36 +0000
Received: from AM6P191CA0095.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::36)
 by VI1PR08MB2830.eurprd08.prod.outlook.com (2603:10a6:802:24::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:34 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::76) by AM6P191CA0095.outlook.office365.com
 (2603:10a6:209:8a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:34 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:04:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:09 +0000
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
X-Inumbo-ID: 727f9472-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVwXh/yVQ83FhUNQPKNpGoOH7G0T0dTGV7cr7Z6KkRQ=;
 b=5a739+q5UVFwBvAzTxEfHdG2rFG2qWGyDigpcuvJcKI4Q69rQSbLUX0rXF/q/wGx//c5iSiM/Tfp7dWQUWh/Xl+JzDON93qXdgphrijxX4AV5y54cfpea9FXqycgN3o5QjjThz/KMJaxqqADqI8bt2B+3uF4Xq3frnkWgwraG8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c23ec75439f285af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irnoecishdpmIJc8M6BMlHF9sa6NxYyCHX0Hwt3UtAj6LEtndEkwKnC7v0O1a4xzKcPmQR1pcjtKrGKIYIEzHfoH0LwF6iWVsnpYLZYWTBZEouUnlDdz17hsr1xq3Y0GeKQDDU2vqyJF0slcnLON6cVtqpnJVZ75HGT7AtOKNS95u+Y5OR6hUJTxFwDU2No/OaojsAWNN25aCFxPl+V6p0QoptrbDzVbi7/hJnihQJJrJnioRUA2ES6lDFMxqJ08fEb+GZuk2LjeUVP2StsafPuI1Qwlv2Nw9Rlf1LgHL5NE33Evqgr7sQeF26pzsvV8Pcg8OPIedrAQ3HUhlOXUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dVwXh/yVQ83FhUNQPKNpGoOH7G0T0dTGV7cr7Z6KkRQ=;
 b=IcdXDnwp8guR14FCIRj2dr4gcChjdGbpX1xhJGEz6t2jA9jV7uyg5ZuLMauvaFwC4o/D93hF4P5x2QLPGXBgj9E+sDAWZognd2MKeCBLLso+D3NCgcUKRcfkwx5fYVbqwJrYebT1e45C7y3iVtDuHhbHk3XYd41ubBMgVILf5hCn4Hjkc2fzqFQlkyssQ9ghRo8YwEhLGIhBjkxt2GoN6ywq06nOEQrgi8YyBxOSzdsEz2KGEsBcD5NDlGEqUcme8+Z8dcYEvG0q3mJ5+eqeMH4I4u/092MmC3k5xQ15axRtl+GuPnq1rleM9D4ew0rRmRdOU1XgwjjHYuQjpZ4mHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVwXh/yVQ83FhUNQPKNpGoOH7G0T0dTGV7cr7Z6KkRQ=;
 b=5a739+q5UVFwBvAzTxEfHdG2rFG2qWGyDigpcuvJcKI4Q69rQSbLUX0rXF/q/wGx//c5iSiM/Tfp7dWQUWh/Xl+JzDON93qXdgphrijxX4AV5y54cfpea9FXqycgN3o5QjjThz/KMJaxqqADqI8bt2B+3uF4Xq3frnkWgwraG8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 28/37] xen/arm: stub memory hotplug access helpers for Arm
Date: Thu, 23 Sep 2021 20:02:27 +0800
Message-ID: <20210923120236.3692135-29-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0c6df13-2ecf-4e08-189a-08d97e8a5456
X-MS-TrafficTypeDiagnostic: VI1PR08MB2830:|AM5PR0802MB2404:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2404D30724CD5FDDA969C0C99EA39@AM5PR0802MB2404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J6cxXrmwElyUZoCL+lkHU3hHmoFvkrRAnhl+dpNeB9BFEapfgUNekwQuyxZTGq5pV0Gpi0vkur4qX8GjIjuWs114Z/y/JZKnKqUfP9aNb301FX3h97ndtjGwDOhubby4ZyD/LzccSGOsqZ37oiaf4nMAJE9rKeJwM3Ls3VzHyseh0mHQmzZIRrJWhPcsZcxLGVtoN09aceM/H1n6OuT9nHchjANTllD5uqaoroTOih+Tem7dkUcvi/6R0qIHO2Wt9iGecOi72ZCUKjQEHIdsFct3XkqPOuyJ1HL9sF4bzijcdoZKcYnTFZcjBzI6E7xpi0rJDLp8l90Zx4f+Bo3gjDx1qxtapYmeAVnuGw16n7e3zuEACNA0mxKSR04KoeKYS+i4Ud+D3SmG0OpCD3uaYj1vPolNXFO1KAYyFmnCr8ETcw7Vd/7xvD8c4PrXck7NWIj9dzo9ojUL8Q7TISvIWUaVS8Zx5j3P1ZEShpvPmae5GIQWepH+ED7Wr6lC13mpzdhYMaMV2JVeaczCDT9yWHbPNxRN+sV0SY9cVb6wd3bLBGsP9C9rfA/j9/mfQMZn5FEiyNFhsGQ3hyMuDTGbKCU0oUzy8zMnobbYAjtp5qKhbiUVne7E49U/k8vLhd4/bE6EzrHsV8FpeFyuBO04/aTjwo5F6dGOEXiZSklvPB22bual6WW79e5cHe1G+imBFlxEmwLdbEWDD/O99jm+qD1MXYE+C/9Vq5f8MiF1cR4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(6666004)(36756003)(70206006)(70586007)(110136005)(336012)(2906002)(83380400001)(4744005)(2616005)(8936002)(4326008)(356005)(26005)(47076005)(86362001)(36860700001)(5660300002)(82310400003)(186003)(44832011)(7696005)(316002)(1076003)(508600001)(81166007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2830
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2023d138-8e0b-4346-51ce-08d97e8a4eb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6y64pTjOq1IQ5mYHKHXlsD3asm1LquWhbeOC7MB6x3fsvyjvVhaiJwRTZXsQQgs+cI5h+I/mzrANZ2mfWHW5TOHDrrHkM1AibF1TzF3MxlNa1uG5hTfxhpQR/qVmJl80QDX+g63cThIjdSsuGM0Mh0C3Lvz9n8jQ4erQlML7NWGAHgoIKLpK6MyC8I8p/1bepZCt/lfZ6pOlV2VwhGlXqkaNlNvx4IH1dkdEuzjZJViWRUDXfhD/LMrxSndFWgFdU7vcKJ3TJvuQ4NrHoOhiVknGEVrb470Nftoo/+Kja+yoj/zsdZ3Esk9xFDYLW5i85sfkylzHrNzAIBSyGcVOojysWy4bgl7xwoPxc68t8UFxrJAYRaaJCioEOz3UuSR5eroaG8yzPN5FR1flHxnPutDrX7zRdLLz3Y/3z0QHI1GRhDXRN5TYLSZj9ShG9JQvNqiBcB51Rm9Drbmdx3DuU7whdi23YB1u7dhQLpvCO5midt+IKq4gyXy16meCwNFb7v1iW7o+0Ix8jzZKWTxVy59tx9DgQ9u0seVwhigYCWoXYkuLqMNmFLehDNvYI5PwckW5OT7Jts0rTUmFDGrK49Jfk44WIIj3Q6uUJzWBT7M+jXMWNv62f2QuJZLG6ErSHkZEV1vH8IrFWjRqVzoUHyHbEp5YIij1U52+B2J0vCywsQKJZQjTMjhV1HKJ19I+FzKaUUPSA6D+eNd3+sHpOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(36756003)(7696005)(508600001)(6666004)(36860700001)(2616005)(4744005)(1076003)(110136005)(316002)(8936002)(8676002)(47076005)(4326008)(86362001)(336012)(5660300002)(83380400001)(44832011)(70586007)(70206006)(426003)(2906002)(186003)(26005)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:43.5081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c6df13-2ecf-4e08-189a-08d97e8a5456
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2404

Common code in NUMA need these two helpers to access/update
memory hotplug end address. Arm has not support memory hotplug
yet. So we stub these two helpers in this patch to make NUMA
common code happy.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/mm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 7b5e7b7f69..fc9433165d 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -362,6 +362,16 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+static inline void mem_hotplug_update_boundary(paddr_t end)
+{
+
+}
+
+static inline paddr_t mem_hotplug_boundary(void)
+{
+    return 0;
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
-- 
2.25.1


