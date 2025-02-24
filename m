Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E7A4189F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894979.1303608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbf-0004PP-Kt; Mon, 24 Feb 2025 09:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894979.1303608; Mon, 24 Feb 2025 09:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbf-0004K5-FA; Mon, 24 Feb 2025 09:18:31 +0000
Received: by outflank-mailman (input) for mailman id 894979;
 Mon, 24 Feb 2025 09:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbd-0003pb-WA
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4df01f-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:29 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:24 +0000
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
X-Inumbo-ID: 4f4df01f-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caBCYmK4UepmA73npYJqH5zIM3aql7FUj5iPWONqoT6FgmVob9Cl54AUsCg/rrGMU5AgGuJACIJb8dGtTJhtRY2tBZL5Jk48jsvWTTJdKFWqFPduBJ2QrYug0CvgdAjLGgf4U1kWOZkXy19SsSdiSEcN4lIKsCMJQyw/Li+IBjGuU8wen0Dlh5d7FwNjRoic5MNlqgMMM7LhMQu2EijkzcsFGerFqbV9somRmeMTuhqMIYUKaQj9+CbVaxVk9pl092zdNT2aB3JbKaHtCnV+IM/H9iAk/PT2oj0URNYUSn1dAu7yIftvkcq0wKt4whC7xHM9gtVKxyPcGykiGQPF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSi0MD6oXxZ7uBC7xTOyeBE4Fqcf0g3bSjWr9PLSTjU=;
 b=qq3RfAJwaxPgIrxbCu1gXLhxqjW2HE5CeZOIojZLv8nV+iMkIy1LcRaVUtwXhjXxJCW0Z2bP7aSuv69LNqYPwh/TUcmhYI/5KYr4v//eHZmTOWA7Eg9xzazs7ksS/kC5oJWNWnv4LsCbgMvMUG8RJBsmfEGUWCrSxxb2b8sPUKJfSKHA6VaWTZUNrO1bhZAJygsNEeBA2iLe1letnECxYIb/hjhFVSSxo29Q6XXZi7b/WhFrTI6aq8drXrTAbNE8QxjGWdAxqHAnFJXwVD+1L4MB/QRg3yXo02UNGabdO166RR/IQ6iLxOiNoxdmQxGIhZUw9Ip3vaYu1VrBecBUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSi0MD6oXxZ7uBC7xTOyeBE4Fqcf0g3bSjWr9PLSTjU=;
 b=TQntVCVWFJ/LpF/K48OKC6/gYSLXcMS7OMkszdwVdCIChpVAZhFX6qEqabsM4G1tcvd5D1FWhEoq/aZ38J+cuhnttVjRZFhdaPWcXEc0NTtjp/EXGNK44Xti4sDMOEgDpUlZT+9vil4LVFch2JKTOJArrXbQiHvqx5B6Gb3t5kZ6CoI+WnK1cF00HYiOxdogalM9Fa0knfBYpk93hyxKtcjfdNgKcxisDd3ftuWrg4N/zDWbbe+8KTkQ5JpCl0kOpbadbTKBxE0/H5VP0pm5dp3SkewpW5+BsMMmUgxFgEeeShsMrtNKRjHnoBJXWFQH8SNyN8+ffRrOnb94TKjXsA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 1/7] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH 1/7] xen/arm: allow PCI host bridge to have private data
Thread-Index: AQHbhp0ONBPLb/SsAUOQ1aj0su174A==
Date: Mon, 24 Feb 2025 09:18:24 +0000
Message-ID:
 <4a09aafdb34784340c426c0199f8a290c0d204cd.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: a80e7b87-1b9f-42d1-3acc-08dd54b4308d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4ONhxi+pfJw5stFxW1VCIVlzPtnPzdo3D/J9qcvkjAU9Q6NVvynT7Hvh2T?=
 =?iso-8859-1?Q?SF4vF5dLy9xwE76JDHGU8bdXs0b+aIBvBomt0xlalo+5zWgG+SvfzsVo5p?=
 =?iso-8859-1?Q?3ggbatBpsfAagvBA6YXFf33RKdgbrO+Bf88WkZ5ShCDkhIfRR4hBuCjO3D?=
 =?iso-8859-1?Q?kSepElGAAdh8SeIoKNIdb91FlNMWPr5eGPDhB4+TNz6NzV5ds5ISZBXqe4?=
 =?iso-8859-1?Q?RfQIkwQSr1WSONEcggsy27U3Lp1VamlqJV0rujGNPeFqqCiNKL0dJrAkfC?=
 =?iso-8859-1?Q?XaLUI2F3/ck1lzJsEucC+NaJMpdPfLjzt5KNCi8mZ4vB7e1ggqpnYd4wIm?=
 =?iso-8859-1?Q?y0oJm9fgCXilF3d5CqebaNBZ9NXWj8ZvmnCsDuLXV8iuZNUQDWm/iT5mR+?=
 =?iso-8859-1?Q?jVY9yFMfpYXLwVejDX8dw8CQWgv/OiE7ozSP6n6qO6r5l18hNeBjsOs4Dx?=
 =?iso-8859-1?Q?lA3IWJlUD0nXFXzc9IPlhLUn/lEgUpo8O17V33vyFnK5qFf8UACuqqlOBi?=
 =?iso-8859-1?Q?5lIcGOkuNmGZBubheE11Yt2eItbHUao/j0WqrG0vhSmM8ZdPwKvkrRReIK?=
 =?iso-8859-1?Q?soztafHLgXFesWa9u4ihMS/1m9PKkIbzf/xOFxYNsi0g0tCEgJI67fL6FS?=
 =?iso-8859-1?Q?CAUeOuEkAqvApDzJNRQ/eYXIKrdAcZH8SamOu2s5hfBkMWDjH4Tc21csvC?=
 =?iso-8859-1?Q?c1ZhGLVIC+Uk7c4KDe37nO55ir6M78fBgdHuRP0kP9rjkNPuVhHkn8hWr/?=
 =?iso-8859-1?Q?TUL0p1l3R1Z1BN655fUH2su8RXhJ/3/rKsJyKnVdmsK4wApeOB3ARUq358?=
 =?iso-8859-1?Q?QIqeNNuYdEBtgEDJykn0B0UXb6x3Qs/xza4zbezJcDYw6obTADcWXUm4f8?=
 =?iso-8859-1?Q?5vWRF6pj/HbdNR7hrPGtziOpe9P/jXHg4BSfJqQQ4vWGGRc2iW9IUsMhWD?=
 =?iso-8859-1?Q?HUMG6DU7MHa+j0GB/C6dLpQhJ7ze4kgG9yDAK3VJb+kiEQLrAbz5LF4uXf?=
 =?iso-8859-1?Q?Lzi6r/Lx+gro3A4E5zKpo6DH31G+ul8Z1sllvVgk2LQW+LVcMyv6TakJjw?=
 =?iso-8859-1?Q?VGYMnxn6QwrEeKNVLeh2Hsi9iVrquxGx+Yff1EvuIhhOHJ52qjVe4l2rt6?=
 =?iso-8859-1?Q?GtFAau80/XqSlYl7g+RmMFqzJb4PwIgnrBolpp8kJDZN1g3GLgJfmmLaWc?=
 =?iso-8859-1?Q?6GlkXKpnWWMHw7gA0GkmP4HFthGCFuEOL5HKgMSf4gzCRW5ll1WmMc+lfZ?=
 =?iso-8859-1?Q?//hy9wMUdc6EoF5WBT6No+Lmu2th07npUaL9C4tlX1VwouK2WVqi2XGF0v?=
 =?iso-8859-1?Q?NC272I2FZNCXsFnAqRU+E/jYFAZAr0KlO5xTcuBfK5UlM0nZK+dRBxSX3T?=
 =?iso-8859-1?Q?XSchLMrDQ89+v5+JHjvac4rc9dEaC2/Wf1HkAIpD+4thmn1gly+/rk3h4c?=
 =?iso-8859-1?Q?sz4BvQHxVr//4nvqDV2zoljzB+XjA5a0Uwglj0y5KPpShTBKS7T/xxnE7V?=
 =?iso-8859-1?Q?vXUhc0kxj52J/Wp8N3IqDR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ydB7NXBDJR2VEMA13leul8ZmGLEQ8p8S3cCDPnW+g4D74jigcmPsVEJUwe?=
 =?iso-8859-1?Q?LQOvm1OoZXfdk1rmEAHHc877pKHR9XeDgMdLmM4OGYet+fJmsV3tbcGGBN?=
 =?iso-8859-1?Q?iw1QMcXrLecdR2oUccYl23hu5F3nylm1Nk1tTV19R8Py6fyDU5z+Ekl9oO?=
 =?iso-8859-1?Q?04fj5Chmd9a2a0NIpOHoETtc+DjzmxTmm9MlGAf0K/RjvxF1zrsE9X3qvD?=
 =?iso-8859-1?Q?DrHGKnOrjhKysLNjYAE04vJp93EMFV/tZAk5qWVB+OYN492Oo8pt4TGEqk?=
 =?iso-8859-1?Q?Z6xnP1pKKm8fo2CD0ZjD3Es1GYT5Im/T2GSjJ3fn65oes1vanOUAKXauPv?=
 =?iso-8859-1?Q?SW2pR+cRqWzHdsRj4u8/gxA0ALSMGHkZV0Xol0UsIrxh5+XHUNHbP6W/aM?=
 =?iso-8859-1?Q?vwstTTqP70IFf6mfgFXrXxUKy6sA/gUuuJfvOc2FOpybcIy/e3V9MhAhJ3?=
 =?iso-8859-1?Q?p5LQ9lH+en1IX6Oo/B9xh6RkDTmJq9SGLrcEDXxqu5J5SA+03x+L5wYAqK?=
 =?iso-8859-1?Q?Ysor39jUbEmTapgi1lj5pOv0R2IMh0cglXiHWQi1ZHfavH3Iw7pRUhfXWz?=
 =?iso-8859-1?Q?hJWXOgA/u3WjFyfVt8gp/EamSfDiIE+KUuKkS7j9SSI3laKLsUbG26W9Os?=
 =?iso-8859-1?Q?MbuWluUUjoGdD9LIZnJTKHeGKEmSFHA66uLN3m2AIM5HJVDh32bL0JmhfC?=
 =?iso-8859-1?Q?YlIYHD+XCcRLuSpo1KYvVwPBWJswj6WAnn+X8McKro2AxQ4B4z/zbLdE+5?=
 =?iso-8859-1?Q?l1rktR8mEV/M1hhEadW51znXYsr/FHTm4q3nV/A/RWz6Y5N7kwNgTX1Mdh?=
 =?iso-8859-1?Q?VUUCEfm2qT1DwmLq6K4gp602tGxWvaf+1OuJhIWO1fYiHXLuwC1En1D+Rl?=
 =?iso-8859-1?Q?xtsZD88vOqmW+f9cYHPevrcBc9qUw6y94t5FBth1xiV2lfrS9bVTKQNuF7?=
 =?iso-8859-1?Q?K3ibyDjH75TTwFwY3Ip9rseSG6PD78L11/jvnT7SdXvYf4yEFMdIUwoksx?=
 =?iso-8859-1?Q?f40L+bNP8KMgv8yRLLH7KWVu7ItNwR/yDtHLnQWwIi/Fb57a46QEKGx4So?=
 =?iso-8859-1?Q?avpkOeMoayo+FBNsjjQZrmOkrVCU+JDof7WxH/xmZDM6MaWL2ql2AGLhLS?=
 =?iso-8859-1?Q?n0GfqGgm7Xj1WqQpStjpAnL/D7e7yev3yLOi3VERqPKAmAvWOoZmjTGB3h?=
 =?iso-8859-1?Q?D7/KWpTS6Abi4UeaaQRBGddxlfy+K+aGDmqEIbsVDpAw/9dOU8nU3rpgd2?=
 =?iso-8859-1?Q?zQFMQiVXGo4XLKUdyGuX/V7q91sAoOAwP3aX1Cvxa+TnDBZdPg+uSUoX3m?=
 =?iso-8859-1?Q?H6hoZr5tUzY1ouxOe377UjarZUcN3qlatcTcBYNcs4MXKHK9wHW00EdZG0?=
 =?iso-8859-1?Q?dPywlDJEsjOQRTKfzXGj9BNqmg39GPNK85jagmOkYNxNt2UKjhJBYlCjmP?=
 =?iso-8859-1?Q?U7Cjrax1heepE2kcRikuT8upnGTnBkYk+ryTTnqOxxJJWsdGJlNsGlJj4O?=
 =?iso-8859-1?Q?ozQvSABxbX6v8HCj+38yUUTgR+NqTFL/rSHoeMQnxUpFCNKZ/hdl10kKDS?=
 =?iso-8859-1?Q?ZKHFqgNpjBQsB4XSLcouIL8tK8lw8mhTEmHrKv0ZPXaL5J/LvA+rAIA9z+?=
 =?iso-8859-1?Q?FhvfRRAWlD20pGP6xDEhlpZnULQKh5725f6ekJ3ZvDWeNXFYge9HahIg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e7b87-1b9f-42d1-3acc-08dd54b4308d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:24.1778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8FHnXhDm6ndViyB1N7ykzBB2K5juWqH2o/m/6pnw+iDVpEK8Gn50Hg4pS51Rp/QmHFzvm0j6JNTSnKrnhY8yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Create a generic
approach for that, so such bridges may request the private data to
be allocated during initialization.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/pci.h      |  4 +++-
 xen/arch/arm/pci/pci-host-common.c  | 18 +++++++++++++++++-
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..44344ac8c1 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    void *priv;                      /* Private data of the bridge. */
 };
=20
 struct pci_ops {
@@ -95,7 +96,8 @@ struct pci_ecam_ops {
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
 int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops);
+                          const struct pci_ecam_ops *ops,
+                          size_t priv_sz);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index c0faf0f436..be7e6c3510 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -209,7 +209,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
 }
=20
 int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops)
+                          const struct pci_ecam_ops *ops,
+                          size_t priv_sz)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -241,11 +242,26 @@ int pci_host_common_probe(struct dt_device_node *dev,
         printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in D=
T\n");
         BUG();
     }
+
     bridge->segment =3D domain;
+
+    if ( priv_sz )
+    {
+        bridge->priv =3D xzalloc_bytes(priv_sz);
+        if ( !bridge->priv )
+        {
+            err =3D -ENOMEM;
+            goto err_priv;
+        }
+    }
+
     pci_add_host_bridge(bridge);
=20
     return 0;
=20
+err_priv:
+    xfree(bridge->priv);
+
 err_exit:
     xfree(bridge);
=20
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index 46de6e43cc..cc4bc70684 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
+    return pci_host_common_probe(dev, &pci_generic_ecam_ops, 0);
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 101edb8593..985a43c516 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops);
+    return pci_host_common_probe(dev, &nwl_pcie_ops, 0);
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

