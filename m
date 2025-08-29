Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB0B3C04C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101653.1454656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cS-0007WZ-5a; Fri, 29 Aug 2025 16:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101653.1454656; Fri, 29 Aug 2025 16:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cS-0007TR-0x; Fri, 29 Aug 2025 16:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1101653;
 Fri, 29 Aug 2025 16:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cQ-0006O9-M0
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:26 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cb5f65a-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:25 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:22 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:22 +0000
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
X-Inumbo-ID: 1cb5f65a-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNjuibfyj3KkvfvHhny0Mz+y7rvWiQaxpfqHJoInAywcpgULfok05An7vyh/Yu4Jx88k9xtQEGbwNgLfNO+xzu/5j4CU0RUjUhyl1O9/atv17UEGRm0Dreyn0S4NiGE5HcxLZBeFsthUN9xZCBugtMhyc43nog4NVIwBGzEPUpr5n31pKmYYgpD6drP6UlIagCdT7tSuSxgUFfd7Ob2NeDWj4D6qwQ2uiXqe34pCmPTtyYMksb5sqmd41cffRi5ThhAujQ6SIDKlEeeb+956ysPu4U5vGJhuhiWNOBOui1RrvGLu2nanmFMHRT2t/8LIpaseAmY6SqXxB30dw5RUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5QwYTw/j4bGgt4Y0MD6Se116cG8hO2bnQOx/ER1aaM=;
 b=uhU8Xg7Qt1bq2aw0BbNupVdx3rWJTLW7tnWJVn1wFb/lN30rx2+rS5nqmxwgVsuWEtZnUPGRO1kqqyblSq4r8qYAJG2kY9RGCYwcJLGIXYK4n09rCJ9m4//1VTFjxFXh8NoyIH7kAaHZlgIeH7v2fiSA99P4mj1vAtVaMBkyqEleemooHCXqSj30xVVHuHwDhhTRabV6fZ2XjDV+vjfRIvXXs2q13yNQnjn5+2HiDpVhYK5zuO5A4KOgV8ZwHyDNVJxUe8QjJry87s79IqpdUYNUqa9KS9u7YTZaxzjuL42aBQ+8uBRGrPyNDDQbof7mAaZrOsdYjW2ZYKj9Y4IcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5QwYTw/j4bGgt4Y0MD6Se116cG8hO2bnQOx/ER1aaM=;
 b=k7EBvr2/4IKZdelfu5rpf/QlfyWoYELDIrBrG7/Qc+if6Kcyppq/D67JZ+PaXuCy4I4uW6rDt+Cnm3Yc/aI88k6x9FlkuqtpnlqszwowXGPoSutjWuoncqSgNxOMGSfiKJ3vmOCQJ9hxU8SQH5LtpHlW9HSiGJVKKRgruMIyv5xLDCOHhcbc5CuXAOo2oLI3AiMn9vOledzc4alq/iT3IGg5KjS1Rcbkt0d14G1o0vVps3dZjJ+jKrHXOseTy3MTuTAUFbUNDZItqGi7SNGl4OV5KFDACiovITYN2NY9JiRg9eJ9H09jABPIqOeNMNsYmmmEU+JZMY+IwDaxcD6jbA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 05/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v5 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcGP7dC7+WoEN69k6endDrwJ322g==
Date: Fri, 29 Aug 2025 16:06:22 +0000
Message-ID:
 <edf50a95d335000cea2748301882f1bbea88d676.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: 7e9347c9-ebfe-439e-05dc-08dde715ff9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?w59NCQ0maozUbOIA3eI7kHby2v8WVFRnxq8s+8jqB7c+KM+CDxsNd4lpQ7?=
 =?iso-8859-1?Q?XCREf/2VEIwJw2Uby6ltTG6yJqUn/+Y8HfnH1tzvlytoDZwIkkRhd26cZ2?=
 =?iso-8859-1?Q?I28QwEqNag5RiPrePbClvaLELJTJQ4D+zvnEOEIbI504MI4ONR1Y2CIMnY?=
 =?iso-8859-1?Q?mKaEsJlv0xAcWO7YarP5ZtA35/bP2uTFgVQX13HDt4EN1+MFgoDx1uhhpS?=
 =?iso-8859-1?Q?DeeshLlGo7U2bmYUdOsgAGAf4GDb85qwjHarLtcPAhr6Qyrp+HkwIhUa7a?=
 =?iso-8859-1?Q?pdZkt9fNME0xt3PeEteIDHjke7U3fnBa0uuwhzx2096UWogzQbeK6AIbnA?=
 =?iso-8859-1?Q?PJflgBvrFamePnrrMlN13SZo3drlz9ojrjmUMvMW5UH2Hu2MpcbYU5XwsJ?=
 =?iso-8859-1?Q?o9HhJwgJT642HWC5PIat3vbNgPqH7c2qq0gxKM/zKOjXtV/fc4Brg/jB7P?=
 =?iso-8859-1?Q?HrFchidzz6vmxnszFWPNXFK8CcN+7mWdF8s+tZZrhV3YsE7ci7XH2X98Sz?=
 =?iso-8859-1?Q?F3h41/LsfLoVkqa5oyRW6RcYxKmoxzwsZmCA4Q/FOpMbhqBklGY2q10ylT?=
 =?iso-8859-1?Q?zkuG/cvUqLFcxY2525MyLx66L1PEKtg7Q5eP+xp8u+cP0pd7SFSU5WrtqP?=
 =?iso-8859-1?Q?jIJSOjw5gwovkVTAuiZ6ESgAKW7J/d3VvDjo1NR00MX+nDPvC7aZY4HS3Y?=
 =?iso-8859-1?Q?c8mpeKmDh6uEr8SWc8sAmskwthiSaMXVFjiIMC0W8VNVUIsj0BRIFF7FNO?=
 =?iso-8859-1?Q?ECq6fJC7Sh5m6akwSO2NovLlHw/uSCf1uxH1wcG/vPKiuqtUHczsNM7HRd?=
 =?iso-8859-1?Q?36A+xrXPvWGZkRpIMndwL56uqjlp4EE8tCtXUyhHQAyvoyQ1noldq+e8FB?=
 =?iso-8859-1?Q?bV+vqXGbRIZTyt3YYpTs70TFu/gSvghCXRv91ZbjGujjB/M0XNorTjIxTl?=
 =?iso-8859-1?Q?lG3NRLfn65BLe4z/3/LHgsUBmpAJ0z8YzXT81st/t8trNHS0+mWajwkFO3?=
 =?iso-8859-1?Q?aDr0ZE0OBNlK1G6oTRS0MYQ74IUqYW88lGXkkFNbWXatGL9qSpcagGFEUN?=
 =?iso-8859-1?Q?KN1sr6Y18XSisFSzC88JSFyyFXx0pLlKuh14SVm7sz4+Mevis01TnEiqSM?=
 =?iso-8859-1?Q?NZaDcDIGMwOYyPywwi6DUR6OSVdgkcPWpZLrnv7qHghqgvOZajf+gho7jw?=
 =?iso-8859-1?Q?B+cnnWWKfVWDLbbkOiP7cNAbwQi/NnV/8IliMIhkEYniJ1hWzcQWF2qR7x?=
 =?iso-8859-1?Q?SA3lps4INYDVnaX7lHWhbD6iLxycHBOAl8TFEcFhXdKqmT0Npe/u80GI33?=
 =?iso-8859-1?Q?CyAszFbzvhiXvhxs3T28bXJfaT1TfYdu6O2ou7/XrwUgKSipXv5Lg+sNTm?=
 =?iso-8859-1?Q?amUXaLnu/9RdX30fEUi+mxFo+mJSDu98evAFIt9ymYoFHS13IOpP1Back4?=
 =?iso-8859-1?Q?Nt6xV4oJB7uhum7u6qhLJyNc/dcUIJDNivE1jwMfGOc+J9erYONnf84San?=
 =?iso-8859-1?Q?pxip4AOlAiKk+xAUdP/EXDsZOtxoRkq6Amv5bqgxJToA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kze2a6G5uzVx3XinnCEc4cP33xF0HSVHaiTW8YxvA+w4KX6lS03H7f4Bu6?=
 =?iso-8859-1?Q?W/bka77RmOnEHsh5YaYR/QE4vIQAFm7D3l6NmXH0mYHJYZwnDe5c4XDG1W?=
 =?iso-8859-1?Q?aIfFOl5ZMZivsCflzjT/5YVkUpWjJCi2cF8CvHNZUFhywwAFHAjeWuKr0V?=
 =?iso-8859-1?Q?iEAPNus3fWLZI31BMqCx8PDpv9eEhEhev5s9oxeLUtv+snyccs0lYMwaAN?=
 =?iso-8859-1?Q?EYsfxRx9n/bHKZ90ESZUvJClmCxMojJZL3aOgm8KQjjri0fujuk3EjE8j7?=
 =?iso-8859-1?Q?w/vmHf/QCuW3nkNlife0I0CZEG7gSiixUPbO3Y6d4NwAiomJDd2sr0O0CG?=
 =?iso-8859-1?Q?6O+toFmr9J5TzO5F+S7jZInc3DKmXi4O0Oe2D6yNONtWtzRUTV4Fn9+6aN?=
 =?iso-8859-1?Q?SuhIK2ZqA523YNXHGdlRBrz1U7l1iUoqR0GJDdoIsUSvMQhcR6aDUbxwhy?=
 =?iso-8859-1?Q?qURWE8su1Sbms5s3JD4bYUDukW3O1V3OFXoZKvrogcuJYziS38Sd0z8phQ?=
 =?iso-8859-1?Q?G/IoaRyYp4Zq7BXkIYF0xGWBVpbdlSE7GOfh/Xlfn6GEnNy0pp5e5mhapZ?=
 =?iso-8859-1?Q?7x4mQOQON/k/rLCvvAur+X3gReMRI5xlZyWUhxF8NK/Rg8csHDh7ElpheY?=
 =?iso-8859-1?Q?WaqzGxuRJEPz0IwrV5aCfqevYQ6Lly8H4Ozc0d9i+6YU2b+qGPOh08FjHb?=
 =?iso-8859-1?Q?B/eVM8Z3ON8WygMHAdJaaBDv0MRQv46/s4v3HGehnMmgCasgmZupFlEEs+?=
 =?iso-8859-1?Q?abzEKWy37I+wnTMQV03yPOPXKn0miSoYpVmVDfZLsRIgrGkdDC4e/nAh2N?=
 =?iso-8859-1?Q?gXvspjr3Qum/MWMbB1tp5lQCY2LAvFg8DTPUuucLztAJG4XJB9bAcEcXJr?=
 =?iso-8859-1?Q?ereFuhNs5uB45UkELMAeMWuZAeZsoVG1clWAjSToJ0UrjsP9FFK017vKr1?=
 =?iso-8859-1?Q?ckORjRtFUy20pyF/3nHcm72oFtjr+SBlMIa2w/w+EIDorpPYqmDu8+Rb/f?=
 =?iso-8859-1?Q?hGnw8TkjFfqkvgrfx2E8VJGklFrMtbnL9pFi4YiBlxiFUSXQ5x16SNScld?=
 =?iso-8859-1?Q?P/TDkCcTyZrSO8FwfpW7WAAOgb42ltC4+KGuUuwgLE3H3n4h14OxI6S8tc?=
 =?iso-8859-1?Q?UrLjbCaUHtaiDRWo1nK6fkOo2zXgEyxC+LgA1X+vDTmISpeKSLCdBxWmLi?=
 =?iso-8859-1?Q?+/5PRhIH1hbogLeATcfs9DHmYengNimwokPjcVYGXyvks/SmGiiZ9kpSa6?=
 =?iso-8859-1?Q?o4IXb4CkBzNgrMGchyzwPhYP4lbNAbx1dkRt3z67dCpuKUsSwS8GLLHbh+?=
 =?iso-8859-1?Q?E1AtN4EP8E0SRQmEzKkP3CeW/tNWN85H96vQdK7RsaQb1bj/e8PkzdPTzV?=
 =?iso-8859-1?Q?m0KqNkSwqdiLwuaqKQ1rdLehEoxkapdVMzGF6HwX/7bqm9T9BoeobadUZa?=
 =?iso-8859-1?Q?PrkOIUE25A6SYXrpKUtHaySJxyNyUJQazOKGkxjemQkTUJPvOdSCt0CY37?=
 =?iso-8859-1?Q?kbFw9daRyI6z3mjGNB4xxyDnc4yrYcS7y8b9McgQHE3NXJ0l8ycj8jKKmL?=
 =?iso-8859-1?Q?hihiztzB4eXrmIBlTUQ72i2X61kFx/lbFYIPoavewO/89jhACDHgKt88nH?=
 =?iso-8859-1?Q?Wwi/RNYqPP4xcehEidgd2Os+2kiTCA9AvgehljgQ8OI+Pax6g5Gsgo0tmY?=
 =?iso-8859-1?Q?0GU/stx5JxklOj9Rkq4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9347c9-ebfe-439e-05dc-08dde715ff9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:22.4478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NACDyN+sRmUUEdJFSjyFcy+nfyaw79SrytOM9EK7BALuB/7Er55DDEiuSOWJ69iZfcQDc1uGpEw5oUhDcjd5l0Uh3dbkixPDVI/VUYqB/fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

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

---
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
 xen/arch/arm/include/asm/gic.h         | 22 +++++++
 xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 29b7f68cba..4a7ce12f26 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, u32 offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        uint32_t irq_index =3D ESPI_INTID2IDX(irqd->irq);
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
index 3fcee42675..1e747dcd99 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,8 +306,26 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return (irq >=3D ESPI_BASE_INTID &&
+            irq < ESPI_IDX2INTID(gic_number_espis()));
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
+    if ( gic_is_valid_espi(irq) )
+        return true;
+
     return irq < gic_number_lines();
 }
=20
@@ -325,6 +343,10 @@ struct gic_info {
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

