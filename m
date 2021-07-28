Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C83D8BB7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161423.296405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gny-0004by-EY; Wed, 28 Jul 2021 10:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161423.296405; Wed, 28 Jul 2021 10:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gny-0004ZH-A3; Wed, 28 Jul 2021 10:28:50 +0000
Received: by outflank-mailman (input) for mailman id 161423;
 Wed, 28 Jul 2021 10:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8gnw-00040B-IT
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abc0f5d9-05a3-4f5c-a98b-6c49918dfb7c;
 Wed, 28 Jul 2021 10:28:46 +0000 (UTC)
Received: from AM6PR0502CA0066.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::43) by VE1PR08MB5213.eurprd08.prod.outlook.com
 (2603:10a6:803:10d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Wed, 28 Jul
 2021 10:28:43 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::43) by AM6PR0502CA0066.outlook.office365.com
 (2603:10a6:20b:56::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:43 +0000
Received: ("Tessian outbound 5f693336bfca:v100");
 Wed, 28 Jul 2021 10:28:43 +0000
Received: from 84c1a0941bfd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3284B5BD-9FC9-4E3E-9E3A-AEB518B68198.1; 
 Wed, 28 Jul 2021 10:28:34 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84c1a0941bfd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:34 +0000
Received: from AM6P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::33)
 by AM9PR08MB6769.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:33 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::16) by AM6P194CA0020.outlook.office365.com
 (2603:10a6:209:90::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:29 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:27 +0000
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
X-Inumbo-ID: abc0f5d9-05a3-4f5c-a98b-6c49918dfb7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckLezNToPFFF/X08RBBj0Q+V9x7GEG2pfO9+DHh3puY=;
 b=f/P5Y/wSdpBR5rkK1QGMMf7HeRcTeEx6cnbIYqrFw42EuwGvke2JMuNIHYLOzCAHqzcjTEEGEQufNtc4XVq4MuCJFVezjroMgik0YU5eem27eN2v3bRhXIei2wUSvJTleqXh3F2ZuIzi26BNJ5pQgDkhi8XE0wDIoDkDht+ThNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e3fb8d2def9c618
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp1U1SOPp4BNb7yR4ExYxZvZyKhfkEBp2R/jVYTqXLryvZBCn+T6MWrX9VpU2LR4ouWzBxAVyeuzJm1LXGIKH9S3LmzujssyA1JdGGOuagfz1Bs7zLxY3IFoOUUekoYnp8pI0XNOe6OOiSFHlSpc3dlqk7hHD7AqJGtsVmhsaejFw0VzoPqaqMzpGNH8CkWJmFckdKc/NYe5oshgQFxl//Wui1eI+dTDoEh2RLbjZT1wt3RUGo6ZwFmlYQivH2o3K6hUSd/Dzuj7hP5C7GCRv9IRNS6X935wXb15NiJYJyClpxgqPpaZLq/+itSFFkdFB5c9JTnxb1RwsGmdvhkT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckLezNToPFFF/X08RBBj0Q+V9x7GEG2pfO9+DHh3puY=;
 b=ne9Oh78pwtdVmSLofORQJl9GqYsFfUwwb+XMMr12d/3Ae8Ix7OCCBMtZgZLIX//ROjdveHvTyVIeWVBXJvOYP5NQgwHc+6bVMaiogr+pEoBTjfT1zMbKGWXI9q4aY9RJ4xVIpPU4p5HRRmqEa96ve8RQ7Y0x56WibDvCN4zDbaX2QbfIthK8meXBH1KFsT0djNKDr+toCMEI+US7CyiQbHtrs1HOhCPLfb6Wf2vcLgdN7rZHMCEleEOanG1wEWF4iYwbn3f05xFl2NVrQGiVYu7LTrG4iFQod+AaHH8M665TPgosRUHwIjFN4TfTphN5FX+Ih5kaCItFJHKBtodWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckLezNToPFFF/X08RBBj0Q+V9x7GEG2pfO9+DHh3puY=;
 b=f/P5Y/wSdpBR5rkK1QGMMf7HeRcTeEx6cnbIYqrFw42EuwGvke2JMuNIHYLOzCAHqzcjTEEGEQufNtc4XVq4MuCJFVezjroMgik0YU5eem27eN2v3bRhXIei2wUSvJTleqXh3F2ZuIzi26BNJ5pQgDkhi8XE0wDIoDkDht+ThNo=
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
Subject: [PATCH V4 03/10] xen/arm: handle static memory in dt_unreserved_regions
Date: Wed, 28 Jul 2021 10:27:50 +0000
Message-ID: <20210728102758.3269446-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452ae837-1d2f-4c92-da77-08d951b279b6
X-MS-TrafficTypeDiagnostic: AM9PR08MB6769:|VE1PR08MB5213:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB521347198C1FC0FF1BE89BEEF7EA9@VE1PR08MB5213.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FPD3me3Jq5b0hCuDsyRc9oG+eyFtm6Vmp5vy+WfckePMohCcwCTzYgU9wIavR1Q9JL762UCbJ/WQx1QgH8GmP2WUgD8GYx85TJXi2hx43d2aR8IeP6Jj9mH4pcpuir3DvdlfPikY2eXu547Pk+8A556eFIMQFL1mgHyTlZ3LcWn0oPOvHlcU1jyapMihZV0Y89OdB9qbW/Q6Fkym5uoXRkYtiUgVtXkUrG8fa/SrwkfSYMUq8nyI7SreRY6/LN2n21ZKWciLjA/y9UmVetUSWDhDX6VEs82aj+5hObhutXTT82U2gAh5ok6+TRAOW8IJnSBjKCDL3La4ar75YqfFVsRgWBamjZRApuzDtrwPhdeEO4xyhN9U4e8BEB2V3Kj6hm9Uoki3byRaeq5vcDPxSRmtfD0O5mTxYU5asugLEcLwmx8nMkUt0JGXBj73qt2xTMOht1Jy632LZ2Lnz2yJfjOW498EiuwmVw1TOy7xrIytPMXL9lRSJw0cXM6AM69vdbAXUtw8fGS5tbu0fgWvEKBCprw+2yARN2+YvgBHtz7L3F+PpV+CGXMzP0Fa/tVq7mzJLBtbndyfaWenZbi2NAkU97qJsGnI2aLLD7FqZjELufIC/Sh+WEZPaLvC5LIZpX49KP8PoA4qX+R5wUU2ieNG6DKuw4jnCtSnhgqRnk/wehmjMWIb9RuAtvZc8h+bQoQ/N6HKhB+4fZZfQybF/umEWfz90myN4bU6OqSZz9A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(83380400001)(26005)(508600001)(7696005)(336012)(356005)(70586007)(54906003)(36860700001)(426003)(186003)(5660300002)(70206006)(2616005)(44832011)(110136005)(4326008)(47076005)(316002)(86362001)(2906002)(1076003)(8676002)(8936002)(82310400003)(6666004)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6769
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbb6e91e-29d4-4524-f2e2-08d951b27374
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xOdPAkG45Ild5qv3eQZR06/pPefZKTSxxIpPOpqp9ZYvvavjLgZW15lPEIWzsxNA65mTczKJbtmFMUUA8rjIhUQKwPcXKMv1zASbrGuwF2gjpVA7khKdasC9749iiDi+hKN/N9WlAAirXsFxm+O6hg9LgQORFqWaJHCzvVAtuu4OctoW3/mNbQiYB3yxo4Qd9vVRGp2QJy/fdME2PhN6sB/ElFQfVqouQsSsyyttxd0lh5sRyj6u0ppeWZmLrOoJO21a4Gsuxba8vJziiOgGgqA1Ehf96LF5BhC7O6sPCLtjnjoAIwh1v29WQYuywpuhbL9Gg/g/Qj+HJCvwDVb0pdV+aVR4/8TcIWm9ZOdoQICGqbdk2JpFzxykiFkn+Ww9pVbqcMMfkpfG0URrHbVRe2Sz7SLYpaYwvpEHHnkLUHuhun1iESoVmQcey5l7PdisDcq/r4R2j1Es2Yf2v9ycGsFdZcDNDCMOiFlb2VXbpqvUxql1zLMkGxBU6GTbuLgfi+0LR6oerVFRtQKOTUQy5C3Gx1uV58rDvU0jLGF6fB/eFT/YRYWvgr2dXevbmfbxdrE0tEiD22oOAyb53SMMaLjT/b4R5I8K1GdUlQ0PP7Grm6+iG0SHqYtUp8FkfKszucI9cXMUkXLl3eBVp8adZe/ZYSwbPy1gYy0EeZALCnqrgG+zXYii/56MfT7LUCLj3/OugNMtmWPmbm/mbNap8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966006)(36840700001)(81166007)(110136005)(70206006)(70586007)(186003)(82740400003)(336012)(316002)(82310400003)(83380400001)(54906003)(7696005)(478600001)(426003)(1076003)(47076005)(8936002)(36860700001)(6666004)(26005)(86362001)(2616005)(5660300002)(36756003)(4326008)(2906002)(8676002)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:43.7121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452ae837-1d2f-4c92-da77-08d951b279b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5213

static memory regions overlap with memory nodes. The
overlapping memory is reserved-memory and should be
handled accordingly:
dt_unreserved_regions should skip these regions the
same way they are already skipping mem-reserved regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/setup.c | 47 ++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 63a908e325..f569134317 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -200,6 +200,13 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
                                          int first)
 {
     int i, nr = fdt_num_mem_rsv(device_tree_flattened);
+    /*
+     * There are two types of reserved memory stored in bootinfo, one defines
+     * in /reserved-memory node, the other refers to domain on static allocation
+     * through "xen,static-mem" property.
+     */
+    int nr_rsv_type = 2, t = 0, prev_nr;
+    struct meminfo *rsv_type[2] = {&bootinfo.reserved_mem, &bootinfo.static_mem};
 
     for ( i = first; i < nr ; i++ )
     {
@@ -219,26 +226,32 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
         }
     }
 
-    /*
-     * i is the current bootmodule we are evaluating across all possible
-     * kinds.
-     *
-     * When retrieving the corresponding reserved-memory addresses
-     * below, we need to index the bootinfo.reserved_mem bank starting
-     * from 0, and only counting the reserved-memory modules. Hence,
-     * we need to use i - nr.
-     */
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    prev_nr = nr;
+    while ( t < nr_rsv_type )
     {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
-
-        if ( s < r_e && r_s < e )
+        /*
+         * i is the current bootmodule we are evaluating across all possible
+         * kinds.
+         *
+         * When retrieving the corresponding reserved-memory addresses
+         * below, we need to index the reserved mem bank starting
+         * from 0, and only counting the reserved-memory modules. Hence,
+         * we need to use i - prev_nr.
+         */
+        i = i - prev_nr;
+        for ( ; i < rsv_type[t]->nr_banks; i++ )
         {
-            dt_unreserved_regions(r_e, e, cb, i + 1);
-            dt_unreserved_regions(s, r_s, cb, i + 1);
-            return;
+            paddr_t r_s = rsv_type[t]->bank[i].start;
+            paddr_t r_e = r_s + rsv_type[t]->bank[i].size;
+
+            if ( s < r_e && r_s < e )
+            {
+                dt_unreserved_regions(r_e, e, cb, i + 1);
+                dt_unreserved_regions(s, r_s, cb, i + 1);
+                return;
+            }
         }
+        prev_nr = rsv_type[t++]->nr_banks;
     }
 
     cb(s, e);
-- 
2.25.1


