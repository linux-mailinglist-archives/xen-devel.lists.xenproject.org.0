Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A00A9881F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964355.1355187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxe-0002Un-1M; Wed, 23 Apr 2025 11:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964355.1355187; Wed, 23 Apr 2025 11:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxd-0002Re-UV; Wed, 23 Apr 2025 11:08:13 +0000
Received: by outflank-mailman (input) for mailman id 964355;
 Wed, 23 Apr 2025 11:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoPD=XJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u7Xxb-0001zZ-Vd
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:08:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3de964a5-2033-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:08:10 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBAPR03MB6677.eurprd03.prod.outlook.com
 (2603:10a6:10:197::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 11:08:08 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 11:08:08 +0000
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
X-Inumbo-ID: 3de964a5-2033-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fks4NZSceU/P/4v+G7mwpB5MNDGN7QOZzUkZnt2F1bbGYDB+UVoOCvFHFVaDrhqZOvu0e3J0EW8pjzTD8KtUlItHcwl2uZCSgK04iITpMC5Hbp3jaMKiYbNT5nkdHdXn6wtHBxdvJ9dtEJWK1JsDuUHjf+Ve9H/ppoiDabF40ZGOvQGc1y1AScTjMIuGut3HDzYD2MDDcBsnL3VOGNqX0j3BqcZ61pnXRj1rtlX5u90DXwG2kuriJLV1jBCJ4QgOPigm8+2toAw40nz44AR/dFS6s3U2BcxGSg9tgwINJnUg8q28XKfgTuBH7V7l/wp9VnFPvcnXOjlcTn6m0SXh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdBQJrdkkEupJCIJnnq0CPWtd/ImnqdkUes1bIoRV2o=;
 b=bjhipGKuLD2/onXNd99oq6VyDQVSJSg/0ET1AF+XNCkh0nPWiiWtveYyM5oRn1HrllYXb6G9bwJkJap/d3qJDURGMZk4wKcuM9RNGggvuBXjZQu0ca71yiN+5tGXUR+AMp6F8XyR+/6yRCVgz6eHS+Qi+M11NNDoWZepjHK6wbfc6cLOlJLuhQXAW5a4hXD+Ut0iFCMF2Lx6ADY3kBz+NYThgN/kvgrlgvD5M9QCxVn0pC98iy31659ZdTBV+2250zrDfgScOEJ8lGeEBQJi0QXV9G4/zQhNIt3q38xh3Xr6pXi+0E5BgA398r/vMzhghX8vH7CQXaZjQp4iCHggHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdBQJrdkkEupJCIJnnq0CPWtd/ImnqdkUes1bIoRV2o=;
 b=R6nc9M38Iac3V6PJQ645QHAmgQ2bVpKt7Nib2XJD1OoNzH6QyztZvBx8dB/pKcz+8O0IQljvDg/Nys7dLmHjk7r0NEZOPzVs5q2pVX0w9kKi0qus4RKpTu+jRmuM+RC78kcloKhk1ogzaG77FePZS/urGBYW7Dh6wZkshDf3lcWEEoM2IJp7UL179HNibF4+azLxPKhZRhIUJmEET1+n8563KJQ/SbYjjvFD4TsvfXCO9xCO0E739E6R3Ff+AlY001W3v7w7jKgnWqpR6GtflfitCxFnovrIZ2wUwJ9wSr0zoZJ3NLFNByzsYX0NNBdHWVHYFpserKnMgnssseSwOA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v4 3/4] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH v4 3/4] xen/arm: add support for PCI child bus
Thread-Index: AQHbtD/+iEx0Vt7ta06YeE/e+t9zSw==
Date: Wed, 23 Apr 2025 11:08:07 +0000
Message-ID:
 <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745402473.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBAPR03MB6677:EE_
x-ms-office365-filtering-correlation-id: e1e11ceb-8c73-4377-6f86-08dd825720c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SH/QWsFG8mUZN61qMrdWhei4s1LqdGD8MUdjFCB45xDN0JldaDMbxGpBhk?=
 =?iso-8859-1?Q?7DD1CVAzLJrh8ZiqWefjF2o6qL61oWCCZ8u/BfUZMO0qPozUzTZjj/dZhs?=
 =?iso-8859-1?Q?3ah1JuRm9EPCg8liDvMDHzzWE32kIXhdGmWGUYehGyHEvFUhE0RERbhG1u?=
 =?iso-8859-1?Q?/9o85r6EvO2CIisIZMcgmXS29tzj+Xwl7ygf8ssblInvCeVeuoA/n0Ad3j?=
 =?iso-8859-1?Q?laM28HxOMiJUWZMJtAMvi13T0F2mx32P4lvvuOt5OX3bgqceX/kXZsQLMf?=
 =?iso-8859-1?Q?PLqIK+nWHlStBPp4gJc6RaPxVc5X5LC6LIiacbWIfSitznTOHRqPdIbmnE?=
 =?iso-8859-1?Q?z650zzX+d5vi/n30ks9flG7qvBxwGHbWgdteSqNzCaE6wlCCJtQBv9gML0?=
 =?iso-8859-1?Q?OcXH4wNBd96u7qaFgi5A9eaaf1EGUtCh9QYQicaDvjLgR8Bg9BqEg/D19o?=
 =?iso-8859-1?Q?6iiIFcBf8X2GuV3q44R0JFs/In5BBnZkMml+9jmAwiR/LJezGbf5YbG0Xf?=
 =?iso-8859-1?Q?/RrOYtJoBLk4SQyMPs42Z39jqeXIOVksj60ZxQeajh3HHa+/sq4VWy2aMw?=
 =?iso-8859-1?Q?uglKpZE4F5k/F6XR/xrxztB6wCfBUy5wyJTqIZz9Dkhm3HTrd2nynsP+y3?=
 =?iso-8859-1?Q?+DXu0xygP5k3GuV8HxLiEcZjOPCZhjIaVsn2m0I3fNkzM0fyiyLWpbLfMa?=
 =?iso-8859-1?Q?whpxp9p4O2dDY71GYC57FkikxF2Exvbpa0q1qbRLr9jht6rHej00ZFSR5g?=
 =?iso-8859-1?Q?XDP/+kZ82TTzQODUpvUV/74uVaF/aKTeH/uzNmmTyRh4te71U2ZaSdX715?=
 =?iso-8859-1?Q?kjsi25wlBLqVCjmxjMui+qgoSQsUM8EOCKksis4EsKC5hIv7nU8sKto+9K?=
 =?iso-8859-1?Q?v/CShIQkkClwnP5XOXwGcv97RapuvYl7ZVHPIYremSTbiSySdWJQLUokI1?=
 =?iso-8859-1?Q?JsMod8N+QhjrE/9sr6bnQMrSfG8n9L7kgcjbkyjXD20igEK/DnW++2jsrU?=
 =?iso-8859-1?Q?67KSZDU/xa7xUxhgJDMLMJUB9jqcKw1ridSD01f63nWY3TshM3oNeMZK/8?=
 =?iso-8859-1?Q?VrvsUKslso+valnI8jvzBPBafQxu4gCDKlGaHNvJVQSLTuhRen5cqPcITc?=
 =?iso-8859-1?Q?6TDcX6QGsQWdCfFP2wexZJq7sX3EDh7siuf7UJPfe4JSU3W6C2ZUS66Omv?=
 =?iso-8859-1?Q?Eeb4g+C92ft0U67A5ueW/vg5Y9FnPlnFknYHZ1QmybNj3iohowaK/GvBnS?=
 =?iso-8859-1?Q?gEE0b/ukSMwr4JTVu/OSD67Z/v+Hbsfg9ou0tNzdqzRBe5bRTcgQe4Nm3A?=
 =?iso-8859-1?Q?LPdTJ5dZkw/x6V02t8ZY/37/w//6o32pl3YeMmKMPiIOzlw1z+NPKzTN+o?=
 =?iso-8859-1?Q?72V9aKMdOiU3n9abr2e3rAXNUlcLVKJZpef8RgB35yLlhXQxzv3L36dX1c?=
 =?iso-8859-1?Q?11ERspz+oGd+gubkh7ipPdnILfZlMrNoYLRy6CjYZfrxZVeTmFOxlNbEK0?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eTey89pfGV62OwffFq4PAwPcYJ4Ns3LNxrjbAUjCsHd/1NcutYSvNCzMvV?=
 =?iso-8859-1?Q?gXym6dgG52juMi7cxUpEXuxysgAoRlHeP5XFEAmHpnoRjXWHkf2k2U+yq3?=
 =?iso-8859-1?Q?F1R/oRiq3FtCC+TGnfdftcB+Mz4sjKRuiJ7irM0Li7lmpodL01CJtMGCbO?=
 =?iso-8859-1?Q?o3Kc1ihC8tAvl03y1u79+SrR1bxsBymMHQPgR0ZONZA4JawMRKw/Jk75Q0?=
 =?iso-8859-1?Q?xQ1L4aXJ93tgGYcOly4qxIQEUq8wGwtYPlMfXl4eyyl2/DH941lR+i5IcR?=
 =?iso-8859-1?Q?eWjFXuAkeTYt0wXYcV+gZNsCAg3plJXYKTfZf/fNZJsSGgrdku6WD9rteG?=
 =?iso-8859-1?Q?3eDcypMv/n17zMbsbEpqxNrSpZJhDZZTiMI+N8BPnMdj+wk1dIGQMElpDz?=
 =?iso-8859-1?Q?gdoclOUopkbeCHuF9rfHwlvxuFN6HF/5YJMd5+hzCed3jmv1ZGaDxEYIQE?=
 =?iso-8859-1?Q?6+nhRU6v5JCORKuzbqk+irhza2rC7W9A/Edw4ZxN8qnXyfyIjMCFB4v1Om?=
 =?iso-8859-1?Q?66EOBmKM/vyq1SvY2E3t/veqBDv2RKDcgpYjhXby3Fsd29g845YpWe+93c?=
 =?iso-8859-1?Q?II1wRrFFFr11f0hjJB7SolhVI8HFKoxSTQEZSMIPYX0ndyVGVlC75pB/d3?=
 =?iso-8859-1?Q?57uKyalUBM8kh5tT3iVoy+Y/Gao6Fgsr66PtRhQPzsWzGva+Pf09lHz+qm?=
 =?iso-8859-1?Q?e4pmb0RJfsRpIePDZAYan3SJfvAUE5QThy/XDWwjGeuAJ9hvBtvOPNbSw7?=
 =?iso-8859-1?Q?Cjw2ANpN5yA95FIL1fabWYqGl5OEBIgkwKZenPXXEhrmK+Hgc+lYLGaEdz?=
 =?iso-8859-1?Q?BjIldJB8D7u9bDMp8ybVCqifZeFF/WAM/V4ZP4WCsJbq2Uy8ZAseWtyKrW?=
 =?iso-8859-1?Q?Eftzmcajx4t+S/fXpou1nRAg115lx6gOCjfQQNzhze0PfID6ZAIiY6dFFq?=
 =?iso-8859-1?Q?Fh4+3tx97YDsqyI32klD89WJdSpU0iLF8l2FBjV+x3cLi0qZy8PC/HOXyX?=
 =?iso-8859-1?Q?DAZdQzF137NciRmPDKKhOVzrv2qJAJtfF1FswxicVTha5s9n2mAqMCQQdI?=
 =?iso-8859-1?Q?OVuXGTlGNbJaD/QBjKoKW5Yg8FBcoxJFYlorEX7yh2KUOMffCyl5slWEww?=
 =?iso-8859-1?Q?JQJJz+yMt0o2ma53074RJhfmsJmPSAH3tfg/bKRFB5cZA+RAWUj4eszasS?=
 =?iso-8859-1?Q?2IL2/9T8Oa+6nAJumnYWBqSF0v4VQcqjXDgKOLVGVljttvSbjJ9DEXUr7a?=
 =?iso-8859-1?Q?/i20X2RTFIa8hQn3sg3OPLfXIgelZN081MYjumP5x3QDmTxO0j4iREx8yO?=
 =?iso-8859-1?Q?ij3HcMR49YHr4osXECl88hX9OxR6myNjJarGqEKPrviGjBzVsl70gdZ9LT?=
 =?iso-8859-1?Q?hqCVIOBfvB6VKJyzJVzPdxXxDBtXoy62na1ONL0WxYO10RP9uhtpemzX4x?=
 =?iso-8859-1?Q?a9wNP9+ACTdN7CTKhWoGO+ac0TbGr0KRSAN9bqxnv3ciCSEYuvv7djqPq2?=
 =?iso-8859-1?Q?FIP6GI58/QcFZGuEZnvxQruV2OZi2kqeEIKfAzLQtnXZdZUwKMM9/ri5zC?=
 =?iso-8859-1?Q?7aXSLZZG11ee0eFOHfAszr9M9xYpECARXNKnQYWNHo4jSijbzhXEvqVAoE?=
 =?iso-8859-1?Q?tM4jpTt+ffxTjTGoHy5aTAvGY84VsBSCJGL/OGIX0fZGg8GHQVxh+nfQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e11ceb-8c73-4377-6f86-08dd825720c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:08:07.7987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDzZnXu6y2c4sj65ksLU+mendy4ogbmkExkA++g5hweaUQYYshik3KklQFC3/HyU6oRcm5SyUW1FKe9JzooT5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6677

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges often have different ways to access the root and child
bus configuration spaces. One of the examples is Designware's host bridge
and its multiple clones [1].

Linux kernel implements this by instantiating a child bus when device
drivers provide not only the usual pci_ops to access ECAM space (this is
the case for the generic host bridge), but also means to access the child
bus which has a dedicated configuration space and own implementation for
accessing the bus, e.g. child_ops.

For Xen it is not feasible to fully implement PCI bus infrastructure as
Linux kernel does, but still child bus can be supported.

Add support for the PCI child bus which includes the following changes:
- introduce bus mapping functions depending on SBDF
- assign bus start and end for the child bus and re-configure the same for
  the parent (root) bus
- make pci_find_host_bridge be aware of multiple busses behind the same bri=
dge
- update pci_host_bridge_mappings, so it also doesn't map to guest the memo=
ry
  spaces belonging to the child bus
- make pci_host_common_probe accept one more pci_ops structure for the chil=
d bus
- install MMIO handlers for the child bus
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v3->v4:
* remove changes to pci_ecam_map_bus
* make map_bus inline
* fix logic error in pci_host_bridge_mappings

v2->v3:
* no change

v1->v2:
* fixed compilation issues
---
 xen/arch/arm/include/asm/pci.h      |  9 ++-
 xen/arch/arm/pci/pci-access.c       | 37 +++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 xen/arch/arm/vpci.c                 | 83 ++++++++++++++++++++++------
 6 files changed, 177 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 3d2ca9b5b0..94ec63f3c8 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -67,6 +67,9 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    /* Child bus */
+    struct pci_config_window *child_cfg;
+    const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
 };
=20
@@ -96,8 +99,10 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps);
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..91271973fb 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -18,10 +18,31 @@
 #define INVALID_VALUE (~0U)
 #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
=20
+static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
+                                     pci_sbdf_t sbdf)
+{
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        if ( (sbdf.bus >=3D cfg->busn_start) && (sbdf.bus <=3D cfg->busn_e=
nd) )
+            return bridge->child_ops;
+    }
+    return bridge->ops;
+}
+
+static inline void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sb=
df_t sbdf,
+                             uint32_t reg)
+{
+    const struct pci_ops *ops =3D get_ops(bridge, sbdf);
+
+    return ops->map_bus(bridge, sbdf, reg);
+}
+
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
     {
@@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridg=
e, pci_sbdf_t sbdf,
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
         return -ENODEV;
@@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsign=
ed int reg,
 {
     uint32_t val =3D PCI_ERR_VALUE(len);
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return val;
=20
-    if ( unlikely(!bridge->ops->read) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->read) )
         return val;
=20
-    bridge->ops->read(bridge, sbdf, reg, len, &val);
+    ops->read(bridge, sbdf, reg, len, &val);
=20
     return val;
 }
@@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned=
 int reg,
                              unsigned int len, uint32_t val)
 {
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return;
=20
-    if ( unlikely(!bridge->ops->write) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->write) )
         return;
=20
-    bridge->ops->write(bridge, sbdf, reg, len, val);
+    ops->write(bridge, sbdf, reg, len, val);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 53953d4895..1d0dc1b4bd 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
+                                          struct pci_host_bridge *bridge,
+                                          struct pci_config_window *cfg)
 {
-    int err, cfg_reg_idx;
     u32 bus_range[2];
-    paddr_t addr, size;
-    struct pci_config_window *cfg;
-
-    cfg =3D xzalloc(struct pci_config_window);
-    if ( !cfg )
-        return NULL;
+    int err;
=20
     err =3D dt_property_read_u32_array(dev, "bus-range", bus_range,
                                      ARRAY_SIZE(bus_range));
@@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev=
,
+                                                struct pci_host_bridge *br=
idge,
+                                                struct pci_config_window *=
cfg)
+{
+    cfg->busn_start =3D bridge->cfg->busn_start + 1;
+    cfg->busn_end =3D bridge->cfg->busn_end;
+    bridge->cfg->busn_end =3D bridge->cfg->busn_start;
+
+    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
+           bridge->cfg->busn_start, bridge->cfg->busn_end);
+}
+
+static struct pci_config_window *__init
+gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
+             const struct pci_ecam_ops *ops,
+             void (*init_bus_range)(struct dt_device_node *dev,
+                                    struct pci_host_bridge *bridge,
+                                    struct pci_config_window *cfg))
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,8 +233,10 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps)
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -224,7 +251,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -242,10 +269,29 @@ struct pci_host_bridge *pci_host_common_probe(struct =
dt_device_node *dev,
         BUG();
     }
     bridge->segment =3D domain;
+
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops,
+                           gen_pci_init_bus_range_child);
+        if ( !cfg )
+        {
+            err =3D -ENOMEM;
+            goto err_child;
+        }
+
+        bridge->child_cfg =3D cfg;
+        bridge->child_ops =3D &child_ops->pci_ops;
+    }
+
     pci_add_host_bridge(bridge);
=20
     return bridge;
=20
+err_child:
+    xfree(bridge->cfg);
+
 err_exit:
     xfree(bridge);
=20
@@ -280,9 +326,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
segment, uint8_t bus)
     {
         if ( bridge->segment !=3D segment )
             continue;
-        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_e=
nd) )
-            continue;
-        return bridge;
+        if ( bridge->child_cfg && (bus >=3D bridge->child_cfg->busn_start)=
 &&
+             (bus <=3D bridge->child_cfg->busn_end) )
+            return bridge;
+        if ( (bus >=3D bridge->cfg->busn_start) &&
+             (bus <=3D bridge->cfg->busn_end) )
+            return bridge;
     }
=20
     return NULL;
@@ -348,6 +397,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -363,7 +413,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( need_mapping || bridge->child_ops )
+                need_mapping =3D
+                    bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
+            if ( need_mapping )
             {
                 err =3D map_range_to_domain(dev, addr, size, &mr_data);
                 if ( err )
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index a6ffbda174..47cf144831 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL)=
);
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index a38f2e019e..75d1235aaf 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4..468aee1db7 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -8,15 +8,17 @@
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+                                     paddr_t gpa, bool use_root)
 {
     pci_sbdf_t sbdf;
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        const struct pci_config_window *cfg =3D use_root ? bridge->cfg
+                                                       : bridge->child_cfg=
;
+        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - cfg->phys_addr);
         sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf.bus +=3D cfg->busn_start;
     }
     else
         sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
@@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_ho=
st_bridge *bridge,
     return sbdf;
 }
=20
-static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
-                          register_t *r, void *p)
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r=
,
+                          pci_sbdf_t sbdf)
 {
-    struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
     const unsigned int access_size =3D (1U << info->dabt.size) * 8;
     const register_t invalid =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
@@ -46,31 +46,78 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
     return 0;
 }
=20
-static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
-                           register_t r, void *p)
+static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info, register=
_t *r,
+                               void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
+                                register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
=20
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info, register_t r=
,
+                           pci_sbdf_t sbdf)
+{
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
=20
+static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info, registe=
r_t r,
+                                void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
+                                 register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
 static const struct mmio_handler_ops vpci_mmio_handler =3D {
-    .read  =3D vpci_mmio_read,
-    .write =3D vpci_mmio_write,
+    .read =3D vpci_mmio_read_root,
+    .write =3D vpci_mmio_write_root,
+};
+
+static const struct mmio_handler_ops vpci_mmio_handler_child =3D {
+    .read =3D vpci_mmio_read_child,
+    .write =3D vpci_mmio_write_child,
 };
=20
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
     struct pci_config_window *cfg =3D bridge->cfg;
+    int count =3D 1;
=20
     register_mmio_handler(d, &vpci_mmio_handler,
                           cfg->phys_addr, cfg->size, bridge);
=20
-    /* We have registered a single MMIO handler. */
-    return 1;
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child, cfg->phys_addr,
+                              cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -101,8 +148,12 @@ int domain_vpci_init(struct domain *d)
 static int vpci_get_num_handlers_cb(struct domain *d,
                                     struct pci_host_bridge *bridge)
 {
-    /* Each bridge has a single MMIO handler for the configuration space. =
*/
-    return 1;
+    int count =3D 1;
+
+    if ( bridge->child_cfg )
+        count++;
+
+    return count;
 }
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
--=20
2.34.1

