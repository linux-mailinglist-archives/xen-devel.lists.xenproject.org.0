Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECBB16EDD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065260.1430724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoK-0003mI-99; Thu, 31 Jul 2025 09:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065260.1430724; Thu, 31 Jul 2025 09:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoK-0003hC-4A; Thu, 31 Jul 2025 09:42:52 +0000
Received: by outflank-mailman (input) for mailman id 1065260;
 Thu, 31 Jul 2025 09:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoH-00025Y-GT
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:49 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b61d32f0-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:39 +0000
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
X-Inumbo-ID: b61d32f0-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvBJOjSNbjO0EPL9hfsevys4RdvUToNuchyr0FUTBHOiJNiOcPQAV4q8QzUS/dgsLYpilzyhFR2o1cUzRLxkbT6W34lPtL0bz8DX7NnMXNTZioyce6TH/LP+yTXXqhTuQmjLH7lg4BKE8w/GNAD3ZEuRHGbumW1j0LOW4SJ/gAvFnicUbO4KpCbykSFgkzI42VpegAqcJyazbfVPPxptqv0V2TTYtZUZRFABx+6dfITFKd+pCHpmW8YmtmTWEODuCbwhkrEAJVseg+5oA5J0HsM+m9OA+hXMYplVCldEsLf7hV9EFJHyqTFpAZymfAM8Aqf0ud8FOw6loVJWGgJ5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYphxlgYyJZNd4HnTGaAyXBnIwLP2gSD7KdAq5AemK4=;
 b=ZWP4/2um/C8yAanoUAG0pw2AVmQnKCWxbt8hQSGrzM5nkaurBc/cujd4w14LLWBQxADIDxIt/9VN/HCXheut6i6PKXHceAfkhrSs/yIqIcHDazY2SBJyP+Dd8b36H7XXf5/j0FOQ4Zr3f9qiCjIRa4z4yIlHo1ssOcItjaOYdbiizuoWzhXkgXLyTUOU2IAXxDBifeDopTEgVn8f5eSisEShKpa/KVlRe0F35VUiv+FTMdT4eROyoKui3VULmDG3+991tlK5gSm4LXnpaHxkx3HcgfgVcexYtJlUbmyKIOXXdLsxFoWQ7YBkAwWpviZcTsMMB4Lo1SsyFksfFwk5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYphxlgYyJZNd4HnTGaAyXBnIwLP2gSD7KdAq5AemK4=;
 b=kNZPI0+A7EjtsST9EKkQamSW9SfPw3zNPcY3XjS49hcS2I9TdMPR8tjfjbFHzXso9sZh2uoT64jhM83Kpodnp1bSvYr9NDXBqaLZG43wOa7tLB/capAdvJdZ/OiCSCbEvLjqd3G5STsWfdmnaTcALg4/t5ps/z17F64PSY2XLd+BCIa5YwPHXzX0Yn4+u1upi2xeLri2piJLE0jDitMUzWcAyR69JNmwpKy8m29GBOwFtQWHR+NbAoMEkRPFRtkqp8cwLbPhecrSK6NFK7x15wa61/8qzEVc41mGI7nCiY3OObJ4A7gaP3yjquWsqaWib2I5WNjou55obxNeG0JXRQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH 4/7] xen/arm: probe kernel before creating dom0
Thread-Topic: [XEN][PATCH 4/7] xen/arm: probe kernel before creating dom0
Thread-Index: AQHcAf9zegx3HkZnjkmMHE3OE+o+Sw==
Date: Thu, 31 Jul 2025 09:42:38 +0000
Message-ID: <20250731094234.996684-5-grygorii_strashko@epam.com>
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
x-ms-office365-filtering-correlation-id: 1407d10c-e464-41d1-dad1-08ddd0169683
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+XlnNJte8IjcLKqIVm49h0RJgNLIFwjryxfpWpc93aAuqpgDTIqjD2AEjN?=
 =?iso-8859-1?Q?xmeUcFf6Ha4zv6PHiP+Q/0fdCZyfPvoIcENK/rXiBl5f5v8Xx06vAl3m53?=
 =?iso-8859-1?Q?uphB468ITy8zPfAC37AdvughulyGiIdnXbPluZtAr7EXlF/1S/TBvwq2Q0?=
 =?iso-8859-1?Q?UN3G+Qgbpds/NGaezUwY6lCPFiDYvmBNDr73+T3DlFkEcF3lnuCiLz5LB4?=
 =?iso-8859-1?Q?wNUuUdaUgjzVdcxI2R1h07hygmvdPMWz2itO5WRBbMZ74IvoWB/OVGXvwQ?=
 =?iso-8859-1?Q?RpajzmBf7PKIPhZKDo84YRV+hGGnibyMru+7ngjDMmU+EXkxUM/eUKgQXf?=
 =?iso-8859-1?Q?ST7YtYDKiXCNAgF+haQy7fUB9CQnLgQS+QxxYL062BPlmA5mGltL2Z6hKG?=
 =?iso-8859-1?Q?uPbt0XtOGq7kshF1r8Z9eEDCAeJrM2cFmnM/O/V3UvYtr7QOmqtNBtroGK?=
 =?iso-8859-1?Q?yx6Id7JW8fNlAEGDyLWIIVt3elhckYzy3Blqzyp+2cXAgH+55wrEel/YHG?=
 =?iso-8859-1?Q?d4ugpZgcjeHLQABxVYn3qVE4w2PU1FRtV84YFJf4blNWQgLUnIPI+aUf37?=
 =?iso-8859-1?Q?u8c+/s57cB8jwscxcjGHTuOGFKGdi2ejPGSd3qb1R60ZnLBd7cP0ZxtQR9?=
 =?iso-8859-1?Q?h8zl0mowLq7Af8gKzsLGbEoVPEU0VbGF1MtuOlNQd18yFXVUpmycnlIfak?=
 =?iso-8859-1?Q?NWHvwoCcjERQNDn0ZgaKqTIm9EoGcyDVQyu8JnA73UYcQxcslBco2oHsu6?=
 =?iso-8859-1?Q?Bi/CDnBS0Q4lsvqeqcO7ji3kE/9ppEGHR38vWVgouVMXfWN9LKPdEqFvdj?=
 =?iso-8859-1?Q?f8ditKn747HP1yWoJ7jjQGZ35croieHmM04BFW2HmJOedAKQMhl9XAr6Jj?=
 =?iso-8859-1?Q?4ejsismPmyVbKtJqEED32ttFUtZpvcH9DwFdhXjqCe9yuPognYinkMZIwv?=
 =?iso-8859-1?Q?4tC4ViQXPzlbVSbl2BpaJro5GaLXUxSn6i+9G7wP9vt/G7fescFecwk7xb?=
 =?iso-8859-1?Q?tx0y5AvopKsnBsAah7fToSH+JHhd8pBDAFWxGam4CHObz1vxQ4UZs7OhOD?=
 =?iso-8859-1?Q?zXbaomvY9ag98Y+v0M6K+cw44HpIQ+EqRVZu8vX2Xn+Et3jL5oIwQeKP1B?=
 =?iso-8859-1?Q?Ah5adYRPXHRcsKxc/PvG0tFuo9JKAgMkW70+z3JlcgF2dFzIHbozpoN1h2?=
 =?iso-8859-1?Q?rdIoN01sVh5QWXuRtAlHkN0gLdGGrnBNVFsOpHiRwC022cZ8jWheVx6+YC?=
 =?iso-8859-1?Q?CbU/h7oxvm94fnWmvugljbGFRjTDMeOO+FnLOGNaMFAXfTlOIg6FiGD7na?=
 =?iso-8859-1?Q?erFCqwV44Q0Nl1iZBEomCJrXTE22Do028T6tXZfo9E3onQdSY628rc4cnE?=
 =?iso-8859-1?Q?+/rfN4zCNkJ21TD3H3gjA3pBnDIxM7z07O7xPLg0W/aSDff0SBuQE4C1G/?=
 =?iso-8859-1?Q?2cazsXXPCiDVwe51Nlzkaa47r+z583EcV48lj+bmnzXFwcMPRl3cOgkNvB?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zfcKplksSvsAnA2hSoHPYutZ2XbGXHiNhBI7C6VY2A8yih+6khD7J2KYuR?=
 =?iso-8859-1?Q?l0WkMh2wf4wTc/C18BwAG8mbMW0mm31FgZAJIToGCYwBGmAa3fj8Aug8YL?=
 =?iso-8859-1?Q?mzPB10S1OkrC3FP/X4IBs6M7jsZFm/OkS7YIteVUt8QndaCgT1KHUqDEa6?=
 =?iso-8859-1?Q?6BFP30ezoqDEQtftQfV6pHVzGZ0gUiMbrZRrpjAgcO7c7LjWxKnRKHv3KB?=
 =?iso-8859-1?Q?LYli/XZRFPdXnUxviZ/XH8CNjgdV1P3c/bnyqdMeWnQrNiCkQNOgIHObtT?=
 =?iso-8859-1?Q?wVi7W6PTOLLa9yY2LzRAw4No9iWDXMLj2j1UKo3rDsbWuPquTbl9Xb8qTi?=
 =?iso-8859-1?Q?vMDHHAeZNhb4RB3Uy1WYFVK5QDWyChICCk5ji+AA10097cIgouu6PaBLcE?=
 =?iso-8859-1?Q?m5Z/6yM07ON2FweOYPuObTRyduKzTEmGeqk8srva0/r7OYx4kCn4pQpsay?=
 =?iso-8859-1?Q?Y6aGpp9PzCFlyPC9DjQFTofCy2XaIxXFCnkwg1/92AkuHHT09LIYzbSltv?=
 =?iso-8859-1?Q?oG2FIQ0VDru5RSK8WuI7mXgvwnxnf5Ux40DT1uKg3RJR0vNePQbXMJy13O?=
 =?iso-8859-1?Q?QSF7HtUEbOFhURlgvsdxThD4GA/cW7ZG/DBTWReuvUlAybsQGu19NRjMmC?=
 =?iso-8859-1?Q?K4Zd4PlUA/YLNtnVmnEc9vIJGrRgmen+v/7JQsq+/hNFvEhTDrr9YTq6eK?=
 =?iso-8859-1?Q?MHGfz1yxEYySH9juwD5hsjgJkHlx7iOzT69vuQ2VuTD8eBkkM+XI26eysd?=
 =?iso-8859-1?Q?y57NSHiyT8BJuhO9ab6UzVISMV9FZMPw7M8XmNfB0VwT42TWvgQNloixKa?=
 =?iso-8859-1?Q?PgKvMyiwyJGENIXPoaqHNAt+dA64e/AczE5pgVqBag7VIaA+++eHwe+u5y?=
 =?iso-8859-1?Q?PhFwPqOHEFL9++EN6fH90hh4IGmYRHaEV5qxigEwLiWAjsZYc5tjmkJ8I7?=
 =?iso-8859-1?Q?U+NM5NTZf06OsOzuOr4ayK8TPAUBZept8mTfwZS6N4MCfOugS9OXus/8e+?=
 =?iso-8859-1?Q?Eje+YqWtNF1PstiOX9oNBgRjvArTPjx4EkIODMa5Ql8DZe9sNxrLQJwj2v?=
 =?iso-8859-1?Q?4I6ZJkIScIuC88aELFE/BrPKNjh+Y4k9gh+9sikNtOEzcCz/jm6dwuirNG?=
 =?iso-8859-1?Q?+jKgQV3bZ2jeCyAQ5Bfhphuj5QBWQsESZqFUSByoP5qg8P8Isqh0pVODaz?=
 =?iso-8859-1?Q?Cz/0qvp4wFXgcpQNrBQ6NJs97EAoTlwFd6Nxi6e8Od8c9oS+xYW7ESAnmf?=
 =?iso-8859-1?Q?bTV3EdoGR8lYn/S+dQ1T97eGvZ1C9DD5tMPiqpetAeS4fBQK67rHXhhjXp?=
 =?iso-8859-1?Q?iQgGbdOiWFdsSkJMx8oPvTcxAmLX6JT0VPJZ1j6ez+qMKAJqAiv7Oy6+/d?=
 =?iso-8859-1?Q?PHZxuJIeoxm33udT6kQQeH6mMANNQe4F9Wc0Xl/No9K290EtaMg4iVkoqZ?=
 =?iso-8859-1?Q?iCo7Tjqdc73F6xTES2/8a3a2SlX9Ed1GYqd7fQun47Jk+tf5xy2/uvWg/v?=
 =?iso-8859-1?Q?/YRTpSHlwzz+PHBvCTazGE3+SEj0GMWvbh3/yeevFVXlGRITTzBn+nREKE?=
 =?iso-8859-1?Q?LpaRoLrvnyneGyTZJlx5W6HCiQcnnVG90QdN/DTFMxqXvfwlx5Zmyjas3M?=
 =?iso-8859-1?Q?XTFHmRQFl1hynk5+fEI8FuaWale9Jo91LwfGYd4aYf2G5tew4P4cb6ig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1407d10c-e464-41d1-dad1-08ddd0169683
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:38.4076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZO8Ak+NCZVVYTIrnJVbdBabPUO/DT6+AwpOyXx8ADHEyVbE3ByV0z3F8iW+Is+E3wTymg+PDgUvWz8Qw6E9T5zK9qS7nmqTT+jatPwA59GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

As was indicated in [1][2], performing guest kernel probe after creating
domain is not robust.

Hence, rework Arm dom0 creation sequence to probe guest kernel first,
before creating domain, so guest type (32/64bit) can be properly identified
and dom0 type configured correctly from very beginning.

To move kernel_probe() before dom0 domain_create() the domain references
need to be removed from kernel_probe():
- remove ASSERT(is_hardware_domain(info->bd.d))
- remove printing domain id ("%pd") from "Loading kernel from boot module..=
"
  log msg.

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/domain_build.c     | 32 +++++++++++++++++++-------------
 xen/common/device-tree/kernel.c |  6 ++----
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fc9bcc6fbbd5..59966f1bcd49 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1954,16 +1954,13 @@ int __init construct_domain(struct domain *d, struc=
t kernel_info *kinfo)
     return 0;
 }
=20
-static int __init construct_dom0(struct domain *d)
+static int __init construct_dom0(struct kernel_info *kinfo)
 {
-    struct kernel_info kinfo =3D KERNEL_INFO_INIT;
-    int rc;
+    struct domain *d =3D kinfo->bd.d;
=20
     /* Sanity! */
     BUG_ON(d->domain_id !=3D 0);
=20
-    printk("*** LOADING DOMAIN 0 ***\n");
-
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
         parse_dom0_mem(CONFIG_DOM0_MEM);
@@ -1976,14 +1973,9 @@ static int __init construct_dom0(struct domain *d)
=20
     d->max_pages =3D dom0_mem >> PAGE_SHIFT;
=20
-    kinfo.unassigned_mem =3D dom0_mem;
-    kinfo.bd.d =3D d;
+    kinfo->unassigned_mem =3D dom0_mem;
=20
-    rc =3D kernel_probe(&kinfo, NULL);
-    if ( rc < 0 )
-        return rc;
-
-    return construct_hwdom(&kinfo, NULL);
+    return construct_hwdom(kinfo, NULL);
 }
=20
 int __init construct_hwdom(struct kernel_info *kinfo,
@@ -2040,6 +2032,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
=20
 void __init create_dom0(void)
 {
+    struct kernel_info kinfo =3D KERNEL_INFO_INIT;
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg =3D {
         .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
@@ -2052,6 +2045,17 @@ void __init create_dom0(void)
     unsigned int flags =3D CDF_privileged | CDF_hardware;
     int rc;
=20
+    printk("*** LOADING DOMAIN 0 ***\n");
+
+    rc =3D kernel_probe(&kinfo, NULL);
+    if ( rc < 0 )
+        panic("Error probing  domain 0 guest kernel (rc =3D %d)\n", rc);
+
+#ifdef CONFIG_ARM_64
+    if ( kinfo.is_32bit_type )
+        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_is_32bits;
+#endif
+
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
@@ -2078,13 +2082,15 @@ void __init create_dom0(void)
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
=20
+    kinfo.bd.d =3D dom0;
+
     if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\n"=
, rc);
=20
     if ( vcpu_create(dom0, 0) =3D=3D NULL )
         panic("Error creating domain 0 vcpu0\n");
=20
-    rc =3D construct_dom0(dom0);
+    rc =3D construct_dom0(&kinfo);
     if ( rc )
         panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
=20
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kerne=
l.c
index 28096121a52d..f67229f66d30 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -140,8 +140,6 @@ int __init kernel_probe(struct kernel_info *info,
     /* domain is NULL only for the hardware domain */
     if ( domain =3D=3D NULL )
     {
-        ASSERT(is_hardware_domain(info->bd.d));
-
         mod =3D boot_module_find_by_kind(BOOTMOD_KERNEL);
=20
         info->bd.kernel =3D mod;
@@ -204,8 +202,8 @@ int __init kernel_probe(struct kernel_info *info,
         return -ENOENT;
     }
=20
-    printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
-           info->bd.d, info->bd.kernel->start);
+    printk("Loading kernel from boot module @ %"PRIpaddr"\n",
+           info->bd.kernel->start);
     if ( info->bd.initrd )
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
                info->bd.initrd->start);
--=20
2.34.1

