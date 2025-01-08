Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1AA05626
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867005.1278406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVS0i-0007ay-IU; Wed, 08 Jan 2025 09:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867005.1278406; Wed, 08 Jan 2025 09:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVS0i-0007Yt-Fi; Wed, 08 Jan 2025 09:05:56 +0000
Received: by outflank-mailman (input) for mailman id 867005;
 Wed, 08 Jan 2025 09:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7HK=UA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tVS0g-0007Yn-Mu
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:05:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2608::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ebcb78-cd9f-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 10:05:52 +0100 (CET)
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8736.eurprd08.prod.outlook.com (2603:10a6:20b:562::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 09:05:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 09:05:50 +0000
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
X-Inumbo-ID: c2ebcb78-cd9f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCYuZjiD9FaU32GSX5/40e4/IZ5sNNdSSC281RC5uTuFjIOAhgop+WX0PqQ3VOx7/zE2VQkkeQ4n/OuCv8PgzrD1nnfwaq7IiFg7ujrecl0OVo/88NTxrpxuifzFiMbAk/T6zlyoV45wyMNp3pU8iGqoA88edCaqCc9OxLY48kWkULNRIrecsfOKuukhlYcNh/Si7lWB1GGQaV8yo4qNFgld7Cy2e9yLXtaUMWz44IN8NdSEia5BAYOXVRt76cI02rfF1OtektWRcDewbYDf2wnOPRMRtETf5n/sQsNCpH7aLmWSaOCoTZyd/JeBFMk7CZH8vKUCXzrThwPHK1sr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrgEw1leOnJXl5rn8f72Pu/VyRAlhnHCiCAQT/coVkk=;
 b=PfJvHTQCPvVo2K3s6RCrXgz6dsydY8WTf8V9aieLWH5oJVEXQa8jBQDgm+RfkuSkban1nydxKPx3XlNRJKrtC2+c2lt3fJ+C6MH5Avt5AlVJot6LKhWF/tJVbTwiWt+6RNeui+1z9ktAcs9lYCtAcSBW2afs9PWuE900xt8mYoLpmdJYdrEJUiPZQRGpoPHoJ5UUO6tyhgdIarXaXmEDqPVJr93Za9y3dslgQY2RXxuhn2Dozy+WGjARlwHSUxjMssxm3aSgA/olIWucApl42Sx1zbh7ZrVPc9oY51BszrTHrvK1jrtXW78LPAqAQtNeFCYjHX9YzhDDuTiIuR6HNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrgEw1leOnJXl5rn8f72Pu/VyRAlhnHCiCAQT/coVkk=;
 b=aJlGhdGqWrXELS49nkYJ27OlpFRRtn/NbfHj7c5G9SlXrkBwGorMACZ+IL+IFFIIfyZS6X935dIR/uXwcqt1J31K/bFwF6iFhCDoU6QPvOFjersubsCFkJ1SWxLr8/BHrVbjs0Bjhy0IdyDcueTAVqDukrbsFKs5hqmSdL/51Qw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr() stub
Thread-Topic: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr()
 stub
Thread-Index: AQHbYaMBWdxQ1v99706M5qRoUKAKv7MMlHaAgAABJYA=
Date: Wed, 8 Jan 2025 09:05:50 +0000
Message-ID: <CCE48DA6-D7AC-4C46-B6E6-CFF028E944C0@arm.com>
References: <20250108075719.84967-1-michal.orzel@amd.com>
 <5DA66273-7255-4EDB-A3F5-C1F4F61C9CE1@arm.com>
In-Reply-To: <5DA66273-7255-4EDB-A3F5-C1F4F61C9CE1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|AS8PR08MB8736:EE_
x-ms-office365-filtering-correlation-id: b9b2b44a-9a81-4231-683c-08dd2fc3a5ad
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?t/lmjo1WmS3B98EN9IfpccnGWFwcmrgRDhVWE82hHMSJw4ZRr2YXQK2i+UN9?=
 =?us-ascii?Q?wmWHtP64eN1lH9ANxHKCMY3qoZtGEF6lB16hmwRqC7bv72UFvx5SaYlG+gDF?=
 =?us-ascii?Q?vV/4Z2gCQjOrzgcApqOa5KLe/yZqb6FXe6X3STn2+KEDAPt3EPFOnId3R8AQ?=
 =?us-ascii?Q?Io1FNQ7KA9dn0B2Nx2fkjX6LImQVdAq/ViBNlZguDWEl0YJG0xF+vNYYitsS?=
 =?us-ascii?Q?HczW+Fi3IpgoAELDUrpry9NtY1kEBngUrUI7u1fs1fgnvUTpHybfFx0fbvtf?=
 =?us-ascii?Q?hOhw9pyp+8RKRZZFiSAXCS/Yfo5qWa/Qf10bs2eS2ZYt9y/dDVQK/kHSVSLJ?=
 =?us-ascii?Q?8HzsFOTcRnU3BJlJKC8Qj7ayVursQxatPn5psBDYjn/DjdegoCaalecSMX2Z?=
 =?us-ascii?Q?3u6+Okx3uBRnu3RgGdz3UJbvAZUo+ZUD+a4WqXOvCCoShjbEMu8Do3z0WIbs?=
 =?us-ascii?Q?k0ThZuRCUihhth0OfJxpZlAb+6qYeugemqF0Oq6L2cdGVdg+CpZC+7nE9/D9?=
 =?us-ascii?Q?O3hqxUGqiLOePDU+zF2MJjFAsj+JpOIb1EN6zu2i+FDsP4qTWrDda32i47pa?=
 =?us-ascii?Q?+QeR5ZtqjP8nMrEqgDfNjeXXskAliNvRVeHCrq2u1qCjCUXK9HsL3vO8scd8?=
 =?us-ascii?Q?giR8vBWsQCRAEjxdKCQXgPQRMLqaYLoswXXWRIalpaE36P6wc/6p6kOy5WRE?=
 =?us-ascii?Q?lMbz+9a54trnGthl21ozZayRs3ZUtmRbbumkUjVcWLX4kOkzUP1ZdAmKj8uj?=
 =?us-ascii?Q?bx4oCqjYGI8CfHbjzxOBBvzoaedaPsK+RSkLOHL4OT57T8tj2hEYolEp/iO6?=
 =?us-ascii?Q?tmBkAe9pBh7reMb4qasU6OT8ZccwqTLx1XRkIj2g5QCaVeXCHATiBunYKkAe?=
 =?us-ascii?Q?2t/iw/cp/3Ra56eSw8CntJqgBTIgKkjkjIO5X9oeMzJbWbdCb5KyvLfbfHS1?=
 =?us-ascii?Q?JxKqs7VUHP2tsayRLfxGLaw66Bo/2yhIhUdrzd0P7uu6JJlOvZ61OIP28fwi?=
 =?us-ascii?Q?51nAPkY/xCY0jlEUEyt5kO9UHGSKrq8SOdyK+N/Vq1sbniLr32Huk39sBJ5h?=
 =?us-ascii?Q?Vvx8K+TzaPC9l6lJjxDSlgyHTzUMtdaoH70Di2+4Ag0KMwh6ZCBLy5bm/A6F?=
 =?us-ascii?Q?G6IzoX9FIpfjisgo50Nbse/j6en0/ZnUBAd6tMkwECA0u9wzIq/I79/f8t+q?=
 =?us-ascii?Q?kvtBaLjQtjIF5GHzBPTJ7Nw8mpM1eS5Vx6QrENRqpQtYNA+5yxnw4DDmC2jp?=
 =?us-ascii?Q?/lxRKfIL+V26sTmnkL9gNe17YQbegn5yL+jvGufGirUyOdUNH9IBBZVj9+CB?=
 =?us-ascii?Q?/U0iI0+7J0M6aFlOD+1t8Xx2CSnVn5G4Az/SO92YYEAJec94cvIHvMSQk1EB?=
 =?us-ascii?Q?gF3gsBvXLFjItQD6/gnhKjsWbPxR0aHHiIVvaiCd8opNVzQVROsVJPOUXdbH?=
 =?us-ascii?Q?xATr/ZLjHvRqBtc5qhVBA4HyzIZ1tl4k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JdI5xvNnGgfzjk5IoeacVjdKDwogk5+af7K/0YlaqAH3C59NlJqfdiS/X36K?=
 =?us-ascii?Q?uxhNTm4ZGuSKvwT2Qio9D0ojdbVJWQtgBoBz7+BQWVd8yuiHbmUyyQ2Zx1UV?=
 =?us-ascii?Q?hKjZ5YlbF3+ISQiNCpXhzq2XmaumQvn8k9tkbeHaUCj3B/6XnyWUsB4jTNw7?=
 =?us-ascii?Q?HjiAh3DpjGw6QobP5SYGpZTCZwbYJYGw31MJ78biaZ3wB00O0yeqeCl0Zg1+?=
 =?us-ascii?Q?+YGDDLn9yQjoG/Og8uQcOiKAaVhh4EB5njukgAGFWfgznRIAibV1YiuojFUS?=
 =?us-ascii?Q?q1TFeT+loGyd8ZOquf+gMwVRt2squPSg3qgvIteLY3y649biMyx6C0oPHdC5?=
 =?us-ascii?Q?22kYBshHpULuDdiryErWOdIE/IhNUbaEPxJ0Zqnuvb2y6x1VdeHtEQyOVWiR?=
 =?us-ascii?Q?AvjrHejsrF9P31JIJQrsIAmiQbrmnzhlu0Z8OYtQkBUlrOFZlA5cnEactJAA?=
 =?us-ascii?Q?qP8d9BuKatnhg34uK+cj+tEYlXBaBTiqV7bRfxOJCnC+OmKLdnsVVA6/BXca?=
 =?us-ascii?Q?xH5rp55sipS57b7Z2QA9nys/E3Zrpep5njSp7QyMHhPtCeTvOp4vY+TQEoHw?=
 =?us-ascii?Q?0Q2ouZouR74FV+LXpFr4l+CTofO1qlp3gDg7trMrnncMxLvlB4xg7x6ILvXB?=
 =?us-ascii?Q?h1Qvtr4B6+EquGyR7/1srt1e7qYKXe36vDl6D2QTn5zVUV/U7UnazgFtf+0L?=
 =?us-ascii?Q?txkiqieLF3TC/u3FaniUoFe1cezoRchg4gOptgVBvdLowhaWEfj5JEXWi9sj?=
 =?us-ascii?Q?0wUpLoQw2OQoircPUJi1SxZyz/nsvPUx9SvbKboTAKxBB0eZGNmrUuSRUOED?=
 =?us-ascii?Q?Vh8HcNFJNPthpqY8kiuijGenv76Ylg9fSgnEUpyaBiZAth2/cDJK92o80SQ1?=
 =?us-ascii?Q?Qd9IxXkgQTYX3TKwanLrHoZSxyTx/wV7ke8DlXSbHbj6DhFHtbVtm3julYX6?=
 =?us-ascii?Q?orZsSopN8fAnyNh/fOX383e9kGjB5LDUg78Dgup3lH4sBsfXEMIP/9y2bItJ?=
 =?us-ascii?Q?ps2J+ixVS/lMIOpZ4Lmz3nQFioI8MQ8f6t7ZwMS9R2cqzmqpdMWKqRc93BNC?=
 =?us-ascii?Q?cCaG4fuY+t74lYrlG1khWeGDRKk2IZelFjRN/EFkudxeg2+VzcK0599SLEmj?=
 =?us-ascii?Q?hjDnYzXVerHW2lVcQHp7/v62iJMnph+5BrLt7c6JR18sPAreU/wbAc2665/S?=
 =?us-ascii?Q?jl2L5YngYw6DwaCs+16Yrb9zrqqIhCDimU87btxXHMTUaLiJ4Jpeowp0UIJr?=
 =?us-ascii?Q?TVgqGVUKjPImmke30Zlq+v1QZLICE8WnVx9zeLvh6aLEjFVrMU3TMdTyHsW3?=
 =?us-ascii?Q?5vgz4ZJJn8JxDAjG/vraOwGlT9CxO6Oj+7V7TUhDsf1xdTqLFe4lnAEP0tkB?=
 =?us-ascii?Q?ZhufyfTKkYlHAUsS72aKMZYMrsEsHFxA5kc/JrYnkZ3BCp23bWf/IWDerVS+?=
 =?us-ascii?Q?XnbBtDJhCuJgT/ou9pfgHjPFxVyVrct4xUvZvrDcHJU07E1O088Byj9ghN/2?=
 =?us-ascii?Q?3//UjNoGlbiXalMI25LsGE5rVeC1Hp2+A/O20Qu3uWIR9/gL/55IiL06OAZC?=
 =?us-ascii?Q?dCEJv37uBA3JHmZu4gjDeaweVIJpVglVFGhU/Maop1d3L1cyw87oSbHLpRXo?=
 =?us-ascii?Q?6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <171F9331EB997F488DC8366492AF6E15@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2b44a-9a81-4231-683c-08dd2fc3a5ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 09:05:50.0926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7qz9n9rUrGiMpLSOwCgdVV/M1xVaP+0PjdmYxsCoPJbm9R7fB398rjxBuiyySONfUgdiZbCkk7NK+rwtRd6iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8736



> On 8 Jan 2025, at 09:01, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 8 Jan 2025, at 07:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>=20
>> In the original patch e7a80636f16e ("xen/arm: add cache coloring support
>> for Xen image"), the stub was added under wrong assumption that DCE
>> won't remove the function call if it's not static. This assumption is
>> incorrect as we already rely on DCE for cases like this one. Therefore
>> drop the stub, that otherwise would be a place potentially prone to
>> errors in the future.
>>=20
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@gmail.com>

Apologies, I meant:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
>=20
>=20


