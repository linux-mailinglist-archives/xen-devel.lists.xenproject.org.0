Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38255716AC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:59:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpsSs-0002An-P1; Tue, 23 Jul 2019 10:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+BnY=VU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hpsSq-0002Ai-FB
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:56:12 +0000
X-Inumbo-ID: 77dfa8ac-ad38-11e9-a515-eb8009f41bdf
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77dfa8ac-ad38-11e9-a515-eb8009f41bdf;
 Tue, 23 Jul 2019 10:56:07 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 10:52:08 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 10:55:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 10:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FplzYCQ/s6eHy/mZu/yXSe8WwcSroTLSIEEEta/BAa1uXMbGM75y1LmqhH2AWmy7Mrf7+zRAacZTrP4Qg61PAjPY3WJqzVlpphy/wI5qv2FnJtTa8WWReud5gQNkHtY5w00fRAWBBKddacfjzcyWvrIg6y5fJAhJhTmRiqcOPFa6cmKDeOxGwRd/pDW0cKjYGCHj6glTz60FNcYZGENRiru4vTgBdausR0xIaJiaufLzMra9GniIZ78tfnP5QqxoEDIWXT0LfnR/ZpQxkUQTUN1DAdKcxnwq0kWv+N1wnsIYwxF4nzRyNlVyb3dkb2nLGo+vkN4R9DizSqGPacvyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx0WALFJinnQjwALv6mW8GhJdP30hiH2EsMgcKySE9M=;
 b=JFGAJpx98qr0QDcHZmheh/X3aWEAXPLLRZVAIsMPfb66SUCPc8ASOBDp/5nR6gw93FTEjEsRG95zBSx4blEau+EqQPSg4ImFCU6MRTYpUa5oUCIFolX58b20azXEnmnn41sLrjTsCY6rl0dXZaFk8BR6R0Db9EIjnIKMp4S23GFQWUcLn5hCOes2ijhYl5eBdc64ATMsJ9SxhscsMlSCgN23al/l1k6wHVORy333iqlYbhFH+nzDzKpIHe4jvRD5oKBkw1FSpszxCqTlo7oI4ndGOcX2Tz3kB8DwhCJ1pHYyxuTfp+ULAc4n542x/YynfXTefhGWfCLCrYrEnEjRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1371.namprd18.prod.outlook.com (10.175.223.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 10:55:06 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::e9ac:eb60:5b04:1a0a]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::e9ac:eb60:5b04:1a0a%9]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 10:55:06 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
Thread-Index: AQHVQTf/MGmpfTe/mkGfuwtT8z8+kabYB7oA
Date: Tue, 23 Jul 2019 10:55:06 +0000
Message-ID: <1ac7ab78ac10bf3aac6ba468a40536e3969378bc.camel@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-2-jgross@suse.com>
In-Reply-To: <20190723092056.15045-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68c0552a-6d1b-4b1d-9287-08d70f5c3906
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1371; 
x-ms-traffictypediagnostic: DM5PR18MB1371:
x-microsoft-antispam-prvs: <DM5PR18MB137113CBE0EC647797F1DAD0C5C70@DM5PR18MB1371.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(199004)(189003)(3846002)(8676002)(966005)(110136005)(316002)(86362001)(6512007)(4326008)(5660300002)(53936002)(256004)(66556008)(305945005)(6246003)(66476007)(66616009)(66446008)(53376002)(64756008)(53366004)(36756003)(6116002)(91956017)(6306002)(25786009)(76116006)(66946007)(68736007)(7736002)(6486002)(81156014)(81166006)(2906002)(99286004)(2501003)(486006)(11346002)(99936001)(2616005)(76176011)(476003)(8936002)(71190400001)(71200400001)(66066001)(186003)(118296001)(6436002)(4744005)(6506007)(446003)(229853002)(478600001)(14454004)(14444005)(102836004)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1371;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z8F2NInu4ZrWydZ4q3kOwC5cA4ByFxYXPhO1HwMMPOyBFhMhB4tM9/GcK7CfyySdCUAGCeMlh9Du1ydpw8EnT7i1OOt7/XLzlvc6riUzpyUnGoR3jyYng2lx822X3C8EkmFXiK/WSkLNCecO31056gDys5ZsWd5xXCzOpr2GdVKDCLPtqFx7q1ZLLNI9IJx5dhcLllX8chMLEsZH2ceq/NGVGHO3QCKTbV+eCpn6Jaj8h5nae0X8YWpG6AFujpBvHT6WtMw0buHVYvShCGvMRft1jk7+wA00VXPOiWjOPzaJ/WoXZbMKyAJWUTctrltRzOksNvn5ujMqjAKAg7AFzVEZFhLXYGjuTRlg17HSQG9mTQ8vmn8DDR0eeDE+lw5EjP/GPArVClYpyk3flm0LAnhVErQE3S1wIQ5x9BQmfYE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c0552a-6d1b-4b1d-9287-08d70f5c3906
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 10:55:06.3633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1371
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2796990710908565547=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2796990710908565547==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-pWN2DyKiFHjG9bAnpZL3"

--=-pWN2DyKiFHjG9bAnpZL3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-23 at 11:20 +0200, Juergen Gross wrote:
> Commit 0763cd2687897b55e7 ("xen/sched: don't disable scheduler on
> cpus
> during suspend") removed a lock in restore_vcpu_affinity() which
> needs
> to stay: cpumask_scratch_cpu() must be protected by the scheduler
> lock.=20
>
And indeed I recall the thing looked weird, and bringing it up... but
then I also managed to convince myself that it wasn't a problem, which
apparently is. :-(

Sorry for having overlooked that.

> restore_vcpu_affinity() is being called by thaw_domains(), so
> with multiple domains in the system another domain might already be
> running and the scheduler might make use of cpumask_scratch_cpu()
> already.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-pWN2DyKiFHjG9bAnpZL3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0254gACgkQFkJ4iaW4
c+4WqRAAnT1/pomPsGN1HMBT08zpME0gqVAB+q+6TbkBAsZTuO+GW6KtKnlRcWx7
cRdTR1U+sjzYHVVtWyhpFMv//DrcNUJOhOIoFdCNibQLuWSRwMw/2zv/f9xl+Upg
WAGSKiNt32xEwsF32PTubfLcODMPTltXMx/XhKxZeU0cJC66+r8L+pao06NHbGxW
Lo1jqBr1lAn5OquPVYn8yvm+C6zByCzLCLWJYhB3BttsYJENf5+O4r9bD00yPsy8
Zj+NX9iGLW+cI84oEHgoCyGOLMK+jv4OaRNS1l84oaQJCy2dvSWqp2xj8qC5V+g4
KAUNR5+HalzVbSNUfCDjZM+3qNAWt7/8NRbvr71PkP9yWqV1M2LaKLZHOtbpNVch
mYFewNDrZk4mYMZOiFPQ7n18bung3ozev6CQvUyRC6QtGMgNjH+uTS9AK4ei+Cte
aUt76TH1Nk8t2ykgEEneQeJcyD48vH0CPTfflHcve5jlqxr/sBGQTVL4RHbJTRrP
7uMmUD5BFMtL1KdS8ORMXLted+jQ+HtV1teF7n1Abt3vLgXfJF8+sF+OQC9XOBnJ
slCpOFpmymIcRtFcoFkO/ruRs4aEB4nvJt4aBWwDDizyRXEjhMfaYF3+T9PrGbKE
ptAyc6LfQxh6OKSzKOGKoKEtlQfVDhvW+RDnnkp6uEGIKfnkpww=
=aB1M
-----END PGP SIGNATURE-----

--=-pWN2DyKiFHjG9bAnpZL3--


--===============2796990710908565547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2796990710908565547==--

