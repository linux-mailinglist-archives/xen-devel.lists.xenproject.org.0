Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576FA11D6A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872257.1283233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzaw-0003pV-CK; Wed, 15 Jan 2025 09:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872257.1283233; Wed, 15 Jan 2025 09:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzaw-0003mk-7T; Wed, 15 Jan 2025 09:21:50 +0000
Received: by outflank-mailman (input) for mailman id 872257;
 Wed, 15 Jan 2025 09:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbvD=UH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tXzau-0003Ki-DE
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 09:21:48 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b53aca-d322-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 10:21:47 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB6795.eurprd03.prod.outlook.com
 (2603:10a6:10:208::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 09:21:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 09:21:43 +0000
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
X-Inumbo-ID: 24b53aca-d322-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWzviWzG+wdPPdJZsdtIlik8R9N5TZX1rV3/DkR3bnV9cZKB0/dYKHGF3fkuQT3Y8b3GsgCXSAoJorC8j266V58fsq5sR7dStIDdivmB/o+TWhRoKTRvbeJgEyXYkmfWqBRrc0HUTjYjJc4hFZKYx/dTKh5145cluBYziQoFKjycmu8GUiE4AUN5N68QxPX5pa4L00ZV0FAr/8qhApcjzYIMasnfKGeh5K25ZJSGeO2h6nsEcdgW1GAdM/dRFU3OlSexXJ6lviuZC6Hc4diAoWFFLITYiNFUnQGgQyu6UTAgF9HIr7VD8gJPW9lpuYHg5T1xsrNffhGkhNilQs7foA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKsl8GcaXqAmsTB43yLP50Hu8RNut9fYbLp+jWITYjE=;
 b=L4Ik0Yd5/GnbUsCxzA1cl/0sjMoZq37rlTtgp2TeGIEPuk7eR47kzu7HFV6MoboyQ3oDCTAZKK0dvO2+5ONiuMoe4hiaSn1bZFt7vM3r6gZwVE0YtJMnMFjhYJWc0hMdJOjhhVvdlNGR0Tjlp01fZQsIWS9V/MmnJYW9PPKYxQkGrfY86MD9ji3NL4ag516PwcCEWSTMaUZiyYmb4zruDHA/KPXQuPp20KP7TToQU69uMRKKVqlIUWStvRWz3MU7ma9R3B7oEe3exPncd4An0Hek7uHWH9LVYa8/HIE4EflYJDl7/5c5A2jvyRBJFIjmlEuYF5VoNV79BnqkGLwFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKsl8GcaXqAmsTB43yLP50Hu8RNut9fYbLp+jWITYjE=;
 b=Mv1+Cwmyto61WUSAleAvM8rDqvB9vg4r6wqrjnYYQRZbw4EOKXlqgFIHRUCtWYARjb/HFa/GiAdK2uMfXEAGhNvm9NFdNIVfU5NTfhlLDII2SOzu2M2Pr/RKhyt6a8NqNqkcAuhlKrIge8RU+PCj9lp0Ly69087MHz6PkgiS8KgGltNOGkOhtMS8hdjRpSYNUzd2rNW3PyJS/289/T1iMZx2wIkLIcj0CDrFQKprjUJ9c3ZLIdE3+p9YfrAC9dvN6IlGCJj0kV63sXjIi4lbvHHCyDRPNV1mCWjqzlj+hWLMGJK1h+5wEkEyfSsfWQKwpSMgCpdJkpfWlh/kAVA/fw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 1/2] ARM: ITS: implement quirks and add support for Renesas
 Gen4 ITS
Thread-Topic: [PATCH v3 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
Thread-Index: AQHbZy7kqk67VXALTEqusTd56sWExg==
Date: Wed, 15 Jan 2025 09:21:43 +0000
Message-ID:
 <f165108869cc485ff45fbe870005040c23e83b6c.1736931052.git.mykyta_poturai@epam.com>
References: <cover.1736931052.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1736931052.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB6795:EE_
x-ms-office365-filtering-correlation-id: 1224ea3a-acf0-41c5-f229-08dd354606ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HbgOEWomBsVMblGomYzUQN9mpmgnEV633AyiOW1O8uqR9DfAJP5O9huIxz?=
 =?iso-8859-1?Q?OOT1OfgIMLkKC2QEDkHrileXrdoxVIpqoa/na/qD74BM11dlHk8bVd2d2R?=
 =?iso-8859-1?Q?fmdf6YWXh0jZu6GPGiV77my/eUEZJx1anBNQQQB8g3Ng7cdDq/BjuUpC01?=
 =?iso-8859-1?Q?mdTsbdT45DWRmG8sXEkqz6lCMZPIsMyE6VqV6mD5oxfu/vUiflibo7JPwZ?=
 =?iso-8859-1?Q?I0reefUe3vbacDG89EJWAspHetzs1q2GXrlSFObuyw7IE+174IHuOtyye8?=
 =?iso-8859-1?Q?r9r8Y0H6RJKBOqM17gy6HBbEkdfv5xT5oNfuvvOubpIY/VHRJeMInjPTSg?=
 =?iso-8859-1?Q?MhcGgl1+bX7WWG5u1PG51wLQPqlZTGfLwd+fSa4O2tRnGcfxZJXKkwcw1u?=
 =?iso-8859-1?Q?5rXpnNzaMUFw7JS0LtYIFhwclClYkmnABzO4eykQWPKTNKL4QnuFa5OHmG?=
 =?iso-8859-1?Q?XQyM9Zlhk6hwdbVe3oUklRqpya6Dbtv6pNd1jGkwH4oGSA3vlgLlJ+GbYd?=
 =?iso-8859-1?Q?xmgY4yK64ZoFdlKnfqSAVk7YeZV3ICC95b4xGTUlxl2biWYPVHaQqZaQV7?=
 =?iso-8859-1?Q?unsx07Tb0fE/HJoU6urVITnoudYQ+cjYPjvbvv6aiOxAmmHlxgz7NoHXV3?=
 =?iso-8859-1?Q?lozKtdbzYRJIaqQDpoxcGk11UJ/t9NJiLu6d3HfhQjvW5VBKX+HUtivck2?=
 =?iso-8859-1?Q?ut8oTfip91I+e4K2jlnNGwspT2AmbUeOOCJaRXG8OZSIISJx4U2TWc5Aqa?=
 =?iso-8859-1?Q?1GMBxhkDtBjeBqnlZizHGUmbzDqRiTyNToFUBOuqUcGfFUYmnlvM8CdBST?=
 =?iso-8859-1?Q?C+DwmT1FGdo7fOqjMn/+1S3ppO5OEHi2AXxLi+Q52yI2WNH8EUvUpE+/oH?=
 =?iso-8859-1?Q?0SWdldS4JhfP08pROq64LI6IISV4GIyVm41C6s9rsgFSv7vsKksBaT9+Xj?=
 =?iso-8859-1?Q?Q3F85P+HMCTRuYIgUVYVb2f1l5qfEOxMjViWaew23gRE5RbdIA9TuWihiG?=
 =?iso-8859-1?Q?YYO7wlNz12uNZCoR4q0ePO23UCDa0g+BYaTa0rwLVnsWdON1KjbwE2lZgw?=
 =?iso-8859-1?Q?15Brwi9YbGIIdpcnUoOE9U+WEK9KSiw5JIOxM0gSyHNI0xd0/xi1oI/Bvg?=
 =?iso-8859-1?Q?UpPhwfz0i0ssJl6FvpQUXcuIflvRvfhI9gXlo07elS//WdEkd1ATC1FSoh?=
 =?iso-8859-1?Q?EA0qY2kUZj2uWCnjI18zqv2l+ZjUArEyC/fmCj0vmrNYQA3kbKS8DFyLUh?=
 =?iso-8859-1?Q?s+8T2WpKbn5rGHbGXckx99beafl5m1Jmwjh3o1J3GCrEOVwEChVayKaD04?=
 =?iso-8859-1?Q?lhcHqk9jST2MGv4mQS+5IDNH/W2XytDyUTIbZE+AHX3RklpjN6S7IA0tU7?=
 =?iso-8859-1?Q?GEmec4CWdK8JP/Wm72wjZ77/8MwbiYiG2bTFKRKS6aNtzFT0FHtJUGLsbU?=
 =?iso-8859-1?Q?H6jB9AhrUb2mxlrB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QrYtzkbOaeJ2DpFy2888KO17nrDD3n64CvsklMem0WWJuVWzO8LWJBhW5y?=
 =?iso-8859-1?Q?gQOLcCXgEEWKok1bd9MFEyxVre2ZBSq2gLOCDcWoJD484TPtT7BkASMOKZ?=
 =?iso-8859-1?Q?pDLjFP6LT+9kBd2ntp5yane1m2EB9nfpbqXcx2y8UGcYLtaEEgApy5K5kf?=
 =?iso-8859-1?Q?F0brdWuLxby7rt5NPbDLTtDHa30EWvu/xjO0bFy1mOX/hEAycQZ2DYNoaZ?=
 =?iso-8859-1?Q?5ahShhaKa1942pZL4Dg9ebFg6tGNWTIDULXNSRN/X6dP54x3JoEQ66KSc0?=
 =?iso-8859-1?Q?k1+dNnSHONvWkS87WeRHsG4B5a9lp3InM+1jk7ZiUK65RiMCuOfZsyIVAe?=
 =?iso-8859-1?Q?eAZoXz5ioljiUGNbAqGfly2h04Lrq9oiyDDyy7a5/1dePdShVthbkZIdSn?=
 =?iso-8859-1?Q?er1LG2VZ13iipO0z41TP6LGk70HwRJvKW8FXh3S7QdwSqDvwHZ68dN9cUr?=
 =?iso-8859-1?Q?Q1ct4H90NZ6Pb3jAu0YUeObCi4C50atPZ6kPwyzbOUGfZWrxd9jUmAm31W?=
 =?iso-8859-1?Q?lwhXj006WaZXHfyfU2/5UYL2oT+tyD/jNvZfutUGxatJuHDv1rBfcV9njh?=
 =?iso-8859-1?Q?ZcWX8AtkQycMZ0i2r6ufJA7zmkeOjov2WBdXuoqPXQe6X/ee01Uv2tRJ7O?=
 =?iso-8859-1?Q?AELWbNyVznbwstj7OJP3archzimbSRi04cDEKA64sHADEz2xJz+T+BQLgv?=
 =?iso-8859-1?Q?+RI0ZJWpmNny8Lelo9vRnTAvxiPWAwAYMeGzTGbGf730H87hFEKc6BD+I7?=
 =?iso-8859-1?Q?Lp8/T8rK5MBOb7WdoBAu5XXgHqJVi22Ll2EHakmWBb3vymhJeGyYIRw375?=
 =?iso-8859-1?Q?8f1XymKs1N6MYDIsNuA6iAEUVteQHclNPF7sfPZK2cJtcqKfE4HU/BBa4G?=
 =?iso-8859-1?Q?lQIOSYkofEjLTVDpsrHRiBtG8dk4cMDWK7HPqv45qFEk7qjdLRFoHjIYXS?=
 =?iso-8859-1?Q?rcVHso4Q3Tdwppj7g2ZZFaQZMwfsvK7JSHZ04hiWwVIEqrr70BNjkhc2mO?=
 =?iso-8859-1?Q?iNwiMWgxarzRUwhZSnKL0ziIYosio0rC0OPim0UC5Y96hbTzorKbuc+O5J?=
 =?iso-8859-1?Q?AIUwpoatz/K3vQhWcPctngQ0E2zwudvzGdf/56y3jJw+LdwxGudJexYbQ3?=
 =?iso-8859-1?Q?y8JOaXIeXb0WG0iuRRHE+7O+REqx/avaD9d7fFjrPHB81FS3JkhyoGAZOb?=
 =?iso-8859-1?Q?qZiP6UTiyxUvj/Tu0FATOV4wKmOBnoV7gQwGuVG1+b9NtpsC/7JJlw7UBD?=
 =?iso-8859-1?Q?xzYUOholFbeseaCkX0eINkPa3Bz33+viUxAESF1AxcJUGUeJk0HY5JO7WR?=
 =?iso-8859-1?Q?w0YQRGGgwfyxu/tnSk0+nmcXfmCZVJl8kK6s6OmSkp7v+AeH+HQ2Ox/Jqp?=
 =?iso-8859-1?Q?9KFvXlXeAdhUvc++RvSAdQMUQditdk2OqrPc26oBhFQTJyuniQQ83zBHYV?=
 =?iso-8859-1?Q?Ddam5KMyIDaLFrKFzSlTiB692AwTnYXI2d1nELNUAAIhCGasoKJJoQNl4A?=
 =?iso-8859-1?Q?PvGBU24bK9zKrWGnVF2P5CFlPgofcEOizOUd95S+z4KngWWOFHtb5WNvOn?=
 =?iso-8859-1?Q?7OvJ52SRAZmfxklG8x6sXGonv8VTXXv4g53t6HslfES8SfmYLTjfMaespS?=
 =?iso-8859-1?Q?ImVJl5M1WoLnX4NTarXjGa3hxDIErxwgGqA30WC7xrI0oR/IEc8ljVpg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1224ea3a-acf0-41c5-f229-08dd354606ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 09:21:43.6250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2hCCpJITGd90GKrR0UV5sRy3T0t2+19nuXSMQF0giCwTqgvhAvJnlBNexSNkIBNFFO0lprElGTGqKOaNkSZYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6795

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
v2 -> v3:
- added missing memset;
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
 xen/arch/arm/gic-v3-lpi.c             |  23 +++--
 xen/arch/arm/include/asm/gic_v3_its.h |   8 ++
 3 files changed, 152 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 5fd83af25a..34833166ad 100644
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
+    order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, 256U=
L));
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
index de4b0eb4a4..de5052e5cf 100644
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
@@ -237,14 +238,16 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
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
+    memset(pendtable, 0, PAGE_SIZE << order);
     /* Make sure the physical address can be encoded in the register. */
     if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
     {
-        xfree(pendtable);
+        free_xenheap_pages(pendtable, order);
         return -ERANGE;
     }
     clean_and_invalidate_dcache_va_range(pendtable,
@@ -272,9 +275,9 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_=
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
@@ -300,10 +303,11 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdis=
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
@@ -312,7 +316,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rdis=
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
@@ -320,7 +327,7 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist=
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

