Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F6AD6EC5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012881.1391427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvH-0004LV-CR; Thu, 12 Jun 2025 11:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012881.1391427; Thu, 12 Jun 2025 11:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvH-0004IM-89; Thu, 12 Jun 2025 11:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1012881;
 Thu, 12 Jun 2025 11:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGhi=Y3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uPfvF-0003Ie-8H
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:16:41 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5d328fe-477e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:16:39 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10784.eurprd03.prod.outlook.com
 (2603:10a6:800:262::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 11:16:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:16:22 +0000
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
X-Inumbo-ID: b5d328fe-477e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cez47yuZN4SkSK+xNo9IUFo/GiVASWRRCHFTugM9qaz4f86UyRo+7MHY12S3fG0p20rA8HWR4AjnQGlEh+zpuq1ItVOFEqxOwCXcM/FVpZqL/vEC0s96y5Lc4yZkKaEiw3u3UV+zqRoV8ym47C6v5wvK2t9UhGF5NoB5SbOZ2MrgZnZ6CoNUji/IBZlz4xo+OwQ0JeUBdG/ydO7t1C3dQh4aAxiswJki8u4sdUjCSs25tM0dxQyXiaa648xMKIV6QEzNQNIi5Cg57zoL8h6HPZQ75B/oVP9IkF6GcskV3hB6SXRn43HOSD3kWdvDhLFt9qBb4XpQ1FnCDKpfjovmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW3oPhbwyqpb63jaqZI/LnZpDkladiBWg8aHPYHwT78=;
 b=XQGXIwI8/zYht0CO7dyZciVyV80Y81C6PmryUAK7745DD8d2YEFOsNP3EcRkaYKDR6dEEfu57ambFL40ufebJNQTf2rde9IRjbMGfxOywDjeEtvkQEe1qzesczA6Qv6iANgiJkZbksDhqTOACOctfUmVE25Ma8T3Y/GYHxeTHlLgqTssSwDWRAH2mP3fCfZ9NuoCslsrF7XG0Xsk4hmmSBUWwUqhnyiITQEoVkVQquD2Z3qyIeG6u/t86HwP//rASAiP9ZOcHEqFFlsAPt6H+WbW7NSYbjzyKAzFE04aG4S4E2PTIePIIpn/QGrTsK6nc8/tDXShempt+WDrm4irTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZW3oPhbwyqpb63jaqZI/LnZpDkladiBWg8aHPYHwT78=;
 b=B1U/z5CcBlYPY/Djavx0lfW0FBCZlNdlvHPHKG6zIQ9Q7uVm6HAUbphNobSo7fcxl5R3HpWai08veXLoiELzojRE48mcMmgWxPMrTeIU9Rhce/Ye4UO2zsIVYchBcBw9yh8aOkVaH+DTV3pU4KqN68JpWUGH7JUFVoAtONM5SpWtuvLY+a/xt7GCzzICtps6XBSsEzhS8R/5E/alDTW7lK4IRYxlXXUKpDqdJVEMr8MVVlOCugU2seyY8FVlGRDKbX/KDl4LL4A0ogyNd2y5mV52uQnEbZGmnnDOWqNUCeLqUp7hADYT82McbW5Gdrw5I0UcOk+WSYZ41KUet/OINw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v6 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v6 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHb24ttPnKPJSHDUk21z2ePAbfy0w==
Date: Thu, 12 Jun 2025 11:16:22 +0000
Message-ID:
 <ebe5f2bcf63ac1c68afc97298b298d538f28a050.1749720912.git.mykyta_poturai@epam.com>
References: <cover.1749720912.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1749720912.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10784:EE_
x-ms-office365-filtering-correlation-id: d37af90b-f4b1-4330-c948-08dda9a28fed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Q9jjTBoz8mWAulFc0JJY7Cj49drX6O1w+gIdBOQ2D79UTpi2DAPV1X5JJl?=
 =?iso-8859-1?Q?LSqF1nkOixGts4ON1WBP5d7I3z5p0FcPFY6X/azaQEcAAFVEEtpApuGL0c?=
 =?iso-8859-1?Q?x4XC1SGBVzZkISQK61GS2+pwOAhW3gO6+OnyQGRb0ydgDjg6WElPRRy+wS?=
 =?iso-8859-1?Q?rskZlIlGjqj0M6m0VRrAenI+mEzOORirG9+pjmkHay0zR5Nz1aLlC+l2N1?=
 =?iso-8859-1?Q?8VPhFc98OL2CUG63hBkh+L+BIVGkbHZR9VAlIcvRyPwB2nR7C1L8k4P/3U?=
 =?iso-8859-1?Q?b3ES8EBwEUOv4QS+Dct0WgxlZ+nIvZ2FgnEBqQQXEDImVbeSuub9S6t+wZ?=
 =?iso-8859-1?Q?Hx4hCqZ1hQCjXaV3MA7Nhdz9SAvjJSRXwGVAs/k7RZIcIPgfqpitSy0qRY?=
 =?iso-8859-1?Q?nFPVmsJ6n1RQoBWcYsqx1NL943XbmtAL8jNlZRVP9JafccepORQqgFB1Pj?=
 =?iso-8859-1?Q?Jllq5GzJVxoPIz33Zg02xyv3qos6X24aPPlPGKxqjZQvH1kYyAqFDxqS1z?=
 =?iso-8859-1?Q?d1TFZ6z/yuY7a/dT3/LzQul5Z5mqSfcCsFu5ErQ59nM5NxudQkZYU06G0C?=
 =?iso-8859-1?Q?F1AGbT22rEg8AnwcOwr1P/TN2xmNnCz+VhlKGtyqI4mL/wh1h7p7SSfwH3?=
 =?iso-8859-1?Q?8cI3v2zFXGNAhtaVBsAHVz9FperwLrYRsr7C89Qt6KDaY4tYD3tLVrLX4I?=
 =?iso-8859-1?Q?TJS4U8qUubQ29mzGtfApe/VHLAP1o3xlMTen+RTwJkJv1qLZytezzUhPo+?=
 =?iso-8859-1?Q?9cGG8mltM2Y4PzEW44PpVo0adr8iAp9H+wTNrsRy6MKVhj4xj39gFqTkwy?=
 =?iso-8859-1?Q?4myS/v3fIcU7I/+whKwh03/HRuCXxR9XAPGeAkjmGbcrxgEPS4/0bKgXq5?=
 =?iso-8859-1?Q?6MG0KYgDbLodo5uEbTFLomC1X3wr2F7JG477pHq52Xr+XCUjcPnRGWWPiT?=
 =?iso-8859-1?Q?9lbQFZeI0ifRLt0ZDqV9U7clc/z25/+h1ICBzkQ3Wg5rG700KmQ7aBHl3M?=
 =?iso-8859-1?Q?noNuJZhLa5+EI6ZdIwMMMNtze2Kn2m0G/fRd/bzkGouY5ORKJWtBVBfO0e?=
 =?iso-8859-1?Q?ag2j0ky4E2V/Mh92ncpBrSCY6QoTfyEwARzE3K6ekXsbDCuNmnMLV8Ftvi?=
 =?iso-8859-1?Q?UBnCFdkN+LLtnL2jAXRnf8TVQNC/BJk5aFWMlWXoPHPNMGVQCKqdfRZSdn?=
 =?iso-8859-1?Q?nEA8Sm8m8qb7XkT8zeBg94u0pydoY/61zzqoAhZvGfLImzoOQBUTHWxpAH?=
 =?iso-8859-1?Q?KNdfdkZZiCpg/XFaa6Y0T8PU6L9Ly96JaBD4B7t4rOoZXdY+qIjzOryXib?=
 =?iso-8859-1?Q?k2uQKENkPSWqDyyciCFjuTCj3OLx0ZMqWJp40owsf6oh+L+K4pOXAmkIs+?=
 =?iso-8859-1?Q?M9YyLCqgiz/mBcdBdBGUqZOTBmNWPClP6Ks0WVZYlR5j8MeTwz+4XcTTxL?=
 =?iso-8859-1?Q?oG12SzbL21sf1F5YU85qmDH6kAk9AfUwv7Nqrp/bqafXNDab05aDzmacnr?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4MVHq0SBCQbY4gc1FfHWOWfxCGrsbH1i3B/U536UfmFtjvAn0Z0Mq2/qOz?=
 =?iso-8859-1?Q?jCqXToo8kHBl3oUS+nMiWPy3/gr03wQNFPIabxjhhuN2XvrJ/ziuWdOQA+?=
 =?iso-8859-1?Q?UCFPUoebSAgZk4QHnUozEGrIe47moKBEGHqTg36doJcX//3UMOSAUGfj7V?=
 =?iso-8859-1?Q?nDDYtHCGb9AYD6Zehmq9+vcgGb3Ngq6UNybRQlORwomlzNGrH+jNh1Vm1m?=
 =?iso-8859-1?Q?b7I24x8iRvA/WZo5w63qxV1Jt1jbQl8vfBfVqOBosfTGJ/KbVnZFGMFKYh?=
 =?iso-8859-1?Q?wm4YKb5JJPsKsalGUFBRFCYtKf1a8qE74hCB62+IPQ/v+H19UakJH4y9BL?=
 =?iso-8859-1?Q?PWdhszo2BcD5508gngIDLGDBD70MDkm9+ZlQsu1Kt81TbxKsHEjRRoT98E?=
 =?iso-8859-1?Q?MJ062nnDlDoVzDOkrx9ZhDw6kGl9qkDfjtoiS5B97y+BjRWnMwhJL9lgwy?=
 =?iso-8859-1?Q?1kJr+w1H7jvzK6HhS0odlAGsmBdtUZtlQAYMD1kOyVNsPjAMArMi0CYpF1?=
 =?iso-8859-1?Q?HAE//h0ArAB3uefk79mTbSvv8xi11KzyyfGJjyLHvPcgQaiGSGu+Ivik6S?=
 =?iso-8859-1?Q?aKsOVvG4/qUh5XQbYMcb++Hn5pt5gL4wHCdfHsw3kB5GtHQuUBmJy/Iah3?=
 =?iso-8859-1?Q?RHpS/jgyuxclICuOox7iZXli0HX5it6yvk4W7V8jgTUEsnBiFXHqcZsYIK?=
 =?iso-8859-1?Q?nVYkw80gydIDkW1XlTelLUzbd/4Q2z77oryNF+nQnijlenT2W49sgjGWEA?=
 =?iso-8859-1?Q?b08IZaDzXi8SGZwzXELn+kt8wdWJNB1+3l+nqtxfQ6O5MWT6UYczDkSPim?=
 =?iso-8859-1?Q?FI/urEgxMLn75RDRdn/xXGOZhB813ArFXKIW4bwDhChbX9jWsKWSU9zHvj?=
 =?iso-8859-1?Q?tqExtQPHh6kzUapQeFj92VyZ3jZ2MdSIyGOsuHPSRQShJNJ7CXmx8HthZw?=
 =?iso-8859-1?Q?A76JHcIO9vBP7UEvXOrao31FEgjFlmIrbkS3xSCPrv4h0G7E3PtmW24TCg?=
 =?iso-8859-1?Q?oPGsRivfPxjIYbEo+lWbUcaU6Juna7fa4rkp4kpFi4T13Nvp8Gu2pBQ1pj?=
 =?iso-8859-1?Q?p9PCcnOrx5eDknCrXMgcJg2BgR1yM2wPKwgS7bIo7XsUoisCEn9azvhFGf?=
 =?iso-8859-1?Q?3a8J6w7H0gLD1T7bdVK2ehkqS1rnkzJ5LgZKfKOlDx9TjfyEwEzDbKiUxc?=
 =?iso-8859-1?Q?YflFXUw3FEODA4wnOBzHJdKy64Wi5WJJV9lwo4rHvYcNjqf2AuIGVThs2D?=
 =?iso-8859-1?Q?OWg5HoEXsEEagOJnXH2BEwcUmCTzkh11jHFl8avBSgqzN4GHOEbGOilK1k?=
 =?iso-8859-1?Q?hvKrWC4JZtZXz/PWJZjsRnNlHzHQewkq7pbsZr4XRcooZp+poxsH5i1qMD?=
 =?iso-8859-1?Q?NSv1tyCvU03CLPqMWE8x8r5dmQ3Ysd7Epvc6WmCsvKqw4m3cvszsubOMsv?=
 =?iso-8859-1?Q?Uf8X0g/5CQLGVWpkN02u99JA21SfbJLj0cTdYUPePhw5xgYJU0V7WOF1M8?=
 =?iso-8859-1?Q?PqfXhPP0rKeQR7s1JnO1och2GmtoA82NVFASWG0sP/KKk9boHER45/9bIP?=
 =?iso-8859-1?Q?8B3eH+Im9JypgUk35rDFu1jcTkISQlgL3oFZw6o0IskLK5qr1mwzrQJrnV?=
 =?iso-8859-1?Q?xbKeNwAtsbWsxqRl4Gh84ZjfWkSjIBN1scwTWc0dnwv5M+p7qXqURDZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37af90b-f4b1-4330-c948-08dda9a28fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:16:22.0491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ggL5iwIo59yq0hmJEyLnbtQDAH2VqLbsEPFv8IAljciULWApxpQmQN3igqkvZ2EN4ZgudN6b4yFn/Tripm6QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10784

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller, specifically
targeting the S4 and V4H SoCs. The implementation includes configuration
read/write operations for both root and child buses. For accessing the
child bus, iATU is used for address translation.

The host controller needs to be initialized by Dom0 first to be properly
handled by Xen. Xen itself only handles the runtime configuration of
the iATU for accessing different child devices.

iATU programming is done similarly to Linux, where only window 0 is used
for dynamic configuration, and it is reconfigured for every config space
read/write.

Code common to all DesignWare PCI host controllers is located in a
separate file to allow for easy reuse in other DesignWare-based PCI
host controllers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5->v6:
* add Stefano's AB
* rename LINK_WAIT_IATU to LINK_WAIT_IATU_DELAY_MS
* remove unimplemented dw_pcie_enable_ecrc
* improve error messages
* use unsigned types for len
* Remove xen/arch/arm/pci/pci-designware* maintainer entry to leave it
  to ARM section

v4->v5:
* update license identifiers
* improve error checking
* use XENLOG_G_* where needed
* make macro defs more robust and minor style fixes
* add MAINTANERS entry

v3->v4:
* no changes

v2->v3:
* move priv allocation to dw_pcie_host_probe

v1->v2:
* move designware code in a separate file
---
 MAINTAINERS                       |   5 +
 xen/arch/arm/pci/Makefile         |   2 +
 xen/arch/arm/pci/pci-designware.c | 405 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h |  90 +++++++
 xen/arch/arm/pci/pci-host-rcar4.c |  94 +++++++
 5 files changed, 596 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 13f31b0c1b..470e895c7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -473,6 +473,11 @@ M:	Anthony Perard <anthony.perard@vates.tech>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
=20
+RCAR PCI
+M:	Mykyta Poturai <mykyta_poturai@epam.com>
+S:	Supported
+F:	xen/arch/arm/pci/pci-host-rcar4.c
+
 REMUS
 S:	Orphan
 F:	docs/README.remus
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
index 0000000000..47dd2dd4c0
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -0,0 +1,405 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
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
+#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffffU))
+
+static int dw_pcie_read(void __iomem *addr, unsigned int len, uint32_t *va=
l)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, len) )
+    {
+        *val =3D 0;
+        return -EFAULT;
+    }
+
+    switch ( len )
+    {
+    case 1:
+        *val =3D readb(addr);
+        break;
+    case 2:
+        *val =3D readw(addr);
+        break;
+    case 4:
+        *val =3D readl(addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
+static int dw_pcie_write(void __iomem *addr, unsigned int len, uint32_t va=
l)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, len) )
+        return -EFAULT;
+
+    switch ( len )
+    {
+    case 1:
+        writeb(val, addr);
+        break;
+    case 2:
+        writew(val, addr);
+        break;
+    case 4:
+        writel(val, addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
+static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t =
reg,
+                                 size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+    int ret;
+
+    ret =3D dw_pcie_read(addr, size, &val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Read DBI address failed\n");
+
+    return val;
+}
+
+static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg=
,
+                              size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    int ret;
+
+    ret =3D dw_pcie_write(addr, size, val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Write DBI address failed\n");
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
+    if ( val =3D=3D 0xffffffffU )
+        priv->iatu_unroll_enabled =3D true;
+
+    printk(XENLOG_G_DEBUG "%s iATU unroll: %sabled\n",
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
+        printk(XENLOG_G_ERR "Read ATU address %x failed\n", reg);
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
+    if ( ret )
+        printk(XENLOG_G_ERR "Write ATU address %x failed\n", reg);
+}
+
+static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
+                                        uint32_t index, uint32_t reg)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    return dw_pcie_readl_atu(pci, offset + reg);
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
+static int dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
+                                            uint8_t func_no, int index,
+                                            int type, uint64_t cpu_addr,
+                                            uint64_t pci_addr, uint64_t si=
ze)
+{
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
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+                             PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CT=
RL2);
+        if ( val & PCIE_ATU_ENABLE )
+            return 0;
+
+        mdelay(LINK_WAIT_IATU_DELAY_MS);
+    }
+    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
+
+    return -ENXIO;
+}
+
+static int __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
+                                       uint8_t func_no, int index, int typ=
e,
+                                       uint64_t cpu_addr, uint64_t pci_add=
r,
+                                       uint64_t size)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if ( priv->iatu_unroll_enabled )
+        return dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
+                                                cpu_addr, pci_addr, size);
+
+    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
+                       PCIE_ATU_REGION_OUTBOUND | index);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE, lower_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE, upper_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT, lower_32_bits(cpu_addr + size =
- 1));
+    if ( priv->version >=3D 0x460A )
+        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
+                           upper_32_bits(cpu_addr + size - 1));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, lower_32_bits(pci_addr)=
);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET, upper_32_bits(pci_addr)=
);
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D ((upper_32_bits(size - 1)) && (priv->version >=3D 0x460A))
+              ? val | PCIE_ATU_INCREASE_REGION_SIZE
+              : val;
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
+        if ( val & PCIE_ATU_ENABLE )
+            return 0;
+
+        mdelay(LINK_WAIT_IATU_DELAY_MS);
+    }
+    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
+
+    return -ENXIO;
+}
+
+static int dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int inde=
x,
+                                     int type, uint64_t cpu_addr,
+                                     uint64_t pci_addr, uint64_t size)
+{
+    return __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_=
addr,
+                                       size);
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
+                                    pci_sbdf_t sbdf, uint32_t where)
+{
+    uint32_t busdev;
+    int ret;
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                    PCIE_ATU_TYPE_CFG0,
+                                    bridge->child_cfg->phys_addr, busdev,
+                                    bridge->child_cfg->size);
+    if ( ret )
+        return 0;
+
+    return bridge->child_cfg->win + where;
+}
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)
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
+        ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                        PCIE_ATU_TYPE_IO,
+                                        bridge->child_cfg->phys_addr, 0,
+                                        bridge->child_cfg->size);
+
+    return ret;
+}
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    ret =3D pci_generic_config_write(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                        PCIE_ATU_TYPE_IO,
+                                        bridge->child_cfg->phys_addr, 0,
+                                        bridge->child_cfg->size);
+    return ret;
+}
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr)
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
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops)
+{
+    struct pci_host_bridge *bridge;
+    struct dw_pcie_priv *priv;
+
+    paddr_t atu_phys_addr;
+    paddr_t atu_size;
+    int atu_idx, ret;
+
+    bridge =3D pci_host_common_probe(dev, ops, child_ops);
+    if ( IS_ERR(bridge) )
+        return bridge;
+
+    priv =3D xzalloc(struct dw_pcie_priv);
+    if ( !priv )
+        return ERR_PTR(-ENOMEM);
+
+    bridge->priv =3D priv;
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
+    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", atu_phys_add=
r,
+           atu_phys_addr + atu_size - 1);
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
index 0000000000..7efb1dc9a2
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ */
+
+#include <xen/pci.h>
+#include <xen/init.h>
+
+#ifndef __PCI_DESIGNWARE_H__
+#define __PCI_DESIGNWARE_H__
+
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
+#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), (x))
+#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), (x))
+#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), (x))
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
+#define LINK_WAIT_IATU_DELAY_MS         10
+
+struct dw_pcie_priv {
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
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)=
;
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)=
;
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr);
+
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops);
+#endif /* __PCI_DESIGNWARE_H__ */
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
new file mode 100644
index 0000000000..62d2130a63
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
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
+        .init_bus_range         =3D pci_generic_init_bus_range,
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
+        .init_bus_range         =3D pci_generic_init_bus_range_child,
+    }
+};
+
+static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D {
+    { .compatible =3D "renesas,r8a779f0-pcie" },
+    { .compatible =3D "renesas,r8a779g0-pcie" },
+    {},
+};
+
+static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
+                                       const void *data)
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
+.init =3D pci_host_rcar4_probe,
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

