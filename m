Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BDB131C6
	for <lists+xen-devel@lfdr.de>; Sun, 27 Jul 2025 22:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060741.1426440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ug7xi-0004Y7-IC; Sun, 27 Jul 2025 20:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060741.1426440; Sun, 27 Jul 2025 20:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ug7xi-0004WC-F4; Sun, 27 Jul 2025 20:27:14 +0000
Received: by outflank-mailman (input) for mailman id 1060741;
 Sun, 27 Jul 2025 20:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d/A=2I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ug7xh-0004W6-18
 for xen-devel@lists.xenproject.org; Sun, 27 Jul 2025 20:27:13 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 126774e0-6b28-11f0-b895-0df219b8e170;
 Sun, 27 Jul 2025 22:27:10 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB6712.eurprd03.prod.outlook.com (2603:10a6:20b:23c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 20:27:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.024; Sun, 27 Jul 2025
 20:27:07 +0000
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
X-Inumbo-ID: 126774e0-6b28-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my9TlKN+giDu8yCwVX6Sy70/Zc0EHdcDcBFdLgwFvGKnRIqu1Vw9Kn/Py+gBc2YDfWkH/tEY40/B/zv8R6VXz7n30eGCjTqaw0bwTgSVdKp7L8HWm54G2Dry1EFOa1+LxzeFb3lSRv+g7m+H77Clm5ILutmDNLh5AV6jQPRTDU86j5Yk5vmz93CX9ogKaI267q0SCwNVIuicYrtux24CGqNI7dxBvxhIy9qcrcN9dZYek8ZPFX2gAW7bFSDespDnBZdLVpU7ATlnosFbVCe8DiFguSnDp96YLDszq8h0vP70vufY19z665LUMEhzGFZm6/omsJFZmX6HCyUGSbzQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7PKsoc0/AlChHS43x2lcSX826BmiABx1rjqCRh10r4=;
 b=WgD9qwVc1YlvkZGDoFCDmkhGg8v89pQSRjchISRqV9Sohx5mXyB9GeTKzPsimpjW2sH+KszOhOqdr/w5195mb7d40tz4O7gOfwFK6wvror/2SiKlDJD+76iQlJQ8m0uR4bwUaz/WRiwnJH/w+JUqz3vcUNTXH18FYh3giHLH+7dYvsPCNu+x17QBHxjRLrQLFPexP8ir0/LFOIs7mxCUtBKjX5QKi/v97RS7c1RMegYdsnlkdJ+72+M+Se5cOJjCGi8D+jkMioZbIkLCQxgDmhesB14hcGaV8CdkXArrXpjTnzu1sT/VOxPZwmXApqe30Gtl7IEc6Ru4hqh1mOSRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7PKsoc0/AlChHS43x2lcSX826BmiABx1rjqCRh10r4=;
 b=AtPUs5Uogn+8wXYMFmo2hJP1Tcn8jLj6aAmyiOwZvaEFVWuEBYOrW6OpN+Jh5T7Gp8dXS05jmCvHY0Ag3CUG/lA6/miLUM6VRv2a25G0yheDsF5z1g7u7Fo0QR9KWdykBwMHij+qUeaVqi72WVdCJjkXMNxa1CVDJhAqaSBX21BET53OQtGP1uyIji8a2s2TlXE6c3CUqHs1gN6ZEi97yJLvUZeQqMOaMqajuzojaYemeXTkEzCkxNzzFBZgq8YGAde+cCaWWLk016P28FCR5wmbX9Uo47rT6RrTSuGrnuXPmzNHtXezQbpj4XcErqDjwz95PGUkc/ia5LRgvcLyiA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Topic: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Index: AQHb/zTS/PoTkNo+DkioPyw1aNE6Aw==
Date: Sun, 27 Jul 2025 20:27:06 +0000
Message-ID:
 <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB6712:EE_
x-ms-office365-filtering-correlation-id: 123097ff-e6ae-4ef4-5d15-08ddcd4bf4d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mtZYDsZDH1cw91QYyrtPEd6mt4vVwoDpGAg2oconPgK/MS0aLWTYpCpFc0?=
 =?iso-8859-1?Q?Eeq+U+fVRfqGLtX4OwV55ds+J3o8upPzLUKWGKLKUl41CeajW2LYbsm7Qr?=
 =?iso-8859-1?Q?1HawdMeQ5MeBrVkC0vM0UHZVMM0X2PoXP1GTYe7M5yXKEWnAYLOg3cb/BA?=
 =?iso-8859-1?Q?pXxLt8CMcFNnpiYw8vE0rHJaxk8wCTdXIeo/wbBtcMO5njT8rF6NvrKxV1?=
 =?iso-8859-1?Q?Kqsz2Px/pQi/b+UoLkXRtJJ66M8V2eMQFT86uAyBVda4NUNj6Y4/TwdGMK?=
 =?iso-8859-1?Q?7FyklXbhes0cxeSaE/2jEA45dOM9zhJ+0ynacGSodTmZxhC5Oj11j4U+e4?=
 =?iso-8859-1?Q?zmre3Q7BuJNgaS0cT0k9HNswhmk8q4A2ZkT8Gi/ujkhtM1gLUk8DWJbXwY?=
 =?iso-8859-1?Q?VPv4m/Y4jRH+RWlBiznqOaWmNvki5QSeTuvAV+8JFADNNno7IL+E39RKNd?=
 =?iso-8859-1?Q?JqOxTG2UG1AuFm9lNDkrxLBw/BQMmSgMe5lFFvGsexOylCJcR3R6GQseNL?=
 =?iso-8859-1?Q?4JcGW5X64GCGI9qGaQpglAEy6WQ2NfwHvg3Nk4KHvsoffjXfRED6r0PkI6?=
 =?iso-8859-1?Q?4ruTH4bXK1k1No8drZnUGjLCJdTk2xiyllYU7Yl/VHprUxhHJ1OfiCnsnz?=
 =?iso-8859-1?Q?4ro1iA3z41jp0iu5w8KR3XkvsRqHy2P9GKUvt4KzvweypbLDYPKYrSbvKe?=
 =?iso-8859-1?Q?XcvOQ6ouBRfxWv2GNT4feW/nK53GcAFwbZqp6M9o6bY7ZioKqRmfO9vRYs?=
 =?iso-8859-1?Q?G0OedtNUc6hp0d4O5ATUEG3esBPDLoeUwjWlX/tM583F+GeINjZYDgrOFA?=
 =?iso-8859-1?Q?zgVBYW/CzOCdvKvE95ZZAJSnvzZTGXkCE/ze2eO8+h/wwmTWq1B/0T+nkI?=
 =?iso-8859-1?Q?LzxVrrvyRZz63J+M5/qIjC3HABdzlQ0PpKVHs/HOOb4o6ZLzVxNfCiH1TZ?=
 =?iso-8859-1?Q?Fdysu+jI83umsGEIJOcLnFuB5tCVgv2aP6k4MDNqCX2B3a2q8dmZ75XRoz?=
 =?iso-8859-1?Q?mzONyF9qT8GFhdp0S8kri63NKMTLRJQNFI8PjhQlhBMYL5kFN12bbjrM7Q?=
 =?iso-8859-1?Q?d1mbHpcKBKtfppHFheQfkVOePMcdEGisnsLVvm5lTExg+vilCZRNS+5Wy3?=
 =?iso-8859-1?Q?4OnryNi/2wAmfuDwwgL5UkoI6H7CheMdxBRJnjU64CrtYvzfnNAsDXi5f1?=
 =?iso-8859-1?Q?+Z7vLLrC/dVWdDGuiphU1S6BKXicgnG1Ts6Q21mITl0UQ+76u6EUaZF6Ga?=
 =?iso-8859-1?Q?/C0L9LqN8b6Dt68h3sPJpTzVbspy37reo2PtquinGMeiVgUftVf91ZOfVF?=
 =?iso-8859-1?Q?4M7XxqMGHqW9KNnxc9hbNKofbG1ZlelKL485U/yGEk0YPmg0/xmQX7DkaF?=
 =?iso-8859-1?Q?DhG7X0tmGxfgCM5/Xf/L/tBk2m4R7UI0bCHih8fpGZEN6dWqYVj926eHcg?=
 =?iso-8859-1?Q?nV8DkrPJ5IpCrRQNwZqPKKwXWqS5TMP5yMBOtIbkCo4GNmqDzFdsl8MLQ2?=
 =?iso-8859-1?Q?WQrnhnEoeB06GoUAoSGuA/VBoWQZZUgo0Sj6ium1PDXg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?haD4DfxjAdiguxmIrZGxCraBlfO72Z+wpt3ThyFPHxH8feKMOK3TYpisLM?=
 =?iso-8859-1?Q?mbRQCc9m8NUyVMYAF3H7pbxeTdOcZK9g0PqB46qpQv6Kv3dFBxhTt2D4Uz?=
 =?iso-8859-1?Q?PNb0pekUwaPoG2096A2OnPKK/VtjAYBsn1gBKlhABn/UhwxLZJlvOQmNt6?=
 =?iso-8859-1?Q?1xPI1GYwVS9AMrNBrXNz02hvoprdCo6r1KYqT6TOpCXlc9Et/lNeFgmYaC?=
 =?iso-8859-1?Q?DOzhxYtu8Ip3WwKh8G7d6MzMF4CfsSuxg4UxIQrGNgKHr0sXCgbIMGdAAe?=
 =?iso-8859-1?Q?pJr/DdrDLVb3Yh+5upzu2M9nL74ar4U25FanpfNEhBcQleMDBL3Cl1lQo1?=
 =?iso-8859-1?Q?trWOznNz334x9VLSEEYj3eIhdXvfvMdrAmAoSjlsh9zBNrijVWV2JNr5EC?=
 =?iso-8859-1?Q?byXy6sqIDqbGOAO3lR2gCeeod9IAFsyxHAL0+z5lBvju3AbLx2sPNX9m6z?=
 =?iso-8859-1?Q?1uNrWqKvNMzS1xRtbXlayaHyj+8lsaS+Oxzo7bk3ZZ6x9J62x9pzF9Lzks?=
 =?iso-8859-1?Q?WrlUt2cnqK8Sz3tFsxA/ADGHWdYmBSrFcXrBc8qerQghaQKKTE/DBnksnL?=
 =?iso-8859-1?Q?oXcs6DAADa3Qm0a8k21OsgoRfi4BF8QE48jV7TWEz3tGdX6KwUMl5UQGNv?=
 =?iso-8859-1?Q?sBpflPAHhNcXRyI6GL+s8qcFpF01ACPC+mnNzV+GbLlqGFfpU+hXMfwJOA?=
 =?iso-8859-1?Q?45s8N0WMquERj43B2fDWabTdxjIn2t9rtqnlwonDz6X1wORoSgjNMdgRwO?=
 =?iso-8859-1?Q?HDS21oUYFd+bjtcZD1Q/jD8b5X9CQ2z7AdbmJql3QZaoR6THnNSZq3ngd/?=
 =?iso-8859-1?Q?Uo87cE1U92dPaGnJnP/2aTdx5qTUl6IQDqBsUsyrLnP5OkOcPsBqabtcL2?=
 =?iso-8859-1?Q?mbJGL/fv8x5g9okk58svgH7ek8bcPwvpDG4MUtQ2ct0E9rojsX1pu2FOx7?=
 =?iso-8859-1?Q?Fn024501J6NQWuxmUbUh6N3A4fcVd0QzBZ3mLLeh2O5UjjSE9jGJR0EOaM?=
 =?iso-8859-1?Q?EqoBqSPGxSUKc6GE5XgG8yx/KFvcJAuMA3GmyZOFlkJQ2rgZCR1KNGsjzn?=
 =?iso-8859-1?Q?2uGt2j+zZv4YxPFyiPpegHFKdwXp29XNX51Zai8lBWsiJlXSRU4/euZ+81?=
 =?iso-8859-1?Q?JwTaJ122BnF7k2e/ERMD+CI+5Thk2OgOvMjsO6v/9Ca4up224ijPyefQ28?=
 =?iso-8859-1?Q?6EvGc0qG8Kdt6YdnnMxZ5g1IlgKZKu+IqxiNbb64MHRO8G2vtoILRS/6RB?=
 =?iso-8859-1?Q?F5fZRduoeoalWDItfVX/kHUDuEXzlD8qPqwj/Sy18mDN+J7GtVuPW8n1yO?=
 =?iso-8859-1?Q?34ciLnyVHQzd8jZZb7gxePTtsUNhsf6pIylSdP8JdUmIjqcb8/WrSd/PI/?=
 =?iso-8859-1?Q?sCKrZ+vFrb41BBXFVsNiePRrrDX5VreQvhDdOhYW4tYdkTpQ1Cwr7jDhoZ?=
 =?iso-8859-1?Q?0WElPPIJ/Rt4UDp57S9wpqzDmmHYfRoCrT615SRQg3clmaoYATikl8SwTY?=
 =?iso-8859-1?Q?cS9uJIG1ao4u5OHVbmUWmJrUfy0RUU0J/7ibyPcmsxFezgts4h6sOfHORX?=
 =?iso-8859-1?Q?Nf5jojOR88JF+tPSoy2mwxt8utQw1eP2p5lUnZoylXtd8ZQjsAZQT1Tk+u?=
 =?iso-8859-1?Q?Rv8mc7CarvkT2EcoOawA3r81f4va2//f+5Mi9gEJDi41HEmDtBvw28Ng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123097ff-e6ae-4ef4-5d15-08ddcd4bf4d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2025 20:27:06.9759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eMMJzrBVOf8QZlVJzWH6jP4lFIlmP/37v+NrdxjDJY6AdDDuGgxY2S2bJWPGhsBeJ7TVS0KAnhsRGVEWRVsIi0QaTfe2Na7N+MT11OiGpOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6712

Explicitly cast 'halt_this_cpu' when passing it
to 'smp_call_function' to match the required
function pointer type '(void (*)(void *info))'.

Document and justify a MISRA C R11.1 deviation
(explicit cast).

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 docs/misra/safe.json    | 8 ++++++++
 xen/arch/arm/shutdown.c | 6 ++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3584cb90c6..26a04ec521 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -124,6 +124,14 @@
         },
         {
             "id": "SAF-15-safe",
+            "analyser": {
+                "eclair": "MC3A2.R11.1"
+            },
+            "name": "Rule 11.1: conversions shall not be performed between=
 a pointer to a function and any other type",
+            "text": "The explicit cast from 'void noreturn (*)(void *)' to=
 'void (*)(void *)' is safe because the semantics of the 'noreturn' attribu=
te do not alter the calling convention or behavior of the resulting code."
+        },
+        {
+            "id": "SAF-16-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index c9778e5786..57a5583820 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -25,7 +25,8 @@ void machine_halt(void)
     watchdog_disable();
     console_start_sync();
     local_irq_enable();
-    smp_call_function(halt_this_cpu, NULL, 0);
+    /* SAF-15-safe */
+    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
     local_irq_disable();
=20
     /* Wait at most another 10ms for all other CPUs to go offline. */
@@ -50,7 +51,8 @@ void machine_restart(unsigned int delay_millisecs)
     spin_debug_disable();
=20
     local_irq_enable();
-    smp_call_function(halt_this_cpu, NULL, 0);
+    /* SAF-15-safe */
+    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
     local_irq_disable();
=20
     mdelay(delay_millisecs);
--=20
2.43.0

