Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5BBAC27A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 11:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134106.1472116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WDx-0001Dl-C7; Tue, 30 Sep 2025 09:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134106.1472116; Tue, 30 Sep 2025 09:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WDx-0001C2-92; Tue, 30 Sep 2025 09:00:41 +0000
Received: by outflank-mailman (input) for mailman id 1134106;
 Tue, 30 Sep 2025 09:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqVX=4J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1v3WDw-0001Bu-1p
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 09:00:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeacc2c9-9ddb-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 11:00:38 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GVXPR03MB8355.eurprd03.prod.outlook.com (2603:10a6:150:6b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Tue, 30 Sep
 2025 09:00:34 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%5]) with mapi id 15.20.9160.011; Tue, 30 Sep 2025
 09:00:33 +0000
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
X-Inumbo-ID: eeacc2c9-9ddb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nicP4ObvVUz/7CHq+HfD7Xe145JxKqFU9h6Xkpi2/ktDuyg+OdnNpzp4UkuIUb1MOH0bRst0S8B/LAnCtT6U0LqWu3hTqfwn4xzMDvUGTQmaAf2Zxyiu1suVtHMx/Nx2GbmIGLfEqxxv6okmoI/Hge3M1ogkz0wh/m/PlXZya1c2T/GP5VW07d5eBqUT1GEobSsymYcXAbWrW9vRaqyedhgrqVNOWLgs9peJ+C4PXB/8QpXoQFwp5ipn1LgnPXqVkQktoxP5+XdH/QRuPWKiNEBMi5ojd32Vqwnatn5VZ7ZVjEFfljWk2ReAd+ThWHrsc6Mx8zF1CigfDMo1om06ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFDzkKqY89WZ9WlQEsOA8Ysu8vAKoVMEirhGZphyT70=;
 b=QvitvyUPk7QC5mfcgzEDQKgWai7lYE4Gva5hiKI3Pus1lyaUOBX9qRov1zLRSTqlMp4Gq/yvsb2qfg4RcYNezaLvTxvSqTBXXTEqzmeYrX0jRmRXNj1aS8m3osc/2Yc81WY9MQi/29g6uDWC/GA3yoQ8jvPyfAGejh9315faI92y3GLWyMPCFny69wQB61R6hUVQNdWgltOfxi800fcpxD7bzn+0HPFb3pTM2oIB8JO1VJbXkH3bz77Kim+mD+J9IsGNA8z0r3eOo8UK7QmEMLSpH+m6FfXOq1giBb2+qX6z7dSW2YzFL4XuivkTwwFgwmaQODB/aGzNqHg81jzktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFDzkKqY89WZ9WlQEsOA8Ysu8vAKoVMEirhGZphyT70=;
 b=vKQRlfP4cRo0M4oOsBncPc2NddzVqVxyT+1egqH46SY5PctEU2YXZ+leCKAi8/cuZDn1a/6JkZOUspa8OvgoZKsqLyz9j6bORJCQ6MfQc89lNasrjzYMb2rMnCTTX4QW5YnGWS978naXoFWRLGftxLrrlWdANNb7uvcRe9iuBYq4gpgctkpL9E1iEaAXcsDmDWUd6qLKmsrG5BGbsrzjRO0DMy0uXMITfPBChSF1AyD6wbivYuiYN5mSdH5V0ZJLxKk8yO+3N4jZL9LTNWcF5aceI3jhdMCcl+o6VmMCVpUY2/yb2gVxunQho25W0U1X4TmqTTPi17BIzajATWkCDQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Topic: [PATCH] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Index: AQHcMeiurviqZe6kVka5vaTVVpQMKQ==
Date: Tue, 30 Sep 2025 09:00:33 +0000
Message-ID:
 <70927412079d26973fda7025b99c566e03217aa7.1759222404.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GVXPR03MB8355:EE_
x-ms-office365-filtering-correlation-id: 49b992f3-b3ac-4ae0-5698-08ddffffd099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UiejbuSgViRFuMUsrX2h9txIujTS5nSt5aMkrcDjMYhBxiJon7S2Ro5BVN?=
 =?iso-8859-1?Q?RxTRjlTwTFDw5fx2qPpv7feXHreZiNlND3/zRliXrPN25iCTizkb96EI9p?=
 =?iso-8859-1?Q?CTqvsDzhI7TjmFiwRGg+getulvMm25JCzV9S5trUjb9q5duycf891NGgOv?=
 =?iso-8859-1?Q?8ZUvevUJt74enkGe6AMCi/68AhtUvwK9O4N65364bedAgsEb+CgWhz3iEE?=
 =?iso-8859-1?Q?DYBhOkztShDnczYArxylU31sJn5IW32JXSjsJVX7OnXSJNRTry5mXhDIqr?=
 =?iso-8859-1?Q?y55Hh7P5q103M9LNKO4OEM3IXDXDZ20XPseJfT36MLp8lMyM015V4SAfuK?=
 =?iso-8859-1?Q?wIdHxBnmongQYaEpzA9yHRbOv0tzu09z9iQB9ulysghh5oO/xum2jlPzWt?=
 =?iso-8859-1?Q?OJq4fkCp/9w895Ece6843qThsXeeOf8yIYWdvksSR/O/iPo3yIoR+RwuQD?=
 =?iso-8859-1?Q?eESkpTzQznizVR4HF+pgvWUWhYBiM5kzYwVPNMA1OJivPSJ3V8g9m66JqS?=
 =?iso-8859-1?Q?Scc4s+B5Ay9TyoHs0BnN7KOGbJt39zUznNIXCUA3aR+utAGNanQFkYFxTZ?=
 =?iso-8859-1?Q?4QNHQ5a7v/9gjDVjKbFVzyDImad4XfDhwMJK62ZOGFmMWNfzlmi+V3ZwEo?=
 =?iso-8859-1?Q?TiFEM3hPrM7+4wLZGfzFLpEZtpasUdh6U60nL5k0S16bFxg6bwV8iBrntG?=
 =?iso-8859-1?Q?SPL/cvmsyPXFnvVPtmTvchMPD6E9bEF9wf3jSVD01J3WFIHX/wwkS7ZsSX?=
 =?iso-8859-1?Q?MjQ01kf0UQY7aPMu+k8OYL8D+slW2GWN+TEIzOBSUVhwOaa9kSWy4VCXlQ?=
 =?iso-8859-1?Q?033i2C/bIAtHkjaSA+jQ7WnHsd4nSKbJnUQPkRStVi022IqqbFmHoFAfbk?=
 =?iso-8859-1?Q?SRO1ZDFV9eCdX9BKGwhIO8GXB+3gXC/eijXp2/3tzGqXWeriwDtjXS+OhN?=
 =?iso-8859-1?Q?aFEn85cNr5q2Fdp47bFXDR9inQOSKLeY8QMUQA33A93EmqrlLL4ugtPsEd?=
 =?iso-8859-1?Q?iKDjiFdzwK45PhcRxxgSO52Jbli4I8rB05vEkn4nAC/j/n6wiyxXH8muRy?=
 =?iso-8859-1?Q?0eFhv4KxxI7BjkLk9rwmpb65tn2yWunNCP1iTrqjp60hLtD+2lI7vk/9K6?=
 =?iso-8859-1?Q?/vi9SsvYNIdhnfqLiIs6qLLHrC6ALAv0w4lV4xPEospHUhneMU6SNKjpfH?=
 =?iso-8859-1?Q?mMjm7rr9mBtD/sGVu4qDj7IT+guvmwdM9Qrl8mHvXEpmUU5N+EQHY+S/6f?=
 =?iso-8859-1?Q?Y2EPj3V6itqc/X3k5gH8AOz3rofov2npRRkjUWI8ekwrhADdimwoFqqSmx?=
 =?iso-8859-1?Q?EJ7PWn95VM5N9L5+cVCGj1P3pGs6NFJ33KXGv4ZMEDhs3QflwV+9qI6Q7s?=
 =?iso-8859-1?Q?9Z2MpDrDEEwm4eeN4HIPHeu63xq0w+nP7SMJ4iN6eVzRvxWPFkehHhx5pk?=
 =?iso-8859-1?Q?ocKWGdizye3782lz9YTFfUNjK/dSV1PwbDXrechh3F1Vnyf11XZvmImgJ/?=
 =?iso-8859-1?Q?/ANyehHI7HcGj8veBNwP3iiNgHY4gl6YeSC5zO2ko0tu+7tNEjZe2GpMJ1?=
 =?iso-8859-1?Q?NKCOenRflXMWWpjflU9IG10xOzoa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qH4B+q9bORXJPfcqiAjsRiwH/xQ552HMeDMk2lpAkd9pu4G2R5SEsnCg9B?=
 =?iso-8859-1?Q?+pyx3regW9LimFNPQq31MlzOc56508os75r9XwgSCXqNXLXQ/94eshwtKE?=
 =?iso-8859-1?Q?/ODPRsajAzc4F1oJWM9GPj9YjwwwzSAYjvy3F7JiRHFNqa08J6m/9z3Eky?=
 =?iso-8859-1?Q?FP/YoNAMG/04XU28EVKrpGU1GOVYMl2u5BaNIwBQ5m4Iv443ydVP49tgox?=
 =?iso-8859-1?Q?bT4ypH+qWVzYQNTTxf8Y+lB4Eq5sKicQ08XssOt0yBvQSFwRRwXIJXA7wf?=
 =?iso-8859-1?Q?hiPpeyF9xjPNkYfvDfpEHGDb1vUPUoogdWMnMTKmg2u6IkJ0giiG202Y63?=
 =?iso-8859-1?Q?Nl/ox4EPz+tqImaGaFf+ISkdTh9xOkAQ/AH4oBOeXXE60uMxWnI7h4Tb0u?=
 =?iso-8859-1?Q?UFB02nXetVBh8s6iOWDF1l4FPFHFY/zkjyOzYFVEr02UuUwrPB6btDJ/uo?=
 =?iso-8859-1?Q?YBSBkywf9fXTILy60aU6L3KQjt0MbBHjF/9yiB6nJ+hVLZNBRDoBZ71oBp?=
 =?iso-8859-1?Q?XdtdkV7NoAfGmoaWAy8i1O35FEAT2NK1XjtquveRl0GfYbaOHHx0P7F+Eu?=
 =?iso-8859-1?Q?qVdDYSx6+/h8Axa7srofG6r13gd+S99vpRyndLUoXFoR/ceNkeEr17ypS6?=
 =?iso-8859-1?Q?6lCssLKcdG2ylbDEHhcPjAzlcfX2Hq7MGMR6SyL2FR2CRftD/8hVuKZGdv?=
 =?iso-8859-1?Q?JD/q0u8Qxti0Zp+1QkyfSAwmEEGRtdVZ0haeJXRNnJ4ihTmPe7EAEAM3Uk?=
 =?iso-8859-1?Q?YZvF0KfmLGLryQs4L38c8p5CdY9QpqJGOFaaPj6avXPNpG/oE1g5Rg4qB0?=
 =?iso-8859-1?Q?6QzJNsR6NuU1ceBLDJMseQV1cylNjw7qRYYg6V5/Ygx4JOJp69aT9Uf3bZ?=
 =?iso-8859-1?Q?3dQH4EJnBrdAPFBxr62eg3jwp69aSPT0LQyCegrywss1kZhySnSZKax33c?=
 =?iso-8859-1?Q?+fF+LIWJhxadzIGmdzePDAj/mCgHFrkv9WHCoaZnE7nitgUg/+65dJey2X?=
 =?iso-8859-1?Q?4P8O0Y0WGeCtR8UFohWbBGYRR2TA7lfXXq6NJzhSdI1JYBHEM4vv7ZLGEk?=
 =?iso-8859-1?Q?n+xV0UErxNKPPYVnbObUk8LE+5nlzfOFi7H9yKLZ6OgAQGuOUmJ6K3WlgK?=
 =?iso-8859-1?Q?Fm5rDa7TQgbANOdr/C5APIyLklQXQ046drK6w2Eh3gsFSQmx/jezPLf9Tc?=
 =?iso-8859-1?Q?p+2ywd4WMqaIAw7f1pnNmzIfiTeUboG5UAhb0+C1IjqdzPsn2pDODCK4nF?=
 =?iso-8859-1?Q?b4T6VzT/j5gH1w/+2wiet4AiFKefBmt6yFHmDva76FhYzQ0sIydcg+AkS/?=
 =?iso-8859-1?Q?k0cb1S4MzNca8IjtPTTpIBDfjuTCJJY0bAmp5NPEtxKvicycJzHi50q0Hv?=
 =?iso-8859-1?Q?CPY6ywfpMYFWsJDlAOcIIvir1Bo4JMPUY0SwcewCfrBvg5Mhq1GoXfW+2H?=
 =?iso-8859-1?Q?OKNiLFcPSwNS/fnWgGH/CgpqmSd4xnH3wrunloGTMmSNCooL/4cXLgSCk8?=
 =?iso-8859-1?Q?xDd3AjpzaytHskCA+04qJPes1QgnmDuxi7R/D/j9EpEHutNURMRBWTm7KX?=
 =?iso-8859-1?Q?pTN+9Y5lfU4fWpe6DSqy8lfh2RmRZslw0KFB1rU9NJpNg31GfPiMEQ953/?=
 =?iso-8859-1?Q?gpqzWKlWSRYBbr+2kAhnTSXQ9iwyKHEqi8Ersz0Ac6oSpETx9EH8D7sS1a?=
 =?iso-8859-1?Q?Kux7JbgZwO4nz5tbh1g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b992f3-b3ac-4ae0-5698-08ddffffd099
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 09:00:33.7617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RN0f5z+CWkk8pFENtQH6Vo0EsF2OJsKv1zIuH/yZESK8b5tUAfmaTKR2uQwiIB6tzgElUDEJaHI3T+3ERQd/e0XAbK86ksGs6Mb9229YOgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8355

Since the firmware may initialize eSPIs before Xen, and without
CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
during boot. In such cases, once the GIC is re-enabled in Xen,
interrupts may be received that cannot be handled.

To ensure proper operation on hardware with eSPI feature, even when the eSP=
I
config is disabled, gicv3_dist_espi_common_init() should be invoked
regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will not
affect hardware without eSPI support, as the function checks if the
hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
range is supported. If the hardware does not support eSPI, the function
will not perform any actions.

There are no functional changes for setups where CONFIG_GICV3_ESPI=3Dy.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Suggested-by: Julien Grall <jgrall@amazon.com>

---
This is a follow-up patch related to the discussion:
https://lore.kernel.org/xen-devel/820704d0-4047-4f02-a058-01daba2765f1@xen.=
org/

Since the idea for the patch was proposed by Julien, I added
Suggested-by, if Julien does not mind.
---
 xen/arch/arm/gic-v3.c                  | 32 ++++++++++++++------------
 xen/arch/arm/include/asm/gic_v3_defs.h |  2 --
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16..19457bff76 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -699,17 +699,32 @@ unsigned int gic_number_espis(void)
     return gic_hw_ops->info->nr_espi;
 }
=20
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_espi_common_init(uint32_t type)
 {
     unsigned int espi_nr, i;
=20
     espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+#ifdef CONFIG_GICV3_ESPI
     gicv3_info.nr_espi =3D espi_nr;
+#endif
     /* The GIC HW doesn't support eSPI, so we can leave from here */
-    if ( gicv3_info.nr_espi =3D=3D 0 )
+    if ( espi_nr =3D=3D 0 )
         return;
=20
-    printk("GICv3: %u eSPI lines\n", gicv3_info.nr_espi);
+    if ( IS_ENABLED(CONFIG_GICV3_ESPI) )
+        printk("GICv3: %u eSPI lines\n", espi_nr);
=20
     /* The configuration for eSPIs is similar to that for regular SPIs */
     for ( i =3D 0; i < espi_nr; i +=3D 16 )
@@ -729,19 +744,6 @@ static void __init gicv3_dist_espi_common_init(uint32_=
t type)
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
 }
=20
-static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
-{
-    unsigned int i;
-
-    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
-        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
-}
-#else
-static void __init gicv3_dist_espi_common_init(uint32_t type) { }
-
-static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
-#endif
-
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index c373b94d19..4b90627df6 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -63,7 +63,6 @@
 #define GICD_IROUTERnE               (0x8000)
 #define GICD_IROUTERnEN              (0x9FFC)
=20
-#ifdef CONFIG_GICV3_ESPI
 #define GICD_TYPER_ESPI_SHIFT        8
 #define GICD_TYPER_ESPI_RANGE_SHIFT  27
 #define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
@@ -73,7 +72,6 @@
 #define GICD_TYPER_ESPIS_NUM(typer)    \
         (((typer) & GICD_TYPER_ESPI) ? \
         GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
-#endif
=20
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
--=20
2.34.1

