Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B0535F2F
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338019.562775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY27-0006bO-Nw; Fri, 27 May 2022 11:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338019.562775; Fri, 27 May 2022 11:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY27-0006ZY-KV; Fri, 27 May 2022 11:21:31 +0000
Received: by outflank-mailman (input) for mailman id 338019;
 Fri, 27 May 2022 11:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuY25-0006Ml-NT
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:21:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c4d764-ddaf-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:21:28 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2172.outbound.protection.outlook.com [104.47.51.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-OMchAvVAOgOd_pNorEldkA-1; Fri, 27 May 2022 13:21:27 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2522.eurprd04.prod.outlook.com (2603:10a6:3:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:21:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:21:25 +0000
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
X-Inumbo-ID: 26c4d764-ddaf-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NJESEP16cpa4nN52+FBPmemD9Gs3qUaoc8yPLoMudo=;
	b=Ier2PKC/NvC2Oxuea+yUJr//WmUt9+YlqOPUBrSMWYh3+gtw8Y7KGHro0CMqgJEZxIIYrL
	8pSGsveu2MF8CC8C6e3XJaP7wEhucZY0KLqqFfa4Q20NuDgdY0MoniGPI27Rf9rDVsUne8
	Xwos+ZB+mhDDCVgr3QmGWomi27/cSOs=
X-MC-Unique: OMchAvVAOgOd_pNorEldkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOxb/ez4tiKBhV2d9dx84nl6WKyDS6kG+CDrC9ETpGeAfDmTJRSHLF7OLWRFcQGSOA6qTMQuwc2D/LXiaSsj4VepApIfxllf5DGGm5nJ10Uup9P84o+Hg/ggnKLnlMyseBEY8k8zPtSgW6uQLq0j4tG3Bz5/XKo1Zk94or6a6+M2NWnaTCaM7qx5kmdj7Mif5EOzqzJ8FbLGoZ/Uk+qi7iMDUq0fUJ8kz6P1lTbE1BIUOvO+NfPECL7dC2G4buc4sygeGVpxiVxnOOiqu7LclcIWUoiOyIBqL+oMl9JRFA1VrtckCJ4wpcb9Ei/UmwjwvEeSMAPsc6ikm0Suybv3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNGQdoucDFou5j3M8E7Hd4miL8kBXhKfjN3w6aHaDIs=;
 b=eoy/UHqGfBBzqayZJAtVwr9RO1eNVZHfo/3MHfjamIzt76wDAyr5qEyWOcv4PxCMeXG7iTcH2wGkg8mkCMA+cmtK1e/3tlPUHaniiXLwMMy2js9cUPxMyQyhM+mhI2Su8YzszUoER/ZEHmpcfHVFTMdqLEhBlb315iLpU/ZwDj/VpVs+vMf9S9yD8G4hHeQLwRGj6tEdKeg/CaLfzvupL3uSi4m+qttVXeoxd33yPm9DXTH19wj/WzxZ3OkvpnWNubHBFLCDw4qgVdlq8wwOSjJoaues16pHnxXs9PJeN6LDt0+HbCd7VNjQsC9V6t19vrfz/JHNMhBztWMB8ud5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f80cf5d-536e-4e4a-5c87-4b55efcac3a5@suse.com>
Date: Fri, 27 May 2022 13:21:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 15/15] VT-d: fold dma_pte_clear_one() into its only caller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8ec8054-aa7a-4057-53d7-08da3fd30947
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2522:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB25223FA12804C8418CC6063DB3D89@HE1PR0401MB2522.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KNMXAsJssjBYFHc9j/v2eLnA8QVQDpqZ88WdRljp3hTSiQnwjJgS+Bnod9oHi+8mENb7+JAEOxERmxwL1ghiqwMhzWyjFbkqLAvQMYO68LRep1mrOWMApFKNv2AmRJus48iDzdpaIxk+WrvFgkpKPJyK6asii8mG4WN/5JZkNX60m/QROKquy7TBfJotmSmBZmxwtgMMnIekcboNBwWHicI6/Mnjlqy3aj4RZTZ3pTvoHysVwEnRiph6pwNx9u2spPjQlWawK146S8joBiNTOa3H9c+4dx5tOb9ycid63OaE9JZoL3D1G+1eoGinKk92d3fsaw55p9oH6uTl4qWFVMdcMKsdZKr7+QYE6oCJrUGW2PledSVkMfMjaj6OiNv6uPR4Vq5TuXHpui+m+pu2DnT2cU9W7YZu+dHuApVBv5OCqc15FGD+768xMeLQBx7YaIVJ8uX5bAk1bOzeikYhFpcxJFSAbuwPU9Zps/92LgpSO7osMHH/Ado+4mg5+yWJPTwqvuPSHxdHyGqorEPcKsZ6Opx6l1LFxEdRsIXOAELgq1OfKEvP3NzTrgmtHJGdyIgnoP8Ebn4GKreWdFfXf9kOanJcNTEYdV9xmBVUGGA5ESSwTUePWRz+oj7m87Ay3QRTI29Slkzug8SFffasXyD2jwY2tcJ97+Pr/rHGZAq7jip8vZIleR+O7gOwFWK3Zw+BlFZYfRX9w1BMFPYK3IGJJk8v/OLMoQxWwXcpj/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(26005)(6486002)(4326008)(6512007)(66556008)(316002)(66476007)(508600001)(6506007)(54906003)(8676002)(31686004)(2616005)(83380400001)(6916009)(38100700002)(186003)(36756003)(5660300002)(8936002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZcZ2CAZTRS/1Ie39/UD9K3TCjRLkZoj+6i/QPritidV6SDsNjpQx3VOZnpvH?=
 =?us-ascii?Q?73dnlCGyYqJqfU3cxODOFZFBSaZR5uiydWmpGL/Nu/lm+2DakysmajEGGzdq?=
 =?us-ascii?Q?Q3+JXzmum8KAHsXYpftDP8O6vyKPg0mf/xZOFVbNpWWYSQUmsRiQPemG/jgJ?=
 =?us-ascii?Q?VbHxno0EvkMePZAof2GvtqtxzHXtCHKPEggNlU9Me2OKHG5XMmBHOA2TwwwY?=
 =?us-ascii?Q?drc4vxSn2OjEjl/deJ0iIJxujP3VVX6qyFGm6O5zqSFmdmkycYlXSZXaIrOt?=
 =?us-ascii?Q?VIDhNlWHjODF+PsJkZVexFpjq+pq5d9EaJrL/F5xdtnTUZjvwPMvhCokjLOS?=
 =?us-ascii?Q?FrYXgzz1fKKxvxzQEomMWkh0SOtS8e9wJQV3VPlUIJUg2Ca0yJaURlmucz4h?=
 =?us-ascii?Q?Kntz0TNX8AKs/jmXyLS8gvQnGXZH7gTHtAzqrTHmMs5aid3woGp1qvo1fONu?=
 =?us-ascii?Q?PlqWzM9bFACcCsfq7ApV3kngpFk7NkVryMc6zSLok5PDTxL4NA9y9OQ1Dhhh?=
 =?us-ascii?Q?OKw26JzB0mhmiDviPsgXj//u05Xwhr//Zj5TiXHPs6Wwwxe1tWMEe1xEySZV?=
 =?us-ascii?Q?iNpj4YeDHvOp+Gtic7Uzoyv7k6v/0oY92r6ygE29B/rUVfNoVt++bi/2G2rG?=
 =?us-ascii?Q?S7VNF5ka0L9pdTzUCv37sXZAHj7AR5/kUbMXCex/St+Up4B8hyer8b9ytJ2E?=
 =?us-ascii?Q?tiFFlEqBG2F11BTQutoVkOzUheUGdWmEHH9Zpc/yysnf2TgCvBG/lRHldeHD?=
 =?us-ascii?Q?GHPOBoX7eZnvY/6ky239yQfuhFsJijo7HfmBllVaaIU6Envt5zhPx5CDcUJ5?=
 =?us-ascii?Q?1StOjC0pDYZvJjSmjA/NnbcH8fxku0RKGERFpiCjUKDK8OCbqKlbnIc9ab6K?=
 =?us-ascii?Q?AvnuorserEY9kPW4ElRGnalXpHdzmlTubauSHPhnLufUBxbBVGunJkIfnH2/?=
 =?us-ascii?Q?rJnm4+odgR4v2a3KfqAZ/3Pmreof9Nlilf3i3Y4kZuu2/skLkUnpmKPyj01j?=
 =?us-ascii?Q?cY25Jc8pqazYpwahGZtdhkomPruxv+6yCyCS8QVI3vsRgM+2Apxt0qsXdL8M?=
 =?us-ascii?Q?HJ0td0AFdh7ON7KjEq9T3l85Yp+lZT9RFv1AJflPjTDj/H1eLnhIbegi6w5t?=
 =?us-ascii?Q?w6Y1wtn6gfnNLlM/8T8KpDQVLOZBkfifRKzAT409drMOu2Yv4JjfQfhB+nym?=
 =?us-ascii?Q?6i8/ct738UIQlPpyxUan8BBlccoNDlgSYCinfJAS0IGGwsrqoR71O2h70gDV?=
 =?us-ascii?Q?GrJ6/YEeidkwX9nhtwq3i8AzI/PFJ1JvIQCW1FZLmInnCDtLUJ7kOT9ji9hI?=
 =?us-ascii?Q?KPEjLCXQylqRPSjpnebQ3+qO3TLNQZl8U7iqcJADmZQLNyUmnjGUWFB2bwOp?=
 =?us-ascii?Q?SehTCnwHRgx7K20H6+3NDYB4FhY9i37SO1TBrgBvkfUSzGjkDEwXz6PgndXO?=
 =?us-ascii?Q?aHnKO8P6AT6i2XJrSHT8A6hkVXUsnfY3RsHecklB4HwdJlSXXRWEN3Ph59TX?=
 =?us-ascii?Q?YgqVY4rh6MamkmdICtO0vz3zW7vN/BMh62MGiCg+4U8L+7Jye7o+X3IhT/hJ?=
 =?us-ascii?Q?lyzD6cQK+4TBweZ0hPum/57c9uQrH4Zm7PYqMXDiMYHIqoKtGjxnIBIKmlRs?=
 =?us-ascii?Q?K1E90WUP4Dp/Yl+3Ps2Vt51N0h+qq7Lm0cR1qs25BFxJ9oHW33nZ31P24H7u?=
 =?us-ascii?Q?00zbCNIb6xKalCIFgCyRdEjo1wBGDsUEkOXoLl3R8KV1RX7c6DDfk3HWls0k?=
 =?us-ascii?Q?t6n5p2S1AQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec8054-aa7a-4057-53d7-08da3fd30947
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:21:25.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xsb5gN8ZtoXDIIJAmrPT3D6XymVg9YQo4EopeUZKFDizA+g0u2a8QFVJKnfo8Is42seBgdvObVVh9DDfIyZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2522

This way intel_iommu_unmap_page() ends up quite a bit more similar to
intel_iommu_map_page().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v5: Re-base of changes earlier in the series.
v4: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -806,75 +806,6 @@ static void queue_free_pt(struct domain_
     iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
 }
=20
-/* clear one page's page table */
-static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
-                             unsigned int order,
-                             unsigned int *flush_flags)
-{
-    struct domain_iommu *hd =3D dom_iommu(domain);
-    struct dma_pte *page =3D NULL, *pte =3D NULL, old;
-    u64 pg_maddr;
-    unsigned int level =3D (order / LEVEL_STRIDE) + 1;
-
-    spin_lock(&hd->arch.mapping_lock);
-    /* get target level pte */
-    pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flush_flags, =
false);
-    if ( pg_maddr < PAGE_SIZE )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return pg_maddr ? -ENOMEM : 0;
-    }
-
-    page =3D (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte =3D &page[address_level_offset(addr, level)];
-
-    if ( !dma_pte_present(*pte) )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        unmap_vtd_domain_page(page);
-        return 0;
-    }
-
-    old =3D *pte;
-    dma_clear_pte(*pte);
-    iommu_sync_cache(pte, sizeof(*pte));
-
-    while ( pt_update_contig_markers(&page->val,
-                                     address_level_offset(addr, level),
-                                     level, PTE_kind_null) &&
-            ++level < min_pt_levels )
-    {
-        struct page_info *pg =3D maddr_to_page(pg_maddr);
-
-        unmap_vtd_domain_page(page);
-
-        pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flush_fla=
gs,
-                                          false);
-        BUG_ON(pg_maddr < PAGE_SIZE);
-
-        page =3D map_vtd_domain_page(pg_maddr);
-        pte =3D &page[address_level_offset(addr, level)];
-        dma_clear_pte(*pte);
-        iommu_sync_cache(pte, sizeof(*pte));
-
-        *flush_flags |=3D IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
-        perfc_incr(iommu_pt_coalesces);
-    }
-
-    spin_unlock(&hd->arch.mapping_lock);
-
-    unmap_vtd_domain_page(page);
-
-    *flush_flags |=3D IOMMU_FLUSHF_modified;
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
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_f=
lags)
 {
+    struct domain_iommu *hd =3D dom_iommu(d);
+    daddr_t addr =3D dfn_to_daddr(dfn);
+    struct dma_pte *page =3D NULL, *pte =3D NULL, old;
+    uint64_t pg_maddr;
+    unsigned int level =3D (order / LEVEL_STRIDE) + 1;
+
     /*
      * While really we could unmap at any granularity, for now we assume u=
nmaps
      * are issued by common code only at the same granularity as maps.
      */
-    ASSERT((dom_iommu(d)->platform_ops->page_sizes >> order) & PAGE_SIZE_4=
K);
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
=20
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
@@ -2278,7 +2215,62 @@ static int __must_check cf_check intel_i
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
=20
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
+    spin_lock(&hd->arch.mapping_lock);
+    /* get target level pte */
+    pg_maddr =3D addr_to_dma_page_maddr(d, addr, level, flush_flags, false=
);
+    if ( pg_maddr < PAGE_SIZE )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        return pg_maddr ? -ENOMEM : 0;
+    }
+
+    page =3D map_vtd_domain_page(pg_maddr);
+    pte =3D &page[address_level_offset(addr, level)];
+
+    if ( !dma_pte_present(*pte) )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        unmap_vtd_domain_page(page);
+        return 0;
+    }
+
+    old =3D *pte;
+    dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg =3D maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr =3D addr_to_dma_page_maddr(d, addr, level, flush_flags, f=
alse);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page =3D map_vtd_domain_page(pg_maddr);
+        pte =3D &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |=3D IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
+    }
+
+    spin_unlock(&hd->arch.mapping_lock);
+
+    unmap_vtd_domain_page(page);
+
+    *flush_flags |=3D IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
+    return 0;
 }
=20
 static int cf_check intel_iommu_lookup_page(


