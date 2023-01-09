Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A64661FAA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473358.733901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnB7-0000xf-Gk; Mon, 09 Jan 2023 08:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473358.733901; Mon, 09 Jan 2023 08:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnB7-0000vI-DY; Mon, 09 Jan 2023 08:06:45 +0000
Received: by outflank-mailman (input) for mailman id 473358;
 Mon, 09 Jan 2023 08:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEnB6-0000vC-Fa
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:06:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8daac4b6-8ff4-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:06:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7391.eurprd04.prod.outlook.com (2603:10a6:800:1b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:06:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:06:41 +0000
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
X-Inumbo-ID: 8daac4b6-8ff4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Toj6OLK9+HcXevSZIphcQ+MOhw3bq+0nJgRois7oHE4CaVSHWthoD9hGtuRdkHhh5u6+v0mObArIWbnQM1W5cbZQFnzhMnOtogt5LPLwvq7b8XYZo11rqOE3/YyQcIG30dGw3oAVxb+K9GHkcshHA3jv4aWw1/q7S/MNaxJJeL6UZ2/p0dLXRR2is2QGiuc585QtuzODAYM4WPm3oy78T3CknFAQtqJug+Ro9QBMY4jIhTKRgqlTDZ5V3KAmgvSZYNcl9iRrfo1USTeWOR0+TbaQf5wSUVexRNkSgCeawXnHcpefTvcVm6drr7IrtQlpy7vnEC5GN3gX3QF97paHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTBO89uOjTyQTH7hk4wHEkjHNHDeznBX+XQQGm4IwBk=;
 b=GuRvzc4uS2yBxtIvr8VOPpO17rbgoIayKRnUqGi3NlCrJ0H6PdoW8vSVG7V9FCw0QTrnpEeQCwCiJrdzSw2cAI+jAtN5A2rxOw6BeX/KU++GeFakJ3S1qkfQVggnsN3+Ur8Tr17XD4gMgvYwyNVI42q10cuggoBS8bCnlhFOBchOK/r3aPX7qd+AM7SCITck6uYG13KPOIf2VI1oK6NhaGGBWB8ZUEDjQCYYXTTODitvzKn7gVViopPKDTzkxI686P8lS1VnXrod/sjg6YgzfNXSmAysUHxEi6Z2vNoPILNz+Fp1dkX3X4ZcyxGfsId4q9pwSg5NIrYxwiT5wVm+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTBO89uOjTyQTH7hk4wHEkjHNHDeznBX+XQQGm4IwBk=;
 b=w3TiNdiEunxT/rscBj/dJ/71TBx3a9XB03AADii7/+4qE1Lt1x+anmQdV6cu+wdXQVzo6ObQ3lUrJxZ2aoOlTsBq/3QklSWcidb2B3WBcMsXnTRChY1XxGJ0J2l68XX9HASpQg94vlWG8RR3XsV/ZOhlEc+smnQsCTZY9iJpb+XDBW60gcNVl2HrdogSWWCAS3VBooZ1OZsVphPiSBAfdIgB0TGnnISByYKVNu2CHZrRxmVRhPeq+AdSbhsJh19xb/Syv2KTaLQsN1P0BNNKAOg4262044Lmj05J0ivq3W8V6dMOEIkoCNJ6stgLqmKzc3dH3DSkyHEQ4Z9HQOgSjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18366360-7bfd-0d27-fd32-e3064eaf9b7e@suse.com>
Date: Mon, 9 Jan 2023 09:06:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
 <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
 <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
 <ebaf70e5-e1ba-d72d-84f2-5acb7e38a6bc@suse.com>
 <9ce20298-5870-aa1b-ee5e-e16a623beadb@citrix.com>
 <a65a4553-d003-1a8d-abb7-5d8c1c9fface@suse.com>
 <5bb7382c-bed0-144c-2906-38bc08c76a52@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5bb7382c-bed0-144c-2906-38bc08c76a52@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: ea05dff7-113d-4cb5-9694-08daf21870d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhnNTKH+pM4MX+DFjb4S2sal3p+xCKCWWODuJKgrHxZplxV99SF4/FWDP680dFgZ3LcFu6HvzOIGVuebIFkchKayJB+DD9lxWp+04gmSOy3j2b5CNpnkWCd7ByGcqlTTXny/33RE/Fo+c09NZSifWZDrUfUPek09U+w7fkIq8ysezP4DiEek1nbMms3mTscZlIT2w2NHp+Xm7yNrYT+0/HP1BKi3FLpS2w6yex3hX5zQAHrxXD6zAZ9miJagUPEPIVGWqxl4LFWhu8jWUyx19FujBnfXwhUdUyqQlU7SQQ1FBj5Y9TPDfZvKigwwM5EHuIYwksoz6/Cb9hiWQxLfJ4hxv/TYsekUWn+vT+F06UYqJhDrgYUWDR1hqUlaypb4DSvMZZxnLPwhMDJ1iqwFNzmAGzcQ5+f1VI2WaTZtX6rcEgocnhK/E+00Y7/jc/zfC/J1XaDA/v74TVKxze48jAopZObhRvEPAswMk9+YMt3X19x/K+IoN8tWvUHz22CNHy97vMI6BvjLGjVrC4jP0w/9oaKR0WNsyjcaznr8j5I9C9RlymNxsvVdkhAywTg60IG8DLEwsf4/yInhlwXzlw9L3q89Qtsq5g0xPvhGQlnpmabzTTHOQFMfga3H7pK6uZ8TrFxV3xG2MnSV+ucvgyDvSg5+7mr1w8EgiGZHGQ1tPfm3EfUhGqROD71TTobNzvX7TC+7K5HF/mRg3GPMWku1z+t/sAa7xCFxQNKBLOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199015)(5660300002)(316002)(26005)(6512007)(186003)(6486002)(478600001)(2616005)(31696002)(41300700001)(8676002)(54906003)(66946007)(4326008)(66476007)(6916009)(66556008)(8936002)(36756003)(86362001)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5oVXFTYW1mVXhoK1ZVYzZvR1lCRWRPbTcwQWRGdDBtYWl1b0J2S05aWDdU?=
 =?utf-8?B?TW1FN2I4Qkpmd3lDYWVIVUcyNGJ2VlNrRm5rVnRWUTlWWVArSVh2K0llczQy?=
 =?utf-8?B?ZVgvVDFqQXlWelp4UHo0SmcwUWtxYU1BUENwSVBkRFNObjYrcytDWGVUZnZv?=
 =?utf-8?B?VklxandVelhUa1JIbnVUcUNJRGVnb3c4QmY5Snp6Tnh5VzhXRG5HQmlmOXFG?=
 =?utf-8?B?UXZTOFV4WTZHcUFHNmRRdDRvdkFSZmlCTk5FS1ltNGtnUlFYell4eEZxUkJ4?=
 =?utf-8?B?WnVydDB0VGFsRjZia28rMERDQVVidWJlV0RIWWc3dWhrQjhCQjgzcjhkSUZC?=
 =?utf-8?B?S2dDVWpBNjhRVlRpakd1OUtuYzdOd1FpOEZBdmhvNXA0ajJ3NXVzMXphRGVG?=
 =?utf-8?B?U2pGVCtrajlnNDhmSmxQTkh6TlppYUFLZU5wd05SWmRYZ1dzYnNoQzR1NHdN?=
 =?utf-8?B?SnpiVzJQRnZ4MEZ6THlISHAxVHJONHQ3RnFOQTVIRGl1UzNOalFpazBFaXZs?=
 =?utf-8?B?bWZYa084bU1teHVCeXpvMHVmajBuZmZjNlFtMmZlNUgwWUQrM2xDYmlodHN4?=
 =?utf-8?B?Vlh0dWxzMkRIeHhDdHk4OXErSVZ4VDJwSFdwVEdVb0h3SFlQalBua1I3RjZW?=
 =?utf-8?B?RDgwcWpPQlhWRVpTYXZLYW1weTBKdXJnZkZJYU5qVkZuVngzbmxBQmwxZWhO?=
 =?utf-8?B?YU1CZWgzNzc1bTdvTzczbzdUMjFkbE1jTjNiMGpwQUpzeFVHaTZmYVJJS2NL?=
 =?utf-8?B?ZTBYdEt3YS9RUjB5UXZuVTB6dklNM2tSa3lUWDFHTWtCcjEvM1l4eGlWVmty?=
 =?utf-8?B?MnNIMW43a3dRTm0rRzl6UnZOQit5emlaRTl6RTdoZFBZRVVmcnVMY3dDenZC?=
 =?utf-8?B?Z2ZQdHFOK0NnbkdERE5nWVFDUncrU0lxa1BLZGRZWmZrcFhsZCtZeFA1SDFH?=
 =?utf-8?B?elZ4a3k2SWExWjhWU0JEM3pCaHhqUGg0ZmtMWmlCWCt2aEFiQ2RMek81ajFV?=
 =?utf-8?B?OWlXSE1vVkI3SjRUM0tBZTdBTnYwUFpLa0g5L3c4bVF5aEVZWncwTTN2OU8z?=
 =?utf-8?B?bDFKaG9WSFZkYXVOM1Ezc2U2UzMxNllZVmxvaDJPd3lxUEZ0OFhzTTlXZnpi?=
 =?utf-8?B?b0JBOXh0YXBVeW5Hekt3NXNHd1FwNU11eHhjczJqSk9FcFJwRkFRRmlnQzVl?=
 =?utf-8?B?S0FucmFyRjZFcWNJYURWZXl3VElvRlhTTG1JTW13WjZ1WnJjM1RmUHRpdG1G?=
 =?utf-8?B?ck0wTHNYSFlHbDZsN2kyc2prTzlXd3FDRzZJelpRUm4rRnRncU9yQ0NMYkRZ?=
 =?utf-8?B?WnlDSFVLSFJNOW5TRExzaVlTd3ZKSnFqOU10R1pnREVMcXlTcG1uUWFpN2NC?=
 =?utf-8?B?R05QQlJLMkVVYjdNQnlTRmxQUXhXcUU5bXZWbU5TQVUzRXEvYjBTdUxva3ha?=
 =?utf-8?B?LzlyS0FpUDFWYTNPdnVEbmxmMlR1amJTN2FyZlI1cmVaQTJkYjdxczZHdlow?=
 =?utf-8?B?T1B0UXU3aG1aY1lDVmwvSTI0VTcrMnJQV0V0emNWQnpFTEZrbjN5ZTlJa2Zw?=
 =?utf-8?B?UUhYb20xNUozZEZld3FJdVJOY1c3YWVoN2tsaENUc3JRdTczVzBjT0xyM0hz?=
 =?utf-8?B?cTBqTjJBTmtjRzlWd29RMTBBVTRHMUxkQzV4QUN4ZEdtbElDYjAvL2xteitz?=
 =?utf-8?B?aXVERW5GVWFGWGxoU3F4bk81SGFERHRqQUhhMFoxd2tlWG5pNkNLQ1B6L2RI?=
 =?utf-8?B?blZFM0lzZHZVOUJKMGx6S2hxajAxL0dVOW0rWmtWdncvY1NEeFJjOVNmYWlN?=
 =?utf-8?B?UjMxai9NdU9yR0lrby9ZRFd3ZDhDejlXRjdrZ001ZW1qQ05oQ0p1OGs5T0p3?=
 =?utf-8?B?d1FFeGtKT011MERXb2lMdGFJTW9PaU5nRmhEQmgyaG94cFBJUDNXbjEvMDIv?=
 =?utf-8?B?TlZqM2MzYm1POFNhcFNoRk51blJOQndXdmsxaWQzMStJdzJLMmFNeEVXZm9z?=
 =?utf-8?B?cGVJR3NNc3IzZ3hLUjdET1VYSXJrWHZBNTJ5eWNjMjJleUJjYXdmeEdQNjA3?=
 =?utf-8?B?am1kb0I2MFU1Y0hoajZmRTNHSi9hUzVrYmZqRkZycjNvT3JudkFnb3V4VzFZ?=
 =?utf-8?Q?WzVI4oEjl4plgQ/Sxs5Mtde40?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea05dff7-113d-4cb5-9694-08daf21870d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 08:06:41.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maF30kX1GGKAf5TH3ix7noGSxLd94A2ukB/M/WLnle2g+OHyOEpOBUN/Kio1IwyTJAwORIhE/iPdxDRU4KHbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7391

On 06.01.2023 13:14, Andrew Cooper wrote:
> On 06/01/2023 7:54 am, Jan Beulich wrote:
>> On 05.01.2023 23:17, Andrew Cooper wrote:
>>> On 05/01/2023 7:57 am, Jan Beulich wrote:
>>>> On 04.01.2023 20:55, Andrew Cooper wrote:
>>>>> On 04/01/2023 4:40 pm, Jan Beulich wrote:
>>>>>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>>>>>> + * For all guest types using hardware virt extentions, Xen is not mapped into
>>>>>>> + * the guest kernel virtual address space.  This now return 0, where it
>>>>>>> + * previously returned unrelated data.
>>>>>>> + */
>>>>>>>  #define XENVER_platform_parameters 5
>>>>>>>  struct xen_platform_parameters {
>>>>>>>      xen_ulong_t virt_start;
>>>>>> ... the field name tells me that all that is being conveyed is the virtual
>>>>>> address of where the hypervisor area starts.
>>>>> IMO, it doesn't matter what the name of the field is.  It dates from the
>>>>> days when 32bit PV was the only type of guest.
>>>>>
>>>>> 32bit PV guests really do have a variable split, so the guest kernel
>>>>> really does need to get this value from Xen.
>>>>>
>>>>> The split for 64bit PV guests is compile-time constant, hence why 64bit
>>>>> PV kernels don't care.
>>>> ... once we get to run Xen in 5-level mode, 4-level PV guests could also
>>>> gain a variable split: Like for 32-bit guests now, only the r/o M2P would
>>>> need to live in that area, and this may well occupy less than the full
>>>> range presently reserved for the hypervisor.
>>> ... you can't do this, because it only works for guests which have
>>> chosen to find the M2P using XENMEM_machphys_mapping (e.g. Linux), and
>>> doesn't for e.g. MiniOS which does:
>>>
>>> #define machine_to_phys_mapping ((unsigned long *)HYPERVISOR_VIRT_START)
>> Hmm, looks like a misunderstanding? I certainly wasn't thinking about
>> making the start of that region variable, but rather the end (i.e. not
>> exactly like for 32-bit compat).
> 
> But for what purpose?  You can't make 4-level guests have a variable range.

That entirely depends on the kernel. Linux, for example, could put its
direct map lower, ...

> The best you can do is make a 5-level-aware guest running on 4-level Xen
> have some new semantics, but a 4-level PV guest already owns the
> overwhelming majority of virtual address space, so being able to hand
> back a few extra TB is not interesting.  And for making that happen...

... allowing it to cover some more space. That's not a whole lot more,
sure.

>>>>> For compat HVM, it happens to pick up the -1 from:
>>>>>
>>>>> #ifdef CONFIG_PV32
>>>>>     HYPERVISOR_COMPAT_VIRT_START(d) =
>>>>>         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>>>>> #endif
>>>>>
>>>>> in arch_domain_create(), whereas for non-compat HVM, it gets a number in
>>>>> an address space it has no connection to in the slightest.  ARM guests
>>>>> end up getting XEN_VIRT_START (== 2M) handed back, but this absolutely
>>>>> an internal detail that guests have no business knowing.
>>>> Well, okay, this looks to be good enough an argument to make the adjustment
>>>> you propose for !PV guests.
>>> Right, HVM (on all architectures) is very cut and dry.
>>>
>>> But it feels wrong to not address the PV64 issue at the same time
>>> because it is similar level of broken, despite there being (in theory) a
>>> legitimate need for a PV guest kernel to know it.
>> To me it feels wrong to address the 64-bit PV issue by removing information,
>> when - as you also say - it is actually _missing_ information. To me the
>> proper course of action would be to expose the upper bound as well (such
>> that, down the road, it could become dynamic). There's also no info leak
>> there, as the two (static) bounds are part of the PV ABI anyway.
> 
> ... the absolute best you could do here is introduce a new
> XENVER_platform_parameters2 that has a different structure.

Indeed.

> Which still leaves us with XENVER_platform_parameters providing data
> which is somewhere between useless and actively unhelpful.

If it's useless, there's still no reason to remove / alter the information,
as you can never be absolutely certain that no-one uses this in some way.
And for the "actively unhelpful" aspect it looks like our views simply
differ. Is there no way we can settle on making the change affect HVM only?

Jan

