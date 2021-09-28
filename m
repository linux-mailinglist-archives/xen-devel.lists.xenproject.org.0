Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA841AA93
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197790.351029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8RY-0001Hi-Bc; Tue, 28 Sep 2021 08:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197790.351029; Tue, 28 Sep 2021 08:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8RY-0001Fv-8I; Tue, 28 Sep 2021 08:26:28 +0000
Received: by outflank-mailman (input) for mailman id 197790;
 Tue, 28 Sep 2021 08:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV8RW-0001Fp-Tm
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:26:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c48f43a5-fe69-4d6f-8695-3b86eddaf072;
 Tue, 28 Sep 2021 08:26:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-PUD8BdvWN4GJlfbiiMPs9Q-1; Tue, 28 Sep 2021 10:26:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 08:26:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 08:26:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Tue, 28 Sep 2021 08:26:20 +0000
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
X-Inumbo-ID: c48f43a5-fe69-4d6f-8695-3b86eddaf072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632817585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JiDH8eAcYjgcrjsbsX7whOu9DhoYFpXwJVQ+CN319M=;
	b=arND/g6RuAfUk7DegxhVhjWa8pYZRCmwq6Ii7EP/iSQvneurcDhSHk8ZdrTxmUwPd4iDUk
	zZk02uGvtvhHbnw7JM5Xw6Wt7UwgAP36GGzS5e0z0faoa5f0HlKFKCgIr4W4LRiGbT2m/C
	E7MFzJI3G9DODE3Sfd3PsTpJ6AyDoT8=
X-MC-Unique: PUD8BdvWN4GJlfbiiMPs9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jToAnn84MYsk4ofZvTOET8GsnnO7f2oqczKArtve3rmKjilsURHiefeAjKDJ20r8kHQI8FqKIumd+AmvEQ0NAMPeTVxepOjDUe3gm/oNTqH8dF4hAKbs87b0M1mOLLKYLjJuXea1gmPPXvwfaNTpsm0P2ROhVhx7bOqky9RAlJqlp+Z3UV/PmnMidGzDmFiMpK6JlPSjK05LyAap1++WSCcaNh0SQjMSitd95Jhnm9DtBF9JBX3QpIUSK/l9uMk0IXPxsplSfGEEY+YTTXHNWeSOuYpJ4i3ZDTABO77dTHdBCFjP8BLw9h9xVFGd373tCzGtZJb36A2SAZyrO0Icmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5JiDH8eAcYjgcrjsbsX7whOu9DhoYFpXwJVQ+CN319M=;
 b=m9UPtk+t5csGbLCvCIggmCep/TuaKihR3EqtgzOYj+lmAyV6fVffiC8H7bTVWBoF2/ICY7/afb7TbIjM2u4TjTPEYvUv4yhNE6LvqhK2hIOEGw39vJwT0D1jHO+TwX2NsDSlu1GtyColOC7fmh2XYSZS7WKwm1rbzcKkMHStVTLbTtW7yCI7NAgCdJ+Tf1ynYRSuLjchp6X1GlucWH/2zg0Z80SOWVvhjM3E1IuodFPJIZYqNMSRcDVMB0FEPcjDgPqGV+mq5SRn+YGRWfHnp+P6IZW+rKCbIUeKCjUKDR993KVQlLnFya6lj0a2883Id7/y3GJOjLoW4Gr++7Fi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
 <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
 <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31dc3429-b1f4-85ab-968d-c9054b77ac4f@suse.com>
Date: Tue, 28 Sep 2021 10:26:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fe78d5e-ed11-480e-c2c3-08d98259a6b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040CD06CFFF939E357CFECEB3A89@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7DG5NmHmRqshC7kyBYkCOmvPJnILA8Rb7incYY+d+k+AiQ+VRQ8f0GGo/5b1mCJsk6L21eO6OSFcmNbs9NRWPAYRP03+uvKDIyLrnrNRHrhRI05kz9u9hnJ2bRSfN1fO7IictM6jwlwd20ljgTktAPPIwtL7s0louq77KZAEYzyrxSwJzB2u/cqf17c4DISWZcezr79v/TSMUCDd6dDUYHNbf5OfE8oMkfVt3Jas8M29bHtphgiTQFcEglqUD+ctcxklSxEW/aKEtTR44KNACirgF9XneE3S3pS5WP/1ug04BDedyL1i3NjrQmkj9gHVQl4IhB7JlAr4sUcx7bFF/c4RGXLqNu2bh7TELNad8ZXg5DmNsxTrtp1w3304F5VbSTQAleuKN/1QQq0qbCewcEaqYJR1+hj78KiSeBCq8enqQdoWU0sTCCSWvRLocm1nHkvyIww5stV+3DSBByhTxQSTQbVUGCoii+Oj147TK8d5XFXx0t8M/rdHhgaa/MvxNVRXHzFoP5gY2IyDq+vHIry2Yy8+pJhvkhXXr5QKd2MjRvECkSp+Vp3N3epNwgBUnjeWo0lgUU9cJ1x6tsGtPn/QzFsvD6nfl1936aLnvuZ0dEJov26RXv2gskWf9Cn7BsTbRxuNn9+4BWEtCKrBnQi7Nkvx/fDgKDilzn9pIz9Qoj4XVwq7aKLL/HSGCRtsq+ABkUCVOH+zDdYSQpBWKnSUCWlEGxoU5kkx4XwnggH9TUtoKZDaNNqZ+oyiF3Iv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66476007)(6486002)(956004)(2616005)(7416002)(66946007)(186003)(8936002)(53546011)(2906002)(26005)(8676002)(38100700002)(66556008)(31696002)(31686004)(36756003)(4326008)(6916009)(54906003)(86362001)(16576012)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZ3cnRHTmlRLzdoZGdnY3NlRzJwaGN5VjNRU2RBU0NkL3l5SlJzczYwRDVJ?=
 =?utf-8?B?WkRsN0JWTVJKNStqY1RDbVgwYWpUd0dOWTRnSG10SHdBeGpFY1FrR09KLytC?=
 =?utf-8?B?S21vRGc0YmZJQ1VmT2VlbDBjUmNoSXNydXRKVm11R0oxVGVodzY2c1VxRnNP?=
 =?utf-8?B?TTRkd0FnRXpIeStuRzVUL0NTRmh6ZnliMEVkT0RxNlhlbTNONE45aTJLOFoy?=
 =?utf-8?B?d0xrOEQ4cEhSbkVkZ0hvb2F0MkJFdnhnbklrYnQzQnJac3NzNjRreE9CbWhM?=
 =?utf-8?B?R2gyYkIzT2xDdkdWOCtxc0NqNUhFbUl2UE5oYTcwYUtkNEdUS1h4MTkxVTR4?=
 =?utf-8?B?MU9vbmx5TUQyTFRpcHNaOHVTTUlRbHNjTVNueTIzM2poUXV0R2wvNzcyZURS?=
 =?utf-8?B?R3luQ2J0OFlCcmZoK1FCMDZUbVRnZzNoVU1tcC9YS2Q5bmVyMFBFc2lFK21t?=
 =?utf-8?B?Q3R3S1RXZElXOVRzTjRoZ1VQVE5HbjRpaWhnY1MyZFE0NW1BNkhVcE02ZkRS?=
 =?utf-8?B?Qi9rY05obXA0SG5vN0NMYlhuWFduRy9HeXk3N3AyMFRrV0pSMFZoVlVoYytB?=
 =?utf-8?B?R0MxZWhTV3pUNXpkbWUxRGtmMUZaZmxIVVc4QlZlcnZwaDZNaXNBRUhpYVJC?=
 =?utf-8?B?Z3FrbEJKR3Q0UTFNRS81cGhpV2hvQ3UvRkRvUmpPek9CaGoySWxWZ20wYjlH?=
 =?utf-8?B?dmRTdzhMWUo1Y1lLQytPcFI4SDRsSUZpTjZKNjhwZDUyUUZ5YlpLZVNXMDlh?=
 =?utf-8?B?WmVRU1REWjVyMktIbTRRMXhjWlBkMVZnYW11Ykd0WHdYcWppNHB0WERwd00v?=
 =?utf-8?B?VGZscGtzVGxTdThDYjdydm5iSkJERWU2ZmlsU3JNUHVDRk1wWnZaWWZrZ0RU?=
 =?utf-8?B?cEhvK2VzVmkvOEsycEdxWTVrKzlvanJyREx0S3FhZCtjL1VUZ0EzZW5PeEZO?=
 =?utf-8?B?ME9VTGJHUlE2UWx3UFpFbU5VTVlqRXVxTUx6bGFhelZVbGJvTHZmWTFFbDBs?=
 =?utf-8?B?YjdKV1g5SGhVZzh0ay9mUGVaL3NKdnd6azcyaExKdm02NW1WaEJTd3picXVk?=
 =?utf-8?B?amdOZlBmclB4RkhGUkFLL1h3VFI1Wk1ac2xzZFFoL1ZJS1RDT0RYNDFIMGV3?=
 =?utf-8?B?SDAzYnpLOENUdVE5aWQrbklQNGJlL3FHd1BnUTFuV3laS2dxU3pQS1dRcmZp?=
 =?utf-8?B?WllSaEVsZ1JwTlJUSFh3djlkVFl3WlAxM3lyS28zSUw0RW4yNlhBWFkxNEVa?=
 =?utf-8?B?SFFxQVIxUWx1R2cxYWt6MkgxNEltUWZ2SGlIUU1WYzEvZVhIcjFoRXhMNmRn?=
 =?utf-8?B?VmtkbTdRU0FMTU5qTUJlRjRudzJhQlhPbUVoVkxRcG9rSHROV2NaNytHeVJH?=
 =?utf-8?B?VytObjVyUitvZy9KUUQrVlZ2M29JWnphOGxyMW41UDNNUUQvWHMvbzRkNmFD?=
 =?utf-8?B?aVNnR05NMi9sODhwWkJORGlMcmhQQ0Z1eXFXQ3ByTE1GclZpRUd4b3E2MWha?=
 =?utf-8?B?UlMvVWxmaWZ3MHVIWUg4Q0FqSE50MnpMUzFFNHpZb2wyTGM3bXBQRitUcFBG?=
 =?utf-8?B?Z25BWmcwQXdSU04xSm85ajl2QUhIV1BrcVNDVWovc092ZTlWYjJJRk5TVEVo?=
 =?utf-8?B?dllkamhreENoaFQxcVRrRjUxVXBzaFRxUjhEQVlRMmkzWmVBbXBOWHpYRDVr?=
 =?utf-8?B?dk1hVVZLejBpMXo4dGRNZ1NyV2VOOEdUUUNQS1g1ZmU5UGJXN2RCanVnRk1H?=
 =?utf-8?Q?AHA6T87o1yqdb4a9rdU/Z9bDHhQBdTm6HFKgyC/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe78d5e-ed11-480e-c2c3-08d98259a6b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:26:21.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqjQxbv0qXv4uCIwMAciJuN9ejJTFIrq8KVQWRo9F5XanolwMTs9lfL6wnvqrtN7gbo3KBaoDO7E6ykcKOuK3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 28.09.2021 10:09, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 13:26, Jan Beulich wrote:
>> On 27.09.2021 12:04, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 13:00, Jan Beulich wrote:
>>>> On 27.09.2021 11:35, Oleksandr Andrushchenko wrote:
>>>>> On 27.09.21 12:19, Jan Beulich wrote:
>>>>>> On 27.09.2021 10:45, Oleksandr Andrushchenko wrote:
>>>>>>> On 27.09.21 10:45, Jan Beulich wrote:
>>>>>>>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>>>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>>>>> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>>>>>>>>          *((u8*) &pdev->bus) = bus;
>>>>>>>>>          *((u8*) &pdev->devfn) = devfn;
>>>>>>>>>          pdev->domain = NULL;
>>>>>>>>> +#ifdef CONFIG_ARM
>>>>>>>>> +    pci_to_dev(pdev)->type = DEV_PCI;
>>>>>>>>> +#endif
>>>>>>>> I have to admit that I'm not happy about new CONFIG_<arch> conditionals
>>>>>>>> here. I'd prefer to see this done by a new arch helper, unless there are
>>>>>>>> obstacles I'm overlooking.
>>>>>>> Do you mean something like arch_pci_alloc_pdev(dev)?
>>>>>> I'd recommend against "alloc" in its name; "new" instead maybe?
>>>>> I am fine with arch_pci_new_pdev, but arch prefix points to the fact that
>>>>> this is just an architecture specific part of the pdev allocation rather than
>>>>> actual pdev allocation itself, so with this respect arch_pci_alloc_pdev seems
>>>>> more natural to me.
>>>> The bulk of the function is about populating the just allocated struct.
>>>> There's no arch-specific part of the allocation (so far, leaving aside
>>>> MSI-X), you only want and arch-specific part of the initialization. I
>>>> would agree with "alloc" in the name if further allocation was to
>>>> happen there.
>>> Hm, then arch_pci_init_pdev sounds more reasonable
>> Fine with me.
> 
> Do we want this to be void or returning an error code? If error code is needed,
> then we would also need a roll-back function, e.g. arch_pci_free_pdev or
> arch_pci_release_pdev or arch_pci_fini_pdev or something, so it can be used in
> case of error or in free_pdev function.

I'd start with void and make it return an error (and deal with necessary
cleanup) only once a need arises.

Jan


