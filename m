Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFECE401D3B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179996.326472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFqt-00055l-2x; Mon, 06 Sep 2021 14:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179996.326472; Mon, 06 Sep 2021 14:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFqs-00052W-W0; Mon, 06 Sep 2021 14:44:02 +0000
Received: by outflank-mailman (input) for mailman id 179996;
 Mon, 06 Sep 2021 14:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFqr-00052Q-I2
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:44:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31cb0069-ef88-4bf1-a74b-5629dadc2d36;
 Mon, 06 Sep 2021 14:44:00 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-6WtBcZGBPkyJDcJH7aE1_g-1;
 Mon, 06 Sep 2021 16:43:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 14:43:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:43:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0167.eurprd02.prod.outlook.com (2603:10a6:20b:28d::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Mon, 6 Sep 2021 14:43:56 +0000
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
X-Inumbo-ID: 31cb0069-ef88-4bf1-a74b-5629dadc2d36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630939439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8XZ4I1QoHTLVYKTUoACejOGqLW+G0EiotA4aZqRjRM=;
	b=Rqn0F9EPF8fZG/kbo0VZBlfQ8SIU5ysN7+L3VxIlqn7Rhdjla7JdK7Q4DVWUMkPgEH/b2Y
	TuRMh2hZCCGBKqwT5itDIsapOgJmgVpISXAJb+16hr+z6fzWi1vPPPsB0HwITq3+NyLtgj
	rOM/1Qj9PpNDbDQpHcQa4uqd80apIzo=
X-MC-Unique: 6WtBcZGBPkyJDcJH7aE1_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv4Dc8/gSdBkB2dl2gTnrBywWW6QecIEz/XpXvU4XJ7Iww6qSKQmalZoKzWYh8LqOd0eL1NMCx31b0m36LW+puVxmm6ziGfk9JT2iTYCs0T7gYH4HTEZYON5aJo42BHezMmXAeuDNk3z7QIklCpUE+66EvrPE8QqqLGvN5UUt6l92n9BczciVbEqRnX/p4hKd0rLk0jaT7sf0ISyLRRra/xeNQOjkL+1ID0DKzc7jukgTdCugmTDCIBQm13Cp+PMDN3fID+oTHlayuy2AqEjGp91GlqxEvMoC+3VxDDz0cPsCIR6armlB2wCM7SMwQUZX3Bi8D45LjO5ApwE3Ba+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q2f1EWZnO8vB5o8YP7/43ffRbfMbHlhAQBauZVv+dfE=;
 b=cuwwSlHO44Pu0CtI+5JesZm4ieE08G5ICY7KgXitP/k5l5FTMynXq0COg4IqI6XDbMN4kd8s7ffvYeDTKX7pSz5OWEUO1CEhtKWc2ve2g0roeApN5I8EtQxKilseMmWQRODjZEAbt+iPg/rW0zj85kCE5Nd81vV5GUKMG22FxPm2EgWobVD6hLbBj0B6UIjdvbwBftdL7ufju4sQojIjwL0MT9HcbJKUAnQEHi3gqvMXTbcmI+IAcf3BfIeJFrViGNIJDtkAzlHs7uowZygTM4ZD5xhDDWzQt9CHqrvt4j7m5Aoei9ftcWqRESl7iWJz9jnmTsMPVhrTfM38fa1kxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
 <c3c20938-ba34-965b-0f1e-8d72c8004cc6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d26de0f2-12b5-4b3c-0956-0c2d2aa977b9@suse.com>
Date: Mon, 6 Sep 2021 16:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c3c20938-ba34-965b-0f1e-8d72c8004cc6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0167.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b38919-ea7c-4041-b2fa-08d97144c17d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447B19275D08CC1950A98F8B3D29@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G+slpr7YOPTee+eS13ie60O9wLJm5UCNd5s+ckkPjwLKgs/lUknJVXWeutQrha+puo9k98PSt8gK+lc+cJXp4qhg/T1RozoYrOEKZxMFZbeZ9syX+i8Hj9zu5DS46CNvkLbQwEkxm5V/QE4mHNBTuthV/mNzrAFGdbLtceSkFTZrDUp9Toiqd9U5XY1+xwLuTB2IBt4WpFE/Ar46dgHyyUKjkenM47s45I9cYJ7Q3Y8W2j0yqtJXogMaCamHTCd6oj5QwyKfpofJeHtUR9tSnf621Ztnu6g9GVxLkVGnpNl9LRX5BUJxeMLw0dQPqgUU5NWAitOQ729SXITIHQSRJQHX0fRrtwZkD4+0qe2GL/ghPNCclpLkdfUhzq+5jPl3JiBsJ30H2lYT23U0nhxT+oPtTrOwyfvPdca+eZ9ITaVClCgAt5fopTdjJs/sq5Z9IrPO5pw8/2DEFbVY6lzR9mN75AAu3HCCvw4LL8cWAAqMdRbkMV3vCqX12JPKTcZI3hNRebFGVGD06D7roXfOpH1PErmBGnLmT+Pe3vbSgnKnLCrQqxD8OEoDLr0Rhl5oEemgdGTt9/2Y6UEICeXrd6mVYdvJVtp5n0PgGPrniSGFi5OMZglhx/y0kTo3qjuuWpxpsbIPk0/I6eW1BXm09WQC+TqAVdGi4Uw411b7hzi2ekQYs7u/sRyTrjJtWyedHl7SYyTWnPmvFnq24jS24bDqap1feQRShvYl0Fs6Naw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(39860400002)(346002)(53546011)(31686004)(26005)(31696002)(2616005)(186003)(5660300002)(4326008)(956004)(54906003)(8676002)(86362001)(38100700002)(316002)(6486002)(6916009)(16576012)(478600001)(66476007)(66556008)(8936002)(66946007)(36756003)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kIhSJ/OKTAb0u/vlR0jDgW4iPgXZ1+BTzbg5S2QcF9nVeSiChr1noGjccoLe?=
 =?us-ascii?Q?m239xnQ1XrpLbI06VzLiy5jwJMlx2TlRUWiDr119glblLnaHmNmhJpHIDQgj?=
 =?us-ascii?Q?KenC3ZtNUyt/q4VAMyQPp/RdNW/FRkJEXJet2Vd6mUN01jcwCJu9hATTxf98?=
 =?us-ascii?Q?jdOjNBEzGOfa+Y1fFCZFp6Aiw7MfeuSMUdhm6Yr+poZoq8kXXVu2lpcVP+2K?=
 =?us-ascii?Q?OWvSUo98AAABYDsELHp8Mo6YvV7YYK7x+sCz6L8Kb2uQg6exr+ynHleHD3l4?=
 =?us-ascii?Q?HMWTWe+/zshDCDMexcpgvAgrDl1wAEHpMOBL4L9DD5NT54vJhNkmZ8VfcJxZ?=
 =?us-ascii?Q?BHpHAtVKR1pXkOfmGvInmYGRhNDZK7KVYdaMm+nP3teNT5Z4fZpaRPsG561F?=
 =?us-ascii?Q?eaL2JnFvpg+QHlLNBMl4C+ky3QSevQnt331SRZpoxbcKmJ2vMlHiDtFW4Rki?=
 =?us-ascii?Q?Tu1tT8yraAcnXV4SyJOtcEhukrOoW7g+ovabH6gjP1553YCewq/4Sj4FGPZA?=
 =?us-ascii?Q?Ueyt4DX8YX8IRCzCgfUJip1UavNp9v5BYYM07RwaFyPGMUxYbBKdB/4qgJ0J?=
 =?us-ascii?Q?hB9I7coOcrZBLblLAP+9gZH/mS9GhRMLZfEXvayC674dhdBeD4ycY7VtX2+t?=
 =?us-ascii?Q?xLAy8d5s8O6ZFfVg45TECuS/oYsB1OPNcYCX63QdcXcxOr3nNrAlZgEDOqwU?=
 =?us-ascii?Q?uwuSNVTwUqXSRUmk8Re0Ra55F29jUQQIdmH5W/KZqooRI+cXpvvdPndEysEQ?=
 =?us-ascii?Q?dQhS19WzROS7gBuyRB6RUsee+N6LTPkGQ+nNAeF5evvEt49yafRSliOf0dTa?=
 =?us-ascii?Q?ur7TFfHxg5kxRt4F2+4sIn9IB1cMBnUqTaCTkvOE/TKAxS0nB00l/V01WZUc?=
 =?us-ascii?Q?BfZvow9VSmMbLG0xixShyVOEKrvnBKPvtr3FiVvKgOOG9995LX1aGETBc4bv?=
 =?us-ascii?Q?rZx/gbdAYYjyIEW1ccPgRHuRmld238slGm3n8ItEpKoUJXcOGCvaBv+EOkmj?=
 =?us-ascii?Q?AkJcZL5BFHvz8sND4PtdUj6svxCqK2/+uFPRtl8twr4NGAl+u14gpC4bxris?=
 =?us-ascii?Q?4WchkeBDoYPPao4t9dMA1+fglrMvttIH0f8F2QsnYWW04uTnDgkAhLX60Qaz?=
 =?us-ascii?Q?2DuB+zW4tZ3wj8xUiiABFQ82vfEEb2glHZkC8kicSgchm4NCprR4BTdkXa6o?=
 =?us-ascii?Q?CPxevhxsUxJ6gLcElivNvDZ4JXgIoALODnqUw0Y5oVRX8vnCgbyZs1/AY9gf?=
 =?us-ascii?Q?5asPb7NPBNbt16bcDwqEnBJxkkbWRBOGFNi0a/B/iKMsaExpd5rU2IU6Skgc?=
 =?us-ascii?Q?VQjNsz1veZZkM2kRwrBbr9bQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b38919-ea7c-4041-b2fa-08d97144c17d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:43:56.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7Wtow/z8Ao5wWMkELMANmih4lr7IcDNUhvNOGjV0+45MX6oZJWu+7wG5ybaqoWr5xvkVSy4X4ps4kxClz4arA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 06.09.2021 16:05, Andrew Cooper wrote:
> On 26/08/2021 11:09, Jan Beulich wrote:
>> By default all guests are permitted to have up to 1024 maptrack frames,
>> which on 64-bit means an 8k frame table. Yet except for driver domains
>> guests normally don't make use of grant mappings. Defer allocating the
>> table until a map track handle is first requested.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Nack.=C2=A0 This creates new dynamic failures outside the VM's control,
> therefore regressing Xen's usability.

As with the v2 status frames tracking array, the memory demand of
the actual table will typically be quite a bit higher than that of
the frame tracking table. Therefore guests already are at risk of
observing failures from these paths; the increase of that risk from
the change here is typically quite small.

> The maptrack array (and frames for that matter) should be allocated at
> domain creation time, like we do for most other structures in the
> hypervisor.

Structures we allocate at domain creation time are typically ones
which we know will get used (to at least some degree), or where
allocation can't be done later because paths this would be needed on
have no way to indicate respective failure. Neither of this is true
for the maptrack frame table (or the v2 status frame table, for that
matter).

This said, I could see us _switch_ to a policy like the one you
describe, or even allow either behavior depending on some kind of
setting. But then this needs to be done consistently for all forms
of resources (e.g. also the gnttab v2 frames, not just the frame
table).

> Furthermore, seeing as this has come up on multiple community calls, I
> will remind you that it is not just Citrix as a downstream which is
> firmly of this opinion.

No-one but you has voiced such an opinion, so far.

> This entire patch should be replaced with one that...
>=20
>> ---
>> I continue to be unconvinced that it is a good idea to allow all DomU-s
>> 1024 maptrack frames by default.
>=20
> ... defaults to something smaller for plain domUs, because this improves
> the general case without leaving VMs more liable to crash at runtime.

Just to continue to waste memory? Or to force the admin to know very
precisely how many maptrack entries a guest may need to create, such
that they will neither cause large amounts of unused memory nor risk
the guest running out of handles?

Jan


