Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC66B446DD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110720.1459794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9F-0006lp-T3; Thu, 04 Sep 2025 20:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110720.1459794; Thu, 04 Sep 2025 20:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9F-0006ij-NI; Thu, 04 Sep 2025 20:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1110720;
 Thu, 04 Sep 2025 20:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9E-00062f-D2
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:32 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ba6701-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:30 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:28 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:28 +0000
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
X-Inumbo-ID: f2ba6701-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfOh3weuaya+xaFwWSfDvbuDAIupZDLXvbVYhqwGJfVy88+wkgRMBDR3F8FKc2qe53UU01FtUqXQxWDiniTUETc21nfIIoil/49vkBzqIBsJHqLO2crACLFHbCk0+7zwbIjmw7A3got9KnEP79rJdqrpq7DLwj7l2ylnjsW8joLxzZJyfgxxz7xlB9dFHaaLqk6vQN1ZQb+6oL6G0dc+he45n3sPVJ/xB0KfnhN3SJpF0bfDbgtMhkmzKF3E3/dh3w/HkEaucdT1ajWY7qMQ/46pXALkyQBkJ08H8kxptflX7ecqF98Ht0dUcOL+a+jiMKbZBzDe9jxskJz3Usqwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9XHhD5txai2A40boCFbZtFLYe1p5OBuox3b41qDc8k=;
 b=Surimlp5XkzDePjN5phQxYqKlnBzIrEd9ZzDA1UVPdhSCuuGmAZMxxIjySercWPmsCgZFNA+oc8thsubpxTqFJdTOsrcWkgYqx5U5KA0xRgNBSA0aTnogc8+VXeWjx28xkQvmqsb7bFzXYuu4q+2LR6speK9vGlziAeyTV926ko0rUAYcbhJGap4gf7EjyKpa1itabmVqKbZalMLS/+FRwOlbuzwhHzzeg/cIZtksGtegpZZu1onYNX8VEhUrTUuKo+gnwC++rYHHqIFMBdVq5+VeKQCWO9LrdjJwjZRmwp9IXH5kH3Wg+jAZZE6Aj2mZhHmVSi3KWm+7tQklD5UUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9XHhD5txai2A40boCFbZtFLYe1p5OBuox3b41qDc8k=;
 b=JwEKP6SOxE8rHJl7bHVsEo+wiVjKABRnS5flqLBCszr/sbpoWfT0VuXrbDWvl65lWRrX2DXWN00CktEMNBh4tXVstaWao4FNTlFqwLn2LmuuPRF2FVrXzziJBs4fe8iaD5ce0NI56GTqcqBeQop9VLV4CRAR+4ZXqdFRgSiLEZADc2PlRs4Ab8oUzm4SGkyAJn0yMWAwGdbopO3qEirvqmHt21/Q28y89szfxmIOVtrvFNxQ0kiX3U7P/pZBbVCoprh9E+4Rg1DXs6dC9ahR48FEk7dHMGnYBWt9TRe0i9D+VyuVUSqPcEonaSgDrxc475mYVdj7uSLLUW4zBt3u8g==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v7 05/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v7 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcHdazISYJ96ARO0ihPlIvp7RWEw==
Date: Thu, 4 Sep 2025 20:01:28 +0000
Message-ID:
 <bdb8b10babad3434347f7ee934e9ac18353653c9.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 55dd55c4-9f68-4b71-31fb-08ddebedd607
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4NB35yWsLsDoMxU9E8BNxlyUxQivEEPQLQOhQ0Oox4PVh4PCd4Bucqo2mC?=
 =?iso-8859-1?Q?pD1tx68cKFj6bUx0SGV80QIPBa0R+6U1DZtDISQXL0UM+kKhZZNJVVM2k9?=
 =?iso-8859-1?Q?TBWPcBxYlgXGFRfQGwraHGpHLe4++yEpozJMtgFwJxK3d6y6HRIEkNPI3t?=
 =?iso-8859-1?Q?YxTb97nd28pPL4+3VQRBy3gYUWP5Uf6KQlNThSX1CiIR3c3SZgRsTlv8vS?=
 =?iso-8859-1?Q?venEbek8WPGmQ2MqdLKOZhrZWZ6ZV30GF/aQc4jL1UpzKgkxHZdIjwFbI7?=
 =?iso-8859-1?Q?25jqA/Tq4B4rhHIyaNVQI3tD8pGV8oHAysNQsQUhxc+PWr6BBmqSJzceQu?=
 =?iso-8859-1?Q?artJ5LTbFhXjVNmSHmfQUV/XVHcYfdaRaonVv9Jka2k49CJEtB6+l3dPQe?=
 =?iso-8859-1?Q?YKw9grENOhWfc+98s9WrgyZutaQeQJFJfQQ95uww7yuMD4zf8XLII3JIN3?=
 =?iso-8859-1?Q?Ke2Szry/gVC5iJc/7wTNnHmK4yUlExHIkzRAmLY24epYm4oobyrTdEt4hy?=
 =?iso-8859-1?Q?iP82788uJk2mbU2N8tdNK8sS1SWP8pNfQwFBlp99RPaBprcck3BhDwfLQt?=
 =?iso-8859-1?Q?chAnYUdRjxwgSOduTNlNwVLJ3NONqPUoN7f1TvpSuKXJ4y/z4mvYba0zRC?=
 =?iso-8859-1?Q?HX4pPGPqGcU2DYzUINKF8mJTLbRRbL0qjBJREGml6D3vAcmyaJ1gQUsu3s?=
 =?iso-8859-1?Q?xCadG1Ere6rWsjJbQDB//2dMMUvExjr+EzFSDoYgKEwCjgsNk05U5znD9d?=
 =?iso-8859-1?Q?xQpNqL45cPvkPyAk+bYyL3nowcI2cCfkBv+zSqoMg8hsCTwXAs7hHPlNzv?=
 =?iso-8859-1?Q?dwmtSsztymFMji4wZRo/llJmXeI95r+xmSCRMh/9MH35/5+MSx2dHoRfZP?=
 =?iso-8859-1?Q?6Joan4yJYVqQHRSatusVUpgZNjv3LeBKEmavMHKRoZiOS3YiEz+YSS1s2/?=
 =?iso-8859-1?Q?eT8/a+qkjcEylQNyapuhenG4odQpdKZVndTfausL5TLXZETfFiHNPBfpCW?=
 =?iso-8859-1?Q?TM/E+EuMax0aRelWnwhN4Dy74QlmxSk3iCbmenQR7IOFS8WfGzO9yLp6OL?=
 =?iso-8859-1?Q?PI90udOH7So4HVH2Xpykx/AHU/LpYMG4MNh4kwImvu3A9uVufLsvRXSQDq?=
 =?iso-8859-1?Q?g97D/vdubmH5dRCkXVvah6VM048ZR/4LZMpc5eG85MFAPK6X20n/oEKsTR?=
 =?iso-8859-1?Q?nhF1CBS6gKaZ+iZVqCcohKPy5aSgr8pMN71m5rrvYPJJO1vX6ZWTRWzdBe?=
 =?iso-8859-1?Q?MSmtvHkBRwU1IJgdEynP8LhHPNx9T4qbzaLs6folvq9jCKkdeOORpq/ecB?=
 =?iso-8859-1?Q?NRPayRpICmYypYZh6Pp1He95PBr3H0YPhB9x6jqUORXOB5lZIIgJHapFFD?=
 =?iso-8859-1?Q?hXUmuq11Qmg2tWCmDP5YQuecoTsr8tOTU/rB2g/7fkZ5yp+a4bauo+OY7b?=
 =?iso-8859-1?Q?g4a/ODpbhlWg3nDdZk5gRM0h9VEYLej/dC1dSPoIvJnkhKfKOw1N0ByLEU?=
 =?iso-8859-1?Q?jITzSoJdgGV5k4W0+NNF+bO2jQkB0iP/KvjTnENR6jPw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YYdmVREBWR2UMCC1KspPFj320kC+ZzV01Ntn2i2f3XEi8G3Hog2QGvrinn?=
 =?iso-8859-1?Q?TH3fkZpVplkwJLFHXGeuaQXHoufxbTorQ9KtxrLlJBtMi+yJn/XoeLsmTD?=
 =?iso-8859-1?Q?8U9s3zq5iCfDd04hKJCZgWxIICcF9BkeTolKTfrwfAocltxdfX+D/qLx9D?=
 =?iso-8859-1?Q?yB54hUCGyx/N9McAEzgBQNKy/NRIDqyUsrSP8lsLtYmzkLqOmG0xbfEUqT?=
 =?iso-8859-1?Q?8YYSZP7MqGirHoanSYoUG1hPuiNbfjLMbhN+7VEZWYsfgprgrdzqrtQj2v?=
 =?iso-8859-1?Q?gdAw24b0Nq9RK/2QC6Ad3mQT/qtQIpGaUXba9cilmPvZv11ZOI6KybWE/p?=
 =?iso-8859-1?Q?dbCG2nVMGkxpBd7hif2Koby3qnTO51jy1eO5n/+qr6XMo5j/SKKyHJRx62?=
 =?iso-8859-1?Q?ZMiSCrGzWPEGGlZlOK37XKD4bvVcBaWZGqHqm2qDi1awyndF1j25ygzfEo?=
 =?iso-8859-1?Q?rvKRXwQXP/BeFt7fa9BpTbr8+AuUAhOYhPLFkK8DwEHce06wtaAC0Nb63Q?=
 =?iso-8859-1?Q?AzeVBhse9Q1NXFLisbIjoYp/or2Fn0/jq0GgxIdlxSsY8/vSAzl2jTAZEA?=
 =?iso-8859-1?Q?PoR8vZnwQXoJMR4/DYQ/4IUVG9V/vlijp5ySGpTCQUApspQekUoPM7/c2b?=
 =?iso-8859-1?Q?2286MFlvyoSZuSdbvarOoga1RjKxJCbRAX+7YK2lsOTPzJb0heyPcr4kj7?=
 =?iso-8859-1?Q?q7HPC+UJL7UkoWPEKjhXGae+9DBq3oADm3XnaLcvF+A0usYIJtivCtPLAb?=
 =?iso-8859-1?Q?IGTb/ay9yg6zc81e7w9mDBvEF7DMLT1/l4yXbTCkHPPOCWeO37TF1NdBaP?=
 =?iso-8859-1?Q?CZzyR19M/HXY2SvdA+hMUsK4oGAaiPP5QP3LNuXZujTy4tfduNImTbs+A2?=
 =?iso-8859-1?Q?wmgcoexD9//oIJNfQJvRDgHH2GoELSQ9XGGpQwpZe6SHDtTiDdonCRjkkH?=
 =?iso-8859-1?Q?xh15PgGvE1BVixYC2q3A1f9TQSXUYfXKXPZBEW0dewC/I8BS4vKRyz9ane?=
 =?iso-8859-1?Q?xywmvh42410DTTehhae/WFN1z+PYOpzc5qHY3hYx49lzR0ccDkfNS6BObQ?=
 =?iso-8859-1?Q?aVhT6fbd8A/Ym47b/L2pftii53I/RQmnT0j82WdXd49zzmQSJHKcnjR8ke?=
 =?iso-8859-1?Q?5h2LJP88H3ehmbJHEV9H/LgvPMRBuY+Bba5FADF9B41oC9WpUwo0UUplsj?=
 =?iso-8859-1?Q?b6/csWPVyvnGDBvPI8or8IS2E4wB5wRvC0V2K/PDN639wXK4HihvIHLVf2?=
 =?iso-8859-1?Q?pF4OYuti7fpYqQV8xoqeIPvfu5YY1S1WzTHS6U58eDNtEgySs4QIUbvBAi?=
 =?iso-8859-1?Q?GTpj+9On5z2UAKQ/6ysCM5/2GSasGFD0EUFgC6b94gikh60sMz6SeZL5Xu?=
 =?iso-8859-1?Q?Kkc4s+LqcEfZIk5HOTXjs+aR4y1KUnyMhlcCLWAFb5txXrAqSeyYWAxrLs?=
 =?iso-8859-1?Q?RuTyw5d3hHcFKJ3PM+uPFBzVezX0y1c+WyhsGNRUovlGU47UbSzIDarvyM?=
 =?iso-8859-1?Q?7Tsf9E2nSc8dfuApTQZBEaAtSS0Uo5Q0zWfdGYGLQrFvW9vXXWypPPa6D1?=
 =?iso-8859-1?Q?kOE+oXxAVvjIWqmarRQuDKW23jaGQe/bjkLvce2wciPze+ULyiLo1gBP9Y?=
 =?iso-8859-1?Q?AHuzTS71+hqwUKYfgJilidoWA2XOcPX1UV7Z6vo0HsBRdXAfEqKHZAphX+?=
 =?iso-8859-1?Q?HgpcnKb/1YyWZpij7XQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dd55c4-9f68-4b71-31fb-08ddebedd607
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:28.7002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIPfTqjDqj5O72VMVQ46Pd0Oq3XXEz4oW7cSaZ223zdLdZZ9d9XkAMufxzwumhNfNNvzAF8nWE/XbdHtfoDJc81OQ66yoTKB+C/4Y5kSJT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V7:
- no changes

Changes in V6:
- removed unnecessary parentheses in gic_is_valid_espi()
- updated gic_is_valid_line(): it now verifies the condition irq <
  gic_number_lines() first, as it is more likely that the irq number
  will be from the non-eSPI range
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- added reviewed-by from Oleksandr Tyshchenko

Changes in V5:
- fixed minor nits, no functional changes: changed u32 to uint32_t and
  added a comment noting that the configuration for eSPIs is the same as
  for regular SPIs
- removed ifdefs for eSPI-specific offsets to reduce the number of
  ifdefs and code duplication in further changes
- removed reviewed-by as moving offset from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
  for vGIC emulation
- added a log banner with eSPI information, similar to the one for
  regular SPI
- added newline after ifdef and before gic_is_valid_line
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- add __init attribute to gicv3_dist_espi_common_init
- change open-codded eSPI register initialization to the appropriate
  gen-mask macro
- fixed formatting for lines with more than 80 symbols
- introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled
- renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
  (name was taken from GIC specification) to avoid confusion
- changed type for i variable to unsigned int since it cannot be
  negative

Changes in V2:
- move gic_number_espis function from
  [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
  to use it in the newly introduced gic_is_valid_espi
- add gic_is_valid_espi which checks if IRQ number is in supported
  by HW eSPI range
- update gic_is_valid_irq conditions to allow operations with eSPIs
---
 xen/arch/arm/gic-v3.c                  | 83 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 21 ++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
 3 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a1e302fea2..a69263e461 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, uint32_t offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        uint32_t irq_index =3D espi_intid_to_idx(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            break;
+        }
+    }
+#endif
     default:
         break;
     }
@@ -655,6 +685,55 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
+static void __init gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr, i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
+
+    /* The configuration for eSPIs is similar to that for regular SPIs */
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL,
+                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) =
* 4);
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) =
* 4);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+static void __init gicv3_dist_espi_common_init(uint32_t type) { }
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -700,6 +779,8 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+    gicv3_dist_espi_common_init(type);
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -713,6 +794,8 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+    gicv3_dist_espi_init_aff(affinity);
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 3fcee42675..3947c8634d 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,9 +306,24 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return irq >=3D ESPI_BASE_INTID &&
+           irq < espi_idx_to_intid(gic_number_espis());
+}
+#else
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return false;
+}
+#endif
+
 static inline bool gic_is_valid_line(unsigned int irq)
 {
-    return irq < gic_number_lines();
+    return irq < gic_number_lines() || gic_is_valid_espi(irq);
 }
=20
 static inline bool gic_is_spi(unsigned int irq)
@@ -325,6 +340,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..3370b4cd52 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,44 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IGRPMODRnE              (0x3400)
+#define GICD_IGRPMODRnEN             (0x347C)
+#define GICD_NSACRnE                 (0x3600)
+#define GICD_NSACRnEN                (0x36FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#ifdef CONFIG_GICV3_ESPI
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
+        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

