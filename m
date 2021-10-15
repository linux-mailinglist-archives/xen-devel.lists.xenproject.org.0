Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7208C42EBFC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209915.366499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIUX-0005VK-MI; Fri, 15 Oct 2021 08:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209915.366499; Fri, 15 Oct 2021 08:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIUX-0005TX-I9; Fri, 15 Oct 2021 08:23:01 +0000
Received: by outflank-mailman (input) for mailman id 209915;
 Fri, 15 Oct 2021 08:23:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbIUW-0005TR-EE
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:23:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ae0edb0-2d91-11ec-8227-12813bfff9fa;
 Fri, 15 Oct 2021 08:22:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-u1NHadIWMeS9ZaDwvzwZ0A-1; Fri, 15 Oct 2021 10:22:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 08:22:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:22:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 08:22:54 +0000
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
X-Inumbo-ID: 1ae0edb0-2d91-11ec-8227-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634286178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcEEOLuogRK5uoZ3FacOBqBT2+NDkomXpHyEYUQstR4=;
	b=IEq77BOqekVfBBWg7CoW2s+bPJO30/uiEz7cta+QRLf5EZuo7XSH+M80sq+8f6YmnGyMc0
	gPdFEcqS0b3YeMu+KLa7DbGGknwV1nYjSVk4TEK+B8PCJ+th89qJuM3s47sILOHOGs37+F
	pokmYGBg10sXCCOsA2NaCcBxpINHL64=
X-MC-Unique: u1NHadIWMeS9ZaDwvzwZ0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYRyIQPbObyhdpT2DZ20kbjkxgX3UfV5sfVGhrU0omrFwhU7T8YY0sthG9BrhtQyQGYrIuOVg/Xmgwb8mQi5HpfPgvuEfdJGQtouFV/Pz8MZ7UxISHaSBY4uuoYX4BgC46z0KZzTRIFP9+ci0ktGfLoDw+pesYEBXHlZBFXX1+WH1HPzvNt/yglbfbMgM35wtayojkJ5JKh+BffauuUs7YP6pTeIwwaz5zvMIa18dmV0LGEFwuyM+BVCivCYZrxYxEmgKnefghPK9Qcx4HpCrtnEh6v7Wq3lFc3/fexj4d7ghnU35ZPlSbis8erAY8vcD/PKBqIx0xMlzs/7DYn66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcEEOLuogRK5uoZ3FacOBqBT2+NDkomXpHyEYUQstR4=;
 b=Svla099OAwZ15hV4mA6oSbMHn6s8/0IeOfQVkVvXByOZw4xEwyfZYFQ4XR+pDokRKNozszs64c/1dCn5pLaYNq+b/LK8doj3P9Y9vp04gt+tXYSLsSCyie06fAo9m3CrwMWPV+lOcfpu1ltprs143WEXPrXcaxwSeOZcYSgKef74NLldJfLyUKrv77YvipcQFBzwG1zlvBC7xp1SZvmHeCaf87n9fV1BOxK4ODMareldL+Bm+kCnjBWPJfE6VXxg1vxSsQxEg7y6/ZsUAwZ7TqDc1k2x5yyGXXo4rEq8L4AUIDAzpc4JfEsFy9zpt7PL7yAPNiOl3iSzMjbUYr2FNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/1] xen/include/xen/byteorder: Re-implement bswap/swab
 with compiler builtin functions
To: Lin Liu <lin.liu@citrix.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, George.Dunlap@eu.citrix.com,
 ian.jackson@eu.citrix.com, konrad.wilk@oracle.com, wl@xen.org,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1634282259.git.lin.liu@citrix.com>
 <ed4f3f82cc2989ebf52425aead420014fbe00bf7.1634282259.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a51be6b0-ba7c-0f0a-b441-a9594607954d@suse.com>
Date: Fri, 15 Oct 2021 10:22:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ed4f3f82cc2989ebf52425aead420014fbe00bf7.1634282259.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d931fb0-b638-4e43-2934-08d98fb4fd2c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70387773EA625076B7331614B3B99@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aGPmvUm7Wq+YuKPhdOjCIbB8i1q6FbfPviDQdWJi1Jgjwc9Ojjckzp/dVyrw/ytqRqTkjVRJ97fSIuxfvr9LVszzJUZb0ldDWSws46d+Evo9b1rA+mO1dVDFGACJMDgrCMriLyI3G1j65Ozm6ooY3snGsoMJicMjqmY9IOlRtljijlPyAkmTu2GTK5HRPY0GvkRwG7Zh0WPeTjcdJYSOpOOmlNWee7FDJm/6ZsAJHS7qqqTcS+Dyy1jOxeDc+1z6rfacfBqDYRQtpTYwF4pnVhU3Bo3Yg8I9beoPQfAG3rnyAO+PAXTYuVvLRep3v343ZoAyx67wRK+x7BR1d6XurOCbL5CBpHrF8FKXS1CXsnV9HU2A3itiE2Rdbg6b4V8vOsbV0/Ebcwzsrbv6XTpoBc1m3MK9XkxPvm/R6Dc5nsEqrpIDNPxeiGiE1UAkP9RdidNx4Bm0N6fs+rCDJ2XaEgjHy0cskMkS1vMLZuemzaHHJQMHurLXZvby9GCsHaOJ2yB4BvnTzNqoCbJYKy8nA4IATOWLIKJp9yFUFA+a7Ut7zlOA9lt7AKZF7ZgDVAYSn15/KQSlhy8kX0Lg/xN6tl0e5o2wDBlvqL2pHbuEmfTYqdQCk+aEd7yiBc/Ex3P4N18r1uow+L2xCuECu6O1oahdJNtJnT/lh6O7lAz+9sVGozTeZ6G2bzKAtsSOWa0gBreftn92o1pIyYlPnGwrswtfSNm5b11NySnJ4ZDrO4ZrXIBHtrR2ipLVYGiHmSrI+K6GlsFfutasxbD44GKFqDQnVcZ5h++juIpu9jmvan9p5Je9RB5t5agJ6Azo9oky
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(966005)(38100700002)(2616005)(8676002)(66556008)(66946007)(26005)(66476007)(6916009)(8936002)(5660300002)(7416002)(31696002)(6486002)(4326008)(53546011)(86362001)(36756003)(16576012)(31686004)(186003)(508600001)(956004)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tOVk9sQjIvUHRhR0p3N20ra1U0ZXhtRnVjaEtHK3NnQklSaU9IdWd0UW4r?=
 =?utf-8?B?bklMMnU5aGJkTHdMdGpSb2ZZWnhLZG9lNk1WVXNKOTh1MHhWVXRiemNDMG5u?=
 =?utf-8?B?Mnc4d0MrajVtVENZVU5EUkRwVEpGc2x1UncvVVFvd3JtZGxsN0lnSlJJV0JM?=
 =?utf-8?B?cDZYSUNEL1lzNEdxR0RVb0Q1QVR6UWpoYy9Ib2V1RnEvWmhoczBvUUVjSjNv?=
 =?utf-8?B?YUVGMjZsU2FHVVJURXFtV2x6ZVpwQ1R6dEhkamZ5N2FwK2ZyNDVkOHlrQTdt?=
 =?utf-8?B?ME5JTzFDV0EyWlJ1NWt5SkxSYXVNTXFadm05VjN1bmpkLyt4QWZXL1FqREpm?=
 =?utf-8?B?ZWM2d2tZUnZ2VWpZNGxJYlU0eEZRaXlQa05ZNVdVWEgwOHN2azV6QUpBVXlh?=
 =?utf-8?B?WG1rUThBL0RyM2Y1UjZSTEwvdjI5TE80UTRxUG4rUlN2RnFnUE9odG9aRERh?=
 =?utf-8?B?MG43bGdJVmJzUERGcXgrNTZkSE9XUVQ1TWtzSmdWL3NWQXlyVEN4NVVuSUdv?=
 =?utf-8?B?TlpWYU91ZmY0cGpIdmxTK1FHL1JJbnhjbEUwQllUbkkxbjF4YTNwaGdTOHIr?=
 =?utf-8?B?bHVCUVpZN0hweGdqcFpoeTNja2VGaFp6RVd1a29HUEF4bElkMGtiZWNpTThy?=
 =?utf-8?B?V29STmpvbE85c1V6V2szK1pTQ3BHUXFoVVB6M09Pc0xHcXovb2VxRjAwUmto?=
 =?utf-8?B?QmdrYy84TC9yakN0UkFZV2gxV3gvMWRLUXhSalBTSzh2eTZ2OWkzM2Fza2tN?=
 =?utf-8?B?Sm83bFZDQ1A0K0ZpNTB3MFNGclREbHR1OWM0cUJuN0FldSs0UmNFaThtYWo4?=
 =?utf-8?B?OVV3eHFtcVFUMUg1c3l4dmtFc2hPWFhtZk1UaDFmbkJZTTBrN3Ayd1Z3eUN4?=
 =?utf-8?B?dkFuVWxCVG9kQVd2cVNtQ09YREVWbmViRXp1Wmx4SVhLc0VMWGxmTkZYbDNG?=
 =?utf-8?B?YkpYMGc1d2gvWmlwTzFkR3Uwemx3Sk5DWEJYU2lhSTFIM24wdFdQNlZyRWl4?=
 =?utf-8?B?dDMvZEYvMGtZNFduUU9mQkduUFJpdU96Um9BVkEra3EzdlBOd2xuWmZIdFAy?=
 =?utf-8?B?TVk4eU84ME92YllaejRoMHVQVUxzdi82REp0VnVzSmJjOTFtN2R1NGNvNDNZ?=
 =?utf-8?B?R3BnWThQWi9GOXlUbFowNTVuTkVEZ3FLaXZYL3hzMjNLY1pTSDRHc2M3SFd1?=
 =?utf-8?B?UFhFY0txRW9EUTlwYjd5bGNyNldqTHNHdFB5enlGZDYxWlo5d0pubGpueDFL?=
 =?utf-8?B?TGtRSnB6RDhDU3VqM0VaSDdkMzlEaGpVUkZ0TS9mYTkxRjJwYXNGbzFWWk1Z?=
 =?utf-8?B?emtZN293aEpPQWlGOGVlUi9BbmttNWFqOXFaTjBrei9kdkFTTkd5R0dPcVBQ?=
 =?utf-8?B?N3ZjclpNbjdOTENEVDJsdmwreFArVkZhZDJaa0ZNTVdJOFJneTE2WGVpTEpp?=
 =?utf-8?B?SlZvYzNxNGNuZVBaVlJzeXNjMnduNnBjQmJFOEZmck9rSlBtSVl1NGlHWGFU?=
 =?utf-8?B?LzhGWHFVNWpuZEFObzhUTU1pbktmdHExNjM3a2IweEd1bEQvNUNJd1dNeWow?=
 =?utf-8?B?Q2gzRUVZbmRqbGJZaHVSMU1hOFpXdW9sWEk1OFM5V1JpQ3RkS1hBZmhKM1dL?=
 =?utf-8?B?dVBNcHBtRmk1Unhnanhyd1prdTRJUjlCT1d0V0E3ZWVzY3NKcmo2aDUxMjlK?=
 =?utf-8?B?TmwrbmZ3S1VSTmNYQzZnYm5pcWZrL3JTcnpqS0xJekZDbVRzVGxHbVFNOXZH?=
 =?utf-8?Q?gxHeMah3woJdFr5f/ze3YYj3dr+ztiuyU5EVwIj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d931fb0-b638-4e43-2934-08d98fb4fd2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:22:55.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOC9Dmn6GsYCOaJFCwh2b9WKZO/d2GRCGsXrWAF4pBLTwh0GV+u9kaNSxtZd3pdlcYIA3ftASORqKraw1q6rug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 15.10.2021 09:26, Lin Liu wrote:
> Current implementation of bswap/swab is overhaul which involves
> byte operations, compilers has builtin functions can help to
> simply the implementation
> * GCC: https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
> * Clang: https://clang.llvm.org/docs/LanguageExtensions.html
> 
> This commit replace the implementation with compiler builtins

__builtin_bswap{32,64}() appeared in gcc 4.3, __builtin_bswap16() in
gcc 4.8. I don't think we can use these just yet without having any
fallback. Apart from this aspect the change looks okay to me, with
just one nit:

> --- a/xen/include/xen/byteorder/swab.h
> +++ b/xen/include/xen/byteorder/swab.h
> @@ -10,166 +10,32 @@
>   *    to clean up support for bizarre-endian architectures.
>   */
>  
> -/* casts are necessary for constants, because we never know how for sure
> - * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
> - */
> -#define ___swab16(x)                                    \
> -({                                                      \
> -    __u16 __x = (x);                                    \
> -    ((__u16)(                                           \
> -        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
> -        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
> -})
> -
> -#define ___swab32(x)                                            \
> -({                                                              \
> -    __u32 __x = (x);                                            \
> -    ((__u32)(                                                   \
> -        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
> -        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
> -        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
> -        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
> -})
> +#define __swab16(x)  (__builtin_bswap16(x))

In cases like this one there's no need for the outer pair of parentheses.

Jan


