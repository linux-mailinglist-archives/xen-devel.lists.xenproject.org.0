Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DAA588A07
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379728.613439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBAs-0006L6-F7; Wed, 03 Aug 2022 10:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379728.613439; Wed, 03 Aug 2022 10:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBAs-0006JK-CG; Wed, 03 Aug 2022 10:00:22 +0000
Received: by outflank-mailman (input) for mailman id 379728;
 Wed, 03 Aug 2022 10:00:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YjKV=YH=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oJBAq-0006J5-PS
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:00:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14c16cd5-1313-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:00:19 +0200 (CEST)
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AM9PR04MB7714.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 10:00:18 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5%4]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:00:17 +0000
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
X-Inumbo-ID: 14c16cd5-1313-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK7TySsekFWSo40FFYyrKZhQtcPqEWDbLpohAlnSYBmwaHMNC8TCu44vqXr0WgrP5hMBNO3LHyKbc5rQRPev3L7TcH+gXy6s8OPR+MAIhm61UJ2YCpd+HUo0KAzbVm6cQ7T+2YYIR6kHBSt6KzhbPG5qHQvailZLfzFJ/JhkD2LB4PD6L5uD4lE5xqtqn3SufTbTk9hp2xW9lak3EqQVVLmxEzc1P/tORl9hEX6Hbco7FETc/QeGDcX4wt5LkKG/owFjL7vGHqQFaOFx+0HnumDSAc4r8jJXRZfYpsHRziD+mHYT1qXQf9maHtDqUU3RgG/x/J+1nMMOZDn/qca9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDWXnytLOpLzf2SPxM8lT6k1xRymOGxB595lP33cBzU=;
 b=J/gcE6zaeza6Zj2BmmGAmvx4TWeVUobpPK8Jo+P7X/bbnh+I/J+p+VekkAWmNmdc7eQCdfHu29WEfBJ1AuE6O1ndv1eJH1+ZED78K7FkXzYNkS2t7QiB3sPqMATTqu0l28G9o/XA5Oito2G/wG1eVujRbUjXuy/tY1V+pDgcQ4t+0FZunjdJXV0q7S2LCVnajTe+KYken6G5haLKO3domdrByKW9ZHKU1XHjErXScE/pjhheubJBp+K2ii9BdzNwBpeN7hiEV3Qd+M4cmHoQR6JzsB8L/2lwNqW0mQ45kam/smtI1p6TFZ0DiGg2PYTH+KVu3VcqXPtIdkCbn74wcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDWXnytLOpLzf2SPxM8lT6k1xRymOGxB595lP33cBzU=;
 b=n3S+3BQY53boYePyBv88tqsi0mmD0gI3IEGHVZQcpGblwcjHIYSIQDiq3ZCiSJNiQIMuI4e6JlZGchFuTYXvtCJpig8IDaGJvAnLWDuGdImslRbjkXSlacsWQ0I19avVst20gDbflBjuc/l8tJIQ4Rpf1OQxKv8Ru32cD4YaDvNzRQocugh6o4jF/b/+45XmjrSAYxxU2SlzrpEfBxM4VO5Q844Jw3/maNSbba2VbPFXfvre+dPbm8IOkIq9w/9VkZvtMe31ydWTDM0o5PpxW9vdRyRBCMlSaO1pPe7PW2pDZwirWxmsvL4XN9aZz1gqzUO3a2bbUPf3YlHbnLZpDg==
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Thread-Topic: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Thread-Index: AQHYpoAcjylCfZ/IlE+KXLo2d64v4K2bx1SAgADtnACAAD24AA==
Date: Wed, 3 Aug 2022 10:00:17 +0000
Message-ID: <40e87f0fc1e3d15b4270c9379ee4b5f71817b1a6.camel@suse.com>
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
	 <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
	 <473a337f-3211-c588-9398-b9f9a18926e5@suse.com>
	 <228c70b853a8d790f1e1cafc2bbef00b5f845606.camel@suse.com>
	 <d6ecebb5-5056-d4b6-c2f6-7d2cebec13dd@suse.com>
In-Reply-To: <d6ecebb5-5056-d4b6-c2f6-7d2cebec13dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54c5b63f-ddca-4839-1859-08da7536f832
x-ms-traffictypediagnostic: AM9PR04MB7714:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WPcirKpjNUMS3q7cbZWFW1dGYr4LZVHbcwv1rU8XrjJiuC6A3GzHNos0c1P0D9posaD8LiMebia4dI+ao2S0aGIwWaj/uzTD8VuYnsakmA5o8zI3Fol1offDFekRMutkhzW7anxkAPctTU/c3Hmqn0Ws0WsvcPEzEeo0Ieual4EhSHW0Pbz4liLIyt0eJn96RVEqglFK9l24pnTyj1uWSuehkTRCTdXCxDMyxqkEGL8iB3WWHqN/ONL0LG6L8NlH18LQmZJxRF//mNpfZ1dRmH/KeawJvgmq3E5j+MhwrxEkU5mhHBLa+riZ3t7GAqEIYijRJeGEhah1UAaP1bsuheKxkCe3TgH0iw7mYeYksGgpGqalkrT3L7YgJj28i8DIs8eK8d0cC+vxirxXx5Ko6/wxlqaBRzd+4TLMIEHQrDWzY3qzzamy5aDfSk5HFD0cNkHmQqpVkLv2RMR4U/Z74zy1AAwpMP44dEUVNFkJSvpKdrhTQgM/Lw/zyF3ofDZkdm/ZeUcRQKC6+zRJhAqo4TEMUWXhA/NcBgFgHSItJ1LR05ZG6uCTpy2nptzywErF/6YQtzC3yN1tM+BLUNVDUwY8oHbAZHRGpneTYn59A+eJyb/euBptGq3pgUXpM+ICwaM2IxziCXOmDE+TJPeRhMGy4uyy1Yi7m7sjivWUnshDxEfhJ+YiMEZO/D6YozhIK+p/eglWF6IcqAm9RTXgbROrmSj2tEnbXIJNlGu/aVPXGxK7WjDYU7Fx4NyDB1us5hiuET+CkQfACJuuIVGql3W6zecFf+1YWgVIkhElolv+LG2hBtu4FopQuGMWH/zM5tUxDHowUCrNpJPJVAcg4neXVL4OShAB9FHJbtX/ZQKFSaUDDMq9AY9u9EjCyT9g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(396003)(346002)(366004)(36756003)(186003)(38100700002)(122000001)(26005)(6512007)(53546011)(6506007)(41300700001)(38070700005)(2616005)(478600001)(6486002)(71200400001)(966005)(6636002)(66946007)(76116006)(316002)(8676002)(91956017)(4326008)(6862004)(66446008)(66556008)(66476007)(64756008)(37006003)(8936002)(99936003)(54906003)(83380400001)(86362001)(4744005)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3RoYlJuYW5XdVV4M01OVDBEU21TSHRxbktPQUtsOHlmemFhank3eGlHNG5U?=
 =?utf-8?B?NmczeVFpSVI1NW1ldjNQT3pXR1h6S3llT3NBOGg3R1dpUWpHRjk3Z3VKbGtN?=
 =?utf-8?B?YlJLcm9ZR01pSGx2Zjkwazl3VDJSaWViZUpGOVpSYjFiRFFQN3BBUERJZnVw?=
 =?utf-8?B?M042dmUvWDkvQ1BTRTFFNEdva1RDOEs5VENYRjk3T1dvSGs1eUQrOGRPUFlC?=
 =?utf-8?B?WERpa1o1NHZiYTFQQ2NZL2dJOHFaQWJ0MldRdHlrVUYyUDlIR0hKaTkrL3Jx?=
 =?utf-8?B?U1VYR1Z6bEZVVUwzQ2U4dEEwUHh1MEp1Rm1JQlVtNE5FTnlOcTk1bWNsVnJJ?=
 =?utf-8?B?UWZuK1k5VHdHYVNObi96bTZhSWtpajgxT0xuYmwwbjhETXNWNmk0a3VjK2ZW?=
 =?utf-8?B?bzdBektwYkVaNmcrRysxekJ1a2YyWjAzRWNqWkdNazBlN3dKTHlROTVNZU9S?=
 =?utf-8?B?cGtUZjlTbnU4RHJPQXJ5SkkwVFV6WW9JbVRMQ0pPRmNUdXZLWHJObzdJbHVp?=
 =?utf-8?B?Q0R6OFJTRU54K2diQUx3L083ZC92TlF6MTZxdU5jK2I1WWdJU1ZYL1dCN09V?=
 =?utf-8?B?MkpsaW1Kd3k5c0ZqTTVxRjh4YTBJR2lZYzRjWDhBR3FCV0l0VUxqVUs0RGpR?=
 =?utf-8?B?NzhHQ2NCbG9xQUhya0VoRlAwa1huYVlycEFmaXdYMnpIQ3FXN1JudWRKVWdG?=
 =?utf-8?B?SHkyRHo0ZnJSZFdDMEl4UWZJQXdheG54OXhQNVdXZzdCU2J0YTkzUDVvbndO?=
 =?utf-8?B?WVd2WjRVazZWVUc5YnpUUlByR0hhS0taNW1TaTA4MEp2enFwVWJ0OVNXV0Qv?=
 =?utf-8?B?TmIzc0NVMlVKTHJyUzE1M09ZOEdqRlN5ampwdVlENWFsR0Fnc1g3Z2dEa2xC?=
 =?utf-8?B?VXUxM0xIT1BSdHpJZVk3OGI1UlZ2dStDT25wRlFSR1g4ODVTRnlnMG9IdUJS?=
 =?utf-8?B?dncrQUlYelIySWxJWjVqaUQwU0taZDAyUnBJRStnbFd0VmxWMVFHY0RyYXNN?=
 =?utf-8?B?SStodEx3NmZReFFzQ1hndktIZERxUEVZWnhjTGcwTHlHTkhKcVNaNUYyUlRu?=
 =?utf-8?B?VjQ1MTBTZU55NFBINElESngvbmJ1WmdhQWJLenUySWNDZG1wY0FmZDlyRWZN?=
 =?utf-8?B?VzRWNFpKSUdVb1BMYnJxVURIT1lnNXBzVFdzN0dTenE3eVgrRkN0dlhNZXA0?=
 =?utf-8?B?NENuMjZMWklIZm9EaEFpQlZia3lzd1gxRjZmbW1PSXplWEU5dmp5cW9vZGNj?=
 =?utf-8?B?dDhMSjFLOWMydFQ4aWsrSTUxbnlPSThDQ25Ra1FackVKKzFqN28xSWQwem9t?=
 =?utf-8?B?R0ZtTi9Sc2VoOEEwWlpwQWw3SlRlZXYrSXIydWQ1V0xOVXpaWC8vZldpanAw?=
 =?utf-8?B?S3BDejkxcGI0dCtqVE9DT0R0N04rS3hCM0ZBOTNmTDFneWtUbE1HVlVReWEv?=
 =?utf-8?B?TSsyY3BOaHNHd2R2eWE0Uk1YbWhQaFZ1aTNWS2VWTVFmZkRJaEV5eFhhVnZl?=
 =?utf-8?B?c1BnR0hRLzUwTWdjdktIKzJJekFuMnJhV2JzN0E4WTc1SkJPUWxWdlZGRzRJ?=
 =?utf-8?B?MXZNTHBKZkl0blRwWmhWMGNDTVRmbWFwd1FXRStEUGJZclhMR1hZSWdYbzMw?=
 =?utf-8?B?UG9rVzdrR1g2RHo0eXFaM3BPM1JwdDlmcDlKUmFUVEVJZTlxOS9vZ3ZVNVY3?=
 =?utf-8?B?QmgyazNTSlE3RXlwakMrSlBOM25SRTN0NGczUW1ONWxLanE3ZDBEYlowNU44?=
 =?utf-8?B?blpyeGowdGNBYkNmdE5qMExNRDVlN1RCTUMvKzc5SHhSZ1g2cFJqSjg5N1Nt?=
 =?utf-8?B?TG96RUZRSzV5MVVEbTIyQzNmTDBzSk1FaU5WdWdqdjBqU0NQUjFZa29kRGNU?=
 =?utf-8?B?SGR2ZzZFR0dtYXdPM0tJTzZTR08vODVJamQ1UENPNnJXZ29Dd29qdmd5L2xk?=
 =?utf-8?B?YjhoQWNwdm5iOFA1YmYvcDdkK1U4TzlodUM0UGdjcXhGdnptc3FKZ2h6RHJj?=
 =?utf-8?B?OStGdndxczdFdWZ5L2VOaGdGUzlSeEg2K2FSQ3JzZ1NmN29rcTZFU0lXNHBo?=
 =?utf-8?B?U2IxNG93MlVhRU1CaTFWN2xWaW9UQ1kvODdMS0dwdDJSWS9uQkpMZXFJY3Ax?=
 =?utf-8?Q?JaisHWl16TxHjRWxr804e+mHu?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Z20Z3tjpTN325H0dnU0v"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c5b63f-ddca-4839-1859-08da7536f832
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 10:00:17.8750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3m5nNUNax3VBEdnmqylEEeMqKM6LgX6EBoqA//TUzdxNULKrzDaYdbhbE+WP/5pGRbU8qT11NdymFFVu0U60fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714

--=-Z20Z3tjpTN325H0dnU0v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-03 at 08:19 +0200, Jan Beulich wrote:
> On 02.08.2022 18:08, Dario Faggioli wrote:
> > > ... for it to be strictly only Dom0, you want to check d-
> > > >domain_id
> > > here.
> > >=20
> > Ok, I'll send an update that does that.
>=20
> Well - if you agree, I'd be happy to make the change while committing
> and then adding
>
Thanks for offering that!

Since there were a couple of things to fix, I've just sent a v2, which
hopefully handles all of them. I hope this makes things easier. :-)

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
Great, added to v2.

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Z20Z3tjpTN325H0dnU0v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmLqRzEACgkQFkJ4iaW4
c+6X8hAAjNIdSvjXo+sftb90sT0z4pEElbUiHxQramFuxEMzoJIEAXPlJxXEwtMr
aYb4/SXT4yLOI10r2ei7t9MbCGMYz3AVEhZSTjQJI92G+rKIwx42B4VRJKK7I5Vc
XzE2kcFkFPLEi7vRO254eZWML1oZ/J7v+6McTmZNJTw5iVQ6pyE6IMcjZiYGsHYx
LJSzTBkWdKhEuOCQ2emFlRIJjOxctGCdGBgsaDCbQamzreHENdo4XRlFE7X7ipiA
Ol7tYQSEPVHeifj3/81U5cAafoUAA2r29wqSLKGp6fTRjbSAHxKEZAwPVMUzhf0s
C4ODPw+/I9Fp3X+U1TtjYkb9kbWFHDFDXdqh1GyHwOKXsGfL8ne5hp989KwnkCfI
AatYxjZDd+Qi9g/1Qh69RtXEvCn/iDkLcO4mKr0bUiyLs8itelNTiB62Yl6UomHF
r1SGKs79HzwRNNvo1ABEp2F0t7ThH8RgkX1okjQ2aBtB/qAWyM8S2lsWR9XIaoTI
BEpSpeIGJ395zmG7THP70VNrzMGkjo6tLhEP9EDYvQ1pANSQ/Q6tC28mSE49Ninb
Khe9QTrFc0Yq+AmX6alZfP4zxIa3LXw4264ak7pzbJyUdJGSNWVlWR4JNwBCVCiU
hY7QyhhUADLTNNzlFw2haaPGwe4LYlzyGqT2KdG4OT2l/SZWEoA=
=v8bv
-----END PGP SIGNATURE-----

--=-Z20Z3tjpTN325H0dnU0v--

