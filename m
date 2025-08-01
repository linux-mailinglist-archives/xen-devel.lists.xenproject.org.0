Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C02B17F2C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 11:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067002.1431972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyT-0006Ly-ED; Fri, 01 Aug 2025 09:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067002.1431972; Fri, 01 Aug 2025 09:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyT-0006Ka-B3; Fri, 01 Aug 2025 09:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1067002;
 Fri, 01 Aug 2025 09:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0QZ=2N=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uhlyR-0006KP-C0
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 09:22:47 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d0b99e-6eb9-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 11:22:46 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI1PR03MB6144.eurprd03.prod.outlook.com
 (2603:10a6:800:141::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 09:22:42 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 09:22:42 +0000
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
X-Inumbo-ID: 15d0b99e-6eb9-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOdqgXYZkxcTQR75XTMrOwVzDYH0LzfbrJXPtnoGcdSQgv8XUFUAvsMCSDkF3o+Eb0bhZ0ECBVVu3EZ/SEUsBH+Hcrk+DnuRCcuc4Qbl1jqGr8MvqTNZ65w35pj4eMhnMHXGu+OOdadL7EDtVhBHAObHuznLLdHWHH38Wi5QO2MSm7R/UHoz2KOwhSycKJpUP7E8uwLEVOgY/0xX3SIqf/DtwoG4L2SJuqBNni1GrR9aDip5ggZMuoFQTDPGMhF0aO7140r9wR6v+BFmAJGGHrqPKcKZdnozJ03aKyUvcO8vVaTjKFVzzztyIYv/9DQcTm6ciIJ1Vd35bOHPWOrLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dtx8p9qHm8yinBn9Qrplu2+CNXgBCVcnXs1ePwe02dA=;
 b=sbwuAp64lp6E0CIFjaLPt2tRVp3b31msygZTrnyRvJRWzqFIaG9CCnkaQyGyBa6im/g9nSQ5AEJg/dJpi1HM2j78m6qtEheR9+hTRGRZ+I+xdaLx/t1sXwzaZ2UIJmsuEm0+/894vNJNdHiln7ToyHah0741tHZ+ApJHdRisKrc0Lkb1VyyEstsMQEYW8h/QKG2G0OpYApAu9n2A5uOg8ooDnX8A6qMaV/gTzx/SuMJLO3lr0SbgfA1aJ2htUvaSEn3MaJZjW0zu3KHl/BZqlqCr741YXsXDfuZkiBFYirDZ1fELgGEMWWGa05O+e6h0yPuxW7Q05rf1+FX642xD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dtx8p9qHm8yinBn9Qrplu2+CNXgBCVcnXs1ePwe02dA=;
 b=M/SrNqRODOCuA7FkiBcf0pJu4v3b+ig1Ks6n9zlGXPT24w25ACKVeLEPmTq7B3TUY+MFYCPtekpguh42PTQroeY9saM2gGjbyFaehG/RM4ejk9APBRxoAyZjBKhPj7vZsSPaRiDJNPobFtMlNyBSVqHgsewV4sN/ddWL01Gr0SABo2aoZbTOgdcgY26HMqQ3OB5fnZU+xkj0jIySGO8U9UcfQkFWAMAKAnxc0GPA13E6wMDrLQqe8C9WrA7vXL7JEvKgxAtJhmDsuWgqhcA5O2rqI2mI++kAUtiCzPoa2rwzIHa5uCH6Qjunmz0Affxxc8z0FdDv78CJ86v0S4NTGQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 0/3] dom0less pci passthrough support on Arm part 1
Thread-Topic: [PATCH v1 0/3] dom0less pci passthrough support on Arm part 1
Thread-Index: AQHcAsXVF02fN3kgykGEDkz2yi/slw==
Date: Fri, 1 Aug 2025 09:22:42 +0000
Message-ID: <cover.1753968306.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI1PR03MB6144:EE_
x-ms-office365-filtering-correlation-id: 5b3d8938-b0df-4bb7-367b-08ddd0dcf7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YcpsI6BMsaAY9rz/sTOl7KwVM1SnS+pskGjixWgiFoAl8V6TYPPQjuVdPX?=
 =?iso-8859-1?Q?im/g5np6Unek0oSkU/H/gWRz1sokzwh18glNO4IcY8efFxUUhuilB8pBk6?=
 =?iso-8859-1?Q?Rgi4msvGJZSWkbfIMqwFh6oee/pSVdA5ndU7/liHywWpTvXgEHbBssuF5r?=
 =?iso-8859-1?Q?2tSrZko+rWfBi82OJE2HfNUSR7TQ3fQz91M4fQlgxef5ySNqXrDlehVwdO?=
 =?iso-8859-1?Q?Q2hwkOQx+7DSkQkH0i5srm3MpRnH6G63b/Zdsq6DO4AtefirhTGUUp8Igv?=
 =?iso-8859-1?Q?G+7SRzDO+dkpXO+6YgDpX8OwJGJMklG1bLXMMvT9X5N4pBp8FRIHXloFG4?=
 =?iso-8859-1?Q?MlMZ36hBgdBQtc6t/+6o/7h/xDW5mH2moNOb1aEQvLWTC0RyBsz8zudK3Z?=
 =?iso-8859-1?Q?xeb9kK1q93GocA3cn4pujTYLIrUNaGMXuTn62Lk3YvJdlGYEZaeJg8TZBj?=
 =?iso-8859-1?Q?dXt5Cc/4HxRmtRfK2XZp+a5mGNoV0P5hIwcK84mfTYLlUbeC/MEmufiFDC?=
 =?iso-8859-1?Q?a/mwZly2k/QhJL3dWxMWrv+dMCeb/Jt9QRK4YJ21Q8X1P72F7vVQl2eR2C?=
 =?iso-8859-1?Q?9ashNSvhmpozIky0PDocpzLInDH96w48NVU6YcUXYEoxfn/ocMw67CcAqZ?=
 =?iso-8859-1?Q?zkCFSIlcsmahmWZXUeLfYCjVmv7QQ6ToEvo2p4F49SxfE19VNCWBFVZBwO?=
 =?iso-8859-1?Q?fNcQs8XIYm51Ps2Fi7PggiYO/ZhimwL1cocxkBVYKjvu9VNDsrlVG6xOO8?=
 =?iso-8859-1?Q?tt6oFWDOb/Jxtgn+7wyWmpp+bhYpqkWIjvnM9oqfFEAH3uljvpfeEKzEVO?=
 =?iso-8859-1?Q?rKXz4J2Bl7iISnjGrXH2+GBdcgjR1buo69dEd0OiyOMr1EmCDh8Mni+jt2?=
 =?iso-8859-1?Q?5T/KnNeY4awWLcj1miEGECeoQZUZuxbMI66BGD7gjRQCpw8m9uXBHWyF8R?=
 =?iso-8859-1?Q?MmaAgoteyBbYZ8db5VFZm9CiZdhqgevcUIJr7iEYVvNbdn8736BwJWZi17?=
 =?iso-8859-1?Q?r9gNMAjI4swcebji1KkaJ9N750zQjk0O09zWbGYaV5/Oou/dFWgXh2X7p0?=
 =?iso-8859-1?Q?6oJfTNVWF9fx7FTH33CmGpD2jGLxCilPy/zALpuLsf0cDGQI+Tt4jKGG0w?=
 =?iso-8859-1?Q?AP/kJ9nME7NPD/xLiUnm8BxIFUP2zWvcJndF1Y/frrlBb0iV/kfS2gjK+e?=
 =?iso-8859-1?Q?2o7bom3Kah1FBOISZux+E5WBGYrq2KLCtpal5FVbuwlvLRElBnnYg5diHb?=
 =?iso-8859-1?Q?RHodSS101+OS2pigJ0teYC3X0Xv9wb0FQ/IpR+xfYAKftb8KOqGjgDKqwn?=
 =?iso-8859-1?Q?pZcB6cpekGaHqzPs9IFw9uctNX08PazkpGO1crV/hRCN6O+FcMRmdQtIP2?=
 =?iso-8859-1?Q?1z7hlzjRfetzLjtLr80MPSYUG+ica6F3m6fB2GzmEi+41gjZe/QnKzUvme?=
 =?iso-8859-1?Q?Oiu8fYvrtBRvanmLOonuoW2r6s6clmIX4E8NVjsbU77M2PBzj3cIDSX3L0?=
 =?iso-8859-1?Q?ZHlLzmb2ry40IwBhrmDtP89FsvE/1DPCpfuIXCDz/kpQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZnxHf72lx0a6F29HTtAyJ2yVGVDfMSw0xAIbqkcSmC6vBfh+/Y6wiMxwHF?=
 =?iso-8859-1?Q?OqwAg6QVxNAIzBiT+qPNhs0ZBJ41+qLEC1+Rzto1UlvpjoVxrNzYnxv5hQ?=
 =?iso-8859-1?Q?X55Eho3V+l4HyxDXHfceWVaEl/02sTkHH9jZmzt/GlncaxQ2YUkQI21xbI?=
 =?iso-8859-1?Q?Q1Qm2slZy9F+656q5VoQu23aML6lM1EUhWj1Ze3/Nix0fJsy5JbMcjqQDg?=
 =?iso-8859-1?Q?F5+fCGn1o2pXfD0V0SkTJaQmZsBvoBe4xMpVW283BymrUi6PaJsvgguA/y?=
 =?iso-8859-1?Q?kN87/FJHE9yykZFiymWMHqadhpxVLeb7Y/S9PT3GS4WV6Ed6OITojHAiRE?=
 =?iso-8859-1?Q?6bd4x51413NuJbMwihXmUkIXiDPmAY1H4P0nyHqRhnJ9DvwjI4+KleFEAK?=
 =?iso-8859-1?Q?Un46qJVMOhJ0X8gt3CZqsrhTD4k3R32gx9S7CpyOBWUkEQzD4i81OQInRy?=
 =?iso-8859-1?Q?KilLSyb7FRBTqQpl38s8hKdufaAsDvvkpX7EmoaAhxA/ioA0i7nnuztTZy?=
 =?iso-8859-1?Q?StCQ9HxrRnMeWKstIRGDpTqbtsc6XCJJuM4DETwPfs/EL07NPxYrV38GNO?=
 =?iso-8859-1?Q?rWa9THvv1Tq7jviQ11bytnWMEuoRfbw4RhXkgCHEtuebJ/MeE/GoJ76oJu?=
 =?iso-8859-1?Q?IJCQute+xlzsI53Tq3Y7PZ5YSis6FoUZILcYkNSKBxAphBkASSeDE/DGgL?=
 =?iso-8859-1?Q?kXwyXHYmDk4ft6CeTCekeuQKrtNkok1+FJQQRnjFvLYRO+qL1h+WKhpKkH?=
 =?iso-8859-1?Q?bjBDzKifrDE0jPdU1mKMVHIvIcFQcT9NHy5IR5hA5I4C6dFWnzkc+Au9OM?=
 =?iso-8859-1?Q?MvU010Cbps9hVl9tAMiMdVPBmyj7/PDySDTdwAQ2V881JHlQYzY8zN+MO6?=
 =?iso-8859-1?Q?vuf1pffMu+EplbTcPOsstdkyQOd+Orw+abmOEne14jWB77fn3nNVO5dMir?=
 =?iso-8859-1?Q?8dNAhSc8NR6Wi8RP9zOcnIm8GhrwUq3kJ+xGaZMHbKBQJz9WpIXiT4PWPV?=
 =?iso-8859-1?Q?yh9o5y7A61mVYP5feBhx67h45gVQeeHHgpGw98ogC3YZfXY85DeswzgSmd?=
 =?iso-8859-1?Q?rnKsaArb5n/69RumG8nLhV4yOeez0zKwRNLmOIJFyw8lmhEjLlWq+CeD4w?=
 =?iso-8859-1?Q?axu7hWmV5bcZ5IGEKzQ1PJJhji4VRPSqDQeoV1Agq3LrnilHgjZ/JUJ4d7?=
 =?iso-8859-1?Q?bKyFbqL5xBEH5zeMoH94vGCJW0XR6BNFpn8iFfE5H6+fJq2xEQP/t7HG47?=
 =?iso-8859-1?Q?Uhy1CtHosrTj4nG2h/lZMKEKtCbXYzvvLoi0DMWJ8NIoy6jCkDjLDnsQpZ?=
 =?iso-8859-1?Q?DR2tX/8QD5/Xv4T5RsL01N7UgWckf9jr2KDRDFo3vnXxHQdHzz63ngF6T0?=
 =?iso-8859-1?Q?A72vkMaLItmHzwpir12jraWn7xDLdH3CA2uHhxXYDBUFlgUIWiZQZ40Xx1?=
 =?iso-8859-1?Q?HvH7av+a83vJ+k+5LDLv/wKr/ABKJ9A2F+oqbP//EPjzLUgRDSgmorqFpP?=
 =?iso-8859-1?Q?RUBva9sGBirjX9wJHTBKV4ipZGydqUupQLGIFNPvU35JhKn29WpBzLdZh0?=
 =?iso-8859-1?Q?tY321A9Q0qBv+CQkrs6q34VfSE2ISwAOmcC5VQYFp4GIDWSl33fpgqbW2C?=
 =?iso-8859-1?Q?xIBHuXQONj8VSp+fGa7uCGclW5C0IoiYFmmj7q5rehAaWFq/Mv7hsD2w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3d8938-b0df-4bb7-367b-08ddd0dcf7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 09:22:42.2747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAM7G/W93dXWmXq3s6ZsczgFpXf7ZYsgxHnbixO/c6s+ZT5Rx/+d+eg7ATQdrhjZTkgAzNMcPJmnj0kpcAc2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6144

This series adds basic PCI device enumeration in Xen. This will allow us to=
 not
rely on Dom0 enumeration for supported controllers, which will enable PCI
passthrough for dom0less setups.

Enumeration is disabled by default and can be enabled with "pci-scan" cmdli=
ne
option. Discovered devices are added to Xen and assigned to dom_io by defau=
lt.

Edward Pickup (1):
  arm/pci: Add pci-scan boot argument

Luca Fancellu (2):
  xen/pci: modify pci_add_device to handle device add by Xen
  xen/pci: add discovered PCI device at boot

 docs/misc/xen-command-line.pandoc  |  7 ++++
 xen/arch/arm/include/asm/pci.h     | 11 ++++++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 27 ++++++++++++-
 xen/arch/x86/physdev.c             |  9 ++---
 xen/drivers/passthrough/pci.c      | 62 +++++++++++++++++++++++-------
 xen/drivers/pci/physdev.c          |  3 +-
 xen/include/xen/pci.h              |  4 +-
 8 files changed, 102 insertions(+), 22 deletions(-)

--=20
2.34.1

