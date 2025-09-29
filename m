Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA5BAA605
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133279.1471442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Iq9-0002TL-CZ; Mon, 29 Sep 2025 18:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133279.1471442; Mon, 29 Sep 2025 18:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Iq9-0002Re-9r; Mon, 29 Sep 2025 18:43:13 +0000
Received: by outflank-mailman (input) for mailman id 1133279;
 Mon, 29 Sep 2025 18:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6YU8=4I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v3Iq8-0002RY-FU
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:43:12 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 262342c5-9d64-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:43:11 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB6591.eurprd03.prod.outlook.com (2603:10a6:800:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 18:43:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:43:07 +0000
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
X-Inumbo-ID: 262342c5-9d64-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRmsnyb24Pb/nP5ib2DBrYcL+jI0hrc/db+mRE7yJ1sEu2fSR3DbAQrnhes09ARgW1Z6Mnww5k195xSCTHq+p5KruFogRnX8yUJVWiRG5/K2KTzOYD9sXuNvVYUxpLF/O5g/vhJqfb0jPU8wI7d3etckCPduhdg4PQXbH9YGKZhgpVifxeLShdJKRkEdthVx4u3/ZMcbp1FKXKyoNquEu8mh3+8LghbFXMyCFfMwRAnUNOcdUT+nZPmZbk++UiVqY9Dp5V3xPuvNpm1qCmmyGwGyYkkZmap2J2HPuMynva0LkdwlywRklHOyZiwk4wd9oDw9SukT9PQJcV2aUElMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hod+ok9gZQR1VO7WzKktcs4SVPap/lHUMu0mmJGz44A=;
 b=VjlJOYMPCExB50b1Ta1t73ootM3QUHYDlsspeQAsirzqS6wZSelAIDobAV5/dNG5P7aV6slvoc9O9Fzww2cYxNxlGaOWQ1hWCGrIVQqMjWUPL13GQ2m9yHzMMh7d9Kfh18K0b1HOyIxnAWfh/dUZyaCF8jbjr9XBWzrqfVwVCNgEoM0vlGxzj0B2n+7fLXG4SN96VuyxOwUUG1yYpFCNNfVFwFnDPitqgpAF4BnyZZnBgrKD9Yiu+YA7NXhhC85IJr/r4U3Y6uvP4dStX4AIL1Onl6scciHqTsIIOfxpntujpuxa2Y1IRKE5YteJlld1gIT3+Sv17mxRUKIbTsuNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hod+ok9gZQR1VO7WzKktcs4SVPap/lHUMu0mmJGz44A=;
 b=EEOrNc2QwZfULMSMrhWIp+mmJXnYxZduzIxny3zZaUFIUKXAZQlZ6OH8YpRw+/F5qIf14Idv+oQ4elMIuE9aF6DfKJOnJi82n9yHrFQkv2hY5cvj+/CkxHVxV0YlNh7tf4fKQ42QPyD21VPmK7WXfh8N+im3pU2txLIyZNrvo6wQpzsBcaJOTWJIilZbywMQclnt2yjmVscpCqzioQqEFrh2S0QTo2AQR+gLcVXHFqonF+uim7fa7oWNSYVT/iySozZxJaRGWNTcZhsyqf8SSs/yl7KI3Bsk7ZF+S5oBiXZ3UQc8An5dZCmBR74VeqB7azlDh6cIvHML5Xy9pYQqOQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/2] arm: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH v4 0/2] arm: address violations of MISRA C Rule 2.1
Thread-Index: AQHcMXDlieIVRZL5wEWYCDA6Feaxaw==
Date: Mon, 29 Sep 2025 18:43:07 +0000
Message-ID: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB6591:EE_
x-ms-office365-filtering-correlation-id: d08c9c6d-946b-40ac-9146-08ddff880838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9z7bwdNGMfum5ioMaa1lPNwBxM/MGCrhu2HbofnFXBoGtdUcGOj+VpTEBM?=
 =?iso-8859-1?Q?ClEY1dlfGTAH7KmASkcKOb9C71aqhUX9TMaItXjOS8LUp9kfSFwZl/QsZC?=
 =?iso-8859-1?Q?TxyEV1BsBKTZjU0/oyfP9YE6et4Q4BoVsOoNY2L768xMuz1KUqmUdh/OH/?=
 =?iso-8859-1?Q?bQ0XS6OS/ZCX0PMaLI8f/FiQHHyVrXt0UgoUSrmofo/2UwddJKsJY+A7b4?=
 =?iso-8859-1?Q?PkCI30zp15eJyMH3HZ+hhtPwXO6fny36eMYfsiYtOUf699kUrisvgpDJQZ?=
 =?iso-8859-1?Q?HVS9v9rHB58/BMZx+ispR8psPSGmInN8NY5Vc8YGIfqPP1Sced0Ez51JYw?=
 =?iso-8859-1?Q?pNkEYsQw4D+BWU4fTeNF+mK7GigDKgdDrVK/TqOPFxCs9N0GkKU0dEHrOi?=
 =?iso-8859-1?Q?cSe94XNbtUdOe3HdhaMrmXihxOnbJ4IpImtMW+77jxMPsmQS/T3UvShGMg?=
 =?iso-8859-1?Q?AjlohEzGRcVq429rS8Pv2C7LrYlTbgVL06vocso1VhDVMt9npzp9fSB7fE?=
 =?iso-8859-1?Q?j9iBAyiJTuk11pfRcIetX36Cu5H7x4I2csSxmiximicH6QWK78rBdlXO0k?=
 =?iso-8859-1?Q?3Vkw8miXhgqZTOwZ9AjDPiFXyQjx7EgYc8TIaPTx7wMuhxnfWwNNqVlhFZ?=
 =?iso-8859-1?Q?7TZMdTBOCGA7+HZlf8EmCjtw+/+mga2UU5gzCqntLEDOx3CKrMJByi9fHy?=
 =?iso-8859-1?Q?2cTWMXSHkyHhJFYIK/w5VQcp3dJUA//NQ0XJkkg0pJ08KAr1x5seai3WnK?=
 =?iso-8859-1?Q?we6/pG/V0dSuyFIa7tRPmKcqMyyQQSA1h81Lep8QH4PePk/X7tJZgmhxCa?=
 =?iso-8859-1?Q?wP65Y/Y689GOYmZ3Ik+wQ7pfQ/tcIFFzcvtSOyy8Q28WQoJIIbm6drgD/1?=
 =?iso-8859-1?Q?ydBDh1LbihLPrq1E1eaO6lvfmsd4oHE2oQYZRf9c2nst0U4Taw4I8YEIhP?=
 =?iso-8859-1?Q?8dMIxa6PQj66iGERxLxSBz4s6emq7u44990/VCYNT5ZqJLZjhDwyz+HYLR?=
 =?iso-8859-1?Q?BncjmjPbF+RMqVrZkPoxPnSx+rPBFomHB/6iHgYJQ2Lj9mw/VlrOWHVJVn?=
 =?iso-8859-1?Q?74a7S5ZItISpvKEvRc1AGwVWKp0E5Ynaji2QxohG0P4h1TkGS9SQLxIdS2?=
 =?iso-8859-1?Q?Q6sJHEwdeoAFLH4vwADd773hvBs9WBPMjjGbeAgJILAjI2gNP393vygRA8?=
 =?iso-8859-1?Q?s8tOhp//xbSJVWoJ9ZNVdrYayk7G1Bdo2xULZGGRjQRr2HBLQHC1nasEBX?=
 =?iso-8859-1?Q?sIZ8nTud8qgmXjOhyyeIYgrq9N8Sdy0P4EafH9a9HRmwLGvUx2F8ng364G?=
 =?iso-8859-1?Q?ng4jK2U9VjTuqddMu+3Va9SyURYKrMm08Io1F8r6/biwJiDXmxPKxcXEza?=
 =?iso-8859-1?Q?H9CyOuQnSU4U3zFseh7tJFMBmWdlUQuQFmqXVKRku3WDBirPLT0HCJugC8?=
 =?iso-8859-1?Q?QYVfxLOzTASldSRun+vrNu1Agx/ghLPE5Pgbi7JBZ/EYFpDhdoFFsh3kTf?=
 =?iso-8859-1?Q?Cqw34IT2ImizOip6L4iD0W9npAH1JWVzacnJufVrvLNg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/Q0xIKKy6HccjeAReA/+/psE6/wO1C0708ZmDbhRkYpTMftFd2xTGQNF5+?=
 =?iso-8859-1?Q?F0HzrvdzQdjOpqKR76LKDNG5B2jUvw90O1Ou8nad17lF/RvDTkIzLAY8xc?=
 =?iso-8859-1?Q?yWu6qHnHEzEV4BDswl/WzB2HVIFgGDAHjYdYhUHBzYvdz2COq5TIW63vPu?=
 =?iso-8859-1?Q?xGDZR6rMcbEU+BjK05BI2oZ8SbQ2MYGJQAnmfJCgZ37luP763fydbiH1CN?=
 =?iso-8859-1?Q?jUMMKcpDXX9k/FsRM6hgnEcr5fZGiBYTCHdTGFruauQYRfK/d0ugYV87+Y?=
 =?iso-8859-1?Q?MU442QUtd4zKd/Wos0nodrDMvFEXXaY9hgRdvExPLk/kUUpfmxE0Um9Q9A?=
 =?iso-8859-1?Q?pCNjV52jvzbUwLseV/hwPOVTyUfbmrR/7CY+lBiZaaQOhMwBdlkfRlzD3S?=
 =?iso-8859-1?Q?TcXbiQHHQnOF5jyBp4SkMofkv4Pu0ggiwzDcLKx1mQsyWi4ZLNMuvUb7GG?=
 =?iso-8859-1?Q?VAtYSphrO5LhIZqsb155v8cEV6MkyDABJo8HoTohJJbLkYpLr1J48FPRFm?=
 =?iso-8859-1?Q?mskM/4BUz3KJFwtXLGJi5Bf93s5rydxZPDEg/bhqSD4AQ81BMIwfrrypT6?=
 =?iso-8859-1?Q?/mdPxGmvTt/jUE5vqzJwszsN0ivlBm4orJEkwDgOzcg7WhnhK9YLDv+Hh/?=
 =?iso-8859-1?Q?W0YOI8P2tbAKRrYxidGwmbQTaIKJAjr6c1s196+V9xzBLc24ax7qX+CR1a?=
 =?iso-8859-1?Q?UXTemohX/GlvaR+09bNQJhR+D8HO55yOLXTuXIE/GeGtwV+QPVoGc5Jz4p?=
 =?iso-8859-1?Q?HPm3WVenSoRoLvYY17OZ/8RQOcsi+00LSZtqF7nrlVsKlUFhkr63hqkO+Z?=
 =?iso-8859-1?Q?EAWrV3SdWGIKSwgR/UlsE3z5Sw9TE6TyfaZS5NjejJ9IupXZwarld5j77A?=
 =?iso-8859-1?Q?OkYTeC2+PqzijylO7Loxy9SlTg6cWYwbGZaqIFSAOsMfMYYbXlWUhM01S/?=
 =?iso-8859-1?Q?gbhgoXNoDQcBXicvEZPDKeUy2LDqzsukrXbMRww3dN2nExaIFZde83/2Fj?=
 =?iso-8859-1?Q?I7/0jhjY96aRWQTQZlslNT9mja0IroskZqR1i2aUGbV0icYUUGp1lCdbhK?=
 =?iso-8859-1?Q?4wkzGXaePKDK2QLsasNdwifwheeeLAeVYcqymkAdfRMQjzWKtbFmEJZHVC?=
 =?iso-8859-1?Q?GVoWnAPzGfcA+62rd2Y7vPmLG3Jw0NOv3AxcGdzGNDRqiJV9TlyydJSVs2?=
 =?iso-8859-1?Q?zv+GVu3mxmbMWFAUA77NvflVqbVK1mW26IvYIpnWBw0m2ba6DjuffgMQLW?=
 =?iso-8859-1?Q?y/452qVe2Ju18X0GUQIpAwEcppUM8v5UY/G9wghaZwV2dfM5aLCpfpvEQR?=
 =?iso-8859-1?Q?b4yUKFdZrfZH1YrjGeDSldKxAc7CGQsRP6kCbRWeGfd4tQ9KY0T1PrybR4?=
 =?iso-8859-1?Q?BWZAMSK40Z081GMCtk7g+u8xBqNs/CtRztuGr7EkYS+8rSq5/66lKfoJVI?=
 =?iso-8859-1?Q?yrWTCLlZhp44f9/cl7/MTmFcXwgY1Bo8sdnFW8NpypiY9WUdoekwkBKbTt?=
 =?iso-8859-1?Q?xg/I6x1Dac/I3/CTjYDwAh3hM5+N6JpKxTtlc5yM3WNuRL7XVSZFsk8lfc?=
 =?iso-8859-1?Q?S9MiTnTMFT5j65YZBPEW7N9yKCgH9kRA5RSkiGAj971MFvxY1gxfLJ5X2B?=
 =?iso-8859-1?Q?StHX59nV2k07zS1xkl2YqLqePdpXv14HyX9t0lgRwRBDcvhJiMMjpXwA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08c9c6d-946b-40ac-9146-08ddff880838
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 18:43:07.4502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cJtBteXleGUYvFOecHa+VROdtm+TY4O2LbPHqIRzoz9COZ2YRxX9vqC9MOn/QKIZF3hlsFUnbrucO5VOergIYDDXCMXAwEVf9sdYcddYuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6591

This patch series consists of two patches that were received by dividing PA=
TCH v3.

Link to v3:
https://patchew.org/Xen/620eb8fe22204e204cb471e93d2ea789f879d854.1758744144=
.git.dmytro._5Fprokopchuk1@epam.com/

Changes in v4:
- PATCH v3 was divided in two separate patches
- added notes about predicates which end up as constants

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2070317153

Dmytro Prokopchuk (2):
  arm/acpi: address violations of MISRA C Rule 2.1
  arm/gic_v3: address violations of MISRA C Rule 2.1

 xen/arch/arm/include/asm/domain_build.h |  9 ---------
 xen/arch/arm/include/asm/gic_v3_its.h   | 11 ++---------
 2 files changed, 2 insertions(+), 18 deletions(-)

--=20
2.43.0

