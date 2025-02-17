Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1339A379EB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 03:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889652.1298713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCG-0001u9-8k; Mon, 17 Feb 2025 02:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889652.1298713; Mon, 17 Feb 2025 02:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCG-0001qV-0M; Mon, 17 Feb 2025 02:49:24 +0000
Received: by outflank-mailman (input) for mailman id 889652;
 Mon, 17 Feb 2025 02:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGlc=VI=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tjrCE-0001oi-9J
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 02:49:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a9800f-ecd9-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 03:49:20 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9534.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 02:49:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:49:17 +0000
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
X-Inumbo-ID: c9a9800f-ecd9-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NG+wiwxQ6pMdFp41D9W/vFk2TJxqpXF/CY/kBoLswCZjPmI61o2EXJv6HRG/n/oqmbi0tuLW7Q6X7ocMoiepAqxSzne5qo8t5K/P5zawqjAGlTu+L4Zpra8HKtsia70qx7O5y5cODZWnv8sr5yPYihEKkbbzAPSsqRjR0uLusZCrPBJ9GklM/+WsK4wgd7VFDFYToU1WDcwLWk+HRLeiqQQT68RAmnpgq+4orjYpAA9hZIgHAK0L0Y4lFTtN6pg4VCChmqztGruwLFe5L6GG1MhzMTUJ9lUhya1/8VYxNK7qKRi2CVAzBwE9BMMLJLDGMERHTqn1ubWb4Q6+ZEH5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7p/GHrjsr8F4ZE7rkQrmBs/1k/mYhuWeTWyLqZKz7g=;
 b=NijasZtXI8VIEBU7NmS9njbvyubIDqPL7huBQ9X9Nsso4+KI1QFN/d2eKBI5qYM9qZpvI6Qp0/TJQK2hE2uxkDp7wEP4T3LjCQKTKbi6T6vL/Lut7e7DpDH19TWkPfPcnLIgOZxfma+hB4z/ihlTyBPrICJEq4BW0wr5vLLgP4ha7ryR47ySXyBWlaRYV5hQerbIG7yGlZBj5xJzrXobmcacQGnPB1ZlDDJlGOhM8ajh1iFndEHTsHDjiN4ThLe0po1jaDffmyFl6RZkXvkDufZ57Q5+4XdJEOOwHA3thj1dY5x1OBwaxhYpwaQ4CmsV1ysXH2ws7SCAu5ik6ZofVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7p/GHrjsr8F4ZE7rkQrmBs/1k/mYhuWeTWyLqZKz7g=;
 b=UawtOMqxOsTGYhjX0XY/PTf+A6mRnoF3kpyEkJ7mrj++AdNOVYDZjDexkAaOVy5yr7vSid7eTpK3AsR4Stbv/crHJEDIEewBdkSN2xdXdguUy19PIgC/3hCkCjC+qGLrJKvfyiewIMwL/y0ag6Ff92YVxAAy6LyYbOZ1l5TopIfwrLt2NM3GOsJlSSb7Hm2xDpThSFQEntodMKOTRd9VG+OwfjGr0lmxVp/aKkZNDGIGo7cVqx+KLtmVFM1ESy4RUVStEcsSshCFLO7/vYwY6lsRAG0TYGuYtrR3yhMMEq/oSPkRErucnzBnAWeaPn3pXDjlapdxPglsvLs8/UOUEA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v6 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbgOaJE6kDVTbKPE2BH7sXiNdS9g==
Date: Mon, 17 Feb 2025 02:49:17 +0000
Message-ID: <20250217024848.3059635-4-volodymyr_babchuk@epam.com>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9534:EE_
x-ms-office365-filtering-correlation-id: 365fe086-dc14-4bb5-7e56-08dd4efdac11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rfSHn/zDoldMNOSymd4O29bfNa4JT1K6W8D8lL/9FVZhI2nl1rvXX/poSk?=
 =?iso-8859-1?Q?cCl8NpNV/8wqj2OYwoy1abq7cEED1oqg+yltoKAg/rQFiXjmC0gXQAjrLp?=
 =?iso-8859-1?Q?9FqJ0Bm17by/dnRO1bB9I1GUWGu1q/bW0T/wpXcHA3RKfBBy7QJh4jDc1N?=
 =?iso-8859-1?Q?GMc/7jXd12fIBBwbbDnI4E66HvQiDnSE4H/8j73UhAfzJMe0Qva1VKtr8/?=
 =?iso-8859-1?Q?RPOd8sCdnmciDd1OuH/0XK83sbpwAo28Ts0U1u5/pBtgsXsYzRkUbKEUbE?=
 =?iso-8859-1?Q?624mxJOH0Gdy7YHmf7K3vG/afr44M5jVaAAcGAW2EGhXIbdbMc1QOWa7dD?=
 =?iso-8859-1?Q?WqXRRTKAG5Qq8Ih4Tj3tzyV0+R7s/hum5UKv+vnRJshjFWlpsn61TfeJoZ?=
 =?iso-8859-1?Q?/p1Bt7DlybF0l04M2YNxmdsTRkziegR5qJVFtklpb9XwMg5m7NrrmUdglr?=
 =?iso-8859-1?Q?u+zQ3uYoj3v3XaqoJGi2d3stbEqVaAF518kGt25EbX3p6ccqmC/Be+LGuJ?=
 =?iso-8859-1?Q?3yjlx62WctcEHAlha3ASH3Y1iALS+YbUvwL2XezIrnISVM5o7wafS3uN8O?=
 =?iso-8859-1?Q?a3/Hlh2pEsIJYaMz8VX5yUyGZfJHqcZn+DWbE4wfedL8/cwb2pnLzuXsIH?=
 =?iso-8859-1?Q?wYprf3/9PNWYh9y44KmnPyrt1bdNji1sSyruxPRfawWijZ861TJ0iW326f?=
 =?iso-8859-1?Q?//44y1x5HDEOVWYezdX90QVO6AP+48RhhKBAmqO40jqM+7RD4kFoamTqrm?=
 =?iso-8859-1?Q?uVPJZYL6Qee8DTFt25+0MMtuUuwGirzQDtMR295kp+/xI0pqmyZ7WqFZV9?=
 =?iso-8859-1?Q?6s59EMRSVHufImJg6WKDxUGuhwOPWk4bNzXLGlfFHF5QiuPZrzc/h+xAek?=
 =?iso-8859-1?Q?5BZKgZXjKmadg1H//7nKvsxmZHuWrqr/VdvZPgmV35RpY5ktNacWkTId7b?=
 =?iso-8859-1?Q?wnlSgciPkWQRQrslK7iS+hNii6I7vkxj0zvKemTq8O+Tp7OrYaD2KEUNHo?=
 =?iso-8859-1?Q?E5Ypw6F8tyYjlS4YlukZdd7NI+e3p+CTpFMFY9QhUQb10Vb1U7Nj8qENYI?=
 =?iso-8859-1?Q?942BJQZJWswoxKGob904hYMvRsQzGaDUKBpHrjVp3YorsFy2ncZw9BYGXc?=
 =?iso-8859-1?Q?6/juPgQaCkfSF2AcOUO2uKDZSXrQbT7NaP1ceOUJ1ZB1Y2iwH9NK27DY0b?=
 =?iso-8859-1?Q?XBqwUb/f2zyiqd8KncRAfXtXXxWA3TkNwkF6doAqa5HWGNRWeWkoQ9jeEY?=
 =?iso-8859-1?Q?8GVCDh+Hwk6qoFLRO2cvLcwEnQZZzAMwHRXmHsAMbkndGpKX9qqbyJ8mnf?=
 =?iso-8859-1?Q?RXaYfh4bxUEqaJvlPyNABmxPE9SO2J8+jAuti+WGLhbxtLmoMKZONzBV+e?=
 =?iso-8859-1?Q?1ZtCbgVx2yFYvtw04fvntDnw6Rj7QlIDQuGCcWJJAOJ+bXXrpwlwGfg3ub?=
 =?iso-8859-1?Q?3XA3KgMR4HR5tj19mIO2qi0Wjfag/xONLXQyUKQuEEs8JLyjzntp1eehqq?=
 =?iso-8859-1?Q?7nUrk52KqniwL+ooKUmolo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7GehUKpaBNBVSSjToNNGDAmi3nWSLTRO8ZzyOl1TwcJL8GG3rEXe72Lj2C?=
 =?iso-8859-1?Q?nxPnQU3w2JcKtPqxeDJNXrDn2Excl2LQAVX1q4b8SqQEr+LH6l+jL/45t8?=
 =?iso-8859-1?Q?ikLoMJoTt1U9XKC2ThT0RzQdUh1owWZGlktisj9u3Gtgba29+UqF0yASV7?=
 =?iso-8859-1?Q?gN1BIRX9G3vBrGtfNWteJNVZEWSyo+1HXCr+bzO7WmAvLsQulx+rzj6UKd?=
 =?iso-8859-1?Q?AcfVfXFyBckZrEg6Y/2iFiVHowN2TOmsK9JdNlhERoH0HKZ+KwFO++fqzJ?=
 =?iso-8859-1?Q?vIKiFmxW/IWvMYTi+UHuYOmme46zxnePFJf2h3UqQjtb6mBZ/PlKQIa/Iy?=
 =?iso-8859-1?Q?gSGOvSAyPkAF9DboSQMfE1x6GyIJkOSWtVreVRmi5LeCifNhh/fZURmkiz?=
 =?iso-8859-1?Q?uA1L6zacL4PGCieTNaOoi1OrHVLWLcUzbRp8RJu/VxT1recIQGr7wjvDWO?=
 =?iso-8859-1?Q?n/T4K54ou8lpO+8t2Yj8sdCdTsDxjPZBCSEqYPCltSDGGN0v+9ZFb/M+i+?=
 =?iso-8859-1?Q?/nJ/VrecE86MiwjGTwbuLxRTW4yJbjW7p5fC82D7C2WrmIUYBOthe4XPcg?=
 =?iso-8859-1?Q?M8KjVMUA/QMVY7QZHjLQO0AI4Ips4c19mbwnZndcuyL/LBBTcnxkl7MDQD?=
 =?iso-8859-1?Q?IFjIvw2h19ow8niHQIh9GsbeoWeQTB4ijrorT3FUNqGycXQKgic+29lpid?=
 =?iso-8859-1?Q?q0BqNBQvBUW5sKRQiSVGLOYvKwKYKKqongINx70c8UcFkRqSXDYMpTqMav?=
 =?iso-8859-1?Q?52rOWxzpTq9OCCcIl8v96HslWoJWDYpinssGjIyCy9HyzueP2IcCkjGIfS?=
 =?iso-8859-1?Q?S31jqOoBlqLDtJfrvKee1YaQASjNBKkXXGU0DYc/9Zvtq3owTj97FbXODW?=
 =?iso-8859-1?Q?gEWm6txoak6eRZjbI4fv6nZXVHzc0wqu8t/lWJH2KRyd6z0K3txVj8KrSG?=
 =?iso-8859-1?Q?UpkGaRtlKrQhkAbjcMZaRV6eFbVlhMUlW7MzjKyPBHoUD3R29RX65KXyuH?=
 =?iso-8859-1?Q?rDDVQNqID2DPIjmFqBH/zBvrTQXqX0diIdcKd5ILbKmeT8M0HV2gK/krQ0?=
 =?iso-8859-1?Q?Jaxv9bEpT9IhM4kGoS9xK4Dh6bshT9OyUgER3Mk3oHWr+X9sy4epksO2cD?=
 =?iso-8859-1?Q?GTKVnQT76QtqHSxnshPZgmaV2y6zhgx/ZDtYHAA+uP85r0eI9u0A2wda0W?=
 =?iso-8859-1?Q?XcMq2vK32CFUs13s3vNJKwTUTqO+FXHbOHBAUfT+rn2z+T5rZ284vi0cEi?=
 =?iso-8859-1?Q?wcS4EzrhpEYo8HHk+eHT25H4H8NNGaBxD7wT63KhEF53A+GzqDFKcV+d54?=
 =?iso-8859-1?Q?UMYN2kih0VKfJD2ujCtIny3R97lBqpoFeTAWWAOGrv6E5yKWtS+l0DuVGD?=
 =?iso-8859-1?Q?lBJsFknKVASd1zOBQbXP6EK2RP65ZNn27pywwMfec2IkYLN9c79117Jlfo?=
 =?iso-8859-1?Q?8LFqy8e4XYuqx+9IIFFwbTziFokhEdOWPaALdMP9JVdnbEz8drI/rVUt9Y?=
 =?iso-8859-1?Q?P9RGDSIkGmiQH0RWbe3tGdCprwbiJMZiJMtirpoCGjPkxUxiJv9/uqxEwx?=
 =?iso-8859-1?Q?Htwu6d7sUOKBtsNQR3VI/IF4B2IThNdXoxGXa7/9afHx3h30wvQjaUl3GL?=
 =?iso-8859-1?Q?Mn1bLjSTO1hauMLMw8GBh+jCF7bL46hA1GRcibU7sEv7WGCcbeeHL2/w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365fe086-dc14-4bb5-7e56-08dd4efdac11
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:49:17.4106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yl8YKWxG8WzK5FXwldUWMGP7QZbjC2OURPkBp2DwI2lUIZDWLqyOnQU/km54ce1XUDMZ1fcwxwqhPcs5kPh7C/NS7+m4h9UU8cTELilpkYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9534

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Initialize stack protector magic value very early, at the
very beginning of start_xen() function.

We want to do this early because prior to that
boot_stack_chk_guard_setup() call, default stack protector guard value
is used. While it is fine for general development and testing, it does
not provide highest security level, because potential attacker will
know the default value and can alter a payload, so correct stack
guard value will be placed in the correct position.

Apart from that argument, boot_stack_chk_guard_setup() should be
called prior to enabling secondary CPUs to avoid race with them.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---

Changes in v6:

 - Expanded the commit message
 - Added Julien's A-b tag

Changes in v5:

 - Call boot_stack_chk_guard_setup() from start_xen()
   instead of early ASM
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e1182..8f1a3c7d74 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
=20
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d..0dca691207 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -30,6 +30,7 @@
 #include <xen/virtual_region.h>
 #include <xen/version.h>
 #include <xen/vmap.h>
+#include <xen/stack-protector.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
@@ -305,6 +306,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
     struct domain *d;
     int rc, i;
=20
+    boot_stack_chk_guard_setup();
+
     dcache_line_bytes =3D read_dcache_line_bytes();
=20
     percpu_init_areas();
--=20
2.47.1

