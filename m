Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EFC0212B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149306.1480979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx7O-0005u7-OJ; Thu, 23 Oct 2025 15:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149306.1480979; Thu, 23 Oct 2025 15:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx7O-0005sZ-LP; Thu, 23 Oct 2025 15:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1149306;
 Thu, 23 Oct 2025 15:20:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hDG=5A=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBx7M-0005sQ-Ls
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:20:44 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6fe73bf-b023-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:20:42 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV2PR03MB9521.eurprd03.prod.outlook.com (2603:10a6:150:d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 15:20:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:20:37 +0000
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
X-Inumbo-ID: d6fe73bf-b023-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWPxEH+MaBdKd1ofg5aFcCZ45DXnuYtafTPCrmrdGcyR55cJ8cIRSxxoSCuR1FCzUzZRurdoq8hUQBJ7zbHZDyA7GdSE4l1WV009fTV9ccz/Cn5hj99gcg1V0L3BRoFm4A16p6dI9e15bkpxMyR9UBs8e73FAmhQgUoXd3TusYHzG4JpU3vh9+o/eC1ZJBjx1r2MxxUvJm7fq07kuNOPg8q0ndxl8nfswniJ6KUkwcP0ViIzg0jWNANayIF85L0ri3QaF5WigMA8mO/AznXMV/XCbdnHPulc8mAO/S9HGBCBCRdICMkiY8IzDExZjyUBXAWv8K6CCYFOI43tJoMEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=642h5+FniBCLD4l5vas8nhJnb+JNQoIG1lDR7i0oVtA=;
 b=piUOCqWkSNIcY7B95S55Mh4x35KokgIHKPBw11sA24lWjkP3ZcV4WgpzHDwlq5eAgHUMIpXbnjmWDcr2QQTC85FoA0ijmwqqa89+0n3H+j/NO9uBSS7ffhpYHzmdIfqsFetCf2IVcQafGn9cr49CwXTRA9jxWVwyqzwxTYkIA+PIzPAuqrYozoB8Bv8KYxKuQ2rfnsBBO0+Sa8PlPvMTfxBL9kgYeZHJnH70dGWNK3abkeGwfNWOFpWN0hDPe9fWqgwmgkS4Sbg4wjw+8culOeEkdP88NVlviX4DETPr7tb9P0GzObLzzCBrloZL4B2CddkchCEgySo3MbXr8WLbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=642h5+FniBCLD4l5vas8nhJnb+JNQoIG1lDR7i0oVtA=;
 b=rrKRF3106G2HD1/oB/PZQIALt9Bh7FrdpSmgu6qIjSfDAgA9qN2HyI9K90bFMBNg1N9Az4TN1F/hZ7Zyr4dZ4sK88dUVB4hbfr00y/X5X5FJFZ8Gm7/xjuaY9nurt9gLWEhuOgZQahikI9cV2mVT08+AV+hVZFbgiv08LcM5HvoFAZb+FVa7EZVhheSJeGOJbm0Rx+Ap+KddSujeoYKW5e3ckKAgAjK9uKZwvGFes7PNNsXVAvZQQMwKMVURXEJ5Am/WCjOOHwgZynrbWnWxUJi8Y1yWPog0dhvALBMDeYOhdcngKsnfUZMrO//DNvKlpqXdrEqjnyUHjdYiB4wUpA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH] x86/hvm: vlapic: move vlapic_set_ppr/apicv_write() under
 CONFIG_INTEL_VMX
Thread-Topic: [XEN][PATCH] x86/hvm: vlapic: move vlapic_set_ppr/apicv_write()
 under CONFIG_INTEL_VMX
Thread-Index: AQHcRDCVvYQlUVcQfkOsfzQeJfAtOA==
Date: Thu, 23 Oct 2025 15:20:37 +0000
Message-ID: <20251023152036.561109-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|GV2PR03MB9521:EE_
x-ms-office365-filtering-correlation-id: 4aaedbbf-c4b5-4d46-7613-08de1247b80f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/TLic6CimKtB/2Z9wZcRzoUS+qXqDUgs2ZPqZC8K+36arjzX6yVW0jN2Hi?=
 =?iso-8859-1?Q?m2lWumMJVrL82NdSbWT49QG0m6xk35jUpNdAyvlZpYZeRkw8U/cG7tBtCB?=
 =?iso-8859-1?Q?KLROQ1bJUVyBTWMQclY/TWBWCAHAgTm03WBWrZUe4Y0ww40GMQzyCDMN3C?=
 =?iso-8859-1?Q?bLTRp5Qt3iqPR2q2mIbC/gqLJs6fD/9DfPBbj3vKp9aXYXtA73IXI+9nrO?=
 =?iso-8859-1?Q?zWvUWV404UfGTnaq0S46stiFIm9ZdB0v+QR2GDGiSXs7Kc+ev7BEGS4v/T?=
 =?iso-8859-1?Q?XsOD5bFlETyAWkHLWjFvggcuj7oME5ALJS7JEEuUaYy4uElx5k9B4LqlTV?=
 =?iso-8859-1?Q?iLAjG6UaA6iI2006aGuYUkmeIfoYHmVGdoEVlaQj6usE65yckOYJv6Hqte?=
 =?iso-8859-1?Q?ZaybhGKSxWKFOA2Z3TjHiNDtgZJZO2Sdc1nts2x71Gkihu85hYGlFViAFZ?=
 =?iso-8859-1?Q?k85xMDuHU/JO1QrhpFbW4QK6rssqfwuVk3A9V66Lf06CtiCl7ULUV4UTOO?=
 =?iso-8859-1?Q?+rijefI6v5wPFKw92//bR1HZcbvaRxXBCQ9U4ECVUjmG8GQgMoo4XjZ74D?=
 =?iso-8859-1?Q?gijk2oSNPA5tO8gCYlrREJHO+P0Z7TFOi31JDoaVTxL495pLumtHsbwbmk?=
 =?iso-8859-1?Q?ANwyDkzUW++DPxm+GdKNun1GmegJF3pp+EHyzs+78wuEPe28qpyQhCiEb8?=
 =?iso-8859-1?Q?yIVBd1yurFFDZxJYdszMU+0vxQ3mCMuKYPqjG2wLybIa2kU3VGUQSAMiyb?=
 =?iso-8859-1?Q?Vmjx2vKwF7DRfzL2lDNHU3b7ai7l91q58e4JQ0YobpUPwf2cFuQZ7ngHdm?=
 =?iso-8859-1?Q?EpHVUPXVmqgGNiducASQTQO8BkbBhh4ANLeuu3JIDMhQjq0rMnlhk65pIr?=
 =?iso-8859-1?Q?WDxf54AbyJXV198qPFXABXlcwaEduh5pxcK3COf0nzCI3rsl/FUs9h76Lv?=
 =?iso-8859-1?Q?Q4F16eBf1XjH2istRk5OfF1mFMVV0Y8LXVPlj5APxNy0QCI9r08E14ztB8?=
 =?iso-8859-1?Q?glChNh/nFeQXZBu5iV77Qijsve0ZzeL6NbGBMCDc+Hd07gAwGZWZYdECXZ?=
 =?iso-8859-1?Q?tR546+Eq86TU66Ai5VUwG7xexgC912ysQFvFvWT7orHdmFhJSJrrWfZNsJ?=
 =?iso-8859-1?Q?eEu15W+OrrbfXoEmqCSGK4Qb10roxCu4x9NcMHjHpRg2aXTNT3XcHUd+8c?=
 =?iso-8859-1?Q?lGGRHpaPlGCiNB/WSVAbMnrOlu0i5hprhmSP1rCKcaymI9z/CT7yTLyY1T?=
 =?iso-8859-1?Q?O136pSFPwBTja201HLYFztHUIGRMqBHwAM6ljBkM+jQzCk12Vwn/WlnsQC?=
 =?iso-8859-1?Q?2O4PFpaA14DiPEkySQk/P4TP3gQE40sTRG4VGkMwo7MbPTB6sX55vX7seM?=
 =?iso-8859-1?Q?+iDzaMWXEI1UVBMZbrv27fGwiwnlm8zGHBCDC0UiSu9iTGYzbMjirQ8FrY?=
 =?iso-8859-1?Q?4gtX7AY5uKPC2qaQU+b/kzDZceOy6a8WW7ZTfE9bi8e16zXx5BtZxutsHQ?=
 =?iso-8859-1?Q?cdiTluyzHLyY5RKmSx++odXhhsyz6IEGCYTK/L3eE38Y8s/ziLlV4bFUDr?=
 =?iso-8859-1?Q?lRX/Q6rxQ+yv5ZWMWvCvATxDQ8wC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iIcn+ZPHjX2xci34cq1JjOJp3VGl/5lMlrq3F4GXue+iV0GxEPHEa6n9Fv?=
 =?iso-8859-1?Q?TPUk1U+bdrMc8oPmIMK7eYhquApE0Cd76Y/AIH4FZSk31Z0pS2/JfV5VL5?=
 =?iso-8859-1?Q?xfz3U4L3G1r1oP9JDxiVVx6xaB044gh506KNju9zmncUb0Uj0K2qrsge4v?=
 =?iso-8859-1?Q?mk9gkp7GWbI88JGgUqGdsMRKAyWRwrVabZqjunbfv4e8lUHik4qXp1Sq9J?=
 =?iso-8859-1?Q?89fKB1/NMbw5RkwaS+n5r/WuUZuR37Lwm+9tp9/GqaF4PBPKnJAhiCSn8J?=
 =?iso-8859-1?Q?tglE+pqxP3ZYSjlv2IyleAAQG9OqTavlQcVkyorzuT/zkljydywOnhyCTH?=
 =?iso-8859-1?Q?5Ut+yc/Q35omEaBrIE5msptciu+ZR7K+D0ZnEKqyFvdzmSAqHED4ziCW1E?=
 =?iso-8859-1?Q?Qgqm3WDdl6DbdKBF5jJfZVnvC+Mphu9f0JziwEBoeO2zvUFRmkxnAB36UK?=
 =?iso-8859-1?Q?IksPTajeBw1C7ls+cF7yjaL4rddSdGXGfkzG+2Bjuqlj1Mpkv0nCVOPHAq?=
 =?iso-8859-1?Q?9bWeXjl54S1t2Q6nQjo73580Mr/9XdMSnD8AcRtDbkQOItUdpgTJpYEm5A?=
 =?iso-8859-1?Q?PU57Vh6i3JpsgK/R+o1fahGgquGzpyN2bNFUSRsRUqwiPtIhqeXAU6KR5V?=
 =?iso-8859-1?Q?qIHKYFEU4jflWtyNZvn48s/JOZ+rXaEVa9YC1ayvoXXxqlx7ntTdEEeYQP?=
 =?iso-8859-1?Q?QNTKGybqaKdiO5eH8H/lxooCRDniTW6i7QVvzi1WVSuezOccel7g++phOP?=
 =?iso-8859-1?Q?08N3LRr0cD05l4jISUn5HLDFFxaFu4Kts1UxhmqUiG9DYCh63F6mIe26rV?=
 =?iso-8859-1?Q?wGvGORcRFj0HY0MW6eZ4bo32zA6SUjwoG5qKYjB+QGb0WvzrtKDpL7BZUl?=
 =?iso-8859-1?Q?hq0YNRzlILIgdQZ51CoxdVcuEW9myPwACBC55bhY71FNOgNPyc9QWLSX0H?=
 =?iso-8859-1?Q?acZxWiugZkEhno1uYn2LLBwWuxyJCuvGF/80qlGyZQdBbe3cjn9Y/sKpoL?=
 =?iso-8859-1?Q?APGOGKoey4yAIqHI81TXdyR41r24cbFMhI+k7bcvRLztDPtZrYyo8J+Dkj?=
 =?iso-8859-1?Q?3ZevmXcZSPmke16rJggG5AicVCa4TDrc3z1q0e1wJvXVEnGxurf4c4jgyU?=
 =?iso-8859-1?Q?kYOTUf25KuWJTMbmUl0iHWw/iq8Fj7GveDuymNywsGd4kYmiNeN+Fc6Ll+?=
 =?iso-8859-1?Q?tbgmyipy3gTNESu4QFZhT/enLU6hEZSZE+lVnnZ/NnMLHZRErLFVpy4X22?=
 =?iso-8859-1?Q?1cuHOcGJOl8Qa1rjTkwKcQgphdXcZ0EADIL3ncntMsd1KOt92tSmm411B4?=
 =?iso-8859-1?Q?l/iRIqeNiR9hgsAk0goXI8SKFJ0NOAZFp6dJ3xVdFD3UfgbU4C6ARAzHOb?=
 =?iso-8859-1?Q?S9dJfsf/1zg8J29nm5yL2vmbuT5eu9hq6hKcb0dC/iht4ZRbkPXNTJpcA7?=
 =?iso-8859-1?Q?sWbeB1k43qeMVvRpXAWkxKx+P2wBUUPxQ8qx6lpPZnL9U19OXCa6y8zf6M?=
 =?iso-8859-1?Q?Ly9qZ6BUNq5N+JumQFd7ULyM9GGDzXu15Xz8qY2SR451LLmVTsA25dYVhn?=
 =?iso-8859-1?Q?JWuEhoFXIByBookCiYQs5zUjhGpIOe4334JuemcdVITKUS7Lvipy/PD5x9?=
 =?iso-8859-1?Q?Vkh1qSa2RW501mPiR4QV+nl627v5OnG1+EZ+gs7PPUIR0WL/sj925HuQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aaedbbf-c4b5-4d46-7613-08de1247b80f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:20:37.3112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAES3hbRSCJ2U3wDeYTUEMRUHPtaYwby1RIm9KHPMeJ+8Qtbyr2L8MS80yR5QtTggmaWyC0/BrYR6hyYCQq2sUTev52WN5g+wgLixrsNjmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9521

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 - vlapic_apicv_write()
 - vlapic_set_ppr()
are used by Intel VMX code only, so move them under CONFIG_INTEL_VMX ifdef.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/vlapic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 98a54efc7bdc..4121285daef8 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -215,6 +215,7 @@ static uint32_t vlapic_get_ppr(const struct vlapic *vla=
pic)
     return ppr;
 }
=20
+#ifdef CONFIG_INTEL_VMX
 uint32_t vlapic_set_ppr(struct vlapic *vlapic)
 {
    uint32_t ppr =3D vlapic_get_ppr(vlapic);
@@ -222,6 +223,7 @@ uint32_t vlapic_set_ppr(struct vlapic *vlapic)
    vlapic_set_reg(vlapic, APIC_PROCPRI, ppr);
    return ppr;
 }
+#endif
=20
 static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_=
t mda)
 {
@@ -984,6 +986,7 @@ static int cf_check vlapic_mmio_write(
     return X86EMUL_OKAY;
 }
=20
+#ifdef CONFIG_INTEL_VMX
 int vlapic_apicv_write(struct vcpu *v, unsigned int offset)
 {
     struct vlapic *vlapic =3D vcpu_vlapic(v);
@@ -1002,6 +1005,7 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int o=
ffset)
=20
     return X86EMUL_OKAY;
 }
+#endif
=20
 int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
 {
--=20
2.34.1

