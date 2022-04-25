Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E720850DB65
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312547.529844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuGU-0003Da-3O; Mon, 25 Apr 2022 08:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312547.529844; Mon, 25 Apr 2022 08:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuGU-0003Bk-02; Mon, 25 Apr 2022 08:40:14 +0000
Received: by outflank-mailman (input) for mailman id 312547;
 Mon, 25 Apr 2022 08:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuGT-0003Bc-1g
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:40:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ae4a43-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:40:11 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-3F6FFF6yNJy5jC8k8S1EAA-1; Mon, 25 Apr 2022 10:40:09 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3024.eurprd04.prod.outlook.com (2603:10a6:802:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 25 Apr
 2022 08:40:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:40:06 +0000
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
X-Inumbo-ID: 51ae4a43-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rl/rdFZhS9nc5eyV5hC8ECsbWBsvtfY3/7jS7Dgl1JE=;
	b=EoABwmeuWlggepzpWtkjaJD32vsbewyVuKdu4X8SPf9+itK/SyDBtqJnvQ+/27em3YgeUQ
	bqiiVpm5eQFP4KWrBe4hmdmZY9vB5bBR6yCjVP2jNZOMwHZGgYuIEADqgCwZEL8UQkN7ht
	wd4mvMTxw24yTrTB7l3XIyxgM5biQRY=
X-MC-Unique: 3F6FFF6yNJy5jC8k8S1EAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXMyRwtIGfrvAAIAB1EYQmowUJqPgI4gjMD/0XF9WPzaYETlnEGaTN/Rq4UcAC+cDzdlUIrGEDklMl35dGPn1iRNCvWOA2j9EBpO2nnCbrokmAdEexQ93k2eQe+Hj+s8i2hXXKEtwhEg8b6THaH75vje/NKBWui/TVvC+UPPvzpJ3K6r3Nw0mjpi0sgN8MBd0b1vDOvHR2n47evm3786xzxbXNPo3mPIsaSRHnOPtWkLm36AA7TocdGGZD3R+OTpAsbA43uZKNFkOSe3DRZ7vOKic0qSK8dxX9q+sfTeDxtX/Hl5F6+YDS/FoHP70DDXxPPjr1uHVqlnVuWa5MlbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKU8QBhqAL8on7QC3DOwvdl/zHdOAjDj5Tns2U4wJto=;
 b=ZQDFbAIlAKOsg8tpHOqv3qSiWq5BKfaGsyREXhcvIL6ArFy5OWtQDo7UR9bgKw1znN+IunRBiZHWVb18mqIbXJtOSKNksYpmfR9a2doRNJOrDmjmaNqWSjIRG8ia+kX/SdPemvGAYNLHltjxIe6Bf9+wn2g3qVsZ9F0T5vzf7fPe95NmhJ1KTpBj1H307oaYJanfrgR7AWHwOlqkAPUZqcXR5udhBhhy4+J3yBHF8TgLLFjhL7CFm3H9x4HXvnJXVlZO7XiW2Ds+CcQGDCAKo9uXzk8WEFZB31OoBwALtLt1r9Cmof7lTZUomVA1UT+BFSkeH8+zjrkamgLWYyclSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <024c89df-9cf9-4d74-116d-ca8481dca90b@suse.com>
Date: Mon, 25 Apr 2022 10:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 12/21] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82bd58dc-66e2-41ee-fbc4-08da269732bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3024AE15395232B9B9F36AFEB3F89@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FPaoW+yJEZmfxGVw+R5ApLtETmbykN4S76uLHfqFCkHdkJGRbPxKqJg8ESda51jdqkUreXGpUeuKCbNCMPPqtd0yM9SmyC+aSPExNRgpgHCI5/asGdGTHTUamNzR2I2rLNroVU2JSE9TIQDMQAalmCOOxtzjn0A1cplR1X/6Jhdwa++DLdLxJaSxYIUNZy6ifP984huGp0P8L9scmm+lXYn4VHL0igzbyGMGvBNtoiuGuYT+yXCSJu/CkK6M0phe2hBbcTmDn9y39qKoX2JUpMlikJwjuS5OmbLdn24mSqPOEhnmRgUmPUyt4+G8PZrTWNyo50hy6nD2lpVHpZvPFOWqqmzncFOdKTRwyEvrV2e/nwwGaaZYnALMY4o37cOiORh9XxGYN9jP0+OC6JiNDxF9NsQVxwjBW3twkFndoqjqJ/UQjO3yBkUmLQqewcOH5t8N+mfKg4zboA9S65mljxTmdQ+EQg+fPnyuDJjp1Ouzwmz6lgt1toOi2v1cJAsB5RvUWL5FGJwZZVNLeuRvSmgDdP/FfhMLSo5lIcRQj0/NchA0heQsb07kM/HYgv/H87Oym3wQV+mUmXxcxDJ2iQDJI6Vp7Scw92TjtIIOqWkAmpmp4+AfACGr0Fe5wh8MRSIY9b7t9CsrTheYXXIUAaj1BhUaUyj7wEuxV2VIhPJ2NMw1h25euuXwkwG3K0pAdsd377Ifw6ex6MyRiV6SlnwNB+haB70Z6tlxqqbr0lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(86362001)(38100700002)(31696002)(508600001)(186003)(2616005)(83380400001)(8936002)(6486002)(26005)(6506007)(66946007)(6512007)(66556008)(36756003)(2906002)(6916009)(66476007)(31686004)(54906003)(4326008)(8676002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6wHeL+SCGwc0O6Z++agJmn05CcUEssKj/mai+ElDXgdOt6jQUGGhrnEa9Q8m?=
 =?us-ascii?Q?pI7l62yKdNCgS0oi/OfG05fszUNAc4/YdwU8lmnEHDoafZy8B/CYh4WfKjy4?=
 =?us-ascii?Q?jvfa/6FZIcm1O/Eh5+lrDitGPSTa+3ZTwnq8fQ44VemR3ZEcwg4C6GGxYcxN?=
 =?us-ascii?Q?dPiyoH+Unx+d+xEdVyThwSz9ltgsxBbVMCMfbUEQ1ia1Fh1oFyVfTa0H5iqZ?=
 =?us-ascii?Q?3e73uRx6KsaqChbNZeebEX4oGXlBsKFr8bB+21exyK08iGHsurUWihAz6UAq?=
 =?us-ascii?Q?UTW4QH94sn/F6QAfy1p/sT+2losEMwFfJ0cCk8ZK4iZkehEK08i92U1zjK2U?=
 =?us-ascii?Q?EsPHM5Bk3tbuGGyS0NP3EIGvtYK2Kyv2yVvdFXLt0z1gLFe/FVd+Lhao8fXz?=
 =?us-ascii?Q?VjtUREzfEJVy219XvUn2GtI3wonbBW4Fr3MdlnGb7sNBdL7Gv9ihnw26i0Kw?=
 =?us-ascii?Q?SxhbGSy7X2A4vQqPs+m2j7VZP6YXGi03uRZALrmIWf1s/o3FXwT3zbYCd0+j?=
 =?us-ascii?Q?pCiovVkFYaFTMzgcOi7cviWgSmnEiKukcGVADVjv47kRyaB1VpCug1kViZSd?=
 =?us-ascii?Q?JkQu9gbfJSjSmT+CBd32JIqBo1XMaKMWLE06wMjJoAbO7Tg9vtQJCuSSPqcz?=
 =?us-ascii?Q?4UOuIQ+cSw4WNx+0GNrya3K8J7R0kdNcz/wqy1LVLXmRibQfkKzmYD4vjWKe?=
 =?us-ascii?Q?Nb0i1eWzyw4B4rALrrRH/DGci4l33unurIzPE/Om/5lwcxBVmmEzj3GCD8zP?=
 =?us-ascii?Q?RWHndz7IZlCzRLvbj6eBeBEgekqYDQWEdVtU47R47vdK0KfHAgohcrJTeA39?=
 =?us-ascii?Q?sNto59bGlHT3C6WLONK9fpXAtXn8DUoQBLq3gWjwUDursmUrMPapu0aLPRfz?=
 =?us-ascii?Q?8okzHAkXEUdoftInLNRWFKqueJEQPctQK+hULsuf/N6Oqn36teVSsTPUeGsz?=
 =?us-ascii?Q?+X6hAPGXatkq2nDrBTNgPGn/QiZy3+hwq6wMCM9MaMmndROYDTWDqFLXo37r?=
 =?us-ascii?Q?vZqy7cXXDkiZTcp/dTCfrqZRFfczs/WAQzA6VAO1t8/g46z3TdoJXsmItWMj?=
 =?us-ascii?Q?o82qFnk6o/hoQF/ynHeTiCFmhcDowjr5lMkMyQIfidoXuCwGSJ+z/RnpoHhY?=
 =?us-ascii?Q?LGe43wkTu405mxVdtIjxmj99WvW0Tj0BOpoQGsmgW1qfqnnaHOTtfR8T66Gx?=
 =?us-ascii?Q?esh3/oz3AMBNEzYn3qz7f2vc2a4GkEBqrjeuO2WJTBRe7QYVv5s+aFXPDXbt?=
 =?us-ascii?Q?GZkUjKiA7faN2ktybopOOzKnmp2dBjvf4kxNl47YBkZ5KPJDMTGJGa81jibj?=
 =?us-ascii?Q?KItB8ZNqck5i/Kn+OPTmXac2nMTJkw+mL4ifJnLQUxIigydKkqwGJ5rSP+CD?=
 =?us-ascii?Q?Ie5M0QjaTPFUBxk2O2vQx6HE7XMxJ8k5/fUrg/CshONpnW7FUhQtiV97ANOl?=
 =?us-ascii?Q?g4Q/GdSzyCoq/xruGDPUFjXta5QudSszVo9846aNXxlsK2J1uY/Z/D60zgaw?=
 =?us-ascii?Q?uPJ9UIvN4pif/LHd4bZsv4sYqvi9/ar1INrt7tO7FZ2Z/PQIl0B047KJtB93?=
 =?us-ascii?Q?DYDyDetZAN1Nr1lYqORpITxcTVazHbHXk+uhPvTG+omtmSDZ0C7ndFnRxJeZ?=
 =?us-ascii?Q?1C4CyHDvhkOZnug6KwolIPCo1sbdhKGb/dEYHj2zNNdMzT54f+VaH6mvlH7T?=
 =?us-ascii?Q?qWGfedbf1wO0zSpSpeuOJi6tBy9A3uZ7+IwhX63aSYS4GJiMkZ6PBEUbhtN2?=
 =?us-ascii?Q?rKJHk7TSMQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bd58dc-66e2-41ee-fbc4-08da269732bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:40:06.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVB+Hh6GpwtGZPGomUBi9S2PMHQ5b0XT0eTEr9YF7a3Q4JuqIbi9RTjhzfMCHKrF5cf9FY2WgFTQIR+QdVIFPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024

Having a separate flush-all hook has always been puzzling me some. We
will want to be able to force a full flush via accumulated flush flags
from the map/unmap functions. Introduce a respective new flag and fold
all flush handling to use the single remaining hook.

Note that because of the respective comments in SMMU and IPMMU-VMSA
code, I've folded the two prior hook functions into one. For SMMU-v3,
which lacks a comment towards incapable hardware, I've left both
functions in place on the assumption that selective and full flushes
will eventually want separating.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # IPMMU-V=
MSA, SMMU-V2
Reviewed-by: Rahul Singh <rahul.singh@arm.com> # SMMUv3
Acked-by: Julien Grall <jgrall@amazon.com> # Arm
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
TBD: What we really are going to need is for the map/unmap functions to
     specify that a wider region needs flushing than just the one
     covered by the present set of (un)maps. This may still be less than
     a full flush, but at least as a first step it seemed better to me
     to keep things simple and go the flush-all route.
---
v4: Re-base.
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -258,7 +258,6 @@ int cf_check amd_iommu_get_reserved_devi
 int __must_check cf_check amd_iommu_flush_iotlb_pages(
     struct domain *d, dfn_t dfn, unsigned long page_count,
     unsigned int flush_flags);
-int __must_check cf_check amd_iommu_flush_iotlb_all(struct domain *d);
 void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int d=
ev_id,
                              dfn_t dfn);
=20
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -539,15 +539,18 @@ int cf_check amd_iommu_flush_iotlb_pages
 {
     unsigned long dfn_l =3D dfn_x(dfn);
=20
-    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-    ASSERT(flush_flags);
+    if ( !(flush_flags & IOMMU_FLUSHF_all) )
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
=20
     /* Unless a PTE was modified, no flush is required */
     if ( !(flush_flags & IOMMU_FLUSHF_modified) )
         return 0;
=20
-    /* If the range wraps then just flush everything */
-    if ( dfn_l + page_count < dfn_l )
+    /* If so requested or if the range wraps then just flush everything. *=
/
+    if ( (flush_flags & IOMMU_FLUSHF_all) || dfn_l + page_count < dfn_l )
     {
         amd_iommu_flush_all_pages(d);
         return 0;
@@ -572,13 +575,6 @@ int cf_check amd_iommu_flush_iotlb_pages
=20
     return 0;
 }
-
-int cf_check amd_iommu_flush_iotlb_all(struct domain *d)
-{
-    amd_iommu_flush_all_pages(d);
-
-    return 0;
-}
=20
 int amd_iommu_reserve_domain_unity_map(struct domain *d,
                                        const struct ivrs_unity_map *map,
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -759,7 +759,6 @@ static const struct iommu_ops __initcons
     .map_page =3D amd_iommu_map_page,
     .unmap_page =3D amd_iommu_unmap_page,
     .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
-    .iotlb_flush_all =3D amd_iommu_flush_iotlb_all,
     .reassign_device =3D reassign_device,
     .get_device_group_id =3D amd_iommu_group_id,
     .enable_x2apic =3D iov_enable_xt,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1000,13 +1000,19 @@ out:
 }
=20
 /* Xen IOMMU ops */
-static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
+static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
+                                          unsigned long page_count,
+                                          unsigned int flush_flags)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
=20
+    ASSERT(flush_flags);
+
     if ( !xen_domain || !xen_domain->root_domain )
         return 0;
=20
+    /* The hardware doesn't support selective TLB flush. */
+
     spin_lock(&xen_domain->lock);
     ipmmu_tlb_invalidate(xen_domain->root_domain);
     spin_unlock(&xen_domain->lock);
@@ -1014,16 +1020,6 @@ static int __must_check ipmmu_iotlb_flus
     return 0;
 }
=20
-static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
-                                          unsigned long page_count,
-                                          unsigned int flush_flags)
-{
-    ASSERT(flush_flags);
-
-    /* The hardware doesn't support selective TLB flush. */
-    return ipmmu_iotlb_flush_all(d);
-}
-
 static struct ipmmu_vmsa_domain *ipmmu_get_cache_domain(struct domain *d,
                                                         struct device *dev=
)
 {
@@ -1360,7 +1356,6 @@ static const struct iommu_ops ipmmu_iomm
     .hwdom_init      =3D arch_iommu_hwdom_init,
     .teardown        =3D ipmmu_iommu_domain_teardown,
     .iotlb_flush     =3D ipmmu_iotlb_flush,
-    .iotlb_flush_all =3D ipmmu_iotlb_flush_all,
     .assign_device   =3D ipmmu_assign_device,
     .reassign_device =3D ipmmu_reassign_device,
     .map_page        =3D arm_iommu_map_page,
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2649,11 +2649,17 @@ static int force_stage =3D 2;
  */
 static u32 platform_features =3D ARM_SMMU_FEAT_COHERENT_WALK;
=20
-static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
+static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
+					     unsigned long page_count,
+					     unsigned int flush_flags)
 {
 	struct arm_smmu_xen_domain *smmu_domain =3D dom_iommu(d)->arch.priv;
 	struct iommu_domain *cfg;
=20
+	ASSERT(flush_flags);
+
+	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
+
 	spin_lock(&smmu_domain->lock);
 	list_for_each_entry(cfg, &smmu_domain->contexts, list) {
 		/*
@@ -2670,16 +2676,6 @@ static int __must_check arm_smmu_iotlb_f
 	return 0;
 }
=20
-static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
-					     unsigned long page_count,
-					     unsigned int flush_flags)
-{
-	ASSERT(flush_flags);
-
-	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
-	return arm_smmu_iotlb_flush_all(d);
-}
-
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 						struct device *dev)
 {
@@ -2864,7 +2860,6 @@ static const struct iommu_ops arm_smmu_i
     .add_device =3D arm_smmu_dt_add_device_generic,
     .teardown =3D arm_smmu_iommu_domain_teardown,
     .iotlb_flush =3D arm_smmu_iotlb_flush,
-    .iotlb_flush_all =3D arm_smmu_iotlb_flush_all,
     .assign_device =3D arm_smmu_assign_dev,
     .reassign_device =3D arm_smmu_reassign_dev,
     .map_page =3D arm_iommu_map_page,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3416,7 +3416,6 @@ static const struct iommu_ops arm_smmu_i
 	.hwdom_init		=3D arch_iommu_hwdom_init,
 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
-	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
 	.assign_device		=3D arm_smmu_assign_dev,
 	.reassign_device	=3D arm_smmu_reassign_dev,
 	.map_page		=3D arm_iommu_map_page,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -478,15 +478,12 @@ int iommu_iotlb_flush_all(struct domain
     const struct domain_iommu *hd =3D dom_iommu(d);
     int rc;
=20
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush_all ||
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
          !flush_flags )
         return 0;
=20
-    /*
-     * The operation does a full flush so we don't need to pass the
-     * flush_flags in.
-     */
-    rc =3D iommu_call(hd->platform_ops, iotlb_flush_all, d);
+    rc =3D iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
+                    flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
         if ( !d->is_shutting_down && printk_ratelimit() )
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -772,18 +772,21 @@ static int __must_check cf_check iommu_f
     struct domain *d, dfn_t dfn, unsigned long page_count,
     unsigned int flush_flags)
 {
-    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-    ASSERT(flush_flags);
+    if ( flush_flags & IOMMU_FLUSHF_all )
+    {
+        dfn =3D INVALID_DFN;
+        page_count =3D 0;
+    }
+    else
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
=20
     return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
                              page_count);
 }
=20
-static int __must_check cf_check iommu_flush_iotlb_all(struct domain *d)
-{
-    return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
-}
-
 static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int=
 level)
 {
     if ( level > 1 )
@@ -3185,7 +3188,6 @@ static const struct iommu_ops __initcons
     .resume =3D vtd_resume,
     .crash_shutdown =3D vtd_crash_shutdown,
     .iotlb_flush =3D iommu_flush_iotlb_pages,
-    .iotlb_flush_all =3D iommu_flush_iotlb_all,
     .get_reserved_device_memory =3D intel_iommu_get_reserved_device_memory=
,
     .dump_page_tables =3D vtd_dump_page_tables,
 };
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -147,9 +147,11 @@ enum
 {
     _IOMMU_FLUSHF_added,
     _IOMMU_FLUSHF_modified,
+    _IOMMU_FLUSHF_all,
 };
 #define IOMMU_FLUSHF_added (1u << _IOMMU_FLUSHF_added)
 #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
+#define IOMMU_FLUSHF_all (1u << _IOMMU_FLUSHF_all)
=20
 int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                            unsigned long page_count, unsigned int flags,
@@ -281,7 +283,6 @@ struct iommu_ops {
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
-    int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
     void (*dump_page_tables)(struct domain *d);
=20


