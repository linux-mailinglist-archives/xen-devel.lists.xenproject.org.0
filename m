Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3857CE066
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618658.962586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7tg-00030f-Hi; Wed, 18 Oct 2023 14:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618658.962586; Wed, 18 Oct 2023 14:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7tg-0002xN-Do; Wed, 18 Oct 2023 14:51:44 +0000
Received: by outflank-mailman (input) for mailman id 618658;
 Wed, 18 Oct 2023 14:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt7tf-0002xH-CK
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:51:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d93eb547-6dc5-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:51:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9939.eurprd04.prod.outlook.com (2603:10a6:10:4c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 14:51:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 14:51:39 +0000
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
X-Inumbo-ID: d93eb547-6dc5-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBd1fc0FssCwX7PcbPJZv2P4/pjniy0W2CSlxRVMnzBcm0rlRlrvu/j0pKFf3gc9lAQ/ZAZrkEhUjewHhFC1PYo7erNB0Ewh6IDwvMcfnoaPavMOjPFDPcS5YXSLcUuSVuZFIQZbS1U6Mat60QqnYpMVEaCm8ghIKxE+CFpBTpF8XI0jfzQmYgepXiWvcXti9sVKVeS00ITGXAd2HtqeaD8GqBkv83Q/fnAo4a++875FTnm46CT3N6nKjFtPnX4RN5HtxAV9xuy/NQK5TY18dsAH0RGcsbfZx5mdhWpLw7IhfTip/lbExK72SJCgzMK5QufG6WoTJ+3lQ9CNJkA/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZWQHmUuKVGWsmJQ55ZCidsb/fl8ZxeoBBYHr72tnOg=;
 b=igVStCFxppyP7g1qVAja2crcb05duqItKNrS3wMrVdznqApEUkfCHB1aMJO4qYHMg5fUgaczTnkQNhlPUDMXvt0s2HfyDqAIm4tLrIp/ZmVeQI0H0AIsnhmiWT9gbUjulm5W8s1Mk9YbGXC1nUynZEGmckeDRLrcxD0t+SGhH+KK7h/Ro7SUK4BEM0qReikQA+xMa4QxsqsZn/lgUQlnSe0ZtpO7VuRzUA2MNiTqFR0hmpn/tG4gNAllUhIGgEeYdRhSCTZX0+jvfoVDn8+9VR2/cYC1Y9UoU1D2W7uWNArsHeqmi7iC3zAcNEYbDKFQILX/uoQdlzOp0t2cf42gcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZWQHmUuKVGWsmJQ55ZCidsb/fl8ZxeoBBYHr72tnOg=;
 b=MW+H8n3zJkiHnayjwJI14xxes7+xC69sgBgJwdMUSrQao7CBtmDI6nFapSqwydFFWFa5nxiBXtt3tHis9MNg2C3e0lO2wTpufNUPTplxhFxMV1ojeqaAsNcrGFntMM5WAIGCDk1shjUnoZN7E9QPcPA6dq0RJYGcsMtoefxP/VhyCgz/5e1yRKqa7QLHT8hSBAQufSnhW15NtS/SidmIW7zuCYK7B5XyVJIPm3065+O04kGAb5HF5K/OPU6uF+ynLiIrZxoAzH5V1jcrv5iuGa7tj0170DnAtVuGsXukYtUcTYpdO5+wUl0gVK5FAmbSML53Ztt2GqNH51DZf6vcbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04edf9f2-2175-375a-e8a3-05989ab155ad@suse.com>
Date: Wed, 18 Oct 2023 16:51:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <9f5c0af3-44b6-e98a-2032-14185af265c9@suse.com>
 <ea9a1990-ecf4-43fb-af5b-b3aac0c71b2b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea9a1990-ecf4-43fb-af5b-b3aac0c71b2b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0401.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9939:EE_
X-MS-Office365-Filtering-Correlation-Id: e5322e4f-fd3c-44cf-66b8-08dbcfe9bbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1eGg653sniIhm/QQzoVmUmlbdYvd/887Bacnd1Fo6JsvrCRmzrwghco+avlxPaYtED82tNO7bI+xbMK5wgkaeol2DMdzCx0A4Iod68679IWxFp7uZGEtzhQqJaBg8X5HJt27XFn0wfNtpiYS0l8zoFEKL+xZzRbiCsO5ZDn2c6sYTSSE+yjVLe1FLz/eJR1Sgg6i7cfWw7KgCOxIKn5HaM+m4ryg9Mjd5opmVTPES/sQPs9dfZ3fgUnSPqQZU2UuV6yDsgs5E/oun5DZ77GSZwPeg9kSAl5yJkFSf0WqZlW1SSiHEdTGSS1620H8J/lNh6vfYGJ9PEbQSpqQhFZqcEzIykbYJFGi1tEaiZoIoCoSw5TJ5sqRMi8OoEwbs+/jJSt3hD3wFvgmSxMmKSTZUO62K08IRZjVkRllt6fHgBgHNBGFTdyZsvIALEXGGP7D2omwcFPgrfqRIVNXuukxD2ZRiRmcblDkxJn/Qk6wrz2QyzWRsXSbE7OBt6taiV8g3JK09oU3VvdLNSc2PK/bpJsDDbNr0Y+cnIEhHNUOxGMSAvFHf3uRmCPu1EeJ+FYCbXOATuKbOljbgb2+wHn+KbAdnALFdR/cSZxnNYNbaEnyU1uHjKZtMpMJ8jC/uxCulTwDrtZw25HYpUHTr6/iwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(2616005)(8936002)(8676002)(4326008)(5660300002)(38100700002)(31686004)(478600001)(2906002)(6486002)(41300700001)(86362001)(31696002)(6512007)(316002)(6666004)(6506007)(66946007)(53546011)(66476007)(54906003)(36756003)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkdsV0YvYmhvYlpONVZuWkV3cjZDSGZLNGdnL2xuOHY1Nm5jM3dpQ0t6enVF?=
 =?utf-8?B?bVFqYThYenU4aDYzdFJWSGc5alJpSGRoNmZYaHM4Z2FIcFFFSllLQ3daeFBu?=
 =?utf-8?B?K1hCa0t3YXIxc215YkFKOG1IMjJSVW1adjN2VEFyQmJaNXFJUG9hK1p5VUVa?=
 =?utf-8?B?SGpVQmJ0V0JMWnVoYngrQTRWMk5aQUlsK051Sld3bnZCUU15UDNvVzd4ZDNx?=
 =?utf-8?B?cDBOMU1oR2UzOXp2VUVqV2tRTm9FRk9mT0J1S2VQWmFhQUJDSkhEdnJlcWhr?=
 =?utf-8?B?VTNmREdFTy9zTlkvMXR5WUNkOEVvRllLdjErbzVuRlNIV3M2UlhZVFA2Y1ZG?=
 =?utf-8?B?cUN0R2dtUWlZdEVOTU8rMVlobkNZMkUxeHc5UUIwSVA2SXdOM05ubDk5eHpv?=
 =?utf-8?B?VWdjVFVzMzBSRnBZMEhvSnZkNGV3ZWMwbm0xaytqc1pqdmNlZE52T1ZNRFBD?=
 =?utf-8?B?b2puNktBRkZleDJsQ0VxNGJub0twejZzZEw1RjFiV1hmTDdUQ05QUTNvOFcy?=
 =?utf-8?B?d1VuVTJNWWxJZFZMZmE0Z3NzZkRvM2dTZnI0emRHM0NpT3pRM3lKNjVDMEFY?=
 =?utf-8?B?Z1hydktFcWNtLzlaSW9wNVpWUEFkUW8ydU4rQlpUdWpzUnE5d0xLREJYLzc2?=
 =?utf-8?B?aERnTXlWbnhpcTZqZFdNaWtsVHdHSExEUWFGN0JzeGdzUkNQTmJPTCtvbzBC?=
 =?utf-8?B?Sk1PM0dSR2EvQWJDMVZiZG5XVDBuQUx6TjI5VHo4cWtkUEFha0ExbVBpTzVL?=
 =?utf-8?B?cjZpU3ZCUkNtQ2VtNVpiOXlFaFF3MzVQUW9FbzdRSVNWZVlLNTF6Zlp4M0pG?=
 =?utf-8?B?V3FRYW9vRjZYSmp2S1Z2a3NSakxpR1lkZzFZVTlUN1F1UWYycHRHVEVqUGFL?=
 =?utf-8?B?VG1GemJEbnY5ZFdYeW1Zc3VjY0txYjJubTQxcWM1cytEZzdrMEVMNVRwQ0ht?=
 =?utf-8?B?cUx1Q0lSdEoxMWFYcVJMVzdEYTdDWkYzNjBTdUR3TlBFZW1jbWxYMVNYbFVT?=
 =?utf-8?B?Tno5WGZuSThHQU9ORVZlZVVNSHlJOEh0K3o2aG12RXUwWklPWURNMkNiZ084?=
 =?utf-8?B?R1JwbHRyUFFITGJFS0Y1bWZJelNuTmhQODd1aFNTdyt4Q0xBcUF4ZUltSXA4?=
 =?utf-8?B?MlBIaUYrYVZLNDBBNktmanFVenYvbS9JMk94dkRHcCtwQUNXT3RlQ1N6Umhm?=
 =?utf-8?B?MnNUVmtGM21wd2RYMnkvTnU4NHkwR1IrMFVHL1lTQ0NPblUyRFlOeCt5YkdK?=
 =?utf-8?B?VlFjTGFtcWRRc1dIMHhidVhCdlI4QnB2ZHV5cVAzUUFQdEF4VGh3cXNHVkJ5?=
 =?utf-8?B?eTBRY3hGVkhiVERIWHVJTTFpUnAxNDlTSUdZUmN0cm5raENNMitqWFd4THlS?=
 =?utf-8?B?MFV2SE1HcTJLRjJIdWpDSkVHcTU1bkhPK1RpR2ttVmhWZk00eUswQ3ptQnVm?=
 =?utf-8?B?OWIvRTlPSDNaK2NWMTlMTDNXUGF3Wk14VGpUQy9YL0NZUXlwQUUrTUNIUmVl?=
 =?utf-8?B?Tkd1Y01PSFU0bzlERitBTEpZV2JHV1A2WENPQkRPL0ZpeGgrUFVwRzNHZ3N6?=
 =?utf-8?B?WGMrMitySUw0aWpTbW50SzJSczV3d0YrQndid1ZhbWNjaHZvOWpXaElaT2Rx?=
 =?utf-8?B?OUxhRXFSZEZRbloxY1JzRERUaHVic1ovRUtQZkRoaThDQWFXdzJYcTY5c0Y2?=
 =?utf-8?B?YzVrWVRreHNFdGtBNWM4UkhmNG45SVZtOVQwaG9iWlZVWmVKY0Q5NnFVcVlX?=
 =?utf-8?B?V1BxTWpyUGxaWmVUMUxYMUhCK2t2VHVsTzFxZExhaCtFNUd5WXdDbjRsdktQ?=
 =?utf-8?B?MmI5QUZUSjNhYkx2bnhJT21LQnZNamcxM1JEZjNVN256NmU0UE02WS9EMXN1?=
 =?utf-8?B?ZmxlblVGU0pwejlJWFNKcEl5VmVLMkVpRVlVYnJyeVM4ak40azduTDZQM0lC?=
 =?utf-8?B?OUhQZGxOZk1QZHhqcUE5d3JHUE1xemVuakxHc3dqcHV0NkVlS0ZDM2xNYmR2?=
 =?utf-8?B?dkdGdGo5L0ZlK2VyZUJ5c0NFQlNhclJ4aFpRYzF6TWV5UlcrZXhML3ZBaExE?=
 =?utf-8?B?WXpKQkJYdnA4MFhsajVjR1lSN2VsbTlwRmdTc1EvZ0ttcWlVcjY0a3c2d3ll?=
 =?utf-8?Q?qTRpW8rH44s4JoR7+aZ82OajP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5322e4f-fd3c-44cf-66b8-08dbcfe9bbc6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 14:51:38.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45FJ4thkgsYJzToPVGg3PP33Kb1g6XC/CeOspksrVGmtafDuMEJGpRmszHFvZG4yY0XarFsHe4n9h7Wm8/HiFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9939

On 18.10.2023 16:18, Michal Orzel wrote:
> On 18/10/2023 15:29, Jan Beulich wrote:
>> On 18.10.2023 12:38, Manuel Bouyer wrote:
>>> Hello,
>>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
>>> hardwired to 0), so console_input_domain() will never select that domain
>>> as input.
>>>
>>> The attached patch fixes it by translating 0 to the real domain id for
>>> pvshim, but there may be a better way to do this.
>>
>> My primary observation with the patch is that it presumably won't build for
>> other than x86. There are also indentation and other style issues, no S-o-b,
>> and no description. But I wonder whether a different approach doesn't want
>> taking: Wouldn't it help if max_init_domid was 1 in the shim case, with no
>> need for any other changes?
>>
>> Also Cc-ing Michal as the author of the (possibly) offending patch.
> What if we set max_init_domid in pvshim case to the value returned by get_initial_domain_id()
> in create_dom0()? The drawback is that we would waste some time in a loop if the value is large.

I'd like to avoid specifically that.

Jan


