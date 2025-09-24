Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41045B9ACD7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 18:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129582.1469485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RvO-00081n-GY; Wed, 24 Sep 2025 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129582.1469485; Wed, 24 Sep 2025 16:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RvO-0007zg-Dt; Wed, 24 Sep 2025 16:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1129582;
 Wed, 24 Sep 2025 16:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu40=4D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v1RvN-0007za-6E
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 16:00:57 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a789ab13-995f-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 18:00:56 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GV1PR03MB10453.eurprd03.prod.outlook.com (2603:10a6:150:163::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 16:00:53 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 16:00:53 +0000
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
X-Inumbo-ID: a789ab13-995f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJTIlWxu12hXT+RvTs8/k8wK1eA13fDC2ZbMfj3Lat+JhAL7uSwQD70uACvaAAqkMOOFZaMPdXQWnffrPgXHj3fTs3Ie6OvmfRTB9irZ9mak36yMtn8vZdCZn0TWdKD3k29F7uzu/TlvpUdp+h29XxT6/Bw6KivBuofu0lSnckadLnGZHsSzLI5usaZ56LntuWKrQvy0VZOIN5SqECNi0htd0vjlD8dQE+Rrx4R4o0+sWgZKnwc0yCdQWz4MX/hkPpIQOYseWlCusYEco8nJFGz4323IKn7uzbzOgOkiaVObBY3nBv+HThHq7bQUKN5z7HE3taa9UesMur+3bYcNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXHkDLEcQEJEL5AkDvPJQb/6BZVPIsiemLYpoWTK8+0=;
 b=C8ChghN7LEn8PjTwkKz/QvQB24qNlpUPzUZZxEn9UiGhdoaZsi7r/NyUbybNqG7t4s77eTx6c16RT+m/xHPxjtVCy/8y6uPl84yZ1ZjakK6JpPhtpwUP8JLoGu8AN+B+pAvuBiQNdMiQ6kkqk/c3t6YEa1sBpYsfPFFLoj8CcJmamLQgGTfa2yDhtgSFG60pw4mRjYls1CHl3EQbySKm28OTSdQfVrmo6xd38fMHsqi+9D4GjxZr6noJvvJS5otl4eZwP2pOofKKS/jxMNCLvTsFzqNu5M7xCC1PvqQYpKT0hI2orY78vF6KXGA/nsOhd/xgDABii0npBeA+YYIIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXHkDLEcQEJEL5AkDvPJQb/6BZVPIsiemLYpoWTK8+0=;
 b=op2TftCtNV2Lquwwzs0J5M7N4E6aC7Az85Zd6ceeP20xx8FrovrzLZtPSmJneB7ZWeA3c3ipkQHXdVxalsE/W/v28gzwJgdpPllBgs/G6jGZs89b6RuqACgH6ljO4Cc6xTXN7fnb8QDZVBDUyU8qy5cfYPoChEKyZakuwAHySrJMfO8GkJ/ZWj3unB4/WcAUCg/0YvnE62jjwh0ng0kIp4CBgJHMHwK2woKs9CmjNtjSdZ1KZA33FRzSpHp6wcufzaPIxMvT+oS1GfQYyBi7xij/AFyDset6c5yybGggXY/CeG1bMIAuqK9fS6NnPcQbzTGs9a2RouH67T/xqyA0Zw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHcLWxn561sYuCM3E640/FLnKWxSg==
Date: Wed, 24 Sep 2025 16:00:53 +0000
Message-ID:
 <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GV1PR03MB10453:EE_
x-ms-office365-filtering-correlation-id: 6018e314-4e63-487e-fdc3-08ddfb838a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d8htwbVIUud8iCzIQS+l1O15JYtQWm9LLGeS0aWNBaHdQor/wBKu1gIlHz?=
 =?iso-8859-1?Q?J1a+eI7b164cu69aOz7jliNYlb47lKO2kZXWzW9OLqapwbA/4785b8dgVQ?=
 =?iso-8859-1?Q?5b4VeLcZGq/p1f9QEFC1MZcRP/uUH06xPoY1R0AyFiMoP6EoKtmX0P0JHC?=
 =?iso-8859-1?Q?E5ctyCLSL5M5ZEetYZNS7npW2mMrhfdvd2hKbgm5wJZwoaahFVQOmAEDyt?=
 =?iso-8859-1?Q?/vOh7ddO0jqo+hHkrlMsusTXKCOHXxTG7iWFTGG4j5HEJrN9OdZzcPv1k0?=
 =?iso-8859-1?Q?FkcdKhfjTyRSfIyFnNZNA5QI1QhKkhz6NrQzn3qj+GxrmBdY+8LOlYFInx?=
 =?iso-8859-1?Q?C3w3M0qlXyOJCkIWv9pQGU1SdKxH9HWTgrKor+K0CEY6Nt2yAToaFdpJAz?=
 =?iso-8859-1?Q?8feWNi5Ijg5dBE2yk0Lh2ey5IJvzlpr0Wo/+mBjASWSxklbbsme8wgAwgB?=
 =?iso-8859-1?Q?U1cNemiP5RJVTxveGH7GTvfjjmkZfqrqtiHemNqxeRWmNeNw2kwzCP9QSs?=
 =?iso-8859-1?Q?hFNGvAz/ci9hdd4sN9UGHHx0rIkvUcr+GGdkqBUo6y8tKjxoRp6Gg/Y6j4?=
 =?iso-8859-1?Q?OfF1RyXmdUt3CEbLPc1bvViTd+f8tfcu/umHah8Qz2MSFfDJQwWpI0DeTx?=
 =?iso-8859-1?Q?m+uWtiqMlj0uzrtdxyJ/Isvw0mVp0q/SAMtXZinetclIsy8NTFhLHRcrLX?=
 =?iso-8859-1?Q?h9WdxxxipMTFYeNWXLRv/dePeLA9SYxgHiSVS6WyCm724adXVNYTCwYSE4?=
 =?iso-8859-1?Q?72FHDw73rHoE4XqXhpZci1QDOBgz3ab1FVQSp0yeIKzkd8usB/7TzR5qLB?=
 =?iso-8859-1?Q?h7OPF4HR7C4sZG/Qw4H+vbxOpFMe7owka+lTsOm0Wj3YS7TLFk2jhRxMF6?=
 =?iso-8859-1?Q?sVW1fz7pv39d1vf9Gf72qslF/s+s1oymGEr7szv3P185rGGYXZbDG76hF7?=
 =?iso-8859-1?Q?0wf2vIALJSAuQwCfx3vYkgRuPyE3tQAGjrSGFq83bXRUe/BqjYmqBUfST7?=
 =?iso-8859-1?Q?hkCjcgJ6vzx6Vw62+zGGw5LrmlrK+OgFUaxzYK6ImzUeJHNXoM/JHIqIok?=
 =?iso-8859-1?Q?EqeqZWXUC7YSQ+ebDX4DcwMWwn5hWeuZeLvEjfmKkJcvqhrQYDnJdRUwox?=
 =?iso-8859-1?Q?EuSwB2njx47ReFFlXRIyLb4vTr/iEnO7luVYORmPClUbgbyNASiSm9AGo2?=
 =?iso-8859-1?Q?jr4oVVe0TXluW3z5m8gRlqCXkDse9FLgD2AQz4VS11xWH/+9NZ+QB2PXfo?=
 =?iso-8859-1?Q?ErJQXJGcIzkun0YpJoqCptyLriJ/1TdmbQGiBk2okMnfvkKWPzHMct0B0v?=
 =?iso-8859-1?Q?E6iUJJOlGWCjLwKoVfpjyk3Hi8CPq0PHZk2MKCl/yZlTi88uKy/EnzdIzf?=
 =?iso-8859-1?Q?A99hwAVyRocwgKl3PBbKM+SCesYCphi4LheleJRDwS183WVjFI7vVXcFZp?=
 =?iso-8859-1?Q?j5uq52rZUxvi9wFoGEdCNVFu5AVFcSyhEsfxFUtxKBKkp3pzpQbh98dDAm?=
 =?iso-8859-1?Q?2R9+goSw6hZYU0MiDK4z3NK5NMCUbNDZrwuLRoHRoChsZ9RlvVgqcoSAbm?=
 =?iso-8859-1?Q?OYHBBtI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KHe+trvAXEhJXnWwvJYYyCuz5dk2o+QpSr0VUTvBbd+9l3w2TDSWqZBrvf?=
 =?iso-8859-1?Q?G61NNNP3PWiWEb/u+K6IVoBdf0nauhZKAhknFw9yc60eHM2hjyC+a3Xowm?=
 =?iso-8859-1?Q?TTqlvXcmbpBR7eHV4fWxFZIZRXUfQnXAg3yBuhf76m7Ezs87+Ofaq7edHb?=
 =?iso-8859-1?Q?G9WvMVrNzeiQUbkJW1aC44D5nQ5NZHpkRAAZBW6OQFYvyiFc9HS1yoTVtf?=
 =?iso-8859-1?Q?TUN2u8zBeKi8AfX1sLWAaa94SKAeDaep0ULZev2K3JDENLJLCTsyh2ge9/?=
 =?iso-8859-1?Q?fQdwyMkQeWEw7Z9cID6ABM6QiLCtOptq3FX7qWkxS3nUyQf9KOYjQOcLvA?=
 =?iso-8859-1?Q?DJgzQ5J8tXZmjn2NVmlCwfAqx0iTso5bKPi23Wjan+K7TrxxhyEWoxXxTR?=
 =?iso-8859-1?Q?qYFlzLx5aOyOgDKo9HLu2foZ9EdbHlZJTBAcmXRgIDMcyCtLUnldQs8saD?=
 =?iso-8859-1?Q?6l4PvZzybLJN1z5kFddFF3CcKQ7gmW8wK1hlXeXbFKx6et1de1XHIrpY0G?=
 =?iso-8859-1?Q?i5X/i6+vqG0XhVgf7b2jbgp2jFfqAqNapnWFQabfe6z7vm50N1F+sc39+t?=
 =?iso-8859-1?Q?fv3VWGXx7VhQgWE4KTVLFQ59l4lExj0id1h1Gp4U6iI74TIKZbVLtEpCXK?=
 =?iso-8859-1?Q?7FqeckE5yJZK7TtikyLoKOYbzWjW9ybKCVTkSb3XMxdTdcqx20bG7ESF8K?=
 =?iso-8859-1?Q?WP019Y/QW3aF892Hc/Ksq4TAvEWSMa7GFarLZz1//uPDISUB6H4uHWBXLF?=
 =?iso-8859-1?Q?uETW5Ldd0H5l7Xyq91+H/j7zW7HfHNTOKnHKpQ5uCrOGowYm18/KsxsCVn?=
 =?iso-8859-1?Q?3VNDFO5WYi9UYLXjB3S8VHTitf69BocbjBuUpsbGRbBJmV+odlnUAwZ8UF?=
 =?iso-8859-1?Q?mD1iJ6Q0B0cSkLKIc1gKE7ywTMHexTu51wvCeU2lmwYjFTWK20uYklfKjD?=
 =?iso-8859-1?Q?FcT1IibCw1o8mgxN3bZDQRqij0I1uRPrgb1v0erIZixt+TZMmjJOG9d+Ef?=
 =?iso-8859-1?Q?kElCFnPqEc1OJ8FhsTWJAwa2+wxcJc3ZEsj41XBtR47MQpBSuVujKBwB1T?=
 =?iso-8859-1?Q?SzJOKmeIoaYBoGQ3aGVMOzQmnwwlHSGMwFzeXfkpFpYYjszAnnToyS79CQ?=
 =?iso-8859-1?Q?u8PDNfFvx0kvIwYWr83N5WhUOoTg7N1GBN46MN/JwI3/v3yqZzsQcQ9Yss?=
 =?iso-8859-1?Q?p7cJUb9UJGXNd5WdXDdl+XOjuU+TY2mzAuvAhL6oHW+Mx9LhzHRtw7TP3/?=
 =?iso-8859-1?Q?OW6HioBesDCGR24lbuCpBuXDB48L4l62bBXbujdpbC90qu5j6WVW6bz6Af?=
 =?iso-8859-1?Q?lZVTB9ECYNXxNcNEWiHZHh2nEWM9Bv1BKImwgUbo5G5P0P7QjQuuSqRjL4?=
 =?iso-8859-1?Q?teEO/GrF9lGxRwHE+2Ezu3v6Uk7XwZop/792yqG++j5jizlaoDuMQM43y6?=
 =?iso-8859-1?Q?9r8vJ6XnjxqulkEUEb8lFN62UF0zwrFUJDBw3bygWOC8rHf/rnyyOL3HfL?=
 =?iso-8859-1?Q?mZyEcYgsBGfYQt9IjrTRM2aoPK9qqwdTwYB1isqHvbGr75gVgRXz4hrQbX?=
 =?iso-8859-1?Q?7fIL/9YEEY2hkr0xnejUancKDOOQyX9dT/Yd62SqLKIehViwc914SktEVy?=
 =?iso-8859-1?Q?RtidE/XBJ5/G3ukLfKWI/YmEfUTuY3f0Rcd7EZJ3KeMX4eQBZxYf5HXA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6018e314-4e63-487e-fdc3-08ddfb838a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 16:00:53.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHuTIu6mGGZtVP9t4TmikZnQvEiFiWnpSIHWXjyOWi3z25K706InqlomuJ4+t5PfIAYgKBXzEsp/zb6K28q8O0MImsqB+wic5QbbkNtYpqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10453

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
 xen/arch/x86/Kconfig        |  1 +
 xen/common/Kconfig          | 11 +++++++++++
 5 files changed, 31 insertions(+), 4 deletions(-)

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
index 76f9ce705f..10a8fc8718 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -26,6 +26,14 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
=20
+config DOM0_BOOT
+	bool "Dom0 boot support" if EXPERT
+	default y
+	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_=
HELPERS) || (X86 && HAS_DOM0)
+	help
+	  Dom0 boot support enables Xen to boot to the all-powerful domain (Dom0)=
.
+	  If this isn't enabled Xen is expected to boot in dom0less mode only.
+
 config DOMAIN_BUILD_HELPERS
 	bool
=20
@@ -125,6 +133,9 @@ config HAS_DEVICE_TREE_DISCOVERY
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

