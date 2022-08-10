Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3F58EDC3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 16:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383663.618865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLmGG-0006P4-An; Wed, 10 Aug 2022 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383663.618865; Wed, 10 Aug 2022 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLmGG-0006Ls-7z; Wed, 10 Aug 2022 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 383663;
 Wed, 10 Aug 2022 14:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0+s=YO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oLmGE-0006Lm-Qs
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 14:00:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf4c6402-18b4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 16:00:37 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY4PR1201MB2503.namprd12.prod.outlook.com (2603:10b6:903:d1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 10 Aug
 2022 14:00:33 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:00:33 +0000
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
X-Inumbo-ID: cf4c6402-18b4-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAJhSTT/VxUPzo4y9WtVasQo/Qpv9pGalAACxJ+1cEgdttO33IYMaBXJBQTpqvQ2VLREvxdHGOA8mc/u6aezf4+sHXCSWuo5tF5/ZWT4PZbusGW0QrgFIvnasPKVtyBzz6Yb1qzZUTIJWnkgMVZFV6/dR5DYxZf9ANSBargprnFstYZHKeW8VtCqWja586LLMlrLYNmYCsNuyjtwUvL7TUaiTwwF485paNb33MiPwvRoc0l7RRAkfoWkaxlFpwTW4Ic9mYyXwPSs1X78yrmDL8cNb4U0AMLIP8RveqKEquMFZurttj93vy5kCEEF9qLrqSGpeA+fmWnxy2Jol4BNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yY7vDxjFLB6kOsgaG/z9kS3VErJMPVY9qUqtOxSxyk=;
 b=ERQNKQ1Avegt/0hUVVIjg0PNfmAgpIRWpdlcKKXKX31yiCwxGB8UavLUQDcvuMehwGxtLnepfi/Ux9/1klPmSWLHDbEBrvhl5Djgv3ZrFq3ujwX4qyFokzu+xSt49PocaY9NNdvRxb7HSNaXAwwCUAVp4q8cDAQq0eZL0NAaApaEyJEoJlYmgOl/T3KnYZZN1SNPbQVvbsQMRTUQ8+ei+c83Zire9hMaNF3DKGJn+QwOMY9FP12c7YhZcMJtHjWWAVj0NeTognVUh5Fw2OmpAMhKdHcx6tz/tALAHgN2wEFslK+dOzUxQzWzL7SYn1aDvnbNse4JZeTup26c1MOqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yY7vDxjFLB6kOsgaG/z9kS3VErJMPVY9qUqtOxSxyk=;
 b=L3p7dUrmi2mFpp3dFrE/59tO2awsZW0n6L72RqzzQw5YlAlBCWEI0jn5QbctX5B0D6XVogwF19VXOjvnbdsnOpUXdYCcICTzq8tdxoL1+b07JR7Likr7YLvqW6v8CMs2KyVDPHXNr7IVSzEACohjSEeLlEHYK6zr8NwhBi6tf+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f10e92ea-ac57-18a9-8843-781d3242f67d@amd.com>
Date: Wed, 10 Aug 2022 15:00:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220810105822.18404-1-ayankuma@amd.com>
 <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0004.eurprd06.prod.outlook.com
 (2603:10a6:10:100::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae3339b3-b8a0-466f-11cd-08da7ad8b185
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2503:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wt7E9Mu4oM68ytJ8HIliwCBZZllbB7y4KeT71VCIXRtzy3CA+bxS3qQe8MssZYhFrs08BXtAjJHlw1f6Hw3/Y5+jYfZ0Lmi2CQzj16e/Q0FmKWGVibr5yty7FXcBp8GgrCDude+JafugH7UE7mfIsb45c6fvFfUuHG9W0FQEUoYXqsw5IlfhTz+kLOlMryzCK511AQfyV6W21pJAbJcQbE2hanS2y2ZgjjV5+81sCAJ3CDZTea6d8fPPVKaF4LniAx5hnfgjVy8zMY/avUod4t7BmT58PS/TSw4cmUdg2gBqqzjaW6Sx+O66I1iUT4yC9Sx5ePSd+d4oINbsRQ2Kf3mco3DKvGS+i2H8dZQ/cOX/zyo63U+w5ByaJs0Lzf5Z/Pf4hGE3dgW+/f2IB6vkfr8B0aFP52VXyn2HKgOy2WFBhLBwMUFQ2MIdBovY/ApvmC4evc14Bi07aOi9BZPY1mcibbbEldwVA/X7YU/Qih0rcbtvuVwZbBwNb0zs4gxc8Mc/pQ75dKBwokkgbsfttL7iZc0kR3oKFj3UwKh27NvaQ17UOM52cRfNHkegfSf6Yu1BQd1i/VI5il3au6R1Pyk8fMwvqZ+wadZIaWlPPSBHszNc7Mk7RjdzWOrzEuehhp7SJnfRM3n7/hZ/+8cJZSU9cjEE3X/f86/55pwRT0196fWgzu3qOxMR8Ig03s0GI81FOfyW+pSsCMsm+G9/Gb03cN8BbGP3U/D/ux36DQ3WwCf96bzCVcjew4FA2T9emrGf35YqTkDpv6BiKlDmCte9U8ZOTLX02/mxs/QUzGukdVDHWxhk+CODqvd8i1lX5BfuBUljaN72b2EFirHsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(38100700002)(66476007)(66556008)(478600001)(66946007)(8676002)(8936002)(31696002)(6486002)(5660300002)(4326008)(6506007)(316002)(6512007)(2616005)(31686004)(186003)(36756003)(26005)(53546011)(2906002)(41300700001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RSZXFoU1BTVUtLeGVHa1M4aEtmblNMWkpaa2E0enJZUjZMUnl5ZG1TbTJp?=
 =?utf-8?B?djNEQkNwU3hFSnVFMmF1L1BTdmlZY3hrSThYR3liWVdJT29RS1RaQXh3L3Ir?=
 =?utf-8?B?YnBITWFvSHFQMWtvOEg4WUcvYjRSRE1MMWU4QUUzdkhvMUNQOVF5QU5xa2ow?=
 =?utf-8?B?c0NiYWtOaVllMy9xRUpQbEpvRjJwVml5S1BKMFA0NXVFbUVTMmtuOHJNd2xT?=
 =?utf-8?B?emF0UEw3cnBVMkVxc05Yd0haaEJsc0RGcVlyc2pJQVFmZUNSZ0xoTDZuKzlp?=
 =?utf-8?B?V0k5VlFRTU5aMzhDeWhSTHhxcDAvUXU1ZmlhTGhyM2VnMU5qNitIaUk3eWdz?=
 =?utf-8?B?dEpTc2xoUWJVc0tpL2p0L010ZytXOUdhSm40VjBhbnRWYzR3aHlEcGxpbDBH?=
 =?utf-8?B?RFhGZTUrK01wT2hlOUdRUWd5UE1FZWJGdGErQys5VkZ0RFJ4bmpXMXFMdTJU?=
 =?utf-8?B?UjlkbVBORjFLeHhjRHJHZmxwS2EvVXgyKzhveFZKOHJwZ09mdU05Qk5nOHhD?=
 =?utf-8?B?RVZvOUR3Zy9jZDVlLzBZSnc0U1NkN3RPN05PUTlmQmRRTzRCV0VENGVOWksz?=
 =?utf-8?B?bEFwL3hhVXdQQUJ6YkszaS9oUnlaTWt2QmVMbmNGK3M1ZGZHRjZjL25XVDBG?=
 =?utf-8?B?eThQS0hNYWRMUzhBUkpOWkhQazFJb1NKUFNyRDZrOVFqcWVra0lPN094RWly?=
 =?utf-8?B?N0pScTZSWHhIaUt5Y3RtUE4xRW9YQSswK1BvYzNkdFdsSTdyWXFoblFzTHlE?=
 =?utf-8?B?dXRxd1ZNbThJV0Z0SUJEOHNISFozTVIzcGJRaG1NOGhFbnpmVkt1QmlZOThK?=
 =?utf-8?B?Qm1vMUFpakwxRktiZisxaHBTMkUySnpsa3J6d2hQclliU1FWZnQwYTZJeWNt?=
 =?utf-8?B?U3k1bW1JbFNld1VRcjJYWmpLeFVpdDYrRDJvUklJbVl6bDJzb0ZjcGQrYkZX?=
 =?utf-8?B?NVNSK0F4RnFKOE8zbnU0dUFZT3VBRTlxSHc5bzIxSXlTempPNUZ1aUlZaEpj?=
 =?utf-8?B?aWlOeDVyQldsd2ZhbEg3KzF5YVJxK1h6SEIyMVpQTWpVazJoRkZob01DOUJ5?=
 =?utf-8?B?Y1E0Yy9wUkRhbm9kS2tGcVN3WTBGZEV5YUIrTFoyelhsWFRNbUZWSi80QTNZ?=
 =?utf-8?B?cmJQTllNWS93alV5QXpEOXhtMitnTk5ZdXRkQ0hJa0QwNGtjMmkzZU1XcHRx?=
 =?utf-8?B?b3c0ckF1aTQ0Qkl0aHh5bXRrRlV2OENNZTl2SjZDODdQWmlMZ21KbE9wc2kv?=
 =?utf-8?B?L2R3RHkzZnBtRVVMaFoyTXN2emROYUpoNVFQaVlzbFZHdUtiK1pHOGtIaXBN?=
 =?utf-8?B?dWtBZTArVGlLZjZ5cFVqT1BNK3o2SWJaQklxRTRVdERqRWlhd3QzaGpTQnRM?=
 =?utf-8?B?ZldBSnNsL1BPcEQrTTl4dEk4cHJXWlhSc3hENlVpcmh6b0gwSHpRQm8zamVj?=
 =?utf-8?B?NWgzMUhOL2NKc3hvVWRVQWdPWFFPWW0vckJCUzAraHBwRlFSR1J6akpCYlFY?=
 =?utf-8?B?azZFWG1vRjdVdnFEOU1NR00wbVRKZ1lHc3FMdTZXbUZsQzlHL1JtZzBHSnVM?=
 =?utf-8?B?eThtLzNrbUxUTW1lSnBLMEdDTmc0dVJoMGdNQm0yN29zTFRZYXVzVU0yL1RH?=
 =?utf-8?B?Q1Q4OGFLK2RZWGQ3UFZpeVY0ejRKMG1hZGNJTDZNeXZTWm85KytLbjVvM0VX?=
 =?utf-8?B?WmFiUUk1K3AzaUtGV3d0T0dzdE13NVRUQ2QzNGs3R1dxb0w3TkE3N0ROeGVp?=
 =?utf-8?B?TFYxQTkzcjR4VWFSNGkvR0lCdWhCcmRaWVQ4S2RHanFwdm1rMTdBUjZhL3hy?=
 =?utf-8?B?d0g5YnY1Y3A1TEVXVHBZRlJMK1RRbTRBK2NsM0lLUTJ0MVRGMDk2ZE1lR0NB?=
 =?utf-8?B?N0dkdyt3NjR4akErWGFXVDVBd05yMHlkRTZzZXJJUkVZakVSY1ByM1JUQnZX?=
 =?utf-8?B?TzBMOWlSL09QRldZcUNSQ1pDZmZMUHIrTThwalkwTEN1MHpmd2IvRUxWK1l3?=
 =?utf-8?B?Z2ZwZWFrN2pEWHNCQTVkME5qRS9HVGpoN2lrOXhsM2F4VW84SWpyUXBjMU15?=
 =?utf-8?B?QVhrR3NTZGhjczQvSDBzZEhhVDFqMGtEOVo1c1UxUm40ZTArSWNWV24vUTVw?=
 =?utf-8?Q?BYVMPhIqDwtPlAY0IjaNjlnU5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3339b3-b8a0-466f-11cd-08da7ad8b185
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:00:33.8190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnbZBUcA6vgzkj61Gmm65hC5JTsxmY4y1ja9toYKLvXk2yYdL6S/uZKqDL/OodfMYoQsH6/QovdYyy/kv8BlFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503


On 10/08/2022 14:34, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> Bertrand already made some comments. I will try to avoid repeating the
> same comments.
>
> On 10/08/2022 11:58, Ayan Kumar Halder wrote:
>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>
> You are modifying code that is common between AArch64 and AArch32. So 
> I would mention this behavior is common. Also, please specify the version
> of the spec. This helps in case the behavior has changed.
ack
>
> Also, NIT: I would prefer if you quote the Arm Arm rather than auxiliary
> specifications.
ack
>
>> CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
>> whether the timer condition is met."
>
> I think the key point here is the field ISTATUS is "unknown" when the 
> ENABLE bit is 0.
yes, this is the key thing.
>
>>
>> Also similar description applies to CNTP_CTL as well.
>>
>> One should always check that the timer is enabled and status is set, to
>> determine if the timer interrupt has been generated.
>
> I understand the theory. In practice, I am not sure this could ever 
> happen because the timer interrupt is level and by clearing *_CTL you 
> will lower the line and therefore you should not receive the interrupt 
> again.
>
> Checking the 'enable' is not going to add too much overhead. So I am 
> fine if this is added. That said, would you be able to provide more 
> details on how this was spotted?

This was spotted while debugging an unrelated problem while porting Xen 
on R52. For a different reason, I was not able to get context switch to 
work correctly.

When I was scrutinizing the timer_interrupt() with the documentation, I 
found that we are not checking ENABLE.

Although the code works fine today (on aarch32 or aarch64), I thought it 
is better to add the check for the sake of compliance with the 
documentation.

I can send the v2 patch (addressing yours and Bertrand's comment) if you 
think it is fine.

- Ayan

>
> Cheers,
>

