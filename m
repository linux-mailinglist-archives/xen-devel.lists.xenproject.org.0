Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09978B37
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Hz-00054J-2X; Mon, 29 Jul 2019 11:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+N/T=V2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hs4Hx-00054E-8c
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:58:01 +0000
X-Inumbo-ID: 168c098c-b1f8-11e9-ad59-e7e5c9ff15c3
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168c098c-b1f8-11e9-ad59-e7e5c9ff15c3;
 Mon, 29 Jul 2019 11:57:57 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 11:57:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 11:40:57 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 11:40:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM/YnP11g1IIjYqvsa0OXovysXUcwU9fJuGBcXpsYLgv2B89FVY182Thr786L9LqKqiwoj6hKr389dqxTvCcQbFBL0ndBpf3VjVjQb0odFjuQMW8IvrxyjaeOU+4aQnPKh0eyE16YWJaG+8bXCfvnc3WMHPyFaP+WqA6+5hsx6pS6lVEHZfdNFllkx1AhuinoycfnJASnQo3qrnIGTF5cUvFJTq/OYEmlo3SyfhsWSsvO4D66MjGRiEj7nWk3ZwNUcuhuLsbUVojljYUcXyzpK4ZB1v9nUE2YV9yanV2XnKUHp+qLcszn9nSOyNL0Ec2SY/WESzQRRN8RIGY0v+bcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNLaloMoiiMkjIBhvZZKJwMLiNLbtZhgd6umGmOM9aA=;
 b=jaY5Ixnej+OQfs6XSbVnMZZM2ufWktu1f8StSvGG8OKBwGmB2CILyIqECOZlVlwaV+S48jEYhBKguAktW7OHzdneePhhxykCpipolyxzoYzv5FRvEVoTV0xaJPZWbmlnR4P0REAuy8XvG6V9u8arm2wRIEIDQgA19hxSaAlOwS0n5EzyVg+BsHJX/XohNI88SW1vfIfmnbBWjOHknYF8zu7Qj6VrKMSgpslmcc8cEWzHh3qvhIfPs6g6mamdVxpOhCyF4Ew/N+gJ5MFwNjpNrIfJPQvkZJrTn7meDRQM0RbYHQ2wgL4ZG6EqeaLGxYcUEU+Thiq1d6+TLD/3m9VwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1673.namprd18.prod.outlook.com (10.175.224.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 11:40:56 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:40:56 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 2/6] schedule: account true system idle time
Thread-Index: AQHVQ542k/V3jm/kpEa8uLBSXrMN5abczCoAgAAMAbKABKWMgA==
Date: Mon, 29 Jul 2019 11:40:55 +0000
Message-ID: <a219e3d1bad84d08c5eabc06dbcc89c9b8c2e330.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
 <f8e9bd7c08f85acc17af58fa305495113c990e0a.camel@suse.com>
 <7b374888-c394-d741-f34b-28eb8647e507@gmail.com>
In-Reply-To: <7b374888-c394-d741-f34b-28eb8647e507@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe36c873-49bc-482e-42ad-08d714199e62
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1673; 
x-ms-traffictypediagnostic: DM5PR18MB1673:
x-microsoft-antispam-prvs: <DM5PR18MB16739810CCCC3C04415669C9C5DD0@DM5PR18MB1673.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(52314003)(186003)(446003)(6436002)(2616005)(229853002)(81166006)(81156014)(91956017)(486006)(476003)(11346002)(54906003)(8676002)(8936002)(110136005)(4326008)(25786009)(256004)(14444005)(76116006)(66066001)(68736007)(86362001)(6486002)(66616009)(66476007)(66556008)(64756008)(66446008)(66946007)(7110500001)(26005)(71200400001)(966005)(2420400007)(305945005)(99286004)(478600001)(5660300002)(71190400001)(2906002)(36756003)(99936001)(102836004)(6306002)(2501003)(14454004)(53936002)(6506007)(3846002)(6116002)(118296001)(6246003)(53376002)(53366004)(6512007)(53546011)(7736002)(15650500001)(316002)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1673;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K/fqb/0LW97jT1KiM8o5fWiwxDm1VWKvcVqpKRLmB4zHCwUCvl29UWypKtI0wcq0NxR33VVyng5+G8RFmTcB3IkCg4jAXgl6Wwz2DmtUx8IxoF1P9KWRS1PIrqlXuIUy5LijsJOLGu7GUktTfu2MTASUryIjYr3tIkIAbA7q/ztBP7Bqk9AN9+h73hBpfjRCZSY87m6HdlesqNe5zb9jQVmVDvIBcW6sZHSIwKyhqYJ0tjb3NWhS9T6ttu9705RYcicb7mR6oOTg51nxCkY3Q4r/gMBJG5du4/QJ6VVE0OEvV6xlrwjs8EBf9IhrAwWFmArijEDM2H1f7SVh4wnNc6jmFudeovEKawY99wUHNbfKanU/ZLseU9BzJfHfDhhFOmwNC2TtxUzV4ZPXuAl3EKMwTND7QqGwDHI4ik4uzOo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe36c873-49bc-482e-42ad-08d714199e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:40:55.7319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1673
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 2/6] schedule: account true system idle time
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============7092719212769216904=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7092719212769216904==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-/bPVzNniYtIUFzzn+Q3m"

--=-/bPVzNniYtIUFzzn+Q3m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-26 at 15:42 +0300, Andrii Anisov wrote:
> Hello Dario,
>=20
Hi,

> On 26.07.19 15:00, Dario Faggioli wrote:
> > On Fri, 2019-07-26 at 13:37 +0300, Andrii Anisov wrote:
> > I see how it is rather easy to do something like this, so
> > I understand it being done like this in an RFC patch, but I don't
> > think
> > it's correct.
>=20
> This is the VERY RFC with the minimal changes to the existing code
> and adopting existing approaches.
>
Sure, I know, and this is fine.

> This topic is really complex and requires wide discussion, so this
> series is rather an invitation to the discussion.
>=20
Absolutely.

> > And, on an even more general perspective, the fact that the
> > hypervisor,
> > when scheduling the idle vcpu, runs softirq, tasklets, etc, it's a
> > generic concept, not an arch specific one. So, we really should
> > find a
> > way to implement this in common code, not in arch code.
>=20
> Yes, in terms of this patch, idle_vcpu_runstate_change() better be
> moved to common/schedule.c.
>=20
I think we should, first of all, think, if using runstates and
runstates manipulation functions is really the best way forward here.

And, if that reveals to be the case, I feel like runstates would need
to be extended to be able to deal with want we want to achieve.

I'll think more about this, and try to form an idea...

> > Maybe, but I'm just thinking out loud, and I need to think more
> > about
> > this, we can do things the other way round. I.e., we measure the
> > time
> > that it takes to run softirq and tasklets, and we subtract it from
> > idle_vcpu runtime?
>=20
> In the patch "schedule: account all the hypervisor time to the idle
> vcpu" I extend what I think should be accounted for the hypervisor
> run time. And subtraction approach will result in more complex code
> over there.
>=20
Yep, I quickly looked at it, but I need to review it carefully, to
properly understand it, come up with comments, think about
alternatives, etc.

Will do that soon, hopefully.

For now, just consider that, IMO, the big value of this series (or, if
you want, the discussion this series is aimed at starting) is getting
Xen toward having a better, more accurate and more fine grained time
accounting and reporting.

If we time. e.g., interrupts, softirqs and tasklets, we can store such
metrics too, and, if we want, report a breakout of the time spent in
hypervisor... something like (in xentop, as you're doing already, or
somewhere else):

 hyp=3D12%(irq=3D4%+softirq=3D1%+tasklet=3D5%+other=3D2%)=20

Anyway, thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/bPVzNniYtIUFzzn+Q3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0+20UACgkQFkJ4iaW4
c+593xAAmLHGUcFDTWHNF9jDsIp1G5e9s+JHUBzVMJduzltHY/7+ASrb0XHB78eY
RfHjeRl2d1OW0zFrFsJBsP12TIVsCCokY25/9E6TzLagsRmvqqIdl9VA49dNlVv1
xwV9DA0sIMAhfVIVXk4+3Zu8UmYh2BMmC6/8BlxoswHk6hAlUww35TqGtZPusxC5
CVa/PVXWMhl/WFLWoN23m2m524+bgi59hH9cGeXbZcOVWns5RSTf2bkOovM9vnB8
BUpPpIB1WlsQchxP45+2gzQHXcd20CxogPjyLQuUdiVtBFSkoLChzYfQ39RsH2DC
G5Pc5tD7IzX2pQ5OQON8bauNKx6qOTHh4RaUbGCfzxzVTb8wns/QpqwpMTA195Hv
Cc360HzinG4hY+dyCfbF9ogKsB6n+7oPw6pUzV+UFId7lw1nVxhn4sM/rvDEn3dK
zE/rPbCotJlDlZJdSPWsOGeM64Hf3BjT2Yq0Tj7Ssv61dxQhYX9sQHVCQm78dzfZ
pXjs6TPeZU9jSe/ala841V67VstrxYKx6FQc9xdXto0pR+s7+ehfmHj64e+QTUzT
0fa452+uklp201MbotKOvUCJlN9Fq08lfS9b2Z7VoTzwobrikFuCbNUI1k84hrWd
Gc+GwuvXw7CuRi6TVBwsKf/+Uy2YIxnSdzYctKayx3Crzbc/NRo=
=W1os
-----END PGP SIGNATURE-----

--=-/bPVzNniYtIUFzzn+Q3m--


--===============7092719212769216904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7092719212769216904==--

