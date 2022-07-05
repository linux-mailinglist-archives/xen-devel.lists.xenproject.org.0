Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C80566EA6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361196.590587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i07-0000YI-VE; Tue, 05 Jul 2022 12:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361196.590587; Tue, 05 Jul 2022 12:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i07-0000WQ-SI; Tue, 05 Jul 2022 12:49:59 +0000
Received: by outflank-mailman (input) for mailman id 361196;
 Tue, 05 Jul 2022 12:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8i05-0000VQ-Qn
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:49:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f909813b-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:49:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 5 Jul
 2022 12:49:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:49:47 +0000
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
X-Inumbo-ID: f909813b-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO26Cn7V0S6ZGzioixxnZR/I/ytsg17vRBX4amzpMwYzNFgj5p9M8VrHITft0qvweorL93Z03M4mG1JwsoOrIWDov1KWd1x9W4SW+EpCXyAZn2eA+poRjekciM3Q/mXzlMyxzyfRecKY5DXF0AkOLk4UUCG8yksApvcM15UJKw7NBUyS3BwR6bQU0zJU71catuFxLAMvmlkkcyOQ2V+H/KdZgW4symb2X9twjyDpeTP+4Ed2IoNdjWu/TrGv8YXat38tJqW0sfNn30Sa09uKbOWsunsRFxZM0YIxudxsWCEa+LQ9V/oVEzJhD3QRirCU766Dydao+37TZE897eJV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNGQdoucDFou5j3M8E7Hd4miL8kBXhKfjN3w6aHaDIs=;
 b=iihD0+AumewRSrE30RzfNzlvQ2lfvQRp54rH6FemnK3k+l8LyoEX6OSrKM1frAcqu0A0Z/wqYOFlsOD1zIfoxIa1O/p4hT+ja+EFQvFvAoUSPgOCMF6Iupasw3lyZClhblNMEVAPY2Iqg5XnBYqESezT2V4FUorbVuCJFdskTrXHeL0OrH11cDsNXSaLAql94YdJG/i9Ei6LnRJD3yKIn16SaZwMz2aojOfQxa4L+cTwuBGM3xdcNFa4Frz6Ye/dCY1InPcgEzclB71UXR7NNkbw7G+hvJroC3XoTrc6pbSkDdOS3DsuoG71NP7p0V5NTHRr+dP224ROcocw3E1PLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNGQdoucDFou5j3M8E7Hd4miL8kBXhKfjN3w6aHaDIs=;
 b=0Fw/nQxsZiIk0D+cu2W4jLQwglfG7LCOWoPv4IYP3vsyOJio/YqNohwoGQanjo6TLEpyl4PXt/mO7deHswNrV2PAeTIRKk/iuAcrOIFutLVuwbOyJbZxSso4DU8L/YK7Y4g7Wa+2PEGh5RpV79vJ8VX0Aoy2qxTNSRREi0++lmDOXF0gZNY13FLa/Ewdpi0IqPyizPL/yzigc8xf3cGrvGurC3li2N2UjLfRlraSDP+uqAXaIxfVlist2j7A4VZQ+HmyDR5uMVBxbiv7V8V5RwoTNpYSshxRngJYu6NvIoTAW7X1kjivV/NyZqUzDCW4amEXLl/CDlSnAgf+BuZFog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20b9d343-fe6e-b5f1-1ad4-6795aaae0fcd@suse.com>
Date: Tue, 5 Jul 2022 14:49:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 14/14] VT-d: fold dma_pte_clear_one() into its only caller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3456e26b-3aad-49cd-3cf6-08da5e84d75f
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iF33EOjItENqFGKqIXi5TcQ83IEGIyfDsHTmB7jqBdHZ76fWJWO7I1q5bWYdvynKG2QHG1nuyhs8L+tMa87I1DwfZ6Cn+UpDk6eU/ZA91esCaV+EvQubTcyA2cHTOXN/aFhBTgTxQY4Pm6GtSu6nyJmZmEeRQIt4/stPIvY7R2u8/pcoT6fEvMO/Pf1bNcVy4aiMnqnuDzxJhgWPSSXz1C/9zSAalqRxV3un0O6t2lGu3xLgA4N4BV9fZ1vvHfWquQftA8VXQdmqvIemu8ItMHVZbUUYE93dM7P4+yf7Qv9ayAQB+X+xKFi912eHTQXNB2zv4aHiaOVR3ooYnOxwH0peqMW+lc9FNgc+KRtyKrTb+XWfCRqM20AwRc1GBa+uYILGRcnkr3mRvLx4TKc9T9o2bUIXhM+Z7doSM2cUIQ40+MFru2yzuMO27Q/wB60yiml1Fr/ATUGMUaQpxbZnlDtXx50cwoCd4hC8q5/MpiU6N60xbDscnMgV2uwPOeIOAqenXeZPubBbOeW+wcC4WpsD2unQCJVq5i75vo+NPY44RnpLj3BRfYvWlWLhBYaWqU0VTCI0vwdCiApnJm/ewzmnNdVhAWplBYLkfvKgHZdq+kQmnvsKF664kKntTVAVBimRN0V6ZoL2v0qzFEEXPNIVC6W0mNuunKWNuSJ5Rjdjqt/XTKzEJn2YTK8ZJQB2RVugWvJ6OEbG/7ydMDN37Jx+yXHeJ3fQK0ssmu1EtjkURZWh3EzYX3Gxk1nzeAhupZ85i0HqCiJmrE1VH6V8TMv1k5axCOtpF7/hrDBFJMwCSq68yCtSyeOgjTPZLCUPZVHP5Xy9k3m/4EvRv42fEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(478600001)(8936002)(5660300002)(6486002)(86362001)(31696002)(2906002)(6916009)(54906003)(316002)(41300700001)(2616005)(66476007)(66556008)(66946007)(186003)(83380400001)(6506007)(31686004)(38100700002)(36756003)(4326008)(8676002)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWxjc0haTFRrc3pzZjVETHJ5eEFXSUE3UkVJYjg5WnZoaDErVDhEdXdOOVpN?=
 =?utf-8?B?UjNMbHpPbWc2TytUS0x4UUVQMTJmcWM1blhaaDJMK0lINk9SVFcrVlNYSzBo?=
 =?utf-8?B?ODlaZTNtdXVxbFVzMElkZGEzbWdJbDNmUzRVV3VJczN2QlJCeFNKNWZjemw4?=
 =?utf-8?B?SDJ0bWhuNHNMUjZaYW0zNndoZnIzNXM5YzVRZUZhTGptaldvWWpEYlhHQjlK?=
 =?utf-8?B?M2NNdzI4a0RNZFVnWkh3bHl0Q2RSUDN4V1ZOZkNJejRHbUZpU09DeWtNc0FX?=
 =?utf-8?B?blNSVENNSWRONXhpUjNaeXdnWGpLcUI3NmQ2TloxQWpGalhGYkY5YmprNHcy?=
 =?utf-8?B?c2ZTcStWMFgvellqSm55VlgxckE0QlY0QktZQllYaURFYXpMdVZIQTc4SGJG?=
 =?utf-8?B?R1JrUENBNzk0WTJ6U1pDVzVaTGM0d1FNL3dqTFFDbWZ5dG9QMUlMZE1YUVd3?=
 =?utf-8?B?R0JxdUhjY0RsT3dSRlZvYlMyM1RjVGo3S2JNMFdpZ01NUTdiUFF3eGJLbWtw?=
 =?utf-8?B?VE9mQlFMT2JDMHpjYlhpYUNJTTYzZXdFRXlRNndFV21JZHpDLzFoU1BHMjdv?=
 =?utf-8?B?U1l3cjJDdzVrd1FPdGw5cE9UbjRheVNHZG1HTnZ4SzJtNVVXQllFWU5CTUxj?=
 =?utf-8?B?eFUwMXRXUjdKMkhMTGg4WGpTNWhTcklnTFpNVGpERDdDdzdtaXR4cnd1MmVC?=
 =?utf-8?B?dnpDekxHK3ladXZkS291UGl1aU5NMTF0eHdCTVhoOENNSlg1Y0FoVHM2aFF3?=
 =?utf-8?B?cmFZSjg2Sm1rQmY3YlJqVHREU0hLYnFHL2hPQmZVRHlsbGdEOG1pUlRpaFVH?=
 =?utf-8?B?Wjh5cHpMd2F1aFFHSy9jelRLUEIxeElGWU5sSjNtS2NpeHlFMHdBd0ZJNS8v?=
 =?utf-8?B?OXRYdW9Na0JlR0FSTk9vNmVib012S1pJVE9LVk9JNTZ1cWJPTm95amVHc3ZS?=
 =?utf-8?B?Q0cvMk1OQytMeUJ1akRpYnNMYkNxOG5Rc0REaWt5dklqMjhZUXJCc3BKdFRW?=
 =?utf-8?B?bkN2WVFtdC9jUWRKS05Qb1lGS0ZhK0l3dzVoUURHeHE2TjdvUDhPcjBkR1Mz?=
 =?utf-8?B?OVpMTjNLZUwzY3lObVdSSlBLSzJleG91YkJUeFplRTd0ZGZjWi90SkhWdGVk?=
 =?utf-8?B?amFBUU9ma0l0bnJJalA3cXJDOHJqUExSVmo1N1BCVzYwVHh4cEp5d2dqeG9T?=
 =?utf-8?B?VWFEL1NmMmltMWFvQTBDakUrVHp5c0JuRVIxRzQ0MDIyVGZKbDVmbzl5NjB3?=
 =?utf-8?B?SEZBZHQydXpCQXl6cjFpck9FUTlRcUJyK2pCY3A2T1VCNjZnVzQ1Tk5EOEhP?=
 =?utf-8?B?bW5KaUxHL2xBV2Ywem1EQ1ZCVUxET1dYVlZscDdZWk0zanY3Z0xhM3hFeU1l?=
 =?utf-8?B?Mm13eTdpYW1BTjB1N01QUjI1Q2puQkEwQ0RhQjNQZTJFa0JZbkFhYnEwME5B?=
 =?utf-8?B?T0tMVGQxeEFsRW9SMWpZeUdBVjZkMnhOUWltNXM4VkEvVERmRXRBYUtWZnZz?=
 =?utf-8?B?ZS85cVd4QnJYcDh6TjUvTzRxalFHdmppOS82Uk5hUktOSzBHUXNoSnUyVm5w?=
 =?utf-8?B?eW9iZEowVXJpQUlhck5nbW1CYU5WeTc0VzJvSXljQ2ZTWnZDb1pNSVZCN25D?=
 =?utf-8?B?OEtWcVVxOGxZSE1RWWxtaFFkb3o1cERZMlpnUEZWQy9FQy9wQzh4cmplcTQv?=
 =?utf-8?B?bnRURXZRa3hORER4Mk92TGlOMTV4cUl6bmw2SFZLTDhlbUZzTVpRbU1scTBx?=
 =?utf-8?B?anRRcDZRYmw2bVpyanJYcE1MZlFGWXNkMkRBNDhPejJsZTluVjlPNnFjS2tH?=
 =?utf-8?B?Z2V5SzNIYnZ2NkIrbDd0eHFWUHd5YSs3NXlXeXJCQ0dCbmt6Z2hHeGdKTC9U?=
 =?utf-8?B?OVo4NWhiejIvNHl6bUJ2c01ZdWFyNDZqY292TlR6UkUzdk80ODlhSWRJRUY5?=
 =?utf-8?B?RCtmLzBxZ0xkTXVpcUdtYUhYcm0ybmZWNWZQSko1U2xpZjErbzR1a2FCRi93?=
 =?utf-8?B?YXlZTk1RZk93clN0bDltYnBxMnRKOXpFMktndE43UWh1Ymp5em9KcXl6Ykgx?=
 =?utf-8?B?ekdiL1VTcmYxMWxQbjJWSzZzc1pGRXJZdVRXT2NabWpwcWNBc1IvODVEQmh4?=
 =?utf-8?Q?fGRuhWkMfni6ncXW3oGM1xESs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3456e26b-3aad-49cd-3cf6-08da5e84d75f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:49:46.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw3aC+QfNz/3D79Y4nvJ0ki+itnp+r6oCrvgvudQ8Cn1w7FvhLRWHomb40pwb19AG9cpsm6b+L9+Z+wQQN/rgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

This way intel_iommu_unmap_page() ends up quite a bit more similar to
intel_iommu_map_page().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Re-base of changes earlier in the series.
v4: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -806,75 +806,6 @@ static void queue_free_pt(struct domain_
     iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
 }
 
-/* clear one page's page table */
-static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
-                             unsigned int order,
-                             unsigned int *flush_flags)
-{
-    struct domain_iommu *hd = dom_iommu(domain);
-    struct dma_pte *page = NULL, *pte = NULL, old;
-    u64 pg_maddr;
-    unsigned int level = (order / LEVEL_STRIDE) + 1;
-
-    spin_lock(&hd->arch.mapping_lock);
-    /* get target level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags, false);
-    if ( pg_maddr < PAGE_SIZE )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return pg_maddr ? -ENOMEM : 0;
-    }
-
-    page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = &page[address_level_offset(addr, level)];
-
-    if ( !dma_pte_present(*pte) )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        unmap_vtd_domain_page(page);
-        return 0;
-    }
-
-    old = *pte;
-    dma_clear_pte(*pte);
-    iommu_sync_cache(pte, sizeof(*pte));
-
-    while ( pt_update_contig_markers(&page->val,
-                                     address_level_offset(addr, level),
-                                     level, PTE_kind_null) &&
-            ++level < min_pt_levels )
-    {
-        struct page_info *pg = maddr_to_page(pg_maddr);
-
-        unmap_vtd_domain_page(page);
-
-        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
-                                          false);
-        BUG_ON(pg_maddr < PAGE_SIZE);
-
-        page = map_vtd_domain_page(pg_maddr);
-        pte = &page[address_level_offset(addr, level)];
-        dma_clear_pte(*pte);
-        iommu_sync_cache(pte, sizeof(*pte));
-
-        *flush_flags |= IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
-        perfc_incr(iommu_pt_coalesces);
-    }
-
-    spin_unlock(&hd->arch.mapping_lock);
-
-    unmap_vtd_domain_page(page);
-
-    *flush_flags |= IOMMU_FLUSHF_modified;
-
-    if ( order && !dma_pte_superpage(old) )
-        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
-                      order / LEVEL_STRIDE);
-
-    return 0;
-}
-
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
 {
     u32 sts;
@@ -2264,11 +2195,17 @@ static int __must_check cf_check intel_i
 static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    daddr_t addr = dfn_to_daddr(dfn);
+    struct dma_pte *page = NULL, *pte = NULL, old;
+    uint64_t pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
+
     /*
      * While really we could unmap at any granularity, for now we assume unmaps
      * are issued by common code only at the same granularity as maps.
      */
-    ASSERT((dom_iommu(d)->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
@@ -2278,7 +2215,62 @@ static int __must_check cf_check intel_i
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
+    spin_lock(&hd->arch.mapping_lock);
+    /* get target level pte */
+    pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+    if ( pg_maddr < PAGE_SIZE )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        return pg_maddr ? -ENOMEM : 0;
+    }
+
+    page = map_vtd_domain_page(pg_maddr);
+    pte = &page[address_level_offset(addr, level)];
+
+    if ( !dma_pte_present(*pte) )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        unmap_vtd_domain_page(page);
+        return 0;
+    }
+
+    old = *pte;
+    dma_clear_pte(*pte);
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
+        pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
+    }
+
+    spin_unlock(&hd->arch.mapping_lock);
+
+    unmap_vtd_domain_page(page);
+
+    *flush_flags |= IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
+    return 0;
 }
 
 static int cf_check intel_iommu_lookup_page(


