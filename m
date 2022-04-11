Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E314FBF28
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 16:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303090.517088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndv6j-0007vI-HI; Mon, 11 Apr 2022 14:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303090.517088; Mon, 11 Apr 2022 14:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndv6j-0007t9-Cd; Mon, 11 Apr 2022 14:33:33 +0000
Received: by outflank-mailman (input) for mailman id 303090;
 Mon, 11 Apr 2022 14:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETZj=UV=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1ndv6h-0007t3-1U
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 14:33:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5afc76c0-b9a4-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 16:33:29 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-SfV6kcHjPDG0BF30OWitog-1; Mon, 11 Apr 2022 16:33:28 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by DB8PR04MB6698.eurprd04.prod.outlook.com (2603:10a6:10:10c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 14:33:26 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 14:33:26 +0000
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
X-Inumbo-ID: 5afc76c0-b9a4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649687609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDt+o5xfyAKPhXbyAOXsIp4kFCRyVSeCOtKAiPRC2kE=;
	b=NGeqnx3TlCVEh/RVNWSKHfbKsGUphNVSaX4xGrRn2wFi980X3dAvUyigGTFWQYAi08YtY5
	G0nx0PaOsJ21mYuyDAJNvctgODNevcD7IuFryO8+sABHCehwXo3QQGUzh4vCDEBsCxSCqm
	faa1Qu4GH22XuNUALglQy87p06WTC+Y=
X-MC-Unique: SfV6kcHjPDG0BF30OWitog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQCFozCfhJV7uZS4IpRM57Co2oFToiiglg1fPW77BriZiWScLO4wUCazi086ri8YeY8LCrGgjByk25gnNUb1vqSYLsM2ubQV3uEiDMFYJN/Q5fZkNOqPxb+dvxV4OrXY4p/71l9iRNBePEE+HEWu5E1awAggyHNo3oiiy0LNYPjrGSgafNszudYEn/KV+iihtS/rEB/s2kGMN1uy1C/gKioKHnR+Ft332DQ9CP/N1vPZ3I2km+trNwLXm4cjaanhnVpxihSPEqKvd1t5P8Gjj/DN6evPiD50B24jO/2qU5OssLX2jWE2LhJkue6/wpLQyvba5P4X3T2tv36RFLOv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDt+o5xfyAKPhXbyAOXsIp4kFCRyVSeCOtKAiPRC2kE=;
 b=Za4MbYroo0PTrm/NAvyPXmCefdaAeC55AZiH1a17WCcO4gVP7i9MTvtPjfo73U+kEOt4MQvaWrmPQmIazwz9KEasX7Ya8uDQoopR3eXdOjdbf5JwqGPb5QrkmLKmWIvjZoDJzXqtFkPkqeoj2qVsSfwZKrPKpCU5DZdjfafRT/omkM7HnZ0bvdl9OdHYym1xHJPVt93GJOcWGiiJXHWcbb12AdBZKrePEjU5ZPi2OzeBSzDFFzKtHFczHRocx87Tye1NL8JMz5TkZALotnFXIok9EhJuhXzPX48YRvg+cr3LfZQCx2e39uN/ZEj6+g1Z3tAltXeN+buzYuOQ/6sRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "ohering@suse.de" <ohering@suse.de>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgATtAIA=
Date: Mon, 11 Apr 2022 14:33:26 +0000
Message-ID: <6078ed329696878570b0167952cdd7c8d040f9e0.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
In-Reply-To: <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f98f8111-96fe-4934-aa41-08da1bc83d81
x-ms-traffictypediagnostic: DB8PR04MB6698:EE_
x-microsoft-antispam-prvs:
 <DB8PR04MB6698DA888E5458A539E124BFC5EA9@DB8PR04MB6698.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YJygIxSdUHIs86w7vUQb+sQdztbwSHAL53q1xglHN3bUVMFuxbkWtmlZtq9t7lq85xXr//x624gnVqUQzwonRhH/jnigkvQ9w5Z5XEszA2bFREFtey50Gz0YXzo/mGzBHnDT/UH1Ik+YxbdogHAPmyWtLnJddXRcVD3t4sDiidQbytqwt3frrjDdwEoSaThRM3ZVeeayq0K3Pv6hSaFvN3VMgYf0lWPcbzZQFbAVIW8CcwQJkK6ainB2nsGi40sMbzoZTco3V8SuM00d16Y4iqS7edYaAgfY0pnD+18tttOsujVvFjA9StpVA6ooIXZ75ZuCSoNwNG/7JDSQyVo7i2IM9txjR/9TuskoYVtcYsyLIq9rvimi7LrI4/n/6FVGTbqcJXid3TtOFLepcsye8SzbE8AdfhgOKXjNVPBdqSJVIgmN26wNuylZc4rWaXp3ZkjfaRWVS4Ev8BlJ1KPIRqcj7hOlVDbP02Abytm7YrqkVOW9Kt1nmU83HtTKpzug6E7uRzLckcfrbbxwvfdV98qvDEcCeueyaSliOVvoJnWrkwK4jIcFe5BZztZ8lgUDsf343jBVZJjjCeuJnSHs0KwIaDjx8Fj+3mfJbXm7jFnh7XEPVaZQy8UKE84ycGdjov5PvDwzdky2x0RVD58nV5wpXy/fnDyqxpy2CEMl0WDgEqUkND4abjMeww/j7jfVDwTzigFVO2UVc+rpuk+4Jdv1tcbiYs8B5sRK9HsLKa5fmXkqDUgqe13KDVGzEDABBkMzg7mQI0XQCkkwCbLPGgh5G2162NfmlGtAEphvDWsPDSWZQNrXKNAB7OOCCFzx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(2616005)(122000001)(64756008)(6486002)(4326008)(8676002)(966005)(38100700002)(99936003)(76116006)(66446008)(71200400001)(8936002)(66476007)(38070700005)(91956017)(54906003)(110136005)(66556008)(508600001)(6506007)(2906002)(316002)(6512007)(26005)(186003)(5660300002)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkFKRW5rcG5Vajc5NlU4ZXhrYmZ2UmxEK1R4MXpuUnp6ZmVUVFZsTUtVT3ow?=
 =?utf-8?B?RFlwSlVoMDN6Q1dkQjl1QjJMNUFkSnJJeEJ2V3VJUTBocFovem9KdzFWSDdW?=
 =?utf-8?B?aU5oUjVFbkNrZjI0RTExQzNpYk1UcUpZaGZiME43U01OZGM4NWNjRC9sc294?=
 =?utf-8?B?MVltcGpxdk1aYnF6ZVJGRUFMa2NpSyt3TXZPa0hUa2lEOG9pR25kQjFiRXZh?=
 =?utf-8?B?bWlXRU0wNG4wYzNSQS9YdjNKR2xhMUYyVk4vS3d1R3FrMTFwMnVkU0RjTW1j?=
 =?utf-8?B?ZUp6MDNXZ1NQank4SDVCYklIMTgveXM3Rlpla0E2ak8ybXBBWWVBUUYveUR3?=
 =?utf-8?B?VU51eWdsMFpXVW8vTTEwd1NKNnF0eWVyWU1VdnBHcXlhbWJrSGJNTGxBRVVt?=
 =?utf-8?B?UEl0d3B5eG9EZy9NclJZYWcyU3U1QVdac3AramZqc1NIMG5lck9Ma2xGZ0VB?=
 =?utf-8?B?a012aExaYjI5NWpZMGxQMjUwRExUcXZEUndWbDl4RUlhL2xDMEovMXJ3TkpE?=
 =?utf-8?B?N1k0aURsWnVDUFluNzRBRjNycmZsaWJSbXpBTVJ6akY2dUtuTk1vblNkYXBu?=
 =?utf-8?B?amNzZFY3Q0tucWZqV2Noc2dtd1J4c3VBVnNkTGRnN2JuS2l1OFVES291SDhM?=
 =?utf-8?B?ZGJ1ampsUWlRblJEUStxMWdFbjhEMzBFQ1lNUmdiU0RPVWRsZTdncmxIVkdt?=
 =?utf-8?B?Q21RTHUxSm1pQUszZnRVeVlNQTdGSVZlUGtnSGJTOHlSamtxc0ZzcTN3bDNh?=
 =?utf-8?B?SE5PNHVpeW4zWmxDOXp4VGtncEhlVnJ6V0U1SU9QVW9oakxwQit2SndZZkw3?=
 =?utf-8?B?bTZOTWpkNHhNb0VnQWdPejhvQVVvUldjQWNLT0JxekUxTHExVVVBejg3NlA1?=
 =?utf-8?B?UVlxZzhPZ2s1Sml0aE1SY3F6amx2L2pZNGF0QUxPSmk0ekFudkRaRW8zY3dW?=
 =?utf-8?B?eVBRcWwvalVHYzdDNFZkVTRiRTBIb3JabEE3T1V4Ulo3UG1sUTViQUMwWXdU?=
 =?utf-8?B?TWYzVHF6ZlhScXVkZTNVRmtlWEdtb1dGbjBsUExjVHpjS1Vycjk2YS9uS1NO?=
 =?utf-8?B?MjlwbWp6dG4wL05JSGhSRTd0OWN0VUFKNWZkTHVkaWZRYldzU1hHMzFZbHFy?=
 =?utf-8?B?VlA5N1RHLzVRdFVwZDJXdFV0cGtmNzN4K0t0ZHhIdDVrdVErRUZmMm1BMVhm?=
 =?utf-8?B?VFEyUTdQb2xCMEVkRjVBWlBmWFZkaU1PVmZQak1Sc1NOc0xOZlgyVDlKbmxv?=
 =?utf-8?B?bzVmRzlQOEpLZ2NsUW5mMUFUSkcvZCtHZklETjM5ZkcrRTJhc3VYNDdzSFNj?=
 =?utf-8?B?enlUQXlLZEdEOXhWdXZaSC82Ykc0Z2h6QzZJbW14S2FkYzFaaVpTRmk2dDA3?=
 =?utf-8?B?bkFYRkFjSlhuM2lDVG9nYlJFbWVKZnJPWWpiUDhSOFBPSmd6Qzd3MjJVVmNG?=
 =?utf-8?B?bWFQVFd4SEhPWENUdk14a09tc00xQURUZXBOL0tVblpKRWJoOFFtdlEyNTBz?=
 =?utf-8?B?YlZLTnRMcVl1aHl5SFoybGN4MVdhWk5mdmNRR3hOVTFCaWhUUGFQWG9qSFdN?=
 =?utf-8?B?WkFTMW5VZTBQMVJDeGNodXM0YUEvUllWU3FvTzRwclI0cDUrR0w1cGxrd3k0?=
 =?utf-8?B?ZXRHK2ZMRHY4UTJYc2dzU2FNUXM3QjdvYUwvVW9CNDdZRXJMN3REV2lSMHVo?=
 =?utf-8?B?di92TFI4MG9hYVoyYWxmNXNyZG5LTDB6OElrd0x4cERid25peGRoaGQvWFlu?=
 =?utf-8?B?MVpOSXpUb0dvdVJwUW94SXdLeG4zQkRDR0swc3dydEtxVk5IVUdzb3dtK0NJ?=
 =?utf-8?B?eWJsMFdzRy9kR05mVFA5ZkpmSkl1S1gxSkhJV3UxaGlIQWxkRDRHZ0NsUld1?=
 =?utf-8?B?RitCdm8rS1RGT28zc1JYUFRYRi9aV2pKRzZhclRQU2M4TDIwRm4zaVdRYlk0?=
 =?utf-8?B?MndYS21uS1FiRTd0K1p2cGRFVG01TXhSUVZKRnRUUWJ1T25Qaks1b29Nbkht?=
 =?utf-8?B?OHhNeEVEQW1ReUpNSzhXYThIT2hPWkJYbkhFVVA4SUpPaitBVW4yd2NSSjlk?=
 =?utf-8?B?V0dvL24vWVkwd25seVBSWkZtVmVEVW9GSFFIZlB0endSSUYvUjhtOGtXbllT?=
 =?utf-8?B?cWtrUGRpanRVNVVXSm8rNndIUzBmdWxVVldpUnpjRjJBVGx2L29CN3IySENB?=
 =?utf-8?B?WjZjR0ZNdkVUcTBPcEhWa0VXUmM1VnUxYy9CUzFweEZyN2JyVG9tQStxN0Zv?=
 =?utf-8?B?UG1mOWFBV0JlanJKN2RMZGphd0FnQ2ZEUmh4YlhydGFXdXJUS3A0OW1HQW5n?=
 =?utf-8?B?Vlp2NXVTSXdYeUIwRVNjekpCMUNFd2lhSnVVK0dRSWo4U09vSDZyQT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hPWrsB6BOHbV5On1BZy7"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98f8111-96fe-4934-aa41-08da1bc83d81
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 14:33:26.4570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6gENSzkl625b17SFOnLclaGbixNq9x1qonCQlNTZrvfsSrG+t0zBSD5OWKXXXc6vYqjLqVXk094wCayrcE+wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6698

--=-hPWrsB6BOHbV5On1BZy7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-08 at 11:20 +0000, Dario Faggioli wrote:
> On Thu, 2022-04-07 at 15:27 +0200, Jan Beulich wrote:
> >=20
> > Credit2 moving the vCPU-s off of their initially assigned ones
> > right
> > away of course renders sched_select_initial_cpu()'s use of
> > cpu_cycle()
> > pretty useless.
> >=20
> Mmm... you mean that Credit2 is moving the vCPUs off they're assigned
> ones _right_now_, or that it will, with this patch?
>=20
> If you mean the former, I'm not sure it is. In fact, when
> sched_select_initial_cpu() is called for dom0, dom0's node affinity
> is
> just all nodes, isn't it?=C2=A0
>
Actually, it's what results from dom0_nodes. I was forgetting that we
set d->node_affinity while parsing the parameter.

That said, I've added some logging, to better understand what is going
on, and there are some not obvious (at least, not to me) things that
are happening, and it seems that what is causing problems is the call
to sched_insert_unit(), within sched_init_vcpu().

I have to leave now, but I will report what I've found ASAP (probably
tomorrow, though).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-hPWrsB6BOHbV5On1BZy7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJUPDUACgkQFkJ4iaW4
c+7/uBAA68ySvw3cqr0SxCaa5Qa4EE3TtOpBuV7F3xq+UqsInKo3gcdEtV2jZp3L
QjCoruc6OyV9Bg6KmRp5taU6d1FwgqcGqsgrBYohpXehOy01jmJ/bE/fmtLymY3A
U43EYhVqWoAiXPbFwLkZ+svjcEya3UpUc9RHeIcfBesn5ub5QhIvoe+bup9boCrW
l0hvv7vgQcsL2p8bKv0ukvHBCAddf8x1KLCLBlEvbqJsaa87IoNJph7bd9G0i6QW
/ao6WU7RQ0Zzd54wDYfQAhRGYy5uTcWsrKmv5mg/mp/UAlY0QePViircdAkamMON
rBbuU4j4l9tL7rpgKqKycNZbnxPhZZpu8dztPGZc8l6glI4/dXEuruLIunReQGAE
S4DS697yDRFH1aqC8Ipq5Ga9TJdo9JDA3E0ajaVWk0Ok7CbcHF+y/g3ktZH7ge9h
6joRs+ZzfWKtZgurggip8y/u+n0N17GBVS5tG0wIXyrVSkVOm9zxc/U66PzuUyJV
8b3M/fv1yWrZGzGggwS282WgNxzS6YxRiIg6VA0LhSUolOzKZAgX//jvWiVxhnoH
xzIJgiAENsrknfi8FuF1ckFgCcNzNerJoqTUFiLDOk93yVrhi4ZP6rVi5kLJPpPW
16vFuKOtvnWV47dt4yuehavE751dneERIvdCQYj2snqXxSJ9ppc=
=McUr
-----END PGP SIGNATURE-----

--=-hPWrsB6BOHbV5On1BZy7--


