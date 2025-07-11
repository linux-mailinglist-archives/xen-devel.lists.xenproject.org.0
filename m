Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B4B01ADD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 13:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040790.1412092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaC9z-00089k-RB; Fri, 11 Jul 2025 11:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040790.1412092; Fri, 11 Jul 2025 11:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaC9z-00087J-Nh; Fri, 11 Jul 2025 11:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1040790;
 Fri, 11 Jul 2025 11:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5XY=ZY=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uaC9x-00087C-Vu
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 11:43:22 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3da86dd3-5e4c-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 13:43:19 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB10678.eurprd03.prod.outlook.com (2603:10a6:150:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Fri, 11 Jul
 2025 11:43:14 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 11:43:13 +0000
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
X-Inumbo-ID: 3da86dd3-5e4c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy3KIKB4ShK14CxsPbFt7bxcH8WWCwT3kFWLwqegZt+AYgdejQAsg9p+I+JJpC5PuTAPTwHSbKNIbBTtms4x7SUfbqZixvmhi2DAZ1Tlrq40piom2ZVIqR62A+S9Cd0bOEEn8phXwNVUESd+y6dJst5zzgzILKvmlGTWQutMDUzBjmTr85tXdBU9hpv6ua7UdNScx29tZVnXfCAjjeLFojpGcNgkCCLV3bVO5lIcKCwLhpjXmRSZuz1pwYhDBwOOiKRuMM8FWUmL+MBSfTdHjH8M0MU9d2vGPZxxj6HrvNy6liXYa8MG6aMlzZtMUHkmpoGDezKr5XosAeCI6R9MYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME74X6qHAZD1OpdJW0zOn/DXxHul0Lg1N2c9o09JIzM=;
 b=IMWRvwHl21pfVRXHPgv5ERcywLvqhvbS2vlxTR1iMNBEfC8DSZ72HoV4RaeKXH5LP04wNAJ8fyDHyNkxIWber1WcP0clGxVB4Bjy/dEasZe1p+jThHXaKBoIIAyOBX2dKxMGcGFo8jAZQwGV+7stDzc/1YtLZXvKYa4HiU8E5MqFGSI56y0SED/0s++DzmrvBU2rZFVN0wRMtiHwyj7YQivZI4FR/k6FwdqXEtygq4qY/n3lZ64Ya+PkbAsoTPCnzZk2dQIcjMctTEMwCYMOXHGvxuQQWld6JPG3FgWM0dMK5BDkdUn0wCm+PEyXYWNi33LRd+ONRv65Qfe9sguHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME74X6qHAZD1OpdJW0zOn/DXxHul0Lg1N2c9o09JIzM=;
 b=ThEJxJrH4GPkw5b3ceBKhH5yGRzwgMmDuCFcfzWt4f2eB/ccX8eLMy+Iqtg4yZv9ECK7ZED0Y/HxCLj/eT3rmBPUyh+BkLWNfL//+Z/LlMtFSNo/Bh5OmAFn+w9jOBnLzq92jy5Wx02sBTKMmt+yCDjzoCeihkSmFOqiX/iv029u/QHOY2bjGCsoUWzJi3mxG/Mlo0J+FxuFNBTqlOh9ay5R16uLfYhsCkggRgsa0rbkgIVhyLLCpRU8G4jBNaGCFUC5/59wgf8Kyt3Kid4TWn7tHnteYfIjtZALoToK8NaUYP6zTeLbzg9fhIiRawl1wsO63N/2BXqJ5nVcw90jQA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb8lj8U0c0yIOr5EqfSUQdGwVgzQ==
Date: Fri, 11 Jul 2025 11:43:13 +0000
Message-ID:
 <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB10678:EE_
x-ms-office365-filtering-correlation-id: 42e7c8ad-636c-47fb-5b6b-08ddc0701e86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0kgHX7oi3+rI5puhe0meKBJEqdh+nb1bk2WV4Ies+U2qFtdZbslPt7TfpW?=
 =?iso-8859-1?Q?2XEAgV+OJZVk+1nncP54jLrKEiI8IcDOP4fCvSij6Uyq0x/X95QNUuu68N?=
 =?iso-8859-1?Q?n8/KbI2JvpEOHgg5dk535G2QGqF7izJuM6TAApxsMOKlM1tNTqj0QXGFii?=
 =?iso-8859-1?Q?CFayVLGvSb/9tm74pP9+CzEXP6RkkI+IgVKTgvWHlpuBd079cM1WJz5vmP?=
 =?iso-8859-1?Q?Osqx6B9IYeOTHiZpZ3vXvgGiTZ84waPKGmp0XOXJoN7aBGhT6s3mdm9Zyz?=
 =?iso-8859-1?Q?6N4kw72esNVhYL3yD82tDNlyoARMy4TPnun78M7N/BcGl+nzzFzVquDP19?=
 =?iso-8859-1?Q?iI4qCwjgKW9z2IBgjJOFISa3O/Lud8ykprMkKXL6gNL9qbRrJaw56f22F0?=
 =?iso-8859-1?Q?VSCH5ieDkGEM7tzp0MW3IlFKlt/c9mG9vfPYu8c39pUU9tWoSGCooeWpgE?=
 =?iso-8859-1?Q?6DOn9vwsO5NDsDTRoytW/6gW+89yHaZ16L+Dlq2Ay13/itD5TZXRKWudDo?=
 =?iso-8859-1?Q?dwJv4WPjqW7W0a9y/imPJ7UilrB1AlI/LT9xj/NHe5Lpm5flfyJ2DXGrQe?=
 =?iso-8859-1?Q?xbfS/TlDFnEtc3Rn9K63NFdbjqv+Wnv+1OWVgn/6KQ7Z+OkIQZ3z+a9JKT?=
 =?iso-8859-1?Q?Qw1vIp8twKvUO+b6b/bYJ1qkNvWOm9LPqwH0ZrduVz2Vhtpy0HhXUDK6LV?=
 =?iso-8859-1?Q?QC23Tb868Jc+3kt3lS7fAoqszsQUELHdsbT6mrZza0nYZUnxf9+2cauzbP?=
 =?iso-8859-1?Q?yOPHgM9uj/qMyU900sQ0LszDReazmMnCmK27HemYoxEwa4f5mojZ3dN0N2?=
 =?iso-8859-1?Q?6MKrTQIA10z5pjMwEkCx/pqaMtBfkcPTr/WcAVN1LyUCe2kXH/uvs/CWjn?=
 =?iso-8859-1?Q?NbNYms4CA4BtXVp0GoWu7q1KTL3VULHZSNjoWDkGNo600oIStgm/KmtU0g?=
 =?iso-8859-1?Q?o//wqJOlsZtrpCkh0XKg1i8qkndOZ0I82ByvrZSUzKnOeJNo1kEsovwxmn?=
 =?iso-8859-1?Q?cBfPOejGRpb0n0RBVhCCshQqVslEF1P46FCMnijWhlbGdjjeXZI2zy8HTA?=
 =?iso-8859-1?Q?uh+nOShgoiVTSFI/HHkFuX7CruMNGz3K7BQvp01PShVHwf3yFx7vxkTBv6?=
 =?iso-8859-1?Q?8kYQ/vi+IqtN59d3Bv6S54UQiYo7hHKVbUMxn8ZF4JFDFadCxDWuaPDv3H?=
 =?iso-8859-1?Q?t08M4a7bu8kj6EyVjyY5jqNnTrW5omnctzjQxVDJGAGXvfC6FT/6R74dGY?=
 =?iso-8859-1?Q?A56mgVSLtHQRb0t8BBxXiXoDh17Hr7eTbW5L2BgMqXhJS//EpmTCbpIi11?=
 =?iso-8859-1?Q?ks8Yp7vAyLx7OeRDuoFC9VlPkzlKYzW3y065O2SxEZqIYYfdWSqRw0d66m?=
 =?iso-8859-1?Q?TQgj7m+O2BJ6xbSCgLtK0hy+gyehi8BKG+lBqUoHNWowXtmveUGCzgDhyP?=
 =?iso-8859-1?Q?lXrtfoMDDtdSx5Yl6UmrVxpXywiTNwH11vvheFS1cjx/mZrwqpzU66Fkzd?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?masuTDulX8eBtv+HyZ8EuyW12t+WVzuaTbKMMLyBjnQH8d1kc0yWMAja9c?=
 =?iso-8859-1?Q?SqEa9PXsJ6qXyTKnT6PETzoYJeSH5x4hNYya+xZHjqr5DAR/kAoCklNJlV?=
 =?iso-8859-1?Q?fdhNKYcYfR6Oy6m3xMeOzCYVC3wwt1BGP1bHWfONPOeHAC0d+ZoGU3mt1T?=
 =?iso-8859-1?Q?aWtzIl/EPY4TInc5Ifqx0Is003bFjJJceJkAZCaaNrCPi4/pohHsIrFT9y?=
 =?iso-8859-1?Q?RXQ8P58XUQWvdR3uzV9AKV+6+lCRjr6aoOPwugFvw8akSHfPU8K5o2y+g9?=
 =?iso-8859-1?Q?m2qBeIjlOd/s6RhiJRNz4QQF9Xj8oiDKHm/YZljaghaZVdY0R3D2P4qW+f?=
 =?iso-8859-1?Q?t1DkMlOeMV7JrDYtVaDMPngHtAnIi7kPSY+ipA5yixMtAsG+blCpbB6yo3?=
 =?iso-8859-1?Q?oI9dJPD3vas6tqdWQeIWSWj2exZm6hvBLENX5K9pIs0rC3PujwEDiiaE70?=
 =?iso-8859-1?Q?gUM4OYtlyk2Cqz8VfFZRT7zxF1M6wj8flPw8eJLqT81auGF2g0c6teLPke?=
 =?iso-8859-1?Q?ttnQk2ruhRA4W52KJ3PRcJWYrZX90faEXwSFqI//fV/eKi1i9k9qJ58TG6?=
 =?iso-8859-1?Q?S0qmUKmqNWatmSrSd/Jw6uwVHlo2h9FbQhoR7T5MaOnwRd6RNSPxWJET2s?=
 =?iso-8859-1?Q?6NpkCVa0jjpSQPriEfvsMAtE3uzpaqVrh/fa/qZBWzgaU+fMfnSsUekG8u?=
 =?iso-8859-1?Q?yQCm1ZXFzzbK8j1qPasADpsBSKSwc+8HhzP67evhsuLPHoqohtv4u0ZTWH?=
 =?iso-8859-1?Q?ncQ9BXJXyIkzYbJstFAPIQUWo8TdK0m7WUs1YemZR2saMMn7FhtH/02WIh?=
 =?iso-8859-1?Q?ddJwuRCv95ESHn+jQl6w338q5OEDP0o9LbAlhI/yxmiF6OOiQEeIvGER1O?=
 =?iso-8859-1?Q?WikClLw2V6ttceFTcOLK8UJiycwjLI+exy0ft3iTpQojBMKhi3sTr9jN/m?=
 =?iso-8859-1?Q?e33eugUacHrh7OPtWV1Tkp+5c11Owu/LY7EXKKYUxVKKn1aOLFbSOUafTw?=
 =?iso-8859-1?Q?WmNrheHvILGpP+exX45+2I2LCco9HktWNYln+UUvlgp0yjUtgTNKyZgFW5?=
 =?iso-8859-1?Q?pBb5+lUOYWTegT+dO4IjJcfqY5RWEOTtOMB+WmvM2Ry8myS0Hf5Uw97RSQ?=
 =?iso-8859-1?Q?wfxaoaTKr7rVk74mSwi6ISjGH+DPtL8XTOEpp9fZtzBtwxnkAyhpq3ABpk?=
 =?iso-8859-1?Q?VZitHI72AwjC6w8Q1QCN6o8rIeytlpcib9Brl1NLLOOMz3Za98ZmWjDqj5?=
 =?iso-8859-1?Q?fVa35mZjB3yqnt4odI9F3iKJ6Ojs4ie5d8DaWPXYfNQLcH2o6RmYcrFNUc?=
 =?iso-8859-1?Q?daydhym+zGLgvaFu31OdiJEkYV+ZZjnGLZJHgnLF1NMSNwvKJ3plg0Y9e0?=
 =?iso-8859-1?Q?K8Ko/6KmMg9UcOBXm/wtPv7P9eWLQwsgmTtrjd4AkVySJtBubJMEBVXHQT?=
 =?iso-8859-1?Q?CJxd6ca3ATzOCaVQq1cPbBxwaTxrzpXT8iJekvabO8CtjiaWrC9Tggaflf?=
 =?iso-8859-1?Q?HjahrAnu1Umlf33QB7CoMZ6ywiM+gyX9667/XkO+HEcRVdio4dcNX5F8a1?=
 =?iso-8859-1?Q?lVxcxPEfhvyshztuwCqEbsbLIGL2dzk6aGNrOpCpTSp8g5jXPWbqNmAqnL?=
 =?iso-8859-1?Q?l+mSLEHADCmFGAEg0LwBeLgW/5pMKX3Iy5TTZcwLSWOxs56ia9Fm44GQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e7c8ad-636c-47fb-5b6b-08ddc0701e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 11:43:13.7179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1N3vkWsm3oHUqGK5l8vbzrxN6cfAWU4hw5PlxP/42KgMa0GB32pgF/W43383u0RZ1HtUjZP+UvteBHzK/EZKWcY+5jIcrYK6JP0LBprxDgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10678

Rule 10.1: Operands shall not be of an
inappropriate essential type

The following are non-compliant:
- unary minus on unsigned type;
- boolean used as a numeric value.

Precede unary '-' operator with casting to signed type.
Replace numeric constant '-1UL' with '~0UL'.
Replace numeric constant '-1ULL' with '~0ULL'.
Replace boolean with numeric value.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes since v1:
- changed patch subject prefix
- multiplication replaced with cast
Link to v1: https://patchew.org/Xen/d92cf08a64d8197a1d1a45f901e59183105d3da=
5.1752183472.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/arch/arm/gic-vgic.c               | 2 +-
 xen/common/memory.c                   | 2 +-
 xen/common/page_alloc.c               | 6 +++---
 xen/common/time.c                     | 2 +-
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 xen/lib/strtol.c                      | 2 +-
 xen/lib/strtoll.c                     | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..a35f33c5f2 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -17,7 +17,7 @@
 #include <asm/vgic.h>
=20
 #define lr_all_full()                                           \
-    (this_cpu(lr_mask) =3D=3D (-1ULL >> (64 - gic_get_nr_lrs())))
+    (this_cpu(lr_mask) =3D=3D (~0ULL >> (64 - gic_get_nr_lrs())))
=20
 #undef GIC_DEBUG
=20
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 46620ed825..0a5b3fab04 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -773,7 +773,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_=
memory_exchange_t) arg)
=20
                 nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref =3D (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
+                                !domain_adjust_tot_pages(d, -(long)dec_cou=
nt));
                 nrspin_unlock(&d->page_alloc_lock);
=20
                 if ( drop_dom_ref )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8f93a4c354..da8dddf934 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -691,7 +691,7 @@ size_param("low_mem_virq_limit", opt_low_mem_virq);
 /* Thresholds to control hysteresis. In pages */
 /* When memory grows above this threshold, reset hysteresis.
  * -1 initially to not reset until at least one virq issued. */
-static unsigned long low_mem_virq_high      =3D -1UL;
+static unsigned long low_mem_virq_high      =3D ~0UL;
 /* Threshold at which we issue virq */
 static unsigned long low_mem_virq_th        =3D 0;
 /* Original threshold after all checks completed */
@@ -710,7 +710,7 @@ static void __init setup_low_mem_virq(void)
      * to ever trigger. */
     if ( opt_low_mem_virq =3D=3D 0 )
     {
-        low_mem_virq_th =3D -1UL;
+        low_mem_virq_th =3D ~0UL;
         return;
     }
=20
@@ -778,7 +778,7 @@ static void check_low_mem_virq(void)
         low_mem_virq_th_order++;
         low_mem_virq_th =3D 1UL << low_mem_virq_th_order;
         if ( low_mem_virq_th =3D=3D low_mem_virq_orig )
-            low_mem_virq_high =3D -1UL;
+            low_mem_virq_high =3D ~0UL;
         else
             low_mem_virq_high =3D 1UL << (low_mem_virq_th_order + 2);
     }
diff --git a/xen/common/time.c b/xen/common/time.c
index 92f7b72464..980dddee28 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
     }
     tbuf.tm_year =3D y - 1900;
     tbuf.tm_yday =3D days;
-    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y)];
+    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 0];
     for ( y =3D 0; days >=3D ip[y]; ++y )
         days -=3D ip[y];
     tbuf.tm_mon =3D y;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..4058b18f2c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bo=
ol sync, bool wfe)
=20
 	while (queue_sync_cons_in(q),
 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
-		if ((NOW() > timeout) > 0)
+		if (NOW() > timeout)
 			return -ETIMEDOUT;
=20
 		if (wfe) {
diff --git a/xen/lib/strtol.c b/xen/lib/strtol.c
index 30dca779cf..c68d133657 100644
--- a/xen/lib/strtol.c
+++ b/xen/lib/strtol.c
@@ -13,7 +13,7 @@
 long simple_strtol(const char *cp, const char **endp, unsigned int base)
 {
     if ( *cp =3D=3D '-' )
-        return -simple_strtoul(cp + 1, endp, base);
+        return -(long)simple_strtoul(cp + 1, endp, base);
     return simple_strtoul(cp, endp, base);
 }
=20
diff --git a/xen/lib/strtoll.c b/xen/lib/strtoll.c
index 5d23fd80e8..6861d55929 100644
--- a/xen/lib/strtoll.c
+++ b/xen/lib/strtoll.c
@@ -13,7 +13,7 @@
 long long simple_strtoll(const char *cp, const char **endp, unsigned int b=
ase)
 {
     if ( *cp =3D=3D '-' )
-        return -simple_strtoull(cp + 1, endp, base);
+        return -(long long)simple_strtoull(cp + 1, endp, base);
     return simple_strtoull(cp, endp, base);
 }
=20
--=20
2.43.0

