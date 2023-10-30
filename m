Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDF7DBCC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625210.974263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUIs-00033n-IO; Mon, 30 Oct 2023 15:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625210.974263; Mon, 30 Oct 2023 15:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUIs-000328-F1; Mon, 30 Oct 2023 15:35:46 +0000
Received: by outflank-mailman (input) for mailman id 625210;
 Mon, 30 Oct 2023 15:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUIq-000322-KQ
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:35:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc15659c-7739-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 16:35:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7426.eurprd04.prod.outlook.com (2603:10a6:20b:1d7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 30 Oct
 2023 15:35:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:35:40 +0000
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
X-Inumbo-ID: fc15659c-7739-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9nA2Ziux3nFyaoc2JN2XJV+b1zmmkbaWfQ+oEzw9+3Fe+s8n8Z0uvIuEQOcrED8UAV1J/K77Bhf/JKnt/1i5TYgw8Qb61WmuQThNbwFP9vVQ4dgrTIymiaEsizeFFVMwQNbsgAgreAiTGQv/hd0lKiD1Ud3A/50qn2fDt+BPPQM63H4Xq5OawTKSQPML8yEN0vKRW0g1Tk+hpq1cWMwClEonnBi3YmcO8CmSy63Fbk8m3NsI8CFGpjhD7DThWzlRTBRxrTJ04Tu7xrzdGux6JuSEin43TnZ9X+Gns0AIwU2DxPDsYDbYSKnAl5xeXvfEzqQ/+nUB8TbCE187VizTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOO6TXwIgFsuiSsZDDTRIprwRoxAmkoWKLRvI2AX4Y8=;
 b=oA98L6j3T1+bLW4doJgNQ2j4AZ+uxreL5zYFZULdfkUp+VeltAGG9nqfbjegMV5SfVxHyPuGeFwwp95n0HVy2tY8ekcMubYhEC4N9rORhHEe2TBYNw3EI5D2TAGam9OmJ2kmxJ0mP60KT6Rl/4sbyLwCYRyPHMUgrEv0uFpYLKYsAUHZzpoziENHwiKqxI5bwSuQW2vfFg9t8GSv8qaCxxC+m6kNGe9R7yHkLYWHOa2n0jQn3aqaJsYkEHZycT067OPlfIgrRmMt5lRWkU36nNJr5GThHoC3JNh7P7j0v82wbldEJ/ddjOyNQouaS8yWCm0PCq8E9Ni6SK26z1Sv8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOO6TXwIgFsuiSsZDDTRIprwRoxAmkoWKLRvI2AX4Y8=;
 b=zy8ZqoUZuWo86q4m4vnSBhRkti3rp1u7l8oKO2qoghSR3ltLM/MBL1//dyO4Wuj4R7FFFZO1teG4s1CtpKcqe0M88WVKLtVAaxAr/SqxiFwn/WRbbowErgfLPSn5NofLwn+yzFD12by+UCFNYof9yPhskMGSVdjaovQg6IxgorrcAAVA2uJkerNW0DXwuKxEuK6liUFVn9Ho2kvdqv3F7d902yUcGBKBKZJZ5+4keHfb6EpoxfeHqQhSxgK7tZEEuhr9DNwKTnz947K87DHgr4ydh0WdogVZYSaq8Ctmta6tNgvaR7/hn4KMiaOgUFmQ7uJ+im3HOWgJ6ApOWtt5Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23a229f8-9987-ead4-995f-a917300ac6ae@suse.com>
Date: Mon, 30 Oct 2023 16:35:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com> <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com> <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com> <ZTqDjNSBmXeblsud@macbook>
 <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com> <ZT_IP_-X4oLhmcFT@macbook>
 <e4929b28-5608-bba8-9953-270f408e32eb@suse.com> <ZT_KbM0tzrn5cWR6@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZT_KbM0tzrn5cWR6@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f059aa-473c-49e7-a80e-08dbd95ddf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Hy/lmM7vdR6Xq45R55qpAoVDeZNx60iJuumzW/kr6DqoP8WMRvzf4i/V4pDp/YlvBeuM6hh0baqiqD8ap40wLh7dtUdUtteTJTBwsUH4I/O6lRH17uWglQyfVc8UUYY/vLKOenOOE3isQe/FLD27fec5Gg9Eo/RDzAaCl2K4uktNrX/QjfCZbLSqs3E8I7tP1wC6CTksequqWp4Haddzr7cgJ0UqnQFQpJyYBeA3A2uX7BJh2nIXrQt7psGdSPIh6WY7J246crvBtGssiBNiWdAta3orw4AwtdP+Ao7jV+jIR9oexOc7PJWluDKbk2SRzhy639WMeYyt3ITldvlVxX0jX8c5UHFPgKGfxSfxIho/15LfOGLQpFr9hJVUI4T1yNabvSbT+KAulXXPqLyDd2H2Z+3nrT+Ik5rOxnZQybOMUv8fNnC74IO2Ac5DsL8M6yKOmeyE7tqQRvc1ZY/WbbEbjf4dJ/2swpQcmFgyTf4YYTzVYqytzsYph1so7TXF+rtBzZ18qASXGiQ5xr5fVgs1biYwQj92Fu+msX9jjY0C+s5+j5BkkwfNrfha+V1H+KfE9dHhupHy7YR3vt/RgMMO5I9xZRcFjvCLkEBhImGoTPR2AkR5uGUZgjF9WJgI7X55SViryGDz2vSF5plNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(26005)(2906002)(5660300002)(36756003)(38100700002)(41300700001)(6916009)(31696002)(8676002)(86362001)(8936002)(66476007)(4326008)(478600001)(2616005)(66556008)(53546011)(54906003)(6506007)(316002)(66946007)(83380400001)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmVoRDNmMC9qZjkxSWtyUUszS28wVWR3T0tpRUE0VmozdE1TSE1yNDlqbHRp?=
 =?utf-8?B?S0IyYnVsNm9XN1lRcFE5TFJ3OFYyV0ZEY3kwVzdoZzlPSDc4RENqN2lPNWVK?=
 =?utf-8?B?MGFjTjQ3SUpIUmlSU0pTaSt0MWE5eU5FelRiTjVqbkFBb3ZlRXNqd0pFUkhh?=
 =?utf-8?B?UnJJVlY2aFUzQ3U3OGhXeWVGbWpYaG14akRHaU1jWW5SN1AyQ0lRSzFuNW52?=
 =?utf-8?B?U1FHY3hwMjIvQVg4bXdrNTBkMkhGOS9NN0ltN2UvNlBTSVliQzMySDk0UTFZ?=
 =?utf-8?B?VUg0R2QxcGtCaWVjb0lJQXpFQ0dSS3NhMWQvaC9uK2hyZ1I1UmtHcktzNFJC?=
 =?utf-8?B?M2RrZ2NGdUIyNGJvUVd2V1Q2b0R6U2tlZmx0djdRdUhqelUyUGg5Y09BRFMz?=
 =?utf-8?B?WTNxTmE5cW5nNWQveWhDeVZnZit6SUs1RGZHMEd3Y25QWkpmZ2Q3bS82ajVS?=
 =?utf-8?B?aUN5dWVzWlJ5RjducmdTTWk1WlE2cGlXbnk1Q1JvWWFIblRqajlQa3dLcEY2?=
 =?utf-8?B?eW5hWkVpaG4xbmVYaG5KT2VNY3pNVklrK3R5REs0b244UG9BQkMwUnUxVVJj?=
 =?utf-8?B?ZkxmdkhEZW1BQ3luQ1lhWVFsRlcvME9BZ1VxazlPTzhjZUtMOW9nN0tmZHBl?=
 =?utf-8?B?elExSms1VEZQeVlndDVmZHY4cTRnRitpRmJNc21GK2VnUjh1Q0FHdy9UdEV2?=
 =?utf-8?B?Y0YxOUtTY1BWL3VoMzhTeFdJRUhuRTBXLzdOZDRVTnZZTVBXbE9XTUI3UDlr?=
 =?utf-8?B?a0lVbmgvK0tURSs5eGVqV3JOdWtHb2pvenpEdWl1aStpb0VpbjVUaUdHVzds?=
 =?utf-8?B?MDFOM2Y1UnIzUER3Z3BMeStiS0d3c3hyYldsc0NtbTJtVFBrbFF4VFk4Q2Ri?=
 =?utf-8?B?c0IxdWxEaXNaR0IzOXhNejB3TFIzK1NTeG01OU9PM2llemNxYW9CL0VUZVo3?=
 =?utf-8?B?azZDaWdjZnJBaWp2eGRzRGJkMUp2bFo2ZWxuR1RyT3JsclQwaTB5eWtUNXpq?=
 =?utf-8?B?Y2VsdEZrTFE3bTcybXRGSDJHUGdBdGtrTmlZMHJiTWk2QldlWmk1bUNyUklF?=
 =?utf-8?B?aWNteFdreWcrZDlGVTlVQTA1N2RXSlAyRUxiRzBwbk4zVWZGUHZsZjUyNmpu?=
 =?utf-8?B?ckdhSE9wbWVFYjgrTXVwQVVBWjJYaStWdzdXUTlYdHc3bTJqMm5KZlBzQ1gz?=
 =?utf-8?B?V1ZCWCsvTFovVzdMMUp4NS9oRXZScE4yaVJvTXlLdks1cVlFanIxRmdMR3VP?=
 =?utf-8?B?WEZWNEppbitDQXFGd0ZBQTZ2a0hQQzh3T2VVS25abW1HcThxWENFbTR6dE9C?=
 =?utf-8?B?WCtSb3ErdUdDaEE3a2lBS3JSeEpSR1hNYVdoa1dDUWR5TThkd1dyVFlIVjZa?=
 =?utf-8?B?VVVxd2FkQ2NMUHlWbG4yNStETkVsUFE1VkxERWlSbHRmcDNVTmcrM0RhemxN?=
 =?utf-8?B?bFQ1T05Kd2tvVDJ5NzU1OWluazFkdkVzbmh6NEt4M2pNeC9FU0RLaTI4a1NX?=
 =?utf-8?B?bGRQY0hFY24yVkRCY0hFSTZmcVVjU1hsanRTdW9zSUgvdUN4cWh1TGowUFd2?=
 =?utf-8?B?QW5LekVneEFZZ0NFMlJ0VldpRVR4QkR1VFpOTVkzU28yVXV6TXF3OHl3N0xO?=
 =?utf-8?B?QkFVRU9DSmFHYlhzREtyTmNXY1o4VzJqNG9rc1V6STB1RUhRWFhQZlZweUM1?=
 =?utf-8?B?VERnWCt6Rk4xR1hoOGh6YzF5Qno5WE9iSDUzTDd1Z0licFAwQ2RHUUJjMnVx?=
 =?utf-8?B?cXhKZFM4aHdsRTduRFZYa2dyWERZYTlMWXgzd1FkT3Q0V2VsMTJCT3ZZTjVV?=
 =?utf-8?B?Zlo4SlhKVXBBNjY1N29UMXNuWUVSYTBhb0RlS3JBUU9McCs3OGJZQVovTlBK?=
 =?utf-8?B?N0xVNE5JZFh2Zk9Nc2NNOFZ4QldJckFxUWM4YUd1aHFMMFczRTFlcHgwcXlk?=
 =?utf-8?B?RUpWbURNN0U5MUx5bEl6cFZsdEZla3VBcU9MbjNLcDdLQlQ3RXNhZkpqbUty?=
 =?utf-8?B?cWdqQzE2cS85ZW1yaTFzRzhiTVpLNVhuY05aS2dhWVgzT1dWUWtHenJpUnBI?=
 =?utf-8?B?NW5aS2pnYkZVc2o2NDZCR3BDenVSQ0IyUEdZU2dudWZEajVTcEdtcWFoZjNF?=
 =?utf-8?Q?36vL8hvJpbH5hs6PswxtyEJZF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f059aa-473c-49e7-a80e-08dbd95ddf09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:35:40.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwQYu/KokEBu3Y4WfWpecgah1qXxjbeC6rbwSfOHD1LPa08rCswoEdFd68pg6HEvspk8gxYSmeZQxl687hz6uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7426

On 30.10.2023 16:23, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 04:19:22PM +0100, Jan Beulich wrote:
>> On 30.10.2023 16:14, Roger Pau Monné wrote:
>>> On Mon, Oct 30, 2023 at 01:24:52PM +0100, Jan Beulich wrote:
>>>> On 26.10.2023 17:19, Roger Pau Monné wrote:
>>>>> Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
>>>>> Kconfig option in the first place, and instead a specific Kconfig
>>>>> config file?
>>>>>
>>>>> Maybe it's not possible to achieve the same using just a Kconfig
>>>>> config file.
>>>>
>>>> I'm afraid I don't understand what you mean by "Kconfig config file". It
>>>> can't really be just another .../Kconfig file somewhere in the tree, as
>>>> it doesn't really matter where an option like this would be defined.
>>>
>>> No, I was thinking of splitting what PV_SHIM_EXCLUSIVE actually
>>> implies, for example by adding CONFIG_DOMCTL_HYPERCALLL or
>>> CONFIG_PLATFORM_HYPERCALL and re-work the pvshim_defconfig config file
>>> based on those, so that we don't end up with negative relations.
>>>
>>> Note sure all usages of PV_SHIM_EXCLUSIVE can be split in such a way,
>>> maybe we would need some compromise.
>>
>> Wouldn't such a CONFIG_DOMCTL_HYPERCALL then still want to depend on
>> !PV_SHIM_EXCLUSIVE, which is the kind of dependency we want to avoid?
>> Aiui the two (splitting and inverting) are largely orthogonal aspects.
> 
> No, CONFIG_DOMCTL_HYPERCALL could be promptless option enabled by
> default and disabled by the pvshim_defconfig.

pvshim_defconfig shouldn't play a role here. Anyone configuring a shim
build from scratch should also get a consistent set of settings. When
there's no prompt and default-enabling, I'm also having some difficulty
seeing how pvshim_defconfig could override that then.

Jan

