Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0A3C9845
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156313.288495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmP-0003fE-KZ; Thu, 15 Jul 2021 05:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156313.288495; Thu, 15 Jul 2021 05:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmP-0003ci-GZ; Thu, 15 Jul 2021 05:19:25 +0000
Received: by outflank-mailman (input) for mailman id 156313;
 Thu, 15 Jul 2021 05:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tmN-0000d1-8t
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:23 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d671e94-e52c-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 05:19:07 +0000 (UTC)
Received: from AM6P191CA0077.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::18)
 by AS8PR08MB6993.eurprd08.prod.outlook.com (2603:10a6:20b:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 05:19:05 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::97) by AM6P191CA0077.outlook.office365.com
 (2603:10a6:209:8a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:19:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:19:03 +0000
Received: ("Tessian outbound 57330d0f8f60:v99");
 Thu, 15 Jul 2021 05:19:03 +0000
Received: from 19c93b6d551f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BF246E8-9EBA-44D6-8493-4913E318A1C7.1; 
 Thu, 15 Jul 2021 05:18:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19c93b6d551f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:57 +0000
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by DB7PR08MB3004.eurprd08.prod.outlook.com (2603:10a6:5:1c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Thu, 15 Jul
 2021 05:18:54 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::47) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:54 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:54 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:53 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:50 +0000
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
X-Inumbo-ID: 2d671e94-e52c-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrIS0ljVOjpyPmWzYJmYIt9oJx/MQiYDNEJHUoVAXFo=;
 b=zmss8hqp5IJYu0gMTpRawntCFAVuN8+R8YC/2Ed0gHj9566zQCYdL7k5xJCrs5yuehoPV/7WpOqTZKoiToHgzUi2UJIisAOJZMrNJzUiL4AN1Aph03xhOIM6yHV6ctt1Vh5P9UOGbGID8CkvWPCBCimNV47rQeW/k7mOpLyIrjs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9756453b971cd8c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l38+/XmSn/wzO6ZBgbOLRYUdIKkpwN/p5GinDDJlfXS/immnfkfMWeoJyGfoBVQrDm2MeNE+x+bBEHAL7dfxC4FO+fc8IaF2jwt46eGmz11L6bEjNiljPdgmF4iSosEHOEGWnOyQSsRSsZDQWsqSukrmbDn9/oeyKEpPEp4VqTjTzobnjdHaAnIgwLs2Q9m00SPd8mj1do77sCBm8ncebIvIiyLjiHDB1RYD8IbxSjPvSL6KFlf06u8cAJPlJF+7/9es9RYPyo5BiPTL/+gl8BQFC7rn8cmOBD76rMdAYYQBUEEN79bUuSLrYUqg0n8s+kift/cW+/ei0tRtpVuibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrIS0ljVOjpyPmWzYJmYIt9oJx/MQiYDNEJHUoVAXFo=;
 b=Z/6wK5CsdKlvyEr2fbyHvpWbrJRxXl/QPMfDhZYz8quAxZ2undWaKp9hKA5erkAIG3+jWYcN1iLAxHziaCQwLj6hLbjy7HtiMPUsYv5p9F/OoXR6ugg8leMXpzEAdUwuAIoEN+X0usPp/c00o6UoKwauB4gc2gdUnmO61DiwyoQ+Sd6NLwpNv/COasWuulZcqFzSVjrUODmY5psxQtQzzu+yJkY8SyJQNg5hU1azq23Nu/sGItud85LUQj6k4T9V5MWeOlTFPWUhx0nQgyBSWpZKFAPCKAagW9szHE7476oVOs2oru0V6KjhRhhhRYOQ2422uQz03P5R70hgXmgF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrIS0ljVOjpyPmWzYJmYIt9oJx/MQiYDNEJHUoVAXFo=;
 b=zmss8hqp5IJYu0gMTpRawntCFAVuN8+R8YC/2Ed0gHj9566zQCYdL7k5xJCrs5yuehoPV/7WpOqTZKoiToHgzUi2UJIisAOJZMrNJzUiL4AN1Aph03xhOIM6yHV6ctt1Vh5P9UOGbGID8CkvWPCBCimNV47rQeW/k7mOpLyIrjs=
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
Subject: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
Date: Thu, 15 Jul 2021 05:18:19 +0000
Message-ID: <20210715051819.3073628-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ef8a027-b617-474e-c389-08d947500fc9
X-MS-TrafficTypeDiagnostic: DB7PR08MB3004:|AS8PR08MB6993:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6993D116A071FCBA2422FAD3F7129@AS8PR08MB6993.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LJpQTZ/jBUl/ES2zt6QEDxm0DwFNOuKS8lmnasg6Bl0wanvFHnZ1JvIua/PgL9OjyvPjfGQ8SKI6JnhxTGktjvazT8npqC3mWIAD1AC+xR0E9bH1Sdpbw6PsfmGbSS5Ezhp2X6AsqeiNgQb7xWytRrWmqpScqXO7fZgRgBkorL7LvGDfpeaDDWaeXDJA5d1g6bJkp3MlXJBtVkJd+tiln1IwRFYIWUca1xmeNr6uGc7dAmKYYiTTl557NsM+odgetlCaH/DNkTKZ3hR3I3tuAAiSXucqsIF/GhPrWnYMyTYqGtN/E5Kgb1iCRq9/f1WvtjlMtNkVkuChyKd0z225tTjnPA3iDC8LNFG6Ofejrb408CEnkZ3WTP7rxJL/e08M06opZI63RayIwKx8jKCCSaagTZorI16be9YDs0ExYisZeNrl9UEm4i8hKA8mPekIDwVuTqx7pLwrL6SeM0Zzo4SYa67guzNvmKiFNhOWP/5mJjgEsEypKbXAwN48eSmi2AMrdXZSKwLrkjuM0yD/6mzq+GtlnhntU+95unKtBS3QTHmsNxecUM9Kb2FC8luU3ZFIdl/bkK0cER13HV6oWNxb+vkjuF05PVTT+A3DkyL7uyCjGnuoSF9rMuiT4GPf3WBBz2vy8Jw6zdaAXsVR0NF2JksUixA7/TzJp8ptI+ajbKd+JdGxM0W1U9ze7lL6MrXW8u+L+orXPLElwXfukfayHU/8W957L0+A9uTBNC8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966006)(36840700001)(186003)(54906003)(8676002)(1076003)(7696005)(478600001)(336012)(70206006)(47076005)(70586007)(356005)(36860700001)(36756003)(26005)(81166007)(82740400003)(5660300002)(44832011)(8936002)(6666004)(86362001)(110136005)(426003)(83380400001)(4326008)(82310400003)(2906002)(316002)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3004
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4ed1b81-d0c2-4aba-0383-08d947500a60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vEGtfY6nlEQGn8sxf2PmMlltnr81GVz7VhKn3LXs+D9AmwkTyxXIkMzQDjNEfMquWalEgFcVEjQIQKzaz1FBpZtJvsUPXe+mhkPhL6/5yAPEfo7yF1GHOmRQQD0wYdUyfjo0iKPheHslYXGOpvFRsnfShQSSinbOyMEnvAXnjliK4vPAucbNcyPacGfsu3Lv1d8c3IPEl1oGmfkuvWW3mBIF7+pyDmkCKd4bKN81ZMb7e8inunDxkXFHjKwMdhBE+DzbJWjmneKpcETVL0sVWOXlw6dbdXLMiwfRIpjBktzgoxxnJbWKVwE2tmSRy5JpFoEoPzmnEtkgmtRzarrY+mWNGKpOHhAWI1gMaAUM1nCB8gbu3f+KP/2YE78jonTq8D2jhAjJb4kLDsMv+B9C88Mdh4YxqsSqO652nag34UgJVUrwD9gGcl4KtlkKR9Ol2YuIIUgDPc0vXT6IrObhhWorDWM1+iSvKw+s1PLi1zs614S6I6b6tslMX3rurpaau+BPzhRirZv+X//8Jz75Huw0SIsvxc+qtmuKF4xb+hLESphEP+4vWB08w5+Yk1SKoviTSCK015+4WVYgVrXOn2Uv+o+awksX5VjqacWEqzo8jeGIqQz55/Y/UhxXd1B2GuhBFsPdiRgeXqpMZayVVB6kvu3wo6bz5pKsJPom6IxLelHcot0qXovndtKDQNlcj7OwFll1/KYeXVQ1TKyTFj68Cfdws6V6NeO2dISnDnE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(346002)(36840700001)(46966006)(81166007)(36860700001)(86362001)(478600001)(8936002)(36756003)(83380400001)(47076005)(82310400003)(82740400003)(316002)(2906002)(110136005)(6666004)(2616005)(1076003)(426003)(4326008)(26005)(5660300002)(186003)(44832011)(54906003)(7696005)(70586007)(8676002)(70206006)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:19:03.6892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef8a027-b617-474e-c389-08d947500fc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6993

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
v3 changes:
- parse "xen,static-mem" in way of phandle back to property.
- use unsigned int for index
- rename allocate_static_bank_memory to append_static_memory_to_bank
- infer the next GFN from the bank information
- simplify the code in double loop.
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


