Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED5B5448A6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344919.570550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHS-0005NN-Dx; Thu, 09 Jun 2022 10:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344919.570550; Thu, 09 Jun 2022 10:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHS-0005L7-A9; Thu, 09 Jun 2022 10:20:46 +0000
Received: by outflank-mailman (input) for mailman id 344919;
 Thu, 09 Jun 2022 10:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFHQ-0003U3-Om
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:20:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe09::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b8863c-e7dd-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:20:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:20:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:20:42 +0000
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
X-Inumbo-ID: d1b8863c-e7dd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F56ymm6uSQP3kHQK5HRsC1JzZMNMfH7ySFKl3tGTY58SrqujyIy7+zEueGC0AIwPU5zeZTTrFf++ofyJjV8kv9KPjEIMhMtexIB8YrHlTNGYa94tWWoTzTvAl9yOy8UGFwi003sjIJ/+oK3PNWgY1EwmKun9d+wUf2BDmBVCRHYraF6uXdn7DK/L/6bFGlIsgBpklOvyXFNL6jC8OZ0CuTWuECdbTyEvSHBcNaf4iJwbeKor/HPXbUmy7TOS8Fs+QzaolPA6PmG0B8ajnxqH7CnbRT+glPrDMBF6pagqjgRPo6Hyonl/e8EU1KzNSMGk0P1k82kXmfB2rsgoQfMFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpBKX8iKhA8N8952sSDbijOunJ7uuUUiGIDbjZy4Htk=;
 b=Nj/oQXki34+K4RyLOQZK/8x+ZszeqkYK5o2Ej+VIeBsCYpnUxLeR4i6vad+SEl6jfeZGfxMgXczxFZ0g9x+3Nini3EeAI1A2PXg3aIfTd9U+U5G107wNt5BYvRkuajUNrprkzlHcg5Y9FQdb0KWA5e3c7meoGCoHLXEQUGGxLLAAqtkBeKixq3MJr6fRhQnFJsbx0sEVsDfWbH4v6mvLoOevGgSEzkZUFPnCQzSIq+E4Yz6Ogdu+lZO239eAVYopoO1li/jUKa+3N0ykVE46g191FsQLiKQVmRHBosALLVFWhgnnyQRSleVeL1dDd8qFQup5KxPSCyc0nnAw2yU+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpBKX8iKhA8N8952sSDbijOunJ7uuUUiGIDbjZy4Htk=;
 b=hI1LiLH4da6Dx70WByVSmXBQXxnKIVyzG9OTrKLWfTUF7397ysKXFg79XaD5en+E+kBURZOtsmnof+4HaLx9rgH3tL2kc5S+DOLWjcoa50mCVQCb2NijHke32TA7MCILEGwmYSsQF7fbB6RLdwO9+2Je6hF2MO2M29GgHrHP40eWGG/PsN3V7p/2YdnrX74GGQ+7FfpUHoeMXpNfxO1tplMEmTk9kV3r1MVXCSLHu/HAWYWa3urkSvu4GlBJF6KI4NZc6ffOaFc/3i8Vf0FYFuDDQTMGGiE/GWlBU/HjA/lzMJOgGrdfLZJDJarxpvWtIC2nAkjExu/+EJpt0yKB7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31b3f7a0-c7ca-70e4-0ac3-7a2bfb65facc@suse.com>
Date: Thu, 9 Jun 2022 12:20:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 09/12] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0059.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75b3e96-f223-4843-24bc-08da4a01b56b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8559:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB855969FA4D48785D09F1716FB3A79@PAXPR04MB8559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQ1JvmN4zwr8KLmrjtOm9d1apfORBTxe4K+uDAT/TUXFDi/xKA5vkhiU+ndUATNSvRrsfSrJDO5fZWHnhliFFx32agwsTupqia2+ftPzCEKKvOK70gv4en56TOwaD3O5yNsHrmEyzqXtlnL4Z01quxktVGxxlwW9qCsYIeOi0CR4FqjsT0HknJiIsNQ+Ag2MoNvqtmSCtOjKVg2L2zdRAF/8tuPXn16b0st6MUzBIHP0AaB87+C3KmAQEGEI0u6k/xuWTaFtbfY+h8VnU6h9IoN7hQ+npbTahMcjZLPA7ocLeRfJ9GBrYlscpSaIsLTah2g2uabYEPPx+hTLnsopXLBxzYMbn/UDrsH1CuBFI48rCTgVpL565dnCxCVpQqe/hKVqvn6e+PFSH0ITv6MbajT8ooUz1ww22L8wFTJwOen8NXMtcOs+jVsOKZSlD6ORqyW3u1JIczJ4x/iXa4/INFGKvx6dijj7wF/rULqVvvt0kMNttUS0pfkT/D7Ar+iN/dYFo+fs/52atk4OCZr55Jsc4lnYjH6hzMaibunuz45ubQ5dRNJRZYfpOjSZUvT70SqMQNBGSqsvWO9fyBlLC4iR7q2vzkocGposlBHgD8abC4qbMq9rvce8JAec8q7Igm8GQHjZkU3jk6Ws0hBrqYINUqveBiaGJszHDLliDP8PZmfwXxc46aqU9e+QIxZPz8UZKB7ELlLBFzDsF1O8PPhUGlonUVo6DTw4I5TLx8nzFnu75y2lVeAbYLhgYo5f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(186003)(2906002)(2616005)(6486002)(86362001)(5660300002)(6506007)(26005)(6512007)(8936002)(31696002)(38100700002)(66556008)(36756003)(66476007)(316002)(31686004)(83380400001)(6916009)(66946007)(54906003)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGlVQ2RNVEFwRDRrN1ZxdlBCazVubW5QZUJUOC9tZzhKenpmQWRET3RDTENs?=
 =?utf-8?B?TjNmWEFMeG0vNnNyWHh3YUdIaVdRWEFyaEtadWx1MWl3aUNDTGc2c3FTd2Np?=
 =?utf-8?B?SWpyMDZrUGJGYnRFMVVRNm1OQWd0ZWIxTUJwN2JjUGwyY1FCSVI2eXY5Q0Vl?=
 =?utf-8?B?WEQvV1dtMEdxZmRIMnB4UHVUQjl2aHJWUnpQNkxvVDJncm4wMDhsUHFQd09u?=
 =?utf-8?B?V2JzTURSdkxDY2djRTV2MEkwc0didjBQQWpyOFVzRHJUdHBERm1vSjZENUZF?=
 =?utf-8?B?TlRRVTNYMUpDK0E1RlNFYzRLemtJVTc3NnFEVHFzTWJzRjNCUXV2QnJYd0Fv?=
 =?utf-8?B?VktXQ2wzMkpBa1hCVXVVNUNZYVNLQnR3enVlOGFMREgwYmMrTEVzRG1STFhi?=
 =?utf-8?B?UjNRREIyaCsyeTFHM0xvZXNZOGtGeHF5OE9VYk51RytBVkk3NkMvRTNHYVBN?=
 =?utf-8?B?Y3ZuSGtuY243Y2lBdEdvaVdrTXk1azJMQTNyQnRqdGhWTUJ1U2taUmQ5bDBP?=
 =?utf-8?B?cWNjNDRLNWp4L3daSkVDRngrZ0JlOWU0K05RYWxIaEtwY2dzQVNBUVYySVFx?=
 =?utf-8?B?dWZKRW1FU1A3Y00rRU1vaGU0U0xDeWoyQ1JSRldvNDZpQ3RVMU9yN3J0MTlU?=
 =?utf-8?B?NktTUGMyLzVzRHVrcnZtVjRlZXo5RHJJeUlPZ1YzR3JqSzQ5U0NBdnNURkZK?=
 =?utf-8?B?OENaa3hRSm5KZzZ0VThOd1RXM2c5eTNlMGxnS1JFS3BMWjU4YjlWQUNxa05U?=
 =?utf-8?B?ZDljR1BjM1dRRDA5UmdGMHM3RXM3K2ZkQ1RxTmc3ZUR3NnR1VXNEYVM5Ni81?=
 =?utf-8?B?TmVTOUF1akpPeTVhTlF2MDE0ZWNwWmU1bmRoVm00dGJnc2hvVW9vN2FzeUdQ?=
 =?utf-8?B?b2RROElhMXBJK09aUFFhNEF5NVdCTFJqUlM5V1VqWnVZa0tIUUpGZkFqRk1U?=
 =?utf-8?B?dnhrQk93Mk1qdkxZbHowdE1zdjlhMDFRL1hzR1l6OUlhMjRtbUNtd0N0NTNV?=
 =?utf-8?B?eFRjV3BxNnE4a2NmMkY2bXExMm15eXNaQi9vN09PUkhXR0x0TU1McUxuOVJV?=
 =?utf-8?B?M3Q5Qys0WkJBY3BsNmlDNDU5S2JpdTNINmN2SVIzS3lMQnY2bHcrQWgyWmt6?=
 =?utf-8?B?clJrcjRYdWJGSVZNNFpFUWtpOFdwblpRRXR2ZUhTVkUyY0N0SkhyWnRvRkRt?=
 =?utf-8?B?Syt5S1BnSlpPcnFVZzBRcXkyay9UOHlOMDF5cFBIRnpoL3JURUt2eW9oRkFL?=
 =?utf-8?B?U1N0SUp0MTY5V0xiOEZmNUR6aWV0aDBrU2owVTd2anZZRzRyOThRWDM2aGls?=
 =?utf-8?B?eVQvNjUybWIvRkJmclY5bDhRZXYxaXBEVS9rdXVjTE5zdFQ0Vy9xRXREbTNy?=
 =?utf-8?B?ZWZWK2ZDUldvRlZETW5vQVdGdGRvbWRUakN6VXJvVUdtZGkrR3ZqaUpuR2J4?=
 =?utf-8?B?anl2dG5LMW9NMWlaRktGSy9Zcmgyblp6V1ZPVWF4dUlkZHI0NTNodlQxcmNa?=
 =?utf-8?B?UGhTaXdMdTREaWttOEppK1hEcVZDWnNaU1hTdEtxMWlzeDc3ZWhlakVETkoy?=
 =?utf-8?B?dTBCb25vREdwVGpzbXJDdDNrdTdaK2dGNituUWl1QWllMjdVVmVHZGEvTXoz?=
 =?utf-8?B?NWZDVHhvQ2w1OUp4bDFmV3czTlA4K3JRMDlrVW9HVWVuNU82aWNPeXlMMTVt?=
 =?utf-8?B?YURzVDBjd2JCVUc2UzY2ajk1WVpRU1NMSVFOeloyY3kyWGZuLy9GRkhrNmdH?=
 =?utf-8?B?d1JpNVBJRG1TK2lreWFvMjY5WFp3MTJMaUZtWmZrMkFTckdUVzZ5RGtxZmNp?=
 =?utf-8?B?THZDRlVrdFM5azl2WnFlY1lCMEx2WElVVE9tNzhHd0xUajhsRWpuYW9mRDNU?=
 =?utf-8?B?RVlJUUIzeHhsNkRMbTFqaXE5dnNOTjAwcW9mRHE5UkNMVVJ4NG9kaHNoQnM4?=
 =?utf-8?B?TVpsVm5CUGlXdTNiUFZOMUd4VDlLbjNTd1plZmJsaFV4cFhCcEEzTlgvVXk5?=
 =?utf-8?B?NzVnaXNXN3FJNGczNXdONTJZUE5XNjdob3hMQlFrUUN4U3NwN1RFMTg2Sk9W?=
 =?utf-8?B?UDJsYmxtSnQ4Y3R2YkY5M1U0TFk2T0JBNGYyVmxXdjBXbkRzYnFBNWhyWDAy?=
 =?utf-8?B?b3N3aUlkalQxSGVzQW5ZV011NGJwYlJyM3dPRDhCRmtaa3pSODZIdXJ3MTdB?=
 =?utf-8?B?WTJrOVBHWDJ5NXBPRVJQeUNkUjU4d05SZTdiNS9RNVYyY2FSS0tPL2t0blk4?=
 =?utf-8?B?SXJubG5yeHZuZ1p4dEpzem9xYU5CT1U5aFBvVU9IU3dGaWl2MzQ3UENhaWJE?=
 =?utf-8?B?QUUybVhSRWkxclNnYzZ5UVVHRExNVHZ0bVRoYjA5dEtLTlE4alpKdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75b3e96-f223-4843-24bc-08da4a01b56b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:20:42.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQin/3QcNARuNzq+W4GIkhgFo4yy/7zW4lsIJYg0mFiUoAmuTrLBMu1Un/3mGojNq+Ze32D/tSzbCVLcsc9CGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -81,7 +81,8 @@ static union amd_iommu_pte set_iommu_pte
                                                  unsigned long dfn,
                                                  unsigned long next_mfn,
                                                  unsigned int level,
-                                                 bool iw, bool ir)
+                                                 bool iw, bool ir,
+                                                 bool *contig)
 {
     union amd_iommu_pte *table, *pde, old;
 
@@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
          old.iw != iw || old.ir != ir )
     {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
-        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
-                                 level, PTE_kind_leaf);
+        *contig = pt_update_contig_markers(&table->raw,
+                                           pfn_to_pde_idx(dfn, level),
+                                           level, PTE_kind_leaf);
     }
     else
+    {
         old.pr = false; /* signal "no change" to the caller */
+        *contig = false;
+    }
 
     unmap_domain_page(table);
 
@@ -409,6 +414,7 @@ int cf_check amd_iommu_map_page(
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
+    bool contig;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -452,8 +458,26 @@ int cf_check amd_iommu_map_page(
 
     /* Install mapping */
     old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
-                                (flags & IOMMUF_writable),
-                                (flags & IOMMUF_readable));
+                                flags & IOMMUF_writable,
+                                flags & IOMMUF_readable, &contig);
+
+    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
+    {
+        struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+        unsigned long next_mfn;
+
+        if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags,
+                                false) )
+            BUG();
+        BUG_ON(!pt_mfn);
+
+        next_mfn = mfn_x(mfn) & (~0UL << (PTE_PER_TABLE_SHIFT * (level - 1)));
+        set_iommu_pte_present(pt_mfn, dfn_x(dfn), next_mfn, level,
+                              flags & IOMMUF_writable,
+                              flags & IOMMUF_readable, &contig);
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
 


