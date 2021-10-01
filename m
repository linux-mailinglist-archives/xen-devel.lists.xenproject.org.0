Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD741E8DA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 10:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200474.354994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDea-0004I5-Pg; Fri, 01 Oct 2021 08:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200474.354994; Fri, 01 Oct 2021 08:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDea-0004GH-MW; Fri, 01 Oct 2021 08:12:24 +0000
Received: by outflank-mailman (input) for mailman id 200474;
 Fri, 01 Oct 2021 08:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWDeZ-0004GB-SI
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 08:12:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4861ad23-6d47-41d9-903f-9d326632f5eb;
 Fri, 01 Oct 2021 08:12:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-dWZp93euOMCJ2u3leiZl3w-1; Fri, 01 Oct 2021 10:12:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 1 Oct
 2021 08:12:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 08:12:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0072.eurprd05.prod.outlook.com (2603:10a6:20b:56::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 08:12:16 +0000
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
X-Inumbo-ID: 4861ad23-6d47-41d9-903f-9d326632f5eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633075941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjTFJmy1tiJaHbXpmCxP7LXYNpizK2SLCaAHIzeMneY=;
	b=YfS+jEMZPmdQH8MpO/LfEHgkTkD1zqoBHOIfpb1ZzfmdUs9meT2a6awdATNbVlIJt/HlMm
	YYHWZfikdRSF7o8L2xXHjYuCLmFCGOyWfKDjK0dySHGUIJEFdwJ+q9nN5kIRT8aRH8aduY
	zXQnnZajQIDqnNT452H19emuGR7hyqQ=
X-MC-Unique: dWZp93euOMCJ2u3leiZl3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqexgPUOadpc4sGJZEvIRdTaZC3rQiN+/COxMEclxLFgK6LwWawWmNCZcvNpVeOHgNyi0Sl7NKSpf4G26kcKM/JVM4CealAWGKV/KAdXsMdbbR9lsEjNTQEZgXP+m9MurCSKBuI7PLGERaeg4fAdS9r6+hzjUOD6p3evR8x9gjNpLoVnuPqyZXwngPny673qvSIRpEgm4M8UA+xU2ZmfZ/yJ0v0Qa3ie3PVa8z0n2UwEFm+ghh1EOZwtDiflmKt0/VoNY1WZUndWpi6XitlLpd1OvArIZRURMUypm9pIgAU6g1zjLd18Xs4Zf7/jr6uFqD+S9r0F6VPE8bj52R93cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjTFJmy1tiJaHbXpmCxP7LXYNpizK2SLCaAHIzeMneY=;
 b=bkovvuayGma+YY2AijwnnqSylmL2rc1yQ+snai0FMUXABTDOeIlh1Jx8AbAQp/m4Q+dDYuDB+1H/UUrhhwve2OW2o+JwhheorAImQyWyEJ1fqi9e8T9SFqiTP9gI9UIIj+JoL4MPfmwSSQZ08gEmSqQYr/xyheYrQIcWZCiPe+sZpub4KAqiPvqOUY2zU++uSNOX585wI/f/9T5o0yj4Uw1Cy2rDtKEYLjeoIhzUcYqIOmILs6xw01yNENBD4T3EqSJr6INShFt3xycX7x6DZCiyz+JxeoNQvUVED3JPQq0bzy6F0y4l0B6512tCXSnmDnWBDHEhZkiNj6s2B8QMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
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
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
 <68a608f5-4159-5734-4c08-5a70ae9d3ff4@epam.com>
 <062c2801-26be-ef3b-71d1-70c598705b94@suse.com>
 <5a8d1ad1-c10d-16ea-4ab9-5c0e1600b3b2@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <707ebe0d-24c0-80cd-672e-0996eeb27583@suse.com>
Date: Fri, 1 Oct 2021 10:12:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5a8d1ad1-c10d-16ea-4ab9-5c0e1600b3b2@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0072.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b105d40e-644d-4fb2-2861-08d984b32f43
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360BDACBE9B57AC81A62A13B3AB9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lwo9nyHh/HI4+z7vd0NBCX5lx2cgXItFePqCUo4Y48Cbr93Ik2hNqBkTyusDYMv/bkciq1bqWdKxuo59UBygqsN9Hf9SE2HEIMkXOtw6IwqqN5QGjPG4XwgTtJEYakiTigrLa20hJ5X3how1VHxI8i6khonMz6by0RvLCpdZc1eDKfL4tDDZBH+2hjjA/m44nuYmEM5zO6JrK4JYqhUzljvHP4Q2E3l97T7/N/b3q2ks8wlYWjQF5A+VGoeflpuUSV/qcJRyvIzHP5Igjf5jwRlptdkrV86Y3/Q7tOhy4DlZQOgDhWHXNa5OA6n54Nmc4zZ9Q4qQ8RrJUJDFUNh9ef946Z8BrZ9F1f0mC+UMBk3sQKp+xxRO0M1ccoTwXHfqRilR1KavjZmbCOgO3qRS0dmgaUdmVOB5BBu7y5vJ/S6lh3PXNtUCgWRuxidQo1ozzxd0IKcJP2vtdJ+xapbmizwNDCROujD1HmywQXff7cW0RZ3ngfqtXOemHAZDwXHiJ82ZdDD+7UtlBjUaRvhN4qpAXpzyMqHcY4jXcwe/IhrsNdv9wd98WVNqmsxJ26IcyDu3wW8HerUKIysU2Cc42cqVSjMdHFvSYReQMEy6Upwn2hYOVYKPxtjJdfpGLrwrG9O9qrnGvW4yvsjfzjVUk/25uphWA8FMzIdjRvQN5W7GhhWfc3ency5LBZ323NxnukCL2i+Z6TSBRgaVI3pb8Im20NYWzKCp6AX9PaMorxDFFbRthfBBgEttOtfKfc0R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(83380400001)(7416002)(54906003)(38100700002)(316002)(86362001)(31696002)(6486002)(16576012)(66946007)(26005)(66556008)(66476007)(5660300002)(956004)(36756003)(2616005)(2906002)(508600001)(4326008)(31686004)(186003)(8676002)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkpPVzQzUVczNGo1aUpzUnNpQUFLR3dkTHNjcDVEMWxxbUxubHVUcXhSVE93?=
 =?utf-8?B?ekNyYS9xbU1HZ1R5cHdCdEpjZWRSNmJaSXFpalp2aG8wck9LcDg3ZXpIR2lY?=
 =?utf-8?B?bWQ1VEhsaWZTeGk3MEVhTFNTdjRmWHZrdERhaWYyZ2lUeDVtQ1F6MGZYL1Jy?=
 =?utf-8?B?Tm5GWk81VW5OVmtMSHdzQmVmRy9hUE1nTEJvclBCSEd3dVRVZGNXa3NFRU5Q?=
 =?utf-8?B?bVJIdlhDUlVmUFZ2SXhkMWoxUUE3Z2M2RVliUmp3NW1oQ2dVakViaVNUd25i?=
 =?utf-8?B?VzEzam5UZ3UyZlZIMzh6aEJrZTRDamNqTXIraDJCZXFZVnNEZU1PSGpOZ0FZ?=
 =?utf-8?B?T3hxRElraXhIS1pjWXRucHd4NThJMXRPQVBqL2hqd3JJT05GdWxhVFQ2UzBx?=
 =?utf-8?B?TkF1V0ZFc2VYRi82VTF3S3NqRXlBWTNxUENlb2U4cEd3dEpnT200UG4rVVRS?=
 =?utf-8?B?cWUyaEVxaEFXZVBxZ1c3ZDJIQjRsK210N2MzREl4TlE1Q1lyWWZzTDhQRkZW?=
 =?utf-8?B?SlRpN04vdmtmR1FyYmlUcnpsWUlhV2dYV2didG9iMTcydFBwRDdHVm1Yd0Ja?=
 =?utf-8?B?b3pHeHFwWklsbG9GWURDZVExU0dBQ3RvSStydFlkYjJCcHpZMUVaUEtuQzlR?=
 =?utf-8?B?VFo3M2ZOS01NNTdrZ2tRMVlRWGZaQXJxNXEzVEpXZGJEMFdYYkh4SkFNY3kz?=
 =?utf-8?B?b1k0aDlKSnlkWVZGVWJDWUUvWXhHL29rYmIzZkg3eWxvRXFpU0NGVlJzZHBK?=
 =?utf-8?B?cVAyT0dXVU1MS0h1dzVnMDBYRm1WdVNlQ2pVY1JwYUJQUmlrRDlVVWxIMFht?=
 =?utf-8?B?L0lQRWIzbVRzNVRpVXY3R09ya1pnL08xcGlGZ2dlZGllNzJ1WlJZL1BxS25u?=
 =?utf-8?B?cjJrTHNETjhISFA5ekVudzJvM3RPam9TTC8rdHZqSHNPZVRhQWE3ODlpNUJo?=
 =?utf-8?B?Z2ZHdlE5TjhMZEduZ2Y4R3l4THJvQXcva1pyMFhGL0x2WFYwcnZRMDU5c3la?=
 =?utf-8?B?RDgzLys0VDJUc01NVmZ3OW91SHBqbWNISVAyTUU4YXEvQnhrTTAxbjJqZTBZ?=
 =?utf-8?B?VlN0V1I4dGErYjlxOThpRUhsYTMzSXBVQXFLOWx1bzFGWm5BVDk1ZnJIZERh?=
 =?utf-8?B?cjdKbmh6MWxuN05SbDgzQStib2I2RFkyYkRiTVYvd3dzdGNML2pJQWZhVXFM?=
 =?utf-8?B?eVZKUnIxM0RBdi9XRGxlZEhyL3lPRlg4b0lwNlR4REpqV1RZUThITjN4dkZH?=
 =?utf-8?B?UkZYRGppekdVWTl3Q01xYXFJM3MrZnRZNURTMzBLNWpqcFUzSWFSU1B0dXNt?=
 =?utf-8?B?VmFjbDArMGFYeXM1V3FxdHVZSzJjZWtrYTdHQzc1aXVNdGVpOE9rSUg0cDQy?=
 =?utf-8?B?YXFJTFZlcXJXVlVLYXBWZVgzcWlUVVYzM0R6WkthNXc1Uk9FREhlaklsVmEz?=
 =?utf-8?B?TjIxekJvUUp1RFhvaUxsa1RLcnZ2RGlEWXhOc1FTamUwUG5NdFkxZ09EQVk0?=
 =?utf-8?B?bVdTQm5KaE5BY3ZNRFFEZGNjVlR6SnJ5cXVuY1AzNzBvaEMwa1F3cXYrRXE5?=
 =?utf-8?B?Y1BNK3djTzFlR2toTGxxM3FCbFZ1VzlvZzQ0VXN2SENIY3JERGpJVUlxYS9y?=
 =?utf-8?B?QWZKSll2NnRvTlBTYWtxQjNVN25FWEU4MlZxWTlGcEV3OFduUjJIQXlmNGlR?=
 =?utf-8?B?QU1GT2IvNVJHdjY3TVcrUGdxTEptVDF4YWZicFZKMFFwZ1IwOWNWREpkWXN4?=
 =?utf-8?Q?cc8UBUdSDyMs1l8T6lwwDTYMdWIsRebuw+VtpX0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b105d40e-644d-4fb2-2861-08d984b32f43
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 08:12:17.7528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq06HKiEleevsS0Qk5fLbd60pvgyf4PxTaVLFWirISjmw/ZfErkw3ySAY7vndyKI3djnG4LfwiaOEfduB0CfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 01.10.2021 09:57, Oleksandr Andrushchenko wrote:
> 
> 
> On 01.10.21 10:42, Jan Beulich wrote:
>> On 30.09.2021 18:57, Oleksandr Andrushchenko wrote:
>>> [snip]
>>>
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
>>>>> +    pcidevs_unlock();
>>>> As per the comments on the earlier patch, locking as well as placement
>>>> may need reconsidering.
>>> I was thinking about the locking happening here.
>>> So, there are 4 sources where we need to manipulate d->vdev_list:
>>> 1. XEN_DOMCTL_assign_device
>>> 2. XEN_DOMCTL_test_assign_device
>>> 3. XEN_DOMCTL_deassign_device
>>> 4. MMIO handlers
>>> 5. Do I miss others?
>>>
>>> The first three already use pcidevs_{lock|unlock} and there it seems
>>> to be ok as those get called when PCI devices are discovered by Dom0
>>> and during guest domain creation. So, this is assumed not to happen
>>> frequently and can be accepted wrt global locking.
>>>
>>> What is more important is the fourth case, where in order to redirect
>>> configuration space access from virtual SBDF to physical SBDF we need
>>> to traverse the d->vdev_list each time the guest accesses PCI configuration
>>> space. This means that with each such access we take a BIG PCI lock...
>>>
>>> That being said, I think that we may want having a dedicated per-domain
>>> lock for d->vdev_list handling, e.g. d->vdev_lock.
>>> At the same time we may also consider that even for guests it is acceptable
>>> to use pcidevs_{lock|unlock} as this will not affect PCI memory space access
>>> and only has influence during device setup.
>>>
>>> I would love to hear your opinion on this
>> I've voiced my opinion already: Using the global lock really is an
>> abuse, which would require good justification. Hence unless there's
>> anything speaking against a per-domain lock, that's imo the only
>> suitable route to go. Nesting rules with the global lock may want
>> explicitly spelling out.
> I do understand your concern here and also support the idea that
> the less we wait for locks the better. Nevertheless, even if I introduce
> d->vdev_lock, which will obviously help MMIO traps, the rest will remain
> under pcidevs_{lock|unlock}, e.g. XEN_DOMCTL_assign_device,
> XEN_DOMCTL_test_assign_device and XEN_DOMCTL_deassign_device
> and the underlying code like vpci_{assign|deassign}_device in my case

Well, it's entirely usual that certain operations require more than one
lock.

> Anyways, I'll implement a per-domain d->vdev_lock

Thanks.

Jan


