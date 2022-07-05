Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC0566EA4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361185.590565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hzI-0007nl-Ci; Tue, 05 Jul 2022 12:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361185.590565; Tue, 05 Jul 2022 12:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hzI-0007l5-9r; Tue, 05 Jul 2022 12:49:08 +0000
Received: by outflank-mailman (input) for mailman id 361185;
 Tue, 05 Jul 2022 12:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hzG-0004qq-UW
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:49:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dac05ebd-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:49:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 5 Jul
 2022 12:48:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:48:58 +0000
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
X-Inumbo-ID: dac05ebd-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNyE7v3chRcGj64NGPKufaH6CbJF34KKW+tHF9qxH/GQY0eL6Xsl3ouu90sTOqw5lf/l4jpgPtM94i+WKLoEyq7gLNYq92kywDmW/eFyLa91b4G38VkKbX5l5eT12NdWsQ4CIzLAz/ze4uEPkfZOWS1PQHKUK55lc95qE5gz5pO6cQ1WvTJdamWtzku5ZxBfd2YHdKOEQJP+yl0HEcklSYejXnMexrQmYHlZTu5LIndN0emerwzHkDQL79aMT0tRz5hCSolmxqJkOljp/80G4cL6VGg/GS4aq4yjwiPAoRm1aJ9aGcOZWnIFp3/B33eyZeiubDkAsG/FdKLiFyOMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfKw4w4lT3delgxvxQXi2BzPNtcGD1oKtqm/W3kaSWA=;
 b=c2X8o/Sekjzrf0stbeZ7jI9m5Nuk5spR2KsJzzoKGvXerUBy9MmzJ4ADzHXzKGCAJzMBhLVB4hO1uyJa32RbXgDD2/MmJbATAiNXllgPF6QT8X97apQqIYcA6yFJW4nL+r/soP8JSlP5Cd1dsnz5BQi7cFUZDoO53NIeVyL91LOTHEtVrI3hoNYURr9y2FnOr2Vlo9pbfSRfyFY0v0g77+Ou+ZcSa/1C1EqAvExBjMlay5LgTxtjK3QPZjCrVfCyqR5N4I73bTwA0yREMuB9DJ1j901eSs/J9NrNt7x3T+QDFtzHe+YVAQ+Xchtle4qU4nYWStBKQO30fR6C9wikRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfKw4w4lT3delgxvxQXi2BzPNtcGD1oKtqm/W3kaSWA=;
 b=a2GQY/tJQZQ15VYjci3kY95TaZtoH7PWhwSHnyrgSGSq9zZnwy3ahcRQ42IzporjuYDtdSK9M3f3zqWyMMOZiqllaVpB4O0Fn2/fRK5Sza5uh795I3OvlC69wsSo5aT/+yyxhc+A3zJIya9Zw39/J2gv5qUPjwyfAOx92cja2H3TAzcyeLvgFot106l+BaVU4Hucqt/k/e1OHx+9b4OGdceprDRY1grxkvjZGghIh/S74QckCyyVLvf0xWziWwkSHkXuXCd58eUNZXHpeV1GnfffSMgDVfKjsLtCnZV/WkoiE1kTo2qQ5gKBr4TK/SqXTcwpG3PfWq0rfqV0rKz28Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ccc854e-9a8b-ffed-cd68-d26e5b3347ec@suse.com>
Date: Tue, 5 Jul 2022 14:48:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 12/14] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e55dbdf-6b89-4732-8292-08da5e84ba47
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A4lGjZNC1UAdRi7/Lz8b8r3tDeahl14AN8+1m4EZTeKVh6bKcxgEt0NK/Zl9f79oIGsyVNBbPLS+mX96zzB/jypTZKgu5VAg9s/bukjCzq/7f42g1sCoAnBMlJ/l9fx9vI6woYHkmV+3bI4wH5+gxcmB2L5oRrbt9zMBbt4lU8dPS2lwrWyUv8Q4eNy+q7TwyixfOsJcd2dsHXUkC5CElNUj10w6q0Jflr8KsUr8oLle6RfOHamd6jNZLmwg85HRacfG3uDTq5XddeNyKqoV5qYBmjZh1AiI7QhoMa7dcpu0EydTzOJdOHI1JSwhhuigmsgIOqPFNbFCGN+Fu8RkVr9Hd1UJbaxhYD13yD3VrsibABhx/h4tH6iwcg01CyOhrZu/ovviS4+pr5BiLWT6cTNK5FeDJWsO2h1hNVsPu0aXW47pAB4up/N5qawLkxReP7DDOaylVjcIkNoDJwYoMITI43gnv+qjqHadw87Lcr+L4IqXjBiGTRuqpRYc8bA3N49ej84ivV8r6Yz8/0DeZ2HpAFhZq0G/qC6HLaeOiUPGglKcO83npesczTmXKf5RpyMKPT2iMFkUSPJDRTNkWVIwnNKBszZsPb0rpNwaFZMEGcYiWLoakHZy3zZgMIX+uamFnsyRddyKBxE6COXkcR8Ovkiac2jSdsWV9sI9NFEIEfjDlLEzfZp5oMgeUSNo9KMPNFNk6xIrsvESbl2cQpd8YcAROH1iQk3XqYuWY7ov41qz0shTFfny5vyEP0/14PcbIGjkCqm/Dwjq7n40mRZ+Yor12QEhh6QCb128xb9gYffnyLna8PVmsIfUJ0r71pKPY9edcOw+fdFLCfqxCpRsDSAa8abCqHrwQ3bWbjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(478600001)(8936002)(5660300002)(6486002)(86362001)(31696002)(2906002)(6916009)(54906003)(316002)(41300700001)(2616005)(66476007)(66556008)(66946007)(186003)(83380400001)(6506007)(31686004)(38100700002)(36756003)(4326008)(8676002)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlY4U1ppQnIrVXF6T0JtNGJrLzdIM0tMYktQZjFMME5TMTJxUzE3YndxbUZ4?=
 =?utf-8?B?K1VLZGNQZ3NCaXRlRERaSXM2L1BVdVhudDN1cGQ0eGFvYlhuWkhQYnFjV2k5?=
 =?utf-8?B?ekQ3MUJIMWRrQ2xTd2ZvK0ZxUXM4bytrZHltVm91a295aU1hY0MrNEN0Ym9R?=
 =?utf-8?B?d2l6cTc0R2dEV1NDaWFQdEtHREpwNHJNWFpZUklXWjZxc2lVWm81d1o1MWY1?=
 =?utf-8?B?ajByMmZsSFhSRHdrL1R2djFGblQ0OXp2SER2RnBJcWdVQVJPN2lDTWlOZ3oz?=
 =?utf-8?B?dzhLZVVIQS9EWFYxSlNuZ0Rvamtsc0ZBeXFRRDBiczVEc1hPaWhVbTU0djlj?=
 =?utf-8?B?TWxySW9vSldRbDdHZitiemNhT0RZZUQyL2dpMk96U3k3WnNNRHVvOVZuRTZz?=
 =?utf-8?B?aFdtd1RFa2hLM2FEL0VCNEtQSWdUVzQ2S0FIKzlIc25sUlRHQm1uY0Q0YjB1?=
 =?utf-8?B?SnQ1LzkyYWZ5d1QxcGxTS1RNNHI2dkh5MndwRnlEdUoydmdiVHR0aVBjYnZU?=
 =?utf-8?B?cFJOTURnVC9xbmIzZDE3YVJBMG1ENE03OGFFU1gxaWM1UUtPWlJ4Z3B4OGhX?=
 =?utf-8?B?bXhxejRQaXR3WUlFRXlUdm85aUJxWnlGQ3Z3QnpRWEVvY1VsbEhWTEJMZHp3?=
 =?utf-8?B?TFhmV0d4RWNMeGg5WENpVjltaWl5Z3MzMmV6NVpsa2o5bjc5TnhEUjVVeHE4?=
 =?utf-8?B?RFpuUjEraGZBcEkvRWZPd0tjc055bVdkUUpRUXdZc3RGSVl1YW5jeks2Tmpl?=
 =?utf-8?B?dDlSbytDa2RCM0JtRkdLZlNzanArRENHQUluWjdENU9pUm9vekROUzcwV2hi?=
 =?utf-8?B?QzVPQTR1TUU5Q0F5WnlBb2IxczAzNGhmOXA4b215RWVnYm1JZVplYitJVWdt?=
 =?utf-8?B?UiswS2hwNHFqWjYrNE12T25iZkl4YllGaHFzeEVWc1ZBVk1YaS9UbjFJWVg1?=
 =?utf-8?B?bERFc1pYcFp4ZWUrSDNYcExVcng2Z1FSRGlBRHI3a0VQdzhzQlh1aG9ZK2xG?=
 =?utf-8?B?TXRkZEVWMldCMEhuYnBSUVJnbmgydWFIN3JLVW9zbWxMTFdPNHh4eTdtOTNp?=
 =?utf-8?B?VnM1RFJ5Wkd3bTI0RkpBVDBsTEd2UGpEaVozbnZIWlF5KzltUzNPN2szSk92?=
 =?utf-8?B?dnhWNkJEWGtISHlrY2pMTG9NWFNXczE0Y3pwWGNVVG5ZbkVWVXlDTjRXeGpo?=
 =?utf-8?B?QldQQnV0cWhJdlZneDR2Z2UvS2VucHZ0aFZBaDVPUnlqWHNIU0dwUGp6QWZx?=
 =?utf-8?B?SmtZbnZhcDN4TTJ3am0remI5VnpoUDZpblhtaFVIa0NMTS9NVEJBUGhlNDJX?=
 =?utf-8?B?TzU2T3A1dGNkNXpLMnZ0c2JsSDg1SlhlSXRrdktGVEdFd3VSalRkcVNvRDh3?=
 =?utf-8?B?LzVWNkJTdVJwVWlJbENNaDNMTmF0cFlQN04rZE9zMm4ya3lUODRnNHoybm9X?=
 =?utf-8?B?b0trbC91TzVicFZ5aU9Da1ducTNEUWVTSXdOWmdOc29IeFNKa29qcWVYWlVK?=
 =?utf-8?B?QWtQY1ZDa2FYYmJjMDE2L0tNUkpLcmowa1k4aUl2azhDV1NPU3Z4V1JyZ04x?=
 =?utf-8?B?aEFkQ2JYVlkrM0hPSDZIYVNOUGVrNDBLYmdmK294UUVsN21zZlBTblpiVFg5?=
 =?utf-8?B?NUJ4a0w0b1MvdFhGamZYS09OZGdPRktmYVFMemZPdmxiSnVyRXFGLzgzaG1Z?=
 =?utf-8?B?Tll0SDFnb053SzRuVWNJTHVjTU9sVEpyUUxOc1FDeXlxdG1YTmNnK3lSTmYz?=
 =?utf-8?B?TGlOam5sd2JjNXFlU1pYa2FLd1J0V01iMUFwMjRQN2g4THRMQ0JDVHc5TXlP?=
 =?utf-8?B?VjVjNmxGbG5NdEk0SWYxUSt6WXZUR3BYNm94bGp3RWlZcERjMmU1cFRpQVNG?=
 =?utf-8?B?bjdMQlBHUFpZR3J0RXA2M0xCckZvNzA3NjV0UTZtbGs2QVIzMGo4RUdDWmxG?=
 =?utf-8?B?cW01UWVoWjVBcDk3MDUrS3o0ZHdMd1hrNE93ODFxdUd1UFdYekY4eGs5bVRV?=
 =?utf-8?B?STJQT0E1UjdWYTVLZTBWR3RuUldJd1MxRzNJSEVYSklJbmxyWnl1a1hiZjBi?=
 =?utf-8?B?K2tsNUFJMmNLS0IwRExvdEhaV1Z1SFRhdXpHdURaNUc4SzE5NjZDYTJjZ054?=
 =?utf-8?Q?gxJfPliNkOCHbPMmPnJRklMuQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e55dbdf-6b89-4732-8292-08da5e84ba47
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:48:58.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/P730t/Ty3wWI2HCtYrrhIqfjqs9HJdxxrVBRxIk6Ikt+HNBTKaSGyNtk42DFhjvsHF6aeIwRQ8vlIabuAeOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
for whenever we (and obviously hardware) start supporting 512G mappings.

Note that cache sync-ing is likely more strict than necessary. This is
both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v4: Re-base over changes earlier in the series.
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2211,14 +2211,35 @@ static int __must_check cf_check intel_i
      * While the (ab)use of PTE_kind_table here allows to save some work in
      * the function, the main motivation for it is that it avoids a so far
      * unexplained hang during boot (while preparing Dom0) on a Westmere
-     * based laptop.
+     * based laptop.  This also has the intended effect of terminating the
+     * loop when super pages aren't supported anymore at the next level.
      */
-    pt_update_contig_markers(&page->val,
-                             address_level_offset(dfn_to_daddr(dfn), level),
-                             level,
-                             (hd->platform_ops->page_sizes &
-                              (1UL << level_to_offset_bits(level + 1))
-                              ? PTE_kind_leaf : PTE_kind_table));
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(dfn_to_daddr(dfn), level),
+                                     level,
+                                     (hd->platform_ops->page_sizes &
+                                      (1UL << level_to_offset_bits(level + 1))
+                                       ? PTE_kind_leaf : PTE_kind_table)) )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
+        dma_set_pte_superpage(new);
+
+        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+                                          flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
+        *pte = new;
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -232,7 +232,7 @@ struct context_entry {
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
-#define LEVEL_MASK         ((1 << LEVEL_STRIDE) - 1)
+#define LEVEL_MASK         (PTE_NUM - 1UL)
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)


