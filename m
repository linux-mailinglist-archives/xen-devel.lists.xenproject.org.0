Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7F76595
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:22:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzC6-0007AH-R9; Fri, 26 Jul 2019 12:19:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqzC5-0007AB-6q
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:19:29 +0000
X-Inumbo-ID: 96113324-af9f-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96113324-af9f-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:19:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 12:19:17 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 12:15:29 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 12:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpi2tHzRv5KsgSAPxjSoWpvPfGujnj7ayr/THmCeGfmi2w5vbHi0IZowTfPB1/G64ssAuU6YmgG8a/yhlJRxfkim26DgiZTeN6SWLnwQMFTy7Y4uzfx2hX53bBQfpNWrudBWDtfxOqaBkuwOkE2gIKYxL2y7WDtVCO0umRty6w544jy4MDHuW0MTnFoOKuQPa5B3mN5KSRN5hqubl0TeDRktOpgtMxMUxhoreMHq/fxUlUZSIUjOK4d3lt7rd5iElACetc6L44MCmlO2ueBv5AE9Eib+2wil64eIFIIO/XSdJ5zYAV9ZmEt4RqwGzjchZtplHai0+alLXTW3d3bTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw59eGsCz5qw+QaOVAmc/DqmFU5bJkoHQkXqtN9fr2g=;
 b=U52mxlR09oP/JOunZoxUI/WA5XA3PBFrXENj8cygvFIm+BEpmX3qCU6EX2E0aEqb06wueqcOhhgLoh/aoZO8WxXC7XnfPzS6jhtyDTEFwPBdn6NIUX764on35UgGBoZ1dwCo8YZai0ZmWVH4+Z4tK0GLxcEE/QPKVBrh9yUg7xs01/lDSV/n4rCZ4P0+xHOfAMjbYpqbA9sv1oP8JPNsgJfITEqxUyn5tpnYFqDwG5zOUh5VJFRrHiri8mlEu+8yiR6b3DNB+YQ6RZ46srRvv3lbu2y0puLe9udT4CPNRPGurHwM9KBkR3snMwgUSC0NHErmMlOJR/bNeXQkKAMaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BN6PR18MB1490.namprd18.prod.outlook.com (10.175.194.149) by
 BN6PR18MB1219.namprd18.prod.outlook.com (10.172.209.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 12:15:28 +0000
Received: from BN6PR18MB1490.namprd18.prod.outlook.com
 ([fe80::591a:7cd:495f:8e37]) by BN6PR18MB1490.namprd18.prod.outlook.com
 ([fe80::591a:7cd:495f:8e37%6]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 12:15:28 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 3/6] sysctl: extend XEN_SYSCTL_getcpuinfo
 interface
Thread-Index: AQHVQ54+rFbPh7Xsl0e/AsQk+PDWkqbc0GAA
Date: Fri, 26 Jul 2019 12:15:28 +0000
Message-ID: <3dbd34f4b4f6286c627b40ed464e565c02111fda.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-4-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1564137460-25629-4-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40bb3064-db9d-41aa-7dee-08d711c2f28f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BN6PR18MB1219; 
x-ms-traffictypediagnostic: BN6PR18MB1219:
x-microsoft-antispam-prvs: <BN6PR18MB12197309E2663694EAD99FBEC5C00@BN6PR18MB1219.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(189003)(199004)(54906003)(2501003)(8936002)(478600001)(53376002)(53366004)(25786009)(7416002)(6306002)(110136005)(6246003)(966005)(6436002)(229853002)(14444005)(76176011)(68736007)(6512007)(6116002)(99936001)(36756003)(256004)(64756008)(186003)(8676002)(26005)(76116006)(66556008)(66946007)(91956017)(6506007)(316002)(7736002)(305945005)(66616009)(66476007)(5660300002)(476003)(2616005)(11346002)(86362001)(6486002)(3846002)(486006)(14454004)(118296001)(446003)(81156014)(4326008)(99286004)(66066001)(2906002)(102836004)(71190400001)(71200400001)(53936002)(66446008)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR18MB1219;
 H:BN6PR18MB1490.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T8nSSYfFMJcjeud7e+BABMSpHmuE+B61ltc40n9xXWlBhzcnRTyrHAgZtmnUl6eEOWo6WIPe8TKJKsKqHzRIkioXUy1TB9nYiVSFr18ZQK/MA2BYg/kzn+bfJ4aAtNvguEBN+jmt6ZEJ6OlV+sIhacNvfeP5KJBAyZa3EPUeL9YxEjqktvI5dKdl7ijTbPyf/Dw6gCZfgDDa++nxGLHjUaQw1lMybJhdlg3Ph4VRClUy3Vr5U/dbpyP/SCW0O5u/xvpQHIFyQR//Y9Pps45Izf1AV2/sWEmzdnM28R2PGJgqeN74wQa8ixf7lE+5tvIDixc8+SPzc9wZNZYzzbCtzFQSwA3H08kTXbjcarvVe5WjTCaKQlwi1X5GLGN/6p/lTkkTtjT3Fi8qAd6kCMZBR4Av0HCjyGBCZEWJDcUi1yk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bb3064-db9d-41aa-7dee-08d711c2f28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:15:28.4863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR18MB1219
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 3/6] sysctl: extend XEN_SYSCTL_getcpuinfo
 interface
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
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============5404329687729871976=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5404329687729871976==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-j/oU3cqu4/LxKB9VeHFW"

--=-j/oU3cqu4/LxKB9VeHFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-26 at 13:37 +0300, Andrii Anisov wrote:
> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index 0a38d4a..9e8805d 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -217,6 +217,28 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
>      return state.time[RUNSTATE_blocked];
>  }
> =20
> +uint64_t get_cpu_guest_time(unsigned int cpu)
> +{
> +    struct vcpu_runstate_info state =3D { 0 };
> +    struct vcpu *v =3D idle_vcpu[cpu];
> +
> +    if ( cpu_online(cpu) && v )
> +        vcpu_runstate_get(v, &state);
> +
> +    return state.time[RUNSTATE_runnable];
> +}
> +
Yep, I think being able to know time spent running guests could be
useful.

> +uint64_t get_cpu_hyp_time(unsigned int cpu)
> +{
> +    struct vcpu_runstate_info state =3D { 0 };
> +    struct vcpu *v =3D idle_vcpu[cpu];
> +
> +    if ( cpu_online(cpu) && v )
> +        vcpu_runstate_get(v, &state);
> +
> +    return state.time[RUNSTATE_running];
> +}
> +
>
I confirm what I said about patch 1: idle time being the time idle_vcpu
spent in RUNSTATE_blocked, and hypervisor time being the time idle_vcpu
spent in RUNSTATE_running sounds quite confusing to me.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-j/oU3cqu4/LxKB9VeHFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl067t4ACgkQFkJ4iaW4
c+6unQ//e8m+s3U2g8DmgyDSa+IFvUqn0PrKPcAmcejekGpftKtjXYttPIXBANf8
yLMLUohj1krIS11S18w3C3BKWs0zqq7ZjToipTuXzu5NrO3LxmaJW9NJAVMURCJ5
NRtO8oYLjmjZ2bY48IImNruuyB/7XKoIuHRUBSJ19cJ78fAEv4WM4O2Cti3tK3T7
KnReV2DqUW1F9vAm0ZU7rOphTsTBqXf98tIe8c1a6kd/bTuOfpng8gL6RZ/nuu7W
lxpY30WwvIkRquL0ALVCk5J23/be+K6r+3caPqSnICJsNmVjgNFKIAKwYZjE86MI
7al8AQhTemxqGqZ0SCOzOKh+gUjgB8d01Ltw9aoH6ddmsMM1/7jjCmiSOjk9jGEx
Wfv8POfRjS8CqMEHcvZcb7ssx+86Tz2gzMER7qBrXN8Fnfq1k67ScuhBvKJTHzZ3
VNKwiVbd2itXm7CvYw2DLndayLtdZJdjGjgKk1FItFaB04P9l6GjWUY11QGWbivg
EAA7RPoEIROdKulQQYVOlvOCorNKFNXT8Rz6RGrZ1MePqsUcHIWToYpRZYHCkVwI
5laliB+PMqIY+PnI3E8xKMP5ftBLRPp94+JrrGdyjinuX88anoVCTtpXdIS7Gezj
1Sch8Ax8Fsn89vz2FBCWoX0Amf4IFpFPm9Q01B7wVWmE7IPN2Q4=
=1CeZ
-----END PGP SIGNATURE-----

--=-j/oU3cqu4/LxKB9VeHFW--


--===============5404329687729871976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5404329687729871976==--

