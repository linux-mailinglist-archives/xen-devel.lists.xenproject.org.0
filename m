Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A416416FBF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195195.347791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThwi-0000qM-7F; Fri, 24 Sep 2021 09:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195195.347791; Fri, 24 Sep 2021 09:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThwi-0000oN-3j; Fri, 24 Sep 2021 09:56:44 +0000
Received: by outflank-mailman (input) for mailman id 195195;
 Fri, 24 Sep 2021 09:56:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThwg-0000o3-0D
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:56:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f73c821-0d12-4fc5-ad16-e97a87849c94;
 Fri, 24 Sep 2021 09:56:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-Qghzi9XzNM62bBAmM4P2Fw-1; Fri, 24 Sep 2021 11:56:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 09:56:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:56:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 09:56:37 +0000
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
X-Inumbo-ID: 5f73c821-0d12-4fc5-ad16-e97a87849c94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8EuFDCQk/F12Hxw1IKCpr1YasMuKbjeGSquhoEqDIo=;
	b=Kb9qclod/bXPJOGN9AUEH1qu/OH/Y60f5EbKZ9hEE1e20GQ1ibPr6Fh9fKZOt1/W7yi/WN
	xk7LiNa0RWdDKoVx3mwqZBwChsygR94A6v5HP0/j20Uh8RM9tfe0obOpJEPDjevdjpEvWT
	b+LHSk/hU/fHxWj0dBfEd/Eegqq2XQY=
X-MC-Unique: Qghzi9XzNM62bBAmM4P2Fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmYP87IF0gTRoMWJqdJG8l1+Pw2TmMH/UMU2zrUDRbdQHxpBEinfxM2V9VHf+Y8478Uk3bF2TT1kpT1bHLgGFY/M1yS77yGkcHoyn/dmClfZIg097nmri6fEX7j9MVWKenmAZe3AxdtFMqCYbzvE/emlY7rAfUCzKiDyzYG3sim5AUWhOc8RUq0/lT9v6tRJc20VOn9Ltag2npiNO+9LNkEgWiqOWPhjC012Wu9K+4osOoLR586HQ2LWXvs7KaB1Qy7/IzjCF8xW/o5KLIllJgEfQLxzR4YQlH1KxY1QBiUpbPbZN1rygz5BYJFZnM/r77yM3+vAfCFyfe+yRlq0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=W8EuFDCQk/F12Hxw1IKCpr1YasMuKbjeGSquhoEqDIo=;
 b=DaXdRmcn2YLOqvnHnSy+8Rnd7VpDKkD/lbwSbT+Dc+U+1nxWaW4MV7TTpsESOdp03z19QGfgbtRvFzc1ImSH+J/EPuckfrIZCZ1Hx6R3PEg/xSWc1qzgpkLcIIn4JpDETc7Y+VUzA0296Hzw0WceUZrqGE75HnXLCNWs1F6HkQta8cZ4ZF4avHaRXjQgHwgP1Ox8gL2YveVNihRYoEl8A9KlguN23Qourbffvat94nMbXrXdPh7oDKv39sTlM9jKSSCLHHZnH5k2QDzegw74qUdsfyIeKQFz4hXZTOTOtvbpcDBj5mbvLHXmAlKC9OYBP6NsiGFTG97Ma2Jn9U6ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 18/18] VT-d: free all-empty page tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <4d3f1748-4964-77d7-77f6-db58a9eef55f@suse.com>
Date: Fri, 24 Sep 2021 11:56:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d85ed0d-14c6-48cb-9d94-08d97f4199b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040A1E05306CFF35C9F8F5BB3A49@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uhqe0b9VOaRCzcINyBhF/rVhMXD6Tm+iqZ2DHO/Mdq8h3sMC9hieG308uerWrF/3j+tIMXuvOoVZygD5Nm8qPJmKZ5BFWXyuHpPeo3uESQx6XVAe0Q+P+ouQzJ1B8zkabpKBBJaaMPKEsl+1HQ5GCYovr7axBXvdkLCVVdy8n5TTW18t0EXkhfjCpfftwXaiBLpL0mXgHXrWXTg+DsmWQ/q/qiON3l4vqxj12+ILtU79MgpxUrrpSP1kPPFZHvyoWKzGpHXQ1pB/5oqlsQVdA2Miz57DxPF2Ck6Lz/SXWJX4HDqjQkcMvyvvWUkFA4t8Lc+f3fXDVt8D6HHwLUJ4R/rcw7P2J5H+mhOM/1W4cpJbQu5DYIjv4Wkw63SPjg2JjglV/G24p51o5G4p2LGBqocW5+n0p5bzM3OtqfK4jQksuxC5FFgdQFnsjSbz951bviadAaN6hk5NqP1IJXeAGWwZI2y3SBa9Mn5IV8Wy5ky3DkM05jjywNzf6ezgssQqiOBPbG+oMcqIphYIELexvokF7WO43oLQU+Krr1/WXNQq/AI8wbU23PMYGKtmeFNq4Zzg3wx6ZrsWi7eCvoFpb+KaZVI/bnhByJFb3rrlum83WdeUt2G7agKcRih5ASDglRoJr0fV0X7JSSJFrzwBLyvShZNxF17BDMHYRT6iSqE6lxalZdJNOkLMVF5PEBlK8nwBlNmRBZ1wJN8bpbfUKkrjIMQU5ya+LeXUMk3R8AA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(86362001)(83380400001)(6916009)(508600001)(66476007)(66556008)(31696002)(38100700002)(31686004)(26005)(8676002)(36756003)(6666004)(66946007)(16576012)(8936002)(54906003)(5660300002)(316002)(4326008)(186003)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFFscm5xbVZZMGkrblFFVkE4eFgxcTNVSDlXdjZsY0dMSHZKYXU3QVdJeU5F?=
 =?utf-8?B?STk5aUQrVXNKVWE1MHJrZENwUExWWXNrSVhkQ2htU1JNYzJmcXJYcGxGZytP?=
 =?utf-8?B?WUxnZExOQkMrNlNuOStHZzlVZjgyWWhiOU5uMnI5TzBuNWlLVS9ZaUVNdkdI?=
 =?utf-8?B?Mjl3dkgzVTFHa3BjSzVId3d1YXViNndjK2c5bHFWWlFTeDFhbE0rcmVoNkFq?=
 =?utf-8?B?bUtuTWhCK2dFYUNpU3dFNTZsTldVZHQvSS95eVMxUEd6WHc1VlA1NnRSbGJr?=
 =?utf-8?B?RUdUZmJOMTd2MFhOQTJxWkdNWXVaUEdvWmNHVy95ZWlWa045Smtmdk1XVWRl?=
 =?utf-8?B?YndvaVdOa3NEUHJJN2ZEM3NGKzVvSnVGUWZwcWNvTDNndlhQQlFWQTQyTC9j?=
 =?utf-8?B?U09xaFk1d2VtTXE1K0tPTWo2TUlUWVdKZWNrSmlYSGtHR3k1V2t1NFlGRmVH?=
 =?utf-8?B?NFZSL0ZnQklZcDNjZ0pRYmkyeHlLSkdVQ09NRzBCZjdScXJzOWxXSXFvY2Ra?=
 =?utf-8?B?NG9uQWx0emFNZG1FcjVnT1REakJwaytmTXptSzlmell6SjJSR0pLd0hsUGhZ?=
 =?utf-8?B?Q2pTU1d6amJDdHJISUdJZHh4Q0V5Rk1FUmR2c1RpSnJ4cG16VGNSWCsxV1dE?=
 =?utf-8?B?WjVRdXJlTW55cWE1R2d2Zjk0UUI4clByemZyVnJ1NjUzQzFGanRzSHh2OEFH?=
 =?utf-8?B?V3V1NjlqVjUvbWluV1lPdmFocTNuUHhIYUlYL0pPVGVya1FVaS94TVBZMGJl?=
 =?utf-8?B?VmVqWElkdU8vdVZqUkkzZWRvd29XL21Ickl5eTgxYUtBdFIxblNoOHl2RnV6?=
 =?utf-8?B?a01KY0tkQ1k2SUFsWFBRalByTTZsUnJveXArL0hBSmV0NGs2Q29JRTd3QlA4?=
 =?utf-8?B?YzBRSmdVNkpleUhjTWd6SENicjAvd2ErMUR6TG9oWmthK2M0cmdnZlpTaXBj?=
 =?utf-8?B?NU5xTkcwbCtmNEZ3VjBlOEQ5OFRxbWhOSFBuYlZudE1hWVdYdjFNTm1RTXVF?=
 =?utf-8?B?eUF4V2hBTEp0V2hHTHZ0cEZqRGtLcEJONFN4YWtDL1h1cVdXZVUzWkg2R1Nk?=
 =?utf-8?B?QmFtMmZtc09DMXVidDQwcWdGTUJ4MDNZbGlmbHZwanpqV0FOU3ZuNXpkdjVV?=
 =?utf-8?B?ZEdlWERNOTY2eTgrMDl6UDI1NlM1UjRxYUxxeTBhL3Z6T0dWVktuMi8vWTNq?=
 =?utf-8?B?YjVIR0QwT0tVUVZzMnRlNUM5WTFlSmJ6N3FJMnB5WGE0SmJKNnVGYVo2UG1D?=
 =?utf-8?B?UTZnTXdoUko4WGxUaXd1Nk5KbXBiNHNYQmgwZE1McEVVbEFKdEpBT2FLa0RP?=
 =?utf-8?B?Wi9QUlp0clgwcE1KWkY1bGJmY09hYytZL0psVmNZd3RPVkVOaWQ1cW9UTFFC?=
 =?utf-8?B?TmZsRVpaVHBwOWFUdDhNa0JNTWRuT2MyWWtuSnk3VW4ydlh3cTkrSlRxNnB6?=
 =?utf-8?B?YmpUME9Pb0QrS3QvUEFwa0tqMHA1MURLdVQySEt5WlJkc3d1cm9mK1FibGZZ?=
 =?utf-8?B?TEorZitYTmZ2d2Jhdi9tZHRVQ01GQ2hDMGpVVUxZSHJVV3U0bTJ1ZndjK2ds?=
 =?utf-8?B?MVBONGkyTE9yWjM5N2hrdSticUR5TU4ycHI1SjYxNzFhOElGUXIvY2kvYkFK?=
 =?utf-8?B?MjdKNXZXUncxbDBEQzcvNE9UTEpIeFhxdE5FUHU4WDBkcEJkbzg2NFRpOFI1?=
 =?utf-8?B?VFNiVTBnOFVqaU5QZW5TeG1FaTlJa0orOGRJc0dGL1UxekdnK2Zja2NORWJI?=
 =?utf-8?Q?20FKG0bWaGFytLZ3ddRlxwrQ2tA+qRzYgrcjmRA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d85ed0d-14c6-48cb-9d94-08d97f4199b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:56:37.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnhDj8i1QWTHWrN0t0N897BTOUMmdsPq4+bgW8bODIuoOXsSlqQa46TxUcSTKg74E1CwPZuoNwd3HX10PU1G+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet, update_contig_markers()
right away needs to be called in all places where entries get updated,
not just the one where entries get cleared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -42,6 +42,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/contig-marker.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.vtd.pgd_maddr)
 
@@ -368,6 +371,9 @@ static uint64_t addr_to_dma_page_maddr(s
 
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            update_contig_markers(&parent->val,
+                                  address_level_offset(addr, level),
+                                  level, PTE_kind_table);
         }
 
         if ( --level == target )
@@ -773,7 +779,7 @@ static int dma_pte_clear_one(struct doma
     struct domain_iommu *hd = dom_iommu(domain);
     struct dma_pte *page = NULL, *pte = NULL, old;
     u64 pg_maddr;
-    unsigned int level = (order / LEVEL_STRIDE) + 1;
+    unsigned int level = (order / LEVEL_STRIDE) + 1, pt_lvl = level;
 
     spin_lock(&hd->arch.mapping_lock);
     /* get target level pte */
@@ -796,9 +802,31 @@ static int dma_pte_clear_one(struct doma
 
     old = *pte;
     dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( update_contig_markers(&page->val,
+                                  address_level_offset(addr, pt_lvl),
+                                  pt_lvl, PTE_kind_null) &&
+            ++pt_lvl < agaw_to_level(hd->arch.vtd.agaw) )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr = addr_to_dma_page_maddr(domain, addr, pt_lvl, flush_flags,
+                                          false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, pt_lvl)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(domain, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
@@ -1952,8 +1980,11 @@ static int __must_check intel_iommu_map_
     }
 
     *pte = new;
-
     iommu_sync_cache(pte, sizeof(struct dma_pte));
+    update_contig_markers(&page->val,
+                          address_level_offset(dfn_to_daddr(dfn), level),
+                          level, PTE_kind_leaf);
+
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 


