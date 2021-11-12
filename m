Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5444E48A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225098.388753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTl0-0005Gj-CC; Fri, 12 Nov 2021 10:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225098.388753; Fri, 12 Nov 2021 10:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTl0-0005Ee-8o; Fri, 12 Nov 2021 10:26:06 +0000
Received: by outflank-mailman (input) for mailman id 225098;
 Fri, 12 Nov 2021 10:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTkz-0005EY-Ah
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:26:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa02a66-43a2-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 11:26:02 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-O21z0DkQMkWgcjIBft0cvQ-1; Fri, 12 Nov 2021 11:26:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 10:25:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:25:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0041.eurprd03.prod.outlook.com (2603:10a6:20b:469::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Fri, 12 Nov 2021 10:25:54 +0000
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
X-Inumbo-ID: efa02a66-43a2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636712762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sx2rnzqFtY76dmq3vc2M8RdO8C0wFtqKgqF6RI6V0ls=;
	b=FyX3ZKVNoZqC0RVANAHMstFpEMoyXO6Trsw3VZAb60das2vA/xJSgEmhluLtGftuzTtnIG
	WNOdOp6opp85zN29No9pLSdtKRX/N0cSjTRWspu4Wfvii7JTpVsJKIk/3h+uuJnsDqmIh5
	OshIyz/sm0NEp+JD3lFW0yt68CXzs/s=
X-MC-Unique: O21z0DkQMkWgcjIBft0cvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkyRXUlQWyAsfHqt0BKml46yBRA3dA0MfenISgHsOj0nvnB0EuHR6wGSkX+qZHHKCn3IMpJoPx6fv5z022lkL6rUZoEiS59fIQQT/0E0GMxYPgPWOCYwyRFIBu2FkZFtYANbDrvcgQcHb//eIQxsmdaP3G2ctZmYIoDAVAFVJ8Ka7YzrgxNT8K/ZknwspW2O6TpJQnYwLiGUGDVLJD97B9h5yeqa/NRhQN5eq2z+b3tFL8yjnAwBiMGLN0mXu+q8pD0P63crpubxyLqkTqc7PL5xM3SH0TwADi+0IszWjreVvgnlR2FFF9jov9CNXu2b733aS9+I53T7pwxIZNIMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx2rnzqFtY76dmq3vc2M8RdO8C0wFtqKgqF6RI6V0ls=;
 b=FP6EzRDKou73+TPuLGM2iCL+wPltieDOGOYt0a+Lu+laV/ekQyUQDh57SluNCaV1Sppwr0LrTiXe/PGSsSZkOATPrwmoX63RwXYhxco/WanC0GFMBGysfxbsSEFnVSq8arcxsx+afwIkMdwuzUJCxSCYKLB6wu1rEQhDxXchZU4+kj8OH1vNZpvRyKZYoecxfBuklv7Th1KZfrb4jZslHPwam/Y6hCrfOcwTNmI+c1JOZadgjf8kSavwC6Ft6SiMhPY+eO8EEPwI/GDPwSViqKXRbSvTqjNMQB6C5pWItG1sYfNhePFVtdAc9nDLCCgBW8ssLuGOb245nKsqOjCbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6672a9ef-5e60-d91d-4f11-78f0d7ca8e5c@suse.com>
Date: Fri, 12 Nov 2021 11:25:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211111175740.23480-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0041.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c400b74-5f5e-49a4-ed00-08d9a5c6cf5d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904608FFFC83ED538E7DE28B3959@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jbPPwQEhEqVDpyW2Z7leCyE/CmYBZgKDbGJMZIebu6knM17ehwE+h07dRSbCZuApUmJQ3Yd5ldzJIIj9bGkoM8sNj+jCN5/jYqSZ6j7KBCVDAfO19n/eq5lMsy7vRDqGbGBQr5EFoVopPMAJO/LzT85ev5KsDOCW0N9LhQUQFvDFGCCSUHvxICvWdkRNrSUxn80JZ5ZIp1fJy8e0aAEYetxy+mbDg8+pSLUIAmR53ysA/jwQLS8fINHHkx0WKcWrQM1NwV1b9eRn8M1n7RanST8frCpAQvPfH3jnMpS5sSW8cSTFUHPa0ikQL2oBKgh5jLIXhoCsCsOEnTYyelrAQFJBvg/PULmIWU2tYnZIZmSMfGHdlJ0O7RjW+p1NqCZOQEGUHkbxfBooJz2oLV23hbuqiyCKRq7gDKRv5lCjIXktN9akWUAieQgxN2sAoTtXj0Bbw15/EyDH5Rg/+HLJS1ykO3OCERcGjn+w2KblJapY49aww9qF8fYsDGQJQfAOj08zq1MSWiq7sEQMHKB+pEBC8uyNDZgJDZZtUIoJRKbaivFwZINkE63UjUF4Q4RQzOQlj2Ej7Gg1O56aRsyZbMGa+Dy1X+FOgbQOX6sdZeOFh7nYkcvGXczw4lbzqqNs0SYarZ6kXt2ksUNMsQoWpLOgIKFPU6//iELdAx4/b8OtkG0UsKcQopALleJ3F99AS5lzosQIB8Gfch1tc0glGE0VK+7JOvSCH0ctzTHoybazhTO/z01BtCn0qzzfOmqT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31686004)(186003)(5660300002)(31696002)(53546011)(2906002)(36756003)(38100700002)(16576012)(54906003)(316002)(6916009)(8936002)(66476007)(8676002)(66556008)(6486002)(66946007)(86362001)(956004)(4326008)(508600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG5kdGxqbGdUalBqQkozeis3dHZiZE0yK2UwTWthd1pSclpiS3VyakdKeXc2?=
 =?utf-8?B?dys4Yjh5djRLY25HQlRqY3FGdlQwaXkwa1R3MmNMaGtQM3JmN3J2V3hZUkND?=
 =?utf-8?B?N0hsZTNOdVBCTTlvZEswTnBrS2dJcTVlTEkwT0RrNDlna1Y2RURmaEQvbTUv?=
 =?utf-8?B?UXJLK01PampsZ1lkaVJqU2xkUm5DSExRSWdTRW5EODBveTJRRlZRZFFpdko1?=
 =?utf-8?B?bEM0ZUpuZFN4QkhSYkpYUGVyd0RhYkk4em9qaTRDRnNERWQ3YUovdFJHWGYr?=
 =?utf-8?B?TjJXV01TZytBTTkzb3dYemhuN1Q2cmtXeUpETXRxN1JaN2JEZjRVTDVqWG9D?=
 =?utf-8?B?d0IrWllRSXJYdVJCelp5ZjFCMHdGMWRKc2tUYTVucW1mMHNoT2pUcS9odkUw?=
 =?utf-8?B?RHNBbkdmRVI2Z3lJWWdqK0dBbmhrRE8rSFBSN3F4TUJqV2d4US9xRkhDODYv?=
 =?utf-8?B?SlZlZE10cEdxQlRLeDdhUkFQMDV6aDV1TWZFZ3psREZmaDVOTXNsbEx1MHJC?=
 =?utf-8?B?ME14Y3lKRy94bmRLeFovZVBiV0JKNTJpYmJLcnU0T1d5Y0I5VWpiY3loT0R3?=
 =?utf-8?B?RTBMZDBWVDJSbTBjeENoci9iRDFzcUFFL2JrVEtjWDBwWWcvZTIyK0NnR1g5?=
 =?utf-8?B?Y3h6OVZFR0RJdHhtYVd5OWpkY1JjcnI5TWtDTEhrZ1dPTkVLSlYxdkxOb1pE?=
 =?utf-8?B?d0thUDBiZkhwOUY4S2ZjNTM3c1VyVS9YRWhicndUZzNYRi9wWEQvUmxiRVZX?=
 =?utf-8?B?STQ3elZvVS9sUzRxQmtyMWYvYk9uVDdnRVA0ODZrYzZIR1JpSmtGY1AwQ1JZ?=
 =?utf-8?B?QUoyMHlySDRtaTJjUU14UThvK2JQRStDaHpXcDV3dklxSWVtVXZDMm1naXo1?=
 =?utf-8?B?WTQwcXVvNFdBRmdLaVEweFhtN2U0bm9ZcWxPQ05wM3JaWkpkQVFxaE16SDdx?=
 =?utf-8?B?eUFSaEJFSVFDRGswOExvR1laLzdyYnRJTVZCQllzOFdRNDIwUG1kYmlCS2oy?=
 =?utf-8?B?S3JiSFJGUTRQR2d2V2xPamgzMjNLYjFBanR2bDNteFcxZU9Ia2JqK3kwSWpa?=
 =?utf-8?B?bjg2NWEwNktySmd5MUtJZytzY0ZmMktuYlliZUJ4WkwxK2JiczJoRVRXb3BO?=
 =?utf-8?B?NjFWeE1ITXB4V1c2M3d2a1lrazF2YnIyZlpXWHAzMHVKcUtiSmMyNm40Vy82?=
 =?utf-8?B?WmJsbTZFbTRXNk5VVmtmQm5XUnJzenZFOXl4cVFONHA0ZkEwdnJkMEwxL2xB?=
 =?utf-8?B?VGNSZWx0NWs4czJWVlJFV2pTbU5IRzE3V1VzakNybENmdHJHeHhkYXUwbzdu?=
 =?utf-8?B?UGVHSUdqN0QyTTIyeno2aUllUHg2aDdhcExzZHlvdEdndVc1aC9xUnU5UENM?=
 =?utf-8?B?cVBnSFZaTDZOVUNBYURwYlVSdHVISlExeW8vdkpqbU00Wm5waGtoY0J6VXYx?=
 =?utf-8?B?am1VcTE4VXR1YktBM3B1UHg3eFdlMFY3NE1nSWpqS1lZTGJZcW9tNGRmZVdy?=
 =?utf-8?B?WVF3QmVYR3dLQVp2K2xNSklWUHd2Sk4wcEUyMlVSbjgzYVZrTHlGcnUwdkdq?=
 =?utf-8?B?YkViVTJZNmgwTVBTL2J3a2gwRDRkOThKRkhZeVc1TmRrY081cmZLNmVqSEI1?=
 =?utf-8?B?Ny9SaC9hRGdjRHFEK2pvbDdmQldFRmo3UVZDVzJ0TG9adnN0bGdGWjdWYjd5?=
 =?utf-8?B?VTJDeUNUcTVWZG5HcTcxSmpYUFpydW9UUUNJY0tmbVVPc1N1SkVSTDdoTzF6?=
 =?utf-8?B?VFB1VktDYnQzMkpwT2QwQWhqcVlnYU1xVWJpWUFZbGk0eUFEc0tGSWVhQ3Ro?=
 =?utf-8?B?SmxMNmsrWnpRZi96U2liNC9ia2NBUExUd1NqU05JbStjZnV3VW5jdFpTa0lj?=
 =?utf-8?B?UlZCb2hGSExWNmRuUStYek5naUVMQlRjNjJPSmIvSWE2YTE5dXJ3TkN5Ymcy?=
 =?utf-8?B?TkdWSjZ1bHhCaUU5RG5qM2l4WmRRcU1kOWlWMHJsNWluYW9ETFB1WE9HcDJa?=
 =?utf-8?B?R29FOW9mcjNSVkk3NFA2V0lHY2xpbjRJaXVtZ3BqTUhkcER3ZmVWd0U0OTk0?=
 =?utf-8?B?L1l6bDdURVFocEdlMFZYSjhQZ2IvbVBsa3JBQ3BpZi9jbnlLM25VaVVXMzIr?=
 =?utf-8?B?TktzS0JJZXhxSGhOUExCWFFCV1MwWVFBUHM2L3pRSkFhMzNLaTFEd1YwSHps?=
 =?utf-8?Q?vJrjkVBU1S06VY1OLWNWO14=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c400b74-5f5e-49a4-ed00-08d9a5c6cf5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:25:55.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UXgI9rgJ4zACpjuTYXkxDnK3RYN/UeaUIJ8ywzVDtXsFo5sd2+AF7ZqUAtQKwFUK5ipbi7gylhvVHSQLBSXmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 11.11.2021 18:57, Andrew Cooper wrote:
> There are exactly 3 callers of sort() in the hypervisor.
> 
> Both arm callers pass in NULL for the swap function.  While this might seem
> like an attractive option at first, it causes generic_swap() to be used which
> forced a byte-wise copy.  Provide real swap functions which the compiler can
> optimise sensibly.
> 
> Furthermore, use of function pointers in tight loops like that can be very bad
> for performance.  Implement sort() as extern inline, so the optimiser can
> judge whether to inline things or not.
> 
> On x86, the diffstat shows how much of a better job the compiler can do when
> it is able to see the cmp/swap implementations.
> 
>   $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
>   add/remove: 0/5 grow/shrink: 1/1 up/down: 505/-735 (-230)
>   Function                                     old     new   delta
>   sort_exception_table                          31     536    +505
>   u32_swap                                       9       -      -9
>   generic_swap                                  34       -     -34
>   cmp_ex                                        36       -     -36
>   swap_ex                                       41       -     -41
>   sort_exception_tables                         90      38     -52
>   sort                                         563       -    -563
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet again without the intention of overriding Julien's concerns in any
way. To address one of them, how about retaining generic_swap() (as an
inline function), ...

> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -3,8 +3,61 @@
>  
>  #include <xen/types.h>
>  
> +/*
> + * sort - sort an array of elements
> + * @base: pointer to data to sort
> + * @num: number of elements
> + * @size: size of each element
> + * @cmp: pointer to comparison function
> + * @swap: pointer to swap function or NULL
> + *
> + * This function does a heapsort on the given array. You may provide a
> + * swap function optimized to your element type.
> + *
> + * Sorting time is O(n log n) both on average and worst-case. While
> + * qsort is about 20% faster on average, it suffers from exploitable
> + * O(n*n) worst-case behavior and extra memory requirements that make
> + * it less suitable for kernel use.
> + */
> +#ifndef SORT_IMPLEMENTATION
> +extern gnu_inline
> +#endif
>  void sort(void *base, size_t num, size_t size,
>            int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, size_t));
> +          void (*swap)(void *, void *, size_t))
> +{
> +    /* pre-scale counters for performance */
> +    size_t i = (num / 2) * size, n = num * size, c, r;
> +
> +    /* heapify */
> +    while ( i > 0 )
> +    {
> +        for ( r = i -= size; r * 2 + size < n; r = c )
> +        {
> +            c = r * 2 + size;
> +            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
> +                c += size;
> +            if ( cmp(base + r, base + c) >= 0 )
> +                break;
> +            swap(base + r, base + c, size);

... doing

            if ( swap )
                swap(base + r, base + c, size);
            else
                generic_swap(base + r, base + c, size);

here and below. The compiler would then still be able to eliminate the
indirect calls (as well as the added conditional), I think.

Jan


