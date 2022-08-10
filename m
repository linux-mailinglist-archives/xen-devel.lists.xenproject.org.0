Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5558E763
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 08:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383389.618551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLfUI-0001EP-Cg; Wed, 10 Aug 2022 06:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383389.618551; Wed, 10 Aug 2022 06:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLfUI-0001C7-7w; Wed, 10 Aug 2022 06:46:42 +0000
Received: by outflank-mailman (input) for mailman id 383389;
 Wed, 10 Aug 2022 06:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQbV=YO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLfUH-0001C1-8q
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 06:46:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f73bf63-1878-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 08:46:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2478.eurprd04.prod.outlook.com (2603:10a6:800:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 06:46:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 06:46:36 +0000
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
X-Inumbo-ID: 2f73bf63-1878-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBahJLMvGqk6inw1rRai79RttdYwZoeMAGgMToHKXllZlToZ56qVUecHQUONbUMRk+iBCzO3INqIG218Zy0PMnPGXfsijWzy0NW3q2Unp01q7yVX/d3VRuQ8kK8WvERA740anMA2wx/YW6qy3lGOhCTjtKUuvqvxfDv1e1OEzJKTGZbrMtpuAMk0lW9C1011zqVrhWbcXMl5yTk8AcFNsRZOkx/O6OJ/easmBVrsGhnTIm+9UPp0tybPTCzD+y0jNlTyhd2mI2e3b6LSEdD4vuKGyGPwdR1T821+xCU97XCF66Iv0y/Qq410hm32RLyrxIxNIRUSimq9/u5trBTsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjwzMdFj6Fblo4bsU0dvsEvVxOff1AXLAp9EZTC9wvU=;
 b=VjT0JP4aQYRAOMfsRmG+2K6UgDhxupiAZs4Fl1NnnSHNs1jVqEMbIIrZQgZW0UMNd/z04cALRiCbDz5dodCNbtJ0YAtB6vM5JsImMjsYovzO7URK8V/Y8Hbu+wfvbSaA62gTbzH433NPzR8kBLVtJ0/9TGHKA6qtpio21ASWNtVKH8CrT+y9QQ/fXodm/eyLua/3HJdI1IFBNwuhS5tjq2EKTTnk1u3u5vOPUBsZ7XNYphkq66puHeT2CiK57OGnE/OUjLEIuomedGMXEwg+pLIkGyfTkOvvI1ZqVN+gBqmpYHB4tIXa2LQd8mNIwkIaKbkRA67Zs/UcFpGqcIH76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjwzMdFj6Fblo4bsU0dvsEvVxOff1AXLAp9EZTC9wvU=;
 b=xUfw4BGBAQqhdYIG/mWEDgfsNZruWWHjlsSWBvxpoHOdYE33kMKDJFdKE5ySwPv3cXO5okkFdv0HgHFaQnomkUj5xY57eoGGKngfC7x1yjiOxl7wQv99PZWmqbxKT9CfL09FuT7O6gRX6TV1Ec72KBI5u133YI79mqksbWQW2FQt0sUxeWIEWu0omY0XAT+qOnfKJrhKr6PSefd9uEGVYXGHFQi7b12XsXxVLkA7eLcbaYPIvh5xlOP8a7l5w5kVFhmQ622Fc0QOMG2LMXhVRGxfmAObLIDXhHYJj5uofYl8qsat0wNrSUWa5YQOXhrOY/Q4u1Mv5QBz7CV+qsDwGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5dddbf66-2cce-da1e-9d52-d1fbd18c4ec6@suse.com>
Date: Wed, 10 Aug 2022 08:46:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO handlers
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-4-volodymyr_babchuk@epam.com>
 <381b3611-79c2-807e-c5db-d5c0d9ea4fc4@suse.com> <87o7wt9myq.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87o7wt9myq.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8cc68b1-fe18-41a6-66c7-08da7a9c1222
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2478:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Qr0GOT4GSl1hMTRKIxMJNid3R9A15aK5tbERci9i4oXKjCPAY8/RMxA3jsp7eRbqUC6as8Js2zWTwEZHAEHzfNkpy6q8a3IphoC7SwhT/bhRL9a/Pk0u7eIpUF6ud8BNH8wM7ZwYjYScJFJtUi5I+4WNdjUSd3Y32b/1hVJ3TlYrv8HsYXjgo+i0ZQhzFAD0hMlw3mXdOl5mMufBS0ydiY/tRNi+LSKoNfeNGoOqdjuxXRhyRHrGv14i9Nc8l/N+r0lNQyqNS/rTwIW/ZGsWIL6nXEqPndEQbqPoQVmkTfAurcuxAolx2BhXRVqf7SOwYS0IJ62HOTNN6vh8iR+yqx4C+KA5BuOTVwxylTfX3e2UMvi+rU5F5IWyiO7mDwR7bxI8wQDezf4cyIoWqyJkzr1VSENZh7ZsA9BJB/fD+3x8l9s2k+qr0u8MKIGkDAjoRYMZ7lHZ6ljBoaU1taEDcPnsEghe9TOOo3X2jXksppIpEeRhzaUTz/BxI63zmfGjUq0/dg7Qu0AfpAGCl9vKpA/ll0O7yIRxDudf8o3b8ztGzT302hZH0Bbwogpe3uFkra7raa+Kv4MBSN8erUbi+mXcclTc1ApO8WjODmqTJPMlISI3VpMExZ/R1kHUT5kQ7jXch31G29JrkE65Pgshvy6ps+d9HHKivq5BCvHV1M3jRj1wANRoEhKkVrOHchipcMCoeGLmH09eBg9aBVExSLICIZ1rDhFva4Qk5GW46sdTGJFF3Aw+y8A4un+wYbMm41uxe3Q0WcrylPC9qN2Yz66bSakRI4MKWeZjx8V+6OVaS0uupad6ta1+ACGB/Wn/cKtN3r9p5mUPeG5hxwo4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(396003)(39860400002)(366004)(83380400001)(86362001)(31696002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(54906003)(6916009)(2906002)(8936002)(5660300002)(6512007)(26005)(53546011)(6506007)(2616005)(186003)(41300700001)(478600001)(6486002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUxiRTFGUHlnMDZneEpEMTZNMDdLbHByR2FpRHJ6OFBWa1I1UzFEczZFUmFr?=
 =?utf-8?B?Uk1qTTZwYzI1UXN4S29lMGZtajBOMU5oRjlrRDBBeVJpQnBRMUxyWm41UlJP?=
 =?utf-8?B?YVgzaVFEYjE5Mm9icVlqK1FQL1ZBTHVSYjdid3RzTzlaZjUxNlFqRUpzb1pN?=
 =?utf-8?B?a09NMGpDVXN6WGptdkZ5alhZWXFLWWN5bjI1U1ZpUWdCTkFtUGw4SmxtbFdy?=
 =?utf-8?B?ZFpnVE9wT1ZTTXkvSUwwU1lBazJFY09NaTJoWFZRTXQ3V0VTWGdpeFNuQ2Fw?=
 =?utf-8?B?eS90WFpPcjc4RzlkbkNkN3FUSXltZWpUNVJFNVpHYWtkT3R2OXlsN3JiZkx2?=
 =?utf-8?B?SFNVQ2x1QS9xNkVXUVBsV0NBZUM3S3RBblFSS3FtdnFIZVBLU1g3WUJhZFJq?=
 =?utf-8?B?Sm9DbUQvQ21aOFY0YWFlRU1mekMwUU9iS0ltdmNzczlpUVplV1FSeXVPU0xF?=
 =?utf-8?B?VDEreS8vam44SlFjdlIyeFNnVGVWaytMdmxabXpqMnN0VHJoaEs0V0VCK1BU?=
 =?utf-8?B?c3QzekVDcnp6aExBb0trcGNPbXVNV1RSWEpSa0F1WENQdVZqbjhnQVh6MUhr?=
 =?utf-8?B?OS9Ca2pROFdsWDhBSnpINkRJaVNVLzVwQ003bExwc00yQmQ1TjFTckU2ZE16?=
 =?utf-8?B?VW53cU9IMmJjejhsUDN2Y2RuVWpjQjZmZzZ3SWc4RCt5d1F6OGZWSG5MR0Z6?=
 =?utf-8?B?VjhhYWxWMUFTMzJlMTdoSVNaSnZsNHcreDBybkwybGw0NlZrQmdFQjNZbEJJ?=
 =?utf-8?B?VGNTU0kxSnlmeXJDQ2FZSzU4aEc3Z3R0RzVESVErSVBDa1pNM0YybkxOQmJq?=
 =?utf-8?B?cyttUHJPZlVtdXZRamxWaGdHTEMrSEpsT0V6VHBnMTVoc2VsTlVCRXBxMStQ?=
 =?utf-8?B?dWZYVnpJNFdNVE4wY0JtN3NaMDExa0w2dkRkWFZJbGU1TE8rQkNocE5rU1JV?=
 =?utf-8?B?WnV4QXF6ZTdieVVCcTZ3Z1FkdC9iZmhkNUUyRDhBSjhiNjdIUTYydkg2N2pL?=
 =?utf-8?B?ZXM0OUNRZTh1TzhWQ1VGbGZDZDFiaERLV09TcGR0Q0ZqQ3E1bGZybkRIWFgr?=
 =?utf-8?B?ckNUZm9hUDZmMGowS3NJTE41MG4xc08zUnQ2ZmpKVExOTVdudDM2Yld3eSt1?=
 =?utf-8?B?WEVGaVFkQlpRRzVWSjJlMzZrZ3pMOUY5ZE1XRUp1a2czK3VUbEZEc3drZHVr?=
 =?utf-8?B?azFqUTdPVGZGSEZ1dVZuZWxWajczMWM4bmI2YWs1YzJnYVQzV0w2Rjc5ajEw?=
 =?utf-8?B?RW0xSkk5b1pCWThWdWVocjlKeUZwaHJEckQvblI0Wm9GUEx2VUY1bXBVenNh?=
 =?utf-8?B?Q3hKbDA4aXZtWWlmd1B5WWpvQVIxNEZ4Nkd1TXpnM1E2MStoVzFpTTRwU1ZV?=
 =?utf-8?B?Mm9oODA4VW13WjJMZXNLV2tzbkdTUURBVTRkTHNDT1llRUVGelV5VTFaZHZZ?=
 =?utf-8?B?Z2pxVEE1US9mMnI5djdlNmM0Y3RoMW9hdC9zaGhqdEh6ZU1oNE1qSkx3ajA1?=
 =?utf-8?B?VWtPUWFMbjM0eDIvVmMyMGVxRXpIbzJGdG5FMUhJVmxDZzllNm5Qa0c3Uy81?=
 =?utf-8?B?WXV5RnRYT1JaOFFUdzdubWNHeEpVOXE3bXp1dkRGbFZWVUxRTHplY2twRlg1?=
 =?utf-8?B?QndzWHk3NjhLQkRLY3IzaE5kbVhOc2xId2dmVFN0Z2VBdllmcHNDK0l0L3RC?=
 =?utf-8?B?RDh2QVU5aDVqY1ZpMWJSRmNQbjhFRWF2dmNkUGo2bzEwM3VRQ0JMcFNEN1RV?=
 =?utf-8?B?eXZvdDlFOGR2bTZobnpVbXg3VktOTUdLeUREZDY2MEoxRm90ay84WkYvak44?=
 =?utf-8?B?Y2hiYmN2NlFFdFVDbTBPY293UGZZYVFSZEpHV01ESmM0VzN2eWJwUkJBUklU?=
 =?utf-8?B?Y3lMczVqcUUrbHMxaXBIczBybnhDU0huNC9VTWczWmFlbHJ0N2wvS00yK1VX?=
 =?utf-8?B?ZjZ5eUZDOTI5TERGTkhCbGRVNUtQdmVrRG1PbDlqSnBYZlI4VUZ3K2ZEY1Fu?=
 =?utf-8?B?T1Q4VzRHZEhWRmNmVVFLcjNrbWpZc1lUMXUrVFRqVEZrRFpCZXdjY0ErNnNN?=
 =?utf-8?B?L0hwS0RoWTBOQy9CWU5EYjVpdFJIa3cyVnVraGUwYTZKNnZNa1BOTmV3YnlM?=
 =?utf-8?Q?hKStDUafTgf9ZKio4gKk+FJCV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cc68b1-fe18-41a6-66c7-08da7a9c1222
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 06:46:36.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njwt49lHR+Z8cwyhXm5BW9pN0v8kH53ANEEXrAvtaFE53RBnFCnaTS4gd7tgaCohnNghMRd7DR5/5HXyAZBmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2478

On 09.08.2022 22:33, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>>> -            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>>> +
>>> +            if ( !pcidevs_read_trylock() )
>>> +                return -EBUSY;
>>> +            pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
>>> +            /*
>>> +             * FIXME: we may find a re-allocated pdev's copy here.
>>> +             * Even occupying the same address as before. Do our best.
>>> +             */
>>> +            if ( !pdev || (pdev != msix->pdev) || !pdev->vpci ||
>>
>> Despite the comment: What guarantees that msix isn't a dangling pointer
>> at this point? At the very least I think you need to check !pdev->vpci
>> first. And I'm afraid I don't view "do our best" as good enough here
>> (considering the patch doesn't carry an RFC tag). And no, I don't have
>> any good suggestion other than "our PCI device locking needs a complete
>> overhaul". Quite likely what we need is a refcounter per device, which
>> - as long as non-zero - prevents removal.
> 
> Refcounter itself is a good idea, but I'm not liking where all this
> goes. We already are reworking locking by adding rw-locks with counters,
> adding refcounter on top of this will complicate things even further.

I'm of quite the opposite opinion: A lot of the places will no longer
need to hold the pcidevs lock when instead they hold a reference; the
lock will only be needed to acquire a reference. Therefore refcounting
is likely to simplify things, presumably to the point where at least
recursive locking (and probably also converting to some r/w locking
scheme) won't be necessary. The main complicating factor is that all
places where a reference is needed will have to be located, and (quite
obviously I'm inclined to say) in particular all involved error paths
will need to be covered when it comes to dropping references no longer
needed.

> I'm starting to think that complete PCI device locking rework may be
> simpler solution, actually. By any chance, were there any prior
> discussion on how proper locking should look like? 

Well, there were prior discussions (you'd need to search the list, as
I have no pointers to hand), but I'm not sure a clear picture had
surfaced how "proper locking" would look like. I guess that's part of
the reason why the currently proposed locking model actually makes
things quite a bit more complicated.

Jan

