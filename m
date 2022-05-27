Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED38535F30
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338024.562793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2C-00073V-HQ; Fri, 27 May 2022 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338024.562793; Fri, 27 May 2022 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2C-0006w2-Ax; Fri, 27 May 2022 11:21:36 +0000
Received: by outflank-mailman (input) for mailman id 338024;
 Fri, 27 May 2022 11:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuY1H-0003mu-Du
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:20:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 093bed15-ddaf-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:20:38 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-_Hr4YX7tPrC7z9jcvVbOHQ-1; Fri, 27 May 2022 13:20:36 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:20:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:20:34 +0000
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
X-Inumbo-ID: 093bed15-ddaf-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2x2jaOdslxN8JhgKIhN6FboWhHnFSS8ihgO/7F5za20=;
	b=fLpea1hHIl1AJcC4LVowliNBazDORKJAdsOy54mAtsIHmPriUVBuNszJu9rFaKNPY54owF
	CFz5gWZ6AXLlvTreMC5i/FluRRQ8K4Jtu6dgcqbd4jqsqPr+DjmZTZZ3W+qvzf8ExYlvy6
	XPXHalRmoO1us6xIm2g8/NQTLDJa8hU=
X-MC-Unique: _Hr4YX7tPrC7z9jcvVbOHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAHBHXhTNzCGtLpbO3eN+wtb3Mnm9Cj+8D+hSKZCgiTL7HRaAM0Vc5Z4IMOirQSOooPs/wDX3hzbHbVK9RuBsliOvn1rdVzNxx54lPjvHK1oC94gazzbFU1xC8hcl1hB6XqoV5w1EdjouCQb/XyAaTJnxrAMJOffBUUuBnYxbe2WCtUVKf820Uj2ulHeL9sS0JnILW7Shcmvqjdb0O1EsQRFeVGCUuVkTwcCp2H43aVa1wffoav0pLT2PJY/i/xvnrxOf7zTFy+91Zi4fNm6QwW+2HWlXVd5ileOrYTswpVbkDjth/iU2SCgcLKgQsg5tAqSpgRjgPKRM3kIUh/d9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp5Lj3VLjBJ96BBU/R2oY/5qvo6N3bduCfhHn2y6m6c=;
 b=XLJ1LVsjEEexKlz50VwhNDkX8afhgaaAGwWSl2I718CP1BOsSMKdIAXF8rWcuqrAHmXQXpPTnIkRAqVoKk4+7PKfSZLycPlersChNANLQOVSmOOugemvBW/iK/W51eBrDWsJ0PgebZ3mX784bPL2yXHOoZ7mpUGHps8fcqDrRwvKaoZ2NbFHCZ1YdAwTC7n39XAk1nCoyO0a7yCZR1EsMzLUYypx2P+yrJTaLA51hnKN+dxfiOVTIWyfBT9MzJx9pHJM96oqPHQM8XdHieT6nmc8TLWaKKQhzR5G6k+tyPzGq73CQhid3sqDRIdzOBEToCIsoqOjra8pmlVEl1wtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bca508f6-7f90-1902-520f-a457c4f26eec@suse.com>
Date: Fri, 27 May 2022 13:20:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 13/15] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9dde31-d382-43e5-ad08-08da3fd2eb18
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB58318475B81305334C2618CCB3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bey/pb6DnrAQlAGYARc5xJHKLRV5109YobdiTwPu9u/wPNS2inPiE4zUJxfB/GLiaoyDYXG/PW0yzKJ3Ynt0J/9tel0ib7eWWWpR9lN4wVDre0wLsbSvLtJtNr+8p3taBqlhqtbZQqACWUXwllh/KdV8Yz3FM7qgeOFWX981jKijpS1Uk8Hm7Z/opkxt6s7G/1DXC6rSImlWXjzCNp4IDcdXu0vhVZfPVyPFkaZXS4iyzN1mWV2A57yDnARBTd2cSKz5i1SPnl5s86G16CMrbydrIvEXhiTrQCcVLmHV9gqWLOE3uvgqPZlBSA+UmyzfDjXCYnTT39papb8jISVAMKrGH5M+my8KiK9xa8hwgYEc4SLqN2J7JUrZCa609DwCW1RCWmAL/jxOkD0kraRO+E6a/4sQQ2xJ+HSuSeuVUEwsVs5jHW5agDJMH5C0R8yPH6DA6QrM2CeHlnl/l3FvjnplBOHGUSbJyOr8GCr5Q7hm6DLv2XHnyRmiFECL69uJki5FQeYK1mYms7cPFBgHvkXXtBvrwNvhMxdsd8XjNp37olc19ZH1EJfYumjz8p6CzbW++sDbPqjorw7GKXarneUqz+t5G6rcM9vqpX5E7s2zoMU9TKKG6sBY8SEIvmG3OO64dIE5tdyc3+Ta5OHJK7ySDqjIA02Gmna19+6EZICIFnwUGx1kh8m+wtdIcXHNdcTlGYP1d/ysLn8CXJqcc1Vf9dW7vgH7u7tJjXQqhwNu50vCIg9VYNXP0GJ10m8e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6T+WIkT4tAjs80URul34bfBsMP0InLY3OnpQ71chnkJiW3Z/6C6h0skI3vC/?=
 =?us-ascii?Q?uEhn/6/H1ulOxCbN784bXYJsnlDXKEDzweHFszCUAXUdzYBnrH598ZXmPghD?=
 =?us-ascii?Q?T3if9YO6zfZL9vDKuUT5yAq4QG3iKMbViIhP/djfIE2c/1miWtElKeWfyg5h?=
 =?us-ascii?Q?pZabIL6pY8qsYZjevjcwx+kg2oWNImHc0WXAzg2fZADL8fiiXC93TkDBB+30?=
 =?us-ascii?Q?pkowKTS+XiZBaT5hgZBkOIiXA1x5qt+U0+TpQaIbhupxKNmOLzwsYiSk5YvF?=
 =?us-ascii?Q?/CY7jE0f6rabzVtZ4ohsSt5JU91nHIusZ2V5GQOEmNNIu4hptJjaEV/AmsMH?=
 =?us-ascii?Q?0RwB1tdvRpi5AuLIViJ+9TEvh7AKRbsevwl+taH0L0pl4JtUBHnxPZPOwYx+?=
 =?us-ascii?Q?h3vZAiF6aupcdjeD2esJBpzVuP1/49h2f1xzIN6z2ACuX7HBs6UfF4zTP0GS?=
 =?us-ascii?Q?O6MXFOQtc1ewpnbtpWCgDMQtlEHwikkdtTT5cX6UUQ30WNyHsZT+T7REgROP?=
 =?us-ascii?Q?9apLJvsroyxFCWrJjfqjCCoDOZi01fIit/vLnd31ihxOk/BwAeCM4a8SYYt+?=
 =?us-ascii?Q?eLRj6V7xroWHJ4YZBtzxekquaPQThsmAg3VBZXJFBph1Ir9QEiPbHslpM5xV?=
 =?us-ascii?Q?Mch7a8fZXBo32aQQONUp1bnr13n6CVvOiM1yvd9KVF18S6c6AsfBV4eAvEfa?=
 =?us-ascii?Q?fuFWKyv0qn4fD2DrAujcsG45gNcq97US2lvRfBtel3fQJY+hsjWV69fnMTyR?=
 =?us-ascii?Q?Pjjv4loXfsH8sppTkc/SLVtFrF1afwnRKASvjV+7JxuX7FaHUsqPrjhPcnGf?=
 =?us-ascii?Q?XMQasHw7BImHlShZdjAM8V3mlF2uSt4UBiFWNyq19uk5m8LW9eWH2Phcrnln?=
 =?us-ascii?Q?hT4EPptbJ7WYF+78+Ccc56T9CXZTvLvN0LVQ3uFvhRx2NRj6+YEWMvqJ2Na+?=
 =?us-ascii?Q?yv+r2htA1rv4qiWL42fa11LEd3yI4GPRisayopmBrMZ6GzTBnKSABDmDhFeG?=
 =?us-ascii?Q?F3g3PR+75UX84/xdqjx2C7jnuVyBdyfQp2F9H5rdWmlA6mhvZrCnbIlTSdOF?=
 =?us-ascii?Q?29KSZjQvd/gSkkB5ocUgn4ArX+qCkfc0a4gpAa4gVQRC3YGdPID6V1pLGg6v?=
 =?us-ascii?Q?ZMTv1SyflF4RyD/zCW7muoyJMVfLmYPc4Ak+lTAq7D+KuOl6raxMOfosxsrc?=
 =?us-ascii?Q?LzxPalt+iurzSUsrrHb5OyFAht5rYOGQEVcBf8V3Zyfn2U3G0nGGigP04CjJ?=
 =?us-ascii?Q?gqfcwW5eE2zNS5z2BqOyE2AD8OfhsVgvo+2MSL/yJy6+SG7oqNE/1L0XumIW?=
 =?us-ascii?Q?JjrirT+WnXwR2pxZ2NlTIjS+7lnKSu7di83nI0uxypZ2R3hIKvWszwXPRXZW?=
 =?us-ascii?Q?qx0cUZSx7tFOay+MRKxdWcFfex9/F0TvJnEn9/glAzDPyaJDyd/eGCF/b3WU?=
 =?us-ascii?Q?ABQv0x2Nl3gKPQYkpEH91luL08ccqWzNGGlaZ980AqI5qitChEoieGerTB3+?=
 =?us-ascii?Q?yl3SM4mMs+2BMnQ71V4h7kHwzu4QrtQwYvu58OAOL5H8J5jdfortupyC20d2?=
 =?us-ascii?Q?u/SwjYF347rnSzgAthuBMSGn/hZ8yMdhdxTJQwtqMs5il4lPUeAr4WVZVLIc?=
 =?us-ascii?Q?DRtobHHhJqe1JJDcq7xiI8BBf/YfGwRD9jh0/izBd21Y1j2MefB2hFnbm+/A?=
 =?us-ascii?Q?otKtEJDiDFgtPFHfxWi0ekCgtYmaUksJoJGWFybAaqGyaXVyZIllc7Zbz96P?=
 =?us-ascii?Q?iP9IVq2vEw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9dde31-d382-43e5-ad08-08da3fd2eb18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:20:34.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5x7mui+CpkO441Nuq8AehptNj6Zbs5jF5qN+YisD+BHc7FT7RrbBq48LwbV0u237BSWFZSEysROwofqML03Htw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v3: New.

--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -125,4 +125,7 @@ PERFCOUNTER(realmode_exits,      "vmexit
=20
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
=20
+PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
+PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -345,6 +345,8 @@ static int iommu_pde_from_dfn(struct dom
                                      level, PTE_kind_table);
=20
             *flush_flags |=3D IOMMU_FLUSHF_modified;
+
+            perfc_incr(iommu_pt_shatters);
         }
=20
         /* Install lower level page table for non-present entries */
@@ -477,6 +479,7 @@ int cf_check amd_iommu_map_page(
                               flags & IOMMUF_readable, &contig);
         *flush_flags |=3D IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
=20
     spin_unlock(&hd->arch.mapping_lock);
@@ -543,6 +546,7 @@ int cf_check amd_iommu_unmap_page(
             clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
             *flush_flags |=3D IOMMU_FLUSHF_all;
             iommu_queue_free_pgtable(hd, pg);
+            perfc_incr(iommu_pt_coalesces);
         }
     }
=20
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -404,6 +404,8 @@ static uint64_t addr_to_dma_page_maddr(s
=20
                 if ( flush_flags )
                     *flush_flags |=3D IOMMU_FLUSHF_modified;
+
+                perfc_incr(iommu_pt_shatters);
             }
=20
             write_atomic(&pte->val, new_pte.val);
@@ -865,6 +867,7 @@ static int dma_pte_clear_one(struct doma
=20
         *flush_flags |=3D IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
=20
     spin_unlock(&hd->arch.mapping_lock);
@@ -2247,6 +2250,7 @@ static int __must_check cf_check intel_i
=20
         *flush_flags |=3D IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
=20
     spin_unlock(&hd->arch.mapping_lock);


