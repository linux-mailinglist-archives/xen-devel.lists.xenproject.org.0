Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2046B10E32
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056240.1424484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRh-0005ir-FO; Thu, 24 Jul 2025 15:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056240.1424484; Thu, 24 Jul 2025 15:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRh-0005Wd-2D; Thu, 24 Jul 2025 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1056240;
 Thu, 24 Jul 2025 14:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO3-0003AJ-5M
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:35 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87317132-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:33 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:28 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:28 +0000
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
X-Inumbo-ID: 87317132-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5f9cIKfpu+CcT3c/2AMaumnoUrZ0zuKMVjf6e5YleHeBpA82fJh6qPnDZR95VAdyIyqis74N8STBA2dj4lycTsi5WT9ujiC2x+vMSrbDlyXULRjChJJoPHq4IWCGCJU4Uv7qVY0rkVWaoXqEHivjDB7FAJZ1p4ReMJ/QgFzBaqtiPQBvVegBuHLKJQxepZykf9rhsyLwOwfyiUOTclA3kacv8dKp9w+4QIlvpiggyIB/WIW9VbKpan2vsYFD8GEyRC34B3oimF5H1N/n+pQpCtzvfEqtYB/CZlE6zzs6ndhIAXIvrorwgIBalFuiKZ3MPI10+O1sij6b4jSLV8hEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7X1rFUyABxzxvCzwxaToxFb4cxUmPwHKM4r17sKxdY=;
 b=ub1dGf3xmGlKl6X95MgkjmLNGC1eAHyp77WYsyXKxF7X02lwm29V+Libg+/78Eprm2kk0cZLER0YOyOIynA683s1vN9tOih57Hg6IOYxCtxpCZrcSmhC+CaHv5WDhDDEfWUrskltYtGLnwMv5VDs1CWiemXstvS/1E/bFJ+1ZbZGpQD6Q6py6IlnEu8D6WSdWToi0dDpFWNNOadb4vsZd4U9yB2Ql0tyzIK/VALr29qNVV4Vaepl0cOd9Y94WzaCqTUk3ntqW0jtrovl75GOEy8OFWTjF4YHJap95rcgBPMYUuo3fLQeHl9/LEVjVYOSYHhmnzVbQQR/NTwg1t9EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7X1rFUyABxzxvCzwxaToxFb4cxUmPwHKM4r17sKxdY=;
 b=Stw4kn1A7+lilZG1jYzwSWOnuEPXELLw+ANpRv0Z9Lku72ZyrACoYHCBvzXF6Az62qZWRpKUs3iB/QvKq9Rj4n0Y/7i4xeSTw1vpMpLHCGi4bOIpKFU5gSvUBpt05AN0+dCJ0V73a6AeOxdCIdIg7uDjJbbrxj/VeqEsZ8AVS8Z2nAff6PHxxXBFv29SLPfFngqFG31Ksl39KEBQuAQqeZW8Tb5IlYfDfLVNFiu74RgJbzoPZxlH1Y3qCaxu4RFBsxgwTbKzc7RAxKTAevlBPUBXPjsbeGZoxyhKiVFMs2L8gVL5bjTMcX//LsJRGbhvm9nY8OUHXj1gnh21EqoiyA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling to
 support eSPIs
Thread-Topic: [PATCH 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling to
 support eSPIs
Thread-Index: AQHb/KtF7la3uAsx1EynxKn4X/Bglw==
Date: Thu, 24 Jul 2025 14:57:28 +0000
Message-ID:
 <0b59c5fb77d26098dc928d847dff660f15a9f8ff.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: 2eb64aac-3d4f-45ec-b145-08ddcac268b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?koITGm0L6XH+oTU8LO/CtGIMXeIOf7r02pt4bbZNush4c9R6wL2WfmHnBf?=
 =?iso-8859-1?Q?CoT/glv5FsGKfTBA1DvveOv6gNgowqRya0m9KtZ0TbNqDFl8rwqiDkFWLk?=
 =?iso-8859-1?Q?ug3nrQG1BpaDduFzvd+XLb8uxmvBfGv9rliyDlf6VTY9LHInIT9kmk6uln?=
 =?iso-8859-1?Q?77/xJRiigdlE9rVhHcsIXjFnmA0AZ+6AkYS8mntuK4rfyMnYOQzdvNpvW5?=
 =?iso-8859-1?Q?GSasOLsTuAbYhIRw58zXnqpNzNPCnrWPnW1RWuTnyTmqFlMh94vPScp4Qe?=
 =?iso-8859-1?Q?1JF9s5+uXZgO+Yvd/EuJ8i1pJ1ZEVzPR/8YHvKv8CHSsVVgun4jYEs+9gh?=
 =?iso-8859-1?Q?URvvCDrOuYU1dunyQAnooWXNjqrT7sTzwaJJIkf8UjmHRuLLGC/PKjiFcG?=
 =?iso-8859-1?Q?YEeLLINjBQG8B25ukOTwb4auUCCeqoReil9bEO27mp5AKzh0FzjmKAdkyW?=
 =?iso-8859-1?Q?ZDrx30wKYbfqSDnB+V8FY7b//BHWDYGsY+h3qxlrOPj2h7kk+m32WlmLsE?=
 =?iso-8859-1?Q?zNOP0Crd9QG/1Er8NFIBftaqIH1RDOKQK0t9uh0wbCAogIgK8HVhf9UKP0?=
 =?iso-8859-1?Q?jHvyyFJOJOnSIDvd6j7SV/xLjbn0vsYtUxXDPz6TIGeyW6dBFEkNy/Vwjp?=
 =?iso-8859-1?Q?rYOUtiPBZxpl4JM+qpaHrGW3xJl+3H5B15Ccl5vQBBRSyAe89YDT+io9XI?=
 =?iso-8859-1?Q?hd6PzCr8JjwXLu459yPrl4QYYpzMgATVzbr1OUrqrxdEUWIchi38PZ/YlJ?=
 =?iso-8859-1?Q?yO2Et+eNmlKuBQRaKPv4N2gA+IKRxkx6aD85bzkgmIVKbyZAsxpEb1TdNX?=
 =?iso-8859-1?Q?nLQtwhiUi4fW3UtfAX8iwreQxM/aFJBKznykkbz+OfCHCIj+cbxmluI8tX?=
 =?iso-8859-1?Q?hDGcbrMNiIEE6tj/Cyi4W+fPj7fhTUv1XuA9S1WIitp/xPsVmLqTDYcAxW?=
 =?iso-8859-1?Q?dcOONoMYB2iLLlE6cgHljot2iaPyU5Q1yI/SFtLzdd+oXokzQzxZpiqWV4?=
 =?iso-8859-1?Q?SjAhAdH+Tb3A8NL90M/p4xKnqalcq9L287T0EG2RQheLvZD3+IZdlu1z61?=
 =?iso-8859-1?Q?ZdnTVS7a70qmr5gfo6s1zhDBdzdSAeGCCh2BBLrbPJ+DCHNuwtifKkgGLz?=
 =?iso-8859-1?Q?bY/SiAqOMffERECRKptshDdvcNdNq8EuB97ydLWJwXc+XU8h1P65CVcT3w?=
 =?iso-8859-1?Q?+Whn8GA1VfEly/KjEausIaabvX2yzyNwESISWk9oloH8TkfoWvyN12GkZ6?=
 =?iso-8859-1?Q?356mCS/LmjsXxmiqVUualEhkR5avNNy6mWQ9cqFTjZt1ZGvoJ90kS0gj1p?=
 =?iso-8859-1?Q?3TyuwLwVNCHMBP1UfjjjcgJ2M7U6Sen1JeGqudf7W+SVL8trzFB/xRipCK?=
 =?iso-8859-1?Q?yuffCPgzmamxQqMO1ea0eWbv/hEQgHC3a76OAnudh40rjd38+D4yMjyFEJ?=
 =?iso-8859-1?Q?Lw0P59ztEqV6G6OeVR4uM40sXRl/LkrN3oPVvgkW/fx5gKF7ybpPYy5RCW?=
 =?iso-8859-1?Q?QCzpcEFbhwcpKPkCH5oPfDxO2KyHIaLDsI0m09UX6Gfw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xt2Joj3yS26kVVckUwtUa800/svWIZZqDAeRWXDdj8u8+h179extFsVALU?=
 =?iso-8859-1?Q?oTh/w7ndl/0MrqbARi1ec10BbplQjztFzInb30AAyXpO80VohzGspkztaq?=
 =?iso-8859-1?Q?Q+1WRgl/f7gPDX5iFLRegNQMK8+DzyYjRs53dp//oK+i8WO6WF38ejkJ8i?=
 =?iso-8859-1?Q?zEAAbwXzuD95HJtE1ZfQPrGiO74wVGj/XSqmBil3uFBZGJMZYeTCEObTrm?=
 =?iso-8859-1?Q?wbZXUhuNAbjwBniTGlsoJFZ8IdZMezB+Le7aU5X+kxh3G8bP7Kd4ZI29ar?=
 =?iso-8859-1?Q?uogpR7g62KVQ77Z5vB45/9SdKfFWSbnJmScAA4PPHL9YYiyJoBdnU7MHG6?=
 =?iso-8859-1?Q?b1BrQ9cBa7p6f3Vyar6mmafm2SA0ry84dg/44FNf19qxMFYeWgKkxkUYIF?=
 =?iso-8859-1?Q?wM0MVmAFf8gF9zO1LRc+OWQcNAEPYA7o1VZHqwtjcX9wGeQC/aig61hcp2?=
 =?iso-8859-1?Q?CSIaEuwxriKJ/lLkD8WaJMOB49csHSHaaetYiGWxJkdm5tReos2u746Dcc?=
 =?iso-8859-1?Q?WYZs/Ff5Z1I9pg/8O5DBuqOmeELzYf076FwAypsIWx9GpmFf2WKOKe3RuO?=
 =?iso-8859-1?Q?ZhHgZh/cUBSq5OXGqtVPI/alonahj0IPUIs8UJOBJjnTa8nOCRSiVC5jK3?=
 =?iso-8859-1?Q?LPSRBZ1b93rAbRmnvujiHRCP9Un7Fw8E7vQk5JP6sL2m6Opjg5rMv1qFfc?=
 =?iso-8859-1?Q?LZVExPeoxBDEPw31GoCjX1e9kgT/nag28MJIwzqEqolQ37mRX2DAEE7Z5a?=
 =?iso-8859-1?Q?hJp2i+nEetS2toQEQjNfBx419fzsRa8aDaif6uk25feu0WcYgOIuQXsu31?=
 =?iso-8859-1?Q?v21sznbAzWqaZ+C7SrC1BJv7KVyuRMQ4pmRZdqzlB2XZQ95uQy8SNE5qcJ?=
 =?iso-8859-1?Q?kO2oiSHvINi8YhGTsl7MXq32zxwFCzvQRB3XeBfgeT/HerfUhzRGCv3KfR?=
 =?iso-8859-1?Q?OmuRCIXQSEbIhjg+IGiWsb64Xm1ZAn4Q9JgXEYFWfR9XWu4Fy6cAT+akyr?=
 =?iso-8859-1?Q?w3m/jLEvNk/5roYemowv487gHkhpK7+S0AoI8LhaQI6ST6xt1yDuU2hDVZ?=
 =?iso-8859-1?Q?99RemWqqMSeL8LbKw/Qz10QkHQCuWvjuTzdD5bzTS82Vq3MsU9O7qesjwZ?=
 =?iso-8859-1?Q?sti/DSXrsAjjA1btplCOfJ4pCj44ZSi8+BC8r5SMh+m5AYs7FpAINo9vs2?=
 =?iso-8859-1?Q?XxapMJTGENS7YLXxu9aWDii3Nq+kB+stfSeQn4Xw6u/8eP0pl/n9PCVx0D?=
 =?iso-8859-1?Q?wKcN5cV11WhAevkxdZPFGh3fhbAk7eS7GScglbryIU/Y7tfeLe+jY8fZ/l?=
 =?iso-8859-1?Q?0IQ3heRfJbvrP+DfUyNS23Nhu0WRAEosnetoi69LNUGgWv6qRgi3TKfUqr?=
 =?iso-8859-1?Q?xCpFUGhZRabKsXBG4tpir2Ev8WfpPg87rkTv6mt9xKvqjmKZakxaViiymv?=
 =?iso-8859-1?Q?EEvlxJWQ5Miwf7CgTh8tE03DW5870hJ4VQZXGcplCmbj9kuCu9QxhQEUK0?=
 =?iso-8859-1?Q?MwnTVOBUH/0cbW3KcUBqUOv1IYb8xdIF9xKoaCXAeXOBOVJ8Yl6NNz09zn?=
 =?iso-8859-1?Q?NFQ9tPhHJvMFITxLZPbgN7I+o+ZLlTbQNvSQ73gqfKUlBOKtlGFcA/DE4u?=
 =?iso-8859-1?Q?lf8+5NhoPiJNR0/7XEdOw3N/ahv0L9EjSMAFiBMJurac+Vzmie2VduFpRF?=
 =?iso-8859-1?Q?2Ug7O8TYJIucqM0Uor8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb64aac-3d4f-45ec-b145-08ddcac268b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:28.0836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ytl/4RkaQcTmJL7y5J3kL67ETD/Kz16L1sExog2zRHWW0NkQq2IBDqlY0q0BgYMGMUFK0IbznE/UF4xP12ZHAko7L6LY9IyyNZ6mUMDIwFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

The Dom0 configuration logic in create_dom0() has been updated
to account for extended SPIs when supported by the hardware and
enabled with CONFIG_GICV3_ESPI. These changes ensure the proper
calculation of the maximum number of SPIs and eSPIs available for Dom0.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
enabled, the maximum number of eSPI interrupts is calculated using
the ESPI_BASE_INTID offset (4096) and limited at 1024, with 32 IRQs
subtracted. To ensure compatibility with non-Dom0 domains, this
adjustment is applied by the toolstack during domain creation, while
for Dom0 it is handled directly during VGIC initialization. If eSPIs
are not supported, the calculation defaults to using the standard SPI
range, with a maximum value of 992 interrupt lines as it works now.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/domain_build.c     | 10 ++++++++++
 xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..fa5abf2dfb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2055,6 +2055,16 @@ void __init create_dom0(void)
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te config is set).
+     * If not, the common SPI range will be used. Otherwise overwrite the =
nr_spis with the
+     * maximum available INTID from eSPI range. In that case, the number o=
f regular SPIs will
+     * be adjusted to the maximum value during vGIC initialization.
+     */
+    if ( gic_number_espis() > 0 )
+        dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_ESPIS;
+#endif
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3731750046..65fc888142 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -363,6 +363,17 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Returns the maximum eSPI INTID subtracted by 32. For non-Dom0 domains, =
the
+ * toolstack applies the same adjustment to cover local IRQs. We will add =
back
+ * this value during VGIC initialization. This ensures consistent handling=
 for Dom0
+ * and other domains. For the regular SPI range interrupts in this case, t=
he maximum
+ * value of VGIC_DEF_NR_SPIS will be used.
+ */
+#define VGIC_DEF_NR_ESPIS (ESPI_BASE_INTID + min(gic_number_espis(), 1024U=
) - 32)
+#endif
+
 /*
  * Allocate a guest VIRQ
  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
--=20
2.34.1

