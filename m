Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D1C16460
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 18:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152288.1482815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDnlR-00024K-75; Tue, 28 Oct 2025 17:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152288.1482815; Tue, 28 Oct 2025 17:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDnlR-00021c-3f; Tue, 28 Oct 2025 17:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1152288;
 Tue, 28 Oct 2025 17:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLgo=5F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vDnlP-00021W-DW
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 17:45:43 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e99ede7a-b425-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 18:45:41 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 DBBPR03MB10393.eurprd03.prod.outlook.com (2603:10a6:10:535::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 17:45:34 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 17:45:34 +0000
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
X-Inumbo-ID: e99ede7a-b425-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX6urfmFGCS1p6jz6MB79rWW90cVarvzr0BBc+wCYlhkrujUO413t5qeQthabcnpFzigqbtyJAHe/F1wr77VuYSNoFY/z8z3sW3MAyDn0bku3UVE188Ngzhkf2zv3RhaaeaM+Abej8SE4rzUNtnhzX7528r709Z8yc7DWBtjRVlGCqoytl03FAA9OIVTigWjoxVs6vOBkI9UO4SFeePK2gzPNK6Crfcd1DrPYhk304oiD6X13H2xfumlZ2GaQf2vh687jJTCzygAx2imu8iF8UiGLABW+D+y29ANAauiYtMhuA5117vEVBRB5ShydmeB36r6Ystc03zA5h10KP2mbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCM7+BDwMCQjjBuvX0PQk2J+goZfyq9dQeQ+3u5GIh4=;
 b=QIc7meDs0S9vG9eKm0aE3JvOOHWi7KWDGyCyQeU9L5QyJtRXRQEcLniQ4/Bb6K9u3h4OVezLT3OYuMBc38yfkJ6eR7SWYwnwI1gp4T5s9vKOCTJewoV2+twUE/mccMSBkETCDKOTPIikKhlp18i44Btgyp0+CyahQpnx6fDl3AMP8gZrBZ5VH8q2PUhFwc+UTwimy/h6nHhUODFx2WNJvId+XKK/GYod1a+7R7W0HC+5z+7KA9F6CsQkEeh1vGg2dtoLzhNWPRQq4ZrS1GlTrlnL6FDF4sgGK2AWzF/XqS3aygwAkEUpRKpeX8lwEb+1Uc0wXUMCj9ttxZR6NHkt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCM7+BDwMCQjjBuvX0PQk2J+goZfyq9dQeQ+3u5GIh4=;
 b=tSTxthkckUi/YrG2SVvECLIT+vO28uA25uwXSjeOYPI8ums6qJpajNe7RhCqurPR6feQq1yuH86crN1n48NbjsM6relScDjDRBnXKF+NkCgxCezGjeoUO7xbo/gAvNwC5amQQC2fmDDbMuYJ416kZVv1i7mKSbVtR8jibixY2tRfDzEyZWiItTGGnPIprKUNARHIHzL26urFFuAKES2D2wZ26VJKTp5Vs0MyDbbDnGe2dWPsb/xSvgsswI/kDBmKAeL7wwSMxAA7JbMNvDNWTG6/AVXMXP+KmssBRSmoMJeZJAgxw5TjopuVxUk0Dp7lPceWRNc9VQ/nB0Wau0VzGQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] misra: avoid unsafe cast of __init_begin
Thread-Topic: [PATCH] misra: avoid unsafe cast of __init_begin
Thread-Index: AQHcSDKpkOVNAuGy6k6B2JYhgXsvqQ==
Date: Tue, 28 Oct 2025 17:45:34 +0000
Message-ID:
 <680a7418c445381d68fc95f0e3cd03f574fdda86.1761672602.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|DBBPR03MB10393:EE_
x-ms-office365-filtering-correlation-id: bef7a631-cdf4-4840-f97a-08de1649cc25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?G6I286iLwfXdwSwj3rGWWfagDo59gGQH+/3opC5cBqoHmH6SduUkX9Qo41?=
 =?iso-8859-1?Q?yWQPLCDv4SBAuK9RxbgCBVwCxgqpd6E/uE42y+81YFqim9Cnalk9Bjw03C?=
 =?iso-8859-1?Q?Bd6+3XV+AJMMjr3TtKDcWc2m9OyudhfB9kIib/DUWG4q3shbCvkd0UBGOj?=
 =?iso-8859-1?Q?c4yXl7Ihi5UbHFAo1HSGFI56zOf0hF0bpyAez0JngOfD4UHtmy9j5riOpe?=
 =?iso-8859-1?Q?ZEWTAy2o0azIJ6jqiGtIOerO7uXrTV7z4AV7m8X2+UMlgScuVAB11kSmDN?=
 =?iso-8859-1?Q?Z0IU01+rtXEg1X1CXyUXPAiOlB8uXUpweKj0bSE5n5eXB9KmC2UndDbGUY?=
 =?iso-8859-1?Q?wfhXzU+SuEJmcyosByepjo5H+Q9ggV23oPAaeNQqkfGwc0ya1Qtr2ZemAG?=
 =?iso-8859-1?Q?0/UVsREQVwHwJ585/g2e3L8jD1taMLOVP7QAn2vAiSq0stO44fYqQ6UKsY?=
 =?iso-8859-1?Q?Rpi01DRXFJ1PqjajzIOixPIcNSfg49699K6EQaU6CzWx2r3IjNa9ccAG0t?=
 =?iso-8859-1?Q?fJ1083wkbrVMsN8fNxd6ZFktrXUP3m8+eYWkw1qhMxsE5YMRyg+Yaqz4nO?=
 =?iso-8859-1?Q?irB9HWNj1qFUbvfOwG0GbB1miMMU/pF7BCLJ0uBLmI15/O6w+YGSRGXrCc?=
 =?iso-8859-1?Q?FxpigCtQ+qFALk6xOazNbdhLlNMzshfJUrpnv+styeiPqZH3dKnioteJH2?=
 =?iso-8859-1?Q?RuVIUfBuIU92b02c6yrFW0JsA1bHmJYezaL2D+eeXRTZT/VcJPp10UjP7I?=
 =?iso-8859-1?Q?9UQf2kOJuW2l43IdhNTSwQATQcND1UBEFnOjVzwR/UMx+3MVtUA0qgvN54?=
 =?iso-8859-1?Q?rEaeAW+gr85hn7uXcZJs3zDrSvowqXFCnT097dqo0ByyjBrqh/BByZbJI9?=
 =?iso-8859-1?Q?36LWL8u8h4k38kpXhRfIN3zjEgXiz9p8rViA9UxgxhCh8dq4U8+PAJ2TQc?=
 =?iso-8859-1?Q?OVXz4mULnVjU/Ul+uEHc4JYWQZhpQ4AgJTMOcipoHop/0wojoelXIBhMx3?=
 =?iso-8859-1?Q?yVk/EeDi3NyOxplz47WHJVFcvLLsGttWzrpmRGxAqK5zYWLvBwtjd+NmTT?=
 =?iso-8859-1?Q?rQNT0t/NWXThWnxZULldcVJ3LVlbtvLrsT6ufizFMCg9S+XVIBNvTRgSoU?=
 =?iso-8859-1?Q?GiO8yi4z9pCC1qI9/zeiMLjgsA6PUjTaHqC0NxcBDcKv+tk4Ar40X/5uRw?=
 =?iso-8859-1?Q?JetyItVwVOtzNuypUMNJm9bDA14anEPk+T3iJ58IzZLTAx+f3GIuTNBnQM?=
 =?iso-8859-1?Q?Z52NJ/2pmmGlF1LEbgVEd+jhdmwg7sNEZ2MzhU7nizGaWRTuK9BphBC3+l?=
 =?iso-8859-1?Q?Az5Qp9TpqBLnDzHVL6Oh0Yf2EejvNHUKLY8EXSdTMprcPpEaFm+IuHmSDO?=
 =?iso-8859-1?Q?d9bFubHecZgKf+5W/UOEA+40jN6wX9dRjzSVcXuBevR5GYj/YMu+6sjw6P?=
 =?iso-8859-1?Q?eG5SQG62OoswfT2a3dsqcKYpP3SYHe1227CYDmrl9wtBT2iCYCm8GXD092?=
 =?iso-8859-1?Q?ebCaFf+lf9Qcgi7k71/IiyaSWZjqPz0N8Z+6glu+I5roqssMzD369l0TfK?=
 =?iso-8859-1?Q?g9w7f/TQKUIYkmsYd3ByDKD72w9/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?X4i5rYRGBtO/pfdeg3abE5IY0wDv26h6819sG+EP+D3Zo4tHGAXtdmp5cE?=
 =?iso-8859-1?Q?ALSqobKP4nkcLZ9RjNhTPWaSwbCyINBtkkG/U0bAyPwDiDysKJW0kPmIWI?=
 =?iso-8859-1?Q?jfqijiBSUlmmpk8ywF19j3ICPmxEWFRtXQqdUtC4mPQ2tvbz9ng8lOtMrT?=
 =?iso-8859-1?Q?Y9TyvREHuBAEdMWG/LVZThOIJN7WsOd3wHpnoh8Ns5xd0vScKqmqAGMNpj?=
 =?iso-8859-1?Q?bhDeitv4Kz60ZYsuKvjy9KT7fxjeRq6dvlgw6woCTqtSM7UdhMM3H08xLY?=
 =?iso-8859-1?Q?gfr43sn88sfYF+kBFTU1bnz1atuW3U3/jLUCOmREZcSq0zjYyEVSnkGenY?=
 =?iso-8859-1?Q?vHxUA+/7b8LhA0u8Lw/2J2GDGaYnJyTRuKonAMajxaYOy1HD4Qi/g6vWe4?=
 =?iso-8859-1?Q?3oZR0+T4SrD+PnH9NWvTKNXOfmoMI88VJu7bLKLI5I3KZFG4802oy31e+5?=
 =?iso-8859-1?Q?5EBvm7ZBa9Hl9vRvOUABUFvSaVn1XELmjjmf9CtMvvwyv4nqaWt94CI2aO?=
 =?iso-8859-1?Q?SyP4/BGivSFAdF8u4QRXQk9RCxS9l+vqEHdsVoRycz1wFXZ8A8k87VtT3n?=
 =?iso-8859-1?Q?QWtVkuDJUbHN5cfi4dDA2LS8lPh583F0foYThxY3X4hw8xDeXGcjLpiWzi?=
 =?iso-8859-1?Q?N7McixldRAA35j+z6iCEupar4g73ZfzyIe/bR8ovpIRUVHyjLFw7jlMR/C?=
 =?iso-8859-1?Q?1YG0YFw4ehQ/EzdX4BWPKWVbQvNE30ECe7Q2CDD7cc2YSnBdRp8tN/w9pQ?=
 =?iso-8859-1?Q?EPQsBqG9EWDeH+jHnTDrOojFvqn8qB0GhqWuNjT09QVt8yU8j2oFKc1jLy?=
 =?iso-8859-1?Q?nTgBNiVagNaiqFhxgXixkEvmRfYjK37RONGZ/ArISNU/TlpkOCe5IKYxUa?=
 =?iso-8859-1?Q?Dxnbfo4AbOMOHjSwEJn6v7V5HyCYW1ZrYGrQ+cv27lw7rVI+7VMZZsPXaB?=
 =?iso-8859-1?Q?JgauiOm1qq6eZkedokx0r22rYo2t3jBU77bU19QZ2+gbfYX4xYxv/0sAyZ?=
 =?iso-8859-1?Q?ofL8m4HpDqpOn6nWyyehoU0/RTvHHX16EfgsOPerkJK54bEzvLJB6WUHRb?=
 =?iso-8859-1?Q?TJNxkLjudE289vH/71AtJ4RPm2/xRoUx/AUgMK+y2BNkLvwkmw2hGgQfIP?=
 =?iso-8859-1?Q?lyTILrHROtJmKe4JT48t0ujRR1gu7bj/b/lRGT/cqnnWECg4IkElyYnIRN?=
 =?iso-8859-1?Q?iOyzdCbJnPv5Lin5nIS0EdD+6/Hu58UQGf9bOfpKqGSLDUO3/0htm2Lkkr?=
 =?iso-8859-1?Q?jRxFY/XseSzOEgaJwrcpsoMYOz9YVjBVWsdI7MRVN8zmV5FU0qdyRPDNvF?=
 =?iso-8859-1?Q?jzRNpxTKODQ9H+Vw+5R6ky+hNTJRQooH8iSVV/XgcvFitLBeBW+baRAAJD?=
 =?iso-8859-1?Q?JaqEKEBV6zWXo/02+upy7Sj80XABVOGO7yjahXpFZs65RALqRK4uIKomYo?=
 =?iso-8859-1?Q?jpVNox01JxP33cZALvR7T/YpDtbDvFuynyL9gqg+Heo86JNx4diYa+cBNh?=
 =?iso-8859-1?Q?fWSMOBedG6eFXE0XMsogaycydJ3dlRabZjZJRQyXNwks7ULVU8Kse6CNc0?=
 =?iso-8859-1?Q?w2mLhuFRlQ2pk04Sr4DnNk/Cxda4BJd08zKusxSb3pp1Ltm7yxURoL349K?=
 =?iso-8859-1?Q?uXO9O7FF3Zzo5wt8CRUwrGXIV+tLWnZwR4+mAoYlTYQiwiKyxKsMeY3A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef7a631-cdf4-4840-f97a-08de1649cc25
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 17:45:34.5453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmKvNnLcxAA7cVca4yqqGOcvk0SR/0cta8Vykcmcw9BFGkTZV+HTy1y8UMmZw1Ex2Qm9EH8FR5fx7EGtTGv1tzNpTyY/FdtfgLP0ipeSOO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10393

MISRA Rule 11.3 prohibits casting between pointers to different object
types (except for char types). The violation  with '__init_begin' in
the original code was that it was being cast directly to a 'uint32_t *'
pointer.

To resolve this, replace the direct cast of '__init_begin' to 'uint32_t *'
with a cast to 'uint8_t *', and use 'memcpy()' to write the instruction
value. Using 'memcpy()' avoids undefined behavior related to alignment
and type-punning, and is guaranteed to be safe by the C standard.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Second possible solution (I hope) is using SAF comment.
The '__init_begin' is defined in linker script and has proper alignment,
so it's safe to cast it to 'uint32_t *' pointer type.

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2125897167
---
 xen/arch/arm/mmu/setup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index eb8ed19ca1..00c4c8832d 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -481,7 +481,7 @@ void free_init_memory(void)
     unsigned long len =3D __init_end - __init_begin;
     uint32_t insn;
     unsigned int i, nr =3D len / sizeof(insn);
-    uint32_t *p;
+    uint8_t *p;
     int rc;
=20
     rc =3D modify_xen_mappings((unsigned long)__init_begin,
@@ -501,9 +501,11 @@ void free_init_memory(void)
 #else
     insn =3D AARCH64_BREAK_FAULT;
 #endif
-    p =3D (uint32_t *)__init_begin;
     for ( i =3D 0; i < nr; i++ )
-        *(p + i) =3D insn;
+    {
+        p =3D (uint8_t *)__init_begin + i * sizeof(insn);
+        memcpy(p, &insn, sizeof(insn));
+    }
=20
     rc =3D destroy_xen_mappings((unsigned long)__init_begin,
                               (unsigned long)__init_end);
--=20
2.43.0

