Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187966D309
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoASg-0007Bg-RX; Thu, 18 Jul 2019 17:44:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHH2=VP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoASf-0007Bb-1B
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:44:57 +0000
X-Inumbo-ID: b7d05bb9-a983-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7d05bb9-a983-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 17:44:55 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 17:44:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 17:44:08 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 17:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tkih6RiV6IIpffUPVplWDs75sFsclLl0kVj0tScAv63T0+sT0mJfv5+c32f82xny3/xcKNb++A07XYYSsrtP7ssDuctZ1YSVQxX2UAmg06sDkcRAk1CBOpBHAmgWbBJEiYLz7WhKj6oEWDCQkXQnDz904RCelnDLwRhCZzEmKqEcMvgXF2o2pG8N31FAWlqFFDLlWry9UD7AkM4gUEYF5+V+PXuW9NNEYTW7Zl0yilCsEIXMQGROw6AasnKKrNy2kPFHyvF5Y7mK+UVmrKpylv82EXC5O5/CQGCUtj2Lfgw2wKvw20+rRnQix+wMA8KIg87D3FEzX0ILirLwIdqb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APFYO4eoqI8kNLaJ2IHeEF6LhYwroKdrOtoMlsbwt4A=;
 b=V0GPBGmypFo/cu0gjp0nkK0kuoHtSXp7JatitIu4Izw94HEu2wUhMsOGpAT8NN3is74lru6yEBAoIfelkIuAAfWFeXXXbE9G+tOCUmzPRo9l/PGOE8tSEclR0I3JToJZ6vUIrN0AAdP4AnPYpKRblmzcV1RD3VnNIjY8KhsFek+b8J+TUG+pD0Lxko1jQUIr05onB9535BFdF3I5R3/delTZvpk+tEZrN/eBZIlS5WCf/Io7WHCoF/7KeGD/3RYbRZguCLp3DtscI/XIBoo0k7WdY/PVB+3e8lJf2UyK04jwHySXuP95ya/yLp4ZDuOHrTtBBKOSCjBQO0J2gKjIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1371.namprd18.prod.outlook.com (10.175.223.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 17:44:06 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 17:44:06 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 04/60] xen/sched: use new sched_unit instead
 of vcpu in scheduler interfaces
Thread-Index: AQHVPZBlL1Q1XUpsfEu/nRk5BkyHJw==
Date: Thu, 18 Jul 2019 17:44:06 +0000
Message-ID: <545dedb5b964e21f4bbedd72c68ec3700acc3dde.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-5-jgross@suse.com>
In-Reply-To: <20190528103313.1343-5-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e70caa6-cab2-48b0-6427-08d70ba787e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1371; 
x-ms-traffictypediagnostic: DM5PR18MB1371:
x-microsoft-antispam-prvs: <DM5PR18MB1371C79742BAA58BC5D1E258C5C80@DM5PR18MB1371.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(189003)(199004)(66446008)(81166006)(8676002)(66946007)(256004)(14444005)(64756008)(66556008)(66476007)(6246003)(66616009)(316002)(81156014)(5660300002)(2906002)(66066001)(4326008)(6116002)(486006)(7736002)(8936002)(76116006)(99286004)(86362001)(478600001)(2501003)(53376002)(68736007)(6436002)(110136005)(54906003)(25786009)(6506007)(102836004)(53366004)(966005)(76176011)(53936002)(71200400001)(71190400001)(305945005)(14454004)(36756003)(476003)(6512007)(6306002)(2616005)(91956017)(7416002)(186003)(99936001)(26005)(118296001)(446003)(229853002)(6486002)(3846002)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1371;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: enftXKSDWjfoR3GOh6dd7JoFmBtWMtBJO4ITPpj3Jmm41PN6vAKUApVNO0LOJSTSwKxu5JJSixId7nwk60sWk4SovfogLCRNx2vKCcZEKpD26xreWPy5UJqxT5N7JJhTy+k8luSjBKHfdGWfrDFM+5j5aVzPO5UR3RZ2j7Fxe/O+naKZzKt/RMOzZU7ua2PhpnmsPPVG1m9I5onBPfgJQNRAqVBxqeZVfA2Q2u1NLGv1MGQ3klGQdkbquqIeCuEagx9YRv5M/3tHMlfA0FmJz8h9Wr810Ja+j8bsspkPckP00XPWbMxA8+055inD/cqmvchLqGWDsZswdG7fmHlDprIG0CiV8lv1OxEkQREFuO+3xiXGCo4S7G6dh25AsBGQOilhp2X5PSI6YYzQnixwXpmOUFrH3w6NJU8ueGQtC/k=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e70caa6-cab2-48b0-6427-08d70ba787e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 17:44:06.1516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1371
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 04/60] xen/sched: use new sched_unit instead
 of vcpu in scheduler interfaces
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
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============8641840936792706485=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8641840936792706485==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-uvVrXacnRuEj7k8HlZ1Q"

--=-uvVrXacnRuEj7k8HlZ1Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> In order to prepare core- and socket-scheduling use a new struct
> sched_unit instead of struct vcpu for interfaces of the different
> schedulers.
>=20
> Rename the per-scheduler functions insert_vcpu and remove_vcpu to
> insert_unit and remove_unit to reflect the change of the parameter.
> In the schedulers rename local functions switched to sched_unit, too.
>=20
> For now this new struct will contain a vcpu pointer only and is
> allocated on the stack. This will be changed later.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
This looks good to me.

One thing that came to mind, is that the various function parameters
and local variables called 'unit', could be called 'su'.

It's a contraction of 'sched_unit', like, e.g., 'v' or 'vc' were
contractions of 'vcpu', it's still quite descriptive, it's short, which
is always good, IMO, and might mean less line wrap reformatting
(considering that it's replacing 'v' or 'vc').

Of course, this will likely mean changing all the other ~60 patches, so
I'll understand if you say that it would be too much.

Also...

> index 2201faca6b..72a17758a1 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -275,6 +275,10 @@ struct vcpu
>      struct arch_vcpu arch;
>  };
> =20
> +struct sched_unit {
> +    struct vcpu           *vcpu;
> +};
> +
>
Is my understanding correct that this field is going to be renamed
vcpu_list, right from this patch?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-uvVrXacnRuEj7k8HlZ1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0wr+QACgkQFkJ4iaW4
c+67Eg//WO6jnS6LrDX0WK+UoN8T2i5z5rQYNDLfgtmFN6qgLaMJ55sxwlvjMZPz
L6Fuvu1TAymKsh3e9zCRJZlVS4Ujkx6oVVVeV7GB4cwlYcCBBLLniq3zsLWS8yRW
WmPwn/g7zpFw+R4SAD2ZC28opJ3nUDouyHLChca5lfnGZWRzUPNlhTNrnNFputRs
bwPtF+EuYxsOChXyIPZdCnUuqkbo9siDPjTLp4AjCV1Kv6yjljfdGJMzc7Xsa1PK
wmXw0XZmMNsvDXRbGUrd6sp3O4bcHc78qx7yZl3N7QFhU9P7wqwf+cKCDJgQ1c3I
k/sUUIz4edgrJtffUpRH+RD/4nHxK+y028xrLOBzxQrAPBE8NfEeA10IJpVoh9Rg
U3MOB7EHzQHnsyzDbCfihRWzSEHuSavcowKM+F61WyFX6cyQT8wfTu/HJEsjbCVs
e6tk0LOha//1/oqGXdRAM+SB3R3LMTafxHb4vMfMV7bhlR4+DYNcxirdQ98qvazl
ErSUrdZzbmbUjHFhAW6uBiE6/soTrpbu4ujde5g9uYWyNjqoC3w2yN50ggMyr+ci
HwvNpoiBDRzrqb941n+6R8hjZ/hYDaBEaonc39BDXqshFZVTi6oJyD9eU2oO3ArN
hzDOyYA/S4IhXkUdnyG4W5HvbmqmpLpHqh1N+1JYSD1JZj5UUZs=
=t0AO
-----END PGP SIGNATURE-----

--=-uvVrXacnRuEj7k8HlZ1Q--


--===============8641840936792706485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8641840936792706485==--

