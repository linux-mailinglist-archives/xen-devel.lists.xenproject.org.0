Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006AB5967E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 14:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124649.1466913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyV3p-0001od-BW; Tue, 16 Sep 2025 12:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124649.1466913; Tue, 16 Sep 2025 12:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyV3p-0001n9-7T; Tue, 16 Sep 2025 12:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1124649;
 Tue, 16 Sep 2025 12:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29h8=33=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uyV3n-0001n2-T8
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 12:45:28 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04354fd1-92fb-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 14:45:25 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM0PR03MB6163.eurprd03.prod.outlook.com (2603:10a6:20b:151::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:45:23 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 12:45:22 +0000
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
X-Inumbo-ID: 04354fd1-92fb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ+LhB7yoHFCBWDrO2GttJbrg7hLB45xz2as+yjLTnk6OpjHb3cDg9W73KGe6rWJ2kfNVBW2Bw7xyEXWlrsula/OBSRlb3cP13FL09QWZStAmeJJIjgtiwxJSMvZ5lcyjQdlO6HiFaJrkFueE7ggxwEVVUmJo0AO+w1BK0bE12JuY9GMkeBhtP7C4OCKGSccU3UJjO6VXMYNEREFxQ2gvpTWpY7P9orS3yikVJxxe8NXwfUv+7nXhN+lBemCiT1WhWbziSI2nYELaGEhuYynNUNRiKVPDQmBommTqCJFvdN+56l0UEeMXs1CGreQeKVAmxjjQit6h5werlKcmPdT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6XoUttgMRb6pOjMwWhbuAvhXm2rApd18bfiIb1FoJA=;
 b=OaVc0jI0LmwDZNVrVRWJFN2q5hH09jeIxE05AgraRGXGTdwCScU+xJ6eSSExBFN/oPUI2Gi18oJ9op0a/01bL9vCA9/XHmQsjga9410Aiq1/XjnlNXe3r7YGGHyIdYgTD+2ltjFK5WBJjNO+lFAXYVVTCyGvcnngQwAJ5e60Q6HO1fQ0qtUx2G7lXrVGyIVYRlUKWJMzTy3G2ZcBrHLsyOt7m7EV1Tkc8DqsY5hkeEF2CCIVeQQLf1862B9nQKObdJ6htaaAr5cBQ8DUEQsCV7TNsTfDN3SpOhqYGkcLwYyCIAJbtqaT0/IrU4rnSXp+l5+E2W7rPGzbfGHQsIzt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6XoUttgMRb6pOjMwWhbuAvhXm2rApd18bfiIb1FoJA=;
 b=jZQXhvY///RvPJatItir2TkMbYi+9wz4FUfxOMW2D+/+iussgvyf0t1f03fjhpXGri/2EuKdJOHx3C1MfT660evTl8P8sk2wL/D45imelP0z8CcxVYK3qJ0N7W+h8AN5uRsBAHfNIepIuax5awq10+9GvnPIFzkO3c3ztfbgbAO/P2wFub41eAvd8twtl7Df2IH4L2VrY7tytIYVRBFY7c/EhraRPP3wE9g0kUkHtjo1SaDh8gEwCBurrRKGTiMwQwRV3jzZrcQq1skYVog39mKG7ZDdHfySuzywgYfZWSkVOSUBflubp6TCGVOJ5PTJ+lKUKfkfkcGlMo42Y54iSQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcJwfEWjVU7vF+102YDgRq9OEY7w==
Date: Tue, 16 Sep 2025 12:45:22 +0000
Message-ID:
 <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM0PR03MB6163:EE_
x-ms-office365-filtering-correlation-id: 742b2fd4-650f-49a0-ddb9-08ddf51ee6dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|42112799006|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YAGb7eCK3dfVW3eClyiSEJkdHYhYRI8gdgO3pUo06ELCxb8At42UjcKny1?=
 =?iso-8859-1?Q?vDFWvD4THtEd495lJNtAcMSWh3C+sRAmgiJQlCMAxmLQRZNavXEKyH6CX1?=
 =?iso-8859-1?Q?XjYoozwYh6u6AsCWYKzT4lRRJTx7ibj7PTK45ajcLSWw+X5nLj9DkOiELz?=
 =?iso-8859-1?Q?OheLsV3GBJwX3F1aLAsasL3Gp7vjHyHdQcex3ZjipU5TB7+0Ne2KtfGzPC?=
 =?iso-8859-1?Q?gYjw626UhJ0qPxiF/vsbXF1CanG5laSW8AOpbgt/u+2iXmjH4V/n6R8ZEq?=
 =?iso-8859-1?Q?tRLwkknhjbjBo20EkZPaEuYqDTo/5Bc5Z+HtwTgKAESaTrvasgZ2BO03ef?=
 =?iso-8859-1?Q?1EWhTzmuhgh3X2Zn2VC6Jz3EwKdhC73XJUjM8fuID/aeU3CqKuwi7cVPBN?=
 =?iso-8859-1?Q?IrNtfGRX6pCxddsn/E6J61W3fcbVERCf/d7R+WweU8fMiyxx+NELu4ZGEW?=
 =?iso-8859-1?Q?JSqbyn0s0CGxnXiA0on8llpbWAPfISe7eJjbuBbXCAJlqb1hQmxktPPJLu?=
 =?iso-8859-1?Q?NKgm3vy7UDkROmEDuxfwDC2nRFYFWgmFk/HWgim33lfVVDgl2Wex0tVMMb?=
 =?iso-8859-1?Q?8LnrxmiRJnqpSg2whyvHOAnUGTTGL0VLt983DZnJ+T0VC7WwUS0It3kahp?=
 =?iso-8859-1?Q?FiukwsLI3PeUeeLecup41s9jsZotIH/9px3PUAD34PPBwSyuAVZykB3Xgq?=
 =?iso-8859-1?Q?bVv4kHDssbqjemRY9sZJvdVn4IML8UY6aM0ykZ6JLwXBUuhF9PR0rGrHeN?=
 =?iso-8859-1?Q?IF/QMmXwmPsoLoH0GgmDE8UG3g0cDLvam3W/LOjngq5AxRfPDKI3krk+wj?=
 =?iso-8859-1?Q?R+pqyWmT5ljEqIKfJ5HlQ5xyQaIHD2I9EO0OoRArr45ZwDkBzlfZiqolU/?=
 =?iso-8859-1?Q?kIuV0sH1DjeG/QPiE8t5ycdqyMbPgCu1zU6QaUiMAS3VElymHlc+WtDw6Y?=
 =?iso-8859-1?Q?VI8zqFC7LB82igMRyPZkMzINOltXUQn7BEX9C4knD4BoHUDCrZncgUaDUq?=
 =?iso-8859-1?Q?/zURFpO/ptntl5hL2mGMyHn6W1VI48cf2C6VcH6E3voKM27e7Ho9XoPaG9?=
 =?iso-8859-1?Q?uS7lqKpLZq3TsLd32/0VooxpZQLYy0i3ALDUHosilwnAaBCUOOJeA5fUmR?=
 =?iso-8859-1?Q?ci2RzcQPYt25F2hQ/83UtOoo4eRHTBszl812RAn8vD+bl3L/SNVGfzLfck?=
 =?iso-8859-1?Q?ECNvjiG+128LXltnPd1Q0ssMLUZc4L9kj9/qKmGdyNNp7MnymLqgxFwhrd?=
 =?iso-8859-1?Q?YT6cqvreU31f3k9kyyltwnKWGyUjWrKJMGmNfpv5Bt9/TkvDfqyd23vpYW?=
 =?iso-8859-1?Q?23tgL0SLVCjk2TyREJnpjcKz8UOWlFerRZivZAFdXm/pf7ORc5BfUhCQEr?=
 =?iso-8859-1?Q?ToMeJN6gT/RD5W4sApAeW2dwjgJXgWZpQjOtMyswIqXEi3iidncXL0kCzg?=
 =?iso-8859-1?Q?FAc0dXFZLNeZ36ARpheT6kt413zyBXTgUpQ4m65Bq9bgoCJhv9OfKtF7mK?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(42112799006)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ixd3aZ4pRHUcJRaKkAnpTaVdnw4LHqeTXhIDTDefx8w0LF4xQzn8hgMBSX?=
 =?iso-8859-1?Q?4FcPLbyv309pxPiuI5d1pm76A95mvWMSlnjBGV1yN0nYgyGY7vPn9MOp5p?=
 =?iso-8859-1?Q?mWxP9Og0zllrU7rMGSw8Ykkp+RA4DaA+nF1SyVJIkNkLTGdxzUSp5xAjc8?=
 =?iso-8859-1?Q?ZSsPZxwDgF+WiT49ZGxGJ66gJ56Lpb2Azxg3WeF0HxDahBNjfvphmmV2oh?=
 =?iso-8859-1?Q?pnG55jHVrddf+IuI5qGT1ljzRbs2ECGJeyzya1qtvAQOUbGqwdvmFB6Op3?=
 =?iso-8859-1?Q?gabDgqiZ43nLHqYZjRuOtrvZrxqT+HgfxOsVwtovWX7hAJv6QNRGzQT48t?=
 =?iso-8859-1?Q?hDgUfFeHDeXE/Vjz+wOEZeCTYjMhzpACBoJGcHYbYE9fafOLvoBtbi2V6j?=
 =?iso-8859-1?Q?ykrW9RWbz6sg1RRYtClRTmEHs7DEdMzbObhIHzbEJT3UUFDI4YyDS2k7w5?=
 =?iso-8859-1?Q?tK+9TnNFjub4AsGULhUt/lURobG4bRupHfWNyq0BOruY3X0D65vFVwAKa8?=
 =?iso-8859-1?Q?MyYKNeDFk057U41151KevMGb3GSWGB/QM8u8kdvp6yJSISkdU9cVjXwqOK?=
 =?iso-8859-1?Q?TyQCPqtRxOltaqo3KiTOCmE1QqHzbPz33i01dd/ImhWf0oo0xzZEa0U1ES?=
 =?iso-8859-1?Q?eu6+xwiXsmPSPbgjzC4v/9p5tROXM6wsn647pc/szJ8h0NW8XiZCdHvig4?=
 =?iso-8859-1?Q?IVm2c6rafHKBNob3D1XN1KoYNSvF/lpb02P85osh+Vhi9USr4fdCxMfdYo?=
 =?iso-8859-1?Q?xPl/RrYFDDuT2CYOEShms4nlSk1veyXZf37QviD4B+vpBeP6bWPFyYnEEj?=
 =?iso-8859-1?Q?kXx6qMfLGwG19jchs1PIb1Cms5BgGolY1MoYkB2LOvCaHdmDkgwTmCFwyJ?=
 =?iso-8859-1?Q?LDs3HAXD9wc1z7mZyv3VvhRZtfaX4oY+gwcSRArpQBkg0bibsBZ9hxIYFr?=
 =?iso-8859-1?Q?elfR9zQdTyNLnC4PRuG9vCauYAMEbLFcEP8AVLLYpVDR/VY7cAIxf+aOij?=
 =?iso-8859-1?Q?sbD1zppzko/tMykRu5arcKcCixMM53I+aHd69OTROb8ezF0HW9mRahj+m+?=
 =?iso-8859-1?Q?LNW2jV7m1sdu+EgXM+Rn1tSirdF27iYIYOdvMVSzHib3HIap5VA8MfOh+6?=
 =?iso-8859-1?Q?F8kyTP9EnBX8BsaY8llD5ESRugScIX7GvJI5E/j6JI54oI9rB3QykOgzTc?=
 =?iso-8859-1?Q?nXpFeOdXBQuc1qygGfpS9IosPh61lQO7O2JZQlpKv3pnH2hu9tJEzEdzxA?=
 =?iso-8859-1?Q?nYWlcxSa8AEk6xQO5KewD1W013kG1HoDz+d9kAfkDjOV5xZ57mTOR7C8Gp?=
 =?iso-8859-1?Q?Kzt/jBABD76nL0DLvCP2w8YssqGdfyvNj1losFZh4aoTCBCL58IVf8fAYZ?=
 =?iso-8859-1?Q?r3rnSDA1gHT02Bq6f4ZLFNfobGFeSq0zrt71aftMWA4/8v1QJi1tG8xRkU?=
 =?iso-8859-1?Q?zwcL/MTGGnLnXnd0NmRaKZXz9Abf3c1ggUcHLDB8daBywwrJw6DQymkzQw?=
 =?iso-8859-1?Q?Ge8horKy6chm/0PGQa216MNuq0W1/2nTv3NMfK3rRFAxUQFv1cZC5LrsLE?=
 =?iso-8859-1?Q?EtnkztlBYIStSdFO507Ohn2kwxgfdCFlV8EfpNDxBe7S7cJGLKUJa3DO78?=
 =?iso-8859-1?Q?9yIMqMGXlulpcY4bNx3NR8N0nN4slrcz4zgrIfNQJuMs0H1pVeWFjyUQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742b2fd4-650f-49a0-ddb9-08ddf51ee6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 12:45:22.7472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7csYRwZ7Rtgx9PBnCc5AE8qEUr0O3NhjFQ+zjSi7X0LzDWQANMjJoIvYCBFeMtrRpW74EFFd+QxGCTbvb4eSWHw618upwMKOzfOlBY0Nck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6163

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
Functions that are non-returning and are not explicitly annotated with
the 'noreturn' attribute are considered a violation of this rule.

In certain cases, some functions might be non-returning in specific build
configurations due to call to '__builtin_unreachable()' in the expansion
of the macro 'BUG()':
 - functions 'gicv3_do_LPI()' and 'gicv3_its_setup_collection()' when the
config CONFIG_HAS_ITS is not defined, it is intentionally used to catch
and prevent any unintended execution of code that should only run when
ITS is available;
 - function 'prepare_acpi()' when the config CONFIG_ACPI is not defined,
to trigger an error if ACPI-related features are used incorrectly.

Although these functions are defined as 'static inline' and the compiler
may remove them from the object if they are not called (e.g., during Dead
Code Elimination (DCE)), they are still present after preprocessing and
are analyzed by the Eclair tool (regardless of whether this code is later
removed by the compiler). This is what causes Eclair to detect these rule
violations.

To account for that in specific builds, update the ECLAIR configuration
to deviate these violations. Update deviations.rst file accordingly.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- updated commit message (added explanation why the Eclair detects these
  violations)
- aligned Eclair configs with deviations wordings (explicit specify header
  file and function 'static inline' attributes)

Link to v1:
https://patchew.org/Xen/f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2042397534
---
 .../eclair_analysis/ECLAIR/deviations.ecl       | 12 ++++++++++++
 docs/misra/deviations.rst                       | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..c10dbf4f26 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -41,6 +41,18 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -call_properties+=3D{"name(__builtin_unreachable)&&stmt(begin(any_exp(macr=
o(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
 -doc_end
=20
+-doc_begin=3D"In the specific build configuration (when the config CONFIG_=
ACPI is not defined) the 'BUG()' macro is intentionally
+used in the 'prepare_acpi()' function defined as 'static inline' in the he=
ader file 'xen/arch/arm/include/asm/domain_build.h'
+to trigger a runtime error if ACPI-related features are used incorrectly."
+-config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(^xen/a=
rch/arm/include/asm/domain_build\\.h$))&&context(name(prepare_acpi)&&writte=
n_inline()&&written_storage(static)))"}
+-doc_end
+
+-doc_begin=3D"In the specific build configuration (when the config CONFIG_=
HAS_ITS is not defined) the 'BUG()' macro is intentionally
+used in the 'gicv3_do_LPI()' and 'gicv3_its_setup_collection()' functions =
defined as 'static inline' in the header file 'xen/arch/arm/include/asm/gic=
_v3_its.h'
+to catch and prevent any unintended execution of code that should only run=
 when ITS is available."
+-config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(^xen/a=
rch/arm/include/asm/gic_v3_its\\.h$))&&context(name(gicv3_do_LPI||gicv3_its=
_setup_collection)&&written_inline()&&written_storage(static)))"}
+-doc_end
+
 -doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
 confidence that no evidence of errors in the program's logic has been miss=
ed due
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3271317206..45f665d5e3 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -98,6 +98,23 @@ Deviations related to MISRA C:2012 Rules:
        even when debug-only assertions like `ASSERT_UNREACHABLE()` are rem=
oved.
      - ECLAIR has been configured to ignore those statements.
=20
+   * - R2.1
+     - In the specific build configuration (when the config CONFIG_ACPI is=
 not
+       defined) the 'BUG()' macro is intentionally used in the 'prepare_ac=
pi()'
+       function in the header file 'xen/arch/arm/include/asm/domain_build.=
h'
+       defined as 'static inline' to trigger a runtime error if ACPI-relat=
ed
+       features are used incorrectly.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R2.1
+     - In the specific build configuration (when the config CONFIG_HAS_ITS=
 is not
+       defined) the 'BUG()' macro is intentionally used in the 'gicv3_do_L=
PI()'
+       and 'gicv3_its_setup_collection()' functions defined as 'static inl=
ine'
+       in the header file 'xen/arch/arm/include/asm/gic_v3_its.h' to catch=
 and
+       prevent any unintended execution of code that should only run when =
ITS is
+       available.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
--=20
2.43.0

