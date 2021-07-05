Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE93BC183
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150517.278293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RFD-00034v-Jl; Mon, 05 Jul 2021 16:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150517.278293; Mon, 05 Jul 2021 16:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RFD-000332-Fq; Mon, 05 Jul 2021 16:14:51 +0000
Received: by outflank-mailman (input) for mailman id 150517;
 Mon, 05 Jul 2021 16:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RFB-00031a-GZ
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:14:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 154712db-250e-44bd-953f-956c64bec38b;
 Mon, 05 Jul 2021 16:14:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-27NWrKgeNzSqBjibl8V9Qg-1; Mon, 05 Jul 2021 18:14:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:14:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:14:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0029.eurprd01.prod.exchangelabs.com (2603:10a6:102::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Mon, 5 Jul 2021 16:14:45 +0000
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
X-Inumbo-ID: 154712db-250e-44bd-953f-956c64bec38b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RREdxymQaAXQtLLMkVVF928yZA3I7Wa987QcwLYQXxI=;
	b=YaEByNrtP+F49+6bfEmtqTrswurUj3/WRkt8+uAPRXzWoqu00rln66jOCVBtjuGUAC26aZ
	2C85nZ6fxcmmxQ4SSxI+/Y4XjUOjCM7MWmA+XJmv/Y50wUfxVBVDicay7op4tYYWmXvPHY
	OOO386xCQTQfvcAntu3EGRmrN6OefqI=
X-MC-Unique: 27NWrKgeNzSqBjibl8V9Qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frSWrQyG0ml5v4VpM9e6S0cXv+ZoMc9QO86XLXlzfFQimL/3X+bv5PCrbhzwNkvJz5nQx/Y4pezHAOlg17/wKsAHvXcsh8PZGYmEyrzyOw45xEKr7HH1QXeBTpj1oGqmwYHIoMqFSGBhm2U7+boLA3xxmhKvTuAYnn2rZLx78E5dm7Bio04XOyBAO27nh2J9MAh8r45NQH121GULhx5O33NNDFwaXIl/wSPdgnhdf1/17UYNMDmL/fGa1tJYoMcKUa7WKMlgrsqK//mUR94OVrrQ5Z0tNgj39HahPxX2XE0iSqkBF+w3efmlJV0JdouPmNBLogyv7f7fRZuXs51xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RREdxymQaAXQtLLMkVVF928yZA3I7Wa987QcwLYQXxI=;
 b=DCnJ0ceenuP5NLPNWQSvH8/MfqQlzvroRBlrcRjmYuZd/f+D40tVHSaoAhlABavaX6D7On2gV6ssY04iDZwz0MIJjBt8DhlnEOOmhxsCmiOyqkLsgB9fIy5jzgaxgdKlaqJi6rtiHBdBBFHymZka6KtncJ13Sl61Ykm20wsuLJOoOCrtYeCxa/OUozruFieODExV6i5IfTacR0VWSJAy3azRi6brH8Cg/fza3LKI0qdpSydRRO6JnwYh/xYd421uaX9vlrivfYP5UdRgb1lzNRm11Zh5BOFmegY/O5LbUjbAy9anmElcaPazoBc3fhOcHItQ1mvFxFXLcceig1XrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 15/16] x86/P2M: p2m.c is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <7f868820-20ac-4850-aec7-35bc843cab6e@suse.com>
Date: Mon, 5 Jul 2021 18:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a01401-d328-4fbe-fd14-08d93fd00163
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829950A1F31C74F4E51094AB31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YNulpkveIax6YbT8wNvgY2XNhbgiaBadZzFGMkNMtIdHK2wZlrVL3v6T/jFepeUbh/pnr0I9zjFSAFHxfDwakfrTb0Ijx7oM3M8HZRKY3JkgVNsogpDZLaVPmIhpa2wbTTfUO3kh6Kh6UlhRkgkRFINrPJ0Bh2eUwyf4RhykaGALDBcXwGPzI/F2z0Dw+bZjhoBBQwuSwEeob01ioV2NDUlFwGO6mi2mQiTdCPDPWycNh9X7Jc7lfhZTtnAaqSV18kEiVGeMtbedEPng7yrQxVVtpisT+oB0FqWRhfKczdpuc0KLKNUlfETXd6zg4kG0fxuEYwTXYCwIlvThgHuAWVOPsWewEvXmq7Zj4WI21MrKEY4uIwj12upiBNIn7R5Rb1qAi+zTHwiTl8UZ/ZBZ6lWFqt/yZggxFRts9hP45rxX3+m97l3m6YRqnAh12UqL8RJZeCdjRVFPS0aFE/GAf3LU1FEpV7qNqpV5AIfgoDlKtFgfMkJXnOkU6SH/r5UcZd79aFobmoz34jHbH67CuEICzhs355UyR/uI0BamPGw3otVayZYBKc/EEIQhf7FK7BftgAH3tE7JH0198sEyqL/2ILywgk0u3080uWIhoIZZxLfOd2jRin8321zfVDD5AGsNFc4N2NSt8yQ2S72w2CTsCauxZbrF6GpCKQ/HmaFu47QEhdUfGuuBWDzFU6fi0NXm/ACMR6mcBJudoi1yWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(316002)(83380400001)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE42UWRDcmZGcVdpQjFkUDRQeUltck1MY1JCWUhreGpnKzdoN3ZxUnpsU2lw?=
 =?utf-8?B?R0dUdTJPdjlKVXFEdnduaUpsbW9zM3lreForL0YzaWdITVV1RkhLY0UvSjFC?=
 =?utf-8?B?TUJvbWliRlR1bzBDTDh0aDZjMmJac2hVdWN2WGJTcmNZQU16L3BPRjc5V2xv?=
 =?utf-8?B?SFNNYzJEcDZtNGlnQmZMU1B6WE1iNjNvUjZPanByTzRjMThSTkI1MTdIWFVh?=
 =?utf-8?B?N3NEU2ZrTkY4SkZLYjQ5dkFTUnMrRnNFTkJZRkF3WXZpaU1RWlliQkttK1Fn?=
 =?utf-8?B?Sk5tbnNCbDhVMkM2WXU2am5aUkVaNlZzcXpYbmZLNlZ5Y2JNREZpdlNlaWVS?=
 =?utf-8?B?N3Y4UWg3aUExYXMwV1YzL1R4RUlJOU0za3Bjemd5eWpxaHRPTHBoM0ZKOS81?=
 =?utf-8?B?ZHQ0a1U2UTRtSlhGTnJsSU8xMEx6SElFWCtkUVl0Z1FzTDhuWFVPRmg3Y29Y?=
 =?utf-8?B?UG9wY3IwMis2aFI4cXRsWiswK01SR3p4NmlxTlNIenJ0WEpKR09mS0VabmpY?=
 =?utf-8?B?ZDlrNld0ZDNESnI5T3lqME94QTJRRm5RNnNmUzJNN3ZPZTdrOWorS21QMmZr?=
 =?utf-8?B?OVlvS2wybVlJcTBmY0pBelpEcW1XSVF3djN1bDhpdW9SZ09IdFZIWEVjMHU3?=
 =?utf-8?B?MmFxZWc2K1U0eWd6Q1NNZ3QxMTJubmI2UlQ1RVM0WXRDWmpEb1VJa0Y2N0NQ?=
 =?utf-8?B?Q25CNVJzdEExOVpjNmRidjNtU09md2Z4M0NiWWVTcEl3U1Q3akJPRFd1Ymtj?=
 =?utf-8?B?VkdsMDczdEROSXpxVjFWU2E3dUVuNkppWjRDVlRwTEZoRm93QUwzdWcxY1Yr?=
 =?utf-8?B?U2p3bGczcjVEYng2NmthdU5qMmNlTmJ4QVhTRDQ0VW5ObkFSWnBxbmJBaW9W?=
 =?utf-8?B?SDlNVU5XOHVreUxwdEJnRlZGelF5cDF4K3A3dnhWTW9zcnFjL21iOXRmYkdK?=
 =?utf-8?B?YzdhcDU2VzF6MlIvTlArUWNkTGlON0dGMmRpUkRHaitsR0w1RGUvc0R2bm1L?=
 =?utf-8?B?dmlRMUljODhxTWYzODFRNUI5SmxRenEvcEJuUlg2MERWb2l1T0QvdWtnRUlj?=
 =?utf-8?B?MUNYZUJWc0pDZjdQemVkYkl2TFdTVko0ZythLzc1U3pMYS9JTzJVMXY5VmIx?=
 =?utf-8?B?Q0g3QVUzM05iN3NrN1YwSXJQMzZiQ250OGtjMGhYVjVmWlVVNFdoaHBMV3hF?=
 =?utf-8?B?K2E3V1NBSjczMGJkWm9qWnN1MmJJa1BQbnZKUDROa2NBUUwrUXZpUXZ6NHFp?=
 =?utf-8?B?Q3NvOEczMkxCaG9NK2huQVJtWkdCTXhKVXhJUlVCaFpXWVM4WHFreUtNTVRs?=
 =?utf-8?B?Zk1sSUdWa0xWV3JpSjU5NkRZb1FqNXl6ekpZM2J5L0ZjdXcvUUhObGttUDZ3?=
 =?utf-8?B?Y053QVVtb1pNZUhHc2JRQktVQjRJUzVrYkUyZHRadHVrTTdpNGliT09lMTNu?=
 =?utf-8?B?cTQxay9GQ3JiaGtHNTh4WlNhRG9EVVB4aXNLRG1VQVhBc1lKVWtxYXZCWEtq?=
 =?utf-8?B?c2FKN3RhMFdSN3hrdEZWNFlNSVUxTmFmWXZqMmxzY1B6VjBSbTNsczlZQ3F4?=
 =?utf-8?B?T0JURnhsUjZrY3dMdmQxN1ZYN3ZSdnNQMDRNM0E4aXRkUTB0TmZRb0NUVklt?=
 =?utf-8?B?RWlHWjMzU0o3eUR1cHhQOGlDSEV0RlVJZFhicnhRdG9HdzhTRTl0eEZOL2NZ?=
 =?utf-8?B?V3BMQWttcmRPTGc2OGVVL3lNMnpQY3l4L1VOZi9IMGhpbXZQMk5LMWpDVEhT?=
 =?utf-8?Q?rl8jslQeyLfZJusfGX+80CSN79iv/Qugnscxw5c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a01401-d328-4fbe-fd14-08d93fd00163
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:14:45.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkKbQegMcQeKKfEvrkK5b2R9DVDKG10lRjqg0o91mK1JBtQv10fNrUdzc4/dcFFHSkA/jIugNnT850fEsYiQCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

This only requires moving p2m_percpu_rwlock elsewhere (ultimately I
think all P2M locking should go away as well when !HVM, but this looks
to require further code juggling). The two other unguarded functions are
already unneeded (by virtue of DCE) when !HVM.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-$(CONFIG_HVM) += nested.o
-obj-y += p2m.o
+obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -53,10 +53,6 @@ bool_t __initdata opt_hap_1gb = 1, __ini
 boolean_param("hap_1gb", opt_hap_1gb);
 boolean_param("hap_2mb", opt_hap_2mb);
 
-DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
-
-#ifdef CONFIG_HVM
-
 int p2m_init_logdirty(struct p2m_domain *p2m)
 {
     if ( p2m->logdirty_ranges )
@@ -258,8 +254,6 @@ void p2m_flush_hardware_cached_dirty(str
     }
 }
 
-#endif /* CONFIG_HVM */
-
 /*
  * Force a synchronous P2M TLB flush if a deferred flush is pending.
  *
@@ -286,8 +280,6 @@ void p2m_unlock_and_tlb_flush(struct p2m
         mm_write_unlock(&p2m->lock);
 }
 
-#ifdef CONFIG_HVM
-
 mfn_t p2m_get_gfn_type_access(struct p2m_domain *p2m, gfn_t gfn,
                               p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
                               unsigned int *page_order, bool_t locked)
@@ -2589,8 +2581,6 @@ int p2m_set_altp2m_view_visibility(struc
     return rc;
 }
 
-#endif /* CONFIG_HVM */
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -28,6 +28,8 @@
 #include "mm-locks.h"
 #include "p2m.h"
 
+DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
+
 /* Init the datastructures for later use by the p2m code */
 static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {


