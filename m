Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2F3F6049
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171494.312944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXMt-00034W-8I; Tue, 24 Aug 2021 14:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171494.312944; Tue, 24 Aug 2021 14:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXMt-000312-4k; Tue, 24 Aug 2021 14:25:35 +0000
Received: by outflank-mailman (input) for mailman id 171494;
 Tue, 24 Aug 2021 14:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXMq-00030k-U7
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:25:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2274580d-4eb8-4872-bcc8-3c8d78b2167d;
 Tue, 24 Aug 2021 14:25:31 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-epLFINjSNF6m8OekhTxV_g-1; Tue, 24 Aug 2021 16:25:29 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3460.eurprd04.prod.outlook.com (2603:10a6:208:20::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:25:27 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:25:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0065.eurprd07.prod.outlook.com (2603:10a6:207:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 14:25:27 +0000
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
X-Inumbo-ID: 2274580d-4eb8-4872-bcc8-3c8d78b2167d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QygqEhY4mmo9TOg67f6s3oZ006SBh1mhC+tlKcEXnA4=;
	b=CHNkMP+76+QhCQiHXyJ6TLnRF9YpFG5wG93SoWy5M40VD1bk4NuuOZgHiS5soYxvoMYCOB
	Bfg846yMQPjar5iUOXSaUXWpVtG+LEuukmHSR3BwdL0m20mpIa1AWCd+V81evVPazqlX6B
	ZJxT8yfa2GBKzBU+hqAk1+HsbI5ATeE=
X-MC-Unique: epLFINjSNF6m8OekhTxV_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlwCMw+/YdzlKGSAFgaasrt4WO+xlG66IkUvTYbOECrM5MYWasU3JfW1U5f8uZU/1FpPKe5RkwT+Ws/oq76+rnrYtN9i3SGJXRRheIWFrqne3hUc0VR1FOHMVsJB58H/0OaP3NzSbhhd+1F3FV4t805BkFNaqIhBL7vEWZXigD8JKsJ6X/uaX+mOcdwFtFTrcLqgiYvfcyeO1LBmpP64IChSMSKu/XdOe0CSbWng3cFQs5h6l8PBG69pZCYxB4iQG4L48hKIJ+JH9UYkHBqahIXEy1eUAdcmlEiW/CCUHGrowDJN3FUqwN8QLeolni3++Ah9Fa0knaOI5CKy6gs0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QygqEhY4mmo9TOg67f6s3oZ006SBh1mhC+tlKcEXnA4=;
 b=TxGsDcaJlKYqYva1ClhuWkopMwhIvQ4m9o/c2SDRNNgCDodp4U2DP3xUs/sCuWeDP1fLjIP8wNHwbQ5oqO3h4gtKb9fps1zNLj16+4nrMD5TnwYmwzZbb5bj2Qdd/6aEJ3zs44PYtK2wiHMMyubKgZh/jhQGW5eseOOY4mE2cNWDnyj8bxiTkxjK+4/tINC/qY8EwvN4eGzmVjCIXceIcEo1+qF8FTdtWmBqF+W24vdNLpqduHTTCCG5StVAFytj0Cy9FnraE3jyIryWrXPiuZiwMK47Nsah30L+nvzdE5yjt5F5cv0ScMKqKG0g2iXR5aoo+dynmU4nji8pmZYTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 13/17] AMD/IOMMU: allow use of superpage mappings
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <ecdf0636-0428-de38-8d6d-fad10c962d5a@suse.com>
Date: Tue, 24 Aug 2021 16:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0065.eurprd07.prod.outlook.com
 (2603:10a6:207:4::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d904bc00-2a40-4773-8cf8-08d9670b04ef
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3460:
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB34602A5A565EA803985B560EB3C59@AM0PR0402MB3460.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FoTy/ZgJOHw6UfIuxgwieCTWeC0+C0bguwonBHfY7hqlQufEZJfL059dIuBCH/9tHlG6vbKe3z35uahE2fYgThehKvS1JrdjzEXymNel4+mIfxop25mp7uUKWquwktlWhv1k6WfI6z0CEhf/r+0e75nTnypQzlVtOEJWp/PSrOlx5pfbjXbsZMS8VDLln0PNwTwXLTuTjNGwJlSKVfqRBvROhm7f9S0UJqZRJJDakO2+R2AY3ZZHGi9dJqWswbDDFzjazqA1hHbY0A+VjxzTXLhHO/CP+2+E5sRO0cGcqGccQHOSW13P5pyHsnMPNORgfBtXCcyBWEatUjTKoszCAG3aSD+nhyqsVuWqBfhmnpmx1Oj5rNjRkfMTq+QbxKIh3ZIB9IpSWWrTEmFeEERERlpIB3iNh2fybUixTAfJxfBnIgCNion1+DxaU6K1V5wpPVxWwUEfxX/ZdKnH7FhA69T3JuwsEX9G5W0FKC/SBEZK3oXc4ZfSDmUZCBXm4RroAaoE1YOXqSdPP5ld5BQgr/lDkbandgloEmkcYxWLd/L9heQZszB3Ol8lm+mS2yIRj4pHyohkdUEK22Poe42Ilixlyr+ZgqfJqg932krhTBEh+3mUISlbptPLjXC/tLDGhhM/eZRwTM9YiWNCx+/klmf/7TfinfFkU9uEQpjK8nuZC/zaddEtGA6Id2GvX1SGwMHJ05ts1lKbg9BhVZ9lY666LLnQpEVM3ftU38A1K7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(136003)(396003)(366004)(54906003)(66946007)(16576012)(316002)(26005)(6486002)(83380400001)(66556008)(66476007)(6916009)(8676002)(478600001)(2906002)(8936002)(956004)(2616005)(4326008)(5660300002)(31696002)(86362001)(36756003)(31686004)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURrSzZmcnNrbUViYzdoYmRyTE90M2oxRUR1N2VPUlBlOVU2TTlkSmdzNXpB?=
 =?utf-8?B?VnBIbmhFS2tRL3BJRFh2ZVJKdS8vcXlJRUNNY2xHMURIOGhBU2NkOEVJL0V4?=
 =?utf-8?B?YUJxMlZoVU8rS3VwTm1pMXArVHBiTmVWK0ZBLzVzMGVaVFY2T3M4WTIrNXZT?=
 =?utf-8?B?dzhFN1VNclhrVzBoMGtiREI1aW41QTYxY3MvMVlhdzBFWXJQNDRoU3dWbisv?=
 =?utf-8?B?b0dnT3JHUUUvaXdnb1ZHQmcyVFRRUDdwVmR6aGx0OGxSUXQzNWdlUFpGeW1h?=
 =?utf-8?B?cHpqWWxIbzRpQ1M4YVRCTklXeSt4ekdwN0ZzVVhIUEdyT0Y2MDQ0NTlpOXZT?=
 =?utf-8?B?MnhzVmRuZHc1aGZwVzVhbVVjRG5DdlZhelFCTTlhenFFc1NMYmNOODM0V2g2?=
 =?utf-8?B?UXFCUmIzSy9wY3JUMlMyeldvNmI2NWw0djA4bXphd3g5YVAyTWZ2YmFleHZv?=
 =?utf-8?B?bXlWbjdZUzluVlk5d1VaU1JZV2Z6dFJLOUZlM1RSTXpJejJBT3E2TmN5eWxX?=
 =?utf-8?B?clRRRmZKeS9PTEdvMUI5SlRzYzRWNEt2cXU0V0NBenk5WHBEcEtrbmxRVnZL?=
 =?utf-8?B?bVk4dUJ3VGw3SGQwS214Q3NpdnhobkIyM3lHemhsbExQNjZwaUFFVUxUT3kx?=
 =?utf-8?B?MjZJRmxUUjdJR0I3WjZaT094cThFRWo3bWFpSHAzMjAvQWY5NnlQMU9mM3hR?=
 =?utf-8?B?SjlkdU1yTmNjOEFKNjIxdFJ5NWpVOW1ESnFGcUtCam1sYnI2RWtOUHdsbnFv?=
 =?utf-8?B?bHNWa3gvQnVFNWdJYUVpaS9rMlFEc0FMNE9NdUxnaG0xNlEyNmNpQ0NxYTFK?=
 =?utf-8?B?VXAyTWNwZENSaHdDbi92d2JaY3J5WTNmYTVyRmt0RFR2WENpYmsyR3FkYXZi?=
 =?utf-8?B?ZWN5bnowQWRqNWxxUVhOOUphVlZrNGJ5UkxPdE9uNWJpZC83d0JQTDRDcnVl?=
 =?utf-8?B?b3dQcmJwLyt2U1NOaGhUcTlJajNaay9TNVYyaTRtc0VHVHZvMWRSVmp1UDNw?=
 =?utf-8?B?Q1dpRkRvSUJBTHJ2ZUFWZ2JQUndTbHBHOU4vWEVTYVozZXVhYm1iQUVTMTlQ?=
 =?utf-8?B?V2w1bDUxcDlsTlQ1WFNyY3JmVHVtTXF1QWt3cEdpdWZMSWFPY2kzaXpGbytY?=
 =?utf-8?B?Uk1jSlN5cDRWUllxTERHdWZ3VGxpbjBYaVdyV0VOWXFDZGt1SnBJMnBZeXl1?=
 =?utf-8?B?cTc2b1RobWtQUlZGVUQ4UThMejNKQTh6czJiRDBuL1VabSttRkgrTDA4TXRL?=
 =?utf-8?B?amxPQ1JUL2o1d3d1ODhWTS9ySkNwVWs4cVZYM3VJdFYvUzZFZkhtamRabStq?=
 =?utf-8?B?S005RXJza29VaUNXWnExL0RFTlhyRm5za3Jpd1YrQmhkWGNoSWdnU1FTek8w?=
 =?utf-8?B?Z2R3d2g5c1FtVEN2NEtqMjF1NUhONTRyZDFiUUNVUVpxeUcvL21JakgvbFlu?=
 =?utf-8?B?T2lIQW0yeHA3ZGkrZXY4dy9TazE2TEpsdFQ3MjdGcHpmOWFUWjVNZzZ4aFlx?=
 =?utf-8?B?U0FVM3E1b2d6dXh6UXBWT1Z3dG9JUy9RZEtOaVlEd3RmNElvY1k1cWRnTEl2?=
 =?utf-8?B?bHRCaS9oYUJ5YkVZWWZ4SDYvNjdhUWpocHNMbFRtSkhtbDFYa2dpQW1WaVVw?=
 =?utf-8?B?SWRRYmJwRTJ0Uko1U1IvT3F1eTUyM1lrVlQwZXYvZ05jZERleXZhQU95bytl?=
 =?utf-8?B?Vmh1TktRQmY2MGtudVcvUElveDZXSWlBTzF0cHBJSnE5ZVNDZnhjV01nZHVa?=
 =?utf-8?Q?cq4g48Q9u0wyR7E87+t6oHndtUFnTSSZFDizix5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d904bc00-2a40-4773-8cf8-08d9670b04ef
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:25:27.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8bv04kRuKRTnDWja1J7ozkx7whbf8AA9vuSAI85lLv6TDQXyzw7+5lsi4H+2oUCgO5d+C0Hc1CdKlqffa2Xpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3460

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
non-default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not fully sure about allowing 512G mappings: The scheduling-for-
freeing of intermediate page tables can take quite a while when
replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
there's no present code path via which 512G chunks of memory could be
allocated (and hence mapped) anyway.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
 }
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
-                                                   unsigned long dfn)
+                                                   unsigned long dfn,
+                                                   unsigned int level)
 {
     union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, 1)];
+    pte = &table[pfn_to_pde_idx(dfn, level)];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
@@ -288,10 +289,31 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
+{
+    if ( next_level > 1 )
+    {
+        union amd_iommu_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < next_level);
+                queue_free_pt(d, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(d, mfn_to_page(mfn));
+}
+
 int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
                        unsigned int flags, unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -320,7 +342,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -330,8 +352,8 @@ int amd_iommu_map_page(struct domain *d,
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -339,8 +361,13 @@ int amd_iommu_map_page(struct domain *d,
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && old.next_level )
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -349,6 +376,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
@@ -359,7 +387,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -371,14 +399,19 @@ int amd_iommu_unmap_page(struct domain *
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && old.next_level )
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -584,7 +584,7 @@ static void amd_dump_page_tables(struct
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
-    .page_sizes = PAGE_SIZE_4K,
+    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G | PAGE_SIZE_512G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,19 @@
 #define PAGE_MASK_64K               PAGE_MASK_GRAN(64K)
 #define PAGE_ALIGN_64K(addr)        PAGE_ALIGN_GRAN(64K, addr)
 
+#define PAGE_SHIFT_2M               21
+#define PAGE_SIZE_2M                PAGE_SIZE_GRAN(2M)
+#define PAGE_MASK_2M                PAGE_MASK_GRAN(2M)
+#define PAGE_ALIGN_2M(addr)         PAGE_ALIGN_GRAN(2M, addr)
+
+#define PAGE_SHIFT_1G               30
+#define PAGE_SIZE_1G                PAGE_SIZE_GRAN(1G)
+#define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
+#define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
+
+#define PAGE_SHIFT_512G             39
+#define PAGE_SIZE_512G              PAGE_SIZE_GRAN(512G)
+#define PAGE_MASK_512G              PAGE_MASK_GRAN(512G)
+#define PAGE_ALIGN_512G(addr)       PAGE_ALIGN_GRAN(512G, addr)
+
 #endif /* __XEN_PAGE_DEFS_H__ */


