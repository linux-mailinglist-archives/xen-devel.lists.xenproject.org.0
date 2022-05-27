Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46439535F1E
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337992.562731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXzW-0003SO-B2; Fri, 27 May 2022 11:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337992.562731; Fri, 27 May 2022 11:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXzW-0003QJ-6J; Fri, 27 May 2022 11:18:50 +0000
Received: by outflank-mailman (input) for mailman id 337992;
 Fri, 27 May 2022 11:18:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXzV-0003Q5-00
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:18:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c72a2f96-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:18:47 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-XwqzWwDnOiq6zlJXvt8Egg-1; Fri, 27 May 2022 13:18:46 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:18:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:18:44 +0000
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
X-Inumbo-ID: c72a2f96-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56Ikp8kYb60S5Ww1u1UKlg6+iuxYU2FuDji0p2qDOgI=;
	b=eHfCWYLvp5PdKGmrPpOYIaGsIF2WXotqVYHeP2y7w6+L/gedNqkNfDA9zPEi/DbGPveq2w
	x7csRtHh5MrCaVtmkki57px/g/frNt5RcQS2JQ1NJIMUgfkKqr0Z4vMdnpfxTvBX5o5HMq
	7429nOqpxgfS4gpfYqPDf8sJDn9UKUI=
X-MC-Unique: XwqzWwDnOiq6zlJXvt8Egg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ1jIvc5l9Tv/CeQtecHdQ8E7lGXuclAN7bJWF+PruSxY3que6ueVvGnYZ+aVgpXhxmn99wB8VppE56/vyGZQn6FaVO4l26y+RkCPr7lOCM16Yu6bj+KLyohvJ+QM0f6fY/jHAz/vFtEE7wtnvvnnQq+4Jn2sEEjdYKv2cRzCZBugYGwm6aRjQ12NoKgPdxIycfkenVTsSy5EtpBm8KA5s1nrj9NmdCXtJYuhwcVZujUXKBeLg89NFq2+chuPUn3teIQehfcmY538qEHloMXSVYt+7sSm8NwRWSTr4MnxSZt5EUdsr05HQLO8dxXUpafVVH5qR5pir8LRCEZNhSkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1SRbMZ5vtUn4A75NysmPVCeWEjl1KBkL8Pu3NNkQeY=;
 b=M7fWYVj5h67HGeunumVuSpEDuQJLlblXqTV5AF6qd0iJdl3Gd5pRr6tVu23xUnj2y1X5lh7t+gOnLRbXieLyIkEdK5ZyB0cEPVWpejcrRh02Boi8CGzZHPXXmoIWhEMmOzpec2xDnagIXhK4WcG2t5hMhiCYfKyX2sJTY+ADGg4JNyfpnoeAQd80DhW3ooJVtF1FgYZlSz6Ao99p7NvnWjCym2uPgpk5A2of/WPpSR5bgk2aW6/BtS3g9y7PPHPNdc+EsOaACbqwAwcNTCqUGYGDFqEmae5BlpleODJWoEN3VA9Qkze3f4RUJ0S2vjJpavOvY8PfdmueU8Dk/CaAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b386ff93-2f84-8078-b434-db002756035e@suse.com>
Date: Fri, 27 May 2022 13:18:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 09/15] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0048.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636a0464-50b8-4d97-14f7-08da3fd2a989
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831E7DDC7238BA64987B438B3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9PkAyeijGi6cEcXwQ9DvWJ3Ri26IejewGqboGyjNIMd9jHTKkkoL3qGjleOdrbD0j4uNzzkrCXLDYnaMfhCi1rZqFXbbRL1P9DzewWxno8d7WbYaZmCN8YaieAo3oOJVy/zaCLH9hfSNrQiEUSkpMZ+J92cibPuUC/LJqIKjfrwf0ueydF/MjEnZMrX0EL1bxTsHuhFeZXdnK33bXSBkleYqGHy3EJ6Y4N8pYb22iZAuC2HgGkfe6yMX62pSZyU3Sd1E1fDeqCbvH5b6htS9/Vc1EhOnFDzmImGYIlsJwgG9gComX4FK0XIz2zDlpoA3Y+gmsCHFM1FkhrkSBkQvdmqrsIskyqelKIUFbRJ7hE81py3bRcvafkqqo8vzXAT236T0Ue4LadE91lSlHpHeOQcD0Nak/8ebK5UcfyrCHxVLXtzWmis6FBgoQvCPvpU6Mw3mo6i9nwFzJCutXgIhV+qJuaQQRwBrngdhDxwq7zGZ3+nRVV40B02iTdYk4U6nv184colaVoBBvThEcwQ5nFY7RHZXCshLkLzPfolUOFMYkW2fzsttQV4+M1ECWWdnW/aREB1v88i4a2ZJeeMKLsdlgLGRn+62qw448H3BZYda0a746RHRg8+uc8PUhDS2kn3aIES37uditkzr+bUbsLh+GnIXULa+cROnwgSomxaxNj0G+hqZIZbdRlZBNfEm4aKj60FaR95UAmjsj41I0/Poj206g/lIM5q24+QMjVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pmCCWHymAv7iWq2CxkCpIZyhnSEjQ9RZ7lU0y06Cn8UX96+KFUjEB1GRmc7D?=
 =?us-ascii?Q?G7tJUM/Pzos0bc9CvDUT0kzS1JH3KDVONWFIphkaqv4veiguiYV3LAx9rC8r?=
 =?us-ascii?Q?oVXfGoA1aAL0g7AgfLAWY6kxUMt5ULOK+pGB2OKkf6jUZw3uC5p9P+4v3LuE?=
 =?us-ascii?Q?q72q4cZzrZ9X4XocRY+JgReDqucEySIRqLKNwCv+2yoZdRhzj996GtRao8M4?=
 =?us-ascii?Q?IJ6weWbiXka803NGk+fTyrolId0i5I16o3k++LV3awxCiuaItaRcZodtMVBs?=
 =?us-ascii?Q?Xn8NX1HzNQXxgQhO3IrZVxftYK6ZcWqoBPCTimAcnT7edClzSz0GGFbUIj7Y?=
 =?us-ascii?Q?g50knkoWQdVjU7pLJT2+FI5bbZ6mREAk9OQ1H7/c3Vr8mWck3ulLu+3yc6QQ?=
 =?us-ascii?Q?FO7EcwN0rbliNoYe+fGAuHx/XL5QHDeM18SZdHp9NAFlWqFzerU0ShJOPrxm?=
 =?us-ascii?Q?Q9KJ0f0ynJqo//f+H7MZ7PYTQCFrKPcCchCvuf7rPJVzSWxQ5Tx67NMAZVip?=
 =?us-ascii?Q?RyBnQqtc1n6H/1JlAhabXjE0Ke7wgug8GV4o7OcH6BCRpCpfwvlm6SREhVrW?=
 =?us-ascii?Q?6cuy3RKGjQVnNMJA2SnBC19c8VSEmtB6dap/O3mSVSQtyvP1Eb0Dg/qQ+Y4U?=
 =?us-ascii?Q?IwDt8a6EXecQtDKPIw2T5vg1OCfDUnk/M9SSlL7jjvKcUG7c/z5eDlxLOB0+?=
 =?us-ascii?Q?6MS6sSA8jLT0NUKEqnqRhKSJv+6YRCToqOo62Bl9I73E3eavb1cTQR0Oj+Nv?=
 =?us-ascii?Q?XsVU6sQrn/oVDVHX06Q+Wpf5LKj0Dwe9iHCsIzRU2QELhVY8BbmFdf+2zWg9?=
 =?us-ascii?Q?mZqgZph71kuGj2gz544G9z8IvnFhHrfRoU9Z7HrBTaojKdpgU3kCtpteUXaK?=
 =?us-ascii?Q?r0SmVUVJRh4bsuS8HOAtZFj568SxMI57btlmGkCEX9uukfjN0hLaVQHRSt4J?=
 =?us-ascii?Q?aMdFaeFj0ggNfDVt1z1Zn20AgMPSOuInVulcG0z4PfW2u/waBjz5148jCyDb?=
 =?us-ascii?Q?MPYuUHIhy+y2Td3kuGlPF6xYHlBMGEBqcVN9EYALtrvQ6vL4oaU95VLAttVK?=
 =?us-ascii?Q?ZdA3PBqWiUxLudDDOIx9EM9ZdeIK481AMTc7bGTQjHHkorSDwB0iBQ7+w0n3?=
 =?us-ascii?Q?ClPrM4qLn6yi17SwoUUNosoSWxV2/CNDhU0pTnl2Qb2EdGf+8WwOVBanVXWj?=
 =?us-ascii?Q?8Ho0CVKMYxBcFEZzYeqScyn2tDJhM2tSkNgpK+Lll8+zNOprZtk9OojwTVpU?=
 =?us-ascii?Q?aQWCkg5MMLnnm9nFQJqe2NjKetOc/LdrTEfhFjePcnF1nrAMCOrhdGKJnoaE?=
 =?us-ascii?Q?IJ96ZD4nAcs/4TctJgMRbZ7mTVXtV7R7rgnefucBt5uGosQDN/RJkEEJGEfz?=
 =?us-ascii?Q?uOT+54Lo8m0tGIwh+JRGuCXa13z+WhykK6y64RDUTYYbzD4rsOu2tvraDqq/?=
 =?us-ascii?Q?cUV9z0yDjrg7Yi31roZkBbLhdTWJ1cTYTuPf6na4eNDddkimknZfnPNOuvVi?=
 =?us-ascii?Q?Hiy+lMXoo3NpprgS5Roxi4J8idCLhg0b9fj6JMNdpfR4VjEJQALo+zKa610c?=
 =?us-ascii?Q?6KYSmn28YzN+VSh7iyrbkMW6OUF1cvCyBdy4EPHVsqEmjlpsLtqW0+hAzvNW?=
 =?us-ascii?Q?WVbfdOjpd3PaOujFNkA2Uwac6e8i3tl1b8wjr5BiUYp6c5Fm+1Ypb4O3G++y?=
 =?us-ascii?Q?jbXhmbwJNLvFiwaSe/swKpxYiXAtfFpFstdUnqVbWvwpF5bO0dYqaTekpD99?=
 =?us-ascii?Q?LCvNrmM2iQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636a0464-50b8-4d97-14f7-08da3fd2a989
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:18:44.8236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/E1biq/NjL2zz/1494dgbf/cWWAgfn6rr6S5txm2FvQm2XDIrUJYPFJFe+G36K/i5C+GYtZ5iCpSp7AXaWTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v5: Re-base over changes earlier in the series.
v4: Re-base over changes earlier in the series.
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,7 @@
=20
 #include "iommu.h"
=20
+#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
 #include <asm/pt-contig-markers.h>
=20
 /* Given pfn and page table level, return pde index */
@@ -35,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
=20
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
                                                    unsigned long dfn,
-                                                   unsigned int level)
+                                                   unsigned int level,
+                                                   bool *free)
 {
     union amd_iommu_pte *table, *pte, old;
+    unsigned int idx =3D pfn_to_pde_idx(dfn, level);
=20
     table =3D map_domain_page(_mfn(l1_mfn));
-    pte =3D &table[pfn_to_pde_idx(dfn, level)];
+    pte =3D &table[idx];
     old =3D *pte;
=20
     write_atomic(&pte->raw, 0);
=20
+    *free =3D pt_update_contig_markers(&table->raw, idx, level, PTE_kind_n=
ull);
+
     unmap_domain_page(table);
=20
     return old;
@@ -87,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
     if ( !old.pr || old.next_level ||
          old.mfn !=3D next_mfn ||
          old.iw !=3D iw || old.ir !=3D ir )
+    {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
+                                 level, PTE_kind_leaf);
+    }
     else
         old.pr =3D false; /* signal "no change" to the caller */
=20
@@ -326,6 +335,9 @@ static int iommu_pde_from_dfn(struct dom
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
+            pt_update_contig_markers(&next_table_vaddr->raw,
+                                     pfn_to_pde_idx(dfn, level),
+                                     level, PTE_kind_table);
=20
             *flush_flags |=3D IOMMU_FLUSHF_modified;
         }
@@ -351,6 +363,9 @@ static int iommu_pde_from_dfn(struct dom
                 next_table_mfn =3D mfn_x(page_to_mfn(table));
                 set_iommu_pde_present(pde, next_table_mfn, next_level, tru=
e,
                                       true);
+                pt_update_contig_markers(&next_table_vaddr->raw,
+                                         pfn_to_pde_idx(dfn, level),
+                                         level, PTE_kind_table);
             }
             else /* should never reach here */
             {
@@ -487,8 +502,24 @@ int cf_check amd_iommu_unmap_page(
=20
     if ( pt_mfn )
     {
+        bool free;
+
         /* Mark PTE as 'page not present'. */
-        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
+        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+
+        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
+        {
+            struct page_info *pg =3D mfn_to_page(_mfn(pt_mfn));
+
+            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
+                                    flush_flags, false) )
+                BUG();
+            BUG_ON(!pt_mfn);
+
+            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+            *flush_flags |=3D IOMMU_FLUSHF_all;
+            iommu_queue_free_pgtable(hd, pg);
+        }
     }
=20
     spin_unlock(&hd->arch.mapping_lock);


