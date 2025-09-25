Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88EBA0177
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 16:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130631.1470112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1nOe-0000qB-2A; Thu, 25 Sep 2025 14:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130631.1470112; Thu, 25 Sep 2025 14:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1nOd-0000nH-VC; Thu, 25 Sep 2025 14:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1130631;
 Thu, 25 Sep 2025 14:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bul+=4E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v1nOc-0000nB-F0
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 14:56:34 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ee41f3-9a1f-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 16:56:29 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB10413.eurprd03.prod.outlook.com (2603:10a6:10:52e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 14:56:26 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 14:56:26 +0000
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
X-Inumbo-ID: d0ee41f3-9a1f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBlVll8drYavLzFXW8fAiJE0GQwPEjCuw15QrLBU/EGnUCFU/IrM+do1+2d0GTuxtO6uNv+gQrhocC4O6KJIqlHqoluZ+BcwcMbb+5izU6GA403VEwh0rcFBw6xAtrIwmzG01g03aFiVzCGPiYR6wbl9yrXBRIEz+dNRto0Uzd/Lhd2NRTcQVvn7xp2FiFgTzr+YIwJJU2F2OA51W6yd9MvtHqH17071iUbJjhzBhV2kp/Y364OV55K72koRarO0/paWWl7WVnKQc0x+tgiR7JjCgswjk9kfqYXSRsJ/qi9qoKfoZOspzbW9NWKgQB50b3OTyKmTfZNHKiqP1mPUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5oC2vy5mX8U9cZ4g5E3ajLBRuHTbUitpl+oGK5+iJ0=;
 b=NX74nu4lsV1zXx2NLgFxLLku9da4w3JTdmCil3HfnRjDRMyeOvSdpEN9di+wa7PDBnJnSCJVlWwjHz1mvr8RfpI5/YlkXVglyINiqf8jBd0+Xt7lbt4BqtshRfu3Rdj7bu8Cqus97UKYAM11H17PxMfi1xRWLRYH13prrlxzaMdmur3Fu2s+yIo0Q0uXstNlFn8YznvvKTuB2mANdfcgEVibK2zxVWM3YN/4mR5jUcuiG0l3i5lBzG5EwWh34Qb90Rq58LfhmCUZAe4swNl4waNUrXwugW1TBq2KUGwyuEZoo2LOJzRmu1OvLck2sOFYD2iyPDi05fmKvnsZW1OgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5oC2vy5mX8U9cZ4g5E3ajLBRuHTbUitpl+oGK5+iJ0=;
 b=oKrNQlYMTU6haklBQ0NSXVnZzt8I+4hJpDz+IQcNHVxJPh1ZSHtD6j/Tl6IQe5CZyhKxrYDhhageo/1g20FKoQqA60cxRcdN8+P7F1jWdviMging69kvMgNwrkxPIQPvdkGoh/Wrg0Oy7/VW0rVFTvHo5jLKLmiqkrJOKVZSR1ihP8vqelES7ZEDZxwtv+Te+dP8UlyZFBG+ik8R05YVJTglU4hGpCDRRCZK0BmHkTZUy9euDiAnwMEne1bVfsj8miM5bAMsV2aFNs55/IzLVb2Bs0c3m1qs3B2iIDmEFRnn4vmj3Prfv2GjMjlu3/MS3yTxpx9xxDuQGbgjZ4S+8g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH v4] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHcLiyQ3fkFbkmvJUapaW4Nz2vAhw==
Date: Thu, 25 Sep 2025 14:56:25 +0000
Message-ID:
 <90d39f2050e6028a2fce494381ad0df76f49e541.1758812103.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB10413:EE_
x-ms-office365-filtering-correlation-id: 19aa59ee-5114-4f6a-975b-08ddfc43b361
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C154c+df67WzqnnAaPp2QcITYeTrR562RADajI2ehBZc/pCq14rG3d8sZQ?=
 =?iso-8859-1?Q?TUUX92P+DaZvXlnhWNPDlE5OO/5LjOeRf3phdMmvTM8Ksu4auaKzLcEsra?=
 =?iso-8859-1?Q?82vTroPVsGm/L4goUVaAPznhg7z8HdKKJ9846I+TveB3Q4qYvjpqB/R9rc?=
 =?iso-8859-1?Q?+JWZxrX4B4KlgpMmZp0oB+YFdnvQMgktRg38TSEvRNYCooNrX0aicLlITS?=
 =?iso-8859-1?Q?LySy+gGi45osHkVY715LiC50QxUWiqtqVZNyjp/Wz4HLPqfW4XTelPF6PM?=
 =?iso-8859-1?Q?n+CFsnpk0MwLhZ5oIJ8yA5USiRL9C1sIyVEsKYkBsPHHAuDifAim1fhp/c?=
 =?iso-8859-1?Q?qmHCbNDFQl8haEvqAxJRtfCGaYDvVcDdiKaXc47MP7jfZiNSRJt9xnF983?=
 =?iso-8859-1?Q?XFSNSjL9gJbPtLKtwcfIloDxO5aCA/tEGrlu04QNxLnk6XLLkXkRgUq5c9?=
 =?iso-8859-1?Q?/mhkuguUYiNUOWNDvk8tRj6extAfJZyiJhnYhgMG/pS+P2kHq3XcVln2Dg?=
 =?iso-8859-1?Q?x3jU1Xd19/m2AWWauceX9LqLby+juCw9SDeAww1SL23yVuG03epY+cU9B1?=
 =?iso-8859-1?Q?2+0KoQlu+1IPdV9x48i3Ary3dvykddYJ7PfiXeJSEc9PE9p8nTxsOGzhlJ?=
 =?iso-8859-1?Q?B3m9geJA6YZUhi5tmKFrfsm1be+HI7u6t48t3L/Yp8p9fjtJfgBSaIl0LN?=
 =?iso-8859-1?Q?wSQh+7SEQjzwBZscvU8R0mLz9IoDJHaAKbGF5AoxHJXxblOlnkfUVjwGna?=
 =?iso-8859-1?Q?9i19YqnvOnP9Tyeq3iby1aYwcW70AbYheg7fbjS1VgHWuLkFZjaXIzofNM?=
 =?iso-8859-1?Q?vaIaQ8bq/EIiW4NGz8phsL8FCUu3qIhUSGjWxQ3DLrGC2UJujRE0PM4D1J?=
 =?iso-8859-1?Q?xW9u5PgPTwR9jDFOthIIdmCKwEPI8MC+ud74r6ajK4qH2by3lJOG3lw3UB?=
 =?iso-8859-1?Q?mV8fTNESz6EauqbtpKHaQSqwBAt9rOvHSpFGTJta4tNPh23q6RBk2kpdZX?=
 =?iso-8859-1?Q?oNri70a4I4TAsY0/u+QrECjUsh04Syrnl0ouSwxD5oC0RROe6hJ8vCdu87?=
 =?iso-8859-1?Q?sE+84EF6z4zldxVPUZU4eF7mL/2ai3i/g5lWKfYE0tLyM4PrlYavPDUAag?=
 =?iso-8859-1?Q?HIT0H2JblulcbgR28YpqmnUj5mQb6I6CcBTZoZO6omCtmx/gv6L+cELPLX?=
 =?iso-8859-1?Q?ywdlWn1U2SnS/ET+IrcmfBvJiB1EZRnSTFmhPWwAwiPJfdzJ9n4WsVoWzp?=
 =?iso-8859-1?Q?usa/SH5SqiMLCn2mm8ljZO4uHrYnHE6ASvIInjevdkyJi0S4QWFbX33bvB?=
 =?iso-8859-1?Q?YzkUwE3xH/0SMl1vyRHW06DJdBD9wg8s4BjnHNsCCfjf0ZZNccaxcfD5rr?=
 =?iso-8859-1?Q?hTdsplBZmxEVUy86NIMKBDnxIyCtGiTs67TOfCppwIPScQNRCDmDyqS4H3?=
 =?iso-8859-1?Q?fpPx76HOs4Xyd1l9CIR4HCotlUJmkX4UqIK9Z7BCR41ly75SdX5ojNm9JR?=
 =?iso-8859-1?Q?A9NBsiY9i9lrkd+q/P+wYfQHtAlZ69l3cRsDA64vZKjiPLF+W2dnAgCAhD?=
 =?iso-8859-1?Q?39KDZcM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?unj9PGgthznzvE72eV9cPhhl9F1tzCf+llf4HFEjQCqTp7zFlgPCdlhArx?=
 =?iso-8859-1?Q?4TVsQB90C1Lxotp5oV5tegW8UCq3+gCDW95KZ1U1DaTPrRGGjnY8Ej+bil?=
 =?iso-8859-1?Q?uY+RIHdafMcERdMK8bHVkMO4hyr8Or9k0DT3Qd8DDwChNgXN3pOKXLYucv?=
 =?iso-8859-1?Q?9EQiI7bRHd6jpdy/fcHYh4aLL8Wcctv0K1XtB1KABojcV2+cHP7glgGtPi?=
 =?iso-8859-1?Q?eD9dDxFK1i4igFqEVJFrJ/4pA9teNnbkSkIxBznGm+41bNvQo0wGQCJgqg?=
 =?iso-8859-1?Q?aZ1rR9YcE9G0LNWW23uZAXaQUBqXN1tT/RTHX08OW6hM++J4znJmVCnmMu?=
 =?iso-8859-1?Q?gA+tt80jRKTlCbTpgY9l7nf3Ap2KS4LHRTYU7jXhtv+ckm/p1nLOhlpukp?=
 =?iso-8859-1?Q?Hc8+fMGOu90s9km9Yk7Y/ZY6Y5ZUoKe+f17HhgFfgEYn9AHElDvRVWFMxG?=
 =?iso-8859-1?Q?PPMowI5KxoPKMDb4dDDi1dsVHB8HI82L2vIonQxqBrpb03BzuxlVhrvYpk?=
 =?iso-8859-1?Q?TH75ngWLxw1m6Nog91Zk32lF95w8iVfK0wU1elpdxkO8rUztht1SP6HVo/?=
 =?iso-8859-1?Q?TZt2mnSZ4XQ583eeWtumCt0XCcOjQOG9fSvf6xBO7AflW9LHSu0ts5gA4r?=
 =?iso-8859-1?Q?HrxjKgnxc/y+02bU1ndB3pu5Y2mGgysKL4DhIdZGg14gnQnw9xaeJfjG0N?=
 =?iso-8859-1?Q?KfxAApMTH+oVBVWskpxiFRMkm9x4P3lGMnwZou1Xadt0hapg/J2IxWkD3h?=
 =?iso-8859-1?Q?H5QjNBLsKsVeBo+iWeMaUrvjgdch1oblbphRrySqxKNNktfMsqXqKST4WY?=
 =?iso-8859-1?Q?mh7F8ombKYcXWgXc5RBpzAsDGCZn87+cK4fQ3KEPOcxw58bytni4/7hTlo?=
 =?iso-8859-1?Q?f6Gqx7SjCo0i1hLTiM35dnNOE6PcLaDQG8M+1/5Rc8ZwrOKPgiCqQgjhhC?=
 =?iso-8859-1?Q?UI/u3P86s8rK+YaYbZR4/St/9wBFwNAgIpSh0IMJOdIMmfeeS9laT3+iRt?=
 =?iso-8859-1?Q?QfCaSY1wYvgJsqVHm5is/FJtO5aSJVHRR15eITlk90EmgHULvuOp38yi7A?=
 =?iso-8859-1?Q?IHX3L5C7RGLhoU3YOp2CjmvgbXh7jwkI8p6JHpudGMChwSFd6rKJ8Ds/w1?=
 =?iso-8859-1?Q?6d6RqtwM6dHfEwBNwbWX5bHweLwutpsWkdtfiIhh3ozQ9yvlqWHwFMA7Zm?=
 =?iso-8859-1?Q?1pwOS7LNZ3crIPsJkZkn00xatqfrNTa+zcysc5q+Q1/LHhteutAV8VbuUf?=
 =?iso-8859-1?Q?uUWOOcB8RcVKtklbY6gUe1935SUTHQp1uMMrfQ5ZROGWsh6Z3CjVzsmupb?=
 =?iso-8859-1?Q?zRZivLPgt6ESLIdMNoPSvnHC7hLjcwqDC7zMR4aw7AoDU8iE96xGqXgQ89?=
 =?iso-8859-1?Q?lQtEC/SyIefKphUQGVRJmhFi5XQksmXLEJaUPLMy9pSPwWynp5rcPXUEdR?=
 =?iso-8859-1?Q?0X+QjyF1eaj72eH3dYp1chBz7ILluqyD9T7Lu7r2G/S6PAptBHBG0Tbz8P?=
 =?iso-8859-1?Q?iF4qhmWzvwBVaEHIFe4kDFmYrzph4ER57GyZ+gSY0k9l1i1yH0Jh6+lcND?=
 =?iso-8859-1?Q?JqUHpBvHV3UfZ5A7PzBwUjxNGXBlo9U9zFjnv1lghZMc8PPNHcVX0eDPJH?=
 =?iso-8859-1?Q?1gxy+Djral7B72k0yfUPbWl4ZZOqBNzfY02vdrwa9l1dNQc+ArHpYvXQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19aa59ee-5114-4f6a-975b-08ddfc43b361
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 14:56:25.8980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5orOyEoWGMGsvRu+TODtjoi1edqoTpqwEfRjObKTUMdlVsGVxA8RxSmSeGedg4uC2wDQ6FeoXwPmPKFShLcHOfj4Dj4GZfLZlBX8/UobRns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10413

This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
allow for building Xen without support for booting a regular domain (Dom0).
This functionality is primarily intended for the ARM architecture.

A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
default for ARM and X86 architecture. This symbol signifies that an
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

Changes in v4:
- change Misra rule to 2.1 from 2.2 in description
- remove extra dependencies for ARM architecture from DOM0_BOOT
- rephrase DOM0_BOOT help by adding hyperlaunch
- DOM0_BOOT is not mandatory for x86 architecture

Changes in v3:
- rephrase error message when dom0less mode wasn't detected while dom0
is disabled.
- rephrase help message for DOM0_BOOT config option
- update DOM0_BOOT dependencies for X86

Changes in v2:
- decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
suggested in ML) because in this case HAS_DOM0LESS should be renamed
either.
- fix order of HAS_DOM0 config parameter
- add HAS_DOM0 option to x86 architecture.

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

MISRA C:2012  Rule 2.1: "A project shall not contain unreachable code"

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
 xen/arch/x86/Kconfig        |  1 +
 xen/common/Kconfig          | 12 ++++++++++++
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..336b2ed242 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_DOM0
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..62602afc78 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -42,8 +42,10 @@
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
@@ -104,6 +106,7 @@ int __init parse_arch_dom0_param(const char *s, const c=
har *e)
  */
 #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
=20
+#ifdef CONFIG_DOM0_BOOT
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus =3D=3D 0 )
@@ -116,6 +119,7 @@ unsigned int __init dom0_max_vcpus(void)
=20
     return opt_dom0_max_vcpus;
 }
+#endif
=20
 /*
  * Insert the given pages into a memory bank, banks are ordered by address=
.
@@ -1962,6 +1966,7 @@ int __init construct_domain(struct domain *d, struct =
kernel_info *kinfo)
     return 0;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo =3D KERNEL_INFO_INIT;
@@ -1993,6 +1998,7 @@ static int __init construct_dom0(struct domain *d)
=20
     return construct_hwdom(&kinfo, NULL);
 }
+#endif
=20
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
@@ -2046,6 +2052,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
     return construct_domain(d, kinfo);
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 void __init create_dom0(void)
 {
     struct domain *dom0;
@@ -2103,6 +2110,7 @@ void __init create_dom0(void)
=20
     set_xs_domain(dom0);
 }
+#endif /* CONFIG_DOM0_BOOT */
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7ad870e382..fbb290df60 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -481,12 +481,18 @@ void asmlinkage __init noreturn start_xen(unsigned lo=
ng fdt_paddr)
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
+            panic("Neither dom0 nor dom0less mode was detected, aborting\n=
");
+    }
     if ( acpi_disabled )
     {
         create_domUs();
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 3f0f3a0f3a..2aeb361c63 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -18,6 +18,7 @@ config X86
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
+	select HAS_DOM0
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f..5115f0ede8 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -26,6 +26,15 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
=20
+config DOM0_BOOT
+	bool "Dom0 boot support" if EXPERT && !X86
+	default y
+	depends on HAS_DOM0
+	help
+	  Dom0 boot support enables Xen to boot to the all-powerful domain (Dom0)=
.
+	  If this isn't enabled Xen is expected to boot in dom0less/hyperlaunch
+	  mode only. Note: This option is mandatory for X86 architecture.
+
 config DOMAIN_BUILD_HELPERS
 	bool
=20
@@ -125,6 +134,9 @@ config HAS_DEVICE_TREE_DISCOVERY
 	bool
 	select DEVICE_TREE_PARSE
=20
+config HAS_DOM0
+	bool
+
 config HAS_DOM0LESS
 	bool
=20
--=20
2.34.1

