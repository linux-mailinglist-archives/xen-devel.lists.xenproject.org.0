Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA25666C08
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 09:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475870.737740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsXp-0003dh-NF; Thu, 12 Jan 2023 08:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475870.737740; Thu, 12 Jan 2023 08:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsXp-0003bv-KA; Thu, 12 Jan 2023 08:02:41 +0000
Received: by outflank-mailman (input) for mailman id 475870;
 Thu, 12 Jan 2023 08:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFsXn-0003bi-VN
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 08:02:39 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2073.outbound.protection.outlook.com [40.107.103.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a039cee-924f-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 09:02:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9058.eurprd04.prod.outlook.com (2603:10a6:102:231::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 08:02:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 08:02:34 +0000
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
X-Inumbo-ID: 7a039cee-924f-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njjk/Y+h9vzUI94IBkMpSJU9UTcFA6CnxwLiEjbrq5P8Ex/6qLhk+g1Q25v+gQmnMB2sHsdz29SDzMPZMsXiRzT/d+iH+GqwgWl/6Ndr/8NFKnH9BgyaHCXYRwUGd/P6oh9kaqzNRrSrvY2VrPrBcm+an0HnkkU04eMx13m4QAn0FPK2sswZfU43E7ENuV/27OtXvSe2YU2eR+atTVJ0riGbodvULCWNHdLQ6ByOyyGkR5E8IjG34s6K727ohcjDVgnRLQfshnu4YR0kdFho71DyO8XwcPefNNGI1MoOmqrbe8IMq3qr1pAyLuPKYEJhiLHcT4jRhaleXz88hmtqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW1je6TKGecW+nUZ6pRPQuvvrcIDDFkiUqbq4QqiJXg=;
 b=cFYrt1OtqzTfVigIgCRWWdRT00z3Gby0BWZdljt8jFFzTlXcFbOk64Z9Gc/5i/kQ0DhmfSkDUh5oaF/K2/tYXNKROxFc5E65NqRXyU06BqxDHeRZ0qekwA3RY/RS8PYJhyplJLTLspwlEsjxGTY/3+tO8+diRd8dLlvx/q43eOzcz+4dIQEUWg9Y5CC/KzpPAxNSCEQT0azRCH9ZqIyOTB33IysmhVUUJyGw0M8y/6nYDSYWwjlKxG+Ia+AjPpgjgfqz7mVu6ak9hYKnSmRay+nd5GNIBNIFzmG6/PRGI3OdMEd91iiu+ICbLcLtrv0QTM2Izwi7XaFRcfpgiNNN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW1je6TKGecW+nUZ6pRPQuvvrcIDDFkiUqbq4QqiJXg=;
 b=Xk7Uv767EggzijOpRjJd1HfNAhUvoTARckuo1bSib8InkmozuUFQAu4w92Ov2iSrjNWpbhAacJADMxM7IL4rzQ7QWr91lyPCWeS6cE6D/XFKkTbEE0kdpoGXPVqbEfwcijnKCKgRwQ6xYN4X46RFam0BJhvCYz6HsYsqy9+AlMerCgtVOkuPo2+iY808gK3OmByRUJ4G3sVyXnxLPTxJ0ZtFlXKVlVJzxoZ3akF4rbu4eeDheEReIOWYB+/h4IuA3NLit1qhU/i9GixrXI1mEw0p6OsD/KsoQPcVVN2hObbrRhGefuECfcM/QKlEAwr0xXSWcmcU0iLHQBUhxVt8gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbddd240-cf1f-b2e5-059f-4cc920d7f3b2@suse.com>
Date: Thu, 12 Jan 2023 09:02:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] build: include/compat: figure out which other compat
 headers are needed
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230111181703.30991-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230111181703.30991-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf2e183-8486-4c62-18d9-08daf4735c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8bkQ7v/5khKvo1q9fRECHGqC1dTRJex6UTORmXSiNuVjJbBdU60rDw7bD18LO/tZ69GYSgSn+B0R6JQnupS02yk+A2q4KMDrydC48GOO7ltA0eoTrF4i/fsEuUdRjSJC+bfkElPvTsTFs6lQ1Oh0x8X3a/ODPxJ8k3U1anzbQhF1PV03pS1LXn+bnhqKNpbs08+mcqqg55NdExxuQCPYB5xay/DFYqsBzr2czXxaeOBXIc2sSOn0ya77nxYGYgEl3UIwJ9sMoT+eeB9ihjHr9s4v7le3wbPBexhl+bXSshnm38T4+gDefW/MLG8JkR+yHsW974cfC50GKMjwWXwux6+tBQjtVO90fGMCg9oLg0gKnAgaJBraqPV7wSMCi4oFbsUxDqFNoJMGkkF9YXxjt+G1ZpEayEWw3dJ3h7n64daO31aQB6XZdOOIm4l1IcgAjGq/NPoO4r9rZscdBqM2TYESaLaX5SdPmJetsFOHZZGpBQFnErySHbXx1PYA0itnwAND75y0B4SaIUBo2ruJxG97W724i3BxFxJSxX26WKSq1aixu5qXZ2xNV84zBTdSoGaA5Q6bmgr4VNBKfllhAIpKiuF3/aRjiEN9AQz4a491tje3+gFVCR3pZ01/2EumtfOOeAgdOFDqtuOTASaid4ZDBw5vnDse83Sc+J8IcYIVTnHDvfllWFi2Gi+xwTT4Frjf9M3MB/N30LDRJ1HRNcCV6R9t2HXgC4EmHOKd028=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199015)(38100700002)(6512007)(31686004)(2906002)(66899015)(186003)(26005)(6506007)(53546011)(86362001)(41300700001)(5660300002)(8936002)(4326008)(6916009)(8676002)(31696002)(6486002)(66556008)(6666004)(66946007)(66476007)(2616005)(316002)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJWNkFXeUN6M0hyQk9ZY3p5MWFLeWplWEd3U0hMT1ZId1dnc3l0RlVkVVdu?=
 =?utf-8?B?TnZEdmJUTlFMTVNmSXhLU0k5eTRpb04yYU9oV1R1Yld2dHZNMWJ0b1A0dGlB?=
 =?utf-8?B?VFUzS3FqVStobU94aFZsYnl2Nks0Q1d1eTdGQ0F6RG9WZ0xTWGh0cDROaFZl?=
 =?utf-8?B?SUNIbmRaUXdiU05kWDJUM0NKemxoWDhWSzlWaUtPK1R4QmVPc3dvTTBKZ3cy?=
 =?utf-8?B?ZkhLVlltWFh6bTJXKzRHNVlLcjRWc2F4dTJ4RkViUmtrYW93K01BcHpYeWxo?=
 =?utf-8?B?ZzVpTXl6dDRnb1BPKytDaVVEVEtjUTRCRkRIVDdnb2NmVHpCV2p5TTVsNmNh?=
 =?utf-8?B?TXpLUDhDVnQ1YVBjQUdWMWF1UDJBN1ZOT1BDSTJSVlVTS3hLaEVRc2lXMWJq?=
 =?utf-8?B?T2hKc0tLbEJIeHh4UnZlTnNZcHZpUDhaUG55NVh3Q2lUK3E1c0FMcWllQ0tl?=
 =?utf-8?B?eURaVVNxMG51UjM5V09QK1pHbnVHcmkyN3JBYXNiMHhuWHkwYUxVMkJlZmp3?=
 =?utf-8?B?MW9sNWlYSC9YanRPSy9acGIzV0tTUHBNZEtrc1pFMnJMbm50YkpaVG5qOU5l?=
 =?utf-8?B?RE9JY0ZCZ2V1dEM3RVAzTzd5QTdYakl1eXl5ZGZlV3dMTS9sdzBGeTNkczF5?=
 =?utf-8?B?RjRFN25JaG51QlZnczlua0QvZkdsaHpXbjNrVE9vMmtQYjlsWUJPY3ZreWlR?=
 =?utf-8?B?OW53UDE4ZzIwdTB2dG0zbDFKUUdnaGgvc1BLYnJZdmt3MjFHOHMvM2d2VkdW?=
 =?utf-8?B?M0pKN2tDUEF6UFFDZDN3dXJZbHlVS2RLTE9vVEZzY0UzWlF2Tm52ZlhuMmxq?=
 =?utf-8?B?dnNJN09UbWtaeWlmdjQ3L29kU3VJUlo0dWdtellXWEVoaHJmcTNzWk5YK2NG?=
 =?utf-8?B?U3ExMmpOOU5QelhvOVhrK3duRThNa3hDbUpDUkZZYU43bCtkYUZGNkJ4T0wr?=
 =?utf-8?B?VVV5M0ZXMlc3VjRNdXFGMGtidW5yNHRMUWQ4QmtXNjIzUklKaGVkL3NYZWE4?=
 =?utf-8?B?SFVHZXZ0L0k4T2xZR1dIRE41bGdzQmZFSDRwWGNJN2lmMGFKRW5XZ1lPOEVH?=
 =?utf-8?B?dzc0S1I3NG5PR0FiRjd1SU5QaUt4MkdORlZHTWludXJwY0VHbGwrSllrWEY0?=
 =?utf-8?B?Tm15RnFueXlOL2hEaTZ1MTFxNCtHZTUwc1hiN3p1U21SYnFmSkZVaFVwcFNw?=
 =?utf-8?B?VGpJSzI3MXV5cUsxVmVxWVNGbTE4VGlWR2dxbmlNY2RtMlZVN0o5ajJsWmhC?=
 =?utf-8?B?ZU9jUFJOcE4zVHdZR3M1dFMyNVZYWVhzVldja1FTTTdhblljK1hsTTVUQkR1?=
 =?utf-8?B?RkUrc2JjeEVOR1lIL0ZsR3l1ck9wMnVnSFFVc3QwdHV1dTZqa2x5Z2xPNFE1?=
 =?utf-8?B?ZDl2NDA4cmJsaStGVTc0NXJRMVJDMExKYk9Za21aaWZ1SVN3WEpBSFBEVWJH?=
 =?utf-8?B?SHJlUXFGT1hGaGovRkQvVzlPL2x0QmNwcGpoZFgvVzljK3dzbFIxRjNrR01s?=
 =?utf-8?B?UnEvSmNvOXhtQVM1Q1pHMXRoYnNpb1ZKY05xT3pVS0VVc1AwZUFsRytLK3du?=
 =?utf-8?B?NlBhdVpONSt2ZmJTT3JReithY3A3ZUxYaFM5ZE0vWEMwOVhUQzRtUXN6N0lF?=
 =?utf-8?B?eDhCWFpCbGNBc3Q4aldQNElQZVhrNTF5WnR2Y211SlpvbW9wcTg4N3RHK01K?=
 =?utf-8?B?UnNGYnVuR1FsREgyeHBuZWc3OUhZNnJTdUQ2dXhlYkxMVEZlN0FvbUwyTUYy?=
 =?utf-8?B?RFI2dG5CVzBBcitCZmMxMVJPQmJTTWlORE5CbDRxNWJDWVpnaXppcEg0RTdC?=
 =?utf-8?B?REF3bW9DSHpJaDRBVFhBVytCRmpqZVAxb0hlUmFKZlpvcWFYeGJiWW1sU3c0?=
 =?utf-8?B?Qi9PdFdCSGVDK0hMTnZVVUVHa2pWU2ozT1hsTXBub1hNelNOYmpWMVpGWUtj?=
 =?utf-8?B?bGYvMjFtMDJHU1RjR3drdXduVXcwbDIydzNZZUxJQ0hrMXFvTDVXZ0VGTXI0?=
 =?utf-8?B?bzl3RlNwM3JRdm5CcXJnayt0ZFdGempaVklDN2Z6T0ZKRzBrUWpOSlZueGor?=
 =?utf-8?B?WXRFNVVEYXpxRVZhNFdRQnpjb09UOTQ5KzlKZHh1cSs1TUU0cEVMZUxzTE5a?=
 =?utf-8?Q?P17xF+uBwUgyQmXwCw5VQFIvG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf2e183-8486-4c62-18d9-08daf4735c56
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:02:33.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxlOGMxWAW7mn/WLc2ONJsO703NE0akwt5uWZwYAp6oWvupR6+run+h+qluPrjsWltUigJEmd7iBQhlStNXN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9058

On 11.01.2023 19:17, Anthony PERARD wrote:
> Some compat headers depends on other compat headers that may not have
> been generated due to config option.
> 
> This would be a generic way to deal with deps, instead of
>     headers-$(call or $(CONFIG_TRACEBUFFER),$(CONFIG_HVM)) += compat/trace.h

But it would generate dependency headers even if there's only a fake dependency,
like is specifically the case for hvm_op.h vs trace.h (the compat header only
really needs public/trace.h, which it gets from the inclusion of the original
hvm_op.h). Avoiding the generation of unnecessary compat headers is solely to
speed up the build. If that wasn't an issue, I'd say we simply generate all
headers at al times. In particular ...

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -34,6 +34,29 @@ headers-$(CONFIG_TRACEBUFFER) += compat/trace.h
>  headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
>  headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
>  
> +# Find dependencies of compat headers.
> +# e.g. hvm/hvm_op.h needs trace.h; but if CONFIG_TRACEBUFFER=n, then trace.h would be missing.
> +#
> +# Using sed to remove ".." from path because unsure if something else is available
> +# There's `realpath`, but maynot be available
> +#	realpath --relative-to=. -mL compat/hvm/../trace.h -> compat/trace.h
> +# `make` also have macro for that $(abspath), only recent version.
> +#
> +# The $(CC) line to gen deps is derived from $(cmd_compat_i)
> +include $(obj)/.compat-header-deps.d
> +$(obj)/.compat-header-deps.d: include/public/hvm/hvm_op.h
> +	$(CC) -MM -MF $@.tmp $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $<

... this removal of the config.h inclusion is to avoid introducing any
dependencies on CONFIG_* in the public headers (of course we'd expect such
to be caught during review).

I'll try my alternative approach next, and post a patch if successful. I am,
however, aware that this also won't deal with all theoretically possible
cases; I think though that the remaining cases might then better be dealt
with by manually recorded dependencies (kind of along the lines of your

headers-$(call or $(CONFIG_TRACEBUFFER),$(CONFIG_HVM)) += compat/trace.h

in the description).

> +	for f in $$(cat $@.tmp | sed -r '1s/^[^:]*: //; s/ \\$$//'); do \

I'm curious: Why "cat" instead of passing the file as argument to "sed"?

Jan

