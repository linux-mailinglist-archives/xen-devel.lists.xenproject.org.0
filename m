Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1D3F5B63
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170783.311752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5q-0003ba-SS; Tue, 24 Aug 2021 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170783.311752; Tue, 24 Aug 2021 09:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5q-0003Vz-O1; Tue, 24 Aug 2021 09:51:42 +0000
Received: by outflank-mailman (input) for mailman id 170783;
 Tue, 24 Aug 2021 09:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5o-0001jx-Io
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:40 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d972d328-04c0-11ec-a8bd-12813bfff9fa;
 Tue, 24 Aug 2021 09:51:27 +0000 (UTC)
Received: from AM6P191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::40)
 by AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:25 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::4b) by AM6P191CA0063.outlook.office365.com
 (2603:10a6:209:7f::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:25 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Tue, 24 Aug 2021 09:51:24 +0000
Received: from 2d60cc076f9f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCAB6915-C373-4258-A749-48723893509E.1; 
 Tue, 24 Aug 2021 09:51:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d60cc076f9f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:18 +0000
Received: from DU2PR04CA0315.eurprd04.prod.outlook.com (2603:10a6:10:2b5::20)
 by VE1PR08MB5743.eurprd08.prod.outlook.com (2603:10a6:800:1b2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:17 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::3f) by DU2PR04CA0315.outlook.office365.com
 (2603:10a6:10:2b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 24
 Aug 2021 09:51:16 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:15 +0000
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
X-Inumbo-ID: d972d328-04c0-11ec-a8bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJALBkaGXtysRE/87767gpew+VdKasYR1FGSjePRRnw=;
 b=WTpj40YU/+KkiwTkxDcvgROVsnVptdQ07I2CihhfdBzbGmvU1pDMVBpBDU6WmZoQ4pOK+R1nlK0545Nw7whX3JWGUEMriTMWn8rKaVqEzEVB8kl4pZvCgqOfofMsJ+TKMENntjyget4lFk867oEFcIQ14NBdyq4imXSvzxuN5w8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15ab006417afe7aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSu4DArNGnjLz665LvGmlp4ThA5V697BWwc8RWdxDY1XJJ5rfsaRt7CBzH0G22CYc7bUZeLRCZEYpIf1rDPDY2nfRar/gWefmbFJPY+vh2L7lF1LAdp0rFUrHLGl8RAe+M9WOs5TdluZoK2oTQ/RH2oA5iWyRqqg3loYhH5LsnIJ28cI3W3phD3y/NXM/GIw7yf0CzlxJE1Lxtm3hmpR373qRln9RiPOtpHVol2M3HSeTL1SRjTolbGh8ZTvUOVvQczdt5b4AD2Mmq3QE1pAMCfFNf/wFxMzpV+F66Og1ODKoCaBC1O0d3BfRExaA5C7fSgsDoSjAhy/iQshC8DNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJALBkaGXtysRE/87767gpew+VdKasYR1FGSjePRRnw=;
 b=ZdO/EkqaQPIrPgQ+4INlaJ/re8NN8qgjMr/c4ZX1QnpfpX/s64L3I2prAgAx99LRLPvEcVc4vG6lPlWfKbLdduzCaoB7f7KTK3qdWAvorpT29ADCzxWjtz0gKHtdGWYurWX02NUBPcWyphNyCGAZmDRgEiYyxmFbTLXkX+rv/ou8xKn5ybJGJDqL3rpiux6TDESvrDlhNjuhX7mBKk5LuJLnQr9G1+5khppg5HqDjg4ROIGZAbnr0w2DJkG47RuBykvN2rqb76r6Abt8cDV8wMCIGBMbUFofhcAJ7MgBW50PywIqbPE/YjrEpjeorYGH4wgD2tXqOzgUgQPm3NUZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJALBkaGXtysRE/87767gpew+VdKasYR1FGSjePRRnw=;
 b=WTpj40YU/+KkiwTkxDcvgROVsnVptdQ07I2CihhfdBzbGmvU1pDMVBpBDU6WmZoQ4pOK+R1nlK0545Nw7whX3JWGUEMriTMWn8rKaVqEzEVB8kl4pZvCgqOfofMsJ+TKMENntjyget4lFk867oEFcIQ14NBdyq4imXSvzxuN5w8=
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
Subject: [PATCH v5 5/7] xen: re-define assign_pages and introduce assign_page
Date: Tue, 24 Aug 2021 09:50:43 +0000
Message-ID: <20210824095045.2281500-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73b428b6-1498-405c-a295-08d966e4bc87
X-MS-TrafficTypeDiagnostic: VE1PR08MB5743:|AS8PR08MB6295:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6295EFF65F5D5BBB99ABFD68F7C59@AS8PR08MB6295.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:288;OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G42+jB7tdPmCqQ9/iz9+hRIFMf004j/j++uru/RSXg6KypYyUrZ41eojCCPCvaTJWdXqejFveCRV8+V7sIXyzKkqt5ec/i3EvYeTNl2xDQLkbSVNlG+DMBYtmStkM9FXpdDQ4EzaoY3YOAYhT+ZQF4+y+VWPymCTN3yAFq4XPGsefdrZD8A/QQEpo1JC6EHJ5l6z50XPojtTvw4KJFMgz6NfVuZv/w+Ryc825iHanbhUEy+ImPQC/61O37wtQRo9M+EfA2svSpMNkJV8LtbtU8uYgDqV4YCQ54OLDLY1+vI1rLPjayeneuXMkNqyizzmtm5mGU2h+lspq9fyQg7mUw3rfyyQ/x8Z2dKc+99vVXRgVtKNzN3fFDa+cGIkJoYLyGk/qfCxiTmtkxEI2+mOzM9TPujBQzevPIigH6OozYid2N8hxl5RtzXJY0lgIBwywx59OWAWSZTRHseRRHkFPZZQaXmbLK62Y/dlBUy3eCs9jK7btmgePD1mXVJ5+XhPPuDXqYE6ha8gW53KS40NGQK0TL9MvVsZ8d6nx9PoHYI99h7gvMyF8oMR0dpbgTe0dybm/QWjMCDYXJlyIVRdKIEfJU8RtCTYjl7rfhvPusOJ1jMauZ1I26Ph0KgI0DtBVvOYmLdZ9wPrg1Ug6DkwPamFE7D5IvuB0tSPKLEQMOPBXXshC3tIpz9x2BzK/yMvj/MgqNmX+EVFiLwbPzajUHJrr37g41r9e845FRG6zEk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(70206006)(70586007)(26005)(426003)(6666004)(186003)(5660300002)(478600001)(336012)(47076005)(83380400001)(82310400003)(36860700001)(8676002)(82740400003)(36756003)(356005)(2906002)(316002)(4326008)(8936002)(86362001)(7696005)(1076003)(110136005)(54906003)(81166007)(2616005)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5743
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ca43312-6b8b-4eca-d05a-08d966e4b811
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OHN6+9rk2RgzVfOnP9xVzyLSUBV9wBdDGneZaLjw8TCxYJu19fXfGYuvRc220JogfUkArzClxUpM7jhgwQF/HhjdVzFPPOA2id3pqISRe5fUi/I/pNK+7YOniwJ7Mtny0M3pBVd+85GSqslg7pTHYh/beCLSsNzmOOBy6e9ryBq2fuTivOuDiHovp+DiN5u6pLbWVdc6sZJ6TsnmZbNSmboZ50FE+pNCR/0x4x3NzM32QY6kEEO/awYa+I3V0uN5GDUt5+a4THkCFLMw70irpJgfAx3ZOZ8PTF21gNROPV9NVBMPPlnFo5Qy7Rn3ONoFLmQ7j8ZfxBHkMTcr26Q+Y0bb4CwMPVt5wADi19c5fqoOwruCojBa8kSFg0iD8kEGXU6WIINch4JGgwIMHH4V8q+YfOzBVDISTp1GVO/xc/XjOJpFEG+Ea8hXm8R/sn6KAOQbDTyc+3lYL6sppcR3xGGkjX0aF6r+Ih+1DFOgGH05ZDCSjLl1EDyfBQGBC0dGxvMdJ0gMnBiPbSvfVBpFwNwmG4Tsb9B+lUP4MMUd0+nw9PcXl9edwDub9H6Bzz9ZmI3MQtJWPedkr0VvLGJcCTPd9m8Kna6qmQwVgkigWRlAv7FgJJ+HLjWX5xAYBre/fgTluwnV3jTaY2yheWy/fVKQBhA5m4c/hwz+6HYxUn7dfgXqLlCG3ZYCjiQQ783fcgcoDIVqmZKWMUmy48HPCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(47076005)(36860700001)(316002)(7696005)(36756003)(110136005)(70206006)(4326008)(70586007)(2616005)(186003)(82310400003)(1076003)(54906003)(8676002)(81166007)(26005)(8936002)(6666004)(86362001)(44832011)(5660300002)(478600001)(336012)(82740400003)(83380400001)(426003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:25.0128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b428b6-1498-405c-a295-08d966e4bc87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit re-define assign_pages for nr pages and
assign_page for original page with a single order.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5 change:
- Having both functions assign_pages/assign_page with similar parameter
arrangement
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  4 ++--
 xen/common/page_alloc.c      | 21 +++++++++++++--------
 xen/include/xen/mm.h         |  6 ++++++
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d5a1a6a4e2..ebbafe48f3 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -557,7 +557,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fab77ab9cc..1e138201a5 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2342,7 +2342,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_pages(e, page, 1, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index e07bd9a5ea..e22dad2c37 100644
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
+        if ( assign_pages(d, page, 1, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2b4591bc56..05c9834dc2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2260,7 +2260,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 int assign_pages(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2280,7 +2280,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2289,18 +2289,18 @@ int assign_pages(
 
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
@@ -2312,10 +2312,10 @@ int assign_pages(
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
@@ -2330,6 +2330,11 @@ int assign_pages(
     return rc;
 }
 
+int assign_page(struct domain *d, struct page_info *pg, unsigned int order,
+                unsigned int memflags)
+{
+    return assign_pages(d, pg, 1UL << order, memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
@@ -2372,7 +2377,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_page(d, pg, order, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8e8fb5a615..f243ff88d7 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -132,6 +132,12 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
 void heap_init_late(void);
 
 int assign_pages(
+    struct domain *d,
+    struct page_info *pg,
+    unsigned long nr,
+    unsigned int memflags);
+
+int assign_page(
     struct domain *d,
     struct page_info *pg,
     unsigned int order,
-- 
2.25.1


