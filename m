Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BE403762
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181634.328913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuIA-0005DP-D1; Wed, 08 Sep 2021 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181634.328913; Wed, 08 Sep 2021 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuIA-00058c-7U; Wed, 08 Sep 2021 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 181634;
 Wed, 08 Sep 2021 09:54:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuI9-0001EI-4v
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:53 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c32e3227-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:33 +0000 (UTC)
Received: from AM7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:20b:100::13)
 by HE1PR0802MB2507.eurprd08.prod.outlook.com (2603:10a6:3:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 09:54:28 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::35) by AM7PR02CA0003.outlook.office365.com
 (2603:10a6:20b:100::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:26 +0000
Received: ("Tessian outbound 7a08471b1ef6:v105");
 Wed, 08 Sep 2021 09:54:26 +0000
Received: from 74c9ed8f84e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 308EF0D1-ED56-442B-A907-3A37F47D11CC.1; 
 Wed, 08 Sep 2021 09:54:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74c9ed8f84e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:20 +0000
Received: from PR0P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::16)
 by VI1PR0801MB1662.eurprd08.prod.outlook.com (2603:10a6:800:52::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 09:54:16 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::60) by PR0P264CA0172.outlook.office365.com
 (2603:10a6:100:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:17 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:16 +0000
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
X-Inumbo-ID: c32e3227-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZ922YnGKts8gghHRklqg+V1lm7yq6BNVhkDhoqkHMI=;
 b=oZaIAM+gZAQkg+BJPFVHM36wkQ/p/jcSkuM7oLy3d9SyhjNzPgoHCje0/gEfQQEixz0Ut0Kfhfvm+R2nIgSRDDT62rf08YcIkBuhueU0cPko15zhqOJPsyWRUa1E8+Ui0MHBp9G25VFtUDeMIa2bdzNsWhji6vf1QOeBy2MK3xM=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a3057876d07db5c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1UHluNxa+R6hIjroPCKQEv618n0gJrKd/ItShm0P+PdD4MeCghE9u90DATF9G2gLWmnoTObK+BvZasCqoIcqWSk6EAIbWYMm7OMCSSArlN+GsJGom6hNpxRrWMC+vBhlqvZYCYgk6GxKUN45tBhyrSOBQwJ4zjNCqcNtw0wZ3VUSbEMO48PpBKeijnZ+i/KQGR2Se7Mmj89SLADwfIuGGMan2JQTB2q/K4yRwJhA4yEyVPpXKliB7NiOrMWy43C5Gw9YU8QtyFPCd0V/Hs/SWxN2TPiwRYv87wqGYmQ0gX7piW8IYtifTmAIJx8Xa82I5A94dtqeEFtFH7hjP2PHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GZ922YnGKts8gghHRklqg+V1lm7yq6BNVhkDhoqkHMI=;
 b=MB0KTYSaheV22jOk2JpsTHfILbwu0HG4f+6q62WBzM0bkKdPsj1JXmPZAFaVJnw6Sq08NuYgJtCGPeCJbEy8aqv/xfzGCI6ehbCKGrFe43/l+UBTNzDqGCpQZHFh7Oi7EWK12oqlRoGmX8X7vtq349Hvenb7jXppLD5QKaCWTN0mBOIzX59uM0E6rm9d4bYEtACYZwVLZlEUhQwXF6OcltcomOOh6Glw5gz8mE/8atGoXQemSCGFpmrWpRekUuwOLF0vWKq0tKvPxjwTrBkN9KxrJaf1D1OG/XE7RGGfNcf2aoaPbGkdPG31k2S7nrZfa/2Jshv/Ohdg0c5hbpDc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZ922YnGKts8gghHRklqg+V1lm7yq6BNVhkDhoqkHMI=;
 b=oZaIAM+gZAQkg+BJPFVHM36wkQ/p/jcSkuM7oLy3d9SyhjNzPgoHCje0/gEfQQEixz0Ut0Kfhfvm+R2nIgSRDDT62rf08YcIkBuhueU0cPko15zhqOJPsyWRUa1E8+Ui0MHBp9G25VFtUDeMIa2bdzNsWhji6vf1QOeBy2MK3xM=
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
Subject: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new function assign_page
Date: Wed, 8 Sep 2021 09:52:46 +0000
Message-ID: <20210908095248.545981-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0467dcbc-9d1c-46db-730d-08d972aea527
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1662:|HE1PR0802MB2507:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB25073865A11DAF94B89B0693F7D49@HE1PR0802MB2507.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:288;OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uFgXCUUMY1VZxuDKCZ7RPJldeqgtMKzm8TK/lpz8Yu1v/Kb/+lgI6z81WLrkfDJTGjwAHrxgYNjIFlLgKynw6B9t7w/zjBRFFCxSd8LdnFhNPHKoO69gOIEpndt1w2GPYD5ri9F0+dxm0pR8O4nQrBY9n64RpWmYPvqee6dL0xy1IpjK+xcL/OFcaTE+1XxEHVQFAIr0JvQarhhtCSEPUDtRlGtn2G+2AutencUc7qnDkRIChKWlvKC+T90jQhHmP7SZ27qcvBCz7uCciNlyEjRy7bfs5mRbFoUCZNxVhvT1/NRfZdHE3jnR+illQZ41I+JthmZvDZweiyDDkOvoVr56zeo/u2rVP0wtvgLSL1Nn3dqRxO3yEN42jR5wxN6O+CKQJMxG0pKmu2YYF9F84YIXxPPmxmPgX8gw1aNTHqyKOnHzvkPz6/L/V/CZt/rNWj7L4WuYzsCD0aEEC+60RGcri6JtiKn7rQcDFPifq1DyyrVf0YXSaJKxeeNX+G3TBhGDZioWxulPwAj9GzZ7rivaMewFZFKVlmf8EtXY6o1fL9mYGmzLie0aO+PxU4ELgp6pQlUb0OfCkK3LL1ioo5HVgkL7xAIID8G1yFJi0GBimIM0GwKQcR1N8QqqKyfgTAVR1SgC7Hp3kTCNQByLzO7JtiqcpcWBOUvi+fVVhcxuLEfUh1ADYZpZnwJatqEGtx3Xt7Ix1TMLRDOuNAoFHMX/3jF5dIDbJmX2voWPy3k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(2906002)(1076003)(44832011)(82740400003)(356005)(2616005)(54906003)(83380400001)(26005)(81166007)(70206006)(82310400003)(8936002)(7696005)(5660300002)(70586007)(110136005)(4326008)(36860700001)(86362001)(47076005)(316002)(186003)(426003)(6666004)(336012)(36756003)(478600001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1662
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0a3a3f3c-2d03-4abb-3fa9-08d972ae9ef2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bfdLnWz4F/l5rOi4ojEeHFBdQMWWDHcVK2Kc+aKrLBzcWM5ooI9jOSCPRYVAn8VqdjKlkH0U45M6/yI+ERxZ5b6pwHV6XOdgXJD6tkcU3rbjClQ3MPltJTxJs2V0bLrO/4nPT9ec5L/NeHWz+DWPzrt8fDctZCaSlHG0sdkvdVZl3nzvQrkDjgti53lHwnUQpuFySeMpRlete10tn8YyAQ6dSKvZCttyZjyWPQfDqTZN3Lgraol3jVVfbxQna6eJIJ4tqMIY7/PYxR6rR8O50lPxs0eS/M6aMaBbp3JrrknuSN5oZAe4C1uj2jiCgs7LOVGYh5G+EysFhPha1I3AhHL24lEclbHbTuPU6f7/69xIh1miuTo0APE7R0qpvWeXLMg4/wHhYCFxlFsSgXo+aIlML0HEYRo8V4MCUPFH95ROMNA5wvo79NJmn+7DGxlVCwCvIqTHQj5dcU7l9b1ueoX2BYutD7qTE+rArBFh04I5b4zeI5JE4jQYVxsXhm64xcTESwBhLb2YhA3SSLANKyO9KcHvyx4gfUdOGAAOyqaQ13eApvIyTUcHFHG2sMSCiUWLp/ovI/piwXO55miBKuq+p7EzlV5Y6kjAGKqn285j5I/tCJepIkJVxq4v7Nc5WtFM+en5vsLT/81JJ3fyqsgb3lSavtwiAzHIzlGKJOr3ORSQFZc99FaLfDCaV1dxBOr3V8+sK9ihBkL1BtIncQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(316002)(47076005)(2616005)(63370400001)(478600001)(70586007)(26005)(54906003)(2906002)(110136005)(4326008)(36860700001)(1076003)(82740400003)(5660300002)(44832011)(107886003)(82310400003)(6666004)(36756003)(186003)(81166007)(83380400001)(86362001)(426003)(63350400001)(336012)(8936002)(7696005)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:26.9728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0467dcbc-9d1c-46db-730d-08d972aea527
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2507

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit re-define assign_pages for nr pages and
introduces a new helper assign_page for original page with a single order.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  6 +++---
 xen/common/page_alloc.c      | 21 +++++++++++++--------
 xen/include/xen/mm.h         |  6 ++++++
 5 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d7f9e04b28..7787cc8fca 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -568,7 +568,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ee61603a97..50f5f83023 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2358,7 +2358,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_pages(e, page, 1, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 74babb0bd7..9cef8790ff 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -728,8 +728,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
-            if ( assign_pages(d, page, exch.out.extent_order,
-                              MEMF_no_refcount) )
+            if ( assign_page(page, exch.out.extent_order, d,
+                             MEMF_no_refcount) )
             {
                 unsigned long dec_count;
                 bool_t drop_dom_ref;
@@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
      * cleared PGC_allocated.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
-        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
+        if ( assign_pages(d, page, 1, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ba7adc80db..bb19bb10ff 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2261,7 +2261,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 int assign_pages(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2281,7 +2281,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2290,18 +2290,18 @@ int assign_pages(
 
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
@@ -2313,10 +2313,10 @@ int assign_pages(
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
@@ -2331,6 +2331,11 @@ int assign_pages(
     return rc;
 }
 
+int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
+                unsigned int memflags)
+{
+    return assign_pages(d, pg, 1UL << order, memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
@@ -2373,7 +2378,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_page(pg, order, d, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8e8fb5a615..a74e93eba8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -133,8 +133,14 @@ void heap_init_late(void);
 
 int assign_pages(
     struct domain *d,
+    struct page_info *pg,
+    unsigned long nr,
+    unsigned int memflags);
+
+int assign_page(
     struct page_info *pg,
     unsigned int order,
+    struct domain *d,
     unsigned int memflags);
 
 /* Dump info to serial console */
-- 
2.25.1


