Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE4B1DD19
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073363.1436465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PE-0004z7-Jl; Thu, 07 Aug 2025 18:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073363.1436465; Thu, 07 Aug 2025 18:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PD-0004d0-Q7; Thu, 07 Aug 2025 18:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1073363;
 Thu, 07 Aug 2025 16:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xt-00076W-4Q
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:41 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e67b1a2d-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:37 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI0PR03MB10757.eurprd03.prod.outlook.com (2603:10a6:800:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 16:59:34 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:34 +0000
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
X-Inumbo-ID: e67b1a2d-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NajIWZLffrca0TmSh0u2AtMJo5oLQxUJqDhGvtdoRyrh0qIIhw7O+jskLuPmWYl0AGGE0wHAi8+K88uo3DOIs0YTZQ3UsSljo9wf++TCASdPIwWFAalpMkuHB2gFf0HcabO3LcZJ8hDAQQQqYS/jTEOKQaFG/wVW9yu0cta4gYoWDRqiFMYPNdxn+gP07UU2Al2D4rmUrCqvL/qGnBGLQjoH6i8lX3g/Qges9A6Fzlivnt2mCz6c1j1LGqR6Wta/wW8qMePi1UdRZh3Y11CObMzQYcsxshgQHroLABCDum0foD+SmHlNE/dhpPcpoHzVjAHclAU5MSioX1A/t/0v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgbEu8g+cR8hWWcI+vmWjbFyPNSrKMsI150S5qEBQE0=;
 b=DXSbnBr/U/YwMSQTjj2iz5A56230ct9mqBtqh9BJkvJM1Jv+O6vlsyN3fZAW/51fXuDHSReqR6WDsiLVlGCwN13awEqpD9ZCtYzSqIRf3KDR/cfxn9A5vcflWWUK5VtmIfaeBvqRKFaZimkUtedFDuwC+blt25Z5mhwSiRPbkHxp4NehmE0bwYFBW+n12XnbPpBjfDKoqGqL//RLvQ2M+hxzRtTp8KkZqHBUhXoY0RV4GxmCke+cPJjdwsT5721P3HdPHNP/MuRhT6A/fi3ulAzbJ1G3K/0XtuX6oR4Z22cDaMoaJEk/aZDUL4qqwgYKU/NEjzQbrNyUPcTJ5rOb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgbEu8g+cR8hWWcI+vmWjbFyPNSrKMsI150S5qEBQE0=;
 b=jvjhKcqt2EhBC3kffGH+untvrK69GaxYJ9PUY+sF9fCvnN3uTQRUCNeC/bWCiYYYKX0B9hXH4BV/OV+F2E1sJZeEw92wxO4htC1DYGURsXDjC8NM7fZGc/LawkL6kk1v1vy5BUaEcvSJ6CeF3YysST8PubWPQ2mVKE2HKU/EGf8xtEgav9NWEnKfyaGXNutmavSwbimcW+ntd/6MkOfUYPYr3z39IckdRSoDWNGoO5L/LGfIizn3+dynPBUqt3y7UpAjcp4aPv0YDw1O0SPKXe9Nhuhv0K9QxrDDzg2FsnpZ2NjnaiScrJuo2c1gPDVIPt8GuACN9dZDrWcX3sqRZw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 19/20] libxl/arm: vIOMMU: Modify the partial device tree for
 iommus
Thread-Topic: [PATCH 19/20] libxl/arm: vIOMMU: Modify the partial device tree
 for iommus
Thread-Index: AQHcB7ym3rNlr743m0uxb+sgzlQOeg==
Date: Thu, 7 Aug 2025 16:59:34 +0000
Message-ID:
 <93021553689384d7c0dbbb41466677adfe331fd8.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|VI0PR03MB10757:EE_
x-ms-office365-filtering-correlation-id: ea134fe5-c68f-481c-00ca-08ddd5d3c913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e91ESCL/h3C45GynofHgb4w8DZc41ERMwNmUN1aoJOgSospcgsycsABRDL?=
 =?iso-8859-1?Q?Ne7HOWp+SNsXNalwxERxhv7fyeEXf6XswOYIwglQPaWMsdhW5O8xEsqWce?=
 =?iso-8859-1?Q?73Xh3ENEAbJNxkfQZeXCj/813N3OuP7FINN8MeVufDA9MEDljztHkkqp4i?=
 =?iso-8859-1?Q?8g/5rZ+8kAyn7NOnXBI3lx3DC/amdT1pyOFEPRNGAz93BkGeddXJUPtPjZ?=
 =?iso-8859-1?Q?otyTVWjULPUa3UBmZn+OBhbqZyQTLyESKTO3mFbH1XqrYbQwNGDysK0loS?=
 =?iso-8859-1?Q?bLfW7d5zihZMdGbBlLAqw9plFtblw85Q3ynhsdRLaFL7C6nOEYV/84X415?=
 =?iso-8859-1?Q?AjpLOJ0XtCXqOUs40hR/G1+qZ31lnYKJ4PqqCPThPg1+2FbdcJF/Vk4XfV?=
 =?iso-8859-1?Q?/x3bVOGA4Tome6owNRacGgB4tauJGf0AoxXk6dW4bAdV0yYnyJ0mI9DOGU?=
 =?iso-8859-1?Q?y9yQ7YlWDzSWTHC9EVRvtoDs9xZoZIg+wKB9FI7NEaTHSGd+saPNP3gmjI?=
 =?iso-8859-1?Q?gjN0uyF0N00rbJ+1uNCUQo4YW/KBN02cboibo7OYC0TuNVoMbL6x6h2XUV?=
 =?iso-8859-1?Q?WERZygFibaW+ZeVJwouW+1vpyJEkBOZ3LkmArsFYRhMsczG7x8KTmjc+/t?=
 =?iso-8859-1?Q?N8J+dD2XpJlqxVQXN/jVxQKmi961pK4fYq4ZBGQMlWYBALQhGWvddKJUAv?=
 =?iso-8859-1?Q?/kaIvfdiAwWvnqgeVOgVSbrpSNiTfknx0ZhJIWSNWPQEHXPn3jEYImUIyy?=
 =?iso-8859-1?Q?2nEXhqCIWp6l3T3YYjbKJj6WwJ62aFJnBu6tx4miei9B98M7hsoTE83tNB?=
 =?iso-8859-1?Q?WWOQGWZTwN+zvEQNIQp0mwrqpu+t+9upa0nWUgmOY6/mEouXnM1BauV6NN?=
 =?iso-8859-1?Q?LbSgSjHpRz198lXxuv7CUgfJIiZUFen5FraJul/QbRk/wWDQ1AnOJrcp2l?=
 =?iso-8859-1?Q?lU5pEXZVhrD68EWnWVJRSbjD3kP+psjfH5189K6gjjoGNU1HUkCA0Ci2i7?=
 =?iso-8859-1?Q?4SiyEcKXuCiz1kThCpRGADZMTzJU+eZ6iHII+mZZZq1NKfC3ZKYco995Qi?=
 =?iso-8859-1?Q?GACL/l9a9kVI81zpgGyoV7Dx1R4yEeAAL6kn9fGbpK/2jNhvb3c1h6KHUf?=
 =?iso-8859-1?Q?Wm/LbzrIQvzUjFGon0WekIHMC0Rn3g1LvC8HYt6tdqDwvDelQ/nkroJKw2?=
 =?iso-8859-1?Q?aMt8INU13pFDTIUlpNvb7nqY3Nb+4qVKBDBjYnFmyYeEDmUTB+f7WyJ3Xc?=
 =?iso-8859-1?Q?C6rD+TpHI1vsS/AWoKUa0J0zuLt73+k9C4nYrMa2PxDpAHnL2Acpdvf1gB?=
 =?iso-8859-1?Q?/Up/mkV3Dibepa9nuFPXXn2JwZ5zRmoejU6LcaLrJ9Tvn1hyL+ZOkgwXVs?=
 =?iso-8859-1?Q?MWQMgJxNnKcWyImD/N8VBEyIqRhkz2eZtj2DUPGhKemnOLdTHdp3mpWnmF?=
 =?iso-8859-1?Q?PVeFT0jlP3HWHoKxuEv0wqVrOgckyHz3v5BmzxuHsB7/svD3TVvfmsBnNy?=
 =?iso-8859-1?Q?7cReajSJ3omqe6gS4yhc/AQkDXlwmjczHbh1RJE5liLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wKREvlsBtqGNjU3nrciv+mTzatP7I6B9MT+7T912Y8aZU+Rv7OnbZGW/h2?=
 =?iso-8859-1?Q?ecoJe7LJ8CZBWFSO2Rqvj0RhQtOgfKgPPVEZUggOYbVB/qBq+DBpk5XODt?=
 =?iso-8859-1?Q?lJjro+IOUIVYMQQbgSWOLTZgaJLR0wv5BEioLnEXviME3vETWX/r7GY47f?=
 =?iso-8859-1?Q?QauNIV4uiZciMvl2+KYO1DazYE/TlEPWbmfgmBof+BQnKlXFnvgtwdkexJ?=
 =?iso-8859-1?Q?WaYgoYQPqwOsjQvPA4gcRKLCIN6598KmihAX3l8Hg4MS/vopWOFRenn8wQ?=
 =?iso-8859-1?Q?1U3xsxsQ0+e6pTiQlfCMBwhDNnlVIXZxafJJX3h3Ns0Iq65Zh0YCgqf2pz?=
 =?iso-8859-1?Q?paLPbILkwEcI3St0eiJb8NEXFUsykrKzMoMWcdanHTNJ+bIjU+ZNYBrQaH?=
 =?iso-8859-1?Q?QYp1ljLNVOqAW7gPuBl47SwrgudFB2RLVSJ8iH1CjaX4eLIAOFC5MLDcY3?=
 =?iso-8859-1?Q?2LCNanpoZw25gYmgVtHhO0kP7w2Klry/GMjvN2VrfQ7qSaxiWj5iaycH6w?=
 =?iso-8859-1?Q?k8Gkp0DVWO/s5xrIwjeUSm8I6FJnla+OterosnOPF581biViBF9R0BwDm1?=
 =?iso-8859-1?Q?8Tt+tqJWfM03fCyfhrdt6hODyUi3dIWhd5fTrWMPG6YaRkDIeOORzGAkwG?=
 =?iso-8859-1?Q?3iBQeE2nlPKQpKFJ+IgrqoVTF3ildj1Cl4lN3xgbwVV+XLQ8aT+S5vCo4y?=
 =?iso-8859-1?Q?4a3UijjTXjJ6wvFBAnyK+NwNBcBkx34iJtv33KPVVnH9f0USGMaVQpiH58?=
 =?iso-8859-1?Q?kDqdSwXOc5okuIyzLh4EP1ATdDb3AAINPElZF9/JgKGqmLPw0gySPm0JNa?=
 =?iso-8859-1?Q?RRgB2u35Es7j5mPm2dHClsDTTUdbMGAY6Srg7aWdmnac9CwfagZ0Pvbu4i?=
 =?iso-8859-1?Q?VyWLeq3DEQ9IbLlRThYNWmK6JuIZxpb/npjE/m2WOjEgAG/O0pjnOTd1Sg?=
 =?iso-8859-1?Q?IiulGs67yHTdZlQLRIqHMa1W/PLW+lmo91zEMrQZnroUXrchFNw2kaNvKs?=
 =?iso-8859-1?Q?OLr4yujdT2UeEH9OAnfruwhRLtyeAc5319kekVwsmpPwzsqerVZw1lkTBS?=
 =?iso-8859-1?Q?KSMJhgaAwcJsxncwRZgMuOS8Niio7Trt6Q+ixEcp6X5qM1sVWMqccNumDp?=
 =?iso-8859-1?Q?nwHIz7UKZt4Bz8bTHxFurfEKqfFsl/XTmo7m5utFOKfZAIq1k55Z2qykK0?=
 =?iso-8859-1?Q?dRENe2JA7CdnK8w7GeIDuRZ32Fjj1x5WAH9Dv9M6PdR2gtkGr5LCA2eXRT?=
 =?iso-8859-1?Q?sYM46FnVOC0GF2u4YFrXXpMNXK4/1Qu4B97uQXCnU5gd6LsavMlEmC9uRA?=
 =?iso-8859-1?Q?NqUpXgEP7HgcogDY33dvsvjRz7usIsD9EoofyyjQKX01GjF15pwYIjaxgk?=
 =?iso-8859-1?Q?snI0uEmRUGnmgkwosU4LQn6i/y10a75QCuJAdoc1JCypT5pQZc6x9bCQVj?=
 =?iso-8859-1?Q?NXhCJ7tZNVnuTys0IrZRwUUDIcZKqJH7jXXHmupy6RICqI5aLATKxVbJxW?=
 =?iso-8859-1?Q?TOKUWHDNhZJFyU1Ufe5CSRGPG1i8Zx6o3V7isKH/ROytW3whdAE2sQkzr2?=
 =?iso-8859-1?Q?VYVEL29PlyvCV/Y5ekDLZtrE4al0aBMMGeELe7jVany38Abhp19HU6goj4?=
 =?iso-8859-1?Q?ZTFnpPV75yIob3+corXrRGiU54NNpCmsTCL6z9DGknTcqzIvjY0vJjGA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea134fe5-c68f-481c-00ca-08ddd5d3c913
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:34.4204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HS5uz8LCLWlndQrSzCtskKaoonZvBpOfwePBUeQfThoCLUfvcg7HWcxCX0uya/ZtQxU+N0rBPMRtdpd3eAlhIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10757

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Singed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 55beda8c0e..d99f49b831 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1312,6 +1312,41 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return 0;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    int nodeoff, proplen, i, r;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
+    if (nodeoff < 0)
+        return nodeoff;
+
+    for (nodeoff =3D fdt_first_subnode(pfdt, nodeoff);
+         nodeoff >=3D 0;
+         nodeoff =3D fdt_next_subnode(pfdt, nodeoff)) {
+
+        prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+        if (!prop)
+            continue;
+
+        prop_c =3D libxl__zalloc(gc, proplen);
+
+        for (i =3D 0; i < proplen / 8; ++i) {
+            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        }
+
+        r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+        if (r) {
+            LOG(ERROR, "Can't set the iommus property in partial FDT");
+            return r;
+        }
+    }
+
+    return 0;
+}
+
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1330,6 +1365,13 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    LOG(ERROR, "partial device tree not supported");
+
+    return ERROR_FAIL;
+}
+
 #endif /* ENABLE_PARTIAL_DEVICE_TREE */
=20
 #define FDT_MAX_SIZE (1<<20)
@@ -1452,8 +1494,11 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
-        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+            if (pfdt)
+                FDT( modify_partial_fdt(gc, pfdt) );
+        }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
--=20
2.43.0

