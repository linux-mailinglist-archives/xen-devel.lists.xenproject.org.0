Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F95535F25
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338005.562753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY0G-0004b2-UI; Fri, 27 May 2022 11:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338005.562753; Fri, 27 May 2022 11:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY0G-0004ZG-Qn; Fri, 27 May 2022 11:19:36 +0000
Received: by outflank-mailman (input) for mailman id 338005;
 Fri, 27 May 2022 11:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuY0F-0003mu-Ql
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:19:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e342c681-ddae-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:19:35 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-MUXn2TkgO1CFstY9F908aA-1; Fri, 27 May 2022 13:19:33 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:19:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:19:30 +0000
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
X-Inumbo-ID: e342c681-ddae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUFaGQ6IIZ0mSnkSmdZGDLADzXQZSEblHdc1xu2R4MQ=;
	b=m9baytdMN1j7lHF/gkt3ZtUaM9AsF3eN0OpXLj2uMK70ClJmYXHnDczZHF52hLZEax0sfn
	ty/k1Uji5uvA1jHlLic0kRNYNIdweMLjlt4QE2Fz4YrGPvd7VM5xctzYm7iP7Omboz/qHQ
	edmJwcHSqlxK96gHgsWZ3vBBIDN9SMg=
X-MC-Unique: MUXn2TkgO1CFstY9F908aA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHpu0BtdT1Lw1BCzvt3xSSnNYvdrC9UH/PbGr/CnpBRWurOdXNqs0A2ivbae1brsWWtHlOw3biUxPDD5KlHUvgbkLs7wm3I8tsIwechTbKrTbYdCVxCLyslZjBplyYcgyDwJFuzptBDkzu1cnW2E8zT/mfNaxTfPheYHf/Dudu1rIIFr1gURz6klT7fsITKXe2Aeb1FKLGau2/hXWvVm/44W9Lw//9Ql86aQHYpjgNq++xgutkIi1UYQ0VlgEhNp8t50MMzQR3DrBTyQqRzA4tI9fCWiexejUwdfdSrf7Vnw2kJasAwnzjO5PVv8os3HyyTsCDO6ivH+G2vo5bQfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpBKX8iKhA8N8952sSDbijOunJ7uuUUiGIDbjZy4Htk=;
 b=Jd4oL0qUyEBkZl6TKbncabZ8064FdzykCRMXzzO3uVg5alcAVA8X9Q8QL/m6VFKoK3ZJnWV5jIomxU3PdREBJ3pPwNyYi0hQgSE93F2JTkEksh0ClzOq/YLg1LzDRGZrqvzMfsFWW1Wng95aZbTVSpGrCxG+VQ2lCAsFXpJDaQ9xdSPOgyZuvCUMzbl2l3+sOlMuVcTCjTnvABFzLfirS82CXoajNMjbWw0pE+PVWFXSyMa/N+vznzjMilabGiObTlDxmSaaToE25bKbYRAg22HdtDdWdgS4VXz224xhYCIRV7t2MTDniEbunlTgH2YvJ2q2GR8dZ40AFCWCoKNQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e9c8019-9318-280b-98c4-81c0c1b1d558@suse.com>
Date: Fri, 27 May 2022 13:19:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 11/15] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0102.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::43) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17c3e8c0-0410-4a2d-c737-08da3fd2c48a
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831EEB2E53AD861686DFE38B3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bi9MKv+LLOr4dZATwU/CeF+D3xiTIOV+u+P1S8ZNDISmU8YGmvgivZeCVtpC1G4XvANdJhIiBcZ+FiQ0WCXBH6PRh732wd8oWUC6JZJBkDwx2rG/QMepUSG32whSdTOIRvCt4lcNSSfDGTzyyH6OzFG8cs5Qx79BzH38MDD1BCDopXYX0ZOuv3Fvuu1zGsgJ/kSUX4AF9KgLWB5hJb++FaMLYYLR0fDmrhrVDOBMl3TtRaAJ1Cgw7Ct5SIut+VBlgjNLMtBdFlE0uFiA2r3zZfLdUMfdiMQ/IWdoQBFDbnzHXmTsXq4ix7aRTyKaesqdZZ3ZsuGBqGn4FE9tRVqwRq74Tic0lcu3fgDmQPgz1T6MFGiY1muYMGwhqtwZ7IMzQWUiiCKZvQsGvkWWDA7h/26/Ks180OOfCqdxMBy8CKkFprIU1tgVA5fzzalAKzFJkjtnT87xigWVM6Pio6yVGE0vSqxxAcuzEwJLpS6Y1F3kNXv4U2PLszjB3eb18CmjGWQtj7W387MgpAqR/L9nFOc3Tr/CnW2ze8MYiO8vBK58yzFF8Aq2kqqewkel3ALSK27U2qYpcYU6yHx53x4YRHuULBkrAJgAuB5nRM0GJkJ64llKptWx0cxCw4rHFKAUBCokW/9dWia2mtaNSfjxkNthmGijvXRR0XmpxresdjWZJ+d3XbToDUmaCDUS0hcLdGOkYZ3XeBThxxLYjdW657VkP0jwyhKtYg5bzRPauhkQAZUsQAheOzXwAj2nNxrC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJHUuHiIagACBR33f8poW0/DOaOqc2jmVyflSq8WA4pTwjlR3Gnxv7WUq8Rb?=
 =?us-ascii?Q?7Vlks8QWEp8JW15HgA0UDTQpFSrYg3bU2eSX/P8Ofa4acw0h9GD/qXDrOQbm?=
 =?us-ascii?Q?GtINsWq5fm4KtwpSa4/+39jhyBdyOPGOS9gvSOz6yQqwxY3QVhqT0B1IntQK?=
 =?us-ascii?Q?o1dC+4ZjnZPh7V8hsGO98nIJYeDQyPx63WPv9xUX7nNy/wUEViS1htrd+6CO?=
 =?us-ascii?Q?d6aMT3yeNeIQ9wsBONWfnVIWBlcUOOymMq/O0JbiyBSVPZF73N2wpJLzovOJ?=
 =?us-ascii?Q?YaaVslC2WIHTNx8XXGYHQFVGneUFx1NCO1lpzYcff1CJWGNg92WmX1hfYgja?=
 =?us-ascii?Q?s+9sZOMAe4asEkNpuRQQsLYkvzkJNt5sATTVV/OnBGoqMNBSs/EhgrWpQAHa?=
 =?us-ascii?Q?Ni4FhrNAi6G8JBdTJopRlRbjbbkz93k5J8mrEQmRjMtOihZCvNH24qJSebul?=
 =?us-ascii?Q?d6UPWDHvtnTEraYiW+6P9USULTHJO9j7dQsMfqxP/D8jaRSl3Hj0a3jTEbtf?=
 =?us-ascii?Q?Mj2703/65u9HWMiBp3G3FMqxHi8XtO/n2zlxGT64OhMV5kUja3CnGnoVU9JP?=
 =?us-ascii?Q?0D0R4w40QMSGKoKwvO5/TS6Qyal8n/w+7+pS+OFbA0dGUy9ZBQ3o/5knUg4+?=
 =?us-ascii?Q?aDj4M6iA6pu26dVDlhse10xfJXw2wjf7QwqdflfQOFIgzKfKt0GW6+F67ZRM?=
 =?us-ascii?Q?Bd7+u82KCwPip6dKf9NuohmREWA//UyppThYSvjlcD2pRncS4vy8XvfTR+F8?=
 =?us-ascii?Q?e4i+G0RZxQ89/tO9mMr8dH6qsm5RvRuJPR/rAgVkfTZx/MMLbib7kJ8bDbjI?=
 =?us-ascii?Q?3J/plAxb8MgSrF4c2OWaOKx9qLGrlWRWxSqDnLN7UIy54JCpT87LM3ZsLmy0?=
 =?us-ascii?Q?rp4uQLC0fhP/wjkEuHFPgW21Bq/IGKygIP4yun3hLiikx5dWLzVJbOi94Ucl?=
 =?us-ascii?Q?o+3MDUpgpVIKblCUhtLs8yIQZYjLZ+fQiBnT5+6d8KeEFpcMS6gvytD2vS5m?=
 =?us-ascii?Q?A7h/z9ca29WfG81CVAicshlfadCaeocQkafHI7xBEVFnmrjPec5app/vKMQ4?=
 =?us-ascii?Q?ugQZXIUQ8Z3oaw5kp4H2QdOTO6E+P7c0E6Ar0Q1+XR0/Z+WW3UD3Mn+ctAaR?=
 =?us-ascii?Q?hRIYtHwtCYQjNC3p1sBCf0O7VXJiG5AJ+ghIkZw+5+AY50JfmM4RFz5hVFZX?=
 =?us-ascii?Q?/yr61hy4ftEP4+c1ZIBIKRJ+LXfJ0P419H+eqlGEfYZ1EI0hsRUruzSLG56D?=
 =?us-ascii?Q?0qnc/Pb5SHq9rcC15su0wRBZoJBYeR8fAVfb9tRhqh1glhysXvfWpIyi0e3o?=
 =?us-ascii?Q?OMkmy3cxnssH2SCPnYrZWunhcegHUmJLLNxntsmjXdk6vrxVAhb4Gy60bnz+?=
 =?us-ascii?Q?d17u81JIZ3FFxfFORv1t8QcceuOe/97BfUwcl+y4EUutR6sfms+f0HZwofLl?=
 =?us-ascii?Q?E4EoNiJlsNkMZZQQr8bA/U2NpcogRKTTgPF96wAq0Vf4RWNhoapIK+/ScJ9D?=
 =?us-ascii?Q?SxNidHJ9v3V8HsHh4yqwqt3+/h0B/pRg/D6pHOzkx7YNEDps2Im90hjpScCh?=
 =?us-ascii?Q?mOcW/wqFhkhr9E/yIRrwIbi6aFpCeIJCi8/LSeFXDi73yQJdDvlaOi5UM4Kv?=
 =?us-ascii?Q?M1iJvEilAV/hLB7mZk+eLjtfTP5bwrZP6kPwUZ0iCugkR5SahT33kRa88yBR?=
 =?us-ascii?Q?1CzO/vYil5Ttx3m8eJ26RIal8yYarJBrkGxg4lrACz6lbF7bMBiwmCDaLWw3?=
 =?us-ascii?Q?735JZCLdnQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c3e8c0-0410-4a2d-c737-08da3fd2c48a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:19:30.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPoaZDDBUz3i6vdr1Dcveaid17xFuxvbsrqoTec0cd4aa4t/rm/Z+8A7DudsWVKhpQXtXHS176mpL6rKg99wMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v4: Re-base over changes earlier in the series.
v3: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -81,7 +81,8 @@ static union amd_iommu_pte set_iommu_pte
                                                  unsigned long dfn,
                                                  unsigned long next_mfn,
                                                  unsigned int level,
-                                                 bool iw, bool ir)
+                                                 bool iw, bool ir,
+                                                 bool *contig)
 {
     union amd_iommu_pte *table, *pde, old;
=20
@@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
          old.iw !=3D iw || old.ir !=3D ir )
     {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
-        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
-                                 level, PTE_kind_leaf);
+        *contig =3D pt_update_contig_markers(&table->raw,
+                                           pfn_to_pde_idx(dfn, level),
+                                           level, PTE_kind_leaf);
     }
     else
+    {
         old.pr =3D false; /* signal "no change" to the caller */
+        *contig =3D false;
+    }
=20
     unmap_domain_page(table);
=20
@@ -409,6 +414,7 @@ int cf_check amd_iommu_map_page(
 {
     struct domain_iommu *hd =3D dom_iommu(d);
     unsigned int level =3D (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1=
;
+    bool contig;
     int rc;
     unsigned long pt_mfn =3D 0;
     union amd_iommu_pte old;
@@ -452,8 +458,26 @@ int cf_check amd_iommu_map_page(
=20
     /* Install mapping */
     old =3D set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
-                                (flags & IOMMUF_writable),
-                                (flags & IOMMUF_readable));
+                                flags & IOMMUF_writable,
+                                flags & IOMMUF_readable, &contig);
+
+    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
+    {
+        struct page_info *pg =3D mfn_to_page(_mfn(pt_mfn));
+        unsigned long next_mfn;
+
+        if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags=
,
+                                false) )
+            BUG();
+        BUG_ON(!pt_mfn);
+
+        next_mfn =3D mfn_x(mfn) & (~0UL << (PTE_PER_TABLE_SHIFT * (level -=
 1)));
+        set_iommu_pte_present(pt_mfn, dfn_x(dfn), next_mfn, level,
+                              flags & IOMMUF_writable,
+                              flags & IOMMUF_readable, &contig);
+        *flush_flags |=3D IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
=20
     spin_unlock(&hd->arch.mapping_lock);
=20


