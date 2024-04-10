Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BC28A0256
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 23:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703652.1099415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufl4-0000di-Eh; Wed, 10 Apr 2024 21:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703652.1099415; Wed, 10 Apr 2024 21:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufl4-0000bL-Bq; Wed, 10 Apr 2024 21:45:30 +0000
Received: by outflank-mailman (input) for mailman id 703652;
 Wed, 10 Apr 2024 21:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Qmm=LP=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1rufl3-0000bE-5X
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 21:45:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0727.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::727])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a52da4-f783-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 23:45:27 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8467.eurprd04.prod.outlook.com (2603:10a6:20b:34a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 21:45:25 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::2af1:bf89:5576:b0f4]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::2af1:bf89:5576:b0f4%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 21:45:24 +0000
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
X-Inumbo-ID: a4a52da4-f783-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLAtN1KUqmQ6P/9M8j7K+RDCPQv7cCnPAm345Upb5M9CCyxhwNysInQcEXSbqPCAbS8KFjoV7qz56aup4HfKlK972cwrxTbLY1KxiowHyWmMxLQ4N04kGUoLLp1ZmueqIsFXqgQcvq8pVhmUWhHWYW1aOvAt025+WxOZuXD1A//Z8yNdHZAjTva6HJLyEvWOwvBt74BbmJHV4QxUzR5jbtahdhFSvMJGhb0tISRHdat8X2DwDSc364tL08MbPdXyiAZvc/W3x6JG5Uc2M0fA6YFvRHtiiDbek59f+VXNvnEQMjuuWrMZMyYQ48St6A/QTblWVWRJ5p2C2BKMPrjruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntfI0OXXHuLXVWRK9749vLQXNNQiZVnw55sIE2Db4JI=;
 b=R1NvaKKcLqi7zWWN++84wKcuqsnJ6qRPIOJUjkFwbvVP7cPcp/xhykdMlcrONlSUoQkLftJm97b5tgAwpnN9dc+hVrIkljvUGYqfDya6xmOkk2tvPwbohSfAUQfuFoVbvcqBt+UdnHGcVRcxfb8qWgQKS5+SIqpvdi0ES61Yqom8XpHnMULGuSthnFZOhVXu0M8Nl9WmB0q7729lGKqHKrk+F0/h0rdgzSp0S5q+Njxr+fEbRlVE4/jxjSa5EYUG5tb11gLKYW2vHXea2f6LRaFtJ+OgepyEd1gcSR6QKbrM71jZGetLfkb8qtOfgPWUIzC9DgP1OkEydJZUzC6Gbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntfI0OXXHuLXVWRK9749vLQXNNQiZVnw55sIE2Db4JI=;
 b=GShIV+DQLR7riUnNVyjkOjnAVvc/SEpcOFbUDOxsE9IHGuYlr4Vl+p38nO5TH9f6NkpIOhzB7LGTVdHvC4/yeCByI9/NyBJO5MWZ2MViQ5QFsfTX+7ZlQLaCSp7FT1NQ5KBGLS0XzfX4zL7DnP17qeUbY9S9ky3Acn+Rzs/0030=
Message-ID: <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com>
Date: Thu, 11 Apr 2024 00:44:48 +0300
User-Agent: Mozilla Thunderbird
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
Subject: Re: [VirtIO] Support for various devices in Xen
To: Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>, Bertrand.Marquis@arm.com,
 michal.orzel@amd.com, Artem_Mygaiev@epam.com
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
 <ZaCOVSuEJtsAj9G5@amd.com>
Content-Language: en-US
In-Reply-To: <ZaCOVSuEJtsAj9G5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::47) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8467:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dv5x/ForNFqFjRXwGU9lZa77sIlajC4/6BrV6bSt0oEMKgEw1KjSItZdpviILKuKrKK9aGnuKbkXNkr9wG+TA38j7KBwVJ/HT7ZikeiTbslDGo+k4hMPSOL/fA0Ext2e8kgEjqYhPTUoFVAAo2T3FX6PXXR93e2ICUytmqDD1vFcRdd3dMO1f9y7hsmQyZSi/jEgg5ghf7RTMP5hcwaahUlYKzyxd5bbD9hNqKVvyr8D0DD1IpXo/fI/MCimCBk4NG7s8u4navteUgW1syo3xXP94CchERI8/1oUC0aqi2Pjy5f8dogWa9h+z5T3quk4ny6XOnM8JCm5pDQWiOuGMoehesYVojlK4caE9xYIeK9Lhr5PyUOj6PzRMkboC/EJ1xG+hbYmjRchB9PR/4xBlIwPRF1RqDxSWqcJb9T5d4nbfRGGbFjmSZyziE6Tdtbw6E+dWBnqgCXkOIEnPN+AwvJRmik+NFkUdPjuYeat2aTezbR6qRcK9TYeARLaD+KM0QRfb9qHGiQsHgZcfotcBF8PkX1w2LIsoxetXzctQPkIYTYmq5cfjzz2Axk8veDqXORGyxrDCP+KAgRWUQRDv1YV4iFaylWTvvYhtHXZlgUnLYVRQXcFajLOfwgTG7Za
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlLNmYxN3l2R0htTlJTalJuSUR1NFdZOXVma2dTNXZCRkxEeDhpeVhKRWdG?=
 =?utf-8?B?Y1g1SnFTK0dZWGhVNlF1WlI4ZVlwRkJLRkpORitPMTROUE4xSkZXbFowQkE0?=
 =?utf-8?B?Mm1MUFp4eFBUTEFoU1NjWmNuencveGczUnpZejl6dDdlU1c5b1A2Rnp6OUJ3?=
 =?utf-8?B?dlo2VUlhbHJMRGNYTURBejR4bzVtYktIbTdtMnRUM0JEZ3l5RnRjMXVnVkM4?=
 =?utf-8?B?UHpwRE5xNXNtaEdzcmh5d0x1N0w5Y2lQL0wwQzdYc0o5RThoL0RKN3drZ0J1?=
 =?utf-8?B?OGN1NmlLTDVtZXQ1UDN3bS9Va1pJY3ViakRJVTkyWFkyV0k0UnZ6SUN4bXZX?=
 =?utf-8?B?dXhJOTFTVEE0QW5oazgyaHFqTDZlNEZFT2F3YWo4Vk91Z3JMUTJuMGVJVlNs?=
 =?utf-8?B?WHROMk9MZlBjcTMzWXBrb2VZMW5EaU1LbDBISzFWL09KbDNqdE95S1YwOEVB?=
 =?utf-8?B?Rkp0V1MvVnF3YnRZeVRjQ0tkQ0Q1c3VFUXRITEc5RGhUaERnbEI2Y3JreWpk?=
 =?utf-8?B?Z1Z4SjlFMkE3Y0lXMmJBQmZPYjRPV3RyLzZKdS9vVTYyQlZ5UStOdVVSNm9n?=
 =?utf-8?B?bG5jNTRpRmFQd2lNdk56M1IyYzYzdVQxSG5oVWl1ZkhQOEwvK0thSEZtT2pi?=
 =?utf-8?B?T1daQjNUNTdNL0dxVTd5aXZYTFVJSmUxd0UxS21Rd05RaG9KKyswR3ZFVWxG?=
 =?utf-8?B?cFAvdHlxNFpaZUhMbkpoZkdCWDFRRUE0WXd6OEhieVo3MmtQNGNmMFgyYTE0?=
 =?utf-8?B?cWcyZGU0WWF5S2FWOFhEdUd6a0hkaWJONEpkNUJFdHlqc0lRNnplTlduV2VY?=
 =?utf-8?B?U3Viakw2eDV4S0FMd1VCU0krVmVtankvZ0JyQy9kdE95aWhlbmhZUzdyVjZm?=
 =?utf-8?B?czNQdG1YRjhlbUNCaWlicWRYWjlHUC9hQ0ZYdTVmaHBobjBOSTVJNXllZ3pv?=
 =?utf-8?B?dXhHY0E2K2NoNGxDNFhTMXVySmtrWktONVhaaUcxdlVyMzlJTTBCZCtNbVVm?=
 =?utf-8?B?T05JczBSY2hBL1JiM1YxSnFWdHlTamNKVlVFTG9lUlY0cExKbEoraWRWendV?=
 =?utf-8?B?b0tZTHRRRnJwd1VwY0l6K2czc0lnS3ZoZk1PL29MV0UvbExPd3lzRkRjbEkv?=
 =?utf-8?B?SzBLQVcvMmZwYnd5ZXd1VjErdHVCQXRmRFU0MUdDdVBTOHJweFB1UWxjTmFB?=
 =?utf-8?B?NXBlMWEwMW9XTkhzRmQyQWZ1WHJMbnJ1bnAyU1RBR0hucXdYS3kvdGtaejc3?=
 =?utf-8?B?bVlOVm1GL1Vwb21xQ09PVDAvMDRvdjRHUlloT2t6K1dUa0xON1VPa2gvY3RH?=
 =?utf-8?B?azU0RzIwOHRkcFMrK1c2N0ExTWVyak9mdUZPSFVFeW1rKzRxREU4UkxkS3pB?=
 =?utf-8?B?bTFsNklKbVhJWVZsNkNiUUlPUitrVUFJQVZvblRnZ1dVQ1JROXp2UzVpVVRD?=
 =?utf-8?B?Z0EzUWNXK25lZVlETkR0bWcrTW5aMHcrYWlzVXdQeGV1Q0ptNjZLaWdJbmlO?=
 =?utf-8?B?d1IrT0kwN3grQTJiTXpkVzBXeGdzUDg3Y3NQVVZXeVdUSjM1SUh3d0tLZXIr?=
 =?utf-8?B?aVNtTi85c3ZHdmJiUlY4Z2QwaFF0RExSU1E0UTI3VkFmZDJ4RytKY1ZLUHE4?=
 =?utf-8?B?bGdPK2ljVFVkZlVwdkN6QjVYdG5Cdkg5MStkQlVSdGdQY05JWWYvREh3R0o4?=
 =?utf-8?B?M29QOWRVQndEUm9rSFFUZUxjSkVveXcrMk0zTjU0UzIrNFYwbi85RzZ5aTAx?=
 =?utf-8?B?VlFMaVZWVUVlMk90V0tPOTdpM01uaWJJL0lZU0dZZDBlbzJzZVA3SzBnTFRY?=
 =?utf-8?B?UnVlZFpmLzZaY0RyYnZqOHNsRWZFeWRVMFdCS3V2cEpDMkdrU3lxaE1iaGhI?=
 =?utf-8?B?R1ppSUpBSUdVa1VrcnlxaFlubERRZ0xDK0NYTGNleDloQjlxVGtHNVFIYUJT?=
 =?utf-8?B?cVJ4RDJlR1p5bGUxRXJOMG5mUlllRXZSWmF5MkR5VSsrdm15MGMva2FyRkx1?=
 =?utf-8?B?VzNLY1ZsOFdlc0VTNXRrY3hldkc5SUxsU2krQnEweDZ6S2RVV0hNMEc1citE?=
 =?utf-8?B?bSs4b05RblZEMTNSQm5kbmpha2tkWTkwVGpEeGg3RW96dnZZTjI2Rkdtc3di?=
 =?utf-8?B?a3pDTFNaUkNKU1pOU1BHcGJnUXdiS0tTU2w2dnoraDFnSlRTSytRdG9qeGtV?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c92e31d-a57a-4409-cae2-08dc59a78712
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:45:24.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hWmaE08A5VbgK7ZIG8vEYVIlZBJKuJT9VmyCxcW5OYO+q6tfA2zUW30d0vV/9Wj5A9RR7vrzwcZzGFrA08ZWYapGTzdH+rfAsa0q7dwalc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8467

Hi Stefano, Vikram, Viresh,

Thank you for your answers and support, and sorry for my late reply.


On 12/01/2024 02:56, Vikram Garhwal wrote:
> Hi Andrei & Stefano,
>
> Actually, QEMU patches are already upstreamed for virtio-blk and virtio-net
> devices available in v8.2.0.
> For virtio with grants, the patches are WiP.
>
> On Xen side, we are yet to upstream xen-tools patches which basically generate
> the right arguments when invoking QEMU.
> Here are down stream patches if you want:
> 1. https://github.com/Xilinx/xen/commit/be35b46e907c7c78fd23888d837475eb28334638
> 2. For Virtio disk backend:
>     https://github.com/Xilinx/xen/commit/947280803294bbb963f428423f679d074c60d632
> 3. For Virtio-net:
>     https://github.com/Xilinx/xen/commit/32fcc702718591270e5c8928b7687d853249c882
> 4. For changing the machine name to Xenpvh(to align with QEMU changes):
>     https://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a
>> The libxl changes are lagging behind a bit and you might have to use
>> device_model_args to enable virtio backends in QEMU.
> But QEMU 8.2.0 can still be used for virtio-net on ARM.
>
> @Andrei here is an example on how to use virtio-net with QEMU:
>     -device virtio-net-device,id=nic0,netdev=net0,mac=00:16:3e:4f:43:05 \
>     -netdev type=tap,id=net0,ifname=vif1.0-emu,br=xenbr0,script=no,downscript=no\
>     -machine xenpvh
>
> Please make sure to use xenpvh as QEMU machine.
>
> Regards,
> Vikram
I've managed to successfully get a DomU up and running with the rootfs based on virtio-blk. I'm running QEMU 8.2.1, Xen 4.18 + Vikram's downstream patches, Linux 6.6.12-rt, built through yocto with some changes to xen-tools and QEMU recipes.

However, when also enabling PV networking through virtio-net, it seems that DomU cannot successfully boot. The device model args passed by xen-tools when invoking QEMU look exactly like what Vikram said they should.

While executing `xl -v create ..` I can see some error regarding the device model crashing:

        libxl: debug: libxl_exec.c:127:libxl_report_child_exitstatus: domain 1 device model (dying as expected) [300] died due to fatal signal Killed

But the error is not fatal and the DomU spawn goes on, it boots but never reaches prompt. It seems that kernel crashes silently at some point. Though, the networking interface is present since udev tries to rename it right before boot hangs:

        [    4.376715] vif vif-0 enX0: renamed from eth1

Why would the QEMU DM process be killed, though? Invalid memory access?

Here are the full logs for the "xl create" command [0] and for DomU's dmesg [1].
Any ideas as to why that might happen, some debugging insights, or maybe some configuration details I could have overlooked?

Thank you very much for your help once again.

Regards,
Andrei Cherechesu

[0] https://privatebin.net/?0fc1db27433dbcb5#4twCBMayizr7x89pxPzNqQ198z92q8YxVheHvNDsVAtd
[1] https://privatebin.net/?ec3cb13fe2a086a1#F1zynLYQJCUDfZiwikZtRBEPJTACR2GZX6jn2ShXxmae
>> For SCMI, I'll let Bertrand (CCed) comment.
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> On Thu, 11 Jan 2024, Andrei Cherechesu (OSS) wrote:
>>> Hello,
>>>
>>> As I've mentioned in previous discussion threads in the xen-devel
>>> community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
>>> S32G automotive processors (Cortex-A53 cores) and we wanted to know more
>>> about the support for various VirtIO device types in Xen.
>>>
>>> In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
>>> as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
>>> virtio-gpio.
>>>
>>> However, we've only managed to successfully set up and try some
>>> use-cases with the virtio-disk standalone backend [0] (which Olexandr
>>> provided) based on the virtio-mmio transport.
>>>
>>> As such, we have a few questions, which we haven't been able to figure
>>> out from the mailing list discussions and/or code:
>>>     1. Are there any plans for the virtio-disk repo to have a stable
>>>     version? Is it going to be long-term hosted and maintained in the
>>>     xen-troops github repo? Or was it just an one-time PoC implementation
>>>
>>>     and the strategy for future VirtIO devices will be based on a more generic
>>>
>>>     approach (i.e., without need for a specific standalone app)?
>>>
>>>
>>>     2. With regards to the other backends, we want to try out and provide PV
>>>
>>>     networking to a DomU based on virtio-net, but we haven't found any available
>>>
>>>     resources for it (e.g., the standalone backend implementation if needed for
>>>
>>>     control plane, configuration examples, presentations, demos, docs). Does it
>>>
>>>     rely on the QEMU virtio-net or vhost implementation? Are there any examples
>>>
>>>     on how to set it up? Any required Xen/Linux Kernel/QEMU versions?
>>>
>>>
>>>     3. What other VirtIO device types are there planned to be supported in Xen?
>>>
>>>     I'm supposing libxl will also need changes to accomodate new configuration
>>>
>>>     parameters for each of them. Or is there something I'm missing?
>>>
>>>
>>>     4. Also, while we're at it, are there any plans regarding SCMI
>>>     awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
>>>
>>>     seems discontinued)? Or is the preferred approach for sharing SCMI access
>>>
>>>     to guests through virtio-scmi?
>>>
>>> Thank you very much for the support, once again, and we're also looking
>>> forward to the progress on the rust-vmm initiative.
>>>
>>> Regards,
>>> Andrei Cherechesu,
>>> NXP Semiconductors
>>>
>>> [0] https://github.com/xen-troops/virtio-disk
>>>
>>>
>>>

