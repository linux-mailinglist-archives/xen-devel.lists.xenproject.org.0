Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA4AF9BC2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033719.1407056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCF-0007Ws-SU; Fri, 04 Jul 2025 20:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033719.1407056; Fri, 04 Jul 2025 20:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCF-0007VX-Ng; Fri, 04 Jul 2025 20:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1033719;
 Fri, 04 Jul 2025 20:39:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnCE-0007SZ-Lv
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:46 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0523f47d-5917-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 22:39:45 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:40 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:40 +0000
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
X-Inumbo-ID: 0523f47d-5917-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAvuwgUn9Z9LIj1AV707YfNIqA5m/eOCrfHYeTwLwJPrsA1pNLGv0TzttYEcOIQjnl5M/hbB5a6YOi4TET28rEelVjrddbbNt7KZyaICFqDkneDurk+oAyCn3asfJ/8IBjvK3lw9QHoRkzNOeh3ATEyoBd+h65aqfv01bIcU6hR/ZQNuK3mrxQndaMJ6hHr4jAJLkQyGVZouT1gNLWPNKOacDcNsVzla6FQ72dcgOnU8g1tTzrmQyTpBC48kwU3jSXmoJcSTZz9rMcx1ktI/JDLJLRHzBgo5b6HL9WetQ87Scvg2Xz9PuG3DN8xMM95USI2X+TT1rkAJrOxvvhBM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXPq5jXea6CNVBo0+QzCRwtwX65T7vX6q4vY/Alq6eA=;
 b=Cl4KyF0SIocNiW9h8/r+pTbrUYLriU6HA3T0CmGu0VBC3fKg9VVrzDhX4wpqFhc7nvCyuKBYQqo1adwv14RuYsCA7eG+ctPyUmD1zzBGf4/bYSAdVoR0aeV2LsnhqbZ8KrJxOJc81rRHdR+nizXmKq+3z0FM1eYShY9BPXPj8gwcutp9yvXcEMQ7mvIp6pXbTIRM6YECikGB5m+qldg64dO4hNdiLcuKPFm8bJqNvByKuRJfKDxP6KVjKtaQnBiB3UgDvBSn0dyo3vD+w4FCXjlD+cDVSblTFoDDzOHRH+LS1IUbnMQ+Yb6GyQmVsGF8HJWFyU8CdxeIW2vUbMWYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXPq5jXea6CNVBo0+QzCRwtwX65T7vX6q4vY/Alq6eA=;
 b=HtakpzTtyGs1oAD63iewgGCv2MdQ5UqiknpCjsfMN3jnhxKwaA+VUSGbeJvP7SwxzI4hG5A+0ggM0rLxk2h4J1Etu+40z4mlOujXDFRE3os3mULDObgukfi3YR7j48jNbKRKeSgGUGRvEMBzfS6Fkal6YNlW3Prq7giyODL0R9v6zq50hGLg+HFtNj/51skymNIKHKIIjbf8A+ZecvnHM53Ie1U+ZqJZsaXqNYu2KMdwRzer38DJJnQfVPMbSCBMBUpMcqgxNdb7s82oFKbWvv2L+lzMMEyS/rg2Nl8Y3ifXZ83y80CEOsF+vuzFSseyTKSaex7LhLM4vmIqi3e7bQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 4/5] device-tree: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 4/5] device-tree: address violation of MISRA C Rule
 5.5
Thread-Index: AQHb7SPE33xTLuD5VESNE7+QBAPvrA==
Date: Fri, 4 Jul 2025 20:39:40 +0000
Message-ID:
 <3dc32625a870200e4bae20959a10be6a786a9763.1751659393.git.dmytro_prokopchuk1@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: 151de091-8f38-4fe4-44e4-08ddbb3ae6af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kWLF8lWFjLBViXAZhcTYMmAKGnCW05I++b5feLqZQd85mOGypUrX/1eeRF?=
 =?iso-8859-1?Q?BDEq94GM1varoxThN9nWF+qnliKj56uYs63ZxIKlqjmU8INGxHJU5NuB3s?=
 =?iso-8859-1?Q?5X36PpPm0tkEzaF3/DcjrAgo/JAY8W6e+TQcHN1VigcZprsu8xSgUHH7PD?=
 =?iso-8859-1?Q?Q4rQQpIdYJqHUuWzGmN5JUY280lpH/IQnbMtUkRT154jhTu0UEMPjpM7Ij?=
 =?iso-8859-1?Q?HXdOvFouPUPHZnJZgDvUv5/3RdgW5fmCLo+CEfydGl8S2LE9Z+HkPDVwSc?=
 =?iso-8859-1?Q?a+UxjIOfW/4i9OBcJV8dPVKMIwfVAoYimUKxyuWM0GRe4nfL6F07QEQbpa?=
 =?iso-8859-1?Q?ioxzLj+DXWAqlT2Yzn/hK6vUIPqCNyEdOn06BxH4msUUbxSaiOr1t48ks7?=
 =?iso-8859-1?Q?1ioIKWT746yrAYgSrNuXnzcbOHvK4fwq18oXFE713pSnTO7t7QhKtdk1gu?=
 =?iso-8859-1?Q?gWtVQMXBpcUULB1fqBEfTmGNO3dqJJsib+GVhtHE/MtC2X6q3h4nAI9R8a?=
 =?iso-8859-1?Q?/elVrRjTbGwTEJ66yeYcqXGBcZe9f3XYXKPRl9JwRaYNnLpjcOA2rPXVr1?=
 =?iso-8859-1?Q?/h/742qM9UPWOh5Pzlts8GYbfFm6iEGyc+82Phn0DUrvbYjO2PvHSmtHN1?=
 =?iso-8859-1?Q?5z9LG58yJvIhva3uPPl46QA0AQBth4RUJBviZoD79iuaw/8HKOg2tcO5OA?=
 =?iso-8859-1?Q?qbpnzsg//D3XZlUcHIXko4IPv1z+3T2NaO8ZjZ10R9dyLrMib6hB/f1fKy?=
 =?iso-8859-1?Q?VVdgueZ9QBjwrXYq+9nLWilR58IsxFeAfZWvq/VfxTUh8YJ48y+aJE/ivx?=
 =?iso-8859-1?Q?eVm4YceSCQ8CMWZlMlZVFt3hP7aKzAiRzkj6mYfwan3PZOBWHhFrFZSiXX?=
 =?iso-8859-1?Q?Kleio2MSFwhUY+Og+3od0vutBHtUGju1VbtUvSD2yo3lPZGZf0TKzOfUdZ?=
 =?iso-8859-1?Q?oW9nEmDLvT3x/QrtTN+ZoUNit5u5oCTuaGgZvBtsE0FxhmMyyG3qWQdLHr?=
 =?iso-8859-1?Q?JqHzJsJp/thldheivHoBYmnpTbUhCVvWe0Xnrunlie5ESU89TEzrNy7lbX?=
 =?iso-8859-1?Q?fikMbLOAXeaQlveXfwc9Tn+KVGWhj1T/o/3jXBDBuxI8sekoWdt33K6S7X?=
 =?iso-8859-1?Q?b4iRHs5QhT08mITA/zRzwR7wDCdHU4EP3PFlyotiCpDhFpfTUzV8PEEtHs?=
 =?iso-8859-1?Q?bTI1nlHVuF7CZzfKXAWESN2n5TGYC+yCdsziakzASYVU9wVnMkn1NCbGFa?=
 =?iso-8859-1?Q?23/dCSCk0+rOcidBAU5oCUzbNMwqIToJE0ie5HPMfu45IPc1iWxQucZiuD?=
 =?iso-8859-1?Q?eBcQPYfM+ToUcniA1H/8pbaXech6izvkoDFaBtF42V1KL5xZ9vT4xgeQZi?=
 =?iso-8859-1?Q?jgVmRC7tmEwXPSdu5rpxZSbNCf2mXC4qnVJ11vQliIT6Ugj2OJlFqHK27x?=
 =?iso-8859-1?Q?ldravTV1CvaoUVogiK1ZObhQyhyDmA21GDPIEOvY6eD0T4eDPldzkh2Kx2?=
 =?iso-8859-1?Q?LRWtSGUcOXRM+NUiIzyRMAOwIkwNFBQl5rzi9ifLtScA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rPLkBGQBo0qYw9HEWscfYAEkdiHl0V/Vxb02z5CnEtn2XE48yODWpJP3WD?=
 =?iso-8859-1?Q?lJo2bQPsQVKQDTJV2REGNDdkBplDztEUkuQGjNcPS9MEea4niKgcK02c88?=
 =?iso-8859-1?Q?6keAUqlwLl8IEzO8erW3loVMpjk/gGtgukIf+gfgeiDoanXK+vgBoJlDx8?=
 =?iso-8859-1?Q?Mgm3wMf3kj7G/BTLSsRhlyxNCSYJs0alAPU4QK9LfETeUESxrHqsQYVamE?=
 =?iso-8859-1?Q?Aa2/HONvxG0cR1tbI4iJzirpnC86OpyYAn+0RvVXZ5yZJvaP1AaaYInDPo?=
 =?iso-8859-1?Q?y+wI5hcD79xAcnIdS8iN84gHPgaX/aXcSx2WnzeLbgrc5gC7O8ef4HeUkD?=
 =?iso-8859-1?Q?3AFOyN5TNVDtwjyAAJuQ9k8xgyDg4Bu1MNNDiTESPsnjy84YyVU58FBKOc?=
 =?iso-8859-1?Q?2Tie69VjIp/WkIrOxw2BgmhdDJ0G6+g39YNiX5ZwY0Hb0RLNj0zHt923zn?=
 =?iso-8859-1?Q?lZifJ1AzNBDG/XQzGrF1AOn9Nra2fQJII05bJ6YClkmg69EsF/wjBAlvnz?=
 =?iso-8859-1?Q?5YXraWNHRTmIUNTACvYwCgPYMFt+boW0ho4Im6MvkolHH1/7Ed9zN1p75e?=
 =?iso-8859-1?Q?V+383+YNeK6RONeO3wVvhCabQohvvztUIRPDwkdES+XbZi5L9zVB/0sSbP?=
 =?iso-8859-1?Q?dzidQ6GWQnCVenZs9QKCDNTVBdGIW0a/3nrcYZzu6S73Fxg28wtyf1XSNe?=
 =?iso-8859-1?Q?HrTy08KHtCbI7i9fJSdWLStg2l5h+VWT1uJwdNsvdkhAjk+RVnQpxp+ZZv?=
 =?iso-8859-1?Q?z1W5XKcvxTs3U75GGspWLTOQVYG3mj2DyW22ljvW/0ktZJQAX9mWG9BU1S?=
 =?iso-8859-1?Q?zD4mc6k//b+93q3NStYy122CRO+fYlJvK2gAyTCfaEfDixF4ij8N/z5yPw?=
 =?iso-8859-1?Q?QtzZ55kVNwsEN27PeR60lMghdkDwZ1Y3ct9TynSmhm7+AZRjpVXjtuRcfa?=
 =?iso-8859-1?Q?wRBZsIMhoGbJgqewB4aos02EjGLzZoHxachRAF5HryYIfu2VwyrXrp2BAn?=
 =?iso-8859-1?Q?worcMlP4Sw7DHkueGFUm4PjW9ipVIzEUmErJdn13quzlElkA93vd95lRL7?=
 =?iso-8859-1?Q?48X0MYmTdDiZPqenM0f++LPtabz01HMlN44UNUe7LJj28VOKoLrSdcGGrN?=
 =?iso-8859-1?Q?tCTqd61CZdS8EuIqBbxaMZZ6lYj5WFZ65K+U2SgqKiGHU/umPmL4n2kESU?=
 =?iso-8859-1?Q?KhlBF9WOkUSYA/pnQpnM9E+L9/CB7c/lDC5QAXJq5h0bYxGvuUEwk/pOel?=
 =?iso-8859-1?Q?MSDfgHNehPBRfA6djPu3/Y2+yfpinQJedwH+L0WRWagT0QMtxuHgIxlCb8?=
 =?iso-8859-1?Q?pX8sIFCIMRcwYs7lMCqTYJ4ucgU+yTIvirZpWEmrDjfkifQkwzVXYq9E/D?=
 =?iso-8859-1?Q?WAoWCLdvpNBZEUW11qfbsxwxx021hhzPoXs05RMjbiM7tXtChKhCBSkE+6?=
 =?iso-8859-1?Q?AHA2pWq/Q/TUG7mdVxNCD/lODKmb+GloO9WPXwQMjMiSiE6N2FhZj+3rDn?=
 =?iso-8859-1?Q?CGAmJENZvzPAn81/ILblZ8VFMJjFPqFpIg4ZlpTteIatqs9FGH0H8ElR3Z?=
 =?iso-8859-1?Q?aw8W/WIPH7rhdtpKnNNi/FziA43OyHD3FolMm2zSNhLj2p35UYqrsgqQAy?=
 =?iso-8859-1?Q?AaonhqrLYQTTOdElnPDlJygCj5f5cX8fRyKBdguZ9fNNpGynOlzBhwdQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151de091-8f38-4fe4-44e4-08ddbb3ae6af
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:40.8838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JO6NHDoECzs8SgD8eRkWs7i5uCzzH4/AY5/BLju1Dq9vZJs4ywKrxTFmcS6+2RVwIaR+2TePX66I3zALGfrskB+y8VZOYoQL2l9+5Cgsz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/include/xen/fdt-domain-build.h: non-compliant parameter 'copy_to_guest'
xen/include/xen/guest_access.h: non-compliant macro 'copy_to_guest'

Rename 'copy_to_guest' function parameter to 'cb' for compliance.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/device-tree/domain-build.c | 9 ++++-----
 xen/include/xen/fdt-domain-build.h    | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree=
/domain-build.c
index cd01a8b4bc..2b009547d0 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -331,7 +331,7 @@ void __init allocate_memory(struct domain *d, struct ke=
rnel_info *kinfo)
 }
=20
 void __init dtb_load(struct kernel_info *kinfo,
-                     copy_to_guest_phys_cb copy_to_guest)
+                     copy_to_guest_phys_cb cb)
 {
     unsigned long left;
=20
@@ -339,7 +339,7 @@ void __init dtb_load(struct kernel_info *kinfo,
            kinfo->d, kinfo->dtb_paddr,
            kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
=20
-    left =3D copy_to_guest(kinfo->d, kinfo->dtb_paddr,
+    left =3D cb(kinfo->d, kinfo->dtb_paddr,
                          kinfo->fdt,
                          fdt_totalsize(kinfo->fdt));
=20
@@ -350,7 +350,7 @@ void __init dtb_load(struct kernel_info *kinfo,
 }
=20
 void __init initrd_load(struct kernel_info *kinfo,
-                        copy_to_guest_phys_cb copy_to_guest)
+                        copy_to_guest_phys_cb cb)
 {
     const struct boot_module *mod =3D kinfo->initrd;
     paddr_t load_addr =3D kinfo->initrd_paddr;
@@ -393,8 +393,7 @@ void __init initrd_load(struct kernel_info *kinfo,
     if ( !initrd )
         panic("Unable to map the %pd initrd\n", kinfo->d);
=20
-    res =3D copy_to_guest(kinfo->d, load_addr,
-                        initrd, len);
+    res =3D cb(kinfo->d, load_addr, initrd, len);
     if ( res !=3D 0 )
         panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
=20
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domai=
n-build.h
index 45981dbec0..3a20623cf5 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -50,10 +50,10 @@ typedef unsigned long (*copy_to_guest_phys_cb)(struct d=
omain *d,
                                                unsigned int len);
=20
 void initrd_load(struct kernel_info *kinfo,
-                 copy_to_guest_phys_cb copy_to_guest);
+                 copy_to_guest_phys_cb cb);
=20
 void dtb_load(struct kernel_info *kinfo,
-              copy_to_guest_phys_cb copy_to_guest);
+              copy_to_guest_phys_cb cb);
=20
 int find_unallocated_memory(const struct kernel_info *kinfo,
                             const struct membanks *mem_banks[],
--=20
2.43.0

