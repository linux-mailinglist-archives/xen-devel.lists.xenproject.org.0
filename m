Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F759602A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 18:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388400.625032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNzRG-0002JE-2R; Tue, 16 Aug 2022 16:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388400.625032; Tue, 16 Aug 2022 16:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNzRF-0002G3-VN; Tue, 16 Aug 2022 16:29:09 +0000
Received: by outflank-mailman (input) for mailman id 388400;
 Tue, 16 Aug 2022 16:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNzRE-0002Fx-3r
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 16:29:08 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10065.outbound.protection.outlook.com [40.107.1.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c2a0383-1d80-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 18:29:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7794.eurprd04.prod.outlook.com (2603:10a6:20b:247::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 16:29:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 16:29:04 +0000
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
X-Inumbo-ID: 8c2a0383-1d80-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqhHP7rTuHEKjwzHHdJw0eXedByHtbluLbsr7+ljzc8HffiIb4Hwa4jfocBa7aUoGo0HoYG0/Z7YYGYfUgoigXB6LYdQ8p6PEz71WqOR0ptFm3fU1NgNZsIQ1qDg5AUQ08sDMdtbSRjCUEtvq3e7CX7eDADDTePegOBz+y4uVEo8ND7JgXvS+ncvehUxnx6XmUs0qTv0lBKjA5dAvz2HQ4TfB0SwCw+lxyNkTYKbhzBIweXRb+hgG0VJOGjVPxTPyJwEIOWz99+iEE9J2lChSDprzf6qCdMLFsM30NQRyVD/xWI7cBeZQ6F1uN33yFfS8k2aLLbFrxLEugiNt4s0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVs/y53rm0mlgL4Mu44oEu5R7zJkpHdS6twmZrzZIfc=;
 b=JRePEkxU+k3Oh56br47L81eN4XbAoCoZuzq8mRUfMndGC0IijzUTaoHUzOQYAI6KOt/XLyoOdsMLHFmebdtyTTdIm2nArIfKVCCHCnA+Ll4cRbHIITLt/G8F9PC83GN3gVojzFEPBzU3Kh2V/79fLEi/XdsmIn/FzT3wfJzmaZJBp0TzAaOdC3dKiAfhgRyhMvuP8KaWz3CUnwYHSIeAd7lMxqW9rNW7PPX3c6GVhJGeh6ObPSPdFgiwJ6uKkdNoAW8d5FfrGtG/cehUiP5HWjx3AyunywJIw7lsz90y7wGmLx+oNvjolbWVcwBtpaImPXjyYeswsIQ4PtpBx0wHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVs/y53rm0mlgL4Mu44oEu5R7zJkpHdS6twmZrzZIfc=;
 b=MCQ6zBUwkCG+C9tGor9R3VMxsR5CavduDMyd/L/n8rKMHmC028C2FTGji7Tl9dkn0pRlqdWtgWFN/F1p0CF0owYwwX6yAsM56fki7XoTUor9RRNwc1dJ6mWSnudwvu7H+spuxyPSEW4IVIXEiKsmuey4lJ/8L1gVJWDd7E4CpstGxtRMbi3a/SFZ5J9GggRjqtu65NNRO9Js3h28XOohLB8z2aKHRz2iHHMBqLHUUUW7e/4hmGSnQkVhvgtu8yUJXsXhsrXHmaq4aAvrYnG3vQrrt41QENhiDJAt/oUuW7VKo4Bx7J3g2kJ7GKvxsV3cewtUvUYp/JkpDrTIwwNAXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff4fbffb-915d-f221-2375-87358b46eee7@suse.com>
Date: Tue, 16 Aug 2022 18:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>
 <Yvu7Dpl5Pq/E8MxA@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yvu7Dpl5Pq/E8MxA@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0091.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f2cb03-ce47-4d56-ae7f-08da7fa46f2c
X-MS-TrafficTypeDiagnostic: AM8PR04MB7794:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oHHrddPxbtuFWHaXqeAkiLfdZnui4rZsB0D6AiDc4tKOpqIiIKZqEm59+Au6OVrANkj5dCN40kAdI5hCq0x03qIZ+AK53GtQCEVoPeUzyQdiu1ytXz4YjW1AB8gyRYcccrxckLaFUX3f+/0lICJUQhqxG8TEFbtWYX+1qzGICJiAefHMQaDeqkeXt42pTJCHPv5EiNTFLdJyj0FwfVRNoD+C7v4tPfWi7v1k8bckWMXfIhpknUQjTCVEd5HWx94e9CzcMJlESkA946FxGk0z4kzwhNdl5xe0/xogvrXP5C19Ns2aIVW7fjPxw5DkVaN4KuMErKfVu5WcFOjTWlRIb5ukXRfhHQQr0OZ+mj4fTTH82gJ2LcZH4/dO/eO5MtCK5EPjv5vaHn11c5/o0VjLZLxvdrmNKhMp9M03BMngmcSOxEQb9A2XOsLYhI8mosWd7b8r3/8GG2BoiuAkSzRdNiwg90DqpD/6NLC3x+9t5mreXSOatiKIUNnvK6gPet4cBcx4gv0nxZ2fXb4sOxAE/2wMEZbi8nNCYZ5XBj85YPD8MbwBL6K2HEl3mRSv+eHJsY7TlQ8ZU/ir7gxbK0rIAE1iJ5v8h6e+fpTP2V0JfBYs68XLv2uXEtWuWWqKBBSvrNTfWR8acGhPuAPYAPHps5uDQk/fdYCPPfavOlSvdTuGKgq9xDxLHO1PkUW1Bc0CyQxrdcb/JEKxS162wNRjjFbA8lQrZmkxEwuijm79GgyzuYRM424SDCDBtHstYBRvSG5OZsQjy8E4yil5QZbmD2IcRF/3n1ns1ugwyYvW5PyNx2/u/cVQHA3MTuuBEeqziu6Gas9iyuWD6Ww7Pv8qvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(366004)(136003)(346002)(8676002)(6512007)(38100700002)(26005)(6486002)(478600001)(4326008)(53546011)(83380400001)(31696002)(86362001)(6506007)(186003)(2616005)(41300700001)(2906002)(8936002)(36756003)(5660300002)(31686004)(66476007)(316002)(54906003)(6916009)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRTWTI3MnZtWkkyQWtjMTcvTUNsUS9sYXVIY1lBRDAyZGdGbStLeE5oR0FC?=
 =?utf-8?B?Y2xZUEVNaG9UV0FyaTZocy92NmRucDBLejNsZnlHMnVPZGx6Ti9kYlNuOE04?=
 =?utf-8?B?U3hUdThUK1g1SEVhclN4WldJTjJlem1rMXY1MURoU3phUVAySW1EQ1Z5OWFw?=
 =?utf-8?B?L29YSkpoMm9MejdoVjVBT2kyZEpXU3YwSVFaM3B0d2sxTEh5U05oZXh4cmM1?=
 =?utf-8?B?OVp3MW45aXRIYUpObk5qY0lmTTJvQ0JiUlZCR1ZxYVlYUjNkSmRGRGpQYTZv?=
 =?utf-8?B?K1hoOXRod01lTGc4Q3A1VHlJVGc3U0R4UlY2TzNGaXJvN1dlT3ZDWlcyaUdX?=
 =?utf-8?B?OWlEUDB1dXhBdHlrcWtjblJTN21WQ1BYUis5YmJzOHlaempKN3JUa1JGR2Fm?=
 =?utf-8?B?amNSQ0VaQWtmTWNOT0MvRVhxMnVzazAxUXc4ZmJsMklybDRObCt3SllvMEZJ?=
 =?utf-8?B?ZUI3V3pHSlZQS21XVWdRcGtkQ29LMFpQMHhRLzhWck95eVAwbzgvZ21ZYmpl?=
 =?utf-8?B?UTE3TlJkak1laEp0Mk1zajhST1VPZEdtR0gzTEQxOWRiVjNxM0RoTVR3STB4?=
 =?utf-8?B?R214bGRuOW1peGFhN3A3dm9tbGRDRXRZdjgzbzFVblY3YzZDNEFpTWd0RnN2?=
 =?utf-8?B?akx1Zmt5SFRJQUs0c3hrdXZEYXJJVlZHeWZIMzVDZ050dW9VREhGT21Ndit6?=
 =?utf-8?B?djFlRlFVMUlMZjJLbnNOS1dsMEl6WGgva0VzbTRxekdkNjVEdVNpaE8wNzB2?=
 =?utf-8?B?NEd1UUQ1b25oY1ZaTWNZT0JKU1NWRHluWFlNV3B1cFFqbHplMFByWDlwNlRD?=
 =?utf-8?B?ZlVIN3F5NHhHaWlrSE1jcU9wcm90ZDBlUTJVYUlrUmJwZ2JDekM4UlFhL2VI?=
 =?utf-8?B?eUJqUFN5Tmx3SlJrVzdmWTZuVlBlZEV1MmJETTFqVjFhZCtHaENpUytRanpk?=
 =?utf-8?B?K3N4azVDckZ3WHRVT2FQaVpWYnZoMm1pZGpEUVNNZEV2V0Z2SlVaK0pNakp3?=
 =?utf-8?B?QXhTZXA1U0k3L0JqN3FBU0ttZ2VWeDAvRERXTDFyUHBvWk8xaXVoRmdxUi9a?=
 =?utf-8?B?KzBoOFdhMzFGbjBObVg0VXg5ak05bG9oWUtSWVlDREszeTllUTdyWVNkSkti?=
 =?utf-8?B?a2VPTFJhVzh5VFdzTEF3SzNqbVVZdko1eTBFbFRuYXRFTTJ2T3hKNDJnckxF?=
 =?utf-8?B?cEFWcVQ1M1BKSEdTY0dtV240T0l0WVJBeE85V3dNbE85c1g0WnBSL2JYN3NG?=
 =?utf-8?B?TWJmWFRFSnhESjRWeEg4elNlWDh1bWZQM1cza3JocDNHWURacEZFVEZScWpZ?=
 =?utf-8?B?RFpkem5HWVpCTDJ4aUp4YnRsRjl0aThWMlBWdGxidGNtT0NvTlBuUXVqMS9W?=
 =?utf-8?B?NU5wUHJraEFQTzdSZCtlaTliZk03Z1ViT3hVR0ZRSXhFak91OTJVdE52KzVj?=
 =?utf-8?B?Um5UUEkwMmQ4MjVHbDQvL0tnbk4ybmNoQmZRVkxzeWF1NnNVaGhpOWROVU1z?=
 =?utf-8?B?Z3NObTArMkhsVVN3UjVGa3IvMEhNb2d2UW0xTHFvckl2OHUzNGNqbVR2a3hi?=
 =?utf-8?B?SHV4b21OZlF3Yit2Z1RaaFhmeVh5WkpJZVhidTFuenBESUhYZXJjSVZWVUxC?=
 =?utf-8?B?VFZ5cFNNZmVqNXYyM1RoYkJNWUs4VUl3TmRVcmM2YzhsU3d2VjA3MDRtbkQ2?=
 =?utf-8?B?NEtWWjZKQ1pTc1dxbTNTekVDQ3hUcTAyRi8vZk5DUEFYbWpiNjdOdmZPbjlW?=
 =?utf-8?B?Q1c2YnMwU3FMelVBZnE4L0l3R3M2MlpWbWxMbkhsSWZyaGhJREdhTm5ibnVE?=
 =?utf-8?B?K2ZiR0ZHa0hqb2wrbWpzTjRBSTZHNElzSEJ6a0h1ZUlpMk5td241c3I3V2FE?=
 =?utf-8?B?NlNnTmN5MVdqTVpwbW1SbEE1YUROSlJYQVlZcEdQS0c0YmFvcFkwNnNRdWhL?=
 =?utf-8?B?VE11TmQ4OTl0MW9TQy91dnVIV1dhQnJPSXZZcE1haEtCRW1qVDZDSzdaTkE2?=
 =?utf-8?B?RXlOVUtsQ1pPK1RhaGdHWmpuWEhQNktrZTJuODc4UmJ4amtaZE1oOU4rV1pO?=
 =?utf-8?B?VStBS01xRUtHZENBdEdjRVVod2xzWXdHRWQ5SHVVenNVaUZSdStRYmVLZ0pM?=
 =?utf-8?Q?76jAPBr6A74wOK+N5BEjijpbR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f2cb03-ce47-4d56-ae7f-08da7fa46f2c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 16:29:04.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUhu7AUfHmeOHlpN7zTDELbZ8A8qfN9pY2auUnhFbYFrI7jIoBYsC0f4YHF9MYb3e9kDH2r67HmA3Ngc0FacSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794

On 16.08.2022 17:43, Anthony PERARD wrote:
> On Tue, Aug 16, 2022 at 03:02:10PM +0200, Jan Beulich wrote:
>> On 16.08.2022 12:30, Anthony PERARD wrote:
>>> We can't have a source file with the same name that exist in both the
>>> common code and in the arch specific code for efi/. This can lead to
>>> comfusion in make and it can pick up the wrong source file. This issue
>>> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
>>> one example of an x86 build using the efi/stub.c.
>>>
>>> The issue is that in out-of-tree, make might find x86/efi/stub.c via
>>> VPATH, but as the target needs to be rebuilt due to FORCE, make
>>> actually avoid changing the source tree and rebuilt the target with
>>> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
>>> exist yet so a link is made to "common/stub.c".
>>>
>>> Rework the new common/stub.c file to have a different name than the
>>> already existing one. And build both *stub.c as two different objects.
>>> This mean we have to move some efi_compat_* aliases which are probably
>>> useless for Arm.
>>
>> These useless aliases want avoiding there imo. Already when the original
>> series was discussed, I requested to avoid introduction of a file named
>> common-stub.c or alike.
> 
> Yeah, I've notice that. This is why the build is broken under
> specific condition.
> 
>> If names need to be different, can't we follow
>> boot.c's model and introduce a per-arch efi/stub.h which stub.c would
>> include at a suitable position (and which right now would be empty for
>> Arm)?
> 
> That seems to be possible. But how is it better than having two
> different source file? The only thing is to avoid exporting the
> efi_compat_* symbol aliases.

As said - I think they're wrong to have in Arm. But if Arm maintainers
don't care about them being there, so be it. As long as they don't
voice a view, I guess as the EFI maintainer I can sensibly ask for
them to be avoided in a reasonably clean way.

> The downside is we would have another weird
> looking not really header which is actually just part of a source file.
> At least, "stub.c" and "stub.h" would be two different names, we just
> change the extension rather than the basename.

Whether that's "weird" is certainly a matter of taste ... To me,
common-stub.c also comes close  to "weird", fwiw. But as I've tried
to express, if I'm the only one disliking common-stub.c, then please
ignore my view and I'll nevertheless ack the resulting patch. (That
said, I view the vpath issue causing the problem as really the one
that would want tackling. There shouldn't be a requirement for
files to have different names as long as they live in different
directories.)

Jan

