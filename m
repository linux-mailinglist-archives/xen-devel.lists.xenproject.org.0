Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D647ABCC519
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141092.1475699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K1-0006eB-FC; Fri, 10 Oct 2025 09:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141092.1475699; Fri, 10 Oct 2025 09:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K1-0006by-Bf; Fri, 10 Oct 2025 09:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1141092;
 Fri, 10 Oct 2025 09:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K0-0006bl-L7
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:21:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fc08b82-a5ba-11f0-9809-7dc792cee155;
 Fri, 10 Oct 2025 11:21:54 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8809.eurprd03.prod.outlook.com
 (2603:10a6:10:412::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:21:51 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:21:51 +0000
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
X-Inumbo-ID: 8fc08b82-a5ba-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op5ButVrSPdq9nSwPdVXgP+I91iapglpeoLw3zpG5Xl8H1l40roQeNTON63o6HmwkI+iZXMmNGnqufbRdJ5GgqEixeu1xOOkLE8MPVs18e4idfORTylK3Jau6knm6/re7OeIujpT4xGN1mgmrFOFSlSXF8Fz8vrp8TwfAqwrS8QnCdfJ1A8q8zPH8YtBXFIHQes3WUGkDk9cJqzyFBIpYNr7opPNInPwBngT/mN8hWxIoHMjC1vwhTZEDsengBGNHbpQRXZsOhdn0G6HEyyx+dEevhHbV9yFFXIWB31SNOFnNdicQMIPDCMaYVoi6uao4839xVyjTOssUXBXg911fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX0RumhJ9TGU3e9zxHggDBrHvYZsEQgDaBIj4LiJEEg=;
 b=lkHRzqo9jz613ovzb4Sz/0Gd1Rh4jhN/3N6FL+NpxGsi0AEIoNFtWNgApG/bQegfWpnnjIra/PQVG797aTDWtubE1J2xL1UYG/QPYq0iIFgaR5liu8p2/I+7tOmrozOQzWmJZZE8v2iCikpGKqzGd9wVy+ltipIa79ugG1u+sl7g9YsJrIfTX0Y+DrIcxgY6t5LF0gPZNJrDU9I1G02qDz9uQ0K/FfNOqztwUpzXroFr03QpWGZSPZmk1yHVnSeEv08hwVQ69V6kAArFi8HfmUSh33A4IKPsdTza1ENj4Fva4hJAcrcNbtdBgj6o3FWacA9VayH903x0g6sBJSeo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX0RumhJ9TGU3e9zxHggDBrHvYZsEQgDaBIj4LiJEEg=;
 b=skgUPIh0PdjuyVUWqjOngoG/MUARdFJvIvNnA1IJ8cqQxc8jnPVMocYfVI7d0REurhwyWnRF5xQpLZpFvgrO5jIDKywqBXGmcU1O7G3xcmq8hxZJWb7S6xOUqr0QrQhpm2ZgIxqxzGL+jlIhTNMCiIXNahMpv5eS5oDzrGl1w6uFa+TcvQKnrMGzEiyJw/NFVAwFw9Nu6846BcQbsO6wgyO0LIwBPu8HbpBZ9MOeHQX7JkViET0RfZlLChv+QtJrJCBlGWEKvZORcdDYyy/cGR23oFjqATjzfJQndPKaCmdJ+vjaz2ijptZRPUPIr6hKkhiW6rohLUGfu3rirLKseg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v3 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHcOcdPI3ki3mxsgkWwwomwd2VOcg==
Date: Fri, 10 Oct 2025 09:21:50 +0000
Message-ID: <cover.1760083684.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8809:EE_
x-ms-office365-filtering-correlation-id: baa4d263-8de6-487d-db1d-08de07de71f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?P9XulmKX0tEVilA3Ib30q8J1+HUx1RCK5DBMkcMefSlcMZ/iv49NzswVIu?=
 =?iso-8859-1?Q?R3UwCKAE3A/VFv8K1y4v9DkHbatKiDDNkbjHhK1IfB6N/qgfjTX1WQAVr/?=
 =?iso-8859-1?Q?eme/xvMVRUoNugW5TzkuYR34qyeRhhxsw9cx7ecc3T7+LtuJsIEyYfpJqg?=
 =?iso-8859-1?Q?/gajKHPobvcOkLfIVkvP1GwUK+A+zO4xF1uqduHrRQK0wEuPKTCanAxRJZ?=
 =?iso-8859-1?Q?qY0jj+8YRl3XMd8PWwPZGvM7476oC/OWAVsYivjGRnp3eLnTz36dFZJ6Vs?=
 =?iso-8859-1?Q?uDMfauYZw7BAN7aa73Pl83ZDyUcqky7p6nIz5TzfR8Jss/sbKuZ/t4rC/M?=
 =?iso-8859-1?Q?M4Z6iVVuq6nSNdVwVuUsAebY4eToy1JJgSB0UU6AaypHjFZIlfyMgoQ2Qf?=
 =?iso-8859-1?Q?Vie8jn7c/BhYZl953sDc9WZ8N/2kXIHnQbWNSZguAP5VwceuEXAfoouI/W?=
 =?iso-8859-1?Q?xAW56kjO9DueI1nHJHpWEDsyHj5BrzCg56g0k80SS9V1byF+XzgoDIZrTs?=
 =?iso-8859-1?Q?i5WnT8VMeDx2qH04sX81Y73A+7pffqblnOApyUb2DQUHEH/datffDj0nqh?=
 =?iso-8859-1?Q?tqFujXBAtd1QdGyS+DeM7oC3yFx0PU67XNj06pCaFfkIl3awWZixfJ2vQD?=
 =?iso-8859-1?Q?SHj7f2X2YlCXe99ki5ta9fsrO7psJS0pziP0/WefQD4rQXu8DbHJp8zi14?=
 =?iso-8859-1?Q?NlbELOHPV1vT8Gwge5DnVDKubemx2gyZmoK8DSL3cN7pyWYbtDc9DUivgP?=
 =?iso-8859-1?Q?2Tq7pwkym0qjDeBzjVEReZ0F9L7bQ3DOBlC4eM4tJui7iLkIR95UaLWGIy?=
 =?iso-8859-1?Q?zFA8xHg/CFQPNju4qg1gqk4auLOq4+xLwxsbL1sQ2+Y0PiTRRUXF1t165Z?=
 =?iso-8859-1?Q?G0xpxL+xZWcBpHyuyHDOYgwZdqX7gVMuBppgSJ6Tfrh0vrywhqXxH1UWyF?=
 =?iso-8859-1?Q?UtxmnqzawD5bm27AbKXnAdWzQ/aJhiYIxY/vscphfIuC3vn0OvKeCDpUVc?=
 =?iso-8859-1?Q?lSBWEAM0bXg7vc/SflCtQLAB+PIm5AhSJNZ0nP3raut35C3fX2ykrLZ1wz?=
 =?iso-8859-1?Q?QF2CM8/VIcDM2f0pqMh7FozQUBfteNbMTZUivocnpp2kDNEq9xr931XmOg?=
 =?iso-8859-1?Q?AVe3vZvaD6cyP+yo+x285nYIa5lJ6eU+HOPeqMc1HFnGKDryDHnW4BA4YH?=
 =?iso-8859-1?Q?HB3kgPBLrbK7JNUK9jscABb1TwJLweeTWUA3C1eerBhk7ITRfeLNwImXTM?=
 =?iso-8859-1?Q?UgenlihEKLSONSlNhHBePanTH9InveJoMmEX/O7Xcju/aic/cTpcLmF5zQ?=
 =?iso-8859-1?Q?YZUxIQgp8QIBPQUpxTNsZxR7Ef+5YULWde02G9fB7AWr/E1DFUTLzcNcZh?=
 =?iso-8859-1?Q?5I/3MCB3bqaHOEKFPkgjeb4OHUF86LgukqAW6axfoe6Vb3QtRFr4KUh3fu?=
 =?iso-8859-1?Q?/9exxPpIafUysnDeHuHRvYkVwH9SRnJXSutueLgUNiO0QmI2DacyBVk+0Y?=
 =?iso-8859-1?Q?8sXwGixE6zWZP+/OivG6rFo3K9A+6Ua5M03lhkaHnS72DbqB0buYraoOeF?=
 =?iso-8859-1?Q?eyrwIbhnu2AiF7yiXoxXvL85omZO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hFFWb1fPifmF2F4rJU9FqjKtk3wPU6CYOpXXjOyYcyLnkpyqyv9A7pJbL4?=
 =?iso-8859-1?Q?AsPYBrMjqlrDV7qJhtWwGDw8x9gcZFbpggwoY5WAVIuIKwhZamTMXyIAqQ?=
 =?iso-8859-1?Q?sFk6bnZBeWR/oTyinWQL64dYvL0iMn4yT+N6VfnOniWNVyK+W4IegvmD2i?=
 =?iso-8859-1?Q?j6p65G2coxNp9mcXZO2f0qqz/JEM7jh4pAtxb466+WbwAkriBgxp0EOI3e?=
 =?iso-8859-1?Q?ZuXeVOp0x9XspPcBUdCeZlvY7X+pqIMJh8n0DCAT3yVf2Rdyr+Q1+JmVEc?=
 =?iso-8859-1?Q?cTIsv2bF0gE7PCNyJPhtVVSvhiOIIhvE8Lmhvp3ofJ2tJ5n/ck+kRYbAgf?=
 =?iso-8859-1?Q?vvRahLR2LscG5GB9UGxK2grROyW0rl0+Q8645/PEGi8xHkEKkyZq7BXjzX?=
 =?iso-8859-1?Q?1RNfFw3jXf0MxEOXcGz0X7Av6F2LsfN2HAiVryD/6S94MjeycYUvpZBW/e?=
 =?iso-8859-1?Q?ueGenDVjmc/WvWY7FmKnsKdbl/XoHrUteWTi0D5W0JjCi64w2tGVyIUXts?=
 =?iso-8859-1?Q?b/HIkGTID703yzXsG7TC4lG3MU2Hqo7HBXJqC+kA5KgjRQdMEIWRRBabYI?=
 =?iso-8859-1?Q?3cw0WdM+oVq55dBrYOVAZunjjL65hEQeRAvWbx5rkwLamBcndUiYRSdQwF?=
 =?iso-8859-1?Q?wCElvOEeFZWZUTU4ig9SVGwkvR76iM988QKyKjHMHF18mZqRHQEo9fcV/z?=
 =?iso-8859-1?Q?ate/SXaS+bbg7DEVcIgvfsSE3bGZTsCmHNx+iFiABoygYbt8gFtT/5jRxg?=
 =?iso-8859-1?Q?zIkbGV3h0y/Y7qlTGmzmTGrp93LsBHlxvbj1VhQO6KSO79Dzywajk8NvyX?=
 =?iso-8859-1?Q?OREBVbR4WqwyFcRIa54cg/3fwIfiHokC4HTW64zoYG6VIjzpqKGdjO9L1w?=
 =?iso-8859-1?Q?Hnb6rlJgJ7UUoDeoEGiy5J0h7Nf6zvt09f/LJvC7H34xMdx/H6cgPZ108i?=
 =?iso-8859-1?Q?3E64O6IoHy93XbP5TXD+Ua/0PPghHVvyjBskpxc9DdItrDvnBWYWEGvvFR?=
 =?iso-8859-1?Q?FIowA66EhO6dEgM65OcNZuMHIYsUYjrTvzVtJ/Fz5Cd872vqdHi2VUYFna?=
 =?iso-8859-1?Q?tLAB6J9UpOMvb9SkHIKFqbN88DDl0OjG8AQS3pTFygnsBbJ8Pfbje+Z/64?=
 =?iso-8859-1?Q?VBf1bHiAy0tgU/+hbsY01QQQSS3N1p85NCo/OncOsyTMWquC0kCfLtWEvm?=
 =?iso-8859-1?Q?GhwIhMNPuiFXusCuoscOUVJ343XB5tSaoRcqa79UAiKDdPeebwL2uwVdjM?=
 =?iso-8859-1?Q?xwpzcFs2BWn6O3mXtNwf1hOp62Awvkh1oQnjn/obBx7hJ1OHjPFSj/mGYA?=
 =?iso-8859-1?Q?CHaJZDAZ4DXVO5dOMvV2Z1+sEkVzMnnnV/KqAVuyIDIec6kqpJeai3nSaP?=
 =?iso-8859-1?Q?2E7lz18N4cQlKVIVSx5pTHDoUCHzf2KKyd9T0Hc57ciNAeDLiNv1JI/9TE?=
 =?iso-8859-1?Q?oqwpa6Vsfm/LyWv2KrjDAuNI0GyJk/Ionv4sucoguecnQE4QA4G1qe9a37?=
 =?iso-8859-1?Q?ZnDNeRewsneT/W9rRmWfJcn5GioefZWEtUcCf0CHfIRefzt+31MazT0poJ?=
 =?iso-8859-1?Q?3i2g1kaR0+5BzBlQFKz0rXlqEYkvBHI53oD81jQxHFZ2UH0qORozCwhux+?=
 =?iso-8859-1?Q?ZMJvu+ljn7m0/pQOcr5Eezq+Tdxz1JI/AMb0eiU/hbYmyXdsIPj3LpGw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa4d263-8de6-487d-db1d-08de07de71f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:50.9222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfByjsrn3GeVPwHWw7QPhKXpoWQ3sNlf9bI8vfWyOZxoVv2RCCk0un/7mPKgmS2j+3/h9gNW9WSelihmhRsz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8809

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
2. timer and GIC maintenance interrupts switched to static irqactions to re=
move
the need for freeing them during release_irq.
3. Enabled the build of xen-hptool on Arm.

Tested on QEMU.

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (5):
  arm/time: Use static irqaction
  arm/gic: Use static irqaction
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 config/Tools.mk.in               |  1 +
 docs/misc/cpu-hotplug.txt        | 51 ++++++++++++++++++++++++++++++++
 tools/configure                  | 30 +++++++++++++++++++
 tools/configure.ac               |  1 +
 tools/libs/guest/Makefile.common |  4 +++
 tools/misc/Makefile              |  2 +-
 xen/arch/arm/gic.c               | 11 +++++--
 xen/arch/arm/sysctl.c            | 45 ++++++++++++++++++++++++++++
 xen/arch/arm/time.c              | 21 ++++++++++---
 9 files changed, 159 insertions(+), 7 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 mode change 100755 =3D> 100644 tools/configure

--=20
2.34.1

