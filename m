Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D256B3B4457
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147219.271223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlmz-0004vn-RB; Fri, 25 Jun 2021 13:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147219.271223; Fri, 25 Jun 2021 13:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlmz-0004tv-NC; Fri, 25 Jun 2021 13:22:33 +0000
Received: by outflank-mailman (input) for mailman id 147219;
 Fri, 25 Jun 2021 13:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlmx-0004tF-Tp
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:22:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 407cb74d-86c4-4300-b14c-b5c7ff87737d;
 Fri, 25 Jun 2021 13:22:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-_vRuFGULO0ClOZzw-YVGgA-2; Fri, 25 Jun 2021 15:22:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:22:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:22:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0092.eurprd05.prod.outlook.com (2603:10a6:208:136::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 13:22:24 +0000
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
X-Inumbo-ID: 407cb74d-86c4-4300-b14c-b5c7ff87737d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpvgoXH+ELyJQft9Bj0N8UohKEfOlbayQ9hVqUJa1lY=;
	b=YV+4HC5Av4l5R4BnC7lEcaNRXxty2vO7BosBdswMZqj9YbqV3anhENz6jZV0gSsptfCqnz
	G2yRG/bgMjqsycapLdaGtpVTwdmAWweqJZQGGHZgxoN1s6PWKa6INQDx9qtYieHq2cMbY/
	vwbyt7JGj0P254BlXfb6tpPTpxd0gXw=
X-MC-Unique: _vRuFGULO0ClOZzw-YVGgA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZWde4G1fSO9AiuyLld0MuKlKY//Aj1VwyXj0w44BOTmqGeCvicKQ7idCFXXh5STYYNYKcnjxx0f8D6R2y7xdtzDXu3iwZW8X6qwKd7V9BlvduHN/xaRPlyQJtiRFqnfFFlf06FMeyRttvCV9GlHrs9C1LWYmNzrwz/raBcfx7YCVFsnx0XKmG7XepVjohHa3Fcjh6OcP3uqen0wbIAknri4LGOELdiWqfdHcxYiYIxCg46rtECNmpqmcLLlnCbVOCQSWGl0nl8V6jdLmBISCjyp7O8riINByLgzyPcbCsnIOTU4E4ElKlm/eO6PRlD9P7vR5q/9p0xDwyaDjdzKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpvgoXH+ELyJQft9Bj0N8UohKEfOlbayQ9hVqUJa1lY=;
 b=bmq/b7RBQdDh/lkJq+IKtGIIebHfb//vMXuBHMh2YNhVEYuzs/YbpQjW4J4OgttP7bbVH4bB9jXwZWi4sJgA6pUnKS3IPfLEiDMxKmBJbNpNOZibfzxr7K1tBBkpxOCPhjt/FIReen2/4Y3taSyicMuI4ggYo0cHo/7dEavual7xLPzorQa+WiRFofuV/8chND1tPUmne4w7coWqoHdhF8qHnk8piiIviCWrAzpqPJjhZNRy9I14L8FanCS2ZptigcBJE/gZqyKqqfn39H9d8PaaDpGxJyxxcvBWXZf0f0js1+H//DqTPILNOf36DygLwx4CQN0PWg97JMixUCwQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 10/12] x86/mm: update log-dirty bitmap when manipulating P2M
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <ec2af09e-d69f-3e4f-f913-56d7ec0492e6@suse.com>
Date: Fri, 25 Jun 2021 15:22:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR05CA0092.eurprd05.prod.outlook.com
 (2603:10a6:208:136::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 448d6dd8-472f-43ed-4d41-08d937dc45d8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33904E76808175A66327888EB3069@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9XXUlu3bSNTc01rvViICxPCky6cT+R8bNZWQHxLLSmKQn8VUy+Bo7e00C4n0Collskbwce+iQ9gfqYCkrWJIqM+QGQ413HZyUJpo7DGE3LHsTxSHZ2WvAIa4mRL5hM3hyBTnkdT5+5uafLcm1qdixoUDL/5Q+BjTPQTo2uuvZdYCZMELun3gmCdNHFpuB9c2OOnJBjPLLX5UDWSDBc13UNt60z5KWGVp0qZyuKLjVlpEfKaSo//PCFT1p1aeLNIrOTtgkFDcEOKrbJNXHNJJ5/d8hErMzfaO4bLgxzGnCagQJuuRoexfyyTeYrL+u+d74oCuR1vV0SGcum6BBo1B8jOz1uLFLiNkqvrTxophNnJicr7DvosuwN8Giu06C+wv7gTf9NPXkzvbE7G8dhnOaDrt20ApOyhjkSBwoH65n4JTqBAPHNTgWlrSqY6lbbnIJ1H7wgiN2swuVhgng7PFny4PTW9cPaBq2UCF/S5LW4C3DHcFxlrRMh4u7qy75zmE+j5Iva2nvEY+ayh6DniXYVw9MhhHhnc5bAy6msFDxtHECrXWe91oXtiAiiPnEvCz9jE0KD9gwbpGWC6Hzfrd0JFM187usSHja9/G2y4d6Jgmnjo+vgCaBneau4TSKpLnomVN4t2+0PgL55FLynvfjHNGSAr9pEX2JK/kv/kXOTZ5VUFyrqTQD9zRaMu97WCvI8j0Bf1aXpee0driOAXEfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(16526019)(36756003)(83380400001)(26005)(4326008)(15650500001)(186003)(31686004)(8936002)(478600001)(54906003)(86362001)(2906002)(66946007)(38100700002)(16576012)(956004)(6486002)(8676002)(5660300002)(6916009)(66556008)(66476007)(31696002)(316002)(2616005)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhKdFBHa0JpdktPaTBXWGthZzhHK29mZ3V5RDlXZW12WWtWSTRhRzgvV1hG?=
 =?utf-8?B?azlRa3BIL21zeHg3Y0h1ZHFXUmNGVEhGanJjYnozRG1wUEc1SXNHU01EMDZV?=
 =?utf-8?B?VEtUSzZxODE5SUtTRDZFeHlZUWpOekh5Yjlad0JzV2p4ZzhPeDRUQUhZb05N?=
 =?utf-8?B?b0FzM29DU2x2cFhJcHNGZUtXSmU4anorUEZrMmJEc1BkVGQ4elA2T2Eveno3?=
 =?utf-8?B?Wlh4T0o2UzZiR1VVZVd5NUpzeXNzU2FMS3RlN3JORFNZTkxidFRKb0pNcEFj?=
 =?utf-8?B?TGthcDdPZksvN0E2ZlNDbTk3VUdYeVNsanRyZTRjczJKSWc2dkh6ZWlKSlY2?=
 =?utf-8?B?cHZISzNRY0hQblJpWnZmTzhEbDcwOElOMUljQmJSZzJHL3hiR2JGUE42ZkJI?=
 =?utf-8?B?QVAwTnJWL2lxS0dzNlhXaEM2dlNyK2NmTnBwbkJ0cVRZeHVFMjFKQkw0MW5n?=
 =?utf-8?B?YnZ2RkhNVXAweU9TUVk1THdTeTFkVFR5dG5acHlCSU9BMUk5RVpYd1pLVWNU?=
 =?utf-8?B?NTFLM0FydWEvcE0vRU00RlpRNFhQSGs0RmIzT3ZKK1ozZXJBR29HajBUbHVy?=
 =?utf-8?B?bVNaVXFab2hBRWhRTVRNaTRIUHBqa1NrL1hXMGhqUVNtSTlhNENqeG4zVGZy?=
 =?utf-8?B?SWg4TmZOMityS2MwK24zYmttTHZBRnZYK2hJSVRJcm1kbWlFOFFPbnp2bGVy?=
 =?utf-8?B?YkpGNkRyTElTUDRhRGIwZ1AxU0J2bmhSNWpuaGt4YkVBakJCVEI0T21aR1Bs?=
 =?utf-8?B?NGpYdCtlRmsxOElwMFVFN2J3M2V6YmhiUmdsQ0tyYWFqYTQxc3ZtREJWWFJW?=
 =?utf-8?B?YUpHTnI4bUQvL3haOFA2VFFjS2IwanZDa2VSV1FuWWowTUhCNG15TGNaWlJz?=
 =?utf-8?B?ejB0RVVEMnlPeTVlTGRMSVBhcG5iT0V4Ly95QnVxRExXUGdwVDlmb0djNlFV?=
 =?utf-8?B?WnVuUkFoNVI5dVBnc2trNkswRStFc0V1N3Nmbml2em5MZkpOdStSZmNJUW1C?=
 =?utf-8?B?M3Y2NlFZK0s2bFJFTVVhZkMvTVI3MHVxVFBNOXpMdWxDamFuOTdQVkl2V3p0?=
 =?utf-8?B?OTBKd3dXY1cyLzIrazZBOXNZYXpBTU1BRzBxaTlSenZJMFNmamtGbnBkTFJ0?=
 =?utf-8?B?b1MwZk1tOEFFaENNRnhLZVpMSXVSZnFKVFlyMEFjNllQVisyNDRIZlJvM1NE?=
 =?utf-8?B?ZFRsdXN5eGFNRXoxZ003cXhjdzM3ejlCN1lKK0VmZ2pTNkF6cHRKaFd4NzlJ?=
 =?utf-8?B?TnpTa2pjcW9SSkthQ0k3VHVZRWJCbTB0dko1MzJlcVVzNU9scEd2dG1mL3hu?=
 =?utf-8?B?TGp1b0F1LzczWXFBcGdKNnVrcVR2VXlVR0t3KzM0N2JRdlZZN1VndkozQ0pu?=
 =?utf-8?B?emZYQ1d1dVJQMzdwZjdZZFQrbEtXakltWTU0b0NCbXE5ODZjK3NzeXFrQUVQ?=
 =?utf-8?B?aDY0ajJ5ZmVvVVY4SXQ3QnBmcms0R0FvMU9oZytNbUI3QWVQS2dYWFE3OHZ6?=
 =?utf-8?B?dWZMMkdaZUFVOTJObURtS3lYWDE1blFXMDZqVDF2alg5c3JKVXJBYng3bHBt?=
 =?utf-8?B?aEMyYXRxS2t5SkYvNElTOFVJaFBCZlBkV20ybVk3UmV5TzlaSnpTckFiYnM3?=
 =?utf-8?B?cG5lakhXaVpSOXRBQ3BpSlJSaTFIampoZUFWRE0xTldHRHMvZUF3dFFHb0Uw?=
 =?utf-8?B?cngxVytKYzRqdGZPTTNuNXRpaFVvWDJTbHc4SXRZTk05MUdRTFdCbWJwcmx1?=
 =?utf-8?Q?mMwcJ9JTT2Ps1HH5rnZWF7l+3CAIndwowYnhtsf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448d6dd8-472f-43ed-4d41-08d937dc45d8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:22:25.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QHPS2XwVlHE9yQaHtMD7ZIHAiDzaTh7HZXHphjMRrtd4OHCNnr694flw7cIypbIwH2Jr8ThJGLWbLsHsF/Jng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
respective page as dirty, additions to a HVM guest's P2M should do so.

For HVM the opposite is als true: Pages being removed from the P2M are
no longer dirty at their prior GFN; there's no point in telling the tool
stack to try and copy that page, when this will fail anyway (until
perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
(intentionally without a paging_mark_clean() counterpart) to handle
this. Note that while there is an earlier call to set_gpfn_from_mfn() in
guest_physmap_add_entry(), but there's little reason to mark the page
clean there when later in the function it'll be marked dirty. This is
even more so given that at this point it's only the M2P that gets
updated, with the P2M still left unchanged.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
guest_physmap_add_entry()'s error handling looks bogus in this regard
anyway: If an error occurs before an MFN actually gets assciated with
the new GFN, the M2P entry ought to be restored imo. But of course a
guest is still hosed if the operation succeeds partially.

Note that I've not even checked mem-paging and mem-sharing code for
whether they may need similar adjustment. At least the latters is, aiui,
incompatible with log-dirty mode anyway.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -818,7 +818,10 @@ p2m_remove_page(struct p2m_domain *p2m,
         {
             p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
             if ( !p2m_is_grant(t) && !p2m_is_shared(t) && !p2m_is_foreign(t) )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
 
@@ -1027,8 +1030,11 @@ guest_physmap_add_entry(struct domain *d
         if ( !p2m_is_grant(t) )
         {
             for ( i = 0; i < (1UL << page_order); i++ )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
                                   gfn_x(gfn_add(gfn, i)));
+                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
 
@@ -1314,6 +1320,7 @@ static int set_typed_p2m_entry(struct do
         {
             ASSERT(mfn_valid(mfn_add(omfn, i)));
             set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
+            paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
         }
 
         ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -645,7 +645,10 @@ p2m_pod_decrease_reservation(struct doma
             }
             p2m_tlb_flush_sync(p2m);
             for ( j = 0; j < n; ++j )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i + j));
+            }
             p2m_pod_cache_add(p2m, page, cur_order);
 
             ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -259,7 +259,7 @@ static int paging_log_dirty_disable(stru
 }
 
 /* Mark a page as dirty, with taking guest pfn as parameter */
-void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)
 {
     bool changed;
     mfn_t mfn, *l4, *l3, *l2;
@@ -290,14 +290,15 @@ void paging_mark_pfn_dirty(struct domain
 
     if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) ) 
     {
-         d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
+         if ( dirty )
+             d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
          if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) )
              goto out;
     }
 
     l4 = paging_map_log_dirty_bitmap(d);
     mfn = l4[i4];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l4[i4] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l4);
     if ( !mfn_valid(mfn) )
@@ -305,7 +306,7 @@ void paging_mark_pfn_dirty(struct domain
 
     l3 = map_domain_page(mfn);
     mfn = l3[i3];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l3[i3] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l3);
     if ( !mfn_valid(mfn) )
@@ -313,21 +314,22 @@ void paging_mark_pfn_dirty(struct domain
 
     l2 = map_domain_page(mfn);
     mfn = l2[i2];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l2[i2] = mfn = paging_new_log_dirty_leaf(d);
     unmap_domain_page(l2);
     if ( !mfn_valid(mfn) )
         goto out;
 
     l1 = map_domain_page(mfn);
-    changed = !__test_and_set_bit(i1, l1);
+    changed = dirty ? !__test_and_set_bit(i1, l1)
+                    : __test_and_clear_bit(i1, l1);
     unmap_domain_page(l1);
     if ( changed )
     {
         PAGING_DEBUG(LOGDIRTY,
-                     "d%d: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ")\n",
-                     d->domain_id, mfn_x(mfn), pfn_x(pfn));
-        d->arch.paging.log_dirty.dirty_count++;
+                     "%pd: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ") %s\n",
+                     d, mfn_x(mfn), pfn_x(pfn), dirty ? "dirty" : "clean");
+        d->arch.paging.log_dirty.dirty_count += dirty ? 1 : -1;
     }
 
 out:
@@ -336,6 +338,16 @@ out:
     return;
 }
 
+void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, true);
+}
+
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, false);
+}
+
 /* Mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn)
 {
@@ -348,7 +360,7 @@ void paging_mark_dirty(struct domain *d,
     /* We /really/ mean PFN here, even for non-translated guests. */
     pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
 
-    paging_mark_pfn_dirty(d, pfn);
+    mark_pfn_dirty(d, pfn, true);
 }
 
 
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -170,8 +170,9 @@ void paging_log_dirty_init(struct domain
 
 /* mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn);
-/* mark a page as dirty with taking guest pfn as parameter */
+/* mark a page as dirty/clean with taking guest pfn as parameter */
 void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn);
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn);
 
 /* is this guest page dirty? 
  * This is called from inside paging code, with the paging lock held. */


