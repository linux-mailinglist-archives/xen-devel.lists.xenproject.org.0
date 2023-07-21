Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979F75C1D9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567406.886399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlfW-0004Br-1f; Fri, 21 Jul 2023 08:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567406.886399; Fri, 21 Jul 2023 08:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlfV-00049S-UC; Fri, 21 Jul 2023 08:39:21 +0000
Received: by outflank-mailman (input) for mailman id 567406;
 Fri, 21 Jul 2023 08:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obHh=DH=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1qMlfV-00049M-42
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:39:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14e52cc8-27a2-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 10:39:18 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 08:39:16 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::a660:f949:7690:2dd0]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::a660:f949:7690:2dd0%3]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 08:39:15 +0000
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
X-Inumbo-ID: 14e52cc8-27a2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I55YAN6RpSGEb34AUuc6hjVu0EiY6O6woNeftCwQeniPcj2bWuLg0YAmsRnW5lceDV6WfI2/oBD2imS/BK96zCY+QJ5ksp2/qFHO+Hu+TOiB3UrzRtbqHtM174gvpVLVVP+FfwA2xkl/XdpzEJ35+R0sMIUf/reTphjvuFA1SqtxN6TfxKH84Y8uLlYqvHXM6R0zVSX9v2EFFDDc/8FtTslE1aGBBRnKnUHRvK6zcI5VquQDX3g9TzjZEl30djvUqzzAm/t3+lKmMqAn+RU+wz4ywYG76T+wMSAYcfyUdv5nktd4vvnAOclEQSNY+aNnwdp3sFSLD144vosrx8ZLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et0voL1IBQt1LV3UjVIAZTxo5V33LRBlMutTn7j+dlc=;
 b=GGsjz+OLTGOKzMTluIVyxjo5I0vkpvXp2zg2/C7xoiqwXxZQyAyb4DK9dmosaqK6m7JM3o0+ohuqKSbkctb+XssXu6F+jCgvzXzZglojU60eX+gRIbqNjooV34B7ep/xPmyEBOOG9AjjDGI9OuTPGyA4x3YW2T27QsUj69BdunQscKB+j7UviNxtu9X3zBpOrcSUOf7V8DfYyKgu2fCuBVw1JbjmFZXXsp4SkDfGL3LgFXRLHFdB7S+LnapVFrIEiJFvy9iEjfuVCsMoegSPMK3Ua0zaKZErhyT0OpGKGZPwlJt4YMp7buPEU60mY4CSpVZ1Muj5SuPKuJZZNmmDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et0voL1IBQt1LV3UjVIAZTxo5V33LRBlMutTn7j+dlc=;
 b=QyHqvNryJAF3eNmntpREiVLIJLOgGoaGnYOosObY/27PSGc0sfwQ4Y42+90MhtuYcL4nZl38V64z9DriOfLv5qaxKJLFdHut5/0AIvmTFPagBK5ZG9G3GnTrYBrxOOMWKfyMRcjbWrgKBtvCUMBibOJMQHbU99s8gEpnS1hmSck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <d7f16516-a009-27a2-497a-2c48eab3df3e@oss.nxp.com>
Date: Fri, 21 Jul 2023 11:39:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, george.mocanu@nxp.com,
 Juergen Gross <jgross@suse.com>
References: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com>
 <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org>
 <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop>
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0083.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::24) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6b0348-4d2c-4029-a2e2-08db89c5f771
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MvrdfadzNhvYByy9CKPiJWFnyofzkDSC81r/IgIhIhj3lhmTt68Z2MHQUscyHtdnKcCC4mpT1DkA8dPBBu8ZHgzY5H9VbpBjG310k+n3xwgrzsTUHtF8KDZnKZ+Xhci80Xar9XIs8+qX2O+kU+Hm6EgNTONM8E4EVe1HmAwjODRuMuLoGY8Q/TTaFV/hcZ8QJ7tcRgP0KRXsXO9vjlyJ8Kgr6AqFmPKDpqaiCjGRamXbM2tG2MU6dt23DA7RM+X6j5rkqDP7JYvkirwTYT6Kmd5k6muSHpMdbgQUJlFUUY+lNSxQibYjRS5iGagjcIhwP5saQRRGzOVBBtuSMhfdUakh77uwDIQZrbYCzPOxN8TlowTPMlgJCkk8nPYJOxgKbngmIU/vAa2zyqnc7QpvQG1fen3Q6fUEYq50YnH+Zewwx1jLx1TG16Jb3GLN5/vyZ/9Wtj4xoH7StyBeEQ2frGmidB73r7sMniwe/hnGRdxsvwenyCWj7diEizkvz3vwiLrf2QXtvy3pSWsngx1AzCz4hCdZroAdAUCfq4VnZ7BXVppoLZLx3r9D/ZxeUCy+fmpiehoNZBUp91IjAqmyWwgW7Km/C6v96U6jz7wGAL+n2lpYRyaHpfTZmY+r9TmtmrEC/dlwcBR3OuOddBwStw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(53546011)(66476007)(478600001)(186003)(6506007)(41300700001)(26005)(6512007)(966005)(110136005)(6486002)(31686004)(316002)(4326008)(5660300002)(8936002)(66556008)(8676002)(66946007)(2906002)(2616005)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWdsS3hkTllNT05qd2IzaTRHT2lhNzdIMnNBaUpaUXMrazBid0tBWTZ0T1ZP?=
 =?utf-8?B?enRIVHBGSE9ZUnZoQTlhcmxuZFM2VHRXcmVLRjFmQXA5dHZWS2dwUGpqZmpi?=
 =?utf-8?B?M3VkRDg2UFBDMnl1M3NHK2NvVyswcjB3cC9zZUhQTVRwVXpobU1LQXpyMHFV?=
 =?utf-8?B?ODlHTHNLSUQrbTU1VTliYVV6SmxBY21oTUFqTFRlZFkwZ2svT2t4L0U5ZUU0?=
 =?utf-8?B?WS9BSnIybWhVU3dJQ3lodUdtcjFRTTdEOFVEZ0xueksxN3IwZVBKTVMxTWpK?=
 =?utf-8?B?ZXphNXI5dytFbXlRMmNRd3ROd0tVaWNML1B0Sk1Na0NUYnpyTnlnR1NmN3Bk?=
 =?utf-8?B?amJaUmdrM3VkUWdlbVlhNmU2d2F5Um1YbDJEZ08rZzdaMDgvY2RFY2FTcTBP?=
 =?utf-8?B?R25GMXorMVRLTU5JWDFKM1lKWjcycHdrTmpOOXRMZWpmOTlobFhYUElqTExC?=
 =?utf-8?B?V01TNjRHY2NnUFc2MkZIdEZwU3hjbU5lTnhDYWlHSlBscjFFdXRMeTIzMHZ6?=
 =?utf-8?B?M010S24veDZnQzE1RDZPalBqR0V4K1BFeWoyYkJLSzRjUllNSjM2U2Q2TDdH?=
 =?utf-8?B?ZGZHNmRjZWREbE1uVjlwRWdKZ2ZjNmRZSFU2L3J2V3dvZmJIaHVYVFlxd1Q4?=
 =?utf-8?B?MFlKeDd3QitNckh2ejU0Rnh1aWEySDhrWnR3R2I3QVdKWEpPTFZob0oyUE1B?=
 =?utf-8?B?cURmbHRWakdmS0dMMkkvME80WUZDVysrVnk5QnlCUjZmVS9xbG13R3BpbGJX?=
 =?utf-8?B?dmZZNGV5Zm9zdldRTHpSeGJoOUk5RFhJa3Y2QzNLNVlxREFQaW9TR2ZQalV1?=
 =?utf-8?B?YTE0dkpjVUxKWkRPdWV5R3RjNHNTdUxaSEdvaGxIK21xNlFYdXJrQmN0VnpI?=
 =?utf-8?B?UktVWDYzeFl5cm8wWGNQWWIydGJLTFZkdVl0bXZTbDUrRGF3endoY3VsVVcx?=
 =?utf-8?B?Z1d3cW5UVTRndjQzY0Q2dDQxVHlPanIrYjE2RmJwSHdvZThOcmRUNi9SYXZ3?=
 =?utf-8?B?eVBla3JMSWE3ZU05emNQMG1GSjVwdGlITlZodTdvWU8vdFEwMDdPZTR3WUhx?=
 =?utf-8?B?cit6Q2JjTDJqSWRNMHhtb2c4TjdYTGFtQ2JLdldoeStGdjBqS1NvVzB5b2xF?=
 =?utf-8?B?cE8xa3Vlell5aTdVSEw5Q01ZNUpERXU3UzRORzdKbmU0QVNoNS9adm9zOXJj?=
 =?utf-8?B?WFIyVTlHWmJma1VZaFNhY2xyUEI1YzRqdTl2dTdoeDN3ckNGUDZoY1MwUnZD?=
 =?utf-8?B?WW1Sa2tsQXg3cmx6U2RRd20wcWE0dGgzZ1FJbDRCL2Y2MjF0V2d5c3E2UmR5?=
 =?utf-8?B?NXhvRytZT051ODI1aDlFSEFEOXhLazEzeUtnZTdUNzZ5RTVNa0h6M3k4NFBK?=
 =?utf-8?B?VHd4R1RSR1k3RS9RZGtaV3NMQjhXMDVLM3pqKzlRSFY2QlJURUg1azdvaFVE?=
 =?utf-8?B?OEppajhTUGMrSnQ3M0JXY1FPSWFXMno2TDR0Q2hLNTJaZmVHLzd1aDJMRFZ0?=
 =?utf-8?B?YkRTTFcyYXV1ZHlVVDJPYlZWSnNiTUFOR295YUE5K0h2M2tOZmVkamdLTENq?=
 =?utf-8?B?eVgrQm54eFlyNFhoSTVCWVF5VEZFTjFudTA1ZC9Gd056ejdrYmdYZkhPVzNw?=
 =?utf-8?B?S1ZkWTBFWFJjS2dvcWtGVVd6ZlpsUkVBeml6eUNMTm44dTNRK2w2cm50ZlBK?=
 =?utf-8?B?TjZJeDFKSm5aTU5zazdQWWh3ZTFZOFFWMEViS1hsY2VwcGFHczF5WDZVNHVl?=
 =?utf-8?B?WXFiSDVMWHJWOHdDMEIzUCtDRnkxbkxtUVJLZms4YWdnQUdrQ1VocEcvNjhL?=
 =?utf-8?B?bHpjZVlWSFR3dDJCWE1jUm0rSzFuWTRNa0Zhcld1aU1uY3dZTHZkWnA2aG9v?=
 =?utf-8?B?QkIzbEs1cmJvVlJMZ2JqbUQwdFZVUE5IWHJUa0dMTGtOemlPRUdIMVhrNUpw?=
 =?utf-8?B?UjhYc0FPYXRmVTZIcWlsN1A2Yk5kZnVEM2x2dW9vS2dhdEdnMGMwb0xtaVNO?=
 =?utf-8?B?d3cxU0FnNzNQbzNHaTI5REdFWS9DZFA0VkZlZ1lITmhvdkhIM2p2M0p5dDVC?=
 =?utf-8?B?TmJ4dVFUMlZqak1vV1lXSTQxbXE1YVRGRW1uL0Z4ZEhMcEZVQlBqR3VyN1Zt?=
 =?utf-8?B?NmNsV2pwTnVKbjRaTDV1L2JHb0lIbDViUnYxbGE2NzFNaTNTZWRyVExWeEp6?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6b0348-4d2c-4029-a2e2-08db89c5f771
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 08:39:15.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8CfcuRrfLe6/yao4qMAM+Iju6+iRIrkbYsRIJkLFQF8ulIxB5IjpWSpK8Ow3CLHcz7yz65aEv6kNltczRkbL+QWVsmjE9FvmtO0Iwf6BZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500

Hello, Julien, Stefano,

Thank you for your replies.

On 21/07/2023 02:25, Stefano Stabellini wrote:
> 
> On Thu, 20 Jul 2023, Julien Grall wrote:
>> (+ Juergen)
>>
>> On 19/07/2023 17:13, Andrei Cherechesu (OSS) wrote:
>>> Hello,
>>
>> Hi Andrei,
>>
>>> As we're running Xen 4.17 (with platform-related support added) on NXP S32G
>>> SoCs (ARMv8), with a custom Linux distribution built through Yocto, and
>>> we've set some Xen-based demos up, we encountered some issues which we think
>>> might not be related to our hardware. For additional context, the Linux
>>> kernel version we're running is 5.15.96-rt (with platform-related support
>>> added as well).
>>>
>>> The setup to reproduce the problem is fairly simple: after booting a Dom0
>>> (can provide configuration details if needed), we're booting a normal PV
>>> DomU with PV Networking. Additionally, the VMs have k3s (Lightweight
>>> Kubernetes - version v1.25.8+k3s1:
>>> https://github.com/k3s-io/k3s/releases/tag/v1.25.8%2Bk3s1) installed in
>>> their rootfs'es.
>>>
>>> The problem is that the DomU console hangs (no new output is shown, no input
>>> can be sent) some time (non-deterministic, sometimes 5 seconds, other times
>>> like 15-20 seconds) after we run the `k3s server` command. We have this
>>> command running as part of a sysvinit service, and the same behavior can be
>>> observed in that case as well. The k3s version we use is the one mentioned
>>> in the paragraph above, but this can be reproduced with other versions as
>>> well (i.e., v1.21.11, v1.22.6). If the `k3s server` command is ran in the
>>> Dom0 VM, everything works fine. Using DomU as an agent node is also working
>>> fine, only when it is run as a server the console problem occurs.
>>>
>>> Immediately after the serial console hangs, we can still log in on DomU
>>> using SSH, and we can observe the following messages its dmesg:
>>> [   57.905806] xencons: Illegal ring page indices
>>
>> Looking at Linux code, this message is printed in a couple of place in the
>> xenconsole driver.
>>
>> I would assume that this is printed when reading from the buffer (otherwise
>> you would not see any message). Can you confirm it?
>>
>> Also, can you provide the indices that Linux considers buggy?
>>
>> Lastly, it seems like the barrier used are incorrect. It should be the
>> virt_*() version rather than a plain mb()/wmb(). I don't think it matter for
>> arm64 though (I am assuming you are not running 32-bit).
>>
>>> [   59.399620] xenbus: error -5 while reading message
>>
>> So this message is coming from the xenbus driver (used to read the xenstore
>> ring). This is -EIO, and AFAICT returned when the indices are also incorrect.
>>
>> For this driver, I think there is also a TOCTOU because a compiler is free to
>> reload intf->rsp_cons after the check. Moving virt_mb() is probably not
>> sufficient. You would also want to use ACCESS_ONCE().
>>
>> What I find odd is you have two distinct rings (xenconsole and xenbus) with
>> similar issues. Above, you said you are using Linux RT. I wonder if this has a
>> play into the issue because if I am not mistaken, the two functions would now
>> be fully preemptible.
>>
>> This could expose some races. For instance, there are some missing
>> ACCESS_ONCE() (as mentioned above).
>>
>> In particular, Xenstored (I haven't checked xenconsoled) is using += to update
>> intf->rsp_cons. There is no guarantee that the update will be atomic.
>>
>> Overall, I am not 100% sure what I wrote is related. But that's probably a
>> good start of things that can be exacerbated with Linux RT.
>>
>>> [   59.399649] xenbus: error -5 while writing message
>>
>> This is in xenbus as well. But this time in the write part. The analysis I
>> wrote above for the read part can be applied here.
> 
> This is really strange. What is also strange is that somehow the indexes
> recover after 10-15 seconds? How is that even possible. Let's say there
> is a memory corruption of some sort, maybe due to missing barriers like
> Julien suggested, how can it go back to normal after a while?

The console does not go back to normal. I mentioned we get that dmesg output
after logging onto DomU via SSH, so at least the grant tables for PV Networking are not corrupted.
But the normal console is still blocked.

> 
> I am really confused. I would try with regular Linux instead of Linux RT
> and also would try to replace all the barriers in
> drivers/tty/hvc/hvc_xen.c with their virt_* version to see if we can
> narrow down the problem a bit.
> 

Unfortunately, we do not normally run regular Linux and we do not have a
stable regular Linux version with our HW support ported on it. We've been running
Linux RT since 4.14 (or even earlier I think), but this issue has started to happen
since we upgraded to Xen 4.17 (from 4.14), with both Linux RT 5.15 and 5.10.

> 
> Keep in mind that during PV network operations grants are used, which
> involve mapping pages at the backend and changing the MMU/IOMMU
> pagetables to introduce the new mapping. After the DMA operation,
> typically the page is unmapped and removed from the pagetable.
> 
> Is it possible that the pagetable change is causing the problem, and
> when the mapping is removed everything goes back to normal?
> 
> I don't know how that could happen, but the mapping and unmapping of the
> page is something ongoing which could break things then go back to
> normal. One thing you could try is to force all DMA operations to go via
> swiotlb-xen in Linux:
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 3d826c0b5fee..f78d86f1bb9c 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -112,8 +112,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
>          * require a bounce buffer because the device doesn't support coherent
>          * memory and we are not able to flush the cache.
>          */
> -       return (!hypercall_cflush && (xen_pfn != bfn) &&
> -               !dev_is_dma_coherent(dev));
> +       return true;
>  }
> 
>  static int __init xen_mm_init(void)
> 
> 
> Then you can remove any iommu pagetable flushes in Xen:
> 
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index d3c518a926..b72f8391bd 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -74,7 +74,7 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>      page_get_xenheap_gfn(gnttab_status_page(t, i))
> 
>  #define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> +    (0)
> 
>  #endif /* __ASM_GRANT_TABLE_H__ */
>  /*
> 
> 
> I don't know how this could be related but it might help narrow down the
> problem.

We will try your advice and Julien's, to see if the situation improves.

Thank you very much,
Andrei Cherechesu

