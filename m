Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D9B0EC8E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053428.1422257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNK-0007ZP-0m; Wed, 23 Jul 2025 07:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053428.1422257; Wed, 23 Jul 2025 07:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNJ-0007Ut-Px; Wed, 23 Jul 2025 07:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1053428;
 Wed, 23 Jul 2025 07:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNH-0005y7-9b
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:51 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd127415-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:48 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:38 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:38 +0000
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
X-Inumbo-ID: dd127415-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVmk+LF8eNQXuCXBDQPYxjKNxGRlmpFzSd0GTxQVpnhjadE81KcnlMOBF32tR7ilr8KcxGoOAkrSfplWgxjM8sVZh12e4cXES40bt6Pmfmb+IafALgzkLSADGPwpz7IPmfHOYwGDvAlgdg8tpNrWI5HsHFg0Wg+efUpFGqF5jFBoAXCRAcI6VZ5aB9oJ4nN0CCFgIcPbTbhU/MEivOhywLC/BO2LcU4ICPTXcdlal3FJuTlWQm9G/fcwPK+ixPMfaVN+VbTOWkvAgSclI3ZbjkDxZgnpIlgkIe3ZK9i4zr6KM5CBMFNHSxaL7RiN6K2hrkkDNPjShtmbg1IgFCItSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4drSlScXzM9Ey8wTewWH44UEA7t5mlC+BKTThnGA9Q=;
 b=cnI979obhyBL0WhkVWBWbhwPPG/hy3Mn2kV4an1Gr0Vtf5VtLisfTdRNy8ecP+joXHarwX835NtstLSCGkrGK9hMbeFeqBqqxo+syeqcxqlJpysTueELfDahNAFGeB4kq2ovcw5FX3W/sXG7XsEZtknEkfKsHuLPVSIDG/WNdw6tDWesV3NbbSjBY7zOmIqGv1e+7GaF4tJOgpYgyxnib2UFfGhAFd0YTG6KzChE97sPYfBaGzLrvi+gVUGpM74FuNrTgTYj+BITWp37QRmpM7hb7Jv0vs2UPu3+1e8qCVtB9I582czmA3BexWxX0/IL5Fe2NuRkr+VsZPdPs4eu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4drSlScXzM9Ey8wTewWH44UEA7t5mlC+BKTThnGA9Q=;
 b=GuaGZuYRyQUOYYMrnHFHvcSJWI9Snxc3sIxfgQEHSloqv7SMBnpuNkYRTbbrhGQNkuYuteDFsukMSCFUnp/wheXo7aS76keWUSzN+ZpdQJK9PlZ/TB6urKtNQeKIgR6FOpVlEyNdvNRX/oII2q1theU14/xbwT4X8UrktNkVBfTBbx+GjtyTfZJsgwzIGGr6glKnRtUfEUrLAIU3ZpxfDyldJiPjUl3ktaFPzq204hVDKn8jOlCI9OMQGr0J6RHGtRw7CdJV5mBIT/DKKma5mLMYBhUdxuPVqdgsbjIkVuyWvzR9gj21kHHiekLuFVA89HIo1GTmDvPTZi8D5nymLw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 4/8] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Topic: [XEN][PATCH 4/8] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Index: AQHb+6eZYv2wJ18/AUeYy5pye1eSsA==
Date: Wed, 23 Jul 2025 07:58:38 +0000
Message-ID: <20250723075835.3993182-5-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 303de190-2510-4ef1-6cba-08ddc9bebbd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6fyKaLNAjveqUqFypjzhGSdrqglI50cmpfBy/DOLNRtwdTiK6sMxWGKZFS?=
 =?iso-8859-1?Q?oMGC7wRsuIb7pnv5mjje5giO/gBce9jafrMKXSJXGAX+twJP/h9GOaisJS?=
 =?iso-8859-1?Q?gpSQGkXczKc+k88bisTk7YqHhPszhLaVTy5OBXCubRfUrTKdP8sdF1DgAf?=
 =?iso-8859-1?Q?PH8bJsv5hflAyRgXKUvlVUydEuu75wvROyJscaiu7Mpx0g0XJ3cqzThqqV?=
 =?iso-8859-1?Q?TN08ljZqWUEP+Xl/zsWizfOP/s+/RqOxf+GQ8w0CO2LfG0u0c7/A4Kqo8i?=
 =?iso-8859-1?Q?KRskF4uDIJ/W+hpNcDiJrU9jDssbApq4NT5RyJWPJ9pHnH0+TLDWHfVoZ2?=
 =?iso-8859-1?Q?ZimRFKtAs+nUGr5+BTJ78ywwu+X+wtClqBsxEaYbz41WrGoRe17030obbV?=
 =?iso-8859-1?Q?t7ZQltGQv90HHlVXGsJpZGOmjDw0LgQN7JMG21d43jj1PRQBXkwry4aZEw?=
 =?iso-8859-1?Q?SIz2LCMzhUiSNVSrFcyd6TPfuBVejCadVzLhBUXtXG1TFFAlKddxgs2/UN?=
 =?iso-8859-1?Q?zs8r19NS+h+TwI2YX9IlCy2QrL4ZeBVvguIzIonpo5WxMI63J2I6evj1oK?=
 =?iso-8859-1?Q?buDIBKS+7nGx6cs2S/y62Erm7VksSGDZLlRyDWdRk3zqNPLx8b1NQ0QsTX?=
 =?iso-8859-1?Q?v3KtZd/R8DbpMuqM4uX67BoDApEJ/FBgVpe0tAvRxiDb/s4clGLP3FTCll?=
 =?iso-8859-1?Q?g41zYNLUqF2B8tk0y3rAAnYQfUJo0V84+vFQgv0leBbEK4ldU5xJeJdMyV?=
 =?iso-8859-1?Q?mIZ+eD+5s/x2WaOgJ5wFzN5N75qcMac0WoGMFRsxRaO4gXnSYgRFSstBwI?=
 =?iso-8859-1?Q?hLe3z9n+Pv8IhXD/dBhYL9PG1YVY3Vbn+vQxuUeCE1ul5UIMJMV6RVEIed?=
 =?iso-8859-1?Q?9jCXk+jhdbFZAawCa9r6WSptLFFqKGFDGmp181r/GHsi0NOPnzh+W47AZa?=
 =?iso-8859-1?Q?5HLZcQ+xNVF92yIgFHoKeHLNEWPYMzEB5dhlnIWZhSM1QZ42QMH+TyJDGU?=
 =?iso-8859-1?Q?8EPbb/CSDq+DwC+LUc+d8BB7md8YzUpD6nCwmiHbhervcKt3RPN6ZsYG4v?=
 =?iso-8859-1?Q?LN3NZdvm3qOwkQpErgF4r0LDAH6IyMOmNCWl3IOP6RB4VQQuAEHEyOnTAF?=
 =?iso-8859-1?Q?YKmXphUm5VK0NvXG405Juw1K7VCfgzxl/asiRwSCkyQINDdrzrwHpjLeu1?=
 =?iso-8859-1?Q?KkUv3tQF1A+XBlM4OGDp1ieW+BScP/oa4i51FoftSv8fa1qwprb20Vbt6u?=
 =?iso-8859-1?Q?7vvR/wi6oVF6Doic5gYAvEmnqEU0ZVir/4cY9zgZCib/xNtYtz7DNINP7Z?=
 =?iso-8859-1?Q?ZRi8nSTxSzZWqXjlrbDNwqFeyDsgT258RwwaAdpkQIawPGpcGF8uTafJtQ?=
 =?iso-8859-1?Q?mJjAtKy1gexXqhuzgEgNe6aHaZMwKxizyi2NQLDrjmn8yx+k+njVWbV0jG?=
 =?iso-8859-1?Q?7NMQ3z+WyalszFMlsz/ow8vNbgWDHlUHQoP5SE9ig/gjwCtIJyMymbDwOJ?=
 =?iso-8859-1?Q?AYUgWOG145ESKNKb+1d1zHw7IbkY8vnu2hDXT2870q8w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9zDOpyQtKyWV85YnwS2YreP7GvHQHJR5H/DBCSC2GjFq2bJp2Hupuw7/pi?=
 =?iso-8859-1?Q?h96K8SmoaGcwh08hgzHJZsq9lP54GKKS67HHiaR5aqr1/vzBcSxfn85vpo?=
 =?iso-8859-1?Q?32D7qMXzDO2s47GPUHB2RoBt2D2YK3Iv7i+VDVkg5vW6ESBY/AZkG7Lg0s?=
 =?iso-8859-1?Q?+1WBxzvZkCbB/MhEHrokuczZQfsILivy8NDOspjwClltjq9bskjG52cgT7?=
 =?iso-8859-1?Q?famXTXe+FWAT1epXEX6mM8EKoDgH1l4Q/yj/RJvBaxOhlnLgmP5J6YJWu0?=
 =?iso-8859-1?Q?fUMSUknY+ICyRlHZPhIBTPeFnJAA/Shee7SwR897lbj46CKEZmat3q5fwb?=
 =?iso-8859-1?Q?3Wm6LjDM98FY1K1ZYREmMmwf0eq/YnvPp3D/8y6qQXyzjTRFJNe9ZdfnOb?=
 =?iso-8859-1?Q?apKdu3uCu1a7qcX3PJmTgR49rHMTiMXH4j2BwEknmipEB5JjIMTixtgcd2?=
 =?iso-8859-1?Q?+s0SKpBk6fq5cof/kMvSwdaTpxSSeUcDIoExiy9trmWaIwez/rs413gknW?=
 =?iso-8859-1?Q?rVnJJAVc2qY9qevL0ZJ70B18LlzyvqgPNMOAyl8i5tFelloB4vZvG7AZ6i?=
 =?iso-8859-1?Q?pav3F0Yu1NnpCQupBqCprI1aJ2MgHUyX5/2lMMWpY9ytRAkAZDEpuepfJA?=
 =?iso-8859-1?Q?hIFyc2ISIBIMdlPGsEb6qsndhoFPBXXsnmonYgfLcLtLO4rx+kQTj4nNL0?=
 =?iso-8859-1?Q?JXtDo5i7va3Z1DUEtrYVcDWZ1dNV/XLkLo10u8YsedgH+IbrcS9+aFKCkw?=
 =?iso-8859-1?Q?6iUM+3KoUPQYuUNgSb1aC15q3N1FuL4orbcnClsatDt6wDeslhW1iwzgRo?=
 =?iso-8859-1?Q?5Sr/iqVKZrOptZbFd4EtFIEES8sF5bu+kS43+FyZtNkqBI/iaKO8Ealqy/?=
 =?iso-8859-1?Q?3cv/pJ+h1B4PfiD8Bzz9rS78dbyr6nxM5IFcrYxpdedymYWD0ndHskM4XE?=
 =?iso-8859-1?Q?koXlBxIyGQ+tYMduNgehPr2Gex0zBNco72kZX/gsFqZ5DZ9zhCgKjiBZds?=
 =?iso-8859-1?Q?5YIUvX0TB+n8t7LAWeZMi7wv1sSxLjg73gbKsU3xHKcM2eBO9SHesHX5/R?=
 =?iso-8859-1?Q?Et1HLZUsE24otIEQXyf2jns4RbwmNE8G1BIZR6a1lBIY8ujDpOu7APAdGj?=
 =?iso-8859-1?Q?HSsTjKV3faj4KFvic76daxGlELtO/NU16D0kM52tlw4/s6hm7rD4JEJ1Bb?=
 =?iso-8859-1?Q?kCb/Uf+Hz5X8z8vVGOmivOQn5MlaGKNFn9GSiPNMlGfjDQiCY3wtsmH+tA?=
 =?iso-8859-1?Q?ne9zUvuw2w14PFa1LyhloGEWwgRhVl+mG0q8Ksrz052fMpOR8mCWF5NC1Z?=
 =?iso-8859-1?Q?iDktfi/ZcBOkAmp5ZefJTnWSXUtxlJyn+UhY77LTjqukHnMu1tMi2Sr3EI?=
 =?iso-8859-1?Q?swIeUV4sGJDtoqLdmG7k8Ai5SAQhjLKdSqdm5DlLnPgyAQDBZp1xkcswlh?=
 =?iso-8859-1?Q?9HMj1m4QsCApy3Oq0AGQbGYCrhl8YZ1ZqKyZLF/FpSz4tQg430gEQTOyzy?=
 =?iso-8859-1?Q?R4pITb8tNLpSOsFfHtDpcjqTsR/e9plj/gBY0QfGRjDbkGlMj5r1H75/uN?=
 =?iso-8859-1?Q?A78uXfg9Oe9hxDT0WHBkWvjrfwWwaNvlX42cjBk8o7SE+exrvcz9wjenPj?=
 =?iso-8859-1?Q?hIyiyUajC9SqaveKYIQljQmbmlgMSAX78puJDW9od2JK3E7d1spl+WNw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303de190-2510-4ef1-6cba-08ddc9bebbd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:38.7032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSVW3PjDFfqAIw+EhAEHmr8XHiT+lYCghbFDM9lSuKguOEI6RJmiRvMofgsrcuMQ+HEYw7rcq/hlLwihzWxofi73tJnkCap57MbwtWR5oRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split is_32bit/64bit_domain() macro implementations between arm64/arm32.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/arm32/domain.h |  5 +++++
 xen/arch/arm/include/asm/arm64/domain.h | 14 ++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  8 +++-----
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
index 4d1251e9c128..c0a7fc35f38b 100644
--- a/xen/arch/arm/include/asm/arm32/domain.h
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -3,6 +3,11 @@
 #ifndef ARM_ARM32_DOMAIN_H
 #define ARM_ARM32_DOMAIN_H
=20
+/* Arm32 always runs guests in AArch32 mode */
+
+#define is_32bit_domain(d) (1)
+#define is_64bit_domain(d) (0)
+
 #define vcpu_switch_to_aarch64_mode(v)
=20
 #endif /* ARM_ARM32_DOMAIN_H */
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index b5f1177d2508..7a51ceedf25d 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -3,6 +3,20 @@
 #ifndef ARM_ARM64_DOMAIN_H
 #define ARM_ARM64_DOMAIN_H
=20
+/*
+ * Returns true if guest execution state is AArch32
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
+
+/*
+ * Returns true if guest execution state is AArch64
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
 /*
  * Set guest execution state to AArch64 (EL1) for selected vcpu
  *
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index fa258eb8d359..249e2d3be5d3 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -22,13 +22,11 @@ enum domain_type {
     DOMAIN_32BIT,
     DOMAIN_64BIT,
 };
-#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
-#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
 #include <asm/arm64/domain.h>
 #else
-#define is_32bit_domain(d) (1)
-#define is_64bit_domain(d) (0)
-#include <asm/arm64/domain.h>
+
+#include <asm/arm32/domain.h>
 #endif
=20
 /*
--=20
2.34.1

