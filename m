Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1053B587DDC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 16:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379370.612773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsVT-0003jo-Mn; Tue, 02 Aug 2022 14:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379370.612773; Tue, 02 Aug 2022 14:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsVT-0003hv-JH; Tue, 02 Aug 2022 14:04:23 +0000
Received: by outflank-mailman (input) for mailman id 379370;
 Tue, 02 Aug 2022 14:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MHYI=YG=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oIsVR-0003hp-W3
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 14:04:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140081.outbound.protection.outlook.com [40.107.14.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 010506c5-126c-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 16:04:20 +0200 (CEST)
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AM6PR04MB5221.eurprd04.prod.outlook.com (2603:10a6:20b:12::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 14:04:18 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:04:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 010506c5-126c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+7dYsH6ZnoK9dVaiGkRgXQ9/i7AmajREfCNHIk4Btzh9Rp/kIEsriGhT3cItjjG9gyNRoM9TR9DSfu4M5Y7LIQdjvDu0uadxnx5GdvHvDC1FFai+vwlSFBL+MUx4mP2DginANZnTpaJhZFSpKgGFSuJx+HCXy7myuGFytjCeUQ4mOwv5yXB9CYMoFCqu9uVKp8iFMTFMF8Qp06d2/IIpmwj4+IuKDXZXYBeGRXEVi+5yepYBVTH8bgVFKMKJTGc+C1iKKCbDHogOUxal/lk3K8QtEKp6QkDLMUk6V/I6iKs03XDtQgwVk5LARGhaqXsWib5ueV9bYC59YOCXrS05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1tQojc/GgCv9u0soD02QlyxfjifW7FC0uiOLYKzSYw=;
 b=jYa0PGIOz4OpIbEryNbL8UTV6vMYnI/qh5GbsHc4YEZNakFeXBPYUbzNv+yoqsxqvee63CaQhr4EhvQBMBjS57+cMjvinbi22+kADpiVEkJ1ZnR0c+j7LNqvXnsNJO++wsiiUL5M5gv15/fLnWhMSgitOkWE069w4+kXym9E47VvvC8iXQlcYc54z0sobGOvqew/H8rJiQ1QC4b52vfVXNd2Ple2PIL4BJS1bvFLvTmUnrnkqVcQ+Ce7HN/GQl/UM1bkv1PgzlkQNPeXyBuwB6PQiHzTBcM95f8peDuzz6MsYxiPoUBHmCzWRtgB5s0kG/KyhtBWLIeJKB70AyZtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1tQojc/GgCv9u0soD02QlyxfjifW7FC0uiOLYKzSYw=;
 b=1ub8dHYnEc3blvD7N47ypIqsFioH9w0FoxAV82w5Y82LeDQTQjFgiFoeGGZ5l0Rh3MyIWvAADxe3dd2vhNhfpyYA0tSYiZmMRMLoV0w94I2siEN9eEIAE0+IIeyabbaq0WldguHrykONhzA88qKXwuINeRfcL21WtwKdgwtC1qUPTWTsDHMIpBDl4p/f4YaL90+4mmgRAimy18zDoKmZdKmipq6f56TmSREjx8iwn7CrQTGl6LdL2P92Obhrr0ffAC+CR681fZoPQ4Xk7QeezUcokrEm8qfM3IBbCxbxsIxd1u58PrT+ay1MB9YIbaizfZTcvHlh+5XWsqZ88xA1RQ==
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "ohering@suse.de" <ohering@suse.de>, Jan Beulich <jbeulich@suse.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/2] xen/sched: setup dom0 vCPUs affinity only once
Thread-Topic: [PATCH 2/2] xen/sched: setup dom0 vCPUs affinity only once
Thread-Index: AQHYpnjBGyfMkjShG028ZFr2xfuNOw==
Date: Tue, 2 Aug 2022 14:04:17 +0000
Message-ID: <88e1b0683d802ea1c44e92f072901fd3166397e5.camel@suse.com>
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
	 <165944829637.3531.11115034950872470305.stgit@tumbleweed.Wayrath>
In-Reply-To: <165944829637.3531.11115034950872470305.stgit@tumbleweed.Wayrath>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68cb1ec0-8c20-4292-c543-08da748fe3fa
x-ms-traffictypediagnostic: AM6PR04MB5221:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 52RzrK02eEYB06ETYowgmZ6EpIV2YmEO/TLpooFi0ruuJZi1fMvNtRcIrn402AkYFGBKAD0YhxK5HHPuQ0W5QugG8c0wMoS559Xk+5gcAnNgrB8rEPULH4QUCTSHGrMgcWugT+hiiDFDKnml7y7iSYJix6Wd2KTzHS3/2LwlmvsAVDqldQInc4/jZuYaPTqyuFKBkSwxX3m2G5hFX5REYuuaMHlWXgWRnILb8cgMippdDYLzwKr3sFFCM5CtyUK7en6O4aqo88hvnPM5CGVD0ky1pjGE3NCQhYFLQ867v6L7bCmJXiIG0v+WfIQXeiBqvdiSgB6HodGc5A4C23DoAnt1W2X6NTFfJDBK9K+Ulu3eOc/k9jWNlYivDp9ek/nglKxUiVO2XCR6wCGXA/6LheJvueLZ1ASKjQjdS1ta3xuDYC4f6GUGg2UyOzONNeQWcl2pqH0xngQaRYf2KkOS+KOgA3m0ZVCt0c5oSte3p+ulgTuCs9sRT9GO8IhVwVQzqr/FKkgBbQpBn0uSkqrtVH2GDalAavdn1hgUNPsZHYxJNi1NAa2piZGiY42sCG/00FQ8I2w2NzAK4o29vPDqUz9N7Cl0nZ7cuJmidxkslLWlW8TcNukOJTAHutP4CtMC4S9I+unkP3upddjupIptgPtIdeASwnI9vCTKgOpWeYFnfld7b6lQB4bz3f3ukikR/k2QgE/ZXL3PRtrTW8Nm/5tH+ZILHJJIVW79b0HGz/ZNKaURI0JomYR/DvdYVxumwb8SvPDu12jUv3MclPcdriDFhoBCq+Ly5sqU2kmaAsZDszTlgT6onw3jVyUb6OWupmY3hFZEzWJlNRBSaYhdf3xJB2o7lhO5pXwug4Wa5J9cujoFoAMsMnTgowuqxcor
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(39860400002)(396003)(376002)(38100700002)(8676002)(66946007)(91956017)(76116006)(122000001)(5660300002)(66446008)(54906003)(316002)(86362001)(64756008)(66556008)(66476007)(6916009)(38070700005)(99936003)(8936002)(4326008)(6506007)(83380400001)(41300700001)(186003)(2616005)(6512007)(26005)(966005)(6486002)(478600001)(71200400001)(2906002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmU5dTJHR0VWa08wK0wxNFlFR05DaEQ0a3AzeG5qV3lRZ1hhOGxieTRVOTZU?=
 =?utf-8?B?ZCtFOUl3aHA1Skk3YTVrcnRHRy9RVjJWb0RTOHhWRVJyRnFvMmVOVzZhSXE4?=
 =?utf-8?B?ZUJiS1BjVGwvYXdEU3lQREtyL2REbWlTaEhTdUdlcTNYSmVxeHFRQVFsK2pC?=
 =?utf-8?B?UUxsZ3YrK1hMZTJHN2szblBkNHZVdGJ1NFdFeVBWaHJITmhnVlhITSsweDMz?=
 =?utf-8?B?U2NNVnBickpTSzRGSHcwUEdvTGdLRElCSW1nV2RQcSt3eHczQytWWk9XRng1?=
 =?utf-8?B?dlBsOGFoRTBSQ2dwQWVoeXJsbHJ2NTd2N25PeEZaYUlsdm1NNXgyakxjbVgv?=
 =?utf-8?B?a0RHNVA2OFQyQ1E1N0lSaUpDR3RoSnVVYTZHVmRReDFVZC9meWlFNlJFZ0RP?=
 =?utf-8?B?RmhVMUJHTFhSS1I5TkN5REk1a0NFSWgvRGNOYmo5b2FQMVJ1NnR2Y1NiNHQw?=
 =?utf-8?B?UzR5U29keEhkdGZwNG9ma3d1VXR5WGZjeE5iWGEydUFUMVlYd0hIbTk5dmRD?=
 =?utf-8?B?YW9vNFNvZEpCa2Nhb1VHUEtzWHJ4MzVkbEZNY0hwOWxuMlhqQU9Rc2MySCtl?=
 =?utf-8?B?QkJJR0lHRnFURUhPeVh3RFVxd0V6c2xqWVcvRFZnRElCb1JmTm1iVmE1UHJO?=
 =?utf-8?B?ZHhEVDl5bTBVVnZoakdrV1FENFFjUUhFKzhmYWFlY3ltZy9pZFhpQm4wNzFQ?=
 =?utf-8?B?b0taaG5JVTBacmJrbVpVbUhYZ3pkbEpxaDBUeHR3eHllbCtlMHk1Z3lxY01m?=
 =?utf-8?B?MFhaRE5tL3JJVU91amRWVU0zU3B1VVFPMlg1ZHBwZC9tT01NZ3Y4K2tsTHEx?=
 =?utf-8?B?bEQwRFJqUU9kZTFGUWpkVUlvekpjOHVWR3dWeVNITEtLaktoSkV5QWRHaXBu?=
 =?utf-8?B?V3hKeXJPcitBTGdrVTljRzlVMERHVGwzWWVFdVZLcEN6REh0amlOL042bTJa?=
 =?utf-8?B?a1JhcDU1WkVtRFFWak1kOUowaTlnb3lRbCtzQkFMRFA0MVJCQ0pMZ1J2d0Va?=
 =?utf-8?B?bHJGYjZJaHFyUS9TRkNRQnlqVHBOdWdFV2w4eVFncGd4aUl2Y3U0d2g4Y2oy?=
 =?utf-8?B?b1VEN2o0aEtINVlIQ0xxc2dGY2J6dlFNUWRvSzJCYVhLNzFvM3FSNy9yWXBI?=
 =?utf-8?B?RmlFZEw5TXJIVHZ6S0F1UGRnSWdIVUdzLytwNWFhN0VTTWRsbDFmZDdpMzVo?=
 =?utf-8?B?YzI5U2ovSmNWQTFXaWRRdHEwVFp4cThMY1M1S0ZDcitGcDBISEcyVTBZcEkr?=
 =?utf-8?B?ZkRZNHBtWHJ0OUc0UEs0REZwRktkUE1ZZ0tlQzY2Qjdna04vNm95SkRSWXZr?=
 =?utf-8?B?SGt0ZzQ5K0o1ZVdDTWNadmRhTzByUTFSRi9pZTJIcDB2RDFvekJ3UWQzMnZ1?=
 =?utf-8?B?MEJyRjdnZ3FPR3lDWnVkaEdvdWVMbm5MMkJoNXg5U2ZCSzRHZnpzMnhSYmhl?=
 =?utf-8?B?ek5GczM0TENaTDFwVi9UdXgydEc4ZStFOXNxbGRDbC8zNTVDTVJZM2MxNjRF?=
 =?utf-8?B?WXJTaG1saERJaEtuY01LcjA2YXVDSjM4U1EyZDZZOHUwYWJtMFdRaHN6cmly?=
 =?utf-8?B?b3ZXa3gzYmdXRmxKMDFFN1dhNFFvNUtQeHJTSEpSRWpyVHdTSGtWdVNpZkFP?=
 =?utf-8?B?b0dYSlZVNWFBMnFyNitRR3hqMXRCWXJic2hrd25NRHRNbURzcjBTMDMyaE1o?=
 =?utf-8?B?RDZqSXlLdXdKOHBHQWlSVE1CeWYzSG04MW9PN0E3SGJXamFrbXB5djI0SVAx?=
 =?utf-8?B?TUQ3Y2czRnpQN0hpRjllbWhOZGhSNHBtU2Z1bHp3V2VybTRIT1JzMmk2eDVn?=
 =?utf-8?B?cHRnT0tYODRYVTUxQmoyWE94L0ttVUNFa3RDakhKeHdIWllYeGNzNVBYRGFl?=
 =?utf-8?B?NDhkUFNQYS9wREd5djVPdEVXdW9qWXdESVpqNnBGM3BORHpuSWZwMHRGb3g1?=
 =?utf-8?B?RXNRUTQxZjhzTHBVSXExWStzbDRISVRUTW0zVHhKSXBHcUk3cThiWW5lcjNI?=
 =?utf-8?B?dm9VeC9kbEVFVWZnb3VIYkNaZkk3dHovWDViN1ovUVBQSHB6dThDemExQlg4?=
 =?utf-8?B?SFYyUmM5M3JqcFBsSm1PR3NPSVJIM3VwYkkzOGErYmZpUUZPY2E3VThrdFkr?=
 =?utf-8?Q?hfqfH9MB85k3ZsxDOwhzq/XkS?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RLW+QMWkQgjRlSGOIFYG"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cb1ec0-8c20-4292-c543-08da748fe3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 14:04:17.9729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCTrHDl0twk/gxJg0CWRzc7SPXPRg3zgOKOEL5YHWaLVplGCG5UNm/pG3mT3g8M/Bk7lHRFb6qbG2clWkVNY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5221

--=-RLW+QMWkQgjRlSGOIFYG
Content-Type: multipart/mixed; boundary="=-gk/MoBJLhx61BrwZiEgB"

--=-gk/MoBJLhx61BrwZiEgB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mmm... this patch has a few hard-tabs in it! Apologies for that. :-/

I'm attaching a version without them, but I surely can resubmit the
series with this fixed, it that's easier.

Regards, and Sorry again

On Tue, 2022-08-02 at 15:51 +0200, Dario Faggioli wrote:
> Right now, affinity for dom0 vCPUs is setup in two steps. This is a
> problem as, at least in Credit2, unit_insert() sees and uses the
> "intermediate" affinity, and place the vCPUs on CPUs where they
> cannot
> be run. And this in turn results in boot hangs, if the "dom0_nodes"
> parameter is used.
>=20
> Fix this by setting up the affinity properly once and for all, in
> sched_init_vcpu() called by create_vcpu().
>=20
> Note that, unless a soft-affinity is explicitly specified for dom0
> (by
> using the relaxed mode of "dom0_nodes") we set it to the default,
> which
> is all CPUs, instead of computing it basing on hard affinity (if
> any).
> This is because hard and soft affinity should be considered as
> independent user controlled properties. In fact, if we dor derive
> dom0's
> soft-affinity from its boot-time hard-affinity, such computed value
> will
> continue to be used even if later the user changes the hard-affinity.
> And this could result in the vCPUs behaving differently than what the
> user wanted and expects.
>=20
> Fixes: dafd936ddd ("Make credit2 the default scheduler")
> Reported-by: Olaf Hering <ohering@suse.de>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> ---
> Changes from "RFC" [1]:
> - Moved handling of the shim case
> - Added some more explanation (in particular, about why we stick to
> all
> =C2=A0 CPUs for the soft affinity) in both commit message and comment
> - Remove spurious (and non-necessary) credit2 change
>=20
> [1]
> https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c506=
6.camel@suse.com/
> ---
> =C2=A0xen/common/sched/core.c |=C2=A0=C2=A0 63 ++++++++++++++++++++++++++=
+++--------
> ----------
> =C2=A01 file changed, 39 insertions(+), 24 deletions(-)
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 379a791d62..0585c643a5 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -571,12 +571,46 @@ int sched_init_vcpu(struct vcpu *v)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize affinity settings. The idler, and =
potentially
> -=C2=A0=C2=A0=C2=A0=C2=A0 * domain-0 VCPUs, are pinned onto their respect=
ive physical
> CPUs.
> -=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0 if ( is_idle_domain(d) || (is_control_domain(d) &&
> opt_dom0_vcpus_pin) )
> +=C2=A0=C2=A0=C2=A0 if ( is_idle_domain(d) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Idle vCPUs are always pinn=
ed onto their respective pCPUs
> */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit, cpum=
ask_of(processor),
> &cpumask_all);
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 else if ( pv_shim && v->vcpu_id =3D=3D 0 )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * PV-shim: vcpus are pi=
nned 1:1. Initially only 1 cpu is
> online,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * others will be dealt =
with when onlining them. This avoids
> pinning
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * a vcpu to a not yet o=
nline cpu here.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit, cpum=
ask_of(0), cpumask_of(0));
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 else if ( is_control_domain(d) && opt_dom0_vcpus_pin =
)
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If dom0_vcpus_pin is =
specified, dom0 vCPUs are pinned 1:1
> to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * their respective pCPU=
s too.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit,=
 cpumask_of(processor),
> &cpumask_all);
> +=C2=A0=C2=A0=C2=A0 }
> +#ifdef CONFIG_X86
> +=C2=A0=C2=A0=C2=A0 else if ( is_control_domain(d) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * In absence of dom0_vc=
pus_pin instead, the hard and soft
> affinity of
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * dom0 is controlled by=
 the (x86 only) dom0_nodes
> parameter. At this
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * point it has been par=
sed and decoded into the dom0_cpus
> mask.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that we always honor w=
hat user explicitly requested,
> for both
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * hard and soft affinity, wit=
hout doing any dynamic
> computation of
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * either of them.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dom0_affinity_relaxed )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_set_affinity(unit, &dom0_cpus, &cpumask_all);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_set_affinity(unit, &cpumask_all, &dom0_cpus);
> +=C2=A0=C2=A0=C2=A0 }
> +#endif
> =C2=A0=C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit,=
 &cpumask_all, &cpumask_all);
> =C2=A0
> @@ -3402,29 +3436,10 @@ void wait(void)
> =C2=A0void __init sched_setup_dom0_vcpus(struct domain *d)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
> -=C2=A0=C2=A0=C2=A0 struct sched_unit *unit;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 1; i < d->max_vcpus; i++ )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_create(d, i);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0=C2=A0 * PV-shim: vcpus are pinned 1:1.
> -=C2=A0=C2=A0=C2=A0=C2=A0 * Initially only 1 cpu is online, others will b=
e dealt with
> when
> -=C2=A0=C2=A0=C2=A0=C2=A0 * onlining them. This avoids pinning a vcpu to =
a not yet online
> cpu here.
> -=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0 if ( pv_shim )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(d->vcpu[0]=
->sched_unit,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cpumask_of(0), cpumask_of(0));
> -=C2=A0=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit ( d, unit=
 )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( =
!opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit, &dom0_cpus, NULL);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_set_affinity(unit, NULL, &dom0_cpus);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0 }
> -
> =C2=A0=C2=A0=C2=A0=C2=A0 domain_update_node_affinity(d);
> =C2=A0}
> =C2=A0#endif
>=20
>=20
>=20

--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-gk/MoBJLhx61BrwZiEgB
Content-Disposition: attachment;
	filename="0002-xen-sched-setup-dom0-vCPUs-affinity-only-once.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0002-xen-sched-setup-dom0-vCPUs-affinity-only-once.patch";
	charset="UTF-8"

RnJvbSA1MmZkMmIxOGY2YTM5NmY1NmUxZjcwZjg0MjM2MGM5YThkYWE3ZWY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgpE
YXRlOiBXZWQsIDI3IEFwciAyMDIyIDEzOjIxOjMwICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IHhlbi9zY2hlZDogc2V0dXAgZG9tMCB2Q1BVcyBhZmZpbml0eSBvbmx5IG9uY2UKClJpZ2h0IG5v
dywgYWZmaW5pdHkgZm9yIGRvbTAgdkNQVXMgaXMgc2V0dXAgaW4gdHdvIHN0ZXBzLiBUaGlzIGlz
IGEKcHJvYmxlbSBhcywgYXQgbGVhc3QgaW4gQ3JlZGl0MiwgdW5pdF9pbnNlcnQoKSBzZWVzIGFu
ZCB1c2VzIHRoZQoiaW50ZXJtZWRpYXRlIiBhZmZpbml0eSwgYW5kIHBsYWNlIHRoZSB2Q1BVcyBv
biBDUFVzIHdoZXJlIHRoZXkgY2Fubm90CmJlIHJ1bi4gQW5kIHRoaXMgaW4gdHVybiByZXN1bHRz
IGluIGJvb3QgaGFuZ3MsIGlmIHRoZSAiZG9tMF9ub2RlcyIKcGFyYW1ldGVyIGlzIHVzZWQuCgpG
aXggdGhpcyBieSBzZXR0aW5nIHVwIHRoZSBhZmZpbml0eSBwcm9wZXJseSBvbmNlIGFuZCBmb3Ig
YWxsLCBpbgpzY2hlZF9pbml0X3ZjcHUoKSBjYWxsZWQgYnkgY3JlYXRlX3ZjcHUoKS4KCk5vdGUg
dGhhdCwgdW5sZXNzIGEgc29mdC1hZmZpbml0eSBpcyBleHBsaWNpdGx5IHNwZWNpZmllZCBmb3Ig
ZG9tMCAoYnkKdXNpbmcgdGhlIHJlbGF4ZWQgbW9kZSBvZiAiZG9tMF9ub2RlcyIpIHdlIHNldCBp
dCB0byB0aGUgZGVmYXVsdCwgd2hpY2gKaXMgYWxsIENQVXMsIGluc3RlYWQgb2YgY29tcHV0aW5n
IGl0IGJhc2luZyBvbiBoYXJkIGFmZmluaXR5IChpZiBhbnkpLgpUaGlzIGlzIGJlY2F1c2UgaGFy
ZCBhbmQgc29mdCBhZmZpbml0eSBzaG91bGQgYmUgY29uc2lkZXJlZCBhcwppbmRlcGVuZGVudCB1
c2VyIGNvbnRyb2xsZWQgcHJvcGVydGllcy4gSW4gZmFjdCwgaWYgd2UgZG9yIGRlcml2ZSBkb20w
J3MKc29mdC1hZmZpbml0eSBmcm9tIGl0cyBib290LXRpbWUgaGFyZC1hZmZpbml0eSwgc3VjaCBj
b21wdXRlZCB2YWx1ZSB3aWxsCmNvbnRpbnVlIHRvIGJlIHVzZWQgZXZlbiBpZiBsYXRlciB0aGUg
dXNlciBjaGFuZ2VzIHRoZSBoYXJkLWFmZmluaXR5LgpBbmQgdGhpcyBjb3VsZCByZXN1bHQgaW4g
dGhlIHZDUFVzIGJlaGF2aW5nIGRpZmZlcmVudGx5IHRoYW4gd2hhdCB0aGUKdXNlciB3YW50ZWQg
YW5kIGV4cGVjdHMuCgpGaXhlczogZGFmZDkzNmRkZCAoIk1ha2UgY3JlZGl0MiB0aGUgZGVmYXVs
dCBzY2hlZHVsZXIiKQpSZXBvcnRlZC1ieTogT2xhZiBIZXJpbmcgPG9oZXJpbmdAc3VzZS5kZT4K
U2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCkNj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIGZyb20gIlJGQyIgWzFdOgotIE1vdmVk
IGhhbmRsaW5nIG9mIHRoZSBzaGltIGNhc2UKLSBBZGRlZCBzb21lIG1vcmUgZXhwbGFuYXRpb24g
KGluIHBhcnRpY3VsYXIsIGFib3V0IHdoeSB3ZSBzdGljayB0byBhbGwKICBDUFVzIGZvciB0aGUg
c29mdCBhZmZpbml0eSkgaW4gYm90aCBjb21taXQgbWVzc2FnZSBhbmQgY29tbWVudAotIFJlbW92
ZSBzcHVyaW91cyAoYW5kIG5vbi1uZWNlc3NhcnkpIGNyZWRpdDIgY2hhbmdlCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL2UwNjFhNjQ3Y2Q3N2EzNjgzNGUyMDg1YTk2YTA3
Y2FhNzg1YzUwNjYuY2FtZWxAc3VzZS5jb20vCi0tLQogeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMg
fCA2MyArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKaW5kZXggMzc5
YTc5MWQ2Mi4uYjc5YzNkZGE2NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMK
KysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKQEAgLTU3MSwxMiArNTcxLDQ2IEBAIGludCBz
Y2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgIHJldHVybiAxOwogICAgIH0K
IAotICAgIC8qCi0gICAgICogSW5pdGlhbGl6ZSBhZmZpbml0eSBzZXR0aW5ncy4gVGhlIGlkbGVy
LCBhbmQgcG90ZW50aWFsbHkKLSAgICAgKiBkb21haW4tMCBWQ1BVcywgYXJlIHBpbm5lZCBvbnRv
IHRoZWlyIHJlc3BlY3RpdmUgcGh5c2ljYWwgQ1BVcy4KLSAgICAgKi8KLSAgICBpZiAoIGlzX2lk
bGVfZG9tYWluKGQpIHx8IChpc19jb250cm9sX2RvbWFpbihkKSAmJiBvcHRfZG9tMF92Y3B1c19w
aW4pICkKKyAgICBpZiAoIGlzX2lkbGVfZG9tYWluKGQpICkKKyAgICB7CisgICAgICAgIC8qIElk
bGUgdkNQVXMgYXJlIGFsd2F5cyBwaW5uZWQgb250byB0aGVpciByZXNwZWN0aXZlIHBDUFVzICov
CisgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh1bml0LCBjcHVtYXNrX29mKHByb2Nlc3Nvciks
ICZjcHVtYXNrX2FsbCk7CisgICAgfQorICAgIGVsc2UgaWYgKCBwdl9zaGltICYmIHYtPnZjcHVf
aWQgPT0gMCApCisgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBQVi1zaGltOiB2Y3B1cyBh
cmUgcGlubmVkIDE6MS4gSW5pdGlhbGx5IG9ubHkgMSBjcHUgaXMgb25saW5lLAorICAgICAgICAg
KiBvdGhlcnMgd2lsbCBiZSBkZWFsdCB3aXRoIHdoZW4gb25saW5pbmcgdGhlbS4gVGhpcyBhdm9p
ZHMgcGlubmluZworICAgICAgICAgKiBhIHZjcHUgdG8gYSBub3QgeWV0IG9ubGluZSBjcHUgaGVy
ZS4KKyAgICAgICAgICovCisgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh1bml0LCBjcHVtYXNr
X29mKDApLCBjcHVtYXNrX29mKDApKTsKKyAgICB9CisgICAgZWxzZSBpZiAoIGlzX2NvbnRyb2xf
ZG9tYWluKGQpICYmIG9wdF9kb20wX3ZjcHVzX3BpbiApCisgICAgeworICAgICAgICAvKgorICAg
ICAgICAgKiBJZiBkb20wX3ZjcHVzX3BpbiBpcyBzcGVjaWZpZWQsIGRvbTAgdkNQVXMgYXJlIHBp
bm5lZCAxOjEgdG8KKyAgICAgICAgICogdGhlaXIgcmVzcGVjdGl2ZSBwQ1BVcyB0b28uCisgICAg
ICAgICAqLwogICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkodW5pdCwgY3B1bWFza19vZihwcm9j
ZXNzb3IpLCAmY3B1bWFza19hbGwpOworICAgIH0KKyNpZmRlZiBDT05GSUdfWDg2CisgICAgZWxz
ZSBpZiAoIGlzX2NvbnRyb2xfZG9tYWluKGQpICkKKyAgICB7CisgICAgICAgIC8qCisgICAgICAg
ICAqIEluIGFic2VuY2Ugb2YgZG9tMF92Y3B1c19waW4gaW5zdGVhZCwgdGhlIGhhcmQgYW5kIHNv
ZnQgYWZmaW5pdHkgb2YKKyAgICAgICAgICogZG9tMCBpcyBjb250cm9sbGVkIGJ5IHRoZSAoeDg2
IG9ubHkpIGRvbTBfbm9kZXMgcGFyYW1ldGVyLiBBdCB0aGlzCisgICAgICAgICAqIHBvaW50IGl0
IGhhcyBiZWVuIHBhcnNlZCBhbmQgZGVjb2RlZCBpbnRvIHRoZSBkb20wX2NwdXMgbWFzay4KKyAg
ICAgICAgICoKKyAgICAgICAgICogTm90ZSB0aGF0IHdlIGFsd2F5cyBob25vciB3aGF0IHVzZXIg
ZXhwbGljaXRseSByZXF1ZXN0ZWQsIGZvciBib3RoCisgICAgICAgICAqIGhhcmQgYW5kIHNvZnQg
YWZmaW5pdHksIHdpdGhvdXQgZG9pbmcgYW55IGR5bmFtaWMgY29tcHV0YXRpb24gb2YKKyAgICAg
ICAgICogZWl0aGVyIG9mIHRoZW0uCisgICAgICAgICAqLworICAgICAgICBpZiAoICFkb20wX2Fm
ZmluaXR5X3JlbGF4ZWQgKQorICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsICZk
b20wX2NwdXMsICZjcHVtYXNrX2FsbCk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHNjaGVk
X3NldF9hZmZpbml0eSh1bml0LCAmY3B1bWFza19hbGwsICZkb20wX2NwdXMpOworICAgIH0KKyNl
bmRpZgogICAgIGVsc2UKICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsICZjcHVtYXNr
X2FsbCwgJmNwdW1hc2tfYWxsKTsKIApAQCAtMzQwMiwyOSArMzQzNiwxMCBAQCB2b2lkIHdhaXQo
dm9pZCkKIHZvaWQgX19pbml0IHNjaGVkX3NldHVwX2RvbTBfdmNwdXMoc3RydWN0IGRvbWFpbiAq
ZCkKIHsKICAgICB1bnNpZ25lZCBpbnQgaTsKLSAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsK
IAogICAgIGZvciAoIGkgPSAxOyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQogICAgICAgICB2Y3B1
X2NyZWF0ZShkLCBpKTsKIAotICAgIC8qCi0gICAgICogUFYtc2hpbTogdmNwdXMgYXJlIHBpbm5l
ZCAxOjEuCi0gICAgICogSW5pdGlhbGx5IG9ubHkgMSBjcHUgaXMgb25saW5lLCBvdGhlcnMgd2ls
bCBiZSBkZWFsdCB3aXRoIHdoZW4KLSAgICAgKiBvbmxpbmluZyB0aGVtLiBUaGlzIGF2b2lkcyBw
aW5uaW5nIGEgdmNwdSB0byBhIG5vdCB5ZXQgb25saW5lIGNwdSBoZXJlLgotICAgICAqLwotICAg
IGlmICggcHZfc2hpbSApCi0gICAgICAgIHNjaGVkX3NldF9hZmZpbml0eShkLT52Y3B1WzBdLT5z
Y2hlZF91bml0LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1bWFza19vZigwKSwgY3B1
bWFza19vZigwKSk7Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgZm9yX2VhY2hfc2NoZWRfdW5p
dCAoIGQsIHVuaXQgKQotICAgICAgICB7Ci0gICAgICAgICAgICBpZiAoICFvcHRfZG9tMF92Y3B1
c19waW4gJiYgIWRvbTBfYWZmaW5pdHlfcmVsYXhlZCApCi0gICAgICAgICAgICAgICAgc2NoZWRf
c2V0X2FmZmluaXR5KHVuaXQsICZkb20wX2NwdXMsIE5VTEwpOwotICAgICAgICAgICAgc2NoZWRf
c2V0X2FmZmluaXR5KHVuaXQsIE5VTEwsICZkb20wX2NwdXMpOwotICAgICAgICB9Ci0gICAgfQot
CiAgICAgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KGQpOwogfQogI2VuZGlmCi0tIAoyLjM3
LjEKCg==


--=-gk/MoBJLhx61BrwZiEgB--

--=-RLW+QMWkQgjRlSGOIFYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmLpLuEACgkQFkJ4iaW4
c+4CdQ/9FcN9UKUn9MCNBGGzkMbj3Dn+GPiuvO8KzlQ44IRsUFAWrgm+wPp8iS1N
tr0Kej8CBpGfCM07xbkcbsyUC7h6+2SfqvUE8f6RE7VvJeiEB3B0VIylSAranWsO
9HDXy+ocZR1tvLeFFID2CFAquvWWF5MvsLPVcWUHwWySMwwORKPv9cmNZw43hG1f
gq88AWQK41kcmtuQZzAHRAiFiaIG6SfFzCe3ss2tj2HPmQH1XtlrMWgusctnakv1
RmnKhhEHoCPj6V9bqS6qQThegBevt08G/mtJw0LoresxiXM9/BuY+3L0fj9HL4J4
4akukZeUykCZV1y2eo5ZfSywrBzYXh4v1vsDs+V3zVWip9Z4yV3+6Mqmfd2n1TAg
hI9+7x7li+azRQi6MRIJVoadrPExH3dt05zOc0baroWvEvCV6Odas/g9PM/wQ8xk
yKt4BvnoMD4mSp61g6DNGeu0cWzM4JA+NzDybJdDkWieJkg7VF4oODP1JA/Tmd3r
r36lZQACfr27pWKSdLlY5P2QJCWWlcUZ9yeCH1krSDNDNTIC5WsDDfO+j8kRZk6m
SaApWC4r3858bI82j/OhWsXKFI2pQgAe+ReBJo+ChZTsJJJZVOq8LHc8IgKOfNPF
1Nh0LUyx0NmoG3OCPVR/Zm/+DZuisuwfCE2ZpwEh0CqI51LdrOo=
=LuMy
-----END PGP SIGNATURE-----

--=-RLW+QMWkQgjRlSGOIFYG--

