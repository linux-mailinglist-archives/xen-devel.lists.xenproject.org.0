Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAD5535F23
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337996.562742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXzr-00040i-MB; Fri, 27 May 2022 11:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337996.562742; Fri, 27 May 2022 11:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXzr-0003xu-Ic; Fri, 27 May 2022 11:19:11 +0000
Received: by outflank-mailman (input) for mailman id 337996;
 Fri, 27 May 2022 11:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXzp-0003Q5-LU
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:19:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39886e6-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:19:08 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-VrqiV7sxN8aZYJhd7ghbZw-1; Fri, 27 May 2022 13:19:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:19:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:19:06 +0000
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
X-Inumbo-ID: d39886e6-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvZXvUCO2HfiLDgA+1pEGxziHFCsDEOEbqjxz7fQFbQ=;
	b=dSXAWTASJpjEMXgq9T2h3PHFHKDrHbxZGTiC4hKEmyHvNGeDCOQOFIdPLYD5xdo1ujSx0z
	gOKdUfty0v0xm+cL8LKfWOwp9u/rtX3dtg1Acry5+YOYd+URky05zyq52TImYlfsITyTid
	CG+mVRFHVSI9efGlB7TjoeUKXSEQsHU=
X-MC-Unique: VrqiV7sxN8aZYJhd7ghbZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTiudUoFpZDE0DFCI96KtvMkY11r5WmBm4yroTSZEDNlg+vO+WqCbQE3UNjsZFVFS9X1tHJv3r9FL9+vQR2xgyu4qY701d+KIyaD+YTOZkZpFJpmoSpi5SJHn1QoyznSvSTT4Oq23iImmv9NbeCYq20SbMfyV9G073iWpUsK4oMl1xUozaggp0AeMQShsIqtMUBISHPtmYbBeUBQa+T2zsmVkOnMx9NdmX0SwtOkYTYwDz7XLVXLqnzlxFsw/HOpi+gHUBaxyFF5Oye0EBnzVDuu5/fNsKi6mSC6AlB5KLiQEGUaSWjVOK1pED2HLxa43G/refx6nR6ABn4QnMtl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp73oXP7vi27KdOxrBUVp9LMt+daZO3hrpdzDy50sao=;
 b=ZEPXErJ2tJB753rl9dkuc+dSj6q3BB3e4aTcjMXTJbuPb/5UC2mHLL/1nUaUqf0m42XVIPElYqyuZoJj9449Fjcsb9T69fqkmb3Gl6RYyL+SSaARRPKnqma9F2mXnP9VB8qSj9bre0CUvc8+tmqlG0rS7VBNVtx3Cv+PuSe6IpkrGGOFEhkCQwM6aPgpxkMAME/ATApVMjgS6rV7IEwJnBk+8yA2N5IpVqKOoYWNYQP1ngWDKYkK1ez3b2Ff6y4g3bvLqLNZgn6ZzGz++VsePbzr/8Ukgv9t8NmuSb0TBs0kQnPWx3MxmqnOHgqgPT0sSWZKQjoskO+1KAzF1lBJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b634ac87-775a-9685-f6af-89f51d39d46d@suse.com>
Date: Fri, 27 May 2022 13:19:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 10/15] VT-d: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0054.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 214a9375-7521-48c5-e73c-08da3fd2b63c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831A6E46474FBC10E5F1B1FB3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8h3UrV/HMqPmEJJSV6VQTVY0PiN3EUfjhstZKsSjA7n/RbwvPD418RcrOEw+UqN+tT4NkFXdUS1JI2fzwOwh/8FYHXqoZ1C1hjqZLyNco9+azXzHIVNEq/JOOK2fxBZwvxixLQkYkPzFvV0MD/5WTEEUxKqqPcAWL6lhtYMqYvxxdhhDjIuMN7z+sbrcY7ndITjBhkbc0ilJGHrqMg5zZFWoJqsCEHxX7tiZ+oXNjGBl5PNe/fv1TezxN4/EmqRsY4VeAKHIdBSAt6D1/0S9oCkcG6vDPOO7PufVMM6bfou3hP2nBM5L980SJFkWn9IDdD5v/Cq+0r5XViQ1lkHP0Xkigz7jtlbXc3dpM9lgFjEcwrOub3sd639t2WohOg1SHaIP52DNAsoERDjK3p+Y37P5rlein8vHVo+F278JYAFdJ4U6dVee0AOAAc6WKtJhRRAzHFcXlEKdPKceFAa2w+3z8SevWOPShtYqM8g1yYMlXdhNQorZwyVPTz+x8aqFg971o7ZwJ4hWLYGJ+bss0+ewDgJoTZRfVfMjefPR16LPKPe4YrQwj1i4Hna9Isf7S32DbvKLhVdkLYpQGdXto6VQZjyWi25MRw/k+lg0dk7n8q9N1qkTmGpyEQs7UTrMy1qKXQ7Ygn/pfnDQvxCIGimkMu9R4ZAnsbjc340ZYybf3Q8LsMM1YCRZeoewtqyGWpnM3QzN9xV2dQRuhqJBtIJKY/pUvhjhIqJ5Qc6W64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IngeTXIAHkSvlcCwf4TFlFFobT9cos0+tPO+itz50RXk0kPRQ3u0ubTGR7g0?=
 =?us-ascii?Q?cOk/OX2WGNC0gIGPEa8i+Pp7B6xAWJAeAIVPHLD5WifL4HhyUbK1bHKBw5Cj?=
 =?us-ascii?Q?Jr3D5K+g83koXjr0MJsKPsBaT/37uKeNK9LSfwtY8mVJmiRBqVwqWhzCEU/O?=
 =?us-ascii?Q?XqVsiGEgIe/2CrMkzik2gDM8tGq8SK8IoDv8KGi/+dz45jzZcksHqtpc/pKv?=
 =?us-ascii?Q?H4uTHEuFi15vOAnzpfwDdOc0yntww8Okd+OXaZPW5SVQo9JAJ9/Juya7VVCe?=
 =?us-ascii?Q?6OPDe8fmJEEfQViavwdJuapVcAjNIQyLx/dXXW76MAYiGDv6TRKXk4BRbc/G?=
 =?us-ascii?Q?ebyl4/39jeEjXyw0uttJqv03k7rqoAh9f4uzgV0PcEhwD63a0oT62PL0DUwQ?=
 =?us-ascii?Q?Lr/EVJqstpNHTB/eWuHwSGR3VHviXaUiUWb1FohKxetpbrLloh0u+dlw1yK0?=
 =?us-ascii?Q?yMJ1SUDCgI5qmXV27XnyFpdMojaqby0XYZ/kkPXm6vujsTFur3OHyAq6D9dM?=
 =?us-ascii?Q?WQ5yNiNanOHjqvYuEZJONOaQm5TEOpW3r4AFUpsCMj2a8S/lHM12nhPtCjpM?=
 =?us-ascii?Q?HBXqNnmpPqnnbSyz8zkkok1/4JdmfVc2sGM7kYfFyNcaCHgRHgziB3tSdOPS?=
 =?us-ascii?Q?yIyC5rQ5zXZYzbpdn42Bh8AhsV1MCMqOgZmc4lGmTmOfJ9Bry5VdqJWmZz2B?=
 =?us-ascii?Q?yDL51P4aUgYthqM3GMudaNIpRJQol11YL+nibYVNTkSniyJP89TbqbtLJHgq?=
 =?us-ascii?Q?P8XWSHuDaABMefcOvqO9uqkiynGokupyYVca7R8znP264LQBKL8Da6OpMei0?=
 =?us-ascii?Q?gkbjhIi/B8ilhKPcDGvowfSDYaXOHZaoj1U9oMi0eWL0rpYLGQ27VFiYZ4pY?=
 =?us-ascii?Q?IdLY/SMOqoSOqsx2ecjy93288t7s1+2Vu02NmNDnf1GpsajCkdXOXV3DBzfz?=
 =?us-ascii?Q?VJsizGYSrOx+OXLKyROD9Uhu9rc02z+S5O2f/xaEKqbwjZjBwVEitHu9QWMN?=
 =?us-ascii?Q?yPjJsfgEZkJ+ADNFvbmEQ/e7Fx7WXGGi2eZ5G9EGqNulVbmxEppRSUIUc3yF?=
 =?us-ascii?Q?RdUW36FyRiwjC88MYh4zgrNJmn9DoruT0XuKRPVLfejVYjOKW6K1yXmMhtTc?=
 =?us-ascii?Q?KYyOK5AaTKPRW1qcE6MDXI/MC4a297TJJNctPjolOD4gz+IvPhYmqORICt6E?=
 =?us-ascii?Q?eJVkfYmqCS9jX3Goymvyqv5CXjFy1+MX8IphjBs1oK5qoHYANKcb7OdIWy/o?=
 =?us-ascii?Q?qrvDPiS2QSXmtuMff+hOLrwY5w4y/Px0j3wDi27zM0hvPQm+etKoWImmKnq/?=
 =?us-ascii?Q?Y+PQKgwm6L+BQqBR6Vadc/RC6A19Xi3chvp6VmiyIbuuZXkRHemyFVI1F0I1?=
 =?us-ascii?Q?hqjunJlTVNs2joqTEuxqBAKtEYUzFgdOzMcxwPR0I9yhe7+RDLNRLFlDP7UW?=
 =?us-ascii?Q?WfU5hBZRybZDTTSfHA3Mledz5oH7dzGmc1lnKwzDzy8p2X3i3OZqJ7Ye3+nE?=
 =?us-ascii?Q?wDMEqgjF6J8ChdOCKMIBR8bUTq3+z3QC9leuDJ/eYqCNXf1Z4e8aNfW9qC/a?=
 =?us-ascii?Q?KIKSj2OmIyVFL6sBKgURZtvMw+Tzroe6rC6w8EcigdKdrnwqPcioXc1MC3hX?=
 =?us-ascii?Q?7qBsp3uzewzoza1KSSk9dBiuiosxiE+NOcAHHk+Br39iqkSEmwVVW31l7Zsa?=
 =?us-ascii?Q?rAcJFBSNVTJHFdug0BrzbixwIYJ/fHwggzg3jAoFYjC7ndNzTSEKg8zI56AP?=
 =?us-ascii?Q?q5rZDm8tZQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214a9375-7521-48c5-e73c-08da3fd2b63c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:19:06.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT9xBbFubXtuG9LNEJnHd5u8sCtEIUqHhGnmqKl2nLJrFMHf+ZNIpSPb6/dkaZLf3FnSArP/YkXv2JPeEhUjyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Note further that while pt_update_contig_markers() updates perhaps
several PTEs within the table, since these are changes to "avail" bits
only I do not think that cache flushing would be needed afterwards. Such
cache flushing (of entire pages, unless adding yet more logic to me more
selective) would be quite noticable performance-wise (very prominent
during Dom0 boot).

Also note that cache sync-ing is likely more strict than necessary. This
is both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v4: Re-base over changes earlier in the series.
v3: Properly bound loop. Re-base over changes earlier in the series.
v2: New.
---
The hang during boot on my Latitude E6410 (see the respective code
comment) was pretty close after iommu_enable_translation(). No errors,
no watchdog would kick in, just sometimes the first few pixel lines of
the next log message's (XEN) prefix would have made it out to the screen
(and there's no serial there). It's been a lot of experimenting until I
figured the workaround (which I consider ugly, but halfway acceptable).
I've been trying hard to make sure the workaround wouldn't be masking a
real issue, yet I'm still wary of it possibly doing so ... My best guess
at this point is that on these old IOMMUs the ignored bits 52...61
aren't really ignored for present entries, but also aren't "reserved"
enough to trigger faults. This guess is from having tried to set other
bits in this range (unconditionally, and with the workaround here in
place), which yielded the same behavior.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -43,6 +43,9 @@
 #include "vtd.h"
 #include "../ats.h"
=20
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d, pgd_maddr) ((d) =3D=3D dom_io && !(pgd_maddr))
 #define DEVICE_DOMID(d, pdev) ((d) !=3D dom_io ? (d)->domain_id \
@@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
=20
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            pt_update_contig_markers(&parent->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_table);
         }
=20
         if ( --level =3D=3D target )
@@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
=20
     old =3D *pte;
     dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg =3D maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flush_fla=
gs,
+                                          false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page =3D map_vtd_domain_page(pg_maddr);
+        pte =3D &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |=3D IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
=20
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
=20
     unmap_vtd_domain_page(page);
=20
@@ -2185,8 +2213,21 @@ static int __must_check cf_check intel_i
     }
=20
     *pte =3D new;
-
     iommu_sync_cache(pte, sizeof(struct dma_pte));
+
+    /*
+     * While the (ab)use of PTE_kind_table here allows to save some work i=
n
+     * the function, the main motivation for it is that it avoids a so far
+     * unexplained hang during boot (while preparing Dom0) on a Westmere
+     * based laptop.
+     */
+    pt_update_contig_markers(&page->val,
+                             address_level_offset(dfn_to_daddr(dfn), level=
),
+                             level,
+                             (hd->platform_ops->page_sizes &
+                              (1UL << level_to_offset_bits(level + 1))
+                              ? PTE_kind_leaf : PTE_kind_table));
+
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
=20


