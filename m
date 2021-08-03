Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD23DEE33
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 14:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163437.299389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtrA-0004iK-3W; Tue, 03 Aug 2021 12:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163437.299389; Tue, 03 Aug 2021 12:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtr9-0004f8-Vg; Tue, 03 Aug 2021 12:49:15 +0000
Received: by outflank-mailman (input) for mailman id 163437;
 Tue, 03 Aug 2021 12:49:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAtr8-0004f2-4g
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 12:49:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4851ec8c-8726-481c-95a0-9f266c48ffc6;
 Tue, 03 Aug 2021 12:49:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-jwMLj-AyP-W20KIaN0BimQ-1;
 Tue, 03 Aug 2021 14:49:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (20.178.127.208) by
 VI1PR04MB7149.eurprd04.prod.outlook.com (10.186.159.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15; Tue, 3 Aug 2021 12:49:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 12:49:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0226.eurprd02.prod.outlook.com (2603:10a6:20b:28f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Tue, 3 Aug 2021 12:49:08 +0000
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
X-Inumbo-ID: 4851ec8c-8726-481c-95a0-9f266c48ffc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627994951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55jTq4CqjwQbmr9DMyHcAh0GjKmlWYPoZsb6GNOXv24=;
	b=eHA7OIIhPPKhCmINtMjvxZ/M/BGUwTQA0k9ZKCc+/sB2RV4x3pKcMAZHGxi0jAzVNtJX2B
	CTJnODHK4tvYXjxQMdt3By42sHsy4rBGHVehmK94SsyZG9HuHLd6in3vdJoYLhmzXDgFD/
	cx1zkTmazYY4Bwhwcvh3zsNNiOZdHCg=
X-MC-Unique: jwMLj-AyP-W20KIaN0BimQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llni0UMx0J+qnfwMHK1dRPgm98AIsy81EtPhRlbyZLa1JpbufYAtW7DPLy+FUgNeXVKei0ejIe015CHUCOCGUocEQLQuGIR5GeHzPKnJ8vedNy/KTKksjOD6oGVHzhuNafR2VCO8JCgXqgPpfLVxL/C3qpmdtBYn+hhlTW4D4FhD8U8tX/Kk+G59zAMT2WQfOoy1mQ9IXuXFM8rxcNDV3tHGJsMwAwzutKqvBi2tuReZynSwr8mJrHZCXF9qEZUfMhk9QjH65BgWwFIxjD4TFVUW5XghMiuQfg3Yf3kwpJiscRqI8qCRIEDbTwsGtZ6vNkF5M+GqRwJb19h3xpjdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o1+euuGaeef4K+5sV0xHolnET/doU0w/KSKPmokUHY=;
 b=MKoBIaJuVF0M7RMkFRe+sQtk6lA/nc56v3pZri99BHS4W/GdcsJXg2Nmwq8df5YLc8t8z1RnhfSiEw/h7KTUDu7ofyqC9w2TJ0dVSV3JnKt1dutmFX88Ek+1qZajdU+C/BWphjoiCng5OhzWOwQqYu17x1FobquZtscbPwRUeiJGhk1NT71JzzOycfKdF60BIJFCLj+pTb/7msKhLOxyHS2J60d2X1tOgdwMljFyB1OniXFy3xcVUD8w2KWxYmLAkk+Ow7sGvgdXGIPzS0oxNqfwr3gbtQeOthFF2bsXMdzoNzTLhMGw+/c9eO4gck0//K2w0Ry4jDUUjhhKhstnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com>
Date: Tue, 3 Aug 2021 14:49:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0226.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5766c4f5-4527-44d3-e566-08d9567d161a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71492EE80562FA35D55EF172B3F09@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P4h8Xt2Na+oNLNQpAnB8WEjHHzbbxzloSt9ewLm6v3cjUjSRDKcVKV2ZtVz6qlEuHyW9FZ/8JXYQSHFZQakakNeM33U8d77u/Vcvtf2omFeDqhOk2+zuw4zEcrgjJ8sBFpxgISSW/mkObUv30A03p1fEgh8Cv7HvT1jRHVg+R2plIDhnP4n1X9MRX0Rg2kkAReHjKNxlx5H6xBjKnVs95L0cixJW4py4Km2mbcC0ZcXw0eWBpAshuunNyFqupYLSBNZQrQvaBo195QsxwZZVvZZeTBEANmwjVpuknT7uDkfqylY+zbpSWgyUhSNaVyjda05owRyScPNMw3knsoMb5nTT1b12DSPMxqxqGlAZJYQYkM5LNIJHfzQKX3fy3ctmI2YS8OpoGYZ920/7kZ4RCzh0yzFnn4jF/rHDv7c0lCyGrJsM8/spXwr+Q30I2tbu/OxvT1PRJcH++UBeJOlI0pCpgQKrlcIPSBQpcnctfdDOVW+0xy2m0Y4eKYMSt1Dgw/Av8ffC6sle//Zx7NOyqKUkZCPyBcIQaSlUjviMKSrQGruUfk4Q/64FNbWYomOoQAK3uQ4nR7XFLJ1ZqAz45Or7xhMQv8yOr6FGy7q4QqRmNQSn+Z5PglZtFiZ2Rx6vgfmtWyt9OlndcpPr0P86ArDUOMA3lv4RmLdDKZ6+YN+QpmIwKrFXI1a6HB1ucT9XrvZTeFPbNNkbG+3MDfT9alf08o/Uboy+gw2nRdVZCa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31686004)(5660300002)(508600001)(7416002)(66946007)(66476007)(4326008)(66556008)(31696002)(86362001)(53546011)(2906002)(36756003)(54906003)(110136005)(8676002)(2616005)(956004)(316002)(8936002)(83380400001)(16576012)(186003)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ozJsDIsNMZSkLkf8zxW5Gxq1GLjwa00PrdpFzKHkFEfdCvPj9I0zSW9se3A?=
 =?us-ascii?Q?WHvYusqSlS57eLXzCDYQfZHq61EvO1Kb2bcLj/IKu0MFBEnDux+/tQ/10mLJ?=
 =?us-ascii?Q?gwG/c7x7gRAiQngkzkGGd7aLa7Pb1V8EA4AIOqAYbYqq2pTXIP+sCJAvuM99?=
 =?us-ascii?Q?96h955Hon5mq6g55OmBdDhT54MfMEXoGE4YqYE67TpopbkXSZFIDd0V4+Ok4?=
 =?us-ascii?Q?ssVhD2x0zu+yOYw7XdYWSmRUwPFc6FcJ8SbwXNpFlOvmjUMx0iOKhh9yGOrz?=
 =?us-ascii?Q?b+HNCwsCinD8TDRy+VOXfmQ+dqHqAsBX1dit7rw0zgrDBv8ZVxA1/4H/NnFj?=
 =?us-ascii?Q?eZmFR6Y5eNZKbm4eIWSXU0oDeaPtE5t24/iIiyYYJ6tgWE9pW9gYrDVuMZ8N?=
 =?us-ascii?Q?SVygFzBXssAxXtT8tbO7xZLjkjAPw4qJRNbsuH8mXsdGIYywfuPw89Kc1P2L?=
 =?us-ascii?Q?nTbYPwcf1fRWmnKPdMtQyNls1zQ1KNjDndMqPB1uNl56CzTPzfcucgUfZRCP?=
 =?us-ascii?Q?mgDqLF/cw2SzPM2+hWFlDNmCtH/VwXpQzsLDTU6/duaL74QqTCQVHbQeuWLT?=
 =?us-ascii?Q?Mr8PxzFZs9HCct5M32HdwYqzP7mKyp/IOnlkXvp4yKJ/RHlgdspWw44fLUg2?=
 =?us-ascii?Q?Q1NJzQtoFMtiGsz4mfwqkycVYGrempQJu42VEfZsrvZ1qcvmFXCCQuxkyoFj?=
 =?us-ascii?Q?aUqp+UoC+eUXH0dQ3MCQr2iRaQxH1F1xQQFgdKF6REiatemWuB0bt5K9crYN?=
 =?us-ascii?Q?EvgElQhmUHojRv9qjS4vqLCZYwMLnkQSQN5YcB5Jf7kIVXB5yhLIBBeONbQD?=
 =?us-ascii?Q?4zHbVGT5q0B1WUAQbPnlZDHGZBzMhE1Of6IRwG0kvn13Koo1JIZLgoLXsaUn?=
 =?us-ascii?Q?jhtA9Jd45lotQOtWKi0hNtB50DpTSzXn0nISKl2YOHX9ENIT1a4aFjiaTZUK?=
 =?us-ascii?Q?mHRoa10i2VenR0afTriXwG28689rvXNGrRobcdcu3loN5KryARiwlnIVS32Q?=
 =?us-ascii?Q?JbvGKSd9tyIWAwCpAl9OzTCnPadHO9xM26vAmr5w4L0emvrCIJ7VAqwFRks1?=
 =?us-ascii?Q?bGpcxoj0ZjSCS3SlBMk8DxB72hVigZLqcupabCpyEGfxswTXWlSLZEZlSzbT?=
 =?us-ascii?Q?lQ7MZ3acetX0MfJ1Y96SGJgY4CAPFZgAClK952bML5IgqG+RYCGwZrKKEWqJ?=
 =?us-ascii?Q?4k7z9JzY5EA5lvyjrTl1rOnGeyyB+ktPQrgyGg4Ax7Uu/mPSLPxHSQhhCSDn?=
 =?us-ascii?Q?eg0YyvQfaz1O0jiciQT84WOVlo5rP8iExcixSYoEswn+/pfvfPsvmfo4r9BC?=
 =?us-ascii?Q?Muu9nBprkiYgPX2uRqd9/oVG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5766c4f5-4527-44d3-e566-08d9567d161a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:49:09.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBp+66G9xE90qqafL9Z+snlt7jvv2Bkz7uXkYx99uIJXWvlAn7H3szhpV5mr4W7wULKsdoo/Sjg0QboXUIMGVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 28.07.2021 21:53, Julien Grall wrote:
> On 28/07/2021 20:00, Andrew Cooper wrote:
>> On 28/07/2021 18:27, Julien Grall wrote:
>>> On 28/07/2021 18:19, Andrew Cooper wrote:
>>>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>>>> query hypervisor to find regions of guest physical address space
>>>>> which are unused and can be used to create grant/foreign mappings
>>>>> instead of wasting real pages from the domain memory for
>>>>> establishing these mappings. The problem with the current Linux
>>>>> on Xen on Arm behaviour is if we want to map some guest memory
>>>>> regions in advance or to perform cache mappings in the backend
>>>>> we might run out of memory in the host (see XSA-300).
>>>>> This of course, depends on the both host and guest memory sizes.
>>>>>
>>>>> The "unallocated space" can't be figured out precisely by
>>>>> the domain on Arm without hypervisor involvement:
>>>>> - not all device I/O regions are known by the time domain starts
>>>>>  =C2=A0=C2=A0 creating grant/foreign mappings
>>>>> - the Dom0 is not aware of memory regions used for the identity
>>>>>  =C2=A0=C2=A0 mappings needed for the PV drivers to work
>>>>> In both cases we might end up re-using these regions by
>>>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>>>> is in the best position to provide "unallocated space".
>>>>
>>>> I'm afraid this does not improve the situation.
>>>>
>>>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>>>> subsequently a new IO or identity region appears, everything will
>>>> explode, because the "safe area" wasn't actually safe.
>>>>
>>>> The safe range *must* be chosen by the toolstack, because nothing else
>>>> can do it safely or correctly.
>>>
>>> The problem is how do you size it? In particular, a backend may map
>>> multiple time the same page (for instance if the page is granted twice)=
.
>>
>> The number of mapped grants is limited by the size of the maptrack table
>> in Xen, which is a toolstack input to the domaincreate hypercall.
>> Therefore, the amount of space required is known and bounded.
>>
>> There are a handful of other frames required in the current ABI (shared
>> info, vcpu info, etc).
>>
>> The areas where things do become fuzzy is things like foreign mappings,
>> acquire_resource, etc for the control domain, which are effectively
>> unbounded from the domain's point of view.
>>
>> For those, its entirely fine to say "here 128G of safe mapping space" or
>> so.=C2=A0 Even the quantity of mapping dom0 can make is limited by the s=
hadow
>> memory pool and the number of pagetables Xen is willing to expend on the
>> second stage translation tables.
>=20
> FWIW, on Arm, we don't have shadow memory pool.

Where do you take 2nd level page table memory from then?

>>>> Once a safe range (or ranges) has been chosen, any subsequent action
>>>> which overlaps with the ranges must be rejected, as it will violate th=
e
>>>> guarantees provided.
>>>>
>>>> Furthermore, the ranges should be made available to the guest via norm=
al
>>>> memory map means.=C2=A0 On x86, this is via the E820 table, and on ARM=
 I
>>>> presume the DTB.=C2=A0 There is no need for a new hypercall.
>>>
>>> Device-Tree only works if you have a guest using it. How about ACPI?
>>
>> ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
>> based on it.
>>
>> But whichever...=C2=A0 All firmware interfaces have a memory map.
>=20
> This will be UEFI memory map. However, I am a bit confused how we can=20
> tell the OS the region will be used for grant/foreign mapping. Is it=20
> possible to reserved a new type?

As with about any non-abandoned specification it is in principle
possible to define/reserve new types. Question how practical it is,
i.e. in particular how long it may take to get to the point where
we have a firmly reserved type. Short of this I wonder whether you,
Andrew, were thinking to re-use an existing type (in which case the
question of disambiguation arises).

As a result I wonder whether a "middle" approach wouldn't be better:
Have the range be determined up front (by tool stack or Xen), but
communicate it to the guest by PV means (hypercall, shared info,
start info, or yet some other table).

Jan


