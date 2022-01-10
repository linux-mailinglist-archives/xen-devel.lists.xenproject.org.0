Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9115489D99
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255452.437750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xZa-0001sD-Vl; Mon, 10 Jan 2022 16:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255452.437750; Mon, 10 Jan 2022 16:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xZa-0001oc-Qz; Mon, 10 Jan 2022 16:31:06 +0000
Received: by outflank-mailman (input) for mailman id 255452;
 Mon, 10 Jan 2022 16:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xZZ-0008Dm-2I
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:31:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4407c00-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:31:04 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-LJluqCRsMjaoXdSCAp7t0w-1; Mon, 10 Jan 2022 17:31:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:31:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:31:01 +0000
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
X-Inumbo-ID: b4407c00-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRmpD2qMXm2Vm6fNIy0ebgLcqYPHnHwAuw/VY8R+szI=;
	b=NB5WmeZsH+Cs7rDE8u5cVjspIEYa/KfJanWS8GCNTnlMkFon13vpD3AekDu+g6y4JiyXyf
	eT3JOU4z8K/uuaf4+hZLxQgv5oo+1cvxENOrFYlQg2j62SsNY3raOaPJ8P0JYisKLQrw0Z
	JrgZBN5TDBGEczt37ZemEQCMtdgxu/M=
X-MC-Unique: LJluqCRsMjaoXdSCAp7t0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nldOnZ48C8C16ERsSMvQJqICf9zIhDzQDzVEOMcRvGHW/hUpFLFh0VMMfmPsCJjJjAdcuvgI3Q5FglTPehsqkxiDR5BjR0kYR5UYaKJxnOELaa1Gws71BXd+17tdLVxrsUMnqFuUYwI2XsheiS+FXU8PPiD53MqspkO+2x7HyK74XrsS9zsGqxGJpLqnGsmgB+qbRkJLVmvT194xn9/uhUvjv2CdZx0Fb4OF+zrc/SGkgI3tyhkJ6uLyGq6uiWpNkbmdxqPP5+64AkXJ9ETaU/wwgcl8GWkUC3DFJWO+jyMXdRmU6fzDCtxQr1yXqze/5hVI+2YgbllwoejM8xvEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2uuY7rIe2glCx5ujVXcsUed4WYFvdRg35p5JtkioGI=;
 b=IY1oP6p5fa+hWW7Pk7gznLQs4TEumsQ15BmoYtgU6Lla1bcLwF+EMf7H+42BThsXwb8FNah+AcheJJV4RSgukeQ+K/axq3Wm+XAmYPNNI5+yxcah4lHByh5yPVPd8MyMzMcKk9mxou45GLqxSTHaXyECG/KiHXskrWnHno73sdAViVHIQfYWmpWylbCAJ9XZYjDjUnQ7e+oMrKFGvzdVPfFcPT3qMQLok68WMZLcnS48w42nsWzJNGmXFZosXmyuwRXmhbRMQ16YdfmtYEDweJlNiaawb3KM09VALzF9EolydlfB4NXk6mCeV5r5YqcsyH7OzDk4IJkuKHq5V+77fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75e21708-5d39-0af1-2f88-e77643ff4231@suse.com>
Date: Mon, 10 Jan 2022 17:30:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 13/23] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 875d9c51-72bb-4363-f4d6-08d9d45696d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51656AFAC202D39BE60320B2B3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TcHupoMoSLnwLQ/0olIDxDYJrRumWp2zjNjixfDFVoW25pHuWgpFJZAx48BSeu9OyDQP4BGLfqHoNim3hzeXDmWWBXrQllXdVnPFMxsNg1zpgzMj8lI4tDhT0zWU3jLs4xc+ttYHuggM4pDtA6CMKDxqBFAsWToZaxoG7I4gqs4qkG2GNL8ZGZqc+08ubQMxkRMmFRQi2tYC4xdJWOmoQy3+p0w2KZKVIqJc2cznrLxZ7dth87FtWIGqX7NcTJCVIXAcNNEjYw/47w+STTVSRPgpTZGvTSyYgOFhale/Wpdaep1690zWPLT3RadNaSo1pxGhNuAxPKpSRdQiley/7ZyyMy2O+qbjQBt1JjC8VzkKqAEewODF5tWAeL0U6SPAhJgzjmxs/5F4YqoQDV55CufVWq9MN8Fb9Zo2oF3pCP7Cxt857MqsGQLAfPrfyE4OCKuwfX+y/Mh/iBqEw4jhW1m3pzLv0d5Sfr4a7vKLmvzcQsjJD/Yj3p2wf7+hy1JPNlJHtQ4rweFIQ92Bwuo8M3W1c4QbOYxg8P+itKGpxjRUZIotCOY5v6ZwwFTyJgEio1TFDES9YtCS3Sb0dnry5+vuF/NFPuywZ6xJUZRVDFHTDU6oRZvWLdqKb31s0prR1EDpX0HHcv/3z40uPRBxyAOQYpurixVdGPeb7Sv6hzAPuUa+F8agsB6YCtzGgDDErQ81fsWIAYYbcbMZA4+ptdhoVtAQAej/04HgTuBTzaTOWXPJZW9XsC/7L9wWcs+F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aBgK08q4GfRecZxtRtdeOmxoaDyz9yUNNKomFQhD1J6fP3MWHYngdvusdwTF?=
 =?us-ascii?Q?gHt2FBLXX7Hy1WAn0Yj+ZdOaFKa+gxWQOwZgRDbyPkc4AGkdDCF4NP1pzZ96?=
 =?us-ascii?Q?OujsICe/4M7oQ5m9t4D8b0Xr4LVEoH3jKBmRJkXji+3ksYoVJeIr0FMoWH4O?=
 =?us-ascii?Q?E5PhtFz1JuLTxEgcxMRj2irZYKvJI5lO+as1AI0ZmnCWWdwCkAw7O8wEvMG8?=
 =?us-ascii?Q?Z+Ryh6hbQUk55iVDlQadb/Z6u807vVb2EOkiixT43dqoPWWVupyJLQttumpk?=
 =?us-ascii?Q?ggd+ZnyoHrXNJOILtMxj6fW4O0SabZudP4bp8QTzxFnfgg8iNbTU+Z6/WCC6?=
 =?us-ascii?Q?sk9SsvfeWtiu8DuNeECLAOzr1WcoUXWoyolAOg7BkpJ/UZ1kH2S17mjHNKZZ?=
 =?us-ascii?Q?+hY5tRdcuAIlUcQh4cqoV3VoIAWmsp8tYSpVs9YBC7/+zTl4tpE/BTkEa4cN?=
 =?us-ascii?Q?C3ZQr6sHFHacusPP3jVnXyMQrySIdXq+AD8kPtEHlaooaGSU/qj+648a1YOO?=
 =?us-ascii?Q?RWpk3m1ATOdnbUIcbBtSMpmqKRhG2DVLlzkpaBMECd9re0y6QTep1+BrtZru?=
 =?us-ascii?Q?pwxvj3A4EmwkIDTNe1CkHGkvE1QTTJkaIle+97hmGsAqh1TKtgWXHzFUP+yL?=
 =?us-ascii?Q?DEneyh6J49694tNjPDXiQryuAVKg8/GYhXorsXZq2v3woKbf1wMbTf5Jyw+M?=
 =?us-ascii?Q?4cSwVqM8JL358PU+GBDri/I0vlsuGXBZVQVn5V7DDzFHxrxY90Fo3noRf+jW?=
 =?us-ascii?Q?ihbMgnXiL7w8+hriJW2ynDJNZP7ICw6EYRwfwB/bnoGj/+gnk4ZbgCXj0Kzh?=
 =?us-ascii?Q?TjeSlEnFoLHrJFDyxtNkIlgIZ4sjsCs538u7QQEJ0gk1D3//+8w6xoQUsWn3?=
 =?us-ascii?Q?g1+DQVAdxZaEcSoG/GZFg8ZTx+BpdBP6ayhwvJhkklJOkp+AlIKxT5e1INSn?=
 =?us-ascii?Q?yc2DUwQr8cfk3Xj9fXmOaBq/Vt7QDPeIrJy6fF6qCVlIEJa/EBcqFeKXTPlv?=
 =?us-ascii?Q?7eQsU+Oss/cd8fbxV/WQm7qg3ilbqodRNJDzu10weKPstTGLtXH1taahk+YB?=
 =?us-ascii?Q?kKzWgpycyBA04CSf4YUxt/LR6LWYMtGFpeaepYZESlR/KeuB2p3L66k1wmBt?=
 =?us-ascii?Q?zPT69UdDhn8qGxMGbqANAkW4N9kOA8ksQR9+N2RWgFW0Y/tfj6IBbDWnu6Cn?=
 =?us-ascii?Q?/ncLM9HeinZpj79io4/C37CvGOag/7Q4QYrTkby6hTolJsfPkUMlOf5wSG/D?=
 =?us-ascii?Q?uTpLwQaFzWYRLsF2jNlrzRtlu9HGSidsizAN6PyGf2JHy1ffF5E9LlPsrsLF?=
 =?us-ascii?Q?JqTIw6/y4O+dA9cYVNLy9LBcRQzXcdKW6PRX++Nbft93ZtZBawQIoqSWVDvY?=
 =?us-ascii?Q?sjuAeQQzoBTxyjsKOm5uyIcZDmf3QXQ8wWBqtvILTl2w2ngSDZqRgN+uXhlH?=
 =?us-ascii?Q?z9+/ZqxwZzKfdWpYrAZC4t9e+UWryqgDAZVlTCi9PEnyaa54c/UZ9OsMvyo8?=
 =?us-ascii?Q?qEXiVJwYUONoZaXRtBLIKmuqJMvMc2K73m9ww4J2LvNRjy81u+ikLjvlcmAm?=
 =?us-ascii?Q?g3z4CMvaG7+GTwHFxfZ4sGl+ME2vx4ogIpmcwCIuOH+USWtgiRtLnwxfNMwB?=
 =?us-ascii?Q?T1lUJlTmJprZjbcFFcI6IWQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875d9c51-72bb-4363-f4d6-08d9d45696d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:31:01.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np39MjGZ0s7OJOYodZ7ba1SapIHYYKGt2YAZ6YBF3STR7eKZE528vNOYbQ8cmn0oj730P11IFRFwMNgl4xu/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

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
@@ -68,28 +66,42 @@ static unsigned int set_iommu_pde_presen
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
-    unsigned int page_sz, flush_flags =3D 0;
+    unsigned int page_sz;
=20
     table =3D map_domain_page(_mfn(pt_mfn));
     pde =3D &table[pfn_to_pde_idx(dfn, pde_level)];
@@ -98,20 +110,18 @@ static unsigned int set_iommu_ptes_prese
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
 void amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
@@ -287,6 +297,7 @@ int amd_iommu_map_page(struct domain *d,
     struct domain_iommu *hd =3D dom_iommu(d);
     int rc;
     unsigned long pt_mfn =3D 0;
+    union amd_iommu_pte old;
=20
     spin_lock(&hd->arch.mapping_lock);
=20
@@ -323,12 +334,16 @@ int amd_iommu_map_page(struct domain *d,
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
@@ -337,6 +352,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn =3D 0;
     struct domain_iommu *hd =3D dom_iommu(d);
+    union amd_iommu_pte old =3D {};
=20
     spin_lock(&hd->arch.mapping_lock);
=20
@@ -358,11 +374,14 @@ int amd_iommu_unmap_page(struct domain *
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


