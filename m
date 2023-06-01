Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34671A0F9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542614.846666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4je8-0000al-UC; Thu, 01 Jun 2023 14:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542614.846666; Thu, 01 Jun 2023 14:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4je8-0000YH-Qh; Thu, 01 Jun 2023 14:51:24 +0000
Received: by outflank-mailman (input) for mailman id 542614;
 Thu, 01 Jun 2023 14:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4je6-0000Xy-N8
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:51:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe12::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a318a3-008b-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:51:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9345.eurprd04.prod.outlook.com (2603:10a6:10:355::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 14:51:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 14:51:19 +0000
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
X-Inumbo-ID: c5a318a3-008b-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFA/RqTyi2jYw56JJ2wurf7M537mfGA4JUQuSvkohvk1s2B3SbVqWkCrOWyEVtlphBAynucchNhNW3jCvfgfYYzKuw15yKE1/d/jKrN4xBoBMhT3TLtUe9VNoCZnlTg79l/4mBLoIlEFWEJF8AAXyJssWzuUm8/nQ9+fZSdBviUVf+icZze7d23NOwdwxX4RJRurb4m3vs1n15/EkWyaMYXZifP+7P2nCieSwPg3FBNKfl4N7gClnBNQMu25msOnCd7hEqSXPnTYtq+D5Z5ME7QmV3LnzUyLwbmr8GNcpbW/zX6GLYkWjXWo5eeVbH94y7rjqZnP68XAH0ST22GJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eryvMzI/DJ8unn5X+bS0BiBjuwp23BFLNcWOOSyQKL4=;
 b=BnXg7OtFyf+mgvC88O93DVDjoIAy3UG5XsWOGhUZINSPvoD+smXuy/1U3jvpPtPct/rbcSUQ6HQ3uB5CVKkMjPt5OXJV1bIAkG5mlmPp7ftHE9cNuyqDr19foG4mO+Tfy9TLzbsonfU7/buxnyfxH/aUgQl1cq3H5bsDaVFmJkdY3CO6F4L7J3kh8xEm5/7nr1ojKn5ZrGp1OCfAPpDkLDUpECiWeJ4glGOWTnIO2tTorjS5tkEVfPUDgnCfoU31znvLk4j+iGZzIno3YcVRWuCaEfJPCBZdNDkNoFRbi+VBH2vJERo1XzoTI306RFea5Rttq7/pnyL6e0vYkPuVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eryvMzI/DJ8unn5X+bS0BiBjuwp23BFLNcWOOSyQKL4=;
 b=GdawOlj6D+pwAQ+CDiJzkqcDvEPzy//IobG2Pl8hE4APiH5+rNd40ykh+bn7AbEpaQ5fZKZRKbmAg/y6YO1QlGI8GUcZP+lgjVumMsEJGhXI7UybZ1zQxzo2TM+FS9/qjodz5c90uTUJvVgRFAEMMwUckZwQMtNQNa3qpInekYuXRLBJsV/j2SOEue+8o/+bNphRK6BMRiNH7hR0QLqqFb0DBF/vg1KQaVoJZyThZxEDlJO9e/bT0kFUhklNaQ6H/mnwx9bqaJ+ioJ+Gv3TxT25IC7wPlsETIxrQjZ9vt7KsUdkOtWpWSPBMepiHy53qZlTf8ZyP7Yhl8ZeDNjzOeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47610aec-3cb7-ca21-cd84-834b0728f29e@suse.com>
Date: Thu, 1 Jun 2023 16:51:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/ucode: Exit early from early_update_cache() if
 loading not available
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601143813.1553740-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601143813.1553740-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ef2d9f-5337-4081-3f22-08db62afa86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Abv3gYZ7iYVo+Od2vABwtzClToz/QjG7ERLgxhXafwWZzORWhujMJcWzsFhDT0Znq9H4/vuJBv6B1tV52KH9LnDDtYr3BCtBJL84YWk3c+mRyGxCCcjIGtbej3zMQ2pSNXzDg3FkMb7Cj90TySusuT2wDgqB7Ab/HiUfwbFQBXA2xOePHRbYAt6umsY3jRTXphbDS392FbmnagiUZoXnbOG1DoxNFuCKWAyczMtXM0f1fiOKH5vxbS1VsSYQqCADCYaOHQK5skKG251rbKZusSCP90wdy543Jg0vsmrRju4KdRqJuvjhAHJqD/3nKBy7EvF+841n5yxmN8ijHduDz+0kl3zuiY8F0zV43/HpYXXQZA2kzEKYnP1715N4X2XrSnvx9sF/NZQCzqXD+AR3j7lD+PVjnpTaT+Hj3wuRqsYJWrThii2BSEXi/4Gt4sSQICDxNN1WR3i0bUc5B546qep4MfpHan54+gCksT4IWqXkPqruoTPXI8EY47GMJL1qty9+uUh3pC0WgjAggH6UWZMqKD3E6dloSzihGLFlX7gvUSLe2ZAAatuarXxtvZ+sTxOb41TM1rIDx1k40VQUzt+3XROyeo1QQFqOtjoqQxgLFEiMcrOoJbttFFwebs3rVYswrwhOPl3xCRHJHyKLiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(66556008)(6916009)(66946007)(66476007)(31686004)(4326008)(316002)(41300700001)(54906003)(8676002)(2906002)(8936002)(5660300002)(6486002)(478600001)(36756003)(53546011)(26005)(6512007)(186003)(83380400001)(2616005)(31696002)(86362001)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2NOYnpsN1laTk0xanZzTmlVZlFsdEx3TU9hcVhHamxKUjFRSzRvN0l5M1lH?=
 =?utf-8?B?TVdEK1BMSk9jd3hpMnVKZE9mdDN5UzFMZk1RV2dCamkrNlViWFdaY2p4QVN0?=
 =?utf-8?B?NlE0dTJMdmxtbm0xMEtTdjgzQ0czZzhXKzdLM3N4MnFSMzdwQ2MreVA4UVJ0?=
 =?utf-8?B?bWxNNmFadmZacFlQTThQWlFYd3lLdGlHdjAxaFRWR3UwcUhMWmorYjNDSWti?=
 =?utf-8?B?OVU1NG42YWZYeEVLbXFDM0tlczJkRHB3K2VzNTllYWZMVXJqSG9MakpLWlQ2?=
 =?utf-8?B?WC9HREJWZW9mYnZPKzh1azN5RU5SaXBiNEVXRlpjcjVwcmdjRUI2OGhURldI?=
 =?utf-8?B?dmVuL05CSlRBSSsvWmJFdVFjNFJuamo5bk84MDZQN1lOS3ZYZi9zSXhVc1dI?=
 =?utf-8?B?UDZhTTRleHIva2ZINk5QeUNjOE1PM0JOY2QzRDVqU3Qvb240aWQzWmRkZWN6?=
 =?utf-8?B?MENVRnJBTXBPUW00VGhmR2JUdExkN2JBRmlmM1Z1a040SmdKMnBjbUNNekND?=
 =?utf-8?B?c1hmMTJRK2NhOEdycERCNlRRUjBoSGFEeEIyUm5BMWZKVmQ0RXRQdVp1eGVI?=
 =?utf-8?B?bzZEb1RBRXlLVXdpbnozYnRBQ0RMY3JtY1dsS013OVJQaDhtU1E0dmVHZWVM?=
 =?utf-8?B?dXFXMEVqQUNsT0E3aG9NVzNuaTlyVlZpOHN4SGNRek9vdlB5YU9uV3Fqd2xq?=
 =?utf-8?B?cmtCYmZWSkhuS1FjZGswK0hmQWpmNVhubTZncm01NlNWUHN2YzR2UzUzSmxF?=
 =?utf-8?B?Mmdvb2RTZ1RUbGlrSXMyekp4Sms4OUhmdHdEbjFxM05sV1VPQzZKckQ0di85?=
 =?utf-8?B?WmRGcElqMGJVYUFRWkZ2a3pWei9sdU1JWFFveXRTZUdQb1Fhek5neGN0aXBQ?=
 =?utf-8?B?QTZmcU9kbmpUcXVrYzFMbUVrMFlkUkE0bTdyRjNKckp1V2FqSU9IR0R4YW5m?=
 =?utf-8?B?b2hPK0Z1eFZRUlo3WFhQcnF3SWVETnYxMG14elZDaDVJNVBBOTZRMWdQb21j?=
 =?utf-8?B?RW9rSXpBTVEvMml3UWxzdXhWeFVwdWVVa3FkOUNMMGFQU3J6aWpxa2lsTHBY?=
 =?utf-8?B?TTlDU25rYmREV3RxT283OS96WDlSMm4wcUhKcXh6WTBHRkhGaGNHc1FHclNJ?=
 =?utf-8?B?QmdDSGd1dUtDM05UVjlrMXl5czMzWThpQVV4Q1ZNV2xBNWxBTXFSNWVzUXNa?=
 =?utf-8?B?N1gwcU1OUkNReXRqZDVYMFYxTFMweExabzllNlIyVzRwc1VBd21VYllMN080?=
 =?utf-8?B?Ri84bXljNUN3OXlQaXI4Z1RvRTBzU2l3a1c5TUtOcWY1UUhHNGp2TFNaSzJi?=
 =?utf-8?B?ZDYrSy9ER1BvckZWYklKUkZDMXNZd3hCQ3pDTVZzZWI5RVpwTXRDRUdETE9m?=
 =?utf-8?B?MUJqTXp3NHRtYldnczY3Ni9sSDhCZFBYM2Q3Ukc2d212OTlsRjk3TFhvdjFn?=
 =?utf-8?B?ZFhPNnZCZTdsNVF2dENxY2hEaUg0TVd3VURwSjd4cnVjY1pmNEc0cmhuUGhs?=
 =?utf-8?B?RStZUk5keG5ZSmN1aVIydUhDRUFVdVFvSi9EWkJndEpibEk1d3hVVlJIYUlj?=
 =?utf-8?B?TXhYKzNhUHNNK09HdGkvZ2pmRFJmMVRLNHdRay9FTTZtLzhMNDFORTFqS2V1?=
 =?utf-8?B?VVFPZTVzSDcrcG5JYjRhelYvb1ZyaG04MHZJcmZIZDJvWXN6cHFhWGFlL3Qz?=
 =?utf-8?B?UVBnK0dRNko0YVdoNDFnMy9QbWR0YXk3amYwcHplSElmRkxYaUxMcDZpSi8v?=
 =?utf-8?B?dlpoZXlUVkRtbjhWSzVTT3dHNm5PelJMWlEzRSs3em4rdlVLaXdzeGdXSTNq?=
 =?utf-8?B?SjMwN3JhSld0dGgzTENENTdxYnRrNUxieVRtVTVoYnJSaWZwZ3VxZTNhM3FV?=
 =?utf-8?B?cUpvOHRKdVNJNm1LUkdGUkxpZjZQbWx1cSswazEzZnlmczBXQkNJajUxVEo0?=
 =?utf-8?B?OFIzbExpeTBicFpUcXZweXV0UW0relFUZTBrSVZsdDExRkJVM3p0U0FyUnpv?=
 =?utf-8?B?RS8yWDhIbFlwUjRLemRPV3ByUWRXUU1sYXBJSUVKenJOaDJHVVJMN0ZJRnJ5?=
 =?utf-8?B?MXNubmo2TmIrMEF3dS9yWDdMdFhaOGliTTFvSTA5eFR2cmlyR2tDalBWeGIz?=
 =?utf-8?Q?kimev2nn7qbsTf1djEHvy3bhJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ef2d9f-5337-4081-3f22-08db62afa86c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:51:18.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNOOtjt3sxP1vTQXZl2AjH/clzFv40iXHfiwlmdJZ23wkUnyEInabw6Tn5IfcvAysnTyNC5ohlDo2otkZ5WDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9345

On 01.06.2023 16:38, Andrew Cooper wrote:
> If for any reason early_microcode_init() concludes that no microcode loading
> is available, early_update_cache() will fall over a NULL function pointer:
> 
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04037372e>] R show_code+0x91/0x18f
>   (XEN)    [<ffff82d040373a49>] F show_execution_state+0x2d/0x1fc
>   (XEN)    [<ffff82d040374210>] F fatal_trap+0x87/0x19a
>   (XEN)    [<ffff82d040647f2c>] F init_idt_traps+0/0x1bd
>   (XEN)    [<ffff82d04063854f>] F early_page_fault+0x8f/0x94
>   (XEN)    [<0000000000000000>] F 0000000000000000
>   (XEN)    [<ffff82d040628c46>] F arch/x86/cpu/microcode/core.c#early_update_cache+0x11/0x74
>   (XEN)    [<ffff82d040628e5c>] F microcode_init_cache+0x5a/0x5c
>   (XEN)    [<ffff82d04064388f>] F __start_xen+0x1e11/0x27ee
>   (XEN)    [<ffff82d040206184>] F __high_start+0x94/0xa0
> 
> which is actually parse_blob()'s use of ucode_ops.collect_cpu_info.
> 
> Skip trying to cache anything if microcode loading is unavailable.
> 
> Fixes: dc380df12acf ("x86/ucode: load microcode earlier on boot CPU")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



