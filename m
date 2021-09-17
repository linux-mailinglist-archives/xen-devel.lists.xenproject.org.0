Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D9E40F296
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188949.338376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7bg-0006SI-BT; Fri, 17 Sep 2021 06:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188949.338376; Fri, 17 Sep 2021 06:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7bg-0006Px-89; Fri, 17 Sep 2021 06:44:20 +0000
Received: by outflank-mailman (input) for mailman id 188949;
 Fri, 17 Sep 2021 06:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7bf-0006Pr-MH
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:44:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4158203-3cd0-4ae8-bf35-2d1c21107a9e;
 Fri, 17 Sep 2021 06:44:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-OjuI2k-cPfOPcw8Mo5VUdA-1;
 Fri, 17 Sep 2021 08:44:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 06:44:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:44:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0274.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 06:44:13 +0000
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
X-Inumbo-ID: f4158203-3cd0-4ae8-bf35-2d1c21107a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631861057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTK2kMlqhZDtS1pH3nyeuf37Zb8K+rVr4lP+7nA1TqE=;
	b=E+i/XTSRLx4lKpcVdaUEug3S7p7T4mBWw8YJLznghpW7tfACOTHzFCl1nlZ8UX1Hh9GZ/D
	qajLOKhxCaBER/6L1U988YZdIdUEeURYsLcZuACsdlSvJ/EyiQBuwHC/9Jk2Cg+c/YpqnJ
	x/j33460RrxAZfXQM6cSPPJ26ASDa7Y=
X-MC-Unique: OjuI2k-cPfOPcw8Mo5VUdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYvylNVfEkYIDWQtKwtDSWTnG0C5OAknOGoxtatZPJ7uzen48rCGomCkLK4p6pTZzqwM28sGnXG5VoJuNz7dzyBnhJy0UOktWAwlaQRVNZiUS7YaJr+JqkVjIXesoxnrSJsx/zz5NxuYZrrOmk45bWTxxYThSMgZRoieTYsmdOtgDRHA42U5AooAU1Yv8jbevwtwJyuCnQP2TG36gslWGHRyuqYrpxkSNxz+KAKaennvxOoMariofx95WhoyiKiBRixFMj8rhyEkhRrt54ipaMRWW541xRK9fsfKXmbxHQVlsg2o2j4zeq+pRr4BOhnSNH/NWHDQ0s3dqnlDd7ZL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6yWu6BQ5ivwsWsLLZFhrPujMJy9qa1cwJD3Vnzeo0Kc=;
 b=cAsJkJePV3+MuVKGCMDyhSTlHooR+Dh9FpBj/2gQOJD0fZaP2fG2ocIB0kSXFJLmFXnxZ1LpnBUQRnFLjQTuI+Xcv9PZkdWwtHZGEgZhRd+oxDscvLCykALV0tFsMa+6BlVDyHziNW+k7Oyez2F41+sKpxuFzsQaDC0wqa/P0u3ixcbw65A1grHLf/1Npu8IhjVw4Hp6DudxqZWjEyJAwqSn+OYZ0iAB8aeAaSm3nD8mncCWDn671h2mJfHcuKp31a2ayhePaSwZpMmzKujhCSVt5DrSf3PN40JRi0lDsQPGvEoyk+s3VNLkdOJ8ezch8V5JvqXXyDbZWYXhnqog9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <luca.fancellu@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
 <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
 <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3cf065c-213a-b4be-1f2f-fcfd096883c1@suse.com>
Date: Fri, 17 Sep 2021 08:44:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0274.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d575d683-bf97-4287-8921-08d979a69034
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848D5A98120DDB31D07EEA5B3DD9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+hgWeDM0gJryPwvgEaCCHByJv/BIUWw01yPYakL4D/hkU7sDUixTq9Irr4cVKzTdl2O2gl6IvQKk7/GT9f35EqpbAhYVeXZHfxjrTfzdfG1r+XaIodzkfpVctKA5B6sRmvO8z2H0FJ63YI/CPYw9kgU1+dTUGj00gEgCyzEbk9gnwBOfbZm7wZ4patjt2PPmQR+Q4QhWb86H0KSlJYkc78Y2gjYrOe554YOl7RXa2r/9KBz1P7VyNNY3Mk2/hThyKH61PHOQv8W7eCbXqjt8eKE8YTRFKW0Us/R6wzJkfxEYySmtmqmxSfVLZT3FlsuoXAZinxOxmirtHk8uXyD+angUABxwj8RgOOM53fGGhkWToBm5Gyzaxp7DIp3Ew8aHDXy7LBBkuKlL0na4l7o+A/6RusImtVwoJWN3tBEBjzg0LVOezeWAq0M1za4FUB28T6yUzj/W5qQnB4J2s0n4Q40wx7UzLCKjHd1UxxdYCIpaNrNoSwEoCCcv6KP5FeMcqH7Jj08HJzRFO35YbyUG8lvBG7wpRtvqKOOqiDD4nQDNZCsp8hs0D8U4kKRUT8mc3XKu7Y63PJ+SN6oCe7hKHRPbHx9a5Eea7wN8ixhquwsN0x4N0gf+tK0j/5AbIjkg7syw22BQMQMljay68YeGT0sprYzIj58IjWSJyzjsLUXjXNZqlo8VHMVxGe9i+TO2aQHM4UVqKmKXvcr6RtabuXEngeZdoPW1DCxlrda1KXZCzuDms7kj0mTFLXW8nBTo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(26005)(956004)(2616005)(508600001)(186003)(8676002)(8936002)(31696002)(86362001)(6486002)(5660300002)(36756003)(31686004)(6916009)(7416002)(4326008)(53546011)(16576012)(54906003)(38100700002)(66556008)(66476007)(66946007)(2906002)(316002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xpM67I6jhU6+l54X1swJpGwuXIbw2iH+d842JRNrlFJWbATyFn7YS1gf3BD9?=
 =?us-ascii?Q?5JsgQMb4f2uQz7rtZNfZMiHYmACft5JpyVVDrafwc6OeO+7KGIQzC3PWROUb?=
 =?us-ascii?Q?eO7AyOmAg50YElMPTKkuZOX0FOHwhZjaniIw2uBkuKeHE03yGGr9iuKGUsz8?=
 =?us-ascii?Q?Po6U8/Tq1j46PZQ74KXccqb1Up3y/DncqdeKGQpr2MeBMmgPg/WVZCdLgaeP?=
 =?us-ascii?Q?SF2PrPwuha2Nxo6J3dpVszcDGwIhXN9Wh5azt8NWeDlxfI5nIZKqG2adyBsQ?=
 =?us-ascii?Q?23GABTFjVHpfbrMhyOsjjAwYqz74EVUpLXWduLinSfj1xD31f24HvvlekxmT?=
 =?us-ascii?Q?jN7A8FsRFnMLoR1xPppw0mqE88KshaDURrn72qg332xQOV+exVd3PKqPE1dX?=
 =?us-ascii?Q?ayQ0EvC4meyQnr4F0Ivf+e35D5wbtUlj/pAgjPShw/ulcCkhet8Y70qY3nID?=
 =?us-ascii?Q?gABknQqQtqrle3vXwf0vrcWR7y/xf/i2jYU5HbtgvaGjVNC1OFrjiMFO5aTK?=
 =?us-ascii?Q?CqO+JivRsa3Fb6rgtTJsGBBgBtPdXakEnmdwYVukuibO2UEAsw0LkFyO6xVV?=
 =?us-ascii?Q?NIiw7nMjdTOSlKnjqw7E7rcseigJ3EC3osAod7bLhI3B+9InF125BidilpZP?=
 =?us-ascii?Q?VQgN0EF9bfKHSxhCvhQxDPYr1sdmW7jNodJd5irFNX555jTh4WnIxA8bSmZk?=
 =?us-ascii?Q?3qnv+K0dxp956TsRKUobyZbTdqx+cIWC6GUN06P93fRUrj5xix/5E7BuowZI?=
 =?us-ascii?Q?Sl3NMGas78rEA20MVPGffIV3YsydAEcPVNuxHxMP0UfpK8cGgS5qiMF7RipH?=
 =?us-ascii?Q?IDz1MRgA9uqIUKPZ1PgBQf/Lktz9ElBrFysRtUSMd+BtCjRLC6QaIt+sXgrt?=
 =?us-ascii?Q?ZWpQ0EpdTXPXcYJIdabDiV+Gg1ZQvf8dT96N3UgBGGD5RG7p9nMIdLyy/286?=
 =?us-ascii?Q?pmZFUAacgjLcBJzDuRkJzOzWsaRFwvKjhx0v9DbZrbinlbWWz38u1e8CMlnN?=
 =?us-ascii?Q?aQ7mCQwPC3cw1kaL1VmKS5PkD9tkkiL1swzv9uwf/m6Zr98ds1YUqt8m1KmO?=
 =?us-ascii?Q?nftNDxM+6DhjJJb1SE2MFmz54dGkB1oG3zxbQEDknXkl2m+RGgdxLscpUSZw?=
 =?us-ascii?Q?PYutFORfixhA9Ii/A/fdg3a9OTalrGLB6altpHn1FSqorAb9H7udmWBmeKAa?=
 =?us-ascii?Q?kVIIn2SgMGqM4DAZctMcJAjBnj4GzqeySageV3D/6om88zMEzkG+bDTcgOTp?=
 =?us-ascii?Q?LfFFYmwdgr+9fOKgNcdcZ8gLXNbICVoqV70a34q6N7XnZytVHvDxtgRfoHXz?=
 =?us-ascii?Q?aXyGE/OaxJAO7xT7DoM6B6vO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d575d683-bf97-4287-8921-08d979a69034
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:44:14.1859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jExuV+Tc9aQuuKJAy2PQTmIuQEkIIf8PQ+GzJh8wSxGZl4RlIBNEbhHlUfHOw7TSeiEOK0TdvRxSvqwkN7GURw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 16.09.2021 22:16, Stefano Stabellini wrote:
> On Thu, 16 Sep 2021, Jan Beulich wrote:
>> On 16.09.2021 17:07, Luca Fancellu wrote:
>>> I explain here my understanding on dom0less, this feature is used to st=
art domUs at
>>> Xen boot in parallel, the name is misleading but it doesn=E2=80=99t req=
uire dom0 to be absent.
>>>
>>> So if you have a dom0 kernel embed in the image, it's completely fine t=
o start it and it=20
>>> doesn=E2=80=99t have to be skipped.
>>>
>>> Here the possible user cases:
>>> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
>>> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embed=
ded in Xen image, domUs on DT]
>>> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen im=
age) and domUs on DT]
>>
>> If that's the intention - fine. Stefano?
>=20
> What do you mean by dom0 modules embedded in the Xen image? I am not
> familiar with it, but I imagine it doesn't involve any multiboot,module
> nodes in device tree, right?

There's no DT interaction there afaict. See commit 8a71d50ed40b
("efi: Enable booting unified hypervisor/kernel/initrd images").

> Putting aside "dom0 modules embedded in Xen image" that I didn't fully
> understand, there are three ways to load Dom0:
>=20
> - dom0 kernel (and ramdisk, optional) on xen.cfg
> - dom0 kernel (and ramdisk, optional) on device tree using the "reg" prop=
erty
> - dom0 kernel (and ramdisk, optional) on device tree using the "uefi,bina=
ry" property
>=20
> Then, the other use cases are:
>=20
> - true dom0less, domUs on device tree using the "reg" property
> - true dom0less, domUs on device tree using the "uefi,binary" property
>=20
> And of course all the possible combinations between Dom0 and DomU
> loading.

Okay, so as Luca says "dom0less" is a misnomer really. I wasn't
aware of this.

Jan


