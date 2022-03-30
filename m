Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B84EBE18
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296169.504102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZV0U-0005xz-2W; Wed, 30 Mar 2022 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296169.504102; Wed, 30 Mar 2022 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZV0T-0005v5-VW; Wed, 30 Mar 2022 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 296169;
 Wed, 30 Mar 2022 09:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZV0S-0005uz-Tf
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:52:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 272e4cf3-b00f-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:52:47 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-OrsnlPrEPBy2OTRsXLHlhA-1; Wed, 30 Mar 2022 11:52:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 09:52:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 09:52:39 +0000
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
X-Inumbo-ID: 272e4cf3-b00f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648633967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDomwYr5S80vYsrW9hNDuagVEoGbHJX4KMvKzQMyXqY=;
	b=WRN1T9cwVGmD1mDGCV4Qzdz2pb2Db10nIc/zXEsbhXFyss1sUvSoHXcK9IqjUM3YyZTOcZ
	T0aH9ONOEpdU9TlkLBCJHSyb8/4NZLEruaqDSD7QGkMGIw0ZkSA2DrgNEmg1RaeJq5ihOy
	F224Y+gEGAs4kTdq9lJ7VE6W5HknxWQ=
X-MC-Unique: OrsnlPrEPBy2OTRsXLHlhA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J//gBLVHM+Zh0sv4cQEJ2SQbyWKOGX/+xdVdt/lSFN5nhtHXJ64NNcTKTw3QqKSIObSpYpXETkkbg957wwhCcQyvwIPC9ktAtOPFQWBa7ZRxfAJiScAHGjIHGT1NTFTfAQtn/pyCryCkUT/KyFHhxRtxu5Q7m5OGjsLQ3m+9Ou8uJN60C5w1jm+/Qo1PJ9xCMCJl7yHhNMWMavZvtLCLsFSgKfpy2K9+xvbTHcxtiJP92bOacb3WHO4IHWE+18p/Wuk6SRmntxm/+avNt3mLJMml/z0kEU1/PovV2hiIUh7pJffCOlrT6rAr4YMoFI7W+7SZYKiJzBSrtZENc9eaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDomwYr5S80vYsrW9hNDuagVEoGbHJX4KMvKzQMyXqY=;
 b=F318oR9tqfj3j4lis8kdOY0slWQoHXxxT2gn5kCUh5+elB1kPQ1WyJAL3R5nVvASb58PQMeGT1R6t2fYCJuIOwciNkK/WwbcSBWrRUcEPd57PEIDmy/gE8HnJ06KYvrtAIKUZBpAnI9m0HxmSTQKbo7MjADgNKGFkxx4QGiMIxEXxnEoMBt5FSi6ihNdgNmjKcKlWd+07zhmvVVSQk5KiPoYCZ/JTLwb7a3hI6H80pH2lvDyIAwPT2Txd7BqS/Qkm/zVwWRP8TLOUhYPTL6dZqiEoyUh5DNtNOzqrPJ0AtNgD0WL19LPPiInZVTVpl6dmyQptrxzrZ7CNvwTKg3suQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
Date: Wed, 30 Mar 2022 11:52:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220330093617.3870589-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02fac71e-89ab-47e0-6968-08da12330713
X-MS-TrafficTypeDiagnostic: DBBPR04MB7929:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB79296A77EB90D43DF3B52C23B31F9@DBBPR04MB7929.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ogCAdl+CCG/kbua8m6EGIZIbcApGFF0R/MUUmQ0Nk0txw5BM87DBVcHgyct2JtQmBfEKKYNST2r/kguiKLAoEzwzGD22RU/huxpUXuCWDZvoxY7XIZFgSkNZ8lc2jbCoyM7r8G4d34wJZvDF7TRi0KYdTykd6pRuDxXKqBWeuYP+V3XoLbtecbSPaQHK+E0IjJeU8gspZCtZ7DVyOG2GsOjetzgITitMzm6KepQK+epJo6Oy0sMRUAIC6EayLhgMrvzhjvcvhfaUsz+pZtA8ZlJ49RRC28MUC6VxUaGN7c5FsSZzXj2cuDGNTTNlrKxKSEzDoK5o1pvGeCwIH94Y5oVoYoguvPW/9zJzixfeocNqD4Ekvb4lI1ZtkfiDrmzYIkDFy+YeOmEwh224f7hLIEnI3+QqPi1psF9tpVyKBYudvp0GOkhdDnTpnGuHLcdjCh/9a1ftWRsEpal8QFTh+w2ZtVOxU1XFpZXCDtxE6SFmzcDzTxUkCRjqnkdZe4bc7nkq6exSrRjcEB8/mFpgnSjMIoxZZy3tOxyOriHyBUaKmFH496x2bthnzB4jbSK0S1sptUSN8upvmML0K4sWgjmzIF5pVrzFR0l9HuRWONp1mQV7jagDxZBmgyxf+Iw5Ry546ZRNxlnxG3AigWNXmDvWMvet58BfD5WRqZk/rzkWYtF7C8c6tPoTXZgchJx3dyFBRlPEfS2GlEpdSx/Lkel1ESLEHb+P8fuzWIJHABE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(66476007)(66946007)(6506007)(8676002)(53546011)(38100700002)(4326008)(66556008)(31686004)(36756003)(8936002)(186003)(2616005)(508600001)(31696002)(6486002)(54906003)(5660300002)(2906002)(86362001)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SllMWE5UYnBMZ1hTUHNwL0lFZmZSVk1KMWI5aWJ3K3NFQ2Y5SWRQVG5LMkQv?=
 =?utf-8?B?MzFSc1k1UEJSSE1uR3pKVUpiMTUvMjN0N0tjWlNiY0I3L2dBcGVvendLT0Nj?=
 =?utf-8?B?c3A0aWR1LzA5NE10MFRpQUFVU0UvQkgxaVA1Qi9JN3BBaFlZazFGc2hlRjBW?=
 =?utf-8?B?V1VzSmVmQ3FnL3lJdi9uaWY1TUFpYlFEMW9wM2FReEc0dGRkR0w2aVREck5r?=
 =?utf-8?B?MEVGTWlGdVZkazgzak1lMm1zNDU4aGhzK2MzbWVsMWpxQ2RDYitlTWNMRUE5?=
 =?utf-8?B?blU2MjRFeEVtRWc5am1rbkNOVWQ0UWJKU1JCRit6ek9lb0krVSs3VFA1L1pm?=
 =?utf-8?B?NzNDSEl1YjY5UEtOcE1KZXd2NVVzN1EzVEVaVlFFQkNpZ3ZEWXRpZ2dEYXRK?=
 =?utf-8?B?QjM4cFJFTVpmRnJicmhZSThmeVNRNS8zRytJUlJraU1RNzJ4c1RsbGVQS3FB?=
 =?utf-8?B?cW9ZTVJWRCs5eDRCekNMYXhxNEZzUCt0OTFzWWZWMDJySmJKaVBLLzJ6MElv?=
 =?utf-8?B?R1pLbmdvdEpEZVRKV1p4N1dJQ3hWVHBnemNwYVl3TGRUdkdmUTdQWkxFYXUv?=
 =?utf-8?B?M2NIYVViU0NyUm1tU2VKQlUzZkpyQ3pQbE1MajRHN09BVUJEMnVTck1jbm1G?=
 =?utf-8?B?RkpVRVpKZUZkSVZUZnNLRGdOVEtlY2k0alhGWmUrVUIrdlRxQmlGaWk3bGhH?=
 =?utf-8?B?Z3BhdmZsWjl0aTNZUzBDcDBGZmZidGZibUdkVEh0eUdJR29DMFlXMGh2bzVW?=
 =?utf-8?B?SHR6VXFzN0FESTFsUXdzd0NqcnBuYzA0OCtZcmcyMnROWXdteEEza3MzbFBj?=
 =?utf-8?B?Zm44QWxab2FDQUQ0eVdFL3htUUpQamVuMmVnNWhIRG8yUEs3R0t1L2U3Z25K?=
 =?utf-8?B?N0JYMENRV01NRVdQYktzMDV4Z0YwWEJKQ3k1K0ZzQndhUGFjY20yLzZhcTBB?=
 =?utf-8?B?aUVGMXJrS3N2TXgrckZDRjNwTHAyOTQxOFFMWVpaVTdTUkpPVXA1dTNxRDFi?=
 =?utf-8?B?aGh5eEtEMkZhYzM1RjZwWDF1a2hjcHBNMkdBcUpsd0ltSDNQS3lIZ3B1Rkwv?=
 =?utf-8?B?QTZINUlVKzRaUTRHNjJ6dkxXdHp5UCtMVjhOOGZObTdhVnR5Z2MvVWM5NFNO?=
 =?utf-8?B?K0ZMaGYreDY4YXRhT2U3RUVvTTZhc2xHNXB4d3dPdkZKRHdWVzdPSTVKVi9w?=
 =?utf-8?B?eCs3b0ZUOWkrQ01GRm8xOCtKc3plOHc1S3FLWXN3YVMwVzJzb28xMjVBUjky?=
 =?utf-8?B?bk5RdG15eHlUL2xuNWYrTlBFNkNHY2lzQzE2bC9pRk0yOVdpMlBsYVJzMkk4?=
 =?utf-8?B?Q21qNWgrMnptWW1XZ09ZVjY4MXY4bTZ5SDY5YVRHWjFrZHhRT3BTc3NqS2JG?=
 =?utf-8?B?ZFNKcE1VU3VKNlFSbXdSQ1hHVnUyNkJQaXRjdHh1bHZYWVpic05MZVp6OHMz?=
 =?utf-8?B?RFpQNUw3cXFUeVBkTVdJUUF0NjN0RTRERlNWMWFIeXlTNVJTVXB1bWdwTWJH?=
 =?utf-8?B?K04zUFdJU0QxaC9DUHNSWFVtRVNQbVNkcW13N01rTEpkM1h4d0QvbjFFb1hs?=
 =?utf-8?B?WXNjVjNkbnJqcGJRL3MzU3BDRVgwTUx2cVQwZWNCeG56WENMWmxnTkFlRGpC?=
 =?utf-8?B?NEIzOVV5eGw1ZG1sdkpkZUgyRWNNZFFCTEI3Wm0rZTQvVCttcGltb3R3TWsy?=
 =?utf-8?B?YnEybk1rRFRzbTBOQXh0UWRNZ1dkazVqTGk4a2lPY29BMDdLZ1I5WUc3TERK?=
 =?utf-8?B?NE5MVlNUdnBJeTJndVlOKzlFeElMc1VuZkh1ZGxrTHlJTXd3bGJxWHo5c1pF?=
 =?utf-8?B?c1I3cU1HdHZJSjFMTER3UlZIMngwRGlBaEFTTmZPcDlsL0ZJQ2FWSDE1eU5y?=
 =?utf-8?B?NkNBMGx2aTNybzdDcFA0V2trRHBkTjNMK0JvdGtLclRPa2dvVnV0djBERWor?=
 =?utf-8?B?d0xNOXZKNzZGbUxpcEc0ai9iRzVvZmQxOGRvSWVxTC9CczFxZXFjOHZKdG5k?=
 =?utf-8?B?K2JzL2xpblFQUFU4R2hxVFdRMk9hc2ZrbGVQL3V1Slk5blVYTXV6L21za01v?=
 =?utf-8?B?ZDdLZWhoMDkxNFZIY2huUi9uKzg5QXhYdWVQaEQ0Z2VGZTQ5UHVhdkRWUzhw?=
 =?utf-8?B?cnYvK3YwQjB1ZzU1SzFIL2xXRUkzQ3VaUEFHd3RLSXZIdnAwSUg1QnFONEIw?=
 =?utf-8?B?V0xQVUVlY0pCaU1OYkthRnFWL1VINnE4dkd3ekwzUjNyaG5UZ0hTRjI0dlRT?=
 =?utf-8?B?RytIS0R6TFBaM3dSTDBlSjFZUzFLREZTTy9kT1B6cWRrY2VSVUIvUzJGNXIw?=
 =?utf-8?B?RzMrT1NEa0Q0UVZxcDk0cDNkVDRkQ3JiZTMrK09VZUszU3I0T3lkQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fac71e-89ab-47e0-6968-08da12330713
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:52:39.8784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfmmml1fxUWeh/Ge6gaA+dzqduWK1ZDRVzhjBPKJF2fGEg1yOIukg5dfy4643SkaMMFa+0QrR1EzpU0BcjIZCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929

On 30.03.2022 11:36, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -35,6 +35,10 @@
>  #include <asm/guest.h>
>  #endif
>  
> +#ifndef is_domain_on_static_allocation
> +#define is_domain_on_static_allocation(d) 0

Nit: "false", not "0".

> @@ -405,13 +409,29 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>       * device must retrieve the same pfn when the hypercall populate_physmap
>       * is called.
>       *
> +     * When domain on static allocation, they should always get pages from the
> +     * reserved static region when the hypercall populate_physmap is called.
> +     *
>       * For this purpose (and to match populate_physmap() behavior), the page
>       * is kept allocated.
>       */
> -    if ( !rc && !is_domain_direct_mapped(d) )
> +    if ( !rc && !(is_domain_direct_mapped(d) ||
> +                  is_domain_on_static_allocation(d)) )
>          put_page_alloc_ref(page);
>  
>      put_page(page);
> +#ifdef CONFIG_STATIC_MEMORY
> +    /*
> +     * When domain on static allocation, we shall store pages to resv_page_list,
> +     * so the hypercall populate_physmap could retrieve pages from it,
> +     * rather than allocating from heap.
> +     */
> +    if ( is_domain_on_static_allocation(d) )
> +    {
> +        page_list_add_tail(page, &d->resv_page_list);
> +        d->resv_pages++;
> +    }
> +#endif

I think this is wrong, as a result of not integrating with put_page().
The page should only go on that list once its last ref was dropped. I
don't recall for sure, but iirc staticmem pages are put on the
domain's page list just like other pages would be. But then you also
corrupt the list when this isn't the last ref which is put.

As a result I also think that you shouldn't need to touch the earlier
if().

Jan


