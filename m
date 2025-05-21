Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88BABF442
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991773.1375590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS3-0008DA-Ts; Wed, 21 May 2025 12:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991773.1375590; Wed, 21 May 2025 12:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS3-0008Bj-Qg; Wed, 21 May 2025 12:21:39 +0000
Received: by outflank-mailman (input) for mailman id 991773;
 Wed, 21 May 2025 12:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic9M=YF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uHiS2-0008BY-8W
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:21:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2606::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 231c6a80-363e-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 14:21:35 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9644.eurprd03.prod.outlook.com
 (2603:10a6:102:2e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:21:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:21:33 +0000
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
X-Inumbo-ID: 231c6a80-363e-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nedgo0dkfIFtSIA9b0orcpodUWzJSyVM39C+bLqjOPVPuKW5wnKVBidKaWGdDqAvQLgd4p88d0BLk5WKZah+VHc7TDJSZGijVC96NK2CNBk+1w5hHRAwuYP3Ze7imFs6+QYE2YpAZ800LSxKCO+Zg86W5ez7eo220bOtGBVByPkrmOx7ign4Z1ir5/SCr7v5eORyBe3LJu2HfSRuIsih53ZXfPr78JEMpY+QE+1PwWNOYWZ3e6oTsPFrdixrTY/QEJh0JBdRWfk0oLP+03AWwyJQtWJUwrnjj/CSZroyfNFaqg7O+Gb98tsLLCDzu3sb3pLmYkTlFLfC7Nc/ZJZ8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ubzs8I4zULoQObgoaMItRYM4B8QCjrpSt1rCRfPQvBA=;
 b=xKqN056jKBkkzVycqE+HM9OFIjst8t2zjysHy6kK2WI+EDlH5t0Gv06K3eR4CwYkY9zi237ewXcgRmO4bQWdpz+JynrT9D5rfPC7FLQo3njdu76+CAnjTtxRUm0/1/fBcVQe4QUEoh9u31sYL3iflW0hUp2DfZp5fWwO395iSgbjo94iceWRPG1B5ODEZ1Y7iwF7vC5+rCJVNlkcWyTeWFwA0iN2xBPlnlciHJZaCxbLLRtOHmGAwWfaOPADPjly2JJttt3Po7SW4PgRG0xmfherrQ0NUaQBui7puB7fTR+r72Y0z9EHJJwi9wCubuBgEAYDEBcIPzTWVWJ7nQ4oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubzs8I4zULoQObgoaMItRYM4B8QCjrpSt1rCRfPQvBA=;
 b=Zw/KIKHE/14CvbK9XywUplQwRDrN8OET28OsUJ1N4LlC2K+TCw1xyI5SGA1PX4M+364onewPaLpDXdesQHGolcipckZqG6yeXIa+jZbmM6ONHSPU2AqoLUTT4X9u25XQesgsg/sTf5kBUttA2MCVLAeIAHAfpS+IJr720ZEess6axoZDosLd3OaSgNHC2SY7of0iWfGM8AXu1FT+J33BACpY4Bhh6DlSRp5TbEagtgF4JRTtodHk7ayYqZocyZV6OXnOd5PsCcMTfw0rcox0CO4YlR94F0ehupeXGOk0YPX0/AGINsgB+N9PGGHYJ94vIgA6ZquLbS6JTscu/WmjCw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v5 3/4] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH v5 3/4] xen/arm: add support for PCI child bus
Thread-Index: AQHbykrjNC7jm+FgWk6NewzRcK0EQQ==
Date: Wed, 21 May 2025 12:21:32 +0000
Message-ID:
 <5f46d2b3ef03dcc7a54f8346ba9e610002381ba2.1747820844.git.mykyta_poturai@epam.com>
References: <cover.1747820844.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1747820844.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9644:EE_
x-ms-office365-filtering-correlation-id: 782ecb60-d329-466b-f8b9-08dd986205ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?osZIaWUyM65BTcUY3Td0nkae2b95jgRfIgxr3UVz0G7v9Dc9G3PbY1M43v?=
 =?iso-8859-1?Q?b0I11SdD3Ta7ayRvcng4Y4JnR3/S8Rg1va/zw7X7ZiW9MVe1v+ZU8x+sUj?=
 =?iso-8859-1?Q?PEuE9J9E/CNUHTpKZSM3TT0u1hCHQupALEqJulj/u47ubXarezEJHJJlh2?=
 =?iso-8859-1?Q?EM9tbaZAabfYVDIgpOvKZMTF2dMThlfNCulG06Kr0VLfqoros34+s6Zj39?=
 =?iso-8859-1?Q?VGv7yTNj1hxAELWqAUhmK8vjCvukUeYp8PDiZVZuTJPb83LG+yW6wIw2Z7?=
 =?iso-8859-1?Q?yEbzUqovdNrS9yNFqyyd112Hee+XpZ7xN9qNNIOZsEMF7JKwWkao5II16h?=
 =?iso-8859-1?Q?kcBEdIKIG3HAdUOiJMvQcNqIsNyCya+mgHyl+SmZHq6cnUJVa1MusCmduQ?=
 =?iso-8859-1?Q?T5MVBsFYcRl/X0EyLMNcyRGCdqQ6gG9QykbC2csNYwTdasajxSSI+dtbDv?=
 =?iso-8859-1?Q?MAH1Sm7Q0bP3QgtRFYoqQDZr/0Vxvm27pDMPc8iHbhWR7w7mZrGaAwNTBD?=
 =?iso-8859-1?Q?5TTsMOkSJ4tjCCAKfSKG2fVX0V1FW4+xKm+YG++9tQJoZxg/3jVtbdFMS4?=
 =?iso-8859-1?Q?vDWlv89tmU8lfPbgUkKokZVc/t0Tz/K04Pt51s5QaqNT/VPRQfiMKINO1p?=
 =?iso-8859-1?Q?tBlTZMgMTG/TTTynPrk9bzsRY1bw9PvGrLrglte87xspvIMJCsGey1H6AC?=
 =?iso-8859-1?Q?PYBUf0E2vNr1gyplY9VLhXOc44Z6eiIcylbhY0AEP1lDg5NPxK0OmWgr12?=
 =?iso-8859-1?Q?Wto/u4hw1etpDtY5hn+uGOOH9Eq+iEZ72VCja+82NSEU4cyN8VEa3i0CWt?=
 =?iso-8859-1?Q?dAmYdfcJ50x2eY/zfCH1rNkIjTYMf9VPI6t9zhl85eUmFoGvIBkWM4fdAl?=
 =?iso-8859-1?Q?wjVMWn3XkVIVHcC+s9SXurxbkmSYimvoP+9jxDnUJhdgxoA5UZX5sC041z?=
 =?iso-8859-1?Q?z+6YUE7KiARWUU1xyCszaqOyCdvMVuQ+KtIk1O+KR3iAN1R2kWE+rJyvRI?=
 =?iso-8859-1?Q?lyN+jT5eRO7rNPpQKsg7MPuY+5RZ6xvcM+TtXhapI8zZMiloTuPTWXy0mV?=
 =?iso-8859-1?Q?7ushIJL0l6cXMGLuQf5CGmqksJYnpmgv3gE++4hs/2DVjEJhyNHuMCiSDe?=
 =?iso-8859-1?Q?dFTnhrc+g+RLCYcaLqVZIkdQqGP4S6oZ/3YrrA08gBGzmXAXWertI+VctR?=
 =?iso-8859-1?Q?q9BCN5YgyxdRmyF/KOHu0VeXvPCdYn0R8MsO6/ezFT8bUMtYvJwae6qcoh?=
 =?iso-8859-1?Q?2wuS3Aygz9+1S0lofg3gFjqqb9eNxLAEDpNjJOi5Q8msoYZMMCIpcL+6je?=
 =?iso-8859-1?Q?QEb9Q1s0GbaL4aLonXI1QE4BA8uA8YBNxzbcXEi0Qp2k3xlWBlTEyjrOrT?=
 =?iso-8859-1?Q?r847SJUOHgD6gqSTBlZ9ah7e7moNbJWexZrTbvaaHFTud+q1J8i2h6G9wd?=
 =?iso-8859-1?Q?wGXujMWbZIJzGUkrF3NBl+ekwmshxHiX/tLI2e3iAuLWm4Fvq82dnmxz7v?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UuD+bVgad37WyEHx5DQn7RomGpTU0IgOX9K/FzVRj9Cq9ktymkQ16Y9C8h?=
 =?iso-8859-1?Q?pYsOg2i3Lve4kKr+kHQRZruSw2GfQMARhNG1l3VZq3F+6J4ErwByXe5WUP?=
 =?iso-8859-1?Q?l9Zh3Lx5Q0CaTppsBNKvRQZ/fyD2lDxG7ayQs/9P+0N1XDrm4niXKb9KFj?=
 =?iso-8859-1?Q?/TFZGNdViJQQ42PzyMQHDZORjizMx2sDArxSmFAslsRJmOzIA4H9e4x2Fx?=
 =?iso-8859-1?Q?0Hbc3lp851PIBkYefDOXske0NaMoIXr4s4Ux3ZvRVa483REHKUHBBc30mu?=
 =?iso-8859-1?Q?i5tBiTQ3HXAKVEd5aGq1AUFF1mj6yuN7EMo5uniaZftWSmmB8TTyLlfH0z?=
 =?iso-8859-1?Q?HznSUm62zWQqgVBuG5oGIpTVq0wAKIbdLq4ZTdWqQVLt+KulCulzyHLjGA?=
 =?iso-8859-1?Q?ewJcCMvKSo35LKrF0J9HxP+eNvrPvRNgRRf9McWk8sU8vIRCrr10rejCqe?=
 =?iso-8859-1?Q?9TSm9lWXhqn51IlH9vJNmvtE9FGpRlK/6bId59ooWWZWXVTCgredp3iP8/?=
 =?iso-8859-1?Q?824N45EmwgTtg3KgKGKlllcCKYF+ev2gY8TG/BkxFQh1ra3FMICvgePOby?=
 =?iso-8859-1?Q?P6horl7YlmwrRPX/DH8nNNBIJ3/6R52eb/B4Neq5pYRps+VvCE8CYUR1Zr?=
 =?iso-8859-1?Q?PgSv9EFimhyYKLj6MLzBgonlUYUjrtRSssN4d8Roc/5v116MLe8ZwPg/Nt?=
 =?iso-8859-1?Q?5EQTIs5GJW0jun6LOZgyT09TgtVH2f6VeRoPaNsAYX3OqLQFKooVcpk3et?=
 =?iso-8859-1?Q?c0+qPGeocoqElFLwhD+cQKhS3BysSFMu0RJz1SVexQCaxBhVZOaii17Naw?=
 =?iso-8859-1?Q?+brtF0zqcgINGUIkFSc0d7n3A4vPCvrG+gFIXdK3FHfoVR0+Dfvvt6QlLp?=
 =?iso-8859-1?Q?mI0zgEqNDs/uXO+8Hum+/5ZPaNzSKjsFRnXQR3adA0+y7cTpszNrl5Ms+J?=
 =?iso-8859-1?Q?Ci0yHeW9Jp5W1qGUtY3ZAdljxdn9OuDeIPmSSD5BbjBGXHMgA8MV1vY0nH?=
 =?iso-8859-1?Q?J8aEpDrtyslAMv3I5tCxtKx8dY0PQEbwbFGV8w8QlKsodyEFOIIKJY8mbp?=
 =?iso-8859-1?Q?vS4ypLEuPs74LkPsiLTtJnJr8m/k/e0M2uMCftHde73p6phM3LeMPKOquG?=
 =?iso-8859-1?Q?odqDUwF+TFFrOu7vQH6NmozB+2I2HXDlnFOpMnIwOciWEyfa1b1RLK9E+M?=
 =?iso-8859-1?Q?3YUyMfTs1/3JILDMibwO+FNxfT53mK/xRMGJ/QTMopNFJEwg7MIGG6Lw1x?=
 =?iso-8859-1?Q?X7yqky9AN/2Hg869Gxcmdo/31zX3D/OURKnUltBK6yCC+xko7HSQU2gX48?=
 =?iso-8859-1?Q?vLxarH25T1fPiby+iz+ZQO8YA7cCgJ8JFPGxXjv79ggo1jgpV7svj/rDOR?=
 =?iso-8859-1?Q?mCybSBFCqVPdF7KPfbP+s62CTFULBHkBqwT61BNRbPJoAmkzmHrd6Tt4FK?=
 =?iso-8859-1?Q?Y8RnFSoiWmsxNS/71ijE90/xgMYPPtZF0MRUrpy0ho5I05MnemneJrjOA4?=
 =?iso-8859-1?Q?lMejp0kBdTWMujBhBEo1oId1JVdG3Jr6ZY7OQxk4BCMzhMbPH51omFhNOF?=
 =?iso-8859-1?Q?uI8XspUEEHR7mD3LfB/z5+LutiuvGejZC/Pcgg7Jzn1YZYWe6A2fwOOXH6?=
 =?iso-8859-1?Q?d862FDIZqWppoIwOxxbWGSJ77olEUvKidgUTY+zshIfXE7nIMzrKlCXw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782ecb60-d329-466b-f8b9-08dd986205ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:21:32.9731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQ7D4Ajuz+RUnpxngLTTZIqU/i2ItYcdgjibuhNI9ODh+uXtIRigBHg10IN8boPMiU4Qb7StuX8P9iKWb/YQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9644

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
- install MMIO handlers for the child bus for hardware domain
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v4->v5:
* fix formatting
* move init_bus_range inside pci_ops
* fix logic error in pci_host_bridge_mappings again

v3->v4:
* remove changes to pci_ecam_map_bus
* make map_bus inline
* fix logic error in pci_host_bridge_mappings

v2->v3:
* no change

v1->v2:
* fixed compilation issues
---
 xen/arch/arm/include/asm/pci.h      | 20 ++++++-
 xen/arch/arm/pci/ecam.c             |  1 +
 xen/arch/arm/pci/pci-access.c       | 37 ++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 84 +++++++++++++++++++++-----
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  3 +-
 xen/arch/arm/vpci.c                 | 91 +++++++++++++++++++++++------
 7 files changed, 194 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 3d2ca9b5b0..1f2b74a2bb 100644
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
@@ -80,6 +83,9 @@ struct pci_ops {
     bool (*need_p2m_hwdom_mapping)(struct domain *d,
                                    struct pci_host_bridge *bridge,
                                    uint64_t addr);
+    void (*init_bus_range)(struct dt_device_node *dev,
+                           struct pci_host_bridge *bridge,
+                           struct pci_config_window *cfg);
 };
=20
 /*
@@ -96,8 +102,10 @@ struct pci_ecam_ops {
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
@@ -130,6 +138,14 @@ int pci_host_bridge_mappings(struct domain *d);
=20
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
=20
+void pci_generic_init_bus_range(struct dt_device_node *dev,
+                                struct pci_host_bridge *bridge,
+                                struct pci_config_window *cfg);
+
+void pci_generic_init_bus_range_child(struct dt_device_node *dev,
+                                      struct pci_host_bridge *bridge,
+                                      struct pci_config_window *cfg);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01..c979af7302 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -60,6 +60,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops =3D {
         .read                   =3D pci_generic_config_read,
         .write                  =3D pci_generic_config_write,
         .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range,
     }
 };
=20
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..4a94867501 100644
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
+static inline void __iomem *map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t reg)
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
index 53953d4895..487c545f3a 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+void __init pci_generic_init_bus_range(struct dt_device_node *dev,
+                                       struct pci_host_bridge *bridge,
+                                       struct pci_config_window *cfg)
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
@@ -82,6 +77,35 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+void __init pci_generic_init_bus_range_child(struct dt_device_node *dev,
+                                             struct pci_host_bridge *bridg=
e,
+                                             struct pci_config_window *cfg=
)
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
+             const struct pci_ecam_ops *ops)
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+    if ( !ops || !ops->pci_ops.init_bus_range )
+        goto err_exit;
+
+    ops->pci_ops.init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,8 +232,10 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
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
@@ -224,7 +250,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -242,10 +268,28 @@ struct pci_host_bridge *pci_host_common_probe(struct =
dt_device_node *dev,
         BUG();
     }
     bridge->segment =3D domain;
+
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops);
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
@@ -280,9 +324,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
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
@@ -348,6 +395,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -363,7 +411,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( !need_mapping && bridge->child_ops )
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
index a38f2e019e..2c4afa7a19 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -35,6 +35,7 @@ const struct pci_ecam_ops nwl_pcie_ops =3D {
         .read                   =3D pci_generic_config_read,
         .write                  =3D pci_generic_config_write,
         .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range,
     }
 };
=20
@@ -47,7 +48,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
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
index 0ce11ffcc5..d41aa383a8 100644
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
@@ -24,18 +26,14 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_h=
ost_bridge *bridge,
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
     unsigned long data;
=20
-    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
-
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -48,33 +46,86 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
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
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
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
=20
     ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
=20
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
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
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
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
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
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
+        struct pci_config_window *child_cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child, child_cfg->phys=
_addr,
+                              child_cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -105,8 +156,12 @@ int domain_vpci_init(struct domain *d)
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

