Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17826C1094
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511847.791179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDW4-000676-4i; Mon, 20 Mar 2023 11:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511847.791179; Mon, 20 Mar 2023 11:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDW4-00064O-20; Mon, 20 Mar 2023 11:17:28 +0000
Received: by outflank-mailman (input) for mailman id 511847;
 Mon, 20 Mar 2023 11:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peDW1-00064H-TQ
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:17:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9633957-c710-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 12:17:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7125.eurprd04.prod.outlook.com (2603:10a6:20b:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 11:17:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 11:17:16 +0000
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
X-Inumbo-ID: c9633957-c710-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTN17KCBGDTxYqi1XAaFfmGkOHgfOhgrj4h+xQ0HsEVzptNr8/CuOI7/zaj+YW0IQXt+tazhxP7oKwa31Rtl9fUz7xJ0KICUIhzaPuP7S/Vdc7/he+CmqVfuz6WovV4RaUvdv03YKz2GtjZimwWceNnJz1yaxJxnH5i5HC/sWwTLOAzuoPe0uj/qiFDA9J91poDZ5xkoM83fj/n7k+nNR1bcb9k2QdGkV14eQ4UX8mBMtoj9H07BR+rYvNYl0CEz5JTXN0fq0yOHi46hKHlaEX29OvoZ+m9LcjJRgqsWYEciT8vqyTCkwhECU9eiDOoTvf3unTfSCkwtocmY1hqTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfpVXQ7J7Iuww+RURjNQiLuCfLLcPTUb9JN3Lnu6elk=;
 b=KMLlo4l8pU5r22fckN9xE0OCfrpe07EA9DkhaV9pCvitVJgOqrISRGa1U+kiHk5S20lBEVMvfKB7EvNRZcnosOBkm79CfSit6ULPKJSQx0ZgXTIST85ylH+NZFCfe5MLvxsZR3leAADLtH7FoFljo99cvvTzoOqmgxvIfcrF+Ih1xDwS/Tw9Nt6EkVikuDMSXu8545Pe6bKRhHZVA1PYMAAGHh7PqQhMz4ODilTg1Zr6/xH72Ap6dbSqaMRa29U+FCBfN/3c4SXeX20nefp3sqHaKuiTx0Y/E8nVcbgPjWJ4ikWLov6iA13Hr07UB9ubSpoiElPtm773e6fbEYbwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfpVXQ7J7Iuww+RURjNQiLuCfLLcPTUb9JN3Lnu6elk=;
 b=hlj4HUQtOGNS34uvCnEXLwNVvVoycNAhb1PkCfDTFNCL0JK58MRuTSFqF+IgfQ8HYsvQm8kirmd0GBxgkcU3MI8O/tEexqkRFoRlrj+0289z0q4UwU8ynu1UtQl7xCnOpBcfssGWzRQg7sq+lO2nbNo8ZgJt7wKwZpOkWqoK6vjqN6giskA9QRASgLIUoqdzLaGUvJOeCzKPmepboJCJsSe7DXUXoo140l/RL0YKUI0q+xisHAynzeRnTmQEbqejjDVrhDAj0BY3hSlkMcJ4JG5NSNWFKiUtszZ0v0YnlzTn0Y/VaBdyxAK7JIRLVVAmU4Ab2LVvb9y/sc25ZW/ClQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39426526-c576-e3e3-4cb2-d3741d447bdd@suse.com>
Date: Mon, 20 Mar 2023 12:17:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230320081935.18367-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230320081935.18367-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c42250-ee45-4b02-5ba3-08db2934a99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W4mkcPEblBjppZP5RjLIeaSbeqQIvg8iAYl0NzyZsXSo0EHyszdnyL9YcMd6d5Q6bL+i6WDp5wwv5gwQP0KxZ5YOgTSQyVibyc9v2DRHVvzXV+1tG6TBP2HYJIWcVcpPa8GqlLKxGY9Xm8LwC14flRtS8AXTwM9xjT/w5cFZb4rMoxzzDUlb4gv2ES4Nu8nptLuWjROklo8A9Dgi8ooPz/mQEVOOGBXJwEdmKtmBMdb0Gl51bY7vnou6HvQ/jW7EnqHk9xgzXxCuVKTGOj7zKYioFWOKz+L7W9PZ84EatMTTVuKq3NM5mWHV5Pev3eBbKsaV7JdVOXg41F81mpWKtPRiy7LeaF4CCPqLS59Y0kTKVe7Y+FTJkA5CCMXWy2zlEZdrZd2s3MgQGY/NiAQrKXtOQWsLfDP1i1p8HDHHkdpcPH8AIJYovFy0gzw031aLWzELAor9KJM6ehUoCmplqO5a7M1GurU+ahKXbxWgHxzM4lyko/1p9V1pnSI6+1Yd8uIW847/Gm+bgUe8I0VAwsvrKyBgTLdZnwH3VW9kscMvZTWkHg3aizYzKt0l0S4y9nYucyk2hi97WBsnTp4e6U7sh2pewPJvlNNkASKVvH6Gq0QJOk0LcfmfJPmkly8U01ea4vg9MUx116jm8lMwgxMuTAAx0NDqyjG23E5oo3VZ3Il8aP62ragyzrcXtlu6Db3R8O5LEIEnngaMNy8AQC+Qw9CR3UkboZrG8nEFEcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(396003)(376002)(346002)(366004)(136003)(451199018)(31686004)(2616005)(83380400001)(478600001)(316002)(54906003)(6486002)(6512007)(6506007)(53546011)(6666004)(26005)(186003)(31696002)(86362001)(38100700002)(2906002)(5660300002)(66946007)(8936002)(6916009)(66476007)(4326008)(8676002)(66556008)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3lLVldFakJkeUZnbU9zcUFFOGl3NzhYSzIvSUdqOEEvR0R6VDQ1VFlPZ09D?=
 =?utf-8?B?YjNkNlRJNzQ0bVNEb0Q1eVZrdUhRNGxSUDNIRHdTbm1EWjRQVnpuOFVXUHpu?=
 =?utf-8?B?bmtFeFVKU3dzYXQvckxpTGs4UW1XQjZoZ3dUVjFjNGQwd1Q0OXJoWWlxbHY1?=
 =?utf-8?B?bWk5QjJmaDZOR3pFY2hsVnluWDZoSkJZU3BaMGF1azZXc1B4c042azVpWmRI?=
 =?utf-8?B?cU92SmxWSmpzTTl1STRzUGs1Mzh0Z1k3SXJyelBoTGVpb3FpTnFMVXJKL0Y1?=
 =?utf-8?B?aVpmMmVuMlJGZFpvWk9rb0s3OCtJaWZuRm5POEw1WUp5SlExZGRFb2FaZjlP?=
 =?utf-8?B?OWdBRmh3NittWEo1NEdHU1ZTZGNxekMyaEk0OVNKdDlmRG1jNkRqZ3pLeDZL?=
 =?utf-8?B?Ump5MHNQWC9adlkrMzZBdjJUMmZWTFBwR0k4VXVMR1ZZWG1Rdjdhd3o5QUw1?=
 =?utf-8?B?RDF3MHZQbzZ5Z3NKenJlUDI0Si9ySTc0Zk1vMHJhb2tCakEvekxnblV4aGMr?=
 =?utf-8?B?WFVsZ3VlVmxHZzJYZlMxUTdJb21TVnRsKzZHVnUyOXlXK2hpbUNGazFEVm1t?=
 =?utf-8?B?cERTUE81bmdjRnRYRy9uSmNQR0k5U2Y3RXlzbDlwU3JlcXBzMzEzZWltbXFV?=
 =?utf-8?B?YjBxanpLQm9ZenpsNTV5MFBqZktsY0xoc2lRNjhHT25yVFFPM3BvemYvbTlu?=
 =?utf-8?B?RWQ3TlJJRFh4NW0ydHBveVVkcEZJd3ozQ1lGR0ZhNElVck5CWTJFRFRRaytX?=
 =?utf-8?B?aERSbVB4QzBZWUxjTnhYZUxRbkhrTGtrenptRGQwalowTHU3Z0NPSUVYdnpR?=
 =?utf-8?B?NUtWYnBiUmpFc01vZjBUM2pRMkE0NUtVMVhwazgxcG1Zd1d1TzcwNldUemVT?=
 =?utf-8?B?aEoxYWZyMVcvdHRDNExlUG9tNEwrOVRMcVhCYWVDa3JIcHVMMERXckZFZW1l?=
 =?utf-8?B?VU5nTkRGczJiWkFpZnZoS2k0YXBwVWw4KzhoSUhSNUhoRmY2Z2h4L0g1U2hn?=
 =?utf-8?B?dmQ1RjlwanUrTGVTZEIwWVpKZkUvTHI1cHFrbDZRb0VVYWlaeEd1cGdCbEpi?=
 =?utf-8?B?a0s0d0xtSFlZaW1ibDRYdlViallqeERWdkNrVW1Hak9ndFd4T3RVS1lPbmtT?=
 =?utf-8?B?NEUvV09RMXE1WWV1ZkUxb1pNRmg4aUJSSFpTcEprYVB0Ymk5VTB6N0hSdEUy?=
 =?utf-8?B?UEF1YUhvOHBxLzhZSTJ0b3FBcFliVWRNZFc0K2hXeUh0UUdtQnVRYUd3YzFJ?=
 =?utf-8?B?VVhXQ0lDTjFMQlIrUkxEZ1FnM1lEOXczQklJeGZ2Q1JvNDVvRkwzRFJqNmk4?=
 =?utf-8?B?TnhVQUgvUE9GbGdKU1l5Z1hRaVhneExIcmFsamVuWWNpU1pBWkMxSFlTR1Ix?=
 =?utf-8?B?aU9Ia1dDVDkwMmRkQmoyZjFEWm5BTlFOSXo4QUtzdDFKQWVqUXBmalJaVWZ2?=
 =?utf-8?B?bFJlWjdpYlNyM3hVYlVwZHBhNEUzQ1RPc3Iyd1dOT0swOFlXOVpvTGRValZx?=
 =?utf-8?B?YXQ1TWhRa2ozcHVHb2dyVXM0ZnhYMGRnRE1QckhnNCt0QklUbjFCS2hKWEJk?=
 =?utf-8?B?OXl4WXhYVWNvVDMwN1ZxWEkxMC9qUTB2TjNwWmVDbTExR0g3dTN5ZVlRRXQr?=
 =?utf-8?B?QlBrN1daV2NvNUh3RjFmUCtvMHQ4SS9ybk1vUFV0a3VwNnhoRzVFMzJ3dHVD?=
 =?utf-8?B?T09mQzd1bWVzNEdtV20xR2NjRTlPNHB6bk9ZTElnbmt2bUpEUHpFQTRWVnF4?=
 =?utf-8?B?K1pzNjNxTEVGanhWVEM2V1c2Z1Q2SG8zTlZ3MWFwVHdkbnd1SFZhaHZuNzRu?=
 =?utf-8?B?TEhmL2hlRHFVV1BtVXdUaGlDcmUvL2FVUm85akh2R0RreGxUSEdQa25jb3hx?=
 =?utf-8?B?am0zbUZvQUVvUjRlUSs1VG1YVUlvdW4yWWdXMzJtaFRuODZIcDVTTTh5R2Z5?=
 =?utf-8?B?MUtQbG1RZEQxWDdZQnZmdW92K3hudzRPSGc0Q0JJbkQ5OVZRU21YU0lqTzBS?=
 =?utf-8?B?NTdJVEwwbFBYR1JrTUZwRUhvcjdvRTA5Rk5vNGl0RzR3UllPZ1VCemhtT3py?=
 =?utf-8?B?cjcwZTZhTHYwSHVyZVJUZ3lhL245ZGpDZmd0V1o2U0ErTWRSNEFFeWtRV2dO?=
 =?utf-8?Q?YW5cxFBvcV9Q0UIXS664cu/+E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c42250-ee45-4b02-5ba3-08db2934a99c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 11:17:16.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZbI83fZ80WQNmUboBKVFui8kG3HqeoBpPFdz9pLcngf/nBUR+RRaEQheV/BhnC/biM+Kd3s0e5ZUhm1+7O/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7125

On 20.03.2023 09:19, Michal Orzel wrote:
> @@ -483,15 +485,34 @@ struct domain *console_input_domain(void)
>  
>  static void switch_serial_input(void)
>  {
> -    if ( console_rx == max_init_domid + 1 )
> -    {
> -        console_rx = 0;
> -        printk("*** Serial input to Xen");
> -    }
> -    else
> +    unsigned int next_rx = console_rx + 1;
> +
> +    /*
> +     * Rotate among Xen, dom0 and boot-time created domUs while skipping
> +     * switching serial input to non existing domains.
> +     */
> +    while ( next_rx <= max_console_rx + 1 )
>      {
> -        console_rx++;
> -        printk("*** Serial input to DOM%d", console_rx - 1);
> +        if ( next_rx == max_console_rx + 1 )

Part of the earlier problems stemmed from the comparison being == here.
Could I talk you into using >= instead?

> +        {
> +            console_rx = 0;
> +            printk("*** Serial input to Xen");
> +            break;
> +        }
> +        else

No need for "else" after "break" (or alike). Omitting it will not only
decrease indentation, but also make more visible that the earlier if()
won't "fall through".

> +        {
> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
> +
> +            if ( d )
> +            {
> +                rcu_unlock_domain(d);
> +                console_rx = next_rx;
> +                printk("*** Serial input to DOM%d", console_rx - 1);

While I expect the compiler will transform this to using "next_rx"
here anyway, I think it would be nice if it was written like this
right away.

Since you touch the printk() anyway, please also switch to using the
more applicable %u.

With the adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

One other transformation for you to consider is to switch to a base
layout like

    unsigned int next_rx = console_rx;
    while ( next_rx++ <= max_console_rx )
    {
        ...
    }

i.e. without a separate increment at the bottom of the loop. Which,
now that I've spelled it out, raises the question of why the outer
loop needs a condition in the first place (because as written above
it clearly is always true). So perhaps better (and more directly
showing what's going on)

    unsigned int next_rx = console_rx;
    for ( ; ; )
    {
        if ( next_rx++ >= max_console_rx )
        ...
    }

Jan

