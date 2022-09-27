Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D65EC6EE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412736.656158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBwt-0003G7-Cv; Tue, 27 Sep 2022 14:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412736.656158; Tue, 27 Sep 2022 14:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBwt-0003Cx-9N; Tue, 27 Sep 2022 14:52:39 +0000
Received: by outflank-mailman (input) for mailman id 412736;
 Tue, 27 Sep 2022 14:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBwq-0003Cr-Ui
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:52:36 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05707605-3e74-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:52:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 14:52:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:52:33 +0000
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
X-Inumbo-ID: 05707605-3e74-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwXuAPml73UmHt/vnhY0pD5Nn8/0SmwuK/yNGsnhnidcAmxtiaiq59sTVE9ZV5Jt6oo8Rx/9YhEe+OwccLZBKMbqgSE6XtQB+NS4FVZGYlfSjnTD0QqLncoWd4U51tShDKzEbbjYhFFYXhdz8O9IghRR+I2QHCmscM5O8ZDJsOxwWEt2r6dVX3v13JAYTntVDuIBuVpP96MOy3uW1Vv+t8Gz6r2Xz4luBiacgHA6feqR1gWvOWFvUkmBCHPc4xm3p/a2Wamyx0rx181aK+htzOqNpktI05ccHIvxcjsa2nAFBKwF33A/yi3HHhKzzdyOHSlQ6tlT5epHkHTwYWs9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP3PNaiLaWY6VR4ZhXu1ItnyKhmSysFUsdujkPMM9JU=;
 b=SvxpcLpttObxHhiHpP0DT5jniz0mWBWYUxk7/X84XkH+lXOOh6wrOY60ZZGVXCDadyrGazI1u2sd/ve+I7CIklCwU7JF/8LNWksPDkCJqphheEkm65ewBB5nEx5DfzbTNv1FQvDzzFkp/wa9AeQ6rdHpO0KEB8tGq48/t1FnHfz+b1hN1/mmf+fx3zRQCjKP/NL2Ua5XWKH2TPuK8drz8+4vYzFKo1AnayY0rPocHUUBdY+2EoWhQYSLqClYsNJkfhYwkEe1T/e1Vm/CyA9ylp8eGCjWTzn1Xdm1Bg7/bmRxt5QSpgsKkERN3n4Ti7QIvHrxN1JXU+c0lKChavP4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP3PNaiLaWY6VR4ZhXu1ItnyKhmSysFUsdujkPMM9JU=;
 b=ZYJ8eH0rgRNup2w+YLTPMjn0ds48FcVQVQZxI8ONgYn3jEc00uzb7QyUHAZe3kKNJ4RQX50VpJAGlkHHwrGDsQsCcBzIO29AIIW2fLrgvZDoBDu3asc1rXlKIzVfZPYZy+qFn2LmX6k31cuFMCDzX/NgeQ5vAYC6+TInfMAsx/4pe436bMYj/NslB4jaeGKlUVqztPOt2DIRfIm926hykb07hl6Gehf4O3ZEB2NK411a2dZcej0PltDVweTxyI1ny+LSRN33zAd2HffSwZiUqI7IN8yq/loPIzECNq//ebhZ6uMqao3uWvTvHaBoQBKn+UT22KRWCkfGjs2k3WLSRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa90dd6f-dfe8-a213-4d86-5ecfddf0fc43@suse.com>
Date: Tue, 27 Sep 2022 16:52:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/NUMA: correct memnode_shift calculation for single
 node system
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
 <87mtak3mgx.fsf@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87mtak3mgx.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0044.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b3d4e7-337a-43b4-5161-08daa097e8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dNKXuIRNK9yRPdWRP5Ev1sql+RAxAFX3RUqTBAawl2rR+8KN9kDStN5L0hokrya7hSt4Wvs71VnUO8Xd6WJ311STG768gFukfMVdvjv+HbA58R7okXAHB9zABlE4tIpDQ5lCPS/FGM/ynZtJ3YV7jEETPDNh2JEGPDELQ783QOJ/bn/VjxFayWPL/noWBWK5AakA1i9rEJACO/VcBxFgS/J4z9duEu7jBc49mAKUf3OCNxTfUOYHonGzbUvGMyJqaDUByPlQfLrTWEJ3mA8J8Mi+KQsJ1APdOsjtyEWinpNeCyRhB4qN2hMeQp7ItURW8x8mnwV3Sb1kXAFuiZnFF32Y6BhNF2KZzVh7Fdsy0+3QyKbCxsrJz0GuFJwZdYRfoZw4qz3MyGKtwoovkFw7Ak32qScCAoXsIEeBk4fb7S7wAzahsSRJozwWy8MbmyBvh5q3uZvpmK9ftIXnbvuUXRAXuHc1p0wmdNWSTmKnH4PlXPyI6LKCxdhBxH4Gzqgp2Hrmp2/7pHY+OQGqeriFEmPro/xu0xprvpn6gPg5ylYF8SGNgzRSZs4Sy9BJzHf6ZMKq3jP0F4/2PHcB9p8KFIBX/ZOqLMQXSm+9+wibYz8gw1W0PRkN3thPBmQBKksYlFBlSgxx5KS4Qf7euyeyJAsdhmdQ8oqnNL01R7sNWs9i3uBBuzalmZ4jmZXwHjNePqRUie6ip0kAOy7kRdsks/UJzKzis7RYcByJYI9JFoploAucRJJP2jyXpuGo6w80Psa1rr+wcLqYxVTBpCivB76NDoYH4KOjGHX2RL1iVZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(6506007)(53546011)(41300700001)(478600001)(6486002)(5660300002)(186003)(2906002)(6512007)(26005)(4744005)(54906003)(2616005)(6916009)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(4326008)(31696002)(38100700002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nlh6akd6d1IwbFNZWWpQampSS0VPOWNnNkh1ZFlMQVlYWHNBQmZ2N1h2YWFD?=
 =?utf-8?B?SUtaN05mWmhjSTRGQitoT2doanNlTEg2UXJvalliRWpjU1VNTjIzYWRLSU1a?=
 =?utf-8?B?UmF3cjVWRDdpcUJNTUNvbkZYR1JCQ2lRak5Sd2ozN2cya2lEZk5TVXl0L1BL?=
 =?utf-8?B?N3VjeTdwSy9vTHVKbjRxZXFSb1JFUjhWdDg0TnpHN0hzV0xtVTY0ZFYraFY5?=
 =?utf-8?B?UlNnWG9PZm9yQmxiQUR0VmYycnUxRjVRRTNZcTUyZWdUL0NCK2NJSVA0MVVS?=
 =?utf-8?B?cGVWVkR5UGZkSm9WOU4xQlJTMkFySjFqaWlFRUZrWmFKcGJYZ1BKSW14UHlv?=
 =?utf-8?B?Y2FGK3VDUFhpUnNkQlJ1SEN1Ly94UWxFYXIxWVA4VXJWaU1HeHhPbzZBWXlV?=
 =?utf-8?B?MUJzWVYydnRNWU5PVUZXVnRLbzZHdXIrY3g4am01Ky8rYzF3bmdubnNjS1Zy?=
 =?utf-8?B?UVZHdWwyQi9ScXVDbDlCMDcxSEU1YXFiYVVacnBsMzBjSnNRZWZPOXAvRWdC?=
 =?utf-8?B?YzluWkRqSWhDdDAvdDJHRXZHS3hHbWJ0T3JULzNPRnAyclFsc1R6a2svbmpB?=
 =?utf-8?B?UVFyNzdpamxGb2xNWUtOeFZ0TWorYVdIc3k5b3QreDBLaS9QMWtzUDRkZisx?=
 =?utf-8?B?cXowZlhxZHErMUNWaytnbXoxakxmTjJwRVJXb2Fsd2VtanhRSjYvRjJKUmpN?=
 =?utf-8?B?MkFLbjZZcjBmY0k3aEdpTjRQRm9mb0RqbUtpSUtZNkJ3WVcwQ2pYYUh2WHFP?=
 =?utf-8?B?ZEZ5YVcrRmVNaFViWlNqQk13am4wRkRvVThCbFNsaW1NNmZFd2VYZnhDWjI3?=
 =?utf-8?B?QmdhUjJLREZweFNoSzhJZHRKTDlJVXFtMXZZYnBDdmxYUVg1VDNoTmQwSEVO?=
 =?utf-8?B?NDVoTW5iTWNUVW9yc3hFTDNqK0RtR1g5Mm5ucVhoWVZReGEvd3UxbElEM3o0?=
 =?utf-8?B?cHIrZFhWYkthbExzZFJXTTNEK01FNVdmY2FYZjRoOXhLWDJ6ZWRjalJKSzRu?=
 =?utf-8?B?VEQwK0l4Q2pJK1ZqR3haWHJ4Znlab0xBWXRmUTR0czU0MEZYQ09xbTBYWFMw?=
 =?utf-8?B?OVZZb3lxRDlFcGNUZnEvOXlTUWFZNWh0MXQ3ZGpjWlc2QnlmWHJYNTdUQ1JO?=
 =?utf-8?B?NE9PdHRIVktKQWg2OG91cmtjeHZNMWZ3ZzczK2MwMXorOHZlS3M2Z1lRVUJv?=
 =?utf-8?B?WGhjRjZNaDBTOWxBeDFQU00zcmVYV2NRUGlvMjhhNFBuOWRaZ056ZXhNSnJs?=
 =?utf-8?B?ZlZHUFptUUxoOUNsOWxDdGhXUU0valY0MWdKNEgzNWpCblpMd3NXUWdxem5V?=
 =?utf-8?B?eEx6aDZGaFUrbDdHWGExeWljeDFETFhIVGQ4Z2ZCSnc0b2cvMWZUckRELzlV?=
 =?utf-8?B?N2k3NGV4ZFlxQW15L1hudzZPREhLTnlidGFqNm91Q2tYRU00V0hsNHVyVTdu?=
 =?utf-8?B?Z3lvUEZISzhRWmdLWVB2WVIxV1ZnTDFoL01CU2owdEEvbHhUSVFST3o4MVFU?=
 =?utf-8?B?YVFjV0xTVWdjL2pKS0w4RlhSQ2d2Q0h2U0FTbXJCcVc1V0oyWFRleDkzeEow?=
 =?utf-8?B?blBlNzJHVXlnQzBWWENXUmJxak91blhqaWttS2hneUovYUNUNHdySGdJMXRn?=
 =?utf-8?B?Y2pNeVRoM2lUamV3VmgrYVRBR3hnSUZ6UDNrdlV6MEhvS0dEbCtkY0J4RVBy?=
 =?utf-8?B?UTRlSjEwaFBZSzlhVmloSGtJRDhUTTRXS1g4bXdRbWIvcEdsMlZsVmxWTjFW?=
 =?utf-8?B?d0pTb2h1cUdpcWdPMTZiRDNiT3lmVnBZMjd0c0puR2lUY1Npc1hSeDJiYzVC?=
 =?utf-8?B?UGtFRGdxcS9QOXNYNFVnekZDcjhvUkxSb00zNk5OSWVSVk1Md3ZjN2JlYlR0?=
 =?utf-8?B?TnJBbGI1M1h5V2dpV0FzeG00dFd4bW9BakNYWC9ZUHhpbU5ZTXdYRU5aYTBx?=
 =?utf-8?B?L1VEdnFEVHRFMWI5dVUvcWFBRmsyYmYreVdsUG1vWEdXU0I4d3g2dmZNU3RV?=
 =?utf-8?B?WXJ1YU1FekJqL0V6NHV4MFdIbDZNWnpvbURJL3J0U1JRTWx1Q1V2dFQrazdB?=
 =?utf-8?B?cTloMlhCazVaaTIrdStMS2tJVzJzR2FndnhQLzQvZzdWSkhvLzc0UjhQU3FX?=
 =?utf-8?Q?PjOHKwc0gOFmIqGCjlctT3uy1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b3d4e7-337a-43b4-5161-08daa097e8f7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:52:33.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCruNkCojh0lGy53CZq7k/iIPTjkjiX6ezwHPVZJ3ZmtQkaKK28Z0wYvuJWEBBwlU7wg695/kFJz/+CDIQmt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302

On 27.09.2022 16:44, Alex Bennée wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> @@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
>>          if ( spdx >= epdx )
>>              continue;
>>          bitfield |= spdx;
>> -        nodes_used++;
>> +        nodes_used += i == 0 || !nodeids || nodeids[i - 1] !=
>>              nodeids[i];
> 
> Is that boolean short cutting worth it instead of a more easily
> readable:
> 
>         if (i == 0 || !nodeids || nodeids[i - 1] != nodeids[i])
>            nodes_used++;
> 
> ?

If others (especially my co-maintainers) agree, I'd be willing to
switch. Generally I've come to prefer that form as it often serves
as an indication to compilers to try to avoid branches. (That said,
I've neither checked that this has this effect here, nor would it
really matter much, as this code is run exactly once during boot.)

Jan

