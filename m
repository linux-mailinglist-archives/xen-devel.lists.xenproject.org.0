Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5753C983F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156296.288440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlx-0000i1-Fk; Thu, 15 Jul 2021 05:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156296.288440; Thu, 15 Jul 2021 05:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlx-0000fZ-Bh; Thu, 15 Jul 2021 05:18:57 +0000
Received: by outflank-mailman (input) for mailman id 156296;
 Thu, 15 Jul 2021 05:18:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tlw-00009P-90
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:18:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61873ed1-442a-4e6b-928d-016267b87ae2;
 Thu, 15 Jul 2021 05:18:49 +0000 (UTC)
Received: from DB9PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:10:1da::21)
 by AS8PR08MB6613.eurprd08.prod.outlook.com (2603:10a6:20b:339::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 05:18:47 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::e9) by DB9PR05CA0016.outlook.office365.com
 (2603:10a6:10:1da::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:46 +0000
Received: ("Tessian outbound 57330d0f8f60:v99");
 Thu, 15 Jul 2021 05:18:46 +0000
Received: from 24e5e3f15a90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E5D74CA-B84C-410A-80DA-E0EF1E10DE31.1; 
 Thu, 15 Jul 2021 05:18:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24e5e3f15a90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:40 +0000
Received: from DB6PR0501CA0047.eurprd05.prod.outlook.com (2603:10a6:4:67::33)
 by DBBPR08MB4805.eurprd08.prod.outlook.com (2603:10a6:10:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 05:18:33 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::36) by DB6PR0501CA0047.outlook.office365.com
 (2603:10a6:4:67::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:32 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:30 +0000
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
X-Inumbo-ID: 61873ed1-442a-4e6b-928d-016267b87ae2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E612QY3hggINdE3fQg6TwWgv5c6iumbjlcSfMIoMkC4=;
 b=oZT7pHoMh65/yFRf0TJAW2neqNipNbQ24tq5BiiSlV9bg+CGSZgrNh+ZNkMWZcuPlFIjGjQ7SUs72ZMnBYzCK38tTbSr0wrO9X0tns2q1AqSXny989Cv9nNVbXeP+dOE+T3gruVbdkP1jiJ50MQQy8f3BxsbXOU0ZkDbhMVkAfY=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b46a35c717f3afd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkztgqiU3niGW2Uyf7qpogMbyZ6nHc4Nv2xxEqKGf7zRRJlOUo0idQOK1vriZtHspDRuY4Rsg58YRMa/mrXz4uaMrCNYQTRLefMRhJf1lhc12rlT6bFSC93FmcjJCL/KTRz+ctb6cahEM04t8itC4+W+jNfI4xW0boxA5z8UMUNvjG7B1CQK6Ypes0OUI8UH/wkKZ72GvRpZrFt/d1CSQIKVQZfeGHedAwSFs9+o3qYdAO6y4V9ePuerstVWBQPwpxv6y7+rdfKgFomiWtXRt+9xCuAK6Apv0VL9Yfy+ezWu7qFYzOa3VI+yAENacUoWJ7fue68VKWm9a0ZpJdAhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E612QY3hggINdE3fQg6TwWgv5c6iumbjlcSfMIoMkC4=;
 b=G2j6PTGTrsR1LiyFtargZxdyX5WS7q3YClr+BZWisvJRO+bywFwoqjNcPJApSzztsvsdgy0qWz3ZCzcvrs60+b7IvLM8b904DqPEDPUIJwFtn4lKee2z15HXEsGvBn5Ywgjk5xgmUXOsftO+2BvCrH+tS48qO+ehzuwutA4PJbPKX0OEWTpU2nyQKDZzIejjCbNBZgfIoNgI4bmabPapQbkg9qjnuEHwN38tJJ6w665O5cS8bZMPtDkMZGNvWHTRPm+USKCj3dOW5flqkOYZofURD4aTqZKfi1A0vj+JIibKEk4tEn1Kc3qj/IBqiskYUds8bgP2UPf9mp0HPGoi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E612QY3hggINdE3fQg6TwWgv5c6iumbjlcSfMIoMkC4=;
 b=oZT7pHoMh65/yFRf0TJAW2neqNipNbQ24tq5BiiSlV9bg+CGSZgrNh+ZNkMWZcuPlFIjGjQ7SUs72ZMnBYzCK38tTbSr0wrO9X0tns2q1AqSXny989Cv9nNVbXeP+dOE+T3gruVbdkP1jiJ50MQQy8f3BxsbXOU0ZkDbhMVkAfY=
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
Subject: [PATCH V3 03/10] xen/arm: handle static memory in dt_unreserved_regions
Date: Thu, 15 Jul 2021 05:18:12 +0000
Message-ID: <20210715051819.3073628-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d616a1d8-efa2-4168-695c-08d9475005c3
X-MS-TrafficTypeDiagnostic: DBBPR08MB4805:|AS8PR08MB6613:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB66136897B407AF0AF0795F9DF7129@AS8PR08MB6613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yBHaIgTMNvU49IthGd/KQLNA6NVuuIMAe+H/b4cKxluR3b3aKHoZY0Gy5kt1twuEaiNtZVDwTO1nDx+xyAlcIsf+mLyq0BUFHLKRxoAch8XktUhw+Z677Qu3IUEKKR5tdWvatR0R68RyCHaE3DN+ATeYVR0RixPLfVOm/+EI4rOfze1xn7MJhTZQ2ZtJzIu/b/EtArUhncC7ONurxMdbMDWvg4KYaWJjxGEa/XfkLFFzKItUQWsQ8Ww31Oq5RTxIGfOFY1+9IrPF1YgxwCbrMHnOlk6MaSYtCxaj9ifXyeqHZiH8h+4S+xCEtnuBbGuptgo3mYOe1d3Ytl/O50RZtFKdrTyUvIp9tvfJ7nd4o6HLZDROSE5e6uAH0MfH3Rf5HuU1Y4n0r4a4/viB84BQFrPEbyME9/Eq2f2+yavT03c9XXlMM8vhkaeBIA37r+SDtdqV+8ORvKLRmGSxPNXaYTfIXg91+N8wFf8o5agtRWCoAuA1/zfQFaJHzpHSc0Q5F3ebFYV0nUoEeEFmIxhK97LrrMxOqV4XnqCISRRYDDSBMc3lC2geUwGEkBNuj1moXTrIs3VAOcnYkAr4Ag6VLQDXWYfjKgiO4yFOPW5WeCRaPzPN8hZjWcy5eYCJ8+9GFY5cCSexStWKXve4trIhb1yq6/XBqkjV4nq766hQBr1/p2gULFTNT8JHbDPDlVdiMBVGDwRByY5izK55tI5EnUXJNrxraxYKZFA2fhb+cKc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(46966006)(36840700001)(26005)(44832011)(8936002)(2616005)(1076003)(54906003)(36756003)(82740400003)(6666004)(81166007)(36860700001)(186003)(4326008)(426003)(478600001)(83380400001)(336012)(356005)(86362001)(5660300002)(2906002)(7696005)(70206006)(47076005)(8676002)(316002)(70586007)(82310400003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4805
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a04a21b-b935-4ee2-03b5-08d9474ffdeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FeYoSQIyYSicjUomUokvHIBQWG0XYWiQa9W2nulOCdjl+4Og59u9/3mTUMRwvmdWa/hkmiaOfPMG+NUJdlv2QHhRT3ALiSGiP18sA8f7g9ZpiUfZKSj07DdVX2FAKkuiaegUHNfUWJBKtzga1ikcAdJ+hLDPPG+3Zeq1vqPFIceSZaXPWpVfOIwk0B68djx2M24C01/72m8AQah5rEnU8KB12K+cZwJjiZakInG/n3J8wgz5zAvGnjgqeQ6xoOCyf0YMGsV/SHmboi4TrTIBJEimkI0UiIg9vH0H0twG9j+n4BQm3kWyVJi0eUBSVQIeYPFR4YQ7Vuv83195yKk711bzz6EAldzg5Q5UOoNdNB53+wXedxQfgueGSVCqkApwjwC3/RlI55c5iGfDlbg01fIID1BpnnOD4+Idb/x2kzocSdDd3Pp43PX+J1jHS61Hut0VjJ4lH2Kya+O28aX0dl7XgpLhsEcjd1lORmpqQAXcCMvD+pJCuo82pQcBG2o3jHiGwl69S/+oK/GoXOApHdvMQ80svVqnJtGN+KKqfTrZtYvDykuXyCc4gLouvyeDAEQj/2eln8W1lIkLyvg4hReLGTnZlLPrS3uMLzhPvSKNHzC/n4LQIaxxE8msAM7qexFkYvUo2Dfs9uBcJjTCxIlTfxvslVLx6heh4yeEHqIAIRA6q/sAcsqMYx+Rg0bpU9pdQftglI5MKk/xs1Hn1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(36840700001)(46966006)(4326008)(26005)(70206006)(63350400001)(83380400001)(110136005)(36756003)(2616005)(8676002)(44832011)(186003)(82740400003)(36860700001)(336012)(316002)(63370400001)(5660300002)(81166007)(7696005)(70586007)(2906002)(426003)(54906003)(6666004)(86362001)(8936002)(82310400003)(478600001)(1076003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:46.9214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d616a1d8-efa2-4168-695c-08d9475005c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6613

static memory regions overlap with memory nodes. The
overlapping memory is reserved-memory and should be
handled accordingly:
dt_unreserved_regions should skip these regions the
same way they are already skipping mem-reserved regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- extract common codes for dealing with reserved memory stored in
bootinfo
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


