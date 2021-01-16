Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586782F8D69
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 14:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69009.123673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0lBU-0003pG-UH; Sat, 16 Jan 2021 13:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69009.123673; Sat, 16 Jan 2021 13:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0lBU-0003nL-Qy; Sat, 16 Jan 2021 13:00:04 +0000
Received: by outflank-mailman (input) for mailman id 69009;
 Sat, 16 Jan 2021 13:00:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mPXe=GT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0lBS-0003Vq-QQ
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 13:00:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 766662d5-aec7-45cb-94dd-977a245572f5;
 Sat, 16 Jan 2021 13:00:00 +0000 (UTC)
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
X-Inumbo-ID: 766662d5-aec7-45cb-94dd-977a245572f5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610801999;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W2ymI1SaaL6s6jS3+wYMhwlDKtEwxtkAb3uMZEbZ490=;
  b=B1NG73jlWJtlzaauYOMJHj6/Od7zu3pvB36ziVQ2T+XGu7nu5jSz2GM5
   /UtcdkuZBj1tOKXNmdtuYsgH95mcY1N5P4BZjqi8WnrznvEnoqwqoR10h
   8VDdz/XDtHhJN9ENaKzloUyFscKt0Gs6ts+yXQg5I5T9fCIdvCbtDFGgy
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I1LurOx7N8a7c8D+yYwgs65hsB07b0KGirET74848BJNbg3FCgX2g3i4vZ+xkmJE67GGH5wxPs
 eGdx7fdN91IqbMdrmkuZGCOH8eLzdaQEPCfG/GnVqXGpRSK4Iu38Czcboj8BWzxF0MgCsj5tH/
 83DQVlSfusF4jADic3mpDbPTc1xyLBvgcNItJBAlqCPp0/qdJ3Jayc2fE2kHGKapPwiqKkci0Z
 m6ofhU5eKfXMiWVxUEtbtTqGdRF7+qDGPMystALx8JRc23jPhzcNc4f7djkTEms32+FsGvKUpq
 z0o=
X-SBRS: 5.2
X-MesageID: 36529673
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,352,1602561600"; 
   d="scan'208";a="36529673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv0lwZKpBNbmzwWF1K3EtfF2TDhnNo+SYzTcvtw7rAt26SU9wOszCnCbxgD091zOyxbTAVGI+c5DJFSymADgue1sXPX/DMntXiPXz+pl8cnE08FTfAzC8U7Y6TRgWEz7dNwSLGZjlC9WIcZAmAJAp2Mhtttack2DTWzjEMS4E+yF4ClxMoQ4f06QOYuYzb9OJg5d7qouRes7sv+Jeq+ebNXWE13aXWspuJAjzuRFcKk0p+0H19AK2gmPy4p6FGVRG3lUY8OllMZLZLzxYrLTIamYwfPo6Sjh+xXMXpIdoPWwq0OaI1oC8YH4zaPdt4wXnt22HFUSMVFr/7d+FAmnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blaOGoBfb/O6TBcvHQcMAnRBplyBdzKvCoZ2u0SIF80=;
 b=RimjqWbgBixMtt+2GkjITIo3pOtpVTWUdRCRgV+BfIm3Q6KDDXfJpGtZowR0UNuyXHKZzTiT7uAvEl2T0iPJrGvEklfCDtyH0lBH9AS5Oqn3Hwiy2f+Zxn678oTMpCiXZ7rXK6dEao6VkufqPEURREmzy8C4yBAs5p3PDAfg0dnpZ5nh6rLMz/WVjU5X/eLpXNkND0vHjWqeg6XRhyPSZgh1fbm80yK5/PxenYTAWx6AMWHei7u9eC3NHmTtbOHOLH2RzKf7JlmzY5elKnW/toOVJakFLv1sjkL6hpYAm6a1yoq7koz8eK7nqoXIaa4t1BuxS0dgM7N2AEAeSZmB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blaOGoBfb/O6TBcvHQcMAnRBplyBdzKvCoZ2u0SIF80=;
 b=vZfUTT0rpLU9R51L81YZqpDbKeOHD/se8pmKMdtoUHp9ghXm7d/cdjkh9mUe6/gHc1JPL+NXAUK8qmumus7uRxVXSZn5fK4Ot2QyImjUcg8kMHSv/LisVpxFgokZQEtSDDfzItRKxCG/p79UeIfpNi+jdP94KnysaiwCjbORzmo=
Subject: Re: IRQ latency measurements in hypervisor
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Dario
 Faggioli <dario.faggioli@suse.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com>
 <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
 <alpine.DEB.2.21.2101151459280.31265@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e6de10aa-9e3d-c889-7deb-c74afd030470@citrix.com>
Date: Sat, 16 Jan 2021 12:59:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <alpine.DEB.2.21.2101151459280.31265@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b35c8b-fdaf-42b8-1e11-08d8ba1e9e80
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5952:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB59524D44C12A08814E58B6A1BAA60@SJ0PR03MB5952.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPQnaxH/XRpEtQV4zyTbmaT4+Bsfbx8emA98b5cRWC7RNf4VcUQuHqmuaTv4AClruXgjuho6DnyHC0jk/3ELgniiXvNEI1J2zAWdtmNPi7lXGVeWoyKqnUW0x3WgJm5L3v5iG283s9YGLGcawDPDkeoZi6wtAHMBLo2CcQ78ZswLN7/mFljslJ20MytRAeCymMNIhH7zLRusMGBQX5MJSM9sqwnaAbxG7JipfVrHIAiLlJatQh0WjaNiXLsnwD+j5lVGEl1vgxuAKlhvSjNEUKoRoTpEbB0cb6hSdzCjFLk6miLqciqxMu4zwIV2VsIdQN6kZASoQyRzkgDY5k4vEuG2KdNjeVlfezP+W9o5WiGZlOEG8zwYDpMWO4QKtdrkSFtVnlQBo0Tdos+r/n85JoxSxmafe+ki99lJhZKjS0e03qtGMBa3mygXU+rk6PgEbGR3PeAnP+hOSdWL1jB3VRGzG9oC/Nqx3MjGKe5hVFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(110136005)(16576012)(316002)(478600001)(54906003)(4326008)(31696002)(83380400001)(86362001)(5660300002)(53546011)(186003)(66946007)(956004)(8936002)(26005)(31686004)(2616005)(6486002)(66556008)(8676002)(36756003)(2906002)(16526019)(66476007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmZXdTVRSXdiZi9ENmhQNk52Z09XRnZ2NjNwS2pCRmNabzBoVkp3T1ZYeUpP?=
 =?utf-8?B?Uzc4THdsc3BXVXJyZ3BVNE95MVI5eldRMWdMcG41bFJ4U2Fud1FkamFXclNK?=
 =?utf-8?B?b0dCTUQrVHZaL2JKNDgxRncxZlN2dnZ4WWRYZ1RhazhGSlllWTdyZFA3VVI3?=
 =?utf-8?B?WXBUdzh6MjhFQkZ2WGhrS2IwRlAvQWIvQWZ4Y05VOUR0ZnJQYXdwTnQweVR1?=
 =?utf-8?B?S3pVZ3NNYnZnbWowZndmL2k5OHVEcFpLV1AvcitvRW1qVXNTVlQrSmpUQkZq?=
 =?utf-8?B?R2xtbDFhOWFOaTB1V2hRK2RVRVQvTWxpT1htcldXaFdSdFdLTXZ4OFhuWVVP?=
 =?utf-8?B?V2lkRVh4Y1Rrb0hGaVNVL2lPQ1JocFNvbDVFVmJ0V1l1SHZheDJnNlJmTXFq?=
 =?utf-8?B?T05hSTdkaGJQUWZObk9yR0RwUERyK0x4aXUwanQrMmE3cXQxWE83emFDb3Y4?=
 =?utf-8?B?b0tQd3F0V3hhTzRVdjNHYzZiUkord2FNZzJ4OCtvRnFVVElDZnBNMC9MTU1t?=
 =?utf-8?B?S1JrMXkyakxiU2xRR0g5bzA5d1VPV1Z2Mlp4M3hhWm4wekVNVTFUeEszNzhK?=
 =?utf-8?B?MkZWbTZXekhBSVh0NzViVU9XeXh1alVHejNWdTM2TFE3ZVNGMzBBbDNlWDNw?=
 =?utf-8?B?RWxqWDQ3b0ZaV2dlMmNpMVRNM3RpRDVCSVFtZlllRHZIeVU1dlZwR1hVK3Rs?=
 =?utf-8?B?Zjd2VmkrbFE3dDFzbG94dzZkaE5CdjZ4Y3RKNlJqczdTUmFoS0dpRjRPUm9C?=
 =?utf-8?B?cGZ3SXZmYjBBakx4aVhwTVd2Q0psK0ErSUF5c0VseURQQkpJYmFacEI5cUN5?=
 =?utf-8?B?SDhCVHROdHdkMkVmczlScGJqQUl2cUNmTURURjV1NFhqNllsMUpReE5VZDJX?=
 =?utf-8?B?aGg2TlBTRmJIK3lKd1dGUHM1L29mUFhUSTMvUDUvVDR5Q0s3UHJVTlpXUjVF?=
 =?utf-8?B?T0ZiaXRSRGVXdHZmWk5TcjIzSWVZOWwyaFl4dzlwbHRTcUlQaDRTS09INE5x?=
 =?utf-8?B?ZDg3ZmdSYml6eFF6TXB0NWx3SmU3YzBqOWxUcFJPMzU1QW41bU9SZ3FYOTl1?=
 =?utf-8?B?YzMwQ3V0ZUtPeXlYSUlWaW1sekFoRHlJOW83QXl2bVJzZ0srMjd5Ylo4dEc2?=
 =?utf-8?B?WHVoSWhaejZvaDhHTHMrbkNUVjNTVUFxenEvY0J4Y09lNkdoM0tFbGhsd2dN?=
 =?utf-8?B?Y21OcUJ2c1pJUVdrSHRtc1IzemxiODJPT1hCdXYyQzgrLzhSdC9oWTVwOStE?=
 =?utf-8?B?UFlOMzFOT3kvbmkwUktSMllCbEphN1JhU1lnNUFkMXMxR3A2dDgxNThiQnlW?=
 =?utf-8?Q?uOYS5+x4G/nu6VtKW7jmAfQokANpObQqiW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b35c8b-fdaf-42b8-1e11-08d8ba1e9e80
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 12:59:54.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR6ZOlXQP49O9/BoT0igXGoMNKq04eymnsDF0RYo7wYpHKILltCAZcV3xSyCqSWee9Snqt44m/t61jQXcOsEyhByecsfBzo/JN274vEl3lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5952
X-OriginatorOrg: citrix.com

On 15/01/2021 23:41, Stefano Stabellini wrote:
>>>>> This is very interestingi too. Did you get any spikes with the
>>>>> period
>>>>> set to 100us? It would be fantastic if there were none.
>>>>>
>>>>>> 3. Huge latency spike during domain creation. I conducted some
>>>>>>      additional tests, including use of PV drivers, but this didn't
>>>>>>      affected the latency in my "real time" domain. But attempt to
>>>>>>      create another domain with relatively large memory size of 2GB
>>>>>> led
>>>>>>      to huge spike in latency. Debugging led to this call path:
>>>>>>
>>>>>>      XENMEM_populate_physmap -> populate_physmap() ->
>>>>>>      alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>>>>>      "for ( i = 0; i < (1 << order); i++ )" loop.
>>>> There are two for loops in alloc_heap_pages() using this syntax. Which
>>>> one are your referring to?
>>> I did some tracing with Lautrebach. It pointed to the first loop and
>>> especially to flush_page_to_ram() call if I remember correctly.
>> Thanks, I am not entirely surprised because we are clean and invalidating the
>> region line by line and across all the CPUs.
>>
>> If we are assuming 128 bytes cacheline, we will need to issue 32 cache
>> instructions per page. This going to involve quite a bit of traffic on the
>> system.
> I think Julien is most likely right. It would be good to verify this
> with an experiment. For instance, you could remove the
> flush_page_to_ram() call for one test and see if you see any latency
> problems.
>
>
>> One possibility would be to defer the cache flush when the domain is created
>> and use the hypercall XEN_DOMCTL_cacheflush to issue the flush.
>>
>> Note that XEN_DOMCTL_cacheflush would need some modification to be
>> preemptible. But at least, it will work on a GFN which is easier to track.
>  
> This looks like a solid suggestion. XEN_DOMCTL_cacheflush is already
> used by the toolstack in a few places. 
>
> I am also wondering if we can get away with fewer flush_page_to_ram()
> calls from alloc_heap_pages() for memory allocations done at boot time
> soon after global boot memory scrubbing.

I'm pretty sure there is room to improve Xen's behaviour in general, by
not scrubbing pages already known to be zero.

As far as I'm aware, there are improvements which never got completed
when lazy scrubbing was added, and I think it is giving us a hit on x86,
where we don't even have to do any cache maintenance on the side.

~Andrew

