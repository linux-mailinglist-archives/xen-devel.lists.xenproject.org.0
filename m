Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24C7D080C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619648.965081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiZV-00068u-Qf; Fri, 20 Oct 2023 06:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619648.965081; Fri, 20 Oct 2023 06:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiZV-00066Q-NZ; Fri, 20 Oct 2023 06:01:21 +0000
Received: by outflank-mailman (input) for mailman id 619648;
 Fri, 20 Oct 2023 06:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtiZT-00066K-Ne
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:01:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1556cb26-6f0e-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 08:01:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 06:00:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:00:47 +0000
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
X-Inumbo-ID: 1556cb26-6f0e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HazNaNPJYalHQA+WzHDi2WkBqEKYgwC6XSu2N1yOiwZEeBsqLu9HVEFx01o16VhPz6rlbPVXJwedUxOkplLkjVzrf5ySSuHFRex2IymXwERicAKv5V6iBqzvxsgQsvn8Qx5dxwWwW+vT37Njh1O7LgeoGWCf1IzratIdBMdCbvCbb/UVwJyOs2LAakVo7+VF2CnUR1tValF9lRKQT9KB3ln/wrXOuhJhIgtk3VV05b7O5j8xwgvnlQkawaYxyVAOYlCbHVwuXtAdNNkl4OHAW+opleRXpPo4AwfXX2qbQiNo3qXwEXE/djXG/xasIwDOTYZmIHdnG92Kl9/wFC05gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTd/oCJBDYMt323PEN9Omyh1OxMJyiOr/HXogrOc7OQ=;
 b=J1D5PkqMFn/tYpa8gX4hqmfh5tFwq0S8IJqe+DeQbLL/s88HE2/PGsVpwI/dS6PZT6a2T4rMF9UM5Vj+4JulH7yIi3T9n3dSVMBasYC5vlQA7f3lDZCSnISurp6xiAvw7+nfYdIDbrwhS7J+4CZpd08iglQhr4xNiVa6qe2nzZCp64UB2TjWp3TIBoENqP9+rhjZjgFHGs2N4LgYbAll1zQeyvWBKbBQ9w3uHjjgs52i2ZeOvdtZtQjAg7OlUD4fVtUIyFd8SO+1KKGXffFCDA7iJTZTwgFMqg+rbVdnvd/c7NlurVrDjYcs6G4kwm7bOKsnJvwUYPIL+WigTfJutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTd/oCJBDYMt323PEN9Omyh1OxMJyiOr/HXogrOc7OQ=;
 b=EgSRfBjx98ZM2pw5MOQzpDH3Xa2iBfBuALXXIPH34fQjC7cv6GEW2vR8v3jpwvECBAXTfF5I8pdXXrlpOGGkecV41MVIrcUcU+P1YcpeAzJ5rwEgyxGN+5PHda9OKS/PZqB1Hl5+MVy/32iPOJyrwePfe0Eq1Z9Z3nBQOx4pDVnfY0b0F0jUo+up40eedEgs/JB1PE0YgH6/lzU9uvu2oZoMy6pzUiGXAd0B5wdg7DCYHw4mohQjT6pDYYzZZurisqnUOrWVMURftOqBaoCadOdzv72iFtZPSXC05VrNMbnlxcRHc8IST58rPfsPXc8q5oCSdEnpXsgjqkdYXugpRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ab86d00-b539-25d1-4830-80932babcfbc@suse.com>
Date: Fri, 20 Oct 2023 08:00:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Luca.Fancellu@arm.com
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
 <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b22108-0a01-4970-4ba7-08dbd131e75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FUa2x59J9VUahMo5e4qMdlH/rD0/uB5qPPY/XSlprHPFsqUAdYwcYTqu4vLELl0UEe6BG6Fb018Mk60R9nTARD/zyiI2pqp8m5pdVM0nafcFmaer4lBlgaqvaUVfSIztf0DMWGnHsK/lZz3KcP6TqcpT+xsGhjORmaxD6msowiZ+NNN7d1mYgvgrj3UWtdh1/CZMG3q6lircj8OeLXii29xwUX2IjxH/Kzc84D/uHohovNvIlu1m9wedCF7IQec0ZBh3zxPuW4H43lYjh9/GHqSHydeIa6N0juAzLT9PXoIyj0HKSvRI/XXtpb/d8SV9RXMq4NveDu7CAwIoeV8vvcKXEvb2+e1VpCAuBzqjqov36teGtLEZkCFUviVvN8p1S8o3O7X1BQ+Ib+pHR1X2hBjxyDZBiINg/u+9JuK0OklCHH/i7k9XzfJzIx1LQM/7CeBev8m8vggsNW7SDsUIq3Y4ieiUrapbDDHKVGdeJ2M69V8ofGiHN6cbl9lJWWhgRPphtLZ8nNMsFa6P+wzyYqjTErbZwpdtihwB1aF6ag1VtHcC7Zs4L1uw28OXLx1ypkp0080Gd5qwGN6iiSqyubfnALVgTMqAUl8wceP2jdWD2VhmVpHRLhrJZa/1Sy/+FenAl2uT/H/b96vKDTKdkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(6666004)(6506007)(2616005)(6512007)(41300700001)(8936002)(4326008)(6486002)(38100700002)(31686004)(66556008)(66476007)(54906003)(8676002)(110136005)(66946007)(316002)(478600001)(26005)(7416002)(5660300002)(86362001)(36756003)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGJCZzB4aUo0eHVPbmtCTXFiMHVTNFpPS1JNN0ppUnZRb3A5Tyt5c2xmbVND?=
 =?utf-8?B?OXdFMU9XZWJKQ0V4TEo4S0dRSGlyaUIyNnRsSnpaKzNmbTgzNFdTa05FTHRD?=
 =?utf-8?B?d2VYSDBMZUdDUTdSSUJVaVc1QzR0UFgxcU9tRXBVdkswUWFuZ0QzcHoxSjMy?=
 =?utf-8?B?LzhwbWJicWxMQ0dVZmY5cTR6T3g2VkNLb21Vb01tWkUvc3BHR0dDazRWYjJQ?=
 =?utf-8?B?d2x3QWtSR1hzS3ZuQ3hkQnJGN1NLY3JNaUtHQ3NuOUNHbmxYbGpoZzZMMUU1?=
 =?utf-8?B?K1h5TWY5LzRTei9LQWhuaDFVTlJQd01VbVBQTlMxaCtySjlMRWJYTi9abDRD?=
 =?utf-8?B?b1Z5ZDFLS3VUZUduMkM0ck5PaW5wMlhCN0U1UVc4STNwUkh5K241MUs3ek5X?=
 =?utf-8?B?QVhiOTBjTkw5TGFTN2E4YXBETnp1dVFSMCtUVjVyV3J3N0o3MldSUERuWmsw?=
 =?utf-8?B?dlo2NUpJU044MEVSNTlUYVRqbmlqa2tzcHpzLzBPOUJ2aUVIMSsybHhwZDJJ?=
 =?utf-8?B?cGJpZmlsWkNDaDU1MkhNSjZHTm9ySjFVTW10Q3B0TSt2WXdHbXdWUldFUUxY?=
 =?utf-8?B?cERxVjVjN01oaWFLUjJuajd4WE4wa3NRRVFWbjhnNm5CRGlSb1NwM3hMY0Yr?=
 =?utf-8?B?dmNvR3ovMm50WDJXT2xYc3IwYUFKaTg2VWNFUkFWckEvVHlxRlVOaHl1MG1a?=
 =?utf-8?B?bnVzTWd4UU9FYVRyeHJuOXNMd3FINVRHVmNTNGVMU0ZKUEU2RW5vWmtWOXZK?=
 =?utf-8?B?bzRCQzgvcFdUVFpnSnJtNVRwemtFelYxaEVHdklvWFg5V3IyT3JZUnNGYWlq?=
 =?utf-8?B?RnJaZTlndDdlbEQ4L1NBRmR0NzVCaXB0aW5rcmlCb2VKUTRpd0tIZ0NwZzZi?=
 =?utf-8?B?UEwvM0ZPZTNpUlQ1YWNiVmNHY3liSGc4T08yaUZ0MzN6S2FwT0ljSVd1d0sv?=
 =?utf-8?B?WjNGRFJBR21qdEk2UUlLQXZTdzJhMU5XSjZ0K3h6bFhlU2NFOFNMcnV2YlRI?=
 =?utf-8?B?VTFnRmVXYWxmWFZTODhuWEtCcXV4Q2JWdVpqaDJRVjYyUUd2Vk5HcHBxRWNL?=
 =?utf-8?B?czd0R09DUWdoQVJmRC9adEhIbnU3THJKanEzTXNWNFJSV1hPOSt2NXNLcWR2?=
 =?utf-8?B?dUVkTmxJWHJ6VmdpZHZ4RWdTM0dZSWREUWFVRkhEbWJhYktuRzcyc1lDT3Y5?=
 =?utf-8?B?c0JBMjJCYU81TDlPR3E2S1FaWjltTEdQQkZpL2ViakxNS0lJN2tEbG0vY05l?=
 =?utf-8?B?NnNaK254L1VVc0psWkUzaUg2NnZscDV1aHYxYmE1VFJJQytkTlpONmlubWY3?=
 =?utf-8?B?bjl3UkFvMFo0WHFUb0lJVk0vY0ttREFUWjFnOHVybjlqWGFNeERFdmxxbEVl?=
 =?utf-8?B?aVdMc0RDZk5RWWVUQlA4dmdWVDBxZSs5Q0RmcXUrQU5oaDQ0aXZnbGxaWkZL?=
 =?utf-8?B?RURpS2FGNzVjbE9yNml5ZzE2QkZxTStUVXYxaGt3YnNqRmF6OFp3MnVjRm5X?=
 =?utf-8?B?elpTOSswODB4aHNQSDBXTllqUnVYbG1yaHhSQXBWR2Z3N1ZTaFM0WVNGSWR4?=
 =?utf-8?B?NUQ0RnpWb0x0QmFKOGFMZzlIVmdPUnlSWDUyS1M4QkYwajZDWnNzZWs5MUtP?=
 =?utf-8?B?THhzLzVubXpBeWhiOGVraVBLQXMvQUhlMytnZHV6Sk5tMjgxTTJnSldDMWFt?=
 =?utf-8?B?KzZjL3JpVEQ1akJZanFJK1Q5ZWxHVFRYaVRBb2FkeSsrY2NsZGVzSXM3YTFv?=
 =?utf-8?B?bXIzVEVlcEIzWWxMUnorb1NJOERjT0l1T1I2NWpmZVowL1RybmxFUzNEZE9t?=
 =?utf-8?B?OU00L1RXVllmVEw4eTJOYUJETU5wWHB0NlZ5RmRURTJtUFR1eEhML051a3dT?=
 =?utf-8?B?UC9RRkNMU3VMOWVzN0xzTjNZOGFnaFNxQlROMno2WWk3WmNuaVRaTmZ1YzQ4?=
 =?utf-8?B?UmpsancxTlpCcnZDT3ZUbDFlSHMzRU8yRGQwQWgwVE5xT0ZBQ1p1TGJQQUFF?=
 =?utf-8?B?RTdSRko0NEpFQVJ1c1owdkZhZWNwQlNVaWd2djExVFVjZ0pESjlnRktnQlMr?=
 =?utf-8?B?dVBJaW5zL0R6dUlXSklDL2NnZUhKTGhuNkVQMTRDaDVRY1ZGOGRNT09Zb3RO?=
 =?utf-8?Q?KtHULGRsq95izYNOaM1GVku92?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b22108-0a01-4970-4ba7-08dbd131e75b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:00:46.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNLX7c1Ipr6lxgfqXaHmta1r0cuWJjNPw0/EgVbm0/yhiT2j/QejJS3P4ai9Gb/N2Gc9w1t2xtSG43eF+EDN+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308

On 19.10.2023 21:58, Stefano Stabellini wrote:
>>>>>> --- a/xen/include/xen/macros.h
>>>>>> +++ b/xen/include/xen/macros.h
>>>>>> @@ -8,8 +8,10 @@
>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>
>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>
>>>>> a SAF-<n>-safe comment here?
>>>>>
>>>>
>>>> One reason is that now that violations only belonging to tool
>>>> configurations
>>>> and similar are documented in docs/misra/deviations.rst (committed in
>>>> Stefano's
>>>> branch for-4.19 [1]).
>>>
>>> But tool configuration means every analysis tool needs configuring
>>> separately. That's why the comment tagging scheme was decided to be
>>> preferred, iirc.
>>>
>>>> Also, there were disagreements on the SAF naming
>>>> scheme, and
>>>> patches like those would not be accepted at the moment.
>>>
>>> Well, that needs resolving. The naming there shouldn't lead to patches
>>> being accepted that later may need redoing.
>>>
>>> Jan
>>
>> While this is true, in this case I'm not willing to deviate with a SAF, given
>> that
>> some ECLAIR-specific configuration would be needed anyways, given that I'm
>> deviating a macro definition, rather than the line where it's actually used
>> (and maybe other tools would need
>> that as well).
> 
> Did I get it right that the problem with using SAF in this case is that
> it wouldn't be sufficient to add a SAF comment on top of the MACRO
> definition, but we would need a SAF comment on top of every MACRO
> invocation?
> 
> If so, then not just for this MACRO but in general basically we have to
> use deviations.rst.

That would be pretty sad.

Jan

> Luca, do you know what would be the behavior for cppcheck and/or
> Coverity? I imagine it will be the same and they would also need a
> deviation at every MACRO invocation, not just the definition?


