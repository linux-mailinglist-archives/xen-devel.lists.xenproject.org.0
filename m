Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFUcOOm3zmmTpgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 20:39:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4151738D437
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 20:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272334.1560051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8MwC-0000SF-G2; Thu, 02 Apr 2026 18:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272334.1560051; Thu, 02 Apr 2026 18:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8MwC-0000Qo-DK; Thu, 02 Apr 2026 18:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1272334;
 Thu, 02 Apr 2026 18:38:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w8MwA-0000Qa-PX
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 18:38:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8MwA-002vpY-5y
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 20:38:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ceb7ae-5cb7-0a2a0a5109dd-0a2a4509c00e-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 20:38:38 +0200
Received: from [52.101.83.140]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ceb7ad-bf79-0a2a45090019-3465538c3268-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 20:38:38 +0200
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by PAVPR03MB9408.eurprd03.prod.outlook.com
 (2603:10a6:102:307::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 18:38:35 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 18:38:35 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9gIPlxvCp1zTRpNxVpdIIv0hZ1WXGQ2nvOGc1MrtTF2jgq6qQpkf+CTt+1YvXtYAG+wOeiXmeEjSSYq6RoWXEPuy/qZ6iwLp3AIg17ZMXJXLvkn5lCAQ1AvxgEIykHKqNbHo2cl6DxlOJo14QacmNUxNEK4aCqmsjuOAXgiz+R25Wb7V8fXW/pVySNOW7Ag9nCIqeDcfCHyCAUGpZDjuenqiZAhQmVduoS3EQ3Zj7ZUHYaz9zFVcsB7I7NVL4O/h7921roJEdmZoXeP5T+xVLrqjKCZpD9ZrMwvy5m8Ydn29PxBuHeo5uc4O4oJwVnrhnuRFH0lGjgeF1eay5SJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yXz7rfI4PY70kRbzfvSDIjlUz3zdZiB6oYj3pBrM1E=;
 b=Qn5aB7yYin9znS1typM4QGLlnIVRnxJk9fslCN4irNDPOjqMVsMpdA4mYcRcpPZJNwGZ5BIz56+7iosJQkYx9FdhuhJ0QUTRppuZDYxL8JP6alouHeaDcCr9X+phGeH2Kmp1aKeIpit0n3fKgUVmHz5iha++NFsWpjYHSaKMz0007eCsuTm9NJNv6seu3ZgzenyTPCY7DLQtJHbIobOzM7uvd4y28ew9fOiU77okN9lHNuUGvZaFvJyVYInFgJL0N9PtwynEemPAAb0oZI+HH7b/jouFjpGPKPINgA+BFva8NMq/EkwaG1ysz1AG4uif5Fg0iObb+8ulJnKDzcUEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yXz7rfI4PY70kRbzfvSDIjlUz3zdZiB6oYj3pBrM1E=;
 b=HJZjQlZinVrWadmtCHtqIDba4pKXx+aeAp+4IKeqrfKY7MbERwOZlC6S4tdyUi9i3z5EQw+JATRnzwQv2gc53uHTihlylN8xHn/cVm9pKQlKxqgBaQb11bIU8v9gFyeqNX1J/kPj9I0tsIQ7kstyePdH+J2o9uuBVn9t0GnvrYhnprpa7flvaGtJ3Wtc+b36m+s4XI4bTYCUU1OwEBskufZqG2TtwhY8HPrrKTsOOJT10tqxoI8tlL7tDPjYzMSHceyUEdyTYCZL2gq6aPmmEgV0Gfsfs0rjB7XthMfFiTBtVlY6d1Gmd2D7THfLO3XnTwwADXVyzwP5Mhl0m9zBhA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [PATCH V2] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Topic: [PATCH V2] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Index: AQHcws/qu0Bt5vsAHEqQEICE62xUmQ==
Date: Thu, 2 Apr 2026 18:38:35 +0000
Message-ID: <20260402183834.3660003-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|PAVPR03MB9408:EE_
x-ms-office365-filtering-correlation-id: 664bf726-6373-48e6-7918-08de90e70cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 025p32btwj6Pa9Ga/+IM9sLpqowj2IqS3RgadJn75NnzXnebwI7tgb2Ix/CJRtyQ5y5/vofN0WZAHXDxMAESfS0nrndBJs0ze4vHFYPRYQzmDVmHGOElMfBOuIy3FZYUG+Ro39zrZ6yK2OZdRYVk+ryy+d6IQ6CJt+Ghzt5P82ZCYHFcDGeuLpy6Es2kPijJWwM9d6ws+9CPwzZerHadrcl23ads+V5hDv+onOCVm9kmfJyjE1CdCii6BI2rToPN/OgA+dBjbfj1lU1tFD7jGnzBh5USIsjqU1Iz0EHUrdJZLVNkWToSb4Eujat8F1sAhLrmAxgIC6ej+sOIROjX2C3p5u/nGFZB/6z+F5dwmrp1Dm/rFzHS/ctZlJUzhALYyXPu7GXZ9zJuaHjaz+Kf4EvsHMFYR3Wo2iucvQYr0kWf6bY4O42QxBCqybdF1BDcTUdDFrp2sio+y+uuGO9B1wbT+sh+BhuSsrMytRzE2A+OPwWx/qm8B4cwrruo/R5Eclrl5o5+rXUVtjk8halrdejF5MmWKsjMGXY2Ogv2Rps8rJwH5qFzzbmJpNlkDeGW6S0/37fqDAGPvGj1rAIDF5A6O2TiUoAChpsa5bMHz4GqvKH6PQkFGWR2gohoDLToOyn/2P2fBtfIjojNGLDzuIqZY2DfCfL56mzj+Dqvb5Aecfct4wIyx10YVnDJSg0IoiYohF1IkEcISnpHUo6MDLK5gZWsmS0j/cbydgaRIYg3eDcAyMK6AhPvr0SmefXaewDbPFYwHB8U1m+Ppf1w2wr5X54Rj+d6VxPTDBfBNtI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WrJ56VkQCFUmTQH9aGnbiReplAGa4xxw7mZqKYJUy8mW2dgmqXpB5doQzS?=
 =?iso-8859-1?Q?fTDHTsQNwm0KrWbV6SwCO39477WMxRGGp+xUYmmiNEsJFjEc4a3+c8gpyc?=
 =?iso-8859-1?Q?NwZPxS6ZuKl1ym6SIkIvyL81dxnhajWVCpgY1XOfO55Cpu5GF/1daoFWJ2?=
 =?iso-8859-1?Q?2fqfZAVaGsZQ8aDCm3c8aQpiJiXtMayV4gtzMWYyLGQsr+GVzlmfUzyq38?=
 =?iso-8859-1?Q?LDqj5rfZsQiyDaneXSV3QaVBdizYwT7FPQ/AR9B2vi6ozWEEz5LPEyUDC2?=
 =?iso-8859-1?Q?TVfT8r5hNjl9v2eyxr82l8GkP9a5OtmTCHU+QeR2dCv0u7V0hv3r2K7Ti4?=
 =?iso-8859-1?Q?YtYY3w9QWqEiAsS+UVdkEJZdU4VG3Og8s5u8epgSGVScnpgAZfwy5FVpxw?=
 =?iso-8859-1?Q?EwBTeaqOTA7kRwjTCcJ5ccw2iXtBFJkqad/91qG59Kbm+PYZyFFKTktYmE?=
 =?iso-8859-1?Q?aok6XXq7fuV0nE4e+9ddAn0a3Qly/yJuJ0h8zutnjQ4og7BCw1SUlP9RO8?=
 =?iso-8859-1?Q?NJvWTZNFEfJWeT3Zh+4qL/NggTJAK5jv0u5pm9Aj8Qb1LG5VdADWWa3o1Z?=
 =?iso-8859-1?Q?odc+1aOk3olavkOKxQE4QHHf2lHYczJyjYSo5NS4+3KGB0zD4fMyIpT14P?=
 =?iso-8859-1?Q?QWVRFBNFDs10oVXkqpicXMwaDpZkhoP4KYcHj0WTSI6DP6bmUGe5qubAc9?=
 =?iso-8859-1?Q?Jp/KjXokwJMm66KhQ90JLjc1PDnwfUA6aPPnog5Q2KJmejnPOZG69oxLed?=
 =?iso-8859-1?Q?SZAS+EOFvbvcCn/Ockxk46Vnf+X7OED3Nyd7LCuiJGhcyiktAOO6f+33Od?=
 =?iso-8859-1?Q?MQTKwL/17lNfO75TqJ7866e6Jg7e+8/Qq1bP6AeDKhSXDo5lI07AhLx26H?=
 =?iso-8859-1?Q?DnBotQdEY8rhcTYPVKJgQTe40u6LpzK4+xNUr5bA16qkG8p5iDt693pys5?=
 =?iso-8859-1?Q?GiCnMkGkNbC7Z6V4Sjax46IbsZ8L6HygIGDtE9zszZCBTev0F4fG/purdQ?=
 =?iso-8859-1?Q?eo09ih8Ftr1P7w8u+dQSyytsebQMVJ5MLy2ZFGzhcIWzb6mRA+cn8A/Xkm?=
 =?iso-8859-1?Q?+RM4pc2ehyc6F2PKvx5gYQfeO9rzKhSumbd200Iz2RbJPnUnAOic3+5MSJ?=
 =?iso-8859-1?Q?9sdfg48IUCa83QHP62d2S99hQau8GWERjYuAFnKrMrJQKdBh4euH/NK02H?=
 =?iso-8859-1?Q?smlqbnHci4ZmiGNMrtSacEizOtHuFmiBpr6fMU4gIZukt6PHqi+EA+aYMZ?=
 =?iso-8859-1?Q?TViVCovRc5s4E6MAdPd9yjL3RZPyyJVemL4LR3gKiS4NrD/oRuGJrDxDWd?=
 =?iso-8859-1?Q?ghxEO+qygTjq/sqTBLNAhlmecKtfyasZsUE0vT3eGQsmlOvEg0vvbDMct9?=
 =?iso-8859-1?Q?Ukxy4HcT4qBKiK5CQmsXbQ1WmHV/8vda7oYhHbOiFoneb7YRM13X3bKpSW?=
 =?iso-8859-1?Q?mh3NUN6NN23gwxCrsInH1vqLKwNt+5E2GJsVrqldrnWTW2BwkL1AHeN7YO?=
 =?iso-8859-1?Q?dNmHixNr77kamUhDStjzQzYd2aI0a2ecauHtJrE4q7p3XvxZMziZnrUxh7?=
 =?iso-8859-1?Q?aPvjFb/Zv35TEriwW1/FuHTBehMQeRaMrg6MUC87jDslrQBcCykEUyiR3l?=
 =?iso-8859-1?Q?nYsV4OTIk0HEbhmrzIDkmerxIpAVQ2XcX1aK66ndmGcFvuHvekBuR+mIJN?=
 =?iso-8859-1?Q?JepyygjnF0FxnrqtZvhMkBzpwdDx/nwBvRoQZM2gVhkaWa3jsd+1NmuLiu?=
 =?iso-8859-1?Q?kPm0yzhl01AqjIKmg7J0dxnomNNbAYNKfAitiHbGWM6sl+AbTai2DXM9EC?=
 =?iso-8859-1?Q?vkRwf3hK5aFjfPEuVTrbCGExtjC4IJ8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664bf726-6373-48e6-7918-08de90e70cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 18:38:35.7281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1MM2j5L5EK1Kk9cHeC9CiPF/LRCykjsOmvA1LrBJyodECzHP5+de3BeH6J5cdTOaj7gvUk2EbY4l54S07F0J1aGzogoT6uBx81+kTEsnmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9408
X-purgate-ID: tlsNG-bad1c0/1775155118-2DD57152-E3D40AC0/0/0
X-purgate-type: clean
X-purgate-size: 2949
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:ayankuma@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4151738D437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When building Xen with CONFIG_STATIC_SHM=3Dn, booting a hardware
domain with exactly NR_MEM_BANKS (256) reserved-memory regions
causes a panic:

(XEN) Xen BUG at common/device-tree/domain-build.c:497
(XEN) Xen call trace:
(XEN)    [<00000a0000289aa8>] make_memory_node+0x178/0x234 (PC)

This occurs due to an off-by-one error in the bounds checking of
the reg array in make_memory_node(). The check:
    BUG_ON(nr_cells >=3D ARRAY_SIZE(reg));
incorrectly triggers when the array is exactly full (i.e., when
nr_cells =3D=3D ARRAY_SIZE(reg)), preventing the 256th and final valid
memory region from being written.

When CONFIG_STATIC_SHM=3Dy, this bug is usually hidden because
DT_MEM_NODE_REG_RANGE_SIZE adds extra space for SHM banks.
This extra capacity prevents the array from reaching its
maximum limit while processing the 256th memory region.
However, if a domain is configured with exactly NR_MEM_BANKS
and NR_SHMEM_BANKS, the array will completely fill up and trigger
the same panic.

Fix this by changing the condition to strictly greater than (>).
Apply the exact same fix to shm_mem_node_fill_reg_range() to
prevent the same error.

Fixes: cd8015b634b0 ("ARM/dom0: Avoid using a variable length array in make=
_memory_node()")
Fixes: 7846f7699fea ("xen/arm: List static shared memory regions as /memory=
 nodes")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
  V2:
   - slightly update commit desc (according to Michal's remark)
   - add Fixes tags
   - add R-b tag
---
---
 xen/common/device-tree/domain-build.c | 2 +-
 xen/common/device-tree/static-shmem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree=
/domain-build.c
index 6708c9dd66..540627b74e 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -494,7 +494,7 @@ int __init make_memory_node(const struct kernel_info *k=
info, int addrcells,
             continue;
=20
         nr_cells +=3D reg_size;
-        BUG_ON(nr_cells >=3D ARRAY_SIZE(reg));
+        BUG_ON(nr_cells > ARRAY_SIZE(reg));
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
=20
diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree=
/static-shmem.c
index 79f23caa77..4c4cc1b123 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -838,7 +838,7 @@ void __init shm_mem_node_fill_reg_range(const struct ke=
rnel_info *kinfo,
         paddr_t size =3D mem->bank[i].size;
=20
         *nr_cells +=3D addrcells + sizecells;
-        BUG_ON(*nr_cells >=3D DT_MEM_NODE_REG_RANGE_SIZE);
+        BUG_ON(*nr_cells > DT_MEM_NODE_REG_RANGE_SIZE);
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
 }
--=20
2.34.1

