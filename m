Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B04C1818
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277542.474084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu9E-0008GJ-T7; Wed, 23 Feb 2022 16:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277542.474084; Wed, 23 Feb 2022 16:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu9E-0008Dz-Pl; Wed, 23 Feb 2022 16:05:48 +0000
Received: by outflank-mailman (input) for mailman id 277542;
 Wed, 23 Feb 2022 16:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu9D-0008Dl-Qp
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:05:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76017dca-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:05:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-aLZRpbzcPm-R-iu9EkuZDQ-1; Wed, 23 Feb 2022 17:05:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3803.eurprd04.prod.outlook.com (2603:10a6:8:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 23 Feb
 2022 16:05:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:05:43 +0000
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
X-Inumbo-ID: 76017dca-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KYg7EGIpsPMfdCGhpfXXPnI+8C1a2jFdZUo/dNcjvI=;
	b=UdaPDpzPKhozyJIW2OBIUqw+4pt5NQLgJjXMjRDy1LORQyEU5IUOOToN+gW5fDi1Xfutxr
	5jyAmfboeqYsVuZWuxaqIrBW5vhWjqQ/nZrHQ8j8BgK6oWCKEQVyD88Y+2Ff2dkzo1+eHf
	Wi8LWsbQSHN6evMm8LSUHs0M3cMC7lk=
X-MC-Unique: aLZRpbzcPm-R-iu9EkuZDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNz5jjzW1OhytF9f2xN0YITudhK29hMyD0g4CBatFM3ux5Wi8JLbRl1fqODTN4w6wz+9th/9vjg2Ty0uP7+kWMont1ZOqABatZjJabcaNLE0z6ByDcSk/4G88zgIYepj3FGwnE4uEo8cxhld1jOM2PziC3QXq0LsiUOnIn3CuFSWRd0yrtxI1BRTJsNW6Oz6G/eDcKY48O+PGGDk2Rchp5dZDwxbgAdzWvwOkLSHC1nyY1Vl094rKaFEQWnR6f/8YazyyRVuGiP4TNxKzuEcuUu/rAOC/xQfukeobK6bM0WaehFRqbzYeIhGj9flLxXDp+OGhBu1WKl81B7/cok4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KYg7EGIpsPMfdCGhpfXXPnI+8C1a2jFdZUo/dNcjvI=;
 b=Wj5z+y3xarQOXN9BLfIcEie3N6ZzT56TE2Ora/Et7o7aCalvGVRVkGNtPZe2FUPLDLvKLrfh/bspFzhTSET6bOwUIWtXfa94WuAwgwNORyjlQ0mDsyIDx0eIlr+dfl4kdhtufDvAxB+LURyLknRS1IeCK1R0n1JRA8IQf9P6v57o6XHkbDKAmMATiOzpyOIa4lFSu+Df62GVcHtstClAtHPprAtKp9XJu2b70cBG4+pV5x5olmjRooKiRkToa5kfR5xXvsSrbromP6EsiXWGEG5ZtYIl5GWAqaM8XGuvvZGe7sRfq6B/KW2JgYs5GEJAVii/Q/OlBqMKXhHO4OycNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2902c6d-d432-5800-9da0-055ed390250c@suse.com>
Date: Wed, 23 Feb 2022 17:05:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 12/14] paged_pages field is MEM_PAGING-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0251.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ff817d-7971-4327-2449-08d9f6e65861
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3803:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB380301746692426D1C1013BCB33C9@DB3PR0402MB3803.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pVWyEOGGrTZ2tSpsOHz0mMAuDpkyRIXV2wOEaBPLi3EVORr69LZiGcP0WPOHzXSRYj+c6lT8hxgrmTlpd/hyFqU0SUsUnvaGdS3ND+35FdOwiCIdKRsJh7pjUM8SdGKvU7hWuPJdtB4/SyL0Y4pQ0aQSqDjHI478oToo0JAsH370/l0rfNRrZDeOcDBAWEkxbu1hkuI4ORONffl59YXzb3yQ6SP95C9dkzJzSqXcagMqm4kA3cXehcROB4QEpeFtz8lBVQk20ef8zlZOPbsWOggUJC4pZqkN31ocJWVvty/jaXIVdXEbWGg1HjnlsSSb6tXOZgCYt+afnULyezpRvvW9iw5tloTctRPCcPesonRMfrSlL+OHIDdKYBsNMJMGWp1HaJW9Pcn3KYqw2Oj2MyZ/FB0d37jjBjhhforBtLC9WM4deY1bCp6YTBbIMflAQ8y9/M7ACSXFyjot8JczX7VaYPIrfxHfJ84euXw54LbEVTpo8HbH8M3+WctwCG59lX5o8ZH5YoA4Q4iY77uniiqmOd6CCLKnFJJzACYUkTcITuNr+P2Fs/QRtTy/JV4zDvE6dYk5lpsHiIsU70ccQSIo3ecvZEvsdOrTv9kBt6ocEUv7BkrV2e7UVEDKuszLyRCe1fuKtbx5fEu+os7ivReFsHHHEsdsjoimlkoE6z8i0aBUwFbZR52XXkFSZ6E5Srxy4D8pSo11uakwTc1lhKRX1x+rJUIpIjx0cRJw3qdfDTpfUFQAIHSVlr9mlFSG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66476007)(8676002)(6916009)(6506007)(31686004)(86362001)(8936002)(31696002)(6486002)(316002)(66556008)(508600001)(66946007)(26005)(5660300002)(36756003)(4326008)(38100700002)(186003)(2906002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk1PZmRYeWZweUZaZWd6ZEdnYjkvQmtvVUl1STNPU3BDd3ZoQmdQSjBEVk00?=
 =?utf-8?B?dGFwYlcrdWYrb2wvT3k5N3lWdnNiLzJnZy9kOHdLb09POTdlbWJ0Z0RVZXQ0?=
 =?utf-8?B?TSttS1VYd3VZQXRFS3c0cHYvMmhwdEJ1MVJ4dFhPRndFSlAzS2dINU5xMGV5?=
 =?utf-8?B?UUhPRDlOQlVWcVFNTGJhYm8xVUxQZXJCK0ZKNVh0S05Oc2M5UnZpNXhXZVlo?=
 =?utf-8?B?WE1PemJQSmNMdmJqWkJLeTJOWC96Wkl6ZGlrVDlKUkJ0dm5TZE8zNldnSEd5?=
 =?utf-8?B?R0R3MDJjNFljajBueWZjL1I1bjlmMW92WjdOTWREci94UHF0blE2bzdtMERY?=
 =?utf-8?B?dnFENm9tTFNkMXY3TFBhV0RLT3BWbGR5dUY5WmE3dVQxc3pIbXl1WnJ3S0hi?=
 =?utf-8?B?ckRESGxKZURLYm1oL3lSMzJMc1VlUU9NUVFXM1hQbjZLTEMxSG4xeWhpUkkv?=
 =?utf-8?B?dGljWnhMNzlXbmZBYTd2dStuOVkySGRPelZyYmlNQmJLK1N5ZWttTWNzWkZZ?=
 =?utf-8?B?eFJhNGNoc2JQZndZN056eGVOTjBoMFl4TUl3TkowTkZ2RFl5UnF5citSYXVt?=
 =?utf-8?B?WndKY2lMck1VSDFjVlYrZmtEQldQcVZCMXVocWNqcFBtTVhQSnV0cTJVeVJ1?=
 =?utf-8?B?TjVtM2dPU1UzY1RBMUZoYmpaTGY5YTFGdFRTWWVxZE1iNXVJR3l6NjZqbnkv?=
 =?utf-8?B?ZTdlaFkwTTBlNjRRSzVJSjE3czFORy9wWDRzWkFxNW9kdUh6M2V2ZnE0bDB5?=
 =?utf-8?B?cWtNQ0piNC80UHdVWks3bXQ1N0FzZzAvUTNsOTd0Z0QrbHo0VUxZeXlhMDZv?=
 =?utf-8?B?UHFWeU5xdjhmMWE2bHR1UW5LZnVGV29IMThjV1N1VG9Zd1ZiK2FHRmVxQXB1?=
 =?utf-8?B?L3R4QVdqYU83Ymc4L1JxSFVxa1E4Wk5iTlVBSzlkTE9ic09QY1BXR2MxdHJ2?=
 =?utf-8?B?YU5UNnZZTkhMZnRvR2NnS0RvTDh1NnZTU0FqRml3b0c0ZHhTSVhxUnNrTXF4?=
 =?utf-8?B?L1gvQlJaTHkvbXQxUjdtcWJESC9XZGVnLzNWeGhoRThqNmgva0gwcWE4a21H?=
 =?utf-8?B?ck1lK2FBcGpZa2pRbEx4di9qS0Z6TUNXVnpsbkJSQkd2aERnbjhEbnJtSDZD?=
 =?utf-8?B?Y3l1alNIbG5mOEUxRzY1WWthbjlHSURGMnpKcFI5L2Ura0kvY1d0bjNQOTho?=
 =?utf-8?B?emIweit3emxJN3Awd2M1UVoxTG9ZSEUvcDc4VGxhZnFKQ01xUVFZN0M4MXZp?=
 =?utf-8?B?ckNUUmJGVUxTWDJDWlRvMDc3SmVhNVBqd2Z3OHArUU5FZ0V2U2VhOTBreTlo?=
 =?utf-8?B?cWViSDc3Vkh0Rm5zWFNkSjArNWdUN0VUUzU0YndsTHlQSi9obWRRZkVKTVBT?=
 =?utf-8?B?d0h6bEp2MU5VdTY5ZEJRa0d5ZjJZS01NQWdSRjFGYzhLdzdacEtuRDNuWlVF?=
 =?utf-8?B?T0k5ZjRXa0huR0xORHhNQzRncW14Q01MUXBOUkpDVWhBVFN5cGUrWHJ5NEw5?=
 =?utf-8?B?VUJDdmljeWpNUCttVVpCYVQrVDBkaFhEOFdJOG04ZnAvSDVDY21uVXl0MEk4?=
 =?utf-8?B?THI2OGZaSzNrUFZEeGdsTkhHdUxzd3IyMnhrUUxsbHNVOW5xL214dERuT2JP?=
 =?utf-8?B?REY5ZkNmTnNuVjl0SFF3U0kwckh2ZnFib0pYejVGenVzY3Mzdk9qRDJKWmZF?=
 =?utf-8?B?YXEzV0E3eWlYeDJ4ekhYeVFCaWdFZy9KTzdaV01qNWpoa2pWY2piQzd2UVlq?=
 =?utf-8?B?Y3ZmQm5hSkNkTmk3eU1zMXhzRkxSdHFySXlQaFJEQjcwUm1pTmpnNlBWaVpW?=
 =?utf-8?B?Wm1IL0xaL0lUd1FmeG85L0JmYnNpRkd5SS9odllJZ01wWkpoVC9OVkhlSVhy?=
 =?utf-8?B?VUpERFRGZjV0cEJOOVNqNGxUY0JtMVBkbVZXeGx5YkhhRTlEYTEwQU8xZjlm?=
 =?utf-8?B?ZngzQnlpRi95eVViRzRVSzFPNU5odXJ5UWhzcUthUDZRUFEwR01wTDV4RC9p?=
 =?utf-8?B?dlUrVkdRaCt6dnJ6NHVlQWRoQzhDL2t1TEZiVmNFdC9welF3VFlGL3Y5eTVJ?=
 =?utf-8?B?bGpsYm1NS1F6b1NjT2lXZkUzelJRLzBJSXlMMmxCRklqaHd3dU9MZnNyRzFL?=
 =?utf-8?B?dmxSZDFxUk1QN3NRMjM5VXNRMGpnM1diQm5PVW1iNE1IdlQ5SVBDUG1rbWtl?=
 =?utf-8?Q?sGstDxuNTTjox+DEaawb3dU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ff817d-7971-4327-2449-08d9f6e65861
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:05:43.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfBDFdq3wXdxM63wyfIfXILJ18GdRjL7NxradvD5OYMHcoV6xlevPHrCQGSQm4+W50oT37yU9eu5qtcP3Ir3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3803

Conditionalize it and its uses accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Re-base (drop clearing of field in getdomaininfo()).
---
I was on the edge of introducing a helper for
atomic_read(&d->paged_pages) but decided against because of
dump_domains() not being able to use it sensibly (I really want to omit
the output field altogether there when !MEM_PAGING).

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1213,6 +1213,7 @@ int add_to_physmap(struct domain *sd, un
     }
     else
     {
+#ifdef CONFIG_MEM_PAGING
         /*
          * There is a chance we're plugging a hole where a paged out
          * page was.
@@ -1238,6 +1239,7 @@ int add_to_physmap(struct domain *sd, un
                 put_page(cpage);
             }
         }
+#endif
     }
 
     atomic_inc(&nr_saved_mfns);
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -691,11 +691,13 @@ p2m_add_page(struct domain *d, gfn_t gfn
             /* Count how man PoD entries we'll be replacing if successful */
             pod_count++;
         }
+#ifdef CONFIG_MEM_PAGING
         else if ( p2m_is_paging(ot) && (ot != p2m_ram_paging_out) )
         {
             /* We're plugging a hole in the physmap where a paged out page was */
             atomic_dec(&d->paged_pages);
         }
+#endif
     }
 
     /* Then, look for m->p mappings for this range and deal with them */
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -112,7 +112,9 @@ void getdomaininfo(struct domain *d, str
 #ifdef CONFIG_MEM_SHARING
     info->shr_pages         = atomic_read(&d->shr_pages);
 #endif
+#ifdef CONFIG_MEM_PAGING
     info->paged_pages       = atomic_read(&d->paged_pages);
+#endif
     info->shared_info_frame =
         gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
     BUG_ON(SHARED_M2P(info->shared_info_frame));
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -278,14 +278,18 @@ static void dump_domains(unsigned char k
 #ifdef CONFIG_MEM_SHARING
                " shared_pages=%u"
 #endif
+#ifdef CONFIG_MEM_PAGING
                " paged_pages=%u"
+#endif
                " dirty_cpus={%*pbl} max_pages=%u\n",
                domain_tot_pages(d), d->xenheap_pages,
 #ifdef CONFIG_MEM_SHARING
                atomic_read(&d->shr_pages),
 #endif
-               atomic_read(&d->paged_pages), CPUMASK_PR(d->dirty_cpumask),
-               d->max_pages);
+#ifdef CONFIG_MEM_PAGING
+               atomic_read(&d->paged_pages),
+#endif
+               CPUMASK_PR(d->dirty_cpumask), d->max_pages);
         printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
                "%02x%02x-%02x%02x%02x%02x%02x%02x vm_assist=%08lx\n",
                d->handle[ 0], d->handle[ 1], d->handle[ 2], d->handle[ 3],
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -390,7 +390,9 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
 #endif
 
+#ifdef CONFIG_MEM_PAGING
     atomic_t         paged_pages;       /* paged-out pages */
+#endif
 
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */


