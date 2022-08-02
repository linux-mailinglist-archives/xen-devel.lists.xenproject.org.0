Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A2587FC9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 18:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379417.612860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIuS4-0003Ty-R7; Tue, 02 Aug 2022 16:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379417.612860; Tue, 02 Aug 2022 16:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIuS4-0003SA-Nx; Tue, 02 Aug 2022 16:09:00 +0000
Received: by outflank-mailman (input) for mailman id 379417;
 Tue, 02 Aug 2022 16:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MHYI=YG=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oIuS3-0003Rv-Lu
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 16:08:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a90dd10-127d-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 18:08:58 +0200 (CEST)
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 16:08:56 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:08:56 +0000
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
X-Inumbo-ID: 6a90dd10-127d-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrTUVIAJrDvdEQPkKysS7YByXqnn3TnjviKkYShp8dU1LoaAgzkvhcvC7rqrUpeWtE3qsUheTP7+/PCusJk9Gtw4SV1XPypfzEt3Df6VjX0TlERPfwExVGlgacNhsQz/3Z53daCTq9yxxUJ0iJcnCrZ1t+UW4cKvmJOIrQT/dRIc+8UOWbgY50PG1y5pK27vTKEmJ9GbT+muUTF3JzMC2pM8ZZR9GoEJhvybrKS7MDkFtN0VbVHQY2p1nEohgbqHL/Ooezb4TT9QgB0+6Yc4I2IjXQPJ8tuqyjl/N+N2De18OxfRhYelYb+u4w6kozSCk7laGEv/jlwiuCrTaomMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDjXMzK7YB6oJPeFBRAOczX/sA16v7PRIDTy+9rNuBk=;
 b=ZvvzAtmVuE4EMFGKLPjLlbM7vaBeXsVgEyq+AY0dOL8N3a17NXCdsFOR31eHrK4S68No0mBITM7Tg6xmzna5+B7aZWELXG15vCy3QDt+Mk/JadCgDC+YcHN1Q49gBwI3A9w+eS6AiKLVAEDkOI8Uadc5p+io/nx4Tx+pBCS8hNFaCDiz3fujSaHIderJFPRL36jn0FuEFOSySd3peTo1xwQoY+NRwih+/pA24W57cHUNQUfVedAZwhuFmkINnmgmduaq9DrI6/d2oZC7NZj5E8qfqimioqhzghJFMbXBk9vLreGdodYmuga7oqLSkDej2hee3XIqbHFH+4bDAYJfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDjXMzK7YB6oJPeFBRAOczX/sA16v7PRIDTy+9rNuBk=;
 b=apAr9KxW3DBPa8VTYDX8tH6r93TaD79VPhyQ70z9zDLl6+TYHC6wDyKZJ0fbGzfFUDRwJLQBdY9EjpZEA620NUiv1HLzyLkZ2uFVgkUgzbKDiT73BSftYq1752sHKCsxUeCMOi0GTgMDe/iXW0B2QR+2I6ZVUctkBnG8763mqhM0IY6YW1ejexzo5wGQo2N4F4fCuFRVWooswpRP4azdzv3Z3xfkIzNBNM0Nv8pTsQBjbAofl5I+ixtmIUUbpVynL6jHxp84jlu/nfABiVnpYCsBcmN9xFvmJXpzDr1obpOkCSiGNmMFoXKL+2gni97HLakyaeaIvsr9GC3FEPWong==
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Thread-Topic: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Thread-Index: AQHYpoAcjylCfZ/IlE+KXLo2d64v4K2bx1SA
Date: Tue, 2 Aug 2022 16:08:56 +0000
Message-ID: <228c70b853a8d790f1e1cafc2bbef00b5f845606.camel@suse.com>
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
	 <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
	 <473a337f-3211-c588-9398-b9f9a18926e5@suse.com>
In-Reply-To: <473a337f-3211-c588-9398-b9f9a18926e5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c25d433b-63bb-46ec-7d5b-08da74a14d7d
x-ms-traffictypediagnostic: AS4PR04MB9364:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 S74Ccn73LIesZzCyf2xNh91ZtLMRH06xeZMeZX5szdPBDd7AiL5usMN7j+rYB/vAiQ5ANE26RkrRC8h4mysP4vRd/7mNP0Z7+JMA1Zixr5YgsSn7OxhghFWiBYDzFNGx4mcntYD1mqfVjTsZbdUOX5m3RNNYcqMKbv6YOl5gi+9nDq1spifzrqgote1MvTHgJ3vFogPcn5fLoVhNvWnn1edFckpg+2zbv+0eBKnbife+/bv92CLYq40jFdigfxYp33yDav5qP64z4RexN3lk+Y643TPr4sffcb+diapZqQB37B3WxU5JR0TFHIngsVkHEkV3v7/UuCCXlAS5afdNf6+30oEIgCxOCtUi3Y/ZX4NiA+IQNVbmYQY9NAYE07EmXFntDMBOI2xv/HXAIq2QorqKLGdoF7yI2hqW5tB9XVjbNs/kgFBj+9p4RwbAYRodHD1g2v11mQIJ2PIrc97HbsrgxJYpz2JrB9pCi8ntxkVhQMA8jVoKaCOUxXbhPXE0frBVctRfhAFqNwXHWcZUhMKqd4+3evQe5eYxZPhhn8LaFNR/xwUa632+t0jGQJWbMrtC1Hek7D1BdXNRQ5TbWcThkV8ATuskTBvGN+DuPXsq6HQpbUJCvO74NvkjXhy6CEAyA+zCXBq6B1LzAbLgmA0VK1q9oiNNuII90+tn+KFTk8OFUSA6D2txnRO049vfnknlDvyMNX15sgWMBbIlmInPIPAoeXEI1AWg5PMc4YsKgFnRKL7CCvPVkhcWMgQqnsSFKAD2E9dULyi8x/Lr2O/Dgk9SmzZeuMJVorHw7iwhqqnDAnGBcFbSsD/yoIgoNLub9mPAWneOYBTdGh/tF4X9Z7USzossLPv7xPBwYqihLhIQZysSJpiCSKno0uc9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(346002)(396003)(136003)(2906002)(2616005)(37006003)(966005)(6486002)(186003)(8936002)(54906003)(38100700002)(6862004)(122000001)(6636002)(86362001)(316002)(66476007)(91956017)(64756008)(4326008)(66446008)(66946007)(76116006)(53546011)(8676002)(5660300002)(6512007)(6506007)(99936003)(478600001)(83380400001)(26005)(71200400001)(41300700001)(38070700005)(66556008)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dC93Y2JXcERmZUxOWlN5OW5QbndvT3NoWVJ6azRQWlFCRjJMTWFLcTZBSEdu?=
 =?utf-8?B?WURGQ1pKOGYyMEhiajY2OGE4aTdhbXpkN1B0M3gyK1ltdzh1YlVteS9idWtV?=
 =?utf-8?B?OVIrQnlSUFJFYXFIN202YzdQUkg3QWRsT21mWlE3S1llOFVNK2JGUmlpdXZ4?=
 =?utf-8?B?dVRuY0oyYzMwOEtibVp6OWVsM3E5aTFQT0ZidDVSOFREemlESy9abUJPV1p6?=
 =?utf-8?B?aC9NOEQ0SVQxSFNsMktXZXF0bGFEQ1VJeEZBK0s2SUpJZUVTd2EvUEtINVM4?=
 =?utf-8?B?bGlOako3Y20vT0RxczFMaDI5cisyVHhObUVTanhRYzhZSHd4dXpkV1kyVmcy?=
 =?utf-8?B?YStYRmEwWVJxZCtPaUNPd1pHbFhvY1hyMEtDNmhpNHpWUk9sWndaZ2JkQTlj?=
 =?utf-8?B?eWYvYWxzdm9WcjBOZ0VsbjRnR0JITmNvcWhDY1B1bVlvUUdNYnJ6MmtSWHBV?=
 =?utf-8?B?Y1dLVyt3SmcxenBKZi82SGNNb0huUVJyUzRCbDBZRUtERUFFVGxhWmd1Ui9P?=
 =?utf-8?B?RERJLzBydlBhZHppV1J5NDZJM29BME45alkxT1RpaEtFNWhna1hxQXNmay9t?=
 =?utf-8?B?b1diY2ZTTWNkZVNHaUVGekhPRDZhV2k2VWRWMFpzM3d1YkpLaGh2V1FyeTNy?=
 =?utf-8?B?RFQ2VmlXTXdHZnJWaVF4bEUyTlh5TFN3dURtN0YwUzZYUmxTalB3dE9zbDhZ?=
 =?utf-8?B?SDdCMHAyTERCcjRTTzUyaENCbFpQdDdHWlBqMkJOSzBBeXJGRU5BT203ZVEz?=
 =?utf-8?B?K3R5ck9uQXRpTmhBSzZwQS9ZTW8xNDd0cTBUWlJCWW1sMjk2OWVGc1ZCalNy?=
 =?utf-8?B?Zi8wZ1dIZ0F3cjNKR2sxT0JGR2owSjhYSFhjQmJ2ajZ1UjdrY1kzU01XTXRv?=
 =?utf-8?B?TXdtdzhTLzVmMEtBR2NmcGdTUWRhYmJEc1BsUlk1dTZHU1VFSUtGTS92SDdM?=
 =?utf-8?B?VzRzckY1SHhWdUM2aHJVVExFdW85eUJLZDl0aTd0cGV5MDFCZk1rdU40aVZK?=
 =?utf-8?B?THdMd1dkVktKS01KNWk2aVVmS2xIWGRKOVB2eEtNdmlESjRtSEtMejYySE9V?=
 =?utf-8?B?SlcyTytrR2cvYWJlSXRmeDBXRlNodGJibnE0YXQ5TDNkYmFCR2F4eTNQSjNx?=
 =?utf-8?B?MHhZYUVaNkVETkgzTTJNcldrc0s4OFVYaXlyZk12OGlsazNWa01JVVJqMmMy?=
 =?utf-8?B?elQ5ak1CWGRzMjU2NGlUVjYydEJlVDdNL3FXV3oydkFndndXTUNUNy9ETm1i?=
 =?utf-8?B?aFhhRDE4QXplaUo5TElyelJDY3VVOUZMOFFyM3oyWDRqZ1FhZnNERnFXMEJj?=
 =?utf-8?B?akx2WUNwODUxWlVHay81eE11SHJEUWJuSk1TaU5ZWEt3bHBJS3RKRFc2azFX?=
 =?utf-8?B?V0xGVS9nejVhQnFNTWJ4OGxZaFpqUCtOUWNnUlAzYXJNSzYxeXI0WWZLWHNV?=
 =?utf-8?B?czdaazJBNlBWM1Y2SkpwcTVlTGZYSWVTV1lxTXY2dm9ZYnFEN1o2QUxVVUw3?=
 =?utf-8?B?cU1XOGs5N1l1SUJ0TWloR1JPcnlCdTVTeU5hb1M1bVBFbjFqM2p3OTkyTHBU?=
 =?utf-8?B?aVpnNkloV0V1OHBYa0VySzM0a09lZXY0T2prbU0yREY1T1BzM0p5ZDNNLy9h?=
 =?utf-8?B?cUc3aFlidHBibW43emQ3ZGZwdDFTU2lZNFg0UUJ5dWNZcGFVelYrU0tVRitv?=
 =?utf-8?B?Z2F0OHVsS01uZ2o2WVdIb1lRUmorM3F4Y256K3lwc1N2RnUwTW9jdmFsZUh6?=
 =?utf-8?B?dlNyQXV1cmw3YmZxdzNmcGIvSW5ONkpaMEhYMGMxaUtmZ2EyWmxYdUY5d2Jl?=
 =?utf-8?B?M1FjTWxXOEc3aGYyYUV0MzB5MUtHcW42ZmhjOXNtdW1ZcHpnZUd2WUpSZ2hv?=
 =?utf-8?B?ZGIyME51emhJZ0pvOW1HU0N6Umg0WkxxVkpwQXcvN05UNTVFdDBuZUUrWFg5?=
 =?utf-8?B?SkNkSmdzZFpHQnFwbU1kSFNJcXd5SmFWZzVCQ0dvVlBhWmZnSWQxV2svVzMw?=
 =?utf-8?B?SERiTm5vVDRFcHBaWmF0MUEwd0RsVnZIWVBMY3RsQXlaVzlkbFlJWEpCK3JJ?=
 =?utf-8?B?aWpDTmVraGV6MkZ4Q244OGRidlhSVnFycG56ZWx1NlhPY2d3QTdPQWRFa1NJ?=
 =?utf-8?Q?lVFkQ4E6VHWrYidUD2lzI99s3?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UbyQznL5XPTz3mGzz4HH"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25d433b-63bb-46ec-7d5b-08da74a14d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 16:08:56.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfpY1IxaGo7U/oQ77Lvwv3KeX/El1B+aeYyYbI2HO4coisvIinM9BhPYGG5i2Ly5tEQFDmD8W0pwfFCksnjbtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

--=-UbyQznL5XPTz3mGzz4HH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-08-02 at 16:56 +0200, Jan Beulich wrote:
> On 02.08.2022 15:51, Dario Faggioli wrote:
> > If dom0_vcpus_pin is used, make sure the pinning is only done for
> > dom0 vcpus, instead of for the hardware domain (which might not be
> > dom0 at all!).
>=20
> Hmm, but the control domain may not be either, as it's derived from
> d->is_privileged. I think ...
>=20
Mmm... Right.

> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -575,7 +575,7 @@ int sched_init_vcpu(struct vcpu *v)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize affinity settings. The idle=
r, and potentially
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * domain-0 VCPUs, are pinned onto their =
respective physical
> > CPUs.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0 if ( is_idle_domain(d) || (is_hardware_domain(d) &&
> > opt_dom0_vcpus_pin) )
> > +=C2=A0=C2=A0=C2=A0 if ( is_idle_domain(d) || (is_control_domain(d) &&
> > opt_dom0_vcpus_pin) )
>=20
> ... for it to be strictly only Dom0, you want to check d->domain_id
> here.
>=20
Ok, I'll send an update that does that.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-UbyQznL5XPTz3mGzz4HH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmLpTBcACgkQFkJ4iaW4
c+6hqRAAhX0Kc5vNdrKuTkU+5BPtfWHftRs5QZWX+Q/kGK2R2ZFFGgywvCo/G0M1
gAC+1A08Squjbj/63jv6FPcvzJy3z3OfqX7cf+yXkSSX1XkdFGHqiZltdslB14Uf
U8ArgxN2CPebmEAJMVtTaftTOvF1u9N2yg/UmwK6bMgDSCKGRG6RUxvDNQQtcWw7
vfQ3Qkfzx9GrJl+ZISeBuClS75UE3Lm3S6oA077YJRUPWaiFVxL4b8fZGzLxq4mK
/qspppFLYIUuzIcMNMdbQlcfVO//gEiDBiJmNYOAtGv75Au8NWRCbPaQEHtxVPFx
z5cmPSMX1pFEtemLsBT7iudDB4qeqlUW4qqoHTqZFIj0xeTyeEZ3HeEW6cjF+hKE
GDSf5HMiOTpemNrd1meOaIGa3Q6mtZQKRRV9ZjbOFyudCisSYqIZROyu8DS3M73h
C23f0WPr5EZJkdaWqPm548O0NlxAXqeoSUZLANu//M3AeTmQCXKrU+V2vPh6s+EF
jMj+6cfP2FQvmFubMfP5C/32Nq6T+qUIRe3BvCAuQnSB81WSL/e5ky+xDcrzb4MS
/gaJkbUJ+WykQDEzSCLFw/8pRI1cOc1FuUx6x2cjPQ84fuzIeqp4lnz+RXGC6BNa
WYs2K2QrDuEbu5D+ZuwC9XHfpGVMP4BOzhmUO0K61l1H6Oa1ccA=
=9UlH
-----END PGP SIGNATURE-----

--=-UbyQznL5XPTz3mGzz4HH--

