Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C07728AB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578613.906199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1q4-0007zH-K4; Mon, 07 Aug 2023 15:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578613.906199; Mon, 07 Aug 2023 15:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1q4-0007xb-H9; Mon, 07 Aug 2023 15:08:08 +0000
Received: by outflank-mailman (input) for mailman id 578613;
 Mon, 07 Aug 2023 15:08:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1q4-0007xT-11
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:08:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36bf6932-3534-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:08:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 15:07:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:07:37 +0000
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
X-Inumbo-ID: 36bf6932-3534-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCj/hEMBUbZdEcIFLR2gFbHxlA91nkzH94BT2QMc2ILTyVlNG1czcOVTnEchlZYrR71nJ70teOEeMIzkpeKySjq3bCftyLAaByNTTvv61A/7QI8ZlYwD/Z1WyWyGFH4bQKQrMx1iHOsBLdayoeUG41YT1lzl9eslSrwOFK0vSIHT/pWEwWjByNc0pua0cdcyeXTRWZlDcUaf0zpEjv2mAVC06BNXYXez6U3wkwMmnYnQ7j1GlK188WzSSVyGwR6/z0+ocGs1B8gkxLwfsjwMZ84ggJAKrAIOBJYUCy3jMmd05Z12xl5MgE4bpRSmOQjhBJKBy0MQXZYgd1bf0Qj1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtkciH7vevl+qXWFJGYHXABbC61JyYKo54rYVn7YO4w=;
 b=b+evAhIjHv95jHdPo2s1erVk9TUGWvHHS0kuTiB2ndfBSpaCaFAlbbF0XKpF00y+sCyQPXzWv74HDYSfJ9kgJHUXCkbtd+KVk6HELpS8wwsARb/ad0g5jfY8NIT7v5mNeLy8dQdDsHqvE5iK/+nRpCjk83QJu807PuJGWNR5qX4XFO5cLPWjlmGGvWV73RcLTrbaFwebV5V/jASf0WlBa0zwNGQDPI4HEse3f/FNOGKzuf0pE2urgZ7QJbHszB7yTVgl86qIXuu52lOJudtsc5d3HxbX1C55e1+NuJAIj4QSvIoxw4QkUoRv+38gh54ZrxuKv1vNB6geuwScRahx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtkciH7vevl+qXWFJGYHXABbC61JyYKo54rYVn7YO4w=;
 b=LC/UkmU9Bx8Q7n/gofupiyKIr4udBOcWggaVYvt+0a17EhElHjNekYWJqMdGypx20Go9fX0pQVvU9ORXzb2Sa8Ut3PPHz81Jp64l52Z6QAdQ2BHfZbyQKBUndWrbWFND083rDvyFOLMhKvi1M6X5tBHB+hDgaBcUEnInFZBT04HWlLTA6pfE43eNslGeDFhjbw2UrTXD0pAmPC6dT4Kg0/aZhajjJpLA9AA2p7YzvmCi0xzV45nPjiFc7NkBcik25DM+hU87rUrWVp4BYTGeVLwg6QmGB6g96480Uf7NZsOEJvx5fB6fLNfjd+l58W4BKiREyn7MkIJLAq1CdXtFLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9441c47c-a573-767a-f3a1-649f09f6f43b@suse.com>
Date: Mon, 7 Aug 2023 17:07:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
 <a7c9f20e95bf514650637049e1947f8f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7c9f20e95bf514650637049e1947f8f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c5e3eb-74a0-4f31-25f7-08db975809a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I8guAqG0HB3o/NYrtWQrOP0rEBGx5dnHvRQwXFAETME8VS0hh5OrL+s5WVzeq9LcjCG0XovAj+UYxQmS2I4XUiHqPfJcnmgYhoXhIFzQRmEy8W9EVhnOxosuuHuHKrMpQkLAogxVCZhg3WlYHiX0XWltiC4SJY39LzgkuTXvpNBtJSK9DAKlLV+q3usfWp3L23tz3hgHstyclmuxi5Tih7fJdIf6ZaUJvD5Y8D/Wdw33CfVb4xr09uGtehk0B83z+ZMhO/R43ItHK9dSa+OWze/lkr+wrqDs3mwHqKVcteu84C06anLWADMWxyCN3eYfhpZwy6gZFgy63XlzV88Cs81LmjryvsohiTr/sOIxr2KMAwyGXgnuLTG7diCkbU/FKcButMBfrV8h29/q/1aVWGdzrMcEsG1NxMMhowiMHVD5BlIF0Sb+NKahStdTa/974xspIJhXeDfFh6IKvZK1R4EZQ2iM1+ZfXX0aWCViQohj3souKD8PGIFDFqcztEEjGDkDinyLctG6xVPwPd0j57UsLhf2i1hOgyf/kDDyQ0V/SBLY06SlrTSpUJtjIlVrQu4a++OzBPMiXnOTQHjTihIkIIZaLbW34H3noNRS5/XqYPr9EwKHNzRLA9zdPmh2ly7cOaeThy8/ZedzlORfQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(7416002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(478600001)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66476007)(66556008)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1poTW5pdktaY0ZqcmJqMHVaNFloVFQ5UVhyWkJMeWFRL1oyZW9rUWdNMUxC?=
 =?utf-8?B?SnRBWDB2anB6RmVKQ0dEYVlyMmFVRys2czZjVmNkbzkzeWJOdGxHL0JuVDEv?=
 =?utf-8?B?anFtRTlBaklUZU9oZEZYUjQ2cDN1UGhqK2pYOUs0WjBhQ003bCtSYVZjTHh1?=
 =?utf-8?B?L0dPSzUvaE5yYitMRGdlSjFuSHFpVEp0Sk1EYWJ5Q2wwVGFicjMvRVZWNmE2?=
 =?utf-8?B?NkpMR1pUQXJyckw1U2k3cGtyUUZMa0QyOW9SWFE3eEtqYXJ0cWovakgvSDJR?=
 =?utf-8?B?eDlERnNlMDFKbytleUplckU1MEtnZVI0a2x4d1ZRZzhXZkd4aGNOUHFYN3Ri?=
 =?utf-8?B?MUVDYnl2YitGL096OXJLMVN3SU5LdzhNRkNvV1QrQnNENU9kczMvZkNVZ2JW?=
 =?utf-8?B?MS9TTm1ucUp5aWRibWNsZXhFOXBjeU80R2NEWXhMSlpFZlU4RUo2NTFDQ0JB?=
 =?utf-8?B?UTd3ZHM2WjJid1BqTTVEVTVrM3ErZjBkN1h4aDN4bEtFclZidDdTbGpjN01I?=
 =?utf-8?B?VVdNRXhnalNFRFNURldXd0kxRDBjbCt0a05Sd0syREh5eWhxTktENkNYQ0tE?=
 =?utf-8?B?Uy9xWEpqTTBJb1FwV2p5YmRvR2FDa0dJa2tqNjM3eXN5VEUyeHppM2taUU9s?=
 =?utf-8?B?dXRaeWlYdlF2RFhPZHNQME9sbnBpRVcwZHBnMllSMk5qS1EzMC9jdjhDcEdz?=
 =?utf-8?B?QXp1eXdzZE1LaEN6RCt2elVZZWVsSnhLamVGcmdTQTNKaGJ6NU1VQ1hTR3d2?=
 =?utf-8?B?bnlMS3cxZ2tHWDRFL2kwSXFtd1BLWkhCQjMwRjltOWx3VithZ1VSbkI4c3BH?=
 =?utf-8?B?QmFkd2x3cE5RQ21SVVkyNGVBWWZpSXdCTUllYjhHRnI3b1FYWGRRTzIwcVRQ?=
 =?utf-8?B?UGRWeTBJeWptY3RFc2ZrUUNLdmd0YkxCbTgvd2k4OWRFbTVrS2VmVG1oeExC?=
 =?utf-8?B?RGxTQjA0L3RNdUkrVS9tMWV1cEhsMEVlZXlzRXlLeDdHSUt5T1lrTmpvVGtG?=
 =?utf-8?B?S09ka3M2ekpOV0lqVURTQWJYM0tOdE9QR0JOMVVFYmtJS0diVVdlajl6eC84?=
 =?utf-8?B?UDI3QmI4MnpNbEVyaDUzYUtON0dUQS9TQkZSKzNvbnhnV0VKRlovTVFEamVy?=
 =?utf-8?B?V01uOVc5N1JoSVR2eENmMHJCYmZVbXp2Q1c4YnVkakdIdkRXaStxa3JhUDhp?=
 =?utf-8?B?WnZORnNleWZ6c1hIUlJ6blgzUHAxbjNRcXRsaDVNOUFVbi9mVW1SZkNSei9O?=
 =?utf-8?B?dWJKWkx5SUJVYzVnR0Q2U0dtQVl6cnFDMitsMHdXMmxyOVFmWVR1OGhjeXIv?=
 =?utf-8?B?UFNhMk1WQ3BDMEhiaVM3NVoxK3dWNEd4emM1SVRSdnowVEgvRGVqVk8xVHZ3?=
 =?utf-8?B?M2NQUTZHYmpib2hpQ244SmFpTGJnQlB6U01XM3dZRHZBUGpWK0o5c1J0TitM?=
 =?utf-8?B?aXEwaENzbjV6SVVLRTJtQXBlVVhRdDdnbWthbUQzRVdxY20xR044Z0lGUERX?=
 =?utf-8?B?dXg3WFZvam54MUkvNUdlQml0a2pBT0Jka2M0K0RUcDc1M2lyb050Qk5FVjdo?=
 =?utf-8?B?eTRKTGxvNGMvU2pydVZVaFNUaWcyR3ducUxSVXlpYjlnb2xNbHRVcGNNekVY?=
 =?utf-8?B?VEs5WVFqWjB3bGp1VVBFR3BDRGhEOFlmWm1UOThUbUErUXZwV2R5OXJDam5z?=
 =?utf-8?B?VENqOHg2czBpdS9QK2UvbEpIRFcxOFlPR3N3SHU3QWJDTG9Qc1djTnNNMzU5?=
 =?utf-8?B?T0JPd1kyZWlNYmxQdW8vV2N4TUVtOXkrSG9TY2g4bUhCN0U3SjdLVXIxalBK?=
 =?utf-8?B?L3VKdlNlMm1sUncveEVrQ0JOTlFjdFpVNUVxQ0FHZi9kM1NnQ2ZuanZwVmJ1?=
 =?utf-8?B?WGZOQS9HOWkrQVRrYzBXVU5pY2NrOGg0ck5QM1AxbFE2Rk0zN3BjWXIzS1FD?=
 =?utf-8?B?UURzUiswcGVBYmFNVE9ubmhRUmZyWVN2WkszZU5PazJVbWhHa1pUbUdDc0NX?=
 =?utf-8?B?eUtCVE1NSm5IbWw2U3JvNXRvMGhXa0NOWWNGVElqTmFlbUErdXVYYU9vcFJi?=
 =?utf-8?B?R3F4ZDJzWjh2NFhzZWxkWEVhNHU3dUFLOHB4UC9YbVZ1SGhsekdSTEdYUGJK?=
 =?utf-8?Q?C/jt0yB4iFhTIHvVeWNpy3bOZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c5e3eb-74a0-4f31-25f7-08db975809a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:07:37.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6XzMGFca11Id+LqjuJg6erec421krqoA1A9cBsp82amzkOZ/ahjHla0OUakj6eZkPNbohH0RyLtIud4mSj2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355

On 07.08.2023 17:03, Nicola Vetrini wrote:
> On 07/08/2023 10:09, Jan Beulich wrote:
>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>> The variable declared in the header file 
>>> 'xen/arch/x86/include/asm/e820.h'
>>> is shadowed by many function parameters, so it is renamed to avoid 
>>> these
>>> violations.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This patch is similar to other renames done on previous patches, and 
>>> the
>>> preferred strategy there was to rename the global variable. This one
>>> has more occurrences that are spread in various files, but
>>> the general pattern is the same.
>>
>> Still I think it would be better done the other way around, and perhaps 
>> in
>> more than a single patch. It looks like "many == 3", i.e.
>> - e820_add_range(), which is only ever called with "e820" as its 
>> argument,
>>   and hence the parameter could be dropped,
>> - e820_change_range_type(), which is in the same situation, and
>> - reserve_e820_ram(), which wants its parameter renamed.
> 
> This one is defined as
> 
> return e820_change_range_type(e820, s, e, E820_RAM, E820_RESERVED);
> 
> so I'm not certain that the parameter can be dropped from that function, 

You're right, it can't. I didn't pay enough attention on the interaction
of both. So renaming it is here then as well.

Jan

> because the cascade effect
> would eliminate the need to have a 'boot_e820' in 'xen/arch/x86/setup.c' 
> afaict and since the comment says
> 
> /* A temporary copy of the e820 map that we can mess with during 
> bootstrap. */
> static struct e820map __initdata boot_e820;
> 
> I'm not sure it's a good idea to alter this call chain.
> 


