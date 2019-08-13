Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4E8BDF9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:07:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZGx-00041J-W0; Tue, 13 Aug 2019 16:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxZGw-00041E-AL
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:03:42 +0000
X-Inumbo-ID: e3adb234-bde3-11e9-8dee-b7fd64b1f607
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3adb234-bde3-11e9-8dee-b7fd64b1f607;
 Tue, 13 Aug 2019 16:03:39 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 16:03:22 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 15:51:05 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 15:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPJadhC8tYP4n6nsHj+Ubn96qw7a2TwRLdA3warszs7ICZIYn014A2vKazDDW+ahi8Y5TkNwrSoxbgnbqRDobvcOMx5k8komDFeWvR0NPI8yzqRfOK0/BXhSsLX6mOwOYEmjePKafcvdOnt/HCvSGF6SR3tSeVWS0GPjxgdWo5ZMJP95Rd82Rn0NfbvCIO+ivOCJzpvlhVBwHS1Mi/RZNyXlwFQn2m+GU490LEqdl3uUeE1pWirAfKRKoaXexWcDkR7szBzjByDpOmRvFIqEYsB1h+l6CZEJEBc9rlpeDT/Da3vKYoWeoRKw2Z3aRrStHxBKqjuD9qAAGmzt7Zg4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=li7ePX2eZUILmD0UmuduUGv2JA4LTxRZpMU0geKm2pg=;
 b=lbslCLS+iH8rvELItRGqeMlPhVm5ayaXok+A2j0HPhUQWCUa+9E4EU73v/ryqkI/LuRIiHmSxKzXa3TFDr3Gm2b82J44OsI9H2RsZBe6FVzN/EFy+SipqHmQxgO70sfyHLRLQTerZdd+HBGQS+2/b/xNNjhp1f4erOZAdLRxxfFRwLyeqBpFKiUiKoiWpgwL6Sw7FZ607wcVZN4NPbzE7DV/OSZxJo8zLdD6+GWI6q21po4jSRSdHyIFkC91NWXhcEjAB78HF7WDu+RNensqzG+XOZiu2jEsoqAsf/DmA3TKFzpVSa+00BWfxJebbF+B6qXI9PR/4I/b6rOnO2vJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2727.namprd18.prod.outlook.com (20.179.56.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 13 Aug 2019 15:51:04 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 15:51:04 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 0/3] xen/sched: use new idle scheduler for
 free cpus
Thread-Index: AQHVSTNOfbnHAV0Z6UmgrDDxfXlEq6b5S2iA
Date: Tue, 13 Aug 2019 15:51:04 +0000
Message-ID: <b763c05de403033802e28cee5854e86aadf3dc1f.camel@suse.com>
References: <20190802130730.15942-1-jgross@suse.com>
In-Reply-To: <20190802130730.15942-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08058c03-6e3a-4aef-976d-08d720060c84
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2727; 
x-ms-traffictypediagnostic: BYAPR18MB2727:
x-microsoft-antispam-prvs: <BYAPR18MB2727348B15D355E21605CA81C5D20@BYAPR18MB2727.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(54534003)(446003)(11346002)(118296001)(5660300002)(4326008)(25786009)(99286004)(76116006)(229853002)(486006)(26005)(81166006)(81156014)(14454004)(186003)(6116002)(3846002)(71190400001)(2616005)(71200400001)(6486002)(8936002)(2501003)(91956017)(6506007)(54906003)(102836004)(53366004)(53376002)(476003)(76176011)(8676002)(64756008)(66616009)(66446008)(966005)(66476007)(6246003)(66946007)(110136005)(86362001)(256004)(305945005)(2906002)(36756003)(6306002)(99936001)(6436002)(6512007)(478600001)(316002)(53936002)(66066001)(7736002)(66556008)(4533004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2727;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nZJpK4uu1Caw6uP2KKrIFcy/WdfrT4GU0D2fNJZPqBMbrw2dFLFiGKB17sM7PLsaw9rFiXc2ezDzBlJ8+fgkY3S/afjc+Z7egQdR0QVWBML88mjvAqHFaumYOFpWDlnVCwXy6El8iTVIp7SlVkfLNvm4tzQrCSla/YM3WlPCF3AvSpg8LH/9lkBcGKC5cLfsEYhubjxiQD5KuSkg3sJCuLCLfYgWLoqpgiwMuWuiNDXcakhSCRyn79hH0b7mtAxV4fJKZc2ohe9QfJBT4qyZFLqXf7o7KfzpSZyh0lsDXwhRINZiftCyKn4JqhVPoVvdqHG6CZE4spbWagKiswks2mtPBwrT22DHaW7Q5RfQ1VGnyaSDnKNi7HvoTxGg3enF2XSKBS0/kJNup2ZAk9Nhl94vF81oAn2L5oXs7bh+tKI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08058c03-6e3a-4aef-976d-08d720060c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 15:51:04.6384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGHVk5V0QCx5A0yLz2w5ZTB3YH6mt4UGhyVcy3hSSB+emyeLj3dEAM4x4EJb0+iKowrDnPa7wWvtk1dnQBq0Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2727
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 0/3] xen/sched: use new idle scheduler for
 free cpus
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
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============4194482851735816822=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4194482851735816822==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-7WSmt8u6MzLCZo7B+vm6"

--=-7WSmt8u6MzLCZo7B+vm6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 15:07 +0200, Juergen Gross wrote:
> These three patches have been carved out from my core scheduling
> series
> as they are sufficiently independent to be applied even without the
> big
> series.
>=20
> Without this little series there are messages like the following to
> be
> seen on the console when booting with smt=3D0:
>=20
> (XEN) Adding cpu 1 to runqueue 0
> (XEN) CPU 1 still not dead...
> (XEN) CPU 1 still not dead...
> (XEN) CPU 1 still not dead...
> (XEN) CPU 1 still not dead...
>=20
> By assigning cpus to Cpupool-0 only after all cpus are up and by not
> using the more complicated credit2 scheduler for cpus not in any
> cpupool this situation can simply no longer happen, as parking the
> not
> to be started threads is done before.
>=20
And this is not the only problem, solved by this series (or an
equivalent approach).

Right now, CPUs that are not in any pool, still belong to Pool-0's
scheduler. This forces us to make, within the scheduler, extra effort
to avoid actually running vCPUs on those.

In the case of Credit1, this also cause issue to weights
(re)distribution, as the number of CPUs available to the scheduler is
wrong.

So, we absolutely want something like this.

This is described in the changelog of commit e7191920261d ("xen:
credit2: never consider CPUs outside of our cpupool").

Would it be possible to mention this in one of the changelogs of the
series (patch 3 would be the best place, I think).

Thanks and Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-7WSmt8u6MzLCZo7B+vm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S3GYACgkQFkJ4iaW4
c+6kMQ/+NroF13zllix6bU2Ggamp2dAenpV7Nc6Y5gGVIruX62qZuNn+OGOPF2kc
If31FjzVEXSaYVW0S0Rq64K6i9fPjC7gR23CvVAv7zXEahj0TxrABJk0FaFmNfHr
joru5yV6oW1QDWhKwD7QPA4EestlAXGa9zPDE1Eg6293eebUXhOJyvb3yRKp9+Hv
6/f/JQ3tyEADRy4O3YIEVKNUG//AoigN8s1vj0fXaVYLISxmN0WuGBuew+sCVx0i
75defmrbIwXQwcTvFvblHOKGehOKWrMAYsFras0QLkawo0ivkQxLdkGpgtXQQA3q
hlL1lqS4P49gC/OcQhDuqoawYh9mVIvWi/wMaLDLsP7w9drfby5Pnf4cbRggD0UP
fz75+2jOnAkZRLdSAWh5UEsx9Cxat7TR+XcPfyM34U5Qfz+i6wSMB25UFyrKQvcT
eu9GQo3ONeWW1VAaYKaShKAvc1EjCFIjhiMOAhugK4RiPzieXdwUNl9ZkqQAKpVr
vPFf13jYaT5MgICHNrjdkaFrzCIatrpQJJehLC6p76osz8YbUpAEx0nyf68kBUdQ
9Hov0ALdK/1kuyQTa8Db8icteyKsZXzZud7PsL2hSpn/lORccCIvHYgrYB+IRwG2
gZNWQcGqc2YjKJxYpzIt8/9ZCtN1RJ+plIkgE6+K9yjii2LaOnM=
=lvfT
-----END PGP SIGNATURE-----

--=-7WSmt8u6MzLCZo7B+vm6--


--===============4194482851735816822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4194482851735816822==--

