Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A236A4189E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894983.1303647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbj-0005Mp-5f; Mon, 24 Feb 2025 09:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894983.1303647; Mon, 24 Feb 2025 09:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbj-0005It-0Q; Mon, 24 Feb 2025 09:18:35 +0000
Received: by outflank-mailman (input) for mailman id 894983;
 Mon, 24 Feb 2025 09:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbi-0003pb-0z
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51519fdb-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:32 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:26 +0000
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
X-Inumbo-ID: 51519fdb-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uujkxZsQBRQQYdsW2Y2bSDOHsia/kvSQscV8b3xpkIlKWi7EuIdY91yF+kUPnJFRFA+t9yoMQux38E5FxMFMLv1jPOD6AvLnSSulzZbwXDbAq4lPKP8PdTOB23N1IzdYZKJsnBRvC4/+zoN1deAxun02Kf7GA6iNPiTZ9A1eqJTKZqqy/FYLsSxsKfTPas7tGlAA62BtzXJ90RIUzOvMtrYG3MsETdWaHJs1ATCmGF6Zhu5FQPfUHM90z3ahmmfnzM6V3UnnTMlCkLwxYQt/XCa51oA6DaQFQ65PliBLRgnK6ayzULuUxvDaqTB8p6nReUm4EckB/ToFKK7DgHSBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr+RJzxbtfbXzyJxjIhXUxDesNrZnM6NrhcX9itp9QE=;
 b=adJlmy+Ws/8IV8BVcvqmF4RSWFadYIcsTrKauqDnWjN914xiPI8Fz+9c4lwo5I8UXa3vGoWApWQ9cMhI5gyQJOcpAIaRDSRqpG2fS/j1B/eUbrDv7J/CHiehxPReA2PGxMc6/BMbOvBXfgxbiwNuHcXb3cM3zC7W/14n7qjuVaz3le9scbIFeJ6kEceq13rMeJLg6qc3Ogticm0a9vPCQrfgN8lo9qnZUGaNkgfu8GKSKSb5xpxL6reixCvFd2tYTMuUW+MHZ3IfQcIbHyPICovztGmQ7jhVGDqCKfEnax0UYhPATJR437KtVMKkndj969/U5NWsVr0B+FuUzfG1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vr+RJzxbtfbXzyJxjIhXUxDesNrZnM6NrhcX9itp9QE=;
 b=vZxwfzJ9ldhKUbwODe0jtpOlPi/I1B/3waN8j7XJORiu1Y2JSePh8MH/RNA60T1CaUgsaknboowJHv9yK2X+b90p47U0Vm9MCOWwgFwFilDJs4KIdr3u/JagZHjNewHDQmL5Lzx5o+onbHKQXS1lGjEMWXTvPxCJm3QIPu/2o7w4vMN7v2OpFFXaTCQIQLLH8y1ILbN7Zh1UsDooUj9kGSSUFTAS2qqxxLURctxksysAvbZtzDjO1ut9xQkLzWLP2cGtSL6pJDxFXYxe9DLtxT4B7sdmGlOzXqOcqtsdc2N48nmwRfWZFFMWkOmTC7AmkzJjnWpZEqD1Nj42j2lkBg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 7/7] xen/arm: rcar4: program ATU to accesses to all functions
Thread-Topic: [PATCH 7/7] xen/arm: rcar4: program ATU to accesses to all
 functions
Thread-Index: AQHbhp0PHs93+Pzdu0q8aV6A0xlD/w==
Date: Mon, 24 Feb 2025 09:18:26 +0000
Message-ID:
 <571bf109b9db5b826eb814da603ac194e82981d4.1740382735.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: a67f55e3-d105-4e99-298d-08dd54b431fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5e5E2ZMffzEyDiy3N7MvQhnkNAaS+EbwZaqATffZpZLeqOEOZduYav0fos?=
 =?iso-8859-1?Q?YEELaZRBpF/yh7zG60aZZ77r1zwSOcXHH5lyDVkAHtqSz9kKKOddiGud4n?=
 =?iso-8859-1?Q?U6syyJe8koEo6nbm64WC5Pm9lUeiKTqjMCAoC1bQnVbt+kKPPQUBevGi6Z?=
 =?iso-8859-1?Q?xCeS3w6V3BCcczERDa/rj4wfyYJg3hzjtbprJyA1xpO273zwxd2hvOhjFC?=
 =?iso-8859-1?Q?RRdJO7m8toIq9x34sIwgZge8Mk9lMHq6Cj0QGRstwjJkXufEC+qCNDBbjU?=
 =?iso-8859-1?Q?Dm1Iw9ScxSALA2aXwevFu4kHVxWbQGVOqdQGdLqrCBpTlcKUsimSnCqbP7?=
 =?iso-8859-1?Q?E2yHd2QLtO53pJXT649cPCOkaXj0l4PUNOL7VaGMcEWPb0S32TvRpQHDXy?=
 =?iso-8859-1?Q?a+caMIFHKCrD3K+EZq6E6YrfrERLj/hNlmBpL4Kfc3TG/+KsS+fCihhGqc?=
 =?iso-8859-1?Q?aEOg+21aJVcUmvXDt4J3sbJ8wN3WD3GjNsPg3KfeMud3RZ5FlxOMcIu2ZP?=
 =?iso-8859-1?Q?Az4rEbeHKmKQcgW2gbjPHa3hx2DIa2ZOnTPLSHfe3wHDHwJD0jb8hcTao3?=
 =?iso-8859-1?Q?y7d/jAkeXDn6kSzieJxUdY0dtcDWUqo1MxfrQMvMzUiNcYE00mLgxDeG1X?=
 =?iso-8859-1?Q?F6up3UctmBAENZr7xOI6uF3aTS0o6wb9e+CtGN2IpuZ+KYflM01NSyCvjB?=
 =?iso-8859-1?Q?3c6DxslmTqfFVeqm2Ib3ZVg9O2f7kQe64y1/t2do+bWy92IzsXzvi7ABfL?=
 =?iso-8859-1?Q?Vbjf4yxhx/4vwrkgBGF05hMR+Izjtlozhl+t03AFNOyXFnJmrRDvlh64Se?=
 =?iso-8859-1?Q?EubE7WgOJlQPMBgTruw81NcMZurKerN82N6Bshe7hxg/Ffxgd03mkZkLsB?=
 =?iso-8859-1?Q?eKgqtMUZlfJpcP6LjRJvAyNObVLAMciuA2W+cBJuyVgBv4YJPvrnW8AOcY?=
 =?iso-8859-1?Q?qm86PFPrrR/iOb6JO6B+qGxACwDsqn4A/NHgdGrlc5Ybc4MbadaJIDBniD?=
 =?iso-8859-1?Q?Co2BWST/PJWJ4zXEimY3P0eFPmusTXaCSVXyUXa+zoAu0kUxI7B6d4I3ih?=
 =?iso-8859-1?Q?vq3gUSolLE9GSqHfXaZARQzbuEak7Yw5AxLQoKC1FDcoGSoivzfiD4ITiF?=
 =?iso-8859-1?Q?fDKpAdWJtThWK6EtURdut1eiieL0a5jS3cQqb97T0pgiIDqZbtZqHG9WpX?=
 =?iso-8859-1?Q?b1fFk8Ig9tjzQ9Ujnr02QHbdYsXNfNFg5MF0OGWSAgi9RdfLSluIRWPk4w?=
 =?iso-8859-1?Q?5zIDcZIB1DFwjYTrW1N/yuqFX7cUVOqF/kH4BG6Q0X9VDgP6i61/CZlVkB?=
 =?iso-8859-1?Q?BRRUYsHLd6Q+YDBTZxTa/W4pyXEGesPVD4t9FSWwtoS7c4HhX5XBZMk0uT?=
 =?iso-8859-1?Q?2z8vZbWsUCiUG85REsmY0FgjR8d+tAEka3HkvK6dfLB3yrZD0R4mHr4tWG?=
 =?iso-8859-1?Q?cO+1f6dApxDVQnqO41IGQacF4kzQfpkDgzUVpsR+IfU0dfW5PLxzaK9Xry?=
 =?iso-8859-1?Q?A6aAtjW8EEy3PlVtwvFo4q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vJfieua+yIAt3Jb8mKIWi4BePGbOE+9Y8H5C3piVoQ6bGu1OMz6hABBOTl?=
 =?iso-8859-1?Q?67ksTT7SjaCSmPbF9fND/MxyM24zpY+1rVFUNaIxWw6B+OU2V6jeMom0ww?=
 =?iso-8859-1?Q?3TR253V7BXjPKSPtK6hu5+7HWgNBP3NS2Re4yxIoCJBjT+LcuL0qS9VdJK?=
 =?iso-8859-1?Q?yqOU22fOHBBlY+815fdfQAsWEUDKoIe3biwBWdE6W63NgnIU8BDFCHPh0+?=
 =?iso-8859-1?Q?LsS0Tl+UY4nhR1enBEwj6iZyQHNDYoBdJxRdADgSdToQgdHVuNAmWM//9e?=
 =?iso-8859-1?Q?juGGbY/kGsN+R+w1zxT9MY2HGIOaD7n3UZO1Ne1TEspx8pjtHke7ShOrvn?=
 =?iso-8859-1?Q?k5nSrnv6irIb/qUPpJBHe6V4enzXbqwESIhhe7GxfPmZWhffUMSlXk8Lhc?=
 =?iso-8859-1?Q?83dJSzAEf5BaxCyY1Vay6tqFYn63aeJvO5oUg7icrYDU2SSmnlxm+/vUS6?=
 =?iso-8859-1?Q?nwqjdxeqc6IJAZx4T3l8HdSPF4JeK35Z+39gKjDRfmLNQxMNipQwsNk2FP?=
 =?iso-8859-1?Q?Xs4gqaH0Tu4Uwkq7eo7V6RpO+daYvgisZb2jHxb2WWLNbzLQfy1wHLaS4G?=
 =?iso-8859-1?Q?QSuhZuUPwvwLIvNCcGp0usawNl84bkmQYeYDXNcBlgZlBTdfqxl3r+2ib8?=
 =?iso-8859-1?Q?kF2RJn73aS4oTEnp36srYYqk9/aLA5ag3TXVbvt9hjySv44mylistKKuuA?=
 =?iso-8859-1?Q?RwwX9QIMR5ZqPDf52I7l9y3hlShnfL6n9y3P/EvbvsAepUlm/fl+wNV6zZ?=
 =?iso-8859-1?Q?8vrIpf6pmJGK5K6TRGFulTzeqkltJjALZU7SjlS4oZIRxNoTglRtlJE+yD?=
 =?iso-8859-1?Q?YbKRPzZ6oYB8ilph63KqTz/3ff3mHlM/n7IT0w3/9en0PBCWq5fYsRHZNP?=
 =?iso-8859-1?Q?9AA42CvUf8gcqoukmm+xCyIjlYfuLWQz9L9K0mpceAnjY88QTQfNF6MTNe?=
 =?iso-8859-1?Q?ubGpQQOw4wY3CpX5Zh8ysf8lLjPwqo5fAMJVL5NrdxQUGXzl4ZNNs/hLHQ?=
 =?iso-8859-1?Q?YFztf+/f7bP4EMGC8UNJqrPlbv8t4ijaycGUmr4hYIo/0owtnjqw+DKLwC?=
 =?iso-8859-1?Q?mMG+wHLt+p9Phny/SlVjs8AbcHcCISKz9gqRMr+3sIQ2UTgclDla/S6lRl?=
 =?iso-8859-1?Q?JscCgvr9hnM4Fock58EDIgh2BtR1ND8UIbL/RA1lbMInvoiJ1kx55eTXZ1?=
 =?iso-8859-1?Q?eam6HB3hNmgfTM58/WDfO9ek3e9PSeE6adof12hcUWUDa9LNj9DpfpFnZm?=
 =?iso-8859-1?Q?Rg2BS60aYqWcmQqhbgrZloM7Rj7y/K/MQc2z3gMi8JGVD9B7IGfSN6iKKs?=
 =?iso-8859-1?Q?p9WvwoDdscXOrq3FllTahc91ZVjxLK5DjIB9zNEx4c9nyZgvaflEUw0LwI?=
 =?iso-8859-1?Q?Yr4Z8H7m8+USDEz1ffi9sry1eVbeu9c4TD6T/3GEaA7SLlsxnokT9rV+fq?=
 =?iso-8859-1?Q?VS90TsylUUDz0FgLGAFDQORS3krsUjMDtxBWldF1ynQpfgbRXqTscVgCcC?=
 =?iso-8859-1?Q?7anjAnYiwd0NAq3Cg+CyYAMyrWw3poHsC0yONHhQaAMLO7aUfdKcyZj40l?=
 =?iso-8859-1?Q?A9I43+HlvED4OeiWyCCw8SIN9em2nBeSGJYX4+9LrnIV/mqaGupb8GZcA7?=
 =?iso-8859-1?Q?Ar7fo+Vev57ff93gf1q9oN7GJMDyNOjKIsE/fKgWuNHIiMWN9O1WtZJw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67f55e3-d105-4e99-298d-08dd54b431fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:26.5516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHbOzhl4BlMIFZ6Movog7nirrxrOzE0V0E1Uvuc9ZmVZPIiYXg7QWFc1JaelD69IfVRdY5ChV0D/g/HMojuGEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

According to ATU documentation, bits [18:16] of accessed memory
address correspond to a function number. This is somewhat similar to
ECAM, but with huge holes between regions.

We can use this to minimize number of ATU re-programmings: configure
ATU to access BDF with F=3D0 and adjust memory address with function
number.

Taking into account the previous patch, that optimizes ATU
reprogramming by skipping call to __dw_pcie_prog_outbound_atu() if we
already configured pci_address, we can be sure that accesses to all
functions of one device will not trigger ATU reprogramming at all.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index 3e3e073b09..5d006e4897 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -385,7 +385,7 @@ static void __iomem *rcar4_child_map_bus(struct pci_hos=
t_bridge *bridge,
     uint32_t busdev;
=20
     busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
-        PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+        PCIE_ATU_FUNC(0);
=20
     /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
     dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
@@ -393,7 +393,7 @@ static void __iomem *rcar4_child_map_bus(struct pci_hos=
t_bridge *bridge,
                               bridge->child_cfg->phys_addr,
                               busdev, bridge->child_cfg->size);
=20
-    return bridge->child_cfg->win + where;
+    return bridge->child_cfg->win + ((uint32_t)sbdf.fn << 16) + where;
 }
=20
 static int rcar4_child_config_read(struct pci_host_bridge *bridge,
--=20
2.34.1

