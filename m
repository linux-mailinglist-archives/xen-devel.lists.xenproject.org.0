Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A668039A
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 02:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htiLI-00058i-V7; Sat, 03 Aug 2019 00:56:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KHXa=V7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1htiLG-00058d-Vb
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 00:56:15 +0000
X-Inumbo-ID: 76e61d88-b589-11e9-9661-6bdc52bdcaee
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76e61d88-b589-11e9-9661-6bdc52bdcaee;
 Sat, 03 Aug 2019 00:56:08 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Sat,  3 Aug 2019 00:56:03 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Sat, 3 Aug 2019 00:55:58 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Sat, 3 Aug 2019 00:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2vzEtsfLl6H+3Fg5r5Pel6Kb7WRO0Td+ty1o+nGuwwdU7V+I9SMWQujelImzSZRF+wRM+iqqZ2PpMVtVtjct6sCP/Gqk/XLDiDEjnSHG8+NqM+Gol0O4KF2D7H4Odw3uoUo4guHjdEQQ2ypeRCx6V6KbK6KTdngZ09HfbUzAaf6QxZzwQR+Yf0bVD/zTjD/KekYeW3AHQB7nr8HHD0JxXtb8s9Wg7E1mtL0xkTwevv3VW4wPlSD41ROTT4cfvU4aSWedzpatOPtVY2z0rPUrW1B83X9lQSy7KN7DY+00U0b0MJrRv8EpA8nh454XAM+Jx9PnwsVO7EuoFH6J++agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFxVk73reNyV2C+mUwGLr27usUX0FLM0Fx9h1AzskXU=;
 b=PrQXMZfaoRHI2OhxaWLwaMHWrpElhLIj9P3Bbsu5jIKWB1RD6RSQmuaMISZ5a3mPIS9IgVZVDubr6eJ2YpPN9xhSFFf6aAcaxOAl95RMya6z8GAS6quoCBsLve6uHWJyNcHRVJdaVzk2u6XyOWlG7BCuB0zGKBeoO6CFONj4VcVeOCST16JwEXsHsfbvmEdGgi0BaX8JQpVuk+jdLog1Ra3VkPugJbVxqIu/GrbqrqrJLhLoTwtd1L2qEhUX0nfXpHa6K/OkyTUFCzdQuLII4VLhXfLjoKcda+7SscTb4aTffkXjuVlWSPUCqaRvMre5K2LmcqkHB/3HooGQk5qbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1002.namprd18.prod.outlook.com (10.168.116.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Sat, 3 Aug 2019 00:55:56 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::ec04:4fb8:e97:8016]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::ec04:4fb8:e97:8016%4]) with mapi id 15.20.2136.010; Sat, 3 Aug 2019
 00:55:55 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
Thread-Index: AQHVSQcBz01X1+GS1EGqbA6JcY+nvabnk6IDgABBB2OAAMWuAA==
Date: Sat, 3 Aug 2019 00:55:55 +0000
Message-ID: <9c12cfb7c9b9b6c278f3f9e075d8ff117ac45190.camel@suse.com>
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
In-Reply-To: <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bff1cb2-8546-485a-4220-08d717ad576f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1002; 
x-ms-traffictypediagnostic: DM5PR18MB1002:
x-microsoft-antispam-prvs: <DM5PR18MB1002C1819E7FEF9EC3A55A89C5D80@DM5PR18MB1002.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0118CD8765
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(189003)(199004)(99936001)(118296001)(76176011)(6306002)(5660300002)(66066001)(6512007)(71200400001)(53936002)(6116002)(3846002)(99286004)(186003)(71190400001)(14444005)(2906002)(66556008)(64756008)(486006)(81156014)(229853002)(66446008)(8676002)(256004)(26005)(6486002)(11346002)(446003)(6436002)(478600001)(66476007)(66946007)(53376002)(2616005)(476003)(14454004)(91956017)(36756003)(76116006)(86362001)(66616009)(81166006)(25786009)(53546011)(6506007)(966005)(316002)(102836004)(54906003)(68736007)(8936002)(2501003)(110136005)(2201001)(7736002)(305945005)(53366004)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1002;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GLhHMhnLi8QMGmbtdhXbIrKsf7ROd7Tu4ypWlH3PP3X1WEJQIAuhOXC89kEYJ9R+1dIvrzJeKV3K7fCLqvD4fvL0iTRKXzHYQ+kq9sy1IjGASyVb+mntsapeP1LgpxP0XGgofyoHt+o/1MELJGFUv1p+b7BCYPp0oYQac047GMB3dfb2mqy60OUNvOifSfHpIiWpvlEUzbA+31ejCCp2uLzFp1F+TeCzerhkBUtRzxGXlMh3pZWdgTcZQF4dBcpy8gz74SguVJyn9gOT9unptnmSEUtQESxUJSDoBIAyoiW35ipfac4n1m2fM54yRLQBOZPmaDg8slC/H8IrZT0xwmWLtr41mQC5pCBT5yyrPGCOxSqdH/ie5hu7lcqHdjGaKbyZiEAUCA4+jSKhZQWAWML8KGHXV4hayF4SUEA0hh4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bff1cb2-8546-485a-4220-08d717ad576f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2019 00:55:55.6596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1002
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
Content-Type: multipart/mixed; boundary="===============0438685002177920459=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0438685002177920459==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-QaiHHxMiSgJPbiYusQrV"

--=-QaiHHxMiSgJPbiYusQrV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 16:07 +0300, Andrii Anisov wrote:
> On 02.08.19 12:15, Julien Grall wrote:
> >  From the list below it is not clear what is the split between
> > hypervisor time and guest time. See some of the examples below.
>=20
> I guess your question is *why* do I split hyp/guest time in such a
> way.
>=20
> So for the guest I count time spent in the guest mode. Plus time
> spent in hypervisor mode to serve explicit requests by guest.
>=20
=46rom an accuracy, but also from a fairness perspective:
- what a guest does directly (in guest mode)
- what the hypervisor does, on behalf of a guest, no matter whether
requested explicitly or not
should all be accounted to the guest. In the sense that the guest
should be charged for it.

Actually, the concepts of "guest time" and "hypervisor time" are
actually orthogonal from the accounting, at least ideally.

In fact, when a guest does an hypercall, the time that we spend inside
Xen for performing the hypercal itself:
* is hypervisor time
* the guest that did the hypercall should be charged for it.

If we don't charge the guest for these activity, in theory, a guest can
start doing a lot of hypercalls and generating a lot of interrupts...
since most of the time is spent in the hypervisor, it's runtime (from
the scheduler point of view) increase only a little, and the scheduler
will continue to run it, and it will continue to generate hypercalls
and interrupts, until it starve/DoS the system!

In fact, this right now can't happen because we always charge guests
for the time spent doing these things. The problem is that we often
charge _the_wrong_ guest. This somewhat manages to prevent (or make it
very unlikely) a DoS situation, but is indeed unfair, and may cause
problems (especially in RT scenarios).

> That time may be quite deterministic from the guest's point of view.
>=20
> But the time spent by hypervisor to handle interrupts, update the
> hardware state is not requested by the guest itself. It is a
> virtualization overhead.=20
>
Yes, but still, when it is the guest that causes such overhead, it is
important that the guest itself gets to pay for it.

Just as an example (although you don't have this problem on ARM), if I
have an HVM, ideally I would charge to the guest the time that QEMU
executes in dom0!

On the other hand, the time that we spend in the scheduler, for
instance, doing load balancing among the various runqueues, or the time
that we spend in Xen (on x86) for time synchronization rendezvouses,
they should not be charged to any guest.

> And the overhead heavily depends on the system configuration (e.g.
> how many guests are running).
> That overhead may be accounted for a guest or for hyp, depending on
> the model agreed.
>=20
Load balancing within the scheduler, indeed depends on how busy the
system is, and I agree that time should be accounted against any guest.

Saving and restoring the register state of a guest, I don't think it
depends on how many other guests there are around, and I think should
be accounted against the guest itself.

> My idea is as following:
> Accounting that overhead for guests is quite OK for server
> applications, you put server overhead time on guests and charge money
> from their budget.
>
I disagree. The benefits of more accurate and correct time accounting
and charging are not workload or use case dependent. If we decide to
charge the guest for hypercalls it does and interrupts it receives,
then we should do that, both for servers and for embedded RT systems.

> Yet for RT applications you will have more accurate view on the guest
> execution time if you drop that overhead.
>=20

> Our target is XEN in safety critical systems. So I chosen more
> deterministic (from my point of view) approach.
>=20
As said, I believe this is one of those cases, where we want an unified
approach. And not because it's easier, or because "Xen has to work both
on servers and embedded" (which, BTW, is true). But because it is the
right thing to do, IMO.

> Well, I suppose we may add granularity to the time accounting, and
> then decide at the scheduler level what we count for the guest
> execution time.
>=20
> But it is so far from the end, and we are here to discuss and agree
> the stuff.
>=20
Indeed. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-QaiHHxMiSgJPbiYusQrV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1E25gACgkQFkJ4iaW4
c+6XZA/+NUEHGaqq6RnfPr5FYpXTV8johHpBwX3Ho72Mcp1KYq8t0vAQaK3hMUH6
rLhiqiG/w4rVSvmuHwlaMs9H3zuQoRXhe4V+xujd3Y59XKTh3k2OVDG+zEuM7Jke
jKsCAyUF4ST5XySPZdnkigvcuY57Z3w5RoiaVFjGneYXfYraUIiJvoaJAPjxWRxJ
gmlJktyq2n6kKoVk3u21ht2j8sF3s41mM/R9uPCdHM8ribmtTbotnzju92TGMGJS
P8BSIUvlTYpdWaIGQZlcpEIWuPwBjWm04vrisksboe23C3C+i9OSCnvioYFFNCaW
D/eL9TVyP9Jp7748DDa4mTp7WfjuLwXkIRC1OyasuP0Pw4QdexujqNw9OvebxvEs
tO5s4/MjZ9NkOM4Pi3qLKPrEcO0pGZo3Hj5Y3CFm3beOUNBMIC9ZQcFG3fbKfsjr
Q+4VmxP/AvHOliCRVZx5OX4NFRkGAuwp8Ys+G+Iax/HTFc5q7OPQ89zqDdrtpEXY
vzcc2rCIhzadKnu4twKMq0tmtNW4HgUtBWyP3+v5ks7j6uQpEjFF4yhm/kPRmoyS
ZU9dEexHTl6kpXaOqtljfsvwXkWOYYySQNDc+3OZ0U2e1njhnUJmjT+Dgj0JkOut
uONy3dlb2smJKS9ErUXeXjLt6MPygPtQDFS2VM2Gh8RCNSr+Dmk=
=SLgR
-----END PGP SIGNATURE-----

--=-QaiHHxMiSgJPbiYusQrV--


--===============0438685002177920459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0438685002177920459==--

