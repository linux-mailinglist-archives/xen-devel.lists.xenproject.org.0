Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A28BD7B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:44:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYwX-0001UH-Jw; Tue, 13 Aug 2019 15:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxYwW-0001UC-Gv
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:42:36 +0000
X-Inumbo-ID: f712d73a-bde0-11e9-94a5-f774202b3c61
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f712d73a-bde0-11e9-94a5-f774202b3c61;
 Tue, 13 Aug 2019 15:42:33 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 15:42:06 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 15:27:49 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 15:27:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAevsv1FpPv/O7kJv2Vf97cBPWUsgklMFh4BPUcoRtIkmhnrSEdrIW74f0Wn9uqV5L4H75AmZ5GrLWmUKgdVMSxt5Mun8c0kidx9qBQVpI8XRKwPlIxo+iBFV7S26aA0DA0+yJaydlxwa0QZLETuHpRSDMZLrCjH8eiwjIS+CwoFb5OdQ6KB4upfpQIQWf3R9qP5LbGqMrWqT8Np68bs1drzk4qGI0rerj5HeqOsXd+qQgRBzox3YUOb+DheJQu5+yF+pE0Chg72DlzBu9POfZEAGfjAPNsss9vSBryCH1HPnyuoQPi/wT5t0UEOGRNeriKqB+eIwIVeQeJcJG6IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZmuQfyZQ8Vdq9yW2uQ0VrMSxVrF8syW/GyPSicaiRw=;
 b=ktWBhBbDsOpE8Gh0KFgV49fVWBI/Nus7k/ORokvVpIBuT2xXy+0iFgho9TD6LaXl8vfY8j80cYtRbwSYgkvoccfIIct8T4v/ICL7lVxgg4WWwBq7UctePp7xsA6bOo7oG+K8FVFCGmze5y2Yknn1OXDMLa+sWwn9nMkkOw1ch0PHzUWujWkpvWynzxfUGGA++EqK6jYatbmSggov5gQ3nbmtB1lN6KWItxPyNCkRh+thQ3eirlnHscOj60mGZ/mYGK3srVZlxGwvfo2pvasWrI6UL4vwZLewtNMoNSuZ6rzuhlMb8Rk+ONEGg7/i/fvYBwLE8o0lncczgl5OgI99tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2887.namprd18.prod.outlook.com (20.179.58.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 13 Aug 2019 15:27:48 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 15:27:48 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] dom0less + sched=null => broken in staging
Thread-Index: AQHVTU0h+kfyo+Dyy0KGuLer1mUTwabzJpKlgAYWI4A=
Date: Tue, 13 Aug 2019 15:27:48 +0000
Message-ID: <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd665b42-3c4d-46ed-d4d2-08d72002cc46
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2887; 
x-ms-traffictypediagnostic: BYAPR18MB2887:
x-microsoft-antispam-prvs: <BYAPR18MB28873C9E35F06BE7932AA698C5D20@BYAPR18MB2887.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(199004)(189003)(8676002)(66066001)(305945005)(14454004)(6116002)(3846002)(7736002)(54906003)(99936001)(2501003)(446003)(11346002)(102836004)(2351001)(26005)(966005)(186003)(76176011)(36756003)(5024004)(478600001)(256004)(316002)(8936002)(99286004)(6916009)(6246003)(6306002)(6512007)(81166006)(53376002)(91956017)(86362001)(229853002)(25786009)(2906002)(6506007)(66476007)(66556008)(64756008)(66446008)(5640700003)(66616009)(66946007)(76116006)(118296001)(2616005)(486006)(5660300002)(476003)(53936002)(1730700003)(81156014)(71190400001)(71200400001)(6486002)(53366004)(4326008)(6436002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2887;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tEYW/e80E9M1VitPFoPeplLiK5HRw+Jnex96r7nNRC9JwuvEkaBWU1tlkv9sfMxQ/+DSfLnd4UQs9F7HuItI8/tZT9+5KYYNYgfXZb1NOTon5j9DAiLMD2Relj3k8Pjwp10c+GEje+3IHDCpogLZEvT7+5CrC7AwhfKaCKrMGqOIot7QyTeKFh2UoGZBoYhv70fcX5jCSMd1nxSRxqVdNkOrqx+Puh/1wsr4jykZvOUGUl73S4Vno2+Gj9sn0ZcnJWfriFJuRrxnAtopZyVeUa8B+YGsAXLDtYdo6W4YMOtzQUKwVYq5wd864twCP6POIEsqxq9gE0WBWHd3Cnx8Xe96ix4t7R4RVpU8VsoJg23rXdDSLTUXr3h/CRXjWQPdOGSHb8RvRFDNvF0B3sj95ME73Y4Oqpio4q0LEr7A+sg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd665b42-3c4d-46ed-d4d2-08d72002cc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 15:27:48.4302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L54tyB6a/Jfll4ymrKllBtIppRQXlOj+EksUI1AlmP1poya6kw4Fuq2YDUHPs6Ry3/uoH2uqn/PmjIBHtIiAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2887
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============6320647122481207190=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6320647122481207190==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-+D7jfw+I9nByGCXLDjj2"

--=-+D7jfw+I9nByGCXLDjj2
Content-Type: multipart/mixed; boundary="=-pVWLoAGd645kk+qne1fZ"


--=-pVWLoAGd645kk+qne1fZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 11:30 -0700, Stefano Stabellini wrote:
> On Fri, 9 Aug 2019, Dario Faggioli wrote:
> > Can you help me with this, e.g., by providing some more info and,
> > if
> > possible, logs?
>=20
> I am attaching the logs.=20
>
Thanks!

> Interestingly, I get a bunch of:
>=20
> (XEN) *** LOADING DOMU cpus=3D1 memory=3D40000KB ***
> (XEN) sched_null.c:458: Not inserting d2v0 (not online!)
>=20
> Maybe we are missing a call to online the vcpus somewhere in
> xen/arch/arm/domain_build.c:construct_domain?
>=20
Actually, those lines are normal, because vCPUs are created offline.
(see the set_bit(_VPF_down) in vcpu_create()).

The problem is why aren't they coming up. Basically, you're missing a
call to vcpu_wake().

In my (x86 and "dom0full") testbox, this seems to come from
domain_unpause_by_systemcontroller(dom0) called by
xen/arch/x86/setup.c:init_done(), at the very end of __start_xen().

I don't know if domain construction in an ARM dom0less system works
similarly, though. What we want, is someone calling either vcpu_wake()
or vcpu_unpause(), after having cleared _VPF_down from pause_flags.

I am attaching an updated debug patch, with an additional printk when
we reach the point, within the null scheduler, when the vcpu would wake
up (to check whether the problem is that we never reach that point, or
something else).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-pVWLoAGd645kk+qne1fZ
Content-Disposition: attachment; filename="xen-sched-null-vcpu-onoff-debug-v2.patc"
Content-Type: text/x-patch; name="xen-sched-null-vcpu-onoff-debug-v2.patc";
	charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9u
dWxsLmMKaW5kZXggMjZjNmYwZjEyOS4uZTc4YWZhZGY1YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9zY2hlZF9udWxsLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKQEAgLTQ1NSw2ICs0
NTUsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAKICAgICBpZiAoIHVubGlrZWx5KCFpc192Y3B1X29u
bGluZSh2KSkgKQogICAgIHsKKyAgICAgICAgZHByaW50ayhYRU5MT0dfR19JTkZPLCAiTm90IGlu
c2VydGluZyAlcHYgKG5vdCBvbmxpbmUhKVxuIiwgdik7CiAgICAgICAgIHZjcHVfc2NoZWR1bGVf
dW5sb2NrX2lycShsb2NrLCB2KTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KQEAgLTUxNiw2ICs1
MTcsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAgICAgLyogSWYgb2ZmbGluZSwgdGhlIHZjcHUgc2hv
dWxkbid0IGJlIGFzc2lnbmVkLCBub3IgaW4gdGhlIHdhaXRxdWV1ZSAqLwogICAgIGlmICggdW5s
aWtlbHkoIWlzX3ZjcHVfb25saW5lKHYpKSApCiAgICAgeworICAgICAgICBkcHJpbnRrKFhFTkxP
R19HX0lORk8sICJOb3QgcmVtb3ZpbmcgJXB2ICh3YXNuJ3Qgb25saW5lISlcbiIsIHYpOwogICAg
ICAgICBBU1NFUlQocGVyX2NwdShucGMsIHYtPnByb2Nlc3NvcikudmNwdSAhPSB2KTsKICAgICAg
ICAgQVNTRVJUKGxpc3RfZW1wdHkoJm52Yy0+d2FpdHFfZWxlbSkpOwogICAgICAgICBnb3RvIG91
dDsKQEAgLTU3MSw2ICs1NzMsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfd2FrZShjb25zdCBz
dHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2KQogICAgICAqLwogICAgIGlmICgg
dW5saWtlbHkocGVyX2NwdShucGMsIGNwdSkudmNwdSAhPSB2ICYmIGxpc3RfZW1wdHkoJm52Yy0+
d2FpdHFfZWxlbSkpICkKICAgICB7CisgICAgICAgIGRwcmludGsoWEVOTE9HX0dfSU5GTywgIiVw
diBpcyB3YWtpbmcgdXAgYWZ0ZXIgaGF2aW5nIGJlZW4gb2ZmbGluZVxuIiwgdik7CiAgICAgICAg
IHNwaW5fbG9jaygmcHJ2LT53YWl0cV9sb2NrKTsKICAgICAgICAgbGlzdF9hZGRfdGFpbCgmbnZj
LT53YWl0cV9lbGVtLCAmcHJ2LT53YWl0cSk7CiAgICAgICAgIHNwaW5fdW5sb2NrKCZwcnYtPndh
aXRxX2xvY2spOwpAQCAtNjM1LDYgKzYzOCw4IEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV9zbGVl
cChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICB9
CiAgICAgICAgIGVsc2UgaWYgKCBwZXJfY3B1KG5wYywgY3B1KS52Y3B1ID09IHYgKQogICAgICAg
ICAgICAgdGlja2xlZCA9IHZjcHVfZGVhc3NpZ24ocHJ2LCB2KTsKKworICAgICAgICBkcHJpbnRr
KFhFTkxPR19HX0lORk8sICIlcHYgaXMsIGFwcGFyZW50bHksIGdvaW5nIG9mZmxpbmUgKHRpY2ts
ZWQ9JWQpXG4iLCB2LCB0aWNrbGVkKTsKICAgICB9CiAKICAgICAvKiBJZiB2IGlzIG5vdCBhc3Np
Z25lZCB0byBhIHBDUFUsIG9yIGlzIG5vdCBydW5uaW5nLCBubyBuZWVkIHRvIGJvdGhlciAqLwpA
QCAtNjk3LDYgKzcwMiw4IEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV9taWdyYXRlKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnYsCiAgICAgICovCiAgICAgaWYgKCB1
bmxpa2VseSghaXNfdmNwdV9vbmxpbmUodikpICkKICAgICB7CisgICAgICAgIGRwcmludGsoWEVO
TE9HX0dfSU5GTywgIiVwdiBpcywgYXBwYXJlbnRseSwgZ29pbmcgb2ZmbGluZVxuIiwgdik7CisK
ICAgICAgICAgc3Bpbl9sb2NrKCZwcnYtPndhaXRxX2xvY2spOwogICAgICAgICBsaXN0X2RlbF9p
bml0KCZudmMtPndhaXRxX2VsZW0pOwogICAgICAgICBzcGluX3VubG9jaygmcHJ2LT53YWl0cV9s
b2NrKTsK


--=-pVWLoAGd645kk+qne1fZ--

--=-+D7jfw+I9nByGCXLDjj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S1vEACgkQFkJ4iaW4
c+5etw//QiJLIW1PeACnCRlVVeJFZb0iNcSueyg2ap3VRU1SAlpac6QI0tFp87mA
v5brlJjL7mUJZRGQHvwTG9KBF60WTVdCMomPjWssQnKqFhIu291W0U0iBklh+c2p
Zw6wlVeBq9L8PK51/rQTMW0SIr+3bAqdIfZP/N6SwNURme2mgkbW8i7C0vAuaz1L
h2BgoN2u2sd0C1FvDWtuWDr4STYOroyjzSt09B+AX9m2JObcsr5htZqnZcguX9/B
6psY33sZOR7IOoaVMEoPdiPV0n1cWGv7Xll/rPjf4zAMCm8Yl/w+E/hkGILh+JCx
tJuin3JL1HlkcV80ZICy/vWIc85QqhC2j/jMMViJy6ubWgHuB0e0KD2O9qpw63/f
GX9EpNSaXjHSZHlNTD/zuvKc6NueLKuR1NPdR6YFFFH94GrMupwYBbq15qGQYZZv
0ffWRAQmC3s1924tmUoEHoiraq4bHd9ZI2JEHDLyJkO/ijpq8kR3GlZ0wNbQVZgG
ZusoUbrTTKqLCnoNL8gZkNY3EDm0vZdJIZspJf0Z/KRTP1JxnuoKuze2J7n0LMVz
lDKl8sw1f4Sgx/KB/IPbNkxKppic5HHIrDhe6EaXejQhGeexCQ6Rn3p3fa9w17GY
VXCXTfKDDcXWqpOI+ufKfFDF5at6vECY9hbFRel2J3pwDG2bZdw=
=pyHq
-----END PGP SIGNATURE-----

--=-+D7jfw+I9nByGCXLDjj2--


--===============6320647122481207190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6320647122481207190==--

