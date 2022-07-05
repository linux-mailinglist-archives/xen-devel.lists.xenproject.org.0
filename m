Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECE566E98
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361153.590499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hwL-00049J-So; Tue, 05 Jul 2022 12:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361153.590499; Tue, 05 Jul 2022 12:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hwL-00047X-PU; Tue, 05 Jul 2022 12:46:05 +0000
Received: by outflank-mailman (input) for mailman id 361153;
 Tue, 05 Jul 2022 12:46:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hwK-0002H7-JC
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:46:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dfd3854-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:46:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2613.eurprd04.prod.outlook.com (2603:10a6:4:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:46:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:46:02 +0000
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
X-Inumbo-ID: 6dfd3854-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeVZo6k2vo3HxUd61skklc3XW1YHRFA1fOxgL2y9K7gF3S7qWETxCDm6buR8rkgHZm3ZRtc1DQqltw78OFvGL4oSpmuQTOIZQyAZujSxVoz3XL6K3TJVYlITUiN3xJGuvmCcoKBRDSaBG8FkKPIpt0B0/7pe0QOiXwaj4fp1TeMhvgfanuF3vqSWvTUaP6hrD6jSQoYNKx1A0RKGXywJeiE2Te56qSp8lEOWxpNPfW98Qgl8yi2m3LjyY/veQf0Y7s+AwTDcwtDaZEWmkW/GQZ1BKtjDyso/apZv9cIA7NepiCkXBuPtKtj3/My1NBfK7djW2ej4MfHB23CuYkjq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxiRfgvA8ZTM896+3sr+fZ7fI2k/BkIKHoJCeGpTy2A=;
 b=SYYUiUPmOzbBNJ8XGGYzRh5+ninbFOY8YzF1rZTPWfaDH+gagyiK+H+Cdf2aAnw/QRsjY1vXqO8slONz9v7STFUl3T73yk12mM1XFZeHG3Pc12y3FKbxoKrwkb0IFQYs6NMu4TJn5fqulCOFNNO2CZqPiayOcscFmAx9NQBXgnfMhH8Vw7MEDhbiez55PoYOM2LRxcACdZEoVoWasRxwy85DxRWGlnFNJBAnk9dBEEvP6IfAKM33dEVAzSvfwbeQdt3NBr4ys78/dOrpCLqMjUtb9jTfSbYaWEJwgxUhob1wWRy2bVjs8TNzA+ZTrHx9AzrZQe20n9kllEAvpRzCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxiRfgvA8ZTM896+3sr+fZ7fI2k/BkIKHoJCeGpTy2A=;
 b=NaL8Twi3TlfKCL8nQeZ8ROXCnfc9Su4o1N1I3/u1WFg17c33+pZNiZAxnmap2jBQNAzI8wpBHOHvNsAO+5VUOrCD2QN8MNera4WqRY0hBz0we1FwMq+gyC5OyjOa50jcWiDS4/zD8fqkvbIRIOMOw1X5HoygLU/lnwQQCbWilqb+t/yPDCRd2DTfmZX0nHJJ0De+lLfuT+I4JXzYUeiYgBkzfz+Rr6XETE3Fhi2zmonOwEPbyeGMQLD4HLyPQd3xgQ0nIDp8od/v0QONBagTNMtsylrtF5Oc43UBa84RL3wue/VmXGLJnvSVpfkBINvzJ1oR9nbMtCMjpsVQX1ZEZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbafed29-ae2f-6227-ed30-9157230a041b@suse.com>
Date: Tue, 5 Jul 2022 14:45:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 05/14] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 922945e6-f728-4313-9b10-08da5e84514e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Am3lb050fsu1JpFh+dv896fE0Gef1NCKRuC9V50G3oUnQAXCj9III8IvjBqtLLxQ+8Qw8FfqCctj2yLVjRmA6gR21RqS8pQO5LvjXt9CpABke6ON/VQCSDHvX/sM5RSH8et8iv2Z2PoOYPUv3n/dWWAYdwQT6RVY45LOrJpJNTC81Tn9z4nxwMJOllCBEZt16NkTpDsZW5A6bhGxVQe5tSvLhQL51quv/d5D93jr6zdyxhJNIoGoLZ/zWj0lfKRc9zgSy9XUlDU73b3NEWFDkzllsxbULOzFhcBcckPwqLgtD6yKGQhE/lVMoC1Q1vF2pPNZ0Xe1nUgrYH706drhEKrrJcLdnyZIxEp9LMVdR39b7rXva86x7On5GTN8+sOIS60sJIQRbjMAAVzuAnGnih4MCc1YUMJZl7cPs3KvYh/4WxlJcfAvmytneh/u03vsgIFJW0bgvPYMZFRshsMS/CbzLYz3kFHJ9PeLXPPiWNrXmrcBuqMjEw8cIzu98+2dgDsz/AN7cdrF8IN3UsBQaNacO01sAVuDmTL7XbIac2j9ZmjSX74p8XKf/9l2Jl+cKZKVUf9ihODj+JOJ68b4RHVHC0cJU8dLrET3g0/EXsbDFJvv7ExAFQhFNs/LR74Jgl8ThAYjQ5GUH6dPIfo+WzZMlAY7uhlZfTu6ZSMPpD1EPSEuYfX6beUZ/OHT92DmAllSvCh1fTrhRSXZqd49q+q/VE34ZnZB7n867JF6gGa9vSYoMj2ifnEVw35pPPpbWcMmSJbHDysWn0ecJrlJCORV102tr15egk22qmj2JuoBXN9cVPmyEgxS8cZtOUlrOk5iajA9n7Cvc29YOBF19uGsG7YhOOZQkxpgKus2Qec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(31696002)(38100700002)(6486002)(478600001)(86362001)(66946007)(4326008)(6512007)(8676002)(66476007)(66556008)(5660300002)(2616005)(26005)(186003)(36756003)(316002)(6916009)(31686004)(54906003)(6506007)(41300700001)(83380400001)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZBclorTmsybVRUWkRsZHlHVDl1SGFXUmpseHVBNEhrTHJ2Z0UzZFRjMVVG?=
 =?utf-8?B?aUJncDdQMzl0M2c3S0dielpKTW5Bai82cUVGYTBDYktFbVhDM3pGN0lIZ1dl?=
 =?utf-8?B?Z3pTRUR5SmtYZnR5Z2FOcWZPMm9hL0FYek5GOEU2ejYrRW1HUUtNZFplSGRw?=
 =?utf-8?B?b3M3Q3dYU2FXNFRSKzlGQkhJN0V0WkJIMGY4R0FhUlkwYmltUzBtWEFqcmhv?=
 =?utf-8?B?b3NjZVNYZENwZ0JITEZnbjlLSVBId2JVelVRd2VOOVkrald2akp6WHRBMkZU?=
 =?utf-8?B?RytiVSs0a3VNTzM3R1E5WnNxZXJEOC9RVEpkN3BYRXVxaENZRTBPblNVYTRX?=
 =?utf-8?B?bzRBemhkKyt2aWRHcFR3T284czN4bEdJN3dteWl4NnRuYXRzaDh3d3ltK2d6?=
 =?utf-8?B?Tkp0VjMzVHp3TlI1SWQ0ang4RHh1MlNxVzNWaEJZeGNjVHNPeGtLWDZlanRl?=
 =?utf-8?B?d0FUSWFxenJBTUlGYVFCS1Y2eU5mWHpnUnZvekxDZkYvOXVaZTlNVEFwNHBh?=
 =?utf-8?B?Wlhub01jU2I2Tkl4cUNvK2owSzIrQktMbFdwWjNRUmhweVZBeDlZMTVCUnZH?=
 =?utf-8?B?bnRUblQzWENhUjR2dWtrWXhZNitxdk91L1B6aW9LdllUR2huVjZuY1ZET09T?=
 =?utf-8?B?NXAzNHhrMXFtdDhKR1hxdEMvVi9oa0RKRGZTalNBNnBKSHlBaGsvbnp1K2xa?=
 =?utf-8?B?NjEwZGpvSTlGVHFDVXZndkdpZGNJdmtRdmFXVVlQdEkzMGh4V04yQzlkWE5n?=
 =?utf-8?B?cURjeDkwRzljRTEra3NJdDlkYllDdXkrOE5sVmU2dnMvNG1VaTcyT0p6ZTI0?=
 =?utf-8?B?UHdBdzhGbGVWSVVlK2hyclRJREE1anlHU0wrdFE2dnBoRTFsenA2RjRnY3U0?=
 =?utf-8?B?dGJ5NlBRTDhLcjk2RkNIbkJMRHpMWStpYnFTYTBqTFFvcGQxUXF4NjhNVEF3?=
 =?utf-8?B?V0lZLzJLY2FNbGp5OXlvZXUwMGNJWHBkSWhtSlB1c3N0OEVrRE9jWGMvRk5H?=
 =?utf-8?B?L3Q3S0l1aXgvRHdUT2FVY0NIb0JueFd0MmVuSUpnRkQxb1k4VUh5Y08wd3JZ?=
 =?utf-8?B?U0dXay8rYzdJZGNzcnNtaURpeU41YU9FZUxvVHlybEhzVGRBb001YUZXeXlD?=
 =?utf-8?B?QUlEaGRDT3hlWjI4cjBhdS9vK0tzN1A5VmRWcnRwTkdpNE9rZTZOOXBhcERu?=
 =?utf-8?B?RWlqaHBCSERPR05PSk15WVM0V3gvaHJmQisvZDVNUm9IbFJBTmZNNUN3RHBh?=
 =?utf-8?B?Z2VMWXdvQ21yNkRVVmlTL3FxS09kV3ZvaDUwMjh5QXdkRzFCUnRhMDZaWmcy?=
 =?utf-8?B?RDY1T3VHMlVpS3lJUVBWWXh4Mi82K0ZqRXdlK0tJa2hLQy9sdzIvb3EvREpR?=
 =?utf-8?B?bkFBcHlIZTJDcXBMZFFjYjNxdXVRRE9aQ2srUm02K1hzSWczTk1IQmpxQ1Q4?=
 =?utf-8?B?WVV4OWl3aDRENldORjNGM2hYcWtoeE15bUVielE4MWtFSjNOZzJqMXg3YSto?=
 =?utf-8?B?bzZlUmpxb0lBTmR3ODJBN2FsWWluN2VNSzl6SVZFUXJZRHExOU5xQk92Yjl4?=
 =?utf-8?B?WlJHRHA1ZHY0dzhaNTdoSVZTdmdLRVg0dGY5dEFlTkJDdHg0eTJiU3FJNDh6?=
 =?utf-8?B?Ump3ajRhZ09ud1VFekRlc0lxSEJEWkxTOVRDeXVWVmlDL1gzdjZMaWwxaUpG?=
 =?utf-8?B?aEVIR05VMXRpdlVHN3VSa1lCMGtpaThVM2dyK2p0VFRBWnVtWEV0U1M3U0tK?=
 =?utf-8?B?blZ0aXZhcTdkTXhtdTZJeXN3M2p6QnZjaHBnNTFwdnd1N3lDQXREYkwvMmo0?=
 =?utf-8?B?dDFDR1JEano3TFdQdngyMlhNRFhMRG1PbVQ5dnRqYnZHbFcxZlA4M1hxYjlD?=
 =?utf-8?B?OUZsenkwNzlRSDFkMHZRRDZBM1ZEbzhaTXFnUXpIbDVrQWdpdmcxQ2Z4d2ZF?=
 =?utf-8?B?SGx1YzVxdEFhUTludDMwRTMxNUU3ZGZHOEtBRXQrcTc1aVhZd0k4WHhMNVN6?=
 =?utf-8?B?dUZhOUU2TXp1TGloWGliWTF4Vy9QMlNCekZLY0lTZDhQSU9WZURXUDNRMGFP?=
 =?utf-8?B?OG96THdZaXQ3NjdTVTAwa3dKeGJYL1BmbzJPWXZGSnB3M1N3cmtKV2ZqSnRp?=
 =?utf-8?Q?Qa0v3MKeNIzmEzJ1ciRJ7/KTA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922945e6-f728-4313-9b10-08da5e84514e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:46:02.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAJnnFQfaygK3hPi9A5etlsjBj8Qs3K8361xn82YY1ZJooaM8ThWK9P8GLqTAUQ2DnuMNO5mHQhIEpJOmxtqMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2613

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M and 1G mappings. (Via non-
default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Note that in principle 512G and 256T mappings could also be supported
right away, but the freeing of page tables (to be introduced in
subsequent patches) when replacing a sufficiently populated tree with a
single huge page would need suitable preemption, which will require
extra work.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Drop PAGE_SIZE_512G. In amd_iommu_{,un}map_page() assert page order
    is supported.
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible.

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
@@ -351,15 +352,39 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        union amd_iommu_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < level);
+                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 int cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
 
+    ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
+           PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
 
     /*
@@ -384,7 +409,7 @@ int cf_check amd_iommu_map_page(
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -394,8 +419,8 @@ int cf_check amd_iommu_map_page(
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -403,8 +428,13 @@ int cf_check amd_iommu_map_page(
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -413,8 +443,15 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
+    /*
+     * While really we could unmap at any granularity, for now we assume unmaps
+     * are issued by common code only at the same granularity as maps.
+     */
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
 
     if ( !hd->arch.amd.root_table )
@@ -423,7 +460,7 @@ int cf_check amd_iommu_unmap_page(
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -435,14 +472,19 @@ int cf_check amd_iommu_unmap_page(
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
 
+        if ( order && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
 }
 
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
-    .page_sizes = PAGE_SIZE_4K,
+    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,14 @@
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
 #endif /* __XEN_PAGE_DEFS_H__ */


