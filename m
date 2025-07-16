Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FFB07FFA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045873.1416157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucA2U-0004RC-Uy; Wed, 16 Jul 2025 21:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045873.1416157; Wed, 16 Jul 2025 21:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucA2U-0004Os-SK; Wed, 16 Jul 2025 21:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1045873;
 Wed, 16 Jul 2025 21:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvkC=Z5=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uc9b1-0007F2-QU
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:23:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1971a9c8-628b-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:23:21 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI2PR03MB10882.eurprd03.prod.outlook.com
 (2603:10a6:800:27a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 21:23:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8922.037; Wed, 16 Jul 2025
 21:23:15 +0000
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
X-Inumbo-ID: 1971a9c8-628b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cdscno4x45EzaIb9fj8qOxaHLiB5HKkDPukCY4bGeOmMHaoInFcCR322NgiXqrRNHx+lC4OV+FlXHQl6Cl2f/xQqFOmcNzCkTExUDyzKOmA7izxq2e1LeeBiUaLq6wIy7WGMjFh7WJ1okLOEoadSqhZ0vG01XWnFbaNCUugLmtYarO7jz5VEQcsBk1f81mjJaK6IbU3RbkG/Od3PAfK82pQ/JTomoIlb1P1BaxRmYRYaFob9RMRFJgNmkT1rr5McvJ9NaIJkckL3NlejW7uxlovm5IePvYeALoLT9dDtu0Uu4Z/ZWcIPu6LXOliNPg/d7VsG7dwedY3QOjPIJJFZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xvue2va1E2ikO8sg/D+isPczYwxJTxTgxdL8O1ZEYw=;
 b=yjiK/IX6nYU7w4nUhX1DYQmvJ0Q2p09c+sb8Uzhqfyz4miCxj4BG72nr9CShnV/6Bd3AV5DM8d5C5F7mTtNrm0wWj6EJj2SzprNjzDfhrpBwWA7/CorqnYfqnHcTWdTYxZHhW/9MLOlusM/XpMOI682O9z+c7pi+PsxzKRvwG1qjp2i/8KwujFBtlmTE/4P3Ir86happHLY9/7lHcyNZSVUWtf8KjwqJtE4IcLFIG+aQ5nqyR6EGCkZapPTBV13bZuxoX2kJzPw3lRIL7DvFzZ05Tuk7QE5Brv0fy644VWFZphgvxk3XlWfpbW/uWsVg21m/JC19YZwSgaGblUNfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xvue2va1E2ikO8sg/D+isPczYwxJTxTgxdL8O1ZEYw=;
 b=MA7JUO6dS4Bubyjt0ABRPJei91TYgP/ihvpGFbFDuhG6THhUYtY+3snoA8pehu0Qesa/WQ5x4S4anu21wOCphZhwkUkw8GFCXE+yDu4HBU/XhYWZIiWvxh7GIkm1aKTePj4pTK6tCNyHOuy4SeHfHBNtHJzO7W0NtqEsCIUMnvlA33DOukV3tRzNgNeVoCYo+zNEFCECo8gq6Au513WRNrM+itljosSeffREuQTvihgoTQN/QY0Uzu2LszdGrPjtEgVw2FUavaJc8l3H2z8X8BSr4lcqe172qcN4izvTIX4ZaohxVCDupNBdqhTowFljbxlwWPepdOif7RZdysFNSA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] build: force compiler to use atomics when coverage is
 enabled
Thread-Topic: [PATCH v2] build: force compiler to use atomics when coverage is
 enabled
Thread-Index: AQHb9pfXTSTU5wd70UKxH4Py9cX5aQ==
Date: Wed, 16 Jul 2025 21:23:14 +0000
Message-ID: <20250716212253.406346-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI2PR03MB10882:EE_
x-ms-office365-filtering-correlation-id: ffb54261-6c7d-4b33-bf02-08ddc4aef9b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LWfyqdZm+RjVsLHz0987nkRybmoEHCTI4TUM4d+zBdcp3ukrmeavpAhsmr?=
 =?iso-8859-1?Q?DG85NypYcdzYbAQ1BkGk+/SnMf8hJLAgZtOZX2tSb2e86mJAJ9EEH7NIjl?=
 =?iso-8859-1?Q?jF/eecg0408cBwOaAgOTWIyqJZumizQKAEDPRHupJ+0n2YviGT1BPKDEN/?=
 =?iso-8859-1?Q?WP3Lgg0aVOmE26225BtQIK3UTZrRp8SArswipvB3UrE/CP9L/LhEzw/1ny?=
 =?iso-8859-1?Q?c1+MG3WlZtU0XPucQjNBUIUxrt90JFw4l1pUX7OjbrhYARk3ASQDFdU7qG?=
 =?iso-8859-1?Q?UdWZYThrPid4bZOnd+9T+DlrcBnXGD0CDGR3t5vNaxJSnJWizaCLNIVJo0?=
 =?iso-8859-1?Q?fMHm0d3gcPdyr+NmsxP6cn3D1RMRpXUnseh2C3st4ih6rb2szu6HektfVQ?=
 =?iso-8859-1?Q?Ey/NtEDEbyr3/DjBihJ53UxRu96K3U4ACJMDu6L5KGkOt54GT1lrJxb46D?=
 =?iso-8859-1?Q?ruSlxKan8cZceof5Sc+OLqPB/9lytZDfg/Pns7tetHPYiFpRg9N3grn6lu?=
 =?iso-8859-1?Q?yGOOzit62wv73EeD1ktLv3Ku1Niii3Yu0bLO06vE3oYoCRpzerGm2xjkFh?=
 =?iso-8859-1?Q?XDM2VQixeZzHYxw90PvmUzsF6uvthENhwyrI+r/OND7SthL2WRVqxu9XOG?=
 =?iso-8859-1?Q?xgFJp85mmINM75Jnwz4njvDE7X4n285wa12MQ3hq67Ve1ABMR7sujnH+Wd?=
 =?iso-8859-1?Q?SJPJxVMBetAkr6O6uaZmB0GeI/t4i1dXNbhYj3MPMofHVgS2Vnz7IcZzIJ?=
 =?iso-8859-1?Q?6cC22lBmfoY9nDqdQXlV+U7tJEGbmYPNLx4S1R3prwyR8E+t9g5ryWYnrB?=
 =?iso-8859-1?Q?N0FZ6lv2yk7WwxIBMR2qhpiANe4hjNa9bKDdQp/j4RYpmkqf3pcByibPsl?=
 =?iso-8859-1?Q?zfCVi7phlfgDg3pjaXZ+8OfLGAeDIAKDy+o/7hJ/oWHmqWUcgHqm54BO1M?=
 =?iso-8859-1?Q?yBistLb/gZzzUVDfGBBhBqj1Z6IR2XUHYR3muBVaflhSh1rjQXqRH0P3rq?=
 =?iso-8859-1?Q?ozRFrrlpAOZck4vi6b8yIaOFcuqfxtGVSLFYthun+7fznECq/UIwtoP0kh?=
 =?iso-8859-1?Q?eX5Uy0lXEjUGYDxEgOIKB2ODEMh7euTTomr5tt5MRDP5oEPnVZnrbqNLCB?=
 =?iso-8859-1?Q?nZ4Rkkgw99Q4Av/yyuc7JZfKySA9doZXqBg3lW3rVCjGMd7OPFMIo6lbRw?=
 =?iso-8859-1?Q?DCX+cvoRG8f6fAwjOTlUkjYJjVjsczXHaBsK/1ZBAWngtn4mh235VdMsLy?=
 =?iso-8859-1?Q?UnS9up2TOIo+NdHEtTZEiwwMPEhcrfwcmt500mAOKf4KOy33DMjqi2O+BE?=
 =?iso-8859-1?Q?phgHsAt5bPmq9BE05/Z4N4FcT7ZI85y2DM1LuXpv1NCQTttugvC5ccdt9q?=
 =?iso-8859-1?Q?Fblsx9rF2YAVTheID99I7d1OwdSQHT+u0Isv2Hn3ZBFnvNqcWec3aLM2HN?=
 =?iso-8859-1?Q?tqI+nGlbxj7o472H/VtS6To4FIuMGdt74xyWuroXAfgAWSWi3nKVPNU/6M?=
 =?iso-8859-1?Q?oFigHUUYTU47gVyfN2xvKe+oF7gbxmIIU7TdC6B8BPfw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hHhSHXeD2Nwc4Sy7mw00JefkPauQfpSXYA+DabPFLuFURjsamXJWnGODLY?=
 =?iso-8859-1?Q?62JK3UYR/SY24V/K/6IVQ5Zk8pg1cItr5Ix/lfzqtv1aRTnwGRrIY+XT65?=
 =?iso-8859-1?Q?rS1iwqX7nSu5NZMpupvlIf2NRpK1TsV/lZhx4GfxCuqP1tx3C76J6A3fhD?=
 =?iso-8859-1?Q?5HcS99ZdEg9F9R8DPatnXPUbarsIZlsGwjb7H0fTfh+y5uG1f0Dfr84XX1?=
 =?iso-8859-1?Q?U6kLtCWS3hdgkORih+YctiDoJG7d2Ea5SuNL9zVhGD673VQ0qppuhhM6B0?=
 =?iso-8859-1?Q?aUPqSaL3Cab2y1haXlP0DLKeropGt5Dje7vKmMhOuWw/uHa4KTG/TcQt83?=
 =?iso-8859-1?Q?mld0AZKyF+64rcLxr+GKje3sqxBqBJao87/0yrnwEPvIZB4AvFLf4xwd5f?=
 =?iso-8859-1?Q?DNTYuZ1fWr7fAUdxj/RsLdxTWrX3kdedtsy9tNHQsSN2nxS1gtpK+c6HLA?=
 =?iso-8859-1?Q?nnzz5Zsnt7Iji4UoEn8LhM9jTAqZavygdw8mTOQk/Y/9u+ioR1boJqEsU0?=
 =?iso-8859-1?Q?EOkesqb+6wY4W+ngXCUawR6XTt9TYur/H+HItIKQmlNQjTi95hLODje2wU?=
 =?iso-8859-1?Q?enz09SOtMCL79BpzNKFfp0m+fLtXFxihqVFvEvhSDYg1CFGDYt8Tj0kezh?=
 =?iso-8859-1?Q?Bb9npAlJRmEG6whEZzl32kyXMQWnZiRYPv48EJM57Rfo3ruia008aGfkoF?=
 =?iso-8859-1?Q?CDoBlWHuwAXkYfdP2+ebYrLZc0CjEmTefUYPoT6QnnjBioOhkwMlQkc4Xi?=
 =?iso-8859-1?Q?KDgFWZkUDXVIWe9uvlTgMgDlMH2GaneUJtd6M6KLfGQ55LlG32Xf3ebTyV?=
 =?iso-8859-1?Q?tRqsPgVFBlITfc+OxoHd5EFUh8Bgs/dtgrkZdvq6NxofWaGjePeImz8H+e?=
 =?iso-8859-1?Q?UkRSiA3q8Xfp8yjd+6QuKkX7TbnbGHXqeE31Plc7WQ+kmsW9PLn8ijRPcU?=
 =?iso-8859-1?Q?tzriPuGme/3XLFO4OvOuyeWuW0ZOduiiJ0msFlVvQI9HmVHNcBNIAyJ7G0?=
 =?iso-8859-1?Q?pfUzcoPd7/oqiKeRAX/to0VR0adSG7PHR0FckFgcALu+eGC2+cNZ4QzbOZ?=
 =?iso-8859-1?Q?XZDGGjBxgclrvAJeUEm1izO2sqEmeNb2TIsgKCRDlZ2aSVlySVrrpwF9Y2?=
 =?iso-8859-1?Q?xJVT2FIYt1w9uZ2/2AmRCWJABFOofllQimHqe9JwjltMFpWOu99/pix5oL?=
 =?iso-8859-1?Q?ZePDiC+wucR3C1PgbF8SYHD5UrRPvdZxFsKaX07TBzQxkdIXS1Gh3e2aBk?=
 =?iso-8859-1?Q?2wM3MTZl6AySR06qGBSkiIytysrCNhWxTHHpf6ucxDic9uXCfAzUNe4EDU?=
 =?iso-8859-1?Q?Sbk8BQ/QPnETvIXxYEdfDzN/oPyPO2yuULwKwL2ZrwYVS0Chx1/Cnx/IBn?=
 =?iso-8859-1?Q?oas2eN5zpxs4B32erSFYMbGDTQladJQNnuf8kMCEgY7iYATAiH0VkX1iiG?=
 =?iso-8859-1?Q?0WQRdDNn4Hf1B41kbScydEcBo1wjpZBieVET+OzC+MG1q8CMuWiYAvCDiZ?=
 =?iso-8859-1?Q?1gPlAmaktKha8FrGy92Xy0mzXQA2yi2C1SrJ6gTbuHU5dgA+MIfxxb38hr?=
 =?iso-8859-1?Q?PKVkFMutIDwh6K/5bkg32P6hMiFY1yg0UheGu2lDUxlbeGTx2T1ievoC0k?=
 =?iso-8859-1?Q?uy7a3BY079ckwuBYIyUFEX0c6kjXUyak/qgtYOJknoMz5sG7FgChhnUg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb54261-6c7d-4b33-bf02-08ddc4aef9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 21:23:14.9108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3AoB9wMnY2NQ46eklZjguRO7/ovR+15c+AMhR/bng7Zena0bozgoDWcJ1FOn/8+ZDsKMFJYFLjrk160ioICqWa+Y5HHyUez/nqt+ns6tRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10882

By default GCC uses "simple" coverage counter update
mechanism. It is perfectly fine for single-threaded (or single CPU in
our case) setups, but will cause race conditions on SMP systems.

For example, I observed that counters are going backwards when running
Xen inside QEMU.

GCC starting from version 7 and LLVM/Clang starting from version 11
support -fprofile-update=3Datomic option, which forces coverage counter
updates to be atomic, which resolves the issue. As Xen runs mostly on
SMP systems, force use this option if it is supported by a compiler.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v2:

 - Use $(cc-option-add) instead of a Kconfig variable
---
 xen/Rules.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index da21850926..24f447b957 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -141,6 +141,9 @@ else
     cov-cflags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
 endif
=20
+# Ensure that profile/coverage data is updated atomically
+$(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=3Da=
tomic)
+
 # Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
     cov-cflags-y :=3D
--=20
2.50.0

