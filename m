Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FE41956D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 15:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196890.349783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUr2M-0005VI-QY; Mon, 27 Sep 2021 13:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196890.349783; Mon, 27 Sep 2021 13:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUr2M-0005Sn-NF; Mon, 27 Sep 2021 13:51:18 +0000
Received: by outflank-mailman (input) for mailman id 196890;
 Mon, 27 Sep 2021 13:51:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUr2L-0005Sh-QN
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 13:51:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a845716c-7828-469a-b96a-de1177f1bb8c;
 Mon, 27 Sep 2021 13:51:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-_HjOz0EHM1afHNvivzdOjw-1; Mon, 27 Sep 2021 15:51:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 13:51:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:51:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Mon, 27 Sep 2021 13:51:11 +0000
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
X-Inumbo-ID: a845716c-7828-469a-b96a-de1177f1bb8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632750675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=650pWNflc7v9BmVAoh8M7oE4XQqDtjRwLgovh2s6xyg=;
	b=aei6EDuoFb3OaimAFTaPgLY0jAcSSTJqyKueK+c5MwDIrBgcjZx/7VloyVxsJqgEnpkDAl
	B1zVfBFzCcnvbgtZvGY0/A2ffY+L6KDCwjoYowJcygC7YtlEf1EOjU1yxpjd5uDcW1AQ4K
	CB417w6NIYQbjNPauFQTvOan1r/4Yvw=
X-MC-Unique: _HjOz0EHM1afHNvivzdOjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K64kJVS5L5vbCSHy3wOP7OXL7/WxmokPGUTnZL4CQ4WJokljym5oPWHGUAcSzrieJIL0LR1Y8wEXDinIbTkf4E1kvqE2xo4dHgkr3I+gzI/czz98gz1TI2oRXDq5PIyk6ZkUQ5m3YBWCpij6l8CTK4wsoAAH6jJ0RvwFB0OovTQuNXCqerXSTWbD52OFcarI6VQiNYjOHxpgl7854M0Co2Em6niIHgOav46kIjktqzwR6z+j+v/JfFOflL2wKtyGlwUWWgYIUs5sHXaJ/a8l0FTOsW4YAUkfaxji1Nv6zuNB6kyEIktXi9jTeA0WGyD3e56rYGCfBsdghlLhW7TR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=650pWNflc7v9BmVAoh8M7oE4XQqDtjRwLgovh2s6xyg=;
 b=To/56KLj4XrD3IZXaGA02wcfq4n/sdLXi/vpXYysiTSl/iyUD8Z2uW7MDoUFhjs0V/QVBi6421gX76RBFL2S8sIiHula2r/4wrMc1MHsjK02Zghxk2jU2g2Ru8dVYpTHM3a09GqXAjrh05Y44Yu4TTWRs/er5VDIDah3vvHNZ83dDKGsxl/LXZMLNc9JKIEjCHsfTn98i7kgCnjECMBQRx/k/Yl1b2Jb54d2EL/9JovgFOIyb0TR1C+MwCO3rDEv6ThPBbmF+BYkOTU8BgDwNPWYbMWH2HfWJ0e+MRO+pJFuUjAI6X/Fa1dZ/YdDvI1e++tjUTjIkZBnPG6MDVS5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
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
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
 <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
 <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
 <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <299f330a-3a99-e87a-d182-762247371e3d@suse.com>
Date: Mon, 27 Sep 2021 15:51:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dcf8030-5861-4014-ee50-08d981bddd9f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304CC09A3D035AEE57775C1B3A79@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iRVin2oAlnarjt16F4WbVF0fN4mSzVmO618DPVKMqCmOdkPTuQ2unu883L3Mj7ovdj84e96v8pZ1+NxwV8EafI+ubBQt15m6CaKZpDd+TuUJqaeFqwNKU23PZQ5vVClEruXlnRISBJv4gRfTivQXMBuc2Ofb/7F+RRdWiWFFFH8nN7wKBhnzRLsViEJCi7w3LYM94PpxoMNm80olVg1sCXeqFTT63IeCZsHbO7EFx2MJ40ZfwcZBgNnXbFMMH7RK1jUPgPTDVx0Sk7XLt2S7q9fFIjiep9WTzrv23HaiJtO50o1n4J7DRu8d5my8eTU/VrkAfU6/wA9oIqjm6lKuUSbvnAIyVr7PpBAG7XSNIW8GG0kLuK+3etGdelC1xbF8c3XnRMo2lX59lSq/PYd91WUj4tbZR68fMDhetuSX3C0jy/GBwyhm531mQuu32W+jLkJTL/A0Y0j2wXTXPloTOkn5eYy081JB1AAd4IGFtXU+qJv8yPXzfS3hsov4XB5sM0V/UXwB2NZvCkVgc4IYm9C8lDd9D9oitDMvFdXDTk9OaUBVkKroBoVxbXnIsNYRTNlrBpd3aS/jEpkUw2ZZELSIKfh4RlNo6zaRUwNkYn9BTAjdbOdu3ZWX/sMUdd0UWuUhxNx9q+ZyGK7pn/hYkheaJch6ANZE5zIoOxPpfVjEpi03ccPRF5MdfGIG+nMfGBBGONi+aeuxYblMjrpJiND/KdiBVAyOzOcUrqsbzhEY7CEw2j3Kli28169xud0G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(2906002)(6916009)(53546011)(26005)(8676002)(8936002)(316002)(16576012)(38100700002)(4326008)(54906003)(86362001)(7416002)(31686004)(2616005)(5660300002)(66556008)(36756003)(66476007)(6486002)(186003)(956004)(508600001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFBQVjV5NDI5UFdCY2k2Rk9mSmxwS1oxRkgzUnRodmJCejN0TWlHV0lFWEl2?=
 =?utf-8?B?MU0zdktPTzVMV0VmL3pDbU1nbmFDdG1nalo0ZE10aUhIbGZycFBwMU1HaGpr?=
 =?utf-8?B?REdpTFFuY3VCNTQycEJ3M1I4dmdLWTd4ZXNoYUVIRU9id1hDU0c4c3RSb1F2?=
 =?utf-8?B?eS9VdzZteld0Y3NjdGhwVVpWa0xJTXl2cUtEclFLaUExQ0prTkNQWnRHcVp2?=
 =?utf-8?B?a2ZWaUdieUNxZVVyVXVjRmRVbGlhMW1mZGhoaHUrWTVoSW9IMW83ZVlYcDcz?=
 =?utf-8?B?OVQxRm9EN3BYL1Bxc1labkdKczMzM0dkaGwwTWFoOGRWbWFnclpSYmdqc2xC?=
 =?utf-8?B?RlFYT29ISVBMN3k0N3dRdkxMTEIvcFFGZ25YaVJYNkVCTnBRT1dURnkvbGgw?=
 =?utf-8?B?UnF4WnRqN1dSTGJCVkN0bXprVzlnSEI3OTVxYVVncjlMYW03RWo4d1Q0STE0?=
 =?utf-8?B?WHBIWEVuUVZ5UFNWM3JNZ3NZY0ZLQXdtQ2tpakZnbk5tZHpUUDJ5TDdQVWoy?=
 =?utf-8?B?ZVBaY243S1d1VzZJczFmNGt2U3g0R05XRll0S2hqcStZQ2VrcHV4aURqYzZO?=
 =?utf-8?B?T0RKcU8zMUpkdmFlOFBYektCTVQ3b3Q3d1pkSlVwUERVQmU5dnA4d08wU0lh?=
 =?utf-8?B?K3JmTFJjclpTY2dUZkNQYjhNYXlHaVV3cVI2aUgvWmIxSzZoeDdQWnF2cGcr?=
 =?utf-8?B?YU43TWNGQkl0bTNLOWpFbWlKRlF4YjZkVTEydU5HNVNVUUp5ZjkvMzVnRUZF?=
 =?utf-8?B?MGl4UkE1WDVuWWFxQ0NFVXMzTElOUDBBNkJhdHBJVDF2UGpRMEloblZ0ZjRa?=
 =?utf-8?B?OWlmR2F3bCtDNkU0K3NOV0lJVTN3WDdQYkZ2U3BtZHd0bGhjM29RUUd0bWJE?=
 =?utf-8?B?cFB1SnNRcVlLNWhLWnd6UUJ0clJrTWlIR2k5VklpaUwybXlPbTNKTDZ1KzhR?=
 =?utf-8?B?K25SOXNmOFVwV0JSeXVUMExkVDFVT01Lek1yczg5bzRYTno3L2VSTGxoTS9R?=
 =?utf-8?B?VUxQTWZud3psL1JweGlzVE85VjRNdmVHb1c5aDNadE1KcDVROEUvWElOMkJU?=
 =?utf-8?B?TXZuMDhtRm9zL0RZRmQ1THpRWmZDdkZtbzVNL0ZvM1dtQW1vZ3FwRGYwTnJv?=
 =?utf-8?B?ZU1NUlp4VGkvS1pWUE5pZEUwVm1OQ1hxUjNiZEVMS3A5VXN4TDBSZUs2K2NJ?=
 =?utf-8?B?eTV2aDk1MStLK09JN0twWDhhcDk3RG9kK2pQS3ROSlR2Ym5XUFNaWkN3WHRr?=
 =?utf-8?B?YnZYekhNRTEybWVkQnJEdVFob3ZjOEtXNzRmNklKckVDU0l0elM3STQxU2tt?=
 =?utf-8?B?eVlNMGx6b08ybFFvU2VIaFdBaEVEUFgreTlLalVDaWdiRzdOdTdzdVljNUVZ?=
 =?utf-8?B?RjZZNVptREVWUnBkMUdzcUE5QngweUNueUxrNkI0RWpvOXYrMndZUENsVG51?=
 =?utf-8?B?ZWdnZC9xYWgwbmtPQ1ZlL3VrYk1HWWVvSUxNby9RMWJtUFgrSEF2RDB1VmNM?=
 =?utf-8?B?c1ptZGxsR3B1K3Exd1hzdTQ1ODREMENIVHVueEE0TFVGZlNIWjYxSGthV1Zn?=
 =?utf-8?B?SzlXbjJtaW1uUjlMOGlZNVlFRHBIeHRjWHVQNWxzNEpIeHQvZnBMQmNSL2N6?=
 =?utf-8?B?RDRUSlRxQ1A0SmFQMW9rTVhQMG5kdUk1TTd1M3dRTnZIamxyd0cyTmZ2b2I4?=
 =?utf-8?B?aUsraThnVVZPS1N5UVhWMVU1N3JkYjV4cHRuSUR2aWtHL2MrMGxkalhuWGdS?=
 =?utf-8?Q?HqQ6lO/NOc3irg+jionqyTE4Lm3qgu1nnHqPtBL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf8030-5861-4014-ee50-08d981bddd9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 13:51:11.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LGQhk/VDynsbg2d7bs1BbO7zU+EAqY4sZxrGuqEG75VKrABaaBFJQw+H88Axw1Cp8q3jFU7XHsCa3kxBKaCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 27.09.2021 15:43, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 16:34, Jan Beulich wrote:
>> On 27.09.2021 14:08, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 14:31, Jan Beulich wrote:
>>>> On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -890,6 +890,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>>>>        return 0;
>>>>>    }
>>>>>    
>>>>> +/*
>>>>> + * Find the physical device which is mapped to the virtual device
>>>>> + * and translate virtual SBDF to the physical one.
>>>>> + */
>>>>> +bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf)
>>>> Why struct vcpu, when you only need ...
>>>>
>>>>> +{
>>>>> +    struct domain *d = v->domain;
>>>> ... this? It's also not really logical for this function to take a
>>>> struct vcpu, as the translation should be uniform within a domain.
>>> Agree, struct domain is just enough
>>>> Also - const please (as said elsewhere before, ideally wherever possible
>>>> and sensible).
>>> Ok
>>>>> +    struct vpci_dev *vdev;
>>>>> +    bool found = false;
>>>>> +
>>>>> +    pcidevs_lock();
>>>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>>>> +    {
>>>>> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
>>>>> +        {
>>>>> +            /* Replace virtual SBDF with the physical one. */
>>>>> +            *sbdf = vdev->pdev->sbdf;
>>>>> +            found = true;
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>> For a DomU with just one or at most a couple of devices, such a brute
>>>> force lookup may be fine. What about Dom0 though? The physical topology
>>>> gets split at the segment level, so maybe this would by a reasonable
>>>> granularity here as well?
>>> Not sure I am following why topology matters here. We are just trying to
>>> match one SBDF (as seen by the guest) to other SBDF (physical,
>>> as seen by Dom0), so we can proxy DomU's configuration space access
>>> to the proper device in Dom0.
>> Topology here matters only in so far as I've suggested to have separate
>> lists per segment, to reduce look times. Other methods of avoiding a
>> fully linear search are of course possible as well.
> 
> Ah, with that that respect then of course. But let's be realistic.
> How many PCI devices are normally passed through to a guest?
> I can assume this is probably less than 10 most of the time.
> By assuming that the number of devices is small I see no profit,
> but unneeded complexity in accounting virtual devices per segment
> and performing the relevant lookup. So, I would go with a single list
> and "brute force lookup" unless it is clearly seen that this needs to be
> optimized.


Just to repeat my initial reply: "For a DomU with just one or at most
a couple of devices, such a brute force lookup may be fine. What about
Dom0 though?" If the code uses the simpler form because it's only
going to be used for DomU, then that's fine for now. But such latent
issues will want recording - e.g. by TODO comments or at the very
least suitable pointing out in the description.

Jan


