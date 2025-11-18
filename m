Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC5C699E0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164704.1491641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsy-0005Kz-5E; Tue, 18 Nov 2025 13:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164704.1491641; Tue, 18 Nov 2025 13:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsx-0005CU-Rt; Tue, 18 Nov 2025 13:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1164704;
 Tue, 18 Nov 2025 13:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLsw-0004PV-Q5
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:42 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7312fd-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:41 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7650.eurprd03.prod.outlook.com
 (2603:10a6:102:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 13:36:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:35 +0000
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
X-Inumbo-ID: 9d7312fd-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tf1c8OM1No0joyhFwQJj3LuuI3FSHXtmeC1NQ8OcqGOgQa9fi447qmPwrHx3CZQ/X3r9I4La4v9FB7N+uCRHwD8BY0KSo/S6Xp1yKMLdPaGOL9N067e7DpBb8zRu6c/qAa72yhE+9NKXnzehd9TLEQxiFh1L5D1dT+EY27N5XW90Ro9KCvosFmWlFeW62vVzhOMD/+Htwavnj5faXHp5Y1uEv09NHokhVEqncRo2pfCobOFdmQETk4ATaS4qiquiD+k1TsFmwYa/J1bKd2QPJ/60+ckDow+Nc29e/ez9rE7ys1/Nw5DTnTNWcZiK9Uqqeb2j4QsHJq1oqhrnMjRu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKOEHIAYRgOWqREfBlgF+TaCvomfVedYKECxzp2okn8=;
 b=raNVKwALER6IT1DtIsgYLNq1J1qWPA1j1rmuPuPRiBni2EFd0JQZjXnnxGSY5++TypiA/YDBr38KeEi8NVBcB9kGl/g4uiemT39IxCYx3IkrSKcHN5vdr9cyKzcQdpO6KkNwPQfzoWthW2NHc/K+bCarmY/7h0ZERC+6wf+/ax36+pNAOt8seoTLndCHL6tE6pN4QV8WcxnRlwANKH+9SZhcl7UucbXzzI8+Tl0zAOEW7zKtXK/CG13/aHO8vPY54S8b25/YO4L+z/mCeH0Jo6JLGl6YuWf3STEkl8j8KT94Ao9yaLv0zC1ycPiOVQ+CIh+JXgGLlrieknFEXaBCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKOEHIAYRgOWqREfBlgF+TaCvomfVedYKECxzp2okn8=;
 b=qLSxp1k612g7PrxRYBBKJaPqBO0Y8ydxcySuMPBLMObo5RTNT/V5c1k2eh8P6bnZs6tmHnqN6ivLIGjz37B+Yi8AoqM6Kwauw5mrWYLreaUIgGnAit4qu3bQYsMORt6MDrfj45DMJmLovh+Kg1PKqsaxZCSF8R3hjEB9RYxFErnSBQoPzUAGsMUctXS9f9pDe5HX+kM/YGIKEIeKLKSeIZlaD0x/1GYc4MH5sp5NIo2H/WwlvC7oR1fgEcziGNa/upWjjyQ3xZVsFatsNJyUreUVGTbRo3Kk+GYqPYDKE1efVE2hzLurU3DPhic0WYEnqkMVZWRTKQBjtUSAeNNCNg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 7/8] xen/pci: assign discovered devices to hwdom
Thread-Topic: [PATCH v3 7/8] xen/pci: assign discovered devices to hwdom
Thread-Index: AQHcWJBc5bz51R8u20uOZBtSz+TqyQ==
Date: Tue, 18 Nov 2025 13:36:35 +0000
Message-ID:
 <af67b9cbc1dff78440afdd15ebe1856fbebe98e1.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7650:EE_
x-ms-office365-filtering-correlation-id: d8f28b43-ed6e-49e8-437a-08de26a77e9a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CU8jgtdrPDXy6v6kUN9fgdmOO/0mTB7yHkka5N7qQDo89Qs6xTyjEnJwvD?=
 =?iso-8859-1?Q?5cOj9CvqNbDD/z9FV5IC7/XjZZqMFSP3iGfHxGzbe2b1yRuXVx11PyUB/I?=
 =?iso-8859-1?Q?krY/ePpL1mr2RPJo+pIoArDTOqkQdw1DkdqQRU/Gv62ypDfZf6AG5hfBYi?=
 =?iso-8859-1?Q?jIOF24zdGzdcLSU8vPX5/EaNO9MLat/ct14T1xleX+vx/6Y1wti4eMufDh?=
 =?iso-8859-1?Q?JuIV2KXHFrce4vac/pC9GU5VxCDCMcRqvW8VdL8Do+9UpBoQUa/xWtZxkz?=
 =?iso-8859-1?Q?m4Vk6FkLfrAd6LGehNV4dWg16tkydjgWmWhEgjcGxHru9hAZN+9dCzDSEw?=
 =?iso-8859-1?Q?Z+tvGbPHlQB0brIQ7u1DIw5QY00cwPtg/NispbuawP/oPo9kYnYu65tTVa?=
 =?iso-8859-1?Q?/XE7OBaCM8MYzfeZUBxP8YKP8d7QWe0jObcXvz8vTrMnlec0oK41HpYigt?=
 =?iso-8859-1?Q?mASCVDYGYXNSguuu/DbU1mBAQcEor8+ZJsDZgeeu1rvc8pJ92I44QGIKiq?=
 =?iso-8859-1?Q?L7mHcYnjESFMntiCY5AYkC4HtrO46Vtk1QNf5OjU+qyCTmYc5lxR5B944P?=
 =?iso-8859-1?Q?xyKEztkKAvDMlVzGwsD2LuLCtOXls/39yYLFpRowtttZ7fAB0JxLmjozdV?=
 =?iso-8859-1?Q?O4SMB+K6+DTq0MLtQW+C5gaPrSgQ2KWro4S6aJu0SDfGoxqkgWKdkvC1wn?=
 =?iso-8859-1?Q?NKpFGagL7hAw+3ymUJ5KQIoThqSd3iJmFK1Xb5A59UWYvo7kfcUzEM/46N?=
 =?iso-8859-1?Q?F6Vk1xdI3nzsluoblTfgj6ENZ83d41XPnCNjIpRD8pNkrsL0T1flcT+8r2?=
 =?iso-8859-1?Q?jkRe7Z4aDf4Vzkrkgzek0NgDncHMUxeyRcUwN0Qo9KatDBttMyiGJKajRc?=
 =?iso-8859-1?Q?0qStuKjxyF2eg6Dh2uP7A0kCwQ4G+9FNDF8zQSSDjtQwCeEVso6yJPUuyE?=
 =?iso-8859-1?Q?W5MOJn9JOiAOxVLFKLO2pXq8ll8Mc+uADpvKT+jgHjQyuWdhM9bBof81oC?=
 =?iso-8859-1?Q?vVC8wBPCGuvKRDtTsbnqJ3JKmnKuAEqFFecsCWSOyhMZoCweR53PCPqQzx?=
 =?iso-8859-1?Q?NgIDjtDZjko1HUkfJKpQV+I0gFmVMleF5q11fYgf+nQTqey9EAXIl3Am7N?=
 =?iso-8859-1?Q?vQfKkJioo3mu3eEP5h48cxcEFvUw8mgUkEamXlnPrgZTyNx1oTNBHfZPaz?=
 =?iso-8859-1?Q?K4/Psxb0xzkqhPapwTi/W8KHPeCMVFa3NA4FJW2puXCGKggD045K2Vbji/?=
 =?iso-8859-1?Q?9WeYzCJ2vvBnMZ5zM9x6o8Wt/AsmjXrr6ix/uF3bCmkmv/mAoDSsE9uRm4?=
 =?iso-8859-1?Q?96v6vO+tCeHkr1l2SCOCHWxEvA2PVnz3l/jqkHHud9IxE0adobRmp32dyi?=
 =?iso-8859-1?Q?32b9i+GrcbE+XZnqy+aQA+3NiIfY6tzrmZW7gkOXbEzsrLJwKtx+LoBVn4?=
 =?iso-8859-1?Q?Nujd+QLNWZMBA51JuMpZCfuBYNgYXRKE2HGrux4c3LYJVWz0vpw7WXrcf3?=
 =?iso-8859-1?Q?J12D/VeeqHRj0F7fTsD7HRDYyvOMZ+/e6Ris4/h8p8ND+NFhY5bRNYVnog?=
 =?iso-8859-1?Q?lT5hrrEjzV77UV+5THjhzeV8pxxZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8qcQvoGBqkC9ck3r/qH0AlyElqc1ys4asYoheJpDytDEcRxjQ+UorfDRW2?=
 =?iso-8859-1?Q?zo2WYYUIX7fOHQcILRQDm0g0zrxEMD5QpBNv/Xf4mzS3mPjphXK/zwv0qZ?=
 =?iso-8859-1?Q?OOOX8p7YOd0NO8aeCDY+sDjqAWMrPcJxz0VGbFVZDhwdcTnocbJ0UWuyU1?=
 =?iso-8859-1?Q?eVXKfgUH01ia10Z3PBtgGLNRZaWkj9diBHQzUaMUuMr/f9tcuiIa3vavGb?=
 =?iso-8859-1?Q?4QNOUuvFdWD62z/XwedqfLSwY1kJlWV3M+dj3YU294d4uALktRjJYB0R/F?=
 =?iso-8859-1?Q?FV43aCTgAAabVleB2HXHw1MVQ16dI6LPRGXL23+jfWdtHXDe/htwgC2UsA?=
 =?iso-8859-1?Q?Oj7lCUCowHx0rwU1cnGFXpBlo6L6RBU7bm9xs2HxKuzcjC4AbBqB1O9edD?=
 =?iso-8859-1?Q?gHO4wwszocMlH4kr/6G8WRTncFMs52Ije+6+xrti/Q05DS54i27AVyXJQE?=
 =?iso-8859-1?Q?p53kqUZf381PGPq0BKxLcWK/eJEiPj8uIiQfYCjHf5T/8NLs5S2WPrT2iZ?=
 =?iso-8859-1?Q?SMCFY4sKNs2gLKOWcIUv3P9mBkYZlG5hwYGLP9DVTBzbto68dFEEgqxbQ+?=
 =?iso-8859-1?Q?IiBa7fRy7DyGw8ycavBFujO1cvnA0KAkoFqDsJm/8cWNjNdHn6C4+pJCni?=
 =?iso-8859-1?Q?kbFlHTNyKw5Ske1bsw8YeKozsOWYDSaAqooWCvpXVHOXQ3mpPDfvNOap9E?=
 =?iso-8859-1?Q?bQJwiRTNrdbHV5wkNAzO/aQg7mjl74MyxSg1P7puEOFtZVrNI8tioyOa/H?=
 =?iso-8859-1?Q?1THsH/2y3cSZ6RhB6H5v4TaCrnqWCnH8TIVxSLE5DsrJWEW5PXXnQP/H4l?=
 =?iso-8859-1?Q?QAcmhWXobM948EmkbGg+PFV0Nqp6IafTg2Bv+Jo9JTdMBVnffv5C0kEJho?=
 =?iso-8859-1?Q?J+QBrZHPGNaLKTeQkR9EUGRG/ky8o580l5x5zxceynZLCg4504f44md1+A?=
 =?iso-8859-1?Q?nImmANliH+0tvRGFB2Y/UjMsVfS9bGWVkMs+JgY43hEnUjBKMO2ckpUnuk?=
 =?iso-8859-1?Q?vEUI5kTrQUtXinyZ9ftzpYjvceNacdDBtMPWBONA7jOXL/Lk7rq1htUiVQ?=
 =?iso-8859-1?Q?QL9hU3TFDXOsr+H7AeJj1p8CzqIZLiB+I2SDZ4br9Y5b1FpkF0+gC729e6?=
 =?iso-8859-1?Q?Y8EqIfvV+rYk5o7yO0O3jcEVhWoeX65ZbyrRszQb2OVeeNTjUyBehhI0oO?=
 =?iso-8859-1?Q?cs9RCl6ctEf1MOi7uc4J4VReLemdRGvwL5D2JxhKCtF86Y4NDKwwJtzkPq?=
 =?iso-8859-1?Q?yr3zvr87KZJgErw1WwdG5wKNPOlkuDDmPtmdfR68A90HPpLUzbLgfjG/yO?=
 =?iso-8859-1?Q?DwowPyuZSiST1VFN1e6263BlmZgSGY3J1QF8FrFRWqGn4ZDFxXoGkswUyj?=
 =?iso-8859-1?Q?kBBR9nUsbhYFF9Vapul2zp1/HmRt1nu5QMnygejtOo9DI6AYS+qb8ZUG11?=
 =?iso-8859-1?Q?wttt4bboVcGMvstoS8mS78pbNNroDHA2yZ0PuVcVPU0T+Fjo1vSI9rxjY8?=
 =?iso-8859-1?Q?o1JmqkT3+Px5e/zvskL4I9zwvKKf0hPCsVzS1Q8Qrt2voZYYcHttYcpEK5?=
 =?iso-8859-1?Q?6KF++7sbMrVzvXUZA+By53qjNQ2LKBTgDdnwI2OVbmJJtv5N1D+khPBUHc?=
 =?iso-8859-1?Q?SVCcCQjnZR+B7e9a1VsKLV8g/UG86dZ/3PEJ5HqAxGiVgjHAPhAdMRcw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f28b43-ed6e-49e8-437a-08de26a77e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:35.8148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q/UYv7Nbe19fceVfoBCjacGCWf9bLVX+8NOrSsO2X7LubjCUkzLTM6FXJig95JkzZQ9iW4snmoSjdsGUtsW/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7650

From: Luca Fancellu <luca.fancellu@arm.com>

Hook up existing PCI setup routines for hwdom into Arm iommu
initialization sequence, only assign endpoint devices.

During scanned PCI device assignment, also permit access to the BAR
ranges if hwdom is using vpci and hide host bridges from domains that
use the fully emulated one.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* style fixes
* rework iomem access configuration

v1->v2:
* add host bridge hiding
* fix build without CONFIG_HAS_PCI
---
 xen/arch/arm/pci/pci-host-common.c  | 11 +++++++++++
 xen/drivers/passthrough/arm/iommu.c | 15 +++++++++++++++
 xen/drivers/passthrough/pci.c       | 11 +++++++++++
 3 files changed, 37 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 28c26af9eb..110c334f59 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -430,6 +430,17 @@ int __init pci_host_bridge_mappings(struct domain *d)
         unsigned int i;
         bool need_mapping;
=20
+        /*
+         * Only allow iomem access to ranges if we use pci-scan
+         * Actual mappings will be handled by VPCI code.
+         */
+        if ( has_vpci_bridge(d) )
+        {
+            mr_data.skip_mapping =3D true;
+            dt_for_each_range(dev, map_range_to_domain, &mr_data);
+            continue;
+        }
+
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
             paddr_t addr, size;
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c
index 100545e23f..124a99f198 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
=20
 #include <asm/device.h>
=20
@@ -133,6 +134,16 @@ void arch_iommu_domain_destroy(struct domain *d)
 {
 }
=20
+#ifdef CONFIG_HAS_PCI
+static int __hwdom_init iommu_add_hwdom_pci_device(u8 devfn,
+                                                   struct pci_dev *pdev)
+{
+    const struct domain_iommu *hd =3D dom_iommu(hardware_domain);
+
+    return iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev=
));
+}
+#endif
+
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
     /* Set to false options not supported on ARM. */
@@ -142,6 +153,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain =
*d)
     if ( iommu_hwdom_reserved =3D=3D 1 )
         printk(XENLOG_WARNING "map-reserved dom0-iommu option is not suppo=
rted on ARM\n");
     iommu_hwdom_reserved =3D 0;
+
+#ifdef CONFIG_HAS_PCI
+    setup_hwdom_pci_devices(d, iommu_add_hwdom_pci_device);
+#endif
 }
=20
 /*
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 52c22fa50c..70c21403d5 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -20,6 +20,7 @@
 #include <xen/pci_ids.h>
 #include <xen/list.h>
 #include <xen/prefetch.h>
+#include <xen/iocap.h>
 #include <xen/iommu.h>
 #include <xen/irq.h>
 #include <xen/param.h>
@@ -1041,6 +1042,12 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
     return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
 }
=20
+static bool __hwdom_init pdev_is_endpoint(const struct pci_dev *pdev)
+{
+    enum pdev_type type =3D pdev_type(pdev->seg, pdev->bus, pdev->devfn);
+    return type =3D=3D DEV_TYPE_PCIe_ENDPOINT || type =3D=3D DEV_TYPE_PCI;
+}
+
 /*
  * find the upstream PCIe-to-PCI/PCIX bridge or PCI legacy bridge
  * return 0: the device is integrated PCI device or PCIe
@@ -1221,6 +1228,10 @@ static int __hwdom_init cf_check _setup_hwdom_pci_de=
vices(
             if ( !pdev )
                 continue;
=20
+            /* Hide real bridges from HWdom when it's using the emulated o=
ne */
+            if ( has_vpci_bridge(hardware_domain) && !pdev_is_endpoint(pde=
v) )
+                pci_hide_device(pdev->seg, pdev->bus, pdev->devfn);
+
             if ( !pdev->domain )
             {
                 pdev->domain =3D ctxt->d;
--=20
2.51.2

