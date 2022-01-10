Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C999489D90
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255443.437727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xYh-0000jU-CF; Mon, 10 Jan 2022 16:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255443.437727; Mon, 10 Jan 2022 16:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xYh-0000h9-8k; Mon, 10 Jan 2022 16:30:11 +0000
Received: by outflank-mailman (input) for mailman id 255443;
 Mon, 10 Jan 2022 16:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xYg-0000gz-FK
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:30:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93b9553a-7232-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:30:09 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-fRNFiHicOfyotxGEjgqibA-1; Mon, 10 Jan 2022 17:30:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:30:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:30:01 +0000
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
X-Inumbo-ID: 93b9553a-7232-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWZytcZDWfGnKVWQLLwDmhgUoNVgN4mE4a8/dnot4SM=;
	b=WYUrYvVMK00GwKNJfyPrh+c+DKFRkKl2mMiAhOXP22nIbeo4Z97CcnfaJbS4/pbUv46Kyq
	kQLu8L4gg+B8mcb+azAFiLBgUhwdSvBIslGpOUTfwiVczIuPdhIoGJL/veeEwoYVjdAx4+
	e0BuRMq0kRPYBZIeUrnTtqF/hLLY8mU=
X-MC-Unique: fRNFiHicOfyotxGEjgqibA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aokyAHPeiwfIMOhfIhtAYHfjmpm8eNFjb2hnIY87KEjJPn63TAvPoSfNe4WgEP8EusDTGROVcKtSUl5jI2oLA2SUndArmX6AObBH2k+YN7AFFnmR1VNrkbIET0FkwECEsEr/eT133NmsG8Q6+Kw6aBdoPccr/E7B9+H0wWhXLflBFRJyUSFGIjgoOp2q0COl2VuEvnr6pG7qiXqIzXb2WfJ/gcq1BRrly7k2DWIZ0wS5B4isRGuBb6T8uWB7oiff3AprXjDvOXFftY1di/d36p5UKcN4erdHyzlmiw3STHdlAy3h4+g0vEM2YLncXsSofIhGKV86XVRhNq4gcBIE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdTgtNdqoNeidLKu50UftFdDVt7PjdHN4/4c5+JQ4Cs=;
 b=C5b07U+O78UwGB5BZi4E2GPyT61QcORmcPpRPWfnGQS43EGgqJgvUt1sMhA2lAFn+fTrV0qf3oTzaPeIHcpE8/h9rm0fpYXLtA5m/9wteYRu884+P3peTLEdHPgHKJh0JOkvclQCM2QrWxG7qVIiq1+iaopQ6ibdvAKDKRCK21y6l5NVmqDKwHZumJwLxeZ36sdtqLQIlJePbIqhPTBiPTADMnpJnYS0PWbCmEImbICQQ1b8TOi7UJCCV/nGR7NkNMwfiles3yQHcd56iNtEGv0w3WEDLM2/4CfruORtFy79lXd9ntfjN5mqQnkSZkMcpD36QkQZdK5aCkhzTWjk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <124022ba-1aa8-7503-ef4f-efbc158e7357@suse.com>
Date: Mon, 10 Jan 2022 17:29:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 11/23] AMD/IOMMU: drop stray TLB flush
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe31e83a-bed3-45de-a2e9-08d9d45672f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165E919EA9AD3CB9E7BFAD9B3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2U6w9W56QpBL+IqhB4TQXykDv+CLg7MlPAib/TcGhQEuZ/aIkvvQgWbtQ0tqYmbNRE2cM82w6gx10tp8b2JdAE3CqPFHNFRGJ444czDQ8xWX2lfT6ZjMfTTN+mIjgxlvhYapr2tcqLYGfXxuaKWStqndCavi2g0rQ6AiXIviunn9HlsdWy+TCnB4fxM6TdhBjUgNU1yRfAeVCuLaYYj3WIdzRN2uvLV+reKo7tjk/Lua9G2NXqmrjC8otf2LO31md3JLSCct4lD+970d8hR9YAVNXQ+YJ8yYALbjGf7ErgFit1BoiA2dqIgdHFPyZ014VpkaKJrY9Xhi9xQ1gmQCCg1dr3osGYH7+ltYVxNzPkUDLMmY4Vk5mtHJ0VZWSm+Ri2C4blrA1VZHYvctcAGFrwymq4EoItvaltuVXPAR70M7+ZkMghoT7IttSyZyhnfPnKf9aZUEsjN75G9TbJ4K7lzq29BSogI2vtYujGWpKdILq2DN2nYqktV2qKlONamwuNSBoFMM3+TrRuuUQSOwZVIsP7wlRTQLJZuC4/uPeI7i4bcgVXMzUn8wffTuXAbAYm0Lk8Yecf3fv5+cE7ULvzPcXC68ATCfpu757XbgCtrutzXOilte3OB+3eEQtvi+DsF8tJH7vQVavcntV0UoA5fmmq0y6z8pc7EFGLgRg5sgtbWXm261bAKuqZO/OojGvLOh/oDRDilrFZTsmRk995VElpQY8WayP1qzPsdC0Hqj6HqSgYJMQ6p8T7x08Emq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MVA1w8z1c1vQO+ViueGRwFi6djbJO7AfF4+WgLdj70jCIe+rZWzUCWVKuthL?=
 =?us-ascii?Q?6fmwBi5vKm5ZjPqFPentTr4TmOpF/NcI8a0n2b8Vm8NTCeMbiLT8KVlk51fN?=
 =?us-ascii?Q?Nbpla87ZCeRtQlCraIlPJ4hGcvdTcUaVf3xjuMChNBb6Y+i0S/9Q7wDeHehh?=
 =?us-ascii?Q?+X7TAfYI7IGDUtkGSJBDcuZArBuobvcwpBlNELn7n3iEQ0hd01HnHP67mk/x?=
 =?us-ascii?Q?hvcOxfJp0BFCGGR5glmo6vbsb4korl24ALBor5sfTSD7B7N7Y7IouSPJw354?=
 =?us-ascii?Q?PEIRFBDFvceZIoOjXIxSkaHL91M6k7BSxD8mN+SKOBWlzgXVpkfm6AEvCT2o?=
 =?us-ascii?Q?VkWf7+NHGFiAQU5Ezl+pPGEpNsVCNp2R8/uxOuVQCUz9rha1kBcylourf/Ot?=
 =?us-ascii?Q?PtflYN6nHLQOt4tsX9f/JWw3aQcARfqzv4+WJwtj6+DofZnmsGbKQxQEKUOD?=
 =?us-ascii?Q?oyiC6eRvEO5+gH4NaQOMHrH8f35qAjbFc36s4eXyDUuGrXvyoHKCViJFMpW8?=
 =?us-ascii?Q?Vlr54AbNmHvrbGTXkDKQYMcj1EXN/9H0JQ+iLZHbJ1nipmc8GDT5mWqKT9Vq?=
 =?us-ascii?Q?mJ4ZH4cmZUpa/bzC8lMF19bSQjdDXjO0SUtRKtyHEnkOciPbMCKse/a3pO7G?=
 =?us-ascii?Q?7vZB4l7qlL7CD7zbCGtEv0BtJBgZtnmN6g/c0Z2TZpHcbuvYA4ZBk1c1RTy+?=
 =?us-ascii?Q?61SOJQbuZokdFAj++rVptRvPT/Ez645AabxuSugvyX+Ss62j+019Wg6MoqjI?=
 =?us-ascii?Q?+VaCOeIHi/PMlZG47fL0z8/NGAuJF2zs30EPOoEQPlJ2o1XbsW9Q0KeCK3Uz?=
 =?us-ascii?Q?R0kTHXIkSCmUzKSQqiuGl050ZSRZWrHPrgSxtj95C7nYum3Jp1Kn4c+ZdcQL?=
 =?us-ascii?Q?jR6fAL4fzyR3bgIfzR+OTZ4zW4K6gxCqj5Eu7gFtXnIaXbdARgIYCT2Q+fcu?=
 =?us-ascii?Q?5+vLbp+olRhgUaOWA4IZLJ9ohOrMRhsXHqhM20gNQVcSckdh18bXV2fehOQ/?=
 =?us-ascii?Q?+v+ulfptPnMaqz5OlJ2eLRP/O+PcyjTnRBcsY/pXfKG5rC/SMHicBw14IgqF?=
 =?us-ascii?Q?gIxV1Axo6zmKbgwjXDvbrj8IBGObpt48sOPs6WMuxsKN4QF/98VF/D0O4jRA?=
 =?us-ascii?Q?G5Qp6wAopasn5/qTvjgEWogwj29t8zm85d9S86934++NOuokwjoO8eqimvST?=
 =?us-ascii?Q?5KV1pE9KKQ1SRnQwO4bMbtPTi48pc5wcLBUHrR8evUrFTVPWlbLDGaHhuhiH?=
 =?us-ascii?Q?LH6v87FajTDwAnx/GOG1lPCBFOKw55EXFmcDtk+TzPLTbxGPR4onzGTo4acy?=
 =?us-ascii?Q?2oA2cFkoQdpWB4tO+63bTGDQswDGbfe65LHsPE766DSnebfADoGEsKdLmbmZ?=
 =?us-ascii?Q?YnRQ18R8hJdiYsiKq1YRtYaCmeaaIhveBw01sR4X5pPfKDdOWulQH/oGGXzr?=
 =?us-ascii?Q?8FJaZKgO9d0kDOrcPICqPuDdGB+wB4WNzcAjh8Sid4RxcA0wvM9cYg3M25WV?=
 =?us-ascii?Q?Ls34DowbOkgymEWwQefd0+ZWalqJfQ9wSCB9xVA6rp1AFkQCPc/ZwpZmgEhW?=
 =?us-ascii?Q?JX8Txpv2ZkUmAPDYpV+uFADDwHoJqI2REWKc9REnSFgNfMB9eDo8V9luHxSG?=
 =?us-ascii?Q?vbEagvZ0aq07h0uU6z4S1N4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe31e83a-bed3-45de-a2e9-08d9d45672f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:30:01.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvJFyER8m203IofB3FB8A+5SPz7MiDI2ma6GutOMs7GqCdd+m6kp2gOpO2hmSiXgYoxXvQ5lK99qYCnnqhq8sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

I think this flush was overlooked when flushing was moved out of the
core (un)mapping functions. The flush the caller is required to invoke
anyway will satisfy the needs resulting from the splitting of a
superpage.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -179,7 +179,7 @@ void __init iommu_dte_add_device_entry(s
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
                               unsigned int target, unsigned long *pt_mfn,
-                              bool map)
+                              unsigned int *flush_flags, bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -240,7 +240,7 @@ static int iommu_pde_from_dfn(struct dom
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
=20
-            amd_iommu_flush_all_pages(d);
+            *flush_flags |=3D IOMMU_FLUSHF_modified;
         }
=20
         /* Install lower level page table for non-present entries */
@@ -312,7 +312,8 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, true) || !pt_mfn )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) =
||
+         !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn =3D %"PRI_dfn"\n",
@@ -345,7 +346,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false)=
 )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn =3D %"PRI_dfn"\n",


