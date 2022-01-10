Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5C489D9F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255464.437772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xal-00039M-Kn; Mon, 10 Jan 2022 16:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255464.437772; Mon, 10 Jan 2022 16:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xal-00036I-H8; Mon, 10 Jan 2022 16:32:19 +0000
Received: by outflank-mailman (input) for mailman id 255464;
 Mon, 10 Jan 2022 16:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xak-00032f-2U
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:32:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfcc7140-7232-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:32:17 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-8x_ztHkUOqSlAf4NmA_hAQ-1; Mon, 10 Jan 2022 17:32:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:32:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:32:14 +0000
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
X-Inumbo-ID: dfcc7140-7232-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbArZ4QUDoHrMtCaHYzaTxZfqcSN3GycWksPRq/4q2c=;
	b=cxNfXqWk2ucprU3UKp40Uhne2PJrEwAo2MR9KezEMfXEjMlaqO9WeUZ2eefMInqXHi/3ny
	wqFMlboSs0yDOHoZZtrmlMftgsJT/XFg0oX+fZdZkMbB+1F9jEXrsEB/PDnhsQLIJg73/Q
	Qw4KmYbYjRSAdJntZcuJqbKCJVplZuQ=
X-MC-Unique: 8x_ztHkUOqSlAf4NmA_hAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgK6vIRP+B/pYSgXtXyBYLxqYkkPqV/oB7Km37qnuVqwVOFFfqzOHK51sAtkTzPB/CiXzuK8cG4tyUU+wB8rYHCNSHdABxrpHUgTVX9TthHQap1uYWQMnRTcRBwoeS++NfSTCDxVtft+Yjlds8pJqzW5XarUCXrPRf/aRDNNY+ndn3RA9KpCoko58zh85zkBXOuGhydfvnTPvvVqQ57nzXDyGjiFS/qDw4SZ1rkgrKGaeDKOYwpY9NB+t76B/zEODJ+1KgHdxHQqPstobvqYEa89CA/zp4yl0awzdryfVw4jeah9CMMZy/wDYdxjSujJzJqf599wRpDZ2rc9BU380g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbArZ4QUDoHrMtCaHYzaTxZfqcSN3GycWksPRq/4q2c=;
 b=Rm+TdryXIAeflmX67vblXyNAKXGQdyARtyQUPZEcq+WOz2tDTl4cmB6eItyxDquBEZFthkbFzXEALpELLYJSLptHiMW3wnmTgTEj92xJ/MBjZMs4qbhIIGoZryuKEliZhhhHaGBGlQDziCNolgbdXqt96hf8o06Rgq6KqPMsZsXU2WLKN5gSltuzlOc4hRulfqs2sSdn2G7ev6DaWowxK6dsTrIO+mDLpAfyou7KiNr5irmXHngyzgKzE/FjEPlGoYRzqPCMPfEU/M8c1bzIJIC4RIKdtOapMs9w+m1bvlODiUysjGOg/biRonRDBJbkZbuVPvpdrFbmsYaj2+tjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19531402-6392-c730-08a0-20e2a4ba71f4@suse.com>
Date: Mon, 10 Jan 2022 17:32:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 15/23] VT-d: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:206:1::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08097f97-93f1-48fa-2544-08d9d456c24e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516541A4264861B302D56F38B3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mBTmlrxtnrkStIZcffnNLEMdU5W9kJXvVDMkCamJGGoK+YyIaWQA+ByQpeiznVS+Cx9TUjRPpeZQuhzMxz7+Uk1L8LQ4tk1gPfD5k2EBnbZj1fVvOJPrF7/InPjeKzI6eR1cvqDQ0T2JkAR9QRtH9htW6VebWNBfChQfgn7KqF8qTbBCm3FxtWoWwqHV3DGPeimxN9clKrR8dryEZ7ScY3DJideqp0FFmczBbPwIRKMZGuUNwFjnYmo/mnN0WcGAbF8hcbTQnD0RCAE5/V2zbVrheDHh1juXSNdKISsHbybaiBxtlfVPeiNTcMhQmkdDwbwE0sL8nljanxSUXRwA1XVOxEmgdWU1Nv2POzzhmbiu8JO/yqsUTJfvs7L0+brzZAC8p1u6ysMLXbAPq2ol3zYu+Ku5n5acElGlKdU9mAEtmGiscnzrqxOuwn6nGQojdJn9+cRKNiU5UQaXESYptdk/AwUBMIBre3IYq/u6Ndd9tqzKAdqulftcn1djEiGdGhK524XpLJsAJi7ufim9xl0rPvmsLmUWG4Bb9pSpkGQWf0KwP0Q8mGD0glTr6vyppo22bIlR9B03cugiSuIeP3c72CpLpfbmEdWXIqKHUbD5+BstlZyNPEXA+ro5WNdjag0Cp1tNfjKDK1d9VZkk6GKhbX358b1haguSg4DVtcPSQAWEQOXJJ/0EVm9zNSdbn3Lj0mG/kp/RamwThmPV0oSnypXsMyDB868gYcqb1ea95RPBG1o9/N6r8QCbEUXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2dnYzdkQm9FRzdCR21BUzRvdkdrSVcraGlONFVYb0kwVk5ENC9WYmJHSWlQ?=
 =?utf-8?B?eXJTZ0t3MHl0VS9kZDlLWU5XSDV6eVFqSmUxN3VMMGFBczR4Y1ByMnVnOVFX?=
 =?utf-8?B?SGU5U0Nhbk9YRUpmTlNFQVh5eFJpL3BGbkFKVGszRzloREVIVTJ5N3dIa2hV?=
 =?utf-8?B?cUlnVEFpd1JRT0dVT3VrUitSeUVLSlBXM25ENmhiS0g4Z2JuTnNIS1ZObHlw?=
 =?utf-8?B?STJ4MVFlcDYrUTYwaTZnS2hXQkpUbWgwRnNMdjhzd0VMUWh1VVRYODk2bG1K?=
 =?utf-8?B?ZWZjUWZrbSs5S3QzalU2clYrTGhwWWljRUtkcGZraW5lV0F3SE1uSU1TYWxZ?=
 =?utf-8?B?aFVzR2syQjB2RXJ1Unp3RUFzcVV1a1FZV042OUFvUzN0YURrc04xQkFZMlBi?=
 =?utf-8?B?R1pzR1pLaCtzRW92N3VjK1hTVWc0eG9TZk5qeHQrN1NYNld5ODV5UzZKMXNo?=
 =?utf-8?B?MGJlRXNlSjk4SktPN2pkYktiWkUrTnk1eUhhVm5KWmwxRkxzQmdaeE5ReUFD?=
 =?utf-8?B?bVcyODA4QzNiL2xBQlJZMG1rUzNQWGpGZmdZZE40cHZqN2xZd1NXaE1JVHBz?=
 =?utf-8?B?RzEzOWxCdTFCRWsybUZHUm5ENnBRWkdmeTFYV0dGOG53M1cvWlRVbVlrclBY?=
 =?utf-8?B?SGxlTFFlNVlQMW53d0ZZZ0JZRUFKbGpTL0dLRldvV1pwc2tNbklYa0h1elI5?=
 =?utf-8?B?Z3FFUnAwNnd1N2RaNnVRcU8yVEozRUxvSC9UdVZmMG1qbk0rV21HUVBScUp4?=
 =?utf-8?B?N2VTSS9JamdsR01sRkMzRi9Edm56TytmT0NoUS9zNmlMRzFIeVVqL1hESndi?=
 =?utf-8?B?UzhlbFQyb2l3QUw5QlA5dk12YUFPRmZYTTl0YjQ5RGlEOWVxaFNqNDVVaWdB?=
 =?utf-8?B?Ull5S29PZ1VqUjFBNXpjbWFkcEhZUmp3cXZhU0k0aVdrSWlhN2tvTktnSGVy?=
 =?utf-8?B?U0Z4SU9IVzltMGhFQ3YwSzNKZ1lPeFpsQWlMdjlZNC9HTEdkZHBvUnFjc2hJ?=
 =?utf-8?B?eDNveDZIS2VWMU1NVUU2NFdFZGlTeEVaZ0l3SWZoMHJnSjN2SHg5UUtiRDVh?=
 =?utf-8?B?ZDVnQ1RmeTBLS1hOdkRpRnl3czZqTHhTUHdNa2FCQ1QrdS81cWVqNFBId2R2?=
 =?utf-8?B?QS9Mc3FDZ3oxWUZTVG4xcTNMRkxLQTRNTm5MaGZjanVNNllBTytTZktPM0hQ?=
 =?utf-8?B?V29mY2VnUFN3Y0MxdzBnSi9lekRGZHI3cE4rZVV6MTdnOG84d2JtRzhxNFhB?=
 =?utf-8?B?Y2ZEVGh0dFZjT3FPUHVacGo3eUNXcTYxL0dhSnZDK2YvMjBNSVZZcXBUNnBy?=
 =?utf-8?B?anNPcGpKdUE0cU9HRjhvdnMxZTZncTl4MG5VRkUvbTZrY3J5bUpNVVRsZm5m?=
 =?utf-8?B?NU54OEpEd1pPR3NqdDBWbXYrKzZvN3E5SEk2elNlRU90N0ZBQXFHQTU3SzF6?=
 =?utf-8?B?WTBjMWFJVWFwZVM2bXhPL3Yra003MU5BenRyUzZjRUF4aUVldnZhMThkdXFn?=
 =?utf-8?B?TTYxOUNjNVk0TDRUSmpZMGQ3Q3M5UnFPcnFwei9XejArNnlXdXg5ODBRSVc5?=
 =?utf-8?B?MG9xWEJ4d1IwVDZGQmJNNTlnS2o2Slc2SGNPMXkzS0Y5NS9qa3FEajVwa2Fm?=
 =?utf-8?B?L0xMU1RIU1l0WWtLaVU3blNGUWFkelg4MVVtWnpXenZIbXFhZ2xmTFZNTWRW?=
 =?utf-8?B?aFlnNnBHS0hRMk9kZEpWQ2R6NytmbnVTdWkwZDFnamRpa0ZuUWJHenE4L05P?=
 =?utf-8?B?Tng2NDNWSUl3R2liR3lVSVgxMWpObmlaek1qak8vMjVpaFdxbWd0UFR4NVNO?=
 =?utf-8?B?VFhzVTRGVDBBRldienlWRGl6WTNlYmRQeXBXOUpKdVZKN0ZkWlRERVNpQ0lG?=
 =?utf-8?B?S3U2bytuVnpSdFZSaXJ3ZzNJcm5oNmFaUzZRSDBtV0xJTUEvTm9DNHRVUzlP?=
 =?utf-8?B?N0VYa3lsT2FJUnFEamd1QzMxK0hBbU5LSG9WMC8rcWJ3N2JLNWx4emVhWTk5?=
 =?utf-8?B?OXBUdm1lVFUra0YxcGh3VE5WMkVSTDByc1dkb2FEVlBpK2RJd3l4WEY5L3BE?=
 =?utf-8?B?TDRxRlFPQkVhNEgyaFpodnAvUDQ5Sk9UY3hkQ2tlM0FsMnplQmdpeFVVSVYx?=
 =?utf-8?B?TXB4bldFVldCdzFEYWF0OTNBTjd2TUdBc2hGNHYwUFpFNGJoUjZaT0pOVWh6?=
 =?utf-8?Q?xQrK8fGSLWr6CjisAP31Bik=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08097f97-93f1-48fa-2544-08d9d456c24e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:32:14.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zJ3jpHadKtD+kUZYl0OrB0HbZl2XnndDEQBXYavsHOfo8ARCAX0BoOEL/02ABxmUV6inZOkWw0hJU3IBXUtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible. Tighten assertion.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -826,18 +826,37 @@ static int __must_check iommu_flush_iotl
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        struct dma_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(d, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              level - 1);
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
@@ -845,7 +864,7 @@ static int dma_pte_clear_one(struct doma
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = page + address_level_offset(addr, 1);
+    pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
@@ -854,14 +873,20 @@ static int dma_pte_clear_one(struct doma
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
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(domain, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
     return 0;
 }
 
@@ -1952,6 +1977,7 @@ static int __must_check intel_iommu_map_
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
+    unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
 
     /* Do nothing if VT-d shares EPT page table */
@@ -1976,7 +2002,7 @@ static int __must_check intel_iommu_map_
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -1985,13 +2011,15 @@ static int __must_check intel_iommu_map_
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
@@ -2012,8 +2040,14 @@ static int __must_check intel_iommu_map_
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
+            queue_free_pt(d, maddr_to_mfn(dma_pte_addr(old)),
+                          IOMMUF_order(flags) / LEVEL_STRIDE);
+    }
+
     return rc;
 }
 
@@ -2370,6 +2404,7 @@ static int __init vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = PAGE_SIZE_2M | PAGE_SIZE_1G;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2412,6 +2447,11 @@ static int __init vtd_setup(void)
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
@@ -2483,6 +2523,9 @@ static int __init vtd_setup(void)
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes == PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2797,7 +2840,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


