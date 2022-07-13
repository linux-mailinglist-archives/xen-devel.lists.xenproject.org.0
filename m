Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531D5733B2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366428.597198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZD7-0001cu-VU; Wed, 13 Jul 2022 10:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366428.597198; Wed, 13 Jul 2022 10:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZD7-0001ap-Rx; Wed, 13 Jul 2022 10:03:13 +0000
Received: by outflank-mailman (input) for mailman id 366428;
 Wed, 13 Jul 2022 10:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBZD5-0001ad-W7
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:03:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff82bb2c-0292-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 12:03:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7460.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.27; Wed, 13 Jul
 2022 10:03:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 10:03:07 +0000
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
X-Inumbo-ID: ff82bb2c-0292-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsEN+TQfMI8/ljIhkGSrJvsHPNLEHR1Daq+TrDl/x4alfMQiS1SqkKoiOGp0A0iIurQR/xV47xy3jSJD0DCV8qpFwMCS2nTMCPb/9VvN7Kt95cbXAbOAPXSHS4m32kswirnqkYZbj+8TjhvJsUZu8hQ92C25TBccsUPguQoWBsiwNIbimq8OGP3jh6dE+BNRsbeJcJI7qGayngauAgyOGzD+dfBW4MZEUW5T3VtvHiJzvE6eyF47Ja81pxVFxXmz9MN5rYsFQbMGfVPrNVnujgsInHeVmlSVJCOoEt7LDAMwFklx75zgIcU91C+Afu2HgZKtL7MJAiYYeeJkEifxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fth4OO6y5ab5pQnHrZZLzi5dJ8kW/sbdlMjh3d2qqoc=;
 b=OjOjNmZJGMtMcOEAmrk6ZrNdMiihCfrXdLtpmlGWc5Z9RrT2Q640qnepHni7STWDGYg1ZKNXRpA+Sh197NvKUz77IHJ3veo9WHPDBi3tskH4D72RPbOtdaBbAOekv6QlGFthxbcs5ery8dGAoZU4Mbo/Fzali5k968VLmTdFpwNTNgG9yQoLlI5TcwZpjsjRP5IDK/MHuL0DPQNUFITbpY3WNPOqf02sbMKCkog0zTeNkQz5TdTlzdQ58plYo/T7CrHQlEjC5vvOCeIDwYVhh7p3afzlOJ8lwOvXYy7Yv9vAs6i9IBStlZowKC8lchAmF/4vPZT6uhZIrZCyNfY9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fth4OO6y5ab5pQnHrZZLzi5dJ8kW/sbdlMjh3d2qqoc=;
 b=WxwA59eGxGD8kKbx850ipHeL81fQFct/OpLoRwsKmZjxIKcH2sQ/G7gfgPXfjvuEvGt5GxMaMo4rmqffAWmuGqElyu84DKSyLHeDpUpg1UkLlm9Npx9fOQAAWD3g06vHcmPtkwfmzMmywX56bEQUe75VoyzAqBgYiW+OZPUD/JNMpbXylpsJSsFtZGcVqmXzKzyZJzQgbuq3Tx1OZ8kKCInCq0fbAmuuowxHcOPAwdb/EScSDs1MAcAhauRooptVy8r/pRkVz3y8x1EEibUBYtduJZS3sUKViYV1DxxRtxEYaoUvDMUhR3lDQWV77bI81N0nzjc7pP76fY49Msil3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <460857a8-c2ee-1656-d1c6-4b73e4dd936b@suse.com>
Date: Wed, 13 Jul 2022 12:03:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-2-wei.chen@arm.com>
 <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
 <PAXPR08MB74209F2975388E5A181C12B09E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <c979e069-bd2b-ae8e-8bff-79e5929f7227@suse.com>
 <PAXPR08MB7420A8B11EDD04FB9F92F0099E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420A8B11EDD04FB9F92F0099E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef65bef6-1505-482e-876b-08da64b6e27a
X-MS-TrafficTypeDiagnostic: AM8PR04MB7460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ODpv5eHpVp6qv/EIMm4u6XYCsPuiwVZUAnmdIz8LdhqV1fXAJOOlj0sL25F/sdoYJUJwxT8nyqBUCY54oylQ0pvm+Hrmj6kTGrUqXPLfaJkAUuDfnpZ/d6cKP1xi+jgOy7ZaKGM3tzo1T1SGHGto2n62y+L/3cxaZtXJ/F0bk14mKpuSiqehaboRyfHVQxg3WkTcuMd3WuwQhB43654Y7ySeXAwRgjPbOBejAxWavG9kQXXvUYFLJ5D4IHyLik8apK+TijXTf9Nu115sjwK6c0xgiNIMfdbopnOqj0r6ryMGSml/A/6ifhKLAxtjlNOAWjZiem230CkdjVWtjcUdzCzfcjrYepBimmpA3kJhB7IjgZqoV7XfCcjKGxUeraPL7OnIfBY3XL2aAF3AUYChMISZlSMGMjZgMcThjoBO35RaB25LfB4qsKSEB8yiWgVJ0xPwg5Pa9UxXxWttq6XUjgAmTUUIzE15YF6Zu+dJ71okSwEI8w9q6wPcqNntXeuKrHBE8S6GbI4WkKUOek+KqZZYz9mQYiYDdU2jtMy+cKoq3jPbZICv7zfP8q27LKM9MqJxdPjVZyoolObSKHQtU1PC/s0IM6g0mcNybhDN0GQT53v6w5Yg270V9DSSTypQmFMXof0q5NWdkq8C1VZs7lLnMBL6yfICTmfwHlpqFI9oqz1RSHYokm7SmUB3qzUoX/zYRnvIcX95R3A4bD8Ghq0YhWm51f5nz25QNpluQhb8DANgkbGsZ0Me0DiinaSgkwLT3e+j3YPcJfWHeJiy0LDQnFFw3q/hsr+mP7xQeCbFUR/9Av63Jz9wWxXb1zqMw9Heti4Eum6hLNUiJlUahSJh4HYSiTFJpSYhiIOu+pU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(376002)(136003)(6486002)(2616005)(186003)(31686004)(53546011)(41300700001)(26005)(6506007)(4326008)(478600001)(6512007)(66946007)(66476007)(8676002)(66556008)(83380400001)(38100700002)(54906003)(316002)(31696002)(86362001)(2906002)(36756003)(5660300002)(6862004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aSsvSkoxQ2VWZ2piTWFYR3RMMEpkWEFIWFpXMDZvdGh2Zkx4ZllGaFRpVG9P?=
 =?utf-8?B?a1BRSXZyRkJRRHVubmFNdEgzblprOXRVOURicXRaTnErS01vMFRuaXMxNFZO?=
 =?utf-8?B?YktyMlF4SHA4L2JjWW9JMGEzVXVLMkpvU3hvMlU0V0xBS2l5eHhtZ2EwVTZa?=
 =?utf-8?B?ak5Ub290S05uS1lGWWs4V050S3RLak1tZk1EWHBCZjkwS2VEWXh3Tkd2eXE5?=
 =?utf-8?B?T1Y2dmIzQktjNURpbkJKdm56N1dvRUJTRlVQRDkvc3BnVENYdWxTUVJBaWYr?=
 =?utf-8?B?TzR6czg0R3hJMDQxajlUL29pYWt1QlBVQmNSR3Q0ME8xNG9MQ2hQWkN1bVRi?=
 =?utf-8?B?RjhOSmo3ZVdFZkVBeUJTNW9VODk0aFlPZnlTdGhnYWpNTkNtdUNmZ3p6S1ZO?=
 =?utf-8?B?Sy9yeS9wV0xleFpZVnMxNnhJSmpPVFlKbUtBcUZydjhMbHpZM1VFRlhuVVZy?=
 =?utf-8?B?SVg3bUx3cW50UjJ5VGUyOStZaFovbVJxL2pSa0pBa1d5SldUUncxVThJdkRP?=
 =?utf-8?B?Vmp4K3psYjBxamM2QmdzZDNKRUtyYWtHdjdvcVBBUlhaZkNyb0NHZGJiSGx0?=
 =?utf-8?B?U0FNbEVjeG90K1VwaVplZkJSYWs3emVSYllGV0gyS05heHU4WjVUV21Ma1dD?=
 =?utf-8?B?amY2bVMrdi9TYnZWNXFYR3FMRFJaK3YyMUVPYS9yeEpnbU40c0N2c25FWFEx?=
 =?utf-8?B?SUQwU1l2TmtWank5N0s0djljZ3k4anRSQzlNdk1DYXpkTUU2VlVzMkQwc3Np?=
 =?utf-8?B?NDlpeXk0dmQ4OHczNXUzc0h2TTh4dHhnWVdSdmhHTlRuWkJSYXVVQkIva2c0?=
 =?utf-8?B?UnZOcXY4MW95am15dGR6cDl1VjRhMDBZclZaOXV0N3F6M2ZvS1N3M0hqaDBs?=
 =?utf-8?B?aVJENGVFcmpSRTFJU0NZSStDZHlVNjdNRHUyL1VKUDVwZldTWnZtbEQrVzZr?=
 =?utf-8?B?aXJYS2w5OGNiSDRPcUUzbjQ0TGlxa1hkbkp3QS9nZkhhT0p1N1pYeUNoY254?=
 =?utf-8?B?Ny9BTlp3bldxdmRQVG9FVktnNThyQllWRmpidUgyL25UT3BoL3h0YVYzYURo?=
 =?utf-8?B?T1dCZDVnTklza3dKK3NMVThnMkNEM3VYNTNaWVlJY00xeXkwZnBBRXpHSlpO?=
 =?utf-8?B?OHRsRnpCZ3dZaGhKM0MzcDEybTllNHUrVDh4UUNLRTRodWljSDVjcWZBNWsr?=
 =?utf-8?B?VW9JbFdmUjViSnd6SFIyWU4zelJQVFJvK1JUS3dDbTN2a2xTMmlGa21WZ3Bk?=
 =?utf-8?B?cEU3RzIxTUg4NHRUTVFHKzdGS0xWUTZXV0JIRjdJY2dSUTRZWisraHVnbGhu?=
 =?utf-8?B?UStkNXhNek1wb2pqZTBYeE9jL1ZQV09weTRkZC9HS2FseGJ5NVZIQjI1VGxN?=
 =?utf-8?B?KzVFdHJqREhHQkpiRHVxNTlzd1YzRS9MN1FZQkN6My9hWk5DaVp1cmxJcHVD?=
 =?utf-8?B?MWs1UzA5Y1VrYndjc2JnbTM0SlQ4NGpPVWUvckI4QjEyODNaYnVldHl3eTVQ?=
 =?utf-8?B?eGVrSDdpcWJVWGd6N0hRWGZ1SXF5MWc3cmpLRktmczdRTTllQVN4cmV3cytz?=
 =?utf-8?B?bmlSNlRZbnZUdjNLRmwwUFVKaXYrcFVjMmNxb2l0cC8wN2liVU5VRG5QaHdo?=
 =?utf-8?B?WVl6dHQ5MzVlQWdLd3A5NHFscytVcVk2eWFDTEcweUxUNkhRSUhGMnV5Mm9Q?=
 =?utf-8?B?clhRNzNBamkwNU52Q0xvWFdCbVpFSUJPL2lLcUdhcHZudXJDSzd2UllNQ2RR?=
 =?utf-8?B?ZWUybWlqdHhoOE1PWHlHc0NNZnFQallYQTZtdldYNHlpcVBQcHVFZS96VnlM?=
 =?utf-8?B?UkMyNFBFVmFtbm1Pc2R1dzlDV1IwQjB4TG9UbHM5YzRVdWFnd0lya1VLbm5C?=
 =?utf-8?B?a0FUQkpLZ3VydVN0KzdHZkdYbnUwMklnWjNGc01QRk12SmIwMWRJNFoyK09D?=
 =?utf-8?B?eDV5RG1ad0R5S00xVDJ4ZXBHTVpNcVE3STJGcC81RjRNaTQxSTJWWUFzb2FC?=
 =?utf-8?B?Nk5COTBWY1lxajhldU01bVVEY0M3WkQ5RUx5VTUrNUR4RW00cXo4bGNOaTA2?=
 =?utf-8?B?OE5VZ2VIcnQ1SWdseFdEdXJBVVEzcVpPekdjQXBIYW1PdVlDMnJTOXVyR0Yx?=
 =?utf-8?Q?FaJdZu53VoO/xSPLd1fKiaWq2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef65bef6-1505-482e-876b-08da64b6e27a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:03:07.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Aa7u9kMX5Y8rjPU0SjdU5h68gcR9YBCIEsnAySgKEUxMkvntLnk/kJEBU9EiZ0rYWfjWCROtVVC9d6VTAU2LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7460

On 13.07.2022 11:55, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月13日 16:46
>>
>> On 13.07.2022 10:22, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022年7月12日 19:54
>>>>
>>>> Mechanically the change is fine. Albeit maybe "top" instead
>>>> of "boundary", and maybe also pass "node" even if x86 doesn't need it?
>>>>
>>>
>>> Sorry, I am not very clear about these comments:
>>> It makes sense to use mem_hotplug_update_top instead
>>> of mem_hotplug_update_boundary. But how can I understand pass "node"?
>>> did you mean mem_hotplug_update_top(node, end)? But mem_hotplug is
>>> a global top for memory hotplug ranges. I don't think pass "node"
>>> to this function can be useful.
>>
>> Please separate "current implementation" from "abstract model". In the
>> latter it would seem quite reasonable to me to have per-node upper
>> bounds (or even per-node ranges). Therefore adding node (and, on top
>> of what I did suggest before, region start) to the parameters of the
>> new per-arch hook would seem a good move to me, even if at present
>> only / at most the "end" parameter would actually be used.
>>
> 
> As we will export mem_hotplug to common, I think these changes are
> not needed any more?

Indeed. I merely wanted to address your question nevertheless, or in case
there was still a reason to avoid making the global variable common.

Jan

