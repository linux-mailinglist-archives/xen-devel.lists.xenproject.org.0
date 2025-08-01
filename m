Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A4B17F2D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 11:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067005.1432003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyY-00073A-DC; Fri, 01 Aug 2025 09:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067005.1432003; Fri, 01 Aug 2025 09:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyY-00071F-9h; Fri, 01 Aug 2025 09:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1067005;
 Fri, 01 Aug 2025 09:22:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0QZ=2N=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uhlyX-0006Wd-2T
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 09:22:53 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190dc2da-6eb9-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 11:22:51 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI1PR03MB10032.eurprd03.prod.outlook.com
 (2603:10a6:800:1c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 09:22:45 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 09:22:44 +0000
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
X-Inumbo-ID: 190dc2da-6eb9-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxt0oiV0uEVZqmxLq8xkIOpJF1b4v2sv9ABS1ORdNUX+P7VcC1485jEMYgY+QA1W/glyUIu4Vz7/0pKWO5j1vsKr9MHpMEQEP3UX6SGKqCXi97sDXX3tqw786v0+smqWw7hzY/pyViRmDW2R2R0V9DYwJbTaLRJwDDxLGR8LqqTa7hUFk9yVC0ZmxRIVBb62WdI/65phDzdgB51QRrvJLSsFXWHPGoHokLEKysVZtUWeY6pEcU2xS7V+UHTA0NdhvZr0fe1GYrlVoRmlMC036rWbGM89MSJu29fQuFQZSPiz5od0+XjBIFj8z4zND4pauGrRGcnXZwPhBcFpqtXgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e64OALVPA2DRTruFZiGWQJ7H25VJryTEDwAJlln/x14=;
 b=SiHWIbr+BAwMUY+XOfyhWOcCMw4SxuUtMtdFKG0JVe4BlayMAbRvfOHHVDAJU+cMapu6zkhOaWNZ4vrkQ+Ea6UyHR4q17+hyJyczvI/0bMnN9M8it4MdXyylOYgrdM6mnPsMTvM5+XzY2uAA/WTzthCpbjlSpGMWFuW+l4MASkzAuGYuXOH7UpJrka+g0oEwDUfujmX4wkASnLIoj1QNlQTWjwngPkWF1UZwqLblb/ihmxEy8VCd8f+xKxCy+ux1GkAIpQhnS+pgOZjQ5uVQTkROxpV6a72dkKaJIObCwxRzOuvZcA/7+t9+mug0lR7lRyD+th1oObUTb41pw+VgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e64OALVPA2DRTruFZiGWQJ7H25VJryTEDwAJlln/x14=;
 b=H3RZZT/GXAe3uLdb0BTpCHCcV45v9Zs7aGpdMQvaFmms3VtMFGjtJtExEk47u99ztBDbp89cYNwixnwF8fdiu1AYIp6OHsoistCuqPB6GhtDr0KilIGMitI8iiiqIFv5WJvSnrgvWn+vZnWZcgRVCHvF1bU0ZYBvxz7jSD6SbGgIDsJJ5TAbuKQwCxilOARjLK0L1ax0tkCqIZhKvBLTuMdV4IE+ebaj2lHFBhYuoQ/ur9GfTf1Ztb/grNTSj490I9E8s9RNWyhYOHDqdUZh9qTWt0a1nOHFkVJ9+QSvYnzhaIgKyU12rsG7B6VrMTOpSYnncMJ6ldWegt13bnL/AQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
Thread-Topic: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
Thread-Index: AQHcAsXVA3qngHqyPEewy8MzwqQRRg==
Date: Fri, 1 Aug 2025 09:22:43 +0000
Message-ID:
 <5097b76acf0a5c64cc78522f6af6233370c948e6.1753968306.git.mykyta_poturai@epam.com>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753968306.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI1PR03MB10032:EE_
x-ms-office365-filtering-correlation-id: 519d7477-261b-45d8-8870-08ddd0dcf8d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BiBTUu918+4Z+i13Sd9mo9Taend7nlnBZ6N5eu5dYtNGM5sdKHZeregX9d?=
 =?iso-8859-1?Q?uRvXCKs8GScUOdJxHk+ZEX1XmeA+r7+V38PHdIycToWrMBGlmr24JHyDvI?=
 =?iso-8859-1?Q?FK1I2VG4LBIinTwF6PtdzGRh4/U9KrQUP9jq0eCTjxsHWKgadPjWAFYnXv?=
 =?iso-8859-1?Q?9yGszImv/Y0Doo0GtpHn4RZhBEziWPlqz6KKNZrgZTEOrVmphwSj7AgrTV?=
 =?iso-8859-1?Q?wPhSqjTnkJTgXsFeHELT52I7EX2nj0sMAW1wuiMay5mQSj50ojR8fs0ALS?=
 =?iso-8859-1?Q?HlDcbK+BoXDu0iI0lvmfmXjwz7fbmqtW1MmZIR3ORhQNX+882wYFjDAv7+?=
 =?iso-8859-1?Q?VnDFvVFMV8k7xIQm4v2hAu/I1T52BnTg2DZZkujPAu5TYtB5tvcYOMg0cw?=
 =?iso-8859-1?Q?gebaBCxto3uS0hw1TsDANE5BcsSZNJ2bFpbOQHCChbGrpvm1uCm7nZK6AB?=
 =?iso-8859-1?Q?X3uWOEdf+KJn1Xn4b1ll91OQmgQkWkccuAj//RvdcUKBizTgZlTLiS3hHQ?=
 =?iso-8859-1?Q?YQWVVPnFlnJOlia7iZ1qr1Pes5DP7GhlKq8lPZNOc9/yuJBEZnOBS5t6L4?=
 =?iso-8859-1?Q?5PEd55m8SSz45MtvburgOt1eTqG5Le4K0Ty4fD2djIjPUwX5rQr/4+zEUf?=
 =?iso-8859-1?Q?c8lxfwKE+M4GFxbBl0DNNOCD8lFQGrJEbdBobhdDlJQv3azLyK566n8APs?=
 =?iso-8859-1?Q?RYSVUOjUTJPzWkxNKzzjg3N/wu8r8vY3hpVLhDDvNPMoPIZgzIuVNiVMVy?=
 =?iso-8859-1?Q?5e3AL9sQ+4Rol6qWULPhPYtY8NgK6aBXRES0gHAUikX1S33pVvdle2kwN3?=
 =?iso-8859-1?Q?WvTJtkhfDvn4LEqV9Vlavzl8rtHfDmYY5DGO6f4d8caK4b5cZad4L6z/jl?=
 =?iso-8859-1?Q?A+Sdk5rZ4OYWlqBEvoWjjdTMRCv6X0vPl3q95IaGhYFm2/5ohEjiV/MROw?=
 =?iso-8859-1?Q?3zo0fVPKEweQL284v7OkwOzcsHDjmZXg9gCvaHUtKzhXkfrsxwJ4a4GcT6?=
 =?iso-8859-1?Q?ynbpMjHGMaXGdKmdUjpIGDtw98i2VWsxKq0heRUnqgu8Uelq615BmTmWeR?=
 =?iso-8859-1?Q?qYMLS/OGivMatycdr/3RjcPEBGk75HKTszPS6yuAT9axFDkFrAJMu/zehg?=
 =?iso-8859-1?Q?4PEXoKNSo/FNymiKFxNtD6uYSSIazf2iVqmwoXQ887fZK+IbcpB7JZo+td?=
 =?iso-8859-1?Q?VFjD6Wr9sgd9yAeH+9yEG0lt6PNc6oGAkesl2B9x2hLArqBxgcc1zN6CD6?=
 =?iso-8859-1?Q?+8qURqdet5QB7h0SvoLztIjm0vNYcC3hK5CpsBTz8gGARIgiyRZUgmd4zQ?=
 =?iso-8859-1?Q?Zl/4Z0xAvrtEliG2RaFkIgj4dbJLWPNO0tPFes+IgQ7ulfWL6Nu6Tjz/0k?=
 =?iso-8859-1?Q?NqU6PM12ronPe0S1EHyCf4BYDtVeftFWKnVdnLBG25i8AGmH2ZZDBMeSPD?=
 =?iso-8859-1?Q?6k+/rThcrF7Tr15ASzRUjZTslti0YkJP2Y1F+QFjaT/btejOp0AnvozNTG?=
 =?iso-8859-1?Q?TY3NlpsRrNxBIz3PteFdbiUGo1692irxodFkis6dsAfT18cbuNYLYP00LJ?=
 =?iso-8859-1?Q?Hx91dTg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9RzHnKVxpHdPkNIJ6mgfYJKUREQiohuo73GdIoDf5oe6bQVfBxuhtO1HtO?=
 =?iso-8859-1?Q?H2Jfz3P+eXX7tV1bDmNsBKx4x3cnTY4POwWz4VWWbHEuVeoArXgH+0WTfG?=
 =?iso-8859-1?Q?kaYrWvhhiiLdhGEV9LVYWfOzoMekeU4QGuL50/RkacQCsaoZTei6P0XFAU?=
 =?iso-8859-1?Q?veIC0utb31pGI9WEqsmQ1efCEEGAYYrJgxA5pVXDN3HMPvGcXGi5cLGnaI?=
 =?iso-8859-1?Q?l1xvOpZUolpg9GTJFyUw42xfyu12yvdPzmIV7Sbs2q6xQCoN2jjfpgZ3Jt?=
 =?iso-8859-1?Q?PfHLBPxBGtuyBykJHAvrve/aYGEqBDz4rjOvn/zigfg0vhRsQAauon3LtE?=
 =?iso-8859-1?Q?xuyMpZY3MzDseXSZD4mmPFxb+LLS+nOEjC0DQoXW3R4s/U+hcDIxgBFxjF?=
 =?iso-8859-1?Q?umkayQhf3up0iAhJDnj+4fhlGP/4A+yqgA5KAnGnvfH/SERNNPUbes/p29?=
 =?iso-8859-1?Q?QtqHSmRpOIownQLmj8/fl7ZD/Igaarb51z0tGhzgyiY0opOFWAy7rVBQ65?=
 =?iso-8859-1?Q?iPqZ1vSz6Hsj142SRXmRoeEm/Lz2cWN1FYgcsSoEl5aoskeuhDZKpdK44b?=
 =?iso-8859-1?Q?ISQa5ZuB0DxQ+E0u4xzypt97qwRvPy5VqIHaSTbFX2D+1b6SB/EEuU0Mcc?=
 =?iso-8859-1?Q?IwRp9wRq6U4bn7u+NPZC976UyE2IxiR9/3OuXLFoVVL0Hm0H/LzDMTyy95?=
 =?iso-8859-1?Q?PyxLwQ24MwB6hM0e1dyjJYoclPyeqR11IpSDdQ0f3OOAE4ZK705ErTbJZf?=
 =?iso-8859-1?Q?HWAuNoTk4tx1MIlVNjU2bzoFsU+Jes2HpNy3Qbnp+6veHVsx3/8dKxfK0t?=
 =?iso-8859-1?Q?4po1e3Irf22Q9e+hWWwQSYlZ2gEv+c5hhcA+IPSTL1L1LfvdRZpwMJvrwS?=
 =?iso-8859-1?Q?+sL7iQ86pXJyH3boFYW8Sb3aQYHsy4CgtRXXLGyFkDkhZMC/9ADhw0KAAW?=
 =?iso-8859-1?Q?CdnJtjr+cx3TzFYSSwCPyWCyV1LetN8IOkAwUSZRei6zCXZzg6w5ucSA72?=
 =?iso-8859-1?Q?hiAKTdZgY3Pq9t2wBWUrYAR+BtyRNEZG7/5hnrA/TrZCcn9M7+HBUY6yx7?=
 =?iso-8859-1?Q?sYbf1f3kgFWxubpogd4GukkG/D45b7tccwhl8vZwz6voy+LOjradEx4JqI?=
 =?iso-8859-1?Q?Z2zghZqbcHNpuSWSts5ITqNo3qGz5aoTOAKvgIP8kyZAJLPmob6k8tmhQ6?=
 =?iso-8859-1?Q?A35UO6sht/KDUInSByppZAuIyuixtNdYchnRWntsZ9Ty1HdZhYi6O1BTpu?=
 =?iso-8859-1?Q?p7HDNsnyQ4MTYRrr+YkcsovYplcaUlXNWaayjnLkr8QB8WyIrE4xDry9Zg?=
 =?iso-8859-1?Q?GrF/s92Smt5VR4NF6kNcAf/r2dI/51lzme10O8ygteg1SI4B/twvMAywwT?=
 =?iso-8859-1?Q?C8XYg5wlKALR67HuUw+jB7InXHZMFjQawdTSF/yw1/UxyvbXJ3aI5Rktit?=
 =?iso-8859-1?Q?mNligUVkpCQGp6Ebe6xfbvWQc091yWXWIN6Lx9u4sCGBXgdCEy2D8pQ1rA?=
 =?iso-8859-1?Q?IZ2+OCb9BzsSwvGDz+oTwlbuP2AlaJCTXNXfKrkxTQbo67l+l8IlfXjJhz?=
 =?iso-8859-1?Q?OAGWGFOif9GiDh/Z0RCRNzHmVnOGYdF6BKU1GdwrvfMp5wOXWqBRHmmP0V?=
 =?iso-8859-1?Q?SYRMUlaSpvyzbm9T8tvTow2L3ODmDBqUTS2xDemrgpsUwr4SxAv7VJOQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519d7477-261b-45d8-8870-08ddd0dcf8d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 09:22:43.6923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuQ6ahSRdINkBeeN5rYgu6evqCSZbfF6OCzLGHm387PKm/GeLXSu8Quv8rcrBcp3BSzsrSd1Dmx+7sb1t5KYvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10032

From: Luca Fancellu <luca.fancellu@arm.com>

Create add_discovered_pci_devices function that calls pci_device_add
on every PCI device discovered.
The devices will be added to dom_io so that they can be assigned
later to other domains.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit eff51e50021b75f5a50533f7de681b2ce044f5bd from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/arch/arm/pci/pci.c        |  1 +
 xen/drivers/passthrough/pci.c | 28 ++++++++++++++++++++++++++++
 xen/include/xen/pci.h         |  1 +
 3 files changed, 30 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index eea264db0e..b2426878ee 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -123,6 +123,7 @@ static int __init pci_init(void)
         if ( ret < 0 )
             return ret;
=20
+        add_discovered_pci_devices();
 #ifdef DEBUG
         dump_pci_devices('c');
 #endif
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 49a39d69db..d6f1c78701 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1180,6 +1180,34 @@ int __init scan_pci_devices(void)
     return ret;
 }
=20
+static int __init _add_discovered_pci_devices(struct pci_seg *pseg, void *=
arg)
+{
+    struct pci_dev *pdev;
+    int ret =3D 0;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        ret =3D pci_add_device(dom_io, pdev->seg, pdev->bus, pdev->devfn, =
NULL,
+                             NUMA_NO_NODE);
+        if ( ret < 0 )
+        {
+            printk(XENLOG_ERR
+                   "%pp: Failure adding the discovered pci device (Error %=
d)\n",
+                   &pdev->sbdf, ret);
+            break;
+        }
+    }
+
+    return ret;
+}
+
+void __init add_discovered_pci_devices(void)
+{
+    pcidevs_lock();
+    pci_segments_iterate(_add_discovered_pci_devices, NULL);
+    pcidevs_unlock();
+}
+
 struct setup_hwdom {
     struct domain *d;
     int (*handler)(uint8_t devfn, struct pci_dev *pdev);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 77a44aea70..81c0c23604 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -217,6 +217,7 @@ static always_inline bool pcidevs_trylock(void)
 bool pci_known_segment(u16 seg);
 bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
+void add_discovered_pci_devices(void);
 void dump_pci_devices(unsigned char ch);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
--=20
2.34.1

