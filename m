Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EA647FB0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 09:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457702.715675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZCz-0007u7-Ug; Fri, 09 Dec 2022 08:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457702.715675; Fri, 09 Dec 2022 08:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZCz-0007rF-Rl; Fri, 09 Dec 2022 08:58:17 +0000
Received: by outflank-mailman (input) for mailman id 457702;
 Fri, 09 Dec 2022 08:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVCj=4H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3ZCy-0007r9-SX
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 08:58:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8da0ae-779f-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 09:58:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7352.eurprd04.prod.outlook.com (2603:10a6:10:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 9 Dec
 2022 08:58:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 08:58:10 +0000
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
X-Inumbo-ID: 9d8da0ae-779f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTytbm4n/IQHghy6zM2T/iUkJ3tLMF+wmjTRfymWNZlpT3YJDUIgSyf6YghXujXivOGEakf7EOXqJoeWD5Ty8qEM2E9FpwkSbSOEWyo9mhHZEFnlDyCvTEPzmcpBHSrkJMBWGuXiBPcwvqNu13xsVwkI3++GmdAkLvll5M3JZRaLToOYCrDIUAtQxSusis7xq5B7SmtdyPL8JmLa6AIUGZEFeIpIFtEmO3Kb7CoQoXYVvPrVzrfjn0ZOGXe+dlnGLABURCyEAymrTnTG6LwAzy2pwOjCfvpMb4INtWAAuIB67g1IuyuCSpZYR/gd4aXpxsHUGd3SdAiYw5UM/9YxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFkS52ridadVxbHme1pKmW2X2R6e4btA1Hn+FJ6AETg=;
 b=VW1j688EUEiXAboL7oLuNXGebqlXlqY9mAzypdwJbO9rR0s17/jYelwZ/Jn1k0E6Lh8Es7eZAdLj5YTk9gffs9FhtkErVXTkdOOngttpwmoaxvMZWHRoMZOjShjxjUqG++wFCBa0XKGbUJ/b00J2kZyt7A/zVk9cAO14ZCOlET8KbRhQUARTHQDajEX4s4CmamNUGsGigHNorVjTNhXOuoZwoSRh321sSBMQRwxuwpHjSZTC8IwGL2JmRF7u0JcE/kydCawuf7JcpgEsQFH5BvJVmCcTI9TWoTPxFy3I/YxcOmupDBtXADCKKMvzsnUNISxOT/zJHolQ/l4JwL8ADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFkS52ridadVxbHme1pKmW2X2R6e4btA1Hn+FJ6AETg=;
 b=LHd5vea7DyfotteWw2sO68S/pP0w6w7Boy8++Jx60SUz6oUY36dRUZW/ry63YX0HanWlgFAD9Dg6PNiUpIJ8AWK2DNjdY31S0rUNY+E91qXpqqR22cgpVgL0mMoARC7vRJJkaPnLja8bENz2t5SlWEsKd53jjj7WUYQV1ye6Vc4D/VP0IdxqoIC8s4nu2/p6g32utlbt+ZoWfAbOcwFhZexcKn1jb2sDyyOoX/axi9BM0FeE9ZOF0XBsQqoxcs7v/5uwod3fc3BnTt4vFnRxZVsGoI/zzK5vdFdEylANvuQNPCsEiCbK7f8FUMreEjr1gjBhWCbj+cHIX2oJceGd9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb35b7bf-3a49-4faa-3ea6-a6076f032fd6@suse.com>
Date: Fri, 9 Dec 2022 09:58:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: MISRA C Rule 20.7 disambiguation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, julien@xen.org, roger.pau@citrix.com,
 burzalodowa@gmail.com, michal.orzel@amd.com, roberto.bagnara@bugseng.com
References: <alpine.DEB.2.22.394.2212081619310.3075842@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2212081619310.3075842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e910dd-8b8d-4798-824a-08dad9c37f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+IexkYMOJYlI9QXZgsGD2ygsfRheBYminw2r49fiHGF6V2Q2QYdsR9qgS0DJ4V43NL+eQfqvQK90L1/bAKDr0VVMN0+AK80K8pDOdHPC7tSCNC+7kyPvEYsU47zuc8BnQEI+PEot3y+jyD3AD5hVE9Wh+dJMb4fd4cpGUxa2JFQD+aP4sUM1lon56l6kU1ktA8QgLigVgbUObVzHO54cp9eYAJxHqVqDknjlEpPKb+x0Boi3FHaoA06Jzs3TSI6WSFxCDUjhd71plwFu/eFQ5/qU55cNrbXX5hr5fOhDTUoxajUyLa2t1nK+2cmf5/0WwAnUchEjVMO5Maz4nmBy72rwzhV5OvkHzZPqRqd4+TOtO+l6qLhin2muSzXMquNcM81EUxrvRQKg/kMNng28yJ/+EyCWef6aynhENiq1Go4CTAMNtk/GIRdM/1CXbdKUi1bMuE117h2droekVcN+hCQmF4y4UsPdUCw9upknt5OZwtS1VOKcxET/z8cfSCKZfdPlKT2Qd5I5BkA1txAAqT4jiFDzztitcnHBW3L61uUgt7hIfOH+2Ql1QoyVNk4QHljAMBGKWW/l5soMQrfj2jfmjEEsOp7/wl2/xyZu/tPTj8DwAbWWbbbKqVoEARyZ61DUF4JHONtyi1AEC/EpMgr6gEwIR5pBPLxQRPh5YRM7sZLjsp/uZMOHvOg6z5O2Jj9Eq4zeb5RrvQEhVmOEaSlF+iOPs44xf6imAfXZ3PQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(2906002)(5660300002)(31686004)(41300700001)(478600001)(6512007)(26005)(186003)(83380400001)(66946007)(66476007)(66556008)(36756003)(8676002)(8936002)(4326008)(38100700002)(316002)(86362001)(31696002)(6916009)(2616005)(6486002)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZXTjQyWGYvRXVwRDllVUtpT1QwaDQ4RnB4ZjVtSytHWU5sS3VvOWQ3akE3?=
 =?utf-8?B?ejYxZDl3OW14Q1Q3UDQ4Vksrb2MzdEw2Qjk2cVFScWNwQ0xueGFDeUJrNjcy?=
 =?utf-8?B?amxzd1MyeG45WG5JS3lyakZMQ1J5K09BUG5hYVdDa05ZZmpjSTNHUWdRVFBn?=
 =?utf-8?B?MnNDVk1LWU5qWjduZVNXelNRV2dVNklhTDZBMW1ialMwTFNQWVpOa2E3ZmZv?=
 =?utf-8?B?ZE0vQko3aHdpbkFEWkYyNDRxN1pVa0s0V3VIOU8rQUJ3WFRGZHZIR1Nuek1J?=
 =?utf-8?B?aFJXcU84SXQxeDNlNE81T21kNlBzZVdkc0xmUnoxRjE2dE1Gc0RqaGwvWHlt?=
 =?utf-8?B?RDVrb2FOU3ZGbkQvMGRCNkx0N0RPc3lYOEo2aVdhTm1jZnJBNHZoQ256MElX?=
 =?utf-8?B?U0lTM25VdVVudnF6QmsxZkNUUGVhRGdQbjNVb2IvU2M3S1JFbkNyUUNIZjNw?=
 =?utf-8?B?UFdNTG1iNHQwR2FMelU2VmFjajlQVHVIMndubVlEeU80bEIyVWdRbnUvNkhu?=
 =?utf-8?B?Rk80dEhCVkUyajJOOXRqZGtycTA4WGtHbEJsNTQ4T3RuMzRWNW5tYnlQcTRK?=
 =?utf-8?B?TzdraGpubmdIZlluSmpSM0Y0TEY4Y095dVgwellTa3dOdTNQU3U1ZUJ1TklH?=
 =?utf-8?B?V3RIeHNUM3lER1ZBWkFoOFZCT3dnQUdSR29RVUhqYlVxMFlvRk1aeHVqZHNQ?=
 =?utf-8?B?NFU2bm4rZW9mZWdrcG9XZ0RneGpFYkNwVzdldTR0NDR2WDdDZ3pZaWxxdFNC?=
 =?utf-8?B?Vjh6a2xublFHQUZoSVJqelhsa0Z3b3JZdFR0UzU4ZUlDcFdhWnNvVE9DQkpD?=
 =?utf-8?B?dlZmbFVocldzRE0vTmVaeWJSaC9JWGxrWXZVWmgwcEUyOUNtajNGNXdJZTQr?=
 =?utf-8?B?TVkzTnFPekZzR2J4QjRwK2dBWmdrckNNMXMzanVaeVhsYXVCaW1pM2NEV09i?=
 =?utf-8?B?bFN0S0V3ZXgrclJma282SG41dUdWcCs1TVdUTEY3QWxFUGZPVkVuNitWMHhn?=
 =?utf-8?B?UnMwcjBRQ0VQMzg3bmZxRkJTL2hWUkIwQ2ZzWk81b3pNbThnd2lQb1J1N1pv?=
 =?utf-8?B?dng2VGJObmZMUW9jaWVieFBNa2Npc3hpL2ZuUzlFTTQ4V3lPdmpnR1d3MUdM?=
 =?utf-8?B?NG5LOUVXdEt0N1FCc0pLUWRSM2R2OFNVQmhVSDcvbExodXB0bEJqTmwyTSsr?=
 =?utf-8?B?di82bmYrTDhYblF5WWdzUnpPSGJtOVo1RFhqcUhPbUFLNjJ1b3luUUE3Ylgw?=
 =?utf-8?B?L3B5ckVUbVFhZXpGQlRIcEtNd3N6SmVFTlZVNmp4UVp3K1RlTFFxa0p4aDZl?=
 =?utf-8?B?bWJpRFloNGhXTEdZNVM0aWhNcVdPUWNnbWtveTRBRi9rNWlvNko3WXJiWkJR?=
 =?utf-8?B?ZlluQStPVnNxZStmbEFzOFcyUzJYVnRJbk0rb0FMUkltb3Zkc2loTHUzODZj?=
 =?utf-8?B?V05tckU0Sjd4dWdMNzdxVHE1S3NyUEx2bS9jZUtKTEhPR2xISzJCbFBlcGFx?=
 =?utf-8?B?TVcwWFM0L0RhT2I1MzQyZDR4azNuSVI4N3lWbDZ2VUdzN3NiWWU3a1puQk51?=
 =?utf-8?B?MEQ3SWpGOVUwNXZQUDJjNXNJNzBRZm1ZYmRBUkRMU1NGN0xuRFhMOXVNeDhh?=
 =?utf-8?B?QWFHR0VCMndVbklFRitHZnFwVEVOTXBTM3lRelFnSlFDVGlhWndka0tQbVpK?=
 =?utf-8?B?SmEyME1jK09pYjJpbFNTRHBoRlcwSGl1T2EwNTJsdWRoeVV3MUVrRVd1QU8w?=
 =?utf-8?B?ZTBhK2JHTGhCMGF6SmNwbFFSNnBHMHFTaEZSdWQ4T2VwNlZJbUZUcnlwVk94?=
 =?utf-8?B?bWJBbkNHREZ3dHYwTjZzejJPZlErN2FIdGRrWjc4RjVPUDVIaUYwQ2V6N25w?=
 =?utf-8?B?YXE2MUp1MVdVVWJtSWZYQzZYZW9naktXY1hFVThBUFp3c05FSmxyTVBzZFl5?=
 =?utf-8?B?UDM4WGhnNXFRSVpKT2RnSkpTOENWRGRQOVZLVlMyRjFZeGxwNGxMOFMxUTBB?=
 =?utf-8?B?THVzNlZCM2IvbktxY3dNUjcyWDBhKzVTR0dnMHJlSkwycXFSOWtGM3U3OW4w?=
 =?utf-8?B?Ukl5SWpRK0RxaVlSS0wrSXcveU9EOTlWTmM1c28xUWwrT3pNTHlaMElPWm5X?=
 =?utf-8?Q?b2UWADshW5bt/oAdTwd3cB8Tc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e910dd-8b8d-4798-824a-08dad9c37f23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 08:58:10.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZsHegdJ6QZ1GiaIacD8b3jU2Gtskhat4/CefyqJlRAmV6WIkJDHsuWKEHUBCL1zztoO5um7uumfH667/hyb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7352

On 09.12.2022 01:45, Stefano Stabellini wrote:
> This patch is to start a discussion in regard to rule 20.7 and its
> interpretation. During the last MISRA C call we discussed that "our"> interpretation of the rule means that the following two cases don't need
> extra parenthesis:
> 
> #define M(a, b) func(a, b)
> #define M(a, b) (a) = b

I'm puzzled by the latter. Iirc there was discussion on whether the LHS
of an assignment needs parentheses, but I don't think there was any
question about the RHS wanting them, irrespective of the facts that only
comma expressions have lower precedence than assignment ones and that
evaluation goes right to left anyway.

One aspect speaking for parentheses even on the LHS is that an expression
(rather than an lvalue) passed as macro argument then uniformly becomes
invalid, i.e. not just

	M(x + y, z)

would be rejected by the compiler, but also

	M(x = y, z)

.

> Moreover, MISRA C states that parenthesis should be added when the
> expansion of a MACRO parameters would result in an *expression*.
> 
> Expression is the important word. Looking at this *compliant* example
> from the manual:
> 
> #define GET_MEMBER( S, M ) ( S ).M
> 
> It is compliant because S results in an expression so it needs
> parenthesis, while M does not, so it doesn't need parenthesis.
> 
> My understanding is the following:
> - is it possible to pass an expression as a parameter of the MACRO?
>     - if yes -> need parenthesis
>     - if no  -> doesn't need parenthesis
> 
> 
> As an example, cppcheck reports the following (from xmalloc.h) as
> violation:
> 
> #define xmalloc_array(_type, _num) \
>     ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))
> 
> I think this is a false positive. We have already enstablished that the
> "," operator doesn't require parenthesis, so "_num" is not the problem.
> And there is no way that adding parenthesis to "type" would allow an
> expression to be passed as the type argument.

"Allow" (here and elsewhere) is probably not a good word. You can pass
_anything_ to a macro. The question is whether the macro expansion
would yield something sensible. And another question is whether with
parentheses added the result actually still compiles when the macro is
used as intended. The 2nd aspect is relevant here - you cannot add
parentheses like this: ((_type)*) - this isn't a well formed cast
anymore, and the compiler will complain. _If_ this is what cppcheck is
complaining about, then this imo is a pretty clear bug in the tool.

> Let's take another example:
> 
> #define xzalloc_flex_struct(type, field, nr) \
>     ((type *)_xzalloc(offsetof(type, field[nr]), __alignof__(type)))
> 
> "type" is the same as last time. There are 2 other interesting macro
> parameters here: nr and field.
> 
> nr could result in an expression, but I don't think it needs
> parenthesis because it is between []? However, we know we have a clear
> exception for the "," operator. We don't have a clear exception for the
> [] operator. Do we need (nr)?

The question of whether parentheses are needed clearly need to be based
on whether without parentheses anything that looks sensible on the surface
can be mistaken for other than what was meant. I think [] simply are
another form of parenthesization, even if these are commonly called square
bracket (not parentheses). For this to be mistaken, a macro argument would
need to be passed which first has a ] and then a [. This clearly doesn't
look sensible even when just very briefly looking at it. Plus the same
issue would exist with parentheses: You could also undermine the proper
use of parentheses in the macro by passing a macro argument which first
has ) and then (. IOW - adding parentheses here adds no value, and hence
is merely clutter.

> field could result in an expression, so I think it needs parenthesis.

No, field (and intentionally named that way) is a struct member indicator.
Neither p->(field) nor s.(field) are syntactically valid. There simply
cannot be parentheses here, so the same conclusion as near the top applies.

> Just to be clear, I'll list all the possible options below.
> 
> a) no changes needed, xzalloc_flex_struct is good as is

This is it, and not surprisingly: This construct was introduced not that
long ago, when we already paid close attention to parenthesization needs.

Jan

> b) only "field" needs parenthesis
> c) only "nr" needs parenthesis
> d) both "field" and "nr" need parenthesis
> 
> Option d) would look like this:
> 
> #define xzalloc_flex_struct(type, field, nr) \
>     ((type *)_xzalloc(offsetof(type, (field)[(nr)]), __alignof__(type)))
> 
> What do you guys think?
> 
> Cheers,
> 
> Stefano


