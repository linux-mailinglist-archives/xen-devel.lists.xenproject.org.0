Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C63C9860
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156340.288521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tsj-0007Ej-6L; Thu, 15 Jul 2021 05:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156340.288521; Thu, 15 Jul 2021 05:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tsj-0007Bn-1U; Thu, 15 Jul 2021 05:25:57 +0000
Received: by outflank-mailman (input) for mailman id 156340;
 Thu, 15 Jul 2021 05:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tmf-00009P-AW
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffe1faf5-1cca-4805-9c45-b9cb706201bc;
 Thu, 15 Jul 2021 05:19:09 +0000 (UTC)
Received: from AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) by AM6PR08MB4327.eurprd08.prod.outlook.com
 (2603:10a6:20b:ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:19:02 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::db) by AM5PR0402CA0008.outlook.office365.com
 (2603:10a6:203:90::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:19:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:19:02 +0000
Received: ("Tessian outbound 809237f40a36:v99");
 Thu, 15 Jul 2021 05:19:01 +0000
Received: from e52574fcc35f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA43D9D2-B9F0-4653-8DFD-6424E9771655.1; 
 Thu, 15 Jul 2021 05:18:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e52574fcc35f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:56 +0000
Received: from DBBPR09CA0037.eurprd09.prod.outlook.com (2603:10a6:10:d4::25)
 by PR3PR08MB5658.eurprd08.prod.outlook.com (2603:10a6:102:88::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:18:52 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::7f) by DBBPR09CA0037.outlook.office365.com
 (2603:10a6:10:d4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:51 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:50 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:47 +0000
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
X-Inumbo-ID: ffe1faf5-1cca-4805-9c45-b9cb706201bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK13WEPiykjxkYvQEtnQO6uMs6AHKoPn7GF3CJWftbA=;
 b=a5MDWfeo1AQLWgPNoES02n1nb0AJaAyLL7vJ1RR9R+kFUwysSoKogjew+yX4yHDBq/uYZa8eOkrX/Uf/FpJsIuAMvwI7M8l0NAoXG5n8yzZdq/MPSu34tcJb8KJ1xGXu14RRWY09gvkpjrh1DzPDPF2YDce6wxhqep13rRN/gig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb76193209225271
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC7Uma5fVRKFWms6CLHOyyzsl9IqiGSwEJ4+7Qf5zK8pzxy+g/2oX4YAPmpKgffaGt7sdwBvTMjU4zDhLnvbS6xcjKClr89e6VCFWEea2Dt3BAMVHKJfhgd1In84qJ9fs+Pq/eqJbCQCvorpE5Qzm9YzbjwdyGAx9pL07akwDCrH6wG/Mr8U2JxTeUWc1Lbc2E1sTRft4hERRld69QsoRbz+5KFJX3UpQLqgaFnlVwm1+V32kHE1N1Qf6IwkYnA2ylFAfVGKBQfuelLMgtENTXWvyHQqIsxSocsI1kHQV5792M3v4lFFuqChPvX2PepSwgnCrEo/kat8DlGo5vi1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK13WEPiykjxkYvQEtnQO6uMs6AHKoPn7GF3CJWftbA=;
 b=F5z5Yth8ptdOpTv7sslxFhTvTiMkIKRZiF5Bab1W1TONYosMLrE2EOj9POHfYjLp0IhyaSca9Uv3bEV4s6znH2CGDAYJGytPnDHQSwzolU9UtUd2dRgP7MICUmQy4N2BDcIgqWBfyrN+O06uQl9ZLPgZcqhEddKKdD08h966KNA3w+Shk+62a43pWk0dZAUCK/k6fIcG7zAzqLXCLnpvv6nG0n/2a8vS4tnM/6WH65Hy6FxCUJ1egggkjrCo++1kYy0O1bI53nCvFVTZ2Ru9Jn/fthMe8oK5fyH03I31nsCTnY/3YJ8LQxf4nZ6mv9cgV6cA8o3hpM/wcLWAHtXvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK13WEPiykjxkYvQEtnQO6uMs6AHKoPn7GF3CJWftbA=;
 b=a5MDWfeo1AQLWgPNoES02n1nb0AJaAyLL7vJ1RR9R+kFUwysSoKogjew+yX4yHDBq/uYZa8eOkrX/Uf/FpJsIuAMvwI7M8l0NAoXG5n8yzZdq/MPSu34tcJb8KJ1xGXu14RRWY09gvkpjrh1DzPDPF2YDce6wxhqep13rRN/gig=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 09/10] xen/arm: check "xen,static-mem" property during domain construction
Date: Thu, 15 Jul 2021 05:18:18 +0000
Message-ID: <20210715051819.3073628-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a62aa47-bdd0-42b4-da9a-08d947500f0e
X-MS-TrafficTypeDiagnostic: PR3PR08MB5658:|AM6PR08MB4327:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4327FB45FCC70C6E703093DCF7129@AM6PR08MB4327.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8riS5oYdvVi8mp5n6I7k+m6n0i7pshd6QcHS54ufR/OEnUTQUDj4Y/NCbmMQqecGlU48YY83tAj4JsD38opiLo1w/J7xqt5Hq8qek1ZzwcxKz6IbU9AESUV2YE48WxpXzO4ewvzY+z0MKLTxGmtQPoPbpKXmKWASL2ho9QIUjzAxkPno/qu3+rTZSxOf2CGIUA3r/QQKnM8kdrc2pzFR8vCGAQfUOo+fP/nwOGCxmVQRI6hD0uZQ/C3A96WgrcenaXwsYjcFQNNEPRHBfkwP43nDFgyfpog+0qI6JsyBGzu4VFXLh6Eh5ilX9fddlTQLltnEcxk07R15Hbi8jkxr7ZmLg3CLvXcjs6+IvaSmybCPZq4iSzjNddd0JZBWPWC5S8M7Nbd2pF3HRy8QfXZi7i2zjfKGqOtl+326F3nwF9clu7fx7iIpXN+M7ux+6I/D8ImGm+xj3HM8oJ2aRweJ1ZHZwerxD4m/yv2xGfi/A0QW7OH7sQLvO5zVRsnf9wChiLjFt88QgO9T5E8hwU+yao5qU9yl961L2YaA+rCjeC99I22EycdCMD14gMWHltgMRZ4mcyQdfrwaJlE1HTO1jLbofdT1rTbBY1QBqCywcwbWfvVJCCkA5O5LXjmsMchA5PagYxR8ib+SxJ21V342gFNSwcb6xWdAYE3DW4P4Jv0LOudixCUnSKmK0IIrjL6BFW7ebMZHxMr8khS4NXy1fXylWVcTDWzwDg+wbTRDJkc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(36840700001)(46966006)(6666004)(54906003)(8676002)(316002)(81166007)(83380400001)(426003)(336012)(86362001)(110136005)(4326008)(356005)(8936002)(82740400003)(26005)(7696005)(186003)(70206006)(82310400003)(2616005)(478600001)(5660300002)(47076005)(2906002)(36860700001)(44832011)(1076003)(70586007)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5658
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b187076-24ba-47f9-06ff-08d9475008a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VTSLaOTEGLRptKXgi4lKzwswGZoHzG2Be9Weh/+rO/vkMqLqrXXWBH88mxEiIkP2au2C28OYch6qv/OiRpV04B9p0FBZIqNriEuyIbkUBZvxDwoja3lvW2Evb3vlWRendWLbpW71IIgApvWS3CjEbQyc7YbkW+U7kxIE0YUz7c9lvML9BNH45kL6PEEaEnEWf0pkD6vsOgbQLgyzO4EF6S3gM1Gx53EorZNWnkIX7mZoULQN/BR57yBrXnLzEQhwcediUyS/FwHner/it/oHJOFsxz3aPvfzhq30X6g7GEV/qabZjOzD72hMlld2CfZqgKyPWENihjdNYY/DJgoes737NZ57+CTCQj/g8eD3M6kTr+RW+FHGezBMeKbXkYWN7EE+sxCxMgGAFsV3HffRvVrEwXIJDQJJu1vdw28GUoFn6CcFDJFicvoVD/iKQvcheuzJ/ttjmCW8IMqGOpGejafO/H8LTCY55a8zerZMiBr8/rCtxZXokmEP0kP56WAdYdqQk7UijaXO0NoOWyprMaVfgtpf5+V6oAzMpap2kq1eMskqdmcQfYO9ZEKX/lI9rtXntd/rgpDbrvIVvUlxE7Lxndx6RKAgi4dlsBSqdssstxVJY5ckg+CU1ktcBSmDe+lf/9RbNqSeyjU/tyE6y+C+SlDrS1y+/MVezj+fLGovEulyp0SOg7ADSzxrzdM+Mjf7W6ZhJpNxutZJWgxvQg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(46966006)(36840700001)(82310400003)(7696005)(70206006)(110136005)(36756003)(8676002)(2616005)(316002)(4326008)(426003)(336012)(8936002)(5660300002)(83380400001)(86362001)(2906002)(44832011)(47076005)(1076003)(82740400003)(54906003)(70586007)(36860700001)(478600001)(26005)(6666004)(186003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:19:02.4703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a62aa47-bdd0-42b4-da9a-08d947500f0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4327

This commit checks "xen,static-mem" device tree property in /domUx node,
to determine whether domain is on Static Allocation, when constructing
domain during boot-up.

Right now, the implementation of allocate_static_memory is missing, and
will be introduced later. It just BUG() out at the moment.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- parse "xen,static-mem" in way of phandle back to property
- The return for dt_property_read_u32() shall be checked.
- "memory" property shall be mandatory
---
 xen/arch/arm/domain_build.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c86d52781..cdb16f2086 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2425,6 +2425,37 @@ static int __init construct_domU(struct domain *d,
     struct kernel_info kinfo = {};
     int rc;
     u64 mem;
+    const struct dt_property *static_mem_prop;
+    u32 static_mem_addr_cells, static_mem_size_cells;
+    bool static_mem = false;
+
+    /*
+     * Guest RAM could be static memory which will be specified through
+     * "xen,static-mem" property.
+     */
+    static_mem_prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( static_mem_prop )
+    {
+        static_mem = true;
+
+        if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                                   &static_mem_addr_cells) )
+        {
+            printk("Error building DomU: cannot read "
+                   "\"#xen,static-mem-address-cells\" property\n");
+            return -EINVAL;
+        }
+
+        if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                                   &static_mem_size_cells) )
+        {
+            printk("Error building DomU: cannot read "
+                   "\"#xen,static-mem-size-cells\" property\n");
+            return -EINVAL;
+        }
+
+        BUG_ON(static_mem_size_cells > 2 || static_mem_addr_cells > 2);
+    }
 
     rc = dt_property_read_u64(node, "memory", &mem);
     if ( !rc )
@@ -2452,7 +2483,11 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !static_mem )
+        allocate_memory(d, &kinfo);
+    else
+        /* TODO: allocate_static_memory(...). */
+        BUG();
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


