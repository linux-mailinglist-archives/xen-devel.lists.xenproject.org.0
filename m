Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31EBFC513
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148084.1480278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKJ-0007Gb-0e; Wed, 22 Oct 2025 13:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148084.1480278; Wed, 22 Oct 2025 13:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKI-0007Ad-Qt; Wed, 22 Oct 2025 13:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1148084;
 Wed, 22 Oct 2025 13:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKH-0006dh-6a
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:29 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e739be8c-af4e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 15:56:27 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7644.eurprd03.prod.outlook.com
 (2603:10a6:10:2c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:20 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:19 +0000
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
X-Inumbo-ID: e739be8c-af4e-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W90sjyeldP+CrK1kcgTZ+o0ZFQk1AEote8o0b/ma+rNOAUOe6pxkjx9pqr2PsK9FyjRVFb2UPwX0bxRX4YbazcSYd7IzM07jJhzsyOy3ThpOw+1i+gNRtKzxeS/8aug1rnt/Ywnqueqlen9M2R7ulcDNWhBQPusMzKmauIHqZLmDLi4YPKLmP8J0K7vn2Jfa0sY0OaZWLNVXqylmkusb+atDwyVdAEQDYXMKsYmCxrxzy4Z7QXD8CAUeZT1qzyH4ws9TVqsK9JuRu8dWCf1Oo46103sPuWKo0COHP+t9mfnaSkUsumUdKkfDQ41rcSP4X/5ynBmWZLKCqi65OEKLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAteDMPuz4wQYe1LkgAkri31ZmR4GYaLKrwtGk05O58=;
 b=ozM9N6uk89i0WA06g0ZdJ+kqxf2sc7z9eC2PStG8vTdLYiNajJm6fEy/bZ/w9qmssMPrtqmKzyGhSEbQIxaj2aFKJrAnc/Q+bRpXLfjBLG7P9BYGdWr7DBmEei6I53Eu8yN7d81uiD1GuEee/Hc4bMspmJazflmdO1JhBWIfXsMUvOYxjPxDO0AJGMPySCQXDUSazBlLmi6t+B66tXIJeX41EAmnUIjQtjc7LinrGtygNfI+nmcjCUzrz73LL1ExsojSnf0Cgloc/u3hfbqcUUPfmOyrFiBombPZasvVul/JfL6cPL27GIDmvU8LusOcTbthZ954yHLODhpMaCO/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAteDMPuz4wQYe1LkgAkri31ZmR4GYaLKrwtGk05O58=;
 b=qAO27f3Fx8LJJtikuCDAOihrCRhukcAO4gtkbIc0rJJxaHTq828QH66IfR7POOVnPPq+oFzLUmSl0xQXP0gbQcPsC39ZeGvpU5/fkTq5PCQ14ojmGyyzWcoJYKyWzTnkR3yFT7ymJqbb8R074Xg+EyDmlbDP+MuFi9muYYqmSSXWErcd5776BTkUWfn+QgZR8XnzTN62CJffIoB0F8C9XAjPWoTPZ5p8qq1DMqkw8wK/HLWeTEgRA3Q+YwUqaTRqWuQqO80AjEY8QVZasVKK0iDWsGUFM2OhErgRbV8S9o4JVrW2ECpOoz+oGejtYmm42jiUV4ykxBrFHXOHKO87lA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 3/7] xen/pci: update DT for hwdom when it uses vpci
Thread-Topic: [PATCH v2 3/7] xen/pci: update DT for hwdom when it uses vpci
Thread-Index: AQHcQ1ukv10Lg9ahX0eJA+yvwZPGTQ==
Date: Wed, 22 Oct 2025 13:56:19 +0000
Message-ID:
 <a91a54d1aabc1bf88a570bb4827060cc5864f6a5.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7644:EE_
x-ms-office365-filtering-correlation-id: 142839a6-afaa-49b8-3418-08de1172c715
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4ygM9Sjhpj4DV1CQKLg8YCMMDT3B1gAJzZIuneB7Ats5sHaEU2QuVCe/Sl?=
 =?iso-8859-1?Q?niWoX9/QskX6/6fi+cWsXMDe0A/Afu/PbOi70tcuQTQ3tnRMSoQIoe6qv9?=
 =?iso-8859-1?Q?ODLztiWe0ucGX8DrEhBt5QCSZcDv52MbAW66nTRN1VKqY8DUq242eOfuJ6?=
 =?iso-8859-1?Q?sKFY5rFgEdeNyq7Z4MH6MF33UGJYpowq1wVY+ix4twssOufMbXsgeB9MnW?=
 =?iso-8859-1?Q?ryGDZ5uB9Win1v3yxjYrWLymdloanq8tlMSNmhbtbvtzT6XHL/oOz36YBo?=
 =?iso-8859-1?Q?0vXdtORCQfLIp4vPhtHHT/XrFfJjig7a7uRoymXZVBKuZ6ae22lzg3+1LT?=
 =?iso-8859-1?Q?XVX6A5Ei3e05668VpcoDHjut8yMMi/8h7nEbAydy7kkZOATo/8xcc6cG79?=
 =?iso-8859-1?Q?OerIxnb/xn9PnDTyE4tmPTNuWBDU6w7KbIr9NxWbHQWD0DPI7kS8bGjaRX?=
 =?iso-8859-1?Q?zzT+Ma1OtUlauS7UCUadUBhDZp3/oCWEENmpz5Bfcx785V3MIr4ZCKIY7G?=
 =?iso-8859-1?Q?A+dKeof2N7ViZlEqy75LF2BgjtStSqLwbPwnnGu1TYmzTVQxWMceLDdN/U?=
 =?iso-8859-1?Q?Yh6Sdypb/uSADW/qNx7RK9XcEi1Xr1rhGMSZhfj6PKD3tE37TFUcAIo4Il?=
 =?iso-8859-1?Q?PWeMYD2Osmmt0YekAkN9575FAppeIHA+8bCD3sBbGEJRMBnN0dTWjYFANZ?=
 =?iso-8859-1?Q?YHn1GGUM4ViR+yaj1Kc8f+aPgcCyBDAX+GvCilxUNKbuTVWsYxCdSUxBcy?=
 =?iso-8859-1?Q?4n4cql3joUJjVQLoBMYNxt0jvUSSlyXre1rzhsSg+euUiqZI1zkz7s74ot?=
 =?iso-8859-1?Q?QEoze41laeV8bzlDR4uGyS6Ax+BWbDmO3LfqDTW9mK5+EJQQN3cmdF9BH8?=
 =?iso-8859-1?Q?JdKTWcVdwDO8NL+bQDa0lDVciQDxayG9oSPtQWEJLDn0wYUnlFbEZj9naV?=
 =?iso-8859-1?Q?d9k6j0y7CjSY9T2PHH4IvSb0s9WiQkM3sHjh9d+F5SOPGF4uPfOzzRhd9v?=
 =?iso-8859-1?Q?n9Drea9dJzYIgUp9mgmzEEtqnZBxXg6noVVVug034CPwOF2+P81T8nndig?=
 =?iso-8859-1?Q?kRU/lU8+6F/Pb5SFkuQdgDVCtN1LY31DC3uHrJYUabbzy8NtcMPKvf7st9?=
 =?iso-8859-1?Q?W9y2GvAtRUoQd/sU377mnPxvzYNkoLGOJTpCLfNp6tC/ZtQiUzWwi1qRQH?=
 =?iso-8859-1?Q?vigRSp0MsSgMJS1OCwhwyDnLqvZ22UsPArF/lp9se37PpAh97QSrDrsv1h?=
 =?iso-8859-1?Q?bqRGhxVFBCjIJ/GG0wisx10AWOH9h2GYZP2Hiv7jFZhnUhIixoZJAS6AYq?=
 =?iso-8859-1?Q?iXAXU5urKeNcqXDaC2/GUyJi2YKJKKzF04Mcs8rE7TwB7iqJSi8zuCUPHI?=
 =?iso-8859-1?Q?rpj2662EpWuN0SgQSdB/ZlvKce+J18L5vARHSIfEpYQ7v0J5EELti2w3Oo?=
 =?iso-8859-1?Q?e63BIivQW572pesKROOwysH+QxHNgYomr50ZdxyFxoczmQGIZAII3Plxne?=
 =?iso-8859-1?Q?cqW8DV2YGKbH0wRSZqFZYRWVbYplU1zHN5O2jGbCJpsFEqmc+GHH41LHk8?=
 =?iso-8859-1?Q?tNmoxo3akinS7xfhMgLTtQsaKSZK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GaApwbNHZ3ubmjiAsIqG9czFzeImJEm3S/M23wuQ8hgiSptTL+S5DoL1kv?=
 =?iso-8859-1?Q?EUuY1tvZshQTJ+bzQQ/eEVFY+ro5kyyDm3FJ1vgDEKNG2MVi1bxG9AquZb?=
 =?iso-8859-1?Q?K+wExPckTqUx0oqSBjONtmc4Ko6bMygbErQdFLOEjeW+S06nswLjrnjV0Q?=
 =?iso-8859-1?Q?loc+ZTvjY+GsyZFwe0b63LryoRfKmvaW0OHfhYIvmv1fiewm3jUO6QyBPP?=
 =?iso-8859-1?Q?gK/kB8c627bOZOCptZct0gQlJ1DDP8En/DBi6HXGWf/iZ2jzdIkwbit+f4?=
 =?iso-8859-1?Q?uSP5a8g8y0Y9MfY3yIRF/N+me+i+0979jT7n5fnbVCqjQEGYe++tQD0Drx?=
 =?iso-8859-1?Q?iB2fE1nZ6HKBkuFgojSCGPb2aIvpSXnIXcY28VDyihX3doMGwzyeoW75Ap?=
 =?iso-8859-1?Q?FHnWgJ+EaJOCbeE5WcYL5WhkegbCryVSRjQbKgcSOcOl5o2G4LQq6Q2izj?=
 =?iso-8859-1?Q?a8Yllt1i3wUVJZHtix2BegLl6B7VpPiP+2La1CS1TFrsDDb6wARd+o9OFN?=
 =?iso-8859-1?Q?J7Pexfo4h6I9/wbHQNumef6N7dGlJm86fsm3Y5mqQldg+1BOFR3gvunZjS?=
 =?iso-8859-1?Q?SK9ApQF7A8SjpxRdV3hhywl+9YNfF+B9BRBFAekny3IEVebHnNDgLnwLxL?=
 =?iso-8859-1?Q?gxlEjIyGuXIL5tp+legYJN1OlTNs4yrvHkVmEIKn7yVtWJHhXJIh8bdOK+?=
 =?iso-8859-1?Q?hQ9F+QVk3VfCI8SpsmOxwfqyNLDPrNA9qd4JNGKd36aKOtAsvfuVlnked4?=
 =?iso-8859-1?Q?oeOJbwWdnysvZaZ8brZIl8u/gqcBe64EUkcaFPZIzHhhc3btaqGW2yYL2T?=
 =?iso-8859-1?Q?Eik7sOTzTVxfjjnW8mpU1Q+J8vIEAdp1640MQiAdtTnuzoUmvPnPSIPOnk?=
 =?iso-8859-1?Q?bpnaHWRQJSe44d7qCvusvWF5RKAgdi/QVN4BVE+jeIhNophNYhJylY3VOn?=
 =?iso-8859-1?Q?XIzo1XPwkED7O7mkPSHfnHx+BSlj6BDOsMtlm0RqX+/b3+/t6W4U5GvCBt?=
 =?iso-8859-1?Q?ghTpsyM4nMg9S47rPwuo6e6FR7BNVAl/Nmzqcfii/gUQK7JCKA9c4tPz6B?=
 =?iso-8859-1?Q?89HbJhutc7UNuf/bni5j4KSat1ZXM0iYLOOuUAAkDTiNL1TUYsRPK9ZRHn?=
 =?iso-8859-1?Q?ca/MbucEe9fFwM2PkMjuJxeYmAGkpIhhtthxEnzFleBuhHg0ypwR/D8In9?=
 =?iso-8859-1?Q?epqJqPQ8ILGkuwMwAmL/HjIMGjsb38quADoAFxQh/xAkBR1EENbD9KzHME?=
 =?iso-8859-1?Q?N7/n2PdCW3Q4Qc+hRJzKMdJGVoh/HJABsfkzOozaOrlx7QRJMOtgmSZVG/?=
 =?iso-8859-1?Q?WT+UCBaOO5OSkLFrhUife58vLT6It5QrpbhWZBxzlZL9D4QBPoUXrBmaGS?=
 =?iso-8859-1?Q?fLu+QeM4fDMEDiF7TT0pua7WgMNBqjP9Dq0C72CIXcmiqvyjkqDFxd2ixd?=
 =?iso-8859-1?Q?0HMJ60wInH0kBuCAt5xYrmccweJdGEG7L783PLQRLiDGa88HkbWVaAQfzy?=
 =?iso-8859-1?Q?E+Yt/L7hNVyTqmjqJbwPlu+xNzv/EKVEJIGqIhudSniNyQUQLJVsi+eH5v?=
 =?iso-8859-1?Q?FoO4E00RShVGpLXsMCQpnRWVgiVPRHu9QNx6cbbr+oUkYubCV4SGJNdIfB?=
 =?iso-8859-1?Q?N4GWfqACLBfb8/5Lc7jCIgaaWMNXj9T4sptgCGJ0RCIPFkDbS9aAE78w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142839a6-afaa-49b8-3418-08de1172c715
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:19.3737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSO2hRbn2KXYHheet2hSROoYFfVTjrZN9nfXGDtVSiQ5/8GbuAIElbV5TNnvWhAzIBS1yU/mv16MwO9snPwpig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644

From: Luca Fancellu <luca.fancellu@arm.com>

When pci-scan is enabled and Xen supports vpci for guests, Xen will
scan the pci bus to find devices and emulate the pci bus, so the hw
domain must see the emulated bus instead of the real one.

A new helper function, hwdom_uses_vpci, is implemented and returns true
when pci-scan is enabled and Xen is built with
CONFIG_HAS_VPCI_GUEST_SUPPORT=3Dy. When hwdom_uses_vpci() is true, a vpci
node is created for the hwdom device tree.

Depending on whether the guest is using vPCI or not, and whether the
domain is using host layout or not, generate the appropriate device tree
nodes for the guest and handle the right MMIO regions traps.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* make make_vpci_node static
---
 docs/misc/xen-command-line.pandoc |   4 +-
 xen/arch/arm/domain_build.c       | 151 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/pci.h    |  16 ++++
 xen/arch/arm/pci/pci.c            |   2 +-
 4 files changed, 170 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 3a59b2fce1..1633116ee4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2084,7 +2084,9 @@ Flag to enable or disable support for PCI passthrough
=20
 > Default: `false`
=20
-Flag to enable or disable Xen PCI scan at boot.
+Flag to enable or disable Xen PCI scan at boot. When the flag is enabled, =
the
+hardware domain cannot have access to the real PCI bus, it will see the bu=
s
+emulated by Xen.
=20
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4bbffdf535..87a25396f6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -41,6 +41,7 @@
 #include <xen/grant_table.h>
 #include <asm/grant_table.h>
 #include <xen/serial.h>
+#include <xen/resource.h>
=20
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -1557,6 +1558,142 @@ int __init make_chosen_node(const struct kernel_inf=
o *kinfo)
     return res;
 }
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+struct vpci_param {
+   uint64_t vpci_ecam_base;
+   uint64_t vpci_ecam_size;
+   uint64_t vpci_mem_base;
+   uint64_t vpci_mem_size;
+   uint64_t vpci_mem_prefetch_base;
+   uint64_t vpci_mem_prefetch_size;
+};
+
+static int __init handle_vpci_range(const struct dt_device_node *dev,
+                                    uint32_t flags, uint64_t addr, uint64_=
t len,
+                                    void *data)
+{
+    struct vpci_param *vpci =3D (struct vpci_param *)data;
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( !(flags & IORESOURCE_PREFETCH) && addr < GB(4) )
+    {
+        vpci->vpci_mem_base =3D addr;
+        vpci->vpci_mem_size =3D len;
+    }
+    else if ( flags & IORESOURCE_PREFETCH )
+    {
+        vpci->vpci_mem_prefetch_base =3D addr;
+        vpci->vpci_mem_prefetch_size =3D len;
+    }
+    return 0;
+}
+
+static int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    /* reg is sized to be used for all the needed properties below */
+    __be32 reg[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1=
)
+               * 2];
+    __be32 *cells;
+    char buf[22]; /* pcie@ + max 16 char address + '\0' */
+    int res;
+    struct vpci_param vpci =3D {
+        .vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE,
+        .vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE,
+        .vpci_mem_base =3D GUEST_VPCI_MEM_ADDR,
+        .vpci_mem_size =3D GUEST_VPCI_MEM_SIZE,
+        .vpci_mem_prefetch_base =3D GUEST_VPCI_PREFETCH_MEM_ADDR,
+        .vpci_mem_prefetch_size =3D GUEST_VPCI_PREFETCH_MEM_SIZE
+    };
+
+    if ( domain_use_host_layout(d) )
+    {
+        struct pci_host_bridge *bridge;
+
+        bridge =3D pci_find_host_bridge(0, 0);
+
+        vpci.vpci_ecam_base =3D bridge->cfg->phys_addr;
+        vpci.vpci_ecam_size =3D bridge->cfg->size;
+
+        res =3D dt_for_each_range(bridge->dt_node, handle_vpci_range, &vpc=
i);
+        if ( res < 0 )
+            return -EINVAL;
+    }
+
+    snprintf(buf, sizeof(buf), "pcie@%"PRIx64, vpci.vpci_ecam_base);
+    dt_dprintk("Create vpci node\n");
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "pci-host-ecam-generic"=
);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "device_type", "pci");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       vpci.vpci_ecam_base, vpci.vpci_ecam_size);
+
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    /* Create bus-range property */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, 0);
+    dt_set_cell(&cells, 1, 255);
+    res =3D fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#address-cells", 3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#size-cells", 2);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "status", "okay");
+    if ( res )
+        return res;
+
+    /*
+     * Create ranges property as:
+     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
+     */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_size);
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_prefetch_size=
);
+    res =3D fdt_property(fdt, "ranges", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#else
+static inline int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    return 0;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1615,7 +1752,12 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         dt_dprintk("  Skip it (blacklisted)\n");
         return 0;
     }
-
+    /* If Xen is scanning the PCI devices, don't expose real bus to hwdom =
*/
+    if ( hwdom_uses_vpci() && dt_device_type_is_equal(node, "pci") )
+    {
+        dt_dprintk("  Skip it (pci-scan is enabled)\n");
+        return 0;
+    }
     /*
      * Replace these nodes with our own. Note that the original may be
      * used_by DOMID_XEN so this check comes first.
@@ -1766,6 +1908,13 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        if ( hwdom_uses_vpci() )
+        {
+            res =3D make_vpci_node(d, kinfo->fdt);
+            if ( res )
+                return res;
+        }
     }
=20
     res =3D fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 08ffcd4438..7db36e7bc3 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -23,6 +23,7 @@
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
 extern bool pci_passthrough_enabled;
+extern bool pci_scan_enabled;
=20
 struct rangeset;
=20
@@ -173,4 +174,19 @@ static inline int pci_get_new_domain_nr(void)
 }
=20
 #endif  /*!CONFIG_HAS_PCI*/
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static inline bool hwdom_uses_vpci(void)
+{
+    return pci_scan_enabled;
+}
+
+#else  /*!CONFIG_HAS_VPCI_GUEST_SUPPORT*/
+
+static inline bool hwdom_uses_vpci(void)
+{
+    return false;
+}
+#endif  /*!CONFIG_HAS_VPCI_GUEST_SUPPORT*/
+
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 3ddee5cdbb..31aa34153f 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -92,7 +92,7 @@ bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
 /* By default pci scan is disabled. */
-static __initdata bool pci_scan_enabled;
+bool __ro_after_init pci_scan_enabled;
 boolean_param("pci-scan", pci_scan_enabled);
=20
 static int __init pci_init(void)
--=20
2.34.1

