Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF9535F0C
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337963.562687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXv3-0000vi-Rq; Fri, 27 May 2022 11:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337963.562687; Fri, 27 May 2022 11:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXv3-0000tr-NK; Fri, 27 May 2022 11:14:13 +0000
Received: by outflank-mailman (input) for mailman id 337963;
 Fri, 27 May 2022 11:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXv2-0008SK-19
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:14:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22274aad-ddae-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:14:11 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-fmljMXHfPk-f5mcWokOwhw-1; Fri, 27 May 2022 13:14:09 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:14:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:14:08 +0000
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
X-Inumbo-ID: 22274aad-ddae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qr+KZP5Q4gC1/YO9J87FKq30YhywATFS4ksFiE6GDtE=;
	b=hPSwJ3iYlUtUzgluIMOnZMRrUXfKi/6cNcNmWwUaAjrz83+uGak1X8K5RlXk1jQO5fRSTv
	/Yt/Zpw9eDmBhkpl0LcTe7mk9teLpGEj6F3P5lhDgDtsrIyAXoT6Zjnz/8dj7n+AvBydT2
	oThSMZtoFKdqW0KQgK8bk5yDMF1JIZU=
X-MC-Unique: fmljMXHfPk-f5mcWokOwhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9m7/WYFjm7m5/zAK8CUrPo/Ovs8K7xHl+tCNJC2MfqGmP1LRizO/KsTFBZ/aMyP6tUqM+Ybp6Qf6/LuYZQl6DdEHrYU7gAWmtPy2cTU1L5GoJuTMqZHKj+PpNEdZ9wCBV1C/f38A1y2JICLfd9F/buMPRz7oNm6PgGkzXhTGyYXYSYvukWvlUsgZH1ucCr+L8gU0gHdYYl/3/qTdJsiluiVXnjgvnrElPjGcnUupgz90JghhJRM/iUyMvQMMMbKK7QFV6ougYiCSo/NUgrbx2JsQ+zonQXHFm6R5nXGUu3ebwuek1Wdj5OFrKH2FMrtbceNb9dr2V7Wl17MDqNpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+qwjWOHPpUCurQ63u+c7grNKTN+vnNpokZN1aH+eg0=;
 b=SIoCQIN/cCq7IIW2Ga/2B7dfP+O6K2LrNQMGYUvkl0TE9/TuD5Z+q/nrppDuHq/eEhx21myKlabl2grXxBnWRVpiRQ5cwUMpUplqoNI03cgcFUetaCdvfJEU6qKt9tSOYla1EMamFkRkFOOe+W1bFxExCfb00y3R9y1JB1SAi8AGNcSg9vNS0fFySyjd2TNTP708sMyGxFdJN2g9DIMmJ7S8kLbYbOZKkdE1+2J4IzKMO7cws/GTJJ1pWqZ3O7msOrkVIvx8oG42RPwAZFKKDdttK9y+MLiVHiOakUmID4qzJOlrn7t4eS4lw9G4w4Z0ch/4CM5v7qtjzIOTZep/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <108ae661-147e-c107-c826-1db67e0f0e5b@suse.com>
Date: Fri, 27 May 2022 13:14:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 05/15] VT-d: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0375.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44ad1ae0-ccc4-47ba-381a-08da3fd204dc
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7210758047009E8438EE0A50B3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APk5CsImZyV4iHiy+CsXo/pqpfwe7q9fK8CN8jydj/aqQeLkkFDKfAE8dkmoStRpFqB3WSD7aIuns4UQjtTW3o0IFdhVodVFqu4OoMLuPBRS06O+GCz35zwgWCjbX403GGA0wx3ugdPlcPYjdNS53J5mDqDQL0y9g21+/0J3cua1FH0yrzannacUlypmItqm9FvGD/li20yoDqnWDymKOJH8wf0taTI2XiWqFRxwK3QrUApOGgaWbBSj5BdLbjrOfpuCXlm8ksBu1431YrwWz7K3tYKXke2XGIJSEd6IPtM5ceNfbv2vet0VraPDmSXzsPwUlBLkA8RBMgQC9ifqLGZUBwimNGydXMgI8xeRK05bIzDQfxjM8Xs9uvHhCbAyNUs1UU607sC0HeOYq3rOahK73wplfj5xBokZb44fPda+gCbXq9l591kgIIcFlFDTUXpte4j6RN+rePi9e9QLyqcOpYOsVeyhjTe9psty6RxMjiPxPngUh1dy/bT/gG0xgknFk2WwhfwyndZoAPfaRVWAe/TYRwqlGOEpnpgTJub09ByRuz+9FR7118M3645pgncEJmQ65wCCzN/f2JAJBct+fe9Y/VW6dAq9NOX9vPLGVZalWBs0fNNNmhwPlBF8gdrZDE/BHxxzVXu7X/NZiS8lKolMXj1OcKoDETSD9Ac3DMB9wSEzzglBg/2ElaVI2ajdBOf97eV3Veo3OA0mQ3isxk6qW2EePz5Be8qunv1xjoDDcidDHT+yWbiWDp6b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UL6SuA47fxEt9dHrRcLtF7R9Eow6uKVxuEzpV0ULyeUHKY59wjMhLPtEo59n?=
 =?us-ascii?Q?632xhuDPLs1Wn8Jn2EYEoZKjo42APdCC6JmCehE0morsQHnFM/5n8uJ3KCYm?=
 =?us-ascii?Q?3xUCjv14yz9WAlEP9z3l6KsUK1BPE0AW1GGjDJrqEkLrhxBDwRtwebS4u3RX?=
 =?us-ascii?Q?5Nsqp1+pNMXIhKayQ7Z6xkx0CdXoKPENBaehBmFG30my8V3izDjfNutIO2BU?=
 =?us-ascii?Q?Sn6+unPGhfoAmKgiYicMWys6olOPqfBXJN6lAajp1wgSKnoP96mB6w1DlUDB?=
 =?us-ascii?Q?0f77nNT/bA0ypaj7r7c868Q4dfTQgNGSkAly/9Po4edzvBiz9f4/+SGULl6o?=
 =?us-ascii?Q?//CLhXZEZR3BCEVErx7efn6uohI43nJB2o2SV1aC5MrP2TaFlmxU8UEem78i?=
 =?us-ascii?Q?JwagwUuQA6HlemqB6dR2Nv7lY3LouJVuE7GWevMmjEt0RBnVL+EmoZVoEcgj?=
 =?us-ascii?Q?ndC3UTLLw5OQ2EvDpatzCXdmQri1PmZkInn6s4HmWeZaPkfZqyuBkZYO6cK/?=
 =?us-ascii?Q?TjZWbguDHdh94tgo3xuLb/UQxSWikDP94cdV4lH3Ol3N81k5U1bQMhRj9Sva?=
 =?us-ascii?Q?s7MFHdLynBntHdAjRBCuOcQgjShHw2lQvpNUMjnkxM9E3byFMLKhsmNIln8b?=
 =?us-ascii?Q?4JytYZTBj5ypPBBhYN+hIuzTX0TGDpOYQU74nfsqAHZWgUwvBwNGQDdqMDcn?=
 =?us-ascii?Q?Sdx3ZKM/ZTDLegx7vkSEgvtVQFWLRXEXUB70c7Ha38tA2YRsk/ZDmvb2OOKL?=
 =?us-ascii?Q?Y+/4tEINc/3uguDk9gVeRnnWR+psUE2ZZW34ULVMfNsQ6ORCUK6ZRG0XsLVi?=
 =?us-ascii?Q?HJiycQEvoza2sM9pdZuKZUyc8KfFyB/gvrCpebT+lbigWJYUc+nwlptwMTaa?=
 =?us-ascii?Q?JvFgNx00yn3C3aKhkUE2J8IsJTpCQJm3EE9n5lTqlzDEAl1Lvvy4EWBo3OLu?=
 =?us-ascii?Q?pda2IZCt9G6Et9Q2sx0FyvOUQpfRXgSBDE7tkHOSwLtysHplZq6aXtJkiycD?=
 =?us-ascii?Q?474vEPAmPe/vUtrDXA9IgLku4JQeTMtzDbRZruh96d6tMKDG06zGxeEI/GE9?=
 =?us-ascii?Q?QrWUFHUbommxisvtAJK8gV+mK4BjrDvP+0wsNZkJBJvO6aYDMF1HDmUQgoM7?=
 =?us-ascii?Q?llp7jaw666o/8zAWtr2PXSIX8wDs9Z+GoGkdLmjvmvWQZGTeZNSzPp/+iu6u?=
 =?us-ascii?Q?OqfABWz4moxKkcI3XhLhHZMBSF8MxH1EzXFeoiDDiQJGjNlLupahjQ04Y+VA?=
 =?us-ascii?Q?wb2uybHALmSmbykHh4KUuBn1IEFyOmoBv1AL2eyCIHHV+pjWhuyEUu0hDjgo?=
 =?us-ascii?Q?M7GRCrSSztJ6ylQ5b5ONaiTXLCiKcsv9cfxyjnPWykB9KbB6eJIf8eiN2jKL?=
 =?us-ascii?Q?qhzKk1Bn/PwrMHvEL+RaePdYBvW9rszX0ftQrmxi+GytrQCo5h89MhaCehO4?=
 =?us-ascii?Q?35qv0s5ZlwdoNeXug+rcEOhO4E9vaJoEF6TM//6/fEAAYEP8NQ5iDfjtYwNe?=
 =?us-ascii?Q?+Vv12hSCtTuRkOicglcn67gOlG9nKETZiYZLcrCHPn7IU9UuQjDWjpxHbhbT?=
 =?us-ascii?Q?A0I1/emsm8WuFWGEUr+D8Fi7bhZEZ8MR6xXLZW/nEE9dqZCxqM3lVivKJ8rI?=
 =?us-ascii?Q?HFt9d9jwqXahMDBfDP97rN6coj6/Ua6tz2T/tVMsM+38PgCXvT2hkhG7hgky?=
 =?us-ascii?Q?5ABfaINFF94UW94sDuUhmoyacf9xZwnVnVfKpn3wn5a4oqnqphBSLN0HeMXi?=
 =?us-ascii?Q?SJ6EfCZ25A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ad1ae0-ccc4-47ba-381a-08da3fd204dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:14:08.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V45kra9gd3xz7dKR++5pMJh1GI2dkk25mYNQpwz9vUq5ZSge1MRyvygP/3vNOIfqGTb4+C0cKB/19mtAWLkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v5: In intel_iommu_{,un}map_page() assert page order is supported.
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible. Tighten assertion.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -784,18 +784,37 @@ static int __must_check cf_check iommu_f
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
=20
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int=
 level)
+{
+    if ( level > 1 )
+    {
+        struct dma_pte *pt =3D map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i =3D 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              level - 1);
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 /* clear one page's page table */
 static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
                              unsigned int order,
                              unsigned int *flush_flags)
 {
     struct domain_iommu *hd =3D dom_iommu(domain);
-    struct dma_pte *page =3D NULL, *pte =3D NULL;
+    struct dma_pte *page =3D NULL, *pte =3D NULL, old;
     u64 pg_maddr;
+    unsigned int level =3D (order / LEVEL_STRIDE) + 1;
=20
     spin_lock(&hd->arch.mapping_lock);
-    /* get last level pte */
-    pg_maddr =3D addr_to_dma_page_maddr(domain, addr, 1, flush_flags, fals=
e);
+    /* get target level pte */
+    pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flush_flags, =
false);
     if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -803,7 +822,7 @@ static int dma_pte_clear_one(struct doma
     }
=20
     page =3D (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte =3D page + address_level_offset(addr, 1);
+    pte =3D &page[address_level_offset(addr, level)];
=20
     if ( !dma_pte_present(*pte) )
     {
@@ -812,14 +831,20 @@ static int dma_pte_clear_one(struct doma
         return 0;
     }
=20
+    old =3D *pte;
     dma_clear_pte(*pte);
-    *flush_flags |=3D IOMMU_FLUSHF_modified;
=20
     spin_unlock(&hd->arch.mapping_lock);
     iommu_sync_cache(pte, sizeof(struct dma_pte));
=20
     unmap_vtd_domain_page(page);
=20
+    *flush_flags |=3D IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
     return 0;
 }
=20
@@ -2097,8 +2122,12 @@ static int __must_check cf_check intel_i
     struct domain_iommu *hd =3D dom_iommu(d);
     struct dma_pte *page, *pte, old, new =3D {};
     u64 pg_maddr;
+    unsigned int level =3D (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc =3D 0;
=20
+    ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
+           PAGE_SIZE_4K);
+
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
         return 0;
@@ -2121,7 +2150,7 @@ static int __must_check cf_check intel_i
         return 0;
     }
=20
-    pg_maddr =3D addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_fla=
gs,
+    pg_maddr =3D addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush=
_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -2130,13 +2159,15 @@ static int __must_check cf_check intel_i
     }
=20
     page =3D (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte =3D &page[dfn_x(dfn) & LEVEL_MASK];
+    pte =3D &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old =3D *pte;
=20
     dma_set_pte_addr(new, mfn_to_maddr(mfn));
     dma_set_pte_prot(new,
                      ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
                      ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
+    if ( IOMMUF_order(flags) )
+        dma_set_pte_superpage(new);
=20
     /* Set the SNP on leaf page table if Snoop Control available */
     if ( iommu_snoop )
@@ -2157,14 +2188,26 @@ static int __must_check cf_check intel_i
=20
     *flush_flags |=3D IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |=3D IOMMU_FLUSHF_modified;
=20
+        if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
+            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                          IOMMUF_order(flags) / LEVEL_STRIDE);
+    }
+
     return rc;
 }
=20
 static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_f=
lags)
 {
+    /*
+     * While really we could unmap at any granularity, for now we assume u=
nmaps
+     * are issued by common code only at the same granularity as maps.
+     */
+    ASSERT((dom_iommu(d)->platform_ops->page_sizes >> order) & PAGE_SIZE_4=
K);
+
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
         return 0;
@@ -2519,6 +2562,7 @@ static int __init cf_check vtd_setup(voi
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes =3D PAGE_SIZE_2M | PAGE_SIZE_1G;
     int ret;
     bool reg_inval_supported =3D true;
=20
@@ -2561,6 +2605,11 @@ static int __init cf_check vtd_setup(voi
                cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
                cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
=20
+        if ( !cap_sps_2mb(iommu->cap) )
+            large_sizes &=3D ~PAGE_SIZE_2M;
+        if ( !cap_sps_1gb(iommu->cap) )
+            large_sizes &=3D ~PAGE_SIZE_1G;
+
 #ifndef iommu_snoop
         if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
             iommu_snoop =3D false;
@@ -2632,6 +2681,9 @@ static int __init cf_check vtd_setup(voi
     if ( ret )
         goto error;
=20
+    ASSERT(iommu_ops.page_sizes =3D=3D PAGE_SIZE_4K);
+    iommu_ops.page_sizes |=3D large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
=20
     return 0;
@@ -2964,7 +3016,7 @@ static void vtd_dump_page_table_level(pa
             continue;
=20
         address =3D gpa + offset_level_address(i, level);
-        if ( next_level >=3D 1 )=20
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


