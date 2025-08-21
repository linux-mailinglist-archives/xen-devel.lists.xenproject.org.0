Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F5B2F4F4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088344.1446132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2Ka-0005x5-Tz; Thu, 21 Aug 2025 10:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088344.1446132; Thu, 21 Aug 2025 10:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2Ka-0005uL-QA; Thu, 21 Aug 2025 10:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1088344;
 Thu, 21 Aug 2025 10:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2KY-00059V-No
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:15:38 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7a05821-7e77-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:15:36 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB8021.eurprd03.prod.outlook.com
 (2603:10a6:10:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:15:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 10:15:32 +0000
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
X-Inumbo-ID: c7a05821-7e77-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owY2co8/6Yl2qLwoj0duo4lQdUvzwvG1cMrrUJrhPwlXwnuwGmu7LWECLRwNVBO3TG6fmoXZBwqzTx9imyTmCzq+JGz3fNiiYHsK1q1q9Ap0rWlH+tAydLttD33zCJRY2/aCVA9iF3FnQT8GwZtXGfmofAnIQZ1ZgOZ6R4GrkXpkXi5ToOLCXEx+0DGx3iPPg4Ka0uUCIeo0lxQ2DnTyQwmKBcN0fgvNKz2cKX+4N5C3oDCZK4kha2Yo9h7jDK7asTO8TF+mgOgNAlM2dMJIqOfehisxeZYYC9fi/bJYlSAAcs+bvzy41E7lt+R+//ZWycgMpZgEhfoSO7fwa1p1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqR+9bFxN+se2h8nqRUjohp74b+7gU/GgDDZKPZx/UY=;
 b=ilhWk+Zil7sThUgmlCHOWDU3s/mEJKTCZgN3dqiBZhzTGPcJvhRkKZC/4cgYWKQIblaxGjhPGOfbcQr46bUnzSncnPaOTBr/KSc9ZFJWIeL7Olyk+4/I/so729Cx/4lokhiVLAji+a2cj7kRwn4fqWSf4XgfVdvSzQfDiKJxLVgkgSndyE8DyYvlSMjcLckBJWnhnTyK8weT4hFY0Q45zmen/0pG4EIaSJ05IgALxUb9M8fQBiS7dAMLz6JoejQPSl1cQoG9Ijx8GJcLIMLGaM0TGV9sEzkowIu6qawoSndU3wE0GBuHdVyHzxysNtDTyRYuN9OpgkkXO4gPFvGVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqR+9bFxN+se2h8nqRUjohp74b+7gU/GgDDZKPZx/UY=;
 b=McA/buR7MNaOWldhsaqwJVm8GqahOaj7asOF3ZVlyHc4FJ+waLH9D5wKPUhPLOS7JJnH2QlRmcG3yh6QCt7qilOX3lQePva6/pI79L8cJbHFZ2i7C8Inn5vHbu0SIHjABfK2Vb0n3jkAThr1N/BGhPZ2p4JNJ9tIKY7eWSjiPrbiEGEuo7TpZtlaaWfz1s9+ooYhFs1nZTTGJ/s/XIdeMqVqmmITReQs4HFnOhibI517PbRYcof1c0P0dc08quIpeYPZx/lNi3tDdi+mzrhP0RHhJXQ5AJjFOcTcCTNw5SQ1PIEOrIA4RrR5EcPDJwgPNpabR9KiUgGm1flTIIC90g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Topic: [PATCH v3 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Index: AQHcEoSHUe5gc4yzc02M5y5xupQnTQ==
Date: Thu, 21 Aug 2025 10:15:32 +0000
Message-ID:
 <b4b99ff1a6009d3c9e70929ce638d19b27c86374.1755771103.git.mykyta_poturai@epam.com>
References: <cover.1755771103.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1755771103.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU2PR03MB8021:EE_
x-ms-office365-filtering-correlation-id: 632bb259-214a-4251-b17c-08dde09ba980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cyVISqJ3IZosMGhvf5W2vC8732zJYlNwexrGRLVdoQpmVg/OnB2jMumn/+?=
 =?iso-8859-1?Q?+nawYj5f8nmtZaeK3ZtPmcjaUo9U8zFPyzEBaIoew+KQzPUqSF0tqYPnPp?=
 =?iso-8859-1?Q?9EFN0Op0oQ71CQIypsKuUza4oTPNLv0UULHxBzgpoQzG5umSmAiHngi3Hq?=
 =?iso-8859-1?Q?CxDzGYSzMDHDL7/At8RDPCFaNARSfS+5dy4Kirsr2x9nCi0pnS3AsbrT6e?=
 =?iso-8859-1?Q?SKQW45wEdsmNDhFByBOkeIGLKSuLfjMRpdRRQE4anCXwaNiuBt+/1xi6Qa?=
 =?iso-8859-1?Q?HTGXVIZ2avjqAXBOUBUVEdxRmMLdFhvO3ct72zXjk4sdLZyq+ysZSwt/BH?=
 =?iso-8859-1?Q?Loeltf+YAjOSq4SHDMELJuax4Oqt5q1VmxCj3/hr2UCFdoGDL2to4+19+l?=
 =?iso-8859-1?Q?1YmsCCeoZ3CyCNilveNQW6s4N6tZM3ZPvNYTuoBqM46/cFJoTKWQkzCgvk?=
 =?iso-8859-1?Q?yWJ8n7g2TxVxmycYQIpk3F6HkrGE5APZHbarTyFuB8pZkvkmyDXsggcDxy?=
 =?iso-8859-1?Q?vpR5qSmdgYVBAKoj7x27BGfx4Ml59t2laLONteiYFBDzVYliXkNTAITCmG?=
 =?iso-8859-1?Q?5yptTguI3EY/Xq+ObaeNpxgjcWPzodaI9NtH9Zj+njheSqj8MiRM+WRY5w?=
 =?iso-8859-1?Q?2tiiDtXvlVW1+Qymwvg+Cw/7Nyh9+v17A2w6uxixs0oeOmF47sd8FHzYmM?=
 =?iso-8859-1?Q?13dF0vpRRAY8mOAqJ6hQan3UmXcPFM5d/pl67LLlh3KmfNbzXXgWPKK8yf?=
 =?iso-8859-1?Q?lCesBaaNndC9wcXU8ZSq1tfULOwlUhtN1llsRKYhKHnc2uNI04CCoC/1NA?=
 =?iso-8859-1?Q?ttgamHvmNnRranYcxOnp46Ws1gFiIAn/JTNh80EK4+W82ZaXrOtdXBJyJL?=
 =?iso-8859-1?Q?AOka9ALlz9fsQyGwqYbF2klUqBUnseLZbQyQZMSy1JoPjeV0KdV830Fk0T?=
 =?iso-8859-1?Q?AfKbmcsUrKYWnAZuH023Ga2EKfqYlHjikNjMEJ7VGTP5LZgjgezPfmEdHC?=
 =?iso-8859-1?Q?jNVDQo9rQqM8fixdp4vYCd6E6E10HUFCvI+o2khrJ90frH+WWe9QExHrmp?=
 =?iso-8859-1?Q?cP0ny/cv20PjwGnZvl5nGjnLyZFaxfZhrmUe0C2RQksQeLZg7GY8G27evQ?=
 =?iso-8859-1?Q?KDVuEynRpOqaMhpNNAsT6BO2lYt/DDuEtyuT14xwCooYfjmUvjhhntYfGF?=
 =?iso-8859-1?Q?ludozW1vFwcZCm6m98kBOUEgs+KgzZlTdS/Ya8S0Bv28/ag8g/loAYM1dA?=
 =?iso-8859-1?Q?uCxAV4XbW1aU06t5AzICgF3Qb6JDsbl9FClizZKCSMOTGyNwiB7bqOgpr1?=
 =?iso-8859-1?Q?hHG31J2MuQDfBosrd8Al9NaZX3+NMH3Hg8M0Cg76xsZEw8CqzqHkS1y4dV?=
 =?iso-8859-1?Q?mXduIavGdW7QN/jxVnrrb9PQbzWcIHKbnr4LZdFOAFb7c4WdKk6Q/L1dJb?=
 =?iso-8859-1?Q?PmKh24r1ZG2rc0pX9iAy+Qni65JnEZ/YLgZFqMgwd2yOzXtBqwENPBU7h6?=
 =?iso-8859-1?Q?wMuo5Wex8hJGJAd985K0QEeml5rmkaWBY8p9yukXM+R0gDIc1sByhpFmXb?=
 =?iso-8859-1?Q?4qPHa0U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GkOPoqOOCBs7J0fTBlmZZj5uxdCCvSgfkY/6gpuXDFKGWi8EtwlIstDePe?=
 =?iso-8859-1?Q?ynlT4DtTIMzVQNxrmJBSR7t756dIdRbGmqnNBZfWguB48g5OjZvsGeQw5F?=
 =?iso-8859-1?Q?YVyLA77Sekw46F6W3g/Sf4uQLY0F7T4z0T1mBgWSkOTb9Cl0cJ2k0E+dLO?=
 =?iso-8859-1?Q?Zx71GY8MH8ua/QxnTrzSm6VgfI62TZq9f5J0ksoflPgrBkqoh5YK/O0pQA?=
 =?iso-8859-1?Q?VJhWHyKHWm4WvyCbseYZWpa46Y7k8qggxkcmIdNVxwI0321AqBPxyQWAw9?=
 =?iso-8859-1?Q?WS7DQ7zqZ0tZpzDM8A+iupGLohsf8161nj+2GMyklR2ZL5A1K7ltRQqWVU?=
 =?iso-8859-1?Q?BlY3cvkgREV4y2+60Q1Ef7hUEZM5OuvRCwz9bloPy0IvYpjaEoKoilkbsu?=
 =?iso-8859-1?Q?HfwyrxNG+MIPXfNIoX57zAUsVxd+8ycLo0KOd8Xp6Emv6aFzYDgI3rfNjT?=
 =?iso-8859-1?Q?UmjA8HXKWadKlRb0T/Q2Zn1n2HdEr6+Cl9In0dPiMZXrJqQMBoiEdZ1d0S?=
 =?iso-8859-1?Q?RA3CCbU+AM4Z9+2I+EgblEDeBsGFVlttl1Zd+s3S3hLbXJdXUY485S18DY?=
 =?iso-8859-1?Q?qS0bgCVkn/fapTWKFkLM6vNX52d+emk93ZEmLjxD5ydKyZX5OQhy4yU1hG?=
 =?iso-8859-1?Q?srS2vRZE9bCQL3bk7XE0ZI1EHFdOO6SGSgzixoa2tnuL96EH3zwoJ/cVOh?=
 =?iso-8859-1?Q?zahpQLGR0UfgIidHwLHTWaKAW4pWwMVFmFN2LL1QDjn52iGeu1K9MCnpqB?=
 =?iso-8859-1?Q?8MgxXYbBeVZF+rMrhZckJkF7+XJHLXDbZEBlE3ie3UXbEnb/mwx/VzefNH?=
 =?iso-8859-1?Q?GAu229zEB8hohdY1w0gp8PWySbkQWXFYBH6cO87d+VakLR0HapCMuFKjs/?=
 =?iso-8859-1?Q?ZRGJUAj1haYX5pVfkDo5t1s7/0o/IwxeWWYXqEp5qOnOkSSEVg8t/1NIxJ?=
 =?iso-8859-1?Q?UxytPjNnmgEI2pAwNec8HLpF/HTzgem9Sg4B5+M4z+cpoBOHNVIvz/jWMO?=
 =?iso-8859-1?Q?Q821iPBfqeR4H5rVQF383gAONMdwI/EdikncShbERDWnhm86LlWJizmoMc?=
 =?iso-8859-1?Q?htoGLS+lUkX9SOwKq3R0mZG2kt/IFnv9hCjyTJpj4ASjwFVCkQz4kATHVE?=
 =?iso-8859-1?Q?NcTVU40WX9gubjPVzeubdj4Swl8J4mRakDlTZBU52BALoppV3Le1DIdvIS?=
 =?iso-8859-1?Q?meILwOIjPtHV/mRnx5yCTs5Od1IPHTObSk1zD2xZmoojOgQUIQvP7UkwbV?=
 =?iso-8859-1?Q?tLr9QHuCk8yWhnR8pwLLql8Ekl7G/EEGGLhAmXGLutEWaabco2riZCapke?=
 =?iso-8859-1?Q?TrjkroDmvYQv4eWrdtXcz6EwN1TEL+NDcpUhEB0+aUyNb4I5PDP52wYW2S?=
 =?iso-8859-1?Q?IFU+Rgvu5O/4l9vBvMy09dT2SXYHv6Gm0F8exxvC510hnCfri0iIhq25wm?=
 =?iso-8859-1?Q?UUTU7WCg0zcrsOHEC3nY+sh4Fxhti5INGskKb0a7qCkYp3adBLPQJmm/Z5?=
 =?iso-8859-1?Q?gNys44n9X01p62rBOv8TTqFarePGEa/XYSf7BMpMd4CAkeRDer/4VbnWzu?=
 =?iso-8859-1?Q?TuS/wv1/t8UyjtMRDdGVUiBEG0rFpno86kEoswV2a2eWfWOOOOYq/KJoLE?=
 =?iso-8859-1?Q?UftFO0/fEpHq2zUyEHr6ke5GUFq8frWZANMHOrYdW4IZXqXG4DOT6/Cg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632bb259-214a-4251-b17c-08dde09ba980
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:15:32.4671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9yOK4MrwvDEjzHL14Yaw7I2Y/xLD+6jnnHtxVYq3YIGlqxLtEl4MSvS08KG4iH08gsWsNF7Qpi9cfUMEmzVIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8021

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Program PCIE BDF-OSID assignment according to the S4_PCIe_IPMMU-OSID
when adding PCI device to the IOMMU in ipmmu_add_device callback.
This is needed for being able to assign PCI devices to different
domains at the same time. Programmed OSID is emmited as sideband data on
the AXI bus during PCI DMA transactions and then used by IPMMU to match
the transaction to the corresponding uTLB.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2->v3:
* fix compilation error with HAS_PCI=3Dn
* add Stefano's AB

v1->v2:
* rework VF handling to be in line with SMMU drivers
* add locking to domain_list manipulations
* remove assignment print
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 138 +++++++++++++++++++++--
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index dac0dd6d46..49f149e222 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -51,12 +51,27 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
+#ifdef CONFIG_HAS_PCI
+#include "../arch/arm/pci/pci-host-rcar4.h"
+#endif
=20
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
=20
 /* Device logger functions */
+#ifndef CONFIG_HAS_PCI
 #define dev_print(dev, lvl, fmt, ...)    \
     printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev =3D dev_to_pci((dev));                       =
\
+        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
=20
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
@@ -1125,6 +1140,8 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_=
domain *domain)
     xfree(domain);
 }
=20
+static int ipmmu_deassign_device(struct domain *d, struct device *dev);
+
 static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *=
dev,
                                uint32_t flag)
 {
@@ -1138,8 +1155,38 @@ static int ipmmu_assign_device(struct domain *d, u8 =
devfn, struct device *dev,
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    spin_lock(&xen_domain->lock);
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        struct domain *old_d =3D pdev->domain;
+
+        /* Ignore calls for phantom functions */
+        if ( devfn !=3D pdev->devfn )
+            return 0;
+
+        write_lock(&d->pci_lock);
+        list_move(&pdev->domain_list, &d->pdev_list);
+        write_unlock(&d->pci_lock);
+        pdev->domain =3D d;
+
+        /* dom_io is used as a sentinel for quarantined devices */
+        if ( d =3D=3D dom_io )
+        {
+            int ret;
+
+            /*
+             * Try to de-assign: do not return error if it was already
+             * de-assigned.
+             */
+            ret =3D ipmmu_deassign_device(old_d, dev);
+
+            return ret =3D=3D -ESRCH ? 0 : ret;
+        }
+    }
+#endif
=20
+    spin_lock(&xen_domain->lock);
     /*
      * The IPMMU context for the Xen domain is not allocated beforehand
      * (at the Xen domain creation time), but on demand only, when the fir=
st
@@ -1244,7 +1291,7 @@ static int ipmmu_reassign_device(struct domain *s, st=
ruct domain *t,
     int ret =3D 0;
=20
     /* Don't allow remapping on other domain than hwdom */
-    if ( t && !is_hardware_domain(t) )
+    if ( t && !is_hardware_domain(t) && (t !=3D dom_io) )
         return -EPERM;
=20
     if ( t =3D=3D s )
@@ -1292,20 +1339,95 @@ static int ipmmu_dt_xlate(struct device *dev,
=20
 static int ipmmu_add_device(u8 devfn, struct device *dev)
 {
-    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
+    struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        int ret;
+
+        if ( devfn !=3D pdev->devfn )
+            return 0;
+
+        ret =3D iommu_add_pci_sideband_ids(pdev);
+        if ( ret < 0 )
+            iommu_fwspec_free(dev);
+    }
+#endif
+
+    fwspec =3D dev_iommu_fwspec_get(dev);
=20
     /* Only let through devices that have been verified in xlate(). */
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    if ( dt_device_is_protected(dev_to_dt(dev)) )
+    if ( !dev_is_pci(dev) )
     {
-        dev_err(dev, "Already added to IPMMU\n");
-        return -EEXIST;
+        if ( dt_device_is_protected(dev_to_dt(dev)) )
+        {
+            dev_err(dev, "Already added to IPMMU\n");
+            return -EEXIST;
+        }
+
+        /* Let Xen know that the master device is protected by an IOMMU. *=
/
+        dt_device_set_protected(dev_to_dt(dev));
     }
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        unsigned int reg_id, osid;
+        struct pci_host_bridge *bridge;
+        struct iommu_fwspec *fwspec_bridge;
+        unsigned int utlb_osid0 =3D 0;
+        int ret;
+
+        bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+        if ( !bridge )
+        {
+            dev_err(dev, "Failed to find host bridge\n");
+            return -ENODEV;
+        }
+
+        fwspec_bridge =3D dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node))=
;
+        if ( fwspec_bridge->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find host bridge uTLB\n");
+            return -ENXIO;
+        }
+
+        if ( fwspec->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find uTLB");
+            return -ENXIO;
+        }
+
+        rcar4_pcie_osid_regs_init(bridge);
+
+        ret =3D rcar4_pcie_osid_reg_alloc(bridge);
+        if ( ret < 0 )
+        {
+            dev_err(dev, "No unused OSID regs\n");
+            return ret;
+        }
+        reg_id =3D ret;
+
+        osid =3D fwspec->ids[0] - utlb_osid0;
+        rcar4_pcie_osid_bdf_set(bridge, reg_id, osid, pdev->sbdf.bdf);
+        rcar4_pcie_bdf_msk_set(bridge, reg_id, 0);
+
+        dev_info(dev, "Allocated OSID reg %u (OSID %u)\n", reg_id, osid);
=20
-    /* Let Xen know that the master device is protected by an IOMMU. */
-    dt_device_set_protected(dev_to_dt(dev));
+        ret =3D ipmmu_assign_device(pdev->domain, devfn, dev, 0);
+        if ( ret )
+        {
+            rcar4_pcie_osid_bdf_clear(bridge, reg_id);
+            rcar4_pcie_osid_reg_free(bridge, reg_id);
+            return ret;
+        }
+    }
+#endif
=20
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
--=20
2.34.1

