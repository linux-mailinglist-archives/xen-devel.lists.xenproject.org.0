Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F29E94B1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 13:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851173.1265288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKd96-0005cp-3X; Mon, 09 Dec 2024 12:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851173.1265288; Mon, 09 Dec 2024 12:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKd96-0005bM-0s; Mon, 09 Dec 2024 12:45:52 +0000
Received: by outflank-mailman (input) for mailman id 851173;
 Mon, 09 Dec 2024 12:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2zt=TC=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tKd94-0005bE-SB
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 12:45:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f403:2613::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8476365a-b62b-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 13:45:49 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB8260.eurprd03.prod.outlook.com
 (2603:10a6:10:308::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 12:45:44 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 12:45:44 +0000
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
X-Inumbo-ID: 8476365a-b62b-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVZul+hHYNiMTSt/0UGR6MxECueAQmUl6tZybv9tVBt/P+RCvENbkGl5CmGnwMKh0Y0FMM1x3G4iaqqo5tTNujNFmeNy0R6CEmdX3hwRWxRZ4gIIvY5NWdsuPNk64bMJwQc/B3vr04fwaZCNByALEHEHHlLVtsR21PVzCyR4AnJ4+WgEx7ptPm6lO6FND375eswxaja54O7CxGiDpdKkckMQktHtw4SnqQ6IohVoIgTRz8gjYLwQEmxjRudAQhHuPStfmtb38aN0Q1inRGXeMZF2E4gKVS+nUo8zgPUSz5n5ZnI4YVTxIbPJZIqksSuJSMcPSbKWJxoR4hCMRw8YNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8bznm84kU0YtF2i42eNMqgCyDG4tsFHTXuze6cnOxY=;
 b=neESyKKaCguF2hzOXmLJTL1/gzA+B1BARAjDkLGp27W2D+bKuI7aCfc1lTLAoEU3EvKhT2IjLMtDrQsUUiXcVddsnkjbNZ5PT6q6gVNa81/9q8WoZoRpyp1Zbye26teyS7raKEAo0MWl1+wIDD8Ou7wifqzcuznHHEdC1amFJkP38DoHcVRDMJGrn5qwTktYEmaLC4l6f7nJO+BJmMolzjP2OQGh+tgnXtZEwtiIGCFL+1Gt+gA3cFCisSdmOt9tCtyM2/7uY1Grgm8KlLcfzTZ3SRHKgsRi0xerbTLjWZo+smpMLu36TZRvaKzoo8iQC3hbyzNw+XSOGewEyqx4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8bznm84kU0YtF2i42eNMqgCyDG4tsFHTXuze6cnOxY=;
 b=bv8h1ssjx96606Hms7118uLf5ghPuvoONxt9zAzsdAgge9cjsbz8nwCG9ZUEg4Ntz8ab0hA2nwp4NohZ4XI2kU7CaOIpDo0PC/GqgdtupGrR2gSLr9PgOIQdGzyoMuYAssBZZTxvVl6/nV1cUx4vWmAg++9jiOTcIlDQplgVhEb/hAaTpQalxqZO0edV1fSNDQoZgaIWhnmLIPJgJsHqSLZSOciVCFonNnTODwDEfX86A7FMJotIoqAmetLYM9brD+9A1pAuxp+NjmVVd/BOVoUulu18j8F+P0bNa/cEnt6PuldMJvTLBzruFjC7eH1bCPMFWJX7sVamT+bB3Lhthg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien.grall.oss@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbQsSdZeSazgkTckCfCx9gDu8jUA==
Date: Mon, 9 Dec 2024 12:45:44 +0000
Message-ID: <87v7vt2few.fsf@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
	<20241130010954.36057-4-volodymyr_babchuk@epam.com>
	<d6f17723-8503-4e6e-bd5e-0a42a7149ac3@citrix.com>
	<CAJ=z9a2v-96CSjpRSfn2s+BydcC=boFt7RGhU+BRXpaVphG8MQ@mail.gmail.com>
	<79bb69b0-b00d-4e3c-966e-a341eac59499@citrix.com>	<87a5d94dwk.fsf@epam.com>
	<0de3796a-b2b4-4661-b6d7-eee32be66014@suse.com>
In-Reply-To: <0de3796a-b2b4-4661-b6d7-eee32be66014@suse.com> (Jan Beulich's
	message of "Mon, 9 Dec 2024 10:36:00 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB8260:EE_
x-ms-office365-filtering-correlation-id: 4be2d1c5-9603-4495-31c0-08dd184f65c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?H1RHJESYl0tcwdPhLzratxPLfqttRJdutA3zBFIgyZodV7Llxe9x9uFSp9?=
 =?iso-8859-1?Q?X1ugMn6Ck4Qsl6OqEGZs5lw1WPKrhX5MbxeFqBvWbJyQuGjjb1et/SalW9?=
 =?iso-8859-1?Q?KB5dBB9jeQnfYAeKQFuiAp9SoskxU26kzS8Vq4ptOlmROM6/XNpNl4nGQ+?=
 =?iso-8859-1?Q?xxyseFfLCRgTdYAqQGYQqi49q07NixtXzum5zTTDrQ/76iWTwgNwU/Dwml?=
 =?iso-8859-1?Q?7jyyNSW2KqN/B/CNeLXlNiSTmn1iKxdXSmWoDht1P7d4iWELxucGaBS3Ub?=
 =?iso-8859-1?Q?1NePrX0eqy32xLSNDCz06v/iMKvg6wIDMf5r7alnptZjgr8Ju52Uo0jUSH?=
 =?iso-8859-1?Q?qoIhYVFeULx3k9pIiAB0TM8pEeJJYhMpwcLtVTSwIlyeV79TN2KmEuX7uT?=
 =?iso-8859-1?Q?34bCXNMDqHui2uNCy6PYpVHymsx+K0I99BBlyou9g/REoAbc+FwXwnJBV0?=
 =?iso-8859-1?Q?jUb+9UUuKfu9+dK/cTO/BTZUUmsWAQg8PBrId49dFrFGJymivsARTtPHAh?=
 =?iso-8859-1?Q?E22Qb87mF1u+iRjWKf5uUgOUuKPpyTCUgOGUMedwPnISOXYVVNP12xgdsE?=
 =?iso-8859-1?Q?kBu//CnsM5PgQSByHHrgFUbSdZIkRUfbv1Ow9vGqEgRznBP9etQuRwcYIV?=
 =?iso-8859-1?Q?zGpYWB26el5Tx2S+A1EbxCPXXrPztS34wdRIVSK/0jbhbPXJK++iMl/g6Q?=
 =?iso-8859-1?Q?D9A3Qvv2FycVKjrfHjWF9YlqzoQqJ/Rrugo55z2rJFvWWY6D56RinLRRM5?=
 =?iso-8859-1?Q?82ao5vd+W124umm1aIH1TXPcaPoHMM+zh9UND0NRxZFuBP19acuZjSJzDg?=
 =?iso-8859-1?Q?73XxhqDbDAype9llBAatYTHKpvV6vHWiPVj+gggAmrgMnwr9De7XyduQHo?=
 =?iso-8859-1?Q?l0lhvIticMf8DS1KNTWT3balDVvJyxurbJZjPwIjJKQEUYudV1IOpnwxuk?=
 =?iso-8859-1?Q?XZ5EgF1B7/IrU2/TP0X2f9ZKHq+kHKZhBad1rod03Rt9OgIwJOYFdRaqlg?=
 =?iso-8859-1?Q?SJkvc4UZIazyNkslT/yAi9OtPMurwiJE1PWB6h1Gq7i1Fl9aXp4eDGhs9R?=
 =?iso-8859-1?Q?zbYiFwSAYBDqVmWTX62V6zkAoFD3KATI/TcuNuy+Q21Wlhot0kVpxcSN/e?=
 =?iso-8859-1?Q?imwdhYLD6nz4QI4skA20SoFEjFLh5lqkouwSw890OIXpQSUNO3qhGyBXxr?=
 =?iso-8859-1?Q?ChcAKs+jOiT7ikx1gEwf1UVInvyGUBVOAp6KXLCzw/6wbk1m1S8BXK2Dy7?=
 =?iso-8859-1?Q?2YfyJZ1wnUpqNoy0r0HF9JP7gXdCsOtgHdoKtICr4D+r5F67tkT1RyJrPG?=
 =?iso-8859-1?Q?Qb09xB7M7DAMB1n6+8t8ayJs0G5nz8gNxQEKmf7ek0aJ4WdbpPBRBAAmrv?=
 =?iso-8859-1?Q?ZwMVAPwDMmXAk9LGlR8ITBUWv288pcnjy3ndcF8sicoD0HKsAcg6BFBbI9?=
 =?iso-8859-1?Q?nRHFqnPxiCE6mNyF8FkvwF0wtk0dP6tsG9cfWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?F6rY8kGg99gXsb1dMScMM8ia9BhEF4gJJ94NDZYR5eBSfcSzTAuCp7fy/G?=
 =?iso-8859-1?Q?l5u+RhMCIOb7/1lxV2TjUWvmsychlzjCB1ROX8yQLG5KZ33hrjTG/Bidav?=
 =?iso-8859-1?Q?bh/uZZSstEEzZUmjMyLXnUB7v3da28pDFt7kH0qpgRh4ctpzsAbEpdb+zB?=
 =?iso-8859-1?Q?G1zj4Td3dao8jR2QxNSkYZCm5edxSPBzSwzJOCx7/ca2nzC6p0oRCJKrkK?=
 =?iso-8859-1?Q?6Fxj/qKpHBlNTPmrNjEDhyvzNOXvpaHe0MQOd75Z8GETEtQ5zUFgdr6i8u?=
 =?iso-8859-1?Q?fAL/WSy2yi/9jzLFKqR4HG5gOdpwfDLa8fBx2p6U2ql87Jm9x3N6tU7txU?=
 =?iso-8859-1?Q?JfsBy023QreBLaC/etDA540vd1UYuabw3SJ6VJC9SJEO3JBsKmDKybxEYN?=
 =?iso-8859-1?Q?t9mfLT1I0ifg/5ubJ60MkiQa99YDDupaAOc3XVUFWdzRBCEvk4dp+1XX77?=
 =?iso-8859-1?Q?Y77NC2nVdBcYHUO6VSMNztwmJ8A2s0CdSmASxIDfUF5cju2UOpY4QCKUiW?=
 =?iso-8859-1?Q?TxXTsKaVI2NkRInZSzsdxbS27FGXv0QYYtMxp4zntV0e9f9Z4FqlKKbRIR?=
 =?iso-8859-1?Q?b7zItk6fQlj/iRe2Xa7pQ2JX/17PkkrNtahQYAJ1VBv4Hc+Y8nx7gVqbeo?=
 =?iso-8859-1?Q?w0Gocst1ZVtQOsi7FSOUhHggpUpOAHIMALQQFUUsi0zIjRn5v3anZ3BvRK?=
 =?iso-8859-1?Q?LmiPRNwAv6VLD5npxjv+tHnxQfN1rCR/RG6844qp/j2U7JzVxdq8QbYfsi?=
 =?iso-8859-1?Q?EJb7jeSA2NyUpvQuiNyW/5lzk8LwF+k0Q0ByqBcLw1WnQbtzUpm/pIhJdj?=
 =?iso-8859-1?Q?64x+ny32WOzeAFtaEy4JT0ddoauMSKsCb84c2OZsjPjsw1oFSZUtOH4Tsh?=
 =?iso-8859-1?Q?OxUzpa9jocIzWvbxNTRr8ofbnDlZouv29fXuvFHiv5NoVnRbqh8zx5Cc/M?=
 =?iso-8859-1?Q?oGP+Ci0MhAUzC41PZgpP+evR3gzKO3jZ46vbRMIYNM+7efomZUPUMkX8k9?=
 =?iso-8859-1?Q?MEjCzt8i7gr5N2556l/vRuIU7R2AUtg8Cp7EyHImBFY9AyNcjDLo+s5B4t?=
 =?iso-8859-1?Q?NbeakVgaTlirX6Wfy9JxmMvv2HUx5WNyZkgGK/S2AUMIvI9JsCoFpgJJ/O?=
 =?iso-8859-1?Q?e82yhQ+wx73uM3VcZR7DXOSvIblOOy+PE3+UKEVwNtOWcShOZdYOod3wlG?=
 =?iso-8859-1?Q?8CwxIt0t6nEDWh0zcO8QcxuqceWS04fhStnAXhJihUzBRtvNdYZTg1uVgP?=
 =?iso-8859-1?Q?g9dvWiI/u4GHCQK6Q6/y3IXtxcoeFC+YqLtCORbSuXqyNj+HQtkTIExDyW?=
 =?iso-8859-1?Q?DMcwFsFjAxV+5ggk/sobtGKJxR3kdAqmonX6cUoqfs5hdDoWrqGHU9ae7W?=
 =?iso-8859-1?Q?8/WxAOyIkFJo3bdB7h90TpW5QAFYW6rtnlyTpQfa1WA3c+yqdY+gtop52r?=
 =?iso-8859-1?Q?OHcrroIs8EvpVsATFZx9cymlgxsbPX4r88lkzBNQP/3+1h6bt6qX5Dx06C?=
 =?iso-8859-1?Q?CElB/AS2F1QcQJY6p+swIy+HBgGt9lFrjsJRKIsJGs+mBHaxMOMzyCM9tN?=
 =?iso-8859-1?Q?tWy5Cp2ZUsnuzPcrUci4cQGM3YZSD3xtgdiWtt9X0MTyO6N2hDp3hyZumL?=
 =?iso-8859-1?Q?6oP9YnqyuMYRSqIR2JHT3f1cBIPrZDvsQxGJnDXE7ejFhujA2Kg8HWjQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be2d1c5-9603-4495-31c0-08dd184f65c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 12:45:44.4886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTGy4XD/qUL2yjb6jebczLZnC8JxuVhr7csbtchyK2PkT9G/1mJid86FsqFKsoN/QyEh1L93glfDO/Tvp1jMmIDdqokx49E5N2aqA2NbYXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8260


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

[...]


>
>> #else
>>     const unsigned long a =3D 2862933555777941757;
>> #endif
>>     const unsigned c =3D 1;
>
> I'm having a hard time seeing why this need to be a static variable. Its
> sole use is ...

It's a constant in a hope that compiler is smart enough to optimize it out.

>>     unsigned long cycles =3D get_cycles();
>>=20
>>     if ( !cycles )
>>         return;
>>=20
>>     __stack_chk_guard =3D cycles * a + c;
>
> ... here, where you can as well write a literal 1.

For readability. Formula for LCG is X_n+1 =3D (X_n * a + c) mod m.

--=20
WBR, Volodymyr=

