Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247644065D8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183887.332305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWfa-00085b-3j; Fri, 10 Sep 2021 02:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183887.332305; Fri, 10 Sep 2021 02:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWfZ-00082M-VM; Fri, 10 Sep 2021 02:53:37 +0000
Received: by outflank-mailman (input) for mailman id 183887;
 Fri, 10 Sep 2021 02:53:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWfY-0004S2-TE
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:53:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c35f1c2e-438f-4a00-a602-2221e6a25293;
 Fri, 10 Sep 2021 02:53:05 +0000 (UTC)
Received: from AM6PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:20b:b2::27)
 by AM5PR0802MB2547.eurprd08.prod.outlook.com (2603:10a6:203:a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:53:03 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::b7) by AM6PR08CA0015.outlook.office365.com
 (2603:10a6:20b:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:53:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:53:02 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Fri, 10 Sep 2021 02:53:02 +0000
Received: from 7bf717e4cf3e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEC0EDA1-6B1F-42C1-846C-A46BDE7F37EB.1; 
 Fri, 10 Sep 2021 02:52:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7bf717e4cf3e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:55 +0000
Received: from AS8PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:20b:313::14)
 by VE1PR08MB5053.eurprd08.prod.outlook.com (2603:10a6:803:10e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:53 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::9c) by AS8PR04CA0069.outlook.office365.com
 (2603:10a6:20b:313::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:52 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 10
 Sep 2021 02:52:49 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:54 +0000
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
X-Inumbo-ID: c35f1c2e-438f-4a00-a602-2221e6a25293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NnnHPaDcIoXHeQJGuPrSxCo6z4bgyFzyrpk+3oSabk=;
 b=tKxlwijYVMSRjesKxhZ4iIWhpzMJoLYnKrxktAAu/KtDeccIRinN09OvWEa0K5oBFXVj8FmWgvXBhGOL8WNMfJrWDqV8R6ih3NYd7bCVIKSEcGnkjDh3k/NBRdqOdmTJVrzMf1K7ct+ZZBTBpdmbTdY1/GgYIA/jAVZm9B6Wlmk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbfe770c9afe4a32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH8lg8Rv0Nv93ZNYv3aIo8GI4J2k4MxNZyMunM3JWn9zUditGYIFI6mTaqb4zdSyoM3fVVkApOIyfqTklyaYl+ydJjIqcLegXJZDmi8Xqv1JkVS5oA0JCKg1Zd4FXp7OzAPOb9TZG2PMmx8cYRBY+ciG4HHwVOiPP6GOEQ4qMmPZhGojvNvjEmz48fG9HWXr/0k4GmHMSvsZdNAS72kukZmp1S5lntKDJox6w/TfTSQ8Tw8ONURf0qmXnqEs7Yth1FfBT4NUMcBrGZw8kJCWvTmzjsQ0M/EmTNUXdHIcXA7XPGGftl3adOgHfFJbfLgOBK4RXkgMeNa18pSfD0TQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/NnnHPaDcIoXHeQJGuPrSxCo6z4bgyFzyrpk+3oSabk=;
 b=lxjI83gk2TO8VwD63j/5FHnh5x171Jo53s4cz1xSenI+BdNv5f6F+HoWhl4dhBDDc2fpJG8Xqfsm4MGpF+nlmFMItP6SDcbxT0eFTM7w+lQTvVOXeIxPZnYTLscnZ4O9x/8pCmJogksqD2zJNPzCmMuoecchfHBQhd/MI7Q4mtLJcFKF+ggSPSOQ8bcmLmbkHKU8Mea2NEAlYdajgcFq+OBj0AUhlRxdodSD6a8WoZdyQ7BCp0NzgSL7QKJFFPKb4XDZog9b4RyQKDgPrV7lAXMxigKhvU3bAjA6Z0sX3oZ+UAO1sR/gJDpu2/ThCfWESkR5kwAjHK9WPqR3x9F8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NnnHPaDcIoXHeQJGuPrSxCo6z4bgyFzyrpk+3oSabk=;
 b=tKxlwijYVMSRjesKxhZ4iIWhpzMJoLYnKrxktAAu/KtDeccIRinN09OvWEa0K5oBFXVj8FmWgvXBhGOL8WNMfJrWDqV8R6ih3NYd7bCVIKSEcGnkjDh3k/NBRdqOdmTJVrzMf1K7ct+ZZBTBpdmbTdY1/GgYIA/jAVZm9B6Wlmk=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v7 7/7] xen/arm: introduce allocate_static_memory
Date: Fri, 10 Sep 2021 02:52:15 +0000
Message-ID: <20210910025215.1671073-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fd965e8-6750-4471-159b-08d974061b62
X-MS-TrafficTypeDiagnostic: VE1PR08MB5053:|AM5PR0802MB2547:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB25470D2845DCF47354A6CAF4F7D69@AM5PR0802MB2547.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:644;OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kDxhc3askg4m2P4IgpQNEJz8f+qGLfhKQJ4gVw/9odCd+hg84KH8RtQvQZ9T0lixbwhf1+RYnbyl4YHsHLq6Qd0TqXTVKrkutvmN6dEPYgNxFFQdHzhG+6AbgdHBwrlc0Z6L7QRqcEyy4ir1WZFDGj6cnSWwpreuKl3IvGxKQxXTd3ZyupUPBOlLl0oizpGzb3mF5Qyu+XQSUeVrym2AjGfaNE95KSebQaHGOfuMpJ+Poc+HzIKUJrOyBWftbj71JfUuCe4mHneLIFIHdFudaJwI2rataXYCuq6wmJyL+KOlC94LWLKP418BbWbpjwfNRvWnJd3A7ZsfCNA4GsR1lnZRuWHapbEJiGvCz/LxdqM4MvQ/3Pqjl0GckcEX758R4F2jlvKhhg4QVDcKAzs4uIk5YxCfw7+eLPUaslN0iL8ZCMBIgEr2BVhz7KZl2jKEUASiSmB1Vx1zvLqZ1QS6IoLWpPRbx7qw7hI9fCxdn7icmknODWl/lmuXi+HXokGdhvIWKFBBSEaXmO3Ozsepq3a+fYGVpoF5GHFHGoHZbYbUPzWMLtpIzvZhMX61skxMBtWeM9sIfsircSOhXaxAUqUIHZU2lwGjbYRySByCG9br1hcBZisgb9S9E8yMh+8rH5oV16ybCOa94GjTXT1uJgwK9sEh5YjNY3OmRs/iyYgnlv8Num9gyrrf+muQsvQbxqMLl1v3ol12LjlMfzIp0N6HR4DALXFLSoqx+1LK8Wk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(8936002)(82310400003)(82740400003)(70586007)(5660300002)(110136005)(81166007)(83380400001)(26005)(6666004)(86362001)(36756003)(1076003)(47076005)(2906002)(70206006)(426003)(44832011)(2616005)(356005)(7696005)(4326008)(186003)(36860700001)(336012)(316002)(8676002)(478600001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5053
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14892662-ccf3-43a0-2344-08d974061579
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YRoBAxkRqgnCeOrBFbjLIRhw7eyklvZUFuEiO0rmu++CPegIJKGBS34nwu4R15aY2gAIetz6QGtiMUIn5FKj3uGBbJmpIj710tAKGo8Cyo4WdMD96zPY5peKatZHlJJlYunFrRGPB6Vy1TRWZ1fvpmpH3xiDNAv0jpuqrP706aSctKMzjespoSTTm3jcefahEs0Jn9AJJkCPsAp7VWzwoOaWAO4s7xCUZr5Kn+u8q44+iJHAsT93twTLvUJbpsSb8xjDy//zWWOqL4yuazjpdYK1pwmxucgnXxHk6lhjFzQ0w7BO06YLRHJgGZU+jO0gHw8cW98uWzZKzoppRavSXr+/MonsTlcTxAJr4Y0dPfuyYZSuEYr6n/wEf0VYiT2hXWyLIe577uolyW6+KLdhj98C5ovN1f/PwrqvCtAXaUtoBOXYwHKS4oo8LhcH9B8xtpmLCN0+2+0QDkYxDAjkVRTPtzRRpXNFkxRXsa/N+KdrmMzRW3Glh3z0xcHwPqtklDKAMfZvER5DZLiQqXFndjwUxVb2nWsAHZMrQSeYesRflNNHp3gIdk9lz96AD6uZZdroouXNVXlF38Ghge1MuM7aHtxfwF8xACJnfC3Xn/9czMSmkB1NoOWoD575TDxU+SleNmTKPJXw27e5uR/pyyBviJ94pV41rmt+OYKF0Z4rzpARsWV7N18BLEpo5BQUyOp/sR6KeW7YUFBK2I0Spw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(81166007)(36756003)(26005)(7696005)(2616005)(107886003)(82310400003)(186003)(47076005)(36860700001)(83380400001)(508600001)(110136005)(54906003)(336012)(5660300002)(70586007)(70206006)(316002)(86362001)(44832011)(8676002)(426003)(6666004)(2906002)(4326008)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:53:02.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd965e8-6750-4471-159b-08d974061b62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2547

This commit introduces a new function allocate_static_memory to allocate
static memory as guest RAM for domains on Static Allocation.

It uses acquire_domstatic_pages to acquire pre-configured static memory
for the domain, and uses guest_physmap_add_pages to set up the P2M table.
These pre-defined static memory banks shall be mapped to the usual guest
memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
a new function guest_physmap_add_pages to cope with adding guest RAM p2m
mapping with nr_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/domain_build.c | 161 +++++++++++++++++++++++++++++++++++-
 xen/arch/arm/p2m.c          |   7 +-
 xen/include/asm-arm/p2m.h   |  11 +++
 3 files changed, 173 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 206038d1c0..62ab7d0ead 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -480,6 +480,162 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+static bool __init append_static_memory_to_bank(struct domain *d,
+                                                struct membank *bank,
+                                                mfn_t smfn,
+                                                paddr_t size)
+{
+    int res;
+    unsigned int nr_pages = PFN_DOWN(size);
+    /* Infer next GFN. */
+    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
+        return false;
+    }
+
+    bank->size = bank->size + size;
+
+    return true;
+}
+
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    const struct dt_property *prop;
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, gbank, bank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize, gsize;
+    mfn_t smfn;
+    int res;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                               &addr_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
+        goto fail;
+    }
+
+    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                               &size_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+
+    /*
+     * The static memory will be mapped in the guest at the usual guest memory
+     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+     * xen/include/public/arch-arm.h.
+     */
+    gbank = 0;
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
+
+    cell = (const __be32 *)prop->value;
+    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
+        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
+
+        smfn = maddr_to_mfn(pbase);
+        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
+        if ( res )
+        {
+            printk(XENLOG_ERR
+                   "%pd: failed to acquire static memory: %d.\n", d, res);
+            goto fail;
+        }
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        while ( 1 )
+        {
+            /* Map as much as possible the static range to the guest bank */
+            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
+                                               min(psize, gsize)) )
+                goto fail;
+
+            /*
+             * The current physical bank is fully mapped.
+             * Handle the next physical bank.
+             */
+            if ( gsize >= psize )
+            {
+                gsize = gsize - psize;
+                break;
+            }
+            /*
+             * When current guest bank is not enough to map, exhaust
+             * the current one and seek to the next.
+             * Before seeking to the next, check if we still have available
+             * guest bank.
+             */
+            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
+            {
+                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
+                goto fail;
+            }
+            else
+            {
+                psize = psize - gsize;
+                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                /* Update to the next guest bank. */
+                gbank++;
+                gsize = ramsize[gbank];
+                kinfo->mem.bank[gbank].start = rambase[gbank];
+            }
+        }
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+
+    kinfo->unassigned_mem -= tot_size;
+    /*
+     * The property 'memory' should match the amount of memory given to the
+     * guest.
+     * Currently, it is only possible to either acquire static memory or let
+     * Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to allocate requested static memory for domain %pd.", d);
+}
+#else
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+}
+#endif
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2453,7 +2609,10 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_static_memory(d, &kinfo, node);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index eff9a105e7..6e01e83967 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1293,11 +1293,8 @@ out:
     return resolved;
 }
 
-static inline int p2m_insert_mapping(struct domain *d,
-                                     gfn_t start_gfn,
-                                     unsigned long nr,
-                                     mfn_t mfn,
-                                     p2m_type_t t)
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 6a2108398f..f885cc522b 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -300,6 +300,9 @@ int map_dev_mmio_region(struct domain *d,
                         unsigned long nr,
                         mfn_t mfn);
 
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t);
+
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
@@ -315,6 +318,14 @@ static inline int guest_physmap_add_page(struct domain *d,
     return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
 }
 
+static inline int guest_physmap_add_pages(struct domain *d,
+                                          gfn_t gfn,
+                                          mfn_t mfn,
+                                          unsigned int nr_pages)
+{
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
+}
+
 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
 
 /* Look up a GFN and take a reference count on the backing page. */
-- 
2.25.1


