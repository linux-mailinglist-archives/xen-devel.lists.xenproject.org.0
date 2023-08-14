Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACB77B201
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583197.913269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRa3-0004op-Fv; Mon, 14 Aug 2023 07:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583197.913269; Mon, 14 Aug 2023 07:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRa3-0004mk-DA; Mon, 14 Aug 2023 07:01:35 +0000
Received: by outflank-mailman (input) for mailman id 583197;
 Mon, 14 Aug 2023 07:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRa1-0004me-Cd
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:01:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646a205f-3a70-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:01:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:01:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:01:26 +0000
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
X-Inumbo-ID: 646a205f-3a70-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxn/pvCh6+SCTCK/Gx5Ot7y9kV61HXdFEcHMwPvTJSJWsCoyD7pQdeHiIvnt9pMkS1mfmIedDSxUP8vJzAy4GsfXjIZ/Bh4XoGkjrwk52bg1yjllVrsgEREBqycXT6/RBekyHy9k9rUZbypRxd+4+8U2+dJy6AVaCzCcpNE+w0BE2kRVeUQ6Dm/MnToa6sj9bvP0Iy5BcUxtq4oaidiqsSlBeEbEhPkx6H1Sy+9wY+Y1IzCOK520ma6N/ROu3UYhP5LlvKytDSWMOhLG019vXEhzK2bJoZiASPElrY9GYS2jLWXTvTM4pW5G2s6TSDrqwglGykOJ82qGN2QlBS1pFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1TaWfAK8zPMzI0vkcj0Mhw7WAm+eTG8m7gmeGKT4rM=;
 b=bo2ZqeEi6WVKpXpW7fm32yX3lAVcQXXE7ifhbs2TzxIDq0ENChKDV4ZGMrPssARssoA2GuX7/HaJT8OcG1o29PwRmnCoOW3DCF2PjnNXCYjvDk4trDs3Nz6/AgD04Cj83rnDmySOKe9cQt579LxX+eFZt3GxXuWM39Y0VJPPesJsLPC+K07w5waMsISH2+p+XnjJ9q/U5SLdu/bfFIseafMjuHBvRyCz9yLsw7ihpoyK3JjWgT5jYp33GEvZBK6SOIW+WDx3LWa756l9K5Kdv2Tmahwq2Bj4nm4lZQfbWar/NT35j7Z/dtwpracQSaV1uI7R1VJ6fltKUeoxwX7AVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1TaWfAK8zPMzI0vkcj0Mhw7WAm+eTG8m7gmeGKT4rM=;
 b=TvMlWvlcgJbBTVCYXnr0Um8tBH+fAkfMkcP00Djdlet4B+UulS7/q/qsUKo7mPz6l9LKQwN8WnjxqACfwj/tdRYRBcx1/qCYqKynsOphw+5u2g0ruh4PDtH5oMJ8pbUL79T1pStnKxjUzEdMzuUswWYYdRd0UMdWk8/yoXQnCARlievhiRwpHrUxyYpkagVtH3T3kggCl1ybIE+5Lzin4+vLpMp5g0lMrTmA5Xr9TVMoH4biblDGq0wFduIPWQLMRzv3rca5vwl62YGsnko7XelF46icf2YEygtiOE8XjP7X9n0icBQJgeEL9DE0Mmy2r2qligsMyUFiXOcHQ6qy5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41f5ab35-504d-4310-db72-8a9e3ff0a890@suse.com>
Date: Mon, 14 Aug 2023 09:01:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/5] build: make cc-option properly deal with
 unrecognized sub-options
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
 <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cdc3b9-c3c4-49a7-2b5c-08db9c94472a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ak+Dw/m62VFBJVv5SlmAyDZSug9SMnwypdb6LS3gr6+qDP0A2p+SnsRLPJQMVhvUo6QXU0mhhIpwZg1csLkLcM4wva0IeZ2GhpNOuyLQP6ioDPgssa5png2g32thiPditNqodcbCFMMA+Ws2HwUyXwUWE/Gn2ruLqJ+iqNttJYxDwP3JiVxHQYoL/o2onbDCwQnG2CRaA0CYC95tVQMZWJIJIQd4y0Px3nlSWf64OFoKVI4wnjNhyZu8kqtcr0niDchoDWuWa/bQRt0hdexN2flBpg9hLZgb1m4Z0OCZL2kF2AkKiKleSaKX99WcweDcVkIKJWImw3oM5LH42nwDWyFouB4xp4byms/kR5a07++4hQaq42VjoutRuGrnYNtyGs3HnyHAzUPCLNu1vFV5HmrfnFIs2rZFm6raU5B3jg33/T0zhB3Nn0NPUzPVzXPHa7ZdlAW1wOTLdgCj5sLPhJxzhJTDaNzKWmT4TCsJgM2XK2mQxUOM9y35eLrA0s5jjHtZlpAFX/KH45eGBVT0vr9M4sbaVVvCKMJwS+yFIeOlnycdwGHC0O6pCGyooRNFzohtSMyDr0pTCED+khF3QRSSuiDqrZFHRFirM17Ni/kUWPbPMvN3/GhL5O0QT3PDl0WcWeSMzebve4mSLSrMqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(1800799006)(186006)(451199021)(83380400001)(41300700001)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(31686004)(2616005)(26005)(53546011)(6506007)(66899021)(6486002)(54906003)(478600001)(38100700002)(31696002)(36756003)(86362001)(6916009)(4326008)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhyb3lQUVBkSGt2V3VoVkprTjVzOTllaGJTak5xQjcyd3A5dmhEQjFMcGNV?=
 =?utf-8?B?VmJJTjB0MlhQemNOSHJhMXhJdjUya0NQQVZraklwV1NoQUtPSkhieTZMTldG?=
 =?utf-8?B?Vk11cElGOEtOSld1WFg2Z3pkcE9ZNkRxeG1jZ092bXVoMzBkZ2pOT2pBMW9P?=
 =?utf-8?B?b3dyWWQxZE9iNVc2a01IdDVneDdpbHBWZ1N6Szkrd2dYR2krQzJWQmovcHFa?=
 =?utf-8?B?cFVySlF0cEV2bWM2QkFRNGgzRkw5eEFnTGtJL1g1MTRMK1dRTS9hd05DNGhh?=
 =?utf-8?B?cys3bWpFVTVsaEpRNHFFcFdBYW42SWxzM3g0ank2a3FLUU9ZUXY5TDVReEVi?=
 =?utf-8?B?NjVQVkh3MjB1cy9RSzA4Y21JKzhLSnJmMVhoWjhQNjFDaklpU29qTUxBQkxN?=
 =?utf-8?B?TTVsUEdMMldVemlOQ3RhL0JUMzhzL1hFYittM2RWT3V2WldiTVZSMExzdTha?=
 =?utf-8?B?Nng2N2N6dkFuaG9lQzdYTGZmMzB0ZXdPUEpEc3pDOUxZNEZOcmdrVWRJRjkz?=
 =?utf-8?B?VFk1Z0piWGlDYmt3MllST3R1WkdZeGtmNmZVdXZvdXJXVERJRFA5bCtBckFj?=
 =?utf-8?B?M3l4WEVPSjQ1ZjZ5ZkdKbjNDMVNTdTdZc2o4WU1idXdoMzNKUmp0aEJTREtR?=
 =?utf-8?B?cy9xallVbDhDMDE4YnoyOGtTcnhiM2JhMnNHcmt1T0J1amZ2bFJucnBGS3gy?=
 =?utf-8?B?SUlpUmNrT0ptMzdxMGJWb3B2N1laTWF1UWQ1bGFLRGtnYWE3VWZKZ0dralc0?=
 =?utf-8?B?aVBMMVJFZWh5U3BleDlnZ0xWTUV1eWpSbGltcVNZckZmcUR3bElKQ3ZyVDVF?=
 =?utf-8?B?ZGs2MzZ3Vy9PTkxCYm1zRCtxSlExNlNCK3UzRUtzK1oydlZaKzBPTTlVTSs5?=
 =?utf-8?B?aFhGTWlrams0ZCtkZ05aNzhabVBWS1k1bW5rbU45YjlVclVxUzNEYTYwMjkw?=
 =?utf-8?B?c0I0eGYwS3daVUxQOGJYUVFGTTdKNjAwekNUKzFJRjl0NnNpazI2aU92dDBs?=
 =?utf-8?B?SnRYU2pWamlFQ3kzUlFSTE16ZDZIRlhHbW9JSE1FdllUaWhTMGplWm9vcjQz?=
 =?utf-8?B?eHBVdUVGMng4NHlyaVY0VVhFdUxFMXJEbzV3NmxVYndaa0hja0NqNjJaRCts?=
 =?utf-8?B?azdhajArTGNzRndqUHFIemEvVXZrN2NVcE5QeTVvUXkwR0ZkcFI2eHFEQlRP?=
 =?utf-8?B?Nm9LTm0xUlQ0aUsxVlVsWi9zMERvSWsvV0xWL2V5Y25QZnd2VlEzRzNyT2Ni?=
 =?utf-8?B?VmRTVU9ZWE4wbDFFQ0RoclYwNlozQXlOczU4R0YrNlh1KzJxend2dy9jL0ov?=
 =?utf-8?B?bDdsc0tSMC9XRXltNFNOcGc5cHMrTkF1b0JHTkFKVUFqc01ESGlUN2VMSVZl?=
 =?utf-8?B?MktWaUpDdDg2U0dNNDFaNkpOWEhoRm5KV0NxTkJ1THdJVVI4VnhLU2F2TFpJ?=
 =?utf-8?B?UHcyOHNMTSsvVVBNcTlxa0xsd2VSWU1xUGlVMUxFT0NzSk1FekFZZlM0a0Ev?=
 =?utf-8?B?VmdyVDU5cVQ4c2htemJDYWN4aW9LQUcxTUFFcmJ0MDJ6ZEY4SnUvTFJ2NjlH?=
 =?utf-8?B?enJBaWVTbFpjR2Q1d2RBbHJrY1h2MzNTNmE1V0d3VWpKYWxuR3hjR0FIVDV2?=
 =?utf-8?B?NlVLL1VVWVlONU9NWVRxalZhYk5HU0liZmhSQlJ3cHBnS1FFV3h4TnVQR3N1?=
 =?utf-8?B?ZGlOUmVVaXA4T2h5dXZqV0hHdlJEcTFxSUJUUkROYzFoVjlsTTNsenhOc0VL?=
 =?utf-8?B?Mk9JYm5wM1dKSWNRNVoxelVXU1FKbEYvZUlHS0w3eSswUlZ6cmpBbTZHUElj?=
 =?utf-8?B?Y1VwSTVsRTYyV2U5MnlVU0lVRVVsOGZwTmZneE9LYWxmS3d0SkFpN0JZaVFD?=
 =?utf-8?B?YUVGUHRieExZc1dEZGo5cVJTZXlVUE1mdHlQQ05KSVhPeFptVXRmS252V2V5?=
 =?utf-8?B?aUtxRW9XOG1DWjZqWEZRUmpEY2VmTUJpanpkNXEzYXlrd214TURoZWdzd0xs?=
 =?utf-8?B?MFh6dVZTdWFmODRhU080M0UvRTk1SWpEU3BHeFF6M0xyVXROV2RRVjhia1Bt?=
 =?utf-8?B?Z1l0WTM2bEJHTUZ2ZFZGOWprRTM5enRFTHREanFqbDhWcldyNFRwR0ZWUW00?=
 =?utf-8?Q?/g9GxiPDqd7HTV16Cb5YSHF2k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cdc3b9-c3c4-49a7-2b5c-08db9c94472a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:01:26.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhyYMatQbsVCK7XteIJKA8qR++L4DI5rrvPRcV4puiRpeRhHg+8lPX2oen+xVnpQ1uv14EYxbxfIcGSrEJy0lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273

On 11.08.2023 15:48, Anthony PERARD wrote:
> On Wed, Jul 26, 2023 at 12:33:07PM +0200, Jan Beulich wrote:
>> In options like -march=, it may be only the sub-option which is
>> unrecognized by the compiler. In such an event the error message often
>> splits option and argument, typically saying something like "bad value
>> '<argument>' for '<option>'. Extend the grep invocation accordingly,
>> also accounting for Clang to not mention e.g. -march at all when an
>> incorrect argument was given for it.
>>
>> To keep things halfway readable, re-wrap and re-indent the entire
>> construct.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In principle -e "$$pat" could now be omitted from the grep invocation,
>> since if that matches, both $$opt and $$arg will, too. But I thought I'd
>> leave it for completeness.
>> ---
>> v3: Fix build with make 4.3 and newer, where the treatment of \# has
>>     changed.
>> v2: Further relax grep patterns for clang, which doesn't mention -march
>>     when complaining about an invalid argument to it.
>>
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -8,6 +8,7 @@ endif
>>  comma   := ,
>>  open    := (
>>  close   := )
>> +sharp   := \#
>>  squote  := '
>>  #' Balancing squote, to help syntax highlighting
>>  empty   :=
>> @@ -90,9 +91,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>>  # of which would indicate an "unrecognized command-line option" warning/error.
>>  #
>>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
>> -              then echo "$(2)"; else echo "$(3)"; fi ;)
>> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
>> +                    opt="$${pat%%=*}" arg="$${pat$(sharp)*=}"; \
>> +                    if test -z "`echo 'void*p=1;' | \
>> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
>> +                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
>> +                    then echo "$(2)"; \
>> +                    else echo "$(3)"; \
>> +                    fi;)
> 
> This patch looks fine. Shouldn't the comment been updated as well? At
> the moment, it only discuss about -Wno-*, which it seems is why `grep`
> was introduced in the first place.

Right, but that has been an issue already before.

> But isn't it doing doing pattern matching on an error message going to
> lead sometime to false positive?

There's a certain risk, of course.

> Linux's build system seems to works
> fine by just using the exit value. They've got a few trick to deal with
> -Wno-* and with clang.
> 
> For -Wno-$(warning), they test -W$(warning) instead. For clang, they've
> enable additional warnings:
>     -Werror=unknown-warning-option
>     -Werror=ignored-optimization-argument
>     -Werror=option-ignored
>     -Werror=unused-command-line-argument

Ah, yes, this would likely be a better way to test things. Time to redo
what was done 12 years ago. I guess for the purpose of this series I'll
keep what I have, but take note to rework things afterwards (which now
would likely mean post-4.18, as the new-submissions deadline has passed).

> In any case, the patch is fine.
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Jan

