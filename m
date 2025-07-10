Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0323B00E85
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 00:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039899.1411462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZzTv-00015s-Sv; Thu, 10 Jul 2025 22:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039899.1411462; Thu, 10 Jul 2025 22:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZzTv-00013Y-Pp; Thu, 10 Jul 2025 22:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1039899;
 Thu, 10 Jul 2025 22:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63eF=ZX=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZzTu-00013S-IA
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 22:11:06 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3883612-5dda-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 00:11:01 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM7PR03MB6564.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 22:10:59 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 22:10:58 +0000
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
X-Inumbo-ID: c3883612-5dda-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siUa5ftiBUqjY43CPL1v5wu8uvlvaDOoosxr0ORjNZVPz9C7A3tA2gBd0CKycISKOWCBX7IAchXQBU3ZrAjbkNEBkZ92qEpKYBzWp3Vpg46lKzwrhtvL2fTXh2YfTtXjyy4SNXY7i+xr1/GmGg0kybV0rY2Wt7bUTe3qFMGJY9pQwB2NMTwd4e3UwILPF0f6URzq83QsTEerJhTQSQw5p8lheYbKQNSXs/U+myANKbmveXHDwXyytB+6oefS5WVanYSuqkWcF/fjMYvoVlJMlW0Zp4msa2Z6bpMqe238ihTLoy76SRYqnUa07UA80fLrz+GWItN5xJh1y1IAZ6Hi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sTM1gWXiip7F8bwX4Pq3RzxPJKmta0mK7mzGujAIeE=;
 b=GgdkNyb+aIo6dGL18WCYBBMZaJnPF8GI3rmsOwc+xAsANgnCFKoTEkq9xOZjqlU+xei9QaQ+EN4QTW3sRMIFyOQxce4Hw/+M+OQlEio8+4q/aoY/Ca7HXj6b7ctxANEO77AOfz30vxAmJuPQxhVsJmxG9v8Ookn5/BieZmNZ552pXFTPjp+fWjHA9HpVC6QgTtnLLJOWP0GEmUPfF7HmfejxtSdVO60J3PZ0+OFNSAswKPp6RfEuZm4QzHm1plnESf1u9OsbX36N54jZsiFPKzex9kNgS/kk/JXGlaqhGSvfB6RTexYkuFPgbaDVqZNK+B/WQcEDqrXpowbiVPN01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sTM1gWXiip7F8bwX4Pq3RzxPJKmta0mK7mzGujAIeE=;
 b=PhuGTKG8+37E94POcVGlIgTmHkom/RsaeBdbLs/lfp40JyDVGIQ841w44BmQb09rhin04nQDwKYU2PjVyuyGPTMjKk4rRsww4fgFp4IqxPSyD+RPW6mfzYdiIGTM064E75Is9B5OE5F2sqdhSYR/UQ5I4HIOCs0xNsVM2I8gfjIXZsb4WsY/pEaPry7ilhAT7t6CWx6gs4CPll81KXZhLrWhd4hYx8e1yfwtGwJMjNbLWVXSz7xraF/AE4L/cVzZ9EzjKuKjRUOJ/bOQ1W/r/1gn4u/Wj2GGmeiV+8ihER0lGNwbFmRuoaQUZ7zY01jPpv84zNP0qhyVSHk0fMSEyw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
Thread-Index: AQHb8eeDdIb8PsAFg0eJMVAybu7FMQ==
Date: Thu, 10 Jul 2025 22:10:58 +0000
Message-ID:
 <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM7PR03MB6564:EE_
x-ms-office365-filtering-correlation-id: 9125e581-ec0e-4a25-09b8-08ddbffea612
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6mnrKoz8EoYhrCqCtQHwUnG06+l3mxod5KwZsT4EZD5WECoowK6Gyiuapn?=
 =?iso-8859-1?Q?EL2Kc6u7ecIuyQxtbZzN7NSoGxjbVBAUITlzBjfnhz5OCK7fSDyMU/QoQn?=
 =?iso-8859-1?Q?G7Bp0p/5p/6kqn4f3O78xh7zHYvqJ3eV4thqyFHQyoikMLor00E6E+SbDK?=
 =?iso-8859-1?Q?G8wA7zTLrc8V2w96MIuniW6TD7KlSGTBenUBBr0xJUUSOc6S4+zMKIsSUg?=
 =?iso-8859-1?Q?+v2vuUAzh9TAfHy2Nb771xunQgLg4gf3bv4UeSypBGMw8h/rtCZy/W9aHk?=
 =?iso-8859-1?Q?aQYtUrslgj42ZHJvc3xx8/kd4WVhnnkGl39Xm92XfAAT3A+5aqMooDdIka?=
 =?iso-8859-1?Q?nZadUxvK2ayphJpLCbpIdy3G8e/kWeidqJazG4WhSflVc9r5GypfLdn87b?=
 =?iso-8859-1?Q?6KQ4eR5q8dyc+7zgWEZOGKPVeY5oOJiyXvBTkFfm6/WqYfzLM4nhugdEdA?=
 =?iso-8859-1?Q?GflZXztkp/ajlWWqbJp9+Wb5gOk8C+eT1MOKgB78rqeC8afpiTLmz831Hm?=
 =?iso-8859-1?Q?8lCcgGx35/8tOu8W8/5bF6tpqaBilgbtDYZAdB+ffPIW1/uepELXRC5c5T?=
 =?iso-8859-1?Q?6bjQl82xI76O+rG/S9LtuSN6UPXdbYA2WELF254FHJYOZ1UxEwDMoAhN3L?=
 =?iso-8859-1?Q?ER99R/ZdBFdA/NuASkegHJZozIPSbrXonvzxIF4rMSHkog1kYwmIDD9u5n?=
 =?iso-8859-1?Q?VU9LCzhEtU2HGG2+8BO7AgQyIMuST+K2xmpzFlgE+9bqegsCLsJsByShxL?=
 =?iso-8859-1?Q?KpaHmR5shScwEdwTrSKvMaREKIkqQMbShvllL1uUVM8VrIewpfx7lnbogb?=
 =?iso-8859-1?Q?8BQ7CHY6LkI5AHXrkbSmK2jdGmaVad9Xm/7YvsigJ0U7TGKB7Y3hpaaumy?=
 =?iso-8859-1?Q?sl3e3SFbEoRPeCJJsOGTvPJZjJ9uVuZihhC+40X3RBSh/HeI21eJpK1RS3?=
 =?iso-8859-1?Q?K1J56m1kz4oNw81zy9nRN8TKsK+BMxRhflqB5ooz+7yP2E5MvvSsva2+ay?=
 =?iso-8859-1?Q?+cl7EJMkTPrY/d5klJU3NPxlEar3jRHyBy98CkPHu1Diu1RKxvXnX35co4?=
 =?iso-8859-1?Q?zlCbyCJy3d7FT7MzQyQodfVOIBCnZYD7fxVm6dmCNLyGRehB4LRHcTXTKo?=
 =?iso-8859-1?Q?pE5lf6/iRQQPzD8gGrYzoCbtp4YKttWjXHSKy0EZWOF9lFXHjVl3q/WkGQ?=
 =?iso-8859-1?Q?qhmFFsKq3oxBaLPAHpVslpSfGYNcBV4GGhersiHvRRsycuL4USE2uy43HV?=
 =?iso-8859-1?Q?scuHgjOi8wjzpwaTqIdKsMB5J7tS6YFmaZx+oBUbSyUKxNdDgbApgDrrsH?=
 =?iso-8859-1?Q?fJy5U8qG5vlmJGM3S/v7GjitWW2o0EFpSQUfkbyog9/TQgJjHV/7DxQvbb?=
 =?iso-8859-1?Q?UTYntgGYuCIyXAwTTUr2jdVHQFLk8lyVKe8kcE8kvYnQptaB44iXH1Mug9?=
 =?iso-8859-1?Q?VQLV2EyjRpeOyE7g4aXFM3Uv+C7AOL8kJhVEYlcyxWz4pOZnQ0b8ALpOEB?=
 =?iso-8859-1?Q?PWU/8xOFMc6t8VEz84tiV+BWO+XTatemEvkX7Nn27jmg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w+d3WEQ3gY1Eeh17j0uXhUX/FMF8By3IXAla+dDXy/mw5vQJJEu3fi21Nq?=
 =?iso-8859-1?Q?/Md7kNOuD+Ee2Wg2X089HAIsDEzuk1PT0DSo9ynLDNHyvlXsawo8j9VEj+?=
 =?iso-8859-1?Q?TEKwVc7LQMWhStxRFkxx3q35QLBPniT0KBt0RhISIj11dAyj93gMdZc972?=
 =?iso-8859-1?Q?rw4VN2tGzG/JNjuq94P1dZIPUE37JB9iFUVnuvk9zrM65HVkKwVmLTMX7c?=
 =?iso-8859-1?Q?gwfSxwy0onT23Ypm/GaTEBIPCKnZGQFLuz3VzlWznr4rDvwmpXoAlsWPEx?=
 =?iso-8859-1?Q?WoDxm53eGAOQfT+haXd/VHowFknfN2d8zM91kW7Qe4MvsppigpB0eL4bh2?=
 =?iso-8859-1?Q?I7CBHzoLZ6OkYefs5aNgHTufSvEbVQW0WQ61b15l75GAntM++xF/s1wXuY?=
 =?iso-8859-1?Q?Pk5o9DUlY5GnGyRJlGtU82TMnq5/dVFkFZFhnyeEEZJot/WIMYTA12yVjA?=
 =?iso-8859-1?Q?IoCszYh3JpveS0HAmM5vPV8FQJNC2Gqkdv89wgvbNOhmoCmRSJvvCGD3El?=
 =?iso-8859-1?Q?yd4w8W8aMOKxLtFmFW3rdKW1TdyMOQHKFhpXUgLdl057rNCE4FshvFQ6ek?=
 =?iso-8859-1?Q?ehMpyS3WVrUUcMat5vjpOk+vu/jpmkW5viUJFG6T2zeuX5xmY6jTd5EbTc?=
 =?iso-8859-1?Q?FU9clmZzlVQJjqt31DBhcA7UO7ljagLYjWX70OdGEmn23TO2OgXAl4xAIs?=
 =?iso-8859-1?Q?L8pryZbzRdx2Ked5yxGu3kc5/rSMuN3j1rWt2QI3BAc2gEIUbD4RusrXrA?=
 =?iso-8859-1?Q?zmfEbod+amquHdglJgb6hNmFnYh1g/jb3lzMtY9gfyfLn2d7TeN53uWzWd?=
 =?iso-8859-1?Q?uhF3m6hkbTzZ7s6ff6KisshxMJECpZzcp/NGWclVIsSyzC23REpUqtDHVW?=
 =?iso-8859-1?Q?yBY2sHVFIaPbW1qy9xndj60870UzNzZlrpa/mCzpsNyr7GwIA6y/qlSr60?=
 =?iso-8859-1?Q?XUpvsMzLehxtDOLJ0AB25S/UbDp6NvFN3fIzusoIw2HMKYebdcR8F7xxMt?=
 =?iso-8859-1?Q?0lJdt7xui3mMdNHp+Kud7oVZn9dnWy64XL/LcbWxmr0Txwt7NHj6sy3ewZ?=
 =?iso-8859-1?Q?mEMuU1ZLziiaZ0qZ42K52Tu4xY49ahNfiXdT3VyAMxuRarkWl+lxo2Wrcd?=
 =?iso-8859-1?Q?eQ0xoNCuuuKPCWNRdM5Y1OOEOF5fgQqBvAIkr9P2tTsSCA2ghfMlPdXBTe?=
 =?iso-8859-1?Q?UWHX2HQaViwltRAiFzvggowpBiNJkzsNw8UrEFcUzgIgRDAEKZL6mhWtjP?=
 =?iso-8859-1?Q?yBiP0UPLx1XFOsMQrwIvMjwTSy82p1REDXmS64cENFvfm0FNu8yOHV6D3o?=
 =?iso-8859-1?Q?DLheUZSKvDOOCcguJwcw9G4XKA2d3b5fu6pri7OHFhEIcUMkBkczHh7ZWs?=
 =?iso-8859-1?Q?zXu4dn3jXHm1Hu0Vh/cCTt7WOdfrKjFehISA/iBoN4yqPa54wNcR8UQFlR?=
 =?iso-8859-1?Q?8wYQ3/YmPxFNiamNG50+JHM7b1Nd9b4Z+91nTUya6WKIWRPj6jRpzxwqWJ?=
 =?iso-8859-1?Q?PZ0ezctt1npOOSJ4r46fyQ1wiy/smNm51w7dfmoYwOwwwleO1hhcqB8HPN?=
 =?iso-8859-1?Q?hNB3OKHl2BAejfoqrxrj5k+iiL+L/iQLdbOIiayILvhCCCN+D3Ae4GUiuK?=
 =?iso-8859-1?Q?GRNgcGK8hkaDd7wHYcBufV0TaTMGek4m1mJZwSj9Y1qm5yIpLIs3FThA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9125e581-ec0e-4a25-09b8-08ddbffea612
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 22:10:58.4843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yzbZzM/uvghGyIT+Gh9CXJGDnCl142MtyufDGKEU8Jj8+ZHoRv6barlnH2pqaQoYaVB0lJEOZF89BU7AAaFiFWTyc9EUffFiJJ1ewUvZ5AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6564

Rule 10.1: Operands shall not be of an
inappropriate essential type

The following are non-compliant:
- unary minus on unsigned type;
- boolean used as a numeric value.

Replace unary '-' operator with multiplying by '-1L' or '-1LL'.
Replace numeric constant '-1UL' with '~0UL'.
Replace numeric constant '-1ULL' with '~0ULL'.
Cast boolean to numeric value.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
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
index 46620ed825..96086704cb 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -773,7 +773,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_=
memory_exchange_t) arg)
=20
                 nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref =3D (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
+                                !domain_adjust_tot_pages(d, (-1L) * dec_co=
unt));
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
index 92f7b72464..a6eda82f8d 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
     }
     tbuf.tm_year =3D y - 1900;
     tbuf.tm_yday =3D days;
-    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y)];
+    ip =3D (const unsigned short int *)__mon_lengths[(int)__isleap(y)];
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
index 30dca779cf..5f9d691727 100644
--- a/xen/lib/strtol.c
+++ b/xen/lib/strtol.c
@@ -13,7 +13,7 @@
 long simple_strtol(const char *cp, const char **endp, unsigned int base)
 {
     if ( *cp =3D=3D '-' )
-        return -simple_strtoul(cp + 1, endp, base);
+        return (-1L) * simple_strtoul(cp + 1, endp, base);
     return simple_strtoul(cp, endp, base);
 }
=20
diff --git a/xen/lib/strtoll.c b/xen/lib/strtoll.c
index 5d23fd80e8..e87007eddd 100644
--- a/xen/lib/strtoll.c
+++ b/xen/lib/strtoll.c
@@ -13,7 +13,7 @@
 long long simple_strtoll(const char *cp, const char **endp, unsigned int b=
ase)
 {
     if ( *cp =3D=3D '-' )
-        return -simple_strtoull(cp + 1, endp, base);
+        return (-1LL) * simple_strtoull(cp + 1, endp, base);
     return simple_strtoull(cp, endp, base);
 }
=20
--=20
2.43.0

