Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B754C505087
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307191.522502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPv-0002x3-W3; Mon, 18 Apr 2022 12:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307191.522502; Mon, 18 Apr 2022 12:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPv-0002ts-ST; Mon, 18 Apr 2022 12:23:43 +0000
Received: by outflank-mailman (input) for mailman id 307191;
 Mon, 18 Apr 2022 12:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQPt-0002c3-JV
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:23:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e10c57-bf12-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 14:23:40 +0200 (CEST)
Received: from DB6PR0601CA0043.eurprd06.prod.outlook.com (2603:10a6:4:17::29)
 by AM0PR08MB5474.eurprd08.prod.outlook.com (2603:10a6:208:187::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 12:23:38 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::14) by DB6PR0601CA0043.outlook.office365.com
 (2603:10a6:4:17::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:37 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 18 Apr 2022 12:23:37 +0000
Received: from a8fc1654a874.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C85D2999-8FFD-4078-A829-6B8863DA15D5.1; 
 Mon, 18 Apr 2022 12:23:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8fc1654a874.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:30 +0000
Received: from AS9PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:20b:465::29)
 by DBBPR08MB4458.eurprd08.prod.outlook.com (2603:10a6:10:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:16 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::ed) by AS9PR06CA0110.outlook.office365.com
 (2603:10a6:20b:465::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:15 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:11 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:04 +0000
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
X-Inumbo-ID: 60e10c57-bf12-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVQetJuWhfla6PNj0JS8SWxjHJNlo5AFHEjQX+4a0Lw=;
 b=lNkNZueafa1r82+6Wfv37bHAv6HTYX35lMDpf2fvhu1TK0W6ZrFyqUdm5+3qZTFVEAzvIX/hE91eGSYYpOk9Ysu8dNb0LqPYIEr8Sh07ECoIFxKj3QX5Q1Cn7YZCR9ewOYMajMVAuQpnagSdOkadDpDJC0kBSH1gq22wAffb1vk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c2d8033ba52ada8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kpa8zWvqRKZa7pQ4AECf3K18vcoNb5ntfSm+zpqbZL5hRDwuV+iZJzoXJm5Gnjocek/CiyyUDTRKoRlfJlfXV9dg8MHcVLpV1040D7jYR3rWvmJ2qdpiMOuDOdLIrMjMIZ2ZFOxCDQ8HAuxg3MWKdSWlOiRF6UOAuhVzAc5D9OK78R+eR7XYLLq4Ed+uHVP6XRKXwfvBx42h/NkhtlpMlPsCBUaHyVmMmvFjnyiwlaoodhs8h2nIS9DKnBVBLR8jHpW0SFpsWNaBri0BqhcxNytA7GO8lBsADu+c5KPMeyetZ+b7wRCX+ogjdBfBya0lXH+YChyyiqrsHeIo+/TVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVQetJuWhfla6PNj0JS8SWxjHJNlo5AFHEjQX+4a0Lw=;
 b=UNIRTC2XwI+u7M9pj22U/BWjCPgq4tLdCIf3lPSFagSLsyBHOvGx8jbOXBoqLupIYWwZvX5q79kr1XAJhtGg/vV5fvaVQa9qa7+Ml9Q4xH29ZVxJwefqQ71lESrjAogxD7+ZjZd0of1FdG++OcKhp6kTDlElyjd1kcdMwZQj21AJjIKIX54zo34YVAGSheKw0YQkOyBXFLQEGwh+7+TDRqDiek9dwRfo78HFFCnQr5SkPUgPMGUNqjeCs99sUakaSrrq9xIUcv8bcpiDRV/Cpb6AqY1fhqMo4xflTK0SrgDnmP60ri94o1Zb7Ug1SMD36geKtzQdgq5ddEpPv5bpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVQetJuWhfla6PNj0JS8SWxjHJNlo5AFHEjQX+4a0Lw=;
 b=lNkNZueafa1r82+6Wfv37bHAv6HTYX35lMDpf2fvhu1TK0W6ZrFyqUdm5+3qZTFVEAzvIX/hE91eGSYYpOk9Ysu8dNb0LqPYIEr8Sh07ECoIFxKj3QX5Q1Cn7YZCR9ewOYMajMVAuQpnagSdOkadDpDJC0kBSH1gq22wAffb1vk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v2 1/6] xen/arm: do not free reserved memory into heap
Date: Mon, 18 Apr 2022 20:22:46 +0800
Message-ID: <20220418122251.3583049-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 357b6f0c-3161-4241-ebea-08da213643b9
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB4458:EE_|DB5EUR03FT060:EE_|AM0PR08MB5474:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5474421C2DAA4BC26B9341FFF7F39@AM0PR08MB5474.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IxurwQ1CQavmlIrI8U3eRmgIvuhwToBh/0G4jEjR9rFbOv8mq62GHuKZuV8nsJ1vqidLGwv4qEoZSrgW+5JpQ2nnf+4lh33mfW+KQnSofOIeZZyoac2ubh4pf+6dPqlIFmprhJUvLHb/TBA7hiQMVM93kNFIfCWVNlFP+jp3s/pnhVrkBJxepgFSblIzpbpWkoudyxqVNvQSxhI2n0sYbKvG0o1pV7x5kFSNiFXhIzEL/5kAxt1k0RrBVDun+J713vS6qDr6j1XhC+td5iPMEjewyIfpj2XZnVK0M3czcBUrmgWRSErzWlKTa5q+tyfVoF1qZy3w6Eghqp3vKubE7vOPq9Z3fFghEwZV/o6oedCG5CUKU5PQ9yYQXxtkrp7VdUBcM1QBxEr/eSpCVMlDjlT9/YkzIUhFWQbGlZkn3iDcuf2WdRATogMf5fq3vtvspK6e9px29f8VogdqJBhenNxm7LCuyy/aYBt/hqGyS3SWUAXixVe6fdZ7e3e2ysJpxRexB2ftWds5eNZDL+L5eXXfZ/5ehXfdP4HzavAqYu0Td6tJbKCm4RjsJ4slz0o1WkvJWUrNNcOjPmJSBuMaaB1Jzb1xwPhwQF2sQmrb9vIoTaO39xA5xZOYQqCc/l1nsbd6qyqMI1ZrNcCLFRXN9afbKLzmSZSORzY0NV4wrh/dbqu+Upzcv3HuSF+d1Awpbx48tiasp0Rp2OfUxxQZWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(426003)(26005)(86362001)(36756003)(83380400001)(336012)(5660300002)(54906003)(356005)(70206006)(70586007)(186003)(6916009)(2906002)(6666004)(1076003)(2616005)(40460700003)(47076005)(7696005)(82310400005)(316002)(36860700001)(81166007)(4326008)(8676002)(8936002)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4458
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	231a9c3f-ecac-47a8-8f80-08da213636b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jHMtAGm645GbQ8H4TlrlHTr1bQSbmtCY5Qu+1iUhmPr6Xn13WL0wuBI1ijkb048Qtchq5nuLIbpj6wxYzedV8ZhrZR673m2v4VL/YiPo+oNz/RXSgK6Fcf6gWtyYowvICgoEmDic5Q0PXo67QyB3H4/JYYUhD2OhbDtEetlKDNcVA843fBe5kzbf05GUNBUH9PykkQaVdxWVqycMUg60zTQOLsSVshXKMqbehc9kR5V7ndJNz02XGjJ8KLPqAiMg9Wed6jtA7p94GJxGcNgnFbHqSTmyvwQTo08RzeW+38laA/pCp7SytzpiElKigDx7eAsO1FYP+W6GSnCqHmu6XHIcIleKVxD3oWwZq4o7YuXmEbOmeQsxLyjSeZE/3H/Az5D4G4PBeEOv0G7vOD13XeyWcAfYUOIWKof2GMwARdkAZ7YziW3veP+1zlLsIZZKe33Y+n/vR1C4noa2QOPSdH504ddwbAEEo/YUNym1zkEdqL15xqviB9Bm2ESJd3ZHW2yqLEyYZ0HGdrB3BX0nH9BfUUAKCZsWqTosgnY1+tyfUoJ/HBYvKX0y6YSDlT9Iu9VsXbuXDn7Zr+C6vkXdHyyt0DVfHgwdIvz7ndQM7R52sVHwsB5p9Qs1vzsu3DYVmkL10os6qfWgLr1mAh5/HvxyMADX5+zzm1jJ1UVaAY+5Dkk33ei2c2Cm6n6usYHS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(1076003)(82310400005)(7696005)(2906002)(26005)(6666004)(86362001)(8936002)(336012)(426003)(47076005)(508600001)(186003)(40460700003)(316002)(5660300002)(83380400001)(6916009)(81166007)(54906003)(36756003)(70586007)(70206006)(4326008)(36860700001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:37.4555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357b6f0c-3161-4241-ebea-08da213643b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5474

Pages as guest RAM for static domain, shall be reserved to this domain only.
So in case reserved pages being used for other purpose, users
shall not free them back to heap, even when last ref gets dropped.

free_staticmem_pages will be called by free_domheap_pages in runtime
for static domain freeing memory resource, so let's drop the __init
flag.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- new commit
---
 xen/common/page_alloc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..9a3e9c1328 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2488,7 +2488,13 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
+#ifdef CONFIG_STATIC_MEMORY
+        if ( pg->count_info & PGC_reserved )
+            /* Reserved page shall not go back to the heap. */
+            free_staticmem_pages(pg, 1 << order, scrub);
+        else
+#endif
+            free_heap_pages(pg, order, scrub);
     }
 
     if ( drop_dom_ref )
@@ -2636,7 +2642,7 @@ struct domain *get_pg_owner(domid_t domid)
 
 #ifdef CONFIG_STATIC_MEMORY
 /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
-void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                                  bool need_scrub)
 {
     mfn_t mfn = page_to_mfn(pg);
-- 
2.25.1


