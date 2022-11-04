Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C3619231
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437369.691712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrTS-0001gp-A5; Fri, 04 Nov 2022 07:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437369.691712; Fri, 04 Nov 2022 07:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrTS-0001da-6R; Fri, 04 Nov 2022 07:50:46 +0000
Received: by outflank-mailman (input) for mailman id 437369;
 Fri, 04 Nov 2022 07:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCXw=3E=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oqrTP-0001A8-US
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:50:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62195924-5c15-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:50:43 +0100 (CET)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by DBAPR04MB7224.eurprd04.prod.outlook.com (2603:10a6:10:1a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 07:50:41 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5769.026; Fri, 4 Nov 2022
 07:50:41 +0000
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
X-Inumbo-ID: 62195924-5c15-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkTKKSzCA/8XG5ZFOxL3NkfLsF5WQhLIbx79mGCZ74yXVfyCdR/AbdnR9z6WHXLaoC/XY9MUwtVfWwXrj838U/uMsGMYsB3mRTYgxAWoKHCK7zHA94ma0Q0MFwhlyKUmi1qq0sCj/Cucrm0oD2c3h03cuqcrMd28M4xDcZKueeYbUPi29REuatXtVF5B1nzhpxP8DAOoh9D9p9cuHHydMNggSkDaH4hEcyBWeyuHpObGLvtu+0N4OCMF4cFtG4r74iOxZszmiVl/Atl0DGdq1F7CDBaSHcs4ySYIzrYX67EC2EyE38YI964hR3Uti7l10kGhyuCAfs6uBAtCpZST5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExbpruphCWrTep58Tmyi4XZsu3EPIONWCcU3hU+XZ+4=;
 b=b9UiEMzbNo3UM4eG3Hfej5bn+sF0Q/YNXIuKJw3OAv2X33GI1Fl4KPRHR2qUPnG+FNcc0Wb9Xx99u3RX+Vtp5w9gL1nSBUDXSpYzrMGsxL86jD97YVVhs0huy93TmvDuSixqcsQT65JVagZs2aojXz2f7ihoLCp/cRJhGkzKqBlr+DeYmmKklO57jzh9Jx0fcrsZGWm5DdH7WNEwfS0h0UAjg1ZrCyh9iKrY5/XIlmxOSa4UfGTV+eFWyUY+Mp0cYiqyK/UJTtdy4n69F7WDq+D8GQcd1MtKrfozvObldOuo5//kniCJJ4pKqd/EkjwgO8hG9BI1zOaW08lnCjkqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExbpruphCWrTep58Tmyi4XZsu3EPIONWCcU3hU+XZ+4=;
 b=Hm8Xqegv7IS5Sc+Jn3tJknqOAMjcObQSnw+q4RPZ3Bgq1dIthf+5Sgowf85CU8BVl1YX7xVevemKlpL+4dTPtLLy9THAbanqZ2pjK/yWSPzq4ol7LMvESFY0nrLpyzV4g6hKVwfLB6wse2bNgmB6oCsLbKAsO6+RwsaIWM0KCzIZn5ZcUb9vq4IDhkkgEKPh4MWQZfc4jc1seUQSYJfoJUtVXUgTOHsg2M/XZR5JjhtCp2M3IDiCKRlL2Vh5l3CsMnKCi/amUNdQYKsfcZ8ohE1GmAlXmvKfoFNnrYmCpda+S7cNkKyjwpJiH/weYRGAYoMr4DO1KS9ECAIseOB1rA==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "wl@xen.org"
	<wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/notifier: simplify using notifier_[to|from]_errno()
Thread-Topic: [PATCH] xen/notifier: simplify using notifier_[to|from]_errno()
Thread-Index: AQHY6sIwabOtOtASVEmIHsF4LdAC2q4ubr8A
Date: Fri, 4 Nov 2022 07:50:41 +0000
Message-ID: <d5e54846ab18512d8baa0d7baa4ec77fb2cf26bd.camel@suse.com>
References: <20221028114111.8150-1-jgross@suse.com>
In-Reply-To: <20221028114111.8150-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|DBAPR04MB7224:EE_
x-ms-office365-filtering-correlation-id: baca0ec8-7354-4b15-5d7d-08dabe3945be
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rcATAydi2VuHWa45ZUmYTMc5nUSdQ2pSnpqRTGvLOtiCFzKYgs3aaz+Eq2dJmXtq0g5HuS7hgAr9Eg47JHQPxSJTXAik63hh1Ww3RASRKSNH6VAp9PlKJWnzti1my1tgPsI3CqSoPtQPklU20Q6Q8tdl3I13IknD2oSbqEfQd+kpJ6MRA01YyLt71phyq16gnt1YB+36/2BmYZI87EJkM1YknImLd8nwmrqDEpQ0Umwg2BAfmf/HsOxz74Gcy0pWS0r9fAqtC0bqJi9pGn18otwyOfPsnUST1zR4jeBcQ2JVF7X5NFWPDKeFGlg+T3lPH7PC9/6QKlVSHL65W7gPtRLvIldxKIPWMYuLQr/+hfPKsMhNs6MlzM/E+6uz4RfjiIXryPyjpiYnwnOCyYV1AWbUQ3S6fyQ7NmHuNqQ8FhcI55/OfAdlz2GQQ7QKIoiyK31+gJmP5pPhOojdrhpGhqCs6AsJQkxteoaMqF7Vb6AZZdIFLE+IUQHvr7HP/jP9eKN9HfgCktuJmV2X6XQwpBs9S4M32PkKM/8qsUvPxG72DIf3RdIgT7DdNek33b7RpswYGd8Ll8DobpCMKHsXBkzkwVeqjzSneRW+yw8H6uE8OMJIsRakzktuwZJ78ICt6V4YdqFEFUz7glSJARnJ7Zu1ddSzJAKMeA4bjzi2eAWU9aCYcpdehsw8pyx9Xtis9j3bhEwzf+cmkO6HXIqTtYY5xtwjp32C5gGsAMC+f8Ft5+5pGsIWHSDaMIUA6CevFsM2DLJQi/3v8oPaWk1eSt3TbzNkr+NkGU/67Iv4kMWikKkF5jqn4jCT72X76UIjjN7yC2hklYkHZi1S8r1BeA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(36756003)(478600001)(4744005)(54906003)(6486002)(966005)(316002)(38070700005)(2906002)(91956017)(66556008)(41300700001)(4001150100001)(8936002)(64756008)(66946007)(76116006)(66476007)(8676002)(4326008)(110136005)(66446008)(6512007)(71200400001)(26005)(186003)(38100700002)(2616005)(122000001)(6506007)(99936003)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WCsyWWNsdnZYWmJYWXRqeWgrVWNyeE1rdzFDTmJFSkc0SmYzKy9KQzJDby9z?=
 =?utf-8?B?V1dHZ2hJRER2Ump6OHNYaWlrTzhDVlVMdUtSYmp4S1cvVkovOVAvSWgwZ3Ey?=
 =?utf-8?B?VUVzMlVIa2J2MmVVMU5jcVRtekJxMm5RNHBBUEpLWDExWnBCMlZhRForUlhQ?=
 =?utf-8?B?YWJ2Y2k0Z3drSzNOY1VkNkdNTGNSaGIzSFdRK1lGODd5TlluSjluclBjOEFN?=
 =?utf-8?B?RkFJelVhbUZFZ0FxNElzOTBoak5mQlkwemh4UUMzcXllS1ljZjJVRVdPWHJE?=
 =?utf-8?B?QlE3WW1ONkxRUG12NDllb2oyanJ3TUZWZDZWNjhVRUJvdDBFM3BOTmc3Tk5z?=
 =?utf-8?B?Yyt1dnRHYU9ldWNWdmpRajBVUEFFb1R6NnlzWnMrS0tzR2RSOWY1Q0RrWExn?=
 =?utf-8?B?WGJISlpVYjF3NzNTUWZjVlgzSjVCUUllQ0s1L24zY1dsZEE0K3NpdTI5ZlRk?=
 =?utf-8?B?MjdMYnZmK0NKQmFuZ0J1eE5nYVJGQnJTOU5SVkVXQnA0dFdlK1FuVUd5djQw?=
 =?utf-8?B?S0hBcGcyRllkMFk2OXVXeEdETm8rcnEzU0xVcTJVN3FJK1puTEx1Z1ZQbGxK?=
 =?utf-8?B?eE52TnZjV2VOeXlKbFl6emhwck5wM0RhQkt1RTNDcWZ0V1Y1dU1NdUF5M05J?=
 =?utf-8?B?Y0dpQ1RlN1FTZlZZbzBiMGl1VU9IL1RocStKcXExNnVUZkFTaGhSYVBoT2t3?=
 =?utf-8?B?alpsb3FLQmc3UmZ0Q1hNc2VGYytvNERudDFFQ1V0Y3lmeDhYN2ROaDU3d2x3?=
 =?utf-8?B?TERaeHQ0UkZIS3lhV0JMSEIrYUN6OWZrdS9PbTA1UG5uaTAySlpkLzY4YXVy?=
 =?utf-8?B?UVpsY0R1bTJqcUd4NDRac1NhM3pEbDRJQkNuOUZHdFppUC9PK3U0SzNCc2JQ?=
 =?utf-8?B?Q0tTYjE4cUZRbHo3M2FXK0dWRVR3VzlwMWNBM2ozT3ZJdDRvb3dFcTRCYldM?=
 =?utf-8?B?WURzRFAyYjV0UjRFVVFkOUtGME1QdkQxbFFYR2svcGh3cUtOMlNURjF2RHo4?=
 =?utf-8?B?MHlYVi9INkZnSittVWNyUmFOR0R2T1JNTlBpbmdRRUVVRkxhT3FsMXoxbWRB?=
 =?utf-8?B?andmbWFTUC84N2d5ZVRLbitkWHZVM2RRNGVSSElGSGVaemN6VlAwY2xSM0ZD?=
 =?utf-8?B?RGhsbWZzNjNWVURaL05zS1hFQUtmbllJSjZTcytiUzZhSzVsKzEzaHkrd2dm?=
 =?utf-8?B?OFgyVmluTEhVOU1OakVnSFlIYXBLMTFmOFZBR09BY0Z3TFI5L2pieFNBL3pJ?=
 =?utf-8?B?WHRLWUFJOEcvcXBYcGdmclYxMCtzRGQ3UlU1T1NHM0dIMkxoWG14TDEza3c0?=
 =?utf-8?B?bVNzWXZrTVFGemVlZGhmUWlNYld4Znd2MHZSenViY2NBYWNOT2pyS3JkVkg5?=
 =?utf-8?B?M3QrRVAvSDRDamV6UlhpMGJLRVY1dnJhQ24zcmhYblBFVEVpSkRxSkNsUUZC?=
 =?utf-8?B?aFdtU0pBRG82VUpPY0VKQk1QNG9QNEF6eExMeGdWb0ZtZ3VlVVdjSWg3WHhT?=
 =?utf-8?B?d1dWNDhRSXhrbVRycGp5MmhwemcrWVB0UDVuWHVDWEc4dEtTQThhWWJpb3c5?=
 =?utf-8?B?TCtWZDlLUENwN3BVYWdTS1lBWkVqU0xqVWRoMDJMaDBqamlCUFdRMENGOStj?=
 =?utf-8?B?Z1FXLzFHNlNJdEltTC9XMUplSXYxRXMrQU5VeE1NQXZrZXU1SzZxU2k3RXRM?=
 =?utf-8?B?WWpIZ2JzWjBqKzBTdGlQdFJQODZadm5na2RRdW5qeXNhZnFwVCs3aFJSUzEy?=
 =?utf-8?B?eEwxMHVjQUVqM3VJR2pmTVNEbDNQZnMwSHEzY2ZUU0o0SXRMbHA2a2lYVzk2?=
 =?utf-8?B?YjQ2eVlHWVJhclp6NlNxTWpMMnRjdFlrYVBORmFzVFJyRjlmL2xIWEw2c0FB?=
 =?utf-8?B?TG96Sk1sNGdIT0ExUW5YTDlzM2hESk9vTWVObldSRkhHN0ZnZ1hQTTlLdEl3?=
 =?utf-8?B?ZHI5YVU4MS91ZkpLblpHUWRiMEx1WWlPdlk1a2xTdS9YUk9xVFFTUlhZZzVH?=
 =?utf-8?B?Mi8xR2JMQUlWUHIvVXE1ZVEweTgvZWNGRmpYK0VXUDZWellqcjd5bnhCNTA2?=
 =?utf-8?B?NW43TGJyUEowSzMybVdwUHd2MTVXMStyT1pMZEd1U3Y5TlhmOEFIK2xvZXdp?=
 =?utf-8?Q?PjNpDveRCqHWUwR3jnhNx1bIC?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-K1T6jo868eI1BUBuZvot"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baca0ec8-7354-4b15-5d7d-08dabe3945be
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 07:50:41.8551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ozk4YD8OsCZmPh2Hdf+rTkcLhjpeORmamdgy2VDr+mwKTn971cfsLuBPdexLd23m8WCqpqm0AnKE+1BxenpAYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7224

--=-K1T6jo868eI1BUBuZvot
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-10-28 at 13:41 +0200, Juergen Gross wrote:
> Today all users of notifier_from_errno() and notifier_to_errno() are
> Handling the success case the same way, by using
>=20
> =C2=A0 !rc ? NOTIFY_DONE : notifier_from_errno(rc)
>=20
> or
>=20
> =C2=A0 (notifier_rc =3D=3D NOTIFY_DONE) ? 0 : notifier_to_errno(notifier_=
rc);
>=20
> Simplify the use cases by moving the handling of the success case
> into
> the functions.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  ...
> =C2=A0xen/common/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/common/sched/cpupool.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2 +-
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-K1T6jo868eI1BUBuZvot
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNkxFAACgkQFkJ4iaW4
c+4eUg/8CcveZeoUHELf7Yn6tQrSSSGpB6ZzoNMQr5tavXt6i926FswlG0wsFOAV
wWOGlF4iEXzU51yiTSkuXvhYCDDrXaZVIggId8D+Zp0ORaRGWnuk9sXPRjvm1aKR
jPvijAd8kFJtunmJjL1Lw/4JLJ+fdQlcfg8slu7qWf8fGqFRk9EQZo3YIEiXkNUN
WaANAMLNbr8NpUJyaaPq1hYc4QxnM8wPdA96LqOi84W4TlOGAEFPhR9ZaA1t94p7
U/P2njRFwV2Zo77Dw+2HQTZP8R9EXGHi5FEyk4vYNutGYDBjSDzx+GjONZvzIK+I
Kb8gU3TwVRMMDv1e/gsci3QfzX2saLvZPqRJP1YhZ0PylxJAFcBedj4+IYAXVN55
tTzG2ieoHzZ0TyT+rZ1pd5zhWRqBGj68DtBo24pcRyH7j0JqhTWuj6eyWYsY6S7x
nqNrEnWkHyLgnnB0CW1KPlY1d7CcMF9igiDCCcDqPpfL89meVu5jaZ9IzU6oaf2c
Qusm1kQ0qO3gXGMaLTnycvN2M2Dpvo95P0rOBkVLY/QzNi/xRM2LnvtvzGhujNfg
LAX1ouHGWHz1nz+6+vUK32DzLecEbAD2ofQw3JQ96cSpPNi7IaLnriBDxrWJEioE
4LZ3vBL3636VlQSIM8p4rLzw3sIOajWRAFayBrLr27f+8tfpxhE=
=jOaG
-----END PGP SIGNATURE-----

--=-K1T6jo868eI1BUBuZvot--

