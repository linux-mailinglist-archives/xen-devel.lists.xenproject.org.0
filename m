Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDF5FD877
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421880.667563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwUS-0007LE-2J; Thu, 13 Oct 2022 11:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421880.667563; Thu, 13 Oct 2022 11:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwUR-0007JB-Vi; Thu, 13 Oct 2022 11:35:03 +0000
Received: by outflank-mailman (input) for mailman id 421880;
 Thu, 13 Oct 2022 11:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiwUQ-0007J5-16
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:35:02 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00058.outbound.protection.outlook.com [40.107.0.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ad9e11-4aeb-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 13:34:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9482.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 11:34:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 11:34:56 +0000
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
X-Inumbo-ID: 11ad9e11-4aeb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN1NC+YQTGmjcnD9/NVcC2FlVvpIoxQViYkM6ib+8wKgRkj7i7trYH4NnnVBOl/czWJZ8+re+XkM20AocMmbKARgDDJBS+39UuahDrG7NsWudQcyYRA6E/FL993OmOnNt0+v7mjilwHVGyWDDTVuxJEK0/bkX36bXDoeKsB5BmZKeI3TXUkiEFF72FPyGAd/JT8mZxHY9RQnFJ8RnQq0WE6IJGtPI1q9oC4fBc3+Bb04wbV1RCuS2+arVQiZli1V+oZamPSzUFg0SfmyUpPCjN+8YeGGRFW9u/3RI8kS1jhfnfOPt/i7tOyzA9KjtNKpmGrpaJNCjoshXQwBjB6hxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YaMyZ/Sm76bOlCWIFmpzJUDd91GPdZ/WxGp7jwyDls=;
 b=MH2gXdSp3451argX+wgYp1RITa6X2+nbVvaAcOdN5ZLq55BuMqo7cuioZHPwagLwPP7xMiq1xAxcaJ9qrRNy/K8lF3UTvgsMzcMvEJfy6x3jJiRDlkbpNx1TfelSjSlCtqrE3uWAKpKwyZdNYwe9bv9OSvKCgVImH4wNM9q7zUKHh/ltvaKJTb0W1XmsSjqwvakRjUGAcqFO/Wvqga2BPEcxLht/BzoKv5RG0+A7jqs1O2ZsQ8fgfPKUk5N8wK5+SnOd/ABiZHIeHmVk6sDUgAPTNGNlK+B+KxCPN959FJjF+6/99rZRQVA/2E+qvYd3O0uuVwgG/qRp2V5JC/p6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YaMyZ/Sm76bOlCWIFmpzJUDd91GPdZ/WxGp7jwyDls=;
 b=txs00q6RGVaPv/L4t/Y9LKCH3E1P4o7FXUI5Tk3oSySKLma2m7w2SZMkipmVflwB3W8xGK3tNq3JVXf9VqQ/4v55w+euv//H32K7IEIGFdgyVwi9k3A4hcObNVjOqoAq19JAV5QQxSv4Zbz6P1Qu/+KbXXFKM05DR/Iwkpay+wU7wPrkztWq8zb4qg9U0TaL3CaNbDW/s6iD/cPBsd1y5R3aKv4mUccieyQjANaWGmPX+Wl0MQ63lD52ITWKETQdlY221nZ7PS5ooVo6n2vV6wuPo5mz2FNApkfnE3ba2QFIHdF5PQLSotblhHt6C3pAyPTg26+w7nJT+MOFphvM1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
Date: Thu, 13 Oct 2022 13:34:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0706.eurprd06.prod.outlook.com
 (2603:10a6:20b:49f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dccc44-991c-40e3-0ccd-08daad0ef40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lpyLbwv8kgzk7PSJ7o4kHcyeF4w6HSicpb3MZCosYiNjXx4lQDqRBaSReHUf9sR9oNwDw1QmSpqtkJ5HQh0TogwasMoDlxIUAII26IGfbZd9KU34Ft7bwNCaiW9zfLVlRUhu+213I8mHODzU8VuURR0aVMSnk0Hjm7vIMfY14dAwvsUbNoh5g4iubbCr+Ymx77hmYi76LkvOZErmX9KbQckNB8pKlv3potd0Qta+w+kGp7qa6fxGkbh0aVQm0HvB2R2oV/dW1IJ2aozEYA5cRdSvBg04g/ejHpmBnZ00chMmPOfJOLoU9wrThoQ33aR0zD/MdEWPOqgHf9TD3EYeZLdEMMVeAs/WHUSxIS6pjpXSA6A3TPob7n6Q+izgWpLcxmiV/lUxMNoNaLwzAcgWfYaeqKThnhQ7lxiGmHxndUqiITsPJVa4zovfmPBoE+MDu9GF8isH9gMC4fplMrFYSXr/UCc3U9w+Ww7ZnHX3+lpDCfTw0N6fi22aRpox3VRD2jIkDt6uHCrzL13GWG6X15quU5ahvXd/hKzC/Gw40wMwXMIGZq2SlgC8GS5VdN6iUEJMkNDQCMP/1KQCkpkkDDIEsqmHt8pllpZHlRDbJfysiN7bGdQZAmcIiAsWlZ9uJ1OYzw0KrMIX2ue56cFmYlJE++iiCFUITWG3wxZh1ELyxcPOQ9KPDeP3b6FJ3yFV9+zBQgWk431jvXwCKoOuvgHYLrHU99R7+3Ndke75KNsdYtfCwgTtLDTZRFOiygj0mn3KlanP38V9mU3BwAvDbHcEvby2R6iDTQVUcUou5OGorfhE3wqKvECktOgWcEyiltKdA0vbpHDjxI8mNfCVFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(186003)(36756003)(2906002)(66476007)(316002)(66556008)(38100700002)(66946007)(8676002)(30864003)(5660300002)(41300700001)(8936002)(31696002)(86362001)(83380400001)(478600001)(6486002)(6506007)(4326008)(966005)(53546011)(2616005)(54906003)(6916009)(31686004)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emxiOEVSUXpwUm5xY2N2NWxjbCsxSS94amFFeFZRQlNsNlNycUVyWnNzcExI?=
 =?utf-8?B?WWJwbGFtbDRDVkd1NHZ0eW56ektqNElrcHJOY2x3WU55WVFYdXV0MXhzRFdy?=
 =?utf-8?B?TGVWZjRNSzQ3anRsNVhvY0EwVDhJNHYyOVdJeloyNVlNelU2dHVCVDQxSzV1?=
 =?utf-8?B?V3pHUUFJMUhoS1JaL2pudGhLV1YxZDlTWkk4U0Z3TkRtR251ZDMrWEVBaGE5?=
 =?utf-8?B?M21RTXZiK3lVaDBrUjFVNkRQcVdIalRMTWVGOVRNNkt2VDNsaUxncE9FZmY4?=
 =?utf-8?B?TXFOd1JKRXN6TkdFaFhpdisxSUFpZ0FjcDJzVWJ3eTFVUm02S0JLa0R5WHNT?=
 =?utf-8?B?UFRIdW9xenEycG9PdTYzQzZBMnRERXJKTDhIeGR4ZmtVbTc4NFJLeXpTUDZG?=
 =?utf-8?B?WVNvbmM0YnVFNUgzSWZaREtReVRpK1dveFA3bWQrUVVFUWVzVHNlb1MrYTlP?=
 =?utf-8?B?Z1MvYXVwb3B4TUpQQXpnNW1pcXpRTmphYVkrZWFXajExK0krWFlIdXZsSnl6?=
 =?utf-8?B?UDR0ekZiTklXVWl2WGZ6dlZXUFlMVkxUT1JIcnRlZmtJcCtWQUVySXBBbFdU?=
 =?utf-8?B?OFJZd0pJRVEwNzRaMEwzK3NtWm1hWHEzTnl2RW9GbUtXUnFrUkZlYUtwN3hV?=
 =?utf-8?B?OWxUVCs4bmFnNERtdnk3Q2poVlkxbHVJY0ZZR0tGREFmUGc1aXpjczZuNHJ0?=
 =?utf-8?B?VTUyVThjSGYrbU1TUVdvVnBRcnh0a0gyY0VMRnVuT1pmeE1xQ0hpVHRKMDNT?=
 =?utf-8?B?YXZGcE5pOXVsSWR1bk1JdzdWRzZGeDBSV05RSGhFU2k5Wk1iMVNQcDA3c2ph?=
 =?utf-8?B?K29XRGZ2U05Ld0lXN3g4YlBvRngyZ2hYQ3JzY3d2NEY3VlVXYlM5L3Rnc1Bn?=
 =?utf-8?B?YStYNkZzbkpCYll6MGNPTFlKMVhhTUd6b01ZTTltWVJEbTR6OTRJQUNjSWJR?=
 =?utf-8?B?NkRJZTRaTVdhRWV0VmZRclRQSXNmYlZPWVhyZnFCZVNCais4c1FhKzE3Zmdl?=
 =?utf-8?B?ZFlFQWtiKytDUDVIOG5wZ0hoRTRQR1k5VEJUbzFISTFOSmdjZkRYTnkvclVv?=
 =?utf-8?B?T0I3bG1TZDFnWFZEZzhrWnplTkNxV1hwZUp6aTU0bG9VeFhvOHN0TkVLYkV3?=
 =?utf-8?B?eE16VzJFMW5lMlgwNVhrK0ZJRWdXajk3dXRodjMzbzAzdXNoeVFLYVNZQjI0?=
 =?utf-8?B?clVEV290TmNzcXFqTldKU0RoeGVWNGVUTlJTb0ZNNzN2ZlpOaHhLRFVhVUk4?=
 =?utf-8?B?UmZ1NlE2RW84Q3BPc0pWNHdtQjlhem5rN0w3eWhmVTJEZ0hJazdGSjcrbmxz?=
 =?utf-8?B?bmVhaVdYV1pjd3YweFBHQXloL09RZStSSUs4OXVYeXlhT3BPNXpkR2MzN0ZP?=
 =?utf-8?B?a25sL2lMdWdCWFdCRWZhUm1yS3dPVGxINVFsT2lxQjdLY0t1bEYrQ1RQeks1?=
 =?utf-8?B?Tkh0MUVFZGJCVzE5U1ltczBQSG5GWTZGV1d3SWZFcjZzNEVxS2hRd2twWFM3?=
 =?utf-8?B?NnpsM0ovRVdBZ09Za1FnaHhjU2p5REU3REVCanpDWFJjSmpWQ3hUSTRxK20x?=
 =?utf-8?B?VFpjUnFKVC85eUVlMEIvRUZFb3JXL0RhZitiU0p3MTNpWWxJV0lLbTFhZmFN?=
 =?utf-8?B?emFaUzZuVmx1NlJ1NXFFd3Z4TXJjalhJQ2lYYU5OS2pwODNJNlZZUmpPVDM1?=
 =?utf-8?B?M0JjR3VZV0l6TEVZT1o0MWYwMW5ESEMyVmRaQlFrT05tT2xyMUtpT0MxY0dw?=
 =?utf-8?B?dUxkYlVjY1hCTkNBTEhoRWNGbm9zOXJCYXNrYmRXZGZjOFovVlJ6Z1FhUkJ0?=
 =?utf-8?B?TnFlUngzamdlSFlBMkNEcUtGTmlpOUExK1FhNDRCNzUzbDJvQ1hoMm84ZmQ0?=
 =?utf-8?B?dXJjdHdsaFFTdmRCeXpsMlRXTnU1NEZBNTMxTlVKUkd3bUQxNlR3RlRNcmoz?=
 =?utf-8?B?bEcvS0llRUlhWHMvWlRWeFlWSVF3L0NoNkl6Y2ljd1BRWGxPb3FBcEJDSWY3?=
 =?utf-8?B?bVpWTHpWL3o1b0EveDRST0M0Zmg1OENRQmlsbkFQbkdHSEp4bi9rYTY5QUhv?=
 =?utf-8?B?bVl4Y05BeVBjV2l5UTNzemNmWllKckM1VTVIRVZGZC95TGxLMi91RDJnR29i?=
 =?utf-8?Q?atnyMJxqu0MTB7DijYXcdkUSp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dccc44-991c-40e3-0ccd-08daad0ef40d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:34:56.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVdLLbgy3GkQTzRZFWaW5Yxe0Y+o1nE2mLxaaAMA9fx7zVHBl9hSgPJODS6wKMfUOYi5ryiOZwMAsqJkBRASYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9482

On 13.10.2022 12:11, Luca Fancellu wrote:
>> On 13 Oct 2022, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>> On 12.10.2022 18:00, Luca Fancellu wrote:
>>> In the Xen codebase, these tags will be used to document and suppress findings:
>>>
>>> - SAF-X-safe: This tag means that the next line of code contains a finding, but
>>>  the non compliance to the checker is analysed and demonstrated to be safe.
>>> - SAF-X-false-positive: This tag means that the next line of code contains a
>>>  finding, but the finding is a bug of the tool.
>>
>> We did discuss this: False positives are often specific to just one of the
>> tools used. I think this wants mentioning here, including the implications
>> (iirc the plan was to keep the tag generic but make the table entry express
>> which tool it is that is affected).
> 
> Yes, in the database format below, a false positive entry will have its key-value item
> in the “analyser” dictionary. Moreover, a false positive entry could be written for
> example as the line below, to suppress a cppcheck false positive for MISRA rule 20.7:
> 
> /* SAF-0-false-positive cppcheck false-positive for rule 20.7 */
> 
> Clearly this comment wants the proper entry in false-positive.json with the correct internal ID
> for the rule 20.7 given by cppcheck, that is “misra-c2012-20.7”, and a proper justification that
> explains why it’s a bug of the tool and not a non-compliance of the code.

All of your response doesn't really seem to fit my request of making more
explicit that in the common case false positives are expected to be limited
to just one tool. (In fact I was wondering whether, other than for the
"safe" table, there wouldn't better be per-tool false-positives tables. Not
the least because false positives are also liable to be version dependent,
which currently you have no way to express.)

>>> Entries in the database should never be removed, even if they are not used
>>> anymore in the code (if a patch is removing or modifying the faulty line).
>>> This is to make sure that numbers are not reused which could lead to conflicts
>>> with old branches or misleading justifications.
>>
>> Can we add provisions for shrinking such entries to e.g. just their "id"
>> line? Or is the intention to be able to re-use such an entry if a matching
>> instance appears again later?
> 
> I prefer to don’t shrink it, the name itself is not very long, even using many digits of the incremental
> number, it removes also the dependency on the file name.

Name length isn't relevant here, and I have no idea what dependency on a
file name you're thinking of. My question is a scalability one: Over time
the table will grow large. If all entries remain there in full forever,
table size may become unwieldy.

>> Taking this example I also dare to ask: Shouldn't tools be aware that
>> token concatenation necessarily means no use of parentheses? See also
>> below.
> 
> Yes the tool should be aware, in the example below, the tool is complaining just
> for the lines 75 and 80, in that particular example I would have fixed the finding
> instead of using a justification, but I’ve reported that example just to show how
> the finding can be suppressed.
> 
> Here the link to eclair: https://eclairit.com:3787/fs/var/lib/jenkins/jobs/XEN/configurations/axis-Target/ARM64/axis-agent/public/builds/541/archive/ECLAIR/out/PROJECT.ecd;/sources/xen/include/xen/param.h.html#L75_violation
> 
> The coding standard wants just to have this:
> 
> #define string_param(_name, _var) \
>  __setup_str __setup_str_##_var[] = (_name); \
> __kparam __setup_##_var = \
>      { .name = __setup_str_##_var, \
>        .type = OPT_STR, \
>        .len = sizeof(_var), \
>        .par.var = &(_var) }

May I suggest that you pick a real example then rather than one where we
actually want to fix the code? People may derive more than just the
intended information from any examples given here.

>>> Here a brief explanation of the field inside an object of the "content" array:
>>> - id: it is a unique string that is used to refer to the finding, many finding
>>>  can be tagged with the same id, if the justification holds for any applied
>>>  case.
>>>  It tells the tool to substitute a Xen in-code comment having this structure:
>>>  /* SAF-0-safe [...] \*/
>>> - analyser: it is an object containing pair of key-value strings, the key is
>>>  the analyser, so it can be cppcheck, coverity or eclair. The value is the
>>>  proprietary id corresponding on the finding, for example when coverity is
>>>  used as analyser, the tool will translate the Xen in-code coment in this way:
>>>  /* SAF-0-safe [...] \*/ -> /* coverity[coverity-id] \*/
>>
>> In here, where would coverity-id come from? And how does the transformation
>> here match up with the value of the "coverity": field in the table?
> 
> I can put an example of that, as you pointed out it could be difficult to get where
> this proprietary tool ID comes from.
> 
> The proprietary ID (Coverity in this case) comes from the report it produces:
> 
> […]
> <file path>:<line number>:
>   1. proprietary_ID: […]
> […]
> 
> after we see the finding, we take that ID, we put it in the “analyser” dictionary as:
> 
> […]
> "id":”SAF-2-safe",
> “analyser”: {
> 	“coverity”: “proprietary_ID"
> },
> […]
> 
> So in the source code we will have:
> 
> /* SAF-2-safe [optional text] */
> C code affected line;
> 
> And when the analysis will be performed, the tool (coverity for example) will run on this source code:
> 
> /* coverity[proprietary_ID] */
> C code affected line;
> 
> The tool will write a report and will suppress the finding with “proprietary_ID” that comes in the C code
> line after the comment.

Let me add some background to my earlier comment:

If we wanted to add such IDs to the table, then I guess this would result in
a proliferation of entries. If my observations haven't misguided me,
Coverity might re-use the same ID for multiple similar new issues found in a
single run, but it would not re-use them across runs. Hence irrespective of
their similarity, multiple table entries would be needed just because of the
different Coverity IDs.

> After the analysis, the source code will return as the original (with the SAF-* tag).

While you mention something similar also as step 3 in the original document
near the top, I'm afraid I don't understand what this "return as the original"
means. If you want to run the tool on an altered (comments modified) source
tree, what I'd expect you to do is clone the sources into a throw-away tree,
massage the comments, run the tool, and delete the massaged tree.

>>>  if the object doesn't have a key-value, then the corresponding in-code
>>>  comment won't be translated.
>>
>> Iirc at least Coverity ignores certain instances of what it might consider
>> violations (fall-through in switch() statements in particular) in case
>> _any_ comment is present. Therefore may I suggest that such comments be
>> deleted (really: replaced by a blank line, to maintain correct line
>> numbering) if there's no matching key-value pair?
> 
> Yes the line won’t be altered if there is no match. This to ensure the correct line
> numbering is not affected.

"won't be altered" is the opposite of what I've been asking to consider:
Observing that comments _regardless_ of their contents may silence findings,
the suggestion is to remove comments (leaving a blank line) when there's no
entry for the targeted tool in the table entry.

>>> - name: a simple name for the finding
>>> - text: a proper justification to turn off the finding.
>>
>> The distinction between the last two doesn't really become clear. Taking
>> your “Variable set but not used" example above: Such a "name" will fit
>> many cases, yet the justification for each might be different. Hence
>> the question is how unique "name" should be and - if it doesn't need to
>> be unique - what information it is intended to convey.
> 
> Name is not enforced to be unique, it’s convenient to get a subject for the particular justification.
> If the name of two justification is the same, but the justification is different, then it won’t require
> much effort to write a different name to quickly recall and differentiate the one from the other.
> 
> However if no one finds the “name” field necessary, we can remove it. It was introduced having
> In mind that at some point a document will be created with all the justifications together.
> 
> If others are against it just reply to that.

I can't say whether I'm pro or con as long as it's not really clear what
information is to be conveyed by both. If "name" is somewhat like the
subject of an email and identical names are deemed fine, then so be it.
Question though is whether having perhaps dozens (or hundreds) of
identically named entries is very useful.

>>> Here an example of the usage of the in-code comment tags:
>>>
>>> /* SAF-0-safe [eventual developer message that shall not exceeds line char max count, don’t break the line!] */
>>> #define string_param(_name, _var) \
>>>    __setup_str __setup_str_##_var[] = _name; \
>>>    __kparam __setup_##_var = \
>>>        { .name = __setup_str_##_var, \
>>>          .type = OPT_STR, \
>>>          .len = sizeof(_var), \
>>>          .par.var = &_var }
>>>
>>> In the example above, the tool finding for this macro is suppressed. When there are multiple findings for
>>> the same line, multiple in-code comments needs to be inserted, every one on a different line.
>>
>> Since this is about parenthesization, would
>>
>> #define string_param(_name, _var) \
>>    __setup_str (__setup_str_##_var)[] = _name; \
>>    __kparam (__setup_##_var) = \
>>        { .name = (__setup_str_##_var), \
>>          .type = OPT_STR, \
>>          .len = sizeof(_var), \
>>          .par.var = &(_var) }
>>
>> satisfy the tools? And wouldn't we better not mask detection on this
>> construct anyway, since the last of the uses of "_var" indeed does
>> violate the rule (without parentheses added)?
> 
> Yes this was just an example of how to suppress a finding, in this particular
> case, I would have fixed the error instead of suppressing it.
> The changes to fix the finding is above.
> 
>>
>> As to the placement of the label: It was repeatedly said that analysis
>> occurs on pre-processed sources. Is placing a label ahead of a macro
>> definition therefore going to have any effect at all? Wouldn't the thing
>> rather need to look like this (assuming a pre-processing mode is used
>> which retains comments and respects line splits despite the use of line
>> continuations in the macro definition):
>>
>> #define string_param(_name, _var) \
>>    /* SAF-0-safe ... */ \
>>    __setup_str __setup_str_##_var[] = _name; \
>>    /* SAF-0-safe ... */ \
>>    __kparam __setup_##_var = \
>>        /* SAF-0-safe ... */ \
>>        { .name = __setup_str_##_var, \
>>          .type = OPT_STR, \
>>          .len = sizeof(_var), \
>>          .par.var = &(_var) }
> 
> From the experience on cppcheck and coverity, it is enough to place the
> In-code comment above the first line of the macro to suppress the finding.

Interesting. How is the comment then propagated to all expansions of the
macro (in the course of pre-processing)?

Jan

