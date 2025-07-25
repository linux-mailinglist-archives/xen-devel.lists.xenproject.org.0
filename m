Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFBB1200C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057933.1425652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLo-0007nE-Lo; Fri, 25 Jul 2025 14:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057933.1425652; Fri, 25 Jul 2025 14:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLo-0007kS-Ei; Fri, 25 Jul 2025 14:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1057933;
 Fri, 25 Jul 2025 14:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLm-0007Qu-Mu
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:42 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a7afbed-6963-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:24:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:33 +0000
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
X-Inumbo-ID: 1a7afbed-6963-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWL/J1U7G/wG8oE197x2eAirKsWWKMwGyEr/jzqT32Rw40Gn4u/0ZRWSfoH3VJCAQO+IL+IYoS1CzuHz6IGJq4NeU37fM/7Mba9FrsOkcx/U16Lys1v2IJLQSL4ZRRrRsWwgC2XZ5OHtRUmGfr3Zx6mVNLFYcgIc+ODykEYh6gD7gyWCoNyEzm3K8NZaqRiWFX811ooeYNZdrSVs7sVyTHhfsovTI/BzbpCfOuXHY5rhC0UqJ5BVaSMqb72UAXFUmxsPSv/P188iIJjpqIjjH0jynkAYJVj0B8iA0FqK+5t8pM65TRQMcYOAeGlRixNwJa2I6Eu38BQ0OMyyVk6iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sj5kXRw1TCTZlSidkbZC0El8FA/Le8iXT/bf3wJXn+M=;
 b=ueoNGeNpirNQBKlxoJEyk6zK4RlC0WKzB5la8+BYE5pVdx6Cm3tlpdoqhGSM7tEoTlh1Xd0+lstqSIUbQU28WHlFBBr47al0sy34xuGCwMnxLGUR+f1JaT1a7FCtP4MhmjH7DWaTjtPVaXc5qkOyVBR8XCiOsEgQUkiVCIZQgeVIshP+WtnLLDHjkWOVJT+VPUhoAMNFkXR3kKIC3f8xR1RhMn3+ADQND/+U+QBixfADuTJRg3oAKCOEMUqCJmb4d6det+6M0jcdtLyiJvzH2pr84QhXaCBqZZfviXEPs8McaCQS9nNQahFRXOn7xj5Rj1PoNzFBt1H+Tom+1oCDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj5kXRw1TCTZlSidkbZC0El8FA/Le8iXT/bf3wJXn+M=;
 b=EeSohXefztVFeR6J3tF6KZEEIffTAEo5jMLjyus84SXrJXNV7v1nSzzZ3YFMd+QkkjXWAo3jZpHnM6ighqM0+FoVQOuob0TVhqZXGXcVZx3Pras8G79PxdlIQGWE1znEZOn/Y1vhLvUm6BWitEUG5snmKmx1J08zqfCLNBT9/dhPlPZmGU5I9Ep3AAEWIUur5V5JE8R+P/4y0CSQdIUnD3ooHV17OwhA/0yA+/nDiSnUz+CKyQr5nOESxK9x7uNFQgZinz0wmYcf4Z9cqmQnnoU/r7xROFVt5lc3rsYkuHdmRGRJeTz3XXa6h2d1ZpqFJYJcKWj1HubZaOk0GYwKrg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 6/6] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v1 6/6] vpci: add SR-IOV support for DomUs
Thread-Index: AQHb/W/XNN5FWox6skmSZZwtQ8vAvw==
Date: Fri, 25 Jul 2025 14:24:33 +0000
Message-ID:
 <24ecd4b4877f82304e5fe5a4a6c524cc263c7756.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: b989b9a5-78e4-43d7-0cb7-08ddcb86fa20
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yMzKsxijv7h3xII4byfatSFRRVkXiG4c09bSDK95CHnmh/nT1LyrDV/6Tu?=
 =?iso-8859-1?Q?aMN0jpsMZIhmnU5CKQI1GvyqC+X9YjakfRbcjuWCwNV4QwhlWmA+K2RjLi?=
 =?iso-8859-1?Q?VNUuywpYUdCdF12iO5LSDpxvjvZ5Lj833ngMx3xbCX5weFo1xjBQNOQgH0?=
 =?iso-8859-1?Q?x/rV+dXgZcerFtZmsGDzJrdcHIB6Wv3QGXRJ5h2aTQFSKdaMvqMy2yc3xb?=
 =?iso-8859-1?Q?O0IhjEsFEh3CYEaMMSAb0e4iobSYX4wv51H5K+J5zulw2doW1azlYoilgw?=
 =?iso-8859-1?Q?Re/rnorozhPr1Gn8yCU3/srQ0+wQ4Gog8ohjPiZ+ujrQxGXLwUfglzyTaj?=
 =?iso-8859-1?Q?6ynfCLgFD20VKKQfBqaQ6sCfdNSQlA0akxXe8PBevsbZbCCjFlS22gZwo0?=
 =?iso-8859-1?Q?GcAuZal6gfq3ilHXcwVJrDVBGlwkMDt23LJnffkmx9x9MmKxkwxEL8Nozw?=
 =?iso-8859-1?Q?Ujmue1mY5FoWIkzcrfjchw4gzsu4xRFG8/PiEaWL+L9BBDLmviJ1rdIaX3?=
 =?iso-8859-1?Q?nemZol+S+8kj5MqZvT4+Ord6vOWUKnm11jS1DFzSlucEW26Tlf8vAfwHE9?=
 =?iso-8859-1?Q?P61AxJEMm9L1CgQFmHtdltKK7HBhrse0/DU5V+tGHPBrQUMSEVlArAzU9t?=
 =?iso-8859-1?Q?ndOMdtBBg4wphA0jzKfACH70rt9Wru8CCq9J6djXr/LjjrxcSVmAGnFy/H?=
 =?iso-8859-1?Q?8Ts2E33Hyx/exIDntaKEHYmIJanPmG2IaSl4y7NnJbV2TEZgZ0P7DoVWac?=
 =?iso-8859-1?Q?KKz+zEBkvh4GE1pFdKHBgCywAUBT3rWeJJex3ZPGMu5ErXPiL3rKX0iS29?=
 =?iso-8859-1?Q?bGxyomqwUwJYm9jZ/ypMELJ+RgdgMZnvpm2Gi3HNWAqvObi8vTnu+KMUAh?=
 =?iso-8859-1?Q?7adPjdZ+ak3Ki2I/OoG5IxAeGNwFqKfqhuhfibFBAPW/CiGyGB6cIAEF2Z?=
 =?iso-8859-1?Q?I7qQ5nMputjZI0O1xidkJYVzUiJ4N11ozrUyX40BT5EWvSjRvbKjfaCKwS?=
 =?iso-8859-1?Q?J9adNemLfiE6fUu7Yc8lFtb0zPYz1FrWKBf+0qXFDSzJAGpGx68OJDQNhR?=
 =?iso-8859-1?Q?Hj9nlsTdubErjsOJPA1QnX3v0GrePNLF7FI8adlj5Glu6ebo58ncNNwQoy?=
 =?iso-8859-1?Q?VqqZ58Kua4uzxMB0ZsJqKxjPUwAACcLJ95cxoi0YaoVPXG0zYXFS3ZxtuH?=
 =?iso-8859-1?Q?+WcdUckySW24XTnpRwendKJMtRGsc15RuDa1+tf1DtHnwufIdR4yNiWRiP?=
 =?iso-8859-1?Q?DjPB2UA06+fi4wJhui+ufZY9MpxzZAB5YhX3zooRP2b0hzWEjUTzpbkwFE?=
 =?iso-8859-1?Q?OhQPqCP9sU2YFrUQEuwWJLtRnrtSkHkuFk4dFbb0YzOdrQP7GgPRid40IW?=
 =?iso-8859-1?Q?XxepcNwgzP6N3z+BdV1QLYnEZPtJQARZNWh0HosmdbzS3KuB6RgOMlsQ4m?=
 =?iso-8859-1?Q?o9zeLsUuNpmKXVFvNqoq3EDPr/fN0iifw8vKjQcVfN2lRXxv22wdLHifSx?=
 =?iso-8859-1?Q?lHSiqMoVI+ney8NZuSe5hHKWD1EqPY0R3VKUFV9S39nw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eQaFMaVQIx1iX8sYxoa/VifGgey4SjqfsAN4jBMCKI++H1xYyKoKopmRcz?=
 =?iso-8859-1?Q?z4vR/LsJa9ChmmlrSOigBjroyt/MiF4cCA4kF+tZUCZ34/2uxxEXiaDrjh?=
 =?iso-8859-1?Q?W4j5ASGXGst8wUS7HsqoI0xHQb06I2zAa2Vsps0lEd5sRuTV+0G7y1XwTi?=
 =?iso-8859-1?Q?exvxOwve4DLBTLNjmav4FHTUsbN25FPuPp8n34m+YoNiRPuXYX5wWsoG7O?=
 =?iso-8859-1?Q?usF3h+kWVV6WmNWseEjagKCBKZgBacv9L72GFg4bm5VrDL9snrwM5YwC/E?=
 =?iso-8859-1?Q?YXVLoSAMM3br39bpWa3woC425uKaKaqQr+GUgNLcvYMLs0VmvIrs7OLCkO?=
 =?iso-8859-1?Q?kx9YwcbloBgkLJxEkVIf+YYGNwpz+8dPzibjfFuoWDHw/pcWkFtda+2a+u?=
 =?iso-8859-1?Q?5xjTaW0ua7PMNUI3/3TvyoJjyuyGg25wmNwuDPOTQoL9MNIzW67RYFvepx?=
 =?iso-8859-1?Q?AEakJT4tHPAhQ/7bcwIaf1LbOCq1tQ/4yPqa5AsX0i0De7Mxc69atEftfB?=
 =?iso-8859-1?Q?H4x6s5IfhvN2FFXCHM2nT1pu/q4RHJ1jlmz20Vf2LMm9SNA7WcwqzpK3gK?=
 =?iso-8859-1?Q?yesHpseunzoqULCy8XQ6X0L0YK7nBFcHQEH7coPdK6uGrLrBDFRsrAkR1b?=
 =?iso-8859-1?Q?nnIv+qwWiaNuD4VJwJn1PxbF4Xt95JrxwxCxtStRobD+Tiu9QZ0S2amKMa?=
 =?iso-8859-1?Q?67AoRbj3rwS66ItW0sV4qh8OYMf2ZZ0w2di48+haFiyEjdMk/5tIzlvrO+?=
 =?iso-8859-1?Q?p5dw48nbUkKSZiY+vfxVU60Mn6PWlMYaPWY+cj9RUQsv3sZIXbpEX1v5Mg?=
 =?iso-8859-1?Q?KrwGhoru4Y6pPvVJYznFsUhPl7nNGHC4IRShQHaZ+vqZB4VTVCcaubCwlY?=
 =?iso-8859-1?Q?9c/ZfnQn5jptmXlZv1Ggt/qvFwsGTWF5BWVYZmc/0ldnp1YAM/5x+brUwu?=
 =?iso-8859-1?Q?6S+d4VccB4zE2WH2o33KPBrKazrY7xEEqxNAostf6qfOOFcbKwzChBkXlO?=
 =?iso-8859-1?Q?XQEbqImFS2mJvK1CyzZDayfpzuuZW598strDHkhYS7zs0pHbzs8LjEjEg4?=
 =?iso-8859-1?Q?vbB6wpDhU38zjvslfu7yroptqUx0dn+n4D36XZ8OCJiGV2DX8arhrA1J/h?=
 =?iso-8859-1?Q?qg2eupztXIu3wJrt3J2fg1ftrpQkqr/cT37cP5sJf5KOxzVNXp7Q7875jj?=
 =?iso-8859-1?Q?WN36spdRj9KelcFWzg3r/xhnVlcJRDllqB0JF/y3vwrEnJem587xpJ6ORi?=
 =?iso-8859-1?Q?eyVoX33wjEPa/tO8SBxLC/ArF/oXaWxFusxllqh4AHjWcD4qEGXSvpZ7Nl?=
 =?iso-8859-1?Q?VaBciC+1xoWrLPPiuNjKBVlgR5hb4wLhUaaXkxV/j9DJnHqLUz8adN+1nS?=
 =?iso-8859-1?Q?FZG2xC/gyFvjAfeslhw+GxXVBCz77zAptmpvY1QdBX44kaHRHqFs4+pEUr?=
 =?iso-8859-1?Q?tw/GXh8kT54qqt9OW3oIQ5DHwxbf8Ipt02K5zl1R/uQ5/lhaxfMCT3Ob6T?=
 =?iso-8859-1?Q?JZjr3Pr/fRmNsAO4FujAgF7Fbx6D/m5gDIwug6KMlidP3dXJSWB+RR+Lje?=
 =?iso-8859-1?Q?pjJ7exzNBxGCRABz5OghDixTpZA0JmhWfbGmj7vMrDMvU5e5aN+7JGeSgp?=
 =?iso-8859-1?Q?0YY05yOuNPgdqQTtq+We5NPGf2utcDw4c3pyvlyerORwDDgrKxoiSkew?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b989b9a5-78e4-43d7-0cb7-08ddcb86fa20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:33.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3aY+SSykjOnX9BdiowMzQR2ZH0OTpM0kyfPQLudHQQc0z/JzmZD5GDk9sJm2JDrsVoHux0hhb7flV+RYPCb0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

SR-IOV virtual functions have simplified configuration space such as
Vendor ID is derived from the physical function and Device ID comes
from SR-IOV extended capability.
Emulate those, so we can provide VID/DID pair for guests which use PCI
passthrough for SR-IOV virtual functions.

Emulate guest BAR register values based on PF BAR values for VFs.
This allows creating a guest view of the normal BAR registers and emulates
the size and properties as it is done during PCI device enumeration by
the guest.

Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
access to the PFs ROM via emulation and is not implemented.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/sriov.c | 119 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
index 640430e3e9..bf8d9763c6 100644
--- a/xen/drivers/vpci/sriov.c
+++ b/xen/drivers/vpci/sriov.c
@@ -39,7 +39,8 @@ static int vf_init_bars(const struct pci_dev *vf_pdev)
     for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
     {
         bars[i].addr =3D physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[=
i].size;
-        bars[i].guest_addr =3D bars[i].addr;
+        if ( pf_pdev->domain =3D=3D vf_pdev->domain || bars[i].guest_addr =
=3D=3D 0 )
+            bars[i].guest_addr =3D bars[i].addr;
         bars[i].size =3D physfn_vf_bars[i].size;
         bars[i].type =3D physfn_vf_bars[i].type;
         bars[i].prefetchable =3D physfn_vf_bars[i].prefetchable;
@@ -166,6 +167,44 @@ static void cf_check control_write(const struct pci_de=
v *pdev, unsigned int reg,
     pci_conf_write16(pdev->sbdf, reg, val);
 }
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static void cf_check vf_cmd_write(const struct pci_dev *pdev, unsigned int=
 reg,
+                                  uint32_t cmd, void *data)
+{
+    struct vpci_header *header =3D data;
+
+    cmd |=3D PCI_COMMAND_INTX_DISABLE;
+
+    header->guest_cmd =3D cmd;
+
+    /*
+     * Let Dom0 play with all the bits directly except for the memory
+     * decoding one. Bits that are not allowed for DomU are already
+     * handled above and by the rsvdp_mask.
+     */
+    if ( header->bars_mapped !=3D !!(cmd & PCI_COMMAND_MEMORY) )
+    {
+        /*
+         * Ignore the error. No memory has been added or removed from the =
p2m
+         * (because the actual p2m changes are deferred in defer_map) and =
the
+         * memory decoding bit has not been changed, so leave everything a=
s-is,
+         * hoping the guest will realize and try again.
+         */
+        map_vf(pdev, cmd);
+    }
+    else
+        pci_conf_write16(pdev->sbdf, reg, cmd);
+}
+
+static uint32_t cf_check vf_cmd_read(const struct pci_dev *pdev,
+                                     unsigned int reg, void *data)
+{
+    const struct vpci_header *header =3D data;
+
+    return header->guest_cmd;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 static int vf_init_header(struct pci_dev *vf_pdev)
 {
     const struct pci_dev *pf_pdev;
@@ -184,6 +223,84 @@ static int vf_init_header(struct pci_dev *vf_pdev)
     sriov_pos =3D pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SR=
IOV);
     ctrl =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pf_pdev->domain !=3D vf_pdev->domain )
+    {
+        uint16_t vid =3D pci_conf_read16(pf_pdev->sbdf, PCI_VENDOR_ID);
+        uint16_t did =3D pci_conf_read16(pf_pdev->sbdf,
+                                       sriov_pos + PCI_SRIOV_VF_DID);
+        struct vpci_bar *bars =3D vf_pdev->vpci->header.bars;
+        unsigned int i;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_VENDOR_ID, 2, (void *)(uintptr_t)vid);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_DEVICE_ID, 2, (void *)(uintptr_t)did);
+        if ( rc )
+            return rc;
+
+        /* Hardcode multi-function device bit to 0 */
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_HEADER_TYPE, 1,
+                               (void *)PCI_HEADER_TYPE_NORMAL);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
+                               PCI_CLASS_REVISION, 4, NULL);
+        if ( rc )
+            return rc;
+
+        /* VF ROZ is covered by ro_mask */
+        rc =3D vpci_add_register_mask(vf_pdev->vpci, vf_cmd_read, vf_cmd_w=
rite,
+                                    PCI_COMMAND, 2, &vf_pdev->vpci->header=
,
+                                    PCI_COMMAND_IO | PCI_COMMAND_SPECIAL |
+                                    PCI_COMMAND_INVALIDATE |
+                                    PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_=
WAIT |
+                                    PCI_COMMAND_FAST_BACK,
+                                    0,
+                                    PCI_COMMAND_RSVDP_MASK |
+                                    PCI_COMMAND_PARITY | PCI_COMMAND_SERR,
+                                    0);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_init_capability_list(vf_pdev);
+        if ( rc )
+            return rc;
+
+        for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
+        {
+            switch ( pf_pdev->vpci->sriov->vf_bars[i].type )
+            {
+            case VPCI_BAR_MEM32:
+            case VPCI_BAR_MEM64_LO:
+            case VPCI_BAR_MEM64_HI:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_guest_mem_bar=
_read,
+                                       vpci_guest_mem_bar_write,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4, &bar=
s[i]);
+                if ( rc )
+                    return rc;
+                break;
+            default:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NUL=
L,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4,
+                                       (void *)0);
+                if ( rc )
+                    return rc;
+                break;
+            }
+        }
+
+        rc =3D vf_init_bars(vf_pdev);
+        if ( rc )
+            return rc;
+    }
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
     if ( (pf_pdev->domain =3D=3D vf_pdev->domain) && (ctrl & PCI_SRIOV_CTR=
L_MSE) )
     {
         rc =3D map_vf(vf_pdev, PCI_COMMAND_MEMORY);
--=20
2.34.1

