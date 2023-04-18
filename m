Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055546E58FD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 08:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522559.812019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poeNB-0005eW-Hy; Tue, 18 Apr 2023 05:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522559.812019; Tue, 18 Apr 2023 05:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poeNB-0005bt-EN; Tue, 18 Apr 2023 05:59:25 +0000
Received: by outflank-mailman (input) for mailman id 522559;
 Tue, 18 Apr 2023 05:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poeNA-0005bn-Bj
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 05:59:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a9c29f0-ddae-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 07:59:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8269.eurprd04.prod.outlook.com (2603:10a6:102:1c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:58:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:58:53 +0000
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
X-Inumbo-ID: 2a9c29f0-ddae-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaueH2BMBXTMVlYUPiHvgBqP9qJcNSybLyVvrePY6hQ99nnRqL9IXw7uebCwMT4xNLKpleTkggFplU9VE7plSa8LyO90Uw1y9aYvM5jESEFuy0QaKtd0X2gYB+UBRw/bxoD17tRrwPAazf6h5w+ZWJ+d8rYA4krlVDs2AH2jc9RWyGGoOojPxc7cxT2suPtgPo/ikhE3w4T9b9Nf20MauqgUQmllLzTspRrm1uBwiKJmumYjki4nTSaYtwNTZFl83/0V+qvCiuf5ryQPbmznC84ZQ7gNl9gX3ccFMGe5AbeW658YM+UXkr8lR4o3JxK0GZ7Nrs6uzzagVbpQsXDaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0J6n+628K/rBspYGtEVewmfWl9VC5Wiprn+3uP2ZZA=;
 b=I8PImZFcnU/Bx4wTvj4+eKQ88DNkSTOQIjMCNR0LHG8Bci2BMmtsbcgk/PxU97quO47h2R7l3x0EKm97KfJzLUHtEwoJW/9W3qgiW3jzJ3q9lUVLt05jIy+O2v2AvBc5022CCuJxOPWybUjy9D+77imIAlZQQs2VSK7O2N1f544n9FquN76CYXs2Uin7UdY5iVw5NVflipCKn09djZ6/nYiWUbYtjLxXf/I/Pjh/uT5eA10MienWVET9qcl068AnZDENInHmoINXalTaEJoAnbXNtvqTWv0l0PvnaI93zfEJO3flljMQlsk55tDzMyYG1RhhZpFKRPLIRQKu6uNscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0J6n+628K/rBspYGtEVewmfWl9VC5Wiprn+3uP2ZZA=;
 b=pw5ZDv33KOdc6BRlGwJPFnr1nzfdFf9APy8cA5oadCAN/dj7CZME1h0pBeOqmIT14YrZHAxza/yYHGWRpXWpQgE640OY4XkoUF6EAW/FpaYS8HGL6qNESnAGoE1FczrEMtZB8xsyP7r6ED2GNSSEwMDOrlnPjOMOF3rlpcqzdX/wYTGRln7PG0xT0PlLb0LST92m6yq2ZbltT4y4QjTcKi30c09sbWd5JFNEhBz9t/uTdj3YlIv388dWxusRB6DCyPwisb4IrqDBiC7i0912RKKfDo2WsAq/Z64cB0y4U4STooOse46MM3i7LgnR42vNeBhNZFTFKoK3xqeTqYLdgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49115307-753f-8196-55a7-8e8c1e50b503@suse.com>
Date: Tue, 18 Apr 2023 07:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
 <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
 <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
 <3ea38da5-70a9-6887-5384-fe002d8568c4@suse.com>
 <2ebda1f3-23fb-3f06-c4ca-1ac508c82b40@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ebda1f3-23fb-3f06-c4ca-1ac508c82b40@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da82f34-33eb-4068-83dd-08db3fd1fd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cIkiqXzaqkpgMjry00vc6DLtHMkB08lzWJGyqlakG5KDwyUoP0hhR5D7KbNNAh3X+zNwRiVlNQ29+IxF7eu+oLx7mw2q3Si3ynDYN0+HGJ3NSqhm7Zx90gBjUfr5hmknKTVuznmS98TtZ5j5+5H5t+BL9zIqJPMqMCulwZMJN5+/VM1I9SifW7aH/liSHnm7I/GgXkXz7t4l0yQ4qCiz9se8AzrT44jBzgiT+fibM9Sti8y9ufUeYlZbDQQFvg33uaw6Ha0tHAVy81KhcYySweI37G0+vyzF5ST3Kx0OtceITW6+K+UwTbEA+GCpYlWSqZ5ZPF/FqZUhcVce+MMnNdN+kL4L+mqRQ+xTF0uJa6Iuku0Bkse/C4rkL95V3hMGlkdgKfUj4r6e6RuExnG5tohnQXKtrr/EjisBzuERxSPxsv4GcNZ3pHWtPJvF8i6x/UHjsxIoIQtUzVKZeUKFUhosxebAcjqlnLpsKW3MbkjqR8zXfI6iqzFRdf7gDdf/JghQw7IyvpDDCTehDv+6pXckzspLrmXWODzHtVg29ZpfcqaixYGBWEFpsTQ+PKm10FmxN9DXpp1wkRVDbwwLL2fEqLuzHNB+n4bdkIcokg2c0pgUrEl1pcxKW0OseVaVBfy9DA0U37YPrmFhzEl/4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(31696002)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(53546011)(186003)(38100700002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkhiTUpYR2tuV3F4aXpxQWcrV294d1cyQTR3RExkRjlZWmYzeldxTUlyRjdm?=
 =?utf-8?B?eko2WjRqVVhvaXBjcGU0Q0xONVI3N3Y3by9jVU1UNjNBbVB2TzA3MXdKVHA0?=
 =?utf-8?B?VGRBWVNNSjYxRjVmdkFIcitlLzI5azY2cVlXUU8zQVlpaWoxUnlBeG0yWDZi?=
 =?utf-8?B?VFhENWpyUUY0cWVkblpGQ0VaVUtOOTRXZ3k1N1hDc296V3U4UlpLUTdiUDNx?=
 =?utf-8?B?dTdmTjRUWlczSGI5VTBNa1ZIYXRxWUM5dzREQUNLWU4xaHpTMFE0cjUvZVVK?=
 =?utf-8?B?WXJtVmQxa09XeGNwNDV0RE9pNlNtVEZlb2xCV0tCQmtOcTRkVUQ3WVQyNkVV?=
 =?utf-8?B?Ylc3cURnNmRQMWhDRlJOM3lQMlh2bzFSRm5PN2hiYzhNemRyYkp3ZnZteVB0?=
 =?utf-8?B?Z25MMzdWMHA1TFBGaHd3Z0N3ZlU1dW1hZnV6RHpTaW92NjVZN1hQejRUbENr?=
 =?utf-8?B?dHE4Nm1EMnJWcUovZnAyYzF4ZHlVWWcxN1Ric2ZjRHJReURsR2FsLzZFUkZx?=
 =?utf-8?B?RlRGQURTODhvZGFRTWRhbEdZcW9zelFxZk8vRDRpMzFZQnU2MmdyUXU5enFQ?=
 =?utf-8?B?dTZEemlxWUpvYUVXS01QYW5VVWJtdkRaUVZxN2tTbVloUjVOOXhnMFVWenV4?=
 =?utf-8?B?eGtqRWcxeW9lZHdrcDVySXlLcmdHcVNISmVocHlFRTJpeWl3cU1CaXpSL0p0?=
 =?utf-8?B?NFdTcytSOGZSUHZHS1R0SVI4OG1JTjVoK0FOdG9oMUhBR0JmRklLM3BiT3hU?=
 =?utf-8?B?d1VWMWdDSmNZZ1JtYWlhOU1mOXBPeG1VVndyaXl4VjUrbUVvOWhCVjFVaXR3?=
 =?utf-8?B?d09QZ2pRYlM3dXA5WlVCNzY2aWttbFp0dkU2bVd6U1A1VjJ5TW9KMW9zRzFJ?=
 =?utf-8?B?TXAvbHFQbUpMSm9DRzltN2JOUUhaVitBLzZUMURLNUdGako1cFUxTTNWMHlD?=
 =?utf-8?B?ZGhwMHlabEFIZi9KK0MwYks3Ni9hY0JvY09IcnIrOEdhYURXSXpCeVI1YjJr?=
 =?utf-8?B?ekxheDNCeFp0aEVZakdiT2crNE9XTW4rWEVvZ1N0cUIwcXM2b3NEMFZDZVhi?=
 =?utf-8?B?SndFbERRWEFPbzA5MjNDTEM4SzQ4NDU2Rm9wT29XOWorZUpoRE8vZXV4eW9h?=
 =?utf-8?B?amxUYjVLTnY0bXpnL1VnOU5KblZZT3c2YWFPZW4zRmNaaHBVRGdwb2NNQXda?=
 =?utf-8?B?d09sN05abGlyZnYwTXBCazF1dDE5Nk9lc1lhMU4vYU1uUmpKT1VPYytkUjN2?=
 =?utf-8?B?bUJpazdSMmp4dkZvRDc4ZTFSZHNVS2JyR1J3cFRNMlR2dkVlUkxHTEYxaCtZ?=
 =?utf-8?B?UG1nTHdGWXJJOFRTSW12NTcxWjNhTWJWYXNKNDVhZ1k4ekpSSklZYmZtTWlt?=
 =?utf-8?B?UTl2V3ZienZ4dyszbXJMK2lFZGlXclJLS1QvSFFadFFRMzQzYk5RTjNhTFdJ?=
 =?utf-8?B?ak9xNWRBSG44NjlFV3BLZEh6Yjh1QkVYQ3JOdTAyc21NWDVFbThmemtNWFJU?=
 =?utf-8?B?RVprYUtpZEFuem80N2NZUmJrTmdoaEVHbE5BbHNtcCtoMzM1SWlCS2NOTmFI?=
 =?utf-8?B?MkZlU0ZQdnhhbEFzRHdEMTVoV1QrQkpkRFJrNC9jTUdsQ1JPc094U0FrajNp?=
 =?utf-8?B?bkNjZHhPT1pWUWEyQU5pU2o3K3doemdJcFhhenhlT0xmVGFiZDNwY2xDWXM0?=
 =?utf-8?B?L0hxTTBsdlg1L3R4TUFSTXJFeGUybXpQUnBhR1R6eFIvRkhNNHNWTFUyZzgr?=
 =?utf-8?B?WkI5M1d3cUthUWkrRjlwVFlnTGdUZjNSQkxHdWJKQjlSRTBjZXZpbEVvcGRn?=
 =?utf-8?B?UTcrTkJBRDJuZ1lIdmhRZy82c1dEMFdBVEZsVC9PUE9TY3hoMVRWMTkwME1V?=
 =?utf-8?B?eDdGK0w4alRmaC9nZm1mZ3lCVE0wQ2EvSHl2MGhvdFpDRDk5V05EaE43UHl4?=
 =?utf-8?B?RnZPd0pLRzFLeGhtVlVxaThDMzJDQnVadWpuMTRrV0ZDdnNoNUVNc051czVO?=
 =?utf-8?B?OWkrQm44MnpTZHlMbDhnSmo1enJMNmRPanFGK092alhqZlRrME8wVUlNY1B5?=
 =?utf-8?B?ZjkrRjk5SG9BcUU0N0p4ZWZYSjdvRURLUExpNHZseVdJMVJNNWhGNnJqeXRB?=
 =?utf-8?Q?3zqjSUEkXR8aXsq6EfvIS+boR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da82f34-33eb-4068-83dd-08db3fd1fd35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 05:58:53.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HWEXJSfK4dQukKlsN8ER8S76JG7B/q1cgs3lpVmMmeOSjMFCMsDwgqgUZDfnGb/U6cnOyYJKXSGiy4c29OPBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8269

On 17.04.2023 21:34, Andrew Cooper wrote:
> On 17/04/2023 3:51 pm, Jan Beulich wrote:
>> On 17.04.2023 16:41, Andrew Cooper wrote:
>>> On 17/04/2023 2:59 pm, Jan Beulich wrote:
>>>> On 17.04.2023 15:52, Andrew Cooper wrote:
>>>>> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>>>  }
>>>>>  
>>>>> +/*
>>>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>>>> + *
>>>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>>>> + * Must be called with present flags, and over present mappings.
>>>>> + * Must be called on leaf page boundaries.
>>>> This last sentence, while wording-wise correct, could do with making more
>>>> explicit that it is the caller's responsibility to know whether large page
>>>> mappings are in use, due to ...
>>> The meaning here is really "this doesn't shatter superpages", and this
>>> was the most concise I could come up with.
>>>
>>> Would ", i.e. won't shatter 2M pages." as a clarification work?
>> Yes, that would definitely help. Nevertheless I was more after something
>> like "..., i.e. for 2M mappings on 2M boundaries." Which, thinking about
>> it, points out that while you have a respective check for the start
>> address, the full 2M page would be changed even if the end address wasn't
>> 2M aligned (but fell in the middle of a 2M page).
> 
> There's no nice way to check for because a range that starts on a 4k
> non-2M boundary can legitimately end on a 2M boundary at 4k granularity.

How about

        if ( l2e_get_flags(l2e) & _PAGE_PSE )
        {
            ASSERT(l1_table_offset(v) == 0);
            ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));

?

> How about ", i.e. s and e must not be in the middle of a superpage." then?

That sounds good, thanks.

Jan

