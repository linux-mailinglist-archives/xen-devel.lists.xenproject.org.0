Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841675964D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565838.884401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6xA-00023M-65; Wed, 19 Jul 2023 13:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565838.884401; Wed, 19 Jul 2023 13:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6xA-000200-1c; Wed, 19 Jul 2023 13:10:52 +0000
Received: by outflank-mailman (input) for mailman id 565838;
 Wed, 19 Jul 2023 13:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM6x8-0001zu-8Q
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:10:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad0a0ef5-2635-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 15:10:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9896.eurprd04.prod.outlook.com (2603:10a6:20b:67d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 13:10:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:10:43 +0000
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
X-Inumbo-ID: ad0a0ef5-2635-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGubNe+PTk3RpcgFVUHcBTTm3SNgPWiV4A17gYtD1yeyH72UJ80rUPBHiXNS9EhfAAf1IzTiSC7p2D+so5fzP8M94VSkMqqQZg2oNn4Cu3F+7Jw+QSNoBBeMce+WGw8b5r/5jMAfcCqCtFzBi0w+wZJowQgr4If+wktFwfh7WOEqPIwih1Hur67e3KjByepFtuRSh7oKzi/j/dncjJ9qnEJFBbzgF6qnfX9ZdWAW0LC2gaVKJUK7n77JKxEzrcJrALwxY4j004r4cOZdo3luJZi6MfdlzcCRa1KOhb5KRw0JOKRYIF1f4JnNfFbad4b2EoZtbotZoH2QexhiqYCfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nihrLMiEyoI4GBPA78WwCBZHID1xUUoZR9T/b1mXCU=;
 b=GloLooGOVfwsmA4F7cpWhsBga2Y9JlRqLBccB9S4wMNpko5gmVYJlucyHHPlukDQtgKcAMSGB/SD0Q4SkwmeBLdtxyGu6F6Q4bg5PkOHwE9lKeUe+cswIU3Qvb4f7jRE1PaxlQ9TDlZmzhOYFIfjGU4J3jbeQO8LxfH7jOWZMU1JJDAVpZ+s/CYKgxxfxJKzMkj0a4/13C/0/um1DwTg2TnZK49XABvWCMwgJMsDPe58AIx7xEPBcTpfrGOCZVSEzxgDGYqtu+BtkQyvnASeOZrlC5LxUqdwx0+myvQ22aE6OC6EYpHTPEz5ao8iRAyRHqxYz0BHm06mB4o+9dzm+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nihrLMiEyoI4GBPA78WwCBZHID1xUUoZR9T/b1mXCU=;
 b=F4HlBaRpq5Td3yQnsQEnuxnZ/9LS8foYrK3UG/T8vAvERD3fxkBrsNd2LIsQTZCY8PJDZryLfTFDm2QqNP3DPfYpx+GPF2j+kwBq0o6jzVHgaTCvajW3+uyEZdNDEfBYqOuX1yuPD89eUhFuw2P8A8tP5QYSLShwu8meqGclwrdNRVNznQWCYYK3tXXrIKVU2gw4Eyg8Mb/mOR+RX1YafgJuzdfznvfE5yxuMQJqDZBlVszMMsRA2A6cQaEfzEpHoi7J7mrR0F6pzk4LX48vFwBgur048RqTihS4KVeuy6h38lfX1Z+sQe4sHs3gXPxTq2QWXiMmcEaqc3L0gtG6lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06a03d44-da26-530e-27db-1bac369bb565@suse.com>
Date: Wed, 19 Jul 2023 15:10:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/mem: Make mem_hotadd_check() more legible
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
 <64b7ca84.170a0220.758d8.90e0@mx.google.com>
 <468474ed-60b4-9ff2-83c4-036e1252b99d@suse.com>
 <64b7dd19.170a0220.26387.994f@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b7dd19.170a0220.26387.994f@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a80d26-9229-402a-c4db-08db88598ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1B8cQEOFRgMlIbBR3ipSL5kKBG878nlll2oZ/BEXTqxuIbJTYSp2UD7K+joQCBJFD/E6yGLzD5j4N6EoYJ3cd0rUYiPDSePqtDHNm7RR/B8ATH4MEueLY6h08Pc/Kb568q7loz8//tsc1Y87eLn+LK04Ua4Uq2WEpGJaylTjKnpG3r6g2RLj2n9AWtDkk/cPuMSFAAD4qOhJBf06iPAp7j8UHN5qBZab5FgcSynesXub/VbUqTZDF3FsuU2Q2/qnQdAE9FsqRWLLVPoZ0hV7UlCsfyBvN46TRT93vtW2D6UY6QN1MiUF/K9f1e6xcj3llRdkRWuXpuqnqYgDXZ8VD2thZZRHtKVoV8mDGjwkyy+K3DZcMZN1g5SQyNJOWeBvEFNMyL0q7kDLUhVo2GhprY0Qp4ZOe1kB/wdikHk9LOhRjJOwLEB1/7wSYkzfYPsXISBgGE0TlSSXJSF0u3dpQGNfVzKwo2B4sRr0a+pV9OztEci3FoxV0YEiKRi3rkHt4uP+DwTE8kI9BRyclg0ccbISNjXo54b2uqmzxIYnrSyviWwR8HpSinD4oVukJBhGVkrhveszMpk33CVTJxAotwLwlFGF31YXiot3G6+xCq6axSbLh+Qkb0AoVd0JIOudOkH4rTiwPA94sPTnC5iEHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(478600001)(6486002)(54906003)(2616005)(83380400001)(31696002)(86362001)(36756003)(2906002)(186003)(26005)(53546011)(6506007)(6512007)(38100700002)(41300700001)(6916009)(66476007)(66556008)(8936002)(8676002)(4326008)(5660300002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHhPaG1VVlRmdk0yQURDNkY0Z0dZMTJna0ErcC8rVDB0amtKa3dUbTd3WmdL?=
 =?utf-8?B?ZnR1dW1tdlBIdzJRaU5Nb25CbW1GMDBvNkluS2ZlNVJLL3p4elAzNWY2ekZv?=
 =?utf-8?B?U3MrZjhDTEVwRXpGQUxEOTNuUFZoc2NqbWlPZ1cwNmd4UTJacG93VHBscGdU?=
 =?utf-8?B?eUJkS2lPejhoWUpsSmtLVjBLUHdTSnp6SmlEdmtHVnFWc293R2lGMlZVTkVD?=
 =?utf-8?B?N2YvMS9GWkc1dWRna0xpWFJFK0Y4Vm9maVZNdlRXTlJKVWs5RlpoVnV5VWxq?=
 =?utf-8?B?Zm5EMlVhL1JKZ3pNcEI1OUpXUnN0TTUyc0Ywa2ZTNStpcVBWZWhvNGt2c3RL?=
 =?utf-8?B?ZjNxdm0yV3R6U2tYUTAwaWV2QTNjQlhFSXM3a2RRNWEwWjNERi92S083TEUx?=
 =?utf-8?B?Sm10MnM4VkdwUUVUSHluQWNtbGZVSGx0QnVOb2NqOHVGdHNDdXdXWHFGTGxJ?=
 =?utf-8?B?bXk2UWV2Y2tKK055bi9zUU9sL25nZWhFZUlsTkRGMTZGK3dySzIvbFZ3anRw?=
 =?utf-8?B?aXZrRmo2VlVpZFFPbjFQZDE1R1BkQjB0bnlQU2NSakZCM24rUmdTR1RsZnVt?=
 =?utf-8?B?WnFpUGlVckNxS3ladGpmNkhmMjhSODllL3FybGI3YjV6QlVMbTh4bGVKaTlR?=
 =?utf-8?B?cHc0NGd5TEdWK08wT3MwZTBDY2FsdHdpYURuazd2ME1ONHpkeVpWUU9hUUxW?=
 =?utf-8?B?V0pkeVVFOXptUys4TEtGOGMrbkowQTJyaDg4Q3FvYnhSNlp4WnJZS1lBZGF3?=
 =?utf-8?B?QVdQQUc1SVlOMWlBQm50dWtmd3A0aWliZjVaNTRvZy81Y0R2bDBjeXhKYlN1?=
 =?utf-8?B?MFR2c1VYNyt1NVZVUi9paWViVFAzMExiNlpOWncvM0pzb2pNRkZNbWkyeDZM?=
 =?utf-8?B?QkhEL0t3MC9QOUZqQmdGWGNtdTUxdGcrNTg0azJMRVZqcDYyVWJyTkE0V1lM?=
 =?utf-8?B?SjIwOFlEdHdUR3MwK2U5WGdGYjJYV01lZWVYZUF5ekNSNDFFaE51RjJNM1Ev?=
 =?utf-8?B?ZUZKaWwrR3NhdmUzdGliKzdCU0E4cWgrSzR4MDYvK0xsOGhQUkVQOUZ0RTRs?=
 =?utf-8?B?ZDZwakppWHFIRXpiRmhza3B5dDBubStEREJRbkNsSlNaVkJ3Z1lpNm92MUFH?=
 =?utf-8?B?cEIwQTdXYUFUTitZL1lPZG9PUjZNV0xpWjE3cmJSakJ4KzYySGNNV3RTYUx3?=
 =?utf-8?B?bS80Tnh5aUs4Q2pJckZDWW94UFF3clBzRnA2Nnl5VXY0YmxoSjRNRjRxWXFF?=
 =?utf-8?B?ZExYZHJHd2k3ZGd1QkcrclNSelRwVUduMk1pSEcwUHZyME81MVZKRjZoU1F5?=
 =?utf-8?B?MkIxaHRSa3hYb0swSmJReU4rRFl4MSthZXVFejBHcjBmb3E5eFRLYk51VkpI?=
 =?utf-8?B?S2hiSkZvNUNBR3JRZFdBaDJJZkFTU2Z0T0tEWmZ4VUJ4WWtiWDFkcHpYT3VC?=
 =?utf-8?B?MDRiVjBCblRlcks0VjVCcTQ3V2IvaWdwWkhoYmNLR25zeGx5Y3pYQzZJU1pj?=
 =?utf-8?B?ZVd6TXdBMktZczFvUUxDaktJQ0xzcUJCNGVxYmZ4T3U4UUEvcmJGNkxEOFRl?=
 =?utf-8?B?dmsyVGpwZHdhMVdIZjRMaEhBK3JaQ05DbGVxd0NhSndObmZPd0thaDFpOUl5?=
 =?utf-8?B?V053WVJScHJKbnltTUc3OHlIUm4zWEFWSTZ0U3JKNStQc1dTeUhRK1I3MEUr?=
 =?utf-8?B?Wm1ZWjRRSTRSYjUyMVVMTXlEbXJ1MUh4Yzc1OGJSUno0YTZLRlZoWEhncEg5?=
 =?utf-8?B?aXlnSlB2Mlc1Q2xMVnI1U2llMXVGTXZ2ZnhNQnJMWUZIMEIrblJ5NVFxb2Ez?=
 =?utf-8?B?cTRwMUJ3TW8vNGgxSjBNWEUwT0o4ZURXRUdHaGVNMmdUazkvQ05WMm1CVTZj?=
 =?utf-8?B?QUlxTUNYZTF5M1hDTy9HaEQxSWpPYm5Mb3B6UmlocjdzRVE5U20yNHc2T0ZG?=
 =?utf-8?B?N3FsQTZINCtZSnk2RFJFaHJFT29VYk9obUpNYmZLcndqMHdHTVI0cGFhRnZr?=
 =?utf-8?B?TlZMQ0pQYlc1MVF4UWwrckhVQmdWWWlSWjZFampEN3pkOWp0UVUrWjRZMkVl?=
 =?utf-8?B?VzlNc2NUVHRjb1JOb2JCa0RBelNpaEtFVzBmcDdQb1FsandlZ1FTNUZoVUFK?=
 =?utf-8?Q?2UoImFQHH7w4SOsL25FVSsHEN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a80d26-9229-402a-c4db-08db88598ec3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:10:43.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf4XULC24Zqsu4VYwQJSxXjEETJcshS5Gy5MC3AK1QGjGnGRIyy0ds/ePXWlQ2Q+fzM9KW7eGKzC1/YGAaxwZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9896

On 19.07.2023 14:54, Alejandro Vallejo wrote:
> On Wed, Jul 19, 2023 at 02:09:55PM +0200, Jan Beulich wrote:
>>> [1] The hand-crafted alignment there is going to collide with the efforts
>>> to integrate automatic style checkers. It's also not conveying critical
>>> information, so I'd argue for its removal in the spirit of making future
>>> diffs less intrusive.
>>
>> ... I don't agree here. First of all I don't see why this should
>> make style checking harder. There's nothing written anywhere that
>> such alignment padding isn't allowed in our code, so any checker
>> we want to use would need to tolerate it. Plus while such padding
>> doesn't convey critical information, it still helps readability.
>>
> Considering the last Xen Summit sessions I think it's reasonable to assume
> we do want automatic style checking to become a reality. If we want an
> automatic style checker to be eventually introduced I think we should be
> mindful of style changes unlikely to be captured by _any_ policy we may end
> up having. In particular, alignment of arguments across different
> statements on different functions/macros is unsupported on (most?) major
> style checkers, and that's highly unlikely to ever change.
> 
> In particular, any style checker must follow strict rules in order for it
> to yield consistently deterministic results (otherwise it might suffer from
> termination issues). Expecting a style checker to automatically generate
> heuristics that happen to match our current code configuration is not a
> realistic goal, I reckon.

I wasn't thinking of heuristics. I also wasn't expecting a style checker
to actually request adjustments to insert padding where may (seem to be)
missing. What I would expect is that it also doesn't point out such
seemingly excessive padding, requesting it to be dropped. I'll admit that
this may lead to the checking being slightly less useful, because of
potentially not pointing out an issue where there is one, but that would
still seem better to me than involving heuristics.

Jan

> In this sense, having a guideline (i.e: not a rule) about trying to avoid
> hand-crafted alignment where the benefit of it is not critical would be
> good. In the spirit of making a complicated problem simpler rather than...
> well, complicated.
> 
> Alejandro


