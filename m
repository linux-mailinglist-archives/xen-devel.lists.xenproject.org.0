Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6ACC1C19
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEq66-0005eq-RO; Mon, 30 Sep 2019 07:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V+AX=XZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iEq65-0005el-MP
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:27:53 +0000
X-Inumbo-ID: c9f77290-e353-11e9-b588-bc764e2007e4
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by localhost (Halon) with ESMTPS
 id c9f77290-e353-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 07:27:51 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 30 Sep 2019 07:26:46 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 30 Sep 2019 07:24:25 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 30 Sep 2019 07:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh9gO3FtWHsj2gXchGTdFZoDS7qWNqOQOIxpnCK8q6kXsqU3GUi7ZY18thQgL3meljr8qLIxlPtNyfqlXKfFg4DlIGLyVm4VjFTEqEtcuC0xA2aauO/8QU2bOFLvAADc9y3Khln8WMNeL1Uas1F5d8hPNKvzBY+84vIflkLVZSIBg4D7uu/8w4RwZMYq5VydNpa+mLm5tcIx66UviaA7OIPcPatoW4VX03nw/8xiN1CsmLor1XNae2sEqnnwCIxCA44WmBy2sFXKvulZHzsSrPbSYiEmk39Q21rc+mz5cABG/ZH8Hen6ki+TCcafhew7uaoEwnasNLFruH9fgbhtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ+PJYICC47pVwAxPZt8RZXo0zzcwj16vP0xo47sl7s=;
 b=J/58e3j0JO6TmZm4znkI7vLkfK6qS0swpjprw7Uerb79aU5h6Tcsf9wPjH/kk3mYDXeFFePt5CtrkWebRFFqsoomYrgb+jt+Jy36XgP7iG7Poj7Pepa/s2viFgJKareq44JRfNmlkGRNnfEnzItAFE4LVTPxWeCRu5ZutU3NR/Shb2UmSszua6CPoGwQJI3oVDdQi8c+FRexouyjhfbZYH23P+610sw6Jlh1vSMXdru52QdnVtviLuSenlN7qUGcI12CfyZbCrgE1OtwEZqf4gn0pme15QYpAbw1qA6RBp/R30erkB9v6bLKvB/9YRWgtccDIiprgq1OMvKN7LPEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2901.namprd18.prod.outlook.com (20.179.59.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 07:24:18 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 07:24:18 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v5 08/19] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
Thread-Index: AQHVd070LCZGN0NGMkClffXm8CxylqdD0YMA
Date: Mon, 30 Sep 2019 07:24:18 +0000
Message-ID: <874686b3edd473127a790d8b9bd6182f778aa4aa.camel@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-9-jgross@suse.com>
In-Reply-To: <20190930052135.11257-9-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b77eb7a8-d834-4c64-aa0f-08d745773506
x-ms-traffictypediagnostic: BYAPR18MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB2901B5C4F24FE31F11D8173DC5820@BYAPR18MB2901.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(66066001)(11346002)(305945005)(486006)(476003)(14454004)(6116002)(2906002)(5660300002)(3846002)(36756003)(71200400001)(118296001)(71190400001)(76176011)(6436002)(8936002)(102836004)(2501003)(4326008)(6246003)(81166006)(81156014)(76116006)(91956017)(6512007)(6306002)(6486002)(6506007)(478600001)(2616005)(66616009)(66476007)(66446008)(66946007)(966005)(26005)(229853002)(25786009)(7736002)(8676002)(446003)(99286004)(186003)(316002)(54906003)(256004)(110136005)(66556008)(99936001)(14444005)(64756008)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2901;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c4fI3wPoz++O+x8THGR1X+h+KK+QBOH8EuiHmcdgp0eMdCcMP7btenEuYqZvARTjcV71e+yBZQgxErv8TFQuG6pDBkPOVsPd7o4auTsb9b/vbsU8tXKTUwWp9Rw6G1L0VAZ1GMqpaDA7Z2SG4APvWSULxbqg3hl1fRKjj8OyHcojvCMNgEfOzjlGJjVMxK7DzxO+4B/QR8crrsfXlYXaTnh/BbLhB3An/K4QDrDbSPTBxLPwrFKNoxz0bz94yNjnlDopvlZ7UbDE/P9PxH0xCWz1cLuCBvwTobJgpzQadA5WryW2wLaM3BRzLFZcDNu2EopSwfs8eyHorboEVnpslSbsW1LaEe/phi9vrbp5buNx/aAaFLz8W9X5Iejbd5XlN57/kdiirjGf8VRK8TRD+jh6Sxbd0tYqGJFze3RLYd4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b77eb7a8-d834-4c64-aa0f-08d745773506
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 07:24:18.8049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: megUQZtvVY/RV6m3Tq5ph+gHa6IkIPl0/abhEleMC9EBA3JYIxhu4IsNGH5WWlsWMC/TmyjL7hIVYZuALgKQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2901
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 08/19] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============8870522242191153142=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8870522242191153142==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-YJl+8zyNzmCjSDqnXLrH"

--=-YJl+8zyNzmCjSDqnXLrH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 07:21 +0200, Juergen Gross wrote:
> vcpu_wake() and vcpu_sleep() need to be made core scheduling aware:
> they might need to switch a single vcpu of an already scheduled unit
> between running and not running.
>=20
> Especially when vcpu_sleep() for a vcpu is being called by a vcpu of
> the same scheduling unit special care must be taken in order to avoid
> a deadlock: the vcpu to be put asleep must be forced through a
> context switch without doing so for the calling vcpu. For this
> purpose add a vcpu flag handled in sched_slave() and in
> sched_wait_rendezvous_in() allowing a vcpu of the currently running
> unit to switch state at a higher priority than a normal schedule
> event.
>=20
> Use the same mechanism when waking up a vcpu of a currently active
> unit.
>=20
> While at it make vcpu_sleep_nosync_locked() static as it is used in
> schedule.c only.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> RFC V2: add vcpu_sleep() handling and force_context_switch flag
> V2: fix runstate change in sched_force_context_switch()
> V4:
> - use unit_scheduler() where appropriate (Jan Beulich)
> - make cpu parameter unsigned int (Jan Beulich)
> - comments (Jan Beulich)
> - use true instead 1 for setting bool (Jan Beulich)
> - const parameter (Jan Beulich)
> V5:
> - add comments (Dario Faggioli)
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


--=-YJl+8zyNzmCjSDqnXLrH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2RraEACgkQFkJ4iaW4
c+5c2g/+Ixeok+VrdBlh0UoNwKro6FSJHb2iK+HMGzu7t45TXchjrb3nX90iChn+
k3cbQIv2D3Spx2GCwoPBkxgklA4cThmpYzD+00BKn3cY4iUb7vZ+BImFua9cZ+qB
sxngcpNA8OIjmmeGFDxzjTGhTPlfcco0/3GtfWYMv40BloGja+HNkublyXPiapu4
utLMJelrt1YgypnmwyFLtscQo+YiCaHAMjEGUzR+Ex76EzUP5dxnO0UZG54miqtI
QOF0EW58Cbt8rskXvF37/d+a9zslgwyX2yW3fyeBrUVJX/Uhf8kqqw0eZAgvBQYq
HaO1dEyTLvCwbtsJ99aLWutR4KR+7ymRKdmcsdfWCyGYuBTRXYkVRrLP4FhPwmEx
w4OGrSKAwKNGbpaAG0reulejTOLNStFztb4e75YAca40mKAE65JuyuDWaLhbUSEj
XtqXfsXxZPCT1jCDKQJBqiiaG7D6s21nz8w48YZZrGZJkoJorWxN6eJnttaj4Jsx
Mq1NWAV0yWOGqdU81SpRY3NfgdLMlN2gSMaaRi3uAjZ//S3e0qCMkncaMrW6aM2F
7cGsnYpqUZV1AjjXeeUoynjcvoZ90Mh10lXbo9bW/GgXxcQiONJ4L5fQRT2gpiqS
JtWJhHWDBq1vk/6Yhx/wtaLBKItMeV4HZxnY2W9yWFpW63+HkQ4=
=NNKL
-----END PGP SIGNATURE-----

--=-YJl+8zyNzmCjSDqnXLrH--


--===============8870522242191153142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8870522242191153142==--

