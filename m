Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4B489DA3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255472.437783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xc5-0003q6-1x; Mon, 10 Jan 2022 16:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255472.437783; Mon, 10 Jan 2022 16:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xc4-0003oD-V2; Mon, 10 Jan 2022 16:33:40 +0000
Received: by outflank-mailman (input) for mailman id 255472;
 Mon, 10 Jan 2022 16:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xc3-0003o2-1b
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:33:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fbf5461-7233-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:33:37 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-IWMMMqD9PSWei6ryMI8xMA-1; Mon, 10 Jan 2022 17:33:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:33:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:33:35 +0000
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
X-Inumbo-ID: 0fbf5461-7233-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMcCsqYvPaJph7KL+A038l2t3+7JxYhFMgkn6iz2Gsg=;
	b=i1uK67vx7TRt/xY0Ec9jxNzHH2ooXEABMmdrtwbK0ao62SctfyvrPbeHUU3GKvY8kUUsO5
	5opKgbLUEq+CWKBTjREpxpta0mX1siHMLWXycgcy/nto7FK85yeoIKvtGpjuGEnEmyF2UF
	Mvl3mFVWPKk8gwjpdtnQecREfRPmjLo=
X-MC-Unique: IWMMMqD9PSWei6ryMI8xMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHAItKU3tBpn4gqgL8M2uQGfqWW8sC1o5o90+NaBGj0sKrpmhNWqUodT8NoJhqpKf4lDhmqmS3OSkUSf9NvhBA2E4IlreaT/mIni150GM1pN5c3LK+1YsyxVeC8VlO5cZvNAeyxW78VJDWDuDiuULH8S76GqI1sCXmcAshI3WWad553gk7ho9lChRjO4BYA1LiyLrwee/ZyGYcLPzFgrGpeOovzsXfGKYkdqTVNMQ3fPaneCarZF38UppJf/lFA0t20xXYHrcyLPWPl8JTFAomosWbc1JrNV1/SuYIPHA09RURJCDhEvXp7WicaZSdBXe7tH82hIansp0PB3Q9sZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tpBpL55vIqk8+z9SUDwNGDspJB0Y68PF3yq89xNj5Q=;
 b=DWqW+nJSzVoUdTPFuyDsJCzNUZIcjL1PbS9vDX8sTXNaFersMC6k/msxceiY22zcBauqNUndfxRL6/FABaFArEfkkuAreNeGkVsXJOwKkm/O0+EaoIwWMuIe95O0zmQV9zubicnzWi84AHJL5em8Fn6NJtJ8sAxD8oGZ2w/RpF6AXRj2lHWqHFqKp4yXMhe2pifocn9eRUB+VfmCdYG8k1GaZ3kfXeCjdXq3UHAcKDihaFVjVxyh8uTYPK4+Gr6khNWjyLNAbLaonRyI78ztAKidHHryIPsPx1jm0CcwLYM6O/eqpe4Tpgi8jRf5W8UQiVcZduwIFktpqsjD+bGIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3576e89e-4297-aad9-9523-58d4a48f6ab8@suse.com>
Date: Mon, 10 Jan 2022 17:33:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 16/23] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e7d1817-15c2-44cd-01b0-08d9d456f26a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165792004888AC29ABA06B0B3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2k8rwGpbBRRXiaoEFSAYf++zQgAILePKY5dfNIcr6uufaYXxRV0c1yh1sko9d9aNAVMN38l135xWPN70rNTyUpgphkTSjAKeXfZplmCCCMoknhuSjldmllmhVtkrAI2vtUvhZQIUX46+G8O26Ju36RxjTDKpw2eSqu6jsd9PJTnplYwn5CP2neHc6IIKY4ChbqUNl6ELmeaPB6HYn3wCAHbQrGuUbiY87LlWQaVuoweVnSXj0qy7H2KOW1Vc313U3L9Ocu6LVEb8XvSMYE6rQh3M2dsreEKe2iEmqsj+KvzxYhYdPyNjG/+VFhKYUFDvQMIvH9DBINdsSRH82jMvWJ5j3Wrpns5VkCwGAN3++LV2S2YUM421Zn/u7LI27KYX5DJqpMtIpun6LsP9WH7Vj+1FLJsl/0nd/4fks2a5cEo/w/cuTe9NLgmL04AsnoUWRpJzgVs10EoeAdyJpD4XDNU3yP762Pc6UcVucFByXvb2/II0pWUs0PlnBREkPY2zw062DS8bULoersLzENJVUB6oMjlJmY9jIORD94dJbkKdB80qSyDbGneO/jQvzoggnfmtFnSb1YNAyLmcKkTA+rsAHnMTNUY2qZCKJxnyj/PHu3berN3Wyiv2TBKgd8naeg1MeZCJgA8ajYA2L38CiBtzp9G44y6e5bDZQXitlyjfrEP+9ocuK2VT68EQMrq8WCjavdtD4yIhqBIPSuwsGPztH7JUBORt3CT0R5YUCBquKzh4gsrcAClBnAo06lcy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66946007)(2616005)(8936002)(54906003)(6916009)(66476007)(6512007)(4326008)(66556008)(31686004)(6486002)(86362001)(31696002)(36756003)(6506007)(508600001)(26005)(5660300002)(7416002)(316002)(38100700002)(2906002)(83380400001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8LaOaKbMscJqRbRd8phauuY54qK50cp32jnNfIi9x2f7W+ilm5+94sOqW3tn?=
 =?us-ascii?Q?QISqeD3ZzfwRs1TT9CBnE/G4RBhQchBNgVSXPlpjHGsKISSviijK//pEiBmE?=
 =?us-ascii?Q?l1yqxwWTPa/G+b9pRRU2znSVasm54HAx4dom/FueSF7E8I22wzz7Cicbg7X5?=
 =?us-ascii?Q?dkR1KJ/T5Tfa57bM2Tr+a1nynkDZwkewW1GA/bJxgJ2V8nIyraEe8aSwFIDR?=
 =?us-ascii?Q?pu0XJnyJhsfqRX5TbreaJJ7xXDjytmajbcrW8BZMfFWr7c1uyHAIdVBc59Y5?=
 =?us-ascii?Q?JWiBb+0vUrIWxeRXJNRgJ4vyiDViMdm678bZLs/wBQyE/PJbFKo4EYcoamqg?=
 =?us-ascii?Q?IkPj4cR6HkjGA/M6I6kyF/37SdsiotoO4ZSuruDYSbhpKTIthtl5m6myoqqu?=
 =?us-ascii?Q?/5NNEhZizTCC1+aZcsVI+vYzWkwkKPY/1KcpbwQqWr6vbDXVFRduhrWBT5p3?=
 =?us-ascii?Q?WQOsBNaWJeJ+LyHVzlefuA42kwNM10LwN/oLd/HiH7uvU850K3GW0XqFF011?=
 =?us-ascii?Q?RelyZ9l64+aPh7mnwuRqkSpDlHGdjId0R21Ex1fDT3TWOFxUJxgkXkioTJ+N?=
 =?us-ascii?Q?Tkast3uU3EffVP0e7YpKt2MNfX6mJMsSze6vlqTsaX057drlH+wUT+K1T5dx?=
 =?us-ascii?Q?u9HhqyMbBb9Kgc1TzN/KcfLGH+aDR7DQy0tdWZAqdz6xw0ExX64ObTIMzXZp?=
 =?us-ascii?Q?rwIjpRCuDrpXLTXaeVhbq+FovwSBASNHTBV4TJELtmLh1FZBjvFZYgSYKdAS?=
 =?us-ascii?Q?0YkgMjDKOsdZedU8ScT8HsXr+S1XPocIsi/LGDymZrrvgCyy1uroJcilREAJ?=
 =?us-ascii?Q?TXP3OejI4BGd+FMYEeB6mrmXjG6SRWI2fo/bkK2owr8NmNPxzEDOtEO4urBy?=
 =?us-ascii?Q?jV+0jj5SEDXIxe5vHs1X4YISYY3FqPbGKr6P/DADgDFMS5vGnwWoBRVDzOvV?=
 =?us-ascii?Q?Qq581VFd5gMzrQWX/RSl++FP0PBWvGpS/RbTn9U8CTH0VrNbubqUVTyVWZQw?=
 =?us-ascii?Q?U7rBc8fu4jUxIQk6sq0RlY2KfB5C93sUz8uiZnitc3iNxbjEgm4gsLOzc7om?=
 =?us-ascii?Q?EbO5Eq5JjcDsLSP+n1kz80UAy0HXwCWPzKzSsOQYXPvcjF4G+AjkkaaHHXXw?=
 =?us-ascii?Q?HK2KlybDJrkuRz+9sP6PA0KLmPwLwGMgNAIwIH/QSeBS6CKWKgrbis29sOKH?=
 =?us-ascii?Q?aKv2eKCm2NXYFE+JZR4Pr7wimTnCuYc8N2BH5+4++27Jlcm8y9eAvfA9Xf3u?=
 =?us-ascii?Q?WZ5sWr4Jk0zaDF4YTawevy9FV7qGLS9XLjC8Tkj4eRrG/harfdu7M4oEvkDP?=
 =?us-ascii?Q?BwQdPXpC/ApeJppIOfJtd/kQtAocoUVJgxkZt18pGej76CmJz7d+BYpWIeuW?=
 =?us-ascii?Q?cxFoaPRCPMfFxcXwySc50CHrSFazAOODQPBmx/4gMVS11RtpmSZSXNOPRuOj?=
 =?us-ascii?Q?D6wiEe2um4GEwsJdVmiCl6z3cldKGkEs0qwHlkEPArRw3S3CQcXs9vvK/6P4?=
 =?us-ascii?Q?/N/03/8Vcz4YZGJaEth7OLF158Ply5jwGTGYlRJUTWzCyjryfz9jjbIfnzh/?=
 =?us-ascii?Q?Ol6xceORlcjK/O6E9graNh1+vVeIE28c6w4BVZwTggCq7iouozaZ/cbv9qpU?=
 =?us-ascii?Q?YbbjSnw5/F55Ti6Ful4KDf4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7d1817-15c2-44cd-01b0-08d9d456f26a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:33:35.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Af7th0oCJsafAWZR1CRqJlpWkPL4fvQ+9M50SZ31WM0hBjlEgJiTg+5PgJoLDQT2gNmoAO80OYx8xvyf6U2gRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

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
[IPMMU-VMSA and SMMU-V2]
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
[SMMUv3]
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
[Arm]
Acked-by: Julien Grall <jgrall@amazon.com>
---
TBD: What we really are going to need is for the map/unmap functions to
     specify that a wider region needs flushing than just the one
     covered by the present set of (un)maps. This may still be less than
     a full flush, but at least as a first step it seemed better to me
     to keep things simple and go the flush-all route.
---
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -255,7 +255,6 @@ int amd_iommu_get_reserved_device_memory
 int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
                                              unsigned long page_count,
                                              unsigned int flush_flags);
-int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
 void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int d=
ev_id,
                              dfn_t dfn);
=20
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -478,15 +478,18 @@ int amd_iommu_flush_iotlb_pages(struct d
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
@@ -511,13 +514,6 @@ int amd_iommu_flush_iotlb_pages(struct d
=20
     return 0;
 }
-
-int amd_iommu_flush_iotlb_all(struct domain *d)
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
@@ -642,7 +642,6 @@ static const struct iommu_ops __initcons
     .map_page =3D amd_iommu_map_page,
     .unmap_page =3D amd_iommu_unmap_page,
     .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
-    .iotlb_flush_all =3D amd_iommu_flush_iotlb_all,
     .reassign_device =3D reassign_device,
     .get_device_group_id =3D amd_iommu_group_id,
     .enable_x2apic =3D iov_enable_xt,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -930,13 +930,19 @@ out:
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
@@ -944,16 +950,6 @@ static int __must_check ipmmu_iotlb_flus
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
@@ -1303,7 +1299,6 @@ static const struct iommu_ops ipmmu_iomm
     .hwdom_init      =3D ipmmu_iommu_hwdom_init,
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
@@ -2879,7 +2875,6 @@ static const struct iommu_ops arm_smmu_i
     .add_device =3D arm_smmu_dt_add_device_generic,
     .teardown =3D arm_smmu_iommu_domain_teardown,
     .iotlb_flush =3D arm_smmu_iotlb_flush,
-    .iotlb_flush_all =3D arm_smmu_iotlb_flush_all,
     .assign_device =3D arm_smmu_assign_dev,
     .reassign_device =3D arm_smmu_reassign_dev,
     .map_page =3D arm_iommu_map_page,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3431,7 +3431,6 @@ static const struct iommu_ops arm_smmu_i
 	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
-	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
 	.assign_device		=3D arm_smmu_assign_dev,
 	.reassign_device	=3D arm_smmu_reassign_dev,
 	.map_page		=3D arm_iommu_map_page,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -455,15 +455,12 @@ int iommu_iotlb_flush_all(struct domain
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
@@ -814,18 +814,21 @@ static int __must_check iommu_flush_iotl
                                                 unsigned long page_count,
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
-static int __must_check iommu_flush_iotlb_all(struct domain *d)
-{
-    return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
-}
-
 static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int level)
 {
     if ( level > 1 )
@@ -2928,7 +2931,7 @@ static int __init intel_iommu_quarantine
     spin_unlock(&hd->arch.mapping_lock);
=20
     if ( !rc )
-        rc =3D iommu_flush_iotlb_all(d);
+        rc =3D iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
=20
     /* Pages may be leaked in failure case */
     return rc;
@@ -2961,7 +2964,6 @@ static struct iommu_ops __initdata vtd_o
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
@@ -282,7 +284,6 @@ struct iommu_ops {
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
-    int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
     void (*dump_page_tables)(struct domain *d);
=20


