Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00BB694302
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 11:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494326.764359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWCg-0004Aw-38; Mon, 13 Feb 2023 10:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494326.764359; Mon, 13 Feb 2023 10:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWCf-00048w-VU; Mon, 13 Feb 2023 10:36:57 +0000
Received: by outflank-mailman (input) for mailman id 494326;
 Mon, 13 Feb 2023 10:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRWCd-00048n-Oi
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 10:36:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d0f62c-ab8a-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 11:36:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Mon, 13 Feb
 2023 10:36:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 10:36:51 +0000
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
X-Inumbo-ID: 54d0f62c-ab8a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8waFm7G5vi0Vchv92s5N8fA7Ba1uAs34GJIdgs0PEfAQ7SFyTDK2VNjLTmHuriy277s6ZzKN5SvyojyZsoj+cmQY6ZjfEbTGPqycOE7+0cXn2v/d0t0dt17bME349gue/azDjUmjB59HLGOuGM6itcF+CbGf4AKpvH3d5g8a6TuJzGABt6Ti3fbKv9NXhDd0mp91V0U3qZmdxfGs9xng3YR2ZFhhKMw41ngHqLR0qMMpKO8lZ9mStF46KBpIxqSjnqfQee9g8YzGJwEG1HH9MHEy1cFVvih5tkBbUXD2Gs+oVaAYtTWcaMIpwIiuA5tofkaMGdJ5F45XDxoaULQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RMIeqTjoRmBwaSw/PmaJGTkdAMy1hi125x9Fuvw9MA=;
 b=J1xsPPJAZ/9pgqU9H4VBa/3iJ/Fg9SqbdgoqxEVnUVhFQzzTaJ5PQpEzubGPlNVrk29eRA3YXh6muaUl2y2p5Nz0eDy6KkDwVvcSwmSY9+TPhG80o6zeVtopr12GUImbMs7Q64jSDsSZUxCJ+UjjBWLSJ8jklB0dju5VwXVjUiqrMsAKk6PfqJ+DxaPjvwdhQHLFyl7Y6Y6Hee5anIQ1ma2KXBaENGXgeHJLW8hoJibDLOQLMcNvF1Ph5d1DG0kWHYk5Z7/DDHy/k4o8vjzqXjk+ETN9D8iELyAjtBf+uV3uD+MMyIZrfJtFOpT+c7d6ix+3p9cFo/Q5XF9smjuWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RMIeqTjoRmBwaSw/PmaJGTkdAMy1hi125x9Fuvw9MA=;
 b=ahRRFm4qE+zDVapAE/4bsvUunN+PwXj8uyoEFsSy0exoNWb60CsRd7aVkKL43//Jl37H0/EohMo0XwfViuut4aWrG8F42MvVK6wJN7CTHjC++js+rfYb+43DfLduacZyZk2Ekfh+gc2BCXjKp97DZzBlJ+/51z6kKlFvaF2bxXn2VOak605hfdpXaBSM2zSBZzV0mbwmCZwpWsaUB/2cgcUGHVHt9BiDxB2tBh/lWkXejLNbQk86WA4dvwqIpZjd2Ag6Wb4sjHH0Pwo4VDyEb+YE7lEuMoYm3KPotK3EBqP5MqRdrBW2YgHWHy6l9l4tyCC8/3nl9/89YUUhBt/XuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50dc066d-885d-ea3c-ab30-0e045a330250@suse.com>
Date: Mon, 13 Feb 2023 11:36:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3] x86/ucode/AMD: apply the patch early on every logical
 thread
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230130115503.19941-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230130115503.19941-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f4e9d1-0cfc-4a7a-da51-08db0dae3782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QaEtc0XFH16SZujMBLaP9yHAzjEwJxwKYKNz8+jBNbN8fizRlbCRu0Z6YsrIxXCH06D7DfAPgOo3eMKGQqCDcL6TdhPJSBHCZL2nCJNJKPSYD25jxQij//2Ecf8rg5g3DGUTj5WVjudByAdwUUIk2sk0UCvHgY8MhBhDbcbi6V8wM25fwvndTFDw80grcuKpfP99SXLzsmQOHbREpXMcS1nHilOUqN6u+UTOwPKCvJ1Pq+uDVPicX+HAvDVdqZkmP1H07XadonBK8nUf7PKqL6Nd/dFAVVNpt0g3l0/2jSIOgIFTa2zmgu+Q1r2gplPE5Flr6BoZKpe7Gx4uduXqvjKh0g5PlzauSihlKNf5uGWFEmUePonEXTpo8F2D3DE9vmaQhtj/itupn5u6XQ2TEPFVEYOnF2DKg8EGJHvpJWB8+tFw6lgX/eak1j3FiiRXhTBTjZQhAe8ygX/TR/UO18fH80UK8nAKz08bPSbycrHdKIOz7rH6+wzsq863XFc3CYriE89DaFSz8MJdKRMVv3uU9qCrWFvqaQygehf/MhYunQe3b9x1qVBown/FIedwQtsbViSIXrbt8kbeQ7UwmUTM7fOBWOnVOpH2PkYz9fVVqA7z+6SMf4lCxYE/v5nPCqF17Tg11zJ1xYigd2RSVab9BqsCFcAJKG1WfgB7I37AnZ6/TiyT3QZjA0W8csLUKQIutKBKyBVxm3DfpHb3sp9zCcJD6JfqsPQ6abEOnY+vidJ+LeP25O9WmNJ1Ok9apkF3HzctKXV6s+czHxHFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199018)(478600001)(186003)(83380400001)(86362001)(4326008)(38100700002)(31696002)(2616005)(8676002)(6916009)(66556008)(66946007)(66476007)(2906002)(6512007)(41300700001)(26005)(8936002)(6506007)(36756003)(54906003)(31686004)(5660300002)(316002)(53546011)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akxJY004TjZUK0FkaWtMQk1GcE4wdE41YUtiUERTOHRuN0VHMVNmR3pUbC9x?=
 =?utf-8?B?dGlRbVhZVnZOa291UUM2Y29EWTgxWDRYZUE4dlNLRGRlWWxUUFlQNVdhMVpz?=
 =?utf-8?B?R2I3a0hiZWtYSWZkVFBuS2hQSENIcmFudnE0dXB1UEx5cjRFRHBDbzgrRkcz?=
 =?utf-8?B?SWVRcmg4THh2ZzlCSVRnQmVCS01naTJScXMwVW9XZVcxaTNsSDMyK0kwaDJm?=
 =?utf-8?B?dlFjR3FKU2U0ZDd4UXJtaFJpSnFzSnhjZ0lhSTFKUHFHNlRxSVQwemtUTTdy?=
 =?utf-8?B?THRseWlrc0VvK2djUjBHNFJQN2h5UE10V1hLUitxdEJvOHpwc1luNExoY1JT?=
 =?utf-8?B?bTZMdHV1V05BZmNYN1c1V3V0UlhhOHFvYkNBQ05qRFFjelh4Uy9GdVkrS281?=
 =?utf-8?B?TFVJUmpPWGRCWU5XdHA0UkFBenRkTzV1c1RkSTVCMXhXWk9oN3lpeEcvcmpr?=
 =?utf-8?B?MVFZM2xOQXJ3SCtuZXM0TlY1MWZzUGZQd3JJK1dxSWFpQ3dnUUgrRGxPckw4?=
 =?utf-8?B?N3EweHBFSCs1c0tjTW9hcGJYWHNlVHFoV1o2ejJ1eEk1NmdlK0FNbnpCZzZW?=
 =?utf-8?B?K05Sc1NzMFpGT3k5QjdTR1RDVC9Hd2dxdXZ5Y3dmRXFNVUlRUjYydDJHVGJW?=
 =?utf-8?B?b2xJd1NnakR6bWNHTnBzYlhzZi9nUmtDMk0rZGc0VmRmTHRPQ0ZqQ0lJUmYv?=
 =?utf-8?B?MjFvNUk1ZDhVQWVSdUx5ZC9Fck9XakRFQWRUcThiSXo4dUJQa3VEWjA3S1dh?=
 =?utf-8?B?V2xxM3BtYWs1dlFLMHViQkRxWHNtYnJZTmpFMU5XL1JRb0JWUEJsUHY1dWRo?=
 =?utf-8?B?MFFNRkRza3Z0N3FMcVZvc0REUFNJK3l0NzRINTdaUkNzbjlUQ2h0VmhYTGxh?=
 =?utf-8?B?eTlwN1Q2dlptQzd0ZjlYSXZpcGpjRU41WXZjNVNXSENiU3l0WW1jU09rMjhP?=
 =?utf-8?B?amZqQ2E2cFVxUTcvYUtnMTI3RGlwdVNSODJqcDgrcVlianN0ODN3T0dVQUVo?=
 =?utf-8?B?TDBXU0dWMTN1dGxTbzU5WlVVTXpLWlErc2VkSXk2bFh4VTZlMEFtYnhyTXNU?=
 =?utf-8?B?YTlJM1J2dHFlK0dQM2gvdHpicEJnMmNMSjFYajgyU2gxRzl2ekczcStxZDB4?=
 =?utf-8?B?R3ZTd1krQjJud2RDV2ZybDRtdzVpbmk2S2J5NlY0WkFORFVFNWFzTXZMZXdC?=
 =?utf-8?B?RllSTmRPeERsWkJ6Q0NWZ0phTEZXaWhBaGZwaGV5a25MSm5SWm42MVkybTBC?=
 =?utf-8?B?RjdrWm9mS3NITEFpaFJUT0tCa2EyMUZGK3NCc3ltZU4rbmhOYnd2bUk3ZFM5?=
 =?utf-8?B?ejgzcDZhWjdYU01NZVk3d093a2dOZUdGZzBURkg2SlBtQndzQmllRWxWZDd5?=
 =?utf-8?B?a0gzaUFsQUNmRWR3VFlLN1l0TWlIZTdXTTdtdjZPTFp6MjJ3QmRKallJbjlL?=
 =?utf-8?B?M1RJRnRBaC9uem1nQkhOSzJES3V4QXIwbzRET1hPd0NOYnlXZExGMHVMWGtZ?=
 =?utf-8?B?dE8zRm0yM0ZYcFNFVUZZUlBqMDdPb1ZnVFExOTRraDd5elF2YU5sWENKcXBK?=
 =?utf-8?B?QXZFWjZlbE0xSGhZOFVaNkRUeVZNb0lhbC91VGlDc2c5bWM1VmZ3NVA4M1Bk?=
 =?utf-8?B?RUU2YXpaMU9MVTZIYWhOalNTYTBoZmUwZmdrVm5iblF1Yk5FQURhUkRqRVhQ?=
 =?utf-8?B?K2hpMyttNC8wNWViNXdpU0xNS3VOcHRSUGJuOFZQY003VmROd25mckU4ZGt0?=
 =?utf-8?B?T2FVbloxZURoZklDZzMrWWt5cmhKSWNlWFg5aWZ3TkN6aXRDNWp0eFVxVGl3?=
 =?utf-8?B?OUpYWDRpRjNkTlN4RDY5U3RrWEZhdFg2UFFuOVdHRC9GeVNoZ0hSNzdLTm9q?=
 =?utf-8?B?dnZsbDlscmkwZVUvTC9oZlVBWFVkZ2NIdHpqK3lyQzZDNnB2MUpjMXdVTmtY?=
 =?utf-8?B?SlNFdUVPVzJkTmdZNmNqMjNaYUpyZCtPU0ovQ054RXlpbExQRDRodysydE9o?=
 =?utf-8?B?WGpIOEIrbXFVSWxMNUNHTVNVREZLaXNZUFV2cGQzaFNaMlhVNkVicWhQcEpO?=
 =?utf-8?B?UjFvbjJ1QjR3eTNtTXJadnlkd254ZVpOWGp3d2l6ajExWndhMkY5ZkZ3dUYv?=
 =?utf-8?Q?s0ejrVRYFVsClUJc59jzaOQ1r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f4e9d1-0cfc-4a7a-da51-08db0dae3782
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 10:36:51.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r87MZqMw4BGmDYO5ubGC+mpx0eOSSCjU4LgHIDdgnX0cxyeoV3DO2uSiqfdO4NX9ayn/4hGrFU4x/vDkYPVfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661

On 30.01.2023 12:55, Sergey Dyasli wrote:
> The original issue has been reported on AMD Bulldozer-based CPUs where
> ucode loading loses the LWP feature bit in order to gain the IBPB bit.
> LWP disabling is per-SMT/CMT core modification and needs to happen on
> each sibling thread despite the shared microcode engine. Otherwise,
> logical CPUs will end up with different cpuid capabilities.
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216211
> 
> Guests running under Xen happen to be not affected because of levelling
> logic for the feature masking/override MSRs which causes the LWP bit to
> fall out and hides the issue. The latest recommendation from AMD, after
> discussing this bug, is to load ucode on every logical CPU.
> 
> In Linux kernel this issue has been addressed by e7ad18d1169c
> ("x86/microcode/AMD: Apply the patch early on every logical thread").
> Follow the same approach in Xen.
> 
> Introduce SAME_UCODE match result and use it for early AMD ucode
> loading. Take this opportunity and move opt_ucode_allow_same out of
> compare_revisions() to the relevant callers and also modify the warning
> message based on it. Intel's side of things is modified for consistency
> but provides no functional change.
> 
> Late loading is still performed only on the first of SMT/CMT
> siblings and only if a newer ucode revision has been provided (unless
> allow_same option is specified).

Another sentence on the "why" would be helpful, or else it ends up
looking as if there was an issue left in place. (I guess latently it's
going to be left in place anyway, until such time where we re-evaluate
features after ucode application.)

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -612,13 +612,21 @@ static long cf_check microcode_update_helper(void *data)
>       * that ucode revision.
>       */
>      spin_lock(&microcode_mutex);
> -    if ( microcode_cache &&
> -         alternative_call(ucode_ops.compare_patch,
> -                          patch, microcode_cache) != NEW_UCODE )
> +    if ( microcode_cache )
>      {
> +        enum microcode_match_result result;
> +
> +        result = alternative_call(ucode_ops.compare_patch, patch,
> +                                                           microcode_cache);

Nit: Indentation (3rd arg wants to align with 1st one, not 2nd).

>          spin_unlock(&microcode_mutex);
> -        printk(XENLOG_WARNING "microcode: couldn't find any newer revision "
> -                              "in the provided blob!\n");
> +
> +        if ( result == NEW_UCODE ||
> +             (opt_ucode_allow_same && result == SAME_UCODE) )
> +            goto apply;
> +
> +        printk(XENLOG_WARNING "microcode: couldn't find any newer%s revision "
> +                              "in the provided blob!\n", opt_ucode_allow_same ?
> +                                                         " (or the same)" : "");

Since you touch this entire printk() anyway, may I ask that you re-flow
it to meet our guidelines:

        printk(XENLOG_WARNING
               "microcode: couldn't find any newer%s revision in the provided blob!\n",
               opt_ucode_allow_same ? " (or the same)" : "");

?

> @@ -626,6 +634,7 @@ static long cf_check microcode_update_helper(void *data)
>      }
>      spin_unlock(&microcode_mutex);
>  
> +apply:

Nit: Style (labels indented by at least one blank; see ./CODING_STYLE).
Personally I'd prefer if you got away without another "goto" here, as
our rule of thumb suggests that "goto" generally is to be used only for
error handling or other situations where the alternative would be
significantly worse (excess indentation, code duplication, ...).

Jan

