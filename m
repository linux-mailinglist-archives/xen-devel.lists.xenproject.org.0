Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6493C9844
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156311.288485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmN-0003LH-9s; Thu, 15 Jul 2021 05:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156311.288485; Thu, 15 Jul 2021 05:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmN-0003He-5C; Thu, 15 Jul 2021 05:19:23 +0000
Received: by outflank-mailman (input) for mailman id 156311;
 Thu, 15 Jul 2021 05:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tmL-00009P-9c
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::60c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36fbf5ad-7c34-4f0d-a611-02f641bdabed;
 Thu, 15 Jul 2021 05:18:59 +0000 (UTC)
Received: from PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13)
 by AM0PR08MB3523.eurprd08.prod.outlook.com (2603:10a6:208:dd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:18:56 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:19e:cafe::28) by PR1P264CA0008.outlook.office365.com
 (2603:10a6:102:19e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:56 +0000
Received: ("Tessian outbound 664b93226e0b:v99");
 Thu, 15 Jul 2021 05:18:55 +0000
Received: from 2ed5fc456fa3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 625275A4-F104-4D74-8FED-976801E8D943.1; 
 Thu, 15 Jul 2021 05:18:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ed5fc456fa3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:49 +0000
Received: from DB9PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:1d9::21)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:18:45 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::31) by DB9PR02CA0016.outlook.office365.com
 (2603:10a6:10:1d9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:44 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:41 +0000
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
X-Inumbo-ID: 36fbf5ad-7c34-4f0d-a611-02f641bdabed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi+y5UgZCqyilrjAU2VTEHJyZTzOIipfdYPe5SW9Q2o=;
 b=zimSjpmNwalGChGa5H7BKuaMHCay1S0NHFZ0QYx6359sG2vOEJFMMHpgULTcFaMILnWNGQMp2K39Rlz5pivwPGIGT3bcuUwKhTxy7iNy8qcVtwiCRq1sV4WeYclPGpuEbMTpYcyXcoxCxKZHG9ICLluFC8OdlXcYDp2YChh0cQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: acccea191def6458
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScXa3iYXOxg0hGaKjq6m38yeKLEmzxFPPr3ONaT9sDNhKM4hQHmLJk9P49h9RhMjalobWDh1vusY7vPljpwQ3KkXlvWc8x4eq6b/ouOLe1xOcyj5rx3Y7LIQmfZrUqv6+5plkv9IPLEsMjvewOBVFYT//botu3K0V/CHTWYC+eCr2aRRxz4rUxXPck+uRKAJsXYR9zvdz3qTMlNNz2BPuO3K2OuG0RXDtY7wQH6NN5UDg1nziNUtAlJG9mw4izzlN0YjTypwn1KE0MhWzHYsEj277caONOUDEsaDHHKJWvHW1XxVRAPRGAfrFYKoiLh5RhGdoL2ZvjxCQqtC04YHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi+y5UgZCqyilrjAU2VTEHJyZTzOIipfdYPe5SW9Q2o=;
 b=oBL/fCg7aIrkznfHMkso/kuwp27g6bkbk8dA5JE3rLJvmstY4pm8WwpjquWCzGAMrOAcv3G6bpQMfWpCau46+tCDlKrDycExRuDVq7UY3BIqEvgy1m4ufJoEoa55lm4g1zlPxgcyDXWySu9KyymtPrlY7SJNeBXVEpiSM9Mc8TVUOHW9r8u28FWbkDzHRusdDoicdp0DDa0tVfQCENbWLXZhRYfT3KUvpz4jRhHvI2xAE6UAqHpWjCtJLkooTQm+j9zSeKhzaxlCNwYvCTupd+k4sAN/v+1mqgZ9Ke/Mtsup/hWwj86V+u+6y2FWabMDOhOMOS0E6b3ebAap7fzYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi+y5UgZCqyilrjAU2VTEHJyZTzOIipfdYPe5SW9Q2o=;
 b=zimSjpmNwalGChGa5H7BKuaMHCay1S0NHFZ0QYx6359sG2vOEJFMMHpgULTcFaMILnWNGQMp2K39Rlz5pivwPGIGT3bcuUwKhTxy7iNy8qcVtwiCRq1sV4WeYclPGpuEbMTpYcyXcoxCxKZHG9ICLluFC8OdlXcYDp2YChh0cQU=
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
Subject: [PATCH V3 07/10] xen: re-define assign_pages and introduce assign_page
Date: Thu, 15 Jul 2021 05:18:16 +0000
Message-ID: <20210715051819.3073628-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b727ed82-b5cf-4ddc-0ade-08d947500b78
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:|AM0PR08MB3523:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB35237665268CC52F219383F9F7129@AM0PR08MB3523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zZEAnNfMirG7xdA4DadQDMICrn+KBLatN2FvBpPrmjp5LepS4FB2VkyqzxGpNJlQnd8f1piGDtUQSId7qpFYrEnAmRthHNPY9SiYOeyvtIT7NIP3uN/TpKHFJf0pbTq3ZAU6O7Z8wj63a9BxXUCAESv42MbWH1zeWFDNy72KC4j7QX8KzFEGJfMEv1mvM/wKF4sr4DO1lubk965ON1pUJ/NbckJewQUWXRLoWXIZun2n6U8Fck0OhFj1zAQO5aWRJWkKGfH8Z3Wughxb9WZGJoguTz5vT37fGDuiBfRO2vXffJ6iM/Q0XjkwkiVBKmyiceGa0xm53eT61kmxDFRTJHt8zKXf/xX5oZBDLxnI6GAUHnK+GIy3fMSMUZV4gA2O5VOemZ+QG5qcbCnBUgN0KrnSMy827F3oUhQfbfIeph2rZw9kgTLJAkmwJxgaJ/A2eQ+Jmm8DEELkD/u1f8vyPJMoxgx/wRVkF/q7PGYxpB5fp4p37JgacVFJze6B+nSmcPmN/Q7iL0mHrI84GU24f/x3WjvyNHp2Tq8G+Tw3AqBYCIHBaJgX3Oijr5IKnlB21iRFAPLvpf1yomcgJE3udwrn9oeRNPw8QjWp/4yCTBGnjM+DTMMrHsZ9q8lwhg89ptT3K0NXIvxr+vuc/XhEVoXuZVcj3Ps4ctKCbJ06a+6X93h+R3UIeDyZSSOPF030ABX3+fqlh4LKzRcXexc2d8voT1jpemtbj8DNl4d/CRU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(376002)(46966006)(36840700001)(47076005)(2616005)(82740400003)(5660300002)(54906003)(82310400003)(2906002)(83380400001)(36756003)(70586007)(478600001)(7696005)(70206006)(36860700001)(86362001)(336012)(186003)(6666004)(8936002)(110136005)(44832011)(316002)(1076003)(81166007)(26005)(4326008)(8676002)(426003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95eae9fe-66d5-4e4f-d45b-08d9475004ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nk5XIr/UKudfI42foSjJ2rNTRwhmPkR/+0gqtjbwg7QILbNblvca2OcvI/FrlR6eCPRhmLePUyUU0es9G9OPePHYVrQh0PAa5GVESZ7vZ4P7wTPQrBLjC628Tz2azp3BMdJqKDdztQJS/8456aW8P22dQwJbuo7LNqI4DUDUUFfFIVErOMzw3JdA06uANpWYjeOR5cCXpoHs7QKZVBYN5vo3dkxs4NDRLTxtSppAm4EB0TELYe5s//OB4CF7d/qkbaUMs6kwFA/vZ/rYluMLA1WXk82KiSqLykEnOdAp5X0iG5BR7qZttBhlIZZWiIZea4ZlaNFIUJhR/d4C/yRV+vsMW3JqMpHzqRUiGfkeXBcH/gFpQGllKOiQXykQwCAfXZTsroJsQKH9DI8xQvmXMo2bnnZ55TcIlByNhe4g5CHjmUkViO+DJoKOCYA17jSkiMDlWZzFAhWC63GFUDujF3AznPCMjGk6VgwHa4dkqGj6EECDapj7VASKHSdvxgH79mlKCsj4Q5/p2SqnlrjT/BoEd3HQKyJmMrqqtea3T5biP9qEuUbhkYDhINw12RGlRT9WONBlChPNTQxlLKqAm58GtXAbTKBcCohIPLiCRAY/4p/3bhaKbFSEUcfS7lgWf/HmgO4m79IzMzFMDKfwCuKUrMX10ER9kQd+Um3bJ40ucG85TpM5KzPb3fm8C1qO5RayyKMiv58820MekyyiAA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(36840700001)(46966006)(2616005)(82740400003)(2906002)(26005)(316002)(8676002)(82310400003)(8936002)(336012)(110136005)(47076005)(426003)(44832011)(36860700001)(6666004)(70206006)(70586007)(4326008)(186003)(1076003)(86362001)(54906003)(478600001)(7696005)(83380400001)(81166007)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:56.3728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b727ed82-b5cf-4ddc-0ade-08d947500b78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3523

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit re-define assign_pages for nr pages and
assign_page for original page with a single order.

Backporting confusion could be helped by altering the order of assign_pages
parameters, such that the compiler would point out that adjustments at call
sites are needed.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- rename assign_pages_nr to assign_pages
- alter the order of assign_pages parameters
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  4 ++--
 xen/common/page_alloc.c      | 21 +++++++++++++--------
 xen/include/xen/mm.h         |  6 ++++++
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index af47615b22..476f8a2012 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -556,7 +556,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_page(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fab77ab9cc..10b23f7e09 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2342,7 +2342,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_page(e, page, 0, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index e07bd9a5ea..8c7c9c8fe4 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -728,7 +728,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
-            if ( assign_pages(d, page, exch.out.extent_order,
+            if ( assign_page(d, page, exch.out.extent_order,
                               MEMF_no_refcount) )
             {
                 unsigned long dec_count;
@@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
      * cleared PGC_allocated.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
-        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
+        if ( assign_page(d, page, 0, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 15edaca227..3414873679 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2283,8 +2283,8 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 
 int assign_pages(
     struct domain *d,
+    unsigned long nr,
     struct page_info *pg,
-    unsigned int order,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2304,7 +2304,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2313,18 +2313,18 @@ int assign_pages(
 
         ASSERT(!extra_pages ||
                ((memflags & MEMF_no_refcount) &&
-                extra_pages == 1u << order));
+                extra_pages == nr));
     }
 #endif
 
     if ( pg[0].count_info & PGC_extra )
     {
-        d->extra_pages += 1u << order;
+        d->extra_pages += nr;
         memflags &= ~MEMF_no_refcount;
     }
     else if ( !(memflags & MEMF_no_refcount) )
     {
-        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
+        unsigned int tot_pages = domain_tot_pages(d) + nr;
 
         if ( unlikely(tot_pages > d->max_pages) )
         {
@@ -2336,10 +2336,10 @@ int assign_pages(
     }
 
     if ( !(memflags & MEMF_no_refcount) &&
-         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
+         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
         get_knownalive_domain(d);
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < nr; i++ )
     {
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
@@ -2354,6 +2354,11 @@ int assign_pages(
     return rc;
 }
 
+int assign_page(struct domain *d, struct page_info *pg, unsigned int order,
+                unsigned int memflags)
+{
+    return assign_pages(d, (1UL << order), pg, memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
@@ -2396,7 +2401,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_page(d, pg, order, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8e8fb5a615..65ba1587ad 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -132,6 +132,12 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
 void heap_init_late(void);
 
 int assign_pages(
+    struct domain *d,
+    unsigned long nr,
+    struct page_info *pg,
+    unsigned int memflags);
+
+int assign_page(
     struct domain *d,
     struct page_info *pg,
     unsigned int order,
-- 
2.25.1


