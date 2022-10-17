Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B755560097A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424200.671452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLuM-0000Vp-6S; Mon, 17 Oct 2022 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424200.671452; Mon, 17 Oct 2022 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLuM-0000T8-3d; Mon, 17 Oct 2022 08:55:38 +0000
Received: by outflank-mailman (input) for mailman id 424200;
 Mon, 17 Oct 2022 08:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okLuK-0000Sx-Ia
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:55:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 765b2a1a-4df9-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 10:55:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 08:55:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:55:33 +0000
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
X-Inumbo-ID: 765b2a1a-4df9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBPM3sSys4y6h7re5Wihw3XmxPz5CuJpBRDs1XKyUKDgFfxLm8foL16Uok5W7uniAOsYkO6veSKCeV1fx/FXJOgt6BExBXT62W+94fpxKiNoJ0e7AgJrynrdx9NjA9Vk0KDTe3qkYiOIdealSK1OXyf8+XtHlsqw8g/Q/lcLp+IDGS87/O+VFaMX0lunW3/v3rEq0AfVzJ1ZRNphGCUsy3lzuMez6qMmciB0jJgdCqn0PlUVioq/4CPdNxWWlvENN3B/08bzBwG9Ljjv4IXFz/0L6BROb0KLv539E8iOQT1Q/rFncrKNfKHotC+eXXlp7flVQ1vB6pITlbl7UVoniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DHxrCnKMCK7Ld609K3m/CjFfyYBY1XExiR573qMtMs=;
 b=H6BufnOk0GwTIttlKHGoZaPPcd7y87m6aouXJ+wpG/cYD70ga3IqKiAd82MF4hcv5sZ86w60Ofppu4MmatJC+kRF0ijLA4Okag7uyv92ihCwV3f6WpwqABFjZzZHmGjiECOdVSyedbqlN+mhBaby48J0eAdPvfwEQvh2e0HG04+LYYk0Kr59JNjhliYwqaa7uyn7oVpd8zkaHh7dtVaU7scqeM6TdA0isPiHx0l0pVm3vJE/FKKN2aXXcOam5xWwcweiCa+MtXQxxhEpcYjr93Xg93tJ7ApOl1Q2gT9Fnxg4Wuuxac+Hh9D7UHVX3cDWGzX5qk2ClnsWDOYy5AKphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DHxrCnKMCK7Ld609K3m/CjFfyYBY1XExiR573qMtMs=;
 b=MHQWocAJX1aVWftgl0KIZKlOkd3k8ZHKGU4lafX4y1ulWw2STRDuoXHBLkXeovP9kfBuir/T449OdNZdjnKkHgyFM3gpdsM5gUraPEEMcDAeRuP4nF7OR8feXyN6dgW3mGQSS76z66rMLNTjlUWxwDWosHeTjZ07Ke6WLZItz/2HgXNecWr9CRrDuK/matkIXOdJ6/XVlbdVKFLeo8ZhRBypo5NN4DWEbbOpZdhjSsJJTycyLEHEoK97dCqq0WijCfa7d47lt04LyIyJYuW9Zgs4Tp7trc8ee1avaS9NNImN+csQ+0L+PBkXd86XSFjuntL8YiBsU3iHZ19BqvAx/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
Date: Mon, 17 Oct 2022 10:55:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0060.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::37) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: cb62d52d-53e3-4d9d-eec9-08dab01d59e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hmN/2kFXsxZZxNawwz354ZYeQ8D2wjCQ7Udx+OIQBT+8a5Z4qXTBkKHkzHgvLouJ7SFycmX1MAjHNH6RFcfNC3tFDuLOy7r76ESx1OSbaitv5t30srIhG5TPXUz02GnNE3uoh6rg8e1UT0xo8u5HHcnMK9Ing4VZc9vlcZoM/IFdjc73EPTk1Tkd8PSl3YQg0at/2QJFFx8EvbrKRRX012c17RjuRRUJ+XKab6+Q7oD3jPvREnH90wx27FFH+sZOf5oRETu9ZDBu0wz6mKjtVo80N1WxrmpEm63enwKj3P3d3nYlfpzgYK5/S+fxuRVnoeSGCtUeJhzhd6BPSGMaG2xSWFUjyio2VYTjFGn7k3myAqBKTVGxyLS5Mw2E/C7uwJMpdpyEJiQ+ObRQJjLqaCkPxBKpd8p7BjC19cGpZk4+e/E2II0vI80fsMZtJ1Q+Ibvikqh/oJZV9w7+oosXKO3KhV7cILmx7xnZryjCb8+obSOh16GO2fP3N9fU3HCRn8Ms0ydCFXd06DAvFQEPkTx0RvcN3EGN/ay+Oi9mZ1sbvBmvRUCnpzhHPmZFcW3CR0DdL24f2R1FSlVmeX3wsxHNcu8lLVVRW72ywQJ8NVD8bFjfFXxfHchCeXQIMZ0HdvbKua5yH8I3KMqrcdMG69JVDcV8HUfF3FyXPuvelxCXCrS2E5N8fazU87wYPPffsj7RqsABPS9U3vgofw33gt2BS5yQMPwQnqtd42dHjgumbA4m/OodqFMEwoYWao0VEWshTJsYJ+i+bqrhZxZpHWJ7oWfUcxkqn0s5synOS3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39850400004)(366004)(346002)(396003)(451199015)(36756003)(31686004)(8936002)(86362001)(31696002)(5660300002)(54906003)(2906002)(38100700002)(2616005)(186003)(6916009)(66574015)(83380400001)(6506007)(53546011)(316002)(478600001)(6512007)(6486002)(66556008)(66476007)(66946007)(41300700001)(4326008)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2tkd25HeHBuYmhFelV3eXRsdUg4OW5kbVRvaFVudlpOVUNoMUpPUjdyQWM5?=
 =?utf-8?B?dHl3OGlMeHR3eHoyTTZwOUR4b3JvdDdEQzVjaVc2aklUZ25CaWNTZnYzckNR?=
 =?utf-8?B?bVpjSGhjdTdvOFVXSGhqakMyM1ZzejZxalUrRW9FS3JVTzFlTmQ0WklZUHRP?=
 =?utf-8?B?LzhtOE40cjRnS2ZJNG95bUh3NS9MU1JKY2x6aEQ4OFNkVDlrOXlVakRsTE5Y?=
 =?utf-8?B?VHdqemE5QUdacThMcVYrT2RIZmwveFRYdndNL25LOGVtYXZWK1c1R01oZGJP?=
 =?utf-8?B?anVrWmlXaHlld3RROWk3SjBKQUVGcENLdmE3SXpoZUk3TVRraVNudkw5UWY1?=
 =?utf-8?B?U2pRYnpRcjVmbVJKcHJrV1JucWFmOElHOFRCMEM3UXI4dTM0SmFDQzdWMENi?=
 =?utf-8?B?ZmdqbmFvOXVEUCtoa0lITTRpdWQxTUV4K25LQlYzeU16dzJZR0RxbTVhcWZa?=
 =?utf-8?B?cWJ0Zy81cTR0NS8wOUI0YStRdDU5aFlTWjFySkUxSlJwdTl2dWxLNEtzYUpB?=
 =?utf-8?B?S2FoVE1uRy9pT0daSVNMLzBzbW1KaDl6cDE4SXptdEtacmlWdWV5QmkrRTFl?=
 =?utf-8?B?TGI5OG16RmlrVnlNZTJ0aUpvb2ZNK0pBNXNuMFVHS2NaSllFdUxtb2VLTkpj?=
 =?utf-8?B?enhHWjZwdCtkUitUdVBnOFJOcWxNTVdXMVI3QnAxRzlrYXZkallLZ3ZQaGhF?=
 =?utf-8?B?WVZrN2U0aHhmczZaUHFydDFtQmM0aFVTL051YVQ2ZEczSUJhZjBUME9rMHRi?=
 =?utf-8?B?Y29DVDdNR2ljWDZOelJta3dmVzVwcGZLTjJlWkJlb0dNVFdaanU4RjJlczgr?=
 =?utf-8?B?MFR0QnlQenRpSEQ1d3RpdHJONGVBSjdBWTFQM3JXOGRIZ2dJbVFkcjNtQ3kv?=
 =?utf-8?B?b0hwRHFoVlhJV2sxVGtVbnJGdDBveVBialZQRDVxTklxcVpLbkZJUmRWTWRr?=
 =?utf-8?B?d00vV1hxUEY0b0pZdWE5NlFIYTBSS0lEeDNmd0lHZjZVM1QvNWE4V3JjZ3Fk?=
 =?utf-8?B?bVRLRURNdDBtTHVjY0lwNHhHTXlNM3h4dVRybWN2cHViMGkxelJPcndTc0Zi?=
 =?utf-8?B?SVllZ2F1UDF6U1A0YXFOQlFVTUdqTTNMd2t1RGNydkJLTlo4QkNscDNGajJF?=
 =?utf-8?B?bWFibHEvZS9rSy9Id3pzMS9oYTM2SjMwVnJQVmdWZHdYemdDSGV5Mk5GMHFp?=
 =?utf-8?B?VlE1aFNrS1RZSUJCdUFRMVdPam1vYjFSZDBqU2NLa09ZQlRtaEg1Umt3L1pP?=
 =?utf-8?B?UzNSSGdJQWVRZjRGbXY1LzV2NnYvcEdQVW5rMk9VenpnT0I1RHNuQ3Zmb0RZ?=
 =?utf-8?B?QWI4SEM3MVdJLzZvN3ZUQTRjVmI0Z01BZWFlaUdyRlVvcW9mQ3hvUEdDWS9R?=
 =?utf-8?B?MW41RjUwenhYRlRrZGlCcWhTMjlCVWVKQUVXMFVyYUFJeDBHaVZSVDE3d1RB?=
 =?utf-8?B?VkRzQXk4S0s0eHRUb0dlSE1XNWtMdDRWZXpZWU4zQ0lZTkVOazVZbnJQY0JX?=
 =?utf-8?B?NjFaeThocmprYUpoaXJsQ3h5QlNudXdONjZVQ0QwTDZUT2taYTBmTXBGbzFl?=
 =?utf-8?B?MVRjZjhKYlNURFFmRUFFMjlOZ0dzcldwV1d2RnB4VG45Tmp6dEs0V21STXRt?=
 =?utf-8?B?c2hVTXZEdGkvbzJkdlFNTHI3dFNQZlVYb2QreHUrZW1tZzJxTzI3NlgwODNN?=
 =?utf-8?B?TXN3cnVKVVp1S2h4Z1Zmb25YZVJnN0lKTExVM0NIZGVaQmFuWDlMRkdEb0Q4?=
 =?utf-8?B?dWxRYkl0bTh4VkJQWm83OG1paTB4V0FqSjB2R1dYT0pVejNDTHFpRkFWWlE2?=
 =?utf-8?B?bmV1WGs3K2wwclFoeU01azlHMWdTMDcrNVI5eUFpaGNOSW9PZysrMzZsYlhh?=
 =?utf-8?B?MHdJdkd5b1diZ3hDWTJndTZBdWJRcHBPSElLamM2WTlMV1JzaTFaL0RnelU3?=
 =?utf-8?B?Y1V2S2ovWC9uQnNJbXRrNkg4amNWeU9NMFRZZ1FiM0s2bnJPeE1qL0Vndjhi?=
 =?utf-8?B?UEt4R2E1SE5VcGZvSWtvc3BtdjVTRURhZ0Fob1RyL0k1dk4wQWo1dTVQUEVW?=
 =?utf-8?B?eXFBaFlzNURHNkNUYmNmOGRJUGhBdU9pY2hFWW1TcElRUnMyUVd2ci9ZeG11?=
 =?utf-8?Q?L9EgrwfuiFi1l4UMTr6JIAt+s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb62d52d-53e3-4d9d-eec9-08dab01d59e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:55:33.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKVEaW2/1M30dms9OAqByTPoarQLdDVOrhEuCtUkA245lg0J7nDOaX0kn8AYYHIkijcBde2bDVogLFGopzfsvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984

On 17.10.2022 03:20, Henry Wang wrote:
>> -----Original Message-----
>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> On Thu, Sep 29, 2022 at 03:33:12PM +0200, Marek Marczykowski-Górecki
>> wrote:
>>> Re-use rmrr= parameter handling code to handle common device reserved
>>> memory.
>>>
>>> Move MAX_USER_RMRR_PAGES limit enforcement to apply only to
>>> user-configured ranges, but not those from internal callers.
>>>
>>> Signed-off-by: Marek Marczykowski-Górecki
>> <marmarek@invisiblethingslab.com>
>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>
>> Henry, can this be included in 4.17? The AMD counterpart went in
>> earlier, but due to late review on Intel part, this one didn't.
> 
> Thanks for the information. I agree this is a valid reason, but to be
> safe I would like to hear opinions from the x86 maintainers (added
> in CC).
> 
> Andrew/Jan/Roger: May I have your feedback about this? Thanks!

Hmm, not sure what to say here. Yes, it would be nice for things to end
up consistent across vendors. And yes, the change here is largely
mechanical (afaics) and to code most of which shouldn't typically be in
use on systems anyway, and so should not pose an undue risk. But still
it is quite a bit of code churn ...

Jan

