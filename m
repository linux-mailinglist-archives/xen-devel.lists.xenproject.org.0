Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA44148C0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192694.343266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1J1-00072F-50; Wed, 22 Sep 2021 12:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192694.343266; Wed, 22 Sep 2021 12:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1J1-0006z6-1X; Wed, 22 Sep 2021 12:24:55 +0000
Received: by outflank-mailman (input) for mailman id 192694;
 Wed, 22 Sep 2021 12:24:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT1Iz-0006z0-K3
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:24:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15b782f2-1ba0-11ec-b973-12813bfff9fa;
 Wed, 22 Sep 2021 12:24:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-QGSkeAv_OviTZR1esa0JjQ-1; Wed, 22 Sep 2021 14:24:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 12:24:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 12:24:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 22 Sep 2021 12:24:47 +0000
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
X-Inumbo-ID: 15b782f2-1ba0-11ec-b973-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632313491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCMh9bDphYY+wjeyyZf9GP7gqy+UqEdPNOJx6gA/LDc=;
	b=a/lVFkF2/rtg/mkuptO2M51pLkcmnWmKUCYzHb5xKuc01abkPWCFDnNIcx0I1LNbd2vs5C
	LA7FjV9emy/GKfk4JCJdtu6xVIJ6aSw3OeGoz7yiyww/JaKzdAQkQwVomBHaoeB/u/Xf3b
	wMDmYP2cTOW6Q/Wj3tyT/sO05YH+xt4=
X-MC-Unique: QGSkeAv_OviTZR1esa0JjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt0AHIyFJea53EXhlvzsU4NobEdyVidjcGMFcBg+7xKjDJeAlyrNbJs8sBWv0Cn4IfZOG9a9YvD1iZRWACq6xs+KoXdCpJOibfDNCfDeg+nwn+V7zW4MIJH6PcM5i/et3pM9HKuSY9/5QrU1PYygG4dVbG0411rSE3hBJnKWMeU4MG1DBRaK79R96ZaqTGe8y+dlalqHPGOTVd4Jvp3iW9AKl1J1nyR74G+a3ZcbcPumQhneaPUEUxDt8Lw0otOB38nRI8Y0SLENKzeAy4VAufXvgEBRbY9kvxPyM6nGRHa2Uo5hyyVn3PtpK1QZodPyos0mR2cD0YNdlgoWiHhnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bCMh9bDphYY+wjeyyZf9GP7gqy+UqEdPNOJx6gA/LDc=;
 b=Pcrrynkj+l8bm/zulE7UWeSVTyaSwFaEMeYThAdD96IXGQe/oo5m/RZDsFbtTc6+lTekygt3N8dV3ASF1DkpgQcxLk3SC3aUqIg9u8sL+nkEdo+LNJ+zuC1CECkoesi8llmhhfbTNtKjbPZZ5sMcDuQlBcOXnv6Nsqb3kp27nk806kFN4oUqFMMC/3SXuw8vlDVUUchDQ1OB94yghT/mnwA1k4xLxYhSTgAR2ZHPSNVahCPR+bAfqsvd8vhYFAsMuhVmVLBXPtZFjA5b372n92UjQuifiL9NKoWy0QLw17xGeOdB86zTtjmgDpPJfuDwhZOf7UW31qkhd2WjnGW7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
 <24907.4491.895219.37845@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
Date: Wed, 22 Sep 2021 14:24:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24907.4491.895219.37845@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af1676f-0ab1-40fb-d482-08d97dc3f7da
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37744115C910337C8996F14DB3A29@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnSju6is7a/PIKrfl8O3M0prz4OZC1y00xjQQE1IhFRNvT4RRru4XHkS7PdDcm8rRpLpW64JK5cb9O+jfL37xiedqDSaYmq8wF2dD+CAUrqlsduxXdainOwl3UFEhcd6xY2XpLmg3rQGQdgG/9s3qPoI7KxlFB6AGGOetJ2dSo64pUOMaULBCs8xcxRqFfyDz2ZFKI5CEUvHnxd5bzYHAOrOUfEU/pZYMvSwbs33PFmt2HKrpr0yHaDEBBJUktScJS3DUTCtlgKnVe9ZP1o8BUn/oLPb3OsgJ9M+ESdOixhL/bOHcNjZkOpX0y5z7iXlPTeAHVVI0i+f21LNow7kIa6bUP8BgOrWaZPtY9FpcxmfvDxV3pVB4IqnAQaabVVEaffT2SBTrZhAb9DzyXnKVn5ehuWT2UEROIHGnMGgyM3HEs7opi4HA2MAXNIbUa0WHJ8/mkGPUuDL2SH/oX3468oae0zJE5SPd/+bdWMNSy5vu9RpR+QalI89AyfzEmYEivDc1MJfxiopHZ+DV+FGIcAXH7wWXcoRe9AwErka/8tU1qe7jQKLJuQF/gulT7Xa/oMwtTlJbNqvM41bYW3UdW/WtJIh2oDllYlHy3TfTwy7s8i2awQt8dZqdGqGN2ImLpZsAxdW1v4h+Lg4UMlXol3j6EGB8JZ39WBAzGHkOJcx3A/8s6PB+O4kl+yimB6HKAzknIfIm27pHqpcqOIsOZDV7VZEIqEDsgw9ybm6pqIPc+lQqerKitGgxunYyHxmcg6YanMXemk7p45HanLhcsIl5B/WeUlBZTymkjdztelwuMxBbGTal3yi0PYMlnibeEUQpVrDvDl36udjs2/SELRIz1P/WI/EuNkhpXahmQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(16576012)(966005)(8676002)(6916009)(66556008)(2906002)(83380400001)(36756003)(956004)(8936002)(2616005)(38100700002)(4326008)(316002)(26005)(66946007)(66476007)(86362001)(53546011)(5660300002)(186003)(6486002)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0V5Sk1Jbjk3cHY4c05HWkNIV1RXRytQRVhoNXgxVWZvWmpVQStvWG1EZ2NX?=
 =?utf-8?B?L05nVzRBTkMzcEgwWUR0d2xwYmV6WjJYSFl2T1VDYXMweU9DMFBSSmlPYWlT?=
 =?utf-8?B?c2xBL3N3Tk1mMkh1bFEweVIrenhtSG94dllPOWNTZlViWEFxb0pncFdtU0tk?=
 =?utf-8?B?SXkzdHdFdmx0YnVWTmtOaG4yUlJ6eXF5VnlLeDRCTlRkK0V5Z2ZJZkZMenpD?=
 =?utf-8?B?U0dGVlpVWjRHVUk3RDBXZmEyRHN1YWFxZ1JQRWpjYXhpWGUzc0FZeXBqWnN5?=
 =?utf-8?B?Y05SUmZjdDBQcHdFekE5OWZSaHlZTDVvTWZ1VTRBdFpDSnJyNmRsc1NpVWZu?=
 =?utf-8?B?V3ZGR1h2NWlCVXVBZHcvWWwxVW5DREpLYjVxalZRZ1JTOHMzMEFuaXZHMmwx?=
 =?utf-8?B?c2F0ZXVYdjNpZmtnUnVGT2tzdjJhNzYzbUZDbnNiQ3BuNHE1d0xVNXdGOUxy?=
 =?utf-8?B?OURxdHpwVWpFM2NveHUwYVl5VmNyUndGWlUxUlJZQkZmSTJuNmRUcm9GTWdl?=
 =?utf-8?B?V3RqeHpha0NUZVkxV2cvdmpMcHpMN0JsQnJJUGUwbTVZUTdaR1BEemtmd09r?=
 =?utf-8?B?QkpPZzkrOUI1eEJwTExYS3FqMnpIRUNFc2duNHJGZTlQc2R5bGdLUEtlNlBr?=
 =?utf-8?B?Rk5pa1JlV0RXYjhmbWNkSTNTemtUZzRwOXZGVmwxVmtPb2dGWHRmU0k5TnhU?=
 =?utf-8?B?RTlDUFgyN01mc2s0RTk3OW5LUnZ2VmxpNnRFNmE2bksxYldYMTZHdkdZL3Bp?=
 =?utf-8?B?a0FTN28yN21DcUFTbnVGeEcrd2RlV2ZRSHdWd2psRUQyQkFpSjAwSWZWVUU4?=
 =?utf-8?B?NHoyV2dzU2UyUDJwMFZ6T01DMG5Tc3BrZ2FYR1ZNVEhsZE4xWmNITFdCc25K?=
 =?utf-8?B?VWNzSkdXNTZpSmFnRG5tRktlVEsvL3JGUjhpUFdWbS9wU0lGZjlMcVF0a0g2?=
 =?utf-8?B?Z2hXbmphOENPT2hVejRHL3RnQzhqVDROM1dYbm9QREp5M1FjYVFZRkhXTkNJ?=
 =?utf-8?B?UjJrNDlUL1ppKzRGTlcvcGFPeVdQaUpUbk1VdjIwamxnbDJJVDNnSFN5QWg0?=
 =?utf-8?B?cS9VdXhmNTNlcFpNREhmVDA2RkJ6TE5TVGRIMGkrdERZUy9wdW9mZm15dnBD?=
 =?utf-8?B?OG9obk1oaGN2Qzd4QjdubGlrT0tKazRmanplNEpWelRNQzljSVNJdFhibmV1?=
 =?utf-8?B?QzZCTEhlWDJyM2pXUzhaemxGaHdUREZFRC9MWFMrTTdKdGVQa09wbjRZSVZy?=
 =?utf-8?B?UXVwVlplM3gyeTFnQUxFa1VhdjNleTVpYnVncE5CcjA2WFdnbkJuN2M2UmFx?=
 =?utf-8?B?YWw5T3VHT3ZUVVRUOGJqai9VQmswOUFkd2k3bkNYU1RVWlhSNnNZNDN0TjFH?=
 =?utf-8?B?K1J1YU1WakJxdDJLd1lkdUFSYVZjSDhHVmhhN1YrbkN5Qi8wa0k3Q0g3MUNm?=
 =?utf-8?B?aEJSR1lJNWxPdHhLckhVU0dzdEpMbzlueGppS1hxbXByYURSeXN6LytLQXVl?=
 =?utf-8?B?ZTdTZzRSTEE2TElnd1I4bytPYVZyZW5wWDNZSkdrbE9QRVRuckMwRW5CUzll?=
 =?utf-8?B?Z3BOQ2JtOGloVlBMM21FNW9TdlFxZlQ2WjJoUGc2NUhrbVBVNzlTcXpEY1ZE?=
 =?utf-8?B?TnNNcFVPMnpaeHpib29PeVI4am1NM2pTbVVzajNKSzhUTlJpa3NHUzRHaGhm?=
 =?utf-8?B?ZmEyRm1MbWczbWxCbjAwc2ZUSmMxQnlCRXY5MkM4SXNVUytXOE5YWXRiMlB4?=
 =?utf-8?Q?Mh5Ku103n+LXpDhce0EH0f1JNodYGFpddvuQNqU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af1676f-0ab1-40fb-d482-08d97dc3f7da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 12:24:48.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKW4tgLla20Uodc+DUgsNwLTVT45n7bhyWHuVtg2gCYFKZvyO5M37vjaF2n4ndDOhKN8FWovyC1dFP7CjCoaRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 22.09.2021 13:20, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
>> On 22.09.2021 01:38, Stefano Stabellini wrote:
>>> On Mon, 20 Sep 2021, Ian Jackson wrote:
>>>>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
>>>>>
>>>>> there even look to be a number of higher order pages available (albeit
>>>>> without digging I can't tell what "(C)" means). Nevertheless order-4
>>>>> allocations aren't really nice.
>>>>
>>>> The host history suggests this may possibly be related to a qemu update.
>>>>
>>>> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
>>
>> Stefano - as per some of your investigation detailed further down I
>> wonder whether you had seen this part of Ian's reply. (Question of
>> course then is how that qemu update had managed to get pushed.)
> 
> I looked for bisection results for this failure and
> 
>   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-libvirt-xsm.guest-start--debian.repeat.html
> 
> it's a heisenbug.  Also, the tests got reorganised slightly as a
> side-effect of dropping some i386 tests, so some of these tests are
> "new" from osstest's pov, although their content isn't really new.
> 
> Unfortunately, with it being a heisenbug, we won't get any useful
> bisection results, which would otherwise conclusively tell us which
> tree the problem was in.

Quite unfortunate.

>>>> The grub cfg has this:
>>>>
>>>>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
>>>>
>>>> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".
>>>
>>> I definitely recommend to increase dom0 memory, especially as I guess
>>> the box is going to have a significant amount, far more than 4GB. I
>>> would set it to 2GB. Also the syntax on ARM is simpler, so it should be
>>> just: dom0_mem=2G
>>
>> Ian - I guess that's an adjustment relatively easy to make? I wonder
>> though whether we wouldn't want to address the underlying issue first.
>> Presumably not, because the fix would likely take quite some time to
>> propagate suitably. Yet if not, we will want to have some way of
>> verifying that an eventual fix there would have helped here.
> 
> It could propagate fairly quickly.

Is the Dom0 kernel used here a distro one or our own build of one of
the upstream trees? In the latter case I'd expect propagation to be
quite a bit faster than in the former case.

>  But I'm loathe to make this change
> because it seems to me that it would be simply masking the bug.
> 
> Notably, when this goes wrong, it seems to happen after the guest has
> been started once successfully already.  So there *is* enough
> memory...

Well, there is enough memory, sure, but (transiently as it seems) not
enough contiguous chunks. The likelihood of higher order allocations
failing increases with smaller overall memory amounts (in Dom0 in this
case), afaict, unless there's (aggressive) de-fragmentation.

Jan


