Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20228B1DD1E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073339.1436347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P0-0001Xf-Ag; Thu, 07 Aug 2025 18:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073339.1436347; Thu, 07 Aug 2025 18:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P0-0001Ne-0k; Thu, 07 Aug 2025 18:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1073339;
 Thu, 07 Aug 2025 16:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xe-000773-Sb
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:26 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5dba48-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:25 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:22 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:22 +0000
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
X-Inumbo-ID: df5dba48-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTYTZzlxLAFXorSc6HULDVixECOv0y+cJNkpDAD3V22BVWOidY6Jb7PX+biL5vDatcnfhd/Tf6WNZmUM2sOyTu/aiNqWpEbupUl0tEuJxDRAEVHASPSFW3Q0HQm86n+3Iq/jz0J4TRtbcRGPx31cQUOo6y86rqeGamoI4zqubYwXlUuH/3l2yYczu8FGk8p3jFewVS80eVmvnv14yKO3poHG6K9AcgzwdWiJ2A0qJ+wowbGgZpDw0A/3qlTkqXXztGqFuO8Z41YRP5pHzwgc5jb9KwDBtNXaM7RtY+a225MPxVjqCqjbyFX8oCqtMMwoQshZBepJND20GWIPrd9Dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkqYZa3FRTnOPpkwt/VlfgBuNz63zorMdd4FHR0PPWg=;
 b=l8xzvBSxICnXXU4VHqMr8Vde16iCIp/t1VkS7JJYm2TSCkwDZjZnFm+Q+q0ACOD1mo909RyzC7LNhAphzAvdkLDDVtiIDPthGThh7CIdX1NYav1nda/SkQqVAqmspf4vpvhUkHXsLcNPT15levgO9w8ge9mxofFVetUCZaVlw175WwxcP9jVh1uRmkbU7Nb8DFbvrixbiJl3sS78Ucfeq8umxBkKLRAQOMuu0qpiI35+xiFsqOMaB/XOo/CmgKTDWC9HhUcDTtwuHa1ig/8O9B1Mf11r2OsOCZGxBLKdIVZkAxOOcaForgbB1+WDvHjtc/IK5EWS4C3fW2nCijX/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkqYZa3FRTnOPpkwt/VlfgBuNz63zorMdd4FHR0PPWg=;
 b=eXjLWjo36rSfapjsD6VgpUWVpjrNNw0EERndALePxtkdEiiICcUyTLW/6ncOolNhTKfjBKPsV23w6vXsO0Ts8k/WWQbHSpmZ+2oyQ0smYCOCUXqLrmbqQu/mhSj3V/UtwJylrogCIfs/FMh2Tan3SEhQx5w2d43iLQd46nI2rGx899VQ+NPyfUqLvNNlUZAI5pXw91R1RwvBtNFzkJYP0PxidsRFVx+2Dlxd8VtLc6qkyDcGKJ/e4wHu3XGhnQj1Q1ANhKgTmXCbnY5FrUgn1+Mw0KshcMp1G01wYUFJ0ChmSmb5zSHbHuqcPaDimMldnHtjiiHK/lQjiQjZEOq4TQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 07/20] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <boolean>"
Thread-Topic: [PATCH 07/20] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <boolean>"
Thread-Index: AQHcB7yfTy1RKYdeLkuvW3i0Y8QAyQ==
Date: Thu, 7 Aug 2025 16:59:22 +0000
Message-ID:
 <c539f673eef6f44a1191b0f8213ff5571baa411a.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 184e54df-0695-41ea-daed-08ddd5d3c1e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?E8abdjsECdzJASM0ki5Nd3CgoBkDykccYWjOWNcB+gzS+RkR1J2gUR265h?=
 =?iso-8859-1?Q?IKQe42mCSt7nc9K0ZPiyHSxJ3HCh6uCK8ILy1J9vnWaTQja78+HqfWNHQ+?=
 =?iso-8859-1?Q?+aRNaED9uasatuYKd6BlpniRUSMRHM3a6mW/KcReeVv02hm7ZjT9Cz3xB2?=
 =?iso-8859-1?Q?OUFXfvRlO2DJX+osR/8uP1Y4v9g9QDm82nx7gh90U97cbXVE02YsSGgWuW?=
 =?iso-8859-1?Q?ypnu/stoSxdFzZHUp/1Ir4N5uDUpw7PfZhKyeq3nqK/XzRdbB8tjOsiTPa?=
 =?iso-8859-1?Q?QxmU4O6cm8IrshwKepPa6b3BTepsMbro2OsiG0wAlBQhTYuXziWxHcmL0i?=
 =?iso-8859-1?Q?Z3gukAjsiWOM21GfAUDJ0AUPgE67ClhxkuT7PV8/2TK4M8Fa0/65qGKrdc?=
 =?iso-8859-1?Q?O9rG53nAQOOmZoDx8ueSyzzsdl35auAfuLvajg0opMoWiCvaJqiEvF9otE?=
 =?iso-8859-1?Q?0/OTo6eIuyw7GKaKi2vdYM/w7k4MnEH8fjndJ7OdNOvvTzXeKdnZ39ptu0?=
 =?iso-8859-1?Q?UC+P3oc0Wp/wdZ/Hxu6wqCMZrNdBd7WxsJhdvteiltN2557GxMfsB5D4MN?=
 =?iso-8859-1?Q?dObq78P/kyt9DmMykhinFGjdvJOwp8kd1lz2jGJHMMSaVdkZinF1twD6th?=
 =?iso-8859-1?Q?NEofJBmoxFMf/LrpJRP58jEP7YudlywjArWDcUJlJgNah/rbrszryTGV6Y?=
 =?iso-8859-1?Q?IUMGVqsgU837Pn9YM7gxJcq9EKZElvWgoYku8gN/QbXz8joAftVnETTiiz?=
 =?iso-8859-1?Q?GrUXkEEMH3KCKH17+aaFZcD8S1m9XC3Yz9k2Ngkl2Etcb/HWWbutxSQqWn?=
 =?iso-8859-1?Q?hzAZVyfeHEY3eTEXihSUli5t7ArpPC9OmhYxPAZMU87rwmZXRPXLMa7Sry?=
 =?iso-8859-1?Q?7qXu+zVoim6PNJwqzoBFNFxp1GiwtmkCxKj3XJX6LmbYGY/t6CDBkce0cW?=
 =?iso-8859-1?Q?39oZTGdsBIfkPpPY4tgUN8cKJLaCNTHdD+Vq8f2ACOWtuubCOMtuDCKmSP?=
 =?iso-8859-1?Q?EHEuqXqk4AU5ige/Uj+wT7Awp3qHWEcNj3VAr/ykp74LizqsCBitGeZM+i?=
 =?iso-8859-1?Q?9Yn0+W6/8lGpT/V358kCsJLOJ9MkGwawBxx9rNK9mPFeZMBEwTU+Egotwf?=
 =?iso-8859-1?Q?Bhf0+AThaS+HNd9l38IvoBXTghwP7YPf/Frx6YqNDdB3rsyFBqaV+MhE+g?=
 =?iso-8859-1?Q?vMiDAGLssxYG5WHEWbv4aKA7XpH+FejCb+vOkIQnY/LCxHjaRjj8ophAOc?=
 =?iso-8859-1?Q?8vgwUmJ6dwwsnqSIZmHRzPEEadEX91tYCOySIGdOLR7BqU5a+bFlsHE4f8?=
 =?iso-8859-1?Q?Vfgk/fU+0qNoMDFMRN1e+6OvjZCJPrXilRA5oBOnoUkvEgK/NwTbeDuAaP?=
 =?iso-8859-1?Q?P2tk42DNwkTZOfelJXraKmrofoWEGwg9OrqJhygrZ2vicGhonP4UOHDJ7U?=
 =?iso-8859-1?Q?Jh8f9eLixce56yiUty6d67qKYleNCBIgwkTuhPCEeRtz6+modhWEVDUrni?=
 =?iso-8859-1?Q?rEKaESstTbexZV2+kkFi+En8nDSSJ265HKljZFr3Ywjw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/0mbGkKn2N2adDv4N8Avw6EV2jwtd8yykfQHxxHrmuQR2jy06tfyt2jAWh?=
 =?iso-8859-1?Q?ri+Nvd04EVe1FbDYautQF0JMKo89loee80+z+c1t9WluTu4iVHSC7k/dEY?=
 =?iso-8859-1?Q?tziLpnPHuyH0KMhT8RCCIP9MlnK2Fgv9RbYMTgJoyo4MIRNhbPqNdMLsHs?=
 =?iso-8859-1?Q?St9DG1o1S12cAVDlXAz06aJvc7u03UPBuW2IpdBrOb3NltyUEzHJmX426H?=
 =?iso-8859-1?Q?x4yvFSQ3mTTeXwhwm4Vp0AeRK1pEnBLQbzeayaWpdedVP8Sf32y4ymsAaF?=
 =?iso-8859-1?Q?UP9s8johPmMPN/L9kr64eWaPqiyxlblJRhmOhOfaVRaSfT97h+DBlZfgRv?=
 =?iso-8859-1?Q?nm7KhJuo59TdPhbJu21luqmBUtNPitnxV2AZoHk092xrRM5ZE3EAHL5N7w?=
 =?iso-8859-1?Q?eOUJzTnRo9uqe9V3tGZoE3D12LqNQmcLbmprDbln+BGmWZezH60dy3pPEY?=
 =?iso-8859-1?Q?1X/6cyhIoyFRvU5tQpUvsOhWM+AWAjf2ZIv4Qj/8yMMbaQsUiV+Lkaf9UA?=
 =?iso-8859-1?Q?YHvrkoqrFiOvalBTz9AUK8kb0Dki8I+wAhY/64Fov1ZQRkNiMqKt0ISSUg?=
 =?iso-8859-1?Q?pAqSqnMgBuTixmKlP3momAUxZAidrtPQSMCf/fA/+RmauEkOFcDLjDfMa2?=
 =?iso-8859-1?Q?v0bbUesxvVqfzJQUHt98sfmeWkpCwaew3wTCxjYppwF8/Dvl5uN1+fyC7c?=
 =?iso-8859-1?Q?MfjppUYudbcrlfK2Bie17h/Q49v9bcfL6ocHC+OYjgnkXTCaRafzEXJ4YJ?=
 =?iso-8859-1?Q?FXu2wAcruMddEWOTvqAsSPW4Mt5HH8/eAeVVitAjwSBCVXxRF7AGHBPhCf?=
 =?iso-8859-1?Q?oD/f2Ef/RYVRhbJ6Q0sUMxzrXUcyPJkFXk11oMzHILmprMwErlQjlK2CPT?=
 =?iso-8859-1?Q?x2aIo+tWIBqS6JXu2NoroScz1e+4LqrAl2IXBjeaF7VD0zxoyTx7u42RGe?=
 =?iso-8859-1?Q?zXArZSZ7VT86/+1aUWlAowjcOxWcc0AX18nzxCbkI3bk81oCllORSxMv4V?=
 =?iso-8859-1?Q?nkf++QtIBLvTMp8D1XeptjeyRr/171cEO36EFqCDuN4ZELQetvhthVRJGe?=
 =?iso-8859-1?Q?7qGY6w0NaUhLZKKtTMBBPkDN2hqxePESRucdhPhZN79v5YorG8iFrXvzgD?=
 =?iso-8859-1?Q?uxHMFQiVJ51UPmy71qh/nDa4m0iysyiXZAOWnWc4fD0WxWHSs6bFySg+o2?=
 =?iso-8859-1?Q?eghV6jP2C1NcezZ0NKMdhwMYVF/WHt7kOcBvYyPflTEPifH8ejadDBePHR?=
 =?iso-8859-1?Q?7rK/UACXSfmbBkbeFyJruHmxfUk6ztQc2WdRIgBDKtNBYDEjbC4OJVPfI5?=
 =?iso-8859-1?Q?GGkcShNPPD3mNzxC0r4NLJkCFOxwkNvVPyl7kbfdVnEexwYfPObw7U0E9V?=
 =?iso-8859-1?Q?Q0/9Q2sA8r7AVMdMwlp0XR06Ss4bl1QMTc+aFtTK31PuPPmoTWaN0NYKbS?=
 =?iso-8859-1?Q?zvLyRJKfLgrbMLa/hAQZDNAHv2qXimmilW+K7IcEy6WuU/CU+UswRb8eSv?=
 =?iso-8859-1?Q?dlJfWUKJTCrNjAiXA0Ru04RGI9fwdo7mDJ/8J/QkPD2lXl7RvEbMqOzyJK?=
 =?iso-8859-1?Q?jRIYFZLDxUac46UX9gr2PUl3Se6Oq5ppgmGybdE8WVEVO3zolhHYxboKZU?=
 =?iso-8859-1?Q?CuJBNhqQmu2xwZTvxaYUeuUmI3FBajZegq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184e54df-0695-41ea-daed-08ddd5d3c1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:22.4293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qL+vHlGtKGKHffejAwuVFI9DgZtJVUnUynRG7yR6g21HjzAp8QloYOG2Vg/u6FFlyVQ9SmGgBTDBnhTOIvcsLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Add cmdline boot option "viommu =3D <boolean>" to enable or disable the
virtual iommu support for guests on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/misc/xen-command-line.pandoc      |  7 +++++++
 xen/arch/arm/include/asm/viommu.h      | 11 +++++++++++
 xen/drivers/passthrough/arm/viommu.c   |  9 +++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 6865a61220..d6a2a6fbdd 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2058,6 +2058,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### viommu (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable support for Virtual IOMMU for guests.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 4785877e2a..4de4cceeda 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -10,6 +10,7 @@
 #include <public/xen.h>
=20
 extern struct list_head host_iommu_list;
+extern bool viommu_enabled;
=20
 /* data structure for each hardware IOMMU */
 struct host_iommu {
@@ -50,6 +51,11 @@ uint16_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node);
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    return viommu_enabled;
+}
+
 #else
=20
 static inline uint8_t viommu_get_type(void)
@@ -76,6 +82,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, =
paddr_t size,
     return;
 }
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_VIRTUAL_IOMMU */
=20
 #endif /* __ARCH_ARM_VIOMMU_H__ */
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index 53ae46349a..a1d6a04ba9 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -3,6 +3,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/param.h>
 #include <xen/types.h>
=20
 #include <asm/viommu.h>
@@ -38,8 +39,16 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
     list_add_tail(&iommu_data->entry, &host_iommu_list);
 }
=20
+/* By default viommu is disabled. */
+bool __read_mostly viommu_enabled;
+boolean_param("viommu", viommu_enabled);
+
 int domain_viommu_init(struct domain *d, uint16_t viommu_type)
 {
+    /* Enable viommu when it has been enabled explicitly (viommu=3Don). */
+    if ( !viommu_enabled )
+        return 0;
+
     if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
         return 0;
=20
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 6b4009e5ef..e36f200ba5 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
 {
     const struct viommu_desc *desc =3D &vsmmuv3_desc;
=20
+    if ( !is_viommu_enabled() )
+        return;
+
     if ( cur_viommu && (cur_viommu !=3D desc) )
     {
         printk("WARNING: Cannot set vIOMMU, already set to a different val=
ue\n");
--=20
2.43.0

