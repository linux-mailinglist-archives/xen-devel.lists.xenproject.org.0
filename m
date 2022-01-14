Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C648F2EC
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jan 2022 00:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257695.442959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8VtZ-000109-BK; Fri, 14 Jan 2022 23:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257695.442959; Fri, 14 Jan 2022 23:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8VtZ-0000xp-7v; Fri, 14 Jan 2022 23:22:09 +0000
Received: by outflank-mailman (input) for mailman id 257695;
 Fri, 14 Jan 2022 23:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n8VtW-0000xQ-Vh
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 23:22:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ae5b6d-7590-11ec-9bbc-9dff3e4ee8c5;
 Sat, 15 Jan 2022 00:22:05 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-70BBYxd4OXi_8JAIfaAZvA-1; Sat, 15 Jan 2022 00:22:02 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 23:22:00 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06%6]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 23:22:00 +0000
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
X-Inumbo-ID: c8ae5b6d-7590-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642202524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MbHLFDJe3O60XFHf53i4bhkGZyv0z48dBhDIysS3vRs=;
	b=CqlC93oaCz64Nwp+bUbFLnQ6CHwgja6K0xRxRS+Ze/IOyCG2MpBv8JskOnFJ5hGOCwefrM
	zvY1yIpVa2AxrrAtPjan3VkS5Djniqp0LVXQq0pnnH2qPIu1AWCkAol+HfqIYY+48PREa/
	i64rVaWCbCt6QATbB69SOCackq1oIH0=
X-MC-Unique: 70BBYxd4OXi_8JAIfaAZvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K89lQN53e/XzKh7IdkIoDTMFjBtqaOPHn9W8VbVzV+r65vyZsiAEDSp35kvnBe9t1YoIdIeEiJUIUTgNfRvCDroQvmcOk+F8d2JsK5g+gZPAcH+hC1pvBrdgVTZEO41JbI9euhs38MBr8HZdY2+kuCZ0jJbonG/VYYcnAS9K6yQOrD2exbrsKs0aPI+ckfgiccFUYFohZFYFNmEAaBzNCYFecubV9qRS/sN+1FY107syHl6O7OsrCgQz4gePnWVliQbtK8PImpNVCd5h/k3Up7wf29ub43AwJH+Hb+5DefGCd7dCJkyY26v/1QnfZxJA/Yx9RV+zx7Hz5EEiyBzvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbHLFDJe3O60XFHf53i4bhkGZyv0z48dBhDIysS3vRs=;
 b=mhCo4zW9Q24SUiQZcfel6731il4H2ILyVn4l6Zs8rijru3oSaXmqHRXujQi3HwIittpWoJc8bucTg2kd+dFqv8tSMm4ZX28bTBFu3RQ8B1YYdfJPwRFYvaVZfdPUbm1ISS9gIZC/6pQIqP2ZrmA39nt+zpWOHRN2zqMUEaAso/4vH75MbciKUFI5MeOQvdnUNE1OCaTrGWKbIQPxKMphTb5iz5QzzydQ/LFtGR0rg9e9IPOdx2gjvbE18URH2WW+PWwnBEN/zXLmcwA/ac2yFm0QXERG2uMtObKq2mIzMFwQtRhPQG4FGQuP/MyIEs6SxObeA8j3cm0VKQk1fyd3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "anthony.perard@citrix.com" <anthony.perard@citrix.com>
CC: Juergen Gross <JGross@suse.com>, Jim Fehlig <jfehlig@suse.com>,
	"wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/libs/light: numa placement: don't try to free a
 NULL list of vcpus
Thread-Topic: [PATCH 1/2] tools/libs/light: numa placement: don't try to free
 a NULL list of vcpus
Thread-Index: AQHYCHXrUuOcqEMe8ki4TaQGMIKek6xjKiKA
Date: Fri, 14 Jan 2022 23:22:00 +0000
Message-ID: <912014da2d821a14418e272f95c25e60be2b7a4e.camel@suse.com>
References: <164200566223.24755.262723784847161301.stgit@work>
	 <164200569629.24755.2980883411590685040.stgit@work>
	 <YeAVjpmuV9LIRFpa@perard>
In-Reply-To: <YeAVjpmuV9LIRFpa@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.3 (flatpak git) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 573e602c-1226-486a-b055-08d9d7b4aac3
x-ms-traffictypediagnostic: DB9PR04MB8379:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <DB9PR04MB8379B5DCA891A1434F96811FC5549@DB9PR04MB8379.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 h5gM7FHseMJr7+gqMLb4OwUruHrGgfLl0BIXwI83kJE3JbVoW4ABAmMwHN0whFGJkjMHdyvRF8Ta5LgcVtt667PuBODnQpZNqffdPR3eccV5wBi23vjewDdFVCiEm1p0c+hzssWMC0VvymzVy4gmnsp/m1A6FdjA2bMTyMcB1jEt3lnCG5vznh5JL18iNCuE3mRvNT8lx8BMjj9ZLRs5MKdvHCG1QycRdCbDBHOX3Iif9ItATzU2Upmzp1c2dm1D2FrsiFIg3OffuPRB+mPPtBqdajowvBeOnWuP8G/RtaZ2P2MgARFOO3S+pBsiSZcyP4mvESfWyWonRYZgylGSwKxnw3mKtwzPLhXURCuxWb5a6YXKgZHXx2AAo2FVhXOH93tyu/UQwt3k7vU3pIp5/+7Ig/GsXBXel+CCZACMHUAkZMTHkpAtcxHIiTFc/re6fFuLAQGD7+wmHYUIXmYjM6D43VoVLFGBoRVn34R5/OmMWuLrFy3yH5Ir+tH3QHbuo4GK4YMBGlN+b6xUhkLHbIVMT1MTlxjw+QAFM43EL/71xeBToKE8tCfiKGjFcT/8hRPr0qWJBgflwW0MchiXQRBh/XtbNFZpi13Z9rBs1ldEHv/64mNsmP/ESyyASQw0ep+Rc6YkhoJmet2vjmBH0NykKuTK5qWdCp6MawkEe+IGwYYNJkQ8tPpXx1Mj3Op/dTvnqsvVsvnb7W23/hcawsB/hecJZLE+Nz1GwecOWLp+HvLrnVltaMwR1mlGHu5ipESrdthSe5WQFDd2MHR6tukWPnla/HKB/orWvac72XpXeWKCIMplaW6k+1io7SVSuT1eyhVpp9r/vim7TrMpBw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(36756003)(83380400001)(86362001)(966005)(6506007)(66556008)(66446008)(26005)(76116006)(8676002)(66476007)(2906002)(66946007)(508600001)(91956017)(99936003)(6486002)(6512007)(122000001)(6916009)(5660300002)(8936002)(38100700002)(316002)(71200400001)(2616005)(186003)(54906003)(64756008)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGhiRnc3R0lwc1hJV0J6K2N0OXNpNkhMNGNveDNrYXBFUE9oMjNaVGplNiti?=
 =?utf-8?B?NlZKQWJGWEY5bmZXdmx5V2FjVU1lbUVJamRCTmM0Kzc0aVNQeU82QllLbmxG?=
 =?utf-8?B?dkEzK3dZUVJMUjJrNFFWOE1VUkthTjNTZHZwaHE0RGlUd3NyZFkxYTF4SCtx?=
 =?utf-8?B?WERGWU9rUmpDS1l0bk10ZmIwOHlMRGZ6RnkzakYxU1BzaUNaaWxLa2IxUzhY?=
 =?utf-8?B?cjQ0UEFrOURRZTdpdnFwaGM1S2swME1PUUlQKys5NzU1TmJSamtIVGc4cUU4?=
 =?utf-8?B?OUVHTEFxLzR2N0MzSnBMamtrZ3RDTjk0REdhK002bXRSY2RnWEdzYjRodWV0?=
 =?utf-8?B?QVdCMU5PVjZpQWR1SHhZb0tUMmx5ZjIvdmpHSEFrNFdwaU0xT3lDcmhMSUtj?=
 =?utf-8?B?WmkxdVFoU29IMXpTNW1EVFc0cjBSYU5YYVg1MzkxN29pUFk2ODlyTk5xNXhs?=
 =?utf-8?B?MUV4M3ZGL1A4bFJHZHBvL0NoMzZuZW1FcS9sa244UjNmczBGZWZzSmc0QXNP?=
 =?utf-8?B?T3pPUDhaQko1d2xMUjRVMFNiUmhyRTdtUnVsODlaNWZIVmtUbU5BYWRqT0k3?=
 =?utf-8?B?NDk0dm4ra1ZOaEoxVzA0ejdQejlSQ0MxYkRvMzFNRitFWDVlS0hPTHJLeE1Z?=
 =?utf-8?B?V21aTUMxN2tqWi9DdWJtL2tzVStlWnJKOU9OOEN3QTBGMGpKeEFGNENqdDZw?=
 =?utf-8?B?c05CRFo2L29zNFpIbElMU004Y2ZnQlV5aE5HU2pjaHlBOEQzUWdGNmQzRU4w?=
 =?utf-8?B?S2doU2lSd0ZrcEhBQ0FqWHIxdzlXT2ZWU2hkMExlMXFHam1hcjFPK29ZZHlp?=
 =?utf-8?B?azlERnF4VU05NEJvTktUbmE2Y3dEVithUDM0Z01aaEY3eTZJYjR2RGRVSjY2?=
 =?utf-8?B?QWJwMkdsRGwyckxRRk4xc0NLTE14bjdQUzlxbjFGeWJaRGVGUnl3eHlBTWtw?=
 =?utf-8?B?VU9LTzRnN3hNUnJDTnFhZ0tXUVhmalg1R1JKR3hIOVdDUkV5WGxYeHRPbWps?=
 =?utf-8?B?djBvUVVVMUFnc1pHbzNJcERUSVV2ZVJ4Q2ptZkFGaVpZUWtaYmZ5TlVCM1Yx?=
 =?utf-8?B?OXJwQ1BTVnVLNndJc3loeDVUWlRyRVpiQUxhd0xvTDVFUHpmK3Q5amxEcXpR?=
 =?utf-8?B?TVpSYjVIQmN6bXgvb1hQVDdyaCtvU3FMK2VIcVpCaGtLRkk3d3ZqZFdrRzZB?=
 =?utf-8?B?eVR6Y01wdE90Z2FxZWRyb1NIcjBiMTN1Tkc4OHB3bXZFMHFwOUx6ci9jSWx1?=
 =?utf-8?B?UGVpU3BoNGVwdFY2SFIyT3pGTXViQitzSklkSlgzVnFhMjB5V2phRk1UZlZR?=
 =?utf-8?B?K0F1Tnc5TlRwdGRrRWlZS1JOQ0NnTHVEbUZINU4zSkVrdHlIUVBtRGF1aDQz?=
 =?utf-8?B?aXJZTndBRkpsOEZFK2pzc3h2c0QzU1V4VjRwelZJVGJHdDdLeGsyVjUxZjZR?=
 =?utf-8?B?V01yM2kwSnU2NFJHaDBYWFBrSzNMcmpYT29kT0E4QUZHazZTMDZXRVVJTHBY?=
 =?utf-8?B?QWVIWS9MSmN0U0d0SGkvYW1MYUFlenNWcE5ZaFFzUW1tcjk3TDFud0JrWm1Z?=
 =?utf-8?B?dFNPUWt0VDJkR1RPMk05emM3RzcwZC9HUUEwMmYwdnFFWDdUZkQrZkNvbUR5?=
 =?utf-8?B?NFVTVE56NEZPOWZHNXY1MnZEeUZRd2Rpc0JUb0xoQUFHdklveHBDKzUvczQz?=
 =?utf-8?B?ZDNmRHFPNmVFWTRhak9hMHppbXhQQ0djQjZHN2NNTGQzYmFCQUZ2Q0JsRUJM?=
 =?utf-8?B?Y2QxYWhTdjQvbjFpMy8zNWxNMkxWNHozN0xERkxjV3NlUEN4VWNPK3p4Z0d0?=
 =?utf-8?B?VitOZERSYVBzM1dvajJLZ2RNVjlydmE4VjRGT3NHNHJNMnFQcDZubEtIWmJm?=
 =?utf-8?B?dk1tcTAxV3lSZEloeWpGKzBhRmlqZWNvTEM5OEZxd0NmY2lxTk0zRUlCZ3F4?=
 =?utf-8?B?czcxUHE1V0F4ay9vaGVCeEZrUnN5Nmc0ZTdCcldBektoci9IZ1dnZkMrWUN5?=
 =?utf-8?B?QkpTR1F3SEZWTk1heEtxUTE3QjdBaHJINm5LTlJDUUJ4cUFNaVB4UnhQRTZN?=
 =?utf-8?B?YURNQk9tamdoZmEzbFR1aFhVbjI1RUFqNDlmbitZRE9YdS94VUFES3JZMDlN?=
 =?utf-8?B?cWIyWUpRSkJkTVpSUytkU3NJVWlhUTZnR3kzK25NbCtQR3VRS0ZYNThvZm1y?=
 =?utf-8?Q?ibCqDJbFn2OzdKNmi+CrihE=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oBcS1W/YJMWcz/1oqWHg"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573e602c-1226-486a-b055-08d9d7b4aac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 23:22:00.7734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOgYNoBb/5kyfTQ8IDIFbQBUSdqcKqiqp5WyKIFZtRNVhuq0QJwXiinmi8SoevXWIWlKc4/Ny/srzHVLZ5C2og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379

--=-oBcS1W/YJMWcz/1oqWHg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-01-13 at 12:05 +0000, Anthony PERARD wrote:
> On Wed, Jan 12, 2022 at 05:41:36PM +0100, Dario Faggioli wrote:
>=20
> > 2) there should be nothing to free anyway
>=20
> The issue here is that it doesn't appear to be true. Even if "info"
> is
> NULL, "nr" have an other value than 0, so libxl_vcpuinfo_list_free()
> will try to access random addresses.
>=20
My point here was that if vinfo is NULL (because libxl_list_vcpu()
returned NULL), there aren't any list element or any list to free, so
we can avoid calling libxl_vcpuinfo_list_free().

Then, sure, if we call it with a NULL vinfo and a non-zero
nr_dom_vcpus, things explode, but this was being addressed in patch 2.

This first one was really only about not trying to free an empty list.
And not to workaround the fact that it currently can make things
explode, just because it feels pointless.

> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > Tested-by: James Fehlig <jfehlig@suse.com>
>=20
> Can I suggest to make libxl_vcpuinfo_list_free() work a bit better in
> case it's "nr" parameter is wrong? It will do nothing if "list" is
> NULL.
>
I thought about that, and we certainly can do it.

However, I think it's unrelated to this patch so, if I do it, I'll do
it in its own one.

Also, if we go that way, I guess we want to change
libxl_cputopology_list_free(), libxl_pcitopology_list_free(),
libxl_numainfo_list_free(), libxl_dominfo_list_free(),
libxl_vminfo_list_free() and libxl_cpupoolinfo_list_free(), don't we?

> Also I think it is better to keep the free in the exit path at the
> end
> of the loop.
>=20
Can I ask why as, as I was trying to say above, if we are sent directly
to next by one of the goto, we do know that vinfo is NULL and
libxl_vcpuinfo_list_free() will be basically a NOP, however it is
implemented.

Of course, you're the maintainer of this code, so I'll do like that if
you ask... I'm just curious. :-)

Actually, if you really think that the call to
libxl_vcpuinfo_list_free() should stay where it is, I can just drop
this patch and go on with patch 2 only, which is enough for fixing the
crash.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-oBcS1W/YJMWcz/1oqWHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmHiBZcACgkQFkJ4iaW4
c+7UsxAAnN7giU3+XJOMxNCH+FPeux3nhpantoODe6ZgfSlLbEkiR3PJPhzXdsWQ
a0LAGN1JRIO/YRE9QImbA7R2UmG8QjWEQywBIqNcANbto1x25crd83Jvt9EauZUJ
psM69g125dMnwJBy80h1sfKm9Ltja2vNrhey9q1UfOBm45mj8UrA9p+VpnJ5M271
mvMlauKcXI/OFCWWrmY9dK5Tw9tzdOvl+wTLOFXHrdCKXmWCMQG51zbYRLcQlek0
gzuksOhIB+CxKZIdPBksOh+zg7Ke+ftkcsXB7R/utnlP5wZjK/YxQPCF4oe536Wi
VOGngPvv5a68EgET/PMdNnns7lF+VJBkYigQxwE2WVUCgF9gXUa/Vua1J0YKE401
MhEogcB223VcMQoqH5nVpQv0twajdfZuDJ0U2C15eVaTasVWpP230sLrt0o/+Luq
uxRFwUitQwm4jpawvx1yZy60RYI3UfVcV5r8TbblprlW17qPQP4RPZsKAP/pXdrU
Kt0ZnGPLVSXo6YyOmZZNRPkaQq37cgSLEqEyG92uDQicTdbCwYJgYqa/frWA5qHJ
pGrkDcf2QA+sI+W25lMld36HgWROuMJxdcGTJUUWj0AesuDFQftodEzkfsaNDdEt
0dUsFJBHzpqNCkpUbSvonOcplJlVam1y+Drs1bUDLW1KwkGjx98=
=q5z9
-----END PGP SIGNATURE-----

--=-oBcS1W/YJMWcz/1oqWHg--


