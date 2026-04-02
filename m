Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JQ6Mi1NzmmjmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:04:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4423880CA
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271712.1559784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fq5-0006zy-Qc; Thu, 02 Apr 2026 11:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271712.1559784; Thu, 02 Apr 2026 11:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fq5-0006yX-NP; Thu, 02 Apr 2026 11:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1271712;
 Thu, 02 Apr 2026 11:03:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w8Fq3-0006yR-J7
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:03:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Fq2-00En3k-KJ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:03:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ce4d13-bab6-0a2a0a5309dd-0a2a4509aba0-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:03:50 +0200
Received: from [52.101.69.107]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ce4d16-bf79-0a2a45090019-3465456be1bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:03:50 +0200
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AS8PR03MB6984.eurprd03.prod.outlook.com
 (2603:10a6:20b:29e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 11:03:48 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 11:03:48 +0000
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
 b=m8GMt58p7L9fxdS/EDVqGFAwBccm3YBNH23Qz2rHKWa/xJPbg9PbQ8bz5U4Omt5KjMmgJVLr246Kr/xVblBD9FI49ex6qIbqhOIsU+nCpx9YRyYoqUAuzY1oSYZU1vKUL+xMmh1hBm38aT2V/DncXFJVpLdpKJ8dcutyqcUVnWen08Cg61Xuluac6L+YmaYyO9NLnHM7PkgXM7E9w/ReLz9m+ZOPFoLKbB7SontHdR1STS3XTP7izptbTPvpiSu7uhvk47frx77to+nnP5/lCzN3oQ3HLWTqScLBnMcR53A/hA7eJU5g5KFsFe66JJZpfNHmOnc9JAV+rTVlR9rd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwecGfUgjnXcZt7A/fraa8cxaYLtuD5RKkI7VkYfn60=;
 b=TM+BMf6drXqiyIbvpmZ/4Rqr9outoLGP1GhQia7LKftql4UZy/J5QUHWT84IA5SGN9gy2tdkG9F6beQvkkGGRJedN3NigVsgo0oNxWYjzUYyU6u6FvfNhAFFYVwYPGATm/b9Dv5lbQRfjFxh5mg32TrUNB93SC1QQoghbAnxY9NxTeSPehBK269rZxJzA1uHYu6HE/nidSpj2AjYU4lyk9KEKZ+zEwSW6nTn5sgUi/RcuEpjcL8N9FQwenIR5bgNgh9UZOE7RUSWYLAFRUKMbo+xxUR/VGtPE7D9N/tyeJ7gPKQaHGvzzpFp6wL3u7anH79Au3p5Mry3bpTTdOM0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwecGfUgjnXcZt7A/fraa8cxaYLtuD5RKkI7VkYfn60=;
 b=mNpGMuMaPq+Y9VG0daCqFYuRpmdC2uhFFozmN97nNDufDnDaP/Tm69zvkFAmAfQUW4iDgsFgGevsDFXhTsP7+hOPybBYjlYMdY+NhamCEdlyaxChYuUONkttDoGmtS/B+CD8zVB7CUcMkk9Kq7FioryH0j//97in1Ge2BZt/q/3VpQt/KAxV2Ir6rTvViGEhVuhlpc9bBRefrXUd4k7hoO6/Rwl6akkhURTTHkSOfICsh2CfoRJWFojzWU7IgC61mm9YsfUpcD9XZYjnD5Cb/sPkFOtiUPOBisR/oZtCXy2w7Y03jELui66h0+YnMgonwu4hwbHa3zqnkO591emGLA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Topic: [PATCH] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Index: AQHcwpBhsnhldIRLa0qtQ6xVjLEK7A==
Date: Thu, 2 Apr 2026 11:03:48 +0000
Message-ID: <20260402110330.3580124-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AS8PR03MB6984:EE_
x-ms-office365-filtering-correlation-id: 2b5291b2-224d-4df2-2a23-08de90a7844f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 3H2wVMRbyQRS4Mfyspm/AXHTALQ9vwHtGBCUVqJbFfQjVyd2LEuDw9oMC+nEtrI/IcntCbhqDbCz6wwq4VQOQUxHuNaBmG70ZrkC9xLPDoKpkvOhWppmeciARsDuYGimilhEBDTzXAMecjEK5yTaYj1vO8VtyS+wxnC/JOkJNDmEvf1a0Bwk7mLbx//m65vkhjaJFlox5q7GDX96Cu98SOtPjZtkPFQ8M+t18rj11dwRkwhZCpabnZ8W8gvjllUM3lx1/u1wDvEGqige7yZ8nRG2XCaPkmI5ImdNU57Yv8goUKpKTyFRd+cgczEcQnkd6O1Sdej4/1jHI4h+uXu/FqFT1R0OVKmvNG8ro4Ygux6tL6eXTULjFa0whGzXcWLwG+sp5LP25HRzBSkw3ODC4TRYj6LBurQ6C1mdQWVU3gbjhHb1LkB6BvKx50mmEcQebHv0UxfMz6Ql87yPSZxRXgwwXkQte3z46hD30KHxJ0aYnLmVOyCb9YPnML1FmYmm6tJyXnPX+Na3qsySE8cWhGxUmcrMe0PlKsYtm7VJZGGgqWRVwVGbaO58TT5dyPd0CEUoRNlMkOkK3RHshy5oQHcRrO0AVp2JenWJlDpylFM2oy/xTQ18aI8R4HpkXdMFZvFY4RHAQBAY02LFXi6Nml1VMlNBDksBh2t/t+6kaSSNnIKcoAdPIta1Ytp4+3/GRD/7oeUXBngykR1OHoPZmOTzdEFJIfqkN765FgagPjpzmRveCfpCMM3mnATjpVTuCl1AJI84PtqXYEUNVP16X2AbZGnJ6ZM1jSxvmVCW9d4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SwGMDHxgyEpfmtBR0n3yaGMhxAcAhAKJ34fWugb1Nu9sDfnunKDAXbcU7R?=
 =?iso-8859-1?Q?oJm1QdYnei0C6ngndfi5bE5fouMdsVTfn4AYuGn6e9exqL2laIO/xTlnH/?=
 =?iso-8859-1?Q?jY1zRNV3fYFxle0xoWT7DIK36UZfO4TnuSLrh9r42TTkUZcMMoEu2bG6Nb?=
 =?iso-8859-1?Q?3bHC+Q3y0MSDs67pSGGk/k9NigSQ4H1CmBB+VXcFbBL5xVHJu8ycYjOrem?=
 =?iso-8859-1?Q?tBnTIVz4CcIGYT28snweKXsz3rVDvokpHhNfSBzMX6LsPjJQR/5jM0W+Ff?=
 =?iso-8859-1?Q?XKafT0tJhjzb0e+TSXTVFcLnd9vdq27dvTAOvr7iPIdQVOPwGDwYsc6MXe?=
 =?iso-8859-1?Q?slfwMo5YJCpIqgsL0qe/m66Xrr1JEuoUVzEmVFi1K5vaweyecu3/fJkhtV?=
 =?iso-8859-1?Q?OGE9kjpG+ET/pvP+eGZTlXHZzuzZZnAd33TmwZP/kmEcLH0CDt7/2ly3wx?=
 =?iso-8859-1?Q?Rgo+Mtn/9PEh7inVjP3ZfE+vq7LRTZrzaeuDe4r9pf1mdYoQ8P9AWyUKNb?=
 =?iso-8859-1?Q?ePlNOF+O83IPr2aGPJr2X2C4x2NXCS64TqUEVsYQkpAr7Wnw38jRU/gKo2?=
 =?iso-8859-1?Q?FKO5jOW/+4YOfkiD5inTRqLGKqbFypZ+rmP0WUO+FjBbxOjBPlevZnXrQe?=
 =?iso-8859-1?Q?PtT/PB5AwVRup6kWYnv/186ChNTz+Yc5Wd/P0yTTuXm3GwFSEJXDFv+c1R?=
 =?iso-8859-1?Q?pNo8ldcncH8I4oF900GbKHb5pRo+qjxCGEGTQP7l1n4/74Cx75dGb++5AI?=
 =?iso-8859-1?Q?ikODdDhcu4wVRJ1KJa8bP8r+oXzXZ9dYJYK/UKkh2+W4hH+3T+rfEd5qY7?=
 =?iso-8859-1?Q?yfRsxJdGLoSl6wShG3ybwmFBoW5jZZvo/SchFS421YzBgR5vE9Qj/OKsEe?=
 =?iso-8859-1?Q?Ae4tzhRZjkg3hkLmr/LAUBBwFWVibMRB0AncEHa1907tNFJD35lSyrWc1J?=
 =?iso-8859-1?Q?TTriFaOiH1yc5h43kpTUj8CDE7biAck3IRLu/ATY5WaRk5dY3LmZiuYOHQ?=
 =?iso-8859-1?Q?alIV44+X4r3ex4j7klr+jDmzgHjIQuWxc+u8Atwt27EmcQAg2JKZ32enrb?=
 =?iso-8859-1?Q?UE/pz1Nujt/37j7Zk6T05/aatJ8/QiMr6/6/gMrrCCVrIzj1WNCqpiAe2H?=
 =?iso-8859-1?Q?l7N7nG2ywRf2enud+RuZ/0CLNMRTjsJ7c1QDzZ36e7CmVEiv26HkGowIAJ?=
 =?iso-8859-1?Q?TB2+xVZHig+l5qFf6Q/FfvjVMQlFC3w2TaDF/gOLhYcEZiQFsfAqteUMNw?=
 =?iso-8859-1?Q?wboN7XpIeHmtdnGzCTAchBLrIPgkwBsnZCw0FqrxTtyMPVgxfvWEX7f/T6?=
 =?iso-8859-1?Q?hjFkh3XDq4dorn6nE/CarGh3X9H1mLvPdtrGn0kPuegrIEglkkZQcwLa7g?=
 =?iso-8859-1?Q?nldanhFOqnJko27Vqti8TxBByeEUMf1POdKNyqKMlKitTaEmLGtkFI+faq?=
 =?iso-8859-1?Q?t4FfGkwVJqtwJQIeZ1ilITVIrTkWyCizOiwZj0W+lglu+SccF5wKjSQAID?=
 =?iso-8859-1?Q?E7CfqamwHhGw4CDyblGA4SKTsSebfU4NALgUuw98zkXJXs4W+p/35ROE1b?=
 =?iso-8859-1?Q?LTEqWfdk2s/BOLlL+U0m1n8fELH1Q/YJneSbzw49+5zjA97d3sHtVZySpH?=
 =?iso-8859-1?Q?oP+Owjkyr+TqE7xUIoNp2V609NE9ZqYOWcBd5v4mHFlGUv203Y2LFT8t5t?=
 =?iso-8859-1?Q?U/v4Sv9THFSn+9NvlsKb1USIveSFO02KWJQXhieNCbUpO4XEn/1MrFwKE0?=
 =?iso-8859-1?Q?HNGa7S8+35zNgyD8DTaVKYrz95b1aHlnb7jBkq8pNxcZM4ER+N+d6Ur6PZ?=
 =?iso-8859-1?Q?VZgUXE6vSNCOsNPjILuj55C9rWXJ/lQ3gtbAFlvSKryTrnz5/jq7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5291b2-224d-4df2-2a23-08de90a7844f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 11:03:48.4663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yr+QQrRCfl734s8GYNx4ctuJidJ4neiIXiDFDrS0i/g8IGPys6UOmucJqPa7ZInS7ladvLpt/x6jmk4JLXMx2ULeAwFvVsuAQNj04dU79Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6984
X-purgate-ID: tlsNG-bad1c0/1775127830-2E74A152-E7EA62D9/0/0
X-purgate-type: clean
X-purgate-size: 2697
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 1B4423880CA
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

When CONFIG_STATIC_SHM=3Dy, this bug remains hidden because
DT_MEM_NODE_REG_RANGE_SIZE adds extra space for SHM banks.
This extra capacity prevents the array from ever reaching its
maximum limit while processing the 256th memory region.

Fix this by changing the condition to strictly greater than (>).
Apply the exact same fix to shm_mem_node_fill_reg_range() to
prevent the same error.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
For context, this issue was also discovered while testing maximum limits.
I did not notice it while working on my previous DOM0_FDT_EXTRA_SIZE patch
because my .config had CONFIG_STATIC_SHM=3Dy enabled at the time, which
masks the error.
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

