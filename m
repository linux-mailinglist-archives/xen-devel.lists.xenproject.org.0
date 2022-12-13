Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA6464B6DA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 15:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460660.718613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p55xH-0001Dy-5R; Tue, 13 Dec 2022 14:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460660.718613; Tue, 13 Dec 2022 14:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p55xH-0001C3-2D; Tue, 13 Dec 2022 14:08:23 +0000
Received: by outflank-mailman (input) for mailman id 460660;
 Tue, 13 Dec 2022 14:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p55xF-0001Bs-Nb
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 14:08:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98559b8f-7aef-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 15:08:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 13 Dec
 2022 14:08:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:08:16 +0000
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
X-Inumbo-ID: 98559b8f-7aef-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoXDTplnB+a/h4Olv9XCeMZe5Ayru/arwuLxrp2KtaiNrpKmlSPEsESufcZI3RAZejWvBifAhKfzZOeXTiVl5dNZ6o7ikoicGS6eiNLhrTnrXVRmESfUYgzHfUt4ztplJe+E9P1Vu49V9AlL86LdcLxuB/ZTIbfx4Yp3sZ2PBtMPKUdF/pEog1jKt9Lu4k4FDMfXBbPLtTLoWEWjL+ygm0DmJiCk6pi4H/Rjxe2HJh309AQrx682dsRByEW1lAgOCrcUiEGfwCqin6qwpSbzSgcv94iS5h2Am1ariW5eps6zYIK8U4XaYAUtBgpYMgpZCtc0//P0lAxFZZ1pKczj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkRol2jtFrbk4nMGRwE3Zao6cWnE8PZ56ERcc3/2JGk=;
 b=mdNxB6uL0Q9DBQR6PgbaLVa51AAEVqtkWRwm1XvyeJJ9jZv+wGtdaOCkdQyzu4WLO3h3HwV0VVTxQVkXAlsxEvgaL9JKQXebYKkODsVTsmXunytPV9ArMqGaWzozdYHT2Xa71Y/4qCr26M+nOXAr/ARv4zQ7NwXqeigg+A2qrH9s1JxmeGl3ybDgz94T059FH9YJDcVJVeidSTCyRoFg+4TB8weJpkB+7pG6Q4stpZxfRxLvC3pwsL7zogr7xF1RH/evhI+nsFrenwCpEjVfhwjKYibuFslTXvBFOwvImvwhYnNtsGHB2Hkz2BfCevwbp+WP0xzjIsQcBAIiCleLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkRol2jtFrbk4nMGRwE3Zao6cWnE8PZ56ERcc3/2JGk=;
 b=xqHk4oC9uWwmZsySeo/B4+Qvv2OF8s6tch5KHI4375UsmamD+q/SzXzlAz6R9cFkO4qbt14Qzl/Xosziej17WyrNjZ5cbEEJ1YyfYTNGqJfvsHRLJtppaKsoaif4kUAC6Ioc1nY6T2TErqI5nQTqbCVtw6MGC1zN9vxpOJeORrVFW4wRfEKNiFDov1Au6m31IQtOACpgykxfrM1l9WjZWlXfddUEw4CZtkF+ShHqxjOb3aEaffgfofqdGBwb+mrEDG5/lxYftyjydlHpDpuh2PxOLbHRpHfyY5J8lYGWWRHTmJgM6Fr3+vwMXmVXhtmxPzqLJX3Zbda5ORw+vHdawg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1805f03-2f74-7595-03d7-8fe69c275413@suse.com>
Date: Tue, 13 Dec 2022 15:08:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
 <520abcb0-0edd-bb09-f3a2-bb3d96c569b3@xen.org>
 <76e1edfd-07d8-1d02-788b-bd9e6beb49fd@suse.com>
 <3911cb46-e691-5539-b2d5-04de1a119329@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3911cb46-e691-5539-b2d5-04de1a119329@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbe738d-3f42-4048-0c43-08dadd137b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dG1B8/3TTRfbbWHny7k5iJah1HuNfpuGzkwRZ5EREmgm96wJFU7/mr2vQ6o76kikDAkVirN78qjTww1yJBKSwmYCsXHl5KqPwJS8GmeQBphQqIFyLe6GsSidhJStNeE0QsF3PdVaqztz3tJ1awbeNSsDeettxnCnGDPRmNiDDzSW4r9FLti7ddy1h4icvQRn1D3hxUouP2RyLm1wNV1Tc/UqZQRj6nB682co1Lrh8coXG6O2zWmNEFlIt2mXvNC//TmTPcBrzhFeAG2jMS6/oTdI29uvVeEo2QfjvvQbBOoU1aPA9cvE4M7LdiwEsgAHXUde+vixx3keedLe8gVXBLtUU0tCPCb7hvIqAmh7GFCcXgWoE7DmUuRMguVqVFgXXez9rziKlTB3UwVcMD/tSJniAdRrkV1la3w0FAalFdpa+v3ZOEkzs2D6PON+ZpwpqE+WdUQhgj0HPPMVuGPSyaqkYYRJF5tUBZ0IY6+dp9wnMN9yi+fN1P4/3ACydOGJs8NLxT6GagDDlYjLp4JgIo+M1iyUobkU9F6/F3o4EKEIkcOpYdDYFNT9Yd3cedN8v5x/hjb/8akY+zP7Uqnb+qnYnghf8CK+zwharVYK/nB77eLFpPm+fi79BObroI6Qu7mGgxSAI0oqIp2lBQQXjKohiMSrRg5DFEslDm8Sc3HByGiyCKat/XjY6j1rWBn9DIAolg1onlTzI5k/GxgIIztT0XRuKp7r6hduG0DocPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(6506007)(53546011)(54906003)(316002)(6916009)(6512007)(6486002)(31686004)(478600001)(2906002)(41300700001)(8676002)(2616005)(66946007)(66556008)(4326008)(66476007)(83380400001)(5660300002)(8936002)(31696002)(26005)(186003)(36756003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amc4bzZqMFVXYWI2QkJBMFR2akxNU2h2WDM0dk1FTnZCZXRaNU9vTnRCamZD?=
 =?utf-8?B?cnBxUmJnNHNxMCtMdTBVeFpzUDZSYTBKSEVKeEtqRlFRTkk0VWdPUVlhWGxt?=
 =?utf-8?B?Y0owL3Y1UEhCdklXZ2lNbzBXNTRXOWd6S3ljbzd3dTZzZTlqY0pLWDk3N3FF?=
 =?utf-8?B?WksrZDBja1VRTG9valRqaFpxYUJRaTF0dDFtVDE0MDczbW1ROTFwU1p4Ykx5?=
 =?utf-8?B?dVpZWFc3QXRBM3Q2MDV3YnJwRXE1ZXlUb3labkVsWHBYMkE0UkVhYkxzcWw4?=
 =?utf-8?B?bnJENWNzeHFJRXV4VE5EaTdEeXI4a2Fpa3Z5Zm44VTZvR0pBZUZaVUwyUFEy?=
 =?utf-8?B?WWZGY0JXT1pSWXRrWS92U3daQTBJdnJaVWk2blEvVklvQk14Sy8xSXNNSDFK?=
 =?utf-8?B?dUtDbmpXcEwwV3Q3bkpSSCszc1NoK3ZXWHhHWUx2WkwydzJkSGhLK0tQaitM?=
 =?utf-8?B?VG1yY0dIb0xrWEttOExoM1l0Q2UrZDFKa3NRY2I5ZUdoQVdPYXBOK0kzS2ps?=
 =?utf-8?B?RTZDTkFWL0RKME96TmhSL2pPMTgzNWFVRkN6Q2ROQlBoekk0b2dKV0U2eUIr?=
 =?utf-8?B?ZDJMY2lpOGQzbG1KOFRlMHpzWlV0aHo5V1pDZHdqamNRcTNaQ3lIbnUwaDQ4?=
 =?utf-8?B?Ymx3VEptN2lwNWZzcnkraExoMlczN3lqK0dvYkd0OGNYU3Z4a0hvQ2JtS1pO?=
 =?utf-8?B?cFUzS2xISzUzamJBZ290QUhjQldHUDJBMWNFRFRIcFU0aVhxSGY0VmhnRmhN?=
 =?utf-8?B?Wi9kaFRDaDJBczYydDhRTEpaNWMzWnlsMGQ1bnNycHBCL0czU1FkOUlxOTVU?=
 =?utf-8?B?emtOcEMwTVFueDMxR3VxWXg3L3ljQ01sWk9vV2JjODB4VVdhYldyT3drMlpD?=
 =?utf-8?B?MzBlSWtMSTlzU0xMWjNpY05BdGEyMStjNEVNVmFVMFhUOFZUUE1GK3NZc0R2?=
 =?utf-8?B?ZVJDcFJ3azhuL3ZJUzl5Mk9zdlJrVWdIeFFHUUkwK2VaQkhZTDltNU40K1dp?=
 =?utf-8?B?Y0NZTGdkSFVlc2RCNUpBWnlnbzZuTU4vdE1MVDVjUm1oVC8zaXFoZGhMT2pI?=
 =?utf-8?B?Tk5GQXpLNGt1bnh4QU9pcDNRMkZhcUNDUHIyMlhFQXVxMjNVSzJUYW16Y2gr?=
 =?utf-8?B?dVcrbmRlU2FDb0h2a1lTUnpJYTloWkxkK2lvWThtZE9pVDJuZm1RMXRlQ0Nq?=
 =?utf-8?B?WGJNSk5HVENoTGhpampvWWtEWEdiV0d0OXBDVVp0bmU0WFhaUE8rSmRlWUpz?=
 =?utf-8?B?bWM2dFRvVDc2K0ZhMXhzaW5UVll5NlF5RmkyV1VBbDRzTlU3Y2JYNUhVeEEw?=
 =?utf-8?B?cFRnbFN0anNwM1pqaW9pa2tWcGhPSFFxMHlQMkhCcU1nOVBTYWZqQkl3TkF0?=
 =?utf-8?B?UUtCakNsS0djdXVLY0Jock55Y2hnRUNKTzZLMVJML25hM0EvQWV2WjlrUlBw?=
 =?utf-8?B?bHE2Rkh1RVpBRHlITk5TTFpqVjJOQUpzU2Uxb0pQRHlibkJvRHFGb05xK3hS?=
 =?utf-8?B?cEtndURzcEhubEFVNkttZlpGZXh0MHRqTjhnNFkwSy9raGJFRmJCdy8zd2ps?=
 =?utf-8?B?VHJmWGF4MHEzUnhyR1VJOS92Njc0VzgrbUExWG9URE1sZU4rTy9wZU1ycXpS?=
 =?utf-8?B?TWlWT0Q2SjN4U1ZDa1pDN2x5ZWtEZXNyT0VCb1NKR1J2QmY3Rm1aV2RiV0Vw?=
 =?utf-8?B?c1Y2K1VlV2IwMWx4RzI2VmNzblZBcC8yemF6SzFVeVV3YURNY28zM0o0dEN4?=
 =?utf-8?B?RzNEazltQWNndzJ0TzlUQ0FZb3dnT2Nqc09TMXZVODhtdm5JditjcTRDcCtK?=
 =?utf-8?B?ditFN3pPZTdvejI0UE1vTmdxNE4waGVRODBqRFl3aDVCVWNiMHFSWHZSTm1h?=
 =?utf-8?B?VHNMb1lVR253cjQ1QlJyckwwWEhVNlZLaER0aG8wY3ZIRzZmV2NCV0E4VFpL?=
 =?utf-8?B?Nm8rOUVmNzVYRUNhNWtWTUR3aWZHY2FENTBROFRhcHRDRmtPcHpGUXJST2Nl?=
 =?utf-8?B?eHp5WWs5WUtDNFkwTEtyRkg4Rm1YZ2dNK25uRVVrREh1ZTZTWjgwWlhiSlVq?=
 =?utf-8?B?ellnbWJTVWFYSXpGU3pneklGUitUSGVHanozenJQWldYTHZLR1oybXJEaEZW?=
 =?utf-8?Q?35TesYVl+cN7lhj4UvEtHZkOP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbe738d-3f42-4048-0c43-08dadd137b00
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:08:16.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIz/VD0/7n/QQ5MuCX4ADc0Qe9+0usBdkS7UsIQdMnXHK2LhWjrak4+6DIiupyf0EeUhH5NGDJV0KTY7+6kcGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119

On 13.12.2022 14:48, Julien Grall wrote:
> On 13/12/2022 12:46, Jan Beulich wrote:
>> On 13.12.2022 13:06, Julien Grall wrote:
>>> On 13/12/2022 11:38, Jan Beulich wrote:
>>>> All callers convert frame numbers (perhaps in turn derived from struct
>>>> page_info pointers) to an address, just for the function to convert it
>>>> back to a frame number (as the first step of paddr_to_pdx()). Replace
>>>> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
>>>> call sites by the respectively most suitable one.
>>>>
>>>> While there also introduce a !NUMA stub, eliminating the need for Arm
>>>> (and potentially other ports) to carry one individually.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> At the top of free_heap_pages() mfn_to_nid() could also be used, since
>>>> the MFN is calculated immediately ahead. The choice of using
>>>> page_to_nid() (for now at least) was with the earlier patch's RFC in
>>>> mind, addressing of which may require to make mfn_to_nid() do weaker
>>>> checking than page_to_nid().
>>>
>>> I haven't looked in details at the previous patch. However, I don't like
>>> the idea of making mfn_to_nid() do weaker checking because this could
>>> easily confuse the reader/developper.
>>>
>>> If you want to use weaker check, then it would be better if a separate
>>> helper is provided with a name reflecting its purpose.
>>
>> Well, the purpose then still is the very same conversion, so the name
>> is quite appropriate. I don't view mfn_to_nid_bug_dont_look_very_closely()
>> (exaggerating) as very sensible a name.
> 
> I understand they are both doing the same conversion. But the checks 
> will be different. With your proposal, we are now going to say if the 
> caller is "buggy" then use mfn_to_nid() if not then you can use any.
> 
> I think this is wrong to hide the "bug" just because the name is longer. 
> In fact, it means that any non-buggy caller will still have relaxed 
> check. The risk if we are going to introduce more "buggy" caller in the 
> future.

While I, too, have taken your perspective as one possible one, I've
also been considering a slightly different perspective: page_to_nid()
implies the caller to have a struct page_info *, which in turn implies
you pass in something identifying valid memory (which hence should have
a valid node ID associated with it). mfn_to_nid(), otoh, has nothing
to pre-qualify (see patch 1's RFC remark as to mfn_valid() not being
sufficient). Hence less rigid checking there can make sense (and you'll
notice that mfn_to_nid() was also used quite sparingly in the course of
the conversion.)

> So from my perspective there are only two acceptable solutions:
>    1. Provide a different helper that will be used for just "buggy" 
> caller. This will make super clear that the helper should only be used 
> in very limited circumstances.
>    2. Fix the "buggy" callers.
> 
>  From your previous e-mails, it wasn't clear whether 2) is possible. So 
> that's leave us only with 1).

The buggy callers are the ones touched by patch 1; see (again) the RFC
remark there for limitations of that approach.

>>>> --- a/xen/common/numa.c
>>>> +++ b/xen/common/numa.c
>>>> @@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
>>>>    
>>>>        for_each_online_node ( i )
>>>>        {
>>>> -        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
>>>> +        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
>>>>    
>>>>            printk("NODE%u start->%lu size->%lu free->%lu\n",
>>>>                   i, node_start_pfn(i), node_spanned_pages(i),
>>>>                   avail_node_heap_pages(i));
>>>> -        /* Sanity check phys_to_nid() */
>>>> -        if ( phys_to_nid(pa) != i )
>>>> -            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
>>>> -                   pa, phys_to_nid(pa), i);
>>>> +        /* Sanity check mfn_to_nid() */
>>>> +        if ( node_spanned_pages(i) && mfn_to_nid(mfn) != i )
>>>
>>>
>>>   From the commit message, I would have expected that we would only
>>> replace phys_to_nid() with either mfn_to_nid() or page_to_nid().
>>> However, here you added node_spanned_pages(). Can you explain why?
>>
>> Oh, indeed, I meant to say a word on this but then forgot. This
>> simply is because the adding of 1 to the start PFN (which by
>> itself is imo a little funny) makes it so that the printk()
>> inside the conditional would be certain to be called for an
>> empty (e.g. CPU-only) node.
> 
> Ok. I think this wants to be a separate patch as this sounds like bug 
> and we should avoid mixing code conversion with bug fix.

Yet then this is only in a debug key handler. (Else I would have made
it a separate patch, yes.)

Jan

