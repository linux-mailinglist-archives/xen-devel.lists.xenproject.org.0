Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2850DB3E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312497.529755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu9H-0005s2-12; Mon, 25 Apr 2022 08:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312497.529755; Mon, 25 Apr 2022 08:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu9G-0005qA-UI; Mon, 25 Apr 2022 08:32:46 +0000
Received: by outflank-mailman (input) for mailman id 312497;
 Mon, 25 Apr 2022 08:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niu9F-0005mk-4G
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:32:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471218fe-c472-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:32:44 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-1YS7kSfkOHKz2PAbquvqIg-1; Mon, 25 Apr 2022 10:32:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Mon, 25 Apr
 2022 08:32:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:32:41 +0000
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
X-Inumbo-ID: 471218fe-c472-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx5RuDNsd53Ne+GEPe7btLL0NeSg+006AajLP6dHqSA=;
	b=UxFxlCMDfNGrnkimfoqRWi+DNLoTPwwWidfu2BaMhH718xxSfaShG+mRfjsMVsMxefdFe/
	NNjbexzSb3EC5qfDsMPjpG8Mgb3i9yPF6RKSM7jhWH5mHIpxVn3yv7GWsxNve5YgNJWx1k
	O7POTFxPeAiRu5ZRs3uCkwQ2mMJA64w=
X-MC-Unique: 1YS7kSfkOHKz2PAbquvqIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBhbBW5x/s0aHTvFEKUtdvBdu0GqPt4dowlvnPJoFi/DiBpsYdme8jepY1Vtr0DCNuJvFR9MCgv3Wzq9F4N0bu/GTUMYx5uqAzWRIKsEwgD2yCPI6sC3dOrrwnAkCQ4+KarQfYMoI8upW8GRn3mPGkaQXvRVU1ks2wC3S/LDWRcKhJeNt5+mSBhoftlPmohH+rfQfOuLbH25JQVoUxCd5g+1AW3iBJduhmadZwu6K/NwQWBu05HTbTljnJ6OsKiCAY5l6UpPaWDl5vCiS2sDAaqteZ7+7L1CEvc4/XiyyFxgD1LNISYAY1uauLTVMYfuoPZvvUFRxw/hKI4Solhefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K+UqwmOPdb/UDNInYNhrwscOOzna6UxgCO3tesJ9P4=;
 b=S7xuwr7Xw9siPT1TtBYMAVWfX0l8Ggkz8QXwujgss4CjYsXOHIGyzmvvGfHKsZl5hHD9VUPa2nJ2zJj0jjc/EdcjRtFj0k1//Yy9wZtiSqBSs1I2SGXRl6e9WciinGq3NVFGYZxIzXd+1ejyL7Cn1GFlwCwaFcuBElI8PdjNV8gPv30CcQdPgFQeZY+TFPGQbIDggCxWLh5oAmVanp2YUNrO+Kxmj+U8GCCxIp90ybzSFZnhbf3+izewSX65czU9qzOuO4ixIfjOjDke5f0y3nmlhsKw5AJ4/2vTQFl772yFhNK9F3RHaTJKM064xT4iHTn8lA4voQAmoAA27JpBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc7b0483-5cf3-13a8-0181-fc61f9a16b87@suse.com>
Date: Mon, 25 Apr 2022 10:32:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 03/21] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0308.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab66417-afa1-4b28-7244-08da269629a5
X-MS-TrafficTypeDiagnostic: AS8PR04MB9078:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9078E8534B2975E4CD659590B3F89@AS8PR04MB9078.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zR1KTmlmqVL1SSAro1SskXtFZHHmGz39JjcBdywElWsGccJhpQFdS7ASLXyVzd9bO3oyEuVCQ44/gVtQpDJgNs6jZkfQbD83C39HVjFKSdgZU8xx6Z/J2rOkOmv8Xfi1T/mQIsOqh8Xb63jNqaS3DQuY/TSsLtn6Yk5XacUUY7cRv8eE0QVwOkEbcfIEyPE5RzwwufCJKVtCRsODuQNaBxgQsbB8XQLzuWxr4PF/cMzI8I58uKtyIf7pudr0V0wR9LbooQzIbfPr67MjVaXwRZeyUJgashVHJ/BfyU8AOwlR6rPucs/dP8yrVCuq6R4x3X7D9y4OcwyF8uVh9CE1B9SF/tY1Zcu2qTF2d4UTkqjDgIYfI4i0O9GhyAL069NlbFwH2JOns90Pist1+Ra/NdoHR4PpzwvZpotT/30GHhSJhI8oU/Ge/VEohSuXz1603iVw1A8ULKsMRNsphsoDsgsdxcvhZaB+5ExQN2uNHYFA4EGVmtzevECytjwHloPLxKokxL+ndvtz6vzILp0QltRmzPEsO9eXsMW/Ug1emBWP6gtEpUICANoOt504hNEZ8yvgZP6/lfpxyA6glmGojz7OjmAIfrzLdnD4antEsJvc82XzVG+36P5YGXFU11x85+4DcggWtmmxHrQUALn6+/Np0wp69fdaO1uHMBo+rwEIeKWTdQ3eS7tEk4iuXYfElmA99SJjrhVLOpzsMFkWT2fSvfoe0U+xulkovb9rle0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(66946007)(26005)(36756003)(66476007)(8676002)(66556008)(6512007)(5660300002)(6506007)(31696002)(86362001)(508600001)(38100700002)(2906002)(8936002)(4326008)(83380400001)(54906003)(6916009)(316002)(31686004)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmTStnSxsT9vnjHfZiiZVvjc5lJopa7Rhh/CRwQFwKhyInRfSOhwydQvSF8G?=
 =?us-ascii?Q?iaFjfL542gUYJr4wCB/Kz92IYPunRLu311Lu1loKdHOZy8WzIvzIRqCgkkCc?=
 =?us-ascii?Q?2nZcgi6h7s6YXA6W8FXXU6vygunfuCmBZmuVhmJpIXjyMNgU63TKHNIhhbrI?=
 =?us-ascii?Q?Aik6Tx74hbHYUwgPuRlAa2b3mZ5GewaQ+Qi+xNJc4WvRanS83JsGesafItSp?=
 =?us-ascii?Q?5cD/8OiG5ixMcGBq0z6lOhDGOmMsgsm7vlKq2qF+LKH3gCyEbqx3M6gGCOx3?=
 =?us-ascii?Q?/6u9XwLBeZ6koauMpVhM4cTJTgdmcShdTk+tusMCMKlngjKfM/WPM/4G9m9V?=
 =?us-ascii?Q?j2NrYNB0xrcWAzWFBiqxJeR4wJ0YIIaDBYaRLDamXOxh0OxmSb1EcWpupZhE?=
 =?us-ascii?Q?nlAGLmbz+kCTe7E1MRmjozyE/ii6DIKtAPXKD5cgLroFnMmEHSB+BrlHcqWg?=
 =?us-ascii?Q?IHi4fAEgdNc82sksbNGl+qRrcliKUlP8xEAjJIsaKhsGRekbegp/mSTqEsk0?=
 =?us-ascii?Q?kmxXEW7cp7j/Vae3+xUiQ/PAj6mtd4fUDDomMk7pUVV5imX8NW8I1iK7RUh8?=
 =?us-ascii?Q?U08W+VxST9uvzCiFg66DS9s2MPGIocqbscqKLFdxqMfIyGzT8Z1/6lwaGDie?=
 =?us-ascii?Q?SJ6vJRKiW2FBabmOG/G3zOMs5Lj8m0at16Ph3bV4yRcwzbGB2nOOUWMgLoVf?=
 =?us-ascii?Q?HZaDfF202MewBaNcNjg72JmX6p5EXDVim8RjA1Iv0EA3/KK/PXeuecZ17PLw?=
 =?us-ascii?Q?YCIfEQUfFYK7kmvQ1E+MK20MdRi41BSUMlNNOH97MmJldBIQcbLVNLEz6mTy?=
 =?us-ascii?Q?kxRRjHm/VcePh8Fgjxv0yLq90OAuZhE+w+6JjOTAzKnJXNLKWieL41pxW7DI?=
 =?us-ascii?Q?nSWZm7W2s34ONW035h55xYRBll4aKgEogse1f1jDXLogLw2xNR5uOqES76pt?=
 =?us-ascii?Q?u8hBZiCFOnRZQ7w5agfaeeHKG67rQZH2/M5tYFdmnetJzoZirpxKedfzT5Zu?=
 =?us-ascii?Q?pfsHNZS3dHamXqnS6p1IsDi4BwPvIppFVu1cYzMMJWFkKZEFPlQ+Rsf6WL1y?=
 =?us-ascii?Q?9+urcBDG+0+PMRSVSnOinH4awkXPEfbbADh5eRgS7t0ey6Ept9is7DkR+Gkw?=
 =?us-ascii?Q?DEjJbEPmBHJhSsMSF71CLqJycIOAexoBy745WBQ84EZ37ctx24+R9eo1MIbH?=
 =?us-ascii?Q?k11QjHEyIxe3/fSplNA99MzLQ5Vsb68ks/qURJ8QKgo/vC7SN3qHqbibQFcI?=
 =?us-ascii?Q?Y9jC+T7GdItss4IIYaX13C2Pf45PgmZEc19hv600gpMaLpo0uET0NaLFTQ1A?=
 =?us-ascii?Q?PxSUBCL97u7GyxOVzYKE8Wbk9eSVC46lcIiQeK7B11exKB3UsQEzlI5y9Twx?=
 =?us-ascii?Q?3DPIgfIhjPAxSI29UbFaZ63aCaLZ+7UO3fwJ5imITTv6tV0WSOI2dw64hgRl?=
 =?us-ascii?Q?J1YUyEEEfrs4/Af/wXTzvL95GrOgaywjhciSfmwmttvsEgMGGFi/gnMwEKOl?=
 =?us-ascii?Q?v8xt+w+tIQtJaoJjE9cilhMS4k0rs9cDICMIN317s/AmNYLrIPN6h/yXSEBP?=
 =?us-ascii?Q?3iLVo0OsX29N3TcwOfkI2u62es46F2XGZmGFmoUlBoEVZpseLXl9cQ6kiAuf?=
 =?us-ascii?Q?MucQRSE2cmLiAZO4YWD/iIIF+fK6yTk19Sj/WsbrRisz8Cp94nofPCG1nC+p?=
 =?us-ascii?Q?9i9rTSSDGEmnkIgJgVzu6IBU1t+wiuiVy0E3N+oRLCWjnje5kBoliZq+ehJs?=
 =?us-ascii?Q?KPrIJYxIcQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab66417-afa1-4b28-7244-08da269629a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:32:41.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96WLL1VODuTBFo2bhFmwlGSlemoV4xSClqts33a34LYDVwCnNpMRxXZFg8lD05t7WwIaJyAZDZHoHaej1MesnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

Or really, in the case of ->map_page(), accommodate it in the existing
"flags" parameter. All call sites will pass 0 for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com> # Arm
---
v4: Re-base.
v3: Re-base over new earlier patch.
v2: Re-base over change earlier in the series.

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
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -245,7 +245,8 @@ int __must_check cf_check amd_iommu_map_
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
     unsigned int *flush_flags);
 int __must_check cf_check amd_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int *flush_flags);
+    struct domain *d, dfn_t dfn, unsigned int order,
+    unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
                                        const struct ivrs_unity_map *map,
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -395,7 +395,7 @@ int cf_check amd_iommu_map_page(
 }
=20
 int cf_check amd_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int *flush_flags)
+    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_f=
lags)
 {
     unsigned long pt_mfn =3D 0;
     struct domain_iommu *hd =3D dom_iommu(d);
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
@@ -294,6 +294,8 @@ int iommu_map(struct domain *d, dfn_t df
     if ( !is_iommu_enabled(d) )
         return 0;
=20
+    ASSERT(!IOMMUF_order(flags));
+
     for ( i =3D 0; i < page_count; i++ )
     {
         rc =3D iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
@@ -354,7 +356,7 @@ int iommu_unmap(struct domain *d, dfn_t
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
@@ -2163,7 +2163,7 @@ static int __must_check cf_check intel_i
 }
=20
 static int __must_check cf_check intel_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int *flush_flags)
+    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_f=
lags)
 {
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
@@ -2173,7 +2173,7 @@ static int __must_check cf_check intel_i
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
=20
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), 0, flush_flags);
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
 }
=20
 static int cf_check intel_iommu_lookup_page(
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


