Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361B489DB1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255485.437826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xen-00069n-Cy; Mon, 10 Jan 2022 16:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255485.437826; Mon, 10 Jan 2022 16:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xen-00067p-9Y; Mon, 10 Jan 2022 16:36:29 +0000
Received: by outflank-mailman (input) for mailman id 255485;
 Mon, 10 Jan 2022 16:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xel-0004yp-BB
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:36:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 746e844d-7233-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:36:26 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-x9AfBvtDNsu14kHz6D9I_w-2; Mon, 10 Jan 2022 17:36:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:36:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:36:23 +0000
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
X-Inumbo-ID: 746e844d-7233-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JJks6iLXnqZbdVJXHnHne9F/os9YAY04CAdOZJgakY=;
	b=RuV+ANhIwcNhbL2dX9vsllUqL4+2K6WhPQ6uEn4g4Kzns7tAId4R6HCygEvPd9/uRamWeU
	li2P0QvQpfVSQ9MyP/3w4o2KMGE7WURYX3yD9UvuUsJ5o/WX6zfnRMxzZndch9VSrUMsx3
	TheFKYV4XUGMVt1mX7jwTUKqQ988vPY=
X-MC-Unique: x9AfBvtDNsu14kHz6D9I_w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHTRMtmmEE2hLOLG23RwPscowjFBQuH5dS2hfHm1QYgtBPTdtTPBImxZ1gceNzOv5oQrgZ22b3FwLVtOmcKqnwCTN/kSzwv2z8NEmk/Wh5etLv9G5HxEaeuwpTmrgVaij9dwG7zkedHAV9CuQG9N4Ae4mN+G4pKKAGFhJLIUC4AoAZd6b+wW21kEzJxcw4NfHSqy1jnBJ0MLA43VVZVnW+isTnTZuVhxkE+Q63Lu4aRjP7/8c4GuEvrds46yRjWdXi+2It3ApYXV9kKa4zmPWxEwPFtwYRdCEi7zOdZ99zH+YxIzvcY/hfKpsoyX9ArGSLGu/Y5N1ufjYZns2ONDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JJks6iLXnqZbdVJXHnHne9F/os9YAY04CAdOZJgakY=;
 b=BRvapkZ/kMBNywaVBV17H5cMnXaz9vDnqiwMe9vVfwChD+sPE5d/f5qOnkRcDnM+alAsijXvLf5vVqDxgLx6pj5VSTLgyVfSmrpkh9OKRiJBW6lgwMxDzg1mDQhVGyAdP/p2enFRpf7LbWaTsBkmiS6OnBXOKE1PLXGuOIoBo2UolBxY2umJL2HOovOPyH2WJcDzAUNQLeXihUm+jFhr9vSf5jPoyby0W8bUxZolzrgE4byT72YO5B8lrpcWafOvpg2/qKcJaxIzMeL/uWVz8ECHOzCr8IwKAG4vmQc+3uIEtDkFnSq7gDdY8LzHPboaXKAmh4po5SDgwS+hoG4KZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
Date: Mon, 10 Jan 2022 17:36:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 20/23] VT-d: free all-empty page tables
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
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79597edb-0028-4dd3-1446-08d9d4575705
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64772413233FAA06690435E2B3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Uzz8Z54+phrzr25gIj42tCtUg1AEJcT+uHpkUKEMgh3eW/aUOLr4XSgz6QyS+d62XUWJob3/eXOFZvuu0VEMk4oZZDX0w/zDaPMINX0773C2/1vSaQgTgy26dS4QxKWv+9YsdVBZWhYS20lPzBZu8+REA6O4r9lsvIJNzDTA9TAM+1p50/AFaPmT0OqI0Khn3UM1qf2B5U6zE3fRpvstwvyrsdkcWqHtWX2DVKLgLw18GRTVBeVrGxfjjz0+Mt1l9Xn9ctc25RcZvWekCjHq2yWT4J/6RXA4Ys7EWEfTg05fGuhj9QGWVH2d0L531yBst4P/9tE6f7BaQVL3W7HV/afLEvnT7yY5IIRocIOV1miAiKhN1rytsLWR6EiPrsCHjfugZBGgLzksfrrYmKEJVrkTpI4IwgANcC3tua9yYG3DEhObeeSJ2JBJK64TUQZQLs8DNSYnSvWAdUXfzCm69yfUst0GWThwXx6X64DVJMZMZxngqE/GEz/HYw0NrUjhIp2HYzh3QEUlq8YkqFYZHPGO/DKe5GwOadbeauyJzPjkC7k5+wGvTNBkRyKGW1TzczuW2ZTfsiWFT63Lo/+tTF3LNwS4m7AFh2j1ROiDI5ohdvUH7/vbmuLp4zykZ995IXOBT3nKENbs/6jrDweXdwQJxZZHuofbj/6Qj8Xu6mXZdjwLoqyCTgg+/yqb7uISx/H0Gi1AV674J4WhtLahsM5G/QZQqwj4xYPhad6o4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6916009)(86362001)(36756003)(8676002)(508600001)(6486002)(31686004)(186003)(26005)(2616005)(6512007)(66556008)(6506007)(66476007)(2906002)(66946007)(4326008)(31696002)(83380400001)(38100700002)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXVHV0h3dE9rL3ZpaEl6ZndYVEVoZ2YyTVp4dlYxTmFua0RjMElPZUpaUW81?=
 =?utf-8?B?SHhlb2NNMnVCcXZ2UjJxT0xXVzNPaHAwV0ZPWjFNNERXcUpxK0F4dHRTb2Qy?=
 =?utf-8?B?c21qcUZKalQvT1QyOE8rU1l3Q2VkR0dsME9RVnAyaUxvVDhzdDRUR2U5eEQw?=
 =?utf-8?B?STlpbzlhcVUybWl0ZGRHVzdkSFBkM0txU3V0Um1QUWtZZHM3aXRxQlkvUUQv?=
 =?utf-8?B?RWRnNWt1aUx3TWlVOTRDWDlua1NSTktvQUZuM0tFbG05OUMraTR5TXNBTnEz?=
 =?utf-8?B?RzE1bUVDOTNWVFg1OE1yc2hZTVJyekdFczc3Tld4Y3NoUUxvTHRUY29MQmp4?=
 =?utf-8?B?QXo1UGU3cUlReDdEeVFiUlZ0L2lPUFlWVEE3dnBEeFpCTzBLeHl5Nm5LeHVq?=
 =?utf-8?B?dDJFOTlrczFvRFNtMThFTW1RaUdSdGFHYmkzTjV5YjJTcEVhc3hVa29sNWFS?=
 =?utf-8?B?YTJsRlpHbHErN21JUFI0TmJSQUtYMytRN3FOeDlpRHFoWmhYb1RzeVpBRTY5?=
 =?utf-8?B?cG9YU3k4NmY1czI0cjZvOTI1ZTJid3pHQmN6MXV5Z2JnTW1lbWZnb1FZOWd3?=
 =?utf-8?B?a0hpV3dycWdGWGl5Z2p4VDVMTHpsZjFSWXRXZjlpYndKK2ZrcytpeklGLzhS?=
 =?utf-8?B?VXdzeDFIS2lRNEwvMkJwOHlPRUhjSHlUVTJpU0hjL3ZyRFllNzlSd3hxTFU5?=
 =?utf-8?B?bk8zK24xZFBPMG5IY0N4OFhXZlUvNStVQndYMFc4YVEreFBqUWV3K0I1bHFy?=
 =?utf-8?B?M2FDYzdmYmNPaDR6UHgveFJhOUdlR0owNXZvS1VwUzZsTVZUdlZ1TWpEUSto?=
 =?utf-8?B?b2ZlK2lEQnpKbXB0K2VaSkNBMlc4d1VyRzE4eVlwaTBSTWQ4TFZCZmlHaUF6?=
 =?utf-8?B?STNrcHpRbnVjK3V0UUE1MHNsZU1kcGhCWGFFVUVUZkpSb3c2aEdiaWZKbm9i?=
 =?utf-8?B?OVFiZmQ3L1plTFI1S1UxRXZBR0xnR2VVTjlLRXp3WGVNZ1FzN2lsVjFFcFZ3?=
 =?utf-8?B?alM5TjRTaXg2QmdnVDBjL3JyenZiVk9sdEtxNE8yaG9GYU85NnlYT3V5bXpw?=
 =?utf-8?B?elc5ZThkcTlxMG44aDFZbUlUOHpSQWJlVzdMdCt0YnBmdDhIVUtFakREOGNm?=
 =?utf-8?B?UTM0cXNBcjZGQ25ycHphclhwNFA1dndROTR1dld1N1lMbXphMVhLUWc3RHVO?=
 =?utf-8?B?d3djMWwyK1NxM2JPYytacTRpc2FsNHovRVVXa2Q0d2ZDYUhWMElLQXgvRmdB?=
 =?utf-8?B?bE4raXpWSDhPUkhpVG5Ub3lQY0hDdm5IVXdSZDVER2swZ29Sci93cG5seUFt?=
 =?utf-8?B?R1NkTEVXcHFpTitZaThyKy94RWlxMGpneVRkNFBHVHdLTWsrcXNhdGNnSUJN?=
 =?utf-8?B?UVlZdGZuRVNDWjhaUjRRcGdMZllTNUFRRFczYjRHSGdwVjNjY2tzSnAyaE5Z?=
 =?utf-8?B?bFVSa293Slo4cFhkeW1tT0h4Ry9ZTXVWSlV4eGl6OTJRL3F2TXdMclVTQmhT?=
 =?utf-8?B?di9PVWRSTGJUQ29pVWM5YVZOeUlhWlZwb2VtTDlTZUIzRWxwNnB1b1JCZzFW?=
 =?utf-8?B?TUlFMkNyUCtncXhKRkRZWDllS1ZjNzBOdlFWWUJvcjdQd0lBT2ZkaXA3UCtw?=
 =?utf-8?B?K2R3WlhFOG0yVjN1TlRiVmU2aG94OThncDl2STRJblpNeXV1NFBoNFVCWGlM?=
 =?utf-8?B?bks5MXoxT1YwM2dEK3VTaS8yYWExbWx2K0p0SGhGek9TTkdPVzk4Q0d4YlIz?=
 =?utf-8?B?YmJxZklDdEs2cThtMmhHRWNkRnZ6S3BHS3FTZU82UFEvZ29hMzRqcmNiTkdp?=
 =?utf-8?B?V1I5NStkdzFvN3lUb2hPck9heU0rZDhzRXY4L0MwUTEvMUVvRTh1bnROazg0?=
 =?utf-8?B?NGZLYWgrcEgvU2tid29wOUQzYisrZGE4ZFR0d3JiOCtkcGVsU251SFNRS2tY?=
 =?utf-8?B?M1NMOXk1SHNTL09pUWMxMkdsMjR5U2ZleFdnN3ZJOHRGUzkyd09acWtBYzY2?=
 =?utf-8?B?M0xnMGNUanEvZXRTRmlYalY3cnlnNHdiK09IMS9FYm45bnVaVXE5cEJpWVdS?=
 =?utf-8?B?YkFiVDEvMVNWeTVjNHRNRFJxTzhqVkJnZEYwdzc2NUZGYjRQSk1ycG5vR3Nq?=
 =?utf-8?B?YlNhSWdZV2FPa0JGaENBZUUrRHN3Q0pacm00QmVzc0lFU2J6ZkI4TkdQcjJK?=
 =?utf-8?Q?Z3yvV480LHKQNt/0v6W2nwQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79597edb-0028-4dd3-1446-08d9d4575705
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:36:23.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RtBamhs2V1al6wFByJPRBYTUuBH5OWDHW8G5RiM8MV8708RCPu4hnE6zJTCoGB5mKlCo/0EeiBZQMPrmwLUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Note further that while pt_update_contig_markers() updates perhaps
several PTEs within the table, since these are changes to "avail" bits
only I do not think that cache flushing would be needed afterwards. Such
cache flushing (of entire pages, unless adding yet more logic to me more
selective) would be quite noticable performance-wise (very prominent
during Dom0 boot).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Properly bound loop. Re-base over changes earlier in the series.
v2: New.
---
The hang during boot on my Latitude E6410 (see the respective code
comment) was pretty close after iommu_enable_translation(). No errors,
no watchdog would kick in, just sometimes the first few pixel lines of
the next log message's (XEN) prefix would have made it out to the screen
(and there's no serial there). It's been a lot of experimenting until I
figured the workaround (which I consider ugly, but halfway acceptable).
I've been trying hard to make sure the workaround wouldn't be masking a
real issue, yet I'm still wary of it possibly doing so ... My best guess
at this point is that on these old IOMMUs the ignored bits 52...61
aren't really ignored for present entries, but also aren't "reserved"
enough to trigger faults. This guess is from having tried to set other
bits in this range (unconditionally, and with the workaround here in
place), which yielded the same behavior.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -42,6 +42,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.vtd.pgd_maddr)
 
@@ -452,6 +455,9 @@ static uint64_t addr_to_dma_page_maddr(s
 
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            pt_update_contig_markers(&parent->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_table);
         }
 
         if ( --level == target )
@@ -879,9 +885,31 @@ static int dma_pte_clear_one(struct doma
 
     old = *pte;
     dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
+                                          false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(domain, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
@@ -2037,8 +2065,21 @@ static int __must_check intel_iommu_map_
     }
 
     *pte = new;
-
     iommu_sync_cache(pte, sizeof(struct dma_pte));
+
+    /*
+     * While the (ab)use of PTE_kind_table here allows to save some work in
+     * the function, the main motivation for it is that it avoids a so far
+     * unexplained hang during boot (while preparing Dom0) on a Westmere
+     * based laptop.
+     */
+    pt_update_contig_markers(&page->val,
+                             address_level_offset(dfn_to_daddr(dfn), level),
+                             level,
+                             (hd->platform_ops->page_sizes &
+                              (1UL << level_to_offset_bits(level + 1))
+                              ? PTE_kind_leaf : PTE_kind_table));
+
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 


