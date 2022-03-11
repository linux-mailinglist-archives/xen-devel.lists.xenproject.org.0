Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326A4D5B78
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288754.489786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZd-0006n2-8T; Fri, 11 Mar 2022 06:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288754.489786; Fri, 11 Mar 2022 06:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYZd-0006l8-4X; Fri, 11 Mar 2022 06:16:25 +0000
Received: by outflank-mailman (input) for mailman id 288754;
 Fri, 11 Mar 2022 06:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWf-0000Fh-78
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:13:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 592b729e-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:13:20 +0100 (CET)
Received: from AM6P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::26)
 by AM5PR0801MB2066.eurprd08.prod.outlook.com (2603:10a6:203:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Fri, 11 Mar
 2022 06:13:18 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::cb) by AM6P194CA0013.outlook.office365.com
 (2603:10a6:209:90::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:13:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:13:17 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 11 Mar 2022 06:13:17 +0000
Received: from 27ab5dd389c2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DE4BD2A-E33F-4D7F-AFC3-710EB1AAD2E0.1; 
 Fri, 11 Mar 2022 06:13:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27ab5dd389c2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:13:11 +0000
Received: from AS9PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::29) by PR2PR08MB4828.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 06:13:08 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::68) by AS9PR0301CA0019.outlook.office365.com
 (2603:10a6:20b:468::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:13:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:13:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:46 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:43 +0000
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
X-Inumbo-ID: 592b729e-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4JLEIb5PBTxY4a54x6twnAqTQYE+B3WX7UNftnFy/Y=;
 b=dj9yzVYyBVjCMIERbmslJLiETmw0UyMzqzZbme4El0PaZDLXw/DAZL71uJ+7S29XDaHbs1FJBrPpoK8JbeQuz5R0bEB2+Kc61nAmkKnev0lbOvtpgZVGzmsvRvZlCEuvEhATPmnfsWtSIjyhFc0DIyDCBGOHgiizswE+lMSkWj4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93567b3a7281382f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiKndQNN58ZHsVaj3z8ySMKYedS5Vl9IFXeO8xgYkdV5gsnODpGJpvIn+CcdefVsmByU6tWfS9j6Htghq7vLSPh5A2YB1ZD7wRwnoGBkAP8bhLyRIqhAmEhYuSQeCGgfWMweWRr25/DFh/BmQUuaxcZl6X5A8lXYKXur+HbSiwzG4OI72BgF+AOODq3+VfrdRY+d7fM90HsArq+vysOTUqiTRsFUiz6HjSMIEPl9n/CnM6iYgwmy3PAlF3txB+CsImJvN41jyDSseB6e8OIZdH/pBeydy1FpNnUY5juo8LCarDKtOxXALpnxJ6MgTQIoiwnU5QC5r9/Z7ok8iKVUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4JLEIb5PBTxY4a54x6twnAqTQYE+B3WX7UNftnFy/Y=;
 b=CnDeoL7KRuf3AES+KHlb8NEtpPl4OykRncA5pUO+Dql6iWpYiuH1Hr+n+va+wIjo65guJvg0b9NdDg4966XYss+OyCeKop7rIVZqmW2ulSsXiz8lcWHvrDEEW67hNyNIMfVI/yvpFYHwHxT9wGEPELjraE9fnRNYBo6uBCUHcf2CF2BUXbwnEpcfH7XASJq1sEqjy/ImZr115DcBcc2muhe20u53fAeWaefXAvFcZOnwhQrGMDusFAviDpt0YYbkzICzJE8z6HJlOzF+ZAvySsYm+0fJuUplXiy2Npzi8oZTR76NUjsgeA69AQLF5t2OXFgNxhWltkoEFEz+7LsKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4JLEIb5PBTxY4a54x6twnAqTQYE+B3WX7UNftnFy/Y=;
 b=dj9yzVYyBVjCMIERbmslJLiETmw0UyMzqzZbme4El0PaZDLXw/DAZL71uJ+7S29XDaHbs1FJBrPpoK8JbeQuz5R0bEB2+Kc61nAmkKnev0lbOvtpgZVGzmsvRvZlCEuvEhATPmnfsWtSIjyhFc0DIyDCBGOHgiizswE+lMSkWj4=
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
Subject: [PATCH v1 13/13] xen/arm: unmap foreign memory mapping when destroyed domain is owner domain
Date: Fri, 11 Mar 2022 14:11:23 +0800
Message-ID: <20220311061123.1883189-14-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 964922e8-f03b-4b19-64b4-08da03263c04
X-MS-TrafficTypeDiagnostic:
	PR2PR08MB4828:EE_|AM5EUR03FT056:EE_|AM5PR0801MB2066:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB2066B9BABC5D139E213FE094F70C9@AM5PR0801MB2066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HtjVt0+HCLCfVDGuDhahL6RrjKLT9SvmwePmYfF7Hs5OhNktH5rhWc+hPHxbl6j9jmfLX3Zy9fMaq/QlUjjAjfk0MVf8bP+H56ePyPMWZiBKYeIRhh9tNtRTKosiGjdKu3yAsUlvoIYiulUaaJRNYk+eiNu/AU7WTVRT4mw6ZLsoazeSAGg9CEi46Omvj6wIHJv0aFTdixaiU3E6qZOG9IoDVzBQammyRPb6ZCqaSlx0+Bx1b2VhlfZlWBVlgumtiV/UfrOJjdR+n4O2AsmBoYp+wVwu6s2eIofqnRF1wd+i6CJAYDhddGgkAzuxLbdu1CYYj/z0pRIqwCTRfG0Fm72IQWK3QAEmSZMNfK5g5fMQLi5gMlaw6xJu7U81CY2mqFDeYguEebPAM5u5MXSdmhQbWEeP/rix5j8SyJRarlkDLQr0ke1LswzrKiub8RcLl7LZMjU7xsaN6f468Wfbc8JVRoJoOAX6KL9d4SgbX715ClbRH/R//SqNo9fDC4ynJzvVRsoCPZfyNzH2Hkfl+QKqde3JAzdFTk3W2QRZWnUsBWLlXlYoBOV7g4PmBtU9ajNOKUb+XILahtiGqKKWydUuPKPol0Y/Y9/RkeyDKsYiBuvR0+HGVNBL4mg4qrptWAoJZKHPGRS1kPIatDEzPsign4E6gZK4yiOMCLaHLYCE58fAOfnBJwOmm0OQGfuL9H4tjx12klU6mr8CZJWy5g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(8676002)(70206006)(7696005)(6666004)(508600001)(4326008)(6916009)(316002)(54906003)(83380400001)(36860700001)(82310400004)(336012)(26005)(40460700003)(186003)(1076003)(2616005)(2906002)(356005)(426003)(81166007)(47076005)(8936002)(86362001)(5660300002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4828
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f97ff42-c75f-49ee-5d59-08da0326364d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OrGYKo6xbJRnZvAqKAkBAaHFrdXS4EuD49P7/U/uUAjteU42Xrlecw2lsKDTJcoCRQKPLlW12W7ZeyOPUEFX/qb8w+ukAs6CjAaVObyupHTYkZDM75PLxrKW6+sIgPi740xwaEyQkQj4jSCD0sfuaY55P944IdCh5G9Vm0q4iWnNdRXFEaSc87OWFhOvTRVP1/Md7L0TirrNkjFvR8tf8mEVICDVDEXiKWI3Yth/xKOG9PgplwOM5s45Tk68SnW1f8StI7bQ9aTaxID9IJ4bJBqG+QUGGACuhdJ1XSdd17zgyJ4WZ8T45/OU4a3I7ONvkNFo3rjt3pmCdf8rz1+kL/c0xuf9NTscnoyVyRu/dsNOInxLmzt7uoBd0qr1/5FPzmpwfYZMWE64GCHifvNCen4Sk9MF7XDXzLRf3ahd09yxHdsA/Qz7ENQR8lYvT0LX9nzfmloBqqO+6DebjiN4ixKe41KvSKMkbYCSceGIXWJpTtn7naYinWA2oSqvWM98OpIkZTJ6oXiXkP8Hk/+uujHQG3MGfVEHotH1Q0vhFe7psryuV7haWLPi41K8P8IQr6EBza3/AaW8pS9wJ0BoGV1fKWHgwUrWjtNuuTHQAL4kYdf3i38jcLtPKtdWLPqCfY35gIrIXfWQk7dYETPV53X+clFfioIVPtUauqH1t4k2bhBiEtYaWiKkZ5xMFnPL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(6916009)(186003)(2616005)(70586007)(316002)(36756003)(26005)(40460700003)(86362001)(1076003)(54906003)(107886003)(8936002)(5660300002)(336012)(83380400001)(426003)(2906002)(508600001)(6666004)(47076005)(36860700001)(8676002)(4326008)(82310400004)(70206006)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:13:17.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964922e8-f03b-4b19-64b4-08da03263c04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2066

From: Penny Zheng <penny.zheng@arm.com>

When destroyed domain is an owner domain of a static shared memory
region, then we need to ensure that all according borrower domains
shall not have the access to this static shared memory region too.

This commit covers above scenario through unmapping all borrowers'
according foreign memory mapping when destroyed domain is a owner
domain of a static shared memory region.

NOTE: It will best for users to destroy all borrowers before the owner
domain in case encountering data abort when accidentally accessing
the static shared memory region.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain.c | 88 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 73ffbfb918..8f4a8dcbfc 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -998,10 +998,39 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
 }
 
 #ifdef CONFIG_STATIC_SHM
+static int destroy_shm(struct domain *d, gfn_t gfn, unsigned long nr_gfns)
+{
+    unsigned long i = 0;
+    int ret = 0;
+
+    for ( ; i < nr_gfns; i++ )
+    {
+        mfn_t mfn;
+
+        mfn = gfn_to_mfn(d, gfn_add(gfn, i));
+        if ( !mfn_valid(mfn) )
+        {
+            dprintk(XENLOG_ERR,
+                    "Domain %pd page number %lx invalid.\n",
+                    d, gfn_x(gfn) + i);
+            return -EINVAL;
+        }
+
+        ret = guest_physmap_remove_page(d, gfn_add(gfn, i), mfn, 0);
+        if ( ret )
+            return ret;
+
+        /* Drop the reference. */
+        put_page(mfn_to_page(mfn));
+    }
+
+    return ret;
+}
+
 static int domain_destroy_shm(struct domain *d)
 {
     int ret = 0;
-    unsigned long i = 0UL, j;
+    unsigned long i = 0UL;
 
     if ( d->arch.shm_mem == NULL )
         return ret;
@@ -1009,29 +1038,54 @@ static int domain_destroy_shm(struct domain *d)
     {
         for ( ; i < d->arch.shm_mem->nr_banks; i++ )
         {
+            u32 shm_id = d->arch.shm_mem->bank[i].shm_id;
             unsigned long nr_gfns = PFN_DOWN(d->arch.shm_mem->bank[i].size);
             gfn_t gfn = gaddr_to_gfn(d->arch.shm_mem->bank[i].start);
 
-            for ( j = 0; j < nr_gfns; j++ )
+            if ( test_bit(shm_id, shm_list_mask) )
             {
-                mfn_t mfn;
-
-                mfn = gfn_to_mfn(d, gfn_add(gfn, j));
-                if ( !mfn_valid(mfn) )
+                domid_t od = shm_list[shm_id].owner_dom;
+                unsigned long j;
+                /*
+                 * If it is a owner domain, then after it gets destroyed,
+                 * static shared memory region shall be unaccessible to all
+                 * borrower domains too.
+                 */
+                if ( d->domain_id == od )
                 {
-                    dprintk(XENLOG_ERR,
-                            "Domain %pd page number %lx invalid.\n",
-                            d, gfn_x(gfn) + i);
-                    return -EINVAL;
+                    struct domain *bd;
+
+                    for ( j = 0; j < shm_list[shm_id].nr_borrower; j++ )
+                    {
+                        bd = get_domain_by_id(shm_list[shm_id].borrower_dom[j]);
+                        /*
+                         * borrower domain could be dead already, in such case
+                         * no need to do the unmapping.
+                         */
+                        if ( bd != NULL )
+                        {
+                            gfn_t b_gfn = gaddr_to_gfn(
+                                          shm_list[shm_id].borrower_gbase[j]);
+                            ret = destroy_shm(bd, b_gfn, nr_gfns);
+                            if ( ret )
+                                dprintk(XENLOG_ERR,
+                                        "Domain %pd: failed to destroy static shared memory.\n",
+                                        bd);
+                        }
+                    }
+
+                    continue;
                 }
-
-                ret = guest_physmap_remove_page(d, gfn_add(gfn, j), mfn, 0);
-                if ( ret )
-                    return ret;
-
-                /* Drop the reference. */
-                put_page(mfn_to_page(mfn));
             }
+            /*
+             * As borrower domain, remove foreign memory mapping and drop the
+             * reference count.
+             */
+            ret = destroy_shm(d, gfn, nr_gfns);
+            if ( ret )
+                dprintk(XENLOG_ERR,
+                        "Domain %pd: failed to destroy static shared memory.\n",
+                        d);
         }
     }
 
-- 
2.25.1


