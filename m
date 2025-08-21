Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6AB2F4F3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088343.1446122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KZ-0005g5-I6; Thu, 21 Aug 2025 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088343.1446122; Thu, 21 Aug 2025 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KZ-0005dz-Dq; Thu, 21 Aug 2025 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1088343;
 Thu, 21 Aug 2025 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2KX-00059V-NV
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:15:37 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c75d78d6-7e77-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:15:36 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB8021.eurprd03.prod.outlook.com
 (2603:10a6:10:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:15:32 +0000
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
X-Inumbo-ID: c75d78d6-7e77-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNpdJNdtXrR6hQ2HUIvFRCzAclbMbe1CDWS7qinLLiiA4PX5EvH+edGQGaACJI2IJ8f6QOmTa2E6+x0cLo5Xeq7CF4ywERopyps5XHJcgyTBYsSLvvl3JB5/2WqOD7NtX963yyGo4T1tvypyE2mHqvkn/2WbjsEVHe/uDbv9OHaBoegy8vJYF9skaQVVfVv0ESht9rbFjk0CZZZkFGO+APKwCpbR8iExxmTBVAHCi9jzYl8xwo01BkJBkHniqD2XqRSO4O+XdZNCyCEbE6sydJQy1BWBEmksLTqeUq1p7JMZfeSIaX5iCJ30RdFOZ6vd/dZ1YF0RVFMoVyRQWq6e7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEdS59Qj5xcfoCBpIw5A6C+0gIZvvX9q5H0QzLIa6fQ=;
 b=mM57vObkZyzW+fwvbh4W9sU3nXxE5HBBJVq3eT0jjgbjjuhIMw+lU2hw9pcxdIPx4Hm2OLeTAv9p0/y378PqRPYHu1HALS28okq0/HL6xcbljqfLoLVfPdJNUzt/LZ8tyEAaH6qzRgyMx/S16WMknqlAQCMgGErgbkMCMzLsofPTJnn5HHzZwwUhmTkwXYrHJCreYAGJZ3v/4ByeBImOchH0ZIEzFKiTgE7d9whE32aaD8Srj5YHIfjgv65AwlDMWJjplg7q2MaB0efYaTymqAkZNtEO4zdkJ8LEiGk5M76Dx//jiKJGcKTrtB/lre9YukQFAO0YWwa8M3zuOKf84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEdS59Qj5xcfoCBpIw5A6C+0gIZvvX9q5H0QzLIa6fQ=;
 b=stxVimkMMuT4SUtNHihKccYDrjLahp7EgEKTemi/qnpBb2vSn6gAZGzENmOPrlJ/TKTITq42bxba5o1+Y4wQAimXggmzPOg9MLJwStSVD7wONqr2MuVWa3AulArHPPQiDZj5D6F6TrwtpyivKDifaFmc/4deHRxlu3nFTdy8W5QeyO188hI5STIN1hl6ohwqXz8rgG4r6eT1u/NZh2tIikyWBXuC7WAMJHsJWgF3p5xSzwqjpjnK8GpcnSDKnGx6O7jmbk7HD5jri2sGOaCq0h+vBm0gtx4wChwv93YEhm1K+dLhx4opzmu6d1TjACv0kV3kKC8rhdTv4lWvvsHDpw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v3 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
Thread-Topic: [PATCH v3 2/3] pci/rcar: implement OSID configuration for
 Renesas RCar Gen4 PCIe host
Thread-Index: AQHcEoSG7qyUwsLndUKLnPquvcGXMw==
Date: Thu, 21 Aug 2025 10:15:32 +0000
Message-ID:
 <92af7234b27088ca707770b4ae887e0d45d68012.1755771103.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 8f45e616-9fcd-474d-9300-08dde09ba946
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?N3i8fxZIQtOU8piGz1h3mkhBLWuEYrglb0srnm5z8Fxw8PprjoPoqcxjM/?=
 =?iso-8859-1?Q?2ChYnLzURW90YM8PsG58qUNUZtAdzmRywJ2HHOsPjHEf9J/YhHtFnqHdup?=
 =?iso-8859-1?Q?xiodGFpZWWg2fcWcJwbUNfOGhi2oe0zKTddE9emqORxgsvc9ZAIYgd1dwE?=
 =?iso-8859-1?Q?zoUtQQInH/BvOzhFHEyj38C+rnBn5pFXiIzrc6AkurKREVDiiC1PQqlvDd?=
 =?iso-8859-1?Q?76VW89sE+6CXj2YA3w/MadQTZlWDO6y0WdtEnroCyuJ5CZrjzuHprU4R1j?=
 =?iso-8859-1?Q?j5O8/siIDsZU9qXR6WgeXlDZWUeAFyuZ12eutj1/k6AylldG36uggBpomF?=
 =?iso-8859-1?Q?aNKsT06+6fKbPnhH2bcMjpKuv/Jdh7TPNYoQo7yUnjPFtDMWXJFnzfVk6q?=
 =?iso-8859-1?Q?ZEpQOOXKuga5FNWwYvHo/SQjJTOQoVbyvNVn2CqXtAzOnSuf0DHaXlsMYC?=
 =?iso-8859-1?Q?6S/mdDPfo6iv1w0T0zoovSXTO0XsUy4B9YbMtmA/Hq+5u/8uKGJhsm2WIL?=
 =?iso-8859-1?Q?RKK9RJSR5cTX0aKEWiIBslx89r1PhXx/krQ0mSrlNlGEAgblFQCpIwlrAU?=
 =?iso-8859-1?Q?8xck2e4Y5psnjBXrFKfNnRsdD+HrgucVXTzrGi6xFRltxBU2Uq79Jn0f2U?=
 =?iso-8859-1?Q?1BmgQMm3x0HER10W35oRrXPbDQPXg7x+4dIVxtu6V+g+g2S1rdccoNwnVd?=
 =?iso-8859-1?Q?UYecoeaYzkWEPx4E5nNQWcWjlOhIWa2iR90ozyN6AuS0dWH3D/51awYenV?=
 =?iso-8859-1?Q?tn5sj4+a1BgkqMTOvN7I8pdX3B091r+SnDSxMJKkp01UoOQxalgDprjPgv?=
 =?iso-8859-1?Q?50emrIbBceC0GXwxk7Hb9eCZDG/KHCNUqfSdHyNpJSE/C1jEGYHcgPgpyz?=
 =?iso-8859-1?Q?ukyn4C3pC6w/SPG4TQboXPE6Zu460AJEZbXWWx88xAFTvi27OO1CBpjGt7?=
 =?iso-8859-1?Q?3CecUEMI5IRsiPaDw5I/J7s0T/nbcjthlL0vwfqxxNryO8PF6sLWqA6mcZ?=
 =?iso-8859-1?Q?dhTTrUZZwkEPs5c8yLkGDR8okGEQ5B03PJLawlq2fupH6wD98fWxNEtL8/?=
 =?iso-8859-1?Q?YdFj7BJF7ZXhp180wc6BK56xG0JXKgja1SrGxGhmxqgxbM9ePXmfyMfZEU?=
 =?iso-8859-1?Q?RZEqpxWdcUPHXuvo90MHG32l1BXz+/GiPehVzKIKAL7D/zfnsbzcqGAqhm?=
 =?iso-8859-1?Q?AoTEZH+K4bnYq/GbmpMs1g9Zd/kvZ/e+xQUa+vVI0u3xUYBzVhPh//2J/A?=
 =?iso-8859-1?Q?Q3baEYD4jsiIXFXcZX5laOyzIJLlj5cctmEfWzJR+iyypk7rYMjLDXCA6V?=
 =?iso-8859-1?Q?Z82GxGjcOfYzYiwz1zdcjUG7Z7Rd64iwysaDcHNrsLAC/Q1xJPkQM37mTD?=
 =?iso-8859-1?Q?LOEonSVibIgxyMW38G4EE6/oiHoarrNt5u/r0LtsnJ+7x+IespHlK6rwSg?=
 =?iso-8859-1?Q?2QWsalVGnEi86Bl1ZPiUnQ1FlrC9EzMviglc8x2+0nxl3XogsZUxbQfsdm?=
 =?iso-8859-1?Q?hI/jNGCcp1m9gn0U+RqbNRvg7z855AFq4VXAiNrvQ3IR8rbFMUceVp80sa?=
 =?iso-8859-1?Q?DpqJIIY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fFnSZsHxGaHJdi0uqrNBBadzVBRand4G2+gEV7Ywzlng4nfP9x4VXUwqyL?=
 =?iso-8859-1?Q?JWtOrRAcDqJ2+BCqq1JgKjtGNleTdg4xJJgXg8H6OBBlveOdYduFlDNzQd?=
 =?iso-8859-1?Q?qJnOE3qh3hO4/K78rw9hB16u6q9slLyt76O6WZISZz5bV3sm7e7I9lcbrR?=
 =?iso-8859-1?Q?OAOB6lvHkYRxONWf5SXHsoeAL8WZf7eZ/TFCbSSr/XcAL8U804RQ70AFEV?=
 =?iso-8859-1?Q?WciRoUFCBLaNbJLdjtdQ01m0eVWJjjdwNDmUMUdS6XM4yC6MF83etbf5yV?=
 =?iso-8859-1?Q?XMPYRZDiBkJ1xRznodEyhd4mtYQ6wU3bwdDfLnIBcaOxBg04wBzb+gULPS?=
 =?iso-8859-1?Q?SHIzapbFlAyBAv07kNrSRIR01WKwqmeueEpJgLmXuMgi5pKLitpaboWcSc?=
 =?iso-8859-1?Q?+7nAyS3pLxRWvXf2q23KUES9ZoKI6mJLURSBP8wUENq1+8apbtN9kQRk9Z?=
 =?iso-8859-1?Q?vh5ba++O1/UsZDkMPB+b7ssxzq0bZ+8Y6qT+jOgxj21Rnms5+3Baljv8KP?=
 =?iso-8859-1?Q?+ZKwOyQsM8NbleVQ+Kaklln4k0XVU3LvPk8tRiegs5MUFmR7nHkPq5V4L1?=
 =?iso-8859-1?Q?GEqD+rKS4xLmM13ZlyVc6EC3c390fe6NcvbYWQwxa25DEs/QPygTmNvGBr?=
 =?iso-8859-1?Q?iQsOCl4Y1+qGEe6ktTUW03vsgrTY1aQPEMJPYoYAGm2OUiWKXBTrAwyz2W?=
 =?iso-8859-1?Q?e0HYFmw4820PN5oKNhu4lw+dl1feM/z67Y24Jnr+hNEmsmXDLCZSle6/91?=
 =?iso-8859-1?Q?8vxZcc5AJHyJ2XdviR2oo1Xy14BC8A6cgUSrv2OaBeJwATXvl7/R7/ZCRG?=
 =?iso-8859-1?Q?DLTr7OEA7YMErOVZrCfK+ZO5davS7mECr3tA7X1qwjxjFBdO8J111uaWxK?=
 =?iso-8859-1?Q?DlZegw0PY/5tSxf8RcmLFXNFMEkgjzdwHDZOIPMMtkROsvUFzNYl9AcRdf?=
 =?iso-8859-1?Q?o5+TYRcg6ZmB2hDdm30Di1Z98oz3qNQCbX8ZaLLevTam0j7RxAke045wbp?=
 =?iso-8859-1?Q?0nvbcMJ7ltnkT+svrJehQDX+bjiLNQQLRXjLmXArxkNiICtOXYEfPW5Jlj?=
 =?iso-8859-1?Q?VRqN7+leVwB3ucDbBWb+lXF6mZN+npeTB9cixt0c8/Ox5bc31XZHlUXN+G?=
 =?iso-8859-1?Q?HWGawJ1hD7UfRzSUwXDNcoAY8teU4ltkRcyGTA/fshfeBvm9XKPcVzBWAq?=
 =?iso-8859-1?Q?1OiDZGUatzcTzQRjQgm+N9qkx9MFd5wN8oLxTdO5DR+M0ebLpdsmxEGL3R?=
 =?iso-8859-1?Q?thIr62CBEpCVTLj6nyboGs7CzQV+2lkdbb78LhD0IPXxS3CMMuNxD6KYnX?=
 =?iso-8859-1?Q?GGMVBddLOvPVP9i32/cGHRwa1x4WUI7XbjRK3yEqgnqyXgMvbSjdwHAHhG?=
 =?iso-8859-1?Q?jWJ6swBzej+0RoUI5HXNrKsUE4Ze9CLBOqOyZtbD/siYusaAdE6decjMkP?=
 =?iso-8859-1?Q?sAYpxox8tq1wJBxmEf/dub3q5BqtGnOaqln7zGAM5iU47ERKHW7Xbxm4Xt?=
 =?iso-8859-1?Q?kAgLaSPd2u4VPj3dEAsfR0EyBCch+SwwGvcylmPcCy6mOXfXGSwkWw08YJ?=
 =?iso-8859-1?Q?phtvk4HReSeF71AYVSpmaoDm1MWCftL6Oa8QXEjvm16GJ3i2iRVjXQt0b6?=
 =?iso-8859-1?Q?x0zolP7/yeP6aoac4v5FE/ivLUBmjLgKrcYqnml+GZFZJ6gKp6EM4egg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f45e616-9fcd-474d-9300-08dde09ba946
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:15:32.0551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdFDEB2lf56+tb7BdlNRNOi9TjfgESmEleQaZiolaQmSCAP50IatYnObFpQJyjnCnKDJjWNMZiD+BiXcJ2yEag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8021

For IPMMU to be able to associate a specific PCI device with it's TLB
the BDF to OSID mapping needs to be set up in the host bridge. The
configured OSID is then emmited as a sideband data on the AXI bus during
PCI DMA transactions. OSID configuration registers are located in the
"app" region of the host bridge.

Map the "app" region on init and implement methods for setting up
BDF->OSID mappings

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2->v3:
* no changes

v1->v2:
* add Stefano's AB
---
 xen/arch/arm/pci/pci-host-rcar4.c | 148 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h |  18 ++++
 2 files changed, 166 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index 62d2130a63..9290c6cac5 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -16,6 +16,32 @@
=20
 #define RCAR4_DWC_VERSION       0x520A
=20
+/* PCIE BDF-OSID assignment */
+#define CNVID(n)             (0x700 + ((n) * 4))
+#define CNVID_CNV_EN         (1U << 31)
+#define CNVID_OSID_MASK      (0x0F << 16)
+#define CNVID_OSID_SHIFT     16
+#define CNVID_BDF_MASK       (0xFFFF << 0)
+#define CNVID_BDF_SHIFT      0
+
+#define CNVIDMSK(n)                (0x780 + ((n) * 4))
+#define CNVIDMSK_BDF_MSK_MASK      (0xFFFF << 0)
+#define CNVIDMSK_BDF_MSK_SHIFT     0
+
+#define CNVOSIDCTRL                0x800
+#define CNVOSIDCTRL_OSID_MASK      (0x0F << 16)
+#define CNVOSIDCTRL_OSID_SHIFT     16
+
+#define DEFAULT_OSID    0
+
+#define NUM_OSID_REGS    16
+
+struct rcar4_pcie_priv {
+    bool init_done;
+    void __iomem *app_base;
+    DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
+};
+
 /*
  * PCI host bridges often have different ways to access the root and child
  * bus config spaces:
@@ -65,17 +91,139 @@ static const struct dt_device_match __initconstrel rca=
r4_pcie_dt_match[] =3D {
     {},
 };
=20
+static void rcar4_pcie_writel_app(struct rcar4_pcie_priv *pci, uint32_t re=
g,
+                                  uint32_t val)
+{
+    writel(val, pci->app_base + reg);
+}
+
+static uint32_t rcar4_pcie_readl_app(struct rcar4_pcie_priv *pci, uint32_t=
 reg)
+{
+    return readl(pci->app_base + reg);
+}
+
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVOSIDCTRL);
+
+    if ( priv->init_done )
+        return 0;
+    priv->init_done =3D true;
+
+    val =3D (val & ~CNVOSIDCTRL_OSID_MASK) |
+          (DEFAULT_OSID << CNVOSIDCTRL_OSID_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVOSIDCTRL, val);
+    bitmap_zero(priv->osid_regs, NUM_OSID_REGS);
+
+    printk("%s: Initialized OSID regs (default OSID %u)\n",
+           bridge->dt_node->full_name, DEFAULT_OSID);
+
+    return 0;
+}
+
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    int ret;
+
+    ret =3D find_first_zero_bit(priv->osid_regs, NUM_OSID_REGS);
+    if ( ret !=3D NUM_OSID_REGS )
+        set_bit(ret, priv->osid_regs);
+    else
+        ret =3D -EBUSY;
+
+    return ret;
+}
+
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    clear_bit(reg_id, priv->osid_regs);
+}
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~(CNVID_OSID_MASK | CNVID_BDF_MASK);
+    data |=3D CNVID_CNV_EN | (osid << CNVID_OSID_SHIFT) |
+            (bdf << CNVID_BDF_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~CNVID_CNV_EN;
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVIDMSK(reg_id));
+
+    val =3D (val & ~CNVIDMSK_BDF_MSK_MASK) | (data << CNVIDMSK_BDF_MSK_SHI=
FT);
+
+    rcar4_pcie_writel_app(priv, CNVIDMSK(reg_id), val);
+}
+
 static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
                                        const void *data)
 {
     struct pci_host_bridge *bridge;
+    paddr_t app_phys_addr;
+    paddr_t app_size;
+    int app_idx, ret;
+
+    struct rcar4_pcie_priv *priv =3D xzalloc(struct rcar4_pcie_priv);
+    if ( !priv )
+        return -ENOMEM;
=20
     bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
                                 &rcar4_pcie_child_ops);
=20
+    app_idx =3D dt_property_match_string(dev, "reg-names", "app");
+    if ( app_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range index in device tree\=
n");
+        ret =3D app_idx;
+        goto err;
+    }
+    ret =3D dt_device_get_address(dev, app_idx, &app_phys_addr, &app_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range in device tree\n");
+        goto err;
+    }
+
+    priv->app_base =3D ioremap_nocache(app_phys_addr, app_size);
+    if ( !priv->app_base )
+    {
+        printk(XENLOG_ERR "APP ioremap failed\n");
+        ret =3D -ENXIO;
+        goto err;
+    }
+    printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr=
,
+           app_phys_addr + app_size - 1);
+
+    dw_pcie_set_priv(bridge, priv);
     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
=20
     return 0;
+err:
+    xfree(priv);
+    return ret;
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-=
rcar4.h
new file mode 100644
index 0000000000..8ac6626a22
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/pci.h>
+
+#ifndef __PCI_HOST_RCAR4_H__
+#define __PCI_HOST_RCAR4_H__
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf);
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id);
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data);
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge);
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id);
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
+
+#endif /* __PCI_HOST_RCAR4_H__ */
--=20
2.34.1

