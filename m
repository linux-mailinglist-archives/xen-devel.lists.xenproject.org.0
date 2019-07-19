Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC66E9D2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:07:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWJZ-0006OD-1f; Fri, 19 Jul 2019 17:05:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoWJX-0006O7-A6
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:04:59 +0000
X-Inumbo-ID: 4e9748a8-aa47-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e9748a8-aa47-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 17:04:57 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 17:04:44 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 17:04:44 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 17:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nodoBJs43E8ijfdpHWgqPKV8n/x7kSZrPzMW9KoKaxMG82cLsbYrbv51zkNcGpDgeiLjQEID8vVgjHJmaRrN5me/7Rb7NtMk0pQgy2N/t2HetyhPatYiXv7RW+xUqXvLQysRysnisEQ/zT3x2OZ8y7WD7YfZwO0S34zukXSne/xzYYbCdkTBCvpxrRRm1aee9BOHV8lg6w2H7dzHKG54sufPmxBVFxn33faYGBcFxiB/9Fq+bsBzMIRZ8ocs6lmRuNll57xU2uA/RHSbMV31CnQInCFC7iva1RvHJc85s9TQ25Z11Pwewmn5Bo9+QFq7NGWOwDFNVgkL1YEASWAo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPeKIcVJqoLnvmImWG4QlpxVZ4SbkXLWk33fSE10SO8=;
 b=TRiIVXnekwl/G3zCx4UiTlSyJT3G0FY9SYMOeMrHbqyvwLYIRxyqur36vxtdoF1ly9NPdle2wJ4KYz54V7JCqoYejeDHFjUy+d/2wV/iquvyNq6FiDYHgXkL+ca9ZkMXt4lPe4VWSYSiU2nGh2pxgnLGIbxNIZ1tBdx668mA/tKqA820SjRIObo9MUrJlSZw4Fcg8HVQ1twjDtNxgGLOABq4r9HToMH4V7Q8S7a44XcsRCBm/ctCQjUzDUtOpWjZ31nVKV1hF6+WoACxGareeYP1xayvmQPZN6DR4YL+S0W/dp3fvGtijOFzSgwjKIqIE/kfHtEbgXNnUlAsaaMkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2311.namprd18.prod.outlook.com (52.132.208.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Fri, 19 Jul 2019 17:04:43 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 17:04:43 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 05/60] xen/sched: alloc struct sched_unit for
 each vcpu
Thread-Index: AQHVPZI1eSV5JYG3wEiY4OjiJWJE7qbRYaYzgADLUYA=
Date: Fri, 19 Jul 2019 17:04:42 +0000
Message-ID: <2e7e81960c8e4a0007837e4fc235f26b83a82017.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-6-jgross@suse.com>
 <ac36f4026604dcdaf5fb6274e287bd4c2b54720e.camel@suse.com>
 <a269b0ae-e8c7-b772-f43a-afe6ffa08142@suse.com>
In-Reply-To: <a269b0ae-e8c7-b772-f43a-afe6ffa08142@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8a36631-6c2f-4c16-96c4-08d70c6b31e5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2311; 
x-ms-traffictypediagnostic: DM5PR18MB2311:
x-microsoft-antispam-prvs: <DM5PR18MB2311A3769174D2F5C45871F6C5CB0@DM5PR18MB2311.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(446003)(53546011)(66446008)(6506007)(2906002)(81156014)(102836004)(66476007)(86362001)(25786009)(8936002)(76176011)(11346002)(6246003)(68736007)(4326008)(66066001)(81166006)(476003)(2616005)(478600001)(76116006)(486006)(66616009)(71200400001)(64756008)(14454004)(71190400001)(229853002)(36756003)(305945005)(7736002)(6512007)(256004)(6486002)(99936001)(53936002)(6306002)(6436002)(91956017)(5660300002)(53366004)(316002)(53376002)(66556008)(66946007)(54906003)(8676002)(110136005)(118296001)(186003)(26005)(99286004)(2501003)(3846002)(14444005)(966005)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2311;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YqDeg+tbRb5F9HxKmcIwHphlPYgEKNLS9xK3RGDHTHVcxexe+37cHuIS/97BDS3ozbLm5NXuTbgv3G1dwwzhfpT8bbfpT+AO31+af43ckEOyEjIuRvrPc+vYQ2XRYRcA6wi7uDNht9NNjCZj0llI1xvpaOMFCn07VoEKUIrRzJvVVPkMiNc9371B6+MSJ6LHVP/7NPJDMvdu/vD7lh0tEYVMyCIsr37uwwGlCNzbp9ggTfWduo9zFtyHHFhOZghDUbf2v43R2MIbKoXehEhR/iZpxC3/EGO1dsL2Zld/nC53BPsB2i9aJWrYl2Au3pchvin1PRQrYRWaOREYdwdEq/4CrL9TSKlfJyP+/YDb0xfOgXXzLq7xuRfXDRImIpCBBPZWXJq1BRxH1KCT/M+W+RVDpLOb1jKX4Vd2SGoHkSc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a36631-6c2f-4c16-96c4-08d70c6b31e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:04:43.2166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2311
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 05/60] xen/sched: alloc struct sched_unit
 for each vcpu
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
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============6310015023983519800=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6310015023983519800==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-Ylj7VvAbc3hOyKWDvOcP"

--=-Ylj7VvAbc3hOyKWDvOcP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-19 at 06:56 +0200, Juergen Gross wrote:
> On 18.07.19 19:57, Dario Faggioli wrote:
> > On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> > >=20
> > However, I don't see much value in not doing what's done here in
> > patch
> > 4 already (it's pretty much only line changed by patch 4 that are
> > being
> > changed again here).
> >=20
> > Is there a particular reason you think it's important to keep these
> > two
> > patches separated?
>=20
> Not important, but I thought it would make it more clear.
>=20
> If you like it better I can merge the two patches.
>=20
Yes, I'd prefer them merged.

> > Ah, my comment about 'unit' --> 'su' --in case you think it's
> > feasible-
> > - applies to struct members as well, of course, e.g., here:
> >=20
> I have to disagree here: this is no scheduler private structure, so I
> believe the struct member names should be descriptive. I guess this
> is
> the reason why there are many more struct members named "vcpu" than
> "v".
>=20
Well, ditto in my last reply to patch 4. And in fact, in scheduling
code, the preference was for 'v'.

But again, let's settle on 'unit', on the basis that the amount of work
necessary to change this is, again, not worth it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Ylj7VvAbc3hOyKWDvOcP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0x+CkACgkQFkJ4iaW4
c+6OuxAAnBj5pK2aEOYhexNLnIEZH0qLwafNEOdNCr5fhF8leguDZWDpaPfnesDE
UFQPpIkzdUEB3qCosEYl+go+uBCI4H9jh79lWtifrtQfOrj70WH4uXLYg5M2QS8X
5wTxQo/i2N4a6bo3pG5krnF1jUvoJHL1ClLbhWouWL+BlwR4Mt7JfFf53otwq881
QvuqEScKRZjuLp72CUx6aoONpwOPDo6k7SYBSLkZcvZRnU86xCziGorj7DBc0trd
VSqSKp8NmJf7Nn+yhHVxVVeaAn7nL5pWNwpRCop8xdKXL39ll4NytSk2FxKVkDU4
5K+W5W/T8C+JOv5dpjCt0eN/IVcizXc4IrIZGxqDkxy6rFxnyyt9FOrcEqpYfNka
opSacth4K2YL02HhtEjI3j9vaBXMHoKTI6vJKZL43BEqMVHY5LOwf2eX35f6nRIC
zBHVhoF38la3kRZze/2WtHIKd/UHg/Ub0xJb8bs44BX6Qtt7p4fOqIWo1NfO+BFW
LHVdKAkaxr2WccbDlSmyOn1FYXGqtyu1eH44FNyqPMYj3dPNRxvuyPwVkhLZSWC2
3IG23Hz9HKq7/f/JKLjQZCcZFkyz+xUZvNQ9snoj3Ppsq/aSIGEg1UB2ByU/nCgT
8YMLTKbH/uJauPAoWhZ3kxzJE/pdCLn9cjBEzz+9I9BrnG7DSDo=
=mRTK
-----END PGP SIGNATURE-----

--=-Ylj7VvAbc3hOyKWDvOcP--


--===============6310015023983519800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6310015023983519800==--

