Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96200650809
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 08:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465845.724648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AZy-0005Jc-Py; Mon, 19 Dec 2022 07:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465845.724648; Mon, 19 Dec 2022 07:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AZy-0005Hq-NG; Mon, 19 Dec 2022 07:28:54 +0000
Received: by outflank-mailman (input) for mailman id 465845;
 Mon, 19 Dec 2022 07:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7AZw-0005Hk-O3
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 07:28:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8e5fcf6-7f6e-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 08:28:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7732.eurprd04.prod.outlook.com (2603:10a6:20b:237::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 07:28:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 07:28:48 +0000
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
X-Inumbo-ID: c8e5fcf6-7f6e-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhwX6NyisTWnxXW8jx7E5tlbCf00WzEQbMKXsvSfjXauqzXbmcukWbAJHDcg9GnlTSlcCt0SxhOS2ytXj3Vts5vs/9VPvI7I6SZK+PeI8RGEchz5VVKSi0GjDSkjb266Xl7LTvi7ZyVyX83EOnGQJUJMrbkmHib7lc3MvpZXJskS4YULYwMn0lr1hqQOEMUP7HfZ6ZLQ1A/3bFXKlZs1+yoAMHMcBnaWSzo7GAxhxmB6RDtifoUQ6AYgsy9t3Javqp0W8D+6BwcHmKkS3LhtSA5qmPl9XIx8yfvHvO39+1uhzRaUMykuBW9d2BQez1qeO3ICF4vDcFyRQLDw09XNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqShiHs/qdT5HVXACcjVxKkEch/Gysh9LcccxIZTl80=;
 b=Cp60aGRkxsMZfCpubr99lvfq92wF+9hl6j7Zd8AHKY9VcXBotqukPk0b4U0fLkSxLIN2yLii08u+sOMgT+uIWzs/l2hd1lFGPQyWPBUKoFL3pIdkFPJDU8BFm9VqTAi3ToLYK0oOMSczS0608p6ITlZ5ZH1GHui3c+uo8tmtlieIXBYH0lDak3BPNEpe7PJSL2lbcJ21zwq4CYAsYzDz8RA8iDbnAjePd8rkKusI2T7qtCFIdXxTwikqvbBwdyaLRjLqfG/YXU1ga/UNFs+MV71jxJ28VSxXXmaGZVxk9eHY0TeICwcxbtrf2OLZ9y7lLyVWmiLtPYb/oCIGX8q/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqShiHs/qdT5HVXACcjVxKkEch/Gysh9LcccxIZTl80=;
 b=OCOl9itJVFi44945K1V041YOmfweobvBos+pwcgaUhS1MBtk8+4gPmvcyqlgqHUyqf5zLXi943dEabYDcZJAq8jm/XWzjiUYmRb+WIJLmN1eah2HDdi8xqxOsPQPtBaMYWKjnaXVP+XbRN/CQh7+SckBI9hdeV6A8IvJlPDlFbF2EeZ54A0c3ux1JDGeJDI5VgYE0QVKECl2kiU8B+a43XXKvSD2WzQB2zTXZll71bEtQAtpT8kwjt4/W+49BpnglMNVofaPJ0c08gyl0MiD2l8gO3gLjG+pVOopUh6P2mQeGW9d1uekS5iTzPBEdW7Q5TgSPJUPUw2DniEuZ5ghvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eff8db6-c358-9597-6096-0a1312d59712@suse.com>
Date: Mon, 19 Dec 2022 08:28:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
 <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
 <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: e723c125-7bda-421f-9eca-08dae192ab35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XgKQPsKYGHHdUeq54AXy5fB0c3NBslc0FwJx8SyHH5A/PFQAlgv2FQYeRnzlcjgs+tzRGTTjX/LEAGqApxZaGyUg4Gm+p0BS1X+2c4A/wAJDoAPsrArbhUN4MzDglIkwmJj+P2pxZOzUk+de8GyoynRq4CZcC40y0g5pxKru7ZPbCotHsChsL8CH55r3xE6QeJLbFb1LSqcLqQuRZz2L2RjYv+EBHEqTcI6lvEmXaMcX3WdVYZ8GyVAig3HKTf23SJqUlWzNzX0mBZLO403dTAkrJt1kjrto0OI/6n/EAlsCvtS+vc66DJjoyjGbGZ/nuDafts84MshGmUGuwuhNLT6nWqsSQL1ye4vLnzgA3e5n8k+NPx17EggmsY+8UMUS8THPSOCvF+y7+9jTcIzCS6Gel8Y76KcAEZyBcTXDLWGM7dXWNPlzaWJDaud6azwbTO1VSBKr4CqR8f3RtFzDS4pTcDBoyfMgpu1oFgzld7MMG4fMTBy+fRVS2/Sm3wRp89CEYi4C3ylPWvF6jhsfw+b6+G78rmlbvecIvpv9CLpJBQKFQOUGat6qfQqoB6ULiCSe2XkZtEiQnWAFWIGmDoR0ydMdENvvvBT4czgxXDuqLVp2Fdnmoau05gbqWh+lFm3lLnQ1sGBKagXzEIxdTVxZCeGk7psCg/jpHwfBAJ+qhVtP/ntRhkEmD9OGA0CaqMsy/wlsxDyBEi55g7qwt7DXvu8DHH5xMJkqJpbo+yuAJrGgxec9aAA8VwUHgCuO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(31686004)(38100700002)(2616005)(86362001)(53546011)(6512007)(2906002)(186003)(26005)(6506007)(478600001)(966005)(36756003)(6486002)(6916009)(316002)(8936002)(41300700001)(54906003)(66946007)(66556008)(8676002)(66476007)(31696002)(4326008)(66574015)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXhOcXpubmNPNytSbXFzTURnY0xWOTdrMmcwWWw1elVjUGxMZW9uUDFsclZC?=
 =?utf-8?B?cWNOK3liOWpHTW1XendPbk4rMjFGcWJjclc4UkYybWtJSW5FdFpaSTcxVFh6?=
 =?utf-8?B?YVRsSjJ5d1ZZRklFQ3QwU3lpbFNTMTBkZ0d1YTRMUnpaMnFxUGI4MUJoSlBy?=
 =?utf-8?B?K0VZZ0VTdWVBd21wS1dPaTlNdmRWQzl2cStpcmdvbnp3ekhyV1g2N0xYUVB1?=
 =?utf-8?B?RlpabHF4UFFISG53Y3JuTXYzRWRpRm9MMS9yVTV1cVZ5ZGRSSlBvYmNEUnVh?=
 =?utf-8?B?Q3JReE4vT2lhL2crc0QvT3RLTGEzMGozNEFrWVFIaTlRbUt5eFFHNDlIWkZo?=
 =?utf-8?B?SmNGWVZnTzExb2VwYTVqVXJPM2phRGg0RjdjWllGZmlpZTl4Z3l4a3BWMEt3?=
 =?utf-8?B?Qmpnd080OTluanN5L3BNV0hMRkpaQUlCYlZ1NFNEWFJxMVlqUmZlZmIxd2RJ?=
 =?utf-8?B?bnVzc3ErbzJjTDNwRDFUbjYrcW0vcHdSN3pHL1MxM0ttbXNHRk5zNDZYL1My?=
 =?utf-8?B?amsrNHNTZkxqUHM4eXBVUmo2bnB0UzhVV1dZeU5WVUV2SUM3UzYwQ0dXblU3?=
 =?utf-8?B?eSs5WnhLRUh0Q1cyRjEwNkpFVjhFK0prTFVkQ1MxTWMvbzU0ZTJZNis3Vy96?=
 =?utf-8?B?dmtqMUttYVdUTW5KY1R4TkhvakJuUXl6ZFVBZVk3dGpBRk9kcjQ3NzBEZXRk?=
 =?utf-8?B?clVEYjByUW1wQlR5WWF0RW5iMjFaVUdyWmlXbktQL2d3OTJFSU05U1d5cm9j?=
 =?utf-8?B?a0lsZVdPT05ZeGUyaW94Zy9mSjV2dGNaTEVIU1JNT1ByUWFSTEF3M1g0QTI3?=
 =?utf-8?B?LzZKTld5MERadUc2aUFrQzlNTkduMnBmL09vWmJkYzFJNG16Q0dza2JCM0ly?=
 =?utf-8?B?eWRDdGJVTllyazZTdTBIL2U4cXp6cElHNkhlbFVodzZYL2JLMW96UDhwRXJG?=
 =?utf-8?B?U0ZubVVNaWYveUEvWUw4VkZtWVVjb29ZVTIyc0JoTE9pMUZPUnRlQUx4aU40?=
 =?utf-8?B?eVF0Q01qK1QrNWZia3lQK1pDR0sxb3dvT1k3b01RMFpvd1duZG4raTgzYUw0?=
 =?utf-8?B?bTRGQXAvb0orU2pqQmpOSWRNMktyQmM1MWJESG1BeGlMTVNjeEw2SnJhSkNR?=
 =?utf-8?B?MGdhT1IzbFN5QmNFcXorM3RSVlNIbDUvVDdNMVptZmp0cTVuUXpMMU5ZZG56?=
 =?utf-8?B?MDQxQ0NaQUVuRUpLTGg1WWhiekV4bmdqYkhLdk9wTi9ueUluaHFIWHNWOThI?=
 =?utf-8?B?UG4yZm5EdS9McU1iRWx4RyswRlVhY2dBTUNhaUcxTkUzdUJDOE5KSUtBVC9z?=
 =?utf-8?B?T3MxN2pZeU52QkdFeThudjBhVHJOU2RMNXlwOE9Pd3V3c0REdjEra0pkdnE3?=
 =?utf-8?B?QVhzREdyUVJ1SWl3YnN5L1dCa1M1TXZUWDlnUk9xY3JVdmh1MmtiZnE4YTRW?=
 =?utf-8?B?a1NrSUsyQnc5UDQ1a0hpalhCekNHSytuK1FjV0dqcFNEZWJRTmRLaW85VFFW?=
 =?utf-8?B?dEM3YkkwbjR6NlBEODMwQW9XOE5SOTdsUHZVcHFGdzROejgzYWdiS2dUNWs1?=
 =?utf-8?B?cnF5U0J6MVNiUjBNTmJHMk90VHNicGlQeE9LUkd0cW9TendaNGM4SFBCS3gz?=
 =?utf-8?B?Q2UwRWhpR0RKdlA1cEJ2eWswWUJYKzlwZmhUMmYxVko2aVFnbDNoL0d0dER1?=
 =?utf-8?B?VE55ZmtXbEdWaFJQSXA4c0xDeWxjcDdscHV3UXpBeHRvejJNMTIvNGNZQnFP?=
 =?utf-8?B?SFlwbkFpa0ZRSTl3alpFWnZ3U0dRNHhhSlBrTEVzeis0bmdocHY2VnpETnFu?=
 =?utf-8?B?cjJubGhWRGRGVWU1eWJ5ZmhaUWZKV1Zpd3hPTWhvRUJ0VlFCQkorYzJyWmJl?=
 =?utf-8?B?UjNuOUkveGhDbUNVdGNhS3VsWUJLRDB1Y0d3SGNRRFFsTzFwbzl6QnJSbFho?=
 =?utf-8?B?WXo3cmdRY3RiTEVhczZ6NXBkWnBpU25XVEViNlFiTUVrTVl1MkJOY1RxaGFk?=
 =?utf-8?B?Q2J0NDVsdG9FMnAxZ2hqc3U3V3EwK0xkT29kcjh1Q00zZjQyc2dyTTlpOGFt?=
 =?utf-8?B?akhEVzk2azYxaUxYa3lwUDhMVEpCRmc5Z3pyT3dRQUd5bHg1dVJMUXFna0dG?=
 =?utf-8?Q?FklfyrILVFxo8a8ph43nZSN+r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e723c125-7bda-421f-9eca-08dae192ab35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 07:28:48.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZjqP4kGy16DEfbokGOrBeL8yhP+JaWurC6lT1njpAWKHzg2MXz/2rtxX+hwFKzDnaESHvn2ApH99ylf0t+TQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732

On 16.12.2022 21:53, Andrew Cooper wrote:
> On 10/08/2022 3:06 pm, Jan Beulich wrote:
>> On 10.08.2022 15:36, Andrew Cooper wrote:
>>> From: Edwin Török <edvin.torok@citrix.com>
>>>
>>> Following on from cset 9ce0a5e207f3 ("x86/hvm: Improve hvm_set_guest_pat()
>>> code generation"), and the discovery that Clang/LLVM makes some especially
>>> disastrous code generation for the loop at -O2
>>>
>>>   https://github.com/llvm/llvm-project/issues/54644
>>>
>>> Edvin decided to remove the loop entirely by fully vectorising it.  This is
>>> substantially more efficient than the loop, and rather harder for a typical
>>> compiler to mess up.
>>>
>>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> The main downside being that changing the code to fit in a new PAT
>> type will now be harder.
> 
> When was the last PAT type change?
> 
> Trick question.  Never, because PAT hasn't changed since it was
> introduced 24 years ago in the Pentium III.
> 
> I really don't think we're in danger of needing to change this logic.

One way to look at things, sure.

>> I wonder in particular whether with that
>> in mind it wouldn't be better to express the check not in terms of
>> relations, but in terms of set / clear bits ("bits 3-7 clear AND
>> (bit 2 set OR bit 1 clear)"). The code kind of does so already, but
>> the variable names don't reflect that (and would hence need to
>> change in such an event).
> 
> That would reduced clarity.
> 
> The bits being set or cleared are trivial for any developer, given the
> particularly basic RHS expressions.
> 
> The constant names are what relate the bit patterns to the description
> of the problem.

Again - one way to look at things. Plus, with Demi's series now also in
mind, what's done here is moving us in exactly the opposite direction.
Is this hot enough a function to warrant that?

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
>>>          *guest_pat = v->arch.hvm.pat_cr;
>>>  }
>>>  
>>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>>> +/*
>>> + * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
>>> + * memory type (0, 1, 4-7).  This is a fully vectorised form of the
>>> + * 8-iteration loop over bytes looking for PAT_TYPE_* constants.
>> While grep-ing for PAT_TYPE_ will hit this line, I think we want
>> every individual type to also be found here when grep-ing for one.
>> The actual values aren't going to change, but perhaps the beast
>> way to do so would still be by way of BUILD_BUG_ON()s.
> 
> Why?  What does that solve or improve?
> 
> "pat" is the thing people are going to be looking for if they're
> actually trying to find this logic.
> 
> (And I bring this patch up specifically after reviewing Demi's series,
> where PAT_TYPE_* changes to X86_MT_* but "pat" is still the useful
> search term IMO.)

I don't think "PAT" is a good thing to grep for when trying to find uses
of particular memory types. Go grep for "_WP", "_WC", or "_WT" - you'll
find not overly many hits, and with the false positives filtered out
you'll have a good overview of which of these types is used in how many
places.

Jan

