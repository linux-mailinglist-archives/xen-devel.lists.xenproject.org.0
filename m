Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27E70BF8D
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 15:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537947.837608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15T2-0006dU-4z; Mon, 22 May 2023 13:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537947.837608; Mon, 22 May 2023 13:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15T2-0006ac-27; Mon, 22 May 2023 13:20:52 +0000
Received: by outflank-mailman (input) for mailman id 537947;
 Mon, 22 May 2023 13:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q15T0-0006aT-2f
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 13:20:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77952a67-f8a3-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 15:20:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8061.eurprd04.prod.outlook.com (2603:10a6:102:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:20:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 13:20:19 +0000
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
X-Inumbo-ID: 77952a67-f8a3-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds+mSz9gDQ19aoiiZkw6Af6xNzx6tdtjDoiHulaQuHuNXEo9ZPLrQx/s6aE/OhB1WO2el986xu+KrTIh1+EkptJ31bWVMk0BUAin5gdMhwaFMbuVsapnKAXUZ84CiF4NUAoq8T46U/lSZfqILLPLitmeR8ujMSl3UgXJjPYqUCjOHyQUOAa0PIAaXCxujggaW6VJepigv77g5j0iK1KSPpUr+gun5Hkg9Y0SWYjdVeNb5Wplf0JEPI3kNK13i+9O+9vk9xvmeJtOXGIdIThbpZYsWZBrn82tjJXpZIapZwv92RM3gY8IVCdKjM2Mtho2dzA6HXIVz45GaeHUL2MmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOMokPvjoGqxgL86YeDqkbzpLR6vssQObSPnnAiJB9s=;
 b=FUAuhGPBZQuZh6m6vVyriKuG9tVFE7oukReVHa0lcjvwW8iEeK/xBUL9O1/uYFpU/RgPYE7BAJImOTA9N0cvymuF2Cl2oo2cP9fbOFc0z2JPVVvRQJPQiH8odkKuYrV5UiWLsyYYFukJdJzQaqB4Q9sjOVPap5a3PQh02MW1a90nTgbvhnJ9P7MGd3hnA/PJbgcZeiM6dqv0dooCi5UimuvC7NSy0u6cI0eW6ZKMKbcEojnwFIjWw39J8gwbNGMK13CDVoC7s3JTC3le2Zc8URweGvWZ9c3X91+MvOP6zblv5kMedlPJpqwZx0F0lhabxYCud9pg9CbbKb21qzCaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOMokPvjoGqxgL86YeDqkbzpLR6vssQObSPnnAiJB9s=;
 b=g4MYYTNH5NIh9YqlX/nONUnVZr8WFiE4BO4du5YSb0wWIFIbuLWz78vHwjlGM/V7IlB+tEut9GtEI+cNftnXQ1ZaboPUg++yyiEy2YGmYie6hJmhRes2bKj7pZ5B615zyDvk/tTmX34sKpUH68tK4iyZ6CVUhsyDdgEcYS/OXDr5b+bq0PYpwd1smRlWBvjPpUhCPaVY6QW4gO4JH+M66jWml66W2XaMp59AdM7HpwziTTqCRp3cLlSVPu0KoC6zPs+/0kkG3tosC8WvSqLedJpFrzhx0mwFM/0s1BJiYXcOTUTHeHSy/3Fp8kId/p25sRyBTUrLmjXH1bXt6tsdWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47818514-b03a-8094-1c03-24e4c7a67daf@suse.com>
Date: Mon, 22 May 2023 15:20:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 13/14 RESEND] xenpm: Add set-cpufreq-hwp subcommand
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-14-jandryuk@gmail.com>
 <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
 <CAKf6xptjgvSsNobYirrF_W1cWUdVVfvX55DFNa=bWy3A24kN5A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptjgvSsNobYirrF_W1cWUdVVfvX55DFNa=bWy3A24kN5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 64449c2e-08ba-4a80-1a72-08db5ac749cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k1LxnbN7yaEhER29sqS8Q7RuwWRGQjVUPmoKJ352PqwPsiwZT9p/x70JxM707o3tfMQSs8DxQ2RTskH8mfATU8N5r/kcNuhaNC5NS3oo/eVhkiT+TGnt65AKlA/FgBs6rMtWjfJYN2BopY8fFOiYeAC4DGe9Npt1gtWbPPHYVRtj+M7AA0Kh7WzzVP8TQi1dYaPpbL8qmUzyYzYI45+MoL7mEJGktoK3P9hLchFTu4Ll97PiTzQ1iuJQJnAWdg7iXx1ys4Q1cbbpwnc0oIvtgqD5Tqnf9wwJrzeJdNisSvq+mu09KFybhj65LuoYyIDqGp7IrlRVG38DSElJVJuHDQh6E5f/atB7o3YLF9LwUJYd3FP0/jL3jlB9uani4iHhkEVwTqQu4YCA3A4hksyoPUvaU5NzmkbPmZycb1a3ePDPfQ2XM+RW/7DTRQ2bC5L2iNwnpJdDd+k95fHZwIWIwFhSIHEyuVQGR+uqvilmYpVdkClPFJqp9ni6SiSZSY38vZa41dWsYELGtT6w2nuU0Yop2vODSoWoxnqdZHN8M+xv3heKFX2k08aD5Sv5Uq5O/2yI2kJhIKrkRSEzQxfiHit+RHcEdi26iJqEdrcFqh21cHlBKxOk8btlE6V6dqJZoCbuJruOIvyUJndO9T25NA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(478600001)(186003)(31686004)(54906003)(41300700001)(5660300002)(26005)(6486002)(6666004)(66476007)(316002)(4326008)(6916009)(6506007)(6512007)(8676002)(8936002)(53546011)(2906002)(2616005)(83380400001)(66946007)(66556008)(66899021)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3AxWGFjdnZaWitWN0pLSk5lZ05ka2xqTUV4ZE84MkduY21QdGMrYk9xeEx4?=
 =?utf-8?B?c250ajBiVzdLRStHREpKRm9GMW56UkpxcWREWjZHT3pKUEF3anBkWDFUSG0v?=
 =?utf-8?B?NGIyMCtuUXl5MS9ocGJvRzAyL3NFVmYzcHBYRzJYM1ROZWk5NVl5SVpqakF1?=
 =?utf-8?B?OGNMamFqUTNUK08xUlVMTzBSZEJsZG5sbXdjZ2hZenQxV1ZTaGIrcmE4bWZ5?=
 =?utf-8?B?Y3dtZGNHdkxHSDhMcEM2YUxVcnE2QUl0Wkc1TzdnUkUwWlFULzN2bHorVC9s?=
 =?utf-8?B?alU0ZXpmOSs4aGdUaVJRd3ZNLzNhUEszWlpRK2xNZU9rTnorMUlubC9qNzVH?=
 =?utf-8?B?YWFuQ0NiU0tMRnBKSDEwWEJ6bEd0UEc5UUhsbEVQYlV3TDNnL3pIZnhET0Y2?=
 =?utf-8?B?UVQzMDBFREVZMkE0cVlCV0hwTDRGZENUSnpKTGZTeSszYUR4Tkplcm1vMFN0?=
 =?utf-8?B?ZTdkRHVRb0tjRGpXUlVVdW9QY0x4SEZpejE1bEdVNDAyZngyVXVtMjBFd1A2?=
 =?utf-8?B?ZzR5UFM4MTRkaExTK2VyTjBuMTFrR1hOdjA5VkxYY3JZK2taN2YrQlVWc0Np?=
 =?utf-8?B?Z0doa3JVUWphNDJUbkpCK0ZSV3UrRUxaRFJKUzkzeGxUV05oZTF3WnlKRFFu?=
 =?utf-8?B?RVJhWVEvV1lDWWc0aEZoOXhCRG1jdTZUTGQrT1dGZXh0UlBSRlJsc3J3ZTZ4?=
 =?utf-8?B?Zit3T01SUVRSM3lmQjc2WER4MDNSUkN2cGJGeWhBUVRlQmtDZEpEc29iWk5N?=
 =?utf-8?B?N1V1cHpoUlZVTk8xZC9ZRTdLcWxia1Q1azRnN2pLMm5HZ3VJa2VPelZoN3FJ?=
 =?utf-8?B?eVBSdHd0c2ZXMDd5eXZkQkh2UWxmUms3dGYxT09pTWkzSkR1akQ0WjdleGRT?=
 =?utf-8?B?bS9kQlQ3SlhvajlZNDdKUHFCcHZlUG8rSHgwcDFpbWlCK3ppVDN6aG9yak40?=
 =?utf-8?B?OWNJT2lyRTFHWis4cGJSektYUmZha1hSYTVPYUVYWnRHOE1rUmE0SWRhYjVC?=
 =?utf-8?B?U2FVcWt3UktRdVVVOEJWNkZWQStCV1IyWmQ2ZzRNVDNLN2ZyRm9jWHFCOG84?=
 =?utf-8?B?ZVAxd3RwczVERnRTWi80SkhTUzNVSGU3VVN1YXNtcVUvckVBb3hNelJHU251?=
 =?utf-8?B?VSs3M0NycDFyME1DZThwL0ZCRXBwQnVrRm1sSC95U2JrcTVXM1Ixcjc3Wm5p?=
 =?utf-8?B?SGU2c1IreGV2TjkySWMzbCtFejZzNGNNWWhJRCt5SXdoZTlEdERjME5tSGxY?=
 =?utf-8?B?cHQ2NWptTnNrYXV2UGozSFV0VVNYYS92QTdGVWhqQVpOajVOMEUzV1ZiV29l?=
 =?utf-8?B?aVJJWjRDeVVWVHR5VlVRUjJHSzYyLzhrVzQ4bk84ZGhjNzlXc2VvNHByeWFZ?=
 =?utf-8?B?aTRvRDVJZDRDaGpIZ3Q2dkJBam5JaUZydmlsYjJTQzZmSjROek1NdU1XaGZq?=
 =?utf-8?B?bUgrNlZXUzR0TmlDY1lweWs1TVM2Zi9jNlliN3hscnY1aEUzRlBsMmNsZ2gv?=
 =?utf-8?B?RTdWVytvVGpiZXprYkEwMkN3RDNLNzBsYlU1Z3ZBUEpNVGxud3pVWmJOVDdC?=
 =?utf-8?B?ME5aVVZBWldvaUw0YytnSFZRNjlLaElQbWlXSFdzbmtkTjBGSVZuY1dlanRy?=
 =?utf-8?B?TEFNaThhTFRIaUswZ0FPVDdlTFNjbDBodlZiVG1NTjFveVZiZVFhM2o5dFlL?=
 =?utf-8?B?MU1NSXhNeXJ6OURWVEl2Z3RRMnFSaVZpMVFiOVE0d0RiZUEzWjFUMHI1TS9J?=
 =?utf-8?B?dXE0Q0h4NDNQTXp2UTVSNk95V2RVQWNTTXc3bTNtamtvNkZ2bUtLRlFHSmtI?=
 =?utf-8?B?VHJXYmdXbGhjcE16czY3bENiQlEwd1Y3RHZaNEVaWVRqRDkyaVlXTmh3UzdI?=
 =?utf-8?B?WnVtcDRzSjZrNnFUc1lTeGFsRThQcE13MWs1NHNTbWNITFU5S2d3MFdKWW9y?=
 =?utf-8?B?SDNWVTRyYWs5MHYwSXUrTElWaWFlc3BENnRIMlRISnhOQldlZHkxbkNNdEda?=
 =?utf-8?B?N0VadlpYSGIra1hTcXQ5ajBVL0UwQXZwTWppQ3hEc29mTGtPR25oMEdId2gx?=
 =?utf-8?B?czB2aCtQbXdRbDNSVmRYOTUwc003dXNubm13ZDBlS2IxcnRIb0V6YjJnakp1?=
 =?utf-8?Q?+aZ59v9iLwY/w8334FmL/3ofu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64449c2e-08ba-4a80-1a72-08db5ac749cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:20:18.8468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYNvNVRg36YcyxctkyCKCtZ42AtlfRa1ueI8PgMgvJYbTGQ94aolQvBQbEHOQi/cWEpVM3kViHgsbFkbte86Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8061

On 22.05.2023 14:59, Jason Andryuk wrote:
> On Mon, May 8, 2023 at 7:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> +static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
>>> +                          int argc, char *argv[])
>>> +{
>>> +    int i = 0;
>>> +
>>> +    if ( argc < 1 ) {
>>> +        fprintf(stderr, "Missing arguments\n");
>>> +        return -1;
>>> +    }
>>> +
>>> +    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
>>> +    {
>>> +        i++;
>>> +    }
>>
>> I don't think you need the earlier patch and the separate helper:
>> Whether a CPU number is present can be told by checking
>> isdigit(argv[i][0]).
> 
>> Hmm, yes, there is "all", but your help text doesn't mention it and
>> since you're handling a variable number of arguments anyway, there's
>> not need for anyone to say "all" - they can simply omit the optional
>> argument.
> 
> Most xenpm commands take "all" or a numeric cpuid, so I intended to be
> consistent with them.  That was the whole point of
> parse_cpuid_non_fatal() - to reuse the existing parsing code for
> consistency.
> 
> I didn't read the other help text carefully enough to see that the
> numeric cpuid and "all" handling was repeated.
> 
> For consistency, I would retain parse_cpuid_non_fatal() and expand the
> help text.  If you don't want that, I'll switch to isdigit(argv[i][0])
> and have the omission of a digit indicate all CPUs as you suggest.
> Just let me know what you want.

While I don't want to push you towards something you don't like yourself,
my view on the "all" has been "Why did they introduce that?" It makes
some sense when it's a placeholder to avoid needing to deal with a
variable number of arguments, but already that doesn't apply to all the
pre-existing operations. Note how many functions already have

    if ( argc > 0 )
        parse_cpuid(argv[0], &cpuid);

and {en,dis}able-turbo-mode don't properly mention "all" in their help
text either.

Jan

