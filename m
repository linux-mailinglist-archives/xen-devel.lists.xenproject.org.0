Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6966275A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473645.734359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsOW-0007tc-UA; Mon, 09 Jan 2023 13:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473645.734359; Mon, 09 Jan 2023 13:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsOW-0007ro-R2; Mon, 09 Jan 2023 13:40:56 +0000
Received: by outflank-mailman (input) for mailman id 473645;
 Mon, 09 Jan 2023 13:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsOV-0007rg-5U
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:40:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c310292-9023-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:40:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:40:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:40:51 +0000
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
X-Inumbo-ID: 3c310292-9023-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQpHT/Nv3OY2ry+Y8Ale1DrdmBcnB0vBQjPagKUY7FTV9Cru5ZtKL2Zg2Rz7tNKu1qvQA+iaYDfNzxwaUL6FXlD2g7/6qysoNA7SfID0PgQu+lO936x8d9F8H7iucmN/IgxWQndhTd/2CxBF/GFaK/ZmKHmqHH2vWudnOj/lxX/dTHK9TxlGRqvZku9AUtk8xpiHTMoYinnbXrHPAbtkR9J6PA6gJ5U4cPU2RYhcGv66Zmw4I+vkEt8tZJ1t9fWcpXfL7/lgKVUZB/Y+AoB4Fo9cKaLIuwK4X0nwj18A+oizjVWbyDrYBV6ya+mxGxpl9p1PwpK6xhCdwcSuuOcHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUyDk05ke+Lt65CNEbe0BSHjvjrpHd5u/KRVoCvKhts=;
 b=lGP7OYN1LiCKVZ9k0E2X2/mb+8MceoRYqBkqiSeXrzHy3wbwoLV9E9kM+pBNZUEAneOojnq+FRJQCoA2BWjS0P3cSY94RfzXeZBS/uriivXaHg5rblEHqDArzITfNYsHHW1ntmwcjc1cLNWiQ9KGcj0rWDgidgbt7FBgUPSpAusCXLrOtOQiOI37IpMlscqJ0VMK5XXxWiYQeTncNFTsaEeqm/rKyZ/XA3sMB6OUkgzEXRWXKIulth38O1aeK5MqFdWSmPWoB+KvLRjdZogFNvqnFeIk/IgddG2+2/WePbIoyKqYuASBe7/OM/1WBUCDI/A3t7QPwChCuCIpktfKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUyDk05ke+Lt65CNEbe0BSHjvjrpHd5u/KRVoCvKhts=;
 b=Tm5yIrxHS+9jHq2W4Jw1DNVTJkJGuTJJ6jzLXMQAiJEkCFNkCG8SXYXfI87/uvgBMjRj9CCZ8WPzpA5ox4jVM/Qm3po/BJ48y7Y2pQelTwimAl9FRuuXvCTLVQP1w/15ZMkX0bWIkfgY36EJU3/rGW4zTVOGhWgzrW6KztdsO4o21mIf1Oe7Ett1TgI53tgsOVtRbteVkhXZ+v8msOns8wInO8U8blQ/rGk+04FPR7wB0U7WCv3yHVCQK2CMdTBglD+OL3wX8d5TT3vfy7KMr0xO5PYv2uPu2duJ4oWoeyI7a7LhEi7r/ZoFO03+/f2VAeOn5v6sb+m16XSq1lKsYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <032e81c2-ac86-638a-1611-43bc3bea6d0e@suse.com>
Date: Mon, 9 Jan 2023 14:40:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 3/5] x86/paging: move update_paging_modes() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
In-Reply-To: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: f09e2cb6-95b1-4992-45f2-08daf2471faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sdWw33qHo136i0GX5j/Fo0xqKIOXT/zIlUFUuz864Q2aKElOBFPZBz4NHScC2F60po4BLRovpDpjylu8UZbbZB6r7jCRQjU9xpwc1NFDJMFiYeoEsdVFZuU3n4vFwuQ2HuOP7kpNzHWWqUJFx793qAiUYb2O4ESV3ludPTv0M0L0zZBd7CYThDnaCs9qurWt7WgurTN9GMYFIQjL3ywqRdXAuQ2cDWLwiWtJd9Mzsor3rMYj7ynv33S0LJ+d18Z/bCuNTq0a/sNbclpUGWobvRP/SDcn9QunVs1F3mb9uB6lJjv31O2YdLwBdRhAhfkou05SRiglWdGZGW901blgctH0Q0QYCnzGY/A7sYjxeNy6gcVbPfvJo3R0ZVBJMC6lRIspHNsHB8mTdO1z1lFTRZxnAaW0R5PlGd4cB53F1zE9NX++JrcKwShi1kvAbBIlutpknYyI4Rzk7XnurB+q0PLGdvui9wt5HQ/beDZdyjmXDTbBE/YqDm+rtoNqU1qeVZ5x8sMtT2lPKZ2TEG9gGYYIe1EJoqwyZNCob+F6xkBS0cPReZ7FyiHl6Kk8dN4Mb7x2lkpXq4dn7xbUfvoAELepild6pKcCDFwgyab0RyTmkeaA7mWBODb5He16YUBavB2zQ3BiUSI+uvwWUv7itUl/lruUosQUgCs19AnLkPUN2u4JuA2XxydbpIfnQJImb6/FpS4wjrTGVAI8B6oWuil4xMVjrjp0aJOnOzt2Awc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(4326008)(316002)(66476007)(66946007)(8676002)(6916009)(66556008)(54906003)(15650500001)(2906002)(5660300002)(8936002)(41300700001)(86362001)(478600001)(83380400001)(31696002)(6486002)(6506007)(186003)(6512007)(38100700002)(26005)(2616005)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZHZ0pHSllWQVRhbkY4dWpLY3lSRmRXZEE2dUE3OVdXZkJzRG94eFprZ1VK?=
 =?utf-8?B?aXpLbGJ2MDhqTHdoVlorWHJoWjlCOGdybWV1QWJQMkcvbVhmT0NuOU85WkY5?=
 =?utf-8?B?OG0xd29FVERrVXFwY0dMSTBZbnAvakFFM1dyUmRUa2c1cnd1VEZvdm5vQXdI?=
 =?utf-8?B?ZHVuOUZWeThVV3EzWVk3bG00QUZnaGZYbmw1d1F0eTVKSVV5U2tIYk1ZNm5m?=
 =?utf-8?B?eWhIUUdVNHZqRVN1WU95YUJUbmQ2UEc3RHBjMGZFVXU0UmJBSGxUU0ZoOUwz?=
 =?utf-8?B?am45Zi9LY1lyY0pkUEErYWZ6TTNjaVYvcFZxQmNPRHRXb2N5TXdHdnlwTEdw?=
 =?utf-8?B?OHZKZWpzODhnMzVzbVFMK0F0QjU1TWZJVmc2dTRjNERWT2hHSnh2cm9TWnZy?=
 =?utf-8?B?MUk5NUE2NFZGRjRKSkthTHFuQ1JPb3h1MndYL3dVL1JabU1qM0tsWk9wL1ZF?=
 =?utf-8?B?L0RQTlJEaFRESmZRUitiNWI1QlBnRk9xQlhZeFFCRXE2SVZQc3RjZUp5eXJH?=
 =?utf-8?B?L1ZzWjNNbzU4V09relFjM2E0WDBnMG53MHJLa3JEWlFDQ3B3Z0pzUGpTb29n?=
 =?utf-8?B?UmhrcS9VVUtKWTA2SjFFdS96MStlaGdYbGxhMjdaSFJWcUxxV0J5akk0WmpW?=
 =?utf-8?B?cUQwRVlKUXdPM2lTa1I5NVh5MTg5WHFSRFppRVRZMUNnaUcweHNrSTZNekQy?=
 =?utf-8?B?anJnZXd1bEU5bzlxU21wcUgwVm9JN3ErVm85RC9LY3pNZktZVGhSS2RUS21Y?=
 =?utf-8?B?M0cxK0l3eXlGQUlHVEQvaXpYVkZnNDVXTGNtam41a3I5R2VjSXJYR0RwSmZH?=
 =?utf-8?B?eHV4ZHVxQ1JOVEE4ZDR0QTFEQnowR05qQm5yWVVLUTQ2bFZ1Z2dYZGdNT2NN?=
 =?utf-8?B?eWVaWVZOdWZZTDhuekZsQ012V3pSck50VGE3THRCZHhXd2hpYzBLUDUvWmZZ?=
 =?utf-8?B?Z2Z4eTI5akF2cytHR1pUaU0wdThyTHBLd1VjNG9sSzhETEtUWmJvVFFpNXdP?=
 =?utf-8?B?b1JiQjV4QVBRaC8xbnFxVTgrVTRqaTdNOGVDREd4dmMyNVJWL0VQVkpBWG1B?=
 =?utf-8?B?S0FCS0g0TVNCd2RNWHNaMDViUXVHWXBsQVNIZ051L1pmcGJSVmMycm9SRjVM?=
 =?utf-8?B?azdpaUZHVm9TK0lZOFB0anROWkh0NmVmMjN0amc4cDJtVEF1UDRLUHBHVXE2?=
 =?utf-8?B?Y2J5bmVSNEpHR1VrMC92TGUyQ0MvSmRwWDc4RVBLaXB5MU5yVWhGMVp6YW44?=
 =?utf-8?B?amxLWTlnR3FZTGpFTnZicHlPak1uMnNVSmgwQktIT3dOOTlkd3gzbmRGUUU0?=
 =?utf-8?B?SVJrbWV4VW5md1dUZG1zTStHenRqWDlObUdlUmVkTDVmZGtkb2dvRy90c01V?=
 =?utf-8?B?R2Jyd2VUUklBUzJTeGthbnBXTXFHSjEwYkd1clRoa3lrRGNHQTZCbkxsMjVC?=
 =?utf-8?B?cjhHYVhvUFRDLzQ2eWw1cVhpSXZLV3VuTktYVXdZMnNXYmRLbkN2b0MxZ01M?=
 =?utf-8?B?ZXA2RTJTY2k4YXBvS3FFZjYxUEN5SzVTZ3JPOUhoZGx0anZibXlBb0M2ZWIr?=
 =?utf-8?B?c2JXSHczT01XQ2tYOGxvK04wVFZobVZGcVNxdzlWeC9pU1NxTm5TTlVXY3k2?=
 =?utf-8?B?ZTJSdFJzNUZENXV2SGFsb3hya3VqOERwODBqWnFHd2wzMVZEUlJ6Q1NuUmNE?=
 =?utf-8?B?VlNQOTdkNUdza3Y0MUNYZlY4OVJVSGh2SEpvTnI2RmdkazBFOStJS3JsVCtO?=
 =?utf-8?B?M2VlbjJlYkkrdUhRcm5KRjBJNElIRzFPaWlDc0paTFd6bEhGWHpHUHp3blNE?=
 =?utf-8?B?bGJ5UG4vcS8rSHcweG40eWFaY2RJQVdqZzV5c2ZVdVByMlFBeWUvSWsveHN6?=
 =?utf-8?B?SG1aSlRmR3pLbjlVV1IxU1lBU0lLdkV2dHptSzYvSDlvNElsTUt2NXFOZkFF?=
 =?utf-8?B?VXpWM3htMHlzRkh1Q3JWZGFveWNkUW1vbnVWVGhneERIczNZVFh5dStCZHdB?=
 =?utf-8?B?TG5CcmRxZTNicmlST2dQOUZhOHNnbG91WnR5eENCSlFUaU1PWElBUE5XNU45?=
 =?utf-8?B?Mi9yTE5LenBZYzFNUDYrMnBYcTh5MGlvMmJRY3VpTEpnTGw4c1hGVm0zRW53?=
 =?utf-8?Q?XqDRkBkAkOyFyBat4RTGQVx4i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09e2cb6-95b1-4992-45f2-08daf2471faf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:40:51.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTgmkumJEz7iXBQOIbUDj5bHglMfbJ2w36hZK77H9b5qicC8w9rKmsMNeG6CLc/xecGtgpRE7g4YDHgyRmAquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

The hook isn't mode dependent, hence it's misplaced in struct
paging_mode. (Or alternatively I see no reason why the alloc_page() and
free_page() hooks don't also live there.) Move it to struct
paging_domain.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Undo rename (plural -> singular). Add a comment in shadow/none.c.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -235,6 +235,8 @@ struct paging_domain {
      * (used by p2m and log-dirty code for their tries) */
     struct page_info * (*alloc_page)(struct domain *d);
     void (*free_page)(struct domain *d, struct page_info *pg);
+
+    void (*update_paging_modes)(struct vcpu *v);
 };
 
 struct paging_vcpu {
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -140,7 +140,6 @@ struct paging_mode {
 #endif
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
-    void          (*update_paging_modes   )(struct vcpu *v);
     bool          (*flush_tlb             )(const unsigned long *vcpu_bitmap);
 
     unsigned int guest_levels;
@@ -316,7 +315,7 @@ static inline void paging_update_cr3(str
  * has changed, and when bringing up a VCPU for the first time. */
 static inline void paging_update_paging_modes(struct vcpu *v)
 {
-    paging_get_hostmode(v)->update_paging_modes(v);
+    v->domain->arch.paging.update_paging_modes(v);
 }
 
 #ifdef CONFIG_PV
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -443,6 +443,9 @@ static void hap_destroy_monitor_table(st
 /************************************************/
 /*          HAP DOMAIN LEVEL FUNCTIONS          */
 /************************************************/
+
+static void cf_check hap_update_paging_modes(struct vcpu *v);
+
 void hap_domain_init(struct domain *d)
 {
     static const struct log_dirty_ops hap_ops = {
@@ -453,6 +456,8 @@ void hap_domain_init(struct domain *d)
 
     /* Use HAP logdirty mechanism. */
     paging_log_dirty_init(d, &hap_ops);
+
+    d->arch.paging.update_paging_modes = hap_update_paging_modes;
 }
 
 /* return 0 for success, -errno for failure */
@@ -842,7 +847,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_real_mode,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_real_mode,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 1
 };
@@ -853,7 +857,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_2_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_2_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 2
 };
@@ -864,7 +867,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_3_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_3_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 3
 };
@@ -875,7 +877,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_4_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_4_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 4
 };
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -45,6 +45,8 @@ static int cf_check sh_enable_log_dirty(
 static int cf_check sh_disable_log_dirty(struct domain *);
 static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
+static void cf_check shadow_update_paging_modes(struct vcpu *);
+
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
 int shadow_domain_init(struct domain *d)
@@ -60,6 +62,8 @@ int shadow_domain_init(struct domain *d)
     /* Use shadow pagetables for log-dirty support */
     paging_log_dirty_init(d, &sh_ops);
 
+    d->arch.paging.update_paging_modes = shadow_update_paging_modes;
+
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     d->arch.paging.shadow.oos_active = 0;
 #endif
@@ -2516,7 +2520,12 @@ static void sh_update_paging_modes(struc
     v->arch.paging.mode->update_cr3(v, 0, false);
 }
 
-void cf_check shadow_update_paging_modes(struct vcpu *v)
+/*
+ * Update all the things that are derived from the guest's CR0/CR3/CR4.
+ * Called to initialize paging structures if the paging mode has changed,
+ * and when bringing up a VCPU for the first time.
+ */
+static void cf_check shadow_update_paging_modes(struct vcpu *v)
 {
     paging_lock(v->domain);
     sh_update_paging_modes(v);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4203,7 +4203,6 @@ const struct paging_mode sh_paging_mode
     .gva_to_gfn                    = sh_gva_to_gfn,
 #endif
     .update_cr3                    = sh_update_cr3,
-    .update_paging_modes           = shadow_update_paging_modes,
     .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
     .shadow.detach_old_tables      = sh_detach_old_tables,
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -18,8 +18,14 @@ static void cf_check _clean_dirty_bitmap
     ASSERT(is_pv_domain(d));
 }
 
+static void cf_check _update_paging_modes(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+
 int shadow_domain_init(struct domain *d)
 {
+    /* For HVM set up pointers for safety, then fail. */
     static const struct log_dirty_ops sh_none_ops = {
         .enable  = _enable_log_dirty,
         .disable = _disable_log_dirty,
@@ -27,6 +33,9 @@ int shadow_domain_init(struct domain *d)
     };
 
     paging_log_dirty_init(d, &sh_none_ops);
+
+    d->arch.paging.update_paging_modes = _update_paging_modes;
+
     return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
 }
 
@@ -57,11 +66,6 @@ static void cf_check _update_cr3(struct
     ASSERT_UNREACHABLE();
 }
 
-static void cf_check _update_paging_modes(struct vcpu *v)
-{
-    ASSERT_UNREACHABLE();
-}
-
 static const struct paging_mode sh_paging_none = {
     .page_fault                    = _page_fault,
     .invlpg                        = _invlpg,
@@ -69,7 +73,6 @@ static const struct paging_mode sh_pagin
     .gva_to_gfn                    = _gva_to_gfn,
 #endif
     .update_cr3                    = _update_cr3,
-    .update_paging_modes           = _update_paging_modes,
 };
 
 void shadow_vcpu_init(struct vcpu *v)
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -426,11 +426,6 @@ void cf_check sh_write_guest_entry(
 intpte_t cf_check sh_cmpxchg_guest_entry(
     struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn);
 
-/* Update all the things that are derived from the guest's CR0/CR3/CR4.
- * Called to initialize paging structures if the paging mode
- * has changed, and when bringing up a VCPU for the first time. */
-void cf_check shadow_update_paging_modes(struct vcpu *v);
-
 /* Unhook the non-Xen mappings in this top-level shadow mfn.
  * With user_only == 1, unhooks only the user-mode mappings. */
 void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);


