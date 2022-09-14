Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650255B82ED
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406854.649246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNo6-0001kN-KT; Wed, 14 Sep 2022 08:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406854.649246; Wed, 14 Sep 2022 08:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNo6-0001h5-HE; Wed, 14 Sep 2022 08:31:42 +0000
Received: by outflank-mailman (input) for mailman id 406854;
 Wed, 14 Sep 2022 08:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYNo5-0001gz-GB
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 08:31:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7dbfea5-3407-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 10:31:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8717.eurprd04.prod.outlook.com (2603:10a6:102:21c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 08:31:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 08:31:35 +0000
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
X-Inumbo-ID: a7dbfea5-3407-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcK+4DMrllOROweGiYI75Wg3WTaiM2FJ7c46s1norPjaaOByO4KtXOEV2hkwtAi23aDNJoiDutSh4DVkT9HywmqggVD4i1qSCU3Xa+tGLvVQTg9z5kZPMmHN4Py2jEsGX8Mdd30o5uDD7CzGygZXs4BOlwntaSXV1W2lHIu8tpcErm7WdZbawO0lHgxhmzKb/qnVBpg1IGCNafQC+OCT0+eB6Df5Wg6CHLc/UY5bySVKSbRAaAIW6EWlO6Vlrx8QtNKl/ZHeln7khrCysYnl9Kp2BvXdFA7l1cRQrusUKtOCIWzpFt5rQ/Y0BrW5UFhxU5OmYwh8a912cusg7NEwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JybTfpscvAvH3KtABBW8YPzzHqukwqh1lv3Qv1WzSHs=;
 b=KNNImCL7fiBA9UJ47C3Sbw76ry1ErZza9jUCRghjaHZ5GT0UYeZ4n/QoxfDneTqwH8Sa3pdV4No1yFS5aFi/6yDOllRd0b/fUgqhkC+/ORnbToVibgQ+Twwwd3oFmeqDtMb0uzEpy/bwq5r4XwG6olnwvzQQF5r25iIZBpBZLchDb0HdK3FAoIOfrFtYNolCyss5SfzRbbXgKVK81Jx+NoFOsIT4j+IjP7+69QRIpMQc2dBNu8W/Gl0SL1cc0w0rsk5WJ62caUnW5UYDmJrtO4SaD+n6ChQsqCa8QcdkipRLpprPQBSrX3iKDyjsj0/fiaAdSLrxCQzO4BWlDD8xeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JybTfpscvAvH3KtABBW8YPzzHqukwqh1lv3Qv1WzSHs=;
 b=HqXSnOxG1OX8F+Q/X5rjkFIXFiFR54mP3XhwJO2mQmET0H2qiFWvfiDMn6j0a9bPTtqgMTsgi7P+ll4hXUD55IzpCnFLg8f25DED12kfFjZCwmwTP5ilmS2ydPv26GYV5bG7eScRbJNFlWc0Tvp4IZmOweu1nJ5g8rl41H8CEpBOM+a3skktZqCEgUaw0Oiz2ZyvQGtsUUOJhsaQ1o3sfSVncWF+WvSfvNcD9ALWRdLbN87wECSzOVRdpt9AYtNN8eRme92+PKKEFUqlGugLYcMK7mrGQ+keeKiPQvAGXchUH4fPez1/h4eTWhZAjgQAUU5Hkmv2LPeiZuGAia+PwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
Date: Wed, 14 Sep 2022 10:31:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
In-Reply-To: <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 92858496-ccf7-4afd-3178-08da962b892b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nGNwV6ScFQzjc5IflyeowaZrg9XJejdbF+WLUlngh/0t+UwotAKb/beqD2EGZynur90Yrm+4bRZddnnZhkIfkQbkVuybz7qUWu1qrLIjzXm4RKJl2KqgmV1WP/WoB3y1cZ2l+i6TnEv9EhXUrKokx9ocIWR0esxfgOQAQ8AeUMNk6eAHt2ESE9eNDlBaixx5W5OPYriD//dHPoYEbl0sQv4LSXp3XgWssTu/0xV/wn0ZS6CkkFHOKSKkVK619uuiz3Gput/KpM1/PbJlHeFbVncG2iTt1PgWAt/0wV+98S92cx8pgSPEttqIwctmGlvZzRpCjfcMovvlafklFZXLf2T0ER/lyhOOLgSZDOAcBTnVQw24yaw55NTInuZPtQxvSnNEdCTrZ9zTUdOdT9o5v5AxECOcba2nT9sqO/n9R54VcyEzsPWHE9bHF7Wx8DMygwkxWQYCIsZsv4Pw1SY0ZAqwEWnzDfGejvjYRrTkSGTAjOQgYMLXuhwj/1dfE5Icx+XkPpxa61Lo0BhQ2jsNYPhJTJh8JDUezXvCqZIdPdQfFLWeeIxdJpcUw6hxEHBclCwTEd1EMH/csD1ZJQa7j1v+XW/2tTKCjqhF8XKr4hPrThOoamtb188LCIVH1uO0AwN99j5TlTyHX2lVygqyHSVUx5UkEQ+SRyE8KHljsOMJ46Z+lGlwD9Gd6ALLymf80+atotnkkzQQikUjqTGGSL4GVen18ULQjjiMmpxeksaCSvCQK2y4KpnMNg7Gr6h7+LlBF5mL+bWe9l+9c7mNekDGS5PuOW0TdMQpJp4GOCk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199015)(41300700001)(86362001)(478600001)(6506007)(8936002)(31686004)(66556008)(316002)(31696002)(4326008)(66476007)(6916009)(8676002)(2906002)(54906003)(2616005)(5660300002)(38100700002)(36756003)(66946007)(6486002)(186003)(53546011)(26005)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2YxNVprOGZxcWRCTG5ZTU9QMzBkcytjUXNlUEFRQUlDSW56TlUwcVAzZ1U4?=
 =?utf-8?B?WUc4UVVBMGhPU0Nueks4ZnJnNjkyeEJaS3lWQ1lpWGN3KzRMUHovZmZoSnF6?=
 =?utf-8?B?Ukd4VlJyS01RWS9ua29xbzlBYWgveHR0SXBKV1hFWkxzOUVPR1A0dHhXT1Ev?=
 =?utf-8?B?UXZzd25xandRQWJyb1FZTUFJK3FVMlZGRWFGTkdTYnFJamxLZEJqMmQ0bDVL?=
 =?utf-8?B?WEFuTEsrNjJ0aVVrQWxRbXFkOWNRaHo5R1JkL3BIenZHbU5sSjkxejJwaEN2?=
 =?utf-8?B?cEVKdHFBb0ZOQUNzMVkzVlJkdWhGZU1ldDVOa2haVkhIaUxHZXo4a1RHV3Rs?=
 =?utf-8?B?dkxqTkgzRmZlL2FDOExkaUJQRVp6TVk0OVRySS9WcWd0NFVRMStkYUZLZVRF?=
 =?utf-8?B?SjdGQ3MrZnFWM3R6TXZadjhpOWt2NGFNR2w0bUMyTStRWWZmbiszR25KU2p1?=
 =?utf-8?B?V2h3ZzA4TWF2NTN0bW8xallkbllNci9nbGxjaUloQ3JHekV5V1lvaFRqYUZU?=
 =?utf-8?B?SmtGOWVUNytlSDBDUlhyYWpWQmhNbmRuMytKT3BaOTljUElqUWEyUThXd093?=
 =?utf-8?B?eElKWE8rTHVzSDBZc2tTVnRBMkNPWWxGdUdESlN3SmQwSUZHODYrYThVeVR3?=
 =?utf-8?B?ZWRDeG1OQi9oQm5LNlFOKzJrb2JDTVh2N1JjU2lRYVVWUzhxcGs3VTQ3U3Fn?=
 =?utf-8?B?dGw1enBIYmlZYUVodm1Fd1padkhJL3BtSjBCVitoTnp6R29SZE5wQlRKTHMv?=
 =?utf-8?B?N3BDTm9qWFhXaUk5RnlXMUtzMXdPY01OMU9iZVU3VUlxOXprenlrdlRsOGtF?=
 =?utf-8?B?bWxpZ2JPSmVHYWVIYUpLTlJWRkFyWVhTcS80TTdMSjQrTUFlNG5OVlNOcVZx?=
 =?utf-8?B?VURaOFd1Y2FycVNSTlhQSys0WGdLMC91RTJEa2pRa1pMV1JDclNjUWRTVDI5?=
 =?utf-8?B?eCtabHExMXIxRU1tRzIyTW1xd01aUGpQMWtwSmFHblIxMW5EemJXbmM2TEdo?=
 =?utf-8?B?QnJyNm14bjRZcy9VNkxLang4WkpmWW56ZW81Z3YvbERNdHlJTkxBQTZPQURY?=
 =?utf-8?B?VC9VUklMT2k3ODc3bERLNUhFTzdHT1FPTDJPbkNVb2xMVEQxWkZpZitaY2hh?=
 =?utf-8?B?L1U5RXFIdXIyNHlQamRuOW9RWnRBRm5JTys4MnZ1bTRVM1dTNUdXR1dMOWNk?=
 =?utf-8?B?cjJhSUdXek92a0ZmL1F2VkVxRGVmdHNGcHFFY0crc1lvTGNzYlNJRnhNQ01S?=
 =?utf-8?B?S3FuQVBSZlZFd01xWmtvb21vOWhYQWthTnlrR1UvdThER3N5M2RsMUN6Mmhv?=
 =?utf-8?B?T1ltOG5sekpKZXRRSTgvQkZkNHVMSzd0MzJvVTEwYkI4aVh4bk9MQjd5SVNF?=
 =?utf-8?B?dTVQLytTSG9XNTlzUEJLWDJUU1hIaHIxMkR4UXpzdFFIWlM0WEV4S0xTYzFE?=
 =?utf-8?B?QkRsb2xvcHNPbE1WMzNENDZrN3FzSC9OV2RDaTNVa3N6TXliR1JkdExCMlBR?=
 =?utf-8?B?M2ZxZTlGWDFzaHdyYUtycVZ3dUtHcS9zTnFLZGxGdml2bngzR25pcXp6VGRa?=
 =?utf-8?B?VC81V3lZS0MxNldieVIzb2hvR2loOW1EWUFOejUrNThQTi9kWFNWL0xxSWdm?=
 =?utf-8?B?aEVvZUtSbUJmdUxZN0czMFJxdmpJcGpvTEtndDV3UUVzVkY3SGhCcFdqbnpq?=
 =?utf-8?B?dHd2YmhwVk9JR3N2ZEdKMHE1RFFiZlNDaHZ5bmYyRUVmZTVwSjZoVU9PUWoy?=
 =?utf-8?B?bEJZdmJ3T3JVRzlVemNsVVRjRzRpSU1QSXJwek0wb2JYVDJoNXFrNk1CMTVN?=
 =?utf-8?B?S0JjZ1ovQnZaLzJuanV3aXFiSm5EeU9FMklSZDZnR2tWb3RZMXFzaEpOTmk1?=
 =?utf-8?B?L0IyVTV3ditDZm5xK3ZKZUNtZi9PVGI5WFZYL1hyN2Y4UU9SRnl0eFpOcmtp?=
 =?utf-8?B?bWFHTEtYdTRYcXB1VVpSam1PQ25tTVBNUnpzS1Zock94RHRKNVA3bmRDYmxB?=
 =?utf-8?B?SWhWc2t2bFhiUHFTVU9Ud2pMTWlpMkVrREo2UXZlYlpjTkI2eksyTGJicEZk?=
 =?utf-8?B?b2svNko1aHh0d0ZmZ3N6aVR6S05tbm9rbHVKUFB0YWFVMkJEU1I2UVZsek5k?=
 =?utf-8?Q?3OAVNGPx3qydzjUEa26rcZFRa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92858496-ccf7-4afd-3178-08da962b892b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:31:35.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82O4I1UjYVUN2+KcHZfvyUIFv47AWerhyu5Fcp5jl4eLRJwD8SV3TycvgKGQaJFtZsMWwA5rQXJ69mgMiElrSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8717

On 14.09.2022 10:14, Jan Beulich wrote:
> On 13.09.2022 16:50, Roger Pau Monné wrote:
>> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>> the consistency check in check_lock() for the p2m lock. To do so in
>>> spurious_interrupt() requires adding reentrancy protection / handling
>>> there.
>>
>> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
>> trigger when trying to acquire the p2m lock from spurious_interrupt()
>> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
>> percpu_write_lock().
> 
> s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
> but yes - we could nest inside a lower priority interrupt. I'll make
> local_irq_enable() depend on !in_irq().

Upon further thought I guess more precautions are necessary: We might
have interrupted code holding the P2M lock already, and we might also
have interrupted code holding another MM lock precluding acquiring of
the P2M lock. All of this probably plays into Andrew's concerns, yet
still I don't view it as a viable route to omit the stack dump for HVM
domains, and in particular for PVH Dom0. Sadly I can't think of any
better approach ...

Jan

