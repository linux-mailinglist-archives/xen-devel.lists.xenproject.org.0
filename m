Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB86416B83
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 08:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194943.347348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTeao-00017w-VI; Fri, 24 Sep 2021 06:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194943.347348; Fri, 24 Sep 2021 06:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTeao-000169-S5; Fri, 24 Sep 2021 06:21:54 +0000
Received: by outflank-mailman (input) for mailman id 194943;
 Fri, 24 Sep 2021 06:21:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTean-000163-Bv
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 06:21:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b42ec4ef-1cff-11ec-baaa-12813bfff9fa;
 Fri, 24 Sep 2021 06:21:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-Mw_5A7hPOby7RWzliVmJvQ-1; Fri, 24 Sep 2021 08:21:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 06:21:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 06:21:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 06:21:46 +0000
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
X-Inumbo-ID: b42ec4ef-1cff-11ec-baaa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632464511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZrB8F6ggnte03TqI3CxjcNTLp1b3ryilcCbfzjkUgA=;
	b=NpJcbwO8ABaMPmn7lnIF3dkcO3sif5q8Tb7EkQEEBqNUZfmr5ReUh0N9OOe4aRv5vynS1T
	gUX1aQG89sa1NJXTqkqoPbAseyTsHWX1LQ6Rh9SpHvjdBrnPU4+4qG09M4qPkZw6o60Xtk
	/K7pYlOde+b1SyEE/8AOXcuAnzX966o=
X-MC-Unique: Mw_5A7hPOby7RWzliVmJvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJmFKRb6VQ/3OAfJ3Lu+0jhfnXaIYX0lt7p+4cG4i8IU6clAZI+KyONjVKXmhjx22+ySlKDMQBLEh1QglqogZEtLYq3H3Ju5u8RY0PiBtpAtZwyoQyMKY9UGCGikaB1c80LXBAj8XfiiJXV9h9pQrxd2vKz/qSbczkTcNOumYXHsnoB8HdwIjt+6/3cVvp4xkK09SSwCFU1ky/4K7LAuZ4G7XMyhrhuSCnz/+3v36pFlrTmHQ1jsnyLzTEwyBDQ1tgLKmB1la5xuRL5u0ikokP0xwvkvARgnRf7udJ8nKDdCVVFbIRKnDQH0Lf8Lka3TKHkNkz37fJryWDdiQMh6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7YEc9SYiPPjqILBDuFB6z1o1QMRBbd1GcrnJgtX+fik=;
 b=KHjAAHEesRJXyIq5+zU1KWib3S1EB4CXFGLdWAR4qg09Cj3gbJ6xJDzPCFfhTyPgq/w7y+Evy2HdsrIL6B2fqn/ugdHtVajVVVKikd9S11dzbJaGH/k6RRjwCTiZGoALMhulzJNoBWo4SaOdY2qX7/kS0s5TgWJB9I+fT5n/3ki9wLgKbsl3enZccrwfZt46pHY15zjLNjpa1mUdMOkPfuqmoS2RwvAUBOurmXf950j+qMN0KDv2O9c+FBNSOMymbAEZkoDNjz6uPqfS3bWSZzt6SjWUI1EktCsjWSUz129FgnIpieV3rx5TgHcySbVEfy0BST//cpMBXkaQ3y/MQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
 <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
 <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
 <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3a314ae-a2bb-58da-b98e-bc03a049bc1d@suse.com>
Date: Fri, 24 Sep 2021 08:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9b55a3-cd1a-48aa-fe8b-08d97f239684
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26051C7EEB74B0601BEC9E3BB3A49@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsNUcYDEw8tvL8q25p7u+hRHhYMbBvlIKwyr5WI/CUZ/3QSsr/PbbedwyKNKOv/RzMJdZHmOUcTFqFRgEwBP48NFk373hktTtdt/rsE7RD1oVz/T5rTrbURakDYCmr0PBg15LRkoFcL+EIUrwbOzCqhTkbPt5ET5YuxZqdG/CRd4Nk/FoVt8j+XoCLkDQzqhdVKLmlF5M6tOPAzhMK3KmK/azTPOro7CdnQVDU92VUlZERIKYcQFLK5SUL0p2zlRDd8U99kUUwgkjo9gUKNwiqcm0FUDCrn9lZEm923kDJoxhZ9y/x4rIse6HljbjkFoQCkxtNwZWkA/orBKRUf4wmpSryT+ctx+9IMzAtbtw7OBx+xJiBkqHan5CphHmCYqngkq8EBQfirYo929/vOISbRg0gPWYlkV7s7O+CWpqjBa11BijceedHE19esdf0IANC3944TxZr5jYuvR1QR4XLJaK8adlCHlu1n73jCDvlcrxqOhFaxZ+XlbOJmcfjfDkbSnR/Tj6wsXP+vFIsxRX/+Q91W2qDef46fdI3VCBw0JWzfSvxQtRA41c9zbaO/KkZDB7sH1cre+KEWhF8uehevRKYBhOIV5UYt9WIHQBan1PBmu/LYq27H0NeUc0m34AXGh6wmYfH2vZbR93s9VyRIzrtMDOaqpBLefhK7EkxOPl/JuOS2fxFmWTD6aaBEGFSFCKVFjJ12GJjLfk8Yt5NmbJrgnWkZm5BR2SUtPCAuEXAwIYZiA5caoo86v9KY4inlxKxm851jmIb9Fs4VB2jqk/y1hIPX75xjGjtYYzakSHsXUSVZfvcsjW4UmEY/j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6486002)(5660300002)(83380400001)(6916009)(26005)(8936002)(36756003)(7416002)(38100700002)(53546011)(54906003)(31696002)(16576012)(316002)(2906002)(8676002)(31686004)(66556008)(2616005)(186003)(66476007)(508600001)(66946007)(4326008)(956004)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bK5kJKqX3WS5VTbiZI2dT56NhzkBCtVJNvzE9wplqSNmo5AJPbCKjlUxYXgg?=
 =?us-ascii?Q?mMauf1sfm0pJLoh6CkEw44paJH1zLmKCUIB3SdNgEz8UKlkh7TYc1sZuzhgy?=
 =?us-ascii?Q?qR1//UkkhR6vrn7XswiOE8aw1LXV1kkFhjODO13BliVGD/EAkrAF8jlE76bm?=
 =?us-ascii?Q?C1IikaS9JfeqS8/N9ZQPA3W7/O0fyGyjgha7iwYvxpiK9sn5ZTbzO2HVaooQ?=
 =?us-ascii?Q?HWmZUhirkVDCkAIeY2LnM+3lJK3QBQnkPv/MH5oAxKRToe0BYcUZb3u18mRX?=
 =?us-ascii?Q?6Ae3xSCXxF3BncbDhCEeqXUOVdEHTpvroLR1uS3QzP0TkN7eSfTSs0TyCkzH?=
 =?us-ascii?Q?dPz9OE/3H3XSTOrshD+oEGNz5GuqBWXF93L9RSA7bAHuHN6SUZK4bj115kk2?=
 =?us-ascii?Q?dYGomdQ8L8u9R9u/Uj1TgpzdcoJUarBNt1StXa0YbSpEvIdsq+98CjVKkQkH?=
 =?us-ascii?Q?2rCgUQuprCQ0LE8ibBbd5eEAvJu5pc5HnxIPqxaIEIwbHAgtFXZAL1a/WpW3?=
 =?us-ascii?Q?JbrLU0cdosJfkwQnPvxMYZczhq5MmeW2qsiMkddoB9AhJomD9o3rf+BicNGL?=
 =?us-ascii?Q?nv34Tc9rIToavg834PtQeWTlGjcTSOgB3tn0VjDsIBq8d6gaTV/BY0jco/Yi?=
 =?us-ascii?Q?+2ufG3K90pTJmj22RqkMfWF75NM+D9dJ9fzl+Y7KRdRI+gATAd9FFtu2tH8Z?=
 =?us-ascii?Q?R5MFiQDhMsc9hqkP3v+qW0IQU+AYY81ThoBRIbYwudJCJUpclSGlWyCy/rOl?=
 =?us-ascii?Q?fwBa9kDIH1V05/JKbF1PJVxkRNUUm9uLDCDi5AyQEOIUR3FdNO8N9pIcqr8e?=
 =?us-ascii?Q?U8FiwXU+hsT5qkx0TjXv3f/hrtVUBAqcBJPv1UhftF29q2Uqhp7tEvtSLeA0?=
 =?us-ascii?Q?O23wjZ+DhjLLpQhpmJxtMKv/dx5GhiKh6kBaPDNZvdBVsa1wmiEjq8aC/hUj?=
 =?us-ascii?Q?cxEW5hUpDFH/dLxwESKRuYfS7mvpb8xF22lidHZiSzij6pOWkbxxGaEKHHQw?=
 =?us-ascii?Q?XmT7x9MzrFppHXOS4lSMnK6rFkajhNLnIVon6oYvsIZTpDEDl3cq8gAxIlhS?=
 =?us-ascii?Q?kZZhI/kmF5URPI0uP3Y2UwKorcwo/4SnZqyhA0nYGKMrvSQdqWQPIRlCgNuN?=
 =?us-ascii?Q?C44VifdZTevtbqAuF8XJgoSc5c83BfXpwJ54QZUfZyp0MHOjwippYM3T1DrR?=
 =?us-ascii?Q?TEasCDBrIYPTZOEVGzT+sgn4T0e0wfaHHvxIhuFg2+1O9Gf+ec8aiCprZ7GR?=
 =?us-ascii?Q?aJWJl4GQeHt0Rrx0VEYWL8+83FFx4pO9AImDE52QU/vAGuyawzeQteEwt60l?=
 =?us-ascii?Q?flIaWFSOpI0+Vfu0Mo7GAtj7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9b55a3-cd1a-48aa-fe8b-08d97f239684
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 06:21:47.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzOfaURf+fyG6k1GOJdIxnZK0n7zeBkoCv1XV/m/E91DxqXl4WlBc8CFFgph7x5AUL4P+OXR9IyyPCi7AnANVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 24.09.2021 04:30, Julien Grall wrote:
> Hi Roger,
>=20
> On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=A9, <roger.pau@citrix.com> w=
rote:
>=20
>> On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
>>> Hi Roger,
>>>
>>> On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:
>>>> On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>>>>> Hello,
>>>>>
>>>>> Hi Roger,
>>>>>
>>>>>> First patch on the series is a trivial change to xenconsoled in
>> order to
>>>>>> use xenforeignmemory stable library in order to map the shared
>> console
>>>>>> ring instead of the unstable libxc interface. It's reviewed and
>> ready to
>>>>>> go in.
>>>>>>
>>>>>> Patches 2 and 3 allow setting the host wide command line `gnttab`
>> option
>>>>>> on a per domain basis. That means selecting the max allowed grant
>> table
>>>>>> version and whether transitive grants are allowed.
>>>>>>
>>>>>> The last 3 patches attempt to implement support for creating guests
>>>>>> without a grant table. This requires some changes to xenstored in
>> order
>>>>>> to partially support guests without a valid ring interface, as the
>> lack
>>>>>> of grant table will prevent C xenstored from mapping the shared
>> ring.
>>>>>> Note this is not an issue for Ocaml xenstored, as it still uses the
>>>>>> foreign memory interface to map the shared ring, and thus won't
>> notice
>>>>>> the lack of grant table support on the domain.
>>>>>
>>>>> I find a bit odd that the Xenstore support is conditional to whether
>> grant
>>>>> table is available. Are you expecting domains with no grant table to
>> have no
>>>>> PV drivers (including PV shutdown)?
>>>>
>>>> I don't really expect much, as having guests without grant table is a
>>>> developer option right now, if someone wants to make use of them for
>>>> any reason it would need some thought.
>>>>
>>>> The other option would be my first proposal to restore foreign mapping
>>>> of the xenstore ring on that case:
>>>>
>>>>
>> https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citri=
x.com/
>>>>
>>>> But it's also arguable that a guest not having a grant table should
>>>> also likely prevent foreign mapping attempts. Plus such foreign
>>>> mapping won't work from stubdomains.
>>>
>>> There is another option: extend the acquire hypercall to allow xenstore=
d
>>> domain to map the xenstore interface. This would require more work, but
>> at
>>> least it would avoid the interesting dependency on the grant table.
>>
>> Xen isn't aware of the shared xenstore ring page currently, so that
>> would mean introducing more knowledge to the hypervisor that what's
>> strictly required IMO, as Xen has no business in knowing such details.
>>
>=20
> Well Xen already knows the page for HVM/PVH because the guest retrieve it
> through an HMV param.

To be honest using this in such a way would feel like an abuse / layering
violation to me.

Jan


