Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB322758FE4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565638.883961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2En-0008Oi-HK; Wed, 19 Jul 2023 08:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565638.883961; Wed, 19 Jul 2023 08:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2En-0008Lg-Do; Wed, 19 Jul 2023 08:08:45 +0000
Received: by outflank-mailman (input) for mailman id 565638;
 Wed, 19 Jul 2023 08:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM2El-0008LW-Rn
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:08:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 795d71d9-260b-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 10:08:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 08:08:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:08:39 +0000
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
X-Inumbo-ID: 795d71d9-260b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K409wA3uhtHazrQ46rFhYeoLsk9gICXD9+0T4UYKMR5cmeNosqTXmRRCsuELqGRlj4Romu5/qaYZGFV3DrrZgcxyNFfG64t0dkaH4WjRL3VmLSC06eVTjL762acJgqcPCDio6gnXVeU2xYtBxOG/wJ7TQZBkEKQ3eks4utuNoXlmnNzuNthMmDU67EsrFo410eWQCleaVZgmen4B6vGO16h5z8y7S2CYT+VtXmLydk0DiA88H4dwUd8YbWuJnnwfWldhZ++67f9z2IDGeMD3HzEf9voIBaT2reFrvnJtixfBxpQeN4pHLHuRBf5m5Cau9reEklKduNbWUJ4XMCb9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTLgFJWNstHopnT5HXG6kEe/abyzGC77JFD7tO9ND/c=;
 b=HgKccJ/Gx31tq9vnqbFhGTryTPJR86NSXDaYWzJWVwF4m70a5xbOMG7USCT156nS9YmMJfsUcKy9gb867fcmgHUbU7Awt36dHirhUnVK102Vtn74Xo1s6vrUZFSiLXeox3ulEen1mLxgbFVkAZDjpwnYyRIdx4pntAEyEeGD/TnHkuhBPCpl3xEg1rDDZRBh0ltdPx8V5TX+w71EfKNlV5ZfcvFJ3Ril005S6YkgM5EwrklEpg69Lcu0TigYmpCa0xb3yHHj9LrsqfZvWRj0XoMf/OLB5jjKPFOrz3RbvUq7K/6Epa6f5iO/LWSauyXV4eEq/MP8iS3VCG0Kgww9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTLgFJWNstHopnT5HXG6kEe/abyzGC77JFD7tO9ND/c=;
 b=NA9WwcFc71pR0g3GjPlwFxYU7ODKuQSYPS6E6hnH0Tbx382rfgsI5yVnnVkClYJyubEyfXBZX/9H/aO/GBKvbz9ND+msoQmvkHCCbuO9rPgbRdgZb2+z47XMrKvVRF6w3AD5z79VFE+yIlR3a1jLfcuX2UC+yqimyLL+8HrVQOV/i6lrO2u0JWC87u5rMsHcMD9yOwTxuZeThCC3vZ7PyTZO1GXRg734Gm8bl4Cec52jfMm8QgI9HyS049h9QLvhK2etsG5xgnk0tLJUYyTr26A9Sgj9fupAMCw2Wq3A5k+5W1hvwQ2IoaxKUgpkRSn2Q4JXTuYpqfRosxsIkJ89rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e760026-9883-1eb9-34de-b637ebec0db5@suse.com>
Date: Wed, 19 Jul 2023 10:08:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/4] common: Move a few more standalone macros from
 xen/lib.h to xen/macros.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <10ce452be68b4f83213f5199a3b84459a479bcda.1689710519.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <10ce452be68b4f83213f5199a3b84459a479bcda.1689710519.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB10015:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e30d47-72ba-49dd-a9a0-08db882f5c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/JvD1BVIEQbsPrKBFo949jJPrukM1NzFAVbCfzsIiI13L3hCOJTVPR8g1w3EwfmZOa59gtqS+IFHaddAoJpouJPQuzzHjOCirPSScfWJ5gT2tqYrLEXkrryqGC3SEOdjaVYnq44A23KGYaJqMdfKSDs7TeddNwwI7K9qDUuFixDZzeiJ9PF1EyQcyfvsmf3UrsTNgEauVdgyOKnhP5umOHgdzqIzOHM5VqrFxTDKychYlSEyxkSHIpFlSugzPU3Qk6uXatO0L6r69l+Lip5tszPRg6Udo6F/dc0FNOXIVkzMswTnpolWGRdKlyzoLpCC9i411uMUU15vV/FWLReUC7EAnFg4MdrqVDT5I9/d73UXYp/6SccpKneo8prO8XrANlF9Ty35X1pH3nfmIiEHixSMBGJyZLRe1K4aRAjCerK+hlX3kpmPr9Rt8Rpo7UkqmgcMhm5OVzxNyK0CEQfSL3Apbw77q8Y2FA46JKNRqQSB2vRKDSKD6EXxZaZloZ3yxeaqHhy8rh+U7E+0HOYou5oVAFdIZ3Aw/y2SmInSKe5oignk5gXe3mgbXksRncQQ29oyAA/kILnvyU3CrIyk/wyWW4TOS2IpjuHdkKhMpKSDBb5xU5MpeJK1VlGx9rmDnCX52wb1bTMIo+KZ7U4kNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(31686004)(36756003)(86362001)(31696002)(2906002)(6512007)(186003)(53546011)(6506007)(26005)(6666004)(6486002)(54906003)(5660300002)(6916009)(316002)(2616005)(66476007)(38100700002)(66946007)(4326008)(8936002)(66556008)(478600001)(41300700001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VktoYVpSN2x1Y3EwK2dab2FnWm1ZR1g0Yy90TGFkT3NUQm9kWk1PQVo4RllB?=
 =?utf-8?B?YXJDaDQ1RHZmc3dtZVhFU0Nvd1RhTXlSWWRVcUxBb1gzNlRhTE9tcXpKTXdz?=
 =?utf-8?B?cER5dGVJV3BKT25IaDRNd3RONzNjUU56UFhxYVc4TnlWQ3ovcWRpSXlpdkhT?=
 =?utf-8?B?cUl5bE1SWmNIVEhxNkpGdzArQmd5VU1Ga0ZpYzRCOXdVeUUxcmZIdDZqa0lP?=
 =?utf-8?B?Vm9DVk94SldMbFhpTkVNQ29YWGVOVENVUkw1dHlFV21GTE5DTFRGenQ5NWdT?=
 =?utf-8?B?RktheGFOcXdORFAyY09ka0ovcTZIcm92SDhaRm1WT0NqQjJtVmI2RElCbExr?=
 =?utf-8?B?RGdlS1o0RkE5Ynd2MEJ3b1R6VGhVSkVCMXliUHZtZGdzbk5TTmNLZW1QWm02?=
 =?utf-8?B?VUY3cCs2WnVpK0UvZXdFNU1OS2RHV3MzVzJMTDN0Qkd1VVZuSjd0eFFia2s2?=
 =?utf-8?B?NlNndy8yamdqb1FiK1ovRzRnMHJlbHRLR24yZzRKWkpQZGJsdDJXWFhVWjlK?=
 =?utf-8?B?ZUZLOHVsTVNzeXFBdUpXb1FBNzV0YzRLZ1llNUNDNFEyRGh2YUFCODVGaHE2?=
 =?utf-8?B?dTA4UDBxRlBxSnR5Y01SRDBqbWlNTGxvbWlWWnU5STJGOWdTZk9sRm5oZnJM?=
 =?utf-8?B?NnE3SGp4NGd4aXcyOTZNeWlPV0xKWk1uT1U3UFV4cUZmdjBwQm5VWHZqblVS?=
 =?utf-8?B?dlhRYkJZSjZiRkVSL1I4VStDdVhlNHhmek1kZW1hSzdNS29hRE8yOWd3b05H?=
 =?utf-8?B?bDRJcm5tMStub2tqL2VUYU5BZU04UFFSWHUrL1BQN3JDcFA1TlgrWFdBTnd3?=
 =?utf-8?B?TmZNRnBjck5WODE2dWduNHF4dWYyR2NlZjI5Mm9qU0x2WG5tWHVNZDBYbyt4?=
 =?utf-8?B?OHRIUmZBRDF2OG1ab3cyTUphN0hXbzJyejJIVDV4NVZoR3YwL0JFSDlVUm00?=
 =?utf-8?B?SkhHc3c2U3JDRkxKZG04UFFSTmRna3JoOTRSUDQvbGtIOEo1NERRNitQSWpz?=
 =?utf-8?B?bHROWitvVFFkTXhGTjJZTW16L252TThZRy9IbWJEOThIV3ZDYVVEQTJXaVNa?=
 =?utf-8?B?WU9NaW10eGpOT0VDSWptTHNDVWlxYWh1VzBLMVVicEhFQ05BQlFGL2RkMC9Y?=
 =?utf-8?B?MFh2Nzc1M3VKdTc4S2Z2UDRHaG9BenExcllTb1RBM0dIaXV5dVVvVkZFZjVw?=
 =?utf-8?B?M3I3ekk1OUhtNDQvSDRFL1RFdFBPNGgxUEJ0TVJ5bXF0dWs0Wk82M1Z6M1B3?=
 =?utf-8?B?TW1MN3NrRkRQNVhLR0p6d3lGdHB2NkxZanh0YmY5cjczdVJmY0hEQzV2VHRU?=
 =?utf-8?B?ZjBXREY1T0wxWjhvM04xSDVSck9GMnRaTmhtOXQ0Ly9FajlkTE1JNWNiM1Zt?=
 =?utf-8?B?MHpUUlNBQXl3a1hBU05ieEl3UmNLRTRKOWVYWmNabGd3SWsvMjJIc1dqcUJt?=
 =?utf-8?B?RFdJdDE2bkJjb2N1ZUhaQStmVUpvcXNSVWsyeWp6eVB3MitTUGdZUzVDTHVB?=
 =?utf-8?B?WXF5SXBwSXhGOTVwVTJZL3dYRXkvYTh4VWZ4d1dyMEVLVDUzeDFXMEhHRHgz?=
 =?utf-8?B?WFR6S3hBbVJUNzEvditTTDc4MXkwTE9WUkhYY1dnVXQ0YVdXM3NJTFpwWnlt?=
 =?utf-8?B?WmFyRDBtRExjVlpmTXU1U3Y3WW50QWNpRksyQk1BeVFiQ3duTnQ3b0RQdUtr?=
 =?utf-8?B?OWtFT21YYXoyVCs2TCtBL2lTSjBDRndrNE0vVDFodUxBWWxlcWcvM0MwWXBX?=
 =?utf-8?B?ZERGWWpCWE5zRWlOY0lma2VRdkxYU2F5OGphOTZiZ202VlVsazhUbEowb0lR?=
 =?utf-8?B?RU9ZMXpMbXNOVXVlRjJnS0V3bzRtN055RHNEVUQ0NXE2dEJMakVlV0QxVm5L?=
 =?utf-8?B?TTIxRXpoOENEcFJSNkRRbE0rUEtlbm1MTEVMaEV0YmQwRmlaRzg4TWRydzFK?=
 =?utf-8?B?ZWpjZnNxbWRnWGZ6KytUeStXeENIYU9IUkFVVjdiYzdMV1ZZRjZ1YTZRdEVG?=
 =?utf-8?B?M2xGRVV2Uk01bjNyMmhwN3hkeHJTL3IyN2Fxclg1Mkg2QU5pTk9jSGJpcmg2?=
 =?utf-8?B?QWU2cVRTbkRFYmRtMlZ5UGFwakJJenNMUVVJNEY0ZTIyc3pMQjYvT25RR1Rx?=
 =?utf-8?Q?6B24hxwPti9tt/LDnNEqeCtZj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e30d47-72ba-49dd-a9a0-08db882f5c37
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:08:39.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlK3eaXW5aXWWsyw+whjVQ/uj0KL9cSNg05BEdIgDPHs7RcScTnnhEL1Cf4cfRr63I9+zTkmIAjFmWGiDUHJaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10015

On 18.07.2023 22:20, Shawn Anastasio wrote:
> Move a few more macros which have no dependencies on other headers from
> xen/lib.h to xen/macros.h. Notably, this includes BUILD_BUG_ON* and
> ARRAY_SIZE.
> ---

I would have wanted to put this directly on top of my patch, but
the submission lack S-o-b.

> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -22,6 +22,38 @@
>  #define __STR(...) #__VA_ARGS__
>  #define STR(...) __STR(__VA_ARGS__)
>  
> +#ifndef __ASSEMBLY__
> +
> +/* All clang versions supported by Xen have _Static_assert. */
> +#if defined(__clang__) || \
> +    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
> +/* Force a compilation error if condition is true */
> +#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
> +
> +/* Force a compilation error if condition is true, but also produce a
> +   result (of value 0 and type size_t), so the expression can be used
> +   e.g. in a structure initializer (or where-ever else comma expressions
> +   aren't permitted). */

While moving this, please correct comment style.

> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0)
> +#else
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : !(cond); }) & 0)
> +#define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
> +#endif
> +
> +#define ABS(_x) ({                              \
> +    typeof(_x) __x = (_x);                      \
> +    (__x < 0) ? -__x : __x;                     \
> +})
> +
> +#define SWAP(_a, _b) \
> +   do { typeof(_a) _t = (_a); (_a) = (_b); (_b) = _t; } while ( 0 )

While I won't insist here, it would be nice if we could also get rid of
the bogus leading underscores as these are moved. Arguments here don't
need any, while the local variables want to use trailing underscores,
like we do elsewhere.

With at least the earlier two items taken care of, feel free to also add
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

