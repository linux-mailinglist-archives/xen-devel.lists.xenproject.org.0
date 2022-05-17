Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844F52A687
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331074.554529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqz5x-0003TH-10; Tue, 17 May 2022 15:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331074.554529; Tue, 17 May 2022 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqz5w-0003QK-TZ; Tue, 17 May 2022 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 331074;
 Tue, 17 May 2022 15:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqz5u-0003Py-VL
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:26:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c002d3fe-d5f5-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:26:40 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-xoXyJbO0PkOGVsHxV7P8xw-1; Tue, 17 May 2022 17:26:39 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5718.eurprd04.prod.outlook.com (2603:10a6:20b:a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 15:26:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:26:36 +0000
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
X-Inumbo-ID: c002d3fe-d5f5-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652801201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aH52qvXXN5YTGjIwtY744UTRvU9n6hEBE1IzHDvgSFo=;
	b=GyLDtU1A4XZWIi7BSa050HTP1+DzY0nlpcl32fOkqgZCSz/s/XP6PPbR1vdGKZewkOWhXK
	cqyBoH064cLAkDdLWvAuNBKYnsoe+0PJFCJtr1ymOHyW7k1Q9Y8gr/fQ7K8rQxJKnS+gf0
	ROxDMDDdJK5SlhTjT7y/xtRWRulTgXA=
X-MC-Unique: xoXyJbO0PkOGVsHxV7P8xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU5bxTFUAVpwTrZai3+Jysv6PMM7da6bnkGbEOB1Kj0yq6tj8cgpDPkMuhOYjinkdq6zOZLFFu0oAnIpwmU12I/FxHtY0lOTBie+wvgic+dyXBuLVMuSVWAhBuLdP4prixl4OLDnoh0pKOqPi/G+2LwPHmR1vK1gitjnv97mrfGg1p5ez/gSzdS5z9r/mQ7LFViCWwDIHbZUYfx6qIhY1P6rxfcpbxAcFb7FqOcMtA+oIrVqG2NTxiaq0EjmCV6X/a1I0LVIqCbgJj1Xw3DxqbYdvndGTVOv5YTCNTDyo/+Dav6ZYj3U0vB6VkKmAqLrWtFmBe8XT//4C4yCKgSdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FQPxw2X8clt9ZJcUCXuYBwQnUkn9l4P8LBShBTotZY=;
 b=KLyXXtEQCiUrKfG4deL/fdoUWg1dCibDxyIpcdqukXosW08pAbA0r6ouLRa2wV5rrHvx+Lxj9gvWQu/aHQyqgVJV2inSgsVce36e3oEfWZWk0ipExFZEvWSjEgCgc72yuxj7jvkHl0WSs4IqfSs4efa5/7N4dfJR1HyjnRGLnXmES6YGODnNe1mPnBxOqaKv+bVZpmMWbBBXpsfuU8n4TPbzUw5IzFskjPW/yE4BI9evFMStQzwuX9Nphp81VWdV6PD/gA3HUOKD5MBIb06SkTsLT21zStxG0b/a43WLyhoFbmxE8PtKp7+yZiEUEeKkbU2o2NcMFn7RKrThlmpFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e4d505c-a02c-eb54-8299-b1078943a8a5@suse.com>
Date: Tue, 17 May 2022 17:26:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Process for cherry-picking patches from other projects
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0e7607-9ee6-40a1-c894-08da3819a1b3
X-MS-TrafficTypeDiagnostic: AM6PR04MB5718:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB57189FBCAE7D75637F32A500B3CE9@AM6PR04MB5718.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fw1Ux59YbupVs5FOlQJV+pTup2TOOWzuP6j0Mx2lWMo3WW2jfllH5Pk/76QSestcQnujac/5jGNWwDQhJy/xuSqj21HNuzsOvikFNDjYOHJO0CCwR2pU8nZR7Nt2GAP7QkrfIAcheio8vMAdCUK/E41UGt6YSSK1qVmeVX5Smc+QJ2iOIpWCEdCa1Z18RRdxPJZL+1OjpTPYyLGIlppNisDoEe/y6g1bU378OkHSwEWsTNeAQ+hlHudn6ejyXR3jow96wPUA4VnXT3yKO+7yi+281AVX5nxnWiI2w8GMfcSblcvM5Ke3RRRGzS7AGGpuVHbxrmhD/OR8n+clMVY9sXn+YGyXBTybF4AvhS7GRpYPbBlM7MW8uf2O/P3ajq62d3GcSGm4BCPiRhWru0HMSzA1oxPM3BCO16QQ8Bdj+/bW16RjUHEca9XrDoJX5c1innvEbP0c6Ag8w5ZEW6m8lqiLQe0E0+m+LaiN48RZFpvUwRVvrHaVGsgeHotL8yPJDMYbdN+MvRD2ay7M6M7c+X4TrwC2t7ap3OL0y7f61jyQ4fGpKvcgIS1mhn7kM8Vq2DcnGp5tJYIs8PRnnIPwsgxDx8zFx9XVGlcS06r2Jic2URX2stWRmtSCfsM37D/GDOrZGMLpPJ+8H1e9OcCeiGTEo9aYZlf90++8HDzWCKwPnW6h54MLcBwPRxvr8O7LH0Lqheg1rItmoXqG6pfzDCQwm1G2g63hKVw2WWqayjwKEqb/qF+5Rk+naBbs9caP7ToBVVQMSFXKIhxJDCS2xnHfP2Ad+2syYaGoK/umG830xCzIrDiMWJVPdhX/2srhnT+a2l3p6lYVdh8Vfnt5cA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(66476007)(2616005)(66556008)(66946007)(84970400001)(2906002)(36756003)(38100700002)(508600001)(6666004)(83380400001)(54906003)(86362001)(4326008)(8676002)(31696002)(6486002)(6506007)(26005)(5660300002)(6512007)(53546011)(316002)(8936002)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6orexGbEfpi/spN0E7a6ZOJEeEhqcO1IZ64AsxXZrJK/s4JSDhh5TzDQj0f7?=
 =?us-ascii?Q?N7W2meFtmxH9czrb3Ni5vCepwwnU14UA+JXL+33d0hXV4tQ3OzIpNfur/Iz4?=
 =?us-ascii?Q?86/UFti9naK8E5GO2ptvfe6z+o8BEyZtOD/+Ld8QYUaAxdDyP/2uXOXos7hy?=
 =?us-ascii?Q?aH+BgWMTIAwYKe5QZh52iMNsqJj8soVKNlx/7JWgLkgnW5umBaIeDkA+zVP5?=
 =?us-ascii?Q?eclEJ1qGGHCgllKpa+bGm+WaGHs3wWJm3X+qVBEB2Oq8UW0wqEm0q2dUhAFZ?=
 =?us-ascii?Q?wD/j6qXSG6ORNvKxx1eAsnmlepfTl64cqwQTPoLshhVj/AF3CzVwEQ6WIlC1?=
 =?us-ascii?Q?b/j0DZzC/V8DMF+SKDx2eWIKNoijqZlJyABnSKKFenTfDG1hgVCfxZj8eliB?=
 =?us-ascii?Q?G8u0QM7M6HbAf0TkLb2mm0n23VrcF3q6W1ZaUioAn1LhxCjB86bFA9VTFbU1?=
 =?us-ascii?Q?aEUJRF1kUpJLJq32J+OJIvMphI+dI7EkvIAuvtDITsipA47ohk4T6JLn+udA?=
 =?us-ascii?Q?tMtifg0ObL0/A0JcYGepS9PxNzT5842/MYAAhwmV1ujE9X+gG/JczSBPvQal?=
 =?us-ascii?Q?AZl2ox+2oACsZRyPxYkJMmfyKKfPGQdkXiKFzE9IRBuefv8Xj3C+fyxr9FWV?=
 =?us-ascii?Q?CM/4PsTPBkq009WIu/iZberHSVR7ofyCvZeg4iVctHXlEwvsoTfay4HyR610?=
 =?us-ascii?Q?rgd5PD2n7dMQ3J40JJrGVxLguRx7y2lIed1nTojuzcJuw/TJWd0UiyXBrKZG?=
 =?us-ascii?Q?ss+mpDwKrhNcxwRvyV9OnC+b1H/fJ1hxljdp0gFz8+uUvxxBCKZX0sIjiefl?=
 =?us-ascii?Q?7khlD/SU9dLmO04r0MOyemB2loNuxRHbpE3pB/Z/Caxh2qgr9dX7AoqzxQeG?=
 =?us-ascii?Q?n7kIMlpjfC2ci5ZNiMrHao5jtEackQT067rGuc1ISgvMzPWbNPYMPYwm2WiC?=
 =?us-ascii?Q?+WprUjWOMBgMTRND0CTGoGE/yRQYZ4QxxvpoCT5BRWvQuwZI/qbag4G3/0UR?=
 =?us-ascii?Q?IqQAupjVu157TUMuigFZR9eTeb3CmB2e5Y9gSc5hRT8dHxXC9ouz1zrsKv5K?=
 =?us-ascii?Q?qX9ahFD35fPt63Lk6sMAZtmb5fWE4Xv027VQEwj7LgPpTJECoOapmY8wEFPw?=
 =?us-ascii?Q?mYK/JJhjGuKRKXBIVwULpD8AM+q/8HXaS4OhAKEk1OCXbrIuVgBhPCAc4Tni?=
 =?us-ascii?Q?IAR1pI42gV0wN0sdLwK4iOEQgTGhhi0sGAdnSlipOlJgrvNuVQ+cygl+xYlN?=
 =?us-ascii?Q?bTvvPoXKyyQ7HIFr+zIxMF+KH4VLA6JgOj5d9mUR5S3xHw+3nDnS4zd3nv9U?=
 =?us-ascii?Q?+onE+gGyQQ7QPZpZ2RopuRul5cn8/4kSliixEqLusOhIENkkba+Myo7PXZcY?=
 =?us-ascii?Q?Sx6nr+0Y6z1BsoK5lQxNIAPEf9kLxZ79KuzCo2sRYTcJq7sNyikCINaQ4d5K?=
 =?us-ascii?Q?NZDhKZE2AsfDqmZARRYqh+SSPRq6FT3aNNxQ8PlebGBdtPgwJUzeUwsEMx1v?=
 =?us-ascii?Q?pg3SbpGL8UfowOBn50UAGzTo/4+AL/NaSiF/My6WzePCPpMu4vJ83wi8RWj4?=
 =?us-ascii?Q?UO6dqbeu1rttqGMZTWvQujnuOTvXdMaTSICknPfN5UDJqHaHPG/2i1DNqQhY?=
 =?us-ascii?Q?dQCRFzfkxA7hBJAqD+/VxZduh8bqdDZM5dEPl7M+zsJ5Jd6bKwIgyNEIMk5Q?=
 =?us-ascii?Q?i3LBhp+wLTh6xOmy4bypTe1UHvPLu6Abnjz1Jwe9wX4zJWMi9vhZ5S5A1Ybs?=
 =?us-ascii?Q?1ryE5buaQg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0e7607-9ee6-40a1-c894-08da3819a1b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:26:36.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw+GxM171bc54o/Rka3mR77LlP/P3vE1QJCYMBWJj/vRElwPuTEvzgoS5dPcj6eBJZwuuMiHPlT9N5d1mvP2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5718

On 13.05.2022 16:33, George Dunlap wrote:
> Starting a new thread to make it clear that we=E2=80=99re discussing a wi=
der policy here.
>=20
> This question is aimed at Jan and Andy in particular, as I think they=E2=
=80=99ve probably done the most of this; so I=E2=80=99m looking to them to =
find out what our =E2=80=9Cstandard practice=E2=80=9D is.
>=20
> There have recently been some patches that Bertrand has submitted which p=
ull in code from Linux ("[PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with=
 Linux 5.18-rc3=E2=80=9D), which has caused a discussion between him, Julie=
n, and Stefano about the proper way to do such patches.
>=20
> The =E2=80=9COrigin:=E2=80=9D tag section of xen.git/docs/process/sending=
-patches.pandoc suggests that there are some standards, but doesn=E2=80=99t=
 spell them out.
>=20
> The questions seem to be:
>=20
> 1) When doing this kind of update, is it permissible to send a single pat=
ch which =E2=80=9Cbatches=E2=80=9D several upstream commits together, or sh=
ould each patch be backported individually?
>=20
> 2) If =E2=80=9Cbatches=E2=80=9D are permissible, when?  When would indivi=
dual patches be preferred?
>=20
> 3) For =E2=80=9Cbatch updates=E2=80=9D, what tags are necessary?  Do we n=
eed to note the changesets of all the commits, and if so, do we need multip=
le =E2=80=9COrigin=E2=80=9D tags?  Do we need to include anything from the =
original commits =E2=80=94 commit messages?  Signed-off-by=E2=80=99s?

Having seen the various other replies, I'd like to support all views
along the lines of "it depends". I don't think we have formal rules
applicable all over our code base. One model might be used in one
place (and then preferably that model would be followed there), while
another model might make more sense in a 2nd case.

> And a related question:
>=20
> 4) When importing an entire file from an upstream like Linux, what tags d=
o we need?
>=20
> My recollection is that we often to a =E2=80=9Caccumulated patch=E2=80=9D=
 to update, say, the Kconfig tooling; so it seems like the answer to this i=
s sometimes =E2=80=9Cyes=E2=80=9D.
>=20
> It seems to me that in a case where you=E2=80=99re importing a handful of=
 patches =E2=80=94 say 5-10 =E2=80=94 that importing them one-by-one might =
be preferred; but in this case, since the submission was already made as a =
batch, I=E2=80=99d accept having it as a batch.
>=20
> I think if I were writing this patch, I=E2=80=99d make a separate =E2=80=
=9COrigin=E2=80=9D tag for each commit.
>=20
> I wouldn=E2=80=99t include the upstream commit messages or S-o-b=E2=80=99=
s; I would write my own commit message summarizing why I=E2=80=99m importin=
g the commits, then have the =E2=80=98origin=E2=80=99 tags, then my own S-o=
-b to indicate that I am attesting that it comes from an open-source projec=
t (and for whatever copyright can be asserted on the commit message and the=
 patch as a collection).
>=20
> And for #4, I would do something similar: I would write my own commit mes=
sage describing what the file is for and why we=E2=80=99re importing it; ha=
ve the Origin tag point to the commit at the point I took the file; and my =
own S-o-b.

Hmm. The present rules written down in docs/process/sending-patches.pandoc
are a result of me having been accused of unduly stripping S-o-b (and maybe
a few other) tags. If that was for a real reason (and not just because of
someone's taste), how could it ever be okay to remove S-o-b? (Personally I
agree with what you propose, it just doesn't line up with that discussion
we had not all that long ago.)

Jan


