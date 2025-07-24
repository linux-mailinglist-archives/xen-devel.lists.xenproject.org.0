Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F1B10E3A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056231.1424441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRf-0004pc-0k; Thu, 24 Jul 2025 15:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056231.1424441; Thu, 24 Jul 2025 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004eV-MR; Thu, 24 Jul 2025 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 1056231;
 Thu, 24 Jul 2025 14:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexNy-0003AJ-Ak
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:30 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8531a0d1-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:26 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:26 +0000
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
X-Inumbo-ID: 8531a0d1-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIO8kW/W/s/L/qfYxi/QDVf4offFztgvzTLrtySJN4et5yddC19y5p8oOX/k0/Hhz0LLxPfOjW+gnZ++VTfI2XwGh9siqiX+dba1JUcAMZ3fy2eJXGJmlUlAYl8ud98+tYrH3XEPYMg1JlLtN4bt58/yxLe3ONv2S8+zfvGPCQZ5vYo/+WeEsM7DWyyUDMqvzI/2L0YDahsF/cdxWfZmuNOHJGLlW/SMaazb5W5KRk/vw9daWCraWN6jd3KPtpC3rhGEJvcNgk95GmdvEKuy9xsHzA1IM6GKn7KHkG2AYmkaezNHD6BgyZj/Ha08DvqdGBrMw+slkNr0LPCAV1I8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DZZ8WbTzk/Bp/uBES1ei8cu6eCKv7drBE85bkwUtLM=;
 b=L7xhnRnKCgIbt5qeqFy94XCxnQsrd99niSTu068QiA8OmDA3mVYQAAXh30shgtjoE1O557oehRFPeA9fRKgQD97G8f7cEWQHoLRlwmr0eeuDYZvMK77K0Rqs8INTm+QVD6vwkA9HjE1AuQ2fZGiAUXvyUsNtxcDhUuRLn2TEFGV7MIodSq5Q5uQQVP/vnQTvUlTWoy7fUwQXG2w4enwd24M+H2sMbZD+pObhmDqPwIFLbB2+wvmNDhSf8NBZcwvt5acYU5zBFWrbquthycnCrUv17Z72fS5MImuu8CdO9//SpqmX6uDCW1tkHUw2WoYDG/SrZ2+dPiSJuxT9xP8Z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DZZ8WbTzk/Bp/uBES1ei8cu6eCKv7drBE85bkwUtLM=;
 b=cFOPip3JgFYZcNLMk8b5VwIXcMALvtQqJroOiSlUhqVUKfpMn/F0cVnCA/7DLU2JIwetkcxgeyHB439mvhSr4c7z48Uz6ig4ZsTf9zMalHEBE3/Q8biPZvXUXiPnMe8ajSdcWL/5oiwp9WSiqgUWtQmurO9828g10exEPlOOROsG7qTR7kVPlHj1b0wjNZz4xg+xlq4w/l7JXgk9ZnyjJi1OpTiB4vGH+liQPI9i4Q01rjZC4QAfHd7qKwOxGkWaQWVB8hEuQU9gyV0OwfzoGpSTadoS3/eCFlex94nTeLK0mgZQOdX7oA7YFPG6YtMAzk4VBoJAyIu8sQeETqKH+A==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 04/10] xen/arm/irq: allow assignment/releasing of eSPI
 interrupts
Thread-Topic: [PATCH 04/10] xen/arm/irq: allow assignment/releasing of eSPI
 interrupts
Thread-Index: AQHb/KtE3QJQw15RRUa5PP48DVugUQ==
Date: Thu, 24 Jul 2025 14:57:25 +0000
Message-ID:
 <126f762aba8b0f6a4eb322c27593f574f877738c.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: 2bcc2fbd-74a1-4159-1bde-08ddcac267a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6UhmEzrS1aD4wo0zQIdlZAkxosjMckYXdJFge/FR3vUdbG4eTOnKZk9HZf?=
 =?iso-8859-1?Q?1pASRf+fjaq/rBUnQGHmyS0qbAH7GU7ZuskfpDTCcyhB3eZ7rd9A3zr0JI?=
 =?iso-8859-1?Q?Y3FelBGfVDoVtgDbJPt7KuQBQGb7DNMYejKP3E6LlsPtts0MieC/Aixngs?=
 =?iso-8859-1?Q?jZYEVE6rnz9KaCyxfYiwKSo2LIX3m8noWHqXy8aS0+NqKbEVfl0Q9Bm/RH?=
 =?iso-8859-1?Q?jO9Ei7cL7NeZJZdOBNg4Ah21rKcWizEGz1cdZ2CANMT7u12jEi84c9H4Eh?=
 =?iso-8859-1?Q?A0gG78qZRXXFmR1zYT9sWQBiNkzQ3bPQtXXDbo1VLRlmiDzBQSAP7fS3Oa?=
 =?iso-8859-1?Q?TJhvM1KB66o6WRextKdEzuVVo65PdGbjluzYubv7c8BRAYQSy3/I66u45X?=
 =?iso-8859-1?Q?rv65cPDTVfIIo05GuBJoIptwXU8IyVZHnK0pRMVIgFvmkE8RyhZlDUGwX1?=
 =?iso-8859-1?Q?n3Xe/J9aohkXODvAxh4jDFLz/0573ElhF/fah5F1kDBM7gwIBgQplMzr9r?=
 =?iso-8859-1?Q?BoipInupsamu258CSwqmJrwsgQNr8gCSOH/3WA4qjNhXy5d6OkLaom/Bo9?=
 =?iso-8859-1?Q?awyR6itoKCtplQmdXoM1z9QZn9veA+MmC2gWd9MUdw1D5aboQP25k1t+lu?=
 =?iso-8859-1?Q?jsevLL+YKREO+HJKi9CNCF/QZCegKA4/YIhiDDpNZX+sNhoqGElQO3EUHC?=
 =?iso-8859-1?Q?vUrTT4Zwhxuutlii0YdV85/cgJVvikphKMefl6tgdgxod8mR3NM9BQzY3q?=
 =?iso-8859-1?Q?zNx1rKCnP/cjiNhlqzDfmzxr+uXF6IBOQfS6JfcE93OuF83c0HrBaj40eS?=
 =?iso-8859-1?Q?SlaGVLGSM8ZduHjFd0zxgL0R01q5nqlmxC/E32mdv3KTDdG+mN5ZSs5Q6O?=
 =?iso-8859-1?Q?sfQApCu9oyr/Jxz2rnyftnB14S91/reZBf3YYPUg1rIENS2aeeQKBtRdDk?=
 =?iso-8859-1?Q?+JfeFnguD3wYku6FBaRxgYvkNtIG+vQmZT6Wcpf9PJevGFlF+z3K42EfDI?=
 =?iso-8859-1?Q?phv6BbYUEBR+HV6mlQ1QeGaI6fS/IlLz5TYNBL1hkcvE/hs0xaclk3g+Ry?=
 =?iso-8859-1?Q?IObUSr5LHyeTwC1Wx/KrR92djXM0tgBNZ+p5VCaIp2y6byT1Z5wWC2qW6c?=
 =?iso-8859-1?Q?RFPwfurrlKzEemLLGAmf3M//663iZ1i2ua7PTToQD0Tu/ni+NfT8mFBho5?=
 =?iso-8859-1?Q?Cig8j9M3tpMaWm6jrYAHAyYB3ptWih6YxTqe19ClSBtRfmvWyCzlVqRNuQ?=
 =?iso-8859-1?Q?7GR5h9F4kcjbMsKuAOXOktMaD5S/sPf1KWv4KpLVkswi5D6oi97VbCOXYC?=
 =?iso-8859-1?Q?MrxOBVSN5oMqozGoY3WycSbGHBUGdWCcKpUHe6x+XssLDr7WhRCyXeUPTo?=
 =?iso-8859-1?Q?5GLpFLzRLT7X9Ipa3+0So++ygXAUbaNGbnjF41E/1yEi0vPOGZrCVl8ILx?=
 =?iso-8859-1?Q?3ALCT9321tsMWDrM7sHPpI8a225B3Qq88tAoKZZsOd2NroAdICb8w7Cycu?=
 =?iso-8859-1?Q?AIwK8N4N33AEhcpyAGcdHeUCb10P6PXqzyZwbccohBYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1EqTWYKlaJIoNDiEgIzcpnNyddZrgaQcZvtpD1gxGsRCqd0W5uOSYJ/hJR?=
 =?iso-8859-1?Q?Of3x1LeXdIBmw/ErPgQanc31D1HlFwO1r/SK0ovPkVVsXe94adXrB3kf+X?=
 =?iso-8859-1?Q?wGN/Gl3k7J7fsv5RnGpfPzN2FD1htF0qgj6L4LU4BDh9pPhc0Pa++CdsA8?=
 =?iso-8859-1?Q?QZg8W1U97wxwGtxenTRCuHVpijfrRDcz4rLGSYvXkBDCh1Ax84QMDrNWGO?=
 =?iso-8859-1?Q?g2k0JDxB1Dhte7Czasnmsxk5OYkhnw29aP4kGEfaAmp0pHDGDzM36U6BzC?=
 =?iso-8859-1?Q?2yGvqnIvq8ip2yjvOptzrG6ietVU0YD/SWA42/05/++5Bd1cHn/B/cYueS?=
 =?iso-8859-1?Q?dw0q9YxK+QgZZ8VGoh6HYFSKdVuUst9lO9vVk1gDInevwWEmJ/Md6/Ba2F?=
 =?iso-8859-1?Q?HAyIHDl6XSOlF5alZaC8GNI77jJr5FXcz1+ab7eS9RhBVPeAaJo4Frgmx8?=
 =?iso-8859-1?Q?ZCbOQ1nuC0CnzA7bL33Hy3MhC/MHOZgKZ/uokrWgv015q2O/EX7LLv0UTV?=
 =?iso-8859-1?Q?Djni2w86ebs/o4rUrPZTKEt6rzNV8aRjlM/s5CWOnjYdSoVU/ssf1txDAN?=
 =?iso-8859-1?Q?nF+AhZlFfSmlbKksyh/gFmYMcijN3EriZUyKksgp7aS2Mz8ebN7o8kGYAC?=
 =?iso-8859-1?Q?AEQbTfl3iC+ZiuolKLR7/gZQF3uILh5WDdOw0fcW91TrMmdvNZK1vWmAfy?=
 =?iso-8859-1?Q?BhAfo2olHXYlSqCPwRWq8quim0uR5vZwVDFqfwbN3pviFcluSpFw8lqhWV?=
 =?iso-8859-1?Q?EX0hdQlrZE8B/IipJRGIf8l0JncLAp/XIPjbHUChm249lq+fn/nvWtByq4?=
 =?iso-8859-1?Q?gefDyWBjSR0d0/1gz5yjaBjjl2GUWDO89F8CfY00mE/pGHOR/tEzVlHN1Z?=
 =?iso-8859-1?Q?F9uNf+dVXMTgabn6fdG47jTLPVUbi2sP+lbPgPVqsHYXmF9oy0WloRbdi4?=
 =?iso-8859-1?Q?0/KFVk4lG99GDmhN9r0IgCDwCCwwezYUxkWYFRjNajGqxbJT5zTho74PV0?=
 =?iso-8859-1?Q?Y3q1qsaM94YU3zq87a4OeKSxseaU7joDcKQ3J+d+tFg0c09U97+HZ1aNbW?=
 =?iso-8859-1?Q?dZ7VmV9E6Vjd2m9z1IS1YYDVkDWZ/YY8CIibb9hSWo2o5e7wMJo/soF7Ko?=
 =?iso-8859-1?Q?aF9EuFUs6iQvlTL2itrS8WYuAYuXyqkw4H7yUDD8Brp7IgiYzqSWR/etyk?=
 =?iso-8859-1?Q?prB8Q47ZcKbsv6Z38W7AcoQjAI7Sz65T0OzWMLpOEgXO35zpq33LNxaM80?=
 =?iso-8859-1?Q?qzM4wTuf8+7/csJ7gViFgVK4SsuAS7m/nxOk21Nb+KRVT7y7Y4jYgbAoBt?=
 =?iso-8859-1?Q?IUDaBs+735UpoqQvGpbMzH6DcpaedrvuH8bmEmD7rKA66mV/xmfZIbAg4+?=
 =?iso-8859-1?Q?sJR9ApnUgO28LbZBltKmQN3Hm9oZn3hPeh05YvHH/bqxbLGaR0+JTfIg1p?=
 =?iso-8859-1?Q?WPXDvd7GDK91fAjcbix7ob1w+wBO9+NhzWzG/t2qgqBcVf2hnoxKKMmeSM?=
 =?iso-8859-1?Q?y6SaDnbElqQGLT5KgqPHUjf05kjxjkUfzhn+h3Uh2AlD1fvQqNFLCoDwNG?=
 =?iso-8859-1?Q?HiJRh02i4bkxiNj3B9Xwa9eSyt+R7Ss6k9ZbW3tak5ViaNqqdBNEqAQALO?=
 =?iso-8859-1?Q?A0VxH1Euq26yBPdTL5phv6TH5TchThi8YxtlicH/mQsagV1k3FhYB2YDj7?=
 =?iso-8859-1?Q?NVoa19bSAxRrh9vbl08=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcc2fbd-74a1-4159-1bde-08ddcac267a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:25.8215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCn5gNIYn2EngRWTRP83cKOBRYX6Qg3uc4qgOkvcmo8C4Gf8LYzANUi6de7+3/plRNWzvoR8Rz8EgZ5lOQbEIsX+ezZKV7UV77u84rTGYyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

The current checks don't allow us to assign or release interrupts
with INTID greater than 1024. This patch adds an additional condition
to check whether the IRQ number is in the eSPI range and allows it to
be assigned to Xen and domains if it is.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 3f68257fde..8c47eeb7c3 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -444,8 +444,8 @@ err:
=20
 bool is_assignable_irq(unsigned int irq)
 {
-    /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    /* For now, we can only route SPIs and eSPIs to the guest */
+    return (((irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines())) || is=
_espi(irq));
 }
=20
 /*
@@ -589,8 +589,8 @@ int release_guest_irq(struct domain *d, unsigned int vi=
rq)
     unsigned long flags;
     int ret;
=20
-    /* Only SPIs are supported */
-    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
+    /* Only SPIs and eSPIs are supported */
+    if ( (virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d)) && !is_espi(=
virq) )
         return -EINVAL;
=20
     desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
--=20
2.34.1

