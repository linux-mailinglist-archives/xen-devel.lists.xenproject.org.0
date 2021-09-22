Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E84142C4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 09:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192225.342569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwmN-0006kw-8T; Wed, 22 Sep 2021 07:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192225.342569; Wed, 22 Sep 2021 07:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwmN-0006iR-5A; Wed, 22 Sep 2021 07:34:55 +0000
Received: by outflank-mailman (input) for mailman id 192225;
 Wed, 22 Sep 2021 07:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSwmL-0006iL-HR
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 07:34:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92648bfc-1b77-11ec-b961-12813bfff9fa;
 Wed, 22 Sep 2021 07:34:52 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-7dm5D0qsM7-A5hyMlKcQhQ-1; Wed, 22 Sep 2021 09:34:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 07:34:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:34:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:34:47 +0000
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
X-Inumbo-ID: 92648bfc-1b77-11ec-b961-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632296091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+DxErIK80ExGUZHlpS0lXGQGa4hZ6FYuJR0+GOnBaA=;
	b=S7BjYY0chekPdw18FmBILgDoYIMmFgmYjj6THjcmUapmDVzcUyUbQxlmvM5VyR8B5++r9/
	kbBJshQEyjJcljqs8ha1oNfq1dvoVmK/lGsV9LouGotYQKmQN8fMbR6kgMSXbQnvKMVgl9
	/dgZAyjZJ+JDVV362Y8AnrVPO/8LEiY=
X-MC-Unique: 7dm5D0qsM7-A5hyMlKcQhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuePZIo2UQDxDvCpD9HML9nCC71wh6PVicHAvNPM1oAR5prA/+5OUDAR9tAz1G8oj0YnlgNJefGApN8EVW5J1Kmzzql/kE6Db8wVm8DRzWA956tJxl7ayYm8p8lt3RwusfTQbezSiqJU+tPAxcX4l00FsiBFzJ4VV1Tcwql6poORmBNbau8NSDa8zVB1jpjL+impxIQXbxgaw18awzqvm3YmMWmvt4Hd9ky0ntJMbMDmMXJO7cmAv6cwCo3QNfTdpVwcne5z62LKxwfXfshoPbCRd7Y5oMLZGsJHpjeSiMhbfu1o3/LH050nWJI6KMxyamT2t8isBRcyOLhoxaAe1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g+DxErIK80ExGUZHlpS0lXGQGa4hZ6FYuJR0+GOnBaA=;
 b=PUJjpCM7DBkji0EDnhTvdwaXcNqSuNbXLoGExdSof6DAQssIGr/dJlnneP3K4swRQnAT87Iferzh4+s2EOjKSYh+zNuFAQ8WYuBwGduQ+TSwr59z1vSjFZB3lNmC3WiO0VmVfOU5JD3u7oVbflu0PGUpJGxItg7MTETR63Og1psxXc3rFkg6olJYRBJDlkAccqqf8Vey4WMb/F4jjybEcvC8Oewc1LaywuGKDvCqaOnp1aIgiBf2b4F0ltAGxDelgv4VOAwf6YXOnc6rv2FmsT/rEo1xhUjQPbgwsnW/xVSkzHVjWr28CWiJjp1zpSy8plJSPvDrUtJiSLuGaMSIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
Date: Wed, 22 Sep 2021 09:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f123f80-1dec-4c5b-7ea1-08d97d9b7489
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB353304FA5377EBFFCA7EF3CEB3A29@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HwRjKBdWvvhpxIpzslYJAO/Ea3NDiq1rlDXJlXsE1eyQEXFJxYRocCbgaFCmk7SbeQFQZo8XX40VbADahJqt1v4lQFfCgxL6BwvWUpTw9dnf7s/kVQ7RBc4XwyApoYL69YjHttCKnyRQGw3KCkljLNP0fSyYrqNhdGBk4kT2J3taTMz7hD/obOkUnl1XTAlE6QtAIFmS9Syi655rAWwAVIu0C4cp1H6v+xjBMRy3OS5LiysGHDDAFCKIuvwSafJ0U+OxKrA6vhQf0g2gjSacWJ9g76euUf7DpF+XMyqF/K39kY+R9qEQ/EcaCGmWx5vvrJ8uRNrYUUDwA2dh4pF6eKTHavI1bibk+D3GkrQh3eOQ4SmhhdL7WaE8EO5kDW6+CeCQbq1DlDQlJrhrnjSeHHipb2ftargmE0Iwo04gWTkXsfgAhUgSCTXfhsWjXlbJO/zgOmwGbLvoJNuEaTQX9rJpuhUs2ClTx47pH4NrZeniBxp3IW761v1UKFJCYLHxDcCY5y3/sFpUao56vRRxakxvV9JueMk4cAbxh7KM8F+khIMtXfHfjhI4TUeLrjm4veflC1EN6aF7XQiRzJSotGBAvjbYec9ll5HAOxwX6gi20kbwK8te3afZ7/CpeOXZ2hVIP0nbHWlstEqv9s4+rzKTdHRoTGz64IjvQITqJztpqABd7pm33FCz6HBka3pgRz9WJ0udsNiZ+t82ywvVkMQbjlKrGNWHmlsqmuHshBB0XQLjwEjjKhkcTq0Kk4CR9Q6g3flduqCDs73lJPSgeeztQZm6Sv9P8OdQdyK5VEEGkza3NoSUVxw49Fn/WhWl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66476007)(8936002)(956004)(2616005)(86362001)(186003)(6486002)(31686004)(508600001)(26005)(66946007)(4326008)(316002)(5660300002)(53546011)(966005)(31696002)(8676002)(16576012)(83380400001)(36756003)(110136005)(2906002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtlWTgrV2pRNEZKSjR6c0hSV2hUL0RtWEsyUE5YMW9sN1dmSUVVeWszZTg4?=
 =?utf-8?B?S1RHU3J1Qk0vNVV3cVR3L3F1MjBMWHRMU0kzSWRKV2ZpZkI0bkNhK2JqeWpN?=
 =?utf-8?B?OXdEcTI2OFd6cFZpOTV5VmJDcHM4cTc3RE8xWEpTSC9pTVNDUFdLZm01eWtz?=
 =?utf-8?B?eXdRK09rei8yOXgzV2kzajlHamFQMmpoSUlLYnhLb0psYldPSXU2N3dYVWNt?=
 =?utf-8?B?TEd0VnNQQzRRU2U1MjMrU2FOQWxJUzN0SlFISXl6MW9BQnk3WnRMYmtMUWtK?=
 =?utf-8?B?dURqM1NmNDFOdENHQ1dBcmROMzc2V1Q2YUZHc2VxMnNYU2xSdVZuNy9uMWFx?=
 =?utf-8?B?RkJGK3BnZGx1Q3pKTjhXUTA4cGJ1OEVXcXN5VHpuaURNMFhkRWdicjZkSTgy?=
 =?utf-8?B?MDVmaElhL3RrMEFYeGdXU0JTdzhwSWNFZWQzdVM2T0UwbUwzUGo5cndqM0JZ?=
 =?utf-8?B?YmZqclJhTXFYUUlRWDh4MHk3bkpKRnF4ZzFPU3FlN3AwdlZ5emVMZnU0UVRK?=
 =?utf-8?B?bm50ODlremd5S3B6UHc5MGE4UnpnWWIwRzVOZUdQbXd6V1lPd1VlNkI1cnBC?=
 =?utf-8?B?dW1FajVUMEZvNlVLRHdLZ0lkWEpVOGQ3K010MUtmdmU4ei96VGlzSEhPM1RQ?=
 =?utf-8?B?Y1FhaDRsaWtHWmdSdVhtbmt6YTF1b2VjSlRubzBLcDJtM2YyTmdHM1k2VmlC?=
 =?utf-8?B?UHp5d0VhS2ZxU1RsaFl2cXM3azhLeGVlQ0RtK2tXc3BpZWQ0YTBlU1NaM2ky?=
 =?utf-8?B?dEl4Y2lFNk9OZW9Rb2pIQVhXdjhQOUYySzNjSXp1REsySlM4RG4rZHo0bXJn?=
 =?utf-8?B?T0xMcG0zNG9VcGhwZ2ZIK0NRVHFyc3NwaEJ6U3UvUUY2R2pidFlKakNoaEgw?=
 =?utf-8?B?NE80bTRqMStHMFliS3htNmRnVHNQMTZ3dVhTTGd3T09hdFhWcWR0bElTM3pv?=
 =?utf-8?B?SmVTUmNCSW9ISnB3blJHK0ZXbXRyekhJYmlFMnNLL2V2Z0lqckxPdWpiQVJz?=
 =?utf-8?B?aXlSQnpkWXlsRms2WnNiRU9PK2cvZEEzMDRxMUVUUXdsR3dIZVpFeXgwQW42?=
 =?utf-8?B?RkhDSm1SUmU4dFp1R2ZsRURiNkZwcytWRGRkRU5lMWhXTjBZdFl1Nm5DdHVE?=
 =?utf-8?B?c0QvTDZBRW1uU2ZKYkJTSnUyZVFybFR6RlJSazZKV2duczlVU09mUU9IdExy?=
 =?utf-8?B?SXh1UlVqMlFOWkg2OXhJZGczUk5LWC9iaFdzbXptTDdSam9tUjJxTXVackMx?=
 =?utf-8?B?SldVekVJeUpkWWF4amVBMFVGejY1TlpjOTJjbTE2R0xSK1BEbTduWTFvRDgv?=
 =?utf-8?B?cHJVTVliVWF1THZpSzd6NmFLQ0NkWnYyYlRpODlockZmWlJGd1JSVlZoZE5R?=
 =?utf-8?B?NmJjME5ZZkVIODBQMEs2MUNTWlRJNUVRejRhL0k1a3RYaE5palFSNXByM3pJ?=
 =?utf-8?B?d0VlNHFSQ0lFN0N5TkpuY0krc1RweXhjTkdHR251SEhzRjZmSURtZWVFR25h?=
 =?utf-8?B?WmpkM1ZJWDh2eUVtQVVwaDRoeUwwS214cG9vV3l3NXMyV3RVODFWTys2OEFv?=
 =?utf-8?B?RWJLNEljK1BXRVp1aHlFbUlFTHZZY1ltVkZTdUNDTlN5NTdvSkRLTk9BYTFn?=
 =?utf-8?B?VlU0MWJGY29rSW9pMm9pQkV3WlNUZGVnM1dyTi8vdE9wbFR0anRiNXVzN3Vy?=
 =?utf-8?B?SGhNK09PU2liNXUzc1hvTEhjOXEvSEpTZFFQYUpXcjJPZTQ0SlpBQmJoT0tU?=
 =?utf-8?Q?P1yRtlzAWsDCME92Gm0eZfjgPc+Mo4Dx3FayL0D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f123f80-1dec-4c5b-7ea1-08d97d9b7489
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:34:47.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKOAs4R88JbdVaGOgIdA+WFoaDRVqLe4H1hymz6zUG0mI+4GPZ8vCr2yShrNLI2h4om7feKVGmmlfUqjNXi3Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 22.09.2021 01:38, Stefano Stabellini wrote:
> On Mon, 20 Sep 2021, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
>>> As per
>>>
>>> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
>>> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
>>> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
>>> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
>>> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
>>> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
>>> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
>>>
>>> the system doesn't look to really be out of memory; as per
>>>
>>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
>>>
>>> there even look to be a number of higher order pages available (albeit
>>> without digging I can't tell what "(C)" means). Nevertheless order-4
>>> allocations aren't really nice.
>>
>> The host history suggests this may possibly be related to a qemu update.
>>
>> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html

Stefano - as per some of your investigation detailed further down I
wonder whether you had seen this part of Ian's reply. (Question of
course then is how that qemu update had managed to get pushed.)

>> The grub cfg has this:
>>
>>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
>>
>> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".
> 
> I definitely recommend to increase dom0 memory, especially as I guess
> the box is going to have a significant amount, far more than 4GB. I
> would set it to 2GB. Also the syntax on ARM is simpler, so it should be
> just: dom0_mem=2G

Ian - I guess that's an adjustment relatively easy to make? I wonder
though whether we wouldn't want to address the underlying issue first.
Presumably not, because the fix would likely take quite some time to
propagate suitably. Yet if not, we will want to have some way of
verifying that an eventual fix there would have helped here.

> In addition, I also did some investigation just in case there is
> actually a bug in the code and it is not a simple OOM problem.

I think the actual issue is quite clear; what I'm struggling with is
why we weren't hit by it earlier.

As imo always, non-order-0 allocations (perhaps excluding the bringing
up of the kernel or whichever entity) are to be avoided it at possible.
The offender in this case looks to be privcmd's alloc_empty_pages().
For it to request through kcalloc() what ends up being an order-4
allocation, the original IOCTL_PRIVCMD_MMAPBATCH must specify a pretty
large chunk of guest memory to get mapped. Which may in turn be
questionable, but I'm afraid I don't have the time to try to drill
down where that request is coming from and whether that also wouldn't
better be split up.

The solution looks simple enough - convert from kcalloc() to kvcalloc().
I can certainly spin up a patch to Linux to this effect. Yet that still
won't answer the question of why this issue has popped up all of the
sudden (and hence whether there are things wanting changing elsewhere
as well).

Jan


