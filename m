Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FCB98B83
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129033.1469178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPS-0008C3-Aq; Wed, 24 Sep 2025 07:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129033.1469178; Wed, 24 Sep 2025 07:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPS-000892-1U; Wed, 24 Sep 2025 07:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1129033;
 Wed, 24 Sep 2025 07:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPQ-0007np-9d
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:28 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64278f53-991c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:59:26 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8118.eurprd03.prod.outlook.com
 (2603:10a6:20b:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:20 +0000
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
X-Inumbo-ID: 64278f53-991c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFIPAnGn8br5xxgnj3EiCJqMlI2GVIazx6oOZ9UUWexe6KsRV7ep26sdvAA7Zn/Z1oo4Gakt34durMf2BL9AXM8q6KZzNDAmZpiUwv02qPsmrR2II+vobnkm5gNNY+zQwIdWotd7UaYhIQfO2gMW59o/CLNmdoDPD+VAy7T97X46YLlQiS2kIIkJRv6ouXF8yYsfaIx9iai8jnX9e3tuucVlEPfEV2Es/ErUDbaRJuHQdP/d1lhAIME9Kp6n0FSmdOp0X25ORO2rNzuvXlJNWhjekXOJVUR5ThUcB9Hq9Gu4HVjf7VedR1Zm34VzlV8CBw9yXaFSPD0/NKpDtXgjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ULNxCLY/jmCoKaMjog/ApjkLvSJVKSwnm5oihu+azo=;
 b=AVkus8RUv6EKNarb1ICnHuNpNvuMwPnuwqh6gD3GvWms/b1UcOMFT0ITBVXQXSpWJBAyYmPCP/3BD2jxS8nMQPc0t7elZRZ0K3qSJmadLpH4v7AXGFMEG/oJWHxPrYW75A8FmMvj55qTc9+lesx1x+8/nveExvkY7tJ+0HP2qtE48vjGeCXwJJ5ceor8ShWdiz6rQ+Ixvjmg8WLYKWSRVvXQ0QJZvWfaUELU/WGp6ay8d1fjSEZgKBaRy+LqUBZouJojGXMvO3hVKOMAy6N65u180QaaqoFG6L0HrFXZja9aJ9Uj7+luYZ04D7WCbFfutM8VGTfSPl+q/62Q5jv6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ULNxCLY/jmCoKaMjog/ApjkLvSJVKSwnm5oihu+azo=;
 b=f8PuHn5dTBMbrf7YbNI3ZYG0muWQ/y8rAPA1u9bV4ORMQ715VXOwC5+e48UGIx2mfT0zV9rlari5QoNjdNHSXWhp+4HFrhyoQC8rstfmA+6mKR3SBEC2a4eWcM3Ut+xt5F9czaSROwuMHzHv7bUeYDPPALEQYUXJ3rktB7ZXm9m2DQU3TrQ3oEbJyNMm4EeRfVjfprMOuDUMyA6vlIPhFo3ZALI04Wq+/mymIJDWFMF0RhZk7LRU+yCReBQoqpmsjGSPqNc0Z0Y624paT8yuUnW+Wbw/LCtlZUaaZ9thcw+jIYhZxu7pvPzSS9DhAh44wAT+lf978yAVejPFit6ESg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Edward Pickup <Edward.Pickup@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 1/8] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v1 1/8] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcLSkihW+vIVPOD0C8lQtI9fOeZQ==
Date: Wed, 24 Sep 2025 07:59:20 +0000
Message-ID:
 <38d8a5b16f55cfe903c86073c48fe0d6d7af107c.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8118:EE_
x-ms-office365-filtering-correlation-id: dbb0c5c3-7cd2-4aa7-9db3-08ddfb4044d3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?a6cO5h9MTuBIDy12rb7uTh9slhbucGMmqsUVlxuxGhcKr8DD4FXx3qSVRb?=
 =?iso-8859-1?Q?lg2CilCSEq0iMGsd0dIXhEJtBUTQiyn9D5g2sZtf03JmI9aej8PPiBYLva?=
 =?iso-8859-1?Q?IPKwuamGCu9aN1+9bIiMAb70QQjqTL4OaCVSCXEO8gdeazzVZzF1ABPV74?=
 =?iso-8859-1?Q?65APPAnVkHfvvZysicFpXWnEEfK4Oi1eMTEbeUR9D6a+YfcGzX6qEIGj7u?=
 =?iso-8859-1?Q?B1R6ZbRH/vLFbRVRn7ufGn20SiYbrwctQ2eAKN3FhZ6PfXEs8plGi19Zpd?=
 =?iso-8859-1?Q?F8Fwd83oyhmrGgHXJTJGQP32BycWIB+L8METOaeF1qo74+pIfyyzE8cIan?=
 =?iso-8859-1?Q?k0FYm862TCzgzB6BwVhZ72CqMh+jomARiMXmlZROUWefpo0QyGEFjT5tjf?=
 =?iso-8859-1?Q?JFM1+jguR34ykllEBaVJ2U2egXT0zQyaXU2Vb5dKCFPaJWvSuqwnUE5bBg?=
 =?iso-8859-1?Q?FBOdibYVJLNJJfFTEiKNbVrnYURDUvtaX4NSqlTzcKs0qNPakKFwCicNOF?=
 =?iso-8859-1?Q?d4+w01g0qTKMxo8w32v2HtXjBTOsLETDD7nF9polCg/RkIDI3rzIH19+7Q?=
 =?iso-8859-1?Q?p/RI5kzkyDVmXpawF5t3WvPkjO++gerdS3FwIy6ph92MkpF4B0WIV2dwjb?=
 =?iso-8859-1?Q?0UdhFb3LQEsdEwNsURgudtIlVkx56A76H/QKG34AOV+utPKFmiLLx+/weV?=
 =?iso-8859-1?Q?ujjGNicSx20FojxU/EdiXsT9fh2mAcoqx5iVwJ2PCf+pTrBpW+ACAtjh6F?=
 =?iso-8859-1?Q?k9iHDJeqDBosf+G2tQaJzCjHzja928+c0B3FPdQlXhS6DqPOpaP02fB1Ma?=
 =?iso-8859-1?Q?YtWoKrJv1ySedkEG84AiEbLxmf1EoVaGDCPkAjDMaWsERceSxGNI+1V8DK?=
 =?iso-8859-1?Q?rof2u6CkLkALabZSUrNm09eTmd/Mmn2DgZFX3NMra6YVHL7K7dPcNX5jb8?=
 =?iso-8859-1?Q?pTiQ9Y4cMchsXcx5RRkNo+k/h0543FmH1pWum+h8cNsNxRJbinUNThavuS?=
 =?iso-8859-1?Q?yMxtNRg137QzFgnlKQEtlZesBKA9upym2s3lFcOJj2GM6YryO5X3uYSf2Z?=
 =?iso-8859-1?Q?PyVs8M25BnObDEZDz4uKah5TMLzbAI4MPGuYRjDvVnewIK8TVhfcv1YfYo?=
 =?iso-8859-1?Q?VL3qbnjUNcDaFWwyffpMXgIJy6Gmdrdp6q0ItSSrhQaiOrJjn+OQQh2A8Y?=
 =?iso-8859-1?Q?gahxaK3WQmoX9LDwzZhy0ZvT7dPPOlUWlCutd7Opscwpos98jMVrQcbt8H?=
 =?iso-8859-1?Q?dG7wbAsGLjeN4fBuFo47k2oAwD0xcri1k6Bn5cGZUF/5+KCfrKBN9LwxXk?=
 =?iso-8859-1?Q?Xv3O30Acw3fUVuPJfG9TA+xqicWIDGMjupj32NR4zSxsyjIvU9DFqGy/RY?=
 =?iso-8859-1?Q?uFgxCIJAXr/HKSdIJKEjGOEU/u0YF7yQjVks5E8XM87wfu3WNRizK/UDGA?=
 =?iso-8859-1?Q?WZLSpOIN3akOnkwepFI0aljiMIIUoWY6iFTmwD+ofAWmGj/i37U2isGZ4r?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JHw5qgZR/rwXEothMbxBa2yA1902msuOOje/xr6xbPc1ugNWhK8vKY8UYU?=
 =?iso-8859-1?Q?Yg16p72YjtHLSIBvPkjigqkDoLkWn+bE1uePpHI/id9bMkr7JPUKxEes2X?=
 =?iso-8859-1?Q?89+n6lojYiglWam/jvwdNUbAOTQ8Pq9dvwTV+pR0hAduOvgKHqrsmBXhTZ?=
 =?iso-8859-1?Q?nmtLPzHZWqme+1QYVc0e7/1ofmBaLaLPGSyS4uD8RCB487kyw6tXu/ujLZ?=
 =?iso-8859-1?Q?rt8RzsFmrMASPd3+PR5KGZ8JKAZN98yQJ5oReKLtRw03SZIPfzh41wRmT0?=
 =?iso-8859-1?Q?6b/aC9lbCim/MVbBTsa7AM1YkSy9KNpP9nO2JYPxfBOUlxJ2fypv0F+CnP?=
 =?iso-8859-1?Q?ywfAgCMPsWAMTycPx5R53k4dU5y8mHf7TDaUdKq6UWZj+1JZm4jcctY3Su?=
 =?iso-8859-1?Q?DOOtdRDLh+1K99pEHxGsePX3aHY77Pqfcow9xroymTepe8bAstexdBmW0P?=
 =?iso-8859-1?Q?RZtWH3nvnQfHV1ieEEcWfx3+DqI3JEYtVJGW9ua1h5ZzYlCLl4+Q/dPQE9?=
 =?iso-8859-1?Q?x7+SkV1hsIYchcRSRPI+aY18eZzTuOZRzLVVvij7FJFLHBGP2ksI2GugC+?=
 =?iso-8859-1?Q?hv1YqFxAUykfr6inYw5birqRd7ajGzHhvp92MJTFWc9LW5vbpNtyPkAdVU?=
 =?iso-8859-1?Q?qT5QLIWP+2d7DRpHsjBexw/Fz7dN+RYd+0sRtJDIJpYQpGsvHemytLYOO/?=
 =?iso-8859-1?Q?tJoMg2KGk7uMikYmd1LKCUxlRbDy4xTdhTLV/jstG+8asGChxITVIVlIMK?=
 =?iso-8859-1?Q?9UvdBuHAgJPbkb+FFssNlSHuj05pABZqkco4Ei4FSDOtOO34EbKoaQAKFr?=
 =?iso-8859-1?Q?SVODuXC/sQYlhCcMIPkjZBWOt6xeG73K1EVOvRyL5hKIi1B0oMLVnX1ZIk?=
 =?iso-8859-1?Q?yz00+K0TzH3PNeFU7KEVOtMucRNrS5Jzr5rQGVnBpfiiMeYtKxyJPRPIrJ?=
 =?iso-8859-1?Q?rBuaa+Q6yUB2aoeY7AnIRdZC/TvGyWqJEK4HviCXcVsnGzxHddJpdh2UDT?=
 =?iso-8859-1?Q?gFgmJ7YRtCpHQodAcm3cX9R048fxHgO9uBM72h+FkCR2mpgruLHEBv4ZIL?=
 =?iso-8859-1?Q?SoyYCmxooI5cet9Wj3ZbZ1Xf0DbYTBGidqunuY+UnjJf4K94gbfj8nbM6u?=
 =?iso-8859-1?Q?w4RS9LF0ZOPiRcKpYCqAtZQJ/LvZVQGy+JhBPehJ4S2XctOVHdiFH0VLbk?=
 =?iso-8859-1?Q?Nz+cmIul0bMqLSrpuAPG0Ve2n0MZ0oG3NF3AIWa+YaF4Ee+lpIHNXuJbmz?=
 =?iso-8859-1?Q?RoTr2726JFBIXzjC72Dn23t/b81LuIy3y0hOAAXt+/ZMezm3qH+5+b+jZN?=
 =?iso-8859-1?Q?Ts8+zRhYSePY9gd4FUHzYp7rxmdem7XjfBqjMSp/0ZIgQm9tra0OWRpDm1?=
 =?iso-8859-1?Q?p1+dhE2nvOom8V3HzeCkuPRtLrflj/QPpAOnavvOvwx/aTe1Ju3bVf2+9c?=
 =?iso-8859-1?Q?VI8jFMtIOSeoQwscH3xTCb9QjBx8heSIxnlJXxEvuehFpq6X+FzZRQUd+x?=
 =?iso-8859-1?Q?alRFpw5KRn3NDK74FPTrcFixLQXoB+Lp6msjvTgkjwIZPiINWmUGfPn3L9?=
 =?iso-8859-1?Q?B78OcWErxMBqar/3JOfY0hU5zdX6WKNUzX92drBrF41Qpx9MNnyWWvJSuv?=
 =?iso-8859-1?Q?Qu0dbZjnBbYsVa4a5jZHtXXbezmZTTKUC2RP9ujCJx0b4IMNEYG2tQtw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb0c5c3-7cd2-4aa7-9db3-08ddfb4044d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:20.5065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U85c6BSaM4/krmTAmcFLCyjWNngZ0zX3R4hE2viht0/NuJwImKhwWLgZSiDIu3ig9YVO90ta/rI44ASleWnSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8118

From: Edward Pickup <Edward.Pickup@arm.com>

This patch adds a Xen boot arguments that, if enabled, causes a call to
existing code to scan pci devices enumerated by the firmware.

This will be needed ahead of dom0less support for pci passthrough on
arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit bce463e1588a45e1bfdf59fc0d5f88b16604e439 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

v1->v2:
* remove is_pci_scan_enabled wrapper
* make pci_scan_enabled ro_after_init
* drop debug prints
* drop Edward's SOB

changes since cherry-pick:
* s/always_inline/inline/
* replace additional kconfig option with config DEBUG
---
 docs/misc/xen-command-line.pandoc  |  7 +++++++
 xen/arch/arm/include/asm/pci.h     |  3 +++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 24 ++++++++++++++++++++++--
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 518e42d965..4a66c5a8f9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2072,6 +2072,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### pci-scan (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable Xen PCI scan at boot.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 08ffcd4438..7289f7688b 100644
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
@@ -155,6 +156,8 @@ bool arch_pci_device_physdevop(void);
=20
 #else   /*!CONFIG_HAS_PCI*/
=20
+#define pci_scan_enabled false
+
 struct pci_dev;
=20
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 487c545f3a..d3481b05eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
     }
=20
     pci_add_host_bridge(bridge);
+    pci_add_segment(bridge->segment);
=20
     return bridge;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index beb1f971fa..1b34e17517 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
+/* By default pci scan is disabled. */
+bool __ro_after_init pci_scan_enabled;
+boolean_param("pci-scan", pci_scan_enabled);
+
 static int __init pci_init(void)
 {
+    int ret;
+
     /*
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
@@ -104,9 +110,23 @@ static int __init pci_init(void)
         panic("Could not initialize PCI segment 0\n");
=20
     if ( acpi_disabled )
-        return dt_pci_init();
+        ret =3D dt_pci_init();
     else
-        return acpi_pci_init();
+        ret =3D acpi_pci_init();
+
+    if ( ret < 0 )
+        return ret;
+
+    if ( pci_scan_enabled )
+    {
+        ret =3D scan_pci_devices();
+
+        if ( ret < 0 )
+            return ret;
+
+    }
+
+    return 0;
 }
 __initcall(pci_init);
=20
--=20
2.34.1

