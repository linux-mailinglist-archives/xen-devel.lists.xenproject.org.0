Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE239D314
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137547.254925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FT-0005yJ-QW; Mon, 07 Jun 2021 02:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137547.254925; Mon, 07 Jun 2021 02:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FT-0005uk-JK; Mon, 07 Jun 2021 02:44:19 +0000
Received: by outflank-mailman (input) for mailman id 137547;
 Mon, 07 Jun 2021 02:44:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FR-0003W9-Jz
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:17 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0516d7ff-8a69-439c-a0a7-07175f7fb513;
 Mon, 07 Jun 2021 02:44:15 +0000 (UTC)
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by HE1PR0802MB2585.eurprd08.prod.outlook.com (2603:10a6:3:d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 02:44:13 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::fa) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:12 +0000
Received: ("Tessian outbound 2977cc564e34:v93");
 Mon, 07 Jun 2021 02:44:11 +0000
Received: from c39aee2c5cfc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A51EFF2-D5D9-4C77-8BFE-6E63319D2DFE.1; 
 Mon, 07 Jun 2021 02:44:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c39aee2c5cfc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:44:06 +0000
Received: from DB8PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:10:be::35)
 by VI1PR0802MB2381.eurprd08.prod.outlook.com (2603:10a6:800:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Mon, 7 Jun
 2021 02:44:04 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::ae) by DB8PR03CA0022.outlook.office365.com
 (2603:10a6:10:be::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:04 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:44:03 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Mon, 7
 Jun 2021 02:44:02 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:00 +0000
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
X-Inumbo-ID: 0516d7ff-8a69-439c-a0a7-07175f7fb513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjHc/ZQydMUgz2CkElY2HaTa10pnGTpDgjZ8IA6R1sw=;
 b=lTG2md8QPpBmoccvIkX+y3xtOV7631r0My4UhrKOWX47j5MEPSmQSsAB+SadkAWqUae4ln1DGZ1hSwGAKHieEQ1G0X/ZGtLfRx2xZU002ArF6EG0vx2aQf4LU2wDn39vSRx4dPNF59BamCGUEqXsw4S7MerIOkyA6EQT19a2iiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c833dfd982f25670
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMty4Emx9M8u3E/deZ3l3zvUPz5NloJQs1I9f2SDVP6gMk7rwcI20jf1ccWAEkQYH7g3V/YrgMIh1yBCRaCrraTN3p3U5FiGUf3q0UymwYBIDrqxHwqe0wsKz78U0s/GRShkQbHB2OaYWeVAIwUFIeJdfTxH7Oh63pCkVZ/3l28PnywxIYfCHjP4cGHWMxKLL56K80LKpGNFiytzAWcTdM7eE8ovvZSsa2Xb1S/MdW0k4Ur8htj76MEbkAmyatVbV5Be7H22jYLLy/WYBb8CrlpwJUumRTo+2zK+wr6r8ZBZStgDTtgQR2nCVO+X8E//wRLno9ZVxc5bpA2XUSwfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjHc/ZQydMUgz2CkElY2HaTa10pnGTpDgjZ8IA6R1sw=;
 b=gDIi7T8V+34CPcOCZaK8US1Fze45LAIlFWmc5LLjEot3ZbLpP7BmxoOL23Jj0lyfFCVTNIN03MWWkej458O3pqNvdU00F+ZPs/VyK7pwJhKCg0UiTN8D9wn6CQmxGdKw+xBV3ToZUSOl+D4DdeWOfwwjrsBfrOqDkhLsYtdvW1BT2S8PhUQFTba7UIPDods6RZi+Ew3aKGql98vI3cwwvcsFmP1vLbkKSPffbNkmUcYcwZbp9TtaYuqhNq3abjWdrCtSH5crQmQq5g3VpWsiiO2l0mCXMJmdW5yvBKPJB43gcl3lkFHMFg5ZvyYrgd3SKgcnndkoeOxK27vAfRu3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjHc/ZQydMUgz2CkElY2HaTa10pnGTpDgjZ8IA6R1sw=;
 b=lTG2md8QPpBmoccvIkX+y3xtOV7631r0My4UhrKOWX47j5MEPSmQSsAB+SadkAWqUae4ln1DGZ1hSwGAKHieEQ1G0X/ZGtLfRx2xZU002ArF6EG0vx2aQf4LU2wDn39vSRx4dPNF59BamCGUEqXsw4S7MerIOkyA6EQT19a2iiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 8/9] xen/arm: check `xen,static-mem` property during domain construction
Date: Mon, 7 Jun 2021 02:43:17 +0000
Message-ID: <20210607024318.3988467-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e3e0da-1eba-4377-8046-08d9295e221a
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2381:|HE1PR0802MB2585:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB258557BD9DC8A64D17347DD9F7389@HE1PR0802MB2585.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:747;OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yKdNQzBmplE3N31U2qwrNZhMWtrFzULMSRIsiq6o259K83lqdL9DCq9XixEekAs3VDgxUnNeF/pATNH8jLzx5Jr8+5q+72aclbtOqs3JwzvWEUWgkDhko9rPa3rmwElTQnTJ2h4OX5FfuGFKR+kMrUeZIfNPAIz9bhzY3tNAs/gswjRz3p0Gb1ZnLgFgL1BMk7ybsnlM5Tv+WRczwykOPkUwCfln2CWnjiQEflgh2mwEox0covFNF+iTHgfWF0ld1lXKy2vi5ud8WDmCzyOCACAP9INxRz07gy0M1HXAqUyKpjbdNXYAIJs/opdy/C781X6aUf3XMXCY1ltf5iF719faB71JHNuXHs1ywtjewLJo1jWatwEUR4NXh5/QA8LAWWZWSQA4VGszS2gfljewOQAYX4R+ZWhbjAYF2UC14sBle47HItqyC+NX2aMgkErSl+hbSqVSThybpfUWf4ucFh0t6AM1qMFa+PowdexLz+KQjUvuYJRcpQjjmR/wevthMFVP96kfZSaU2h9O2XAXM+jyspYbMqYgx2N89c45zNxDOJLo+v345eP7CBqvbKTuRTZO4MNjuTmE+yFH660TX+qMWaXhywW9rN2XHTugCRz+VdGi8It78kZSSdLIJenlCzge0RZE0h5WMf4qBVBkJ90ocekpPmITvIq+XD6/CecroZ3Vn2i0br/JPwAWsBcbLguy1JgzwO34OSEEhPdsI0Lhv1NcMMwkrBtOr0y9LQ4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(46966006)(6666004)(4326008)(478600001)(7696005)(186003)(1076003)(86362001)(81166007)(110136005)(356005)(8676002)(8936002)(336012)(70586007)(26005)(70206006)(5660300002)(426003)(316002)(2616005)(2906002)(44832011)(47076005)(82740400003)(82310400003)(54906003)(36860700001)(36756003)(83380400001)(81973001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2381
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	832cdbb1-6b57-4076-c7aa-08d9295e1d2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3jZBqvtTY6EGuiE98vEGTV/ZOArJka7PoepI/VbdtmU8/vL9GTsDar5xSsp9Fao1iOPUOahxAX11vHITWm5KSOCpaQc2X9HFp/uanA5F05meqcFyNoznim8TIHSxYRMz89fMIFOpd/K/9ocJzeAN4sh07oTVm0JylN/koi1ds9489xd2weFdL/6Kjy1+mPWj2d5wHCsloq1s0K4hV2xG4UwFiG58SWcS/YTPcGtP45C61RUOIi2ps/SDuoRSniuDN5RrRrBxUPTBT5szlJPEuvJrFmgYW6G9HhLqp5Yfvpj93jVn0v0Q5GM2U7lIBEqHExXkHN8nwY5QUuYwtarKIMGkak2LprU1F1omrmMLHXkECx/GTvQAkQeZDPb+sR0uabBctqdWDXO3+tC74flmKco+unXWKanMsFfriYuwao8QfrZy7VAZUQ19wU/QVbZzIMzlQZidm4p5FIwqjUDiLcQT0t5vL46EP2+JTwzRjwlbpCdYzXYToR7+4nWfX4cwOTlG43D/ZPmQ3cjZFsNkv5zPDx89ITD+M5JaswOE+rgec2FNcmNajPinVqGgBZDCd+vSyExtzkMUoSadZZTjVJdZPY0vJiLG/12rD0uiBQuRrqrKcKTswm0Tpu+GJCAdICuBYsm3gG2uRn2mMQHEr/1fUqwt468Id/z0qOt86dgPDrt0xLV8B665siLxoI9TFAgmu9X5LjubbfXHUzbXRQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(2906002)(70206006)(7696005)(5660300002)(426003)(70586007)(336012)(110136005)(54906003)(36860700001)(1076003)(6666004)(2616005)(44832011)(47076005)(26005)(83380400001)(82740400003)(81166007)(82310400003)(86362001)(8676002)(4326008)(186003)(8936002)(36756003)(478600001)(316002)(81973001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:44:12.4672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e3e0da-1eba-4377-8046-08d9295e221a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2585

This commit checks `xen,static-mem` device tree property in /domUx node,
to determine whether domain is on Static Allocation, when constructing
domain during boot-up.

Right now, the implementation of allocate_static_memory is missing, and
will be introduced later. It just BUG() out at the moment.

And if the `memory` property and `xen,static-mem` are both set, it shall
be verified that if the memory size defined in both is consistent.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- remove parsing procedure here
- check the consistency when `xen,static-mem` and `memory` are both defined
---
 xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 282416e74d..4166d7993c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2424,23 +2424,47 @@ static int __init construct_domU(struct domain *d,
 {
     struct kernel_info kinfo = {};
     int rc;
-    u64 mem;
+    u64 mem, static_mem_size = 0;
+    const struct dt_property *prop;
+    bool static_mem = false;
+
+    d->max_pages = ~0U;
+    /*
+     * Guest RAM could be of static memory from static allocation,
+     * which will be specified through "xen,static-mem" phandle.
+     */
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( prop )
+    {
+        static_mem = true;
+        /* static_mem_size = allocate_static_memory(...); */
+        BUG();
+    }
 
     rc = dt_property_read_u64(node, "memory", &mem);
-    if ( !rc )
+    if ( !static_mem && !rc )
     {
         printk("Error building DomU: cannot read \"memory\" property\n");
         return -EINVAL;
+    } else if ( rc && static_mem )
+    {
+        if ( static_mem_size != mem * SZ_1K )
+        {
+            printk("Memory size in \"memory\" property isn't consistent with"
+                   "the ones defined in \"xen,static-mem\".\n");
+            return -EINVAL;
+        }
     }
-    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
+    kinfo.unassigned_mem = static_mem ? 0 : (paddr_t)mem * SZ_1K;
 
-    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
+    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n",
+            d->max_vcpus,
+            static_mem ? static_mem_size : (kinfo.unassigned_mem) >> 10);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
-    d->max_pages = ~0U;
 
     kinfo.d = d;
 
@@ -2452,7 +2476,8 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !static_mem )
+        allocate_memory(d, &kinfo);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


