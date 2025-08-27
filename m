Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393CB3897B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096717.1451341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKob-0007Ip-DQ; Wed, 27 Aug 2025 18:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096717.1451341; Wed, 27 Aug 2025 18:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKob-0007FP-7a; Wed, 27 Aug 2025 18:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1096717;
 Wed, 27 Aug 2025 18:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoa-000703-0r
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:08 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a6d8a6-8373-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 20:24:07 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:05 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:04 +0000
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
X-Inumbo-ID: 04a6d8a6-8373-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeNXKJ/tbWnWTIE9S5rZH44sZY4iy7k+0TFW0KeJm6/2IYLIeKownRU7I05jI251/lf8UsdwmK9tkBfCaoX5KMn9/77glp50JsaJhXap2x3849gD7Bz0qLAl+Gpa3qrdHZPjis4Av3/ha0wxH9rPlR/3z+VI4WHlO9z+i03FP0iZYQH2oXLrV6/hhUg+sGkE/oYuXqTt0hva35cn67ecE0V+kuAswCWvqA0Gi7Bj7LoDrXRNtxnFsfRsH70DiHYasbZKCLY0GM9ICoTbUf8l/jqn9V1xIN4awG42eXlbaebS1Zn2+YHetVU2E4BJxvoC7UXJEVNlPUwen9mw+xqdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz65tM7PzKVphk+yYvuSYrGmPb7ybjDiWD2dFYW8W1k=;
 b=wPipBqCziiwKz0e6y6E/sFTpLX+PWFiDhtQ2dmlc1J5a/6ULhGLzEMBG3+3sgnum0z4ac3YYnF3985JAU9snCMvbfeetCAyZ/17pw/FsupyACK1t97elYKpT/D5B5F1p6MNxB99GiH+D/L1rOuVSSoJNeepPHCLz1YTujBkfw7iY8YgUgyNOOVhWLji6mAzbNFsry0bkRm/a0HFhcsUAOPsCb39jDwqC5/07CQ/1bNB7WW8sphngdV4a4vTJEoFYICb5b4ro9fZg5X+nlcPktJ8Fh46Ca1mCgIxsA++5mACbgO3hp4H6UQ5zzTCzRaV9xPK2F8e5AUFZiLOyjmkxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz65tM7PzKVphk+yYvuSYrGmPb7ybjDiWD2dFYW8W1k=;
 b=XormrpYkXoBegam7HdPaO3BBxkuhxvryawJGnKRbk2SW3Xzcz4gpHqWOERftixJfFzuc5dbCCpVqT/Ly1LitMuRZpTiW8MDJnIZoPmZlYVIhcePvCFzwJB33ZuY1C3nF0ZFqmF1eNUAOBGOWi1/z4vEQlwAMVpVcIBs/G3fh5jFzTNOQHWcQNEtw2NSfDVGfJfZk4uUnf5akEL7/i+TF+Oa/QPrSpuFqU5CwunfvkoBP+bqrM6ka8mDOwPowIyOEdPVTn2uhN6rHB9CgjQf6qAeSB99IFFctTPZkCJ/+WvsBVbnWZ+S0wpnefgFSVAsg5P16lbTJVjZdtRiRUbgXiA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 02/12] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v4 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcF3/Ff+oSmGvjakq9bpLMhjgPlA==
Date: Wed, 27 Aug 2025 18:24:04 +0000
Message-ID:
 <684757e6710826200bcc153e4c711b27483ee796.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: eaac357a-d390-435a-73e3-08dde596e780
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9GyHdcO3HZ6qjOaW6G5Rj3cXJ5qEEOJ80D6077LR+JUxGECgWLLgvyBhYp?=
 =?iso-8859-1?Q?IOzXBsJ8bIjHb2uFb5GCl7DbGsimR0QVKV61yt98rpBJgBETCcXFs9Svw/?=
 =?iso-8859-1?Q?jhyzPMg33I2Lnl3umN0lf7qdwT6Cm/GRWDxe3Jel68ku1YVWq6gMPRqptM?=
 =?iso-8859-1?Q?xV1z7333sdnzhdlUdZoADLLRGU45jfA1HzNWH2MRdvKCePiR6naj5K0gum?=
 =?iso-8859-1?Q?IbUZa6+4P7k3139f8iIsv/+he/V+QBQZJiXhR3k4oKP6XEQK1uugx1GlQn?=
 =?iso-8859-1?Q?3qcP7fCrzHKKBOMgkx52mR1SV9Moj56ijQ4vrRQeeuB0GoriYVFTVfMb/c?=
 =?iso-8859-1?Q?GhVgWb1CQNITwIt/NJt6IBx1DuwNMQYc3+IJX1sHxglDEknhx1oLw5mFob?=
 =?iso-8859-1?Q?d5Vo3gwYO8i1ASptHyI4zkd2oy8UbAXIcgUSQkv+0918N6j2z2vrNjNGba?=
 =?iso-8859-1?Q?zaUkUQ3mxH01RMo6nDFYAPtcPhzmZAtsO3FjLH0N/wqF4iNwPMbyfwTosE?=
 =?iso-8859-1?Q?IYT/ME+WQEUd88Jkuf9+QhpR48mooL+EWVZWHvfAtYYQrRt/Ixfg/3oX14?=
 =?iso-8859-1?Q?oSy9aNjlS/xIX3ZF4vDuxhpU9l12ddINY6uYY4feozCjTDhxdM8wLpN6mT?=
 =?iso-8859-1?Q?4EZhgkauVpEMmi6/zpw1Fl7j0Hi4L+RRsQ3+wVNP3TSRFNLHX1VrLxFCBP?=
 =?iso-8859-1?Q?VzFtOPMllaC9N2ZsoexVxgFStLOS61+sLLc93Hlwm6ndlKbGP2ffEp21RU?=
 =?iso-8859-1?Q?neXCK4Ugwzb/2SxnKLpXTTjQCd7Sy8jFDO7InXiN5fHjssPrgBvGFmJKN9?=
 =?iso-8859-1?Q?fuKj7TEdfsq41IQ1QjP9dpBNiVbl8mHr6jB/p05lvnCCsF441KzSidgnFx?=
 =?iso-8859-1?Q?RIRzcBkXnatTwZ4lomrDY1QpQ55ZIvZz8URDL29ibIaDhgrxGOgpTCKrDM?=
 =?iso-8859-1?Q?iWpuu3iVC9dy5VZGhCiQpLWje43jY62hvDj57+HLgP8boVyxSAQLGI5kqj?=
 =?iso-8859-1?Q?jmK2OovUWIufrauGELy6Px0SGiUFb1FsDsS5nIzzMb18HXcf5v7p2sNQFP?=
 =?iso-8859-1?Q?xawuPSoOqQYWHWCHRGjfTnkxvWpbIIb0C9hKvoZFV1VbH+XgTRbVctgZ1k?=
 =?iso-8859-1?Q?lT1AriimOJgI4qenKUyUmGUTs9Xt4dKde29pbo3HVXg5DLqyg4VzKd2/L+?=
 =?iso-8859-1?Q?di2yIxYK+sd1+6BdBymrr99Ppq10m5gC+WMd75Ar8xC08VsdUSzcyr2DZh?=
 =?iso-8859-1?Q?sARZllRboZCaKiVKW88brRl3BrNmFU9c6qBcFblIhkMoLpixQwfV3F9rCa?=
 =?iso-8859-1?Q?MGEq7hQe0VsvJJTB0WtUqQOfsvM14uMSVEW3VVkQa+fOY0CPDljLiKOoD5?=
 =?iso-8859-1?Q?LO8iwGWEufy2fGtAoJ575bNJ4Bnwc2eMusIA8i7V4clu69XMSd1dHryJQa?=
 =?iso-8859-1?Q?r8Ffd25PEEMkHI9NtI9XuOhvahBNzwCutZ96gWCJX9eKmMK3f6yCTe7JYy?=
 =?iso-8859-1?Q?T0qFh366mD5KC0zWST//nS+jcvnf65BFdCgjZ2T1kPG8lPAsmPObFFANvq?=
 =?iso-8859-1?Q?v71k8kw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uENEI1RyGp57m4dsnVCiOcjGaWPK0BTGeWjB1qTTjFXMwvJx97QmcZtEm2?=
 =?iso-8859-1?Q?rzJrGdR/9X8q0Mij7gA04PkmiA5eAzKNRW8fiJQ9IFPhc2VtnC965+5L3+?=
 =?iso-8859-1?Q?DDVz0OrsldvfjIrxaRWZswZ5zLESa5xnITEsLUssQcemI3XLWBlu66wPDj?=
 =?iso-8859-1?Q?VZndB3+EQjm6lh8bPhS7DlNk2//hnMMLxAIMPhzBeclsldRx8ZdRYanXCN?=
 =?iso-8859-1?Q?IiOzoP1lXa191tuR2MMFKZKAegQKwBc6KUxMFlc+gAyWJlltLZ/mZ/b6BI?=
 =?iso-8859-1?Q?dJPcSAMrZCFjClN1g2bxKs7zqJ9v0uzs3mqVbeav0a9IFFciY2AhDX6K4v?=
 =?iso-8859-1?Q?syhHKO8fj7a1AY1PkEoWH3GrsQXVSypNWI5/ULzCim8kjyh3fvzYBs4WyS?=
 =?iso-8859-1?Q?e6uxkeCOfA49Z9KQWGeBSUxcscAcM6e4OqJAiQaKjDhII7waHNVheRj3V3?=
 =?iso-8859-1?Q?kWnmrqaFLqe1sy+BAoMmiY/YAVyx6ccszTOS6kQwRqDN8tEGBcE8OyvFtR?=
 =?iso-8859-1?Q?w2UfMyPDF8ut9HWt8xc40O0goyGjFJdvgAsAbjNtVvo9C8uQid7q0Qcevp?=
 =?iso-8859-1?Q?J17LIifBtSUyhrDmjC/8rG9e6mEuy3UOn3493dN5f0gwQswYI9QakglNld?=
 =?iso-8859-1?Q?0W4RmvU5PUueTSYUDdianAK15vPsXet2cRVAerxvODPZYjUk9bksH7olKU?=
 =?iso-8859-1?Q?L1z8kOrYth2rKiabv2QvIzAYz3VOz+M5CryWQkoS219f9lEV7GGioaM5IM?=
 =?iso-8859-1?Q?Xxw1VfIMgu92L+l0zdRLzeJmL+VoU2+9rlmDb7Y3uJkd3zqad4wS/ifTBV?=
 =?iso-8859-1?Q?my+2d+0MCwnrr3KkRSyF1lKBORXcpyRzZ3/Xao5ZO7ev4uvoIQggzhR8js?=
 =?iso-8859-1?Q?CINJvf+srP8Fk7RI7md3YK9qKiIkJ42czeih67MQsM1ZLfI4IA/omF7T/z?=
 =?iso-8859-1?Q?iIxKeMUSekG4FTM80e2HogZoaGouRgp0MNDahByKmqIIBhpXuX2bZ9xD/T?=
 =?iso-8859-1?Q?nl6wiXgtHK7Xr+1wvlXQ7jg7ssJrxmRc57POJpHRuGGIduQOSYaZIxTUv9?=
 =?iso-8859-1?Q?z+rqUccC3eFfkk0WKLjZvnqlUE5k72JXh/QpNouglIFhCpJxa6jJpnOW34?=
 =?iso-8859-1?Q?OJccq7FuBQa4X23WMafRQB/qlf5vRR9zvOS/W5dPSsxSbqQdsehr7zin+/?=
 =?iso-8859-1?Q?7mdkRGBdixuWGmUhq4DftJ1iYnZ52OlZZKl2KFqJEEM7/04n27IH5+cZ7u?=
 =?iso-8859-1?Q?hI61XVeQqtqVm0dexVf9zSuT4iQSh/X+QidPLjwTrSB3bDNo4OmEMoHrB0?=
 =?iso-8859-1?Q?h2raY7zy3JBzTDsWHiX02bYoTsMQdmPsR6987LvdwAtRT7iYFAPqOPChBP?=
 =?iso-8859-1?Q?AQhm45T6SKnXyev/qdCboKceYBiUBnqwhV/tuVAt+l5K0V/eomWr14eQK3?=
 =?iso-8859-1?Q?z2tgEFaDENMqOUZWi0A6mJoxZA1/G4IiXbMwA/O59nyQ0BKPcwKPu+7NFp?=
 =?iso-8859-1?Q?RJDGU5tuJmiP0wtaSp36wqryIokDgYdL5IEnYm/cStia21erodIXBv5e7m?=
 =?iso-8859-1?Q?dxiMP+NAXo1oLuvbLJGTDfcoWapurLNizV6MAMPbB8uPAkB1OKG5I1RX6w?=
 =?iso-8859-1?Q?O9rwk6yGgTZxvmN4iw4GXYXtcqbf7LRIvicBrJMwAFakW428nAFiGXpBgs?=
 =?iso-8859-1?Q?hvDUHzftIbxkPgzWjMc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaac357a-d390-435a-73e3-08dde596e780
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:04.8189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euKlBioGLFcaZ1wU1FJ5LsTvrb74thoHCGhsYnCQcmiM7caNbN2EHABYnFom7sxL/s5EggxLJsMfjZaEcflQSJha2UdFFLaa79dT15EedOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message

Changes in V2:
- introduced this patch

Changes for V4:

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk
---
 xen/arch/arm/gic.c             | 2 +-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..9220eef6ea 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));/* Can't route interrupts that do=
n't exist */
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..3fcee42675 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq);
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

