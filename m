Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0348CC5724
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188430.1509600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeEz-0000mX-LG; Tue, 16 Dec 2025 23:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188430.1509600; Tue, 16 Dec 2025 23:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeEz-0000l0-IJ; Tue, 16 Dec 2025 23:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1188430;
 Tue, 16 Dec 2025 23:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rmh=6W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVeEy-0000XY-45
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:14:00 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e695bc5b-dad4-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 00:13:58 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GVXPR03MB8331.eurprd03.prod.outlook.com (2603:10a6:150:6e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:13:50 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 23:13:50 +0000
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
X-Inumbo-ID: e695bc5b-dad4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noLKrtQBL6HZRfVTMoL9ouaTxFaDgnkJQy3BWU1rrwdIt/E1qW+P9IB1tD215EzCL1dt44iHv9QvqVRITExYdfQsmvqyUSwF6kPp40NAsqwtjBm5zex0+2bbPI1SsTgvZOqkDLVKBWsn4GULL6ESWbSFsPPJrtXSAey8YFqdOBexUwPVhUk/TpB92Plqs/vMxkXvlf/3bZ2giqV9WRoZSyo4rgStjgwzvRpZdBHZGYVO1DIw4WOQueDwDRP1+GCBKkGAnQ834dUf5HENTaeOVN7tNxeB+1gvN5mmtAkntQoUw7h4S2jvJSWOUDb3PuqEH3GvRTeS8k1s6jxQNFFuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BlxZECDzWfohIPtyTZ/CTYOZ+Y5NmlN2gmO5GHeIxk=;
 b=weSI7B+NxZ50uX57r/fwbGIKw7hJA+V/VL8mD3n2AGdPKj3C+mli8iFnAueruYz5bt55jrtAgVFEJL/VpT+HEv5CPQ2QFw6JWXz0MNWQcDkYf7ppwZisSF0TGwQK2B09LzpC9XsDP+lmXNSLAfvRCrs/bUJ/012znl8vfUmdslp47lrj5aRFK8xsgpWDkSpvj1aqMW8qXQjJhsDYyLDqtnRpOsqmj82iocVryDPR+PgbD1g48+4BOwpAxK3CDzXkH6Hu7tyi+buHjDQwbK9tEcliUqAs/9FzGmRCCLaKTLt1QK5RsLiInXGTkUQsF+QkhAt/sLQi6LR0sVQaXuDfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BlxZECDzWfohIPtyTZ/CTYOZ+Y5NmlN2gmO5GHeIxk=;
 b=alclxgHo/chY/su7WjNQuouJfnSh3usP6rjtpmBgQtex3OMYMzmlnu0VtejuR2KJMR6CZfxd0gxi3Df0zDmXKOhAAHld6Ga0QiwIC+OMPZtKSpt8fi7KGrLKuQNTWKgf1Uub0SSAtJF6lJ9/B3TMeVCsEbBxVwNUtuvzFOQirsgQyVuchirWXLNyOwI/RwJ+rX22QEqJi1bK0czt9+XISd3dCYXAMVhj6wRsfPQ1E1PG0dXNpsPZJ1/F5uD7U8apU2V5MMufCCtWrNlOuTS8n87ajNUeQ0tw8dqjdFR4ZeRQKi2uRMXQNwL9FoSG/pKy3cOachoIDhzyHaDIlIlz2Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] xen/x86: move domain_clamp_alloc_bitsize() into pv32
 code
Thread-Topic: [PATCH v4 1/2] xen/x86: move domain_clamp_alloc_bitsize() into
 pv32 code
Thread-Index: AQHcbuGjnZjr1e5ps0GOglHkyj482w==
Date: Tue, 16 Dec 2025 23:13:49 +0000
Message-ID: <20251216231348.3897820-2-grygorii_strashko@epam.com>
References: <20251216231348.3897820-1-grygorii_strashko@epam.com>
In-Reply-To: <20251216231348.3897820-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|GVXPR03MB8331:EE_
x-ms-office365-filtering-correlation-id: 0c8d79ec-0262-4c8e-79f3-08de3cf8c61a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nH1DG66cqFNpTTK9AWHxeBjpQKljSqPEuSVZBMkPVkkjypTm89JCrBaXjN?=
 =?iso-8859-1?Q?10K9OWzSvPiuiHCBK2NWZRZvUEFsu2y6qbx6ZXEVnYC0rl6NRBGW+M+s43?=
 =?iso-8859-1?Q?+xlFgNueqDxOFHkQG2gIEnOt1+B//EF1CeYwLxLk/C4717lsFQuogRJndF?=
 =?iso-8859-1?Q?i+SOlPErJxCqvHoHUhSygKsEOkqEg13XP9um6fZt2ga97GQ7QEd3q5kybD?=
 =?iso-8859-1?Q?yPd+K92qQlG3r0uGcHC/fTagc9C6dZMqPmIjuBCUD5F0S0pQxENT8cbDbE?=
 =?iso-8859-1?Q?1wsH2jtejlSZCwLFqhfC4ygKdexzgOMVFeWDUj3KOGFTQBDFpA9mPx3Dyc?=
 =?iso-8859-1?Q?jC/v24/DsIThHv7ADVGtCjfCIP1S+MtO54MV6Lu7nxJ7VgVIjc2yC4/b81?=
 =?iso-8859-1?Q?hItLuEc+QyGrYvAQIh7aAns2K50SFctvQK2osqmCxe4oiDniErWB/Pmyq1?=
 =?iso-8859-1?Q?pd3CSA89RLW1iZn2blYuFsDyL7OH/taXnVMlXB5HSkmT9PyOoZ/bswhUSC?=
 =?iso-8859-1?Q?qRpXU6J3R6fwiVft7MUhwzUuYyT5hheZv9sGZCbriUlyr1aCp+002kfU7i?=
 =?iso-8859-1?Q?kt6EqT3qL1tl+662q3hw9FFAc2Pso5oJMLKpAy8vx1hyPvJlm+RJgV3toe?=
 =?iso-8859-1?Q?SWeuKJFqDJDjeYuWUR8YMryQsWGP/7B7xpV2ZyDSDW5vaq0EBxgf0XQunP?=
 =?iso-8859-1?Q?X1pYh/eTfpuY9NRGzaLOcbVdwfKZqj6GkrNf8YJutvS8FenIKZWis7tu7r?=
 =?iso-8859-1?Q?EORsfFc9Qpa1/TjfzdqulQbwnGY+dAk6H8wLx7TclPLGRZHE4xMpEBLKxw?=
 =?iso-8859-1?Q?sv+4a/fZ8A5Cd6A68nnpGvct84dGYpYTBWaowFDqR1LICA3TTD50hOytSE?=
 =?iso-8859-1?Q?QjSCP4hh021pjxODjZlyHR1F3Y75sFJErD7gYhps0CBITiDm6n8/blk+76?=
 =?iso-8859-1?Q?sOJnik5kTggLQhQCMxLxJXfEjWuljvebJWR+BaXotuVEypKWZfdCajpZcr?=
 =?iso-8859-1?Q?vN4j4dhUG1UJthEcGUGTUMN9CGkHJB1BWaqet05fz0S9TQbnvF57S95C+W?=
 =?iso-8859-1?Q?prXbAVC4Tv/O7VV90FP6NYfERXZ5m35nnFvf7aNqDq4Kmbz3b5KQ4d+JT3?=
 =?iso-8859-1?Q?PaylLqcF+zARRkVj3MYsMVYsRaGuS9qunvI0v+p0fWAz+9CILKD9uRG/pY?=
 =?iso-8859-1?Q?SILuC9XZ/4KBEPCE1sbMJxVqBcjTi19c3KBGCommyQvL0H9fuQYg34v+kA?=
 =?iso-8859-1?Q?JxWBOy4ebz7lwrRdWJ7YKta7ks+yCUswLy6/0v+35hm94oG67ToX/fxUhu?=
 =?iso-8859-1?Q?1UMuZ5ZQ1WYtxuyC4DIZdGJIMP0XG3zEIpETOycEwpSTPXQo+ugYHOD+lf?=
 =?iso-8859-1?Q?NdaoJn+6qE7/vL1f3K+DVfCLuj0bUIcKel6cLPQRvRn2+SlhhbPgvZ3xSC?=
 =?iso-8859-1?Q?6bNlC/puHE/GuuIfUyoJIzm/bJDFbhEKA4yCrx318A4WxipKvfbrdAvJIH?=
 =?iso-8859-1?Q?2lXJLmgkgQfBDuqVXb4hvIDmI9ZHlNWcSaOKiZ1Kgb5UgpGFODYM+BE5tU?=
 =?iso-8859-1?Q?Vbs6DfFBUoPAz3bfhUEENeYFH+j3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JwuZ3iv2yO3xMlCgQrRTWrJheP2KpyrRycZhS0rvj7J/f1bFUnqQ79LMsW?=
 =?iso-8859-1?Q?WWhIpn3nd7WE9BEUZx/pzb35ciOJN/OPTueeacpBSKxollLQm0FRTWF2HW?=
 =?iso-8859-1?Q?P1TnPFkSxUXsbt5mX0dEmYVeHrLR1KfjqCoeGbL207gl9OX6IKa+ZZFzuf?=
 =?iso-8859-1?Q?cuo8C2EICFnsF9IODgJ1G3AZHPhNp7oZQLqSbPTC2SjkxXLeuP0/l8SI9R?=
 =?iso-8859-1?Q?HGRCHMgDAvxduGUaZ/W8zLJnolC1y2xhqAnuaoznCiNWlZuoIZg/lW6FX2?=
 =?iso-8859-1?Q?E96rf96HQcAsRYuyDpPTfqasOE9CPcBOtvPHFEly8TNcMN0m+KBArQ83wB?=
 =?iso-8859-1?Q?0D38GfpyaeBcQbhUue+0aC9nr2FdXtLOlk+VQH4zF7dp6Tf2S4YHpZqwX7?=
 =?iso-8859-1?Q?qZazE26IlY8Pm4bW6Pt30mfe9K+SjhVa4/0o1m9IR2qtbmDOXgenLkIbnL?=
 =?iso-8859-1?Q?Vk3w8VObj575YyQ1KOjOhgvCLTL9A6VhGgVT+R6SFEMoCSGUUUKEzqxk9o?=
 =?iso-8859-1?Q?4J7RwMeEnCx8Ryg1SvetwQnwtshBjuYu2yEQCNv9j48MlkcJhWeHmY6eOs?=
 =?iso-8859-1?Q?MrV+kHgGtNE2i3WQ50BuDRLznzaHNxn0TLLOEfCOEyai0QykIY7z4Qy2TJ?=
 =?iso-8859-1?Q?TZQJzUHwzmPgjjbZwO3mUqO6Hc994uH0bHwXeROdkLli/OfBcMguWgRcKW?=
 =?iso-8859-1?Q?nSC3SpuLzi1pdBWmxBNuOIsVDuVfGG9cjHOzZWkhML6i76CkG8GlyrHDh+?=
 =?iso-8859-1?Q?+bcIeOMx43UFFTdZyGyuXzeeKwYAnEMS8D73hiVjzyWGEtCE+b5fd5LWNZ?=
 =?iso-8859-1?Q?75fxJimDEy9nJMjdz6SCAMQDsBbE1LfDRHqbLCqXVZi7Xsl4/++F4pKPze?=
 =?iso-8859-1?Q?/dvjnjJm5OOCeAjysh5U8oOhslXxdXtTLVMHocGy5GBg7ninmu60G99YnH?=
 =?iso-8859-1?Q?cdnX97NHM3m+izhXTzmC7z7VEg1COwfum666GoURCJs+4/1SsFZ0nPA7Cy?=
 =?iso-8859-1?Q?fQP0o9cVCG38Pty2DWeDU+zIK7hKcnx7PAxJbVU9x8pX3KQIosjavqw9R3?=
 =?iso-8859-1?Q?fMOY01AZ4baxd4V7ATID0PfrtP7GknMvTNf9kS1XGn6GrQM3HileP+FmQI?=
 =?iso-8859-1?Q?iEtiXhH1vVi3Z5i8jd1CfgJRRI6wu1+K5OREAvTmEyNMvRLEPDiWkec3QO?=
 =?iso-8859-1?Q?hjQWpknEahg4sbNKZeB8oEy0skbZfnHCwksMow+2FJydA7vUN8uaSUWhsX?=
 =?iso-8859-1?Q?RVAvFOP8tHqHOXKOAELpWo/G1cAgB9/M/JdBgsD6nvuP5UfzIaX4CHR69X?=
 =?iso-8859-1?Q?LcUkXejrfKOk4HpD2X7Gx4x5I/HujYYmt20/OnQPs4cwunCUkVR+w7//Oa?=
 =?iso-8859-1?Q?4QpW56A2Yra6s/D0UjeqtjObMXnwBgT3OoM+b9jTvm/ztcfDuBmapdZpjA?=
 =?iso-8859-1?Q?/RbzVw8bgm2pC67ArTaLvpyEHnjY2mLsSlwIarbDxufM2uPd0uzZ0pdFCp?=
 =?iso-8859-1?Q?+zyP8W5RLd6mArhgjpStrhxPQEyWn47XzFNYTpPOxMXD6Sl0Lz4aFWBJV9?=
 =?iso-8859-1?Q?ADSpc6v6MtpfWJ8eceB0xa/OmPpZBHfbB+plHZJyMlfOfpNMCe5vZ8nKU3?=
 =?iso-8859-1?Q?oH3i8DJqzMjLc3lUgAijJnrzp6VyhUxSlrnQNTCVHC5HdVoZMkNQCpww?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8d79ec-0262-4c8e-79f3-08de3cf8c61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:13:49.9573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rJ26200mFxkhzmNKXfMX0p0u2FqUuKXOEfc+FlX6hrl2xdP9K0W7l5GcT+yiuglr6uYiuwE0IjrSlBjLfs1cEfj+8n/ZggfSH0wpiscWUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8331

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code so as the
domain_clamp_alloc_bitsize() function.

Hence move domain_clamp_alloc_bitsize() function into PV32 code and convert
it to macro.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v4:
 - rebase
 - split out moving d->arch.physaddr_bitsize in separate patch
 - fix comments for domain_clamp_alloc_bitsize() macro

 xen/arch/x86/include/asm/mm.h | 12 ++++++++++--
 xen/arch/x86/x86_64/mm.c      |  7 -------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 9438f5ea0119..89e8940c3316 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -619,8 +619,16 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
=20
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int=
 pxm);
=20
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
-#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, =
bits)
+#ifdef CONFIG_PV32
+#define domain_clamp_alloc_bitsize(d, bits) ({                            =
     \
+    struct domain *_d =3D (d);                                            =
       \
+                                                                          =
     \
+    ((_d &&                                                               =
     \
+      _d->arch.physaddr_bitsize)                                          =
     \
+         ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits)           =
     \
+         : bits);                                                         =
     \
+})
+#endif
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 42fd4fe4e9b5..8eadab7933d0 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1119,13 +1119,6 @@ unmap:
     return ret;
 }
=20
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s)
-{
-    if ( (d =3D=3D NULL) || (d->arch.physaddr_bitsize =3D=3D 0) )
-        return bits;
-    return min(d->arch.physaddr_bitsize, bits);
-}
-
 static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 {
     unsigned long i;
--=20
2.34.1

