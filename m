Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC9A05C55
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 14:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867266.1278730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoO-0000Be-8k; Wed, 08 Jan 2025 13:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867266.1278730; Wed, 08 Jan 2025 13:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoO-00008h-5V; Wed, 08 Jan 2025 13:09:28 +0000
Received: by outflank-mailman (input) for mailman id 867266;
 Wed, 08 Jan 2025 13:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbNq=UA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tVVoM-0008Lh-TV
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 13:09:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92022da-cdc1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 14:09:26 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6895.eurprd03.prod.outlook.com
 (2603:10a6:102:e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:09:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 13:09:24 +0000
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
X-Inumbo-ID: c92022da-cdc1-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0YYQay5z/DPHnPNEADwXZ6RbmZXxR/RuMgGA7P1ohZRaqzwb5Nj1uuE0uuAvZF1qOZH734rIRNg3fupBX3SJoiHV/beMfcFzIEfoP8q/DmGfNzKKr5yd07Qvt+GLziTt7jDHBAnVxIsl3kLAEr6f84zv4F1mbU+4JLybc/E1yXiANSMaCj3h2Xaq1jqGzMObIAbP9Z6fwlu0+dKMifrwQJ9RlSlZcN25ckHXCsMuNjWpqzyIVGA9qXAazMEQGLo3nPg3acP/UkdrHZKJa19ojJIeRYpJqyTQPZm8GBCRxFqHL6actnAF6YrYS/zHoO1txlAb+HyCZuueYV6bSMhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP881uQqwZ/UAQQCQM0enfTzMRcqn2M5xLVb0hyth3o=;
 b=Db/ZKuMDfGH7X7So+8CHB3zMwnGWrASlT6HMg7K8y65iMyMii0OdJCarOK8u3ATTnZ/Pn9YQjDCVZvj/ffbPGhSPBnX2X7KkNh3Ha1iWdXUKR7A4RQw+hu32bfFlK+zG97NeSkXj+njPZ10BGzlEz1ypXbQMv4JIUrvY5PDUnM2PNAgKsPLdS0+tBXbkeUoX6CzJ6efxtE7yMGP10X88Chq6zHJL8T9JQn5c1g0YhhGb7XucZdaMvtWFSEabmmF7JPfd3MDX4VFQbzOKKQWCJPeIjMHFomCjB73Ariw+O5PPLLoPyxU2inz53cxUfZQPBGNtzqtAg+BHsp81kBMzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP881uQqwZ/UAQQCQM0enfTzMRcqn2M5xLVb0hyth3o=;
 b=F/0uSs9co2TrbsLywcSypK3wwPJ9A7g6KTa03SKEou8RC5ySWfTmvJ6NrQxK5tV1SzQfKlgVUbTCdP6zqQoU2kObjRAlXT0zJyHH9NXdBqRBUC8tlVt14v4uX6/RI5ZmHrb0umdmIKVVXxuDrPFrzzZYQmWn/FzSMemoAwyuzf1+Y3YGTKn9SdXFpzXnQ233u796vT1iGsRBuycJvGzDL8+9R54NCl9/R5MzKNdH0CoY3+v2R2G7PHgIlEuIIN5+NzeILKVVcE2cPFRqW8nH26sfVFsvIZnBKWkgVRmnIrX9aM3XiHN81Ry6uoLMQ+9uN9SpZLbH1vw6U313KfVCKw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 1/2] ARM: ITS: implement quirks and add support for Renesas
 Gen4 ITS
Thread-Topic: [PATCH v2 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
Thread-Index: AQHbYc6JDAhmZxCQ3Eu7Expf0AOQsA==
Date: Wed, 8 Jan 2025 13:09:24 +0000
Message-ID:
 <e2544cace3517eb68cdffdc278f347584f93fd63.1736331828.git.mykyta_poturai@epam.com>
References: <cover.1736331828.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1736331828.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6895:EE_
x-ms-office365-filtering-correlation-id: 0cb64274-bdd5-4fff-6812-08dd2fe5ac7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rMECNaYCVnEg/QhE1eIqZK9GbszB/mcF4LVugNAkZL+71EjzFmRjGgVPJ5?=
 =?iso-8859-1?Q?IittsrVI55Zs4w4duSjPlQretvqeXxvxqmsl/M4A06DGK7lUb+cl7WDaH7?=
 =?iso-8859-1?Q?lLCkqcxOoWSlSs8i0wzFLn2FjCkhjPr9WaXMC394wTSL1quzYstO84QoPm?=
 =?iso-8859-1?Q?qz0Ij2x3nTbRHZvcFGt1aDIKqfm/Jkj/RRycL/gIQRpyOzv6huEDlVOvAu?=
 =?iso-8859-1?Q?hluufcslDcVVNJp39CV86/syAhGsbDqQ+kf689ReB93PmUKX15BOcMwWK1?=
 =?iso-8859-1?Q?EfPn1ewr7p+N+J+iSES7/+49w+1P2W9sv59wOaRuu/W3LxYDERGELnmHJ9?=
 =?iso-8859-1?Q?UjdWR6wc0VcYknerc2u3DzWHRIGuBCeZnCjgl0N87QgpO2XoZmek6IKy6b?=
 =?iso-8859-1?Q?PUtxLAPBFFajGiVqN7FM5UThNs+csHnbXpsfYruKek5U9gpfyzJXtWP+WF?=
 =?iso-8859-1?Q?7q7LewqhKSU8LkZr6tIgG6WKVfGE9cNvEArTQrUYwQiHDR67mQJQC1JSM1?=
 =?iso-8859-1?Q?sKk94f3uzTCg64112aE4Q612sBFl5Ar47DTsN6eLQ2Mw/yEMJ4yvtAoc5P?=
 =?iso-8859-1?Q?dXEFu3Yb5z7+9ig3Qm/LcyCCR+tYVphrPVQGCM4zI2rNoj5A7vWQTO8K9T?=
 =?iso-8859-1?Q?uaw5rhjAEATmDz7v4cci3dyK2JxLMO4pjcmLn1dHMwTrYtW70bO8+D1rPS?=
 =?iso-8859-1?Q?HHQBhreuXNpjDbJ+9RY0U1ZpdILAR7V517KWRJ3nvAa/PNQIFCyJulQyM9?=
 =?iso-8859-1?Q?9kV2+hWae5b9c2Y7qi6KFaTKkmrDjPltnhvO1IQN/89ILIOoeTJA6CoSGU?=
 =?iso-8859-1?Q?A9EpVlKlXeYuhNBnFHVSTAafDOvZZ9C6P5L07OCS5mYNuVqcnp0Oz1KUOQ?=
 =?iso-8859-1?Q?TsyZAFucQlJwmMP9wDNrG1B6U39G2f6YHXiXz13Wl1xcji5XltTexmu0Xu?=
 =?iso-8859-1?Q?dLfvkkA7/8RKjARr15AITwHTS1dfh+HTIi/tsLBSS7Qrv69XB5Uh4JV6p1?=
 =?iso-8859-1?Q?qoET5OLR9ikJMxj/er0c9McjheS9B1Z+0+z4rlYPg9cP5Esq0FfnSgvvaP?=
 =?iso-8859-1?Q?oqf2kz2MAQcb3KcvRepTVcnmbvuMLwKmsBLx3fYTXUDfHlOZdNvPL5Sxap?=
 =?iso-8859-1?Q?fYvqhFnz2qKJTK0hS6ws+PGWn0sQa9u21PNpxkB0BRbUltoGZ1Fa6UX7Du?=
 =?iso-8859-1?Q?s1Q/10nxoF1f6n/d62eqX23lVnX4bVWMINdYnGuOgz64vf18ZL/U5DWT8J?=
 =?iso-8859-1?Q?QC8c4zUT6XvtlDhJ6DMnu1ni6zAs/MK8Krh+uIt8j4PqtBv04go96+S1s4?=
 =?iso-8859-1?Q?EXoPhF5gYBzFHD1DyRaLAPPONqWmvSmj7bS6lcZ8jiLREh1/9j3jm3T5xE?=
 =?iso-8859-1?Q?jKASG5M8GMDTTc2nXZmXbiUIc5AJgcOCVcNSGASubsRM8TTDIO04PYLIoC?=
 =?iso-8859-1?Q?APN3Lw+YkZV5ILso?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nxropJGPTXJL8H7DjWi2mMtL+vCPbvi4qSCDSxRC7QUMwCUsUAqW+hN7ty?=
 =?iso-8859-1?Q?DfFw/2ghBb6IXnR53PpwtPiIdSwuXA1s6hTbLXpf9vEvkfpIdxYc+RM85F?=
 =?iso-8859-1?Q?cm+S9olSKAPkHcidMQUGHYB4C7RdGkcc4lfezADSq7iCBk9vmAnCLj5HLx?=
 =?iso-8859-1?Q?W809beJS/btl1Y1KVhg6qE5Dz10U5vlheZ7DQxBmFAlfvNvnq7aSbMc5zm?=
 =?iso-8859-1?Q?wqzBSApDl4IXMgx5DuryYif+jrkoX3OpAJl0GUR4nC2ZZ6+Gr/yxyWrOj+?=
 =?iso-8859-1?Q?+0et47WTwekuKtjOyWtH91irci503QG7izNn4fOBJ++FDIZsfqTVqa9LQO?=
 =?iso-8859-1?Q?BLV1Pl6vDSs1GoLK/QyJDeEu2JlmqcoCA/4NZHvDi7or2HIE27GozhCcEo?=
 =?iso-8859-1?Q?10WbiokGnMdQMFazkjg18bytK1U1KwAPLMnci9LK2qp95shVvP5VpDHvCF?=
 =?iso-8859-1?Q?v13wdkbCJqVLWy3yseTcpfPalYWKK9U86PFt3g0xGyEhOpN1wnK/amULnd?=
 =?iso-8859-1?Q?xNu/FOsk+uRERt4veJKs1bYksguz6aZp1EfOD/hQhcqqPpMjBXdS64Knfw?=
 =?iso-8859-1?Q?z8SuMYnSFHH3lBq1FgzHKiLH4BdxBeUPH6hfIt/IsTXvw+h+yaf+lTq9LM?=
 =?iso-8859-1?Q?3wBDmubAzmaOTyhOYImLHUKUt0Ua/b31L3l+WtPewCVwAJEt9PY6+/o4yf?=
 =?iso-8859-1?Q?lfiLXTR/XTUJdiCgKytcP+L7DUozjp0iLzuB4sltX7NB/UoMkhEw5bCKS7?=
 =?iso-8859-1?Q?tN8G9BC0MIsPQXvpM4VDAZIMFcKoc7etscUZUTYKj2r1wCLXHtL6GV842P?=
 =?iso-8859-1?Q?jwLG1euH3E00j04WMTKn2bTUF+jUjIBm/V9qrOOOBvOc8VBP2Luy4/2WRz?=
 =?iso-8859-1?Q?OGj/nLCpAOSvzQ0ZJyqF5uKcDXR6QVA6bDBNaVfEH5uqVFOG+ZDxs53aOm?=
 =?iso-8859-1?Q?1S3FtwFLN5eKM5YaWmr3u4AWtUEXZ/Hh91qHgf3rAJ6nMc//H9Fu+/Qx0A?=
 =?iso-8859-1?Q?wzDxJDQlap/YDn7+ZkZnf/tPOHRgxtB2Jvp/3r0CqaXzMvCoEn85BuDvRn?=
 =?iso-8859-1?Q?a6OZlL9Ai8th1f+7WJqF4hreyBrTfanE0z5T48AEFvFJEwrI4IdpQ7PyH6?=
 =?iso-8859-1?Q?j4lCnfjhKucBzytPA0o+Z/c1utZ6eTI+chUeyPXrQIM1zliXyExyPv+rKX?=
 =?iso-8859-1?Q?OB+wCRumQH8Y870iBSwbYBYaTEA8E/RquKWaB3/iSkgoMgJ5BxJ/ZChhez?=
 =?iso-8859-1?Q?cQkoFupQGlO8V8CkK1uP3/EIBqtPOmju/Twi5/QBmgZNEC1Ahq5vIeWZPg?=
 =?iso-8859-1?Q?AknO/1/pKitWlQB5atPx9kKE96FqICmWaCOQuksZ7mI7XkP4/lLLkiXRq9?=
 =?iso-8859-1?Q?KcgtMJto5zxpqBgq/lbpwsiBdyPz6qZnayy7ylRREnk1fBO4EqsAt7Ma8m?=
 =?iso-8859-1?Q?vJzV2Eg/rW2kuvPH0C7kgcwxgcXhUtl7+BCWY51Y1FaWzNntK2L09pfazf?=
 =?iso-8859-1?Q?9r3WFxKG1t8vGNyrn7aehunudVsCbGsZo6iMuORu1uu77eQ4y8g56rwqhv?=
 =?iso-8859-1?Q?n1S3LlIifHkG1a5s51HlweOm4LUVt8yo5GdOUXnHYdYE49AFhcgncVGhPG?=
 =?iso-8859-1?Q?vLcfl36lBUxVSlXKu0qjh3xst3f38/kwQhzs9N0xZPwRWhHqgKL9Klgg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb64274-bdd5-4fff-6812-08dd2fe5ac7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 13:09:24.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aX6U3Uf4kNyoJNIpbbg7WeSZ7nFEZUA22xKOU+4VIbviSNFIVNiD5gaDb2bu/uMOmmFnwDi1mf3H5b/SHQdW9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6895

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
- change relevant memory allocations to alloc_xenheap_pages which allows
to specify memory access flags, free_xenheap_pages is used to free;
- add quirks validation to ensure that all ITSes share the same quirks
in case of multiple ITSes are present in the system;

The Gen4 ITS memory requirements are not covered in any errata as of yet,
but observed behavior suggests that they are indeed required.

The idea of the quirk implementation is inspired by the Linux kernel ITS
quirk implementation [1].

Changelog:
v1 -> v2:
- switched to using alloc_xenheap_pages/free_xenheap_pages for ITS memory
allocations;
- updated declaration of its_quirk_flags;
- added quirks validation to ensure that all ITSes share the same quirks;
- removed unnecessary vITS changes;


Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

[1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic=
-v3-its.c
---
 xen/arch/arm/gic-v3-its.c             | 141 +++++++++++++++++++++++---
 xen/arch/arm/gic-v3-lpi.c             |  20 ++--
 xen/arch/arm/include/asm/gic_v3_its.h |   8 ++
 3 files changed, 150 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 5fd83af25a..8849ac6c4b 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -42,6 +42,7 @@ struct its_device {
     struct rb_node rbnode;
     struct host_its *hw_its;
     void *itt_addr;
+    unsigned int itt_order;
     paddr_t guest_doorbell;             /* Identifies the virtual ITS */
     uint32_t host_devid;
     uint32_t guest_devid;
@@ -50,6 +51,104 @@ struct its_device {
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
+static uint32_t __ro_after_init its_quirk_flags;
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
+static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
+{
+    const struct its_quirk *quirks =3D its_quirks;
+
+    for ( ; quirks->desc; quirks++ )
+    {
+        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
+            return (struct its_quirk *)quirks;
+    }
+
+    return NULL;
+}
+
+static void gicv3_its_enable_quirks(struct host_its *hw_its)
+{
+    uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
+    const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
+
+    if ( quirk && quirk->init(hw_its) )
+        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
+}
+
+static void gicv3_its_validate_quirks(void)
+{
+    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
+    const struct host_its *hw_its;
+
+    if ( list_empty(&host_its_list) )
+        return;
+
+    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
+    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_II=
DR));
+
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GI=
TS_IIDR));
+        BUG_ON(quirk !=3D prev);
+        prev =3D quirk;
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
@@ -289,19 +388,23 @@ static void *its_map_cbaser(struct host_its *its)
 {
     void __iomem *cbasereg =3D its->its_base + GITS_CBASER;
     uint64_t reg;
+    unsigned int order;
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
+    order =3D get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
+    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
     if ( !buffer )
         return NULL;
=20
+    memset(buffer, 0, PAGE_SIZE << order);
+
     if ( virt_to_maddr(buffer) & ~GENMASK(51, 12) )
     {
-        xfree(buffer);
+        free_xenheap_pages(buffer, order);
         return NULL;
     }
=20
@@ -340,11 +443,12 @@ static int its_map_baser(void __iomem *basereg, uint6=
4_t regc,
     unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(regc);
     unsigned int pagesz =3D 2;    /* try 64K pages first, then go down. */
     unsigned int table_size;
+    unsigned int order;
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
@@ -357,13 +461,16 @@ retry:
     /* The BASE registers support at most 256 pages. */
     table_size =3D min(table_size, 256U << BASER_PAGE_BITS(pagesz));
=20
-    buffer =3D _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
+    order =3D get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(pag=
esz), U)));
+    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
     if ( !buffer )
         return -ENOMEM;
=20
+    memset(buffer, 0, PAGE_SIZE << order);
+
     if ( !check_baser_phys_addr(buffer, BASER_PAGE_BITS(pagesz)) )
     {
-        xfree(buffer);
+        free_xenheap_pages(buffer, order);
         return -ERANGE;
     }
=20
@@ -396,7 +503,7 @@ retry:
     if ( ((regc >> GITS_BASER_PAGE_SIZE_SHIFT) & 0x3UL) =3D=3D pagesz )
         return 0;
=20
-    xfree(buffer);
+    free_xenheap_pages(buffer, order);
=20
     if ( pagesz-- > 0 )
         goto retry;
@@ -453,6 +560,8 @@ static int gicv3_its_init_single_its(struct host_its *h=
w_its)
     if ( ret )
         return ret;
=20
+    gicv3_its_enable_quirks(hw_its);
+
     reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
     hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
@@ -530,7 +639,7 @@ static int remove_mapped_guest_device(struct its_device=
 *dev)
         printk(XENLOG_WARNING "Can't unmap host ITS device 0x%x\n",
                dev->host_devid);
=20
-    xfree(dev->itt_addr);
+    free_xenheap_pages(dev->itt_addr, dev->itt_order);
     xfree(dev->pend_irqs);
     xfree(dev->host_lpi_blocks);
     xfree(dev);
@@ -619,6 +728,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     struct its_device *dev =3D NULL;
     struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
     int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D 0=
 below. */
+    unsigned int order;
=20
     hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
     if ( !hw_its )
@@ -681,10 +791,13 @@ int gicv3_its_map_guest_device(struct domain *d,
     ret =3D -ENOMEM;
=20
     /* An Interrupt Translation Table needs to be 256-byte aligned. */
-    itt_addr =3D _xzalloc(nr_events * hw_its->itte_size, 256);
+    order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, (uns=
igned long)256));
+    itt_addr =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
     if ( !itt_addr )
         goto out_unlock;
=20
+    memset(itt_addr, 0, PAGE_SIZE << order);
+
     clean_and_invalidate_dcache_va_range(itt_addr,
                                          nr_events * hw_its->itte_size);
=20
@@ -718,6 +831,7 @@ int gicv3_its_map_guest_device(struct domain *d,
         goto out_unlock;
=20
     dev->itt_addr =3D itt_addr;
+    dev->itt_order =3D order;
     dev->hw_its =3D hw_its;
     dev->guest_doorbell =3D guest_doorbell;
     dev->guest_devid =3D guest_devid;
@@ -775,7 +889,8 @@ out:
         xfree(dev->pend_irqs);
         xfree(dev->host_lpi_blocks);
     }
-    xfree(itt_addr);
+    if ( itt_addr )
+        free_xenheap_pages(itt_addr, order);
     xfree(dev);
=20
     return ret;
@@ -1089,6 +1204,8 @@ int gicv3_its_init(void)
             return ret;
     }
=20
+    gicv3_its_validate_quirks();
+
     return 0;
 }
=20
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de4b0eb4a4..a8783e7d95 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -227,6 +227,7 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int=
 domain_id,
 static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
 {
     void *pendtable;
+    unsigned int order;
=20
     if ( per_cpu(lpi_redist, cpu).pending_table )
         return -EBUSY;
@@ -237,7 +238,8 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cp=
u)
      * The GICv3 imposes a 64KB alignment requirement, also requires
      * physically contiguous memory.
      */
-    pendtable =3D _xzalloc(lpi_data.max_host_lpi_ids / 8, SZ_64K);
+    order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (uns=
igned long)SZ_64K));
+    pendtable =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
     if ( !pendtable )
         return -ENOMEM;
=20
@@ -272,9 +274,9 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_=
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
@@ -300,10 +302,11 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdis=
t_base)
 static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
 {
     uint64_t reg;
+    unsigned int order;
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
@@ -312,7 +315,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rdis=
t_base)
     if ( !lpi_data.lpi_property )
     {
         /* The property table holds one byte per LPI. */
-        void *table =3D _xmalloc(lpi_data.max_host_lpi_ids, SZ_4K);
+        void *table;
+
+        order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (uns=
igned long)SZ_4K));
+        table =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
=20
         if ( !table )
             return -ENOMEM;
@@ -320,7 +326,7 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist=
_base)
         /* Make sure the physical address can be encoded in the register. =
*/
         if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
         {
-            xfree(table);
+            free_xenheap_pages(table, order);
             return -ERANGE;
         }
         memset(table, GIC_PRI_IRQ | LPI_PROP_RES1, MAX_NR_HOST_LPIS);
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
--=20
2.34.1

