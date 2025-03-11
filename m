Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92ABA5BDC8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907713.1314956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnQ-0005OC-5P; Tue, 11 Mar 2025 10:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907713.1314956; Tue, 11 Mar 2025 10:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnP-0005Je-Se; Tue, 11 Mar 2025 10:25:11 +0000
Received: by outflank-mailman (input) for mailman id 907713;
 Tue, 11 Mar 2025 10:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnN-0004A4-S6
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2606::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aa57a82-fe63-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:25:07 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:56 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:55 +0000
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
X-Inumbo-ID: 1aa57a82-fe63-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBRmOWMMzQFaVnRGm3kAwelD7U1W45TTB/anaX6JkYi1YjwandgOmLeLmGTvjzzQZn305bArMBj8g8sP25rm3Bs8OG5cwfSdJsOzKIUslmzq6Ha5xdNlx6NWK0H0V0tMJInQtNs5V8PLJ5sg/vw0SevTl2Gbo6sVRBIHPc4yvmBTn9IBiLjEAb6ERuHjbTtlbLXGP38AGkqISHy/dnbE+QGFbeoMqcsvdQsghwEWd7QfzexSPuPH8qCZeUNID9PHMPh+1cpUcBs0EiYgk/gv9nmmzan34c5SJT1FTck8yJcFFOSrzrq5U3RPG95BHn/3oUpByj/5WCPREYe0Gh1YSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV8YM3jhG2UMfsijfyto0ijbdWaFLchbb+HNCctMjwo=;
 b=HTIaOeHXeIJVp3FajkcCRfu/mqJ2btvt7ipJ14H9G+Dx8FFZaKxXNP3hjn/s1TeFZ7iopBLOgtxtHF658COC4xFw5ctZKDRqLJl8jTkxsJiON3cldP4f79Vuth3MdYm7p+PPfNrjN8GbzSVHsYU1cuOcYMNAqX4iQut/xzOBK15MkjOd5EHdOP6g5g7DXBpP6i4dKGPcAt7t2g0nGLPekHdqc3PV3zktpM6VH+bhzoah8019drSOVsTSYCFS6ccZumJwms0Gf0+85NLZkbbfr/gCbFZpUlsZKECxe4AZwLK2srfwC6MOrux4HeouKEi65vRkyUM2kIrWRhbigwsquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV8YM3jhG2UMfsijfyto0ijbdWaFLchbb+HNCctMjwo=;
 b=giMZDHrle/fn+xblJhe2K7cvcwWZUQr6xttc9tFqbQ3qN7/7YQZDM+QCv24QrSePrsV8DhP/G0WGILR3zZeb9un2q6XKGAQVZvLJqwlvrh4KQ1Tu+GhrVH804pKaa7bhPBT1YuowYvT2Ov2XsaHoqQH8kSe7OPa7WMZEDyGgwdGr7h3IpWuYr+8OWBfs7yIqmgm/caF/dw3QGL+FxG8Jfn0PecvuUaySPNqKP3YsZwr5PMUyc+YwtmOZCOXwzK5mHRLeC7YgJkwcZ8/3BiQ+9tRbNwaS/Amg+PvmrjgOhGpgKgqFOSWSIBU9egZ23ZKMMlbGQ45cvxsTipNHqS+qMQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 1/7] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH v2 1/7] xen/arm: allow PCI host bridge to have private
 data
Thread-Index: AQHbkm/VvvSFGErp6EOKl9y39vdqWQ==
Date: Tue, 11 Mar 2025 10:24:55 +0000
Message-ID:
 <cd3bd35a570064e1b03054bab73e29aa1578bd24.1741596512.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 2c20fc1b-9efd-4910-f5ee-08dd6086f793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4cWLZPFsE2an/rKi6yavJiHDFBLMQ2X4N+stTBluCXLcvwQUZ8HceRMEAC?=
 =?iso-8859-1?Q?sYYoEUnPLTyOdjIbgSME3kdaJQuZFjCOV/F1BtlJTNvTu+SvlF43NTrYhn?=
 =?iso-8859-1?Q?jgDSstQcuXlr0gX3CNHHt3+IGGKadgIwGdUKmxb90z/IIjBwDLriekgyMP?=
 =?iso-8859-1?Q?XsjflLufqEwycxO85+jte+XCWAJdV0itgGFwii4YLP+oequanjzx4jlT2U?=
 =?iso-8859-1?Q?v49lTg6BTxN7d9WzeT+gud5JKLRwhdhOxtjx2aVl6Lhl9WEyEt+ZnTCykw?=
 =?iso-8859-1?Q?njmzUiim61iRpHkRALaaM6XHVdqEpD9vJVO6P+yMtiTsOU9LtKt4OlSSOR?=
 =?iso-8859-1?Q?2pX4d1Pi7UYl1maSUmHoUNHJ2BQLmPVzVxOZhso7wS+sKg579tPY3zHtCD?=
 =?iso-8859-1?Q?aUqV2RZrib8MMIV+ShMIpoDI6zZnHBDEYYp8EOBKnqfVJqwwtRgmXio4MU?=
 =?iso-8859-1?Q?mdbSP9mw+mcZK0HUL9LpyFKWbs6dTYflTQLsTiWqfeLVsREx+J11pNSHrd?=
 =?iso-8859-1?Q?O3dzSrTbxRN1/kpZwdEZaMMoa/tVsxZglIfRa/ymk4nVBYUIqO+TN+hovD?=
 =?iso-8859-1?Q?QHmzEqZnoskn+6Xhauw1CF0+n9xO7lUyCD/PkLYY3nZeQQ+ZDmpI2E8kvO?=
 =?iso-8859-1?Q?WNZT27hxD4GFaauldhSJGDpGiwRYSVZasneKDcuZKQ5fViPU+CIXwu4Ru0?=
 =?iso-8859-1?Q?CXiTM/EXx3lm1LyswOKCs0EMlrkWx2L3exYmrMnyUnQCXmbxbdeRRYXm8/?=
 =?iso-8859-1?Q?h8qU9wXhpoExdlxLsuukjFXTb8kPudlqWcjFq22qgBqNmI9rAH3fyxkIUM?=
 =?iso-8859-1?Q?1jVxR9BJZNMb2aVR4LbJ7PgrtlwOEBMCdkhr8kJTgml7/BvUQrqeowABwC?=
 =?iso-8859-1?Q?Ilc2rFndhxQrvl7l0DjDAundqie5V5iTGW9d4ExGXG95K+KjPRtOEfUJO3?=
 =?iso-8859-1?Q?cCbrRBZbrP4868HMuaKeBVDava7mHSFrHl/6qNvBLMSIKFKdC5y51i87Jn?=
 =?iso-8859-1?Q?8aAIfX4J7yLpQcMt2ovBSNjLPKLwDRiGpiQnb4IxZjTbPJOE+0LcU2gmMt?=
 =?iso-8859-1?Q?DT7sYaxfCVodAZ7GQPj48ehdiwEZuJ8JM+nR2yIUBkUHOTtjbHBk1daWYq?=
 =?iso-8859-1?Q?q6An8pBR2Zz8DEeelgpNmlxMCoo8hzgJNfQ9hvItqZVwhIY406H4/cy+Op?=
 =?iso-8859-1?Q?GwfzVFv5myNvTGb7XFr70/2w/CkFCADZ3OM3uxakNoUVFolYnnbiaYusGT?=
 =?iso-8859-1?Q?QNHSXq8JH19vwGcihdhw5zbifIWevTCu0iY1X+eytXsbKBfAC2395JDa3b?=
 =?iso-8859-1?Q?tUDedaAMtxloeBTwzrw3UuPX1HU5EvEWv5kmo1mFycVvQFIq9FULPegC6v?=
 =?iso-8859-1?Q?xPu8giHB/br9BFQdKwAhbhf7/h9C/wI0ePqRftwpuj7vJ6DNPP8FJGjpvN?=
 =?iso-8859-1?Q?KLE9wJXbQgVsYZDdsTV4KfnXLuKkkFnLFR8IJ/p896pEdhdIjT/UDzppp2?=
 =?iso-8859-1?Q?usf+1RHRJSJDdgU+MGwido?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sRmY5oL0tvIlRTWnFajlxWy55x4qPHvDcp33NMSbBLkW973TQT5SCZA/+w?=
 =?iso-8859-1?Q?eMOogAerxAn+lYcVN8tfVC5Vi2GPnXi0cOnYfDMlEcVkvBSJ5nIF1493+K?=
 =?iso-8859-1?Q?7As7ONbMiTwdp6PDemPAjJ6V4UtADEq4f3ovYvJ+CNdnafhjVOAF03piO0?=
 =?iso-8859-1?Q?IkeYrEpj4rcayKUk2+3XaRVsHeEA/BOjoPUR+XckaBEjnFz3Z+0MlZp451?=
 =?iso-8859-1?Q?CZ1ZAueS1t39gFXZpQcyOjpFY0nDwk2TQGRbvFBY4jvCqnaTNR8zSKWmlI?=
 =?iso-8859-1?Q?OkUL++0LYcMjBOHopRBbKl8dX6bWhNTMvpqLqak9N4nUD0hUGCe0gLVMNR?=
 =?iso-8859-1?Q?G/VUeAy96qHmD7Yxp1PPfsd5tdC6HRoRJ3w69N2EfJEKbecFCNLzgfByxG?=
 =?iso-8859-1?Q?6z+HOfMdOvJWAGlj7H+C54xKJgPr/wsC5B7tZ+tf7VsdoO/0D9iX52RFC+?=
 =?iso-8859-1?Q?BtT5JM2QXzg0qmLsyAw8R56UjC5Hb4lbXjGP3/EIygmafWwPKSdEpe+1vy?=
 =?iso-8859-1?Q?rtqW2Cf/epvxQNhYmo4ZM+P9G5T/JY04EHqD8lEvlQiQsLvLECE0PAk2EG?=
 =?iso-8859-1?Q?GvnsEu1U+EH2Qqfq6xDVBX3L2TxTrQEnnQHIN5Pe+46fEiZJW8q3BqPZuC?=
 =?iso-8859-1?Q?WtswjV9rguViGPMr+rQllaPRP7YGOeQQS2qT02Sqf70Oj2+R//qrlQcELs?=
 =?iso-8859-1?Q?mtG4gJn2upn4Qh6AgTr7/LmtQvSaDEUFLqp85rWnH84rETtj2iLqijBnB6?=
 =?iso-8859-1?Q?9EIovHVO280wuoX7nHQsWRb6lR3PIATBNqFyKwUiL8Cylka9ZPozVH0y+z?=
 =?iso-8859-1?Q?rZgSLzG+26AhS3BM6TEwVFyE8JFoGVBO1ERQZRKLNP8cpoHIEopUX2HxXK?=
 =?iso-8859-1?Q?vHH2H3f0Oaie9L8D6bHz/2ArJzN0vtKznBx1F20WLv8GZ8nYFcqgXMFE4t?=
 =?iso-8859-1?Q?0eVvukwnN9T3y+UTgfhqhX49qxJvUwnOF5SiT0sJNoj9ZAfvVuhh72gnKa?=
 =?iso-8859-1?Q?gezIycyrbmfM7UDBBRYNBb0JxmNLdNoXw18Syk7zbq/A7E7h6s7aeraHWj?=
 =?iso-8859-1?Q?DrZDTOLyicEalp66Y0KZqjkQ4g0HGH2GOzsCn8wtGNbC+F2K/U7CYkKmGl?=
 =?iso-8859-1?Q?jfuSWnnVXFpV7olzvoc6cbxe+71dGqy96mksqNlBizi/NxNK8BT4WIcDCh?=
 =?iso-8859-1?Q?OB0rSlP0N5gy14PMDnPPBBiKcORfVNAU6CP7p1vMv3pqBWycnrI8JdvAFl?=
 =?iso-8859-1?Q?Epln3LumlPIX0KRpP8mXjOX1BX91i3m/H7eoiR8vnZC2rXavHq9qf/wic7?=
 =?iso-8859-1?Q?ENCBngB6/gc0zqkqJM0CINX3JwJrll8i+MYyCZF1GJuUy12AuGosP96W37?=
 =?iso-8859-1?Q?HMmMXfTjPEUwdWq5esR2PSkbyja1g24GcmbPKXyJ7D0ZHMKqBzaWLZF1yf?=
 =?iso-8859-1?Q?uAlq/mtn6kZ8tV3ksWC/lv5LCgzWFFwKi2h4DvKJGamIDU2ZUwGFRGML1J?=
 =?iso-8859-1?Q?nElfqKCXBUZUdsRXLx1KukWZxDeZRm0PEUotV89jb28pJuZXweOCxvs3rc?=
 =?iso-8859-1?Q?uE9ZLPqQQRSK1LW0GEvIBPmyPyNI4NV703F6q0LTGf7eoWxqsLEbCl5YXb?=
 =?iso-8859-1?Q?k9HcDIkmLSVwVBVO5fq7VaIGwBKr34Cg1sP9Z29zTWlD087q3N74S8cg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c20fc1b-9efd-4910-f5ee-08dd6086f793
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:55.1158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJDPfSCntYGYJA+MCxZMFg8McRjBYCzrKTBXsZD/HNJcQuzg/fW47I+JbkGetVNIoLtLA7kuYmysyS3ybnyeWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Create a generic
approach for that, so such bridges may request the private data to
be allocated during initialization.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* no change
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

