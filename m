Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D360B0F4DC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054173.1422912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uea5s-0002Xh-3A; Wed, 23 Jul 2025 14:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054173.1422912; Wed, 23 Jul 2025 14:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uea5r-0002VT-WA; Wed, 23 Jul 2025 14:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1054173;
 Wed, 23 Jul 2025 14:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE//=2E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uea5q-0002VN-VB
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:05:15 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d930695-67ce-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:05:13 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS1PR03MB8173.eurprd03.prod.outlook.com (2603:10a6:20b:4c7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:05:10 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Wed, 23 Jul 2025
 14:05:10 +0000
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
X-Inumbo-ID: 0d930695-67ce-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIlrDd4XSJP41Nkw2/KY/LiCQM8VDp8wHEVXeFb5WuP14eKdPqk4hV1k/Y8YYbOsPPQ6ZSGU0SIgd5ldmay3+MPoR6TOnT6Qk4tjVFfeKtbgUqUWVvp+QEBurvLuVhLfSAEXoD1zYhqYMI3r/R0y6inK8+WkeUKrQNApbbmwct1fJj/ZPAa+sdpuNbvmfeWvRjGAF46FLUEnuGO63osq3/+l4j1vGT3taZOoXg3rkCs/fe1XCsYqHq55oy4S0br9a+jpQc//0PEdS7E3jAGA4qTRqtnyKqXljCfGb1rJnHxdvU+zkC3eX5AlxQzcW3wO79ehH7CM9Vfk7xE5cQe7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f25BCZqkQ9KD/wLSPZn0jCltSm3NlTccOVs+VBiyTvE=;
 b=tsrMZ2mxd6d8GrDevB5Q3kW0df7k19fdR/O9AQpeaU5z1IC+8cQt1cJu0ZztYDKm6W226BBGAtOGdJIbIEpI6ffOtv8+sewqVj9Mw1IpzV/VDbi7aBbTeu5t1RgwWzo5+YnyqgAUNVt/3OSnDm3Tr+al/WTNf0n45mFGx5QeBa8WrE4gnMNGSxvmkgDkHL+dQZ7qJS32guyK7F/UwWt3mcXtXnn1tWVxlDb2iLRHwWbSSb6VSSKeJzkJkBL+RI66u3MkwambQ1LpLoOd9INMbw6OQTPcilo388MVhvemClsgH4twNlNAnmEPQWaYjmJ5za0dZ5hvYon6hAdxbTkgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f25BCZqkQ9KD/wLSPZn0jCltSm3NlTccOVs+VBiyTvE=;
 b=QqmWjUb489yhe4LUV7sc9y8aRta1dajNVOjqo8owLhDpxE4kAjwJLgeJVTrEEuqbmCCzpAVvfJ4qgIlLulJxCi5Zm1vAf7VC8knFT0CA8ZZpvB6rWjL04hi3L/9QzDsYJCrJFUzaClUHqXh7zSCeaT4NMpYDYduPHiQvAV57dEueKCJ+07QF6vcBsSeQYBgsmNR39nLYk/4Uy6UyRTxj+MnXvQ2pICmck0rMNZO+7wTRZLgBrsg8+4g20QnFUJNTQ5qWsb6D/napC0AWBwfSP9Srui9b0wo+ckkyLeptFgzSAjaIWqZkLzocvwyngUKKIhA6JbFBtjJ6LKb+GKpSyQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "amd-xen-safety@groups.io" <amd-xen-safety@groups.io>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0 boot
Thread-Topic: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Index: AQHb+9rNCD0pdC1VhE+OyU7cYZL/lw==
Date: Wed, 23 Jul 2025 14:05:10 +0000
Message-ID:
 <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS1PR03MB8173:EE_
x-ms-office365-filtering-correlation-id: 86b47b7d-d03e-41c3-4eb0-08ddc9f1efb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UP3j2TLAAQwQmc3Y6jXCp7DeyAPT4T+xOigi/I+hkmnM1vsTTFC+VQExi4?=
 =?iso-8859-1?Q?tyvB1AXUUlPEEgKH65aHVQe7BY/FR4JcLuTws/jb274INGIGjr9Ldj11MY?=
 =?iso-8859-1?Q?hBsIZrHo0WGnqXCvrgGcK0Hl0bs6X0q1ZjaaJ99x7Mw10aCwF+vXrxSSxm?=
 =?iso-8859-1?Q?6QpCHkEeDOsRfK3EYLsHEjG2NVG04uDjBlV9Jh/tag3JUL+XMxhISzvsAH?=
 =?iso-8859-1?Q?aYZDH1OkE7bg1onnPxrGqkY61NhyeAEeSIHPnp8+3kj9brVIAQH/mQ2ELN?=
 =?iso-8859-1?Q?K/OcB8rc4u/8EHrS9dS3jWIqhrNP0YsIsk5W2Qelh9P3ICaUjlDXI90+n+?=
 =?iso-8859-1?Q?EqDJvl/uEOxc78mjwaB9b83wyEuqeIS+ga3RE1MoA/3umggV/hPy4fZ94a?=
 =?iso-8859-1?Q?UQiWJnsGSCv8QKD+mdKZxXzL1MkGNSnO+cG+hOUYAhlv5ky80GBkz6K1zZ?=
 =?iso-8859-1?Q?y8tPCufH/TeuOnk+Aphk++0FHrqsD/ccjk2IXmKz556qZFYWEI+jWPIu8h?=
 =?iso-8859-1?Q?Tz5qL4vuHppvaGzQKSuW1hyuYR0I8NTR2SEsymGVQoHYAOjkrSus9+CLkL?=
 =?iso-8859-1?Q?b3Y0LR13UNVfRmoKc5fZbAcb9LIXVhZzD4qBcxYbfaWwZkRg5qsV/iITj8?=
 =?iso-8859-1?Q?xQirHy1LBc0mtHM0be/+vUIni+tl2YZQn4QQePCpngVy9sctCSwqTJzIlC?=
 =?iso-8859-1?Q?sB5Ih4fb2XsAMXA7H24FGV5PCYlGsQC435WPIcKLbRWcv6e6vA9Kj3s1kj?=
 =?iso-8859-1?Q?tKKIzLzWXfbIpNEF0i44pQjl7tvWK6WSk6jHgHLK/2QR45hdi0DX2ddgdc?=
 =?iso-8859-1?Q?EG0RBFuRRIShdz3LzQ3DchER80pL+OGwP4jkPpP0PKiUCmarVBJihIxx5o?=
 =?iso-8859-1?Q?I5d6R8dyEuagnO1CZLV39eqNL2VVJK0L7Jga1pA+gUJ13HJ1XoxQRiWji0?=
 =?iso-8859-1?Q?bMBXFw40r6/17zdHbZ4FXqeEvMiPz1LQAIwjD+8DoLiLy6k5EdwdfMx+XP?=
 =?iso-8859-1?Q?5KMoeuIUT+JYNbp+rGxUwos/CQJp3LBo0/Ir+zGfFApdKLH8hRDkmpWcB5?=
 =?iso-8859-1?Q?/V5UElgFTz3CXdPFr/40JmjQzR/dwgH+WSZhf62te6duuzj6Ej0g6P0YUZ?=
 =?iso-8859-1?Q?LlGlsDUiemtH9H8RzwBCVNlItPTttLQm09+QKzHceXWVWBI7BbjGBOSYw9?=
 =?iso-8859-1?Q?Y6aTj5Mg/lQNF+bhjeboW20sCzD8zvOvoLZN1/vbveO6L/WKXeiDYuabNJ?=
 =?iso-8859-1?Q?4IKpJi1newG1ODdycFiErShpvJ+ZTzBav8/eRlIcUXmnnoa5dcJcXoYVF9?=
 =?iso-8859-1?Q?wYqrwqiZAGFL3SxgnmfzmI/mVEZv0u7Cr6tsuHZ+dhdhJhXG7hGMbZTK8E?=
 =?iso-8859-1?Q?cqw0h5PgSZgXEx4dOyFZ1aQUQA51L3hzj09GldOqbtOkUrF9CALM0TV2bM?=
 =?iso-8859-1?Q?2OlvfmUKT+HTpXhDIgaSoeKGZY93R+PgBanPaHDc+EFVLkoFzOsZGPo/n9?=
 =?iso-8859-1?Q?JQQ5I8jHagonYFqIc5dYi1CWrBFukfqxxtt7N/UwrXfQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Dofx72Bh+3PCiTevFpd+/un3pqzpEVzEwpa4LdlENycK324kXS3WtxrH96?=
 =?iso-8859-1?Q?o9fYB/gAj1/LJBYUA1XsiJmIzmMPhaeGpPWsMUcYEr7yoHhPGDocxGxW1k?=
 =?iso-8859-1?Q?bEPSW3YqaAQ73oMuDCZBHTSiT1sMUqjcDO3liL+e/dcl2+Ef8hBDuyRw/I?=
 =?iso-8859-1?Q?Rnap1ox99tCRT5J2W7AHE06c7xLCRP9flsOeBVDeieNR8ItMedwExegRo8?=
 =?iso-8859-1?Q?xAprRldN8PfTjhoNxe0lUtRfSmdIzxtaIWEdQdBxX95vJtA2o3Q6UplfIl?=
 =?iso-8859-1?Q?BGTrWnABUj3NnGiqXddDjDt5Ze5SN9ebsfduJlCkztYvwoOdZ3tK1hxXd/?=
 =?iso-8859-1?Q?ZD/rhInD0rt0rGlG4leGgUhIWuf8tCQmU+Rdcm0JVNeeY+0y90ClbGoqRq?=
 =?iso-8859-1?Q?PKBcJ8Lqrc2MkhJqW5dWrs84KcCujYUKI1QRpKStpHT+gt3YF2n7ziArzG?=
 =?iso-8859-1?Q?fRjEyAwPmxqGLIqKWYl6R0Oy0hgHXA/veqD5oDHH6u3KY9NxNExSWpXIkW?=
 =?iso-8859-1?Q?UsgSZfi5xh3qaQU4uKWXvbAuqqNfzYlU/mQ3ZmksWtRlN3U59nOXkKF4AJ?=
 =?iso-8859-1?Q?nbBiviZvKky2iCYw3VIs6/TV99juIsqTz1flmd3HZ0HUAUJJAQOwr2TURH?=
 =?iso-8859-1?Q?RIfJYe7ffpZ4p8+Pg4NzhxwTOtY7kKst4BxKgdaX8ytuoOQDnE14U3TCqf?=
 =?iso-8859-1?Q?6U3btsmeDF1JtNSHtVBeXXp5owmCNUMHpvh0Ur+u9EClkyit8OtQmHYrDl?=
 =?iso-8859-1?Q?WmxudT9opbQqPkKnp89D23hKXF6uFAFsNAbOIbOT2ulcbf/cP9a0rxeGQ0?=
 =?iso-8859-1?Q?blGsTGhRKrDm7Ax5EW4ilrCX96Sly1dX3bAbqel03rFo0BjMt5YxNGgDNV?=
 =?iso-8859-1?Q?fR8iVDY2XAB2EekDczKAM5vr6k6vaXuScfTLJyLjETldNI3iXpASzF4P8u?=
 =?iso-8859-1?Q?QX0eYigMkZuLnZhmNSBHgKG0N2rGD+LKqm9x6dc07WqeeNYv3ihKUfKf6D?=
 =?iso-8859-1?Q?N/kL+/25vp9w8VrH+s4SJAsDod79cYiLyU+s6iD8/GqpRFKVnfN9/GG5u+?=
 =?iso-8859-1?Q?REVIobbwy+tz8uPDdnprqHhvhNFhEIb5se0rEcwkRtCWEzgF5uk7lNrC5/?=
 =?iso-8859-1?Q?WJ7cjv0lwd7ETmrthQvcM4xdNzM8s+G2GmiQBb2ZGgbTCuJgBSUDGz19Ic?=
 =?iso-8859-1?Q?pKPbmy7woysNJLpxG0HHYI7txaEtnohJdzZNix6XpOHFM5pSv/0XoaSYTG?=
 =?iso-8859-1?Q?BW07x5HNoAVcnO/D5R3FnLynJJSj6W9f8/gbU+sWt0d49O3zs81Fwfb84J?=
 =?iso-8859-1?Q?oNmSTUz30xiT3WX3Kcf9B+c4SycrOdc7zDyT3fXV3s9wenRi7mThHdyENe?=
 =?iso-8859-1?Q?gHd+aUO/RlMGVSjs+JZVNGcKL2JLHfg/4Ok8JL+KzcncCfuva1Pn9TrG9P?=
 =?iso-8859-1?Q?EWC+o9hzdfOEsPt3KYv5ZURhhequumnqL4vkygrZK8uSmep40tzxbMsPwc?=
 =?iso-8859-1?Q?xjPv5Cah19DGEVnlRs8+BSHWBB1yNwK5zSvMHn8K1fRmYOKplCUcfHz4w5?=
 =?iso-8859-1?Q?FdpVISW7N8+h1ea9yQAZe7o3OqMIVgF0U28VZE2cS9bIGSscM2ZnZgitBs?=
 =?iso-8859-1?Q?C5pKCuZrySrXx+xXm2u/Qa2SiqXAkY53pP2hLon29j9AMCEGjqfraDMw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b47b7d-d03e-41c3-4eb0-08ddc9f1efb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 14:05:10.1840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oznU9kls5/UM0xWIbg9SrRXEGiz5hIUVxcenV2Gm3pFgNFe1qtT4kZToDmbPws9l/iehGPlV7r2EICqvOvSPm19KbhOFeuek2dJfzf/T3+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8173

This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
allow for building Xen without support for booting a regular domain (Dom0).
This functionality is primarily intended for the ARM architecture.

A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
default for ARM architecture. This symbol signifies that an
architecture has the capability to support a Dom0.

The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
expert users, this option can be disabled (`CONFIG_EXPERT=3Dy` and no
`CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
creation code on ARM. This is useful for embedded or dom0less-only
scenarios to reduce binary size and complexity.

The ARM boot path has been updated to panic if it detects a non-dom0less
configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
boot.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

---


CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
regular (legacy) domain an optional feature that can be compiled out
from the Xen hypervisor build.

The primary motivation for this change is to enhance modularity and
produce a cleaner, more specialized hypervisor binary when a control
domain is not needed. In many embedded or dedicated systems, Xen is
used in a "dom0less" configuration where guests are pre-configured and
launched directly by the hypervisor. In these scenarios, the entire
subsystem for booting and managing Dom0 is unnecessary.

This approach aligns with software quality standards like MISRA C,
which advocate for the removal of unreachable or unnecessary code to
improve safety and maintainability. Specifically, this change helps adhere =
to:

MISRA C:2012, Rule 2.2: "There shall be no dead code"

In a build configured for a dom0less environment, the code responsible
for creating Dom0 would be considered "dead code" as it would never be
executed. By using the preprocessor to remove it before compilation,
we ensure that the final executable is free from this unreachable
code. This simplifies static analysis, reduces the attack surface,
and makes the codebase easier to verify, which is critical for
systems requiring high levels of safety and security.

---
 xen/arch/arm/Kconfig        |  1 +
 xen/arch/arm/domain_build.c |  8 ++++++++
 xen/arch/arm/setup.c        | 14 ++++++++++----
 xen/common/Kconfig          | 11 +++++++++++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index bf6d1cf88e..29399183e8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_DOM0LESS
+	select HAS_DOM0
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ed668bd61c..9b8993df80 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -40,8 +40,10 @@
 #include <asm/grant_table.h>
 #include <xen/serial.h>
=20
+#ifdef CONFIG_DOM0_BOOT
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
+#endif
=20
 /*
  * If true, the extended regions support is enabled for dom0 and
@@ -102,6 +104,7 @@ int __init parse_arch_dom0_param(const char *s, const c=
har *e)
  */
 #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
=20
+#ifdef CONFIG_DOM0_BOOT
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus =3D=3D 0 )
@@ -114,6 +117,7 @@ unsigned int __init dom0_max_vcpus(void)
=20
     return opt_dom0_max_vcpus;
 }
+#endif
=20
 /*
  * Insert the given pages into a memory bank, banks are ordered by address=
.
@@ -1953,6 +1957,7 @@ int __init construct_domain(struct domain *d, struct =
kernel_info *kinfo)
     return 0;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo =3D KERNEL_INFO_INIT;
@@ -1984,6 +1989,7 @@ static int __init construct_dom0(struct domain *d)
=20
     return construct_hwdom(&kinfo, NULL);
 }
+#endif
=20
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
@@ -2037,6 +2043,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
     return construct_domain(d, kinfo);
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 void __init create_dom0(void)
 {
     struct domain *dom0;
@@ -2089,6 +2096,7 @@ void __init create_dom0(void)
=20
     set_xs_domain(dom0);
 }
+#endif /* CONFIG_DOM0_BOOT */
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 12b76a0a98..c1463d647a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -480,12 +480,18 @@ void asmlinkage __init start_xen(unsigned long fdt_pa=
ddr)
     enable_errata_workarounds();
     enable_cpu_features();
=20
-    /* Create initial domain 0. */
-    if ( !is_dom0less_mode() )
+    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
+    {
+        /* Create initial domain 0. */
         create_dom0();
+    }
     else
-        printk(XENLOG_INFO "Xen dom0less mode detected\n");
-
+    {
+        if ( is_dom0less_mode())
+            printk(XENLOG_INFO "Xen dom0less mode detected\n");
+        else
+            panic("Xen dom0less mode not detected, aborting boot\n");
+    }
     if ( acpi_disabled )
     {
         create_domUs();
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 64865112a1..75039138b0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -21,6 +21,14 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
=20
+config DOM0_BOOT
+	bool "Dom0 boot support" if EXPERT
+	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
+	default y
+	help
+	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
+	  manage domU guests using the Xen toolstack with provided configurations=
.
+
 config DOMAIN_BUILD_HELPERS
 	bool
=20
@@ -92,6 +100,9 @@ config HAS_DEVICE_TREE
 config HAS_DOM0LESS
 	bool
=20
+config HAS_DOM0
+	bool
+
 config HAS_DIT # Data Independent Timing
 	bool
=20
--=20
2.34.1

