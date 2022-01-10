Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CDD489D81
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255416.437673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xVr-0005Oi-LV; Mon, 10 Jan 2022 16:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255416.437673; Mon, 10 Jan 2022 16:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xVr-0005Lg-IK; Mon, 10 Jan 2022 16:27:15 +0000
Received: by outflank-mailman (input) for mailman id 255416;
 Mon, 10 Jan 2022 16:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xVq-0005LN-F3
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:27:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aab90ab-7232-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:27:13 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-KsipVrdYN5OnIj23Hu017w-1; Mon, 10 Jan 2022 17:27:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:27:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:27:10 +0000
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
X-Inumbo-ID: 2aab90ab-7232-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwetSJ0M7Wio+bMzCuujR1FuZNxp0KLup95F+RGEi+c=;
	b=l3PqmKiAjKrf5b4f/Nt/e5V+ihHBqU/MUaHcsXaM/RNwtwReciJNpF4Ggj3uj+moJArCrV
	s+0Z7j28oskE5XnnHlOX/P6d128eWUEchbi2ta8U7Nx6+jySTW7D2zccNOcHylwqFPPgSj
	FvWNRgAtBPsT5089mcgEnZUi00bqFxU=
X-MC-Unique: KsipVrdYN5OnIj23Hu017w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHkxe4raQQHYNkkbP6mpKAF6Y6WxkxMoaAAUwM/ecqdwSYKxY49GWPO+bWPTB817c9QQ28/uG6C1X1JdWO07wmKIPXuhr5DshmGDP7RACNqgjBayWkGv9cz7H8J/JQNr44xidNA/vWNcCZBv6nw8jYXqPwfRRgsrSwR6RmE4CC2qJ0BvabYGDmTKihUeNOjLR1TBXvIurkPZ8jpqmDbMNAtfwkEmK5c2yGZ7vP64Nhz4N3tAhif/Gbb+cJE/YJFdBCTUSLuLSmtAsbuAG+vL79vWHSuPmbc52dl7+DjBmCcsjz3+rCN1NkH9wzK+gSvFtorHRH2aHB0thHJAL6r0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAjov/cXqo60hlOx+eo/Ja7avwnbn58K8duw+tDk3co=;
 b=oVUipnc4o0f+wJgRgy7UQGpIY7YHgshObXQBnLHyb8tg+oDlLHe+QHJRAkQSB4oMsCwDSHDNizURdJ87S7d2br44jDijLDz/3lv7+IC9PfhBlXV6waZ34VWUhIRgbX2DS9HHP08tx17pv1iQWygt+f588W+VBFn3+/AxQOYjln+z1uJGKluFsnz6/6ooZ/iK6pAkKMOKMk+jdv1Wn9MzozcHquysMBroKbzdcQoKWaSIUHeN4Sfbe4Y81UQzDCGOtvhCt3kXTr8yXuGEXcwo+KoAbQwVLsH/x3SwmaLr9ea9pUWKKHKooXDoaB1tZ+xcq+TzhcXxC6oKOa6iq/+B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f31e2963-b795-b65e-3401-22c1fd88a4b8@suse.com>
Date: Mon, 10 Jan 2022 17:27:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 06/23] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0020.eurprd03.prod.outlook.com
 (2603:10a6:206:14::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b018de0-b4a3-492f-495f-08d9d4560d25
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392FC7FAA6FDFA37389AE96B3509@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3jyaBEu72/Ct2G5LBSPiF+wZdcHIrrT6XxeNHhYGanDpcVgnGZ5xTo/01j2QJjNsCgxdi6RndWW6IFTpyquKOO4SdL5SkHUpZlSA4Rp8P2uQ1eO6TUFMEV6EIp1xsmOu7NkMr/sCCYKy+yrsGNQFxiBcPif5ATSs1YLIvoEG/1UWtKAnUI3KDGM1KlTlSplrtKKWmuyVwcdhkpLpKf/NaI8BbMWBbOZCtfMiV0dtnw0IMubyw1ir3pEgzFnIfmVBnu7m1vYlwAdJSYOZIVvc0WDFFZcuiPqHT+OS88X8Q7cHGKmEPc/kuVV88WUsXXTFm8NU4S0pxPhNlkgYK323H1I7qWwb2OsLAdYtZ20GBVvcesNAS5o1faQWjimUgpULIzSYI9066njOVoNYl0E8weC7JTD7+kF0eeAe+wyAN8JungcLwX70xdhMQUVrz+9ifg2U7T87S7wiYbaEBiW9s/iwT6UEhP/2PF0Ss1ilJjQGAN5u4Pq6QbcBv4xQ172u9uV8aDVYfEg0ISr0S24frLkx8HvXrZsf8UOuH4j4ABrsXHKaysg5ULMAQuAIJE3WUvlO2Xvdi2j3IkEcFHaRhDpbL4lNek8tJI5w+RBBFD8W4yFgvdIlHFJOFo+pLj1D/f00rNMEMrltts1BEymEE1XsQEWh4Inm7+xAVQfq7nLiAo1rGIjKa9Uw9eRVZ+D6/RnI0NidtLVTVPlIc5aYiSOr6LtumS5D816Uj8x+WlJNuJ08B2uqdCL9GzFNA+r6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6512007)(66476007)(66556008)(66946007)(86362001)(8936002)(2616005)(316002)(5660300002)(508600001)(31686004)(26005)(31696002)(186003)(6916009)(38100700002)(36756003)(6506007)(8676002)(6486002)(2906002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fw6k4MO6Hjk9xgpUVW/TPpsR0oFv5NkQglml6N4I1ODikudejXLYLiz4fe/x?=
 =?us-ascii?Q?JO7aUZwfmWc4tg2oX3710a3ccdszECpKVkLDGDrLxxU6IZUtx/3B3FVI5Hy+?=
 =?us-ascii?Q?hHIZLl2f6HSyqVrGTZOludsUNm0sbIPRHthnQVjoWiK4LfXDL2KSshx5JSEj?=
 =?us-ascii?Q?qpyqCN2W98JZMdzQbfcUwp9MQIWiX6GjIW8dI+aVXPpUNjgR9fmqklJ51jtB?=
 =?us-ascii?Q?8PVVFmHDsMD9NQ0u/+DBRxhp1ZXCr3/P3R2S6pmZb/WE3ZjGlzmue8xeJm/I?=
 =?us-ascii?Q?XQsgJNFJpH86Mw4/Ay/O7S7EAufPZSIHoy0rVqvu9e0/GKx7AxuPEvqWvpvm?=
 =?us-ascii?Q?z7DoANk/zgBvEMYjtEdyR3jr6rXgle/XGAp7IbwZnL+kbIm0fSzhNny2N8Qh?=
 =?us-ascii?Q?LQFdAl+jU3OTKEjJUyWdTqzPvdNodIQ8cFxPgl7SvtYxio/AxQOhBfOV7s5J?=
 =?us-ascii?Q?iKbHf7Fg+Axx9Zkl7pUQ4KSCPw0tv6w/KLwPhUWcoxlS62sn2Rx/c9odNREq?=
 =?us-ascii?Q?CWbi+KTkCA3fPJqeAcS4PEq63hDMC8ntdjQr8zt9Hazjg4rx8oaVxvgawiNP?=
 =?us-ascii?Q?jyiHC2HjTEKBxQuXkowLyPH2ljz0VfJjpps0UXOItFcgG8YhtA4KirK6I1F4?=
 =?us-ascii?Q?cJWkx5Cfzk4rBDDhSOe55nCKiUIdR/GSjb4aKepUZohCZIFjLL++G+6xpGsO?=
 =?us-ascii?Q?rcV0yiVxrHxcITnlHNPLgHyxPwBD9kwDhRYFd7crD7eGn9yb5BqGG2w3+w0k?=
 =?us-ascii?Q?JFO2tKWQQb/GxuTq9HSaDDmqdjwYSkgjgt4Mgj6Zl3zbKwM66H6/wzGnJOyr?=
 =?us-ascii?Q?D7RiAu4eB8Bg0FlrGB055xDoxjVDiTIzOYOudGofiTwKCQskWHnEm7QUqhGu?=
 =?us-ascii?Q?l2bJwRwPcNdLXhM+pjsvYQfJi0duI/myMCXl+9anK4Msa/wVGeOMWTn1PbQ6?=
 =?us-ascii?Q?NYFjBZcr732fEG68GGfBX0qh6JJAsRFC/T62fla7gJzUuZ+oR6k2aS9Bxmja?=
 =?us-ascii?Q?DlwuLBl5eyLVHQw4ApsiKxeULuN/uyM8nknVcIKsCH+eCcrIAcYNNYIywVNE?=
 =?us-ascii?Q?GOsZJmMT13KstmO533jT8MC8PsBvW7gy0RE34419NVmDIkrPt1bzwyKIGWOh?=
 =?us-ascii?Q?zCvOk9TB2K70Z2oWFUBOoRdFo7ug43urTT/AmzfL1NdERxGNT3YhMdMtscZT?=
 =?us-ascii?Q?CrTLqdoO572uVWvmRB2yESsX4mWtx9FHAZEZutXgAPqe1t+nOll8wa+IBt4Q?=
 =?us-ascii?Q?j3D81CAzJNCO2IMoZnkt6VHzlQl70gt2KYyn1BPeCnTMFhJ6gJv5I1aZ+mYd?=
 =?us-ascii?Q?WSHiQTyQG795Sdfu4ss+w6wWLJBGP5M1vKiqo7uWTP9wwLFw1qTQ0cNS5vHh?=
 =?us-ascii?Q?YN8N/NB1b+aMqk/YEZeQXSK4V6ZXRZTIeR2HdBXFDhl1c2QuUbGu5DEBmMua?=
 =?us-ascii?Q?lE9rOZSWCgd/Pvk1WjQIpwDMYFr6Nllnw9a0Y5r15tKMxzW1MKr5awIRvgyL?=
 =?us-ascii?Q?zT9Nmyp4UFByHd2CgF8pTssQvWPo7FatnCHYDpYZa1eMryWht2FcqClXc1Q6?=
 =?us-ascii?Q?wbId/cMQMPVLDDBdnuIz1efrbNwfaE1u7UvrDx1NFsCI+HAr//5Z0tpwPied?=
 =?us-ascii?Q?Sk2XCAXL5oJ+wQwOdcO62/8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b018de0-b4a3-492f-495f-08d9d4560d25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:27:10.3498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCJsEQ1jUyCLAncFRl88etKY3INtNwyvyFpn41MmRNvbVwQipKM8LdDtiSqfIAbTkEJKh8SMHZ1nOXFmXIXnFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

Or really, in the case of ->map_page(), accommodate it in the existing
"flags" parameter. All call sites will pass 0 for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
[Arm]
Acked-by: Julien Grall <jgrall@amazon.com>
---
v3: Re-base over new earlier patch.
v2: Re-base over change earlier in the series.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -243,6 +243,7 @@ int __must_check amd_iommu_map_page(stru
                                     mfn_t mfn, unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -331,7 +331,7 @@ int amd_iommu_map_page(struct domain *d,
     return 0;
 }
=20
-int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+int amd_iommu_unmap_page(struct domain *d, dfn_t dfn, unsigned int order,
                          unsigned int *flush_flags)
 {
     unsigned long pt_mfn =3D 0;
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -57,11 +57,13 @@ int __must_check arm_iommu_map_page(stru
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), =
0, t);
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+                                   IOMMUF_order(flags), t);
 }
=20
 /* Should only be used if P2M Table is shared between the CPU and the IOMM=
U. */
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags)
 {
     /*
@@ -71,7 +73,8 @@ int __must_check arm_iommu_unmap_page(st
     if ( !is_domain_direct_mapped(d) )
         return -EINVAL;
=20
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn))=
, 0);
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn))=
,
+                                     order);
 }
=20
 /*
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -271,6 +271,8 @@ int iommu_map(struct domain *d, dfn_t df
     if ( !is_iommu_enabled(d) )
         return 0;
=20
+    ASSERT(!IOMMUF_order(flags));
+
     for ( i =3D 0; i < page_count; i++ )
     {
         rc =3D iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
@@ -331,7 +333,7 @@ int iommu_unmap(struct domain *d, dfn_t
     for ( i =3D 0; i < page_count; i++ )
     {
         int err =3D iommu_call(hd->platform_ops, unmap_page, d, dfn_add(df=
n, i),
-                             flush_flags);
+                             0, flush_flags);
=20
         if ( likely(!err) )
             continue;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2018,6 +2018,7 @@ static int __must_check intel_iommu_map_
 }
=20
 static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn=
,
+                                               unsigned int order,
                                                unsigned int *flush_flags)
 {
     /* Do nothing if VT-d shares EPT page table */
@@ -2028,7 +2029,7 @@ static int __must_check intel_iommu_unma
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
=20
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), 0, flush_flags);
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
 }
=20
 static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn=
,
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -31,6 +31,7 @@ int __must_check arm_iommu_map_page(stru
                                     unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
=20
 #endif /* __ARCH_ARM_IOMMU_H__ */
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -127,9 +127,10 @@ void arch_iommu_hwdom_init(struct domain
  * The following flags are passed to map operations and passed by lookup
  * operations.
  */
-#define _IOMMUF_readable 0
+#define IOMMUF_order(n)  ((n) & 0x3f)
+#define _IOMMUF_readable 6
 #define IOMMUF_readable  (1u<<_IOMMUF_readable)
-#define _IOMMUF_writable 1
+#define _IOMMUF_writable 7
 #define IOMMUF_writable  (1u<<_IOMMUF_writable)
=20
 /*
@@ -255,6 +256,7 @@ struct iommu_ops {
                                  unsigned int flags,
                                  unsigned int *flush_flags);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
+                                   unsigned int order,
                                    unsigned int *flush_flags);
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mf=
n,
                                     unsigned int *flags);


