Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3124C17FB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277487.474007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu4F-0003vg-GA; Wed, 23 Feb 2022 16:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277487.474007; Wed, 23 Feb 2022 16:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu4F-0003t8-BO; Wed, 23 Feb 2022 16:00:39 +0000
Received: by outflank-mailman (input) for mailman id 277487;
 Wed, 23 Feb 2022 16:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu4D-000083-Pp
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:00:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd5c63a5-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 17:00:37 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-6uulGi0aMkiUDrCb_-IcGg-2; Wed, 23 Feb 2022 17:00:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7477.eurprd04.prod.outlook.com (2603:10a6:10:1a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 16:00:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:00:32 +0000
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
X-Inumbo-ID: bd5c63a5-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XB8iGCGqs8PHapYbAltMnTIf3L+ULvxt+u5ysAKSY4A=;
	b=npRSJUupycm1feeGAKEssoYMuQU5h2FHTxOnmnh1Rp8QUoFQ+dDCMIfGXsFglQx8MzbXb5
	Q/8o86C4yhPq3/uvDrHIAaMex7GE8K1Zdcs8dVePNSSor3mhurLFHg0/feS+zLfxfqTZlV
	20DQvRFnOnojASm/skBsW8bzlBAsfD0=
X-MC-Unique: 6uulGi0aMkiUDrCb_-IcGg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta0Q2CS5xPVH6PK5Dns7ddodwo/13k6SHOE816p2YYpHgdl5Rj5NtJjggzxB0omBryvVcr7PKBWJ6YfZqKcd+tOiTgQsNXPkjS+vVIskUra+Zbra5W7qMx1DITgoW4lAd5nvFnGNkTyBS++nnvcGkIoBNqJImMq1Ag6OSmdjsVWqJk7GKrUuNMjDqO98Rl3qdR8VFnqKgYZeX3oYEy4AV+R9DgG/CQdBahpx43detnIIPrKl7zyDe84Nii1yg4epcmIKuBtyd+Ti55U2QkCtwJTtwB2lxz9EzmthtW2PWKNlCS7yL34c81YXf7kAQAmlUDvbaWh1jO0nd6GvRPzSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB8iGCGqs8PHapYbAltMnTIf3L+ULvxt+u5ysAKSY4A=;
 b=lodkDBsp/t6haZR0x+LCuzXj9MkpqvAQjcqjLwRHzEcHr0MzpmwAwVguIAP0SL3BcaJbXqcF07FlHm5q6tvEnZDHj5ebhpqUg1Mfk/69BmB5D6Uth/7JCFOnNnsRXHo4SDS7QBN43nOFGiX8iP5H1AX1wGdP9c2Sxd6BgITGTidGMwhuAfB/jyH6nNXKKTNUubhejWFAgbmqev3ET6c1i4V0k6aok7LQFC+S7m1DeMSloiJkSBt67vE+5VrqMuo8+NG/Wc8Kh2DCZ+RbfesQTu3GMcmca1Zfy3QDh/ph+jeHZKnsF8Ps+/H/M9h2jz6ZWnfBqmE3JhKVS09n8gWzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c3d463d-80fa-cd19-22b6-6335fd69bd11@suse.com>
Date: Wed, 23 Feb 2022 17:00:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 05/14] x86/P2M: p2m_{alloc,free}_ptp() and
 p2m_alloc_table() are HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0362.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4457a6a9-e610-4491-2e56-08d9f6e59ef9
X-MS-TrafficTypeDiagnostic: DBAPR04MB7477:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB747725123F984C6034A7A409B33C9@DBAPR04MB7477.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zgOHG295iw2Sedcr4OJG3j/GbeAnEW96HDS0TNykkgjAULuWW6G+1OiNjqJggvC1CgqXF289e5ocKL0hfHKltyyUT78s9w7a298eUICryk7g8y7A+lkxxoWZQazDEHc+UCIGIdzXWLSc6mW/khESwJg/OmqSs9fMuFySAwwooCnytB7nvdOjpSv+2qWhqCnupbvgXgcUmcXwp/CL15/g1Tz40Wf45C2xi9nUJ4ibLMScW/YNoX7grY0/kTglKL5aDXCiilGW2XZybzK/tUWmTHHSA7XW1ztaEAGZfe1QMe4yrFjJ82hWgONrZKrhN15409kamaGy1S0Ljf9i/xdP+DxlwllbGiCWDF5St1TXSSVSEEDoYnJfxLhE7rpvqQhgGr4aCIuoT1+ZZPKPzymbOkaUmgdvE+YcYPX6siS2QqJ9Ln8mZDN0DfTixDRnCdovCSCms01Jg/OXO7tytxnj1dcbLaYQjlWERfGE3oFgszIzGq8CaTihzI8M57UYnOZrWWHGjRGl0btMGOzWsmCQonyNi3cWQGJ/amieqJsRi4sNvjCF11dECRVG9Mfn/m4vcklIXr83APZJQYEjZTXMUPSyI0KnaVdn/PkukWvXrwdCY9xxfnWHefmv0u1Xv/GYQxg5vaipYIEWRb+hlkJUzkjlNgE5KxqN25Xlbkg/KF+vl1SAdec4tU6gdTIgv42QAyqGxhn0UxVbhqorrA+dQfUFEiYGVLc7BmGAOSfqzL4VBYf2lLSXHNfrqTnVtRi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(2906002)(5660300002)(4326008)(36756003)(8676002)(38100700002)(8936002)(186003)(83380400001)(6486002)(26005)(2616005)(66556008)(66946007)(66476007)(6506007)(6916009)(316002)(31696002)(86362001)(54906003)(508600001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVlNGxxWUtlV3QxVzFhUVFGWFBMYlhrSWViMkpGZ1pvenR2WTgweHBEYlRG?=
 =?utf-8?B?QUZJSVcxMEVyOThpWS9LRURDQjBsbWFqWFh2L28ya2FLUnUzbGNPUCtYK2tC?=
 =?utf-8?B?dW8xUXczVnRUV3BQbmRFZUdxR3E1ZWVWc1cxMHA4aGZKN1hMaDQyTC8wSVEx?=
 =?utf-8?B?R2x0VEQ3emZsckJubGcwY0VQMDQxWGRMeHovRXlEMC80WTk1bVMxeXFzdnZN?=
 =?utf-8?B?bXNteE01dy90djlFQ2NpVjhRWGw3SGxhNGM0bWNwWDAyWHBEdEx3S1dSN3RO?=
 =?utf-8?B?MTZIQ0VSc3VhRUVzUnVXc3FJdU00aGx5VitxMmx6Smprbk92RStlUXlXbHNa?=
 =?utf-8?B?UG81Y3F6d3NPQ3N1eWNQdS9Mc1lQeWtsTm5iRnp4YXRMeDNic2dMU1VoOGVR?=
 =?utf-8?B?aERlaW5ZMlhlN1N0UTlHdW1zaTNraC9Uc1JlYzBKSVovSTlKblRyKzB5SnF5?=
 =?utf-8?B?bXZFQjZ2aUFsNjdEc1FzN2xNb1FKblUvMjNVZ0lJNTRMUk5WSE1FYlpiVDZ2?=
 =?utf-8?B?YmhkLzBvbzcxYWFXQkpEQ016WVB0OUswMW51aHJqdnVjTENpa3l5c3FkdWFW?=
 =?utf-8?B?ZkNCM01tNUlHNnVBYmsza3kwb2FxS3N0TlRPUlFoTFY1c2pNNnRwa1RXcjMr?=
 =?utf-8?B?cW1SSDVYOU9ia0NqbFR0ZWpWQmhSbjhSNmlneTFpUEJkUm1rSlEyR1NiYnk1?=
 =?utf-8?B?aHZ1M2k1TEl2WXhIbVJEUjUwbzVsUW9PdmlQaGt1Wm5CdEtSMm5FclhLOHYy?=
 =?utf-8?B?azVraG9Bbmc0d2owL1ZoNUk4a1VrWGU1RFNSUjhRUUhwSmlMNFFuV2RXdXNk?=
 =?utf-8?B?TmZxcTN4V21MTEIybVNTaTVYQStmZHRvU1pmc2ZQZ3F1R1ZIRUpHajA3RTZv?=
 =?utf-8?B?U1kxUEcvSmlXbVQ3RVdab0lxU0RoQXBvVTlMZ3B3bTBhVDJVbFNyaXN5UmZ3?=
 =?utf-8?B?L3JDVkZKVVo2TzVYTjMxTmF3VngvcFZCZzdGVklMblFMNWxiRXIzNHlaNTBZ?=
 =?utf-8?B?UzhXc2o3b084elMzZGN4cEoxMTd6T2RSTG0weVc0MVhEbEQ2Z0hPWHE0Mno2?=
 =?utf-8?B?RVQrYlNkRmFTOXM4OVk5N242VE5BU0FIdm8rZXcyL0JWNHdxS2FPSFhTWTla?=
 =?utf-8?B?VjJ2OUpKVlRwSHZNYjF0Qm1wVk9JQ3hXL3VobXlKZWtKbnludURJQmRoeGE2?=
 =?utf-8?B?TllMbWlOaU5UZ0E2NEpqMVJVc3FSRFRxU0NVbS9MQXdlMHFGellFSjBnWDFa?=
 =?utf-8?B?VUZIRjVlK2hjZ0p0anFYTEw2a3EyckFYN01jWTlaRDlSZmgzd2xGQ3lDckRq?=
 =?utf-8?B?MEh6a3dJMG9KYUd6ekFzZk5sMmZpZURDV0xUM2QrdVlpNEVDbnMxeVFQb0Qx?=
 =?utf-8?B?VVAvMytmVllhWTNhNXhqb0xpMm1SZDloRFpZNEM1T21KazVZZVlTVnhNZFRR?=
 =?utf-8?B?NUl1dml1QzQ0bngxNHRkcGNla3ZvSzFVc1g5djI5TEFOU043L1RIYUIvOG5P?=
 =?utf-8?B?SkZndFROc2ViVjBYNXBNd2pMbW02UUJsZ0tSR1U1d0dRZmV6SkpJYW9HNm9i?=
 =?utf-8?B?TmhxYVNncTZwelVVdHViSGdXcTN3YTNWbVdxV2tpMG4ySHgvQnZNQVAyTUpz?=
 =?utf-8?B?ZnpLRkg3UFl1VWpraTk2ZGN4UkQ5UkFORXBoWlpXOHJWZVFYcW1GeGorSHpX?=
 =?utf-8?B?dW91ZHY4WFRwUFdtZGh4V1dxek1NaVhEeVB4RmlKWlQ5TVBqTG9PdUNKTXJl?=
 =?utf-8?B?c01ycDZBclhsTjk0dVZmVDQ4YmJkTnZiQTk4VzVoZUNUKzBXc2ZzMGlKc0R1?=
 =?utf-8?B?bjI2bVptVFJpWUZjSzRKNkhMZWd6TFdRckkrWGhtSkg4MFZrVFB5UWIrMlRH?=
 =?utf-8?B?RGRYTHVHQUJhTHk2UWdVS2RVT0dwdUd3NlJDcjdpckRsczNyVkZtWVkyNk1M?=
 =?utf-8?B?bjdST1R6RVNXRkdzQkhxSVZBWHMvNkFsMmJZZlNubHFrN1lpTW04YnZ1RHZT?=
 =?utf-8?B?V3ZwUTdTcVBNL2JyVGZDZ0hJUWVBZkNIZlpqQ3A0WFJqeURYaFNIVmJKM3VN?=
 =?utf-8?B?SG15enkwUFpxSExhN0VDM1hCUTYvODJyVm1LMDhsQXNscWgrQzJWTnBjMHcv?=
 =?utf-8?B?ci9KRkI2SGY1citSV1pwUkVzY3FZVXlBY3VJMTZqU01XTFk0OGxTWSs3R2RE?=
 =?utf-8?Q?xrJjOCRWxJ7S1ILnDw3NCuE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4457a6a9-e610-4491-2e56-08d9f6e59ef9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:00:32.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKRP3niiXXK+JF9FbjeqmfxEA4ZiN7TmuEDxBj1Z+Zg2SA0bofQvwy0krljCPVlGb8FOkBFv6IEH75SUinCRyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7477

This also includes the two p2m related fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Re-base.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -93,7 +93,9 @@ static int p2m_initialise(struct domain
     int ret = 0;
 
     mm_rwlock_init(&p2m->lock);
+#ifdef CONFIG_HVM
     INIT_PAGE_LIST_HEAD(&p2m->pages);
+#endif
 
     p2m->domain = d;
     p2m->default_access = p2m_access_rwx;
@@ -627,6 +629,7 @@ struct page_info *p2m_get_page_from_gfn(
 }
 
 #ifdef CONFIG_HVM
+
 /* Returns: 0 for success, -errno for failure */
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
@@ -666,7 +669,6 @@ int p2m_set_entry(struct p2m_domain *p2m
 
     return rc;
 }
-#endif
 
 mfn_t p2m_alloc_ptp(struct p2m_domain *p2m, unsigned int level)
 {
@@ -745,6 +747,8 @@ int p2m_alloc_table(struct p2m_domain *p
     return 0;
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * hvm fixme: when adding support for pvh non-hardware domains, this path must
  * cleanup any foreign p2m types (release refcnts on them).
@@ -753,7 +757,9 @@ void p2m_teardown(struct p2m_domain *p2m
 /* Return all the p2m pages to Xen.
  * We know we don't have any extra mappings to these pages */
 {
+#ifdef CONFIG_HVM
     struct page_info *pg;
+#endif
     struct domain *d;
 
     if (p2m == NULL)
@@ -762,11 +768,16 @@ void p2m_teardown(struct p2m_domain *p2m
     d = p2m->domain;
 
     p2m_lock(p2m);
+
     ASSERT(atomic_read(&d->shr_pages) == 0);
+
+#ifdef CONFIG_HVM
     p2m->phys_table = pagetable_null();
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
         d->arch.paging.free_page(d, pg);
+#endif
+
     p2m_unlock(p2m);
 }
 
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2700,8 +2700,10 @@ int shadow_enable(struct domain *d, u32
  out_locked:
     paging_unlock(d);
  out_unlocked:
+#ifdef CONFIG_HVM
     if ( rv != 0 && !pagetable_is_null(p2m_get_pagetable(p2m)) )
         p2m_teardown(p2m);
+#endif
     if ( rv != 0 && pg != NULL )
     {
         pg->count_info &= ~PGC_count_mask;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -370,6 +370,7 @@ static uint64_t domain_pgd_maddr(struct
 
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
 
+#ifdef CONFIG_HVM
     if ( iommu_use_hap_pt(d) )
     {
         pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
@@ -377,6 +378,7 @@ static uint64_t domain_pgd_maddr(struct
         pgd_maddr = pagetable_get_paddr(pgt);
     }
     else
+#endif
     {
         if ( !hd->arch.vtd.pgd_maddr )
         {
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -208,9 +208,6 @@ struct p2m_domain {
     /* Lock that protects updates to the p2m */
     mm_rwlock_t           lock;
 
-    /* Shadow translated domain: p2m mapping */
-    pagetable_t        phys_table;
-
     /*
      * Same as a domain's dirty_cpumask but limited to
      * this p2m and those physical cpus whose vcpu's are in
@@ -229,9 +226,6 @@ struct p2m_domain {
      */
     p2m_access_t default_access;
 
-    /* Pages used to construct the p2m */
-    struct page_list_head pages;
-
     /* Host p2m: Log-dirty ranges registered for the domain. */
     struct rangeset   *logdirty_ranges;
 
@@ -239,6 +233,12 @@ struct p2m_domain {
     bool               global_logdirty;
 
 #ifdef CONFIG_HVM
+    /* Translated domain: p2m mapping */
+    pagetable_t        phys_table;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
     /* Alternate p2m: count of vcpu's currently using this p2m. */
     atomic_t           active_vcpus;
 


