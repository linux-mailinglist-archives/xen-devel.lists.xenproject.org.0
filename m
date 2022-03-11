Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613954D5B66
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288715.489732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW8-0001so-Bz; Fri, 11 Mar 2022 06:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288715.489732; Fri, 11 Mar 2022 06:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW8-0001or-7O; Fri, 11 Mar 2022 06:12:48 +0000
Received: by outflank-mailman (input) for mailman id 288715;
 Fri, 11 Mar 2022 06:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYW6-0008Q3-7v
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444708df-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:12:45 +0100 (CET)
Received: from DB6PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:6:2c::18) by
 DBBPR08MB4679.eurprd08.prod.outlook.com (2603:10a6:10:db::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Fri, 11 Mar 2022 06:12:43 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::9a) by DB6PR07CA0104.outlook.office365.com
 (2603:10a6:6:2c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.7 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:42 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 11 Mar 2022 06:12:42 +0000
Received: from 060b85e9f54f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51A1884C-C79B-4AE8-BF64-A32FC44677CE.1; 
 Fri, 11 Mar 2022 06:12:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 060b85e9f54f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:36 +0000
Received: from AS9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:488::23)
 by AM4PR08MB2625.eurprd08.prod.outlook.com (2603:10a6:205:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Fri, 11 Mar
 2022 06:12:34 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::b) by AS9PR05CA0024.outlook.office365.com
 (2603:10a6:20b:488::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:32 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:30 +0000
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
X-Inumbo-ID: 444708df-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDvbp4DWU9mwuztP7cNd08kpIm//piVnKYKpsaKT7q8=;
 b=ptmRVisctFiB0GYfoxUw6QCjvksNPDZwlzYpffxwd/y2M+0LxK5wgcjsEvRTHP7ObbZOAksfGH12kcA+EQ9xbkQ5Te1NzmH0dZwYv2ejGHDGaHD6JomCM37fyTHmk+mRQNl2z7JA4raqcPmgFI2dA4rWkSv6NtMstqJr+T6ixG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e9c82cd63a216ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKHQZU6BAEOFCsnxBMCyKsL17PtI+Md3T+LB1G+doaikcmSsbXJ3eYoHokzbK0JWyFkQsmLBNRQIQXpZrD4tqd52zoitnILETlWkakfQVHJNPrJ25iz8EcqpDYCjak/sL9FCrrL93kl4W8IfHKSeyQoTV+8fa+zMgR66yEN2Cy+HatKSgG2xg4Ac11JGEkwdKhlVyl5bnIsZ8Fc/Wzmk4KHgVx9B5wg05XJWc270BgmLWL452iSUB3FsQQghvAYLZomB/wm76RnZyJTFnW5rRU6lg4SFZ66rdO9EzJimjCoYPNMgXkRXoePsu0yAH4qX0Szw1eDRgQDOax/SuG65UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDvbp4DWU9mwuztP7cNd08kpIm//piVnKYKpsaKT7q8=;
 b=dZ3iZHGSP4q7ttNnwAg4fE+gm6bcAkNIajYBh5FO6KpfIpNOvDACDpt2YZHPHHrfCg1Bnjh6hyjREuiDfgdPHKN/Vs/4lPaOSCF0iTHlHIte+8MZEkStgzaJT7SSSYuvaiPG/ZpjkrtIBnU8+qA7VuAB2K02cNMEjTxrWbnpqGqE0W708ZJchckzixd2Kj5B01KyBbnx+FG6Z8LwVR3eyoXFZZ4K0LZgXSrt1LIL8VZW40Hdr6bbcjIa/GRKeXGQ0iotAK/fnIZsnISjKZjvglHi0ZgMaUOVijRXuAExTlAlhG41OO1ppyVU1FWjPDFSlXUqQXN5Yez1MTI+c+e4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDvbp4DWU9mwuztP7cNd08kpIm//piVnKYKpsaKT7q8=;
 b=ptmRVisctFiB0GYfoxUw6QCjvksNPDZwlzYpffxwd/y2M+0LxK5wgcjsEvRTHP7ObbZOAksfGH12kcA+EQ9xbkQ5Te1NzmH0dZwYv2ejGHDGaHD6JomCM37fyTHmk+mRQNl2z7JA4raqcPmgFI2dA4rWkSv6NtMstqJr+T6ixG4=
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
Subject: [PATCH v1 08/13] xen/arm: destroy static shared memory when de-construct domain
Date: Fri, 11 Mar 2022 14:11:18 +0800
Message-ID: <20220311061123.1883189-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fb207d42-330f-4a15-2948-08da0326274a
X-MS-TrafficTypeDiagnostic:
	AM4PR08MB2625:EE_|DB5EUR03FT023:EE_|DBBPR08MB4679:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB46799708909C29630C5D8849F70C9@DBBPR08MB4679.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TGbSpeEIE5VRNA00n3Pu4vG9jZX/A0Aj/LJmSqmHF7pHstx8IddaWYs79hs6jm8UFFQMgGY+XUu4JLaPpbFg10Yz2THgCzmO86ox4WLVkoGV9KXKdn/t64WK3l4qwAUoGVX+XK6QXHu7ElPrt7/ifYY9Jj4IBArk2Et0FrEiFJ+aMqzFppO5619xZ2K1QZWHfYZM5ny92Qghw2MLQfivGN0kwUPzla4IUI5zEGjbAYZZXweyUF+bGlT8omeJ28OsHwYizA3brlBInlrTy5wA7a+/NLelYdLGpK9lmftUPIpklVyWoP3sHt21o2BqYzdvfoWZKperyComTGWEo013uqY0ovn6firrosSIXdeR7EctuatLiESvZNec+KqrCnbWI3UFhU0VfbvtQaJmL3U1UQl33SLdaUuBaRKwaSyt4+rqu16LCcltCtOPI75Qcy2TVk5fpJNqVR/MRERZmFvub133r+qX+gwploySiAu76jm3EwMUtu7yVfGcZONE39sofTvV/aLGixsy48ZFzdZ+jHtZSV4FUP1bIJ15UW/4UQGB8chrWDh22bE8q5HlchvXJ90vubAGVxsre5+qbRxHrX2UVb6hVbOerq1ZQ2Rt3VW1LqTFqqiw9CcNYWyYLXFXzeHuAMrLerfAqvH1McKFZGPn9hmv0BD9Y7LYHobn62/8p6ME/FbqMMPZKT1V0i8UST0Y2CTqTCjGz+gK5J9xMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(2906002)(54906003)(316002)(81166007)(40460700003)(356005)(83380400001)(7696005)(2616005)(1076003)(426003)(186003)(36756003)(336012)(26005)(82310400004)(508600001)(70206006)(4326008)(6666004)(70586007)(36860700001)(86362001)(47076005)(8676002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2625
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	529e58f3-8e77-4d09-657b-08da032621e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9g5BuyN90jesS9tXOrly9HRYy+u0rQqTurTVmzQMUtFiX3SWo3Fox9ENYo53N+LZAGiQO7j7LA1Uf/L8RdJS7r0SG0FXmzA8T+TNHR/OsPj/G1L/kDWagFi1Y6CoklY+yesF097smG3SHFsR0En+ff2+anLMUbzkZ6Kn25Atk1F2aTcGR+HbtFxv8jKdKejHD1c+/oWZVDnQ1OIDlrkfx2/32eGh+kjveJCDAknnXyqo6eONqo67P1/t/H+Xmc9Nde8VXNi87qH31zronrFGt77ttmxbyZnK3eBmYyGzuFRH6n8z2vaxnXs5vOCJGl5MJCFhObaSotx5qASTWBMmnVv8woKr249/BFDKkomUFXUKHueCXfcPKWf3uU0OvPokkvyXRmkEexwgBb0bj+fXrK547T4PraUb4xB24629Bne0wDhjyFbW0daXsXSp25vH9lt4mDZTepJlDZixdYsJU43ZH8fbCCLqBraSzy7dDA05LJXJLO4L1e+Q87ceYLTERMXDa1XQPZ9hyP0Pw7NghRW7RXwroOh5erJk63Wb+2fATAoBlAsMI+KFhRENaxobeWVMRcrMKncRF0xJu6DU9O/WYJM5rKEj5NOEwFYYSWxnzZ6PaF2lsYY93BGLo9dcyy7L5u2GT1C3icRo9ePYsNK+tBybN7Sfofo7lskocz5gCJbw3PuDMTUlkedEW21I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(83380400001)(107886003)(2616005)(70586007)(70206006)(6916009)(82310400004)(2906002)(81166007)(40460700003)(86362001)(47076005)(8676002)(6666004)(7696005)(316002)(336012)(26005)(186003)(426003)(1076003)(54906003)(36756003)(5660300002)(8936002)(508600001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:42.9158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb207d42-330f-4a15-2948-08da0326274a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4679

From: Penny Zheng <penny.zheng@arm.com>

This commit introduces a new helper destroy_domain_shm to destroy static
shared memory at domain de-construction.

This patch only considers the scenario where the owner domain is the
default dom_shared, for user-defined owner domain, it will be covered in
the following patches.

Since all domains are borrower domains, we could simply remove guest P2M
foreign mapping of statically shared memory region and drop the reference
added at guest_physmap_add_shm.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1ff1df5d3f..f0bfd67fe5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -34,6 +34,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -993,6 +994,48 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
     return ret;
 }
 
+#ifdef CONFIG_STATIC_SHM
+static int domain_destroy_shm(struct domain *d)
+{
+    int ret = 0;
+    unsigned long i = 0UL, j;
+
+    if ( d->arch.shm_mem == NULL )
+        return ret;
+    else
+    {
+        for ( ; i < d->arch.shm_mem->nr_banks; i++ )
+        {
+            unsigned long nr_gfns = PFN_DOWN(d->arch.shm_mem->bank[i].size);
+            gfn_t gfn = gaddr_to_gfn(d->arch.shm_mem->bank[i].start);
+
+            for ( j = 0; j < nr_gfns; j++ )
+            {
+                mfn_t mfn;
+
+                mfn = gfn_to_mfn(d, gfn_add(gfn, j));
+                if ( !mfn_valid(mfn) )
+                {
+                    dprintk(XENLOG_ERR,
+                            "Domain %pd page number %lx invalid.\n",
+                            d, gfn_x(gfn) + i);
+                    return -EINVAL;
+                }
+
+                ret = guest_physmap_remove_page(d, gfn_add(gfn, j), mfn, 0);
+                if ( ret )
+                    return ret;
+
+                /* Drop the reference. */
+                put_page(mfn_to_page(mfn));
+            }
+        }
+    }
+
+    return ret;
+}
+#endif
+
 /*
  * Record the current progress. Subsequent hypercall continuations will
  * logically restart work from this point.
@@ -1039,6 +1082,11 @@ int domain_relinquish_resources(struct domain *d)
          */
         domain_vpl011_deinit(d);
 
+#ifdef CONFIG_STATIC_SHM
+        ret = domain_destroy_shm(d);
+        if ( ret )
+            return ret;
+#endif
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
 #endif
-- 
2.25.1


