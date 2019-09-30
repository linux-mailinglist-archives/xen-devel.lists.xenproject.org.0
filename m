Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11EC1C1C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:33:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEq8f-0006NL-AH; Mon, 30 Sep 2019 07:30:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V+AX=XZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iEq8d-0006NF-55
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:30:31 +0000
X-Inumbo-ID: 190cef4a-e354-11e9-bf31-bc764e2007e4
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by localhost (Halon) with ESMTPS
 id 190cef4a-e354-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 07:30:29 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 30 Sep 2019 07:29:28 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 30 Sep 2019 07:28:19 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 30 Sep 2019 07:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBa9110wD39zG9t3FwSYq7NZyOcv2/ebZ78sm+F+VjurACxqSiyR7PVX9b3slISjhfziX3voVD99ErpWJA83tMfFG3tCPLQq4x12K/sUFlTqi3XMgdyPYrEXNMis2ptWBD9igVw/+nDEB6spFdsNcWtQOee/XAD2lgHuzvQ+TOPskByXkkv9X26ZsAsLZBEAwe2dzGggN28vRXHOekeYCERLSASWlLfIEB6DU28LiZhXtx0nW8FFCxYnGN9b7Z/aI4jR2HJfAFrblhosMGg/iGEGrvLU02+n92G9COEYbPWGybitG42V2iGPNhi+5akHwtZTGtLTF2m/IwIwUsfCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cYzD+x3/XwBwh6aeC19sFvN9bkak6ur1UINyD9Aj+M=;
 b=mDf0Bhfi//8OZOAPkVoXFbf2TXecdMAJO5y5LM7IzOTNYTQQgKTlfffdVlqP8NevqbFSwwc8hv4iGwAck97ll6A77toRRTwuAm/5LqiO/DtpWTQm+QLRVbfHIgkh0RJKZR8wgbPMd5Ud8UkYPDONqKbS1aDfZD8ea1HkPhD7ghVww3wsDT9Mkxk6ZBxnWfHe1r7EHns3OCOeyN1tlal92ZehNmuDYhXbEJLqDrmr+ECMKzOBiLqUgXQpBRI1737rwC5VnzESfc1LZetNz7Mn77JXNyqn8+VEhsrdnT0WiC4xP7/Zmnabt3hCJJMHHY3aQgHh2jwXYIT3DNb2skirUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2901.namprd18.prod.outlook.com (20.179.59.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 07:28:17 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 07:28:17 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v5 07/19] xen/sched: add fall back to idle
 vcpu when scheduling unit
Thread-Index: AQHVd071FpdpfWsjTUy1+fzDt48z26dD0qCA
Date: Mon, 30 Sep 2019 07:28:17 +0000
Message-ID: <2649691071d5cd3c799dabd17f554174fe90c092.camel@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-8-jgross@suse.com>
In-Reply-To: <20190930052135.11257-8-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 820d285c-ea4f-4bd8-cb81-08d74577c370
x-ms-traffictypediagnostic: BYAPR18MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB290116C662B6B1E1EA54B02EC5820@BYAPR18MB2901.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(66066001)(11346002)(305945005)(486006)(476003)(14454004)(6116002)(2906002)(5660300002)(3846002)(36756003)(71200400001)(118296001)(71190400001)(76176011)(6436002)(8936002)(102836004)(2501003)(4326008)(6246003)(81166006)(81156014)(76116006)(91956017)(6512007)(7416002)(6306002)(6486002)(6506007)(478600001)(2616005)(66616009)(66476007)(66446008)(66946007)(966005)(26005)(229853002)(25786009)(7736002)(8676002)(446003)(99286004)(186003)(316002)(54906003)(256004)(110136005)(66556008)(99936001)(14444005)(64756008)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2901;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PA8Q2VKEc5FYpPLfVNirLRCsvDEQKKLn+NEwTYuEZzlrkTYwOvxyoA44ZOC5Q8GfvW5pM896YF5lPzmaGwstyXfuf6ocfU8bIQYD/Y4HDvEBDQ4YcQlXgXa4Iv7aC04cnfo8Px+YCk9Fm++TXLg/nXHaqIVli1p+WJINdRLdOgTWlob7YnSWlGxdgmcpNZMcieeHUZZO4nWnziWNyS0QRt59aQWyB8k7FpMX6j5BOL42sN0F9vN5rpv0o6Z9rirEtV5cxSKKMi9Y47QZmTedjke9Wt71RAD4ZNEhDuUW6eLtBybRefb6YG6x2/9ve1G93vLZD7Idw0UHzPkplpFqzDvEvKK/5NTb0FvfJoNk85xmAtvq4lIaCFLy8gqb2FI5TsAh1G/rN739pAWhtHLzhoC9pIOrSPiol8c5+Du5DHU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 820d285c-ea4f-4bd8-cb81-08d74577c370
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 07:28:17.6549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioqYajp4oRMbRA1vZHbdBbNODDL3bXoM7QjXQ9Dwu43QneeLvv66VIFtfKE5yR9WTAO53pFsD2VHvfXT3yy0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2901
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 07/19] xen/sched: add fall back to idle
 vcpu when scheduling unit
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8533737891135248828=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8533737891135248828==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-KSS1l4WVUSh0m84+MGXb"

--=-KSS1l4WVUSh0m84+MGXb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 07:21 +0200, Juergen Gross wrote:
> When scheduling an unit with multiple vcpus there is no guarantee all
> vcpus are available (e.g. above maxvcpus or vcpu offline). Fall back
> to
> idle vcpu of the current cpu in that case. This requires to store the
> correct schedule_unit pointer in the idle vcpu as long as it used as
> fallback vcpu.
>=20
> In order to modify the runstates of the correct vcpus when switching
> schedule units merge sched_unit_runstate_change() into
> sched_switch_units() and loop over the affected physical cpus instead
> of the unit's vcpus. This in turn requires an access function to the
> current variable of other cpus.
>=20
> Today context_saved() is called in case previous and next vcpus
> differ
> when doing a context switch. With an idle vcpu being capable to be a
> substitute for an offline vcpu this is problematic when switching to
> an idle scheduling unit. An idle previous vcpu leaves us in doubt
> which
> schedule unit was active previously, so save the previous unit
> pointer
> in the per-schedule resource area. If it is NULL the unit has not
> changed and we don't have to set the previous unit to be not running.
>=20
> When running an idle vcpu in a non-idle scheduling unit use a
> specific
> guest idle loop not performing any non-softirq tasklets and
> livepatching in order to avoid populating the cpu caches with memory
> used by other domains (as far as possible). Softirqs are considered
> to
> be save.
>=20
> In order to avoid livepatching when going to guest idle another
> variant of reset_stack_and_jump() not calling
> check_for_livepatch_work
> is needed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> RFC V2:
> - new patch (Andrew Cooper)
>=20
> V1:
> - use urgent_count to select correct idle routine (Jan Beulich)
>=20
> V2:
> - set vcpu->is_running in context_saved()
> - introduce reset_stack_and_jump_nolp() (Jan Beulich)
> - readd scrubbing (Jan Beulich, Andrew Cooper)
> - get_cpu_current() _NOT_ moved to include/asm-x86/current.h as the
>   needed reference of stack_base[] results in a #include hell
>=20
> V3:
> - split context_saved() into unit_context_saved() and
> vcpu_context_saved()
>=20
> V4:
> - rename sd -> sr (Jan Beulich)
> - use unsigned int for cpu (Jan Beulich)
> - add comment in sched_context_switch() (Jan Beulich)
> - add comment before definition of get_cpu_current() (Jan Beulich)
>=20
> V5:
> - add comment (Dario Faggioli)
>
Saw it, and it's great.

Thanks for doing this!

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-KSS1l4WVUSh0m84+MGXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2RrpAACgkQFkJ4iaW4
c+6r6A//V9nP/o5NiayTjzkNotUDLVU4aEARAvgS6MSmjwWfhwOZqQSSItLj/ukV
8XIHwzDkS+9OHCl0KrqmVo4196eVrXBtBCDvoZFYbAV4XMmSZpEeEE7OpOtJTPV0
xMIlW7+pTrWXdSFDvHcxkE4mYDT9nNTkhYXhF67RLB58/oyINKcraZyqpKEsXssp
JGU0MFOrT4901fpB5ZJ43xtklnWQTS/TvjMmYbV0jL5aVo5WU5AFWWVicD4kqLKt
iXM8oV+QevyqPPJjdc6SPsoSuSnDNhO7awBdMtvODFE1gBOiUWY6poLAX2i8LpDU
YxGugeJbD1oYhj2UKthrleOkr0tlAU2mQTys730F7OIfqPQQa0azC9wS9Ot+Kt3Q
KZPlnFxJUAxV3Xqbt4lLPkTlfZfoogDc5gu2Vm9gKQ1Ao4tIFccvnoqvpzZqLSpj
X3njh4WyInXDLLsilYi1lJUSac8R05II2zrgS66MfN8gZpWh4q0ofmg+ZRFqGZ9j
mACKMHlseLuKXAdUHafxwh/9lANDGpkC4rU9LTLQkvvHNAzu4u091nTZogAt82Tm
qAFrklNt0sWzA9qUU1GTkVgbHCE+ijz2TzRxVAcw0h6PCyrNfCaR7tVgxYALbvMY
kloM3JyDR504Bd6TebmW7+KFVNke+ZS9IGhhVYkgAPbD9GGOBTY=
=45ks
-----END PGP SIGNATURE-----

--=-KSS1l4WVUSh0m84+MGXb--


--===============8533737891135248828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8533737891135248828==--

