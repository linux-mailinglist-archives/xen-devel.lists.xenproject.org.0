Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F9A2736E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881487.1291693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNX-0000sU-NJ; Tue, 04 Feb 2025 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881487.1291693; Tue, 04 Feb 2025 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNX-0000mx-Fj; Tue, 04 Feb 2025 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 881487;
 Tue, 04 Feb 2025 13:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNW-0007bp-03
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838906b0-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:12 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB10120.eurprd03.prod.outlook.com
 (2603:10a6:20b:57f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:54:05 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:05 +0000
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
X-Inumbo-ID: 838906b0-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edjCSlaYKAEBRGPLr7MeZ3l+bPSDDTIp3ZSjBRhYcdk3YyZgaa14OkUk7a07OiGBd/DR4DbyzZZcMZkbJGpCtFK/vTB4AD93/Jz+1Z6Lfgwu+gTg6LU3qeRy55FKsu82uoa6pvKY5vjWlL7X/ZDBbHoefy9dBbWNO3a6wGcNm0Am6L1NTkW9wwnHOHk2m4Mb6olLR1yoDsvhcBmXKlC+WDadii1duSJgYBvKRQLYLcCLAeTWRbyIKOM1Uws1T7YWvXS6W2RU3eZ7tTUa6A1nNfEofnfMGHr+BJOT2oP0ptCBxTdVyIQw9cshl2jw/fI98gbf2HZc7flvNK9Bqs5oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6yVN/7mR8MjfSPlwMkMwzKY7bVejLrXee73gB5MtkM=;
 b=y0Lom8FCzYW3DyRWZ9qYpKJyPBoLZ36XhzmkRi9n0+WxZxgkg2k2w74EVRRCgQgTh0orzXQIVqtGvccZkDBhKQn6xz8/O8m2u0Mp8w3upaBPWFOnZHK6L/3wuBbSJhas6JGqwY5gm0sE4WO0OWlH17AwgTyNBiGQyjA6Q+2eoXVgE7fKTRa3Jv25eyV0vWOl7+f/zli+XzlKg0y4K3OVOdOCUsmgFbR18Ku4TiEBo/YG2cUxOLs8lDurSj/OWJ0RMqgY4AW94l+/oDmuApA4Z1CJpsHdrAmVsbaHZyQkLtjcvWGwBx37AiDKigX4T5vXAEg9gx679BxfSviIZkoPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6yVN/7mR8MjfSPlwMkMwzKY7bVejLrXee73gB5MtkM=;
 b=d1wX+yHR/O62tKhCAAU2E5RvvZtnWwdPP8VzqVimqsi0o5ML6CuG/Vs7srKiloLDHpm2YD4xDZtc3psSbOKw/NmRoq83BK6OuTRmMDoArBsTAPu8B1bII6GfAFqysJ38DqsD1VWxoCWcIvPeKIYTAzCBgIHk15L6Wmd4yOSQsSImznRngNx1ZpGhWerSoowdepHN5JYrW4OsfZ553khmGU0YMO8LZCWduxWvSGYRarCE+KwCxm88XrIV9Hn00vq/xLn49dxrro2kPKNvSaxxrWJNIj1x265rXA40CD7hc8HzQlj0XnVAY3Kq20wSlntsJgloooz9oLn88uUmzC4P9A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v7 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v7 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbdwxA2HXgA27x50qr88LJQwvJaw==
Date: Tue, 4 Feb 2025 13:54:04 +0000
Message-ID:
 <7d9c8b93c01ee56cb8da6e959a020946efe65330.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB10120:EE_
x-ms-office365-filtering-correlation-id: a1ad0abb-2df3-4554-9942-08dd45236388
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XTmnKrbxCTVLNXMGAYgm/gwIts0qBTd/NclKn5x2+enpSrzf+lYmhV+hlW?=
 =?iso-8859-1?Q?+eWBloi1Sn+aJEmrOC2csajbcsRcVxTuWQa+nyG+gQ4TsL2mZ+Ctm0ad6y?=
 =?iso-8859-1?Q?5ZHgHrO2HaV+t7cOGEgpeHnpbPAJprXZpxHZLUt2UEzWcG6+wFuCJH4PD1?=
 =?iso-8859-1?Q?xEuQaV8Tidv/2Yama3JLd9lv5w0b9Yuv90PUWPkUwhmqyxIP5ealFydCtz?=
 =?iso-8859-1?Q?9MksuxSTm62YZYKjn5PV1XuevsE3QqE279e70zNJXHpL13bjzS2WEIC+RV?=
 =?iso-8859-1?Q?deFTCFgKngsQTTMWNBodnRX5BwZA1BwByfvRo6+CWrAhhLgcdkfwY88kxj?=
 =?iso-8859-1?Q?CmLN3hwrrG2VYR3nEcun5rCNOzfKx5S+tl3uGazBd+CJ3Zy45KHj2axbwQ?=
 =?iso-8859-1?Q?xDp6dEt+CO3qLzJji5grD0Rfxbw48ePloxBO+0AHL8pA2Ulp6oS/ClWxpf?=
 =?iso-8859-1?Q?5jqfYfZzY1irEYEDKQ4Izsw+nq1FzQeWS4k806wBzawoA+z14MpBzjBUZQ?=
 =?iso-8859-1?Q?pMLDrs+lXr+M6Ne9AIVO6zX3OHAwlonex073VEXgA03P2+rTQnDXWFH2Jh?=
 =?iso-8859-1?Q?ZJ3Uph4RmMBx3nlEJ+CyQwDbLfAyyGq2q6ef9kDLCbSDqrj6h0KGVhdVwz?=
 =?iso-8859-1?Q?1T6qCOaWWbjfFqH3iuVz4Vm6MHsJO8mNNsX8r5LxyMTF8olcl73hQlLUhJ?=
 =?iso-8859-1?Q?ILyryDzV1dKCua8ORaiCVilUj1UxBuF2YPrVVpUgePIAGk/jDI6GUZj4oB?=
 =?iso-8859-1?Q?PkZcydgag+vswVAkw+5/mxxTJlsMIF4TNg+migCfjeaGBNuEwlQ2hPmQMP?=
 =?iso-8859-1?Q?aiWFYGz1waTj127i/QZbgpCMQNUhFQT5495ieFGK0WWl2sTDupUbK7mu+N?=
 =?iso-8859-1?Q?bU7ej/1KM47lC4plBAdUIwOoupxKma89kNiMMUv+EEtFx63qziMR3jNdne?=
 =?iso-8859-1?Q?t+jBzPCwtRphGnJUAs9jTXi+cG73upunMaz4Ul2IbmFfnIwv00E8HsKeb0?=
 =?iso-8859-1?Q?Nz5p5BhHWrXOkig79sN8jzoApUxBWP7fUoMPKaMvVcMjD6nohmk4prHsLB?=
 =?iso-8859-1?Q?7KyHOCGQAcQqtTBzlb/bYnxqYZmVQm41r+489AKT/otlRjiMpulJZAckVN?=
 =?iso-8859-1?Q?T6bTdqEmhmLLkXr6UaNxTYCE/BSA6qA6Au6eNL7UK9cfoxmgM80b8zgXHk?=
 =?iso-8859-1?Q?dZoK7empddbJqdvIJ04nGdDaVg1nSIkrSJXyW8JRSpqzxFH2OfyMzFdzeA?=
 =?iso-8859-1?Q?L6uE8ViQHizM69AQjLGOAYhPnCtNuWwuqg+UVWl6hVnAHWu5ogVap8bjpH?=
 =?iso-8859-1?Q?htssZdRbub+iEN6Uaxwe3vRSQMXZFrg2uKNlJqxgg53qwbVYhdgCcFDcJ+?=
 =?iso-8859-1?Q?xkY51oFdJBcQW0ghsQwsiIJTOA6MdxXVz/1trpEKwJsPmtoCyifsOug9Ss?=
 =?iso-8859-1?Q?pQA6rCXZPwCfR8CRlPHy8hHoMnE/vcNCaB3zq6rxBS+yhudcLgJbKyHL4o?=
 =?iso-8859-1?Q?lKf9RWXR0OXoNqOFeSLVla?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NzWm29EZ8JppSLvy1YkbJngNZg0xepYeLtwCoPglUO5x2pUpFIvJGuGFUN?=
 =?iso-8859-1?Q?1wNyMAA4PM03H3DPeQYIKMvvOAJjTg7hGQ+i7lGUikqQWlx8KABzbDbzEU?=
 =?iso-8859-1?Q?9L3ma3ujRfJYyL523Y0pWQStQque0auNImklvIuzOTsc5iS7SdyqynTQBX?=
 =?iso-8859-1?Q?ZXTCWxzUW9Bj3+mcLRGqqMRVS+ueXUKabjgA8luN5Q4CgF3HaZa9GiEbM2?=
 =?iso-8859-1?Q?pkZlu+f/iEleQZyltaw3msamfE8gcuT1y7BodyebnMT03e5aAyZijaJODZ?=
 =?iso-8859-1?Q?QZ0gFeO6tjqDOlNBo9d6COYdYJR1H6+v/3xaO4/1wKcGIbFeecLbOOytas?=
 =?iso-8859-1?Q?HnhytQ+b24NF5rSfOfrL2g7d3CTeg30MbL4Tmh4pkvCj6R48nAgygaY50j?=
 =?iso-8859-1?Q?LcD4psizxc9QpsIXwNtmI0zTqTMB6MeG7D8jt4xWkyJJ0cjhZoSHFlydy7?=
 =?iso-8859-1?Q?WPt34VMPtY5u92C2OVnBXLNAV0mvIkePxQIj68geBewKi72LiMLAemZwFQ?=
 =?iso-8859-1?Q?LcPSmFUdUF+op8nWspzTl8z6QHgXW5uHXsvSXGub/p8QacfY2wZpDYxH3T?=
 =?iso-8859-1?Q?cTlgRhxuFMZLkmk3ATiRs/jBg5SHvyuBPa2uL0o0wcLra2gYfaxBMfJpzu?=
 =?iso-8859-1?Q?ikFVqNZ3H3BaqUOsPTvF/JKDpnvVO/CyXkokchVIIiMlO1prX612kWT1LH?=
 =?iso-8859-1?Q?2EZGevxElHb03r/xiNyWATZn5kz9FOaIG74LlzltS6TTLrzuVhEugsJZ/Q?=
 =?iso-8859-1?Q?YmHN9jOhCkCFbyOWd/iJu1eN7xVIZ1eIta/KH0O69PvdrzZdR6jO8kM8V9?=
 =?iso-8859-1?Q?jvUGSLS0VX62jUx5HeaEH9igfg64Gm1n/GVuq6vKX9F4gil1WFjl8IOmeT?=
 =?iso-8859-1?Q?43MoJkGHZ5FWs2SXAJWO8gnsQHN4u9ZNx7RjjBlBoHkibIq+YR2x4U2Sww?=
 =?iso-8859-1?Q?iNR8w4/B5E/ZMUqN91LEx06gXJ8M4FHshwIxQgQnWjbzNb5LxLyP7rYfCu?=
 =?iso-8859-1?Q?Cg9nLNfCANL/ZAeTVVSFG220rUG0MYOllpOHAcqZBOw2x9Ld7dHB5ptfW9?=
 =?iso-8859-1?Q?FcAYR2Q9AzUnKo+S/JdN3Md1l9gnRlDo9rjtAQ0hVk3qGcE4Y/Pvgo4Zgt?=
 =?iso-8859-1?Q?gsNyeZGbvzFG7suTPU7+DZu9klt3BMW6pwH6vdwFc0p3mQNqzPOanvI2+T?=
 =?iso-8859-1?Q?+5V6rbIHvvXe0p/X7Ci/zeFd2e3v5Jdhd6FQcCABzKGrBppD6Q24zCUzPc?=
 =?iso-8859-1?Q?ly+/7fp7RBYpyP5J3nFdLu8dxtGXqn6suXYYC1j2fr7YRBQR5cmFPMZK5M?=
 =?iso-8859-1?Q?5f2rvVDJJshbe7Yeg2EQpwzh0d1JRJ3vGCWGhDC1r2yNA7VKq1wVGZgmCA?=
 =?iso-8859-1?Q?ToaP6V2G5DRu9NpexrvYh3jTMl9kFIqCoSTEW5I8sxYuOwx5Npirptb199?=
 =?iso-8859-1?Q?kflvlfrvMVOrC734UP2YXXFvxE8HFZSgESzv0BeQOFDrF7OMSUM/49TBEH?=
 =?iso-8859-1?Q?NvGBq4QgZPaV5B0vOslS+KqoNNMacdohrWa5I4cItQsLBPZuIcbbVpndUg?=
 =?iso-8859-1?Q?tHIJGsEUOKSHSZ3xyU7z10fsEpM64i/ucPc7G8cucXxtOtNhFpr88B1tOZ?=
 =?iso-8859-1?Q?b1uJNNGlFRyx1Sbn9SBftEjxqP3vaxxtWbEJtmd1Bxsl9tMdo5aKHMwQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ad0abb-2df3-4554-9942-08dd45236388
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:04.8717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+tkADKPEDqrKHTCczeJdCPj1Br4NdvXJjWe3ewV0hAK+JmX5ZzWyWfiNtDiose0XbKhLzQ0y8jENgR3IlZ+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". We rely on dom0 to initialize the PCI controller
and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

is_pci_passthrough_enabled() is not an Arm-only construct, so remove the
x86 definition of the function.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

v6->v7:
* remove x86 definition of is_pci_passthrough_enabled()
* update comments
* make pci_physdev_op checks stricter

v5->v6:
* new patch - this effectively replaces
  ("Revert "xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>=
""")
---
 xen/arch/arm/pci/pci.c         | 5 +++--
 xen/arch/x86/include/asm/pci.h | 6 ------
 xen/drivers/pci/physdev.c      | 4 ++--
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef..f2281e81aa 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/pci.h>
=20
@@ -83,9 +84,9 @@ static int __init pci_init(void)
 {
     /*
      * Enable PCI passthrough when has been enabled explicitly
-     * (pci-passthrough=3Don).
+     * (pci-passthrough=3Don) or IOMMU is present and enabled.
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled() && !iommu_enabled )
         return 0;
=20
     pci_segments_init();
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index fd5480d67d..720fcc7f09 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -49,12 +49,6 @@ bool pci_ro_mmcfg_decode(unsigned long mfn, unsigned int=
 *seg,
 extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
=20
-/* Unlike ARM, PCI passthrough is always enabled for x86. */
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return true;
-}
-
 void arch_pci_init_pdev(struct pci_dev *pdev);
=20
 static inline bool pci_check_bar(const struct pci_dev *pdev,
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..d8a49cadf3 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
--=20
2.34.1

