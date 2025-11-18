Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE85C699E6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164706.1491668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLt0-00065D-Pt; Tue, 18 Nov 2025 13:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164706.1491668; Tue, 18 Nov 2025 13:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLt0-000620-LL; Tue, 18 Nov 2025 13:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1164706;
 Tue, 18 Nov 2025 13:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLsy-0004PV-QH
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e8b6f8c-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:42 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7217.eurprd03.prod.outlook.com
 (2603:10a6:20b:26d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
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
X-Inumbo-ID: 9e8b6f8c-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcVm8N55xdEMAEBPDMW6b+jg0V7djeIZHf0XPEIF0wqAhiuH+vy/zQ6Blva++d+1vOzG3K235KS/dEXmSdRR7ZopmEI+AwZ0MiZ/u4XIYghN6P0fcfSCZvYSjjqGqfqOZn094sZkAcSlObiVKrCkW8WjhUZaBuw7GPblQLWizij61kvoUHextBhapRhjSG02MuO86TD7IB/sg0YlQTSwDVBJqkWNrjEsUqhrWIhUjQXUwqNT7wJcDD4l7m2+evhkaKWc3ElMXuvPXNZv6QrKf8WNCoWgaXhTSi6arsLC3VvC2Qf2Z8gArrIu9bSYTDTXI/zv0+4bkA4jJ90GdEOJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5toO1p7HM6sy4CzbYFdVDRmwNAwzJNlRltMnSAEZo4=;
 b=ch2yLWxiIM2sXJwKQ3Z61UJWBIgcS2DR4NpKN3kxxGbC08YxXh+jjTBrrzJXXBijV2MYVrQBQ4/3eoQPmQFbfkEdmfkkfSxLaITuvAOXm8JuFBliiOv0VVzb7KAP5wVaQp54GkllZYiOzXZ14vqEa1SzYrZnoNN5U/my+9TeY3Y/e/B6YswT5XIA3DcMHcuHsvzMrsBUFWDL/QoEM6uHLBwSBxwygpKJxqpqit3WmDNTzai9TA2sgT5m06oQGvyPWF3cLWOMApobsXamQXGjURRjGLh2oNp1VOMzxSZ4mwPZTJmQ2QnuWtCaV1Z5/ZAM217e6W/xD6KPJGorwuPjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5toO1p7HM6sy4CzbYFdVDRmwNAwzJNlRltMnSAEZo4=;
 b=tFqSSmQG8LvDQPvEwNnl6/DwbEPSJUiWVRJb85+OkhnM5/Ray52toqAEEuo+n/GBEklc28GiWf02h46Tk+KIZ3qu80Yj4iHTxTSCpKiEN4+eOEQeNa61/mloQ5VABsbUjkvLw7dDeuotNxlV3mbJvZ44YX1z1oNbzU7GQLsgfx2suexgsd9k7f1xGSwcBOAjtyZQ3jzA5Bmie686336E+RG+in51s0DwRMIGSdGIKdKp/DS86WALIrfv2+6FTjcF7c/CKMwG8j1rxW8UVH2MRgKrX1sputQWDB+P8CTpVMetohkkFy9KOlS1h/8a2v2dIysmHamAopT06f8w++cF3g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 6/8] xen/pci: initialize BARs
Thread-Topic: [PATCH v3 6/8] xen/pci: initialize BARs
Thread-Index: AQHcWJBbzP55AknCK0ePM8b3+jQIaw==
Date: Tue, 18 Nov 2025 13:36:35 +0000
Message-ID:
 <20b26b4a3f180139971105ee1b23cc4b0a82092b.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: 49be56a2-b3bc-45b1-00d6-08de26a77e4d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rQe9B5mUvRF/UAxSZDMDAbocGgdbKrJdcz6LV3vVLGMoWI7XKwjpn0Q3MG?=
 =?iso-8859-1?Q?PqwGvrTjQDeDNrqjmBU4AR+h20wg22KGbdlR8/LEOZsdPozFVeJ4BRpm8e?=
 =?iso-8859-1?Q?wvfbES/gPrVsBY14mrYJrmOlo+VxHQeHoES6owF9jNkohWqtB82k/GJQh9?=
 =?iso-8859-1?Q?/EKNuHIPVM8z+VRv0iZqJmAp7kDaa28gsjSZSvGzfg86ar6FOGok6Z4rgC?=
 =?iso-8859-1?Q?tkWJqe/TBwC1LeDAS1MIf8IjKxTMJqsSXHC0vLsqrSWQmIKLMr87vhbu5C?=
 =?iso-8859-1?Q?zsFKKG2yidfaaAH++uaHMaKxzS0fFvoOVdRKqDn9uw3/WafqBu2K24pjIe?=
 =?iso-8859-1?Q?y6JRRWtpJDSxy+t3lX2m41e5To2ipTlhXBKmdRdGsZWPJvUucEmY2qGEPj?=
 =?iso-8859-1?Q?l91qKyoD7O7y8VEumaXdV2/m6LXi2uSl4ExTKelgPpYlv9+YMlX/e62S1Y?=
 =?iso-8859-1?Q?6r2SVUgt+5TdQmHFl/EOE2XvdvBZ5lFMUnPYkoRuI4cfmU/04ZklVbhxCf?=
 =?iso-8859-1?Q?Jk8zOG8tbT8AK2PPqETbX5qnx2iLzA7sHX+zcGQA6dgULHG7qk2IVMyers?=
 =?iso-8859-1?Q?3F45/xtQ7JaDsXSOKakrQJJVRk16JSz9SRFYGly+jQuy6C6AP/PQoaxmZ3?=
 =?iso-8859-1?Q?/N0VkpWqxuX3O17TBiy1/8Qpxj19va1fiTCsDsA4hXZlAuHnp3FztgT0w/?=
 =?iso-8859-1?Q?Gukff5lnLL/84iXym8PqC4z2gNBPltLYAOzZFm6XoeNxy0kQt8gAnstJya?=
 =?iso-8859-1?Q?Lo+iQRFgy31Aescg6pjCQecOV6zbKkRvmlub/LMOXoFpisim0r2mmkXSyv?=
 =?iso-8859-1?Q?w6yeVD2/D5DP4IItV+XsKfbhPGoS4iaHYmomrZsYl06LCTL9oBbh+aCLux?=
 =?iso-8859-1?Q?R4mZ24IcJzlOUIB4eNFPByBVrED75QNGykjxD/51ad4287doUP3/3iOxBG?=
 =?iso-8859-1?Q?MpCs1kE6nT2q64mhis+1KqgX+R2FaHRJfpH1K7TbLSUkrpcgtLgS4a6SmW?=
 =?iso-8859-1?Q?ft2vXzt3T9vhSRgdvSD+Q4ZC7WouPptGz0OxBsW12xf8JGDGa57p5UpLOk?=
 =?iso-8859-1?Q?nokXMYFtK9bet9g7kw6jUCEbaENJ57uxKasWSGZl3jNXGCrKq77jHNt2Yu?=
 =?iso-8859-1?Q?2ztMO3xruDkFO9y0wIDE7MgDL8BKUSSya7qGI3PnGu4Gk8cQ/FUg3PmWUe?=
 =?iso-8859-1?Q?7eOsgK0fkmAU4Hj+Z50I8SgMnXKYNNrRE+TjS+rNHYCfsGgd0IT/fTDlZ+?=
 =?iso-8859-1?Q?OWG61HbLDm9mZk52GZ6hzBE8H5c/MKGjq01Vensp8NPJhRRfGv7hJBNAXM?=
 =?iso-8859-1?Q?pAvNhN8JQTux5sbDaBbqaTZ7WRd7f/3nmV8C4JdMfotkMU55tiMZn+PYzH?=
 =?iso-8859-1?Q?ygNbO62ePLRKbsPrXPlnmlMqGJm9sjCFktC7CWfRSbUMf8nf+8AWw06A8C?=
 =?iso-8859-1?Q?5sw3aNdN10rKstjNuTH7O8lCysXWD1jLjaPqi7D9HSHkESrigVGpJsAlew?=
 =?iso-8859-1?Q?cn+N1ERl6JVhKamDxPvCFUJpumSENtbbx9MKfPeMwKyL/rzbf/zYu8JFR2?=
 =?iso-8859-1?Q?iguUAl/16TJThNpmigd6pyQKT54/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2m2hGsY529pgOX8jjzWVC6+4vRgsA9uOFoGQW0hONQIzjQY7kOeGzVFKWc?=
 =?iso-8859-1?Q?5En13niW0Z8exbPln2bmc+79rj8oDDNgzdl4G5CwZLbBP9u9NPib81C2rs?=
 =?iso-8859-1?Q?01kx5XYViPx6iRh8h3bLaTFp6vviYESg7mkkeG9KUABboq6u9tW6+vif/c?=
 =?iso-8859-1?Q?tCFgSuXdk74kcPmnlY2LVBMpWi4Y/2bScP3wCmbgoq7swRdj5PIOJyfbHM?=
 =?iso-8859-1?Q?FBSY5PjJ/L8Vc+BHqccqkCNV2yAl6OoeOWsh/mWZiDb7eZLK/73oiSbG91?=
 =?iso-8859-1?Q?112LiYEeibUolGkrQ/qhxg/vZ6jbodCsgYFPYRx9Lq/o4TGWwgm6VNgBUt?=
 =?iso-8859-1?Q?qWfM5uB/DFq8zt+MIR4BlpeliwoG1VJiZO5jSuaSv/gI5HbLOyjuVhcvtH?=
 =?iso-8859-1?Q?eRsOP0/IICIqpH8tQweihG7kVWfmwktu95IPW7ziJXZXJeiduxh6oTicz3?=
 =?iso-8859-1?Q?HFY+7nTGYkNMdVmBUR+JUXW9E3mEzUr5kHPG9WywFH6U0n0zEIBqrV9aII?=
 =?iso-8859-1?Q?Z9ZdVOPMLT8dAH/qdDk44NP0CIHSRbuMbESM2dLsquCDRWmW+sZf/PPJa/?=
 =?iso-8859-1?Q?d/rNr7cbK14AFXCqYcue/WbydwqSktz8bBhAaDIaMl0f4sKl3ZKLk1NN8J?=
 =?iso-8859-1?Q?rcSxkyxWoWef4sdIs3nksiunhdzFs3xAMQB2AQsojICU4ayLoxkjojFgQA?=
 =?iso-8859-1?Q?ATaetRSevWkXjrQZaYVAIu1Lj7F3UmbxmhMyfU4SUgDD88eygtseD6YPH9?=
 =?iso-8859-1?Q?v7LGaqt9LHYaeQSnZfQAzTbkJBbaYLBAoEey6Kk8xLz4nO9SGVbYYI3j/f?=
 =?iso-8859-1?Q?GXD18Xk1OAco2YKw7DZ3FKcNkixE86eTxDzPqthIxAkavl5u0UtOEemulG?=
 =?iso-8859-1?Q?F76VDBWwv7y7xb550j5i5Cc7WtjMlJ8h+P3F04DDfS7V+XBVKeQquU+Dpb?=
 =?iso-8859-1?Q?71Oka7h13sCqZbvxFnNKWd0BVL24z1sLy2h77+4XSa7vrtoypyS68LY/bF?=
 =?iso-8859-1?Q?8Ec52K7QFiJa7DAm8ibM01hlcuUqfte9zZ5VnGjhTT/J+FUYDwWsM9+kA8?=
 =?iso-8859-1?Q?yjzngboh+LuXQCbSVplnFBvJlGFFm5QWJAYXK44ayUFYS+QNdpoLHLsf+V?=
 =?iso-8859-1?Q?muqFh5pZYt+CLGQz6QpqCPcSsWG9eFaCyPPbOfPsE0d/6RRO/g1HPVeaRW?=
 =?iso-8859-1?Q?47zV1M5w48Q0hFrpej/7PlfSM1N10UXIlMQg92pp9sVP8h8sb9V1FgyTTG?=
 =?iso-8859-1?Q?dbSS/GCEq0iUl2iJ8WJg29UnZPjmLVP1iZpM6/Atpg/L9J1Uo3rjDq3VvS?=
 =?iso-8859-1?Q?dxYJIpN40W0pUUcHK0kG5TbWc1O3qnzPGWw66otrah+JUaEkB20AYGzslF?=
 =?iso-8859-1?Q?2q2qOi1wI8oJBWn1Fk7OLIwJ1Vi8U/cPIqcm3pjOQA+kUWRKqEAdrW36H/?=
 =?iso-8859-1?Q?xm0bOoCPsXGXNE1HcS/Y9D+wPN2nAwtLPzL1eVsvg/8dwyQ0fba68ryboB?=
 =?iso-8859-1?Q?+iq9O16H5A6+TfCi3gRf0+UrAOy4v9iPE1DK9Zr3DFMSTRS4ygw0dq6Gd9?=
 =?iso-8859-1?Q?L26WTdBpkNEWxl9tlWfTImkg55K0su3iYmtft8W+Twvo2OZvFkMdw65QSk?=
 =?iso-8859-1?Q?d4wNDDjX5TTliB8WUb66zLCLe3SbQPxzJW4e3+XLfF9N0Gsj1k0rTaoQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49be56a2-b3bc-45b1-00d6-08de26a77e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:35.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUjJccpWXmj8p+d+wz79u60M5f3HKbxHoz1ywdLiP5MIxmiPO04lGC3c6dJbrwo8mvyU9g3b2JkLRtH/BnoELQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

A PCI device must have valid BARs in order to assign it to a domain.  On
ARM, firmware is unlikely to have initialized the BARs, so we must do
this in Xen. During setup_hwdom_pci_devices(), check if each BAR is
valid. If the BAR happens to already be valid, remove the BAR range from
a rangeset of valid PCI ranges so as to avoid overlap when reserving a
new BAR. If not valid, reserve a new BAR address from the rangeset and
write it to the device.

Avaliable ranges are read from DT during init and stored in two distinct
rangesets, one for prefetchable and one for non-prefetchable BARs.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* drop hwdom_uses_vpci
* check that rangeset can handle u64
* rework rangeset manipulaiton
* mark more functions as __init
* move bar init to arm files
* style fixes

v1->v2:
* move hwdom_uses_vpci to this patch
* fixup error reporting
---
 xen/arch/arm/include/asm/pci.h     |   7 ++
 xen/arch/arm/pci/pci-host-common.c |  92 ++++++++++++++++++++++++
 xen/arch/arm/pci/pci.c             | 110 +++++++++++++++++++++++++++++
 xen/common/rangeset.c              |  62 ++++++++++++++--
 xen/include/xen/rangeset.h         |  11 +++
 5 files changed, 277 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7289f7688b..ac4e87f9c1 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -74,6 +74,8 @@ struct pci_host_bridge {
     struct pci_config_window *child_cfg;
     const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
+    struct rangeset *bar_ranges;
+    struct rangeset *bar_ranges_prefetch;
 };
=20
 struct pci_ops {
@@ -154,6 +156,11 @@ void pci_generic_init_bus_range_child(struct dt_device=
_node *dev,
=20
 bool arch_pci_device_physdevop(void);
=20
+uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
+                              bool is_64bit, bool prefetch);
+int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
+                          uint64_t size, bool prefetch);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 #define pci_scan_enabled false
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index de30fb0aec..28c26af9eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -21,6 +21,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
+#include <xen/resource.h>
=20
 #include <asm/setup.h>
=20
@@ -232,6 +233,25 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
+static int __init add_bar_range(const struct dt_device_node *dev,
+                                uint32_t flags, uint64_t addr, uint64_t le=
n,
+                                void *data)
+{
+    struct pci_host_bridge *bridge =3D data;
+
+    /* Ensure we are not using bits in a rangeset */
+    BUILD_BUG_ON(sizeof(unsigned long) !=3D sizeof(uint64_t));
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( flags & IORESOURCE_PREFETCH )
+        return rangeset_add_range(bridge->bar_ranges_prefetch, addr,
+                                  addr + len - 1);
+    else
+        return rangeset_add_range(bridge->bar_ranges, addr, addr + len - 1=
);
+}
+
 struct pci_host_bridge * __init
 pci_host_common_probe(struct dt_device_node *dev,
                       const struct pci_ecam_ops *ops,
@@ -283,6 +303,18 @@ pci_host_common_probe(struct dt_device_node *dev,
         bridge->child_ops =3D &child_ops->pci_ops;
     }
=20
+    bridge->bar_ranges =3D rangeset_new(NULL, "BAR ranges",
+                                      RANGESETF_prettyprint_hex);
+    bridge->bar_ranges_prefetch =3D rangeset_new(NULL,
+                                               "BAR ranges (prefetchable)"=
,
+                                               RANGESETF_prettyprint_hex);
+    if ( bridge->bar_ranges && bridge->bar_ranges_prefetch )
+    {
+        err =3D dt_for_each_range(bridge->dt_node, add_bar_range, bridge);
+        if ( err )
+            goto err_child;
+    }
+
     pci_add_host_bridge(bridge);
     pci_add_segment(bridge->segment);
=20
@@ -476,6 +508,66 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t s=
tart, mfn_t end)
=20
     return bar_data.is_valid;
 }
+
+/*
+ * Find suitable place for an uninitialized bar of specified size in the
+ * host bridge ranges
+ */
+uint64_t __init pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t =
size,
+                                     bool is_64bit, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+    uint64_t addr =3D 0, end =3D GB(4);
+
+    /* Make sure we can store addr in a rangeset */
+    BUILD_BUG_ON(sizeof(addr) !=3D sizeof(unsigned long));
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    if ( size < PAGE_SIZE )
+        size =3D PAGE_SIZE;
+
+    if ( is_64bit )
+    {
+        addr =3D GB(4);
+        end =3D ~0;
+    }
+
+    if ( !rangeset_claim_aligned_range(range, size, &addr, end) )
+        return addr;
+
+    printk(XENLOG_ERR "Failed to claim BAR range %lx-%lx from rangeset\n",
+           addr, addr + size - 1);
+
+    return 0;
+}
+
+/*
+ * Remove already used memory from the host bridge bar ranges
+ */
+int __init pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr=
,
+                                 uint64_t size, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+
+    /* Make sure we can store addr in a rangeset */
+    BUILD_BUG_ON(sizeof(addr) !=3D sizeof(unsigned long));
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    return rangeset_remove_range(range, addr, addr + size - 1);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 951639eb3f..0330220e93 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -95,6 +95,108 @@ boolean_param("pci-passthrough", pci_passthrough_enable=
d);
 __ro_after_init bool pci_scan_enabled;
 boolean_param("pci-scan", pci_scan_enabled);
=20
+typedef int (*bar_callback_t)(struct pci_dev *, uint8_t, uint64_t, uint64_=
t,
+                              bool, bool);
+
+static int __init reserve_bar_range(struct pci_dev *pdev, uint8_t reg,
+                                    uint64_t addr, uint64_t size, bool is_=
64bit,
+                                    bool prefetch)
+{
+    if ( pci_check_bar(pdev, maddr_to_mfn(addr),
+                       maddr_to_mfn(addr + size - 1)) )
+        return pci_reserve_bar_range(pdev, addr, size, prefetch);
+    return 0;
+}
+
+static int __init setup_bar(struct pci_dev *pdev, uint8_t reg, uint64_t ad=
dr,
+                            uint64_t size, bool is_64bit, bool prefetch)
+{
+    if ( !pci_check_bar(pdev, maddr_to_mfn(addr),
+                        maddr_to_mfn(addr + size - 1)) )
+    {
+        uint16_t cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+
+        addr =3D pci_get_new_bar_addr(pdev, size, is_64bit, prefetch);
+        if ( !addr )
+            return -ENOMEM;
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND,
+                         cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO));
+
+        pci_conf_write32(pdev->sbdf, reg,
+                         (addr & GENMASK(31, 0)) |
+                         (is_64bit ? PCI_BASE_ADDRESS_MEM_TYPE_64 : 0));
+
+        if ( is_64bit )
+            pci_conf_write32(pdev->sbdf, reg + 4, addr >> 32);
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    }
+
+    return 0;
+}
+
+static int __init bars_iterate(struct pci_dev *pdev, void *arg)
+{
+    unsigned int i, barsize, ret =3D 0, num_bars =3D PCI_HEADER_NORMAL_NR_=
BARS;
+    uint64_t addr, size;
+    bar_callback_t cb =3D arg;
+
+    if ( (pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f) =3D=3D
+         PCI_HEADER_TYPE_NORMAL )
+    {
+        for ( i =3D 0; i < num_bars; i +=3D barsize )
+        {
+            uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
+            bool prefetch;
+
+            if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPAC=
E) =3D=3D
+                 PCI_BASE_ADDRESS_SPACE_IO )
+            {
+                barsize =3D 1;
+                continue;
+            }
+
+            barsize =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                                       (i =3D=3D num_bars - 1) ? PCI_BAR_L=
AST : 0);
+
+            if ( !size )
+                continue;
+
+            prefetch =3D pci_conf_read32(pdev->sbdf, reg) &
+                       PCI_BASE_ADDRESS_MEM_PREFETCH;
+
+            ret =3D cb(pdev, reg, addr, size, barsize =3D=3D 2, prefetch);
+            if ( ret )
+                return ret;
+        }
+    }
+
+    return ret;
+}
+
+static int __init pci_setup_bars(void)
+{
+    int ret;
+    /* We can't change the signature of bars_iterate to only accept
+     * bar_callback_t, so use intermediate variables to ensure callback
+     * signatures are always correct
+     */
+    bar_callback_t cb_reserve =3D reserve_bar_range;
+    bar_callback_t cb_setup =3D setup_bar;
+
+    pcidevs_lock();
+    ret =3D pci_iterate_devices(bars_iterate, cb_reserve);
+    if ( ret )
+        goto out;
+
+    ret =3D pci_iterate_devices(bars_iterate, cb_setup);
+
+out:
+    pcidevs_unlock();
+    return ret;
+}
+
 static int __init pci_init(void)
 {
     int ret;
@@ -129,6 +231,14 @@ static int __init pci_init(void)
             printk(XENLOG_ERR "PCI: Failed to scan PCI devices (rc=3D%d)\n=
", ret);
             return 0;
         }
+
+        ret =3D pci_setup_bars();
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_ERR "PCI: Failed to configure BARs (rc=3D%d)\n",=
 ret);
+            return 0;
+        }
     }
=20
     return 0;
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0e3b9acd35..6a0c20ab41 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -180,16 +180,13 @@ int rangeset_add_range(
     return rc;
 }
=20
-int rangeset_remove_range(
-    struct rangeset *r, unsigned long s, unsigned long e)
+static int remove_range(struct rangeset *r, unsigned long s, unsigned long=
 e)
 {
     struct range *x, *y, *t;
     int rc =3D 0;
=20
     ASSERT(s <=3D e);
=20
-    write_lock(&r->lock);
-
     x =3D find_range(r, s);
     y =3D find_range(r, e);
=20
@@ -244,8 +241,18 @@ int rangeset_remove_range(
             destroy_range(r, x);
     }
=20
- out:
+out:
+    return rc;
+}
+
+int rangeset_remove_range(struct rangeset *r, unsigned long s, unsigned lo=
ng e)
+{
+    int rc =3D 0;
+
+    write_lock(&r->lock);
+    rc =3D remove_range(r, s, e);
     write_unlock(&r->lock);
+
     return rc;
 }
=20
@@ -357,6 +364,51 @@ int rangeset_claim_range(struct rangeset *r, unsigned =
long size,
     return 0;
 }
=20
+int rangeset_claim_aligned_range(struct rangeset *r, unsigned long size,
+                                 unsigned long *s, unsigned long e)
+{
+    struct range *x;
+    int rc =3D 0;
+
+    /* Power of 2 check */
+    if ( (size & (size - 1)) !=3D 0 && size !=3D 0 )
+    {
+        *s =3D 0;
+        return -EINVAL;
+    }
+
+    if ( e < *s )
+        return -EINVAL;
+
+    write_lock(&r->lock);
+
+    for ( x =3D first_range(r); x; x =3D next_range(r, x) )
+    {
+        /* Assumes size is a power of 2 */
+        unsigned long start_aligned =3D ROUNDUP(x->s, size);
+
+        if ( x->e > start_aligned &&
+             (x->e - start_aligned) >=3D size &&
+             start_aligned >=3D *s &&
+             start_aligned + size <=3D e)
+        {
+            rc =3D remove_range(r, start_aligned, start_aligned + size - 1=
);
+            if ( !rc )
+                *s =3D start_aligned;
+            else
+                *s =3D 0;
+
+            write_unlock(&r->lock);
+            return rc;
+        }
+    }
+
+    *s =3D 0;
+
+    write_unlock(&r->lock);
+    return -ENOSPC;
+}
+
 int rangeset_consume_ranges(struct rangeset *r,
                             int (*cb)(unsigned long s, unsigned long e,
                                       void *ctxt, unsigned long *c),
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf..dcef96cb2c 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -61,6 +61,17 @@ int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long si=
ze,
                                       unsigned long *s);
+
+/*
+ * Find a range subset that starts at or after s, ends before e,
+ * and is aligned to the size.
+ * If such subset is present it is removed from the rangeset and
+ * it's start is written to s, otherwise s is set to 0.
+ */
+int __must_check rangeset_claim_aligned_range(struct rangeset *r,
+                                              unsigned long size,
+                                              unsigned long *s,
+                                              unsigned long e);
 int __must_check rangeset_remove_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 bool __must_check rangeset_contains_range(
--=20
2.51.2

