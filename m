Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848538713A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128655.241536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisCD-0006aC-BU; Tue, 18 May 2021 05:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128655.241536; Tue, 18 May 2021 05:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisCD-0006XN-7h; Tue, 18 May 2021 05:23:09 +0000
Received: by outflank-mailman (input) for mailman id 128655;
 Tue, 18 May 2021 05:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBq-00019F-8J
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a23c45e-d7ee-4558-92c6-37e4e9481593;
 Tue, 18 May 2021 05:22:24 +0000 (UTC)
Received: from DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14)
 by DB7PR08MB3595.eurprd08.prod.outlook.com (2603:10a6:10:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:22:23 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::76) by DB6PR0301CA0067.outlook.office365.com
 (2603:10a6:6:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 05:22:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:23 +0000
Received: ("Tessian outbound 6c8a2be3c2e7:v92");
 Tue, 18 May 2021 05:22:22 +0000
Received: from 3507816d2bf8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8B6842C-802E-4E8C-8D3A-DCCFDAC485D5.1; 
 Tue, 18 May 2021 05:22:14 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3507816d2bf8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:22:14 +0000
Received: from AM6PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:20b:b2::25)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 05:22:13 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::7) by AM6PR08CA0013.outlook.office365.com
 (2603:10a6:20b:b2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:22:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:13 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:58 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 18
 May 2021 05:21:57 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:55 +0000
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
X-Inumbo-ID: 4a23c45e-d7ee-4558-92c6-37e4e9481593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86kt5SDAa1ZjE9UwrzfaVaiOyuKnBJmNhimAFnTYVsQ=;
 b=FNDXUdDE6XbSgKQzOGrBQoWgBBTxX0iyW4vzWkKqz9aBiByrMDockZL+L/txjKwMsppbVuxrjZwbMRpCr+dXCDe1k0EtKNOrQooXM8pGF+fOI9bNZmfVRkPspvjERtnOjv7zoe0s6zfD7W793aSbhlaUl1TYGDKVtYxNVuO/fck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d0e93b991ec7343
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL/IIhpCU3zlPC1J3vGI8BK2td25vkHCZ8ss6bBsBC2VzzRQwJUYY/Hed+vRv8eHZxCbQ1gVKsZZPL/1V6RUq+n4VoA0Z3EokdU2GvYbJ57X5l6boigGK3KKyeBqbT4RJNtdnRe2IFWOMIPdjjF7tr2ccx1F7pNzrb01heOobiIrOrQzr4XxF2raBFokrC7lHZ+clnqvY4JNWL55jU9Euoa+gYsmby+qfib5uw5SyMSnSaea4jzorAwE9XrM0ShT6MAVPu8uGCDqwxFqvkwxKBvj9JXNfLKl2rTkjCe03QQ8A5c1nc+SJ7MjFa+ZUvnMRi7d9MtS3m/S99/lu2gThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86kt5SDAa1ZjE9UwrzfaVaiOyuKnBJmNhimAFnTYVsQ=;
 b=k31a3371Pqn3v4lXkZAjaTdkc8yeC4k4AT7oHEXe1RITFqsUV4IpDyup0OqOziYYL7EV0Ab5yLoC26Dmi05j5S5xxGGy961Vs0utlkIeptDHwNoW+0ee0VWfFmVLBeFIE4QIOTAunABEDZi0rH9AtNiSqPRpardFnzaFSnMBgxxBX8KAxlTfiOMOcsz4xrFgV2s3AEfE+3ejBDa+Ia9Pj+VPUlOusB/O6WX5EcQiFenMbk/aiTpRVJi4ZTCsmnbg3GFTJjnSVJktIAIsskRt8K50jF4tU4uearsHTxRIXDsarur6D+/zzDatNMfugI5Gc56z4l8B3aZgNcJ8gKEQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86kt5SDAa1ZjE9UwrzfaVaiOyuKnBJmNhimAFnTYVsQ=;
 b=FNDXUdDE6XbSgKQzOGrBQoWgBBTxX0iyW4vzWkKqz9aBiByrMDockZL+L/txjKwMsppbVuxrjZwbMRpCr+dXCDe1k0EtKNOrQooXM8pGF+fOI9bNZmfVRkPspvjERtnOjv7zoe0s6zfD7W793aSbhlaUl1TYGDKVtYxNVuO/fck=
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
Subject: [PATCH 10/10] xen/arm: introduce allocate_static_memory
Date: Tue, 18 May 2021 05:21:13 +0000
Message-ID: <20210518052113.725808-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1fd1713-aab3-4fc5-c7ce-08d919bceaa5
X-MS-TrafficTypeDiagnostic: AM8PR08MB6514:|DB7PR08MB3595:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3595DAA477F5A2EC4300BB8CF72C9@DB7PR08MB3595.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DvOWAfC9F4plK2BK0M4LykxgQy+wfGrNX4WkLBiBpcGgR5fhu6H7NZP2rmQD03aWP03C0tDyXLFUlVZStZRLiaGXpO60e52QwjV7d8vqkuwLyB/1PWieGl1bJZtVhRF2OFQTZGuZeax/NasVff0QmM4iZsxRVZu9tFxviOcTDCpkAJXTQyOx4W5C3aEG7CjSARY/ztRmmAgkdfJkge8AiPjAz+b3pDpbDqu+wbi9x0zRzt44qsH/xI0uz3GN1ZJhWHTbNPbR+q3N1g99UNqjLmX3i5S4fDjnIy9wkNanOoWV2mqRDMpo1+DUcOUKbsJoKZqGiL7/1nfKyKqkahKOnK/UlwOk5wOEtrF8umBxv5HXEgspDb887ECoqkBqDfJSx8viMaSzFyz9Nyrr924iRvGyN3KEUqdylomxeHAzPfZvKQo34ZIyACwkdoUJKDL0qOblEV8bB73863uB6aimZJSimuI3VjdsvS4P7m8TcsYKgGKEfNPQpGBfYXTQv2ZFov9ay8bDrf4RGqtuGYpouiO06EBWq28EemhUWIFZloKZbGBBhCH+RJa614mCewMBFZSCDyuVGlY3mUcF5Uszgn34io0Vo9q6FjhTsYhnrx1mYAee3H/sTmuLCEOF1SjOXTrS3woOF0oLQ7pr1lz+7pCQgQ7RBrUcBfSGyzj4Mw7UNtPgApU7fJRYc6UtcF7q
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(36840700001)(46966006)(426003)(2616005)(5660300002)(82310400003)(110136005)(36756003)(2906002)(26005)(1076003)(4326008)(54906003)(8936002)(83380400001)(81166007)(86362001)(70586007)(356005)(36860700001)(186003)(70206006)(82740400003)(7696005)(6666004)(8676002)(44832011)(47076005)(478600001)(316002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ab52b75-5457-4ff1-7abb-08d919bce4c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aJqKRjPHRC4drwTZr4X5L+QSiGAUNmPVsS9wx9fTJCpPPh78/xmZGuLU0lauA64VNNeGku/pYm9qm5l44U87177bMZYJWW4mYKurqvmphcXi8LoR1v/xwZ/ddueThSqaXdKWVXQIwPapusWhmQSW0+fkMESk6Q1m/tx6E/1UpodXY6DDyqDC5toflcj3MrFJnf+p6+rJtsVNX+fQq6gl2Ox9KO8s42/iABvUTUvfhwQ/2ue9aMTTRi0dk5fqP/dP/bsTjFQBPsNiV/QS9f1KRUz/nyEfueodreau3OEKu/0cVNK2FG9LqXgRLATm1OtsQP9VVb5yHW7gMniZAknHfH3J9HF4aYW/UhgsrxHgYMQudJoraZ7nSWoO9ll68zyAkP3i0gXBTwwz7g2qqbwNP4f57VdU3ALZ95l1PvlHQ/a0CT5sdJhCzXTl2qy+RgISuV6MyM5WxhkWgOFDNEF1QoD1ruw2hFxsBHleGBDKRgP3Rg0SECsoJiqFqkoVUi52bbL4W5mJl62+gJpQzqVHi3CsvuzPOxfKjiBa3/aX/53HjCl9Rr9Z13q6HEKWTeChslXlSwkD/TkgzHWQqOd6Otr/KEE/ji32dUgC0LeDVmW6bHXGHBverIF7sXoWorEI2WCndDc3FETqZqBsr8IxyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(36840700001)(46966006)(336012)(36756003)(44832011)(86362001)(478600001)(2616005)(426003)(1076003)(186003)(4326008)(82740400003)(26005)(8676002)(6666004)(8936002)(81166007)(83380400001)(47076005)(82310400003)(36860700001)(110136005)(316002)(70206006)(70586007)(5660300002)(54906003)(7696005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:22:23.0845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fd1713-aab3-4fc5-c7ce-08d919bceaa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3595

This commit introduces allocate_static_memory to allocate static memory as
guest RAM for domain on Static Allocation.

It uses alloc_domstatic_pages to allocate pre-defined static memory banks
for this domain, and uses guest_physmap_add_page to set up P2M table,
guest starting at fixed GUEST_RAM0_BASE, GUEST_RAM1_BASE.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 157 +++++++++++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 30b55588b7..9f662313ad 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -437,6 +437,50 @@ static bool __init allocate_bank_memory(struct domain *d,
     return true;
 }
 
+/*
+ * #ram_index and #ram_index refer to the index and starting address of guest
+ * memory kank stored in kinfo->mem.
+ * Static memory at #smfn of #tot_size shall be mapped #sgfn, and
+ * #sgfn will be next guest address to map when returning.
+ */
+static bool __init allocate_static_bank_memory(struct domain *d,
+                                               struct kernel_info *kinfo,
+                                               int ram_index,
+                                               paddr_t ram_addr,
+                                               gfn_t* sgfn,
+                                               mfn_t smfn,
+                                               paddr_t tot_size)
+{
+    int res;
+    struct membank *bank;
+    paddr_t _size = tot_size;
+
+    bank = &kinfo->mem.bank[ram_index];
+    bank->start = ram_addr;
+    bank->size = bank->size + tot_size;
+
+    while ( tot_size > 0 )
+    {
+        unsigned int order = get_allocation_size(tot_size);
+
+        res = guest_physmap_add_page(d, *sgfn, smfn, order);
+        if ( res )
+        {
+            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+            return false;
+        }
+
+        *sgfn = gfn_add(*sgfn, 1UL << order);
+        smfn = mfn_add(smfn, 1UL << order);
+        tot_size -= (1ULL << (PAGE_SHIFT + order));
+    }
+
+    kinfo->mem.nr_banks = ram_index + 1;
+    kinfo->unassigned_mem -= _size;
+
+    return true;
+}
+
 static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
 {
     unsigned int i;
@@ -480,6 +524,116 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static void __init allocate_static_memory(struct domain *d,
+                                            struct kernel_info *kinfo)
+{
+    int nr_banks, _banks = 0;
+    size_t ram0_size = GUEST_RAM0_SIZE, ram1_size = GUEST_RAM1_SIZE;
+    paddr_t bank_start, bank_size;
+    gfn_t sgfn;
+    mfn_t smfn;
+
+    kinfo->mem.nr_banks = 0;
+    sgfn = gaddr_to_gfn(GUEST_RAM0_BASE);
+    nr_banks = d->arch.static_mem.nr_banks;
+    ASSERT(nr_banks >= 0);
+
+    if ( kinfo->unassigned_mem <= 0 )
+        goto fail;
+
+    while ( _banks < nr_banks )
+    {
+        bank_start = d->arch.static_mem.bank[_banks].start;
+        smfn = maddr_to_mfn(bank_start);
+        bank_size = d->arch.static_mem.bank[_banks].size;
+
+        if ( !alloc_domstatic_pages(d, bank_size >> PAGE_SHIFT, bank_start, 0) )
+        {
+            printk(XENLOG_ERR
+                    "%pd: cannot allocate static memory"
+                    "(0x%"PRIx64" - 0x%"PRIx64")",
+                    d, bank_start, bank_start + bank_size);
+            goto fail;
+        }
+
+        /*
+         * By default, it shall be mapped to the fixed guest RAM address
+         * `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
+         * Starting from RAM0(GUEST_RAM0_BASE).
+         */
+        if ( ram0_size )
+        {
+            /* RAM0 at most holds GUEST_RAM0_SIZE. */
+            if ( ram0_size >= bank_size )
+            {
+                if ( !allocate_static_bank_memory(d, kinfo,
+                                                  0, GUEST_RAM0_BASE,
+                                                  &sgfn, smfn, bank_size) )
+                    goto fail;
+
+                ram0_size = ram0_size - bank_size;
+                _banks++;
+                continue;
+            }
+            else /* bank_size > ram0_size */
+            {
+                if ( !allocate_static_bank_memory(d, kinfo,
+                                                  0, GUEST_RAM0_BASE,
+                                                  &sgfn, smfn, ram0_size) )
+                    goto fail;
+
+                /* The whole RAM0 is consumed. */
+                ram0_size -= ram0_size;
+                /* This bank hasn't been totally mapped, seeking to RAM1. */
+                bank_size = bank_size - ram0_size;
+                smfn = mfn_add(smfn, ram0_size >> PAGE_SHIFT);
+                sgfn = gaddr_to_gfn(GUEST_RAM1_BASE);
+            }
+        }
+
+        if ( ram1_size >= bank_size )
+        {
+            if ( !allocate_static_bank_memory(d, kinfo,
+                                              1, GUEST_RAM1_BASE,
+                                              &sgfn, smfn, bank_size) )
+            goto fail;
+
+            ram1_size = ram1_size - bank_size;
+            _banks++;
+            continue;
+        }
+        else
+            /*
+             * If RAM1 still couldn't meet the requirement,
+             * no way to seek for now.
+             */
+            goto fail;
+    }
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( int i = 0; i < kinfo->mem.nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               kinfo->mem.bank[i].start,
+               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(kinfo->mem.bank[i].size >> 20));
+    }
+
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2497,8 +2651,7 @@ static int __init construct_domU(struct domain *d,
     d->arch.type = kinfo.type;
 #endif
     if ( static_mem )
-        /* allocate_static_memory(d, &kinfo); */
-        BUG();
+        allocate_static_memory(d, &kinfo);
     else
         allocate_memory(d, &kinfo);
 
-- 
2.25.1


