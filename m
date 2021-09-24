Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B48417920
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195542.348297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToTG-00031E-Ll; Fri, 24 Sep 2021 16:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195542.348297; Fri, 24 Sep 2021 16:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToTG-0002zQ-Ia; Fri, 24 Sep 2021 16:54:46 +0000
Received: by outflank-mailman (input) for mailman id 195542;
 Fri, 24 Sep 2021 16:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mToTE-0002zK-LT
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:54:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d643266-1d58-11ec-baff-12813bfff9fa;
 Fri, 24 Sep 2021 16:54:43 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-xTvMKznCMKCnZGEA3gj4_g-1; Fri, 24 Sep 2021 18:54:41 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB7089.eurprd04.prod.outlook.com (2603:10a6:208:1a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 16:54:40 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 16:54:40 +0000
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
X-Inumbo-ID: 1d643266-1d58-11ec-baff-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632502482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WcRgIvLdOeeOVAbGhqlrNrO/FmyiaDsbtnAlH9WiAH4=;
	b=biZ3QFnMqnpN+BLuoMyf2QZbjsrci5InG1XDQtORHNj2WYvRCxUsKmbXJqA90KhdUjphlB
	t6i9i8d90Yzx5JFHfz8q4+eWXC2RxHJHoh0idPEDzUsiOsiKaJahyxbJfMw+D1G9hK6OlE
	z7YzhRg33r2lipscnj2o6+zS1SvqEAA=
X-MC-Unique: xTvMKznCMKCnZGEA3gj4_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmXbb742Rk3c6nDITJMth10BMvdB4Q+V00WxdSjTtv811IfCJLk9E77H57P0Wr5+N+A25KA7nvAnhqdQkgGLGYLiLGRkUGGydBT3xGA+beALRSFit7kXwCrY5z3v3Ol02LCosyKqTsXNja+C5wHi66u8ulTQfebkeycUN8o3gBb23v2ZMxl8G2i8Q/RSJDtKrM9amIfOFyXMPoZiHPKnSsi/k1KT3dFGAuUdXMxheyKlPEx4ie4IkymxRfz8MN65KNt6J2ufHRMaTq6u4RZ5FZHFFOJG2p9L/KISPtqGBJdciaWmEaUmun8dhIpGP4gRLyCM6npP68Xm2Nc73TL9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WcRgIvLdOeeOVAbGhqlrNrO/FmyiaDsbtnAlH9WiAH4=;
 b=KqHCRld9RQtzuN/GwmU/2PHKMCHc/4rmvlg9ZcD10rzDbs/uJcjTJHr0/ssdPvcKwBYkusTMhOgKw3rTO4/XBrGWwK2NUfwJKMStycpnqVCZDFAADENvxN5d1d5SZTfXggOR5HISvjcSFpkRswz4NvLTl0z4D57EIMx4dsmdITu/oQzQDjUwy20tabq5UJ1pRpg2VZYoCJ+5bRG+3/cOrmqmpBlxWo1OLWtCcy59trUcursVg7IYXiKthddcenybM0bvqdFx/XMlUjGAckH7hbeGVPgYbmgnAa86kUeTmn8aYcuoWqgbQr2qWmDILz/5bS8UjDJG2z22q/vCVEK7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2 03/12] xen/credit2: Remove tail padding from
 TRC_CSCHED2_* records
Thread-Topic: [PATCH v2 03/12] xen/credit2: Remove tail padding from
 TRC_CSCHED2_* records
Thread-Index: AQHXrkSMLCUBSY8ld06BUZqwnuzywKuzbTCA
Date: Fri, 24 Sep 2021 16:54:40 +0000
Message-ID: <8ad0beb748c2fb5b6e232d725ec6cf7ff7f945f2.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-4-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-4-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93702dd1-f762-4744-3531-08d97f7c0043
x-ms-traffictypediagnostic: AM0PR04MB7089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB7089B3D6806613CB05865E43C5A49@AM0PR04MB7089.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w9Go1MvWPi2EFVuF2CmniUI116hNYqozhLI5E0uGBmBVx2RDk5feuwqVmQqtfC467IZZf6jGFEGvXEjR6XOO80d/f5bqEFJdZYH2KQWnQ6ue4w2stMxsyva7tBmFvs9/RZK9Q/eNhz4U8wnfkjpNSE+PKCk9GqElQKr+Oa1toZ42s7tdlxjn2xW5yEyX0w6yQ7ZgxqMv/WM9PIQqdlknzGamX+AP6/f4ghUlmp1BOmSJRvUK33bGFy/wvpMtG361gtTFKax+6CG1q6uQ4iAcjjPDYIonKuzPVcV9edVI41Tm3Z4jewerH7sq2ADk//usRwTC4wlooeBC/lJrYtFe3/GM/Pd5g95bWelKqeouDT0ZDc/ZlvUJJ4JAhBEcePRPwbRlHTg6hp0q2OcLCLhJV/ArVPu2oy/zPFWvJNt+XnyqU1jnI/5fQqDmHpHRhOG5sDwmGfAB8FRFLDzMfpjbnAxsuog95qUfP+gc49dB2u5sXy0+sVs8t6UDvs5TUcfNYBiwOx9Aoz6LwxYSYkmQz2mVCWqq3w4NWmBbWdGDmaopjuaNDVKkPcsI6gkRUl7uqN7N/R6sKJ8fdy1vVMmAE21wx1ApjYYXkmviqZOm9YOt2fLgJqGY4orbMkcETwwWJL4GCAOA4+BVewaaBH8uk7Vkp1Ut/f0qfTB4bgkKGfSp7CM9SDCP7nTZecGnBi2ln4J1BxGBcxkBfWg08SGo1jlb+k24Tf+bkpL4xbvxh3QKL7HR1dALek2m/7cxoT3/HQ8mWcUlgZPx49DXK6lVHVbwvMrCp0bLuDGxtNIn6mL8NLBdhtygqnrNq5ZrLyUF7i1zh5kTOFI11hS7hX6LoA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6512007)(5660300002)(99936003)(86362001)(110136005)(54906003)(508600001)(2616005)(8936002)(71200400001)(4326008)(4744005)(76116006)(91956017)(66446008)(26005)(38070700005)(64756008)(66476007)(6486002)(6506007)(66556008)(66616009)(186003)(66946007)(966005)(2906002)(122000001)(36756003)(8676002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djEwVzdsc2tPaSs4S1hQN2FZRnM0RWZTV3RkdWRURGhrQm95SzdXQnVNTVBZ?=
 =?utf-8?B?aHJPbGJrZnVSRFg3cHJDVktYMjI3L25LdkEwQ2x1Q29rTDI0R0ZDOWVJdHF6?=
 =?utf-8?B?L3hzWFBRdXlackNHZVZJa3lWOEZGVzkyeGNxdnNmcjBqdnVIUDZEcmxVRWFT?=
 =?utf-8?B?S2pPZ1IvVjdiZUJHc0loL2drNkhUTUM3ZVFhZHZXaWU3NU43Yk1wVC9CTUhs?=
 =?utf-8?B?allyMEtDcDU3WmhEenBRR3lvRFk1ZGJlQWY2T2VnREFjSXdMMFVITDM4ZzBn?=
 =?utf-8?B?OXBQWTZBRUZjeG1raWpIVFFxbVpGT0NIWjFTQWpsNWo5L3cwV1RjQlN2SGFC?=
 =?utf-8?B?Vnd1eDNYNkl3U2xqZHZOTWxMdWp6ZUxkK1YzS2E2R0R4M21RT0MrRzhZb2ZG?=
 =?utf-8?B?T3JNYlpaQW40VVlIVm5GOS94Yzd1Q0xISnNTd2E1ZU9sb0pjejE2UjlKclZZ?=
 =?utf-8?B?SC84SCtLaWFXVExaQnhrMFNMcUY4bzQ2bXlGN3V3Ty9ubmJLTzlTdCtDQ2Vp?=
 =?utf-8?B?T05LbDJRTnpTY0E0dTAwYjZXNFYxVTZpYUZwNmpWaCtaWTNVWXl4M0JQMzll?=
 =?utf-8?B?UHZCWUIwTmt6Z3Q1VzNZWjJhMUJtcWtyN0pmYllhSExIVjFUVjl1ZVB5eU9k?=
 =?utf-8?B?ajk1WlduYXJPU1dkS3JjV0ZXYUVKczhoTmszN0tuZVFxQjY5OU5WNjlnQ2pU?=
 =?utf-8?B?YTJOZmxxbVhrMVJMVzczU2JqZU4yTE1lS1FLUDB4bnZvem5OY3cxRTBreHZO?=
 =?utf-8?B?UUNEenNuUmpVRkRwSTg2SEp2elJweFRUQ040TmxkTlRKdlo2K1B3OGlqNTg1?=
 =?utf-8?B?RXo0YXhJdmpFL1BxTWhVUmVpZXg2eTNBcVMrZjJzMGIxdjRnSHVzSjRIUW9L?=
 =?utf-8?B?bzJKNzl3U21CY1ovYnAxVzNnNlE2aG91QmlPdDNVTjdFaHJpMnNoSTI3TFNX?=
 =?utf-8?B?OUZaN0IrWG5ibFZRRTJUM0Rpckg0T28vaUpZZVN0L2ZvdGxPZm1GZHdCSEhO?=
 =?utf-8?B?Mjhscjg5NC9sZjBnTTJyVVQxZGRmTUJFOE5HbFVkQnREbDJpbHJsaDZKU2JU?=
 =?utf-8?B?dnhkRk90U0h4VkRKcHhGeGg1UlVybkpZdG04OUdvVm96M0ttRlpPTDlqQjhP?=
 =?utf-8?B?L0UyMHN0bW5hNTlEWWdsVnFnR0o1YkpvR3Evc1dUNzU2S2VJQlh5T0d1RmdZ?=
 =?utf-8?B?WGVVaUI0ZkFrUUpCM0FUSG9YQjFaWUUrNzNvWXd0Yks1SDQxZS84QXROSTBC?=
 =?utf-8?B?WUN6eDJjVEowbHhuWDZGdFFQWUQza0QwN2ZKdjZYWjM5VjZrZ01xS2Mvak1q?=
 =?utf-8?B?dUt4eHlJanhRWmNrTnd6OUs2N2lyY1gwa3JxQ3k3bDZkekdBZjZMcDdnLzli?=
 =?utf-8?B?K094dFhOYnBUQTgvMjNGNTh2cXk1TWplaXBIOCtsVEMyekdlamd5Y3dGTW5N?=
 =?utf-8?B?WVVZZHh2Q2xxbW1rR0VISlBjZ2Z6VGhPekk1dXFMcVVrMXA4NG4zdS9xZFpS?=
 =?utf-8?B?QlpqRG0wOVVyQk96RnZEcXk1cldNWFpBVVdRTlRIaVU3ZVBpb0tWcGt1d2Iz?=
 =?utf-8?B?K21CRWt2RTBhUFZCVm0wUmlyZFAxcVkrdWJUaXA1UlFDWlJIYjhFT1Mwcjli?=
 =?utf-8?B?Uk5uZFVRSjB1cm5jY0ZoUzB3dE8yNlFHMW8vU0gwdGxHdTgyNy9mQ3o0MGVT?=
 =?utf-8?B?cndUdVhta21WcjIwcldCc3hSanZxNkM1YnVFSVMyVm53NXZQaEwrZlFkOTZH?=
 =?utf-8?Q?JA2spt/FVtpkNJ2rUtms8YuOjxdZtIdVtfSMdsN?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UE3ECcQOdSMTkwtNCqBC"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93702dd1-f762-4744-3531-08d97f7c0043
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 16:54:40.5843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fTY/GwZSbUYWic4W/mmS6zwAeBgIgJGnPpVCLiozMUe68REXBrrPGKDce6pUteQZSWBTRfdA+LSCGqMtqwHDjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7089

--=-UE3ECcQOdSMTkwtNCqBC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
> All three of these records have tail padding, leaking stack rubble
> into the
> trace buffer.=C2=A0 Introduce an explicit _pad field and have the compile=
r
> zero the
> padding automatically.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-UE3ECcQOdSMTkwtNCqBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFOAtAACgkQFkJ4iaW4
c+77zw/8CJBHAQPQgIBeRjIlRDHfjhSA3bDGpEyq/UuXRDLRWhdLgt2Y/zB+9nID
uno7vmIokm2ZnIZAIb1D9eYS9W/SbVtPCa6+bpoDKUBchnqw7j5aFJARYXlpZOwl
/yONPn10bgK3weDNIAL0jde+NUrPLUL8rF5jc6ouMv3qxR6tdazkq3mJBAHQOwby
eWBvQyiZaIvv8VdOfE+fjp18KhYeXT4heQAVDyaHEAlfEnOUb7T2CuBnMjIvSik+
5S/8L5K8irW0vJD/eTt9Tq2y2IVtzwXJBHJQG42o5nSCcvmc4VViKE4Wo4guGl+P
94ZHZWh1UNvqVZMXdYCjTx4iAs55R7+PXTYYBvUVB+PS29aKMaiaYc2rZMxnI90Y
JxpLpKG9Yu9jX0dlhZzWUZmxkYKJifj9YffIlLLfW5sPyMEarfAoB3PpjRoiXsmw
BhnhSGWkzVuf2A8XfEqo7HnIJ/cqmjHwpRa5n5/myljI8oMTkBpQNdvFi8uj5R/T
76bl1BNGV5glxdZxcnTena+JPpuBjSddlbb1EZyDNo/EcKqMRaCg1RJGEUVnQCNS
jzOjrnpBQa13XS/kIHGdDMY431k2XlVAac0v20v2wWTbdY9z47b6+OKewSOhQoEc
ULc84joCCat5xR+9ORy8/7ZSqh+r5UGbVkC1ZK32Qe99ctSU690=
=+oz5
-----END PGP SIGNATURE-----

--=-UE3ECcQOdSMTkwtNCqBC--


