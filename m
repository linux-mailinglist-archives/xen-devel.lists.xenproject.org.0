Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58957535F13
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337971.562697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXxK-0001f6-AN; Fri, 27 May 2022 11:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337971.562697; Fri, 27 May 2022 11:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXxK-0001cq-7J; Fri, 27 May 2022 11:16:34 +0000
Received: by outflank-mailman (input) for mailman id 337971;
 Fri, 27 May 2022 11:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXxI-0001ck-9J
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:16:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7576a164-ddae-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:16:30 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-B9DPddiIN52f1adwB54yWw-1; Fri, 27 May 2022 13:16:29 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:16:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:16:27 +0000
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
X-Inumbo-ID: 7576a164-ddae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bM6AKT2K8jEmZRUNQZbq7buu+njl5MQC2zWp1UMeQTk=;
	b=baKMvUM1JDVOsxLPJuIQw7pas24OnCSdA7ZzK3oMz3xBFnVfVGNQ+/hSgiXOVnfsVvMGix
	oy7Zq/Hxh9MndqVSEatz7AhvH0a9Gk1/j/tuU65vdbvU+AwAFoMYZ8TvedhBkGGqdoC0zN
	UEnbNuVloUh6HsCnsousrAiGyYMO+c4=
X-MC-Unique: B9DPddiIN52f1adwB54yWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edGC8k8OfY+4mXs+IRiHqfqsiaWtdBltJ7KU6Mk9NrxOGGtSwcAbU5hboRRGgcrf421L4ACrKVqdK8KFygokU4/3GbRX+/DDh5/U64SWE3iNpk7QDU39armjdmlvDBt5HWdDEHglv2K8CLyYROIIed3qwuhz5B008wbvyvB61BeClGpmI9il4d55L9qN3/5ulKpilp5yU50WwugEHYW6m6oEFnwQmqACCYmrSbCBDQpDNWOPz3YQJScwtSQWChChG4xMYdk5eGu77GPRPUZNtP2LZsF5cXjmuzvOKuktGGHIsjc/fXlyc9AItrl4pX+atOTXCSviXD61pDCn9v5rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffLWJC6aWwnaCLPYH0Qbww7Cy6DESc8jbX3Bj63/FiM=;
 b=f0m1nj8lAmd/8yWL8YJj7Got8Cb0hri6BxfRS/qzi8uFdyJQwl7jphJZQkRp4HOaB8lYTn81n02rdEOU8jVfUh+mGGR12sqol44PMFpIYi2P3AFzEAYeLd1fl1A1l8BVuy/Ns57iJsahZ5/fXScDM2O3GlOWlS/YzO+e0jqFvcrtb6/FFNKRphPm+WB4MBEyk6dIO6/m0NGBmbUf9E3ic7x1y2+kDO8dfdE5AQjCHZEih8xyDU2amA8eo0OmagEpopK4zeSnujSj4yFt02ZH6zb+cjSsxmINvYBzHGSxfonEgVU9VmBVNdGIB6fgy9D6Ve/QpUbw/d0aFeIsUQoxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2807d8c3-054d-81a4-172d-9a08f023d300@suse.com>
Date: Fri, 27 May 2022 13:16:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 06/15] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <stefano@stabellini.net>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d1abd8a-c1b4-4791-6fc7-08da3fd2578e
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831C8FF11A53F87CDEB0546B3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Brywkv2oRW/XHE/tfRdtEQCvd68Lfk6eQTLHsJDeI0mcd4tQhpUBaNwjbMYxF8feX3R5cZrda8+dwfJZl1ZvpcuTtTcwRnyanuqO9T/EvQ54a6hUvQtXXg1NQuchriRaJuN/u+8ueQbqMuDlrA62NkJ+ZNxq3+fCfkoyMIhwzLTtNCBQxHq6/xBWesdDTKFYYL8jSkpNg6DWE7gHB3GGimIYz96sAEYv3mX7tMUFrRv9te8LVwNC2W4WM2lxPPHs5JLwoGZpkXSbE4UHXL5aAoOnoPLaOZls4Mfx7YiDoPctMIgwla30tijAPobIRHwqNoXzedWi3lMTG0dVOs1ewIiqZl+z6eK4dB/rhbo3sjbL8e4AAlM2j/KpIClU+iHYU1bHNeVSmPmLYvAqpTnUlNFTpQEbC0E8bLN/SguO3ojtaw3sMjXeO2FqTcp3XA9WuSuJXBmzPc4gIhij7mv9vMaNtng9+LQoGLh0y8B6KuDKy/tzbx1kau/OWfXqHAc3qIPi2ceYEhjT9cmtfkiDildgiWgTsKzTNFTpQdQrgTrDsI5rTo48GXtOM/y2IwL1FrNg/hg4Q2b1+FRWw4VHu5HITgEQArg6v4aRdFYWSPzh74ifYTfL534k4M9KlQfnFcsPIfgHFiwyaHBZ25AMwV8paDqbinUISYK19cwYeqEhoz60lseZB1vEeY25qykDB6MRtMhwl2PL57+cf4QvWPHn+lOcbxWbiSXWNidr8uMST4SBua1+UcgUTe1jLvbq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(6666004)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWIDvZvDsSY76jAYGPsRY7YJR94ywwYnIwjZTgPEVB9uyy1sJKcOl+u7PzvR?=
 =?us-ascii?Q?UzcYS+MT/oYaz+BGVhiOiNK3hBp8aPUKKFtS/Jch5j2JlD/m+jCq1T0qqQ/J?=
 =?us-ascii?Q?U21vJoZPJFBnsZt654BtcAPOgys5j1JGdYFo4G+dxUwXs+zq0RCwVnG7g32n?=
 =?us-ascii?Q?aeB8tgAo79ielTEEX7oPgqdYs3l+rDQEM1ESJT02pqWMzy2n9SSA4M4Lor2w?=
 =?us-ascii?Q?wNudCzr06sztwVJkoFsHMsa9Mb+d+/DO9ne0ZIFdL3a+mjfRvSLGwUT0BsXg?=
 =?us-ascii?Q?KEoOPJ9/UL3eqiAQQWma+k2gcyd0pZmF6gy8K8bLejHhPbudWHJXXv+La5LJ?=
 =?us-ascii?Q?L3M+8CFQ4n3KV39fDrNOjv6LlRbD5UuEGpaCpIXX+7lkqmZPXelroUXGgnme?=
 =?us-ascii?Q?iJyvrNu3PUhArOZDtzr+mh76joQwB8g1mVHndgNEh39NUjzOr+nJPHsjFPGr?=
 =?us-ascii?Q?9j6EIG6Es8k8T3vgLWSsYdIW+OZtLJRqc/0k56nULIJOYNp6RAgOAupvsF3m?=
 =?us-ascii?Q?w0a2ATgAZc8tfIs5+Xe6hM12yhJIEDCc30HLanOde2bWJ09RPeu9/UCkuSjv?=
 =?us-ascii?Q?pEoxFvP7dtTH/yTXaCD3T5zl1FIvRqRuWHcWNC+8B+F5lr6ciJw9dHm8Zq+Z?=
 =?us-ascii?Q?7SqCOjyQsi9SYhbxoc6t5lpwsgL5x4msl45q61VV7uRcmm8Dsi1V9bAn6dBw?=
 =?us-ascii?Q?Z6f5x4c0J9XTfDYdhHRoMwiJxMenXh7TLGvKmbtE/RHNaVYpReOAngvEwaC3?=
 =?us-ascii?Q?Erx3ziV7nLl6Osax+lzSgH+cgMI1AkWBmadky46SaEw8earESTAvZp4Gw3uA?=
 =?us-ascii?Q?zRFpL+zS0kH7hW2YvO5/ALBHIzi5t8MNFIt4cwLEqpQBan6misHGxvTDP56L?=
 =?us-ascii?Q?3yfV+FMm0TMMwr0lMi0nHp+XwLJoO2rp+wDUjsGuuSoH4jz1UThZxkWsoysv?=
 =?us-ascii?Q?WiPH0D3ERDnLaQjrdv+cWhYBSADL4bbUweOnztkZ3BiYsCdia9ZX+GT96UNQ?=
 =?us-ascii?Q?RAk8yjGyodwvnaCmVf9wxFONqlJMvw6GUwNaaeYgrpLxMHnB4mW5WAtFVr1H?=
 =?us-ascii?Q?atKoCG8A8lm4j4qX1QB5Dg7ZDnaDdjPrg0O7xrUlq8KB33wLsEfBc9qR+Fhv?=
 =?us-ascii?Q?3/KZLuXgfQYl3F1QlVhNYUlq3Gr+N8Cf9eK+DE1i/3ZaKmCuHPBfoS3TTrf+?=
 =?us-ascii?Q?wUrHUQxW5ErkRzJVG1TEWgS1V9BcPBoglRxpSXEeIHgBj0yuzk2KABqUYAOl?=
 =?us-ascii?Q?ftyVkaL4vi4AGkIg+A0XQ+KLQZ6ozwkoLVVTIMj8gf0NiBr8MVyol/5jG9i2?=
 =?us-ascii?Q?Rs6zRmDAvvPY1GUibgF4Yy17b3pilq9AlzTrVGpCSVyHp6sV9+tq1Tfu7Mz/?=
 =?us-ascii?Q?l0MpJqo5PEjXvJyUtUDmvjOWVRzZT/nVZ+57ns9ZGZVij+f6xJCOqencKK9M?=
 =?us-ascii?Q?S3JsufKnvNpo1ukFRbB0IWCZOs33YxL5n+f6AA6xz2P+WtziubTBYfwY1wUU?=
 =?us-ascii?Q?WqQP2zQCMLn9bi8DrQSLrY0nRU3WNSuygGkJJg6wQRBee+QuPLkfb8+7q5dD?=
 =?us-ascii?Q?4YePyK0qbvOlO+pryu2+wkbx2AYinKcvvXRK+c0yei3oUTD3oQum5XGfHMhh?=
 =?us-ascii?Q?twquUy1+v9nykelud8hTNMupJ+2QwiKXAP9OcR+wEKpoISwt0j/1EMXo8v2V?=
 =?us-ascii?Q?EOoH/levEC0xUNRv9HCx9Yy8j5t2E7+gQVy3n38+nmlDYSFj7JOLKYWzuS/w?=
 =?us-ascii?Q?xCNHpOKxOg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1abd8a-c1b4-4791-6fc7-08da3fd2578e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:16:27.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tj3ua4thj8HHTjvhKUnoBOgOS2PaUfhIs8BryJxABJRc0lGjsIOSLTWDSDzPWfgLjkQkDiTOTfpMoHcz75wdaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

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
@@ -548,15 +548,18 @@ int cf_check amd_iommu_flush_iotlb_pages
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
@@ -581,13 +584,6 @@ int cf_check amd_iommu_flush_iotlb_pages
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
@@ -2648,11 +2648,17 @@ static int force_stage =3D 2;
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
@@ -2669,16 +2675,6 @@ static int __must_check arm_smmu_iotlb_f
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
@@ -2863,7 +2859,6 @@ static const struct iommu_ops arm_smmu_i
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
@@ -3197,7 +3200,6 @@ static const struct iommu_ops __initcons
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


