Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4354C699EC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164703.1491632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsx-00059k-GX; Tue, 18 Nov 2025 13:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164703.1491632; Tue, 18 Nov 2025 13:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsx-00056W-Ap; Tue, 18 Nov 2025 13:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1164703;
 Tue, 18 Nov 2025 13:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLsv-0004PV-Q0
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:41 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc9271e-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7217.eurprd03.prod.outlook.com
 (2603:10a6:20b:26d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:36:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:33 +0000
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
X-Inumbo-ID: 9cc9271e-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOlHA6XMDxKFhvyBH4YSvI2OIvdsiltn4k5bzRsiOan8ojX5PWlKWw0PPpzzJgShFvlwCAeOfREPCn/0Y5TtX6pWlPTzWOSIM7/nLT4bce/oBeXMjx/BB1Ow8BlHrsAeTrvU/Y6A81s1M3+twE7BsLSzJkP4C7GLSdgeGTVZzgUxhqrpvFLdgKGE+5LUfwgrGJCMmTex/2Gv0UTWW9+hC2m2kdDfdUQYRra9s4b/kn5YEdWSCFFHl5b7z0n+7OKBAf+LLP6+bQlwn0Imu8wlW5os7w4YVh1iIuqpgf0P+Ij/DmLnmcIYS41eSj4nYGZDGrkyemzeaaBg93vUsvHteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XEVTCh2kUTAALOQ+qR0XRxV/rN9vWfIGZCISaZjGHU=;
 b=HYoHkDv8D4nkSF+llzhuKIeeRKwR/b0d6wqADQvoGHYoto0trUyxtgLE1KW+seiu84B00lo5GziEsClTwju2gwyumjf5T1F2pIKmwCprKf6pXNGzFZuKFsj7oseF6uFuLeI1baBdgG3EYN4JHUfGG5PRKUo+aTqC5+uvzTjt0AWXNHQvj45XqxwLYEZzf9Jo5Z4sychXXAzCY3Kc9vRev7rcNXsfaD3h5p01OQuVM1rp8Or9to6yv8ha/m9eSOsH1ppNpYiRQlkoTqvHE/E1EkjxWjPjD2um6Lmuj2au1Op2U9ZBX4CGvpZz9o4rwiAuT2WEts/IYO3ZIznhjIBZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XEVTCh2kUTAALOQ+qR0XRxV/rN9vWfIGZCISaZjGHU=;
 b=ImcXloApzr5K3uzA2nEg6Vynznz3DeF8yNkkphoNcCIMz+y4YJJKxqt8cxdtF1ryCcoVoNYWCZdiGm4oYpXVkxh50kuCuaOQWDoq8zh1Z/KJGMvr7g4el4As13HH/cJ4/TULXf2kS9yI/+hLChOyFj5u6JTaxYj3ni6T7QrCGpriusOZTtdpRHDXEXayxZU3MuY+RlFUvXiJdrfZd9vC8dK9Ylm+z0OoSSyE4P8JHCYk5+Emaahee+4e7tl2L86MpuCUPZe0ZBdYceCCZxf8hBu+TcEPJ4mXarIGKKBmCg07qmD3BHmPGMbaIZqX/anOukMKaMaHD9RNPIvz0aZvHw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 2/8] xen/dt: pass flags to callback in dt_for_each_range()
Thread-Topic: [PATCH v3 2/8] xen/dt: pass flags to callback in
 dt_for_each_range()
Thread-Index: AQHcWJBaNx96+qKbF0KY5H+PAaMMXw==
Date: Tue, 18 Nov 2025 13:36:33 +0000
Message-ID:
 <c96978ea8916d53ce9fb50846dc5c57165c8cbd0.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: a6d76af0-2139-48e3-661d-08de26a77d26
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IiziC9mSMMdw43XI5CGbgrB+SxxHyiR+gUci0nClpmnoEJVn3repv+0B59?=
 =?iso-8859-1?Q?lnw4iddSEmNdvlv+A0ET6q3NwfpGXrg9saVw/fvqyOKb1BSDxagYCX6rVA?=
 =?iso-8859-1?Q?MamzqOadj2ptQu/WtLRoiGVygNpyk0BRnOOXfP2kd7YLpmrpiIkaot1p1z?=
 =?iso-8859-1?Q?uZA4KGWhWv+1ksFkV+gD5hU6NVfKMsJ5O8wdJZkbZHxdwEwcTfU14x4SBU?=
 =?iso-8859-1?Q?5llpAXxym/rvLBwnW90hBQqi68aDBzooJuqiCydHYnFP3FiqqEvHvhdoRi?=
 =?iso-8859-1?Q?EcSAr562aNVloh8JRpt7VOn7PS4bIV7z5Ea1Mon8BcMR1HNhwFDuCAyS/1?=
 =?iso-8859-1?Q?cgZfmn4Prg0ZFP5eYmYXKS+51uvcP3735o23JyfMzni63tP1T7ds3i6vG7?=
 =?iso-8859-1?Q?VtPIhmZ2RV2Tyt4ndUd0MYmfd/X4fGGb7rJdMuFHdF29/n36u6D04O9Ai3?=
 =?iso-8859-1?Q?qkJy5Md/W9F9HV3dp5yiri5IWiFHsOnABedAcydS/yZUrCMl6m1uHT3SsU?=
 =?iso-8859-1?Q?dQtxlfZcosucgK8D+VTJ3WXiTKZFRd+p4G2h3TjKRiAHJgV5oFWBi64iEE?=
 =?iso-8859-1?Q?/ggWrH1diUOkWjJ3JGlP8KD04wRwfYrU0OR9lz/0l5gUipjBUCw/oc0wLp?=
 =?iso-8859-1?Q?Qnnq+6ko5f3oLMQDmtBcv4WidO5/IjCMdTlbrFdQNRTRmQXyvyOqAuyHEx?=
 =?iso-8859-1?Q?SdaPQtp7RH5yOqluHr9F916iDoAQHWgcOAFHNsJaw/zP6ipoHNHdmlJ36y?=
 =?iso-8859-1?Q?MaaHJ8fu2g3ynUrwJLiCY0pC4IXy0VljXK2eABMPmMG6vewYHlzJLSAbdJ?=
 =?iso-8859-1?Q?3zCa+ptK7h3EXE7I1qmMENMS5yIbdsmLDXGUYAvDF8dWkyOK+WC1Tm8zFC?=
 =?iso-8859-1?Q?4iXRmNQRNAFD4iIFE9PMYAo+YXyqo4IO81eU4Hw8ZdADUM/V71VPlKQwZ8?=
 =?iso-8859-1?Q?27VM71S74s9FZoEhVlL5+n5sFj80nRHtfGxWj8C4Z7rDNbEi3Mr6UVQQ7N?=
 =?iso-8859-1?Q?oy8gXlP4tGEMa2PAjNC0T4LOi+myyfZKh3Y/03Wcf4oiYoD3Y4V8bX/0ZR?=
 =?iso-8859-1?Q?kJe2+1QYib8bW4nEOHvZ0Bm4fK1DudqZWhlv+lFou7QjrVHwL50PgL4qU7?=
 =?iso-8859-1?Q?YcwvctQ37g2SByuHZGgp8an5AUs5XgZRWyLJXuWrXptRU04MImPsk6q1Ze?=
 =?iso-8859-1?Q?HsXVKk+BA7pby1aGgifFS43qn/EaiTUxEoDKnk41e7xYtG1Vm2JWnhz7FK?=
 =?iso-8859-1?Q?rEDxSGFbynNUEtYRXoJYDgeWCRgqBT4bf1NASX/pXGuY8Qetw4GGdzKzGE?=
 =?iso-8859-1?Q?u/RjI+mhkwaRAP0Ve3MoqzexdUFU/b/n0TrvLahDQEz61vM36HlD1T5UfG?=
 =?iso-8859-1?Q?jQPGZdGTKKL/JO5S2Ucsb6OR7NRl59Yh9xhwK/W70bzED26WcBaYhZn6io?=
 =?iso-8859-1?Q?aEyiXad2I45jXQrSTLSV9cMoyX6HAlkZG+94t0d/dby5fUQ1NpSKtUv4X6?=
 =?iso-8859-1?Q?v2DpaHeUnqe8p+R5wZvfYTLntq2fAX6fi1v3rWLD93siddmz7IZvLxezai?=
 =?iso-8859-1?Q?bpMqh6dMp3RZ5b97t1svYPSpghud?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?22xLloeC0C2GQlqh1N1kDnmniCv6obDH2H1or0+uTg6blzyo+D+5vFuZXK?=
 =?iso-8859-1?Q?EnzcpfUtKvJV5qvS8iaVpT9qEVlG6F7V2LtRb/HYkltBCntyA0TC7s9BkF?=
 =?iso-8859-1?Q?S+5o6tKlsdHqlXYlaXQyg+ZLvRyLCUpd9Fa6TPizvdTo7BAdWg90Zs76MN?=
 =?iso-8859-1?Q?JNjBTmb5YJEa8bbbY/4VtSYaP2Kx8IXkmo9+Y1V0XWu3u1bkvTu84hsfs3?=
 =?iso-8859-1?Q?EUTM7TDQpRKTlqqyBzzKU5ipdMNVG/1w6taLu0YNAr5W7PiQvwEri56e+4?=
 =?iso-8859-1?Q?ffWVxPrjLIxoU/XggL5Y1qbxtAbn5SZnzclnqVhVOGfnp5U0WGgMMhb56X?=
 =?iso-8859-1?Q?RqV/Kz7JMU5IeQ/EKywzfx2lHhAaO+Aywc/9fFIavDYTElfR5Y4ktERNzN?=
 =?iso-8859-1?Q?JBbAvH7JfPuMSyY+MITF4rho8OqvurjVD2H05PTjSZbPzDYat3/CeChwo/?=
 =?iso-8859-1?Q?dRR+vDb0LqbgaUx42QMXCslkKW2n2Obl5H4WF/+X9ej8EQLpeQAV9h4Iy3?=
 =?iso-8859-1?Q?IGUWYejVrS1khaAEMleeXoLIn9aAmOIXa4wM49hQpd2MdOPh0MOmMDSPuR?=
 =?iso-8859-1?Q?+3JPBU1GsLuHIH+Z3RBDZwUQZTcVyQnTSCNtU2Uyftw7+LwmloaR4ih6aV?=
 =?iso-8859-1?Q?vfcTo9ll/OzYX9VX9w3jHm0YwkHpz9e7HEjsxYx+26XETS34p3l7LL86OE?=
 =?iso-8859-1?Q?7xY8dMCg9KjpimlLJIYH4lipMyfcB+OTqxI3vP50F/j2sjowg3S7aVnoyY?=
 =?iso-8859-1?Q?eYcl4eF+mu95pm3GEQoqkc/GLIxUC4T15KaEmwPxPzbigieG1aSY9I2EDc?=
 =?iso-8859-1?Q?vBeXsIzSvnqi+mzETwg6IAOAye/Hrn24a+0U1kOLLQV8fZ20dH5qXI/sqm?=
 =?iso-8859-1?Q?NaK43WoTSyppEwz9ANcg02W+CLddR9KM4uu36uBkr/sivHtiNRuIgbtuW/?=
 =?iso-8859-1?Q?4Y1EwrKRjV2oxdEC18hLoZ6RzhNEkrt1JDT5wg0moKU+qqvt44X4W+hElU?=
 =?iso-8859-1?Q?tOT9LnOjVzUs/TBbQmlrxZ7EY6Va7No46u28ute5jyWc+kEvreKe/2Bk/Z?=
 =?iso-8859-1?Q?oZN7+uY0SOxz1t+EDCi70CIEBg2Gfm5lD+a2L4F2FiNsj19ZTRg+KP7a2n?=
 =?iso-8859-1?Q?vdl014ADVceicLWHl6BAPhiYAZDCkOYvpmch7sgkxslCkHuCrMLf8PDPVW?=
 =?iso-8859-1?Q?L9RDjaK/D+fwKJenjMHSNtImUZk4oeXf/U/cZVxfX9V6Xu6q1uXPdFSp+k?=
 =?iso-8859-1?Q?OetVzpKfpO9tIy9iv3QzSveWUUUOKEXamI8zQFl9HizRfdKoGbUVtL7rgi?=
 =?iso-8859-1?Q?+bFvCA2SZI7yBpiLcQqWSCSrhlCe4KhBLe3OSWcbqfTMJTelAhTOD6UbYL?=
 =?iso-8859-1?Q?eMAxnjMZgLeppZB2aecuWJ9oK8wtXPqx1pN4tLGnwzkaT2GINaiO9RQPZG?=
 =?iso-8859-1?Q?PG3ygBKtpclexY70qZDcNqmD4CSK/1afKygk8w+jeoHLREwTyc+if4IuFH?=
 =?iso-8859-1?Q?hGaQ3Bo6tPwtpgBdfUna2eJ6OYJOvOjPGU6s3L17vDSRkZI0NxDmD4eSJD?=
 =?iso-8859-1?Q?aaAAJW5RE5pXNqXy1NN3I61BqtuDRcayxs+hCbuHt+bdrhVZ76M/t9kCYs?=
 =?iso-8859-1?Q?vMMbQMd68W6szqmHgB+iR4VhVDvAlilVx9IEgyzqltdbPKlw/0V76dxQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d76af0-2139-48e3-661d-08de26a77d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:33.3744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJyyDPKTVqwXJw//kEZkwBh168kguD/zQhqobTfs+ZFY1kgn7jNCwqrN0VBgR1yxHqv9AWnKNiNqCzUpFWboCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

PCI ranges have prefetchable / non-prefetchable flags that will be
needed in the callback. Pass the flags to the callback.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* style fixes

v1->v2:
* no changes
---
 xen/arch/arm/device.c                | 4 ++--
 xen/arch/arm/domain_build.c          | 3 ++-
 xen/arch/arm/include/asm/setup.h     | 2 +-
 xen/arch/arm/pci/pci-host-common.c   | 4 ++--
 xen/common/device-tree/device-tree.c | 5 +++--
 xen/include/xen/device_tree.h        | 2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 74b54cad34..732c84e726 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -49,7 +49,7 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
     return 0;
 }
=20
-int map_range_to_domain(const struct dt_device_node *dev,
+int map_range_to_domain(const struct dt_device_node *dev, uint32_t flags,
                         uint64_t addr, uint64_t len, void *data)
 {
     struct map_range_data *mr_data =3D data;
@@ -325,7 +325,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
             return res;
         }
=20
-        res =3D map_range_to_domain(dev, addr, size, &mr_data);
+        res =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..4bbffdf535 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -762,7 +762,8 @@ int __init add_ext_regions(unsigned long s_gfn, unsigne=
d long e_gfn,
 }
=20
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   uint64_t addr, uint64_t len, void *data=
)
+                                   uint32_t flags, uint64_t addr, uint64_t=
 len,
+                                   void *data)
 {
     struct rangeset *mem_holes =3D data;
     paddr_t start, end;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/se=
tup.h
index 1eaf13bd66..97bc5f90a1 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -62,7 +62,7 @@ int map_device_irqs_to_domain(struct domain *d, struct dt=
_device_node *dev,
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
=20
-int map_range_to_domain(const struct dt_device_node *dev,
+int map_range_to_domain(const struct dt_device_node *dev, uint32_t flags,
                         uint64_t addr, uint64_t len, void *data);
=20
 struct init_info
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index d3481b05eb..46e7e3b707 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -418,7 +418,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
                     bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
             if ( need_mapping )
             {
-                err =3D map_range_to_domain(dev, addr, size, &mr_data);
+                err =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
                 if ( err )
                     return err;
             }
@@ -433,7 +433,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
  * to be page aligned. We should check for alignment but this is not the
  * right place for alignment check.
  */
-static int is_bar_valid(const struct dt_device_node *dev,
+static int is_bar_valid(const struct dt_device_node *dev, uint32_t flags,
                         uint64_t addr, uint64_t len, void *data)
 {
     struct pdev_bar_check *bar_data =3D data;
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 0b5375f151..5ee1fa4eb1 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -976,7 +976,7 @@ int dt_device_get_paddr(const struct dt_device_node *de=
v, unsigned int index,
=20
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data)
 {
@@ -1041,13 +1041,14 @@ int dt_for_each_range(const struct dt_device_node *=
dev,
     {
         uint64_t a, s;
         int ret;
+        uint32_t flags =3D bus->get_flags(ranges);
=20
         memcpy(addr, ranges + na, 4 * pna);
=20
         a =3D __dt_translate_address(dev, addr, "ranges");
         s =3D dt_read_number(ranges + na + pna, ns);
=20
-        ret =3D cb(dev, a, s, data);
+        ret =3D cb(dev, flags, a, s, data);
         if ( ret )
         {
             dt_dprintk(" -> callback failed=3D%d\n", ret);
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..1091e34a10 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -667,7 +667,7 @@ int dt_for_each_irq_map(const struct dt_device_node *de=
v,
  */
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data);
=20
--=20
2.51.2

