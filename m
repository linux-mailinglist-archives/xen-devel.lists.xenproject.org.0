Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C0B09322
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047170.1417617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSLX-0005MN-Th; Thu, 17 Jul 2025 17:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047170.1417617; Thu, 17 Jul 2025 17:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSLX-0005KH-Qb; Thu, 17 Jul 2025 17:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1047170;
 Thu, 17 Jul 2025 17:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s8Qr=Z6=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1ucSLW-0005KB-Dh
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:24:38 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on062c.outbound.protection.office365.us
 [2001:489a:2202:d::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9149381-6332-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 19:24:37 +0200 (CEST)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by SA1P110MB1784.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ab::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 17:24:33 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 17:24:32 +0000
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
X-Inumbo-ID: e9149381-6332-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=YAC3lc54m7UAdUiMni3B515tvCcKvoEbJxerkdrcmL2OS/n/Xzho0aF9jXFQZ/j3iGKEST5TsS1iPZxrflSZ+vsKhQS8ARC1yNpYpginLp8Ytizkx8DCuDOvHZKBjxnIlG7K+1yFUumpQ0b9bM3nf+/8NjSKbGbhXZ3pDvQILxnREEZ33ENE1DF8In+1zjNFdDWeWNEB7L+UwOQ0whec1hq/GB+oqDwNVHa6JRxD93p1xZUW/onoMwY0J0a1T/M3OsIhhYuOFki3hDzffbq19lr0GJxTJuM/XiumJkRNE6NELJJzuvI3bbDSHT5gNQq2KaVFLL8v9y/ullLMYd/TgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OahrAFh3OZKYwlQS2Mc4ua2EMKSIn2nLU9Xe8Oq6XQ0=;
 b=miZZSsGxNfkVbimZj4r4WV79nE56LS0UcdUSDsYl8U135h2eiZTiXfAwoyhdaGPZbYFN5V8fvCm/vPJEoqYSZv2DSKDevQ4VcNzk9h7UBtokTNtp7i/noDCl5mOyWrkWRQDjBlPb/NV8f35yXDb/0RlN2BQ2cuh8JDq5Kg9Qpl6h1Fkd+in9Zf0mTx4K3PS5rNo3NbBeHR5mP7qWVZWiIBey0OIpTpmVxsi5Ai2wIutSuMZ06sX6bU6MLGtPvO+t0GetovA34D7tYCvCG4YAMmQyADnrVeER9M8yYASZGFrfvKfci15LaV+LoEhbGtweL4lBDUqWgv2iyNnrDaKxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OahrAFh3OZKYwlQS2Mc4ua2EMKSIn2nLU9Xe8Oq6XQ0=;
 b=IP+EBzf3nMe6Wf8uXrgjsvWvZBbPJEV55BQezjo+Xq5lJGpMvpnV9dKVD2f2G2GdO5yLoz2puRNUxzrtGB/ljmWXV9gQSnhvzUB1HVCigexcy+KqhEw9M2jrTS8r2elg1RUtuLGm70LhapHH9qGtbTEYADyIEGZsHzkDThk7ZTL56M1SIHyVpu69Vn8vBLqETjQmgqJkmcP6BzhEUL3eV86SFcm5VRnfy6HUROpjL4aq4rqKRBhTWYNzePR0v6T76BFijR8Qg8BsIg0rUGKfI9KY+BzOGCYNLUKZSUtp7+2Wn+runIP0TR9VWx8YUdAmFab1FHOhIqNaPbZ/vtM5Xw==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>, "Choi, Anderson"
	<Anderson.Choi@boeing.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>, "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>, Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9AACLJK7AAqtXngAAyJJ5gAJscMRA=
Date: Thu, 17 Jul 2025 17:24:32 +0000
Message-ID:
 <SA1P110MB1629932C551E92F6A515F9FBF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629FBC51EF4E46B99958A83F455A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB2067D084B32D3F4601C288D6F354A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB2067D084B32D3F4601C288D6F354A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|SA1P110MB1784:EE_
x-ms-office365-filtering-correlation-id: de3f336c-4418-4407-a81a-08ddc556cb8b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K1sV4BhvBIY4HHCOA53jF9pGULoG81YZJswTunbQhOsuobqEOy0uhiabQR?=
 =?iso-8859-1?Q?nP4RQH0ZXuJBOeS8QIyED0U380i2I1+/eOk+L8VmQUMgGBtWCSDRFYv3De?=
 =?iso-8859-1?Q?Aepk97NMwYhNOrQ5ZUuLBszzebVJ2pwLE+xOeY1AcLN8CGQgUAFz4MeFms?=
 =?iso-8859-1?Q?NZTCIsvltj5cMVSxUL+93U8Y8RS2BoilvoN22ofLQXW9F+VIrYfGQlhnhW?=
 =?iso-8859-1?Q?ALgDTiS+F7pIbF6gHArOyh8cEWlnlW59gzhSYBQT72IS/3mLYrVXSbZ2hQ?=
 =?iso-8859-1?Q?J9zgV8DLo10V7crT90XH7jb7E94NsRBuCP9MhyrKsLHLg0zTR4MRV71FEs?=
 =?iso-8859-1?Q?Z03mO8qEUNk2lx3l4CmZH3w9oEJTBl0obaoJwTKI4m+K101FxfgAwsFNwL?=
 =?iso-8859-1?Q?32asYme0zn3QzV/QZJ5NZiYyEal+JiznsqmnigPBe28Vt6CFw6zN2akMAR?=
 =?iso-8859-1?Q?Op5+arCaDP9nGY2L4uR6KJeciIB+xsLJZf+JBB45dAQBPSaLMS6k4qmOme?=
 =?iso-8859-1?Q?YNzYVm3hpQ+Tbcm4iI79dEGsYB56l6qnj+i7oWsyrvjYanTEu6Yi4nGWY8?=
 =?iso-8859-1?Q?xhFI8qiRx/lK7rFus2vtQEK7OGkVeOniun7flwuqG4gHwyBVVhJFoXHjb3?=
 =?iso-8859-1?Q?F4IcbSp7lMxnDVb6C4dM1GD89Zan0z3wErgrUM8XxaA6S2nB3Pg0XKbKkp?=
 =?iso-8859-1?Q?cfY3bO5/woGuF2YCG5/dHM6/jwdO+Kv7SsqDpl9269fL161lh5bYDOpyee?=
 =?iso-8859-1?Q?BWAaB2hiIVjEqNGEYNhPS+D1CSoJsqup2JPGTqKsVBnoYRzHo4EABwWLji?=
 =?iso-8859-1?Q?VsH9ECGY5nW/ia3jzF4ZkfBGmPRBbHcx+CrQaYxDMFk+tIRclh1h/0VtDo?=
 =?iso-8859-1?Q?ShNFCavsfA1ZiPACrPepb3vI69JJgdjREWfAxR7nFWD3U1ccIYEhVZ5ued?=
 =?iso-8859-1?Q?EngbdsTszZA3va+FhFBqJOpbpIrJ8DjyRWW2zieIHp2ktLJa9qkkYBI4Kb?=
 =?iso-8859-1?Q?ogRe+UV0SI5mvO60g/avT5r59Guvh2aOaSgHB6APc9lO2kmHljo+hIrFtC?=
 =?iso-8859-1?Q?06hRoGhoBGUjWzoES6789zc2ASEkVWr30DOTn5hLbdlqbYWCsvlOhCbl7W?=
 =?iso-8859-1?Q?cmLJgd2Q1OBgELWOH2XBxZ61TD++UvixPELj9UffnrrAvHtiI0d6u1EVq8?=
 =?iso-8859-1?Q?LlADxkgm6uGJozko3W0WekqaXW3JQ/ycX02SXVcDMPIE/ZjOWgpYyuvc8o?=
 =?iso-8859-1?Q?wZTJJttgMhzEiuqiSvDs7ea6qZjZ5ypQUrETRSlZdFw+M7jBRXOAb41CRd?=
 =?iso-8859-1?Q?5SET4HbK7qOp/P2v+BE2nfnV9QeXo/U9GagdygC5ofq3s+MHcb/Ock9iXz?=
 =?iso-8859-1?Q?paQdjN9rv2dRA1mRKUkKRU+gknY9Zl6tB7u9IskQbOzJ0UIsOaN+jSg4eC?=
 =?iso-8859-1?Q?Cbl8p2UF8JO6fbtC639PWS66R7XWK4GPm5N1InwP1V3syAFfzQyVNc7G1L?=
 =?iso-8859-1?Q?K6pXnyk+ueQz5b9M062kmnog7bEgiUswI2qYIGAXSAsA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FgY2BdO0DSbR3J7GA1z2kSnOQwkxYcM64Nmf8UQtkMwVvXYq3iKf3duDER?=
 =?iso-8859-1?Q?hmQ3kg9bSpaHZOzNTEkbfnkDyqxHBmmwXu6ebWHzrjnhOYr+Oj2r9IFked?=
 =?iso-8859-1?Q?7DM+ICDCP9VrP29Ws86ymLz7W4kYHcH7vW6obzTSc4244X0jHwFm/5/6KW?=
 =?iso-8859-1?Q?kPy5zspbKsXodJAOAjg8N6vmIkIBxcq/AJDpyBV7oz9ew/Iy/5qi0BXyMr?=
 =?iso-8859-1?Q?ik9Zg02cJDytZCR+BJ5iqnz1TUg26UuOLZNfQT5t4PlcYCsZ0n9tUOQIRD?=
 =?iso-8859-1?Q?jONWD0L7Pl+56FgnH/JR3pl1iK306ZIU8MZeEgX3Nc1m1mc1WzoOuIm68k?=
 =?iso-8859-1?Q?Kd++BlyYvvXj0FkR9wN82esdbPyF4oNQ9O8ysdwtz5YV5yt/r8GpZGWSqK?=
 =?iso-8859-1?Q?k2A8VpZBT23qJwSF7htQqFE9ElLTJPj5MGvAqnJsyjj5AFzQFs4fbuyCGj?=
 =?iso-8859-1?Q?muQhPbsfKL0ZZ91SjWs+eYzSBYaj/2onWNRzvqRK4wANe2QZyr6MXrV6pR?=
 =?iso-8859-1?Q?0bYozd1zCJtgs79C/XZSsTolRSLAtvuFucEjH7+H0FdXOdc07WKx8lcjAM?=
 =?iso-8859-1?Q?prCYjDD6mWIrWMRxSSF8LwX4I49hLwWfbqwqlJ2gFho2o7l/PnG3L/O0kp?=
 =?iso-8859-1?Q?zbysQKOUJ8Req2kcZFLHVcAWQv0s8OAk3ULQ/L5KPInvcqmXdgfi1aabIA?=
 =?iso-8859-1?Q?S3/u5B16W9ElJjpIFpkdrpsHtosCMgHVn/R2Oz5jdZNzQPqS2EqxXFpGYw?=
 =?iso-8859-1?Q?yXBMX4AyRs+E4m+63jn8xz1z0UQbK8bIxj/A3owlKH7Wn/Zlt9zdSWD2Sf?=
 =?iso-8859-1?Q?kXhhF/8iVK7vjmm3uuWYEjn/tHkZNW2KxdHDeT5OBxDfJ0m9UA+C6YDbVz?=
 =?iso-8859-1?Q?0irEhR3y420lfYH2uM9UVxgm8U9x07yJ5qjH3xLicchFYa0AyIcmTr5T60?=
 =?iso-8859-1?Q?e5YKUoskwM/TBaJARf5ZNQGyuw7kqhHZOkrHmXr0cua2MLie88pnUZJ5nN?=
 =?iso-8859-1?Q?972lDv1YdEXaUsqRVEcEyxzBxV+Nb4sNnsSoP5YqKTo0QQm/pQ9/Okme/1?=
 =?iso-8859-1?Q?aA92xgay3i3iH8hHzQXiDn/utC19vp7aJJPxbcXQYqBoExFMdujD6RxNkG?=
 =?iso-8859-1?Q?Ujde06Wk3JkEt2p51pK03t9aQH0VlXUkCeWzWMwmJTqy1+GJrl91q+6pcw?=
 =?iso-8859-1?Q?WleGwdaj7OB7tyggjD3r7zsrI7kFTz27ojM+jmFarrDAfZ2yhKGFBvKdHx?=
 =?iso-8859-1?Q?R76XXpUmRqHy93SoBYpL09RaO8iYAFGqwqW0spLhFm/Ea1CUVKrxQUsHcU?=
 =?iso-8859-1?Q?P+ZI1BUSrahLtoVsiiStiu57P/480G+vTce5JCnc8qbOHsFopqP1LFEZdr?=
 =?iso-8859-1?Q?DFRu9IRgLECRUeObL3Vz3o44Da9mr9PqaQW3Fpg0gHxK9iG4OxTb34WeJQ?=
 =?iso-8859-1?Q?eorIjM4lNCEzS4g2cl1bC9XRXaZ7cdazqU1tcrdkDganXDXT4BMk2SzacP?=
 =?iso-8859-1?Q?RTXmaJs0O4jCYtDs1F/qpUtJ2OtZ3oSbbHqcX7p5yX4PMC3SIctBsLpeKw?=
 =?iso-8859-1?Q?fMnZ+WXhlD4KCq0yf/cQGZn2PxUs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de3f336c-4418-4407-a81a-08ddc556cb8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 17:24:32.9227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1784

On 7/14/25 11:11, Weber, Matthew wrote:
>=20
> > As a heads up, since this is a bit of a bigger change then some of the =
recent
> patches, I am working on running a stress test on it, which may take some=
 time.
>=20
> Out of curiosity, is that something we could plan to run on our end as we=
ll before
> proposing changes?

Possibly.  There is some additional hardware/system setup the tests are dep=
endent on, but we might be able to provide something close without those de=
pendencies.

=A0=A0=A0=A0 Nate

>=20
> Regards,
> Matt


