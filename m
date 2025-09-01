Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBAB3E61F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104845.1455911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xL-000847-0B; Mon, 01 Sep 2025 13:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104845.1455911; Mon, 01 Sep 2025 13:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xK-0007xU-Pe; Mon, 01 Sep 2025 13:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1104845;
 Mon, 01 Sep 2025 13:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fby=3M=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ut4xJ-0006av-OW
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:52:21 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0fdcb51-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:52:20 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8345.eurprd03.prod.outlook.com (2603:10a6:20b:509::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 13:52:11 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Mon, 1 Sep 2025
 13:52:11 +0000
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
X-Inumbo-ID: e0fdcb51-873a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxZi3xByIMAAuFY+pTL0CsVxmWHYf0ywvfSEDvwXzAy+gdXnP4Gyg+lXaBoi9R/jwCL47xH1EeHRu7c0cydm8TXndcp5c2i8lmwBYynkCHMR6TvOnkc/TbA0y7G8mWKVbmpLqfdBeyiH0dXJ5xYKGmnJ56ownCXuOPi2AGcpWoax2HUmxrX3ehS61/oSAZPqtQ9+HoPe/QGxazKNWGxPiO1CevcCiqzUSy1YLp1rkGVeN8+21cusO3IR3zqa0RkPf3QzGBDjFXqt3SxoZE4zwRPMQsB6arei7/Nifng7pOVglbXugi1pzHYCNIfh9uyHaxvYQhjzfy+NaRgO0t5Ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJkWdY351yDwfZ1ygAfzEu2QpGdp7Nht2cn/64+c/iA=;
 b=jYNet9XUXP48hw8TliNmHuqhC4/b4tb9A50bH3NwzLdHMWpkxEhYZfM9CVH1OJSJNQBptFv9W/208KG2GfPOLkvZW06BZEoIt7532Wj6Z4qNll6YV93L3B8YmkSzQr32hsxkMUhocxVrNV1DSJiFMemDG8EVwlosoeJSaq+06lKvGXknzi/CDUiserweniAUcY8tAIiHMlryFnswQRa92xoK3ufSRbFRMrWL9lb/iANGaSnpfsEeq0hUJxRal0PM9fevQ5HAdsRUoBlDM5JPmYWYZaGY4e7RWHKsO3/cMgYNGzh7o1AHD9hs1iaTHFv4O+95vMnHqTnBkuSGQafBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJkWdY351yDwfZ1ygAfzEu2QpGdp7Nht2cn/64+c/iA=;
 b=sBFTCGzn5Egtf4pyJQy/oofWQQgKgcGsXjuDnDbx6NUp2n35SPlhvCUunEf0VxxWehIT9OBFHsfpQmW7D3KAkKhIDKWwalBwc6tONxgCsPBJ7zhKYqM4b5hYo8ssxLg09qxfxvJGmvfEjoKkHj/m5YbBwGQmJntm2x7pZ43xbrfB4VrDEJvXCn0SHNVUKTmvqOp+XTBMBx9hD/O3D2yjnw+owfM5lC4yzTKXM2mKbv6Pb5VlmhTDrVZWrn3JbNWJu/vwBlt7k/M2LmFgcOJbvolfx7ZXICEfB2e6uPSKDqg+HLnZEwzKvdjFBV+DNQJeUjguFnfv/5WpjJSADu5GNw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v7 4/4] docs: arm: add docs for SCMI over SMC calls forwarding
 driver
Thread-Topic: [PATCH v7 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHcG0edxinH4Zt33EOMOmbXy/hnDg==
Date: Mon, 1 Sep 2025 13:52:11 +0000
Message-ID:
 <aab65c67113eed04fbf9ccb5a4f8e60c6058a99a.1756734682.git.oleksii_moisieiev@epam.com>
References: <cover.1756734682.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756734682.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8345:EE_
x-ms-office365-filtering-correlation-id: 8d4b8cef-7cf4-41cb-ad71-08dde95ebfde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hRRkC0f9f2e4FqR0FGdUAHAqXzrdarBo/oHU513aRtDshrctYI4ksjJokY?=
 =?iso-8859-1?Q?HmoW0HAHQDIE98n/20hF/0n5YbkIcesOecBy5ZEbc8y4fSXXHX/aE0mL4p?=
 =?iso-8859-1?Q?gVU4Amn+a47h+AN+DsairPE9+ezPUOcnDMCt/GStV3on/CmGIY2JFGIEQ0?=
 =?iso-8859-1?Q?r1gk5u26XPTjgdkaIQ5o9GHgHRDGlwXmNJBr7cFxaKwLq9gJeMYH0wUXIy?=
 =?iso-8859-1?Q?0zkT0d4iOk/AIGLZw80Bkv48G42wyKGmzdx2NDGDNfCMm/0DyrrcNl5xWh?=
 =?iso-8859-1?Q?pF9jtcQfisnS98WrwAP2A6YvkVZrQNFTmRQ+6QJZo+qAY09Fe3QGO7MATv?=
 =?iso-8859-1?Q?VMR9wmck6xskJ7uopqFS1wMIxayuMGkNXsipNwMa3sC2/SrnLKfzqlncUu?=
 =?iso-8859-1?Q?yDa2TerdRUK3XeIWrUqY2rpnBHlrLVaHqlnLu0di51KfJX5N9p3aM0DlZp?=
 =?iso-8859-1?Q?On3poRPsVrIBO7fuBwsBJRn2OPis0NPnSgGuYwqRkHXd0m6b0D1u3iWn1P?=
 =?iso-8859-1?Q?4UNvPsn+01z1PKM0SPZx5cZk9p4HvySHQe8SNLJrW1OG0KeTlqfOT5oG+j?=
 =?iso-8859-1?Q?MLLncF5lkZ7DekRj2D/zifz0NhnUo5RxMiPMeo8GVU2jcjLFM7J8RT3Ovl?=
 =?iso-8859-1?Q?uhuPEZ0bnVfc0l9HvQRb5A+mSSXgncoYymi971BiObgfCtKfCPC89gconm?=
 =?iso-8859-1?Q?in7zFPsCd8DwHYeVXqeZ6InoSD40UY0K3TnSfVJq/uhwP5gF5hpBbrK4+T?=
 =?iso-8859-1?Q?9MzxrnMkNcMAWeDAjnl3DWyiFW7SeEKSjU3OjYWyZ2s++9IgFZY1FEwrkf?=
 =?iso-8859-1?Q?Ll4H7DkLUjrjDeKLgwR5RZ5E4NyCHrpwu5ugaVyVuRxbPQYytyTrepshZH?=
 =?iso-8859-1?Q?UTD9TGEBP7JIXmQbIBZ/73Rm0btd1+5q5uOjIyApnTVweNNhcHqfvBFttY?=
 =?iso-8859-1?Q?qgMlnb/0OC4WzN82A9UFMkwzZ+KvV9I+EOdOV8S23rp0UAtmOw9nognSrD?=
 =?iso-8859-1?Q?DSmjkmk4g2sr68FC4sOl8ptrgi3v+xvAygExU+7s4C4OdHLTTVMsLV+v1w?=
 =?iso-8859-1?Q?KPRRAMBqQQt1y9683IJEXNKIiXWX7c4GCmM3wPoldDG49BUCuBgGsefIxV?=
 =?iso-8859-1?Q?B39351TCY1FI0YMA/LOmkTl5AlYJ75llOaJ6RY9fUscettjsCApL0zIzbi?=
 =?iso-8859-1?Q?0ylcA/FwveeNUKvDp7iBdLveHftsBbcvm4aJNdQtb65dTBWBEMFmE/E8sz?=
 =?iso-8859-1?Q?amIWzqfyx/jDJ5xY+73mkeD54eTegsMtGlYSnWCMvr5H2QRDoNJNgV8piT?=
 =?iso-8859-1?Q?U939VlgLOdI4Yag9lCNcmIKRSm3usbhf+03y5HGP8aQoflDDORNLqvdKFT?=
 =?iso-8859-1?Q?1o5qNkuFIBsAcl5l/2OYh2C24HvPYONd8va+KoP16d+BP1ESx/QVhHbOJ/?=
 =?iso-8859-1?Q?lauZPDIXnR9kNgW5/q6EyO3wEa9h4VluweHYCWQwvoUoCxcGZk80EMOv+Y?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bjIZ0gEKvVIDFMAi8Ax+pcATgGFDUfNjMWIcLhQf7jSPPX7FAIfc3TCTOe?=
 =?iso-8859-1?Q?8qQv7pyu9HEWXTRsAdYLHmMLwdM50F+Iq3bM1c0MielHTT7IfOryFUi5AF?=
 =?iso-8859-1?Q?/6zXmOy3ay2PEkK+EKvh5bWIgdnJbwdLwLoBudGHe0hxYLQSI8xNfY8jWy?=
 =?iso-8859-1?Q?9J8dmm9a/MvBJ4kygcWN1yj6fKS8qCcZTXvRHZJSgNnWHi9PZQbQDllle/?=
 =?iso-8859-1?Q?8rXsdl1iElSFZ6Vydb+OiA1F1zC14ORywMGdgdE/wCTZfbORFc9FAw46k4?=
 =?iso-8859-1?Q?Ao/wQNJ/Zl8brL4PYRmjYteyol4LqV198iuu6gI38fTtoa+jYma7Uok8t+?=
 =?iso-8859-1?Q?3NgKZR5WtP0afKpdHo0dS1bq716JHaDFTw0ShyoKe5dnRtSkefffntoXbl?=
 =?iso-8859-1?Q?LXRs+gTU0qa3GtZslGBAAzLn+s7Ha9CDDzkIETbuhpFeNj6ZSwbkBKaKvU?=
 =?iso-8859-1?Q?JPXuC1pwgCvO9SbS4y9S9NPs+yiv4F1kBs0/VhKWIsEXjbtWGw1pPAJ2IF?=
 =?iso-8859-1?Q?6Bp2swKy2Q0trDtmwhNnuYu0LvBtoJZnRaMcqpj1qA4jefdSmlPSPKtS9S?=
 =?iso-8859-1?Q?79prMUM6e3osAfqkrNJxRoa3W7/G+vNK24e2a1LTp9pHAXG0qLfGGZvB+3?=
 =?iso-8859-1?Q?58a1C++B1BtpoIBfStzx3Xuyo6IaWfNs5Uq/Xeg2M7FVF3f2Ro6evXuHpO?=
 =?iso-8859-1?Q?CdbzQdBTBACJEekkqjM5rBY0HXRffCtfavLrc6NPmCQEZkKriQeS3ctaFt?=
 =?iso-8859-1?Q?IunGVu4BA7fIj/QikJnY10Ac8kX3a0ozDGvjWxO0otHVDo4JdXLP9D3H/R?=
 =?iso-8859-1?Q?NfbV1iZqbKFGEIil16u26YrYXCEd2UmbKbSgEdAoHm4jsZsfRZ7w9qwFYy?=
 =?iso-8859-1?Q?R7LVO42QWg9CUX7+QNIsxRouS9IHMv1iHAH/V2BOD4YG9ZWu+CzW6nXA0N?=
 =?iso-8859-1?Q?07pZHc2ZIXNAwwX1vlpAIhgZANUoacsbPecfBXH2NiID9B8GWq9tJLciQC?=
 =?iso-8859-1?Q?TBnaro4XQpU+iq25P/K3X/nE/OlWovnM0/w0hWccp9nwYgk2cOvJVtF5TA?=
 =?iso-8859-1?Q?JvbeHBC7/vfn/cui89wsNd2oaTk8Y6QzqJbYKbrCTusgyImFKjHlhs/lSM?=
 =?iso-8859-1?Q?O/ibUnLHe1UKJHCfUeBDVy6rp2GrHvH+Oh4BM/s7hke6iHoC6Vd3paY1/r?=
 =?iso-8859-1?Q?QHaACbIotGeYpCPneJtjW+M2U3nELRds39fPVIZX8hpYOaaTbU5Es4EBzo?=
 =?iso-8859-1?Q?y9TYotznIJrCdDDNaMH09LvGQROds8URnvF/isA6GLd8+En+epQjRiPaVX?=
 =?iso-8859-1?Q?GGNxA8EsovU/BxA7aKGPaIFitwlK0WJS2L+zNkPuRA/Rs6wQSX6N1yixGO?=
 =?iso-8859-1?Q?ozkfUdm8PoJQd53D5TbR8Teycwu5veDZAXtcq2TKGRVLOAnA+yfZHEeh6U?=
 =?iso-8859-1?Q?UUIkriGlshqXzCpYSbpCcYH5pKqtvlUbl8d8TJlLbvnViD23DyRn5MzSxc?=
 =?iso-8859-1?Q?vrASFMMpXSEemXbwtz0louTNUhgWVp/n65YTnaKvSEJL5bPr5QHNquKFe3?=
 =?iso-8859-1?Q?tx78YWytgUbS/i79/cBfS9Yhwr++dBS6X0PbHxbJUZum8+oB8cvL68lQ1x?=
 =?iso-8859-1?Q?2RNJPNwqpyV6HPq5SQcnz8K4seQL6dDUyJ39fqMIA3PycfrVe14zYY2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4b8cef-7cf4-41cb-ad71-08dde95ebfde
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:52:11.0470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Efq5fBZZ80rAN//fQpBX2N3wx6zZJL5YpLh0Jim8s2JN9e8tbKs/IEbyUNcrHM28dGsivPg29w+IjxPZpFA7iHtQa5sUnAgMZYddLStBLJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8345

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v7:
- fixed typos

Changes in v6:
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- rename dom0_scmi_smc_passthrough in documentation

 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..d65ce35acb
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't be shared/split between domains. Or, at minimum, allow SCMI access f=
or dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+
+Simple SCMI over SMC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC calls as doorbell.
+
+The SCMI over SMC calls forwarding driver solves major problem for this ca=
se by allowing
+SMC calls to be forwarded from guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC calls forwarding enabled support, enable K=
config option
+
+::
+
+    SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC calls forwarding=
 driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First, configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom a=
nd SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+Please refer to [2] for details of SCMI DT bindings.
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

