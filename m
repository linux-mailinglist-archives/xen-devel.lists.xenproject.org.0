Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FBB099B7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 04:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047784.1418145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucaeT-00072w-JR; Fri, 18 Jul 2025 02:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047784.1418145; Fri, 18 Jul 2025 02:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucaeT-0006zp-GB; Fri, 18 Jul 2025 02:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1047784;
 Fri, 18 Jul 2025 02:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+AR=Z7=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1ucaeR-0006zj-1d
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 02:16:43 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060f.outbound.protection.office365.us
 [2001:489a:2202:c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c77282e-637d-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 04:16:40 +0200 (CEST)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by BNAP110MB2302.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Fri, 18 Jul
 2025 02:16:34 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 02:16:34 +0000
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
X-Inumbo-ID: 3c77282e-637d-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=MinXKh+PFQMrGBM/w6tWi9F75Hh0EU6Y2K7iVYsTp6Hu+yJ4tjC4o9+YwKjDy2piQVIcADl2ywIz03OfzX3Pngqw73ZAmfmwCRwFe12q09yTvCWgPeMDVqjunoh8o7Q93Rdp1QFdOL8jJtFOJM3lbZjRNbniBFVnsRi5J7h8ZlsY9XlT7apZQr6BoTv6343+2eY9251HJqNqFn7iLR/0ojPdNa1s3KoAc9Xvb5u480T1U49xb1X691bfA2gT1o0tdZWiLzTB2gI/KemEx7ei6JAV+F+rT2ZBSyRlJPoFA8GUlfhpy/uPdmQKJkhUsnYPrGpqpphdrW44Rp5AmbRUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXMBFNoJDzfk6GohKlhoNzUrH7NzNd/TE/HrE1nYLfs=;
 b=YIYQuV1Ip/sqLtiZeyAKyUf+x8VLGp3UE0MaTx7Z4SPKlyeL25MH9jsRY+TcW1ye6VdqZWtbw2KMiao3od3idSh0DUGyS07D0zB79YCsUQhKJzn3ckBKC0TnGWDMjcFTmNvbVvtS+/OxyFtkjz6d43booK4OBJsgV5oH6SZH2olKr7ZJZ4f8yUWVME9IV5OPd0YvRnQ6rHl3fCV7O9AlaQz8Anft7RmXl1KKeYz2vpfbhSWX+exGsBh0DdxVejEWjP9ZvhWuYIEDXW3+ofOIqY1uusx34k0qYKQ/SEfis2p6mPwFHv2ijJwR/IAAnAiGpRiARCest3l/39wWzN+ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXMBFNoJDzfk6GohKlhoNzUrH7NzNd/TE/HrE1nYLfs=;
 b=QHKKwyDn3dTQJskypqhANd4LOAIWjojiNaa6ab8xQeR+H1yn1KHY3hLJMlqn3Ucv+2O/4sclnj1c/DaCT9tnsEpvkplpJeImRdOApC0CAGkWTb6N8lHtx7A1GtvwgVcjr1NeWqMXWDp4SpRqI02KVMX+Xr059tLz6NImtpv2d+cyutVkZk5xkz+PUntPnBjzF8ds2vpmn4tJ1TZTQOwswzarAUNB20ok64sdC+d2HNViYFfeQlFHr5Bjugq55OA953pibOV4nlgEPWSAJy2AMnR7YMPuebV5h/k9Uf7d81TJMAE3DxF0KBhVplRvvyaHLH4zqHmzELoB3X7roeQTBw==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>, "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>, xen-devel
	<xen-devel@dornerworks.com>
Subject: RE: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Topic: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Index: AQHb9TbxXTsT52waBEmzEYNFgYIkNLQ2UMAAgAA7YGCAAJLnAIAAA5zw
Date: Fri, 18 Jul 2025 02:16:34 +0000
Message-ID:
 <SA1P110MB1629F354A80CE6536718FAB3F450A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References:
 <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
 <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214810B8239A418B1AF540E49050A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB214810B8239A418B1AF540E49050A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|BNAP110MB2302:EE_
x-ms-office365-filtering-correlation-id: 814c3ccb-fd8d-47ac-937f-08ddc5a11e2d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?t6X8zTmtQ9IlURPztOWHwpKb9/GleHyHHSecU9KgUuqJCJlUCN6a1fd53ixC?=
 =?us-ascii?Q?JEZfULDuFTa6CpAzSum6++rsGwKhXsJUInvaelO7BZ7wItFaK/6MHClhE+d9?=
 =?us-ascii?Q?55oliaNWRgbZq2dKMg+xP7IYEAlb8XSbU+A/0aA78oc/DBsszRX71iFV78Dx?=
 =?us-ascii?Q?0GRb8jAFzrpPIW1NsBj/6waBPyuwZUcEhxHZzKmXwUrcwrSufdnOfet+w51w?=
 =?us-ascii?Q?vWzgApalXiyORtuiKDTjUZpLQe3G/Nnek02c9pqw8It+7uvhODLOYcNAV70T?=
 =?us-ascii?Q?HWDTSSx6cI1JKqvJlDyAaPsKqtqilDPQP8EUKRYa/EL61E1anaQBJ2NYPcuB?=
 =?us-ascii?Q?1fBwjYiHErPq70iCa3LzNcZhcFWuW+DphiAd1xLgfuKf4YyTTkqNdwTgUqjE?=
 =?us-ascii?Q?kYdukQll16u/BM22IaHoaVK1s1WOyjZdF4xu6na5d0ZFUBVnnZzs7ln4UOwl?=
 =?us-ascii?Q?oAMsw+lhrq+5fwB89PUNjTIlxAkqTX/QBwmz910jWcOM+Ycmd5MO8jvV+Gat?=
 =?us-ascii?Q?lWLWYHI4Ekf4ISB2PwfN3yBS83AUtRJEJwBg8vQiAqeygO2oLJ5LRIxM8FJO?=
 =?us-ascii?Q?NMRzh//tKe5TicexTveARP//qYopuM/vi91Zbv7E+n2bv8r2pAz4ULGm5wN+?=
 =?us-ascii?Q?pDgoKgpc21WArTmEa39+nBXtDuAeRhc5YJAxPnP0aB/48SHG2fAggKK0nlWA?=
 =?us-ascii?Q?xU4SGheBcvzY+gITqZy0yJjOeqW1kHrdVEMZcH4ll0/VEezWYmWJIPykUvSy?=
 =?us-ascii?Q?zWck88YBCuJ7qgkusQLaj/FogqbJr8Odwk9kKJTcudOLkKaTcPQ5TgUa5thD?=
 =?us-ascii?Q?9zYIcpFm1RcTXNI59lOpO3a70YwMa1ZDGQ5JqbXmbAR1fiiEv7/S1dJqE4JQ?=
 =?us-ascii?Q?G5kMsnynxVuVn/ejAq9NctlTw2S+MsiemH2pAeG2bxVnCwFtIha1PYIRRKgr?=
 =?us-ascii?Q?RYoE3FFn3aMhake+CSv7DJEkKeOGypu7PgB45O62B0PTV054wc/+GKk7Z6md?=
 =?us-ascii?Q?QB7WcwLUZBgw5bwPoMw8WaRwsTgDWedWh+YBjKcRz+FFH5EnGLGhj2EhDzf/?=
 =?us-ascii?Q?hZLJQ0SyrccP8BEUM8LpPurZnhliEXpMOa3kJ2DzrUjVb5z5yz07NGaWoVq5?=
 =?us-ascii?Q?DUdbhQowRhPO23MriWgPkVaF9lt8RdkgQKOzmj5Z+D/vSYR3qV2aH7ontl2A?=
 =?us-ascii?Q?K2X8d7JQDdhUAjw4IasEtCp4ctHeunM17Yv2qIQgAhQFiEWDYzypnVmhLddc?=
 =?us-ascii?Q?DfrUPh2AE4110BCoPil3Szo9tpOax4s4tWHomEdL0bGPwF+AuAKkLLC3eWaB?=
 =?us-ascii?Q?KBMFOkYUgDX7D0EQEVINwE2zUNJPesnaKDLoWHXE1FA8ZBPBAws0B+G8x+FF?=
 =?us-ascii?Q?VtAIdssi24GeDmagNG1l3Lh4LtqRMtIzXMrWVdX8B8QyyGthsghubEoDVnb4?=
 =?us-ascii?Q?3APZOPtd2whGlM6dd8qrs729p6Vnqp2B6vKEbo3quGcbHlLlU+CUk336FgdD?=
 =?us-ascii?Q?MYe9aMiZZO9xaeg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UpaFvMPWZQwKo98uhrms9QXzjYnQIZ9mokOljm3GHhtYG6CgTfKhIPNFrbN9?=
 =?us-ascii?Q?kbSNCI2/cDVSANjrg7FlI9f9ZNfF46cbwzvDGCthIDl3jBRe8crGtIf3OaTp?=
 =?us-ascii?Q?HZ70snieqPOIJFBLxGyrvd2KGm8klfFpGjV4wT8zUUElYYEt9ARBRMrb4BQa?=
 =?us-ascii?Q?s5QHtPcMV7NEXt7McH3wS/i0X9lyr6KV7McXwBzC4NgQIo3ZXmuPhNAmIvFV?=
 =?us-ascii?Q?OWz+fy75oQ/YFPp8t9nA0onqHh2mzCf9HHSV7NTl4FQX/3Oz/musYDNPKYiV?=
 =?us-ascii?Q?oRujTF3jquhD+Hs9GyQGnaeIfzW7yuiJwtxNlmSUAy8Ni51/Iu75YQ46jKHb?=
 =?us-ascii?Q?h/1VEW2wwOe8kKHZcvLRvVHunrY83p1OrBnzDe71RbNv+DSFkwOO93FVPrBm?=
 =?us-ascii?Q?5AcXgje14V9dKAPdfxf3FIzbtnAW9SPwlP6Acv8J9DX6pjRnbEnSH0ge8oQe?=
 =?us-ascii?Q?LSxHDnpGW3JF/8sdRmntocU0tXu3vr0KfOGk9/NPLzenYp2i03e+qvr3eSL0?=
 =?us-ascii?Q?e8kVilUJDVtPARrlM0aY17IcbNRGwNnWFMcRfSS0G7QyvB/2/1v7Txg0u8li?=
 =?us-ascii?Q?JdN5scKN2FrfHZeiejR98LNFNtymOUwjV5fvB10IVIe7ns7vjlkzS14KeNkT?=
 =?us-ascii?Q?irEFTAxurtgRdzvVSjbHokiR2WD4u6WSMrjxh1vscoPdJDP2KqW/nXkTR28S?=
 =?us-ascii?Q?D7TkYPnr94Ja1TLro20u1Rvq0z/EdfPr/Ik6CTkZRKN058wmdFEA7FbRUDXT?=
 =?us-ascii?Q?EH7WAdZemt9CQ6fpTqf5MvzmUTwwXGR6TwTh4bXQvroNCzSQLrEKA6f6VGZo?=
 =?us-ascii?Q?qRyh8+kk8YpIJz5HRI0SgTd6PzPjjkuhNj3bSu98R4UyVjIyfqpf+iiNuLyD?=
 =?us-ascii?Q?C1vECRWHsw21ofAkInEmMv2bWpxD9zYxHPz4zGNVGPDJxA8jynBRpjlV2luE?=
 =?us-ascii?Q?3aUTq62YnU4Ddqu+ryjaJgIWEqKhe3UJc0xYC/QAKJInkKbEl1bU7pWhqHTs?=
 =?us-ascii?Q?YwO0SywR6+2+Erq5PGrxjS6+zr6nASqEFBTjEnS6x1ndKO/3/sb4mPOA6xit?=
 =?us-ascii?Q?FaoRevWGr4FMMSumqGgU/5BCGDD0TSr9jm2+OPbGB402M+fDWnvxtmW5M2p/?=
 =?us-ascii?Q?n0DLaTgvfq5hlzAocCNFF2cR7ibn0rGxD0jm2F9H6PSoE8FJqb47YwP5UPD/?=
 =?us-ascii?Q?GSmjPmqHNXQydeESRhSGuKg6a0n6JnSDGw5GDs7lkKODokkHIqOG/BCWf6GC?=
 =?us-ascii?Q?OWZ/ijRcOHsImK6Y3ytvhmHjYsdr/Mflu7NmNoJNO73cawhtmTX9DaRy3gyn?=
 =?us-ascii?Q?1dSWx9roR4qfKTbWH/1RXnQBGxEYcS6x+MEN9qmKh7vCEuutZf0OTc1cuB8j?=
 =?us-ascii?Q?3QTaGWFTcLNUcVAffLslEtifCLEfHCpLEQ9d5dc2ijoVkcFIIDDlM85/pl1A?=
 =?us-ascii?Q?+Gl/7yYQq4PsP4XC6qphCXl9WzHJLo6YcrGl30pyaxmJb+ePP8Y8Ils+fk49?=
 =?us-ascii?Q?ocq4J/Wwabbif01DXN79FNe1luQsln+Y5BfY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 814c3ccb-fd8d-47ac-937f-08ddc5a11e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 02:16:34.3083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2302

On 7/17/25 21:39, Choi, Anderson wrote:
> > On 7/17/25 9:21, Hildebrand, Stewart wrote:
> else +        { +            sched_priv->next_switch_time =3D
> >>> sched_priv->next_major_frame + +
> >>> sched_priv->schedule[0].runtime; +
> >>> sched_priv->next_major_frame +=3D sched_priv->major_frame; +        }=
 +
> >>>   }
> >>
> >> There's no need for the above loop, this can be fixed by subtracting
> >> the remainder (modulus major_frame). E.g.:
> >>
> >>     if ( now >=3D sched_priv->next_major_frame )
> >>     {
> >>         s_time_t major_frame =3D sched_priv->num_schedule_entries < 1
> >>                                ? DEFAULT_TIMESLICE
> >>                                : sched_priv->major_frame;
> >>         s_time_t remainder =3D (now - sched_priv->next_major_frame) %
> >> major_frame;
> >>
> >>         sched_priv->sched_index =3D 0;
> >>         sched_priv->next_major_frame =3D now - remainder + major_frame=
;
> >>         sched_priv->next_switch_time =3D now - remainder +
> >>                                        (sched_priv->num_schedule_entri=
es < 1
> >>                                         ? DEFAULT_TIMESLICE
> >>                                         : sched_priv->schedule[0].runt=
ime);
> >>     }
> >
>=20
> Stewart,
>=20
> I appreciate your suggestion to eliminate the while loop.
> What about initializing major_frame and schedule[0].runtime to
> DEFAULT_TIMESLICE at a653sched_init() and use them until the real paramet=
ers
> are set as below to eliminate the if branch?

It would make the scheduling code cleaner, but since you asked Stew I'll de=
fer to him.

>=20
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 930361fa5c..73ce5cdfaf 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
>      ops->sched_data =3D prv;
>=20
>      prv->next_major_frame =3D 0;
> +    prv->major_frame =3D DEFAULT_TIMESLICE;
> +    prv->schedule[0].runtime =3D DEFAULT_TIMESLICE;
>      spin_lock_init(&prv->lock);
>      INIT_LIST_HEAD(&prv->unit_list);
>=20
> static void cf_check
> a653sched_do_schedule(
> <snip>
>     /* Switch to next major frame directly eliminating the use of loop */
>     if ( now >=3D sched_priv->next_major_frame )
>     {
>         s_time_t major_frame =3D sched_priv->major_frame;
>         s_time_t remainder =3D (now - sched_priv->next_major_frame) %
> major_frame;
>=20
>         sched_priv->sched_index =3D 0;
>         sched_priv->next_major_frame =3D now - remainder + major_frame;
>         sched_priv->next_switch_time =3D now - remainder + sched_priv-
> >schedule[0].runtime;
>     }
>=20
> > The direct method suggested by Stew is preferable in the unusual case
> > where many major frames are missed.  (We have only seen that happen
> > when using a debugger.)
> >
> > To help uncover any issues like the one this patch addresses in the
> > future we may also want to follow up this commit with a change to make
> > scheduler misses more obvious.  Something like the following:
> >
> > commit e95cbc9078127c412bd1605d93cb97837751b5b4 (HEAD -> master)
> > Author: Nathan Studer <nathan.studer@dornerworks.com>
> > Date:   Thu Jul 17 12:43:39 2025 -0400
> >
> >     Do not silently skip frame overruns diff --git
> > a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c index
> > 2d0d3bcbb3..a2c1c66c27 100644
> > --- a/xen/common/sched/arinc653.c
> > +++ b/xen/common/sched/arinc653.c
> > @@ -523,9 +523,17 @@ a653sched_do_schedule(
> >      a653sched_priv_t *sched_priv =3D SCHED_PRIV(ops);
> >      const unsigned int cpu =3D sched_get_resource_cpu(smp_processor_id=
());
> >      unsigned long flags;
> > +    unsigned int oindex;
> > +    unsigned int missed;
> >
> >      spin_lock_irqsave(&sched_priv->lock, flags);
> > +    if ( now > (sched_priv->next_major_frame +  sched_priv->major_fram=
e))
> > +    {
> > +        missed =3D (now - sched_priv->next_major_frame) / sched_priv-
> >> major_frame;
> > +        printk(XENLOG_ERR, "Missed %d major frame(s)!\n", missed);
> > +    }
> > +
> >      /* Switch to next major frame while handling potentially missed
> > frames */ @@ -544,6 +552,7 @@ a653sched_do_schedule(
> >          }
> >      }
> > +    oindex =3D sched_priv->sched_index;
> >      /* Switch minor frame or find correct minor frame after a miss */
> >      while ( (now >=3D sched_priv->next_switch_time) &&
> >              (sched_priv->sched_index <
> >              sched_priv->num_schedule_entries) ) @@ -553,6 +562,12 @@
> >              a653sched_do_schedule(
> >              sched_priv->schedule[sched_priv->sched_index].runtime;
> >      }
> > +    if ( (oindex - sched_priv->sched_index) > 1)
> > +    {
> > +        missed =3D (oindex - sched_priv->sched_index - 1);
> > +        printk(XENLOG_WARNING, "Missed %d minor frame(s)!\n", missed);
> > +    }
> > +
> >      /*
>=20
> Nathan,
>=20
> Do we need a comma (,) between XENLOG_WARNING and the quoted string
> when calling printk()?

No.

> And wouldn't the log be printed every time a new minor frame starts, for =
example
> oindex =3D 0 and sched_priv->sched_index =3D 1?
> I think you meant to use the condition "if (sched_priv->sched_index - oin=
dex) > 1"
> to check minor frame misses?

Right, the order should be the other way around in both the condition and t=
he print.

Regardless, we can just worry about your patch for now and improve the miss=
 detection reporting later.

     Nate

>=20
> Thanks,
> Anderson
>=20


