Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F270AB1C3CA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071504.1434947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-00006L-HB; Wed, 06 Aug 2025 09:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071504.1434947; Wed, 06 Aug 2025 09:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-0008Uz-CJ; Wed, 06 Aug 2025 09:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1071504;
 Wed, 06 Aug 2025 09:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujamI-0008SJ-NJ
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:49:46 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0ca014-72aa-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 11:49:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU4PR03MB10887.eurprd03.prod.outlook.com (2603:10a6:10:592::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:49:42 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:49:42 +0000
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
X-Inumbo-ID: af0ca014-72aa-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crcnI+vyYCuIgLcUmhzu36L+Ho6rL7ulNzCnqmdAYqkqi/nUn3KlYeJtM4heoyDxLH4DrSVa1x4VZXifTUDALVj5dSpHeESDF+JQRp1NdlWW+F0H8VOQwH6hJgq+Yek6VpX96AQmryW58VKvlWTjB0019hhfne0du57eRST6WsK/RvxbYk44nWxaa3jvEzHPGQBnGfX4Hw6rbgJZqPbsuIDYTKAhqDTMNqPyX7TIX2pcALoZ10utWmWO3ywWSb/jWtZMpPg5+d5KGL1v44dlnMJtyO/Qndld6X8YE2NzM4sBqbzSwxXkIYRRR6TR3+pMsPnXLNB1eF0QoKrrdkpuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWgOWIGwwlEK1rienNamvg8o+Odup/Jed2VETWL/gYc=;
 b=mAEPEZxZMyNhV9QSX4g6mLxtM+Nwo0FXLABcFnggFFV4IdRWsPQTsSPSEQnVYPaav0Sja4QAXS602qq0bIn4llVk1WFwiZHSBECgkawjtPknJuGaZbS/1+jT2vaNp9qFIXGrO2cO78Yd7WzqCutkdAn10JBa7ZIpLsHX+HumawXbZJgTQCZnZsQSsZhCQTxG9zZh1tWN8O3ziveZAmrqnF0WgSZ2Jsk+cfX/CXDqlPeg7AWEXc1Uah1cW/r8tMc2lq8jCoHxgCH/7/RWASiUg4cgGNIDpyYM8MQWpIK8C17FH/A8BXtdMN9pbFXFy1BneIZF1L5MvgAJIXqnVBh9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWgOWIGwwlEK1rienNamvg8o+Odup/Jed2VETWL/gYc=;
 b=suPlC96YjeELTxUSPqTyA4ilnhQ0L100swSyecQOFEbUnYIFIkRas6jRioBNiX2vxUlmbbgA5li9YXoi88Msbuh1SkLSNAJszin4ijoW0sn6GB+tgOvQff0+sqAXIlqqythevW7ucEoBf1YU6I5kR/9QbyPPt5JNn7/Amc723tawkycEsQajFJtqNj6ySeOoG8Tih6B5HPc266V7CtAkfxIVzU23bN/2iqneHwBr2v9A3L73aJ7HRe2kVGd94S7NP0NJebFjUJgGFzReu2X8GhEUXcwSleZnwe9BbBIexQGI8YHhEq6T9O0xDMK4GFUF4gCgTOjqpji6pv/dY2FC3g==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 1/4] xen/arm: split set_domain_type() between arm64/arm32
Thread-Topic: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Index: AQHcBrduWwboiDUHCUaharDCT/0ywA==
Date: Wed, 6 Aug 2025 09:49:42 +0000
Message-ID: <20250806094929.293658-2-grygorii_strashko@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU4PR03MB10887:EE_
x-ms-office365-filtering-correlation-id: fbadd1ef-f5f1-47a7-4e77-08ddd4ce914c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?S722Smkpu9CHhEnh/NvuuKv6At8Gi/b6/0koZNTT7q5nSLP6dIZ7Yy3YPR?=
 =?iso-8859-1?Q?VCu9OwZNKD3VF145+NTD89TyQtpYkQAm9LXvm5quNNcrQugyIyUs8bsN+W?=
 =?iso-8859-1?Q?hF5kbOpjncJpgFodEN//aBNkhdMBOLDyrw55V4dWHRBCEAMSa5PWcWcHGv?=
 =?iso-8859-1?Q?OqA+f0mz07h7FHbj7XdE9a1gIAGQ3z70LL7KHK+KS45rVfQMyu9ry/yLI5?=
 =?iso-8859-1?Q?k5oUBY7fP8P6Ab3LEbi5Is7324hFJGUYd84dlATNSjwIEpzKURyV1o1vV4?=
 =?iso-8859-1?Q?eInTkOpVet6Sc8yip2TznVe6RoLmusmZvXFEfSY7XwtJev8Ln0OT1AhLt3?=
 =?iso-8859-1?Q?f6wt4FZ7gOvmGRTZSeiOSlyF4yA+ZZ1kevxfMgqxXkMtjxfw6dtQeeCKve?=
 =?iso-8859-1?Q?woE9MW4YVOjCrEP5vl4RgUwCqnsz9wXjBwdCI88j71a37Z3duw0DmzuhtQ?=
 =?iso-8859-1?Q?2NEpI0qC9RCXyUNW62Xu8TpI6OpbapzhBX6+s9g25nTj5gW7kj3sAfFTBg?=
 =?iso-8859-1?Q?FNv79SkcVhTJmLUw69hx314c+yba2zv1rORT2HaBZS0cEEx1VLrq5pvtu5?=
 =?iso-8859-1?Q?db1yLZU+R+V9BnAoVn6hviwresho1zYvRuf+0U8ewVH3Rk5tQarbifVfVT?=
 =?iso-8859-1?Q?jV1QW3ELesIVR1bT0QEEPiKKCj5seyZn3EWd4vKxsVBq3uRvdB5M70lxxR?=
 =?iso-8859-1?Q?IwWUiUHdPMiW5qDzaRpEXZn0HftAZokk42dP1ve2kZ5wSFEu2WlrFpO3br?=
 =?iso-8859-1?Q?AYQP7iadIpAffAjTIvQIWk8e/sD6mtj7PObDIMp3qALI+MOcy5EvAsY5//?=
 =?iso-8859-1?Q?s3Fg33MBKD63MQdg28BDm4zK4w5BtP9HfvZpuPG9GBmoZyZ7bJ6oZFGgOH?=
 =?iso-8859-1?Q?zIdeAAakBi2FfYw0836DbxNOJfy0lr1PQ1dMHs56aoToPNsZLYqccJlZSz?=
 =?iso-8859-1?Q?5YRg2c0WBVv9G1NpUGpqDewqXtRfOA0wh7g+n/Rf+slp1YTAcXmNto7153?=
 =?iso-8859-1?Q?9LxEecB9dHHfVXmlYav191gIUyZ5/BxWXIzotapzVQODJh4Q7MOaNQ8VJu?=
 =?iso-8859-1?Q?Ezwg6KvPLHidDm+nnWdq4rKzhCVnEOZy8IzmGWsYpNg7O22CDGkWJVcfLZ?=
 =?iso-8859-1?Q?yK3CqwCcGvlGt8tRcgjqcku5fWJfSbiYMP2/EDk2OGF19TRtbCYMoxNQ57?=
 =?iso-8859-1?Q?NdrgA1ziGv+JHO1jW++Qr6P3+T6kumyzVUpH+EzaWqdBftvOSE9adnghHS?=
 =?iso-8859-1?Q?Jx23X57jeyzHZAU3qGUr/o3V9dGP9Mb+xKZ7+3ZkLyElpKpivsDmmwlUt8?=
 =?iso-8859-1?Q?UQZTA2gQzoTrB9RgI83DKuHLV1pee0gHN9bL1soKuEs7t7Lrp7QOTcg5Xn?=
 =?iso-8859-1?Q?xsXcZikHKmI1C4Gq5WWKXhMVtaktrckwVCxuOz2NQQe1slzTgs0N9J2409?=
 =?iso-8859-1?Q?FhERhKvp7YM5fH946EqjI68gLCOQKv88ixo+OtFFh/Hn4865XkPESkwmrn?=
 =?iso-8859-1?Q?2ygXtv7moVEQg5neYNjfCOvp9DKYHt18ox23ll5SF9HA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JfLHJ3b+3ZH1hgRK8vb/vUeOO/BWUNQ+7I/7XLhZrOCGz3c1QMp2r/XYuz?=
 =?iso-8859-1?Q?IR0jeqZKn5l+xY8/oUbHpY/99ZEE5/7ukvg/gAMUCJ0N96fNTzYpdQWbMN?=
 =?iso-8859-1?Q?YoKoQVrFnCXGSN+WREQEDZYERxbrSMgqpbHqFwAwc9DGQC98g4aZPihu4u?=
 =?iso-8859-1?Q?6rGt3LEbQd7w6W/486KU/BFUTHjusK1hm0I+HpuNQt3Oo+h7FK3ov8wftS?=
 =?iso-8859-1?Q?xtKVZJepV8o9CAjizFYRdonc01fheVp694/mSmaKMrkl0roXWu/Yn863pK?=
 =?iso-8859-1?Q?3w7tgCrXbb+S3gOoiQYgzkXWT70Ny6msGNv+S5mVJKTl+rh1VIL0MbqAfi?=
 =?iso-8859-1?Q?luFej3AE0i8rsq1e7Z7PZMXF4WPOu5GVHjrOJ+9ecTyrjpc8i6V9Ilxxqc?=
 =?iso-8859-1?Q?KtRE2Oy3bXHjhO6OK9PTtm+t5pPV/ERdqVb51x5DuTAi336RrSB3vhykPq?=
 =?iso-8859-1?Q?DKDdAfpUuXdbjQUseSqSQKrujrQqee4ov98L7SAm10q9wkm3NRQ3w0FujC?=
 =?iso-8859-1?Q?E6/OMqwwjTkisQfsVrfWPcGgOYAX3CWP4+EFDjRNfYMrgQhwYEGPkyAx1K?=
 =?iso-8859-1?Q?+dMZLZ4oTcgR4nJ2jxu6IKBXogcgbiebaAjjDKT/b+ORvUyg0cBIaRiRe/?=
 =?iso-8859-1?Q?rwNJmmphhS/qyfXx6vodN9iZuu+H0rL5FpcUJMjp4pwUUGu/NxCGj/M/KZ?=
 =?iso-8859-1?Q?3rvvAfQ9gwyt3+S8ZOF339MrWpOjjllsdGRvJqQme1obCBYuBfK0iXic2t?=
 =?iso-8859-1?Q?jFHdPXTE3hsbHEsnxq4CreI+N6+Y/IWxsXN7amwwSDW2gi6Ai4G20y6AlZ?=
 =?iso-8859-1?Q?BD12GDM8IiA1s2Eeziywce4Z9qQk+ylq87qcL7bWzxOUmJa0jDxA4fIRVz?=
 =?iso-8859-1?Q?yo0VyReuUSBM1vSl2Ae3hn8XWTHSawaRQWcxsdbz5nr/jFOE/Q9khl7Emw?=
 =?iso-8859-1?Q?muI94wx5rkJKg9KInKllwugZnPme3SSts9rEDv6l2GF/FJ3HvYcOM7fmH1?=
 =?iso-8859-1?Q?hPHXCh1EM90KiFkxsKYj3IYKRHJ6WXTKIkCu0tdGltD2jdx/iJ273k9ZUS?=
 =?iso-8859-1?Q?hNGjzmOOfJRYn6+NQPgEO2TKt1sszS9nVsTEBqxb5CqGRFKSYVnUZ+gTOz?=
 =?iso-8859-1?Q?S4T6eoa+9zJOUwBsnJPI+5RRfmrbn31LiGbUwqF1Cod0iutGFb1V1RVwG5?=
 =?iso-8859-1?Q?aPPI1wvperhudkHXC67e1mmFs7tcuzm0XfuLOm6yW5h0AwmfbdNaqJ2OEj?=
 =?iso-8859-1?Q?BZNwpetsj5YUiBgIsE2Sz24O9C9wP4tKrJXKzkbYb3z5WS6lKX/0LgpbNt?=
 =?iso-8859-1?Q?yjBELv0U2T6PnfS//+NhvIVrJCGGPEb8BYza1D0UlAnrHIam+OetYtnJUh?=
 =?iso-8859-1?Q?SK22DSfI8dsNfjw+jtU/3C81eKIUpuyPIG3MXWUtq1jp5QzM8eDj9snBG7?=
 =?iso-8859-1?Q?zY1jHvyb2Gn7qvbzFw5o5DeHF38bdyDOsaAZAprF7Xffpvtx3qlOE9KumQ?=
 =?iso-8859-1?Q?wsDoKHE0oLRjCSGsg08c8Y2xv1S/gX0TbxgDgVy7X4s2pXv3w21LfgZN6d?=
 =?iso-8859-1?Q?y5f9sC2LfNeSkTZOM/cWWaQIzYuAlEQeuJWJ2+Iuk7vH9XILh8WZWpwScy?=
 =?iso-8859-1?Q?FeqAp61W2OFHKfWjfN7iGIhuVts6+H23AVUg7IN3XfA+t9jYhNHep3hg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbadd1ef-f5f1-47a7-4e77-08ddd4ce914c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:49:42.1969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGnwP5F88CBAS6Z972ZECAd0wwzPAYVtJJk03tW0FozdTxCOcFkSOyo2HoU1sYehytsJOZVJBrkCpNri65Vl4ldYCSJd5X0vaHixnyh2FXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10887

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split set_domain_type() between Arm64/Arm32 sub-arches as
set_domain_type() implementation is going to be extended for Arm64.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
v2:
- no changes, rebase

 xen/arch/arm/arm32/Makefile       |  1 +
 xen/arch/arm/arm32/domain-build.c | 22 ++++++++++++++++++++++
 xen/arch/arm/arm64/Makefile       |  1 +
 xen/arch/arm/arm64/domain-build.c | 24 ++++++++++++++++++++++++
 xen/arch/arm/dom0less-build.c     | 14 --------------
 xen/include/xen/dom0less-build.h  |  8 ++++++++
 6 files changed, 56 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/arm/arm32/domain-build.c
 create mode 100644 xen/arch/arm/arm64/domain-build.c

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a0a..0fd3f5272361 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -6,6 +6,7 @@ obj-y +=3D cache.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm32/domain-build.c b/xen/arch/arm/arm32/domain-=
build.c
new file mode 100644
index 000000000000..e34261e4a2ad
--- /dev/null
+++ b/xen/arch/arm/arm32/domain-build.c
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* Nothing to do */
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b2e..3272fe7e4ca2 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
new file mode 100644
index 000000000000..3a89ee46b8c6
--- /dev/null
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+/* TODO: make arch.type generic ? */
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* type must be set before allocate memory */
+    d->arch.type =3D kinfo->arch.type;
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e247..58f77628df1f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -236,20 +236,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     return 0;
 }
=20
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
-#endif
-
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index 408859e3255a..3e81d8ba3a47 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -57,6 +57,14 @@ int init_vuart(struct domain *d, struct kernel_info *kin=
fo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
=20
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State 32-bit/64-bit (for Arm AArch32/AArch64).
+ * The domain type must be set before allocate_memory.
+ *
+ * @d: pointer to the domain structure.
+ * @kinfo: pointer to the kinfo structure.
+ */
 void set_domain_type(struct domain *d, struct kernel_info *kinfo);
=20
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
--=20
2.34.1

