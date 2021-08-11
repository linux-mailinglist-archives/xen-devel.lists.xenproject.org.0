Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AC3E8EB1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165720.302918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWB-0006to-Bv; Wed, 11 Aug 2021 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165720.302918; Wed, 11 Aug 2021 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWA-0006a8-Ln; Wed, 11 Aug 2021 10:31:26 +0000
Received: by outflank-mailman (input) for mailman id 165720;
 Wed, 11 Aug 2021 10:31:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRK-0002Qj-Gg
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d735e58-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:46 +0000 (UTC)
Received: from FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14)
 by AM0PR08MB3857.eurprd08.prod.outlook.com (2603:10a6:208:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:44 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::66) by FR3P281CA0038.outlook.office365.com
 (2603:10a6:d10:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:44 +0000
Received: ("Tessian outbound 312d863716bf:v101");
 Wed, 11 Aug 2021 10:25:43 +0000
Received: from ae3ebfe48086.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4103E1B-28E2-42BA-9599-D597A9794027.1; 
 Wed, 11 Aug 2021 10:25:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae3ebfe48086.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:37 +0000
Received: from DB7PR05CA0037.eurprd05.prod.outlook.com (2603:10a6:10:2e::14)
 by DB6PR0801MB1637.eurprd08.prod.outlook.com (2603:10a6:4:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:35 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::66) by DB7PR05CA0037.outlook.office365.com
 (2603:10a6:10:2e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:30 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:28 +0000
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
X-Inumbo-ID: 7d735e58-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeFam+v6ajvMkhzqL2mzgwF/d0QSwcJY+2wQP0aX944=;
 b=WwhjurqVbqaCK6FSBbiEdvy9S08a0uEw1kf2OT6EtI/gGgxlGZYEIje+rcUYIRFSEQu/aK9Btfk+/sSj33fUVq1M+nLJfFb8k4Eq1QM2dHd243G3WzCvkYOGOS7oikW7f9Vj1LaVVKUg4UI9Rn9Isb7UIyhNBkwT122KJJhV17M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2dae50ff4c724ac6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me3ZN3wUJZdH+hGDLk9MJEuH+NB7/lh3TDzFeu9gCJ9083G/fZ8MSAZE+q5Wbiove8QCocwZc3mY9W2iqkZoaI3MBSCk5yhZDUYUMlfKi4VpOoFGiw3MEklCq3SaHAqsovsS/cBQtsjc7MA4GiGE19+paKX+H/6rBsiLnqVu5PyItK8zwrz+kRh73klyZKkrLFcbkN+nSRMjqTsNVhsQMqQJc7XgV/cUNqlcCalgUs9GN5KadxcZEKwDYQCaKMygiOTc/ITCTbCiDFwVHtCyPocuOFT9vyv0gUr1G+XkS7ULjoD/dgj05tqxREffbUd/j1R45/Na7nRHr0k4RHK8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeFam+v6ajvMkhzqL2mzgwF/d0QSwcJY+2wQP0aX944=;
 b=hibgSyTZ/I/xQErSKBffncWN+KnkxLgh89zsSZD7M4oMeL0emQltkZe3feRrWEx7pAask3mvPygHBRY/pFNz4t3nJsKwmri0mJ/5iJrCvzbiTyA/7Q3JJpgq1Qlmk5VwErx8qgYcgsAMUzKKjIne0pppJcXoEScW0J8V6BFJwDM7LsGmFzRXh5yhkwFpjW4daGZe19WamkcDBAqHR2X7QwC30j05oVyg5hq6CHooRCiVn7RcRluPuMeN7oWzyKgIyYbDoPi5POAD3Eb+hgs4rxofzM+7qYK9lovqLHHGt4fhBkfzGQVTH4VLwLCqfA+dAR+FnPY6P68bxWzVzFTnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeFam+v6ajvMkhzqL2mzgwF/d0QSwcJY+2wQP0aX944=;
 b=WwhjurqVbqaCK6FSBbiEdvy9S08a0uEw1kf2OT6EtI/gGgxlGZYEIje+rcUYIRFSEQu/aK9Btfk+/sSj33fUVq1M+nLJfFb8k4Eq1QM2dHd243G3WzCvkYOGOS7oikW7f9Vj1LaVVKUg4UI9Rn9Isb7UIyhNBkwT122KJJhV17M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device tree NUMA distance map
Date: Wed, 11 Aug 2021 18:24:07 +0800
Message-ID: <20210811102423.28908-25-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3fc3f31-6bc4-4723-30a6-08d95cb26085
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1637:|AM0PR08MB3857:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3857D7D0C33CE7A34AD169349EF89@AM0PR08MB3857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eHhSsoYwZqvxlAMNAvGj7S3LGzH6zAc638L7Cnqejv/rxxKGMuhg2toy7n8OlYE+dAA/dDjMuo4RjBS1ZHd2N+2HQy6R9S9h0X0hoeGi+H6/64TjAe/TH++jhtSXzqgonK/2xRmR7vaaTnb3aWKvwYTzm3zOyCOSx9BixRZMw5xliMzS/CR3gjnWbCpYHDk39UwttNcThyPiTcDWJ1Trw0vZWV17oq8gdunjNPMFyYeB41IwcCZzyGW//s2bdCahz+zneWjqSvKh/jSQPpvc6pQTxZTBEUn2PU05cknM9qk1OXYFPtF84TYfejWZQvpVBlqMZ62nhIA5eTRUjRbOSppEr2TVWyVqe6D5XAH9uuEZUw07r9l76Ud3kgt0chwwqpHk07vvTZWLcaPxnDNYDpICzrv+gaJONfgozlbqvW1oBdljhWn5yrkmRiDeBpj9C00jrStrJC+9h81sFrXSudtr94+NGB2cXwjTfRCXrTJBNKrSFe//LY473Hg4z+quDD6Ugt0KK5M9hdAiIkrdAc/8u2ziyDCmFHLFHoqNc9f8Q7OpzKrDoxu82byVxkj8z/8egZRLPwjmUhcGe4fiZiOR/RLpbS5PPQC0qgU8sHLRHxIZNIYWqxo4dcrGlbnklPtShtVY1NTZdU1V19Z0Sd5M00xG8DbXkMj8MI4LMojzkYZsCh2mspVVVhJWHcWcQQBRiGshKS3r6KpvfPOoDm0qAJ7C6MG6QsOeK41NHn25Tj9FzTPrYt+pBB0OZYO8FkWKsAhqxqnov1pXhvZsJAK9c+46jKcc+zUf4r9Wjsw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(136003)(346002)(46966006)(36840700001)(47076005)(70206006)(70586007)(7696005)(2616005)(8936002)(34070700002)(426003)(44832011)(110136005)(4326008)(86362001)(5660300002)(81166007)(8676002)(6666004)(186003)(356005)(2906002)(36756003)(478600001)(82740400003)(1076003)(83380400001)(82310400003)(26005)(316002)(36860700001)(336012)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1637
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f4fbaee-efb4-4af9-bac7-08d95cb25b55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nokllosg8HiW03KDgHDlI/F77T8AJ/WDwwoXsJA1KkUiCrRDipNUdzZOhxwfrJt2coT/0V8mMjxkchdmb32eg5ejJ7r6GtiIlH0RpWASIZW6HPqTr8m9aoFO8BamEIkZX0J/epvpJ0hD0rs7c1T1aCSXVQlgB6M7lSz1rHikAeAWsANE9TFYPSd8ohcCd46KFJohMxZK/vnQt+OzYJw9ofo9oHH8euLhDl4s19oC/s0UVpYTMk+ElzterJpBVFoGlDPhJTCdp3ZzqijfWMJirMP6mDM51pJOdgs2PBUr2BVfmkdyEXl/bnoJe/Bu3064xh4RgauCpPdWtd8oJIbU/xpIwk6MfMzoP1ubAx4LcYxIntzcNucWW/3oeKbrfaz8nyjKzO+dnUuvBlNzdRCxBT6+UueZROcvF8CE/zLkKnIy8hSy+IVIrh99Iao/bLMxSONp9aAsrJ4sUwF06dfFEjFO2hwEhluaEpBrytUqEdRS6Yf2i9nK2i1yi2ecwPpH1cW93gC9+v/TO5V4hQOd2dFP3g4Lc30Gk5itXHOutPrI7BQGkJLk0UyQPxxNB1sQwXqq8sApU+9dFM645PKcueDyT2R47ONl5ce+W3MdHZYHcDqlZFsU52pPl2jlFq/LBtdXtWq0xoolQ9pKO90wh20rp+yPfToqEc5qPRapxU7F+F3Kke4yDb0lX65qA63M3Gl2QaT+3CsNrUsc9iNmtWWY6ArNxYizNuOV3q6STIs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(4326008)(8676002)(2906002)(316002)(86362001)(336012)(110136005)(7696005)(6666004)(478600001)(70206006)(1076003)(70586007)(47076005)(26005)(82740400003)(5660300002)(426003)(82310400003)(2616005)(44832011)(8936002)(83380400001)(186003)(36860700001)(81166007)(36756003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:44.1721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fc3f31-6bc4-4723-30a6-08d95cb26085
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3857

A NUMA aware device tree will provide a "distance-map" node to
describe distance between any two nodes. This patch introduce a
new helper to parse this distance map.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 67 +++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index bbe081dcd1..6e0d1d3d9f 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -200,3 +200,70 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
 
     return 0;
 }
+
+/* Parse NUMA distance map v1 */
+int __init
+device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
+{
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    int entry_count, len, i;
+
+    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "NUMA: No distance-matrix property in distance-map\n");
+
+        return -EINVAL;
+    }
+
+    if ( len % sizeof(uint32_t) != 0 )
+    {
+        printk(XENLOG_WARNING
+               "distance-matrix in node is not a multiple of u32\n");
+        return -EINVAL;
+    }
+
+    entry_count = len / sizeof(uint32_t);
+    if ( entry_count <= 0 )
+    {
+        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
+
+        return -EINVAL;
+    }
+
+    matrix = (const __be32 *)prop->data;
+    for ( i = 0; i + 2 < entry_count; i += 3 )
+    {
+        uint32_t from, to, distance;
+
+        from = dt_read_number(matrix, 1);
+        matrix++;
+        to = dt_read_number(matrix, 1);
+        matrix++;
+        distance = dt_read_number(matrix, 1);
+        matrix++;
+
+        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
+            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING
+                   "Invalid nodes' distance from node#%d to node#%d = %d\n",
+                   from, to, distance);
+            return -EINVAL;
+        }
+
+        printk(XENLOG_INFO "NUMA: distance from node#%d to node#%d = %d\n",
+               from, to, distance);
+        numa_set_distance(from, to, distance);
+
+        /* Set default distance of node B->A same as A->B */
+        if (to > from)
+             numa_set_distance(to, from, distance);
+    }
+
+    return 0;
+}
-- 
2.25.1


