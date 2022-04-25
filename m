Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F450DB4E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312525.529810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuDX-0000Ul-Tz; Mon, 25 Apr 2022 08:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312525.529810; Mon, 25 Apr 2022 08:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuDX-0000Rn-QD; Mon, 25 Apr 2022 08:37:11 +0000
Received: by outflank-mailman (input) for mailman id 312525;
 Mon, 25 Apr 2022 08:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuDW-0008Oy-HA
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:37:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e51cd92e-c472-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:37:09 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-lhSQmLnTMdCSD3zsMAdqNw-1; Mon, 25 Apr 2022 10:37:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3831.eurprd04.prod.outlook.com (2603:10a6:209:19::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:37:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:37:06 +0000
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
X-Inumbo-ID: e51cd92e-c472-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3svnu4oijNxO7SygTj1nIXI23Kv+KFJWpuZLxXqiiHk=;
	b=I3hoD7Yv80OcqzwbG1oXA6nUgQ+8Lpyt27WC50E/gad9mke2KnP3k+o5fiGiDuz/HnTuix
	r8BZPBU6ZYidpq5NuuRuM1P1UfxC1Vsu2TOm8LasJGNAmAH+dXY+EbuDQtgaXuuASupGY9
	SKs2NMpvZgX9tA7tIwyyRKw5sYCGsSM=
X-MC-Unique: lhSQmLnTMdCSD3zsMAdqNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvn6mRihD2sGvl+cQB3Q+DdgpxcOpwwUhlSBU/VWrlEGXHaKwZUPLG/wX7+CtLGFnv8YUj5LQ4LVHbQB7ZmZWR20mq+BCthfC7v2r4DTBp0DgAMfNruIkxHWR2R1vBg5AbJWEr/AHcalqARlSo/KLUCd04w5Z/04RHZjosiIL8AvyhWGJgS2ogmsGFoEs1UfiyIpDOiiguAD6RDBecGq/DCUO2udZNpaB7bi81cJvAbOwNDqma/QcfYYu0cAXDsLwxgp2UOIK+3IK72wXwcax9Q7tfjTJL7PmSoML5Z5Z7S2mw5eXbvHSFWm5+LeOTPSK30jKxfsYIDa/ZGqXdsmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ/rcnHk48J2486MfEcTZdg7UhutmuOyywKelNyvVqw=;
 b=ZDHOkMHf20ORZOnUx7Q7vZHa8U2C2MtjwHwpd10T//5EiSFNauZMHLVqKeWNgjedTDWqjSw4EFlAGzv+SWlgqF0vWLAItJWYwJLDQzpmbRGZjQAYWQDlGqBc5wR8+AHUCwPg6OwZoz+ur6uMWpQGgUQd1ZqxJk3Ak/hMetYn0psdvYD6MLEsrE7sTHxCpJ45fAZbZDTyfQ83Z4h3WWbvxFHiAPFF+BFocsR6+bgNTZ0hmbjGosxJRZafv+SorTNcZVT6ZliUlFMJcopMuMq6IX2tXO3V5V4WevRXkJ/KuW5ZOyvBGlKVxOPhAOJ/PtO4xwJQPOW+i0/ZbmGfxB/AUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5a0dffd-ec55-3b99-0eba-418d96dc4151@suse.com>
Date: Mon, 25 Apr 2022 10:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 09/21] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0066.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::11) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68f9848-db3b-4065-c36a-08da2696c75e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3831F2A8E5599EB1953F1F5FB3F89@AM6PR0402MB3831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rrXWuFSVB2Ikn/Fsk7GLk4OKZXbfgWj1niR1mP5y1gIUMISAVCEYcv/lk3pypisCCKnogU4NK9uWRU3+oQptvYiHzVaGrlFCb8ByOHUDXsbnsSRkvUpk9+3KG2v7rstvqG2ZBtJR1z38h6zpZYgpsseogWjYhKQEJGm4g4YdUeISJ2yialnS/dNi4vC+weSYwDE66adtFiubACGeB/WBLZaJkONAJo9HB6j2jnZ/Q+n4RVGTFbRGeG88vhxYSNV6f31na/pf6L79wSsj8adX747IKf2Uf6MgTLBopD3lPPlFKeeq2ZqBsnka5eaXH6SgtSTttP5UpwodC9D2Sl2jdGxHtg/jUOXtgnzQ93YXC49rGW62c4Fn8FVCPNhEGhf2FGb6fXq6FAV19z812evuebkr9sbTsLDHRYP5q5s2cyTO5tGEnbNcHcbcgWNj9z++xG0Xh50i27hm6bhUQ6cOsyzkEx9t2UhrbqDgKdY2qsckTzU1qquW7KnZW0OjbHzRj/MRRoOx9l/zTCVl6fBT9c8QOSVSg8U5uDpi9teZKOjZ0cfsStH64l7n3Wjj3WIs/qxFFP9YNjNvJHUCKsjtedWOSjn4NiO+DygoI7EkdkJ4Cs/OIVPC2IA0G3dhh2iCFJmG/SSZodbr1KXiOkCqJ9BEtKSbPGvj5tcI6CVB8tGDLvdM5xlOdB+T2HiRevxHsx3oyswl/zyiB8XyMIrBOjvTSnmrtN1hhsZzA1TPf7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(2906002)(66556008)(4326008)(8676002)(38100700002)(5660300002)(508600001)(6486002)(6916009)(8936002)(54906003)(2616005)(31686004)(66476007)(36756003)(316002)(186003)(31696002)(86362001)(6506007)(26005)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpvxNlTRvthqlsTNAmRgcSHHtY4mT9GM2edATTJifFfNonCovqNEbXKSoCyZ?=
 =?us-ascii?Q?my8WlED5BReGQJZ9G7+gyviF3P+kl/UWdbzB6KUf5WWtR8K3TbWQyZODU9u5?=
 =?us-ascii?Q?rTGV7N7S+nA+ft/lNUo1QnVQ8/K2nAbWLBvV/CAOBeLFrJuVrtc0qUvLCfKj?=
 =?us-ascii?Q?KTg09YSMrG8O4CrA/IxCSvPwBDQu9yojAUGAw11g0n0EQzBj4kv0XOp04H+2?=
 =?us-ascii?Q?XZpHdWD3tUKu7s40UvKJ2/2GkuLQMJc7QEWuFpAnj/gvB5kzPifHDcXdLzPk?=
 =?us-ascii?Q?ZtrY6oiY6oIdEDwGOrJ+RXS69sZvvm36hNJDZWnobQHKsn70fOLULtIH3cR6?=
 =?us-ascii?Q?02jalycUIQDWBA9yoYqzbkrVPwLTwdLWiu1g8s3m0B6gvNqTxX3WQt+zSaVX?=
 =?us-ascii?Q?uCIS9swqEte0aLiivmzlmObBiEPiBcYBNarDvkVxvfOhzfY66h9My4pBY9D7?=
 =?us-ascii?Q?SGtW1NAUEFbDaWfKskt3Fou5FYdYIySB2PWOpAVEKLmACUoC8sHb69QbQ7Cf?=
 =?us-ascii?Q?+gQ4fZnT8bRxYkhtWeW2altabXEhrCyZcq96r0thEMc1xNJUtirvmkptO03B?=
 =?us-ascii?Q?QiOzW7dBcqpJ0Y2JBJsD7orfhWs+qrwNupd1VwbH6BsDJ571LB17vUNKQswC?=
 =?us-ascii?Q?eYSejZLlvLoi95LNM8poCcz5wWEHw+9e7xtaSZOAYbdiKBn/PDqQUIBKN6ZI?=
 =?us-ascii?Q?XYfqA55e/yjeukTG8B242ZNiqMr+CX+18v6IDqypQ5DYqMmfAWfoebU3SZuG?=
 =?us-ascii?Q?fT15NGBDe/JB6dM6yZfnVY3nRczQhGWIMsaSTcfLIDVaaU9e1t4iwfiasS6X?=
 =?us-ascii?Q?oGVmtakpHr9SH4GQsEPaFHCafh3lUS69aAVKwBhVQmjuxSSYDqh/ZwRpXY/Y?=
 =?us-ascii?Q?aDm2OmGmzUQWTm0MZ87a/updLbDssW8daip+ifzwJ8qWqoe/JHNK7SurQFVh?=
 =?us-ascii?Q?GKwLDYNQZiNHwIbAj8tlilfZItoYB1TKqxP1FUMQ6p7RiOcabGNGUEH/DjXj?=
 =?us-ascii?Q?JPsvdLu0l7pgWRTRscRM85BrWst1nsZdOkLs2mF60HHyFWcpJaXXGgTBc/e6?=
 =?us-ascii?Q?UEoU9160ef0p36xLsKw0FBi5D4PQuGCOQr7OFNBVCN/y79p16SCmskB5HYqG?=
 =?us-ascii?Q?unqWQ/203B5uU93yxqxp5TPta+uKwlyKhWEtHGbcJC3a9MkE3/zVpAnwdOC+?=
 =?us-ascii?Q?OY1KHFWmY65qxv+3scL68DuF+EiqHGf03HGNjhVHaMITMDiXnfwu7nKvZ1u4?=
 =?us-ascii?Q?fU1dWhoekDfD2rXEJkamHdFpx+OyPwGj0znp5fPZY4k2y04n4boj5hIxlxcr?=
 =?us-ascii?Q?dNbzHcMOt1YhpyU0antAXc1LHEj/3h7Ho+08q0w908TwlkJPaeiXqW9YD9wF?=
 =?us-ascii?Q?nUbUc0+ikJAOpI0575iHcY/NtbQPfyIa+0IG47bwSaZKj3L6W8ZlZdIV/Osf?=
 =?us-ascii?Q?xIYVM7L//KEvHPHuXD1rX8trWLxv38YdrzmSfVXwpHhUwNNPZ5jkCiHyOCS/?=
 =?us-ascii?Q?mG4s+WrugfTQzqtKgeFQyC5QlGvBX3wyPe9hyVlVes7vv/+w7iOuhvLP8DuL?=
 =?us-ascii?Q?2OPQM/XVL+Z79bDqy5mPpE+jaennyE+Hbl73v98NIS6g7QvNcgpwoqqD0DGF?=
 =?us-ascii?Q?xHyyMnLHxJmEmaThw/DXOmZS+EvLivUwReyjeMMKUyJRh0VCnhFbsGnBFYd6?=
 =?us-ascii?Q?k/ZaabDqyQ/gXXOgjZSmdAyQmjtwZ0GPkHJ8k34TD70BALR08S4QvVbwE9ad?=
 =?us-ascii?Q?mOLPXXvfEQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68f9848-db3b-4065-c36a-08da2696c75e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:37:05.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CzsvGC8W8vgJ6L7eXJO0CYSkYGJba6X/LQkt0x7tisP8jA6ws0qXwLvwWs+aF0HZbysfW7juSezZdanjJxR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3831

In order to free intermediate page tables when replacing smaller
mappings by a single larger one callers will need to know the full PTE.
Flush indicators can be derived from this in the callers (and outside
the locked regions). First split set_iommu_pte_present() from
set_iommu_ptes_present(): Only the former needs to return the old PTE,
while the latter (like also set_iommu_pde_present()) doesn't even need
to return flush indicators. Then change return types/values and callers
accordingly.

Note that for subsequent changes returning merely a boolean (old.pr) is
not going to be sufficient; the next_level field will also be required.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v4: Re-base over changes earlier in the series.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -31,30 +31,28 @@ static unsigned int pfn_to_pde_idx(unsig
     return idx;
 }
=20
-static unsigned int clear_iommu_pte_present(unsigned long l1_mfn,
-                                            unsigned long dfn)
+static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
+                                                   unsigned long dfn)
 {
-    union amd_iommu_pte *table, *pte;
-    unsigned int flush_flags;
+    union amd_iommu_pte *table, *pte, old;
=20
     table =3D map_domain_page(_mfn(l1_mfn));
     pte =3D &table[pfn_to_pde_idx(dfn, 1)];
+    old =3D *pte;
=20
-    flush_flags =3D pte->pr ? IOMMU_FLUSHF_modified : 0;
     write_atomic(&pte->raw, 0);
=20
     unmap_domain_page(table);
=20
-    return flush_flags;
+    return old;
 }
=20
-static unsigned int set_iommu_pde_present(union amd_iommu_pte *pte,
-                                          unsigned long next_mfn,
-                                          unsigned int next_level, bool iw=
,
-                                          bool ir)
+static void set_iommu_pde_present(union amd_iommu_pte *pte,
+                                  unsigned long next_mfn,
+                                  unsigned int next_level,
+                                  bool iw, bool ir)
 {
-    union amd_iommu_pte new =3D {}, old;
-    unsigned int flush_flags =3D IOMMU_FLUSHF_added;
+    union amd_iommu_pte new =3D {};
=20
     /*
      * FC bit should be enabled in PTE, this helps to solve potential
@@ -68,29 +66,42 @@ static unsigned int set_iommu_pde_presen
     new.next_level =3D next_level;
     new.pr =3D true;
=20
-    old.raw =3D read_atomic(&pte->raw);
-    old.ign0 =3D 0;
-    old.ign1 =3D 0;
-    old.ign2 =3D 0;
+    write_atomic(&pte->raw, new.raw);
+}
=20
-    if ( old.pr && old.raw !=3D new.raw )
-        flush_flags |=3D IOMMU_FLUSHF_modified;
+static union amd_iommu_pte set_iommu_pte_present(unsigned long pt_mfn,
+                                                 unsigned long dfn,
+                                                 unsigned long next_mfn,
+                                                 unsigned int level,
+                                                 bool iw, bool ir)
+{
+    union amd_iommu_pte *table, *pde, old;
=20
-    write_atomic(&pte->raw, new.raw);
+    table =3D map_domain_page(_mfn(pt_mfn));
+    pde =3D &table[pfn_to_pde_idx(dfn, level)];
+
+    old =3D *pde;
+    if ( !old.pr || old.next_level ||
+         old.mfn !=3D next_mfn ||
+         old.iw !=3D iw || old.ir !=3D ir )
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+    else
+        old.pr =3D false; /* signal "no change" to the caller */
=20
-    return flush_flags;
+    unmap_domain_page(table);
+
+    return old;
 }
=20
-static unsigned int set_iommu_ptes_present(unsigned long pt_mfn,
-                                           unsigned long dfn,
-                                           unsigned long next_mfn,
-                                           unsigned int nr_ptes,
-                                           unsigned int pde_level,
-                                           bool iw, bool ir)
+static void set_iommu_ptes_present(unsigned long pt_mfn,
+                                   unsigned long dfn,
+                                   unsigned long next_mfn,
+                                   unsigned int nr_ptes,
+                                   unsigned int pde_level,
+                                   bool iw, bool ir)
 {
     union amd_iommu_pte *table, *pde;
     unsigned long page_sz =3D 1UL << (PTE_PER_TABLE_SHIFT * (pde_level - 1=
));
-    unsigned int flush_flags =3D 0;
=20
     table =3D map_domain_page(_mfn(pt_mfn));
     pde =3D &table[pfn_to_pde_idx(dfn, pde_level)];
@@ -98,20 +109,18 @@ static unsigned int set_iommu_ptes_prese
     if ( (void *)(pde + nr_ptes) > (void *)table + PAGE_SIZE )
     {
         ASSERT_UNREACHABLE();
-        return 0;
+        return;
     }
=20
     while ( nr_ptes-- )
     {
-        flush_flags |=3D set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
=20
         ++pde;
         next_mfn +=3D page_sz;
     }
=20
     unmap_domain_page(table);
-
-    return flush_flags;
 }
=20
 /*
@@ -349,6 +358,7 @@ int cf_check amd_iommu_map_page(
     struct domain_iommu *hd =3D dom_iommu(d);
     int rc;
     unsigned long pt_mfn =3D 0;
+    union amd_iommu_pte old;
=20
     spin_lock(&hd->arch.mapping_lock);
=20
@@ -385,12 +395,16 @@ int cf_check amd_iommu_map_page(
     }
=20
     /* Install 4k mapping */
-    *flush_flags |=3D set_iommu_ptes_present(pt_mfn, dfn_x(dfn), mfn_x(mfn=
),
-                                           1, 1, (flags & IOMMUF_writable)=
,
-                                           (flags & IOMMUF_readable));
+    old =3D set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+                                (flags & IOMMUF_writable),
+                                (flags & IOMMUF_readable));
=20
     spin_unlock(&hd->arch.mapping_lock);
=20
+    *flush_flags |=3D IOMMU_FLUSHF_added;
+    if ( old.pr )
+        *flush_flags |=3D IOMMU_FLUSHF_modified;
+
     return 0;
 }
=20
@@ -399,6 +413,7 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn =3D 0;
     struct domain_iommu *hd =3D dom_iommu(d);
+    union amd_iommu_pte old =3D {};
=20
     spin_lock(&hd->arch.mapping_lock);
=20
@@ -420,11 +435,14 @@ int cf_check amd_iommu_unmap_page(
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        *flush_flags |=3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
     }
=20
     spin_unlock(&hd->arch.mapping_lock);
=20
+    if ( old.pr )
+        *flush_flags |=3D IOMMU_FLUSHF_modified;
+
     return 0;
 }
=20


