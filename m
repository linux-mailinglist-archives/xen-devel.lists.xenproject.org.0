Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745348BF8B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 19:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxaRV-00037s-PT; Tue, 13 Aug 2019 17:18:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxaRU-00037m-EF
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 17:18:40 +0000
X-Inumbo-ID: 5df21c88-bdee-11e9-bcd4-f36c8e9da557
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df21c88-bdee-11e9-bcd4-f36c8e9da557;
 Tue, 13 Aug 2019 17:18:37 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 17:18:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 17:11:38 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 17:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOoLfYOmW/eTxRyZ0nZxUg0YlW5Gzqu9RQeDd+kvoF8F3aulc94yd3VOU9HpivPlTOiRv8y1cM+ZPlRYxm556x5IhT1Ibe428J2oNy79FqmxHa7y6Stbbm8RYIeC4rMnCBXEYO8ddfjpVPrflBl40m//EpvCQO+1GUed0ia7BMy7vai3ts4IgX+yyQumbGIw6ohQPjWh92C79JXicX97WKMyopX8YhqXMVX9aP7pnz5VtItaFbOpzI6C/on3H5DCD9k7uCP4+iIaMIHynaqle8PcFTvoOziUGIHTZuzLpyM9EBznVHpBiYiwWUvnn3YDA7DoxjQRdncwKq7edvf4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR88qt96JiRSvd7mcoq47PZ4HudT8HiQblVckBj1Q6g=;
 b=A0+LfYNDOA/8vw+EXCeJfioxp+Ud1p0abimkkvQJHyi6WV4oP1nZ7hX9YoXKbPJXFR+ik37ix4wXK7heYzhte+a+XRNLgTkbljZURD3J7K93UgDg1kZkff+5mCzC+ZEa+nrboZuNZ6/LsnvBMxlNZVj+DQIXPfS8jakkVO8YZG3mv/WKDpakG4TcDgizfOL7m+RBqcz5lw6aNLhH7RtHQ7QOseiGGXq2JSsBwa9P0UL9Hkld/SMMpdFOUWXmEsznm6eyJd/x8Ie4XrMTKYuVoWxkVeN8XipXahTD/GkfTjKZ0eImd/kbrVXkhIeDsw8wAy9tHGNQ5Oh2v03JFFelPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB3064.namprd18.prod.outlook.com (20.179.58.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 17:11:36 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 17:11:36 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 2/3] xen/sched: remove cpu from pool0 before
 removing it
Thread-Index: AQHVSTNNfWDyHNSatEmhQjU/j+HjQab5YeoA
Date: Tue, 13 Aug 2019 17:11:36 +0000
Message-ID: <207a0624d8ea32e46694a31716e79b7f2ed4cce8.camel@suse.com>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-3-jgross@suse.com>
In-Reply-To: <20190802130730.15942-3-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b6af8c4-3073-41e5-2755-08d720114c60
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB3064; 
x-ms-traffictypediagnostic: BYAPR18MB3064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB3064074C872C29840B575154C5D20@BYAPR18MB3064.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(199004)(189003)(36756003)(6246003)(186003)(99936001)(478600001)(53936002)(26005)(14454004)(316002)(256004)(14444005)(966005)(110136005)(102836004)(54906003)(25786009)(6506007)(5660300002)(76176011)(81156014)(2501003)(4326008)(8676002)(81166006)(66066001)(446003)(118296001)(8936002)(66476007)(305945005)(99286004)(66446008)(7736002)(71200400001)(6436002)(2906002)(71190400001)(53376002)(6486002)(486006)(76116006)(86362001)(6116002)(11346002)(64756008)(6306002)(3846002)(53366004)(2616005)(91956017)(229853002)(66556008)(6512007)(476003)(66946007)(66616009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB3064;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 17UVmFh+b7DCRnXTJlcaESeIf0oxtzz+fmtY9S3Z6WceWFE2jrwQcUGX5cQM2tLfxbmvapk71HZzGFshTsAaw3476iGPDFw0xoW9WLHv84uJrr11J9mWyL3i2md5oV+nEaBo7c1X+cYy/Ag20SdsSlmM5d9BdVJgmpfZaViFlpd3C58luUpjUAxxlD1GU+QbUp0wEG/Kh35ZAEIS+4rCoN0DnGvgwjnE+rMB7r4Bkrtm9eg6K/arrvmAEHyOj2y6SMpX/E52b9wM9vYxC/AuAi1Hx/iDWu0Ie+U0xzgg+vGkrgm+lrPPN3Anqzf/uelvdTWpFJqELDJkuXsBItvBFk8zGIEVHRYAPs9gOMmiuZC9gg5icErfU/jtjnE6mLk7IseRgqUZUK81wkHTK1T6zvkGhDry8Jtax6Exo5q+Rsw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6af8c4-3073-41e5-2755-08d720114c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 17:11:36.2448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOkh9wl9mxuem9rfUVjWayifN5Jdx4E8BtfMhV7SY0KOTaFDk2DhE9dOxqQgnbC2nvt6XBEYhWTyAmlbepDhZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB3064
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/3] xen/sched: remove cpu from pool0 before
 removing it
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
Content-Type: multipart/mixed; boundary="===============0621573278219835468=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0621573278219835468==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zgC5mJPebmQAE6drNzcC"

--=-zgC5mJPebmQAE6drNzcC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 15:07 +0200, Juergen Gross wrote:
> Today a cpu which is removed from the system is taken directly from
> Pool0 to the offline state. This will conflict with the new idle
> scheduler, so remove it from Pool0 first. Additionally accept
> removing
> a free cpu instead of requiring it to be in Pool0.
>=20
> For the resume failed case we need to call the scheduler code for
> that
> situation after the cpupool handling, so move the scheduler code into
> a function and call it from cpupool_cpu_remove_forced() and remove
> the
> CPU_RESUME_FAILED case from cpu_schedule_callback().
>=20
> Note that we are calling now schedule_cpu_switch() in stop_machine
> context so we need to switch from spinlock_irq to spinlock_irqsave.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>=20
> --- a/xen/common/cpupool.c
> +++ b/xen/common/cpupool.c
> @@ -282,22 +282,14 @@ static int cpupool_assign_cpu_locked(struct
> cpupool *c, unsigned int cpu)
>      return 0;
>  }
> =20
> -static long cpupool_unassign_cpu_helper(void *info)
> +static int cpupool_unassign_cpu_epilogue(struct cpupool *c)
>
in schedule.c, for a similar situation, we have used '_start' and
'_finish' as suffixes. What do you think about using those here too?

It's certainly a minor thing, I know, but I (personally) like them
better (especially than 'epilogue') and I think it gives us some
consistency (yes, sure, different files.. but scheduling and cpupools
are quite tightly related).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zgC5mJPebmQAE6drNzcC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S70YACgkQFkJ4iaW4
c+5isw//b57cCQO4AV4Vu1JOcAzdwiH9tMyqGFLZ9dLETef7L0wMsmZGycymv4Oo
BOoNSn3evZL6InfQ99NFs/RgRgnUvzOqUCf8v1rtSn1KLG+TgQlEo5xo1g9T6GAb
5NiUPeMwC4gsid7kQZsq+GLy4hylf3zJPfFqTX8heY0J+22xWx6g6YIEUnVo2LS9
bZK6KLN4qhoKiKj2RaNcULgZ7wDsAVdmhE5DRy5eaGZiMvBfn6RDqxF5KgIqMkje
FPvHfXaRo/zZpMtjq3uLVrukEX6Fvz5sGvIMG64kz9/RN1vpU0mkNnqvJtCJPwhe
7rQNhADvrS+6e1mzsRwymfW4Wm3xIwZnM+1zQzbyaRPOgTRfH+2vjYKEODyi1kLm
1I2g+F4W6TwFgu6rRpQs8rn1pnLkzec5cvTHGxl5IlGsy8nZObygujiDW4ofXG5g
ah5vn4YT7NLgfAtGs5fbej5lXQJJ4vq9E6g18buwo6f8dRH7DNOl633sW9y9XDPN
57x3fdUx8ulpaZoL34jp5x78h9lavk6ibyYBjK78Ti/U8Dv59IydT0v/QdYPQm9+
dTCHpCt+GOWeZqfvRXpEamXHOV5htczrc3rtWgLH/tmPLW6vutpgBifq42OGVUXa
twVcubJgPYsua0FigtU1FzJ7OfAjm/noA7DO5O0HaVbiSr/LRaU=
=NhDh
-----END PGP SIGNATURE-----

--=-zgC5mJPebmQAE6drNzcC--


--===============0621573278219835468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0621573278219835468==--

