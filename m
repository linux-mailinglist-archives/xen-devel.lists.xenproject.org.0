Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AFB2F673
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 13:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088534.1446280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3On-00013m-3N; Thu, 21 Aug 2025 11:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088534.1446280; Thu, 21 Aug 2025 11:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3Om-00011E-W9; Thu, 21 Aug 2025 11:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1088534;
 Thu, 21 Aug 2025 11:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up3Ol-000118-Lx
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 11:24:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54709c13-7e81-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 13:23:58 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7876.eurprd03.prod.outlook.com
 (2603:10a6:20b:423::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 11:23:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 11:23:55 +0000
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
X-Inumbo-ID: 54709c13-7e81-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mV6YcNDAiM8x1HK0jD071fwU1I1BKuJYKo5H53Hh9IMIdQ+9OCvdxBEMs4GSIAdrMn5oWaH8buqCZZzjes4gOh4HS4GMJ2YE9fWVOu3Q7bKTteCvGrUqdZQLjLpsDDRuzilKjUdXed6Q5POKStrsqoz9TqpL3ikZefO1VDRhKeG59maAOq+QaRR5P7goxin9UmjGjR7MWd/zTKXXsxTkVxyjJsA6PtG8FOGUfEHGkNKZnUCxDGkk+HyKCDZIJ3U7JPoyMQurqJiR7ld77IdhRNbA76eAui9Y/9j/4UWA//C+V/vW4cLt/MceorvxR+9Iqc5f46c1ZSFMdiK400XxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSok/gl8zoudCbmSQAT0+WE1rsc3HoymuSDCT6W4FTE=;
 b=vQBDM7n01oFFGBiXGH160oHPIPRvDB0cVl6csZiANnwlLa8JvyvllL9tIJEaBQmmVnPSg33aWP3GCwNq6rQiJorRlJXHZQXit7ulwcwdHA1UW9rAJcP3KuzXxddrkRlOY1sOfFBe45aFBPcfVwSrtXvbqzPfBYYgzm7Hm8C/NE+lwrRtESqXk2gpZWGws6jgueoHpTFGhu0QfR3w3B0G/xeTgA/LdJAntNZ1HDK0Y4cks26j7RPgQfi6gJ46ZT7MywYgLikyti7+nEe0t8pbdSMLjeNQ49oayGmeBkIzm0pvFJIEL2eQlN1zJJfCiNP1kam9zK/35uShaV21N9Ymig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSok/gl8zoudCbmSQAT0+WE1rsc3HoymuSDCT6W4FTE=;
 b=jXqZEjJHinxPq2Z/ZPq89PtgPybMjHIdgf1BYyKntgxm1DJqDQzF+8FxjUHELtEgKee0wpwLWUTnkShKAB59X7ljQpzFNgb83X6WUxlffDHPDsU+o8fvYW6bLq3tUeUw6IQZdi7HEf/fGqPYJ0boYkDIBAT12/B9CV9/Lcpvp5sxwYBRp2i+XfLASap2OHAfWLlTxfmZ8k6BS2c8+j1GDNeQXZRBLxeoOwoTkIy/sh07jAWXp41DD5ZeLn3CCu55XjMT+FxiA4ZKkx3Wk4QGZEk9GEtl4JPaQr0HD34V0sg1RCrNLR3B0xqTPlAJjbkMXyXatsVfNzluPpOMdORGcg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Topic: [PATCH v2] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Index: AQHcEo4Ufb3CXIWr1ky3KSQI/1VSSA==
Date: Thu, 21 Aug 2025 11:23:55 +0000
Message-ID:
 <5ecb3da69ba1581971197388c6b9062b46900cff.1755775255.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7876:EE_
x-ms-office365-filtering-correlation-id: d213ad90-1b16-49f7-448f-08dde0a536e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1bD6qaZDLsbTeWCD/r36+418vPtziwbk2RWjR17H/vgvx+wC+ZTVibojF0?=
 =?iso-8859-1?Q?fECSpflwkKw1TPsR1oBUTYLZ1OQxZDiuNQm8Zf+yTqPphLCgJcDNIEatmP?=
 =?iso-8859-1?Q?AlhTmdvkjIbk5Em6oBcuuiida0q6G05lKSolAQSGrOKf3wa8bRes7nUAsq?=
 =?iso-8859-1?Q?5MHVBXB5fJQaEqPQfw4eNq0NOQ/KDVPawQcbW9M6c26UCWncqeTouXrIed?=
 =?iso-8859-1?Q?7L2EW5piSR4UBADN49dhPnPQCmnH2uyRf+K7wGtuxzS7vSPaJcwl6pAhtq?=
 =?iso-8859-1?Q?mmynYJKPTFhueVrYhFdB+8MWQwz8znpYPePuzHkB4iTbsvjw66eIWLC12y?=
 =?iso-8859-1?Q?iJaxriAMQHRK8Nq1dgqNJix3i/lG4WOrpmjm1wiMkiDtXUEBdMDeleyNL3?=
 =?iso-8859-1?Q?NN+yR21SvYFH2CWYfJowj7HB0jGmyCKcXgn9XU27AaQNMbKT7kgg6Zm8Ow?=
 =?iso-8859-1?Q?Y2JLdCP9KQfQp3O0jPqteN3E75Y3nQCv+CRBI44uhtfZMPhUfG3biOBWiQ?=
 =?iso-8859-1?Q?O8rpld5SaftxXLPqSLYSYs4hHZamVAL0l5HiBOTTaZzu3PRTsfq6W4fHPR?=
 =?iso-8859-1?Q?KiVdOJdYpNv99HuZU5NqGaYBl60Vajhx9u65g7rlNZTuffohzyUrVHxemY?=
 =?iso-8859-1?Q?AsPaKWRtgTPCa8xo+sdGCImSOW0v5aUcHiUk6FpVcgO6B09r30f10BIeVZ?=
 =?iso-8859-1?Q?p12CSSvU8q5yqqq2bZV/XZ7sJp8buK5D7ae7L2jpu4xEi5YcrOjotuUyM7?=
 =?iso-8859-1?Q?qp/mkIOuIK8Clgr1s2bwrBWFIgRwZQpQ+yK03NfNvRjW/XV7xCEcRK+ogz?=
 =?iso-8859-1?Q?L/dPN1X3SUmBX0jJwBAS/EOPmfUtSO5AEMEJV4iPpMiwzEsIpAOiIZyFaX?=
 =?iso-8859-1?Q?2kn55Q7ISYv11G4Y6e+EcUhGcCbgPkqXw4afYiW9ajrkb0axSSBQkNaBt3?=
 =?iso-8859-1?Q?mpgQO9A1Z4iDqE7on/4kOoO10Rohgu1hS9rhkPIQyY/Tz5K6BEme4XQBl0?=
 =?iso-8859-1?Q?2sqPmEOyjxSDV2RT15HYDE4SZH9ShKelCMyO/NhXcy7/NEGT2iklcCLfPD?=
 =?iso-8859-1?Q?uJwXOeuoh6zKCkQcol/1PGqJjHAEwaJwpXqHld63ODOMS2CuaQaKXVmCHl?=
 =?iso-8859-1?Q?fqnEQ1KgNDi1GR6N//O6vWT8Cb9d31Ztc/7ZGXdg61g+Mj4X3AP84dcXqr?=
 =?iso-8859-1?Q?68FPKbf4UzmGLqaYRLpEc+S+xRnSJJ2vMQ1DR4SlVLrknirHX3rm7wTNeh?=
 =?iso-8859-1?Q?ecIhtP7S/a3Z9OPZiU8E4mzDVYrJfPdVgTfSIjlLo5f6hnWl0b6pSOCRxx?=
 =?iso-8859-1?Q?G+6tJ/NPxdYF63hkf0mEgdxW986s/0H6RhuAChRZat3P62faQPq5EapXHA?=
 =?iso-8859-1?Q?NZ87iVibHclcuhtyBY6ok62AHf+xITxxO4dDMKaHrpCSVy1Ugk2hmxpKFe?=
 =?iso-8859-1?Q?8TXxW5p4LkeuTADZsSXmYj0MulnJmmOX5/WAmBrg9HKhw7NciTE2uTsElR?=
 =?iso-8859-1?Q?Kt/oD95iKFc8k1KjVHFTWTqfFcGFAc6jvdwxyIb0SvTQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Fq/DPtNeYIv+vT+Vhj9UUOUGACkIv5rfH2CIZvvjS2B8U2VezQRZ8CtdqN?=
 =?iso-8859-1?Q?Y0My3nBbj0YGlmFh6JBobhzgMjESU+tJLmoC45hR9/Dj5CssfmaezwQXLU?=
 =?iso-8859-1?Q?pECNIZJ/r7f3ie2TS+s4XXnswxTSW4OEnvzoPu+m+IzD0Lr7Frbwcgfs3m?=
 =?iso-8859-1?Q?370WyShfzF6Yvr0c5c/hLxHFyyzsbwOfIeuE80m/GTZMZTgBwy38oeeeED?=
 =?iso-8859-1?Q?4WDGcmalt4gUQx+sIOmSQe3j8Wg7AtUuo4oWPyGXmXkE8KFLQhfa3oWFV5?=
 =?iso-8859-1?Q?kU0B0AjpxD/sisR6HYor7jVxEI40663qLHvyUJTP+ZYmrXbI3TBfrzJhBK?=
 =?iso-8859-1?Q?n7w5yXMSIZb6c7hZpuL0140j7Xuc0DbRgdhrOKVsGEZZ0H1Et1260yKCfj?=
 =?iso-8859-1?Q?jfQFuyXQYB3IflQRfQo6U9RuoxbxLyE84NC21UWXIdhU6w73QleqIm4C3W?=
 =?iso-8859-1?Q?cILG4la2ILbKUlJB7dkcV3DNkmCWX19Cz9HIXgpOWxSmCRC1chQBpSjq62?=
 =?iso-8859-1?Q?OtmfRHkhAw7QEBccJCmQhRFW3LMaBoq/qMcd1GvAygF+XOC3rtVzl1FOTI?=
 =?iso-8859-1?Q?MeP0mWfYsyTeKKZORpL0/xADBVAjJEhcF8gw+gIzH0dbQ6YAqBHRfC6Nxa?=
 =?iso-8859-1?Q?38E5Nlf+GqwYKm1eYOeuN75RCCbyHdy7glhc+1EHcnWZXhzOXfls720cf1?=
 =?iso-8859-1?Q?zaK4XYmwtzVB9OBHtvl7VC5XsTetB8etXQpn6tmzS5UpuYjuwlRVo97oVx?=
 =?iso-8859-1?Q?mM0Ha4iE6V7riuyg7eDkfuWuVHiuCN5/LsEcQCZg8D/9QeYjkjeFHZTA1L?=
 =?iso-8859-1?Q?AfoNhDtQBx80yz6NiEQv9W7hg6YLyzJjfQoSNq36XXFZm3h+/qIK/6N0KU?=
 =?iso-8859-1?Q?2PO3eB4T2DHXfVqTdw7ispEu5eabM6m3x6wk86k4E6L9je+NGgA4oIbury?=
 =?iso-8859-1?Q?rOvsRUAz+xwSYYMuh06zG1P6iOTMDya/vlfbLPX3DtagHIYz//dFZuQKXU?=
 =?iso-8859-1?Q?s0z3QLWsIKCnx6rgrJVf3Cs9OnWEvCkKkT1fUIbLBHj7VzhW5+yFlxUAhO?=
 =?iso-8859-1?Q?4tr/hu+v25Isetyb60B2rj2OBhHDlLOHWiYAysQXsg8i/uRYboGxs9H4oc?=
 =?iso-8859-1?Q?97v7CS18mtQgZ6rQ8knLlbu4pxclW57ALzUC8orVzhBmJE0ftZJqrcFYQi?=
 =?iso-8859-1?Q?FJOU76vvMyY0hoE97TJbHzl5wp9ZuR6bs+MBcs7BqQxVlTGTB+dz7ydM9X?=
 =?iso-8859-1?Q?Vx351c0FJu51q1fH/u3n5FJcR6YRNTfXkRjTDvbtYTfOGE676KBhFsBVlL?=
 =?iso-8859-1?Q?G4G2ADtuSVZgMRdsj72s0ZyKLYFAVAk5HPa3jOKMs7cABlbfu1Sretb1TR?=
 =?iso-8859-1?Q?CXLlPfGptxy61tTB0GAGX6AVjZgwlaBkSFO79Ug5GHiNPBTZI5tO0m6Ufe?=
 =?iso-8859-1?Q?Q3iNaMk72Xz+XkARdlo7NAwp/S2dft5Yit5Khi/5H6x3TpKo0xbZ+5HjJp?=
 =?iso-8859-1?Q?ziOK/KzmER882AjUd1PPuKj6WEPufynWOH/G6e60/UsLCKJ2rU4xUTF8P6?=
 =?iso-8859-1?Q?hEUWD9dXYIs94sanWe5OD6pT9tRKIALuqMSh1OM3UnYnTV5CQ0cAeNLNsG?=
 =?iso-8859-1?Q?u/55JQlOdc4cSon0av1Y4kAfAlUu6nJpyGol5Qnu9LKPKR3MajMqamDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d213ad90-1b16-49f7-448f-08dde0a536e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 11:23:55.0535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfzGoONtycadtMH2DYjjLaVREJLj2buMszKz1yzF7b/XZWWi0ZBdam/J+gxbxjbJGQBMmIeQH9sx34MKjsMtOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7876

With PCI disabled the build fails due to undefined struct
pci_host_bridge.

Add ifdef guard to pci-host-rcar4.h to not require the stuct being
defined when PCI support is disabled. All call sites are already covered
by HAS_PCI check, so no dummy implementations are needed.

Also move includes under the header guard to not break MISRA rules.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-=
rcar4.h
index 8ac6626a22..31ef9d2d40 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.h
+++ b/xen/arch/arm/pci/pci-host-rcar4.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#include <asm/pci.h>
-
 #ifndef __PCI_HOST_RCAR4_H__
 #define __PCI_HOST_RCAR4_H__
=20
+#include <asm/pci.h>
+
+#ifdef CONFIG_HAS_PCI
 void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
                              unsigned int reg_id, uint32_t osid, uint32_t =
bdf);
 void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
@@ -14,5 +15,6 @@ int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bri=
dge);
 void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
                               unsigned int reg_id);
 int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
+#endif
=20
 #endif /* __PCI_HOST_RCAR4_H__ */
--=20
2.34.1

