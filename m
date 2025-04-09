Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CEA82646
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944041.1342621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUj-00024z-TB; Wed, 09 Apr 2025 13:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944041.1342621; Wed, 09 Apr 2025 13:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUj-0001x9-NQ; Wed, 09 Apr 2025 13:29:33 +0000
Received: by outflank-mailman (input) for mailman id 944041;
 Wed, 09 Apr 2025 13:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scqd=W3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u2VUh-0001T2-R9
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab31a413-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:31 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7468.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:29:27 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:29:27 +0000
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
X-Inumbo-ID: ab31a413-1546-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcCj1DB1oObqtTUJiEstRW6edVxF/ROrdj0Szbku5laLFo9OxVXceszt97NPbWaeFwxj60fsf3FA68GbEa/63xwNaUmM9mQwdF6/DS4EVn4Mxt00kNH7gqbeokwb7UedKr1JFPPDNcOHiAKhnQXk95F4ROW6+GdbUFWsg5nV/br3pIzj95iz4BKDusvR/DJ7dVugUv5ozm3NTLexYRnXpnDmYwTKs4gbMPl/zibLj2UiDsCoyet9nn1abrJgrKjGcGU4fVKslXWJNZ9F7HK0EaW4jCmN9vobutBBcrA1ggpPjvraWm+zhsmEU6HbF7nRbUenmTJ//ZPio4EEFY9DJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+i5jbotZlWjB6/+feELzrSWWgwAgHoqmM5jq2AI9Eo=;
 b=gSw/6M4m9MO80YW3lQyYMoYBKf1jhaL9VcIaaun1y4gO2CahGw1mU7AUi04HSrXycTRKgffwSoGNlNWEAqAtiGiMIz3S/+lRuvh0Hj13na+X/19bhM9/0CwjDK3uxvRL/zSscx8Y5X/IDa1ta111lh7R/IsHsjZ41UhxIxhRx4/m+fa5UkRg1vqcmTPAmGXGAxmcsjw0f9S1z9oYmAI0HnxrQkqRPbOwN/MnczPPyHOWVIUYLmJBJqCKbSNYpKzEYPB04B+gXOXZK3jRU7bbhqFLTVc775T26Ef1ZC54jsXSWgKUJptnIiSm21h5/S824TV8kQzYektuAWsHT9W4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+i5jbotZlWjB6/+feELzrSWWgwAgHoqmM5jq2AI9Eo=;
 b=vLk3fwExC7GDmaTQohUupxkCG816xC2wS5rXYz7aKpgFwjU3XyEhigEl/dERysMdy83siCAL6RInVKpxO6zdaxrAIApC4vGPz6bHICu+7ibUJTsORAA/Vrl6qZ7lLthkScgbZb/7h5x+T6o3iRd4NnZVe7LpwG6bq6GuAsjeaaF06TD1y6TS6fPhsCDUJEdjYymtqTJJC9dRoNpQoGXc8dnRdmTmIq3D6JtNXxYH3ZpdSrC9DuAEZ3vtkDZGZOkXsLA53JkgJYOAadO7B/KYuXA7n83kFMcIv9FzIiGlTjno0m116VHXf0qHtL5G8RCmA+4Ry+wjUOPfoLC7D293fg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 2/4] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH v3 2/4] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHbqVNqJOpNy64us0q429PoDyckxg==
Date: Wed, 9 Apr 2025 13:29:27 +0000
Message-ID:
 <0abee55bcc632ba1be356461e22eca2ceb11dadd.1744203405.git.mykyta_poturai@epam.com>
References: <cover.1744203405.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744203405.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7468:EE_
x-ms-office365-filtering-correlation-id: b3c3be0a-7090-4b01-bad1-08dd776a8d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gcaYfPFUoYIhZuZZWByt0/CjswGVD8NmkM6zUtahQ8hFQIXvyeNctcDG8/?=
 =?iso-8859-1?Q?2Zt2+jt6UySC5v7WV7qQC9Q/D8QpbN5CJbgnz1f5PEe177b+rENXWf1idv?=
 =?iso-8859-1?Q?BIUeOkQ+D+8RmfUWN3TXPMgvBk3ZHvHDaJTIdUIIe9cien5cftJgBXSz6o?=
 =?iso-8859-1?Q?b4vM1vBWpEJO8gT+q0OfJOIKOlReX686WcWfqDG8z2e6pKxFkzWabuMIC8?=
 =?iso-8859-1?Q?wBmYAOUwN/0+aBIn9zTLRtTph0v5nFOT+T89sZLf4pJ3kLiJ6A9V88AQKE?=
 =?iso-8859-1?Q?mTymo80ZjKuVqP7EVrh7YcreFhD+e0zvjTTv0oLVosDjZEPFjL4zOuqOfU?=
 =?iso-8859-1?Q?uJZMbL1hHoEB4Qs4B9s3w0usCi4mcq5sfn9f3rYG7ckGsSQa2u0LU/Uhb9?=
 =?iso-8859-1?Q?PCUn/OiIsCB7OfDLBvh1HtqG0uxQ+6bffr3qqSo36shEFGDUph/OHRvI2K?=
 =?iso-8859-1?Q?dsLIQt3lhjP0rK67HsYQkf/LCpawRxU4mrMaB4+6Gq61FpBrzJS0MnhB8c?=
 =?iso-8859-1?Q?++1nxAUBk82FLHrySICNIM5jCEsNhFxitAr62mdhL0VJN20P75Fw+bEh1A?=
 =?iso-8859-1?Q?jIFKj3AiF9idiAEoKdrdLmgZoiAXiYWjJdiLgtrg7pMfaaEmdoQp9q5jkv?=
 =?iso-8859-1?Q?GKjlAL0Z9ghelQH0wJIHwsXqdfv1GqKFNZt3QOs9mtoi+X7t8GVRbbU0t2?=
 =?iso-8859-1?Q?QwPcGoOGmn+WkXqWeOzBVp7dB1hxZz69Swt0uLYkY8QCgplCp8/B57sfBK?=
 =?iso-8859-1?Q?z1f4sYHvePQ9MgUNE6qMPWr5Q67s6RKNq85WVo2nT4BJdc1g3lUBRbD4jD?=
 =?iso-8859-1?Q?J+H3LpUDTBlnxA6YOsXzwl3FA/Szv3aEs5IDTtLGymxgyMiJ2nVXzoQeKT?=
 =?iso-8859-1?Q?96H5P9ORnWKZRBoXAbX8fFQaLywwuj+NTWzISJP9bGlDZFU7hN095aQqNy?=
 =?iso-8859-1?Q?YDWROmYb6dESYDBoGqil5+/dqDqvNHhU6+CmacL02an+qybOJDzabYW/YJ?=
 =?iso-8859-1?Q?TNN66n6HKEp8noA25oZhSTuF6ONcJi0GwpXXvBe4Z62sAYzJQMj4gdaor6?=
 =?iso-8859-1?Q?0/XdeC5SpuDmOilyLuh0Av2AJ12qzwxM0OPKyXP57aZpBZmzYDzxq2WS1z?=
 =?iso-8859-1?Q?K9puhwkGOL81+quBXXiYRcRTc1CtgXBDsOBbEBLtqaI2ru9Bi1RcciwSzV?=
 =?iso-8859-1?Q?NFmAdi0h/twcWaIr8KGJ64VBJpcEpUS3CJQ03bJjPlQymKTmqWTPqipXZr?=
 =?iso-8859-1?Q?zGaskis5ilK1kAD8YOTclB8oRF9PkF5quZ5c2qs1MrRFLszJDdvXusJn88?=
 =?iso-8859-1?Q?W7/Bs0fXINPBwm2mxVMt/0NgrD6+AV7QfwfopOpmu6HwcSAhsOBgkMdgpF?=
 =?iso-8859-1?Q?pjcYEcy4Oc3PvrZejGhZQRNOYZorr+Hn3lQP9KsfiKEpekpo9gFP8h7i4C?=
 =?iso-8859-1?Q?HtkD/Jy/+87/3H1/N7cs6IO/CWbjvIEDgZBwWoForwibLqJ4HH0QI7TBju?=
 =?iso-8859-1?Q?FR7GaJHYwS8PAMnWbHSEMZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lCH+RsoikKdIFEDN+PWR3DMVeWEaFvQ5nc8UANTyqs9pcfCMtBONzGAPlQ?=
 =?iso-8859-1?Q?UpweR9Eby3WPyIulSEDa3POoFuJd6AoD8syrI1wiPFu3i/soKKv/HZBDvh?=
 =?iso-8859-1?Q?ybfrUdUR/q/SXik6olsfBka5d5aL7z7k+giijhSD1ZGXoIbP7f3jyvzcuX?=
 =?iso-8859-1?Q?5KJcLBdCYoSZzUNYjA+iO3cYj6UniMkk9j+bFsl733MW2xSjsYVkw3zrgv?=
 =?iso-8859-1?Q?6Mpfxo9Cn6eu6cjuQuy/CauwcnxMVyrY1IbcI8MNzHUfkHue1t2BO7PM7v?=
 =?iso-8859-1?Q?f/CcLogs1QLX90VxDIcvjptEvRzY2JjpgHxutnqPAU7EtQynKBZcPmV0zi?=
 =?iso-8859-1?Q?vLS8C/vm5PvzJ++Ho8tojPbpqX/H7KF0KcTbms3UQa5fMyiUk/auFloOiR?=
 =?iso-8859-1?Q?a7L2k3Jaca8F4TQTfJfei6b3TtUUPT2U4M3IuX6fRHlaYO+18j9QOtH0vT?=
 =?iso-8859-1?Q?pzjVtj+md/3gXLYivnemvJlNLVQlXnPLowTm7TK0XexN2ah/pdJliy6iId?=
 =?iso-8859-1?Q?fnKSrFQLCM58X6hE3zTXRXxkgu4phmoBGV+qMC9vYJViJxxrIgGqzHI5rm?=
 =?iso-8859-1?Q?cjoOp1PNlMOvvltwVYbvoyNRvUIKUqYplDq/9zpWN5T0vho+zxhJAXhD/B?=
 =?iso-8859-1?Q?pRjFl1VFRz/n+jgE7mwj1bZLCfOXAlfwR7VZxpTgXGfCmF2SgsxiGpVL4A?=
 =?iso-8859-1?Q?DzTILZjwc9B5O/RdCNHwtlXDqWvcud8HaxF5indgUfngzLkFzSG+4rINXt?=
 =?iso-8859-1?Q?18i46hS90ZbzpIrlHzDX13yTums17zSiV/S/+m5WANaXXWW93bPfehGUIK?=
 =?iso-8859-1?Q?LbrdGxsJy3+ajYwrt95b7LIt6mzyV+Tx805/F2FakhBshLaKGpJJ4Z92tY?=
 =?iso-8859-1?Q?AMhX4AWfFYDH4fR9B/SGji3jqBg/c7nkAEg+rD+eW4j6XEFP9Smw9ic+wl?=
 =?iso-8859-1?Q?rAcoBuw7HdmYnkqk2YiNwGkcbJhKE8wxTej9Qt7KFJ7QgDLn5Cuqt21UPq?=
 =?iso-8859-1?Q?OpeMt2/+xVEGEdhRLEmamb0gMrvB/WIv4gJ6oCv/YLzLNxIpWL3/y3H7id?=
 =?iso-8859-1?Q?3VxE2qLOQoFVfIacUE/wl85txCP2DdypeZ+By5Ufgt6oHKE/lXQb512nlb?=
 =?iso-8859-1?Q?d2RW1D6WoSJoVRDSru4h41nLRh3ehMs+aTLUMqXIeG2EbuXjbCTKiFtquD?=
 =?iso-8859-1?Q?r16hR2Cnq3IPkF9P+6MxJNdjLe36O1L0FXsfz4ei7zCoDErrASGleXvqRU?=
 =?iso-8859-1?Q?llwcDz2HPq3jYO1t9WBSjHJq6rmOo2rtMKCUi4FYWkfhrepFFkDb39b/dq?=
 =?iso-8859-1?Q?ZXZFF/xzZO+V8a2zUtBmwu2mece07mTWMyAc6bvRgbvXLcGdQRn0kss2lV?=
 =?iso-8859-1?Q?rFzJeQRN8iZZgUJxZIADD10RigI8GYpA1VtHu4opJJrvGCLji7q8eByIz2?=
 =?iso-8859-1?Q?9bXZsbVLsBHmPKiQ/viLQJuknLnUz+iSJfQi8H/el/6etqb5G1Vxq+5SfI?=
 =?iso-8859-1?Q?pbn8bEWgBBLefiXbWx11XG9W/MIoqPi3Yp+Mc9xT0d66rVPUzEtT3AK5b2?=
 =?iso-8859-1?Q?uKNbkL0ysFhwQbln2HrPcGCvI+Zu/C/u41pD4PxWZqJtkZ0jQEmMLcH9Es?=
 =?iso-8859-1?Q?gFMc5MHCy3qqFjUj+irIw3F7ikNwucuak9p3uvxxfPPaewXibz0cPfmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c3be0a-7090-4b01-bad1-08dd776a8d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:29:27.4291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwY1R/HjfImts7EWDrsOYuqYJ0AXW9UUcOkkWZv7xv1mshxUO+Hy7IO+hzD5G80wuHupBtrEzu/i/+HEX7A57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7468

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* no change

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h      |  5 +++--
 xen/arch/arm/pci/pci-host-common.c  | 10 +++++-----
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index a87672d834..3d2ca9b5b0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -18,6 +18,7 @@
 #ifdef CONFIG_HAS_PCI
=20
 #include <asm/p2m.h>
+#include <xen/err.h>
=20
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
@@ -95,8 +96,8 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops);
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index c0faf0f436..7ce9675551 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -208,8 +208,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops)
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -221,7 +221,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
=20
     bridge =3D pci_alloc_host_bridge();
     if ( !bridge )
-        return -ENOMEM;
+        return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
     cfg =3D gen_pci_init(dev, ops);
@@ -244,12 +244,12 @@ int pci_host_common_probe(struct dt_device_node *dev,
     bridge->segment =3D domain;
     pci_add_host_bridge(bridge);
=20
-    return 0;
+    return bridge;
=20
 err_exit:
     xfree(bridge);
=20
-    return err;
+    return ERR_PTR(err);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index 46de6e43cc..a6ffbda174 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 101edb8593..a38f2e019e 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops);
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

