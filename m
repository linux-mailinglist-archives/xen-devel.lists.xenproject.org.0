Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5341952C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 15:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196875.349762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqmJ-0002Dz-11; Mon, 27 Sep 2021 13:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196875.349762; Mon, 27 Sep 2021 13:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqmI-0002BO-TV; Mon, 27 Sep 2021 13:34:42 +0000
Received: by outflank-mailman (input) for mailman id 196875;
 Mon, 27 Sep 2021 13:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUqmH-0002Az-9j
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 13:34:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9bcd40c-1f97-11ec-bc45-12813bfff9fa;
 Mon, 27 Sep 2021 13:34:39 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-SezIbczOMeygycLb4R9raA-1;
 Mon, 27 Sep 2021 15:34:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 13:34:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:34:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0075.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 13:34:34 +0000
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
X-Inumbo-ID: a9bcd40c-1f97-11ec-bc45-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632749678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBkKeAyOsdBo8BLeLFIlpGAfBFrCok3ULzRD7lKMQ3k=;
	b=a5dVm5TFDYqxZCz8xYRC6dV6KRwXBazmA5qvNvCNOHzs5N4Kgxsq43GzKOiWsuQP0KpMVw
	HxJe8/iVjlRkDBYWZlf1vAtLdiygeCtaiO9QJYpPeQxDslifAKHEBI30gKRpQc1H2VbAUE
	Uqc6hBkVFBMZx+S7qL/Kunov0B/fxFY=
X-MC-Unique: SezIbczOMeygycLb4R9raA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=digkVlnaD6pwyuHBlLR1Gs6X17Li2NKWmaOktEuUOyBBeWLUMID0Lhc1rFRQRCDFlTsvkgzQoZ0SeBAVMC3KrqzP7I5nuIZmQCllLaRoQi1jD2j302N5f+krjVGSYRMgfM2hAtaDq/TFBhC6KFbZF8kuf5qqgmNujHfFgZKI2qk90NWW2/kTYRUfxTyUhKPtvqOYHSqpniY2FdHmewmVFnEf3GyT1rx30b9wYmODvMsBMlXGhQNjVrVU/R8q+8zEz48/1dv1I6iId0/7gCtqJxYRkXG2vQQckQFGfM7J7zYeJhb8Lh7COCh4XdKoUCWEvT+Zwe5+iPfD7quw+H57ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MBkKeAyOsdBo8BLeLFIlpGAfBFrCok3ULzRD7lKMQ3k=;
 b=Jsx0zjggaefKkyAsQBm+dYQPZGp+INSE/D4llL/NIwvz2LHJ3dVhF257YiHB33J4d7EfxubarrPeyrWYyh3KZTVJDw2s34wlaTipcOAR+kK1Y9Qah3n7YRWlx8MrRpSdw37kuCaztfFeSdlnhAcvbwCbY3+oQG5ntTtOa0nACPATKsM4xT5+/Yv2osn7NUlhNWdVPBe3eQQbVqR65gpwHuJtuqilDsdUAB9OzT/yZ9Fjp8rRlPnl4lw2y+n8Ys6WnQjQR+qi6XGQwEPxjhFUFo0bGE8S19I0heykxm12RjIjAg+BT5XcQSBp1w7EP5fAym546HVow14paDTzNCdbBA==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
Date: Mon, 27 Sep 2021 15:34:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0075.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99bceb7b-7b13-46b7-9a70-08d981bb8bc9
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958B3DD62C665BD57C8F1E8B3A79@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6AKxlIx35nAaOF2btANBJy5j5pKVLtth+hSpao/xShJmSSGbbu1mTco4fjZlXfn8s9T2TFyvNg6mLLDDys6LlK5vFP3chL8Yd/6t3pYnaxZnrnLlJoEg971e2Ffrmv+ltCyF40IKSR5Hi4IQE8N9C8o8hXkEW2eT232lEf3v+NIq/Bomj1/2IyyfXLJJZAO2d2DSRY43r3efoQUDYfnn7D9hyXtHWLmZ2+u2vcsKE4EZUBCoEVXyc/K3s58RiW+9Ebw+2Pb3IcE1nXr7CfxeyW23hm+aJZhIPtr9jI3JUGTZamxZnevptVgQuk8Xejo9PgkIsxpfqi+qU+cm/4+lgJV36fzJOuVp2nEiAwE4QSj6pV7xQxpxiaLFksxuji0ZWhOHjUox+lUw7+c0IXI02gqCBsUk0u6F5rrSv/d2Md5ttLL3LvN0blv7+jf0kAR6irzNuqyiOvDOjdyq+sHSKi+vH09E5wJWil4FNTF9e0xCoqXoCrnAK6GdDXwHyzrwkbT34Ey5sVZJwxsiI/cHTK9IO5lYFZ5RYxnl2kevP7AArXeh0FZnMVr4fhOzKWKoXgrasEBqvQ5PECNd+TCwXHN374/IflWjbiYbqgU2Gtkmq+Lb4SazdAesLERVSukCmqTB0Phw9BYaSR+INRQyTKOg9st5NtExvu+VIy5VS+q4CPW+n4O/A0sOl1opQq9P1QeRw2SZIV91JA3nXa+SG0OXnmRbiqB89o7qIO1zbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(66946007)(2616005)(31686004)(316002)(5660300002)(4326008)(36756003)(2906002)(66476007)(956004)(66556008)(508600001)(8676002)(54906003)(83380400001)(26005)(31696002)(8936002)(7416002)(6666004)(6916009)(86362001)(186003)(53546011)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHRjVG94MnNWQWlmOFVvS0huMEtQVHUwTk44TkhTM2NxRG11UzZkb1JQV3ow?=
 =?utf-8?B?RGJaQ0Nad2dod3l0RUZaMWhadXZGWHVZNDFaVTNZTjlIQVJaTStFaE4xZXZF?=
 =?utf-8?B?eHMwT1plVldZdkJZb21MVVFweElyRm9MbUZlSlZHNHYzbXp1RDQzWFFQM1BR?=
 =?utf-8?B?cUViVnEvTW16TWlCaG5RRzlkMzhUOHk0WERnRk0wbG5YYjhQbkxKa2plbU9H?=
 =?utf-8?B?OGtsM1BtVlJwSVRJWTZVOGFuWXV5VTRRcnQ0T3duMEVWV2Vjb2NDYTVSeCtj?=
 =?utf-8?B?MFlYMy8zbytEbVA1aHZwUE8wazBtZzlGd0dRSVdiYytSM3BxUFpEU2o3clRj?=
 =?utf-8?B?VGpTdTd1b1FCWEU5aHI3UCtSaWFtWGQ1RVJYSnVzMEkza0NQY3p2L3E5RUtO?=
 =?utf-8?B?TVFJQTcxbmtEYVlZVnRkWFl2RmNnTFpYb252dS9VVHcrTXdMY3l3TGlTY2k2?=
 =?utf-8?B?SzZpeTAxejB5TWJrbUpOaHBXUGtHeWRsSWxVZnZ0cnlEb3RjYTArU0lCOXJh?=
 =?utf-8?B?Y2xiZzNpU0dmZmRmUTF5WEdlNFZ0akc4djFqREFNRWcrV1RGZXV6ZWNMNG9V?=
 =?utf-8?B?UjNqS0htaXMydzNCZ2NMeU02aGo4UmhoU3R2UHUwMkl2eXFETk5PUXlBWEtv?=
 =?utf-8?B?Z25mMEFlb3JpSHRCNjhQd253ZzE0L1BraGhHWSt3NkQzSFoxaW9lRFpjSTgr?=
 =?utf-8?B?eHJ4VnZhNy9NYkg1QTRrRnU1OVJzcEJSbHNOS3NGNU1ZOEZOUlBNMGFKL1BG?=
 =?utf-8?B?cjJqL2doVlFkTm5mY3hCcGl4cklIZDFtc0RxMlRRL3A1eTgyWm9CU08zaVls?=
 =?utf-8?B?REZtZTZaMTdhSjdwUHRUcW0yTCtqZTlITGppSWE1eFNkSHBKNDhqME53TWZv?=
 =?utf-8?B?OXpZRDlmaXdybXBCYXF2bTFTKzNnWW45eEF0ckJzN0kvZ2RlcWQzT2pLUmVj?=
 =?utf-8?B?RVk4SkZVMFVCY3lVNEJzaWxmZ1RYLzdZQnBUNmtrT0FCVFZzdzV2TUE3MFJs?=
 =?utf-8?B?NWIyNVRidTJhS25FWVpoVlFtNkpoSXoxMUk1QXViaGdOZThqcUIyOVd5Z1pG?=
 =?utf-8?B?TW9BdndXUXRDbmZ2QmJLNHZRRHpQY0V6K3p2QUtXN3NTSndvVjMyZDFYVE1P?=
 =?utf-8?B?NjUxeWxndHp3OHhUaXlGdDNmdHZGZ2xQWEs1WTNLUElNR0h5WnFZbjkzQklV?=
 =?utf-8?B?cG5WZ20yd01ld0drbk5idVNsRGxReGRSNmhWNTl0YXVvVzh3bFltZE5MM3hp?=
 =?utf-8?B?VTNuM2JzWWRNRVVOY1FPZ25jTkp5QSthSHZBMzNlbHZGRnVFS3h4SmJENHNi?=
 =?utf-8?B?SDdXd21DSTVTZ3A3a1dtSnB5WFBBWitYYkhpSHdaNTdwTWpVcG9sQnhrM09H?=
 =?utf-8?B?UG5KZXpQMlROSjNKOXZlNkdEUkxHbkVHa3Z0aDdQVEJzdUtpS0dSQVY2dDIy?=
 =?utf-8?B?MTYvZVF2NTVmczVIL1UrTE1jSjV3R0RMNzJYOVl0bnFVVldQOXdUM09EUUpm?=
 =?utf-8?B?VWZrSGVpcmpKeDJ3QmFqVzlFbUFpbjZTd1JEWG03SjlzQkNDMm1zSWkweVVI?=
 =?utf-8?B?U2FOS1AvQmdUTzNQb0J4SlU1T0crREFKUklXaW44bU1jWmZSSGU3RFl3MVBw?=
 =?utf-8?B?aFdMVkhpODFxcEpPdHkxbU5YSmRsemEzb2sydloxdDVUUjNxNEdpdDZIcFUw?=
 =?utf-8?B?K1ZjcHdhWWxvZ0piRXE0VlpJdGZJTFZEQWFSVlAwNnBwYVpHcENRcmFPK1Fv?=
 =?utf-8?Q?rGloOpvwBfRIRqdel+91nYpVpOSXvV0AQnqx7se?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bceb7b-7b13-46b7-9a70-08d981bb8bc9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 13:34:35.5477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB2NQup/cREjkhriNdXPf/fDLSf27nQifFMMd9nJk7LbNr+sfQoVNNHuUDOvehWlXl2oLp7Mf5N131QlmHLARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 27.09.2021 14:08, Oleksandr Andrushchenko wrote:
> On 27.09.21 14:31, Jan Beulich wrote:
>> On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -890,6 +890,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>>       return 0;
>>>   }
>>>   
>>> +/*
>>> + * Find the physical device which is mapped to the virtual device
>>> + * and translate virtual SBDF to the physical one.
>>> + */
>>> +bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf)
>> Why struct vcpu, when you only need ...
>>
>>> +{
>>> +    struct domain *d = v->domain;
>> ... this? It's also not really logical for this function to take a
>> struct vcpu, as the translation should be uniform within a domain.
> Agree, struct domain is just enough
>>
>> Also - const please (as said elsewhere before, ideally wherever possible
>> and sensible).
> Ok
>>
>>> +    struct vpci_dev *vdev;
>>> +    bool found = false;
>>> +
>>> +    pcidevs_lock();
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +    {
>>> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
>>> +        {
>>> +            /* Replace virtual SBDF with the physical one. */
>>> +            *sbdf = vdev->pdev->sbdf;
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>> For a DomU with just one or at most a couple of devices, such a brute
>> force lookup may be fine. What about Dom0 though? The physical topology
>> gets split at the segment level, so maybe this would by a reasonable
>> granularity here as well?
> 
> Not sure I am following why topology matters here. We are just trying to
> match one SBDF (as seen by the guest) to other SBDF (physical,
> as seen by Dom0), so we can proxy DomU's configuration space access
> to the proper device in Dom0.

Topology here matters only in so far as I've suggested to have separate
lists per segment, to reduce look times. Other methods of avoiding a
fully linear search are of course possible as well.

>>> +    pcidevs_unlock();
>>> +    return found;
>> Nit: Blank line please ahead of the main "return" of a function.
> Sure
>>
>>> +}
>>> +
>>>   /* Caller should hold the pcidevs_lock */
>>>   static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>>>                              uint8_t devfn)
>> Seeing this function in context (which patch 2 adds without any #ifdef
>> around it afaics),
> 
> I believe you are talking about vpci_deassign_device here
> vpci_{assign|deassign}_device seem to be not called on x86 PVH as of now,
> this is true.
> 
>>   will this new function needlessly be built on x86 as
>> well?
> 
> It will at the moment. But in order to avoid ifdefery I would like
> to still implement it as an empty function for x86.
> 
>>   (I didn't look at other intermediate patches yet, so please
>> forgive if I've missed the addition of an #ifdef.)
> 
> So, I can gate this with HAS_VPCI_GUEST_SUPPORT in patch 2
> (HAS_VPCI_GUEST_SUPPORT is introduced in patch 4, so I'll move it to 2)
> Does this sound good?

Yes.

Jan


