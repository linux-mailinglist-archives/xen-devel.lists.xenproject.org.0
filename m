Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7447D2C30
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621053.967062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupwh-0001NV-0j; Mon, 23 Oct 2023 08:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621053.967062; Mon, 23 Oct 2023 08:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupwg-0001KA-Tz; Mon, 23 Oct 2023 08:05:54 +0000
Received: by outflank-mailman (input) for mailman id 621053;
 Mon, 23 Oct 2023 08:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qupwf-0001K4-Mo
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:05:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb623fd5-717a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:05:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 08:05:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:05:49 +0000
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
X-Inumbo-ID: fb623fd5-717a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1iCZMuX+QQPmn3wIq7s9xNKHsWbCDdp7fdN+R6uba2VojLIiMwYKMVfBbc1nk/dQtJ/8pdXs3LVF9LcvR/k9WxDEF5yII9XMpH8Bv7bx5N1pKPAnV74o0NhTCL+hSu+ZWOIgW/q3kr1929wg7heaa3u/l1A94eWCACVx+oQMkAZxOLdXiWM1Chr++l6UYRfl+EGhOr7Vb5iK8gNNmrxarXOmVtIIn6tOWv/50X0aL0CjR1gEwzXFM6qsWcd8naGtuamOjIDe6o46OHOZRJvKSI6/rUEbHA9t766ISeOEBBXr0SOE12vzM1PwR/6b8ZNoWrXGEGJnyrTz2xDhe0DlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cpf8La5f0uGPMBm7cP4UzqaSU5u5Bisl0Ahw1r97afU=;
 b=U5H0BkwdUpTTvID+zXtCIcsEYBrRrFV8cD9CqVfWJtTt/4viQ18/t/CqAj7YtbmMbf5VSshfCcPldmpVzqVXj1r1SIECTUBgWj24Q46Az6YE9QAR0+cixCN3wK/x4XEsBnWBFvo2k1+qGUgc48fzT3fCLQ2h0JHpWizrj+AY2rFt6Vgy1jpklQ5rFzNB/6yT0R78K3HkG1TrJ6NhDyncnH78MVr7T4vxF0Yf+v9n/wSJ0Z5soJfq+C8AtUX8p9FJ1aqMRuQxlKAtqwV/Cpp+JiF2LKPXEK/yg1ZJ2T1ouBUGa6xH6CXOp+5Qp8yrHzZ5y8H57VvTO1BamIAEjx2y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpf8La5f0uGPMBm7cP4UzqaSU5u5Bisl0Ahw1r97afU=;
 b=hnU/O4eReAjjwDNIuqpR14gsV3S91tP4jNAiOuZPs3E3guwfMqx8aQVi9e5q979+JJQ4KS4A24/FHNPl8iDz+oldHdcfIceA2sb5vjN8exdxyI2OMf6DqCIixIuofu4tBHXuJQ+g4+no2p1fYOcVj7iEf1wmd8MMiRO+9W2UhGV7JpJr+Bfm6X2mEEmEaZvCd+VwCjua07LZsvrRyW3432QvM2a/0eOe5S9hgZR36Bk/buQrvi2qTWc9AJ+iAn42NWPS8VpgsavJj8GxeEehKWWUX+s23RxI25mQa76EWZiQsO4Wjpu4x8zeF/z1BJAvjrDiv/Ms0hX7NyV7wiceOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d45ae14b-b6e4-478b-a94d-954b80375d9a@suse.com>
Date: Mon, 23 Oct 2023 10:05:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com> <ZTKAqBILUBNelYCS@macbook>
 <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
 <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
 <ff1a67f7-8b33-4e7e-8e31-d5201f7212c1@citrix.com> <ZTYmOTBdAgTBliHI@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTYmOTBdAgTBliHI@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 00377904-e8a3-4d5e-7ca1-08dbd39ede77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpvXml0O+fNRvqSoDWGzg4c4ljZehjzSxJE4GsqcM77TLNx7+YmyE/W/vgAda7oM1jrYsjEwhyIigtxgug+++4vT1gKSbunSeD/lqQ1gwOgXNUvL5Wx+6Rf/XHI4rkRIsxcYD2xz/wzr1DhhLiBsYxpJkuD2IsEx96pZACD5jDZth3ub6Y/X2AZOtO8MpgXqmAVOg20BQ2MZBOD0YI+NqNwivs3mFvyT6g9NazmZyazIOpb48MbjEXemUZxCbNb5WT19ARLWlIRF1HgR1LyJ/7cAdgJJkq9Ph5lXFWovjZepKlKJ9ds4AtCrehKau6a+f6v1AUmTdHcZZdRrwD58qcfS2kcUMUAGmWXRBwtTms51AIWWB6mjhhPNkaNo/L4UWZdALMPaElQ3JvBXeRO82lMLND1v6BtK/DkPlza6mpf7M8DTE1iUITiq2d7xQxeGNxL0/bvX1+hc3CYbuDj75rRzynl0yAoj4G14JTKWfKN0L45r+zcecNGodg8vjXi7ugveckH46ABs8VjVl+SMcqJ6gsoYdaM/RoIVYEfiqZOQ77E4jrsxu+8EaMt1Qx+gUkCF0TndocEl4DJBLuD2kleuT/BcFYeYdGV6A7pZ/YoNSHime7P7/mYHaS5JUYUTIA2yduEnkw3mWXkGpAHnAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(4326008)(8936002)(8676002)(5660300002)(2906002)(41300700001)(26005)(83380400001)(53546011)(6506007)(38100700002)(6512007)(2616005)(86362001)(36756003)(31696002)(66476007)(66556008)(478600001)(6486002)(966005)(66946007)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE10ZmRnSmN5Yy9xZk1uVGF6WVgxbUFZcGZVcjJIdUVjWEZoZmxoMjRqVEwz?=
 =?utf-8?B?MmVCQ0JUSVR0QTlhMzJaSGJpUlNldFc3eHBJZjJ6Uy9OUDBxZXY3ZTRYdXl4?=
 =?utf-8?B?ZGlwczQ0VVpLT1RzSUpxOEZmSFhjcXUxak5aTm1UWms3SDZmbllqTVZPYklk?=
 =?utf-8?B?ZXJ1M0wxV3Bxd25wTWR3SEFtUm45UUNKU3RjbGNkb3ZveGVMMmtOR0hkV05O?=
 =?utf-8?B?SUtOVGNVZG5scEQzU0JjWkRNYmFlejl5dE8xaVljQWtSdDVncUhQMzBia21w?=
 =?utf-8?B?azlQdWJxclY4bFdYOFc4NUkrV3U1MWcrYThNUHAxV05kNk9PdFhGMERDbVl1?=
 =?utf-8?B?ZFFUMkZud1UzQ0RwRU1WVVFtcGRrQndFd21PUnp2NEFsTlBNenV2WGJCZG5P?=
 =?utf-8?B?TE9RT2RxbHRudG1EeTIrYXhtTWJRZHNXdVkwRkhKM09NbFhQZC92MXdpSnFt?=
 =?utf-8?B?OEM4bytZZEVsQlNIL29sbWc3THFhOXgvQXRGREw5QTJIMGV2Ty9HWG5QYmFX?=
 =?utf-8?B?U0JIeG9LZU1qTTdLOVUyWGtiREpTeUpYTVlEN3ZWTWxwRkxNaVhPTElzazE5?=
 =?utf-8?B?UzhjLzZPcktrZlBUY2lJSXNNV1RyS29LVmFMNnFhajV0cmFrenQxNFpwZ3BE?=
 =?utf-8?B?QWk5dkFqS0NnYjFibHJHbXM0eWd3R3ZRZ1VMaTgrTHlFRHgwbCs4bWxjbG1w?=
 =?utf-8?B?eUNRMUdmNWFRb0VXYVQvL1d5Y2Z6Y1ZSUzB6OGNiMjg4NmxoK1o1a0JVQlc2?=
 =?utf-8?B?S3Zwb3N2TGM0TE1iTytjbkpYVzFDNWpZTURnMlJyQXFsMXdHR3U1K25pOUVC?=
 =?utf-8?B?SStOYUlPQWVsc2p1UXRWb3ZraWxOY0F1dW96L2E3Kzk3RDN5ci91emtqNjRH?=
 =?utf-8?B?ME5wNitsMUx6Z3pjNWdIeWlXenducXhiY0dwd3Q2MGJia2x3bDQzNWIzTFd2?=
 =?utf-8?B?ZWs5SUx4SktTWjhzcFVWbjhXajRFSHUrUmNKbmRYOFBiNXRrS2ROenJpSklx?=
 =?utf-8?B?a0QzT0JqbVYxRTZHdDhrSVhXYTBGSnd2T01IeFZRRWZUZnp1ZFkwQlNkSTJn?=
 =?utf-8?B?WjFLYkRlOUV3WENJejB5bkVJNjc1K3pBdmdEcjFVTUVyVWdnNEEyKzJERmxa?=
 =?utf-8?B?T245aHJ2Zzhhb0FBOTJrRHI5MmlQaGZBNFQ0b2xyRTFnN09lTUlWNnErZ3Ji?=
 =?utf-8?B?dE0xVHZSdUl1bWdZQVIwdHRrUXQ0S0FwRDRZTU9hSGdVN1VwaXFia0NjQjdZ?=
 =?utf-8?B?MXlFWTVzN3RDVTlnWHF6SHFpVzNhTm13Qk1wcklhSW1XODRTQjBMREJXbStX?=
 =?utf-8?B?dXpxTURyNVVIMit5NWd2NFVXbWZ6T3NOOFJVdThHNWlFMTBoNHlNdkhzZnVp?=
 =?utf-8?B?TUtMeGRub2tLWk4rczBtREM0cU5jUW9oZlErZDJlQVpTaFNnMWJyZExXRFFu?=
 =?utf-8?B?R1lvSUFkR1JIOFY4S3huWEg2NDBMSURIMDJPaGNWMmdxQjR3bDRLMVJGUzZI?=
 =?utf-8?B?SHdBMFpWbCs2L21ramZDZXRtbGtwSzRWY04rTWwySUxuMnVTL253dDFCM0Mz?=
 =?utf-8?B?ejlQL2VmUy84dis1YWJUUVErckJ0OWMyaXA3MGhJMi90QWJ1WnI1SCt6QkEv?=
 =?utf-8?B?a2cybEdKWVpVY3lhTTNCQmE5VkVxK0dCNFRobnJiaTFSZ25OcXpFREFHMlVv?=
 =?utf-8?B?WVJKOUw4ZmhhcnNmdDlSQTNvRTJBdXpuVmQ1VmJuZUp5eUVmWVA5K2xJMWdQ?=
 =?utf-8?B?eXczSHA3U3RZR0o1Ry95RFplREpmdkx3bFh4R3MvdmFaRGF0L1BETVdEcUVZ?=
 =?utf-8?B?ajZKWkcyVnVWUnVoTmR6MVphWlN1UW80dm1hNExwOUpmOEYrVkcrVjFQWGxm?=
 =?utf-8?B?Y25yNUUya3ZRZTA1cEViQ1JUSWFncmIxVml6MldLckNTeEdsbjVaT01nQ1J5?=
 =?utf-8?B?QlVHaytIYy9MV1lkQlB0YldGcEliclh6NFdvQUE4WlhEaURkL081NllDRG5X?=
 =?utf-8?B?UEt3K0taWUJGcEIzenF4UFJaeHZhMDhFQzdLdUxlelpXb0d1T1FwQ0M4N1px?=
 =?utf-8?B?MWVLVXRFc2c0ZUlOK2N0ejBYR0hGTG01V0JvNFEzZTNIVnFSZE5lOEZ0Uktz?=
 =?utf-8?Q?Ljrf1vsmjIQCLacaKEa4wlIkR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00377904-e8a3-4d5e-7ca1-08dbd39ede77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:05:49.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehfJoqlMC3ZdG/xMDchY/NLakAeMeSJ6VK20eGzwqzw/U0q0uK1+tjx4iBCkJYUlc4kpI7/G3DEU8Ewjv9cbkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

On 23.10.2023 09:52, Roger Pau Monné wrote:
> On Fri, Oct 20, 2023 at 04:16:16PM +0100, Andrew Cooper wrote:
>> On 20/10/2023 3:50 pm, Durrant, Paul wrote:
>>> On 20/10/2023 14:37, David Woodhouse wrote:
>>> [snip]
>>>>>
>>>>> [0]
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258
>>>>
>>>> I'm not convinced I believe what the comment says there about evtchn 0
>>>> being theoretically valid. I don't believe zero is a valid evtchn#, is
>>>> it?
>>>
>>> gfn 0 might be valid, but I'm also pretty sure evtchn 0 is not valid.
>>
>> GFN 0 very much is valid.
>>
>> evtchn 0 OTOH is explicitly not valid.  From evtchn_init():
>>
>>     evtchn_from_port(d, 0)->state = ECS_RESERVED;
>>
>>
>> However, the fields being 0 doesn't mean not available.  That's the
>> signal to saying "not connected yet", because that's what dom0 gets
>> before xenconsoled starts up.
> 
> Someone asked me the same a while back, and IIRC we don't state
> anywhere in the public headers that event channel 0 is reserved,
> however that has always? been part of the implementation.
> 
> If we intend this to be reliable, we should add a define to the public
> headers in order to signal that 0 will always be reserved.

I agree a comment should have been there; it's not clear to me what
useful #define we could add.

Jan

