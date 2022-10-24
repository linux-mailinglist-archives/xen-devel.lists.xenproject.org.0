Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2E4609EE7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428819.679356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omubZ-000809-Uh; Mon, 24 Oct 2022 10:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428819.679356; Mon, 24 Oct 2022 10:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omubZ-0007xh-Ri; Mon, 24 Oct 2022 10:22:49 +0000
Received: by outflank-mailman (input) for mailman id 428819;
 Mon, 24 Oct 2022 10:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omubX-0007xZ-VL
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:22:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2075.outbound.protection.outlook.com [40.107.247.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdba9596-5385-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 12:22:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 10:22:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 10:22:44 +0000
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
X-Inumbo-ID: cdba9596-5385-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx0rF9MTZ9XPZX8nbVmNQFDsEF3GndsGNNH7eVT0p6PnMdrc3ax51bSt4tsAcWrz11BePpkqGp7y7X3M5OAOhsNlHzC7iULAbrw9IwRzw0tIvTmCImpJeDlrp8voKYWvnyjf4PKeSg58f6H+ya3pzh69CX3HhuAVEZtUXLeeFik93VudEh0qnGA+FI9dXNyiibZHDiHCrE0wx94gJXqsQVmWeNr1hIGqoIaTtIGZbWXr5BtKCOFy4FjvwoZjBLjAy+nyll2rCVSHXVhh5Q+3pX0lQjnDTvayJaXcYB0xB92nJ5hbZW3aZvzsPxJhQ0Inqflc7W4OjDMdQXj+EO9YOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrsT4oz+McSEWWlkWatxfRsA6DzxpFX4soqNNQbN5vc=;
 b=DTL858Kd/JOssYsjaHiOw4qRkYCD6zNSXzaObSplC/9/7PZd6AkV+y4dqPL4OXSjsbAzesZB1sVQMlen4akZ2vPXo31Lh9/+J1c/EA9nrIPM1g5Xl3nVnlG6nYb0D4YWjTxaIT07PkW2w9FQ845OI382SjvmctIGtmcRnVpPxQO7+WyZp1LdM7wsf0AC3CPF7tg6leLV0bwCBV7MTvk+fa7Cdk7/l0wsN2fypVBranlstwShgrFApYjOApbk4pU0t7yGDrQVUpnyg+GpxrrELHDUrSBEX8Rk7JvVGZeSEqzZk/0/dTF7FATe3Jc0ozNKVIgHfhNQ4TAVaxkbYpP1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrsT4oz+McSEWWlkWatxfRsA6DzxpFX4soqNNQbN5vc=;
 b=ONHN+g808Hfjb0FlDJrq2cnUFmIcldEGRm3s5mND0oyIe/UFS/C09SRSMSdHTtRwQ1paztMEpbfsfi0X35xEcwB7ClrBhlNg9zqMbvbBMMKuXg+3omQiJw6biHZUU82H4pwP6lKro6EJG1aCaLj3sXSptQiSNkAjkXC0+mg9c5Qai68kYyHLmpHAeYgyWc1XP5gBK41Dr4gTRKrGLiWC+0LOuhcL85f9IBKgCJK378FMM5X/am1wmIhHmBlKasew8HGQv7bfbjYWw5nXcgImul0ZQ17FadFe0cLR3Vv9Kbr8wTvvln2hXbkl0ut2iPGzCJ1uzCs0x7DnViWIBY7sOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ba35141-c31f-5f0c-f9bb-26a07bad0edb@suse.com>
Date: Mon, 24 Oct 2022 12:22:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2][4.17?] core-parking: fix build with gcc12 and
 NR_CPUS=1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
 <61e8475d-868d-3ff0-041f-8f6790990ce4@xen.org>
 <8b2d008b-526f-dc36-71d6-81b653bbf467@suse.com>
 <b9868745-8e8a-01f2-818b-2efe7b5df5cf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b9868745-8e8a-01f2-818b-2efe7b5df5cf@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac8ac18-bcf2-4386-86c7-08dab5a9b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HIkQ0WjL6cmMSxBDJgVy0VrLDKZUvG5MkX9IibQbYTIv38JH4BD60YjwBao8ReP5Nlbnl0JV5lIj6BM6hsoCeecYa3uYWSZm+YbpjW53aWPqMdUjMm69ea6JvNUaoLlaAzFwhMs7ErEFocOfdN109Rot/h1c+sZ8TcIOu/o6I+freHe8Ru2sZIbZVPl/pWSIuysRaAaHB3mZlMG7OUzdsUSpCvSRY0i0R1L53T0HqkNiGj0GGtW3ZuuTzX2NXkKTliZ6BHWFpGZs7n5Np1adcwv/5wMkahlIX8MzbbYGVcHNYQCqhc8TFoGA+zdarH9Sa3TUHF7tdfpV8UILJNLnxdqgA+TPbMq9bwqSl7EtLRT/vgtJWzps9QFXnK+mBGrL7KpljrW3LWmV9PZ/Eliwgq4rXz/rBIcRSRf6yqSqaK3sVk9AuO96S2ovZs1VokEsojna7C0115eWd1knS/ZM87+S19sAnTWECoLupeQjTh3p07VHlrla2LulGDdbPeoHo0Xw3+aqjKoAwKyyGtxdYzHr74BQ6wIRY7pjDEHETP2tQeS1h7EMQS8YNGY2pPaoiCmVtPXQ/mFvSO8bAWsJHTd2YQ8MzrXOv9j/QK8AavZOHs4JbcUI5hL4M3J74yxqfDQUvuKgtrFAl4PCgpfDUx5F/L4yFluhg48SVTB6E3OAnAfveph5bnjkZse/iWQfV7OFaoVGKglHGt/eSyDqRG2ycpb9kAJqRK4Kno108K8OqPltwbdTU8SuuEZuFXBzTNXLaf4MGBKPnBAjwXKnNkI21Ydzoyo4LmloO0lboQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199015)(31686004)(6506007)(316002)(53546011)(6512007)(26005)(54906003)(6916009)(36756003)(4326008)(8676002)(66476007)(86362001)(31696002)(66556008)(41300700001)(66946007)(8936002)(5660300002)(2906002)(478600001)(6486002)(83380400001)(38100700002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFBZNHJGSWdXdnpxM0dYUDdjSzcyTGhDaWJyeGVGL2J5UDF1aG85UkVBTWZm?=
 =?utf-8?B?NC9Nc3FTMkJMNG1LWHZBcVo0QXo2NHcxUkRLbXpMUXczRXVkSnJLNGVLaGZZ?=
 =?utf-8?B?N1JleGZhYngxQXc2UzdvdmlINU1IRjVBUG55ZUJwVzNyRmQ0dVF1UVF5L2pB?=
 =?utf-8?B?WTBqTGI0OU5LTVhXRXNmWEtsUXVjcGR5dEhzcmRaSXhBanVFSnJSRGJyNm05?=
 =?utf-8?B?VVI0RFQ0RWlpWUp6L3JYMW43UDk3cEVoMk1GbFBvMUw4K1VkZXlaMWZhZzhm?=
 =?utf-8?B?VzRaVWprYnhnQjgyT2l3TnErajVEU291MGc0Q1QyTkhaTGlpNzhxaWFsL01i?=
 =?utf-8?B?TitUWUZlMTRaMjdoQkNCYUpEMzg5Nlhqb2tSUVVySitOcTRLYzhsaUFGczFl?=
 =?utf-8?B?bEtKS2ViMzg2ZlpmYWtMRS91cXN2SnNKTDdXTlpLM2NrZ3Z3Vkx2ZmxqLzc3?=
 =?utf-8?B?OTVXU3AvSE84MnlyOUdkV3R5OTFucmQwNnIvcHh0cG1WNHFsdVdBa0RtYXk0?=
 =?utf-8?B?TUZlY3UxSWlYSWlvcDRMQWxNWlQ3UmF1MEJaTG5BbVhmMCtlWUFDRUVld2ti?=
 =?utf-8?B?OHZkRk9CQjBKWXFKaVByZVlnQ25XVFVYY3ltWGtaUWx3WVc5WSswS3pyWkdn?=
 =?utf-8?B?aC9SU2Q3bHp5OGlmL2RqWU9udWxMb1QrODR0dHU1Y05GR2U1SmNYTThPTHlt?=
 =?utf-8?B?cFUvbWNlYS95VlhBNmRpa3Zmcm1BNnl3ajNTcHlwZ3drQ1ZUbnpkUGx5emR2?=
 =?utf-8?B?dTVZRWxkc3NueEJXcXZjVjd2c1IvdXJYbjZEb1YyeE1VdXFVMktndW1yYVVZ?=
 =?utf-8?B?WU9ZaWZ0Q1ozUldOMDkvN0ZjV0g3c0ErWHBDUlE4Rk1pMTlPVE1xOUNRYjhx?=
 =?utf-8?B?anJWTWduMEFleEF2R2piN3d2cSt4L0MxZlVvN2JhdGVMVGt2SnFpRzdIanV5?=
 =?utf-8?B?T3lsa2tHczZrL3ZlZkVyWFczaW5oUXpiUkVGUk5ZeFovbklLMk5PS3lVUFBS?=
 =?utf-8?B?YmhUaTBiekVmMzdiRDdJMDdZTWhrSzB1MEF3SEIwZHNoV3M5NlA0SWR2b2Fh?=
 =?utf-8?B?Ryt0WlpCa1pjQzk3bTRpbEVmZjVQQnhJMFl1aWRCcmY4YW9jYjJjQVBUNmJH?=
 =?utf-8?B?Um9YT096dVE3aE91YXlUV1JWcXZzbDFueXo1RDhZRzNsQUhXSWRkQlZtczVk?=
 =?utf-8?B?MzQ4YVpLc0F4ZmpXbVZ1bU9JNHBFazJZSjhHREFjSU1SM0xtZ1YyRUJMSW01?=
 =?utf-8?B?K0dIekZ1bFdsUEliNmpxUFZnK2hpeDgyVVhhbnQzQVJGdFNLckFoK2ZvUFJx?=
 =?utf-8?B?cEpLdzVudFJ4dlI0eUFlUWJQcWFvbTdJM3hUSGdabWhZMUc0RVFnWi9FdHNL?=
 =?utf-8?B?ZERKL2E4VkVRL2FOb2FJZ0FtVTJ3MVlqU1dTaERaeUxzdiswK0ZoUlBJYklS?=
 =?utf-8?B?OVEvM2dtNHk3YnJoY0tPb2wrSllTQmsvbmJjeHlXQlFTVjhpOThhN3poR21n?=
 =?utf-8?B?RzdxMGppa1MzSVVNZFAvNFhKakwzVFkrRG9xZHlzdzhHbG1iZ1Vja2VRbGh4?=
 =?utf-8?B?bXR1bXM4NW5iRmp6SGhqSW50NHhFMnJQcVpaT0ZuTy9xOHVGMFpMOGpUMnhG?=
 =?utf-8?B?OHpLVUdubS9KTlpPMS9QMWVXL2I1M0xZM2FUOTloM0FRb2MydUk0M2EyT1Fs?=
 =?utf-8?B?UStPL3liV2R0NWpRUndhRVVGdGtoNXNTSEJXd2d3VllsZk9Fb0lXM2lReWw3?=
 =?utf-8?B?YmUvYU5ZeEl1c2lXdkxDbndYek1sbDduN2U5aVNIaHMwdE5GWDBQSWF0Q2FN?=
 =?utf-8?B?WE43NG5uSmdBdTdna2diMWQxSkhPMXZpTlZOT291cFpoR3VjYUErVmlKQjFH?=
 =?utf-8?B?WDdqeTFVNytUVy9KR0d0c2w3MmJJVU1QZmNaUXFBTFNEMG9iTElEUllhSlFC?=
 =?utf-8?B?L0FwVTJHM2ViSks3cXNKNG96RzlLaWo3Y2doRE1DN2U4VjBZc09QamFtTjJ6?=
 =?utf-8?B?bHFnSUlIL3Zlbkx0WmFkaFNRSzQzejhHNmtieTZFT2h2Q044bW1EKzlJZm04?=
 =?utf-8?B?dFczdUlWbDMrREhhVjRJTCttUGN6M3NUSjlGa3RuWUlaaGJUSE9ZdmlBWXl2?=
 =?utf-8?Q?NTU+9SlOPkr6ItQRvB8Xc3BQO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac8ac18-bcf2-4386-86c7-08dab5a9b0a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:22:44.6272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZEIwQ7Ott+6opsepmXe5UaVbhL0OxM2BZ0BN5/4dzBb3ESgfiWfpzNWRzLBbr0MQRYhW9cnHDYZsXTCHz99VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441

On 24.10.2022 12:03, Julien Grall wrote:
> Hi Jan,
> 
> On 24/10/2022 08:26, Jan Beulich wrote:
>> On 22.10.2022 17:30, Julien Grall wrote:
>>> Is this intended for 4.17?
>>
>> Well, yes, it was meant to be - it has been ...
>>
>>> On 09/09/2022 15:30, Jan Beulich wrote:
>>
>> ... well over a month since it was sent.
>>
>>>> --- a/xen/arch/x86/sysctl.c
>>>> +++ b/xen/arch/x86/sysctl.c
>>>> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>>>>            long (*fn)(void *);
>>>>            void *hcpu;
>>>>    
>>>> -        switch ( op )
>>>> +        switch ( op | -(CONFIG_NR_CPUS == 1) )
>>> This code is quite confusing to read and potentially risky as you are
>>> are relying the top bit of 'op' to never be 1. While I am expecting this
>>> will ever be the case, this will be a "fun" issue to debug if this ever
>>> happen. So I would suggest to check CONFIG_NR_CPUS == 1 separately.
>>
>> You're aware that we use this pattern in a few other places already (I
>> guess in my local tree I have one or two which aren't upstream yet)? Just
>> grep for "switch[^_].*[|]" to see them.
> 
> I could only spot two upstream in arch/x86/hvm/svm/svm.c and 
> arch/x86/hvm/vmx/vmx.c.
> 
> But I am not convinced this is a good enough reason to continue to use 
> this approach. There are a few bad code examples in Xen and we have been 
> pushing against continue to spread certain construct.

Sure. But these were introduced consciously and deliberately, iirc.

>> Also note that it's not just the
>> top bit of "op" - we merely assume "op" will never be ~0.
> Yes, I misread the code.
> 
>> Personally I
>> prefer this way of coding the logic, but if at least one of the other x86
>> maintainers agreed with you, I'd be okay to switch to using a separate
>> if().
> 
> I am curious why, is it just a matter of taste?

I think so. It's not written down anywhere that such constructs should
not be used.

> If you really want to go down this route, then I think you should add 
> "ASSERT(op != ~0U);" to catch someone introducing a value match that one 
> we exclude.

No, such an assertion would be checking user input; a caller might
deliberately pass this (invalid) value.

Jan

