Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4777CDD23
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 15:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618565.962354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6XG-00005V-9s; Wed, 18 Oct 2023 13:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618565.962354; Wed, 18 Oct 2023 13:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6XG-0008U9-79; Wed, 18 Oct 2023 13:24:30 +0000
Received: by outflank-mailman (input) for mailman id 618565;
 Wed, 18 Oct 2023 13:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt6XF-0008U3-NJ
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 13:24:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92766fb-6db9-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 15:24:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 13:24:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 13:24:24 +0000
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
X-Inumbo-ID: a92766fb-6db9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBlthEiBEBQh3kDdgAX+FGp/5TVR7HZC+tgu+qCkjzo5cGoYXaLSnkxdwCIISGw/BvdPCmtx2ij1ISBxxEJvn73YkvtZnL0Ww95qACVTluSY/eTHaZMbY14KXVNvYg3YPTPAn2AIP/zmqDmaklJPsS3ZbmnYAv59Z2skDX9LKtdJXh8K0Pq6bNEfwF8AZSC0EwBkOn+QglWH5MejrwGo9MHrQh5rHpioT+wSGRRZEmLO0ke3VyM0cQnMd3RlusOj//uUVrZYUmPWuHXLpMpUrjPguRc8fX1BvtcxJSQAjEfoQGpF+e4/WaQXacOdpPq1ros6C144SQyeA5jgqu0t1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQXX+HCySJXSG8XgZouesrCNnx8Pw90e0xf4eAuO3XE=;
 b=jOy7k5UJblZTSDLGSyyGZhuEhZl13OFVv1OIH9wXdX8cqtz2h5CXT+RDds8z8cftsUTcRv1EYfi4dPe3KE2nmU1lVXiAF3LQGAHFkBojtk10wP0YtaJq6fZpy+lV3I0xcWSvmcEyx7wIh0hXQTl81ysrE5YEqwIyRerx5GJNP5OF6Wnp/X3NC72k07df+sCwGX4YtffxAMupMYBpTT9wLQH8OLm7oGXSe+9Ct5U9PxaaXujAPKuWRhCLzQBNr1k+sUfrB4Wk6prFWuzVEs3zZXrlqRk17KwI2t3sS0NN/vYlgNo8sQSHC3hhjoA3dF0kLSAxj7MH9+9QdABhA1CEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQXX+HCySJXSG8XgZouesrCNnx8Pw90e0xf4eAuO3XE=;
 b=eno9fqQaPWmud+jtoB3A1+CTrst60mznAtYpCJVVSyJU8AKjpJqjFXIeS/c8TfTtq7Rq2zR5CzAkdw5qDtzGfWxWOMxzXenPvlVLBQ0QPS/uwfyxUDhNiIZTmSqVxbtgg92BKNEQUPok2pHuXQugYs/GvJyeA07omIvzLXn5ejLi4dNfgn7gg2hcsIf+y+wfi4kwjgPXUpMSl5y/KS/REWhA8sgDhXMyJ6nr+eDx3lYllHwHUi4GBohTws9pGkogvA7y3nJ8FjZuxjd+QDGzz9qb3BgT0o7qdJ2kL4PzgRStCKVriEEvSfn49MBMrA0nUNsRQU9gvRx6DwD6Tz4+Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4f888eb-f49c-c77e-93ea-6d41041d39e5@suse.com>
Date: Wed, 18 Oct 2023 15:24:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-US
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
 <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 396d1ac6-f3ae-4272-88d4-08dbcfdd8bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6OxtPv0QWpLO11IAx+sH30iVM7B2qDU7WssJBacrPkaQmVYFRT/a4PgVttHivlN/tbl9oj+LhAw1GkVaqrmsjm9lrND+7CHyK7u5lhQKFCx/+LfU/EAWk4a13QdANE72YjntlLUSUbx2GuSN4nEv2KrkdBlDiuj6ZKXCKrDSBsAX5eL9YJ+Y4k4Ea/7qfI+X0bfdB0xn8ez+moFbRhcv7SYxGD3CeNPiPqdgsVW2ZEg1O0qMFyjnZ3aoU01GPYzYmaj+QxMODUgrptxQZ1hwleirRq0EC/IlDe3e7hfUPG86fv7SCn/iC0wEB5NB/4WJwmb7eeNwpTsQC9A6weE9jgN2v052tj5B8Vh5sorQRnNVVvMwuNO2+/rsDAEW1gnd1w1NPmfdrqmmKGoMDilDqQR5zKYYc91dkFUc5jMN4DxrQt+VycB4L5I1w/qQ4qCvJz6qb/cq5crr2X3Y4m+Bv1e4aiVMSETbFbAyUhShbuAM3faLjP7+ArYxa1sUX7cbANiIDaZc8xck6K0m0IfBZBP+1v96eEqp8d4Yvq6RrfWp2+4fWtvHpYRiKaNQm2awYJmTd4bkyHllVGmirB2Zn3A9rTTnGPKe5n8JeQNoaoEz2EnktmzMyVOTjsejSIn441UrLggz4RkrhJKZMBVnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(31686004)(6512007)(6506007)(53546011)(86362001)(31696002)(38100700002)(36756003)(2906002)(478600001)(6486002)(54906003)(83380400001)(2616005)(316002)(4326008)(66476007)(5660300002)(6916009)(66556008)(8676002)(41300700001)(8936002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5rcmM1WVpxbTU5VUxWUXBlMzIrK2RZb1NQQjVCN1VkUlpHbGgzRFlnR0Jm?=
 =?utf-8?B?Zy9QNkRjc2VkZHlleXl5bEQ3ZDJaSXpnR1pnS2ltdU9Dd1daNkV6OTJWRmpD?=
 =?utf-8?B?SkFLMUJwZndBc3lDbElmV0FHcWRadThTcEIzbVFWOGVNbWV0UXBsbzB4cld5?=
 =?utf-8?B?R1haZElCY2cwbkVsTTBEUnR3MmlvUGN1V3hVMUFUSmU3VmVaM2F3Szd2REU0?=
 =?utf-8?B?aW13dXRVZlgyVmx0akpOcHFMaEFiTVpjY3N0QU9yL1NxbmpoYWZWK1Q2Z0c0?=
 =?utf-8?B?allrVDBvY3NuQU9RbE11cDlKOEhZU01aakhQeUNSRXo2aWVoclpZM212SVg0?=
 =?utf-8?B?SnZ1b1djd29XVjM0YjMrUFpLZHpGOFRTb0c3NzhxRndmZnVpcGtDMmxzR1pZ?=
 =?utf-8?B?Q3hBclNKbm1UVWlEdG96VHFkMndoS2xucVhBb05QTDd0YmhHUk5Ic2VtWDNt?=
 =?utf-8?B?ZkNveFF5QUZGb3l4VjVMeUxVN2kzclEyOTlGMmhpU0doVnRUazhGS3hLdjlz?=
 =?utf-8?B?MTRLL0pDUEVYblBTTFBTT0gwREd4T01NbmNuQWFOallPTGJJZjBlM3YrODM0?=
 =?utf-8?B?VWhLd2JMTXNlUkVmdmpjQlNhQjVXNEJFSVl5c2kyRHY0ZG8vRTVnZ2EvY3hB?=
 =?utf-8?B?bmw1cDlhWXFHWjdQanVVbklYQkVNYjVMeUkzTjdSdzhGL3o1RVRFR09aTjh5?=
 =?utf-8?B?UXc4UVl2Szd5d2c5ZHhPek9sWG5FVldlYkhUSmYxKzV1dC9QM2JoRnU5UzNU?=
 =?utf-8?B?OXV2NkFvL2FrWHNidHNiTjg2d3gxM2dwRW1XeUIzeWFyRkV1NlY4TlNCV1Jo?=
 =?utf-8?B?V0IzaGgyeGhFeE01NW96SEc5bDRnRVdTNzVhazNDd3ZEbFVyMlZJTzBZWVdx?=
 =?utf-8?B?dkJTU0FLZCtnVC9EcWo3Tkt6SmhsRlMyUThuQzhQMHJETmpKelBibEdvNlBV?=
 =?utf-8?B?cjhXYW9QV1dLTGxnRmU2eE9abVA0L0QvYUtuMTNuTHhTSHFPU1JkUHJxNGd6?=
 =?utf-8?B?VU0wc3Y1U0d2Z1ZyUGZQUGRFNS80U1N0UXJMQlh1RWtxaTBtdlI4emRNMXZJ?=
 =?utf-8?B?U1JoazE3UGxrVjd3TzZ3cmZqMWZxVU9CR1NDYUUwSS84TmQ3UU9DdTR6Umwr?=
 =?utf-8?B?d0FDWUd6Vjk2d3prWGxhRWxDakFvZGJQM0VMZWk0Vi9aQWRDWjVPQXEvTW5V?=
 =?utf-8?B?SDBaeXUxU2Y5WGZWaHF4T0VrSW9OUk1KWWZDZU1kZGRrb2UyeTVubVlmSWhD?=
 =?utf-8?B?M0tQTEtIdFQwL0Z1T1RLN0JsbEZZVzdBU0RodWRVb1lBWFFteHJWa2FSb3h4?=
 =?utf-8?B?TGdZKzRPSmY4bnNLT0c5amtzamRrVjJPWnJaMVZjeUNmSVBWTVlzaVR0NlNN?=
 =?utf-8?B?S1BOT0JiN0FFOFRvWUgxN3ZuQVBHODdoZU5nbTRQYXh2ODREUHZlODBiVC84?=
 =?utf-8?B?cWR6aDJqYTdnRjJqMkx3VjhIZGVCR2x3RkkwYzNFVlV5OUl6T1JsdkhpcTUz?=
 =?utf-8?B?UHI0UDRPdHhsNGZaY1FWclhDVk5LcE5oRjB3VzZ6Yk9KVm0vNC9pb0dQWFl0?=
 =?utf-8?B?dU45TGEva1JheTFySzMybWZRNzM3QXB1aTFmNnQwNzNzY0lITjhoMWlLdE5T?=
 =?utf-8?B?VTA1WEJHeWFEaTd1cFhyc1o4cHJZcFI0akpwejNkSHcxMWl0MkhmVTk4cE1X?=
 =?utf-8?B?NjVaa2xBdGV1UDVZSkMvYUMwWlRDQW1qWmNQVWVSRmE0K3VNeXhzaEFGOVp5?=
 =?utf-8?B?YlQ1ZkUvZk90U1RoY2ZsUTl6UDAyZkpzSU1YWWJhQmNPYXNkWTN6ZmFyazNV?=
 =?utf-8?B?RjdMY0JVRDgvSVRJNHBMVU9kdVp0SDk3Q09QcXMyclIrbk9kdmVKT0lYZzNI?=
 =?utf-8?B?Z2IvMVZPNGZZR2ExSHJDcjQ3RE4yTVducjA5T2J6TC93Ly9YQnpSbzJnVWIx?=
 =?utf-8?B?K0phUDdvRVlYSGRQT2Q5WTNmWWVmbkpDUWp4UStRTlpBcEkyTmdBTGkyM0hK?=
 =?utf-8?B?WS9pNzdlNzlJSm1DV0paTnFvM281OEk3YzdORndFaTlGaStCcVQ5L1BldXlq?=
 =?utf-8?B?MUZXSnAydHBhZGlvQm9HMlF5TXJJR1VxRHNJa3lsZE9TVk1QVlN2d3dvWHZX?=
 =?utf-8?Q?brMgD8Gvk0XW92tkMrbOZXGtf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396d1ac6-f3ae-4272-88d4-08dbcfdd8bd3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:24:24.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9yTMUWB/9nk022ZQS32p5lSLInjsD1dESwaQjA4pgGa1d2Wpv/SV9KPDGJceTzkk4Llp0m7nGKnddE0sYbM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

On 18.10.2023 13:20, Manuel Bouyer wrote:
> On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
>> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
>>> Hello,
>>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
>>> hardwired to 0), so console_input_domain() will never select that domain
>>> as input.
>>>
>>> The attached patch fixes it by translating 0 to the real domain id for
>>> pvshim, but there may be a better way to do this.
>>>
>>
>> Thankyou for the report.
>>
>> First, CC'ing Henry as 4.18 release manager.
>>
>> There have been changes in how this works recently in 4.18, notably c/s
>> c2581c58bec96.
> 
> Yes, it looks like this one introduced the problem.
> Before this, we would switch console_rx to 1 without checking if
> domain (console_rx - 1) exists, and console_rx == 1 is a special case
> in __serial_rx()
> 
>>
>> However, it's not obvious whether this worked in 4.17 or not.  i.e.
>> whether it's a regression in 4.18, or whether it's been broken since PV
>> Shim was introduced.
> 
> I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15

From looking at the code, it doesn't look like it would: There
switch_serial_input() toggles console_rx between 0 and 1 afaict, and
console_input_domain() handles value 0 as "Xen" (like in 4.18), while
otherwise it calls rcu_lock_domain_by_id(console_rx - 1) (i.e. trying
to get hold of Dom0's domain structure, not Dom1's).

Jan

