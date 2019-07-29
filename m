Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7F78B90
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4WS-0007Cn-Gp; Mon, 29 Jul 2019 12:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+N/T=V2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hs4WQ-0007By-PR
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:58 +0000
X-Inumbo-ID: 2defc238-b1fa-11e9-90b6-dbf264a4728c
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2defc238-b1fa-11e9-90b6-dbf264a4728c;
 Mon, 29 Jul 2019 12:12:58 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 12:12:52 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 11:53:51 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 11:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXbfh2V+DZJYYbmNeZ6z3x82nuS+B0/fV9DhMRsfNTy9LzZhzgM3HaOSS2W5hrPL9DawBBaPFIMU+rXGG7wo8XSseSWm7X49zTYLxilNkw2EoAhwHvhiGyNZENM0udePMajfKclgzx+e3C6fYtmPK2naw/hnfw+yaYocKsTjvab1npm/2r/Cy1Ai40Rvstix4DywQoJ+zImA3K/tFG0vOBxH5abCPWt7VZUGCq7NGvCvMQVuyUkSgrQMYAX4PzU7+z1s3Rj7Z71+S0lMIXRKJhUgD8+iWQLQBli71gOaW4CdpoUP9AACtkx4ce6akyWNFrjBoT97twHQ5jPtMwbXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAXlRy5TjvHhIiaEQKJwJZr/BfmzfJ7sCVSkOx1BAZY=;
 b=Yw2lMaBb37yep7895vY9hWsBhxM5eRRCCZiPMTrb1ypVC4m1/3WpxWzc+U36lBRDK35S5pFhGFsFr/zrurqIc3cKYBPAmH6979bvURnnhXjAryHSQjzoBlAqL4cwgkcBYgeJb0G55D6KMjiFsDS9Fyd7JcylUEdAC9oonNPq+Dgvy95NYlnQ8Ph2s4oyyQHPcnO6wmnPGJIFKyq2xB2U4UWb8CvFPWBhXRGFAz7t2h+dX34wJJnBmXqVJgkB+7gkYa/zaQvEBgSSz+P1b+2i71NwmoZXVNF9/H0G+gCAjUBeTq6Tzyzv42eDVM7eLsqp1cI1VzyKfGAT5qnoaThyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1627.namprd18.prod.outlook.com (10.175.224.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 11:53:49 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:53:49 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>, Juergen Gross
 <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 0/6] XEN scheduling hardening
Thread-Index: AQHVQ6vC3g8obmh8ekWZSTh5IAudE6bhgTYA
Date: Mon, 29 Jul 2019 11:53:48 +0000
Message-ID: <41291327c741e276b4ad666e67152b74d2257a42.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
 <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
In-Reply-To: <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4e9136-787e-4858-7983-08d7141b6b26
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1627; 
x-ms-traffictypediagnostic: DM5PR18MB1627:
x-microsoft-antispam-prvs: <DM5PR18MB16279A55F9BF83CD295C2814C5DD0@DM5PR18MB1627.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(68736007)(36756003)(71190400001)(71200400001)(486006)(81166006)(6246003)(102836004)(305945005)(256004)(26005)(110136005)(76116006)(91956017)(6486002)(6512007)(53936002)(6506007)(53546011)(66066001)(316002)(6306002)(2501003)(54906003)(186003)(66946007)(478600001)(66446008)(66616009)(64756008)(66556008)(66476007)(118296001)(8936002)(99286004)(86362001)(3846002)(6436002)(76176011)(4326008)(25786009)(966005)(2906002)(14454004)(6116002)(14444005)(2616005)(11346002)(476003)(5660300002)(7736002)(446003)(53366004)(81156014)(8676002)(99936001)(53376002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1627;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CtNwbHBdbrC9fRSpa3NM0RwttMDzKv0IdkfqB7I1SJzRdlvxqndheuCuXtkFF/DVK4fQrtkhcxxDeBYuyi9vep22+XMn1/CiRkPVx89Iv8xtu3XizeekypDyfGWr7Yi2RrI8d8m7Gk2X/9q/XF6rmpXCM96ks0Ycx3cKugiEzd45UvfNkEaWKsSss+UENVpvoeiHY8Di7G5AuRJrX/8QRkpEIo1uDNvG7PVOWyfw9hz2hDlzLhTDid1lq/lp9p0HMMfUyN/zEP48KlbBuvMDbQeOy6F6xiLRnhoCGLj8udaT4+J6ErW3PkXz9MVsebq7iHQcDi5rNHf3a1sXl1ORF5XCyMvvYiWZxVjLK6L8Rbil5L+JKxn7Fwyi7mTx2vKx/gIJQjCilQ0f5+1kfnWRAMyQImxr3YYlsWYxBd0fYX4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4e9136-787e-4858-7983-08d7141b6b26
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:53:48.9379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1627
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============0694893146507654833=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0694893146507654833==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-Eh9T0J85pE5hpYf6WUm9"

--=-Eh9T0J85pE5hpYf6WUm9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-26 at 14:14 +0200, Juergen Gross wrote:
> On 26.07.19 13:56, Dario Faggioli wrote:
> > On Fri, 2019-07-26 at 13:37 +0300, Andrii Anisov wrote:
> > >   - How to avoid the absolute top priority of tasklets (what is
> > > obeyed
> > > by all
> > >     schedulers so far). Should idle vcpu be scheduled as the
> > > normal
> > > guest vcpus
> > >     (through queues, priorities, etc)?
> > >=20
> > Therefore, even if there wouldn't be any subsystem explicitly
> > relying
> > on the current behavior (which should be verified), I think we are
> > at
> > high risk of breaking things, if we change.
>=20
> We'd break things IMO.
>=20
> Tasklets are sometimes used to perform async actions which can't be
> done
> in guest vcpu context. Like switching a domain to shadow mode for
> L1TF
> mitigation, or marshalling all cpus for stop_machine(). You don't
> want
> to be able to block tasklets, you want them to run as soon as
> possible.
>=20
Yep, stop-machine was precisely what I had in mind, but as Juergen
says, there's more.

As said, I suggest we defer this problem or, in general, we treat it
outside of this series.

> > 2) you move all these activities out of idle, and in some other
> >     context, and you let idle just do the idling. At that point,
> > time
> >     accounted to idle will be only actual idle time, as the time it
> >     took to Xen to do all the other things is now accounted to the
> > new
> >     execution context which is running them.
>=20
> And here we are coming back to the idea of a "hypervisor domain" I
> suggested about 10 years ago and which was rejected at that time...
>=20
It's pretty much what Andrii is proposing already, when he says he'd
consider idle_vcpu an 'hypervisor vcpu'. Or at least a naturale
extension of that.

I don't know what was the occasion for proposing it, and the argument
against it, 10 years ago, so I won't comment on that. :-D

Let's see if something like that end up making sense for this work. I'm
unconvinced, for now, but I'm still looking at and thinking about the
code. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Eh9T0J85pE5hpYf6WUm9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0+3ksACgkQFkJ4iaW4
c+5f0xAAwbNnWvhIFs674KjzuZ/Xmn7y4zN1BWwkA8hHNi/QPtu+b3PzG8NCy/vD
c2IwljMaAPXSflmr4ik6APYvRCOsjrFCwm0/SU1bHFs+FyvTIVUzZ9+Rgj7m5HV0
Kxzjbhnz8rfKoRA99QoOQ5RNRYV7IIpPAfO80k7l1JmcWp71f39Lx510K+ZWFhEa
+aqgXHEFJASTw+v5r740+GO93jyynfn827E+c7TUFJnI19qgZLmIa0F3UY2T56Ae
ytoKFZ48ls1IcpyUf+7EA0HCK87jA/SGDltsDGhVZsT3R2dkZlFjYzieqpzuRq9P
FxxeXYIbS7FaPk+9HVrtYqjgsmRUet5RteyTOPzj68QbatYG2Lw0XvjtjJvRA3ZJ
Px68yH3HHLVJ/jp9B51LniZGtNGPrN3fYlEPoRFkMBr2SKbOsObOCpaVVwIWcRW5
WHE04rO6zENU2+W1MpXW7TlNXqmdVIS6j9BkJHoe663ca1fcKiblVDSRbKf+lnoy
CZiUuUrPDjvkgUHT+rZZCY6ASGZ53AnjJGNP48GuLtOXq2MfiZKrh1DYM8BQjuxj
xd/tILcIYSy6FK3KO7nYiwFIDBgCASYWpv5PoRc+swBo9ALi4vSx8gqFyMD3tcr+
TaPCL3rJwgJBDykHQgGlkFefi97w/S+UnSrrqjfWhHyfzRk3zAY=
=JddK
-----END PGP SIGNATURE-----

--=-Eh9T0J85pE5hpYf6WUm9--


--===============0694893146507654833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0694893146507654833==--

