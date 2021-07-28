Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E53D8BF2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161487.296500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gvC-0002mr-6L; Wed, 28 Jul 2021 10:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161487.296500; Wed, 28 Jul 2021 10:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gvC-0002jP-2O; Wed, 28 Jul 2021 10:36:18 +0000
Received: by outflank-mailman (input) for mailman id 161487;
 Wed, 28 Jul 2021 10:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8gpE-00040B-LL
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:30:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 131e452d-64c3-4b00-827f-6313ab349ef9;
 Wed, 28 Jul 2021 10:29:18 +0000 (UTC)
Received: from AM5P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::14)
 by PAXPR08MB6640.eurprd08.prod.outlook.com (2603:10a6:102:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Wed, 28 Jul
 2021 10:29:16 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::f1) by AM5P194CA0004.outlook.office365.com
 (2603:10a6:203:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:29:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:29:16 +0000
Received: ("Tessian outbound 5f693336bfca:v100");
 Wed, 28 Jul 2021 10:29:16 +0000
Received: from 2138220fbbc3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7991EE38-FE34-4992-8030-BC24FB0D102F.1; 
 Wed, 28 Jul 2021 10:29:00 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2138220fbbc3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:29:00 +0000
Received: from AM0PR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::43) by DBBPR08MB4680.eurprd08.prod.outlook.com
 (2603:10a6:10:f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 10:28:55 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::e) by AM0PR01CA0174.outlook.office365.com
 (2603:10a6:208:aa::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:55 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:48 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:46 +0000
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
X-Inumbo-ID: 131e452d-64c3-4b00-827f-6313ab349ef9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmfA8FI6NfA6jk+mUsEPar1jSj8DwHYRvwaxcZozXR0=;
 b=Ov+IgAkkiymNH2HrNKEbqK0CKTFXs1/zywa/uPQx2mOBXnu8098MrCMPp7kHGGBP/eYXuEtuc37JWGckZsaU6DS2+RrszWpQHmof8jpbCqOu16WtKe5SS0ZmUh3Wa3Q/YJI2Jd9OI7DUOBKt1LcsNvryoifHB+EAkglslTEEQGQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ede5a8212e535404
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqOFJFFScCBjg13P7XZo4I8zLATBuyXPHiR0hdanesT8r/IK68eyGJ6rf6W/12lADPpALsr+1mrG/Nn+JO6VrK0eymMBtBAbxQoevxWi5y2BB+txxbjf1Xdm+llmdJR7XLJ9LTkfWZqW7lq0CP9u+7yhIFjmf2iG0PJjTeFtEN2Nhx1lBW1DaMif8ZM/mjiZxRk1xJdGZvJXs1HdPGmGTxpGocvZS2x2JGkVXkQ81g/6k+CIkGgrExLIndeYE1MSTseCvllImBzzYk1P5WyEg6EeSPJ4X+RdUUIIxqFiJrxxv0STdT1KFABdPqfT60638MLjtvpEJ6VlCuu3pOZjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmfA8FI6NfA6jk+mUsEPar1jSj8DwHYRvwaxcZozXR0=;
 b=CICbhL3wwLtJY9wHff7uycFCWz7K94KX/sphI0N3xRpcLqPmGbNdPR9VaLNTWUUobPpFYAbFXBuevMd+KLFWaef6X33TZdZCF6AO+cfkyZGsDjnRzTfelK7FmkbRMuh9lRqVAFOzV0coNaeySsihOdWji3wXB8poEcYeOqi8b63mUssH00TI9Nx6YAggcoPvgGbiaE4CgabBtQNoN1B632JpMeqQlKn/GYSwI5gfbaJT7qEH6vF4bxv0GNeigsEgkhLSm2+siI94gdtnn6Lito3iM+dwiYRlXiGVp0+SCvvYnxXBik3qRO6JIl9JzzHhMXtCkrPXnFFa1X0o1NBpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmfA8FI6NfA6jk+mUsEPar1jSj8DwHYRvwaxcZozXR0=;
 b=Ov+IgAkkiymNH2HrNKEbqK0CKTFXs1/zywa/uPQx2mOBXnu8098MrCMPp7kHGGBP/eYXuEtuc37JWGckZsaU6DS2+RrszWpQHmof8jpbCqOu16WtKe5SS0ZmUh3Wa3Q/YJI2Jd9OI7DUOBKt1LcsNvryoifHB+EAkglslTEEQGQ=
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
	<nd@arm.com>
Subject: [PATCH V4 10/10] xen/arm: introduce allocate_static_memory
Date: Wed, 28 Jul 2021 10:27:57 +0000
Message-ID: <20210728102758.3269446-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69e4e19d-d314-416c-40fa-08d951b28d4d
X-MS-TrafficTypeDiagnostic: DBBPR08MB4680:|PAXPR08MB6640:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6640C291B1CA4D2C82EA0F99F7EA9@PAXPR08MB6640.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qy+SqIJMljWZq4WXRnsLjlmyzWsvPw1aTOeahNw0ww2wFLT5zLlkhaP7YTJ0ytKFBWnsS0LuoyHvg6okeF120hq/uRTbVZ9goMfmSkmiMEMvVulWoGesgSvOCGko/J3wbbHbteH9nWB9IX/IhJejPZcMpioCyl6W3w11s3y2oi4n337QFzEGzoOJ2ifGvJN1mQQIId3e613W74dTmaac++9RWHLvS2qq2Cta7ktFT6JiGX0sh2VJqrR7V616s1aTHKzKw66rQimblHwUGMnMhrJ85/yn/XUdd9xtIWAAJrsjFqGmlJSQCdSzaVFBReIWCZzkXUpn1zc+brO4I8Z1JJCLRUVgVK4M6lS69Re2MHB7AzOpA4FMm01d2fCoAN6nmKhzNcFOPmDY8+kmaBJ6Yr5bnKPCubdav7Tk9LgaSx7/OT9lUgiu67VVQSLtICt2PpirIJ3yj46Wsv3tx9Cd+MajnuyBpOfavFqmZg40QP29kf9/MUXjhqhRc0BjRO+k+00gHCB5MAGiCkSmk5vonIC26puX6cS1+uCM+TXYN/s0h00jzmYWEuNjRA97eCE6eX540MF8XL94PUY1hTnyLiV+nu3d2tk9pQj0ezt5dUWvTerYorXRpvGsJxIGZ9H4f23DucmA5Zac+Hzkt/pEMlIol5wddD8BXGYYFfw79bhYoVxQ7//QZn2H/N9F1Or/6OkDJArdKWs5xsV7FUVNV8KOrZ8silfGZhkPTtwEWRo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(46966006)(36840700001)(86362001)(70586007)(8676002)(82310400003)(478600001)(356005)(36860700001)(4326008)(83380400001)(2616005)(316002)(54906003)(2906002)(70206006)(47076005)(7696005)(36756003)(81166007)(5660300002)(82740400003)(26005)(44832011)(110136005)(426003)(336012)(8936002)(6666004)(186003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4680
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a2909e2-a171-4ab7-7b85-08d951b280c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+8GA8hk7+6jn/onCm/zeWtFVTxVjySQs8C8MNy+NCtRtafJlDOJFOaJhrnem3MqOAD1rJYtYW7jEgsIUlXhtPEpXaDe/Ju7Jcfjp53DikDhWVJikUDgbXSC8BJ+4ZKlQPG9Bd8B/9haKEpm/jHeKXR/S/gazRY1LmOt8ailGglsUWZzlFMIhKQZwfevHHvCkLwikrJmNVsliRfbaurqr/I3Vk+tgAe1DUNrPddFGhLqMTWPPRr0FjiS0Ii7PMWSnYnwwpZWVyLxSK8huuC2j5PK9yK0IFsCbFwulYMrhbBb55A90n8u/KuWUw52yfgyQEJ5TE35YbdtmasUW8DZKy/NXePHg9AYxWq9mwUgxOUgkFV77bz2n3VEL4xiv3uAjI666CaWSNTQeC9/LoreSQZgFgQ70VqnA2dZvJ+hTn6/QME3tEqDLUctnXMe8vQZnP5D/rLcXTNnZvlyYbc838wk0rc7snLU1I6MpHZWmp7XtSveZPuYl5g2oB4YSc31orqmbWgTpe6xUiM4ToSwLUneuJK3gCEPzQulxogGVu99prTx4CLCtoXja4s93g49l6iFcJfpZ5fL2w1aSh41k+UccNCmU9J7jVMNasgCOhozMg8fe6j6PLRbWLoEh7cXceZlYp/lOzF2n7agVTFYiOjGFZezwoIrF88urNd44pBEEHvStmPIgDblEAbeqBX2ciB9P9T8JRISGXLqUEOdGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(82310400003)(54906003)(186003)(83380400001)(36756003)(44832011)(8676002)(86362001)(81166007)(70206006)(26005)(7696005)(2616005)(4326008)(6666004)(336012)(70586007)(36860700001)(508600001)(8936002)(1076003)(47076005)(5660300002)(316002)(110136005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:29:16.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e4e19d-d314-416c-40fa-08d951b28d4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6640

This commit introduces allocate_static_memory to allocate static memory as
guest RAM for Domain on Static Allocation.

It uses acquire_domstatic_pages to acquire pre-configured static memory
for this domain, and uses guest_physmap_add_page to set up P2M table.
These pre-defined static memory banks shall be firstly mapped to the
fixed guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
`GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`, and so on.
`GUEST_RAM0` may take up several pre-defined physical RAM regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 137 +++++++++++++++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cdb16f2086..ed290ee31b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -480,6 +480,139 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+static bool __init append_static_memory_to_bank(struct domain *d,
+                                                struct membank *bank,
+                                                mfn_t smfn,
+                                                paddr_t size)
+{
+    int res;
+    paddr_t tot_size = size;
+    /* Infer next GFN. */
+    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+
+    while ( tot_size > 0 )
+    {
+        unsigned int order = get_allocation_size(tot_size);
+
+        res = guest_physmap_add_page(d, sgfn, smfn, order);
+        if ( res )
+        {
+            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+            return false;
+        }
+
+        smfn = mfn_add(smfn, 1UL << order);
+        tot_size -= (1UL << (PAGE_SHIFT + order));
+    }
+
+    bank->size = bank->size + size;
+    return true;
+}
+
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_property *prop,
+                                          u32 addr_cells, u32 size_cells)
+{
+    unsigned int nr_banks, gbank, bank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    u32 reg_cells = addr_cells + size_cells;
+    u64 tot_size = 0;
+    paddr_t pbase, psize, gsize;
+    mfn_t smfn;
+
+    /* Start with GUEST_RAM0. */
+    kinfo->mem.nr_banks = 0;
+    gbank = 0;
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
+
+    cell = (const __be32 *)prop->value;
+    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+    BUG_ON(nr_banks > NR_MEM_BANKS);
+
+    while ( bank < nr_banks )
+    {
+        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
+        tot_size += psize;
+        smfn = maddr_to_mfn(pbase);
+
+        if ( !acquire_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0) )
+        {
+            printk(XENLOG_ERR
+                    "%pd: cannot acquire static memory "
+                    "(0x%"PRIpaddr" - 0x%"PRIpaddr").\n",
+                    d, pbase, pbase + psize);
+            goto fail;
+        }
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%d] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /*
+         * It shall be mapped to the fixed guest RAM address rambase[i],
+         * And until it exhausts the ramsize[i], it will seek to the next
+         * rambase[i+1].
+         */
+        while ( 1 )
+        {
+            /*
+             * The current physical bank is fully mapped.
+             * Handle the next physical bank.
+             */
+            if ( gsize >= psize )
+            {
+                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
+                                                   smfn, psize) )
+                    goto fail;
+
+                gsize = gsize - psize;
+                bank++;
+                break;
+            }
+            /*
+             * Current guest bank memory is not enough to map.
+             * Check if we have another guest bank available.
+             * gbank refers guest memory bank index.
+             */
+            else if ( (gbank + 2) > GUEST_RAM_BANKS ) {
+                printk("Exhausted the number of guest bank\n");
+                goto fail;
+            }
+            else
+            {
+                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
+                                                   smfn, gsize) )
+                    goto fail;
+
+                psize = psize - gsize;
+                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                /* Update to the next guest bank. */
+                gbank++;
+                gsize = ramsize[gbank];
+                kinfo->mem.bank[gbank].start = rambase[gbank];
+            }
+        }
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+    kinfo->unassigned_mem -= tot_size;
+    if ( kinfo->unassigned_mem )
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the ones "
+               "defined in \"xen,static-mem\".\n");
+
+    return;
+
+fail:
+    panic("Failed to allocate requested static memory for domain %pd."
+          "Fix the VMs configurations.\n",
+          d);
+}
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2486,8 +2619,8 @@ static int __init construct_domU(struct domain *d,
     if ( !static_mem )
         allocate_memory(d, &kinfo);
     else
-        /* TODO: allocate_static_memory(...). */
-        BUG();
+        allocate_static_memory(d, &kinfo, static_mem_prop,
+                               static_mem_addr_cells, static_mem_size_cells);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


