Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8143416FAC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195182.347780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThw4-0008QK-Qw; Fri, 24 Sep 2021 09:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195182.347780; Fri, 24 Sep 2021 09:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThw4-0008ON-MA; Fri, 24 Sep 2021 09:56:04 +0000
Received: by outflank-mailman (input) for mailman id 195182;
 Fri, 24 Sep 2021 09:56:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThw3-0008MN-1h
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:56:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fb259ae-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:56:02 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-Zt7p6K7bOJ6cFH9_m3En3Q-1; Fri, 24 Sep 2021 11:55:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 09:55:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:55:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Fri, 24 Sep 2021 09:55:58 +0000
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
X-Inumbo-ID: 9fb259ae-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ote1TPd9Kh2XKCxDVFlIWjOJeJk0V39fRCOYujD0nE=;
	b=SwY+3xWjW2cTRjegXPgxgKsnL9lWR1UYC90UVACMLBUhy6dcsucksPki9Ap5z0/cn/9Lkm
	LDiXGzbwRUtZKf/UTHqxgJGxyrw9tFv7THWY3kcSk0E4s//V/NBpoRFxMVrMN3LEeAftOe
	0xvaQxCJgiWkRWi2FSWumZ8ranYMTTk=
X-MC-Unique: Zt7p6K7bOJ6cFH9_m3En3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Velw2ue/po/y0uyNoYLXAVczhFp1edbNoR6+iRESXltNhjrRtxjUEsQCL+kf0ds8luMqbhDL5RHJdW13aMvUSyUKNCKhs5S0OWjxNiwYf+WeYDAibEr00KPE5Y1O468rKBjLIDO9VtVUzSZPANxWNHoo+tbdJygXUXTa1kXPmXRZTtkSqEABYfuum7aLJ24wlU/Rsgf56z2cUL4kNaJFx3Y8uxP7mLGQGJxYwtcNWiJaJMfmWcWBN4hBpbqSijobkNa1qqZ7XAC/Ft+I4nqB2HnnNEVUDe6Pt0QxcDQfFV9KJ52suVJ9UQxLkh9wQk/Jc2sM/nUnV0IwN52PpZ4Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+Ote1TPd9Kh2XKCxDVFlIWjOJeJk0V39fRCOYujD0nE=;
 b=M5dOqTnME0e4T0ErNxdxZgQdr89pdfihEzmL1JqN2SA6r6mRvZ0qQPC/LEcJ+50dtXb5Er0QUcXZ+FrrZLtLII0yabdQ6eYiLHY1geeinnC2WyLHZus6f+vpIXWzJaEIxmjG86PSPKPctbOkHUQQNMkidXa3yrg57c3L4yn2kS7ODI1ONRM65tqxVr7Ey4e7xIsCXY1yJn6KNuOrqWq9gScadmWUgfMPgSVXtapobMAxuaVRaMj6J2buZ7djDmp5QhSHxuBlzhcbqFEeQFFw6BjHKCc/SWZPHsbH+UjVM+jhBK88n2++vwsAchcWmLZoRMGClzJ44FdIdihpuSw6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 17/18] AMD/IOMMU: free all-empty page tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <ef31b6f4-09f5-cded-a235-5dce3c5399ce@suse.com>
Date: Fri, 24 Sep 2021 11:55:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e75dc628-f4e8-455e-2399-08d97f418265
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040E2FA4A6C69B2EA047628B3A49@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cDHMBVAcUywx9qicKDYwVW//qYc1RIWCGYh4ljcKo+5eJn31ejM8MSf/LZN/oOpjE+Kb/pOLt+l7GQah5RA4KZRfLwIKCxDNO8+jrjEiSAcdQxfh5KXQJwcFppbR1u9qK8Gmd/Ti+s+/lNV+qThjiLyHNrSelYT8G5jy38S9ONJfYtKGCyIoedfpwaQJEiUZCp7k3EHBEe3kNENLB55RLtBw6loh2OIELWXOEscIs+Z1H9p8hV/Ao9z2gLsZG6zBHFFSW5H2i4KpRR9b17IFpagH9Su8BdZtIvTBE6M86aicCv9WhtwkKEjkV7jaxUG78MMF3qt+IljLFb+9qu4ksVfQOQBlZjFaILuzsv/J52Av8OwerH7jZ8uHnzJ6+XFXs4F3O2HCsiNo22JaoXHQSzt/wlXpqgLmmgFn3/8gCqAXvuP5pn4ZjtlfVejMrIW93Kqc/0kwWY4thcFIrXYxEO5+2BS/L3rjt3bvDSaKlZLwHatuNR6ajvivuPzdhYm1UXjrM9DPvA7JW0oCCS8n3ZYkVZdMWwE+yvp1M8ufkAxXKH+zAc1NxZiTYDV/HtTT4jxWvN5c0aCPxnfTvAiP9SlwzQsF54/oVMz+RY+uLximPd8JeQimy7C9lnuiiMlheSfeqfz6iE1MxHKMfmjUVNhm1UQK3V8IPSMDSFHYP9ovqknMOMiRsqfFmxUt7/WQ969wULSaRcrs5h9pnQC/wlzKTpXZhLXTtP81rFkbcas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(86362001)(83380400001)(6916009)(508600001)(66476007)(66556008)(31696002)(38100700002)(31686004)(26005)(8676002)(36756003)(66946007)(16576012)(8936002)(54906003)(5660300002)(316002)(4326008)(186003)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGhCL3dyM2JnMHhkd0hoT2xIWVI2UVZrUFU3akloVGpveDJCYUpRdDh1dENJ?=
 =?utf-8?B?cXdFano3TGUzcmZ0d3VET2trRjRHdDdFeXNGTlRYSzZzVW8xd25DMUoxZVlZ?=
 =?utf-8?B?Nk5tUk5OandtK3pqZ0thcjZ4SE5nQUpkRGxlNk1ZbWxadXVRbDNFcVVlQVlu?=
 =?utf-8?B?SHdaSERPYTN6MnBnKzB3ZmM0VmIvbU85dHc2eWhzYm1WWU9XQ3JIVE9Rc2NG?=
 =?utf-8?B?SVF0TGZWNUI2MmJRRjJyRGdCNGtKNE5OUmNFMXFJYTluYU9WVTZkdjdQdUNv?=
 =?utf-8?B?U0V0eklYdUtETXRlaDhoUHZ5Q2ZFbi81U1Z1N2dIL3pKUDd0ampNQTJNN0tq?=
 =?utf-8?B?Ym93YWVodzdpWWllQzZWWWJJVjVOK3dQMno1RWhhWGppVVZlN0RqcXAwNno0?=
 =?utf-8?B?QmluLzd2UXJMaWFvUWFkZEZkRGxLeGJrK2QxaXNnSDYyVGFwYUJEbUZ4TUFn?=
 =?utf-8?B?bmVLc3V5STg1OUhaMWYyNVpFMW9SVkYyKzFBMDBLR0FZYlZ0eis0bG1vaDRk?=
 =?utf-8?B?Q3RFMHFOU0hwbTZrMk56Tmg3S0dXUVdRYzFsb3Vzcy9nUjdBc3RWQmV4K0FY?=
 =?utf-8?B?NmV5UFFvemRrbm1BWFlEVFp0SFdHVGQxTWE1WHJMc0M3cGFSa0NkTnFaR0Qy?=
 =?utf-8?B?SlU5ek9XTURINDl1cU9jY0VqR1NoSnRFbE40OXczdk9JR3dFYi81VE5jZzBV?=
 =?utf-8?B?MlZ1MHdOakY2eVBFZjYwVnVUNVpCUnFsc2xtV2FENUhMdXhxUG83OUV0TnJq?=
 =?utf-8?B?NHhzWlltbU5ObTFYQ0JjOFdQNWhCY0lkUkI4SDB6M0l6TDRzM2JBNHkrL0xS?=
 =?utf-8?B?eXlhVlo3Mnk4cExOVHdvMEc1MGwvVlJvYWlxMUpRSGMzNlhjK3ZrRG83WmVH?=
 =?utf-8?B?NHJwVGNGZXVPeE9Pc2Z0eW43YkN1SmJFZlFjOEVwN2hZOWFzZEpXZXBidXI2?=
 =?utf-8?B?UDZkV2RRa1lCUjdobmZqVjFaUTVtVjdjQTQ3eVlsK2FzcGNQSmpDU1Q5UklU?=
 =?utf-8?B?ZENIV3B6RWE0ak5GbXllNlc4eG1udVNjaENqMy9ncXc5TjY4cHN3Um1LYjFs?=
 =?utf-8?B?bjkwL0ZEWVVtYm1BYVhaaTVoTEFaM3ExaFJOR0N4bjlkNjJRYUQraTNKSkNx?=
 =?utf-8?B?THpWemtRcXh0bWxwZVY1cFFNdG9DamVLTFJmUm51ZDMvZTBEdUZxbWxQcnk3?=
 =?utf-8?B?d3g2blJYcm9zYWpzbGNRenJtSXBwVUgrdkRVTmswZ0Y5RU5PV1dkaDJjWDlC?=
 =?utf-8?B?QWZGOGhyRy80ZnFPbzdSZXd6ZzlSSEV3MkVkR0NpNGtwNjIvUExtOFc0R3Zl?=
 =?utf-8?B?Y1h2b0doeFJkb3p2Nm1jTkV1Q2JMbXVBcmc3L2doQURZNk81cHNHOS9yMWs4?=
 =?utf-8?B?a09aR3V4UG9NR3F2cjBCdWNrRUFad25ycTZTZ2tJNzJkK28zeTJvNks0NVFn?=
 =?utf-8?B?c0w4N2JOVCt3bVkwUUpWbnZ4ZHBzNjBwbTJ5NVo4Q2JUazh1OFZROXUrdWhW?=
 =?utf-8?B?eEtqMzFObVFzKzJ3WUpwcHZhNXJ3c0V6T1p6NW9LR09JMWRYb3BENFJyVjRa?=
 =?utf-8?B?V285TW9UTFlUenVlU3p0NTd4M3NtZlFRM0tPaHh6NXVCYjVaaFp5UkZDd2k1?=
 =?utf-8?B?OXduVUp6bmkzOUpkdGxTRTloSU5EUUUyREdXcjBVVXpTRmtuM1RLeHRJNm1o?=
 =?utf-8?B?QmdwUnBrOW9aOXhQSlpxSG5sOVdkdXZKT3NSRmFYNVQ2RlcyNDdmOStXWFRp?=
 =?utf-8?Q?1wg7C9QRJxytV/go8DkK2h5ZJTfOtyslu2BwUg0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75dc628-f4e8-455e-2399-08d97f418265
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:55:58.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zD/qbOFOETGAYa+ORXpvwOdg2Fl1FSJCgS9qv17d27nCJ9gdf56sQO2ebNnUpRdaBAn09fbaoYK2BdbFo+vbnw==
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

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,9 @@
 
 #include "iommu.h"
 
+#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
+#include <asm/contig-marker.h>
+
 /* Given pfn and page table level, return pde index */
 static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
 {
@@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
                                                    unsigned long dfn,
-                                                   unsigned int level)
+                                                   unsigned int level,
+                                                   bool *free)
 {
     union amd_iommu_pte *table, *pte, old;
+    unsigned int idx = pfn_to_pde_idx(dfn, level);
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, level)];
+    pte = &table[idx];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
 
+    *free = update_contig_markers(&table->raw, idx, level, PTE_kind_null);
+
     unmap_domain_page(table);
 
     return old;
@@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
     if ( !old.pr || old.next_level ||
          old.mfn != next_mfn ||
          old.iw != iw || old.ir != ir )
+    {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level), level,
+                              PTE_kind_leaf);
+    }
     else
         old.pr = false; /* signal "no change" to the caller */
 
@@ -259,6 +270,9 @@ static int iommu_pde_from_dfn(struct dom
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
+            update_contig_markers(&next_table_vaddr->raw,
+                                  pfn_to_pde_idx(dfn, level),
+                                  level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
         }
@@ -284,6 +298,9 @@ static int iommu_pde_from_dfn(struct dom
                 next_table_mfn = mfn_x(page_to_mfn(table));
                 set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                       true);
+                update_contig_markers(&next_table_vaddr->raw,
+                                      pfn_to_pde_idx(dfn, level),
+                                      level, PTE_kind_table);
             }
             else /* should never reach here */
             {
@@ -410,8 +427,25 @@ int amd_iommu_unmap_page(struct domain *
 
     if ( pt_mfn )
     {
+        bool free;
+        unsigned int pt_lvl = level;
+
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+
+        while ( unlikely(free) && ++pt_lvl < hd->arch.amd.paging_mode )
+        {
+            struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+
+            if ( iommu_pde_from_dfn(d, dfn_x(dfn), pt_lvl, &pt_mfn,
+                                    flush_flags, false) )
+                BUG();
+            BUG_ON(!pt_mfn);
+
+            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), pt_lvl, &free);
+            *flush_flags |= IOMMU_FLUSHF_all;
+            iommu_queue_free_pgtable(d, pg);
+        }
     }
 
     spin_unlock(&hd->arch.mapping_lock);


