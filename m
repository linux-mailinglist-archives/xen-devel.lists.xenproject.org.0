Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B051B3F6051
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171501.312956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXNN-0003i2-N8; Tue, 24 Aug 2021 14:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171501.312956; Tue, 24 Aug 2021 14:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXNN-0003fD-I4; Tue, 24 Aug 2021 14:26:05 +0000
Received: by outflank-mailman (input) for mailman id 171501;
 Tue, 24 Aug 2021 14:26:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXNM-0003ev-8C
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:26:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 357c1f00-04e7-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:26:03 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-t_vBaTXfMFihwvuKcupDMA-1; Tue, 24 Aug 2021 16:26:00 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5682.eurprd04.prod.outlook.com (2603:10a6:208:131::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 14:25:59 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:25:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:207:4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 14:25:57 +0000
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
X-Inumbo-ID: 357c1f00-04e7-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXNlYzfiI7fao0QvX7Y5nmHcnn3q2cAtFsh8eNUCA1o=;
	b=MpyogQjuowVsYQqL0gV+mILP8odHr9ACBLsEQaNj6UlmKwyh7Jm5EYEkJHn0a+VnnyfpUH
	nXtMCNNB1e/XU0tloLYimwxS0MfPnjNYtG8d7pBOrjRNHu+xV3HqhZlnbx1hxvK0HGgmSD
	AZLsW63QfUnBOCY/4LZzy2sWuuaU5so=
X-MC-Unique: t_vBaTXfMFihwvuKcupDMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuDjANfCw+Tv8R2Q7A38N5RBO6/h1PmQAztMS/SLZCzUhYa1voIBsoqsyFCcl4rYVzZ77NCQnOxlTR8EObBBx3xrAGcqlqoVMxHkES7vO98lC5X2ba3UOZerY2yZFU4wuZb7tJMViCeH96wN1Sexu+nlDS5MQnd6j8wAbY4ZhNVCQpy1yJa0BuPLWjaRoXJEZRbVcK+ByBTTKRfN8Xz3DDTQ6NURUqsCvCw1jLrJIvTSomTr2mOUv15MTzT9HnTbmWMA13Z07qX2K2+Ju7E7DyuHdrkakE9ae8PCMNMsnsMhbbZmi3yBMDDjmi9esMPzgHtw1mf+cPlS2JMh02crkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXNlYzfiI7fao0QvX7Y5nmHcnn3q2cAtFsh8eNUCA1o=;
 b=i3MtJcKRNrZCQ5RCzUHNhfcVfnKEM6CMYtBW/Y1WNXxGteQhyb7ndjRd+RyO5FfYLXE1w7XgwvXaHTpysVK2pAv+sBZJFG5ukMNWCWdYO6TWqxEt6dqOl9fIjtIOEjZ7au7jOGVcDjX3uNcHcc0vP4u+IgLd4XSuiIY745RU52tpM/+/MyHTmcDWf7YIA/rcWiyZywJRCrOo4P0oVjKfUk1CQ9mZmRRSYhnnLqegJVRZb22yrhZtr72UjAymHInq9Q1E8fXd3M+cD0wQ8FX7UZPjeQwnlMkiSO0WvKWkyAqopFtR5M2Wa1akTMx8ukqJUFtE6pBTsr8wZcXmJVJh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 14/17] VT-d: allow use of superpage mappings
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <0af2ff55-4dd4-aa8e-bab6-ca043fc9363f@suse.com>
Date: Tue, 24 Aug 2021 16:25:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0055.eurprd07.prod.outlook.com
 (2603:10a6:207:4::13) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3382000-24f3-4d1f-7c96-08d9670b16e3
X-MS-TrafficTypeDiagnostic: AM0PR04MB5682:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56828543DE5ED1E37B35FF33B3C59@AM0PR04MB5682.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WMPP+gaNYiX9VxduO2HVcToHNa7hvqAdJx8WbGguuScWO96IqkCkWHNr0zZWH1vF+bqNoVdBA5CWNbr5/wT2fkgjnva0vd9CvqEH4oyAmLHoXWV6pg+tZ157XiEyoMPCPDKfFUJLWsTPD3vRt0ROFeCF9XiNCIWcIgxXkq4z8NhEUWF5fv4R/tZAF0Ef4y7NV9UAp9EnBCYgzn8L/xhcxyRyGT3yNERxyhpRL3dA+OudeyzfNpJJnNf17ryG9PiarCJEeJ9Qhdn831QnIpKqiQ5WzVNaqXe0SIjJkYKwfBRXVRceg+CIAgf3A1wNj0KmwlPyhtIYQUuziE2+b/eA3rzCHVAW6rMGSX5Tf6wC+lHLqtb1jprwCPG420WlNtl9WGD5WELA3l37BQlR0uYlFe+45MSMAMDqtVDsRMRoH5Cv9UlszqpC+/Pe3uqIz0HPKTJxekm+uhrodR6dx2Dg7ZVJF0zEklDfv0cz9BZl5CcfOVComghGDKBU26nbhAt+anjYNPmWyU1zc1ZP4IVZu9aj+W6UdZbFyW2mSNeRUfH/pnRFov1LpZE+cO+5Ak8rP9UVdGl5u+qy6FWWK55sEvJzdtQsV69/ufLsv68mF25HsbgUW+GDglnVlWJxYVg+jDzk6YRINRC6s37JJ2h6W8LqmSvN+0cX2OOtF/8362i5jqvLa7+Y2crgmRsHfYI2lUOPSBSdWCya9ihJqlFNwwW+e1YTrbWEebwgCrIf4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(6916009)(86362001)(4326008)(8936002)(66556008)(31696002)(36756003)(186003)(316002)(54906003)(956004)(26005)(5660300002)(2906002)(66946007)(31686004)(508600001)(38100700002)(6486002)(83380400001)(2616005)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDUvRWxlVk1NazBjOUVEUXFBRUZwa1NPYzNDaEF6L2lFNjFST0FTNXBydU96?=
 =?utf-8?B?TUNoOWhNVzNLbTZLTURVSzJZaDhjTGk4d0lZSUV2cDZHTHZRbkU4dW9tTFhr?=
 =?utf-8?B?dmpWc0dlQ3d4eXZ1Q0gwU2FZOVRoT0JEMnppYk4ySWN5bTJtbEFIdnd5eDdF?=
 =?utf-8?B?WDVjNXBDM1gxMDBjWHkwODhOdGFoaGtsdUlUd0h1MW5mSGxtQVNEOGpRblJV?=
 =?utf-8?B?a3gvMW5tOXJzUkl0RGdGbyt1UnBucExSNE5YNk02NkR2STF6UUZsZC92aG9O?=
 =?utf-8?B?MndEMS9yak51MFJiTnJUcGRKb2JQeHJ5cmJyU1NUbVNRNzZrTEFFUnZZei9l?=
 =?utf-8?B?S0lrc291TGFPSUdSVnU4THBnUDUweHpHNmdDNWVESmNMbXJYanpCa0NSamNC?=
 =?utf-8?B?Q2RQTU0yWEVuV0ZJREw0WGFrblpvWGo1K1g3djZ6QUZ1bXZJb3k0aVc1MzN2?=
 =?utf-8?B?MVA4Q2NkZTRldVhxOUw1YXJhempaQWpDdFNjZUFnV2p4cXFFeGNPZjBEdTdL?=
 =?utf-8?B?enl6dzdBNjAwVEdHcHNtK2VvYVZ4UEptTXR0b0hWUDN5Q084dGZWOFg0NDFF?=
 =?utf-8?B?OUpla1VQM3JCbGFWeGdabFUwaXpGenhnVWlnMUpjWHZJeDY1ZW1pdTN6cStW?=
 =?utf-8?B?YXNpUEllZm00RytGSldTQVVyUXRXaDdDU1hDWGFRVm1YSG43V1drRGx1NTV5?=
 =?utf-8?B?TUpBbng1SDFWQmZDc2JsSnUvWElQalFrYzgrSDQ5Mjl3dW5oS3p0VUs3bzNt?=
 =?utf-8?B?UGhpLzh5aWowc096aUJWaU1WVjdNQzIxcXZHbCtuV0NmSlRXQXE4dnkrM1ZR?=
 =?utf-8?B?S204YW5CRmJMOXlQandDcUhnUW1NMjRZQ0FsZSsvK2xEeGZHWGJOM2JSOUF3?=
 =?utf-8?B?VjNRT240UEsxTVhEdFhad2xudlU2QkxDMDUrd3hzSDBudVVBVHpiS3RBUW1Y?=
 =?utf-8?B?SEU5ajFsN2JEKy9pTGNYaDVZWkNTYmd2QXVIb2VNV2xRVkFrcGFQTm1PT1Q2?=
 =?utf-8?B?dVIzZDZ6RGZsWUN3cWpTVGRMVjRjOUJsRDZaY3RGcFRIb0hmTUlWVWNydXhM?=
 =?utf-8?B?bm5BNFIwKzJTS2oxY0lTK0NteUt1TnRpQ0dXSkRTK1Z3N3o2b0phWnR1RXBG?=
 =?utf-8?B?cjBrRGtSUmJJWkJsb1I0QkR3UHVEMzhZY1FhWlUweWh6RTBXTll2dUZuSGNo?=
 =?utf-8?B?YkNyTWVrc1hEVlRSUVhGZTE1UTA4UE1CcHpJa0NqQ05Kd3FmZjRvSmNNTTI0?=
 =?utf-8?B?dVJmVEdyZ3Vacitjb29mejZsaUI0S1hRQ2FqWjMrNEtEcElLMkNHRDc4ckJH?=
 =?utf-8?B?UUF4cElwMWhrUEJIbXF1bW9NTE1mcE1UdEE4M2FrRnorMmxZRktCbVlwU3N6?=
 =?utf-8?B?UVVmdEJQTnphK21PNkF3UzVSc0pEWHRmSzdXcUpnZnduMW5Wa1V4UzRleWJa?=
 =?utf-8?B?NjRtWHQ5QkF0SGU4cnFFelJGaVJvOEw4WGs3ZmxHSS83SGJ4WW5IOGthZ1BZ?=
 =?utf-8?B?NGxzNXRUS0J4cEVSMGppU1YrOFU5YW9VTkZBbG9YaVVIZFN0dXlvN1U5RFlH?=
 =?utf-8?B?RWpjdnlERklPdEt6Y3loeEN5VXJTYVZlWmZFWFNZeG8rTlk1VXRtZEJDV2dV?=
 =?utf-8?B?dHY4dGNDWnRMU0NoVTA5RmRzTjlaV1N1dGJIVlhVdllyQkdiZTdQd2FhUVZI?=
 =?utf-8?B?aUhEMUJNcFNZSCtNNmJybGIyMENSL2tuMWl6UmhtMC9lSzZxN2lTa1QyOHVH?=
 =?utf-8?Q?MD2Lh/1f7IJwEXhu5mU32LW0qZ/R7+UO9khJtvJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3382000-24f3-4d1f-7c96-08d9670b16e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:25:57.6783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WphUeIUdObg+mULD00qGb5vHk6afgxbJ5nTd5f1wuEwyWy4tzaoj6/Pdv1QD3in3mOYUd2FH1zWhaTYcAfmsCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5682

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -756,18 +756,37 @@ static int __must_check iommu_flush_iotl
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
+{
+    if ( next_level > 1 )
+    {
+        struct dma_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(d, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              next_level - 1);
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(d, mfn_to_page(mfn));
+}
+
 /* clear one page's page table */
 static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
                              unsigned int order,
                              unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(domain);
-    struct dma_pte *page = NULL, *pte = NULL;
+    struct dma_pte *page = NULL, *pte = NULL, old;
     u64 pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
 
     spin_lock(&hd->arch.mapping_lock);
-    /* get last level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, 1, flush_flags, false);
+    /* get target level pte */
+    pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -775,7 +794,7 @@ static int dma_pte_clear_one(struct doma
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = page + address_level_offset(addr, 1);
+    pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
@@ -784,14 +803,19 @@ static int dma_pte_clear_one(struct doma
         return 0;
     }
 
+    old = *pte;
     dma_clear_pte(*pte);
-    *flush_flags |= IOMMU_FLUSHF_modified;
 
     spin_unlock(&hd->arch.mapping_lock);
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
+    *flush_flags |= IOMMU_FLUSHF_modified;
+
+    if ( level > 1 && !dma_pte_superpage(old) )
+        queue_free_pt(domain, maddr_to_mfn(dma_pte_addr(old)), level - 1);
+
     return 0;
 }
 
@@ -1866,6 +1890,7 @@ static int __must_check intel_iommu_map_
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
+    unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
 
     /* Do nothing if VT-d shares EPT page table */
@@ -1890,7 +1915,7 @@ static int __must_check intel_iommu_map_
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -1899,13 +1924,15 @@ static int __must_check intel_iommu_map_
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = &page[dfn_x(dfn) & LEVEL_MASK];
+    pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old = *pte;
 
     dma_set_pte_addr(new, mfn_to_maddr(mfn));
     dma_set_pte_prot(new,
                      ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
                      ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
+    if ( IOMMUF_order(flags) )
+        dma_set_pte_superpage(new);
 
     /* Set the SNP on leaf page table if Snoop Control available */
     if ( iommu_snoop )
@@ -1926,8 +1953,13 @@ static int __must_check intel_iommu_map_
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && !dma_pte_superpage(old) )
+            queue_free_pt(d, maddr_to_mfn(dma_pte_addr(old)), level - 1);
+    }
+
     return rc;
 }
 
@@ -2348,6 +2380,7 @@ static int __init vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = PAGE_SIZE_2M | PAGE_SIZE_1G;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2390,6 +2423,11 @@ static int __init vtd_setup(void)
                cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
                cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
 
+        if ( !cap_sps_2mb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_2M;
+        if ( !cap_sps_1gb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_1G;
+
 #ifndef iommu_snoop
         if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
             iommu_snoop = false;
@@ -2461,6 +2499,9 @@ static int __init vtd_setup(void)
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes & PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2777,7 +2818,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


