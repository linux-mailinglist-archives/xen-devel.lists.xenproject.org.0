Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F825734D69
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550861.860052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBA5X-0008O6-B2; Mon, 19 Jun 2023 08:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550861.860052; Mon, 19 Jun 2023 08:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBA5X-0008Lw-8P; Mon, 19 Jun 2023 08:18:15 +0000
Received: by outflank-mailman (input) for mailman id 550861;
 Mon, 19 Jun 2023 08:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBA5W-0008Lq-7i
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:18:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe12::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d555511c-0e79-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 10:18:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 08:18:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 08:18:10 +0000
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
X-Inumbo-ID: d555511c-0e79-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ain+BMaT2ua8zSmT0ijwNM++zUaNPduSQ9zQAjjVrBw0WsTo2Uq0CucgSESTAS2E7VVNGUIomjvchQYpMw9IsJFEQ1kMi2QGdHRhtdMkKUeU52hZdd4Ustg9H24UWwjCGhP9QK981Ek4UGY5JLjm76PwiWmHws47v3zRZx6gR513rOIT9dy98K+u99LWlrtt6fK6jU4NeoXGqh7Z9mu8y36lFdFAZefpOg1pT3uTCuKxz5LF54X0DnlcJ1le/WokufEDInZg/h5kse/wWleYkYbnfE+NkYcayy/7IkGr+eE/So5XONf/yFF3RAPizipOW5qrC0NJutcf5VoyRZgbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvT+tZ0fHR54WGKnWebSqCvCP4gxyCoL07tHTph59i8=;
 b=Z+3R0OicFs4Q7AbqsY6jVLQnTR2LheEqol/TUavjFC1Sxu3twSTnzGN6HdMOrEdptuPX85lDqXjFjMLUFMVi44n6ia3bKizZVYo8GJYsZol0MZGaI9KUAfYvfyBDDch13mlMRwas5en/tYmiQNnXaJtlwBtN4dC0sYzCdFi/0YKcdXx9VInwka9fr82UzSrEOdCCA4YmCsi3HLW3SSB7Mtoul8iOAqylsFso93fHQPSeKSCiIkke13X1EHA97iKPr0BRT2ZzkRJjmzjS/RpgkZdrd6M0RowCgpVQKXHS8aG0zr46TQGWeBgHrsrExWtWRVq/Kl5dY3tPC7b6vlVStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvT+tZ0fHR54WGKnWebSqCvCP4gxyCoL07tHTph59i8=;
 b=V80rKsWTfsBLeJ6lPQ+DGFgIcxc/sJZhZhJagFeCMp26VikMyk1k+SEOI3hp5c7mOee0Xfb/Zd2qY9hIBiF+qGo3Mzg93z9PzqxPst7SL1yfjBabHH1fsjwKqiDt/cqLNVtgZT4GcvqTLQprHhDQyO0U9qrD4hKkFvk8Ep+FS7hyH4s9kgeuWimnNZeGLDK2r86MszhJHtc1PVBzQwLGwm9BugjG2qxQwOa3Djnkd+4iEcF5gsPt4yBBUxY3qg1Zuro/sFwYznyD4/sYEtvLAN2a10eRrLkNd1bixFp2nXCcDfXG0qCgJtoby3reNVQZ4V5Nm6jY6rl8KOyh0REiJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddbd283d-2d6e-cef5-f2a2-de7fb8a4fe3f@suse.com>
Date: Mon, 19 Jun 2023 10:18:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
 <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
 <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
 <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bedfcac-607a-497b-535f-08db709db810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q+fP7SGF0RHvmLUvQgl7zSy2ciqEdTLlQYwhf3Y3k3ic4sz4uH4QO8PhGFwnP3cWivip95oc7bxaUluBUHHvyBDXEGSl2VJpRQFA5hNn6dsB9yNI/CCnqs0Lk3yqrEK/O8dH31XeQa1BZZUIPmHHqmuVWMZ0FqPGVVN/0IdpxWvG5q05+1WfBo5bfFflSgVVEFZIU+aDXEY77LgRI+DAkpORtWChNG/eup/AgXJgIUgLcdAVWIZuOlOZuuJTeTjGtQxrb1H6Qe45S6ewSLuYmZUjirU6GXOapuaesv7A40slB9PS7dEwdMFgsrxn//s5OPEo1CeAB9vMPqq+6Af8lVG1U1cy2YDuK/y/o+Chsmn0L4WsQ4NMCvGNnSWZ2d9COPk0SzsuB2PBHXVgCy5uv+hgwG/3aGu27/cVX6mxmP045LICDwcY22JJGEAp13wkOQG3LAG9SWUmQmhF8yfQY/Ue032FLmdjQxNvUsOcMCKkzycwLnoN/q2h6boXSzX0m7QtmF532iO9dtkR8r3wzMUfk5uyC/yFodH2QQwrfTNnuw11NasWyx7JF9ZTET8qVTLr2t1H1i1jHjXipJ3/Yw5/5js1VEGQPQKky2IAkl6f7ZEycjq+eq7Ykasu6A79er8qqyd1yH84QT1flaKfcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39850400004)(451199021)(31686004)(478600001)(66556008)(4326008)(66476007)(66946007)(36756003)(2906002)(110136005)(54906003)(316002)(31696002)(86362001)(26005)(53546011)(6506007)(6512007)(186003)(2616005)(6486002)(38100700002)(8936002)(41300700001)(8676002)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZ2dnp0NWhieU85V0EwTitqdVdaK20xN1J5V0hvNDdlSUppTzEySWdlS1Q2?=
 =?utf-8?B?MkdsZHNrUXIzcnh3Z0JQa2VSakJaand2NFdzMUhwZXZ6d1FBR0FXU29oRUJz?=
 =?utf-8?B?WjdObnRTanpJb3VYTzVoVEVqU1hWNW1UemVLWnY4VnI4Z0RqNFBiOVRoMDFh?=
 =?utf-8?B?RkkxSC80Ky9uNTRtZk01aWlZRXNuQ0dQRUhIanU5c0xENDFlRkt1QjZZZFE1?=
 =?utf-8?B?SXNWOWRXWnlPUFJFYlhRbkVmWW03WTVFdXp1a2RVU2x3NFhPTTcwbjVhNmFj?=
 =?utf-8?B?WHN6cTI0a3QxS1U2L3lkYTBjOWxwTVNjRFRSNHNLbkp0SEYvOUdmS1p2cWdG?=
 =?utf-8?B?SnM5MmVHV2U1YTNTQlVrdk43M3dWTXdDZzlwMXllVEljNXpGZjNDMUUva0dB?=
 =?utf-8?B?SDNDaEUvNFMydjhxNFVNaXNFWXd1Ym5oMEdNTmN0aWNRbFM3UC9hTkFOQVhq?=
 =?utf-8?B?TUNDSElqTlArNHRZR2RlZGJFa20wWFlTQXl6UkNWQ3dUdVhudXByT1NmdkFk?=
 =?utf-8?B?L1Y5ay96bkVqZ3VLL0dlRGg4all5WDczZGw5MTFTclIvdnd2TGUyMm9xSS9S?=
 =?utf-8?B?UHJUS081V2p3cGFMSjhjcW1vVXhMcmpUTnFzdDZRTEhXakpUQlZtbnY3TUVr?=
 =?utf-8?B?b1Y5bHVuWGx2VUNJeUZUZzVqdHhOVVNmZDZFRUh2cTVqc0RLWWFXN3pvZzdu?=
 =?utf-8?B?RDBtalZVQTRQMVdZMFhnVmpzL1dHYWJXMzRlQW8wVnY3cjV2Y01FTEdsaGJ2?=
 =?utf-8?B?VU5sSGlOdGxqOFFlemRwM0J3Mlc5REQ0eXBEMlowQXJxaHc5KzgyTDVLZm1F?=
 =?utf-8?B?SjA0WHhrOUpBNjJKWEVUNUNIa2RicWxtRU1zNkVvZ0VDWEZIallNd2syMVg5?=
 =?utf-8?B?a0hnTXViTWJ4SzdYcjY2YXZJMkFuSm4yenRJd1l6UG1INzkvYisxbDZyWGp2?=
 =?utf-8?B?elEwcTdSd0JOVzFac3QxTnkzcXBwMHNhR3hSVjF5aFBQZmxDMEpIWUlxTDZ2?=
 =?utf-8?B?WjhkLzQyNFhzUU11UzNDck16alV0blNQaGkxRjJyb0d5Z3MwR0lTWFkyWjJn?=
 =?utf-8?B?ckd5TTB3VFpaTS8vajdxYkYxMVZzWC9PY3FXTFFlSmNxSDNUMUdNWlIwVzNC?=
 =?utf-8?B?cGlyUFBsaVNUVVh6TlJFRzhLcVk3Yng3YmI5WndqaUp3M0NOR09wZDI4SGNk?=
 =?utf-8?B?bmtCSXRydFZxR2VGN2FYVEVrVHc2ajhJZFNMYlNXVFlwRWxjaFhweFR5K1hE?=
 =?utf-8?B?cVJvaXBFcENVNXZaWXkvakdqQVIrYjdHUnptVmdtNXExOXBCTnRTcDNXMDQ2?=
 =?utf-8?B?cUxxdXZhaCtzSm0ydDhGd2liVkhCZTgyWmN5YjdHcVVRYkY0ZllHSVU2c1VT?=
 =?utf-8?B?TGVaenRSa0ZQVUFyNlJBbjhyVTh2TXg3LzFmSFp2L0J6WS8zWUNUOUI3NDRS?=
 =?utf-8?B?T1JtMUpDMEF0K3E2Qmx1N0EzSHFQb0Z4c3VvMzJVdUtaU1FzK2tkcGM0MGlX?=
 =?utf-8?B?U1h2eFVwVnBrdmdtZDlzQlJMZG5jakZzcVBsdC9kaDJhb3o1RVlGSTNYSnV3?=
 =?utf-8?B?ZjZFd2NYK3Ixd0RtdytmS2VCcXFYN29wd1F3UTN1emwvbmRQOEtzbTl3U2V0?=
 =?utf-8?B?MStUZk9wSFRqMmRCd3BZcDRBSkFTb2pkZHhQVkdFVUZnY1haaUgyTFlNUmkv?=
 =?utf-8?B?M2NLeCs2QlFIVVZOei9xelJ4UGhsMStKV2JWaDNVUHJ4TUVFaFJScHhsK0hy?=
 =?utf-8?B?UTZWNnFDeVpHcjZ6ZWRQNDgzUEoxYlJrUndodnRSNHUwaTFNOWtWc1VMNVBW?=
 =?utf-8?B?dy9zQWpKdWxRZjdCRFF4aXdwdldJRXVEdHFGY0RGdkJ3cXkwSjhFcFBWaldy?=
 =?utf-8?B?OGljQmpmZXpTYmlacjh1NHN3aTVEM3prdUF4R09uaGI3bVVzZU5qRDhHUE5y?=
 =?utf-8?B?MzV6Rml6bXZ6TmVvV1pZRkJhRkRCdG5PQ1FnOUhlcjU4OEVDSXdJeWpFWVpS?=
 =?utf-8?B?NFljMWQ0NDc1eVR2Y004WlJBdnJEcVFPZitkcU5POThReFlOaUhQNDM5RWpx?=
 =?utf-8?B?S2RqYWpBQ3JFWThOWlJDc3ZZRUYyY1dQTTNOVWVGMFdnVlJUYTJWaERqYVNz?=
 =?utf-8?Q?xNA2dfFk3urKY38TCad3X3fkQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bedfcac-607a-497b-535f-08db709db810
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:18:10.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TjFx2BRAypNCi43APCTA5d64LpeTzqW4alaXJbh+eb2dAJDNla/jCqCXS0obft+VJCyKthd7TZ1FnXCXOxwVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 16.06.2023 22:56, Stefano Stabellini wrote:
> On Fri, 16 Jun 2023, Nicola Vetrini wrote:
>> On 16/06/23 09:19, Jan Beulich wrote:
>>> On 15.06.2023 18:39, nicola wrote:
>>>> while investigating possible patches regarding Mandatory Rule 9.1, I
>>>> found the following pattern, that is likely to results in a lot possible
>>>> positives from many (all) static analysis tools for this rule.
>>>>
>>>> This is the current status (taken from `xen/common/device_tree.c:135')
>>>>
>>>>
>>>> const struct dt_property *dt_find_property(const struct dt_device_node
>>>> *np,
>>>>                                              const char *name, u32 *lenp)
>>>> {
>>>>       const struct dt_property *pp;
>>>>
>>>>       if ( !np )
>>>>           return NULL;
>>>>
>>>>       for ( pp = np->properties; pp; pp = pp->next )
>>>>       {
>>>>           if ( dt_prop_cmp(pp->name, name) == 0 )
>>>>           {
>>>>               if ( lenp )
>>>>                   *lenp = pp->length;
>>>>               break;
>>>>           }
>>>>       }
>>>>
>>>>       return pp;
>>>> }
>>>>
>>>>
>>>>
>>>>
>>>> It's very hard to detect that the pointee is always written whenever a
>>>> non-NULL pointer for `lenp' is supplied, and it can safely be read in
>>>> the callee, so a sound analysis will err on the cautious side.
>>>
>>> I'm having trouble seeing why this is hard to recognize: The loop can
>>> only be exited two ways: pp == NULL or with *lenp written.
>>>
>>> For rule 9.1 I'd rather expect the scanning tool (and often the compiler)
>>> to get into trouble with the NULL return value case, and *lenp not being
>>> written yet apparently consumed in the caller. Then, however, ...
>>
>>
>> You're right, I made a mistake, thank you for finding it.
>> I meant to write on `*lenp' in all execution paths.
>> Please, take a look at this revised version:
>>
>>
>> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>>                                            const char *name, u32 *lenp)
>> {
>>     u32 len = 0;
>>     const struct dt_property *pp = NULL;
>>
>>     if ( np )
>>     {
>>         for ( pp = np->properties; pp; pp = pp->next )
>>         {
>>             if ( dt_prop_cmp(pp->name, name) == 0 )
>>             {
>>                 len = pp->length;
>>                 break;
>>             }
>>         }
>>     }
>>
>>     if ( lenp )
>>         *lenp = len;
>>     return pp;
>> }
> 
> Nesting more will make the code less readable and also cause other code
> quality metrics to deteriorate (cyclomatic complexity).
> 
> Would the below work?
> 
> 
> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>                                            const char *name, u32 *lenp)
> {
>     u32 len = 0;
>     const struct dt_property *pp = NULL;
> 
>     if ( !np )
>         return NULL

That's what we started from, but leaving *lenp not written to. How
about ...

>     for ( pp = np->properties; pp; pp = pp->next )

    for ( pp = np ? np->properties : NULL; pp; pp = pp->next )

?

Jan

>     {
>         if ( dt_prop_cmp(pp->name, name) == 0 )
>         {
>             len = pp->length;
>             break;
>         }
>     }
> 
>     if ( lenp )
>         *lenp = len;
>     return pp;
> }
> 


