Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D3C4D5B68
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288713.489710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW2-00018j-Hq; Fri, 11 Mar 2022 06:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288713.489710; Fri, 11 Mar 2022 06:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW2-00013Z-BU; Fri, 11 Mar 2022 06:12:42 +0000
Received: by outflank-mailman (input) for mailman id 288713;
 Fri, 11 Mar 2022 06:12:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYVz-0000Fh-Tx
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4086729b-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:39 +0100 (CET)
Received: from DB6PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:6:2b::13) by
 DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Fri, 11 Mar 2022 06:12:37 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::d4) by DB6PR07CA0075.outlook.office365.com
 (2603:10a6:6:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.9 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:36 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 11 Mar 2022 06:12:36 +0000
Received: from 901fda6444bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0B78372-B243-4C01-BB65-1CF05B3ED5F1.1; 
 Fri, 11 Mar 2022 06:12:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 901fda6444bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:30 +0000
Received: from AM6P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::36)
 by DB6PR0801MB1990.eurprd08.prod.outlook.com (2603:10a6:4:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 06:12:28 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::9c) by AM6P194CA0023.outlook.office365.com
 (2603:10a6:209:90::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:28 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:27 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:24 +0000
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
X-Inumbo-ID: 4086729b-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1TXqrctcdUtGEYuF9ixd4KtwFZVaadgy8ENe9JSK4o=;
 b=7LtzVGt6Mv6MBe5WM7Vr44ZZexiXvpI5zua5vzRckIU96fil+oKTsxznRp85A9qmw15tpUeUJqn56ZlHzWfvtdl94wz05TiR++qd61/Rh+QIUbn3111719TjHBrTj7bWuEcpU8FgtY/WxxuK/UtptXIEegz60skzJYOvFg3faWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a242202be340aa9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcBL3IvWw1tRx2VjBREMxVo7+VsJ4jt+rZjRD4XhkEXjdx1HEB35TAszNwbZX5/S8wKhm0SWRdgV6yi4d2kW45l9PotuMpqipoLAvjUCYt4lFB3AVzgFqmlg+QhfDm93weRAW4eR2RDNXmLCa3SZlLhVR2EuuQXpIOE8YNpjS2R+U0s2d8YiSl54fuByeShdEfSspOKELppQyNvVQeWt8mDsOYpCFl3T1Rz/JTGLEVaZs599UrCrBKbiXEADcxE7v5wZr6Y6D7kVx+WHFuH8dMRs3BAtLP42xWQ9UiAcHtWkm1v2F6v0/Es0J9IJyJdq1B06RcJevVJE2vOysl9UTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1TXqrctcdUtGEYuF9ixd4KtwFZVaadgy8ENe9JSK4o=;
 b=BiOurEmGP0PA/pzA9GhezVuc+DM8ZTDdwbBDNS+lFp3yKj+6jafA6QuxrMj0yseOukyydi6tj/GCRNsxix8xWlG94hoqY9Ait493RZySDVYyllo+RmbMt6Wbkw15+DJwE7VgJOlxutr6MFjHHvh1KpK05ZSe6VwLGCO5JYd+YEioZ08+kpqwk++/ej5ZazNeG/FVyicabJ1z6WJNjppmutCNIAWiiEEmfeGuBBF0BRS5Y4g6sDqoazQojTPX4QCPLa9hp5NNgflkKWhYbtrVmUTOsJnkt3gcHOiN6Jkl7N9z7/sS2Wx89YDo0qkRQOkDMwhNvdNmqkZWA2fTUZZnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1TXqrctcdUtGEYuF9ixd4KtwFZVaadgy8ENe9JSK4o=;
 b=7LtzVGt6Mv6MBe5WM7Vr44ZZexiXvpI5zua5vzRckIU96fil+oKTsxznRp85A9qmw15tpUeUJqn56ZlHzWfvtdl94wz05TiR++qd61/Rh+QIUbn3111719TjHBrTj7bWuEcpU8FgtY/WxxuK/UtptXIEegz60skzJYOvFg3faWQ=
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
Subject: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping for borrower domain
Date: Fri, 11 Mar 2022 14:11:16 +0800
Message-ID: <20220311061123.1883189-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 04f4c9b9-4c8b-4eaf-987c-08da032623b7
X-MS-TrafficTypeDiagnostic:
	DB6PR0801MB1990:EE_|DB5EUR03FT035:EE_|DBBPR08MB4725:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4725DBDDE7DFDFA64BBDFE60F70C9@DBBPR08MB4725.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LF4XwB9XyzA8qZy0E69YgQwKFLxmp/aAItZajSauBOZVgv4gNkqozkzMPm3Jf2ehAZx7VfgrArpICQT0I3rvD4F9ejV5kBXxy1ZZI8OU2oSd4fwOrkP+7AR93iPysdHFiY9qY62pPXd1oCxnLT4QBYQSUhha712KHo0tZrRKX9Eac5VT8UClOGhuJsDr1RsVwDHk1LqE8nsstdGrCKBXSplvFdQNnUOrIXKM8CPgEORl9NNcJSJmT+vFQ98+kbNkQ2LdQPAb7ejjvLLcrvJLYJc8RdKnp8UictxDKVUsz2QxNJ8n5vviwHvMkgPACoeYJknA1OPXDkHHVwFCJux3izIA2StL+MWTvTUpjkWAXFRbxEycjeV/9ZsecEBl7FjeV3D8wXZgZvlusup2lbsePkJIwqm2ZNReUF5SLZNctPy6GETXZNofamVD5F+U/Slg5Oj/wU5QXTkKgL7WHToN9C9LMxnZcWTiBtg97fNNPCJFpQFcCM5XOUuABQTsulRsfy12+6jjeTEqsxHJ3alC3ZONu6QuWwaoTdJIaecG67o/9yvFQGtWZDmAb1+P/518TmBSxvEt/vG+p4CAcKPjTxPuTxQJYt+tR+Li7lH4qShLAG3UMEUl3HuvQEq7X74jolVsYotGQNe02ZtnpzscGD0CqwQ/Rmp35MJU/ZBWzvmaVQOZ6iDDBhqruwbu4aikRUmfepO60fp8fjN3QLfIWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(4326008)(82310400004)(8676002)(70586007)(70206006)(5660300002)(36860700001)(2616005)(1076003)(86362001)(336012)(83380400001)(40460700003)(26005)(186003)(426003)(6916009)(54906003)(8936002)(6666004)(7696005)(81166007)(508600001)(356005)(36756003)(2906002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1990
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31699b1f-39aa-49cd-d14d-08da03261eaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DdcUM91qwGrJJkmBHYpAnPwCUP5/boXUaJNpS1zgY9usTBiF+QXisFUpaDyasdr07do2Uh77Kitb8tGEk9FyFjAB2Qr0kYXZRJUxmmDs2dZnOXfdR6DYEf3TCwtfmkLl+GwuinQJWggXiG3qM1vg+wMMBUtPbMF6KjJTtS+alcACaKNwEJT47Qi2QUcb1SyqZBPty5lliXtW7JyVsyNjF6fWulkkBM8ec6m2MBT1md+8G6dNEyjMyw7yDwm8mbv+4UcQ6XN9eAQO3Mx5+GGQgflwyMUMt0nlfe4IRldAGp/8nVFd2TWZemdH8sotlCndMyevG2SYFmj5FRTKmfJgdVo+HcoGDgyFsIWvRzP5JyoiqHYlV9wq9b6xSaSoBdp3xkKtYyh7Ed683Mnc0xWXmeAY4ZxoWj9xwCzKh+9GkXM/Ox92CEEM2hQeTQSKmYbBC2DTL7e0xfGrC84fKprvI2MF/GzatH1n1OsyB/O6ePVD9R1iMNorybwduN1LxWCcM2QPuZRgpDQDqMk5AvKiVEGtXtXlxnVm4oD/iU0E0qZBVkrEGFwoaWvfc8LIoumICn+ZeZlHKMay3ZWUrD7THGR04vOZVEsXq64ux3VANaY+MmZI5F6uVFX/6NH9CZfo1J2Yfi7MeYU6JU+Vk1ToX88MpOGSAbaGgNgt062XO0egTiBBn92+fy/yUV3m7N9L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(47076005)(70586007)(4326008)(70206006)(36860700001)(186003)(2616005)(26005)(107886003)(426003)(336012)(1076003)(83380400001)(81166007)(40460700003)(8936002)(5660300002)(6666004)(508600001)(7696005)(36756003)(82310400004)(316002)(6916009)(86362001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:36.9065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f4c9b9-4c8b-4eaf-987c-08da032623b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725

From: Penny Zheng <penny.zheng@arm.com>

This commits introduces a new helper guest_physmap_add_shm to set up shared
memory foreign mapping for borrower domain.

Firstly it should get and take reference of statically shared pages from
owner dom_shared. Then it will setup P2M foreign memory map of these statically
shared pages for borrower domain.

This commits only considers owner domain is the default dom_shared, the
other scenario will be covered in the following patches.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 984e70e5fc..8cee5ffbd1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -798,6 +798,48 @@ static int __init allocate_shared_memory(struct domain *d,
     return ret;
 }
 
+static int __init guest_physmap_add_shm(struct domain *od, struct domain *bd,
+                                        unsigned long o_gfn,
+                                        unsigned long b_gfn,
+                                        unsigned long nr_gfns)
+{
+    struct page_info **pages = NULL;
+    p2m_type_t p2mt, t;
+    int ret = 0;
+
+    pages = xmalloc_array(struct page_info *, nr_gfns);
+    if ( !pages )
+        return -ENOMEM;
+
+    /*
+     * Take reference of statically shared pages from owner domain.
+     * Reference will be released when destroying shared memory region.
+     */
+    ret = get_pages_from_gfn(od, o_gfn, nr_gfns, pages, &p2mt, P2M_ALLOC);
+    if ( ret )
+    {
+        ret = -EINVAL;
+        goto fail_pages;
+    }
+
+    if ( p2m_is_ram(p2mt) )
+        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : p2m_map_foreign_ro;
+    else
+    {
+        ret = -EINVAL;
+        goto fail_pages;
+    }
+
+    /* Set up guest foreign map. */
+    ret = guest_physmap_add_pages(bd, _gfn(b_gfn), page_to_mfn(pages[0]),
+                                  nr_gfns, t);
+
+ fail_pages:
+        xfree(pages);
+
+    return ret;
+}
+
 static int __init process_shm(struct domain *d,
                               const struct dt_device_node *node)
 {
@@ -855,6 +897,16 @@ static int __init process_shm(struct domain *d,
 
             set_bit(shm_id, shm_mask);
         }
+
+        /*
+         * All domains are borrower domains when owner domain is the
+         * default dom_shared, so here we could just set up P2M foreign
+         * mapping for borrower domain immediately.
+         */
+        ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
+                                    PFN_DOWN(gbase), PFN_DOWN(psize));
+        if ( ret )
+            return ret;
     }
 
     return 0;
-- 
2.25.1


