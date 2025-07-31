Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61FB16EDC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065258.1430702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoI-00038t-8f; Thu, 31 Jul 2025 09:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065258.1430702; Thu, 31 Jul 2025 09:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoH-000352-Vs; Thu, 31 Jul 2025 09:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1065258;
 Thu, 31 Jul 2025 09:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoF-00025Y-G9
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:47 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b58ef6ee-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:44 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:38 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:38 +0000
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
X-Inumbo-ID: b58ef6ee-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eX97JB7x2kc7swtysrcKEvAoGyUzZyuqpUXXfLY85Lrvvy8e1n1bYWbdkzcCtYUMn4xPk24mvhpbsk22+o4tmshX65LtLKjwAK2+RZ8m8MtSaOCTaR6rYdZ2SVj9Rdi7pTwvKuUjY8O+uy8IH7qcd83ZwGM/ZFA2YJo000zDZhcOIQ5Q4gA3Xf4IGZD9yvsZs5PvdNG5hticHcjJcsj42okx7eGx+EdH1OcHt+JoAbOtsp0PbrGkKAcCnzEI8UNKQ1tCoOxsEkbw1XHQA6SKY5Gn1FjlNa/tOIAS7DGKRRfeDt3Pdv/FaGloW9wutsT2oW56zzct3Y72UiHas1E2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMyvzieVy3LxVHtn0A41REm0YkIEMjK6AViKmopWyfk=;
 b=kzuxUh4OIJDy/WdLbgQYA3KQBE9goJ8oYQKKwzEmmE/ie4ZZ/NqUGW8RxBHeT4vmne9h5u3gAnNYCgVWY2NLFhFmv/ONNZLYBNsfhBwyIg3cFzow83d39psCKXkK8D9k5Zfi38oK/aPDTAon7nX7ZW2veeXTLDFORFzBlcl6cbn3C4UDAvy31Yg6zes9RlTKaqBkrUeXGuB2c8UkTDw1aPNrdhVWF7LSivgvGFkfnVMp0buPysxGYQ/NzOeCghqithPYjbcTmXtYnXvPgXy2z+qS8OfIaux5nJ9ZQDK7fF7mmn/XJ54mtgVzx1sNd4dLiVpdsgZ1kXyDc0ASq9CUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMyvzieVy3LxVHtn0A41REm0YkIEMjK6AViKmopWyfk=;
 b=nkWv4mGiCsvuBvbzzWKjujJmgpgMsclG78B53LlI0F0a1gu4BHJIVm8kXrh+x1F2YvRIst7eNWYQkJqM7FbmZBdROnFsPDvoN/xuqMtC36iOAMAu8wggDAEXlBDvRjoIOFlBK8GXkTSa0L5wN+z7qVyTlWKTw9X0HgSAvB1RyB15+x2TCvAoUyBDYgkLgV8jplBRCwOvGFCJC2W1SY3PLUKmvwr32fOUnmlvzwE9gkUX3sqQj09KLO1p/xEvhkUWi2TDRLtGN/hwqp7a7BDsKbApCd0YOgOOxZRchp+1rHbeG4U7pa8cBEdWWmEkemeOhDPS3xIQo/wXtCeOc+zzDQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH 3/7] xen/fdt: kernel:  add generic is_32bit_type flag to
 struct kernel_info
Thread-Topic: [XEN][PATCH 3/7] xen/fdt: kernel:  add generic is_32bit_type
 flag to struct kernel_info
Thread-Index: AQHcAf9zjEq3QlL2dESFJfQ6uKbzSw==
Date: Thu, 31 Jul 2025 09:42:38 +0000
Message-ID: <20250731094234.996684-4-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: 199f3495-ca8e-4a65-fa86-08ddd0169652
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6A3tiqrixvJChy1bmfECmo8QsR4tKY/y/R4Bv1dl1yJWX47k0m46RHZ56q?=
 =?iso-8859-1?Q?vntjsqafqTpMWf4yYrihH5+IiDVBiypOn8IFiEcIlFsom6s+Da+d533A2z?=
 =?iso-8859-1?Q?E9sYbHeSv76Fc8LtD06qJUBg2ysv7TdDOCHOaPg57VbxiRrhPh0OpVrBNg?=
 =?iso-8859-1?Q?Up57a0A5BQ9dkDOGrgYmFahH8yas2Yz0TyG/0ymVQQWtkc5WhRBuYyU1ZK?=
 =?iso-8859-1?Q?OkUJkqtXOBbY8q6rUF6Bzeaels8uSic5GOS0M9srr6mnB3RoUWnQedbRBz?=
 =?iso-8859-1?Q?foMV3ghrI5KE5mJBjCwN99Qvbv5uQFJmCfvpZAyYY+kNoZhWHlhygQphtA?=
 =?iso-8859-1?Q?QoHytkbsMIeR6RJGyCYF3zuIE8tSvBp2B+muUX9UTJ4qKrVVj09RKr9YZM?=
 =?iso-8859-1?Q?XkOxaUlYhj6u21e4t89Wy1mtLcdGuwBxopkfpeYFxK0vDRDLFmqkepHUfq?=
 =?iso-8859-1?Q?O8ddScN6xEP4TxmOTsKqeZZSOOFAXjv+8bHNmehP7rj6O6FBRvJYuBq18w?=
 =?iso-8859-1?Q?bOneAiim3EYUBIl926AIp/gioPV96uFA3PVxOOKwEhH1eYagMjOPGlARzH?=
 =?iso-8859-1?Q?OEMC1wej9vRyCStOGZZYL17da5bIm3EEaSQ7L0ICv9xuyTURLBaw4IeLcH?=
 =?iso-8859-1?Q?BL6Ldyt27myuMDWulW4rP2NUBOPi5j5v+XzE8nledRrX2a7luGpRhZHrxI?=
 =?iso-8859-1?Q?yWlVnCn9tJE74ulPr70GTb2n7/FgInRNouhEdP7PKs0Q5kR5InfPaxarrn?=
 =?iso-8859-1?Q?1avsN6a8WE0W8fjNQ4cY7y2qW6GhEHQp5Zdo/OhrA9Yc8/ebFS5ip7h+rb?=
 =?iso-8859-1?Q?X0XBdDR8XxLVJTafXfeb1ZQj5vDd5rK7Ax1af6CzSm89X6mdRBW0NEo8Fl?=
 =?iso-8859-1?Q?kFMFgczM86JOA1k6oMmKymzMzH7X0L2hQYMTJ8nsTnRN1lGAoJZwMhappj?=
 =?iso-8859-1?Q?HJOQpyN+peGrmZEPgIKi8+dhPgAxW06E+qizN4Zn1lXNdoCfSAeFBOKcDF?=
 =?iso-8859-1?Q?1RB907UA0y2UK0mlPO3hL719ndFqtciTfqQgWb8Two/awflCLXg8D7ynQ/?=
 =?iso-8859-1?Q?YV3bNTSrluol4G/zfzKUw+hPWmOJRMwJRr1tzWwfawEABrXc+myOVJivrF?=
 =?iso-8859-1?Q?meIVXp17L1d6qQujRX/+IlO1Q4jXypcPUKKcPLBxSO4gJoOrWUmiD53x38?=
 =?iso-8859-1?Q?+HGlkHBw16bz307b+pO//BFhtAZPN3F5nLMmQS3DepWm3JB3oqrQ1BjASf?=
 =?iso-8859-1?Q?laH9046fZRCrqb/WNYrNFMjyrECGrR4BCMbM/t/WCUv6i5wI9BGukhsrGt?=
 =?iso-8859-1?Q?0dbTHs7Xdc0L1wKC7AYwywL4eTd67gZ37P758r558OMKx6SgNtM9VrFfb2?=
 =?iso-8859-1?Q?0gWd3ENik9RdMaDEADGug2IiIsSdiW3S1VStxz58nmhXwcOTzCeDuMwKUs?=
 =?iso-8859-1?Q?Q53nsxfuKSEAopk2CZ9iWAJKjiQzKPjiM4IidEr21mSINhyeyzXK+gX2+z?=
 =?iso-8859-1?Q?XEFIbp9hBcHaq29/4YhCdXQwSs//brZxrsUuTEtpaYLw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?esWFoEqUN2c69z1uT+lsLqZ5VDwCV/P0h3aPyHcrQRy63Pr2h5vnDGnM13?=
 =?iso-8859-1?Q?9AX9OtnhTlnWLPvEw+lQJYRAf7Y8Qfo/BQTqqGzOIdHPQVdQznwPdjBq9w?=
 =?iso-8859-1?Q?kbp0mlFMhE2FIdHRY1xJmoMJi44IZULIEzfZGjvY7IFFeLy6GOvL9UOhts?=
 =?iso-8859-1?Q?oKFaR+eh8p+CoYgaG/YhmcRg3dkioLelRRraAJ/eSTXdKi0+J8R8lkcryd?=
 =?iso-8859-1?Q?HPOxyNEvyyux9mMkPA83nhhh7qRve4x8Z4sHy1gq/je4A1hhHN4jWrgNVj?=
 =?iso-8859-1?Q?bPheILvon3jm/mbeU1c15n6OmWEcTRN9eALoZGvj0URtwE6gla12b70V5C?=
 =?iso-8859-1?Q?THwDxGuQ3RraZ51dhFlzT0q+EsmuWN3O88LK+TZ4rGYlnEDMBPUTgef3O9?=
 =?iso-8859-1?Q?sZ/hfsKb/w6UVXqhXoraTqnBs6larcWuMFpAH76kb/eSF6gbMp10q8toC4?=
 =?iso-8859-1?Q?qRjLxqvLTHCPlsdHp818X/rIT7ME8ko+1wmeNoXxv0Stpl3uUkMHN53hpG?=
 =?iso-8859-1?Q?526cYZ2ymt7/wg4VbRQz0bYGyMpWrGUfqSfJBEb7CQY0kNf5QR+dE2FE2f?=
 =?iso-8859-1?Q?EnZ5gNziaHU0JveOwyauyq7iAD8Y8PhVbWZ+oFI4VU41fKsAUzde2Iold4?=
 =?iso-8859-1?Q?v1fxhshCW4clVtzBYxm9B8aQ57S1NIX2fuepQMQn3Jn4OyHePQjrWieAkU?=
 =?iso-8859-1?Q?iZmys+UzAmSWHzGcjV8rIBoHseqP2/oos4eU4BBuIMXH2b3zgp4d8J24Ms?=
 =?iso-8859-1?Q?KPzLL+uFoO42qCRrME9JWTyH86kyehr83votDZhFyEedgFbcLz1PaVv4RC?=
 =?iso-8859-1?Q?UAQ4s65ItzML4LrTZlgJMtb0yBwco0cfaKyz2cNsDqm2/eKYdaZuXqHvRT?=
 =?iso-8859-1?Q?j0fO4rzgeuoPeLXzknVeLFdJXB/w2BeeDSDaLOn3X8GIdbtV67gHr1ayL6?=
 =?iso-8859-1?Q?q+sMnlrPJwic6oRJgdixEFpBFnKAt1KBq3OdWj/yP6xwWLvJ552lPgr6K/?=
 =?iso-8859-1?Q?1uNUxxb8AFxdqGlEhNFmyFztcWv5ETrdlKs/6Lm97+3wFoxtlq9+RVqm1S?=
 =?iso-8859-1?Q?Z0Pjg+WlxC4Vyj4FWlXxcFJ7gNSHZFqEANB9GxDx0ZDY5PPgs0H8UQgCSq?=
 =?iso-8859-1?Q?mn0zsZ1r7+y1ZwqLw2UFIfEak0iAjmOz7E4MmOf2X0OcGHbO/hPBRS2EP1?=
 =?iso-8859-1?Q?Xr/v0oHjuBCOWmjNQz6b3KX8N0J+kfE0kxyeEgVZHV6Fl0uoTZXhnLYk9R?=
 =?iso-8859-1?Q?4bLFgjlQ4V8WCeJr2bS8fRWsoI1avAd8anshW/fukbUMmQLGR48AvuDXnv?=
 =?iso-8859-1?Q?a7Ht1VViZtgm3J5jhOq5XOPWMfeOBjtHOTU49Sb/JIic2U+WBeqfepLpp5?=
 =?iso-8859-1?Q?JayVFJD2DiHodvkYrH2vdcct46la7DSltP+DC3gVjLhwi+AfTlHVKq2BTj?=
 =?iso-8859-1?Q?S9tCMRsh5ac+Xx/ty1z5ijnNzffQEGOtNrY5uAFBzVe5DDQQGCzRyV6/4x?=
 =?iso-8859-1?Q?gg1Xv/gTZiImYS56tCF2DINOn6IOHzJO85VI6ZSUriFGtl/WOv0WsGBRP3?=
 =?iso-8859-1?Q?Omzvn3nSjyw40EAR77oPgyT3Q2NF+x6Oa+vF0TCc0Ky2YtI9cvbiiW6kzJ?=
 =?iso-8859-1?Q?Xy6SIaMGy5LxVnOuaQ9t9+q/8Jhfm547qR3/mHRmZxWT8gnKgAmZKhsQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199f3495-ca8e-4a65-fa86-08ddd0169652
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:38.0547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sjq6MC9RpFtHhLifjlyaQaYaNGVt4u4lefELsRRiODJlR4eyJ+uIBcKK583Oo1M5cFd83SLiD0cQWlt9OYmmk9WW0AcEwYxIk3Wffp8tV/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

It is possible to have 32/64bit guests not only on Arm64 arch, so
add generic is_32bit_type flag to the struct kernel_info instead of Arm64
specific enum domain_type type.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/dom0less-build.c     |  2 +-
 xen/arch/arm/domain_build.c       |  6 +++---
 xen/arch/arm/include/asm/kernel.h |  7 +------
 xen/arch/arm/kernel.c             | 10 +++++-----
 xen/include/xen/fdt-kernel.h      |  3 +++
 5 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e247..3ac2da0b3576 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -241,7 +241,7 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
 void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
     /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
+    d->arch.type =3D kinfo->is_32bit_type ? DOMAIN_32BIT : DOMAIN_64BIT;
 }
 #else
 void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 463ae4474d30..fc9bcc6fbbd5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1874,13 +1874,13 @@ int __init construct_domain(struct domain *d, struc=
t kernel_info *kinfo)
=20
 #ifdef CONFIG_ARM_64
     /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain =
*/
-    if ( !(cpu_has_el1_32) && kinfo->arch.type =3D=3D DOMAIN_32BIT )
+    if ( !(cpu_has_el1_32) && kinfo->is_32bit_type )
     {
         printk("Platform does not support 32-bit domain\n");
         return -EINVAL;
     }
=20
-    if ( is_sve_domain(d) && (kinfo->arch.type =3D=3D DOMAIN_32BIT) )
+    if ( is_sve_domain(d) && kinfo->is_32bit_type )
     {
         printk("SVE is not available for 32-bit domain\n");
         return -EINVAL;
@@ -1996,7 +1996,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
=20
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate_memory */
-    d->arch.type =3D kinfo->arch.type;
+    d->arch.type =3D kinfo->is_32bit_type ? DOMAIN_32BIT : DOMAIN_64BIT;
 #endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/k=
ernel.h
index 7c3b7fde5b64..150cd9e30944 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -8,12 +8,7 @@
=20
 #include <asm/domain.h>
=20
-struct arch_kernel_info
-{
-#ifdef CONFIG_ARM_64
-    enum domain_type type;
-#endif
-
+struct arch_kernel_info {
     /* Enable pl011 emulation */
     bool vpl011;
 };
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 48f4b56d0ccc..607758bedb22 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -103,7 +103,7 @@ static paddr_t __init kernel_zimage_place(struct kernel=
_info *info)
     paddr_t load_addr;
=20
 #ifdef CONFIG_ARM_64
-    if ( (info->arch.type =3D=3D DOMAIN_64BIT) && (info->zimage.start =3D=
=3D 0) )
+    if ( (!info->is_32bit_type) && (info->zimage.start =3D=3D 0) )
         return mem->bank[0].start + info->zimage.text_offset;
 #endif
=20
@@ -274,10 +274,10 @@ int __init kernel_uimage_probe(struct kernel_info *in=
fo,
     switch ( uimage.arch )
     {
     case IH_ARCH_ARM:
-        info->arch.type =3D DOMAIN_32BIT;
+        info->is_32bit_type =3D true;
         break;
     case IH_ARCH_ARM64:
-        info->arch.type =3D DOMAIN_64BIT;
+        info->is_32bit_type =3D false;
         break;
     default:
         printk(XENLOG_ERR "Unsupported uImage arch type %d\n", uimage.arch=
);
@@ -347,7 +347,7 @@ static int __init kernel_zimage64_probe(struct kernel_i=
nfo *info,
=20
     info->load =3D kernel_zimage_load;
=20
-    info->arch.type =3D DOMAIN_64BIT;
+    info->is_32bit_type =3D false;
=20
     return 0;
 }
@@ -399,7 +399,7 @@ static int __init kernel_zimage32_probe(struct kernel_i=
nfo *info,
     info->load =3D kernel_zimage_load;
=20
 #ifdef CONFIG_ARM_64
-    info->arch.type =3D DOMAIN_32BIT;
+    info->is_32bit_type =3D true;
 #endif
=20
     return 0;
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 33a60597bb4d..c862ff6c17ca 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -41,6 +41,9 @@ struct kernel_info {
     /* Enable/Disable PV drivers interfaces */
     uint16_t dom0less_feature;
=20
+    /* Is 32bits guest detected? */
+    bool is_32bit_type;
+
     /* Interrupt controller phandle */
     uint32_t phandle_intc;
=20
--=20
2.34.1

