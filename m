Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A1566EA1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361166.590554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyV-0006HP-0A; Tue, 05 Jul 2022 12:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361166.590554; Tue, 05 Jul 2022 12:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyU-0006D1-RZ; Tue, 05 Jul 2022 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 361166;
 Tue, 05 Jul 2022 12:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hyS-0004qy-N6
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:48:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcbe9998-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:48:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5252.eurprd04.prod.outlook.com (2603:10a6:208:cf::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:48:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:48:14 +0000
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
X-Inumbo-ID: bcbe9998-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6ie8G5VVPknGrhLe9djxcfGEJRRYM9iZiKZCAMGJj7Ag0NUeCykw6PD7IyKifMFPGGd/w4NZXu65bOPjh4/AxCZhRV+je3qb3+ETeFiSgLc8pLW2EFnXus90tbicZ4ijMMC/BmRc7uOC7dWYYwvXsMq5KihDuz9AV4MBl8Ao40eBxC2mjbDXS1CSLzeMfDkQD9L6sq8eb5qYLZZJUukn08EyV1edNvj4cqdTY13yq1coioebNQOOmNPXMqCK4JMBJNJzBdf6RnQqFWpsQe7+Ny3YaKvSoHVJeJfzmXvKpk01JXny047wSn+LeJbehX6mCgrdRiUD6JwXEafBXLaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x0wNvPPnwdgiVsTXX9OqkK4ScAeymQhxLWbmrRAFA4=;
 b=XVBkvQgQ43gaCj9u7r/gzAkCvB3QH04QGUqeF9hRZvYvxoh63aOq1XM3D3bC0Vq873NKZItqzMAD8AQW/5ODIkuUTXIQjurQbv11+dba7/9vEnhjwY409JO9iUmFRhJQN6u0U7BsMhq3XkP95SnfNsZLG2mQpyyE1L6GkFnYwnQTiREEjLDFxA4ebNVcFOuQ6ZHaxU3mMWbmxevtb9pEj+QXSIqXaKkNq0enBoXUTjVyLTXIFVD6jKUN6nUG14PfC8aXv50Ld+ZdfEQlNqU5JMWECy6gqw3TmNtLSbkR/I6yU5EBXsA2K2OMce/YLUmWeaQ85Jjl6IDEoVYxDXFdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x0wNvPPnwdgiVsTXX9OqkK4ScAeymQhxLWbmrRAFA4=;
 b=AbsNOTCnCf5G35oceswlwWWiN1KlP5WNsXMELoE+neIB+pA9jLg4Gtd8LZzRR4S0LcSW9aPWhRssfYXKbEvKcVqWoAMMxLBVvWCFC4uOzcx5IUe8RVqRf9r8OEXI5uQVUwlLZnP/b/Gs8fMtRBkuRLHQhP2agpMu450iOMNoRd/s3vclpu5dttHI50b1bNaKzE/FZIg3rL2p4MWS3fsaZ4B3uZS6Al9E/fkDq816CACuncZ9AwINkdG1KjE3zMLoc4cjNA5WmCbjjW8u/uv5HYsXMIBDAoAtmjUl9EZcMTIHWirWSynk90FUvhbn0ufyKJTvNCtNEMkxTdQ7E14BqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28b6c824-683c-6a15-d891-651f79d99300@suse.com>
Date: Tue, 5 Jul 2022 14:48:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 10/14] VT-d: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0096.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::37) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0879887-653e-4e6e-e4be-08da5e84a044
X-MS-TrafficTypeDiagnostic: AM0PR04MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y22/CE7Zis4myGsIV8tMvlIm3Nw/Eg0AYhEaYBLvnqrdarKonAk/NwKDFHd8S2Tyx/x71fYgrT0vRaPEJfOfxBptpjuzvhbE2T6K4L1WMcBPGWeuZX+hj2YwuqjikXDylEuAhu1YDO7/jdoS19HIK1tNBIuMBGPuZNSe4vPMNrwD6yz3r39HrIExRBOITKcUcfxfOAJSGYf1g427ADHfAeNwj0shdyIIe+O6jQzwHHRlH8ssQFOOBRS/2JRCyv8buW0Xxy69JxGGuFtYvg4WX1tkleUyFXAb5yfr7pWdKr+kdsJj8qdLi7m7+Tg8aHLltD5l5hcCyAiOwdV1vVLpybmc1/SAwFkPPfHn/rYU9vsCpYmE/GfWRxW72MnBHjhqyAqoVuTmfq2luPN1T3cjph4P8CEY4IKFHdFUl80mr8+zvCy7YaixVpxibATwAMYtjOwjqP0LCaB9SbQnf8LQ1UaNAxXLZLvRyruytRaKrsEW5QAEc7Nb/2iDqkz72nOv6wtIVcemdwkOdEAYe5YFSb4ykl6HWV7YfNJv9VQDFKP/fWaRelZK+L8yOKHxu2qKuz75HlIcb8QXtwvlFRk470j5Y7RTMePmyrqTajmdH8Zg/BAqvQ50DiIyPlv6yoafG0JQoYK0KrS9H4Pf6ewXsv/1mAfW2RyX7M4E4IEsdGP/V5N6Vgih0nIfxW9lkeO78nv+kXGyCJAR4PSROXT9j+8oyrBwiMGrCSpMwn4FWcRDfuzpCSCcW/wwANcGCZfCRgUhXrNyXHBafEY+2hUzlYn2cLk3EqVPThO6XIB3kgnb69N6X4oMSe7gIi/U6CIda8PsZVruwp78pduvJQaSfGny5MwqPRYiDQcyKR+KjjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(5660300002)(8936002)(6916009)(54906003)(316002)(86362001)(31696002)(6486002)(66946007)(4326008)(66476007)(8676002)(66556008)(31686004)(2906002)(83380400001)(2616005)(186003)(6512007)(26005)(38100700002)(41300700001)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRYTnZSOXBPeUhXMzl1dWsyR1psNHA4eFdiTDQxOEdJR1dUbU1EQUNNSHB1?=
 =?utf-8?B?RzFlNnVCZlZ1OEkxRk1JdjFMQ05QdGZZV0lYaGs1SjkrbTJQWmRlRkUrbS95?=
 =?utf-8?B?NkNoR0RNR0V1cE9FYTBWQU8rUU1YeXVpdHhlNWl5SkZpK3dmUDI4RSswWEo3?=
 =?utf-8?B?TlhvaHZCSGNuZEhMZFJFaW5nbS9WaE9qamFXSkNGR0p5L0I2Nkswa0U1Ym8x?=
 =?utf-8?B?bDVtci8zcG1ubjFvQTdXcFRURmZjVGd0ZnJkQlV6VmJpSG5PSll4R1lWUVRF?=
 =?utf-8?B?RDBEcSsvTjJ3Y3ZqVHpqSXlrUnlmSDFIcXc1NkcveVZsUXZUakJ5YkNqdjZR?=
 =?utf-8?B?VWNjaGZMb1BwYkxHaWREWkxIUlhOSFZWMi9IZ1Bxbzg1SnJ1S25nWVZmc1pn?=
 =?utf-8?B?L25zbUgxalU1YkYzeWxIUmpCMUh6dUNtRVlHdkw4QlRISklSL1UzUXMrUGdW?=
 =?utf-8?B?ZVAwWWlyNHZteS94QTNMMlg4UEFtMlFVUnNMYWo5UEpjWGh4cGpWWjluQlpp?=
 =?utf-8?B?dDkrN00yK1hBb2p5WlRKNnpVODRvRFo3QVR5Vy80cVlvSUwzS1lDUk9ubDJj?=
 =?utf-8?B?VUZLRzVKVzNyaEMxQjB0TGJtZmVUSlZtaTdDWTVkU2d4aW5pVXNWWFdrNExt?=
 =?utf-8?B?Q2ltdVIzTW1FSkluZUlHdXl2T3lMWlVDSTV6WVBFaS84blJ3ZWhJK0lpOUov?=
 =?utf-8?B?VnpYSmdNMlZQOVgvZUF3eHdQSDY5Qk9yN0lhTjkxWE5SSGZQd2lXYXp6MGJs?=
 =?utf-8?B?QURYSFUrZk5BZDAxSHZzVjNWQjlhN0VoNm1wVTdCZk12MVZ3NUZLZTl3Mlcy?=
 =?utf-8?B?bWk4SXg4R0d0TlgvdGw3ZHBCeGNTRjZ6cmptTUVzQXlnYWVIOXgxRGVMQ2xJ?=
 =?utf-8?B?N0FBeDFoZmw2MUZGK09DZ21pc3ZFMkZ0N29wQ1BaMGJ1MXBHbnJWaXdpSnpl?=
 =?utf-8?B?aUZlOEdia1ozZ2xvNnlkaVQzUkhiM2l4bkxlV3RPajdINTJGUU9uSDI1OVFN?=
 =?utf-8?B?SWJiUnNGREFlUmlGbU8wNmxFYUgvR1pDTFZvTzlGWkhUOThnMEhqWmN1QUov?=
 =?utf-8?B?NVBzcEFQd2tYMitpdmdUYURxU01yVGhQVDRDMGJMK3RGL3FsV0lCdExMejJx?=
 =?utf-8?B?bXNQcVVDMXFIenJVMVI5b0MxejBZTmVieGEwT29meDgwcEt2K1gzRzI1VXJq?=
 =?utf-8?B?dDgyQndCREVQbkxDd3Rkc01jdSt5VjgzOHVGZ1pjQmZnb25oSUdOek5HT1pp?=
 =?utf-8?B?anl2YUQzVjlCakI1NGM0WjkrVWdxbFNLS3BGbFk3b2dwZkJjK09sMzk3T1pm?=
 =?utf-8?B?MVhBMjRPR0ZqSkNEZDFHdDNKQXlNcUNLbjJIZzZGRzNnaE1ad1B2RTg3b3pJ?=
 =?utf-8?B?eGM1Vmx4d0Noc2JHQXgxeHh1Y2JjWTdmRmgwaGZ4aHR6UkVmdnJwLzdHeHhp?=
 =?utf-8?B?T2NITGNLQ0Fic0ZKNkN6cTR5K0k4M2svL1M2WkRQa2d6Z0FsaHFmK1FIeXc4?=
 =?utf-8?B?WW5jNGhWVVdNUk54dUhMT1dNVUxNMnRrdTlEOHhNdDFYOFl4Q2xNOHYwcFZj?=
 =?utf-8?B?L3p1Y2lPRTRSMTA5WnBjOWF2RXlub3N4NTM5dFd0TzRKaWN0OEphZkRxZlE0?=
 =?utf-8?B?NHZmb25oRmlNa2ZNdlNxUXYvODFrVjN5ZTlxOCtkQzRjWGVNWmszMlArZDRm?=
 =?utf-8?B?Z1FaTWVpQS8xMU5JS3pGSVEzZzZ6REFiM0ZSNzZGenRnNUY1ZWdyZHJnV0lr?=
 =?utf-8?B?UnJLSlJuWGFubVdsUnYvV0hvR05OOVRxSEliZW92L0Z6eC9pbDViQ2lSYnJO?=
 =?utf-8?B?R2tpY0hhNkNmYmZ4TXVzbkhXOVNRa1ZpWDlITGJvVDA3Rlg1T3p3TURtcWNp?=
 =?utf-8?B?THFBMk55TWpteGkwV1VZSmNvZmEwa1dZNUtBNTcvUWN5cWdyMnFrd3FQNmRV?=
 =?utf-8?B?Y3NDeXN2OUd3K29tL2dicDdITVgyQlUzZFUzTkFmWFFpZ1FsNHRhL21KM2VV?=
 =?utf-8?B?cXNjdTdkZ1BQb3RERjJ0TWgyb0hFVFliRnZaUDI5S21vdVNNVnR2aitzVW9G?=
 =?utf-8?B?bTQwKy8zWFEvWW5ibC9oc0hieHdNUWFkd2hVYU5Qb2V1TFd0S09NSEViS3Ev?=
 =?utf-8?Q?zhxoiylgVZ7yRDe0wuXZ8LoBt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0879887-653e-4e6e-e4be-08da5e84a044
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:48:14.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBcfg54tH01mvknuD7gps5K58vlo/jgTF8N2NPdrS1+AI/P54PgACJciVGOrzLAmFg5CC6KJBkGLmecDFvIqQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5252

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

Also note that cache sync-ing is likely more strict than necessary. This
is both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base over changes earlier in the series.
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
@@ -43,6 +43,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
 #define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
@@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
 
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            pt_update_contig_markers(&parent->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_table);
         }
 
         if ( --level == target )
@@ -829,9 +835,31 @@ static int dma_pte_clear_one(struct doma
 
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
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
@@ -2177,8 +2205,21 @@ static int __must_check cf_check intel_i
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
 


