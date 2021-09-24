Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D65417716
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 16:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195433.348128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmY0-0004nW-Dz; Fri, 24 Sep 2021 14:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195433.348128; Fri, 24 Sep 2021 14:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmY0-0004ke-B2; Fri, 24 Sep 2021 14:51:32 +0000
Received: by outflank-mailman (input) for mailman id 195433;
 Fri, 24 Sep 2021 14:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mTmXy-0004kY-K4
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 14:51:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9e4161c-1754-41a6-a8a5-ef51a49bebab;
 Fri, 24 Sep 2021 14:51:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-nI-OD5Q2Ol6IEAX7tEF2Xg-1; Fri, 24 Sep 2021 16:51:27 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM9PR04MB7700.eurprd04.prod.outlook.com (2603:10a6:20b:2db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 14:51:25 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:51:25 +0000
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
X-Inumbo-ID: b9e4161c-1754-41a6-a8a5-ef51a49bebab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632495088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ne2rZslJgOXXz3fWsZIIWBdbnwrHNB68NV7aproGxE=;
	b=BkVI4kEw4EnWit9EpxllLY3LK/OI+3Ay5vFLOq2TmDbhohhWYmgQPDtdgpPy5iGzpGfsN6
	26O+/NXh14DkICvE6d+grTO8tpN4pcdSlR6aNxVaJCnO0nD8v6YB9h6mVuPPBe3vkU+QsQ
	Wd142MpLp8l6asbL5XzJw2wfWAFa5Vs=
X-MC-Unique: nI-OD5Q2Ol6IEAX7tEF2Xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUsUM9nx+uYoiJn1rLc5AwG2dd01PZ6JldoGGVL2lBP3/ewTz5luAcTwNAlXhjq0jESFC9Ga+npBabDvm/slXeH3JJKV/01RWQx++V1kxDvzZsQSpx6cSes8Q5It39w09LKkIa4iD3Iv6+AqKEWTP/KjaL88ZPlmhl06qQTd6NSZ3rwUIYN9zNkERQoeRARwbqnjFyQsIOvC2wgn2KEVfXXex20CKQTPsCg6o1NxPIrjVsMe5YEJB6pqgEsRN/OoegTW9YVakEWYW837g9uksqONxCFj5QkzJIHNWY9mOq9JlvDHhIOw9GTwC2oPWIJUSc9K+OPH4jXd3xtcCIMAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0ne2rZslJgOXXz3fWsZIIWBdbnwrHNB68NV7aproGxE=;
 b=BVFuzv/S/Fy20on8iswfiKiVXYv8RAHP1cNqyaXMxpLIEDh4mbAFnghasIzaBxgUgl2Z3kNrjH5w+Ya5pe5DOycuLANPGdD3534nxxJ0eE/F+FBnrffygjCgmrQZW3diGz8xQVI7DHzUBgvaAZyz7cj/g0Mfdt8N91z4O0gqeDep3D/gKMoqT8+7L7LRZl2sfsocjJrW6V97Q/iI4f0K4tPBfRFCk5wLmI2f6yUuhdLpGbhBcbxviaP2vBxTPGHSzZjjbC33G0c2y4X5hIQ2EGMM0htMJOqjFARDu10pTgElFN8hpqnD3sJwHGbLfRZ0O2ya0TiAEemqdUeVg/C+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
	"mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Topic: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Index: AQHXrkSLbMGUvlBXkkK2FQ1vuFXyFauzSsKA
Date: Fri, 24 Sep 2021 14:51:25 +0000
Message-ID: <da06dfe42adad13650755650518a232dd41ac46e.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-2-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb51e165-532e-4f23-c050-08d97f6ac8a9
x-ms-traffictypediagnostic: AM9PR04MB7700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM9PR04MB7700C61C8740999592F9BC99C5A49@AM9PR04MB7700.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tiQWRd6+4T/5DQk8qdWbhklcI06KMt+6M+SynfBaMBQMAKGMFgYZXrKSbdjAPcAF/Htf8boDp2+7akjHYTOEDZz10pvygQzk5kYL/Y93bZivw+pnvntNI/PATZ52428uGi6KZJY2NYICDI0p5q/gp2tXsTJ9bh+lv92pnLGVRULTmDa4sq193jO38vAlj3Dd9yWfzMUdSwzFx/0yDnBCOYMfBaPqPiKWlzAYtZ6GqmG2uWLE6QH4G2MHgkFS4XcdS4pOO3OoT+CSzsPfCd4I5cYMQW+RmhVgCXfihfCmNgM6o0V778/Uxt38IBBl0es9mkPr9t+FATcy1B1TvjBqBvly08puGXrwE96Cn9vukghk4NC9eDipImt5AqJVR1LowBdPXrigJEE4D4WddwSzmqwngCBFEJf+kGFxSZZknc1YPeHckyFSOSWGppwxBdQC60Eei5L25Q8BKaHxEhW+Koi4HGMyzg46wyXTM/dpavTkzVFRAOL2I//xjlHGERlMorWUTfYx3MlG7H6CYlKS/ckrUk3D6N3UNFL5ZeVN+D89tvaeOeIZPLjMgPoXExlvsIOzazXHt4t7d8vtKQNKrelo6UUlxbcisVyohp2KoGO0BOipBcFDaEbf7KV+ngwvXktosYMLmBOsN6yDP+hBH/ASlTGq3zs5rT/7i+G5oSccAYnRhSeDLWhfLnHsVUbE7Om14zhYu5soVhXpL/C/kwjpNmLAli9lnzZrd8BVbwc5SCbC0veThgiP636tcIoPdbnBBdrptJhICRIZrhDpI4Y/SMVuEUoyFOQFxnx+X9jud1Ht2EZPIkB/tzfvpi4glJR2/6at8H74k7LCrC5ssw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(86362001)(122000001)(83380400001)(2906002)(91956017)(2616005)(38070700005)(26005)(8676002)(5660300002)(54906003)(66476007)(99936003)(76116006)(6506007)(186003)(6512007)(71200400001)(508600001)(66946007)(66616009)(66556008)(6486002)(64756008)(36756003)(316002)(66446008)(4326008)(8936002)(38100700002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3ZoeXd3UDFwMFduMjNqei9YdXlLZHhwMjFKQTE0bEFQQ21xY0hsRWZRMUhJ?=
 =?utf-8?B?aU5zNVJPY1lNdnpwWG1oSGQ1T1o5MktwRzFDZmlwTG9RNE41QUh1TTVKajds?=
 =?utf-8?B?S1JHVE9YWEtSdnhJSk0xWUtHV25LWTBKdUM2UDZQRTJDbHE3MDh1YW85RWQr?=
 =?utf-8?B?OUdpb3Njc0p6Ym9DblRMcDdsTnhUR1AxbWJ5cmhCSFJQZlBuMksyNEF4VkxO?=
 =?utf-8?B?QWp3LzhqcHBFWWlOa0ZOVFhMaGg0QXFaL2d5WElDTjlyZHBQODlWUmVmQ3hI?=
 =?utf-8?B?UXZEUWtxMWdaNk84aW9nWFdzUjNaVGJMYllpYktmbnhPSENqMTk2TzJSTFBp?=
 =?utf-8?B?c3J4azZHRENTNGV0VFlFSmhwd2txa1VqVzJ6ZjR3NmI0c2JlRWFSdHZ4cU5j?=
 =?utf-8?B?WVo0MDRzWnF3OGQzSFg5Qlk3ek0zUExxQ1dxWk5hTzhQN05HZSszcUw4YzJD?=
 =?utf-8?B?ei9VcUJBNzdlWUxKSGJPWXV6amFkTUg5dVJESmhMSFo3bW1JNXA4T1gzL0NF?=
 =?utf-8?B?aldWeEFRUXdMaUIwMmpTSmJsQS91ZzVFQkxpN3pGd0JnOG5ZM2V0VVRnUjY1?=
 =?utf-8?B?VUtaRlUzeUd0ckwrNHpmaW5vRmJmK01sYUJOY0pKRjJRRHlKalBZMGcvdGhp?=
 =?utf-8?B?WjU3Zy9sRWVzbmdmUy9DLzA1M3lFQ1RNa213U1Z6Ykt0WGwzMURiVjhWakpi?=
 =?utf-8?B?M0tLa0Uxa0Rub3VzUGdqamd3NTJmaS9QU3d5U3NEWG1sb0Z5cEsxL3dKV3Uy?=
 =?utf-8?B?UkkxNHIraGtEenNhSzRCWHBOS3FnZXAzK0FlT1Iwa3NqbmJXQ2RNY3RqL1Br?=
 =?utf-8?B?OE1MZVplbHhLaTV2YkRiUEhOUFBkc0FvUU53eXc4U3BqeVZpS0xacDJvS2Fh?=
 =?utf-8?B?Y2hwdHprSG5NU3p5RDVSWjVtOGVnRzNDWHVXU2IrTWRSUDAyQVRWYUx4VTl1?=
 =?utf-8?B?T3p6WnNhN0xmQ2dXekc0RjgyZW04TGtoTDlldDBMNmhRZEJHTVlSVVdRTytk?=
 =?utf-8?B?djU2eFZLaS84VHJ1UDFIUjVlLzQvcUdYbkZWRHYxT3ZxTFMvaU8vcm5XYVZB?=
 =?utf-8?B?TFBEcnRCQWNsWjQzZHRQYzl3SFlER0N4L21XUXlHVTZzL2QrTCs2WXJveWdl?=
 =?utf-8?B?MTZqYzJXdkN5aFVHUkFsaDFveUx3Ri9QUnpFVmI2UGlzSHdDR0FFd21xd0Fr?=
 =?utf-8?B?M1NqQUEzcXg5WnlLUVVBbmNlek9FUGNUVVhMSWNHeWtYWVlQa2dOV0RpcnBa?=
 =?utf-8?B?ZXJrU3VVeE9IdFo5d3V1VXlvMk9FQ3Jqb3MvN29VQ09ET2pHRjNDTWxneXRv?=
 =?utf-8?B?cExlUk1tRGpldlRTSFBWaDR0NzdxMjVLYXpydG1yTWhaYTZRM0tYZWV6M2M5?=
 =?utf-8?B?TTR1M0sraUZSQ0xwSmZlVUxNK3lyUEQ4YytDSElzWjZMNUNkWXBmV2JHRitz?=
 =?utf-8?B?L1pxVzV4d2k1Wm9CN0JkNGNQbVkvb2N6NjExV3dONHgxa1ZkekpSenJaRXhE?=
 =?utf-8?B?TE1kajVtZGVMNUZiZkhnTHp5ZG4wS0pxUWR5dEMyV0tqcmZQK2p2dkQ0N2pN?=
 =?utf-8?B?Q2Y1L3dIWTFOMUdCZGdDVTRETmlxSXpSeGdLd2R0YWZTRU5WMkFMRWxndm9r?=
 =?utf-8?B?b2JNY3c3bDIwTGFvdnVFK1p0bU5HeVFvZ1NJT0svRnNpN08yUHY3VU56WmJE?=
 =?utf-8?B?RTdyS09Tdnl3NjdwVEM1UzBDc05MdThKZFZxK0lYdkdvTVpvZUhFS3oyTHF5?=
 =?utf-8?Q?3zbsunYrHFlzrpJKhSjMy1OQCk0JWDbDHDSw2Bd?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aVHzvgoRXIEmFtazal28"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb51e165-532e-4f23-c050-08d97f6ac8a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 14:51:25.8655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7abEomiAhj9mCdC74yL2sHmcHPBOjb6+f/KpuMIa3OuCKO5sn7XE1aHm3AC8wgpphXX3keAucvPq6zgcy+6zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700

--=-aVHzvgoRXIEmFtazal28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:

> There is one buggy race record, TRC_RTDS_BUDGET_BURN.=C2=A0 As it must
> remain
> __packed (as cur_budget is misaligned), change bool has_extratime to
> uint32_t
> to compensate.
>=20
Mmm... maybe my understanding of data alignment inside structs is a bit
lacking, but what the actual issue here, and what would we need to do
to fix it (where, by fix, I mean us being able to get rid of the
`__packed`)?

If rearranging fields is not enough, we can think about making
priority_level and has_extratime smaller, or even combining them in
just one field and decode the information in xentrace.

Of course, I can send a patch for that myself, even as a followup of
this series when it's in, as soon as we agree about the best way
forward.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-aVHzvgoRXIEmFtazal28
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFN5e0ACgkQFkJ4iaW4
c+6q/Q/8DwA4DlewXTHS29SDjjqKfIyqDwSFAvRLJRqbLX4o8MFy4t/j2+rxgs09
1xw3uNBLxWpc6BtD490++TUraYo3YSY9Xw3fVYmStWNh1jRl3cOrl2g6H+neswcM
XwP+rz3sN9J1Yz5RR/GbUTlygDdhxD14k6c/sQwMuzZNqNIRx9MuG+YegOzN/UqL
jGkjhd8NC1Pa5XYv7L4aOo9ETlCmd1cjNYPihJZNjZsBHdcGxjsu12Yu43RogIda
2HCNgIlz0ncc8AU+XJzEY0VmilWTVzVrPkNKeFf+53HBElZ0+87tGP3Epf4/Orik
FzOmlDAvNyzzeblsvrmwOgBjxKckouPd4m+QqPn15ZVgs5fzOoC5Sq5cwr5HBBMO
tLfddq4IuDo0Qe7CaeuQtmjWXhqhyk32erBC0+dpYMDM4tt7ba6acU53unRP5G2a
DCZoeDwUF7z2BCvMAwoKsu/w0C6XeIhMPCYvhXjbo4Dv2qrFD7I/C56T8bdHN2c0
EK7rzavkY9L2lo4XLWOMW4Mdg2JZjmWiRC/7ol+cdyINoZ2B51H//+1a+432IwLu
VSOmtxGFwiOSOcMIcwXRdboXtzfuTHl4h84j4MS+22/ELH4/sc2t+FL+ADbIy0p9
G6WDt9qUazC347p/YTrP/yXLwGNBBWqyFLnHxPY31lJrv28ui9E=
=itj6
-----END PGP SIGNATURE-----

--=-aVHzvgoRXIEmFtazal28--


