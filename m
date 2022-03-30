Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E263E4EBE09
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296160.504092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUvk-0004Vm-DO; Wed, 30 Mar 2022 09:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296160.504092; Wed, 30 Mar 2022 09:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUvk-0004TM-85; Wed, 30 Mar 2022 09:47:56 +0000
Received: by outflank-mailman (input) for mailman id 296160;
 Wed, 30 Mar 2022 09:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUnK-0000Fm-0g
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:39:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe02::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c40da2-b00d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:39:13 +0200 (CEST)
Received: from AM5PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:203:2::14)
 by VE1PR08MB4798.eurprd08.prod.outlook.com (2603:10a6:802:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 09:39:05 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::ef) by AM5PR0701CA0052.outlook.office365.com
 (2603:10a6:203:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:39:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:39:05 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 30 Mar 2022 09:39:04 +0000
Received: from b2ebb19cadfa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F00165D-0D1F-4FC0-8E1D-47EA4D4446C9.1; 
 Wed, 30 Mar 2022 09:38:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2ebb19cadfa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:38:57 +0000
Received: from DB6PR0301CA0057.eurprd03.prod.outlook.com (2603:10a6:4:54::25)
 by PAXPR08MB7105.eurprd08.prod.outlook.com (2603:10a6:102:203::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 09:38:55 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::fa) by DB6PR0301CA0057.outlook.office365.com
 (2603:10a6:4:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:38:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:38:54 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:37:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 30
 Mar 2022 09:37:35 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:31 +0000
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
X-Inumbo-ID: 41c40da2-b00d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qVkQ1qo3iAE+FDwNj2htVkkE7SSyq5qLjILB2koE80=;
 b=DIeuDu54hK8jHZxQED0isbg08am9B0MZ36067ccRaINykRLLaXae1HRY1izt8OrKTEt9P1kZOMwUShWoKUGz9AqrXFa0ZwVe7DmvnwcjQgfca7CeXr/Gztz2wzJS3K5KVkG+kbHwzhNoiHAkHZcL2ZRYNPU3cBSQrvShgREhpTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e497e6f73c5547ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI5SacCHGDtkOJa5lwav/L2kfYGKAczzup1+Stp52WPMAamgRp13IUY+6eKUdFW24fRAyn4aOq74pEiqbZJ0EAhEtydlWxXuSgrJugVphfAKdOKwKql7z+kA49PUj8VfO0ixGwvZaACPLJlO3t6b++aq/hmcky14kf71WUlSY+DXSK/HVuveW2SFqSzziwulTlxp4bdkJ8w55D0houhq5hCxSIPs9kQjftL4rUmwWv0YfLN7X/e3e05BI4+Yh5PM4rH3JfTSbVuEObd+f331tWGfMH5LdSZ+tZT2SYkpBYpI7ozcR62hfXJXkPrrZW8eUCSR0Ql02QsfzaySkTdf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qVkQ1qo3iAE+FDwNj2htVkkE7SSyq5qLjILB2koE80=;
 b=TQDLUM0LjpUCo2mKoyL2Kgbmrt3i52/Ig28MiMU7dORGkJBACFq7J1A7smvX6Y1Sfgt9TrwCCywnuwQWQ8JmQBZxJli0L0r1RtS4Urk+PmaWXJRjWlpU1O5xfYngKB4QAEkBEHNjYEJXJfVmBOcQqb0zGf2mM9xNLz4A7bs2mxEPveBDmV0vRk8hgS26sFa49HmUr2Ph95UswBnwjxkZt7oZF6L2v1C9mXhgW87rMGJ4XwXyMJr/l33guoHq18YgsuGVkodjTDnv9rYYQgbEFPfAE8JZ0wdeReygO4TC8Bf1CnWw4lGeTxf5M6LNOgcQaPcpsFocw8zen2tkx+o2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qVkQ1qo3iAE+FDwNj2htVkkE7SSyq5qLjILB2koE80=;
 b=DIeuDu54hK8jHZxQED0isbg08am9B0MZ36067ccRaINykRLLaXae1HRY1izt8OrKTEt9P1kZOMwUShWoKUGz9AqrXFa0ZwVe7DmvnwcjQgfca7CeXr/Gztz2wzJS3K5KVkG+kbHwzhNoiHAkHZcL2ZRYNPU3cBSQrvShgREhpTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 4/5] xen/arm: retrieve reserved pages on populate_physmap
Date: Wed, 30 Mar 2022 17:36:16 +0800
Message-ID: <20220330093617.3870589-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330093617.3870589-1-Penny.Zheng@arm.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 59f1ddff-e998-4e35-4cd9-08da12312187
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7105:EE_|AM5EUR03FT014:EE_|VE1PR08MB4798:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB47984A2EA4AC0CF3B05C5527F71F9@VE1PR08MB4798.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9LqYhnf5FgAyHrloVvr8FMeiBCudOqk0YSNDP3/jh10KPp3M673R1vH2DvLT+3uQjI+sAMN7JrfoaiA/nSkVu2O7Nnj5+k9aKbnULBZXlxsPL1UFzoE+PeLy0aK+lI6HVGE8t3KQ7Ym3FW0mS71kz6ORJOvZhW481XiFPqOryhcVUpcDapBHAhV+aSoM7KE2hGOSQVyBvCTFwLmpcPy41HLJ/xrM70Ezr20yjrXxGjuxQ5tqjq/j6b9N0HV9xrXzMGNqsVCpEr+vIZzT75C1ge2oReXL3qDu0Wmk/RhFmb37YfIRec19HTwcXV2PUbSC5xrlm/ijnvgyWAAJyBgir5TYmqm37RQhNkrfpFyPRW8nEKsAZrAnZZu7HW03bJ7me1kmmG7hy2kC192x4SfSV5Y/IUIsteYH7/RFgJYlqgxVCes3hYDTDlCvWOWfj7pveMJAoJOoDs9NlwF2zhAhiHTvtpE5WFRT3Pd4R1Tt7yw4D1kHr3Ds4QwbFUTqcXAGpqOt3SboGxdvKs4nkZzgd4KKeRwQ7xyDHs+e4hYnNBDoky2f8oDRLPtAakND3aINCfTvX+3EqwATM6sMnOdkiMYL+G5gbOURCBUL2UU65k2aU2YiRn3rp5jR8YjU2QV3BGe1/uqnFYLACkDtBZr+I6qfgvOgZzzY+xUJuX6CmCJPhEHVtvMeoOVY3pwJtrpRHQzKp0uDZstJq2C0ki19mQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(40460700003)(8936002)(186003)(5660300002)(81166007)(82310400004)(356005)(26005)(508600001)(426003)(2616005)(336012)(1076003)(6666004)(6916009)(70586007)(8676002)(36860700001)(316002)(4326008)(83380400001)(54906003)(70206006)(47076005)(36756003)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7105
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4ecc0fb-6140-4a66-6129-08da12311b49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3rTR1IW0E9DHnKXmX8+Hd9qXy6VHv6vvhVmhwbHF3bvXqc/21xzLbmY6TyJT7/JJuVKRPdxYQJ9IFdonrfIXLzJrwteU2SnEowe31QyDouXLzeIn5/YsMjLR0M4nPTDAJu4jgJoaJVW00TojnAupvSH7XZNwpP++JX9N1s45vPwvYwJOiRl4egldtF39tv33RvrxLpyNxPlM6Ku1fY1vDQW4yCr3UXWG88XgDNJCSEZe+swN/TW+AcfpwdCiru0FvDYs5EnzW+5UoGR5rDcrKWnlxXHKSynLWFiuR86N5wGKMfMEZuWxu6j4LGUlsJJYRz24qBTmSXd98y6DY2XagpSytQ/o0cskno1oP+BGQAgOvLapKeVrbJjslmnBgbQK0qDmKeAHWK21AxydrPfczFBUKlpdHheMAjmTBzi5EAHvAESuFXEx3nu6cmz07WejtEa9eV/nWUXl3DJglvrpzoKBe/LYYxxG8AlgCeQXwFvleilOAgjm8AurxPd1Fzmv0StoEVpg/5nE7b9i54um/hpsf/KLTswUYRbX47SekuEkiWIdUpWzYK2v3+y1tHUbUd5JGa4j0dNCFREQgypmwmQ2vVy8Auze4iHZyum3wUE/VOwkiHySPCKXfjxcTgjBB4jMPR0pWIKkHrRCpkNHni4/DuqJ1xv/C5eJ/IlCK2qm33UgVVWlyOHHeKtHb8d2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(54906003)(426003)(2906002)(7696005)(6916009)(186003)(26005)(1076003)(508600001)(336012)(82310400004)(36860700001)(316002)(4326008)(70586007)(36756003)(6666004)(86362001)(8676002)(5660300002)(2616005)(83380400001)(70206006)(81166007)(40460700003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:39:05.0621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f1ddff-e998-4e35-4cd9-08da12312187
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4798

When domain on static allocation populates memory through populate_physmap,
other than allocating from heap, it shall allocate from resv_page_list to
make sure that all guest RAM are still restricted in statically configured
regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/memory.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 2afc3c6f10..2122ceeba7 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -249,6 +249,26 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
+#ifdef CONFIG_STATIC_MEMORY
+            else if ( is_domain_on_static_allocation(d) )
+            {
+                for ( j = 0; j < (1U << a->extent_order); j++ )
+                {
+                    page = page_list_remove_head(&d->resv_page_list);
+                    if ( unlikely(!page) )
+                    {
+                        gdprintk(XENLOG_INFO,
+                                 "Could not allocate guest page number %lx\n",
+                                 gfn_x(_gfn(gpfn)));
+                        goto out;
+                    }
+                    d->resv_pages--;
+
+                    if ( j == 0 )
+                        mfn = page_to_mfn(page);
+                }
+            }
+#endif
             else
             {
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
-- 
2.25.1


