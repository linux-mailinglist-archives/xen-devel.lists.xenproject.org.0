Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA70566E9E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361163.590528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyI-0005Cr-55; Tue, 05 Jul 2022 12:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361163.590528; Tue, 05 Jul 2022 12:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyH-00059G-To; Tue, 05 Jul 2022 12:48:05 +0000
Received: by outflank-mailman (input) for mailman id 361163;
 Tue, 05 Jul 2022 12:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hyG-0004qy-83
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:48:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52bc30f-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:48:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5252.eurprd04.prod.outlook.com (2603:10a6:208:cf::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:48:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:47:59 +0000
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
X-Inumbo-ID: b52bc30f-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2Y4SB0nt/+lGPUEXk+04nHq25JN1bmQhQJKeBvQdchFcpy7WU3QQ/29NEX1WxyTdtIJGFqG8SRRZ6YBK0yLB4/szPnjIEua7mnFpenh3qAJP1H/nlHpsd+Dmu2Mf8js4wJVtiA5I9eFxWXIXISiWmZrA6Ie1X0w97JKbRYB+Cwusd8v6jWH5E48cQcC5nYdHr96OG9bzO90/OmZ+1RF9KxUmgVracsmskXuzbN8woOTeKoCcm29LdG0nXwoJKEKEDQZY389bc78jgCoybm1bEj3rTGOalXMkiByGfqlqhZbJqO6FUvz3NaNnlLjhF2OKE05G4ieWUQjvjhVLw0AEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBJ+nA86CUu4Iegk0a8bS6g3MTobVKpnG0RqAIWkZLM=;
 b=Ah2E6qAOLtnhMC2A3W/hR2Uo447DNGk1JBmsklLLI/58x75ojhd/wkxlswJ63XbBqbwZEinSa94E7WXcTutEeKYP8Zjls2H84f4RK3xTT9S1Dl41/McIJ3gw5wWIuGmCNN2c+gCmxe1o1p/Q7wTZ8HW0M257Xl6T2Fl7GsCTkD3xkp2SlE8psvIZvzjI0hh79wKEX8TjLbzwpsmaAGYbcMAh1ZscmJw4mlGrZ4mw0C5AcCF3zarpgDAkCp6Nhi/K1/AIwp4VmMpMXJu5rnnvUpKLcI4Bn148jCDUs8lMs39NRdcqmjh9Lm/dqSVqbhQwt8kGKnO46vptNhGDFKmctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBJ+nA86CUu4Iegk0a8bS6g3MTobVKpnG0RqAIWkZLM=;
 b=QTwJWf3JfT2vsx/VyLm8Y8fKgpO6VBInY6R3CIKk0JQmNskOXSqZO0YXExSGw9caRRelqRuLj3AoKaK93QeLRXggqL2F9u8YzD2b9BXBJMIQpnmNhPuc7/+B9gwEIJpZfDAjnNShO6hO3aBpx1NCrmrZNGRrw6hzUyEXpRRpvoCowtEihg/AJZbpKmAt4A9fvdS3a2Qt69ON06BSt5AustmVY0ZwBuGqcKun5xvfdwBGnE6jErxCDUdHzIpdwYDHNMIgsS65U/8X75sxB9BZYCRXJuFjoMKqNQk7oCB/R3yfl2MztDiCFbg4pSbEPvKXjyN2J7kGQyxBlS9exNhgoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9799df0-0d2e-106c-d1b1-0bd9b9f6db59@suse.com>
Date: Tue, 5 Jul 2022 14:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 08/14] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0411.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc706466-9186-450b-fc37-08da5e8484ac
X-MS-TrafficTypeDiagnostic: AM0PR04MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WAgGNLApFgpHZ7E0CNKvsAGRtRDK0qzaoR4DwfDZWDvGYI8diwHm1dpg3pZ2KPKVA7zLIlj0ILQW/otE1Bxll0Joi16mQhJMmw00L+kmx+Ml3wxP49+ttKgyptOxi3xxN0JGgvMG+6zMXmqpAMp4iD5n+ok73tJ1p9VA6ZZWS+iQvavm1cvcIBvZ99m5tC6JLnTxqQa54j9a/GFcFLTiXF6mlhyJLRnpLM/waDceFk14sVytW1Q+roIzpJRG0/00hdZtlaEfi9U9RB+siE/sh8RQ56+1UiCpNxA/gY+Dd1VYSjf8UhWpcOAjRjyGFFNQUuDaYQohG5JVCXJlCVsC8Rt47XAQEDphkqRL1WDZmhIEO2APzD3mpY8x9foLsYE3F74W3VMpSSrPPFylO0GHGfkxV20pyNRSaVbebpTVGldH+7HT9bkJfZi4SXx8gkKE604BQWLV8ph8F6zt71plwXixvsjoKBE4BeKfFbXpU/cgzgCnmeCehMMcAi/R6Tw3gmMHyGM6OkPaYiLQtJkQfzsAqdExERr28y97eOl5hvMp+EJ+BllxRbEqXCVxbSZHKYlmO1bRE+gEobcWhn61RTfUmtb9BygEJIXLs7zjzlHKdDYFaOUiCn+pM+yKufbRt0EK7nzzgHJ0UtsUoMhV34T7MLNYlyNR94UU1CSsUKOsZKigEHyxW7DZaxoBtgaLbsV41WyiOpgwF7//qk+SyKRaZx0cwUJnEXez4QONj29neRL7pYGP6H8Wi4SP6OezusZu6P5OSwU96kKrQ/5Ss8sm86d2zejt011TXa8olzHMTk2Oani5kEU2vPb19rCSsM6I8RimxlLV7cSgjRHr8WgubbWbBhv1sWHR6IIX7O0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(5660300002)(8936002)(6916009)(54906003)(316002)(86362001)(31696002)(6486002)(66946007)(4326008)(66476007)(8676002)(66556008)(31686004)(2906002)(83380400001)(2616005)(186003)(6512007)(26005)(38100700002)(41300700001)(6506007)(6666004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlV2a3N4VVFsMmF1WWoyeHNud1J4SWJ6Uko3akFBKzJISWZOQzJuMzBRTzlh?=
 =?utf-8?B?ckhiQytQVUV6dXYxZnlhVDNzNVNwamVOUjI2MTVrblJJNjhMOWxkS1RUYUZx?=
 =?utf-8?B?L3NqSzhUKzloWFRqc3cybXRzaVYvRkJmYjh4bXQzYXlkZExFbVZ4OUR6cHMx?=
 =?utf-8?B?dnpyc0RHVlIxNEpnS2s5Wno4b0V5b2dIcnlpajFQblVMRENCbjIwaVcrOFVn?=
 =?utf-8?B?N3pvSUpFdEk2OXJmN0dBUUVJSFhyaGFzVUk5RE1teW5aemM5cG5Wc2xGMGpM?=
 =?utf-8?B?MkhUYVB5b0hPNUg0Ty8waURxQ3FUTVN3Rnc2OG5PUDg5NitRYUY5ZXJkZU52?=
 =?utf-8?B?MzArQTcwbmZ0R3EzZXpKLzMxMlpEVFA4SEZxOGU5RHpyK0ZBdEFHTVlFRUcy?=
 =?utf-8?B?UmZDdjdUVjIrMGl6WHYrZmwxcy94bmNnb1F3ZGdmVmFLL0FpYWJORndseXNu?=
 =?utf-8?B?QVI3SE9UVmFlcmw4NFJGL2RNbWxKY3RDK0k2V0NHM0YyQnNMb3B2K3FzcVlu?=
 =?utf-8?B?NjhiNmM2RS8wWUc4UUVrR3Exc3BjSGNOcmtFeFkycDF2M0R3L1RCVmF1Y0xY?=
 =?utf-8?B?VnpBck1SWGpPQ0lMV2xNQUZuWXhYSmE4SVc1dFRhUVkzakJsS1QvSTUwUTE1?=
 =?utf-8?B?RXV5bk1mbjRTQUI0M1F3SjBVWGdkNW0zUHNRWXc2UzVwb3UzRUcvRmpVTVpr?=
 =?utf-8?B?MktRRi9rNlF2aEx3L2tWRFU3aFM4bGdEdktBSWlaejJTOVZwV2RyTGZYNXhC?=
 =?utf-8?B?K3pQVEdGTlBhaVBpRnNpVHZtaFBCLzBERXJGVGt5TGtUa2cwYjJHQUEzSklj?=
 =?utf-8?B?TGVRSjN4SVltalk4RDVNNFRNQTUxRXFhUmEwREs5Z1AxNDNqL01XRFRKS3dk?=
 =?utf-8?B?b09TcTh6YzQ3VlBwMmlDYysvcjg3c3VWQzdFdENXNlhrOFFnQzM1VlNySlFO?=
 =?utf-8?B?QkV0TGtSL053TnBiaUFTdlBleExiTzBlcy9oOUw4MmJ3S1o5N0NYNFFLZWor?=
 =?utf-8?B?RlNhK3VUakx2RVVPTVRyMjFIa3pzVmczWjc1eDJVMEQ0QWdQNFd5Nkd3VmFs?=
 =?utf-8?B?NmlFM2Y5LzlVMnFrdTRjbS96bVp6eEduRHdQRU5CWnpsdmszcXZBKyt6TWly?=
 =?utf-8?B?QVJnc3YycWttL0lhOXdlRnAxWU9Wa2c1VGxIOUQ5akdEcUFkUG9XT3F6MlVI?=
 =?utf-8?B?QXl3andaa2VlcHVlWXVlbWFRTnFoYVMzeTVCZzE0R1pjWmRwSVN5cENmeFF2?=
 =?utf-8?B?aXIzM1FHWjJJR2YrWk02VldDbHhXT3FXUjJBNytlQWZDYWVLc3BMY0U2ek5K?=
 =?utf-8?B?VDRWRXhVVjVKTmk3U1NsT0Z5Q0Vlb0JBaTEwOUF2SS9ReUp1STAvTzV1bDkz?=
 =?utf-8?B?aisxZjlTTlhVeUN5QTdVWkFrWURKeVVRMWJib09HdjczY3BwM3NWbDdKSkps?=
 =?utf-8?B?bmlUZnp2d1hZdXExbW40Y0RnQzFHVStnQUllUTZyMk1vbk1OM09Md25SeGJQ?=
 =?utf-8?B?YnNnMEVnUHVoMmZ3L3BEN1kwQmtMaUliRUp3ZWtBL2YzUnl6bWJUb0hDYkdv?=
 =?utf-8?B?cVZIeUVZRzNjUllJLzFlaWVoQVNkTk40ajJjL0lYNTZNOEQ0YitVYjRMajVy?=
 =?utf-8?B?aitTNHZCWlhxZlA1YU54Ujl3RGpRUjJIVVBzODhoM21zOWRDWnpZVTV5ZVcr?=
 =?utf-8?B?MnVGZ092blZURXFySTFVTERZK29LVWRuUjlGaGkxNXZVVlFRblJlbEx4UEt2?=
 =?utf-8?B?U1E4L1RVano0SDR3Mk1OYmhXRjJxM0txQVpUeFRrZE03SHptUUtndUVqc25Z?=
 =?utf-8?B?L1Q5NmxTNDJzN0kxM0w5MERrbTQ1NnpBWEZFeHlRR1lXVlB2cEd1eVpvejM1?=
 =?utf-8?B?VUYyVHkwbVUyWDJmbWdMSUQwZGsvY1Z3R21hN2F5TlhZM25OVTBXaWt5d1FZ?=
 =?utf-8?B?OEg2MEZ0cWg5RmM1bG94Q2JhNlR4bStuYitQL3d3d3pvb0lEVDJEd2gvQ0c3?=
 =?utf-8?B?WWFlbkZQUnYzSWplaXJwMHUxcVRaVlM3dGh3M254dWh0TjBzNWZNSVRvcDQ3?=
 =?utf-8?B?K0xPSTEybkZnU0IvRXg5TVBiNmY5NTRGL0NwUGJWcElrb2lHNHdVelFndVhi?=
 =?utf-8?Q?5U2ZfWKka91rDbw3HQ2LDTa2x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc706466-9186-450b-fc37-08da5e8484ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:47:28.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp3FlZr+YQqzyLOvBTWxJvy9+ynixkOvZP3gTA37sqUbvEekJBbK7dQzM0eTev2ggDO/x62/F8S5tzEhcURXDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5252

Page tables are used for two purposes after allocation: They either
start out all empty, or they are filled to replace a superpage.
Subsequently, to replace all empty or fully contiguous page tables,
contiguous sub-regions will be recorded within individual page tables.
Install the initial set of markers immediately after allocation. Make
sure to retain these markers when further populating a page table in
preparation for it to replace a superpage.

The markers are simply 4-bit fields holding the order value of
contiguous entries. To demonstrate this, if a page table had just 16
entries, this would be the initial (fully contiguous) set of markers:

index  0 1 2 3 4 5 6 7 8 9 A B C D E F
marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

"Contiguous" here means not only present entries with successively
increasing MFNs, each one suitably aligned for its slot, and identical
attributes, but also a respective number of all non-present (zero except
for the markers) entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
An alternative to the ASSERT()s added to set_iommu_ptes_present() would
be to make the function less general-purpose; it's used in a single
place only after all (i.e. it might as well be folded into its only
caller).

While in VT-d's comment ahead of struct dma_pte I'm adjusting the
description of the high bits, I'd like to note that the description of
some of the lower bits isn't correct either. Yet I don't think adjusting
that belongs here.
---
v6: Use sizeof().
v5: Assert next_mfn is suitably aligned in set_iommu_ptes_present(). Use
    CONTIG_LEVEL_SHIFT in favor of PAGE_SHIFT-3.
v4: Add another comment referring to pt-contig-markers.h. Re-base.
v3: Add comments. Re-base.
v2: New.

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -146,7 +146,8 @@ void iommu_free_domid(domid_t domid, uns
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct domain_iommu;
-struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
+struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
+                                                   uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -446,11 +446,13 @@ union amd_iommu_x2apic_control {
 #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
 #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
 
+#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
+
 union amd_iommu_pte {
     uint64_t raw;
     struct {
         bool pr:1;
-        unsigned int ign0:4;
+        unsigned int ign0:4; /* Covered by IOMMU_PTE_CONTIG_MASK. */
         bool a:1;
         bool d:1;
         unsigned int ign1:2;
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,8 @@
 
 #include "iommu.h"
 
+#include <asm/pt-contig-markers.h>
+
 /* Given pfn and page table level, return pde index */
 static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
 {
@@ -113,9 +115,23 @@ static void set_iommu_ptes_present(unsig
         return;
     }
 
+    ASSERT(!(next_mfn & (page_sz - 1)));
+
     while ( nr_ptes-- )
     {
-        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        ASSERT(!pde->next_level);
+        ASSERT(!pde->u);
+
+        if ( pde > table )
+            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
+        else
+            ASSERT(pde->ign0 == CONTIG_LEVEL_SHIFT);
+
+        pde->iw = iw;
+        pde->ir = ir;
+        pde->fc = true; /* See set_iommu_pde_present(). */
+        pde->mfn = next_mfn;
+        pde->pr = true;
 
         ++pde;
         next_mfn += page_sz;
@@ -295,7 +311,7 @@ static int iommu_pde_from_dfn(struct dom
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(hd);
+            table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -325,7 +341,7 @@ static int iommu_pde_from_dfn(struct dom
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(hd);
+                table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -726,7 +742,7 @@ static int fill_qpt(union amd_iommu_pte
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -784,7 +800,7 @@ int cf_check amd_iommu_quarantine_init(s
         return 0;
     }
 
-    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd);
+    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
     if ( !pdev->arch.amd.root_table )
         return -ENOMEM;
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -342,7 +342,7 @@ int amd_iommu_alloc_root(struct domain *
 
     if ( unlikely(!hd->arch.amd.root_table) && d != dom_io )
     {
-        hd->arch.amd.root_table = iommu_alloc_pgtable(hd);
+        hd->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
         if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -334,7 +334,7 @@ static uint64_t addr_to_dma_page_maddr(s
             goto out;
 
         pte_maddr = level;
-        if ( !(pg = iommu_alloc_pgtable(hd)) )
+        if ( !(pg = iommu_alloc_pgtable(hd, 0)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
@@ -376,7 +376,7 @@ static uint64_t addr_to_dma_page_maddr(s
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(hd);
+            pg = iommu_alloc_pgtable(hd, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -388,12 +388,13 @@ static uint64_t addr_to_dma_page_maddr(s
                 struct dma_pte *split = map_vtd_domain_page(pte_maddr);
                 unsigned long inc = 1UL << level_to_offset_bits(level - 1);
 
-                split[0].val = pte->val;
+                split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
                 if ( inc == PAGE_SIZE )
                     split[0].val &= ~DMA_PTE_SP;
 
                 for ( offset = 1; offset < PTE_NUM; ++offset )
-                    split[offset].val = split[offset - 1].val + inc;
+                    split[offset].val |=
+                        (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
 
                 iommu_sync_cache(split, PAGE_SIZE);
                 unmap_vtd_domain_page(split);
@@ -2168,7 +2169,7 @@ static int __must_check cf_check intel_i
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -3058,7 +3059,7 @@ static int fill_qpt(struct dma_pte *this
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -3115,7 +3116,7 @@ static int cf_check intel_iommu_quaranti
     if ( !drhd )
         return -ENODEV;
 
-    pg = iommu_alloc_pgtable(hd);
+    pg = iommu_alloc_pgtable(hd, 0);
     if ( !pg )
         return -ENOMEM;
 
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -253,7 +253,10 @@ struct context_entry {
  * 2-6: reserved
  * 7: super page
  * 8-11: available
- * 12-63: Host physcial address
+ * 12-51: Host physcial address
+ * 52-61: available (52-55 used for DMA_PTE_CONTIG_MASK)
+ * 62: reserved
+ * 63: available
  */
 struct dma_pte {
     u64 val;
@@ -263,6 +266,7 @@ struct dma_pte {
 #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
 #define DMA_PTE_SP   (1 << 7)
 #define DMA_PTE_SNP  (1 << 11)
+#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
 #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
 #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
 #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
@@ -276,7 +280,7 @@ struct dma_pte {
 #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
 #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
 #define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
+            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)
 #define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
 #define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
 #include <asm/mem_paging.h>
+#include <asm/pt-contig-markers.h>
 #include <asm/setup.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
@@ -534,11 +535,12 @@ int iommu_free_pgtables(struct domain *d
     return 0;
 }
 
-struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd)
+struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
+                                      uint64_t contig_mask)
 {
     unsigned int memflags = 0;
     struct page_info *pg;
-    void *p;
+    uint64_t *p;
 
 #ifdef CONFIG_NUMA
     if ( hd->node != NUMA_NO_NODE )
@@ -550,7 +552,29 @@ struct page_info *iommu_alloc_pgtable(st
         return NULL;
 
     p = __map_domain_page(pg);
-    clear_page(p);
+
+    if ( contig_mask )
+    {
+        /* See pt-contig-markers.h for a description of the marker scheme. */
+        unsigned int i, shift = find_first_set_bit(contig_mask);
+
+        ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) == CONTIG_LEVEL_SHIFT);
+
+        p[0] = (CONTIG_LEVEL_SHIFT + 0ull) << shift;
+        p[1] = 0;
+        p[2] = 1ull << shift;
+        p[3] = 0;
+
+        for ( i = 4; i < PAGE_SIZE / sizeof(*p); i += 4 )
+        {
+            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
+            p[i + 1] = 0;
+            p[i + 2] = 1ull << shift;
+            p[i + 3] = 0;
+        }
+    }
+    else
+        clear_page(p);
 
     iommu_sync_cache(p, PAGE_SIZE);
 


