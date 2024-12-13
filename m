Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489D9F0D92
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 14:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856699.1269247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xH-0002vc-VO; Fri, 13 Dec 2024 13:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856699.1269247; Fri, 13 Dec 2024 13:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xH-0002tA-S7; Fri, 13 Dec 2024 13:43:43 +0000
Received: by outflank-mailman (input) for mailman id 856699;
 Fri, 13 Dec 2024 13:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYUc=TG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tM5xG-0002su-5D
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 13:43:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f403:2612::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42ac9a5c-b958-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 14:43:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9747.eurprd03.prod.outlook.com
 (2603:10a6:20b:61c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 13 Dec
 2024 13:43:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 13:43:38 +0000
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
X-Inumbo-ID: 42ac9a5c-b958-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAzDxXP+PGPfqPvkLRzNqzMgOwwNTp4qSumEsWBBMxd8BbL2I5cDM2ZjZGMKSNccjgXuT7/e9Yuboj4vfcssm7TRAHhRUcHpIeGH089cebA2s15NTBAcqrCtH6vd3A/vVEJ6o36KrVY1kliukUPFknwX+OgLNHsBx+aITJJVptVbOaC+t1UAuBdIsclVGA+0jbmRTQXZvPF1BV+cV20OW8fyZKECcrK183PxDVeoBJlAzPIicwr14ioTDaJFjJWyJt06YeP6/d6i7vPn1hedXBIvQC3QqU5Gk7/w7wyVcnJNCpGUqNFvpsYC3xYa/5W0LVrY2erZ2yLYDpTjwZ3PPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m82pZphfIXwF4z/QxJwwNRwFlrHF7j9oOsgHJHvG7M=;
 b=gvvTxVr4fNTFohG8qpFEf9YF+q0NznZAx6RCxPpBs7WkRaF5rvA+9RoQAVqssqg6LJYnZubWop/aEYaq1BG8jBvI6hNgdzELO0z0yBF3EIltH9l8193WQe+9XCPA73UtoHRRNSA7vDdzOXmmPlsUOCbEY/yoncw29stytIb4dvOU4RF3WbKRMa8IzHO4NC2AleHf+RZj4zs2Ld1WG6qy1Uq9bzxWFHUNUoTYf2fKeD62vZH1xNetqqy4LWmZrEQeeNN3yNlYi6NGDlwr86fjkbZbObyCxaluqjrQXRYbelJICuazEa40sf6VqkWtrMcro6JcKo/dZq7gxxZ2Z8Mw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m82pZphfIXwF4z/QxJwwNRwFlrHF7j9oOsgHJHvG7M=;
 b=Cc7ukpAIpV7dc9jztd2CIl3FoNx1upwPD2nwwFdPa8KlnmA5A667Ya+fIPerl+C3CtaQCD61qle6Q95c/inG41ErpRq1xrLF+vn8JR+A8C9/okgldoHKHr6p7rNAodcBC4WpcIfV2/zDknTWVeTyAm7zCI6IkKhW1RJYkBmLoOgBhmHICrSxLjb3VN91tofa8oWcx2ZtNuT2n6GFlFXODxYlNi+GYK6UT06zmj1MWtPHnDDR3lc21AsLydDfUFoA7mIsZ1S3TiGZAo9tiewDFt9SS2l3E5/6APqezflQbPAawp7f9P8Guy2X38OTpl6vOq+w+qaXFnHPDci9fEUL9Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH 1/2] ARM: ITS: implement quirks and add support for Renesas
 Gen4 ITS
Thread-Topic: [PATCH 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
Thread-Index: AQHbTWUDkPvtOs/CJU+9P/F/tFzopw==
Date: Fri, 13 Dec 2024 13:43:38 +0000
Message-ID:
 <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
References: <cover.1734096752.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1734096752.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9747:EE_
x-ms-office365-filtering-correlation-id: 2b1849ca-faf7-400c-261a-08dd1b7c25ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xnUBcbig9o+7RZWWGjo1yf7UpO7YiNXapL4DN4EJjSv+bKmupyrVdzymvf?=
 =?iso-8859-1?Q?i2do+1DuRKWFNIYFgpKpPzIGffEnoNwHVquY4a9r8IhNUbLJkK8nwqsFau?=
 =?iso-8859-1?Q?kmERftUA9Zb9Fw0pLPcu0ll/q8c/fBTc+/r3tA48MPeQmXpaeFEJGPydag?=
 =?iso-8859-1?Q?/yMF/8TL+2If2x3euyOwo2ctdx6Ud3QRzJmxrzcqE9Li+Q44RF/aG6NxWv?=
 =?iso-8859-1?Q?wfRr/gID2+7nZxI7AB+LfphIBz0GQPk1xgcGQe3zDawONNJz31q70cAX6F?=
 =?iso-8859-1?Q?wYJSAnnBqgC6LZ4sdcr0ExU1jPL1eZWhahN3gYW/dSt2qa5Cj8Xfymi4SQ?=
 =?iso-8859-1?Q?W74T651eDLHfaW7B9KtjX6F1ShuoU0w2PovIbb6rmywDu4BcLnoZ1JdZth?=
 =?iso-8859-1?Q?BbbMBf9mSD3UqWwGzFdV4nToph2QpHStR1zfjXtN8FQ6rUmfhvareGPL6m?=
 =?iso-8859-1?Q?jOO+DAUAO/HTvqyZ1JOO84haO/By3steYgU2Zq4WNBwCGcHecmJ/Yn2muo?=
 =?iso-8859-1?Q?5a3NCblkIIZaOsfr0IZO6wmlhFf+zjLBxtzUgUkbr6gN7W+vEx1V8ZANom?=
 =?iso-8859-1?Q?A8puoT5k4BLdTd/bTq03S+Ec2veyPr3LTxXcidkx8SnMI9EGKt8c+s1Mcs?=
 =?iso-8859-1?Q?C62v0tBkrTuTH5Kz/h+oyb/7G9ryfxR0QSaxf+izD0VkeEj27qjKy7ZZ4q?=
 =?iso-8859-1?Q?gbkXXWhnc8+JI+7bYtYXoLuS6GAWVbglv4gizkZ7bitc3vats282QHDUVF?=
 =?iso-8859-1?Q?U2XdVMfSdN7iTjXWZZGrlu0XxCwlf5Utq8+sLboSAFfMVXEkSV0rf0U+oH?=
 =?iso-8859-1?Q?0JZ+gIT3qwnDd1RsTxyyiF+b/yHuqiY65ql7f+4XjeUs5Q3FKF9O6YX44D?=
 =?iso-8859-1?Q?Vtifp+E2DFq8OTDOL6F2/wcaJHYcxVdXlh1Ay1yODCimBboKP8xV793DtD?=
 =?iso-8859-1?Q?y8A/eOh5JrB8vQaimYASQvbjFTApIU/F0jyHyRr3uaVIbQbPYDRU3qSRyZ?=
 =?iso-8859-1?Q?uUXcYomP6FINNak6sg/2o4B3sUXtRGKVRBOL+xhvopqatrn3/A6urkIuZ1?=
 =?iso-8859-1?Q?QnFq8q+bJM+/nYm8++2iVmLDMd0YDUZl8Pw38ApWuAByxdkjvzqHLP8v4a?=
 =?iso-8859-1?Q?eWY2xsern5vKzCkumSWQH2V+g9nQusXnmFcMoctELLE/xiLVkE40EUsYx2?=
 =?iso-8859-1?Q?SSixuPzOk4ZCDrwbzL3jqLSOgL6fxrAStoCjBHeX/8/hUOP7Hnfnby177P?=
 =?iso-8859-1?Q?ZkuIC4nnXOGOobXKsR9X1dU17HeLCDVpn1t3MPrVYyldJULLaNMvJe9c3I?=
 =?iso-8859-1?Q?upoUI62K/i7SFMxBW8v2RUmybPJmO9MwrRh1p0tsmr8Y20XlHYYQzl6Rqn?=
 =?iso-8859-1?Q?zYEmuKYVwknVxiJ8N+tD02sdgxKDahFsbIInF1vviWXZfq06xsKSM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3a3Yc+ZkJ8u6mJY1A+e25bLjGEpjPINyNqr/GG92le9LoAQ/q8Kwm/LDJ3?=
 =?iso-8859-1?Q?hpob7abZKMLxukDVCapx0DiBMxgl6bFs2SSHR5ygZQiPk5yO2C07qbmHoY?=
 =?iso-8859-1?Q?dH59QIDtSw00eNtGpoSWSBPpz4dmos7tx5jfGT6EfgyR9Y19tDKR/v7x05?=
 =?iso-8859-1?Q?3IQ/ZH6go5c2pobpp3+OL/QcnAdXgr9NOEyqBS2NWeBJrIan+nbyimYH8b?=
 =?iso-8859-1?Q?osMEnNv10nj1xdkAkLjRQ6dJhG0nZ6L2qjX56vkK3jtUXO1H6Qwwjf9jW2?=
 =?iso-8859-1?Q?J7i7RcQiieAQJwTen+NwpQCsPhyiYZ5DshH/VTZD4C+ZgqfJDIPhRcHWEl?=
 =?iso-8859-1?Q?9ljurxvMpjgoH7pkQmJJH4u3HbtQ8A5dUzd+1Y92DfdWRXbGmKyMqthRnJ?=
 =?iso-8859-1?Q?7R7bEYEMGBJtqu/hmtPdWxolOJtWcZ+aFSxbZ68/+LqL9QL3S4l0jNUUvd?=
 =?iso-8859-1?Q?3iORsUYum9QsypolvErFioQSlJy1r0qN2IxhkN52I5e3CgiveEZq9UKH3v?=
 =?iso-8859-1?Q?IFQrJdkokFoPZAuoazxdgYgvdobBFYT2yJMduoWgRZGsCzg7NgGjyWDGMZ?=
 =?iso-8859-1?Q?sbZsHAx3KEzz/XnCWlrC9sV9A6Xd2TL2iCd7vkt2q+zTk/QWIGEf3Ednl0?=
 =?iso-8859-1?Q?gVZAdWTyVg/egXvPyw7p3hIUjiUqP1ZIdO8WCKfi6ukq+7hgvYm9cFQg2m?=
 =?iso-8859-1?Q?UoPLfUNadToPBhMmVwEXaMbrT8hXXf4nF102mJpCagM6/IWRnhfeh6SPi1?=
 =?iso-8859-1?Q?RO73BQ0wF5avmvq62WmP1R5CeymrxDNY07DQq/syYUJ+Xv/dDhoRlW0fBa?=
 =?iso-8859-1?Q?sEWqJsTFeL1z1v5b3MGnWrEvfF2CPVdzGuGG4ugx5NN27VNml/D+P6gmyr?=
 =?iso-8859-1?Q?e00tnFEjq+qb1mkuW6x1ac6PF4NspB91hUYt6JjZ9En85Vkc6Snly4I3hj?=
 =?iso-8859-1?Q?FBhaJW50kA8RlEf2SZud/hri9qfinE6PHs1Q9CAJQrenivGBI+IS9d60LZ?=
 =?iso-8859-1?Q?C7ilw66gMNeTdsXUdprf7m+wB9rpFkXvRQgdLhwtmF+ENpv49/gKso0kMV?=
 =?iso-8859-1?Q?gGu6m5mLjy5Q/d4YPfSmTXCPir4FI9EpnQRut1kfDhznIYYaSwJ5oJpW1m?=
 =?iso-8859-1?Q?+1v0zynsAFZJUmNk1+n78FSxCfhAnm3uE79bQBYD8QVW1MHLb9/NSzsS+v?=
 =?iso-8859-1?Q?Tib/T1bo9QPU+glR+cK7huPIVzQYQPCdav3GNgxeUYTOmGlRO59/shJBCd?=
 =?iso-8859-1?Q?nVuXB57wN/f5KGd3j+TbIk3Zd5xrOWrdJ2pGFa3FAO2fBiOsCxTFspS7Ya?=
 =?iso-8859-1?Q?rVeyFgh7eZNA/IXiP+m1qaS6brOxdMVBQKSc06XzzB0TwLLCGqad7braE4?=
 =?iso-8859-1?Q?8j9zOa+f76Jogqywoq+/HSaHAy54/eKwTNt+RuKWKqcrFF5F0AqcHUvjun?=
 =?iso-8859-1?Q?vg9FsFOwnzqg6VhAwN8T1GHcS5ou+JiFmwAtflh7iCDpnr0ANw7U0FElFU?=
 =?iso-8859-1?Q?zNLlrY5gbafJFO7RWXEkyd5gZUvZXQ3pxGSnwJsPA8HKjrVu1jV45igd/1?=
 =?iso-8859-1?Q?pxTSfQrpacpdQfdx4fHcx13frRjhzpBPSmNoklNvza9NzuPfxHSe62ZqLH?=
 =?iso-8859-1?Q?upkGPmASFXuCJTSaL9j+wHE3KNK7vMU0Sd++gdHfVcR5Yk3oF1BJ/ijA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1849ca-faf7-400c-261a-08dd1b7c25ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 13:43:38.2425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aePkeOQXJ/fgWAb5vj4hpg5Y0AkWpuqYYZIZpjmkWms6DtvZbfCzULoX+CaecbEWXbvPaCEm8xdSD2DLdHykdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9747

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are number of ITS implementations exist which are different from
the base one which have number of functionalities defined as is
"IMPLEMENTATION DEFINED", e.g. there may exist differences in cacheability,
shareability and memory requirements and others. This requires
appropriate handling of such HW requirements which are implemented as
ITS quirks: GITS_IIDR (ITS Implementer Identification Register) is used to
differentiate the ITS implementations and select appropriate set of
quirks if any.

As an example of such ITSes add quirk implementation for Renesas Gen4 ITS:
- add possibility to override default cacheability and shareability
settings used for ITS memory allocations;
- add possibility to allocate memory used by ITS with specific memory
requirements: introduce _x{z|m}alloc_whole_pages functions and free the
memory with xfree as usual.

The idea of the quirk implementation is inspired by the Linux kernel ITS
quirk implementation [1].

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

[1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic=
-v3-its.c
---
 xen/arch/arm/gic-v3-its.c             | 90 ++++++++++++++++++++++++---
 xen/arch/arm/gic-v3-lpi.c             | 14 +++--
 xen/arch/arm/include/asm/gic_v3_its.h |  8 +++
 xen/arch/arm/vgic-v3-its.c            |  8 +--
 xen/common/xmalloc_tlsf.c             | 18 +++++-
 xen/include/xen/xmalloc.h             |  4 ++
 6 files changed, 122 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 5fd83af25a..b1a2cdccc5 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -50,6 +50,77 @@ struct its_device {
     struct pending_irq *pend_irqs;      /* One struct per event */
 };
=20
+/*
+ * It is unlikely that a platform implements ITSes with different quirks,
+ * so assume they all share the same.
+ */
+struct its_quirk {
+    const char *desc;
+    bool (*init)(struct host_its *hw_its);
+    uint32_t iidr;
+    uint32_t mask;
+};
+
+uint32_t its_quirk_flags;
+
+static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
+{
+    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
+        HOST_ITS_WORKAROUND_32BIT_ADDR;
+
+    return true;
+}
+
+static const struct its_quirk its_quirks[] =3D {
+    {
+        .desc	=3D "R-Car Gen4",
+        .iidr	=3D 0x0201743b,
+        .mask	=3D 0xffffffff,
+        .init	=3D gicv3_its_enable_quirk_gen4,
+    },
+    {
+        /* Sentinel. */
+    }
+};
+
+static void gicv3_its_enable_quirks(struct host_its *hw_its)
+{
+    const struct its_quirk *quirks =3D its_quirks;
+    uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
+
+    for ( ; quirks->desc; quirks++ )
+    {
+        if ( quirks->iidr !=3D (quirks->mask & iidr) )
+            continue;
+        if ( quirks->init(hw_its) )
+            printk("GICv3: enabling workaround for ITS: %s\n", quirks->des=
c);
+    }
+}
+
+uint64_t gicv3_its_get_cacheability(void)
+{
+    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+        return GIC_BASER_CACHE_nC;
+
+    return GIC_BASER_CACHE_RaWaWb;
+}
+
+uint64_t gicv3_its_get_shareability(void)
+{
+    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+        return GIC_BASER_NonShareable;
+
+    return GIC_BASER_InnerShareable;
+}
+
+unsigned int gicv3_its_get_memflags(void)
+{
+    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
+        return MEMF_bits(32);
+
+    return 0;
+}
+
 bool gicv3_its_host_has_its(void)
 {
     return !list_empty(&host_its_list);
@@ -291,11 +362,12 @@ static void *its_map_cbaser(struct host_its *its)
     uint64_t reg;
     void *buffer;
=20
-    reg  =3D GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
+    reg  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT=
;
     reg |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_=
SHIFT;
-    reg |=3D GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT=
;
+    reg |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY=
_SHIFT;
=20
-    buffer =3D _xzalloc(ITS_CMD_QUEUE_SZ, SZ_64K);
+    buffer =3D _xzalloc_whole_pages(ITS_CMD_QUEUE_SZ, SZ_64K,
+                                  gicv3_its_get_memflags());
     if ( !buffer )
         return NULL;
=20
@@ -342,9 +414,9 @@ static int its_map_baser(void __iomem *basereg, uint64_=
t regc,
     unsigned int table_size;
     void *buffer;
=20
-    attr  =3D GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
+    attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIF=
T;
     attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY=
_SHIFT;
-    attr |=3D GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIF=
T;
+    attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILIT=
Y_SHIFT;
=20
     /*
      * Setup the BASE register with the attributes that we like. Then read
@@ -357,7 +429,8 @@ retry:
     /* The BASE registers support at most 256 pages. */
     table_size =3D min(table_size, 256U << BASER_PAGE_BITS(pagesz));
=20
-    buffer =3D _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
+    buffer =3D _xzalloc_whole_pages(table_size, BIT(BASER_PAGE_BITS(pagesz=
), UL),
+                                  gicv3_its_get_memflags());
     if ( !buffer )
         return -ENOMEM;
=20
@@ -453,6 +526,8 @@ static int gicv3_its_init_single_its(struct host_its *h=
w_its)
     if ( ret )
         return ret;
=20
+    gicv3_its_enable_quirks(hw_its);
+
     reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
     hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
@@ -681,7 +756,8 @@ int gicv3_its_map_guest_device(struct domain *d,
     ret =3D -ENOMEM;
=20
     /* An Interrupt Translation Table needs to be 256-byte aligned. */
-    itt_addr =3D _xzalloc(nr_events * hw_its->itte_size, 256);
+    itt_addr =3D _xzalloc_whole_pages(nr_events * hw_its->itte_size, 256,
+                                    gicv3_its_get_memflags());
     if ( !itt_addr )
         goto out_unlock;
=20
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de4b0eb4a4..72b725a624 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -237,7 +237,8 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cp=
u)
      * The GICv3 imposes a 64KB alignment requirement, also requires
      * physically contiguous memory.
      */
-    pendtable =3D _xzalloc(lpi_data.max_host_lpi_ids / 8, SZ_64K);
+    pendtable =3D _xmalloc_whole_pages(lpi_data.max_host_lpi_ids / 8, SZ_6=
4K,
+                                     gicv3_its_get_memflags());
     if ( !pendtable )
         return -ENOMEM;
=20
@@ -272,9 +273,9 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_=
base)
=20
     ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
=20
-    val  =3D GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_S=
HIFT;
+    val  =3D gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEABI=
LITY_SHIFT;
     val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABIL=
ITY_SHIFT;
-    val |=3D GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT=
;
+    val |=3D gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY_S=
HIFT;
     val |=3D GICR_PENDBASER_PTZ;
     val |=3D virt_to_maddr(pendtable);
=20
@@ -301,9 +302,9 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist=
_base)
 {
     uint64_t reg;
=20
-    reg  =3D GIC_BASER_CACHE_RaWaWb << GICR_PROPBASER_INNER_CACHEABILITY_S=
HIFT;
+    reg  =3D gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEABI=
LITY_SHIFT;
     reg |=3D GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEABIL=
ITY_SHIFT;
-    reg |=3D GIC_BASER_InnerShareable << GICR_PROPBASER_SHAREABILITY_SHIFT=
;
+    reg |=3D gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY_S=
HIFT;
=20
     /*
      * The property table is shared across all redistributors, so allocate
@@ -312,7 +313,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist=
_base)
     if ( !lpi_data.lpi_property )
     {
         /* The property table holds one byte per LPI. */
-        void *table =3D _xmalloc(lpi_data.max_host_lpi_ids, SZ_4K);
+        void *table =3D _xmalloc_whole_pages(lpi_data.max_host_lpi_ids, SZ=
_4K,
+                                           gicv3_its_get_memflags());
=20
         if ( !table )
             return -ENOMEM;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index c24d4752d0..0737e67aa6 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -110,6 +110,9 @@
 #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
 #define HOST_ITS_USES_PTA               (1U << 1)
=20
+#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
+#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
+
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
 #define LPI_BLOCK                       32U
=20
@@ -197,6 +200,11 @@ struct pending_irq *gicv3_assign_guest_event(struct do=
main *d,
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
=20
+/* ITS quirks handling. */
+uint64_t gicv3_its_get_cacheability(void);
+uint64_t gicv3_its_get_shareability(void);
+unsigned int gicv3_its_get_memflags(void);
+
 #else
=20
 #ifdef CONFIG_ACPI
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..f5deb18497 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1191,7 +1191,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
     {
     case GIC_BASER_OuterShareable:
         r &=3D ~GITS_BASER_SHAREABILITY_MASK;
-        r |=3D GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
+        r |=3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHI=
FT;
         break;
     default:
         break;
@@ -1203,7 +1203,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
     case GIC_BASER_CACHE_nCnB:
     case GIC_BASER_CACHE_nC:
         r &=3D ~GITS_BASER_INNER_CACHEABILITY_MASK;
-        r |=3D GIC_BASER_CACHE_RaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT=
;
+        r |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILI=
TY_SHIFT;
         break;
     default:
         break;
@@ -1455,9 +1455,9 @@ static int vgic_v3_its_init_virtual(struct domain *d,=
 paddr_t guest_addr,
     if ( !its )
         return -ENOMEM;
=20
-    base_attr  =3D GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHI=
FT;
+    base_attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY=
_SHIFT;
     base_attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEAB=
ILITY_SHIFT;
-    base_attr |=3D GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY=
_SHIFT;
+    base_attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEA=
BILITY_SHIFT;
=20
     its->cbaser  =3D base_attr;
     base_attr |=3D 0ULL << GITS_BASER_PAGE_SIZE_SHIFT;    /* 4K pages */
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 5e55fc463e..f7f00db044 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -537,14 +537,15 @@ static void cf_check xmalloc_pool_put(void *p)
     free_xenheap_page(p);
 }
=20
-static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
+void *_xmalloc_whole_pages(unsigned long size, unsigned long align,
+                           unsigned int memflags)
 {
     unsigned int i, order;
     void *res, *p;
=20
     order =3D get_order_from_bytes(max(align, size));
=20
-    res =3D alloc_xenheap_pages(order, 0);
+    res =3D alloc_xenheap_pages(order, memflags);
     if ( res =3D=3D NULL )
         return NULL;
=20
@@ -562,6 +563,17 @@ static void *xmalloc_whole_pages(unsigned long size, u=
nsigned long align)
     return res;
 }
=20
+void *_xzalloc_whole_pages(unsigned long size, unsigned long align,
+                           unsigned int memflags)
+{
+    void *p =3D _xmalloc_whole_pages(size, align, memflags);
+
+    if ( p )
+        memset(p, 0, size);
+
+    return p;
+}
+
 static void tlsf_init(void)
 {
     xenpool =3D xmem_pool_create("xmalloc", xmalloc_pool_get,
@@ -628,7 +640,7 @@ void *_xmalloc(unsigned long size, unsigned long align)
     if ( size < PAGE_SIZE )
         p =3D xmem_pool_alloc(size, xenpool);
     if ( p =3D=3D NULL )
-        return xmalloc_whole_pages(size - align + MEM_ALIGN, align);
+        return _xmalloc_whole_pages(size - align + MEM_ALIGN, align, 0);
=20
     /* Add alignment padding. */
     p =3D add_padding(p, align);
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index b903fa2e26..3b05e992ef 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -79,6 +79,10 @@ extern void xfree(void *p);
 extern void *_xmalloc(unsigned long size, unsigned long align);
 extern void *_xzalloc(unsigned long size, unsigned long align);
 extern void *_xrealloc(void *ptr, unsigned long size, unsigned long align)=
;
+extern void *_xmalloc_whole_pages(unsigned long size, unsigned long align,
+                                  unsigned int memflags);
+extern void *_xzalloc_whole_pages(unsigned long size, unsigned long align,
+                                  unsigned int memflags);
=20
 static inline void *_xmalloc_array(
     unsigned long size, unsigned long align, unsigned long num)
--=20
2.34.1

