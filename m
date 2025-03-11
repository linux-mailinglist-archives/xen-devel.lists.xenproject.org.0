Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E4BA5BDCA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907710.1314926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnN-0004gf-O9; Tue, 11 Mar 2025 10:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907710.1314926; Tue, 11 Mar 2025 10:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnN-0004dj-JL; Tue, 11 Mar 2025 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 907710;
 Tue, 11 Mar 2025 10:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnL-0004Ad-Am
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18775ae7-fe63-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:25:04 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:57 +0000
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
X-Inumbo-ID: 18775ae7-fe63-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVf9uHGn1Ix594wsdxCluf8N0h3k68frzXVvOV60SbN+Z9+M7KEaoCj7U7m2AzP9Gzfq0a1vPgLfJjLv5iXvkBv2D8Za9eXerHcAipLLdXYt5d8xiSqyoqpRegHE5sDq/YAt7bIQgAjFnGIL2so0rtRzsitq4KSJUPKvy+yCFXRarwhIs8pvPX1Osef8h/H47fXXWJoE6AKvqBdMVyKmdZ2GDl7ft+4AGl5xkwsw/j8RlRh5Mj++R2zVROcjOELDiG32dmUH7ryW43A1MyBMkIo3KY8u/GB3VvLwhanyYflzY7JsfMgAAZeaCEJln8urYGfXe+zZXJvsP2F3vuSoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyHZMwviRPs2B56PeLbsS5Kw9TWI8ewMWJDEvHSaFZQ=;
 b=nVAcnC3CTtBBOBKWVAzoBW+cn3mH1ZVVuHpeNYgRNP/cHqWr04czNk5ZmsSPgMK+he+7BISqvW6Xs+h6qzDDA7g96Eyc+Fhbm90RXFsTWPixfRLk2A0U5xcp0SyTKFfMUdaaiXKkUKym5Jk9WbKN4ecaoME49k54+HQT4Kj+lqxXCrhAx+55MIUX55/d4sKRDV1VfVdlCb2B86o4Rr+66Y6NZyhd3md8hfZrV/n+/WNdUHH4QtjBDqgilF7AeJzoNUPJ86mHxLw/2pg4J1QmF0PY0BBEt7O+9Kq61jkMax1mIHGVHQcbRzmliU2tdS5XgK0paQDbf7Sg7NFWQ8s+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyHZMwviRPs2B56PeLbsS5Kw9TWI8ewMWJDEvHSaFZQ=;
 b=vEY9MWr7BROggtGEA0ITCGsCvZhD+ykwbvANU/xyokhFY7z78SLYpuYGg6SWzYHZlzVlxbWlGZUsXgywBal22OEjsOZZVssZS7exGJnsYkFPs1klU9VDgT9xvv4g35FD7xvMX7bp5xc+b9GVpwg0a8BsohnN3ctlbi5oXz3jPR5a5MQVOAuxDYcD4HMMP4o2Xvq5KShX46ut1af9MihI/Hk2uI4T7LWewhjOB1zHrasdQs1DpOx2f+4wUsg5bdkVnOmL+r8as4Dx2eIkoYDIIs/ZLw0sZMDmqeaYU2+LQqqdeO1AG9qZPBK75vQ0ykmwYvL0emE1QhaToC2PyhXwHw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v2 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbkm/VSYy4W40IyEij9LnAcCxWMg==
Date: Tue, 11 Mar 2025 10:24:56 +0000
Message-ID:
 <2c03ffb2c7cd20b8a6a5a54098cc6e99e8d4a8d3.1741596512.git.mykyta_poturai@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741596512.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10646:EE_
x-ms-office365-filtering-correlation-id: b5b28693-35cc-4407-c62a-08dd6086f8d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZW7xYj6z7So4qC7hMIAGuJG+DTT8RgSLWYNb1TjQzzRF/Jrn1T/7SG8L6/?=
 =?iso-8859-1?Q?IgSB2c3AvSOdX5HxiNdpX8JLEbbH4UAmE3+U3QHnuMLukNU+nqtaCu+EqE?=
 =?iso-8859-1?Q?Czw0iSSreCbUZraBHhgBPwTsuQ41EgrrFd0cuP3zIlqukwYyl3wJ11hWLq?=
 =?iso-8859-1?Q?C8zSrPUjT+o59BG0oPKCZjZ3hq2fU51VwAci0RhI/AS26CNgW53Dv401jy?=
 =?iso-8859-1?Q?euI3id/SFnEa/rA32k8XsqltJFUIK9M6+OPWm9mC6IZKcuGnh528c8SJ0p?=
 =?iso-8859-1?Q?cX7jfga+9TcLkt+rzNSjOK8Gt4nZ5xncPXQwaADg1KChwj9DeiL4lcHWiN?=
 =?iso-8859-1?Q?v39VemoCi1AmUJDNoii4rwhnqpWOpAGTECCZS/qOIEBwN3j/rUi96c0+zI?=
 =?iso-8859-1?Q?fhmztWcVhZdojcNlw9TTtJKKGAHGHx78RinWtEbzc133fR0ryuos7xSi4l?=
 =?iso-8859-1?Q?E6QXodkE9eGKX85+WNUswr/IF1QBAVMvEtwqlgb3UjHcJbknYzcDjA7naP?=
 =?iso-8859-1?Q?ND4kW3faKc1ojsJw/xbMPhtq7KqCtnYD9dwGl4zMSQHcMvM8FJj5yZC43N?=
 =?iso-8859-1?Q?xk1NiKSaiYcYmBVy6giIC+xN/52mL2OYbVIBwg6KU/EBQrsGuY+IfZyNfq?=
 =?iso-8859-1?Q?BSAnFOmGt3DoUiUw3yop2Rk/RmeYSG/V9xOYTxDH3gOqcTwh17zsERH706?=
 =?iso-8859-1?Q?Y44OaK2rhNNbXi0me1yL+DB7Gw/vvHxXn3VLxCzG792pLXy5RrvYQluen/?=
 =?iso-8859-1?Q?ZLBSPv67JerRpgHdPY4ZGlGPLRudiMMnXNGoxjBn7XiHVcx0VOmx+9EVGV?=
 =?iso-8859-1?Q?GqWgsZwwj3bjr8b0XiG/YBQ87CHMnorVMBM4DH48fmcv5xMM3/c73gqDhT?=
 =?iso-8859-1?Q?yr2eECdBN4z6cbSz5VosLYEWrI/kH31QhAUgGgkdCmDwR8Ao6sbUt6UKXC?=
 =?iso-8859-1?Q?mA5U2JlZzEKp2aswbl/GElam9zJ8hxI6OySSM45fYBEOt+TJ4ioL9tkSFG?=
 =?iso-8859-1?Q?xwm72mlPWsIZ4QXuVH/skmWlLtzqK/G1Ci/2errv9L/DrFEfgYSUuTOypQ?=
 =?iso-8859-1?Q?kF8J3xhPxjug40JNlXoYYpsVR4mWw+dR2Gn3BUYszYniwGE5agkx1p7iIX?=
 =?iso-8859-1?Q?bZOzkOo0SkjDtWiwt0hZE81Q8dLFgJbBF3Z2ohxRW3RD4pdZF+p+5xs1B6?=
 =?iso-8859-1?Q?+c9wK6C9JIh1Y9Hzd/TrUDZIzAnuCESWVDp6qOCRJSgKZTRHeiL96qv31u?=
 =?iso-8859-1?Q?G2K2TM7Tf085BFAbad4nDAJYAR77Zivag/z0cB8GIpgor7ZKvF3p3pb2cq?=
 =?iso-8859-1?Q?FBJPyzJ5xE23vPAllA57DvPrdgQp7NDe4mbiffSwclzChnWUIWfSTgeRmc?=
 =?iso-8859-1?Q?n3f9EH+bv5XZnHjL8Xh5DCwszBF1z7PGl0nY0P2sXvkqr9DpOLnkFEKeAh?=
 =?iso-8859-1?Q?OGTXue8VMIukZXAzjjtMRuCANMuZjJ/c5NfwMQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y2A2V0nnZGMq9Bc2h0zIEG2KzvXAmWzr514qwbxF4mF1K0cNjfZoNALScY?=
 =?iso-8859-1?Q?3NCQr+tCyTcESBKN7kVd0+pebBUF2cHFTvYSwOjBzJxqT40E1U3rT+6vsv?=
 =?iso-8859-1?Q?qXnaTsn2cwXhKxhpC15IsvTaI5j+6MP9E9QF+UQ646SUVf1klpUa8m9gVd?=
 =?iso-8859-1?Q?jE/YU3OhQHMt3cfEwaoVkIhO1974UqRJglakCLTMnTt5Kf/Qa6YcvXKD95?=
 =?iso-8859-1?Q?Ql0Vjwpd2EcNS0FhcvrNWDPpTqJc5bq+8XWZGSGFIDsjuvJQ0zbdmDJQCE?=
 =?iso-8859-1?Q?VqAwAjhNZ1oBW1f/q4EYPwmLTsBgTMBV6PHh8D/C4U24mzFWN4G3PsRZ9E?=
 =?iso-8859-1?Q?vuRPxBlNZ8jjaOIMncDK49X3r0AnqIYWl6BKHhRwRV6/0Q+cqqIfspsWvY?=
 =?iso-8859-1?Q?j7zn5oX4Rz9nRadlZQebWWogtY3gRwxSWKwP5DMK5hoGquEuMQ7yFi6bmE?=
 =?iso-8859-1?Q?epgjSeWRoV4oZmlPefd2U+b/goqiL80y/MrJhWdV+Bb8qOhuyTWiOs/W7X?=
 =?iso-8859-1?Q?0M3qp4Fk2hhYHKtsNMjjvU4qiVtqFbffAqwU+rCqlrS/aDtTGrjZlyF1us?=
 =?iso-8859-1?Q?Ssf4oACB2AfrLp4oizRvDXBWW1kKbYjL9yidoRpS4z7ThHBOIqO89w4q/0?=
 =?iso-8859-1?Q?3GODDG45R0Qnn9uyP1ZwkCahoMxoLymBlAuZKL9T7sGPC4oZtjINBkAOhE?=
 =?iso-8859-1?Q?C8Ivho2RSEEURsa/FWPwIz+y6gLrnOBU1z1da7NLEKrVk66tscPm7b4iHr?=
 =?iso-8859-1?Q?8yqff9z6PDYThdS9SCoywwVQxBJTPaABSuj0JKP23fKSFRZCv8B21Cvibc?=
 =?iso-8859-1?Q?EGWbKNy/rqVV8PDkLp3MPqxYdZSzwRZIk6ohHW4aDwelt4Xugu1jJqBuwM?=
 =?iso-8859-1?Q?N7+LV1bbQ5/nJYF+W6I+QwlZ+m3ZTLaPRZr1IAV4DUrgPgYo3ktZ6JIgFu?=
 =?iso-8859-1?Q?kabgIpe/bwIUre47Fhcma1uAkCDEJw65ZhRRvUOiJDgmLiIs/cONiev7ty?=
 =?iso-8859-1?Q?Wx7ogVaHNRhND9uI9wjaWyeWNQ8vxLPqSaHTCYgBqOr131WzWeeOb77pD3?=
 =?iso-8859-1?Q?IfIfPnEEIkagL1fgzTmeWZP9tn3q49S15plWDCdUDIuhT7QoRcMekRSLRf?=
 =?iso-8859-1?Q?1MyeCqCLgpmgJc7RxmkLiZPuh7AVkR79ywZlSKIboB2es7jMp2NVLblBRW?=
 =?iso-8859-1?Q?V3ElenRIMrQN7Cu8aoLlbGFjEToxUHxcRjcKBLYxPT+ge6zCpX2JxpsYq1?=
 =?iso-8859-1?Q?xl8zIKSDHMx9cHt37zG7stO0ZGcyiLbeX+7ePx+5b3qokR04RsjLuvF/dW?=
 =?iso-8859-1?Q?AeBPHeJ/LDRnMnh4zJGTmGTWUhYxnYDQaxmoph9Hjh9WSwFSspxmxrVAaz?=
 =?iso-8859-1?Q?DreBCeUZ3vERZv4swJB3xJuw9jYQO+NZAWq3Tar8sNvRJD8n06LFULolv5?=
 =?iso-8859-1?Q?DXWDxXOMT/8WCBtPhYHpS5FJNpazkVoAt2H8TVya8Alr4YgHNlopvym1mY?=
 =?iso-8859-1?Q?OlDDEfsEu3RnCGw8joOXPebBvXEMZrQzvcqqPT9QIafzFSTIrfmbficNSY?=
 =?iso-8859-1?Q?6hKdaDKqV9UGBz/XfVajU5vXLT5XwbfFu5/h7LFC/gcu9C475bcAyYD6sA?=
 =?iso-8859-1?Q?fu9F92+2pvA6eEE/b2CAg/pgRMp+0KYsN3dlpdBOmJ/1qVkFFj9OqFCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b28693-35cc-4407-c62a-08dd6086f8d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:56.4411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sskKSdAF1ah7SfxsKrLz7CgDg/iui4vpsyUb9JifQKKzbb+a2ZgoUJqEUiEXKyzWU8hLkm8mdSK++p3oxr1Xmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller, specifically
targeting the S4 and V4H SoCs. The implementation includes configuration
read/write operations for both root and child buses. For accessing the
child bus, iATU is used for address translation.

Code common to all DesignWare PCI host controllers is located in a
separate file to allow for easy reuse in other DesignWare-based PCI
host controllers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* move designware code in a separate file
---
 xen/arch/arm/pci/Makefile         |   2 +
 xen/arch/arm/pci/pci-designware.c | 409 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h | 105 ++++++++
 xen/arch/arm/pci/pci-host-rcar4.c | 104 ++++++++
 4 files changed, 620 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index 1d045ade01..ca6135e282 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -4,3 +4,5 @@ obj-y +=3D pci-host-generic.o
 obj-y +=3D pci-host-common.o
 obj-y +=3D ecam.o
 obj-y +=3D pci-host-zynqmp.o
+obj-y +=3D pci-designware.o
+obj-y +=3D pci-host-rcar4.o
diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
new file mode 100644
index 0000000000..6ab03cf9b0
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -0,0 +1,409 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/delay.h>
+#include <asm/io.h>
+
+#include "pci-designware.h"
+/**
+ * upper_32_bits - return bits 32-63 of a number
+ * @n: the number we're accessing
+ *
+ * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
+ * the "right shift count >=3D width of type" warning when that quantity i=
s
+ * 32-bits.
+ */
+#define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
+
+/**
+ * lower_32_bits - return bits 0-31 of a number
+ * @n: the number we're accessing
+ */
+#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffff))
+
+static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    if (size =3D=3D 4)
+        *val =3D readl(addr);
+    else if (size =3D=3D 2)
+        *val =3D readw(addr);
+    else if (size =3D=3D 1)
+        *val =3D readb(addr);
+    else
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static int dw_pcie_write(void __iomem *addr, int size, uint32_t val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    if (size =3D=3D 4)
+        writel(val, addr);
+    else if (size =3D=3D 2)
+        writew(val, addr);
+    else if (size =3D=3D 1)
+        writeb(val, addr);
+    else
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge,
+                               uint32_t reg, size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+
+    dw_pcie_read(addr, size, &val);
+    return val;
+}
+
+static void dw_pcie_write_dbi(struct pci_host_bridge *bridge,
+                            uint32_t reg, size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+
+    dw_pcie_write(addr, size, val);
+}
+
+static uint32_t dw_pcie_readl_dbi(struct pci_host_bridge *bridge, uint32_t=
 reg)
+{
+    return dw_pcie_read_dbi(bridge, reg, sizeof(uint32_t));
+}
+
+static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    dw_pcie_write_dbi(pci, reg, sizeof(uint32_t), val);
+}
+
+static void dw_pcie_read_iatu_unroll_enabled(struct pci_host_bridge *bridg=
e)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    uint32_t val;
+
+    val =3D dw_pcie_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
+    if (val =3D=3D 0xffffffff)
+        priv->iatu_unroll_enabled =3D true;
+
+    printk(XENLOG_DEBUG "%s iATU unroll: %sabled\n",
+           dt_node_full_name(bridge->dt_node),
+           priv->iatu_unroll_enabled ? "en" : "dis");
+}
+
+static uint32_t dw_pcie_readl_atu(struct pci_host_bridge *pci, uint32_t re=
g)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    int ret;
+    uint32_t val;
+
+    ret =3D dw_pcie_read(priv->atu_base + reg, 4, &val);
+    if ( ret )
+        printk(XENLOG_ERR "Read ATU address failed\n");
+
+    return val;
+}
+
+static void dw_pcie_writel_atu(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    int ret;
+
+    ret =3D dw_pcie_write(priv->atu_base + reg, 4, val);
+    if (ret)
+        printk(XENLOG_ERR "Write ATU address failed\n");
+}
+
+static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
+                                        uint32_t index, uint32_t reg)
+{
+	uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+	return dw_pcie_readl_atu(pci, offset + reg);
+}
+
+static void dw_pcie_writel_ob_unroll(struct pci_host_bridge *pci,
+                                     uint32_t index, uint32_t reg, uint32_=
t val)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    dw_pcie_writel_atu(pci, offset + reg, val);
+}
+
+static uint32_t dw_pcie_enable_ecrc(uint32_t val)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
+                                             uint8_t func_no, int index,
+                                             int type, uint64_t cpu_addr,
+                                             uint64_t pci_addr, uint64_t s=
ize)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+    uint64_t limit_addr =3D cpu_addr + size - 1;
+
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
+                             lower_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
+                             upper_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_LIMIT,
+                             lower_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_LIMIT,
+                             upper_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
+                             lower_32_bits(pci_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
+                             upper_32_bits(pci_addr));
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D upper_32_bits(size - 1) ? val | PCIE_ATU_INCREASE_REGION_SIZE =
: val;
+    if (priv->version =3D=3D 0x490A)
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+                             PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for (retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
+    {
+        val =3D dw_pcie_readl_ob_unroll(pci, index,
+                                      PCIE_ATU_UNR_REGION_CTRL2);
+        if (val & PCIE_ATU_ENABLE)
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
+                                        uint8_t func_no, int index, int ty=
pe,
+                                        uint64_t cpu_addr, uint64_t pci_ad=
dr,
+                                        uint64_t size)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if (priv->iatu_unroll_enabled)
+    {
+        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
+                                         cpu_addr, pci_addr, size);
+        return;
+    }
+
+    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
+                       PCIE_ATU_REGION_OUTBOUND | index);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE,
+                       lower_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE,
+                       upper_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT,
+                       lower_32_bits(cpu_addr + size - 1));
+    if (priv->version >=3D 0x460A)
+        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
+                           upper_32_bits(cpu_addr + size - 1));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET,
+                       lower_32_bits(pci_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
+                       upper_32_bits(pci_addr));
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D ((upper_32_bits(size - 1)) && (priv->version >=3D 0x460A)) ?
+        val | PCIE_ATU_INCREASE_REGION_SIZE : val;
+    if (priv->version =3D=3D 0x490A)
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for (retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
+    {
+        val =3D dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
+        if (val & PCIE_ATU_ENABLE)
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int ind=
ex,
+                                      int type, uint64_t cpu_addr,
+                                      uint64_t pci_addr, uint64_t size)
+{
+    __dw_pcie_prog_outbound_atu(pci, 0, index, type,
+                                cpu_addr, pci_addr, size);
+}
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+
+    priv->version =3D version;
+}
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                         pci_sbdf_t sbdf, uint32_t where)
+{
+    uint32_t busdev;
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+        PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                              PCIE_ATU_TYPE_CFG0,
+                              bridge->child_cfg->phys_addr,
+                              busdev, bridge->child_cfg->size);
+
+    return bridge->child_cfg->win + where;
+}
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge,
+                                   pci_sbdf_t sbdf, uint32_t reg,
+                                   uint32_t len, uint32_t *value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    /*
+     * FIXME: we cannot read iATU settings at the early initialization
+     * (probe) as the host's HW is not yet initialized at that phase.
+     * This read operation is the very first thing Domain-0 will do
+     * during its initialization, so take this opportunity and read
+     * iATU setting now.
+     */
+    if ( unlikely(!priv->iatu_unroll_initilized) )
+    {
+        dw_pcie_read_iatu_unroll_enabled(bridge);
+        priv->iatu_unroll_initilized =3D true;
+    }
+
+    ret =3D pci_generic_config_read(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr,
+                                  0, bridge->child_cfg->size);
+
+    return ret;
+}
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t reg,
+                                    uint32_t len, uint32_t value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    ret =3D pci_generic_config_write(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr,
+                                  0, bridge->child_cfg->size);
+    return ret;
+}
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                               struct pci_host_bridge *bri=
dge,
+                                               uint64_t addr)
+{
+    struct pci_config_window *cfg =3D bridge->child_cfg;
+
+    /*
+     * We do not want ECAM address space to be mapped in Domain-0's p2m,
+     * so we can trap access to it.
+     */
+    return cfg->phys_addr !=3D addr;
+}
+
+struct pci_host_bridge * __init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops)
+{
+
+    struct pci_host_bridge *bridge;
+    struct dw_pcie_priv *priv;
+
+    paddr_t atu_phys_addr;
+    paddr_t atu_size;
+    int atu_idx, ret;
+
+    bridge =3D pci_host_common_probe(dev, ops, child_ops, sizeof(*priv));
+    if ( IS_ERR(bridge) )
+        return bridge;
+
+    priv =3D bridge->priv;
+
+    atu_idx =3D dt_property_match_string(dev, "reg-names", "atu");
+    if ( atu_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\=
n");
+        return ERR_PTR(atu_idx);
+    }
+    ret =3D dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
+        return ERR_PTR(ret);
+    }
+    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n",
+           atu_phys_addr, atu_phys_addr + atu_size - 1);
+    priv->atu_base =3D ioremap_nocache(atu_phys_addr, atu_size);
+    if ( !priv->atu_base )
+    {
+        printk(XENLOG_ERR "iATU ioremap failed\n");
+        return ERR_PTR(ENXIO);
+    }
+
+    if ( !dt_property_read_u32(dev, "num-viewport", &priv->num_viewport) )
+        priv->num_viewport =3D 2;
+
+    /*
+     * FIXME: we cannot read iATU unroll enable now as the host bridge's
+     * HW is not yet initialized by Domain-0: leave it for later.
+     */
+
+    printk(XENLOG_INFO "%s number of view ports: %d\n", dt_node_full_name(=
dev),
+           priv->num_viewport);
+
+    return bridge;
+}
diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-desig=
nware.h
new file mode 100644
index 0000000000..f00ebc6be4
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -0,0 +1,105 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/pci.h>
+#include <xen/init.h>
+
+#ifndef __PCI_DESIGNWARE_H__
+#define __PCI_DESIGNWARE_H__
+
+#define PCIBIOS_SUCCESSFUL              0x00
+#define PCIBIOS_BAD_REGISTER_NUMBER     0x87
+
+#define PCIE_ATU_VIEWPORT               0x900
+#define PCIE_ATU_REGION_OUTBOUND        0
+#define PCIE_ATU_CR1                    0x904
+#define PCIE_ATU_INCREASE_REGION_SIZE   BIT(13, UL)
+#define PCIE_ATU_CR2                    0x908
+#define PCIE_ATU_ENABLE                 BIT(31, UL)
+#define PCIE_ATU_LOWER_BASE             0x90C
+#define PCIE_ATU_UPPER_BASE             0x910
+#define PCIE_ATU_LIMIT                  0x914
+#define PCIE_ATU_LOWER_TARGET           0x918
+#define PCIE_ATU_UPPER_TARGET           0x91C
+#define PCIE_ATU_UPPER_LIMIT            0x924
+
+#define PCIE_ATU_REGION_INDEX1  0x1
+#define PCIE_ATU_TYPE_IO        0x2
+#define PCIE_ATU_TYPE_CFG0      0x4
+
+#define FIELD_PREP(_mask, _val) \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), x)
+#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), x)
+#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), x)
+
+/* Register address builder */
+#define PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(region) \
+    ((region) << 9)
+
+/*
+ * iATU Unroll-specific register definitions
+ * From 4.80 core version the address translation will be made by unroll
+ */
+#define PCIE_ATU_UNR_REGION_CTRL1       0x00
+#define PCIE_ATU_UNR_REGION_CTRL2       0x04
+#define PCIE_ATU_UNR_LOWER_BASE         0x08
+#define PCIE_ATU_UNR_UPPER_BASE         0x0C
+#define PCIE_ATU_UNR_LOWER_LIMIT        0x10
+#define PCIE_ATU_UNR_LOWER_TARGET       0x14
+#define PCIE_ATU_UNR_UPPER_TARGET       0x18
+#define PCIE_ATU_UNR_UPPER_LIMIT        0x20
+
+#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
+
+/* Parameters for the waiting for iATU enabled routine */
+#define LINK_WAIT_MAX_IATU_RETRIES      5
+#define LINK_WAIT_IATU                  9
+
+struct dw_pcie_priv
+{
+    uint32_t num_viewport;
+    bool iatu_unroll_initilized;
+    bool iatu_unroll_enabled;
+    void __iomem *atu_base;
+    unsigned int version;
+};
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion);
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t where);
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge,
+                              pci_sbdf_t sbdf, uint32_t reg,
+                              uint32_t len, uint32_t *value);
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge,
+                               pci_sbdf_t sbdf, uint32_t reg,
+                               uint32_t len, uint32_t value);
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr);
+
+struct pci_host_bridge * __init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops);
+#endif /* __PCI_DESIGNWARE_H__ */
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
new file mode 100644
index 0000000000..f6ae3c5685
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,104 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/pci.h>
+
+#include "pci-designware.h"
+
+#define RCAR4_DWC_VERSION       0x520A
+
+/*
+ * PCI host bridges often have different ways to access the root and child
+ * bus config spaces:
+ *   "dbi"   : the aperture where root port's own configuration registers
+ *             are available.
+ *   "config": child's configuration space
+ *   "atu"   : iATU registers for DWC version 4.80 or later
+ */
+static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "dbi");
+}
+
+static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "config");
+}
+
+/* ECAM ops */
+const struct pci_ecam_ops rcar4_pcie_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D pci_ecam_map_bus,
+        .read                   =3D pci_generic_config_read,
+        .write                  =3D pci_generic_config_write,
+        .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+    }
+};
+
+const struct pci_ecam_ops rcar4_pcie_child_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_child_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D dw_pcie_child_map_bus,
+        .read                   =3D dw_pcie_child_config_read,
+        .write                  =3D dw_pcie_child_config_write,
+        .need_p2m_hwdom_mapping =3D dw_pcie_child_need_p2m_hwdom_mapping,
+    }
+};
+
+static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D
+{
+    { .compatible =3D "renesas,r8a779f0-pcie" },
+    { .compatible =3D "renesas,r8a779g0-pcie" },
+    { },
+};
+
+static int __init pci_host_generic_probe(struct dt_device_node *dev,
+                                         const void *data)
+{
+    struct pci_host_bridge *bridge;
+
+    bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
+                                &rcar4_pcie_child_ops);
+
+    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
+
+    return 0;
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
+.dt_match =3D rcar4_pcie_dt_match,
+.init =3D pci_host_generic_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1

