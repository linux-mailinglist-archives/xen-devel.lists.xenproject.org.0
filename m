Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F69F1B18
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:22:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSO2k-0002Ed-8S; Wed, 06 Nov 2019 16:20:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MaMR=Y6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iSO2i-0002EY-Ky
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:20:24 +0000
X-Inumbo-ID: 549f9b50-00b1-11ea-a1ae-12813bfff9fa
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 549f9b50-00b1-11ea-a1ae-12813bfff9fa;
 Wed, 06 Nov 2019 16:20:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  6 Nov 2019 16:19:42 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 6 Nov 2019 16:11:57 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 6 Nov 2019 16:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isstnl6bnyAYPelRxmgRmVxgY9uT2jg2XW6oAE/0G0Nkuj0jjvrMUyjPMzkJ5IWWr/lkiuPeLq78dmAUmhA+jVs2U7nwYk+0nmx2q4/GidhV3kU35jGhbWD0gNe3SaqIvPVqrgSePjDtyHEgiCrBQgbnKCY9eG4mIwGZQwmRYDNmAIU2tbMKfodR8yeXkOYDSr1NDwqrQhY9tskSkvq0DKSeN/9TxYvTe6sMtPa0MQ2e1EshyJOi8fD6c2SAqFT1TrJa0u9Tx70rvKzKwfUvpqnnH1qXyAm+PatnQ6iMV9TB4dQx8a6UZmrnmYmtWWVTamz19oavIYTt9T+HWUktjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7PacgDHpUQ5gMU9xjMFkr0/b15kvRSwM8fFFkPeD/A=;
 b=WEm5dD2NyEm1wAGRZhuT0R88Uozayb+1V/JWxjvkOLVZHEnLlTfDWlxyc1oKjQMX4JaiGskIoLsRtYnQE9au1+ZNg/o4UKKoRdajFQfDEJEoT68CIeKkXMyHCmaW4/28fNlScw8ycbxVebUJ8E9BD1nyaVJKUe1VAqh06bVIiWzkI38abFMv04o9Sf9qjKrw3A+M8Y+kQc30RZaW/Hl9KAjh+9og/43RBnHrP1rp5DnP3ZWWL7umQ1oEYw1hvOO5fm3euuXdRkQYfCo5Iwjh/4Z6zYIXmO0Jj3ZvYB5SGCJtv/9S8NuO0g+B3+XrcGW5K/NVu4oy2u/WG0tAqtZ0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3143.namprd18.prod.outlook.com (52.132.247.205) by
 CH2PR18MB3109.namprd18.prod.outlook.com (52.132.245.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 16:11:56 +0000
Received: from CH2PR18MB3143.namprd18.prod.outlook.com
 ([fe80::e4d7:bcc5:f13c:7ee]) by CH2PR18MB3143.namprd18.prod.outlook.com
 ([fe80::e4d7:bcc5:f13c:7ee%6]) with mapi id 15.20.2408.025; Wed, 6 Nov 2019
 16:11:56 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "jgross@suse.de" <jgross@suse.de>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "dunlapg@umich.edu" <dunlapg@umich.edu>
Thread-Topic: [Xen-devel] Urgent for 4.13, Was dom0less + sched=null => broken
 in staging (fwd)
Thread-Index: AQHVlDTd7217hJMOY0OcKB6vUFhKsqd+DhqAgAAA5gCAAEJkgA==
Date: Wed, 6 Nov 2019 16:11:55 +0000
Message-ID: <2cfda657139279207ea5e41956e54053b9c95041.camel@suse.com>
References: <alpine.DEB.2.21.1911051556200.14907@sstabellini-ThinkPad-T480s>
 <CAFLBxZZcS7kt4n_HPHkff_RdH8ZE6Rc4tp4FvghrJr+7Hzxiew@mail.gmail.com>
 <9de34178-af9e-0f07-d07e-f46023d99bfb@suse.de>
In-Reply-To: <9de34178-af9e-0f07-d07e-f46023d99bfb@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da2aa6fb-811f-4171-fc0b-08d762d40b76
x-ms-traffictypediagnostic: CH2PR18MB3109:
x-microsoft-antispam-prvs: <CH2PR18MB31093FF62E6FCDE8084BDBE0C5790@CH2PR18MB3109.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(189003)(199004)(6306002)(478600001)(3846002)(6116002)(14454004)(25786009)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(66616009)(4744005)(966005)(5660300002)(8676002)(2171002)(7736002)(81156014)(81166006)(305945005)(6512007)(2906002)(71200400001)(486006)(4326008)(6246003)(8936002)(476003)(11346002)(91956017)(2616005)(110136005)(36756003)(118296001)(446003)(316002)(99936001)(99286004)(256004)(76176011)(6486002)(53546011)(2501003)(6506007)(186003)(6436002)(229853002)(2201001)(66066001)(102836004)(86362001)(71190400001)(26005)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3109;
 H:CH2PR18MB3143.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PIc6VQ+Q0TPV94cwEY9rsERzKG+StQ+iJwxHL2BeyyN8jZTm3LrkXTpfzfWix6+HnhuM3wrEd+czmnbjavAuDW6r+rMBWbQ9ABTdHHNjUZnI079gpM7cd4E8BdkXkblYlg/JlOLMB4pj/xBFkjHoeT1ABFjMEwCzdL6TdPgwX/mtIXOsNZjJ2A4/htJ7DxvBUXiZGSB9j79GUydDGb8VuXTY8ByPnUiODlEp403FhxYdxoLGFaXhnALY9jHLloNRNpbuZUuHzXHzHwKas8wPfOwCv4jSTuQayNQO922TeFAz1ZERPCDmzNxnUc7r+F/6smmRMKWbl5FPevfv2CAwdzsCwB/QgW2MU+bTtdnrEvdOwtgkSreqzjk05ou35G5/fDB8P0dQwPinSkwubwQfiU7nz0fbGhnSBbpLlpvLpL5fEkGTeHG/fWa2KclX312J
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da2aa6fb-811f-4171-fc0b-08d762d40b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 16:11:55.8522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WM5/y3PLdkYvJPuWCyRCwz7hy3/yoFoZ0aNlGAg/qrdP6nl5bVC2IvS9aac0Si7Ukvku2b6goZYZ+/tIzJVnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3109
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Urgent for 4.13,
 Was dom0less + sched=null => broken in staging (fwd)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0844666032864764549=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0844666032864764549==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-fmicviOuGHTQ5fwDJeVk"

--=-fmicviOuGHTQ5fwDJeVk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-06 at 13:14 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 06.11.19 13:11, George Dunlap wrote:
> > On Tue, Nov 5, 2019 at 11:58 PM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > > Hi Dario,
> > >=20
> > > I just checked and the patch is not in staging yet. Can we please
> > > make
> > > sure the patch goes in as soon as possible, given the looming
> > > release?
> >=20
> > I think either a fix or a revert of the original patch needs to be
> > a
> > release blocker.
>=20
> I have no problems with the patch. It should just be sent as a proper
> patch, not in the middle of a mail thread.
>=20
Sure!

And sorry for the delay:=20

157305592941.20672.10855835711915878073.stgit@Palanthas

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-fmicviOuGHTQ5fwDJeVk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl3C8MkACgkQFkJ4iaW4
c+6HCA/9EyoX3Hj6kdvCbnxgjyRnCMmDfbMzGg6WknEu/QesgwgYDq/7Pq8e0Agv
oHfgVsD+2vRJ07iXRO7Qu601w1sQ7NQZ6UPEQsil4g68EWv1chIxHAm0Y601E3bh
CaNFqXEUWqYVtV1D45MRAAfk1t8PdRlIrnaE1mlTUVDF7pvnoXs/H/LLUx+FUssW
GjRE7OQPi6S8Tp5jPv6+TBI7XFIYzklZR8SxQv5qxLQnKTHOtnkfu5ZJNiwMVArt
3RTv/1S9IfaaLEctSwn9+QszHTQpwp523Dua6nE0AlbiXphqEYhFXtmn9S3b9qui
2zoxKTjAWNvcGxzqXvfCE7th2xPx0REN65en77gu90Z2EcYlpma7OgYVJal1Zmix
6htSmKwINJwXWC/4IL7EXs32OY6Zaj+EBMreSIeXqE5d1UDY7pbzOWQgyg2K9sAu
DIm72ckbi5ZPNxOrON01RMLoCVL0572E4IIwNO8QY7R/3LXyJNbbA6wXlMB1XJpR
Mn48anFw1g8CJ1yf3VqFWXI/H4P9ceX1/aQD/tMCXCELoqDDSJkdY5LxjaEg+kwz
FhzDXqQDWpp9n/M85nR8Rf/tuai66lS/qjuNQB8NOyaWFrFiTph4iwrt2n5jLgaP
ZLSlbUCR7x3W8YImBhbnqPAo/zMWa118p6RBy6zcFzDW1GtslU4=
=lf+A
-----END PGP SIGNATURE-----

--=-fmicviOuGHTQ5fwDJeVk--


--===============0844666032864764549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0844666032864764549==--

