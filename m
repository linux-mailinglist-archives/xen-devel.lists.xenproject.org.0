Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C64803DE
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 03:43:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htj1w-0007UV-Nk; Sat, 03 Aug 2019 01:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KHXa=V7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1htj1v-0007UQ-J2
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 01:40:19 +0000
X-Inumbo-ID: 9f95c8a4-b58f-11e9-8a74-d7f64b812026
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f95c8a4-b58f-11e9-8a74-d7f64b812026;
 Sat, 03 Aug 2019 01:40:14 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Sat,  3 Aug 2019 01:40:08 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Sat, 3 Aug 2019 01:39:49 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Sat, 3 Aug 2019 01:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqZjB8udEphqzd7By9X6fTsKcpxDwt2MKbsB1KjChB9K5n9y3cQ8Wh5QuyE+UX/ZA1YwsJYCc18CrtzdfUQG/BrJetxWXreec8aUI12wTdUfUYrSnVekL/SaUl6D+y0RfJEKqawoaMts/sR7ZuxbW/4WGs+B8Y1rjXf9GHJR75POfAGgdakHcJ44u+kwRA8nrZ7Idrr5jdNFcecuNU03N2BYEkzsZZGOZDOZ/af7Nwv5jrgtf8oybEdfq0uF/QrmocVqRca4TNGCMQ5bmS55WL7IS2+j+ZLO8OwFus572/yuicai0/C+6ljzS5nFCLA0o3D3xTwhsJxMLy5fwSluWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+wjiXSvqKzoQzl5RyOzXHi4kQEQCuV8t/yF+TDnXZI=;
 b=eo2Fu+NjA/mmEQd82dAG3AFLO3i6ynE2Ocq9ccBOjO7aUI6233dwwaAHbtRqtshtl/8Wkqg56vFK/F1Hp7vOPSMjiEUAc6IzcC1IJ58qhK1h4uAYqppVkdl2MvjCWSCnqjwooi89euR0lWpDm8PPFkpm34e6eDOFD/w0y9ZlP/3RyjXcD2v/1dlumBljgeIVPNEs1dwzjb+d7M32EnT1cudBYHEgF26CPyObscovqtoTkvCh1ZGFiM9ApTrNP6jnX9JT02pxH+wdZhYxlkyp4yj8qMkNSSaDt51wKFeruC4tZfZMurpGp14374OZ+eVTU8Xo6a76wtmMplhnDedZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1177.namprd18.prod.outlook.com (10.173.215.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Sat, 3 Aug 2019 01:39:47 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::ec04:4fb8:e97:8016]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::ec04:4fb8:e97:8016%4]) with mapi id 15.20.2136.010; Sat, 3 Aug 2019
 01:39:47 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
Thread-Index: AQHVSQcBz01X1+GS1EGqbA6JcY+nvabnk6IDgABBB2OAAAvedYAAxhKA
Date: Sat, 3 Aug 2019 01:39:47 +0000
Message-ID: <9441fcdf415da72212f4148376b13824b7c9027b.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
 <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
 <c20b6a42-d8e4-379f-f0c7-56ad008ce653@arm.com>
In-Reply-To: <c20b6a42-d8e4-379f-f0c7-56ad008ce653@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1891dfc-d9c3-4f5e-f0dd-08d717b3781c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1177; 
x-ms-traffictypediagnostic: DM5PR18MB1177:
x-microsoft-antispam-prvs: <DM5PR18MB117785889128B14334F7560DC5D80@DM5PR18MB1177.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0118CD8765
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(76116006)(99286004)(7736002)(66066001)(305945005)(54906003)(110136005)(5660300002)(118296001)(66446008)(316002)(2201001)(99936001)(446003)(186003)(11346002)(66556008)(66616009)(64756008)(66476007)(26005)(86362001)(81156014)(2616005)(476003)(6506007)(76176011)(66946007)(486006)(53546011)(8936002)(8676002)(102836004)(81166006)(53366004)(53376002)(14444005)(6246003)(3846002)(4326008)(256004)(53936002)(68736007)(966005)(71190400001)(71200400001)(36756003)(6512007)(2501003)(6116002)(91956017)(6486002)(14454004)(229853002)(25786009)(6306002)(6436002)(478600001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1177;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VRZUoKk7MMGK2FCd9zvnNDP7xgw0ugU8/KxF6TCKRgMpsxzGTDw95g3odNybTyPpkMqgADOmy6b0tZqtU9MEN9dS1E7LM/84WtqqU0edEBJwuDfgjcb2JHBHkFB1oYHKRurHhVCUooKLaDmZHUYmOSikaS5ztOuLa+xS35cthGZmAhqe/LVWgmQu4nPcNAE2sq7Sm66y9t4SkHmswYzrIJQdoXK/assJkB0XXuu8shT0MGQ6qu4QHUt1p4qdZ2wPXbKPiPNgNnPIxxplAvogT3XvqFFH9mqx95EPzN2JJ2HIXRH3eNqmIPAw9Nrm9qvv1FJT366o09qe4xg/O1hutgX7NaHvoDy+xwO8KXveEhgtZ7eKn60lIDwqmnzSIccnTVwDzI5VWX4aHqX89ZGc0V/6digM19C224vH27kbeT0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1891dfc-d9c3-4f5e-f0dd-08d717b3781c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2019 01:39:47.6582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1177
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============6701324143032344553=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6701324143032344553==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-AwL1wqoALi8bAbHMvJZE"

--=-AwL1wqoALi8bAbHMvJZE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 14:49 +0100, Julien Grall wrote:
> /!\/!\/!\
>=20
> I am not a scheduler expert so my view maybe be wrong. Dario feel
> free to=20
> correct me :).
>=20
> /!\/!\/!\
>=20
:-)

> On 02/08/2019 14:07, Andrii Anisov wrote:
> > On 02.08.19 12:15, Julien Grall wrote:
> > > >=20
> > But the time spent by hypervisor to handle interrupts, update the
> > hardware state=20
> > is not requested by the guest itself. It is a virtualization
> > overhead. And the=20
> > overhead heavily depends on the system configuration (e.g. how many
> > guests are=20
> > running).
>=20
> While context switch cost will depend on your system configuration.
> The HW state=20
> synchronization on entry to the hypervisor and exit from the
> hypervisor will=20
> always be there. This is even if you have one guest running or
> partitioning your=20
> system.
>=20
This might be a good way of thinking to this problem. The
overhead/hypervisor time that is always there, even if you are running
only one guest, with static and strict resource partitioning (e.g.,
hypercalls, IRQs), you want it charged to the guest.

The overhead/hypervisor time coming from operations that you do because
you have multiple guests and/or non-static partitioning (e.g.,
scheduling, load balancing), you don't want it charged to any specific
guest.

Note that, we're talking, in both cases of "hypervisor time".

> There are some issues to account some of the work on exit to the
> hypervisor=20
> time. Let's take the example of the P2M, this task is a deferred work
> from an=20
> system register emulation because we need preemption.
>=20
> The task can be long running (several hundred milliseconds). A
> scheduler may=20
> only take into account the guest time and consider that vCPU does not
> need to be=20
> unscheduled. You are at the risk a vCPU will hog a pCPU and delay any
> other=20
> vCPU. This is not something ideal even for RT task.
>=20
Yes, this is indeed an example of what I was also describing in my
other email.

> Other work done on exit (e.g syncing the vGIC state to HW) will be
> less a=20
> concern where they are accounted because it cannot possibly hog a
> pCPU.
>=20
Indeed. But it'd still be good to charge the proper entity for it, if
possible. :-)

> I understand you want to get the virtualization overhead. It feels to
> me, this=20
> needs to be a different category (i.e neither hypervisor time, nor
> guest time).
>=20
IMO, what we need to do is separate the concept of guest/hypervisor
time, from the fact that we account/charge someone or not (and if yes,
who).

E.g., hypercalls are hypervisor time and (in most cases) you want to
charge a guest making the hypercalls for it. OTOH, running QEMU (e.g.,
in dom0) is guest time, and you want to charge the guest for which QEMU
is acting as a DM for it (not dom0).

Of course, some parts of this (e.g., the QEMU running in dom0 one) are
going to be very difficult, if possible at all, to implement. But
still, this would be the idea, IMO.

> > Our target is XEN in safety critical systems. So I chosen more
> > deterministic=20
> > (from my point of view) approach.
>=20
> See above, I believe you are building an secure system with
> accounting some of=20
> the guest work to the hypervisor.
>=20
Yep, I do agree with Julien here. Doing the accounting right, you get
both a more robust and a more fair system.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-AwL1wqoALi8bAbHMvJZE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1E5eEACgkQFkJ4iaW4
c+5NYBAAli0X1oqR945pKm0SGU3eLrl3ACgzf/BDlVqbC7XgHudsGIZf4MP9SNMf
0TbqHFPmn3VCT2jB3FOI5at7r7ZpPxUNW/po96fTlet7YQ5Ey7stkRrkwz4ZjTYi
+3S+baLNm0BmYRZqPNf9gmk4snJmfCdzP6f6saWuSelMx4IH6nUN8+AJtgcqvqyH
HFwoTTqouCQaMmmTyL8qeNCflMeKV9Z/G/rPf8/Xmf9w2M8cirnvMaHrH8c+lqk2
LpGfAEharHzU87OGJg2WJom/r7lMZ3m++GEXNyHHPSrhXwkcj7pen3rHPDbSRcoK
y+RMowedNNX/Ia4gCRis9+LoDdesNLfpynuizWVNdIJ4ty1ZduK23CiUrGp8Twzb
8CZJoRB8p9ICZ1cAsXTpp8nt9u9kslq3Rkp0zrOqex5t1CUWbXa477BSrXn0qfOk
FMffqr3Sezn/AqEa1W52wR+z9x2Z5BUcPJJ5QZ940c8jllQ3Y3B4EzmHRlnsIsFZ
poH4bQlW9ZCqE/6xmR5moB7h6P8EXP+7xg3E7JlYsY0XLPNzOL7aHQ8XfXfGFVWp
Lq3JsnVQNUqrIW9MQ8XBzdZzRbZkCSpaZfrh4DsFyh496kuXoO8fal9jdg+ZCPRp
xC7XuyEHtXDIYKWTHmtfat4qUXD2NRf3H0oksAjP+/m1ppLdp2s=
=zjwS
-----END PGP SIGNATURE-----

--=-AwL1wqoALi8bAbHMvJZE--


--===============6701324143032344553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6701324143032344553==--

