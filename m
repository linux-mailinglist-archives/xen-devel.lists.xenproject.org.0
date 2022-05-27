Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AC535F31
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338027.562799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2D-0007Bf-3R; Fri, 27 May 2022 11:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338027.562799; Fri, 27 May 2022 11:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2C-000765-Sy; Fri, 27 May 2022 11:21:36 +0000
Received: by outflank-mailman (input) for mailman id 338027;
 Fri, 27 May 2022 11:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXuY-0007su-AT
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:13:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 106feff7-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:13:41 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-fiwWDwBhOeqP70CORUxCWA-1; Fri, 27 May 2022 13:13:39 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:13:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:13:38 +0000
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
X-Inumbo-ID: 106feff7-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DQnfN5ec44h4k+UnrTQoza7hV/xKmWkd1XV4maZZ/38=;
	b=Bl7pj7CzH293SUnFvkkRxeQeKUm7o5OufbD4xS1ipPXUcaWHMLGCtp3xIwMHthoTeTYXUC
	9JRxPzakqtv+3tCZ9QM1sPSyMOne1CxxTquH3olgHMHcViGDdzcoNNkm4wRAOP4fr+6NBH
	V/KgZgT+Q1bySPzdpfd5WwpG41CY/rA=
X-MC-Unique: fiwWDwBhOeqP70CORUxCWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c69wk1Z0OtpGGq0WBV/4w9KTHO8Gw2kCcehE83d6yGZrzfKv5ZeQDMDZVS9eQFQf4PiULBOAkJGOm+vI9y8IppNuw3Qu1qBKeGcSsZ3y89kfCrFhouCAtIKaFFZo0cdVzxKEWi59Bpqow7Jmk85suSTUrrp2X1l4XUHrChyEdYpp3flqtmECAXIbTL9PVnQlaHs/wXPTFDt1uVQEqKLZfdbsuAdf1zTrSJyi/P7cpjQ/TEmcQWuUo9VPg2PiexUC/UnBWRSRi/r5mFijdE5x6qAmBoFCVWZnQy9LsdWNjAbdLTi7cfwgVEwRSK0xnP30LPLy3SlGFS5eU6ndwPRL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxiRfgvA8ZTM896+3sr+fZ7fI2k/BkIKHoJCeGpTy2A=;
 b=kHfnK7DciwV7yRZpDYXcdKurq014sRybjAgCoZsmzQ4pRvUviPVgaiDnxPzSQCYt1szMW0j2k4DntbY9T/e4R/S4ehhwgInSEd+WZc//+CXQb2eBEKNyPe1FQv4ckspJB/j7FCRJYL/nfeI5tNXEYFXP/5f5Ep2TZxwQmyjLcajGZRyX9hic7fRYKkNo+Q6zApm37XJ7KRrK4qwXQw2bRJVFO9HrNiDvAhGZoW9UOeis0tdk69AHT7i/4zLUgU3U3yNsrZvsF5ei2jRgoxfJ7KIxwMc82LIcxH4J7y302xa1mJ8yLi5xK+kmxIVWUsqL/DzgR9Dk/ytKzO1S7A8k3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5aca267-21f6-da7e-6b7f-9ec619cba63f@suse.com>
Date: Fri, 27 May 2022 13:13:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 04/15] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add242b3-37c1-4ea0-04ca-08da3fd1f321
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7210A569461A34DC49800378B3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	frSo6a9Gr0H+ZlkH3dnr2Sx/8n36p60w9l3i5UEmZKKBhHLdX4+2UunpCh3OmylAKcqq9ZP1fABTpkOivl/JqNcgw9Xn4xUAyOzLS0i9/Kg5mDXxb1AHPV07SkED5NHmW/aRNK0tdg/HHFsEXvDkfl3qVMPnKPDf1oZGXxAV/PpAPln7fF8sWZNOibqv4quAPwyyeyucc34NRBEjIF9Poh6Nistxrrodm01U3gc9EBe7vEHLE1Mqix8GFsuVfU5ad0n0tIXU6xtJTsdPAgUbK62PQtWphDz2BIuv67BoNlermTid9ACTB4TI2CyIeSm4RsbnZZLsNzjjYvCCdZ1R7MAKKazLOY0tU3+0eN2jPUQO9Et0H0qXwMbQv1SFslzCmuj6jCYb/n6APTOiEclrGTRjzhBr4hZonx++kWaXXBkuXWwmSWJROfmcdJdAi2ghihugFV7almpTxtNZ01VJmwBp8KaL3/OjRGVahR4irFF7kOWFdoYa7mZsnoObcRFXn41a7u+jKAwJje7b+9TIc0q8CSTzpv4gDgt+lSBKcHbDH9IB058OhHguhFKUtoiQFZ2KTsXX6Ed8c/72LOmyJ/nbi++4HUKTev7g3a3pyIbBk9C3vxWgUQlbeGP3OAXbZ3aOwnPCUhoIRv272heNrispyMBZ7h0A6BzE+wnbbEGmpTyd8gxV3WGGLQfDKFJN8m3XCoHOWFURDCUrGT8H7SKFM/G7tIRKGcYDCfJ0Tq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xaz5O0bRRd92b2qVsuWvM67Ldd6oDF3vUq04yULd01RN9S/GeXDCPYY5jmX8?=
 =?us-ascii?Q?bfDxkyWtMW43N272KSpzGwWPLyQAhtjAq/3S6iHuVZUj86zMsATVhriQ5jR1?=
 =?us-ascii?Q?2bvzrY86v/YcKGspnIj9/PI9/x0SXVgAVLnY4T/GC3RhLnKI2pBGTmbldcm4?=
 =?us-ascii?Q?joNXZR2yYm5yxJPsMztSlhhYmG1Xkzst4AJS3LbEuDghCtYCSeGkLC/uz4va?=
 =?us-ascii?Q?IEUidn2/yqqPPNtegjX8+GceSSQVDywh9p/DWTSRcoNXnMkZpSMpyhluXzKZ?=
 =?us-ascii?Q?cRQwOIAJ12lt/EtduYDXb66LO99GE6H1fXJtrclEd0QQ5ufLzwlR38NLoh59?=
 =?us-ascii?Q?V0ii/52EPCBydEw6McEB1a2vUFx+DhOeBTDH/iWXj+oAOqo2mbr4p1fcgqvi?=
 =?us-ascii?Q?QTDVEboCyY3Q0+zc/sCp2SLkjiki2gCG3eVLYUtCECGIcZC3MndVO6ReLCvv?=
 =?us-ascii?Q?MapaWuiuto7DcJU+bxeEATBcrFXD5T9vmvtKPekbNdD/bdkAv8RX/Nlqh5fX?=
 =?us-ascii?Q?OdZjccZQPnauUAG5pSJ8nQSacTPHrGWg2FzeHw3uSQh9KZ2omdeiJt6hlmDK?=
 =?us-ascii?Q?2JeGau8jePk8y1Lw90WDDaGCQd9bRR8hVPnNfIdyTzgEqK6SWm+OuzAkwTnQ?=
 =?us-ascii?Q?2J4V3uKeGQg0SkqRcCgVhj9/GU2I22mpNO4fxHQigwWANPZgrz0U1C7XRlC/?=
 =?us-ascii?Q?u7QNbxbof4SqpmRz2e1pUsUQe/TXIyInqHTIXGfEqkv1erHjNvRzCZDPRDYZ?=
 =?us-ascii?Q?KhoMl8Wev/OG1KeRtvcatGUWM+ktsgn/c+92kjn088mi76gafLKXWxPWjiwW?=
 =?us-ascii?Q?vqYcXjxQQg6hq39N1wwuR21d4cSpcWcUEg0+lG3muhlCd7RY26pSOKmvWvyE?=
 =?us-ascii?Q?Y/fKP7bY5wLaZvfxVoW9cmTbb75C2O8+QDy8z9sZIEb089ac6CaLJ9PQaTJz?=
 =?us-ascii?Q?FMJbN/hWbHdctFH3TbgqSZVvxAJhHCzSNqwt98B+n1VxD3Ork819kGtq5rWt?=
 =?us-ascii?Q?/cMh0wdd9fpRvWnSHrfmteP2e0GMkYkvhcmzgdEWoYKbBs6/HVy79zlz+aCc?=
 =?us-ascii?Q?ag5RjP4x7jYTwZp9L1PcgoyGVPW0rczMiqp9g/f9u/Toy73ShE/yTQ6jt9Af?=
 =?us-ascii?Q?XWxewzotz9Ej2Ovil29TbXxv+8eVLxCSc9GC+XVbd3okcwSvU1XOql+JPY0b?=
 =?us-ascii?Q?RpJ9WnvtXWl29NVFoAu0f4U1iAmaP3O2SxX3TkN9ipaC+LjtoLk9+hk3flqq?=
 =?us-ascii?Q?Ay52KRs1j8YS1DjldU7yIqsfJmPM5xMknwSirlHEMMfRTcd+W/YaKXbXDaoE?=
 =?us-ascii?Q?qkCE5/BBzMNMJvTE1SPqVA6XhZmMd0TxKhIMJVR8RpxhG4f5BqwN1XLQBDQd?=
 =?us-ascii?Q?zCfnGqBH/506hIWXP6cU1xdR1j7qqIemgmMWSUXoDS1HO5MiCzTWWXI227d8?=
 =?us-ascii?Q?LiokVWp+jM1sbjIhFICxpgMLJjajCZiIhdcpH0U/Hi43/VAl0A9YtC9ovyBf?=
 =?us-ascii?Q?k4oRoeksr32KY3eGxjK3gbZooqlmIbl8w8W6gd+fXoa3OswhVPYl6be1MpvZ?=
 =?us-ascii?Q?OrbGg9GNvxwYslUd9dqRSkj1OIxgNYI3ZDD99HZkmYb2xDwNX8h0ub9dUJzr?=
 =?us-ascii?Q?u8lc4T0JgoGeTqZzyOyWKk1WKnMqIDNFRsA4Mpz2WGonCOk1GJ/jPUJE8rSc?=
 =?us-ascii?Q?UJhIL9w28dyUNtNKN0eDp9Od7PC3AB9aVT2b6CevpZrH/uFlxvp09R0l6IEm?=
 =?us-ascii?Q?VyTlSbkQ5Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add242b3-37c1-4ea0-04ca-08da3fd1f321
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:13:38.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARsKo5ldFsCbhgjvkkfFOMel/tnf5fG3x6yuqWgsv+4GJsVuxUHaHyeOolESoyMUMfiql+TTla5gyPS21/G13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M and 1G mappings. (Via non-
default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Note that in principle 512G and 256T mappings could also be supported
right away, but the freeing of page tables (to be introduced in
subsequent patches) when replacing a sufficiently populated tree with a
single huge page would need suitable preemption, which will require
extra work.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v5: Drop PAGE_SIZE_512G. In amd_iommu_{,un}map_page() assert page order
    is supported.
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
 }
=20
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
-                                                   unsigned long dfn)
+                                                   unsigned long dfn,
+                                                   unsigned int level)
 {
     union amd_iommu_pte *table, *pte, old;
=20
     table =3D map_domain_page(_mfn(l1_mfn));
-    pte =3D &table[pfn_to_pde_idx(dfn, 1)];
+    pte =3D &table[pfn_to_pde_idx(dfn, level)];
     old =3D *pte;
=20
     write_atomic(&pte->raw, 0);
@@ -351,15 +352,39 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
=20
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int=
 level)
+{
+    if ( level > 1 )
+    {
+        union amd_iommu_pte *pt =3D map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i =3D 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < level);
+                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 int cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd =3D dom_iommu(d);
+    unsigned int level =3D (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1=
;
     int rc;
     unsigned long pt_mfn =3D 0;
     union amd_iommu_pte old;
=20
+    ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
+           PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
=20
     /*
@@ -384,7 +409,7 @@ int cf_check amd_iommu_map_page(
         return rc;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) =
||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, tr=
ue) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -394,8 +419,8 @@ int cf_check amd_iommu_map_page(
         return -EFAULT;
     }
=20
-    /* Install 4k mapping */
-    old =3D set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old =3D set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
=20
@@ -403,8 +428,13 @@ int cf_check amd_iommu_map_page(
=20
     *flush_flags |=3D IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |=3D IOMMU_FLUSHF_modified;
=20
+        if ( IOMMUF_order(flags) && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
=20
@@ -413,8 +443,15 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn =3D 0;
     struct domain_iommu *hd =3D dom_iommu(d);
+    unsigned int level =3D (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old =3D {};
=20
+    /*
+     * While really we could unmap at any granularity, for now we assume u=
nmaps
+     * are issued by common code only at the same granularity as maps.
+     */
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
=20
     if ( !hd->arch.amd.root_table )
@@ -423,7 +460,7 @@ int cf_check amd_iommu_unmap_page(
         return 0;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false)=
 )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, fa=
lse) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn =3D %"PRI_dfn"\n",
@@ -435,14 +472,19 @@ int cf_check amd_iommu_unmap_page(
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
     }
=20
     spin_unlock(&hd->arch.mapping_lock);
=20
     if ( old.pr )
+    {
         *flush_flags |=3D IOMMU_FLUSHF_modified;
=20
+        if ( order && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
=20
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
 }
=20
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops =3D {
-    .page_sizes =3D PAGE_SIZE_4K,
+    .page_sizes =3D PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G,
     .init =3D amd_iommu_domain_init,
     .hwdom_init =3D amd_iommu_hwdom_init,
     .quarantine_init =3D amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,14 @@
 #define PAGE_MASK_64K               PAGE_MASK_GRAN(64K)
 #define PAGE_ALIGN_64K(addr)        PAGE_ALIGN_GRAN(64K, addr)
=20
+#define PAGE_SHIFT_2M               21
+#define PAGE_SIZE_2M                PAGE_SIZE_GRAN(2M)
+#define PAGE_MASK_2M                PAGE_MASK_GRAN(2M)
+#define PAGE_ALIGN_2M(addr)         PAGE_ALIGN_GRAN(2M, addr)
+
+#define PAGE_SHIFT_1G               30
+#define PAGE_SIZE_1G                PAGE_SIZE_GRAN(1G)
+#define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
+#define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
+
 #endif /* __XEN_PAGE_DEFS_H__ */


