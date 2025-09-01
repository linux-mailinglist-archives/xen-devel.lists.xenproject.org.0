Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD73B3E68A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104912.1455932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut57K-0003H1-14; Mon, 01 Sep 2025 14:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104912.1455932; Mon, 01 Sep 2025 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut57J-0003E3-Tc; Mon, 01 Sep 2025 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1104912;
 Mon, 01 Sep 2025 14:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noMw=3M=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1ut57I-0003Dx-GE
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:02:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 513cd045-873c-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 16:02:38 +0200 (CEST)
Received: from PA4PR03MB7038.eurprd03.prod.outlook.com (2603:10a6:102:e1::6)
 by PA4PR03MB6782.eurprd03.prod.outlook.com (2603:10a6:102:e3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 14:02:32 +0000
Received: from PA4PR03MB7038.eurprd03.prod.outlook.com
 ([fe80::62a8:3ed7:1b8e:677b]) by PA4PR03MB7038.eurprd03.prod.outlook.com
 ([fe80::62a8:3ed7:1b8e:677b%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 14:02:32 +0000
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
X-Inumbo-ID: 513cd045-873c-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/jtqrcNx7Uos3GBXRtj0DETlRmRItZfGhqCD1Ksol8t8BZY2GrVGMpVAqCQt6bH3tNn2n7FV3aYmr4ekelSayMT3hQjR+/npzK2N6mS1OsWofPewTBH0AID8O7UncphJGGTaKe6hL7jtUGlQ11U3qUJpPGl6e3dfPrlTPszFWJj5sAntmmPpyPMpW6LfGb3t4UOGMjmZ08ss5OpkGQhg2dKLvWv4JwaMrDYHgMrrZCClwGt+s1poIsKXeV0udECqAY5Jhj822V6IWgUuMeiRjfAEgd0xG/nhuMV/A4Z54ByzZHxjZUVloEoDh7noS+BITtzWz5C9ivxqqTgVF8Dcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0kqapVvPaKhbnW+HIkL0/A0sxyvBcPC+2xYi+c0WuU=;
 b=wTxhdi9/pAQXZk1XS3O7bJdCcRtqNalwTuNKqP8PBeS1opPm8GFcjpsoxRMnLpyHsaoWdM+0Wm9fhKY4/ZWDcykXb9IkMMVr+P3dSOOxpMHWQ6dcg/uSU5fLRxA+OxBNo/bGiPo9URRdz/pVSOTOU87ix1eR0stLu+ANaZ179jT/YcRzCoFXXZk2TAWC/oenW/QsCoNqbk5Rd9t4n7jwol3trj2gQIdjWqtNkWymdWO1OBRGLjY+rGNV7kpYIn+haOnC968AQWCXAMghRdeYbv9ksMoTLw4wbQYQzL/sa/PJf3ZShrwagi5BoDweJOqv5d1lmsvQ/onbufDzEusMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0kqapVvPaKhbnW+HIkL0/A0sxyvBcPC+2xYi+c0WuU=;
 b=kcCz6AsVnA6KBhRfdeotLn3jwmOHvfKbcbRmyyaWyZyAKCN9nR+kNP/JeQxDWkOZ+OV7Q+TmjX6lFDKogA90+ry1mBeunnJdrY1QTr5hy3LVYZBPlJ7/mklo0M30AHVmbuzzJkJfneAk++MIQRgM5DvO7I6v18LVWntVckBHYMs8VJ9dcexytJWbByfR6n8Pmf7HhKtOdSScTHelxWwt5gD10p6oVDa6V2909NIzFoMUhtAvGC9uUlq4N1oICd2pLNwhFGLIh710CTJDgbWr64LS54rYbQlKkZYy+bdK+JqhXeEznHRmh/mCqjL56nEX7/2lw2lVdTsz/uIcadyKMA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: platform: Select GICV3 dependency for RCAR4
Thread-Topic: [PATCH] xen/arm: platform: Select GICV3 dependency for RCAR4
Thread-Index: AQHcG0kPDoyzfEe8LUCSfOma0fVaUg==
Date: Mon, 1 Sep 2025 14:02:32 +0000
Message-ID: <20250901140231.1322170-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7038:EE_|PA4PR03MB6782:EE_
x-ms-office365-filtering-correlation-id: e7a45d58-4967-4692-1754-08dde9603255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Ep1uFyrqeiMUL6r7fxQQiBCOL2JjpFmdZ+O481Ui/7kMGYnOf2zMEtVNXk?=
 =?iso-8859-1?Q?WPcqdbOf3Gm547r7hmGuLLxYFL2nu+5X0Rqq00bZcYgQvCk9b/QYED128/?=
 =?iso-8859-1?Q?ZAVzKc2JBwIbuTgHMBSwlPluxH9ytIhRwWfHlVX0+pfM1vpfCDQYzjzIfU?=
 =?iso-8859-1?Q?eyFu9WmB0i10To16MnBWrLTQ8g1uwcHF7a5h1JlwdbPtZn/UilT8QAGXy7?=
 =?iso-8859-1?Q?K2EJ11jzHmW8HfakpEACdikcCihBavL6ycNEx4kkL3YZErzxN6/1zyj26u?=
 =?iso-8859-1?Q?CWE5xyjhDdafPFnR3BJYvrstSygQmxmETlkHQWsfZodsuSQBvdAv8wzM0r?=
 =?iso-8859-1?Q?FOWoSryjEIu06FwBx8j1xalzEuaWMUtp+g1z0JQ0Evxkjj6T6TJ2cs1JQv?=
 =?iso-8859-1?Q?i6DKOTBJ0KD+5k/xP8xGO6OLQ1KhCnfqTsBvJefG6qtfbvwD5tnJ3y9PY5?=
 =?iso-8859-1?Q?I4ErdmiBdmeDQnzIT7tQOm+WMj2XLYrIbs1OOXoApoUVJz4lQT8g1PPO9v?=
 =?iso-8859-1?Q?koiaK+5uyOEbfOqz8ceJZeV+ei3CcQGtwGwuaZY8rDZFfOJd20DtcunrpH?=
 =?iso-8859-1?Q?hMZsCQp/glkFOxaYJAQk21BVAXaNzQcSdYAWlye/B2CgXTBM6C5/1VFJQr?=
 =?iso-8859-1?Q?Z5lWNg76I5F5x/SMu81CTcuKb5PtMHEtuXWNwWO9i4mhhm3H7oTqjaYBcq?=
 =?iso-8859-1?Q?NuaSdLF3dwCkgBDqKuRuofjLo+0Kiqk/l1qvbQacog1/sOLdAZNaxUA+uy?=
 =?iso-8859-1?Q?uojGQw3kQ/AhmfM98ecAV4vy5mKwedY5UPLgGBns0NAbWaHKynkRnjrxnR?=
 =?iso-8859-1?Q?5tn3nadQrPOr9LO9WdgMkJ6d+DXyWZfhUcqjoYnP4GxVBsEt1SGRky+jSo?=
 =?iso-8859-1?Q?SVGWw/ycFwGCyrUXb80ewiQXqclVhettMGkIgSL89/TDAIXPVkSKkA3cwg?=
 =?iso-8859-1?Q?nhxINDD9O1Ep5J8wZXYRz+vMFumF6y5d/ksiy+NdU+Ylp23oUi1wSICU2w?=
 =?iso-8859-1?Q?Rq8DvbFkq+MRxClEW0UkHqm8tWQtMz3moovUAFX+JB/aGX5RWHP7MUCugu?=
 =?iso-8859-1?Q?qtZPJxRpW7ExXh76A3ioun+gGEmI1njtP5b5ANuT1jnEyMy5TBes4AmKXk?=
 =?iso-8859-1?Q?+v7vvgWeoU/13ZbnbVSljBvBgH+H9AVKk4LoQldjXZ8pfKkh0hiqWyw6GU?=
 =?iso-8859-1?Q?QYlWvuvPtO2hLH/iUzi8G6WkrUqE8EiuEc7JqQpmTvpG+7Hz7dPU5ZHSIg?=
 =?iso-8859-1?Q?CGuEQCwIQuYoi5STIhsevdqpUR2uX0REKd0WqKF4BaWayqMFrZWS4LCk48?=
 =?iso-8859-1?Q?y5lsUR0TuQt6JFQDw5c1i4h0LLNMOiD0M+y1cSpWMIMIToe3gCTXWlSxB5?=
 =?iso-8859-1?Q?zjtDrd4cnqX7AKh6ln7j75cj9w/ocJCrXMjN5aVOtVSJz52ziUTPw7qvQL?=
 =?iso-8859-1?Q?NzlvM268zX5+1PvRABjgf4N4NhnmAejAmNebtuJ7TvcNY69BqZTIiPuD0/?=
 =?iso-8859-1?Q?LAOTeFRUeELKiiCPfvo17EZ1E/E03MZLfpjgwjZzxG0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7038.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QI+APgQg0nfP3i+HVP3WBtvtVuZk/Dm4BGnhxG63jQARY2IUbX8l8Yw/0T?=
 =?iso-8859-1?Q?gnuy6awMTXFGrSj0wyWJH/0Q4RPIC/anqyLkNZmT4CRlWAgOB2pLs+Lrcf?=
 =?iso-8859-1?Q?jRA5H5PTx5ZxfLHxQYr34gOWYq4wVlu/RHmfD0/N2jwT0+abdalxNgGQy4?=
 =?iso-8859-1?Q?xfrhtgxvG6rQVObOpeIT978RiNq9ykzapYyAJodxh03otKTfdzLiX49zhD?=
 =?iso-8859-1?Q?dVETjcC9lAt7+BY08jhoJofFokSZSuaEI5B2N1V+ly6y2WngXp0kSdWD9j?=
 =?iso-8859-1?Q?V2f+TmY1Siq2EbQ/gRIquZS+S3U7vzJsU45i55O0HEZ8ILIik3o+MxFgxH?=
 =?iso-8859-1?Q?WQwUTSA5cxokRGuK8BQwuqoYe9xbMn68APZuMgIx49zQFWKb+951u72Huc?=
 =?iso-8859-1?Q?Zex+USK8XJ02kP3FIIoBcc65ZQqcKNq6tTITT78nMx5LpI3AUoi9isrjVX?=
 =?iso-8859-1?Q?0B+LUPDC9OlXQiOyxABHh1UrRcRHHSh0JXI3KPxwxdzmJoDKcuCD2wm+I3?=
 =?iso-8859-1?Q?oqrLMQRJ6AlY9tQINA1MnVEziiPwm+GUug16Itm/EsYPlfVf1AfrpcHWCV?=
 =?iso-8859-1?Q?WuJl5TyFqq+kxeF3Zr1ATYmGjeBJx60QbvnXMsyz57VpNVbN3u10n1x+LW?=
 =?iso-8859-1?Q?8nblS7Is7NpiVyDvjvdN7FgHB4Ht2xOy0GyJo6CPEhzv2S5ukQedN2FlNL?=
 =?iso-8859-1?Q?tpcl2LDZK7yV/ZSRbV1ZfSHoPC2yIQ9+NfqYRGU4SBH4wqr1jFd8wJ+5j2?=
 =?iso-8859-1?Q?NMzejnFmf41XM1/BeOmFqsiNXsKzEFpqtnbGeAMcLzmhzP+9TJggcqVSad?=
 =?iso-8859-1?Q?24PMHmEYfFEbdE5P0xB7Ok7XF9MKpa7mbeogHU1RbbnDYXgq4qowWymK7m?=
 =?iso-8859-1?Q?SaKu8/rhsWPBORaXUIM/6Kjxd/O5yX97ZwYIruFJZtvUomiBTUcK20cYLN?=
 =?iso-8859-1?Q?Za+IhbSS8s7iGQkNoQtTcRlg9MH0ocHfSJDWLDbkLErs7+XE3boOD5qEdS?=
 =?iso-8859-1?Q?Wfn86wcvQ2DKNMaWBvFh86MdRSW7Nk1CUFkazSKhWR0/icZ2DNxFcKP2no?=
 =?iso-8859-1?Q?Gzu04NvZp1obqyRiPt+D6zpfNTSZv+PJ6VP02c7JuAkeNse2Kkfde8U+5W?=
 =?iso-8859-1?Q?vEE68wgay9A+45duo9nR58g+odnIecVEvm1oQJZykT2bo2JtImFC7539Oc?=
 =?iso-8859-1?Q?Y/9kB2ntmdLyK9OF9uJrJVcAjFk9qnBoGbReVNt6qjoA7KRmjCw6gsDpZE?=
 =?iso-8859-1?Q?dX3ZTxYoWsXmzzHNZjsW1+Ba06eK7PxyW+Ubhv+d8qwd3JvJOnFHYL1pmy?=
 =?iso-8859-1?Q?TpO2FOuEJi8PI9vC3qY4QEWFzA7BOBiHWJ6GAJPK/xBHCe2GQI5joSSH7C?=
 =?iso-8859-1?Q?pgOehHPZAcE/dqVGqShmzHuDJNFxYHvVfaC2v/hx2n6PSH4rbA7f7AyBsG?=
 =?iso-8859-1?Q?Mvk9kdCYTxvPadXAYuFpxz+7I7EPGkE5i9lavDWBFUszvzyqPSw0abFxqI?=
 =?iso-8859-1?Q?7hZntqNaeD6H/tGM5VxSkQuVyYT+f/IU//74/NsmgChZO7CgqsbCfuwwW8?=
 =?iso-8859-1?Q?MK4tgE1Nw92tgHQgFtFoPZ1syXhkl4yXI0Z9KoYw5PuGbXH7TaBYmVBARj?=
 =?iso-8859-1?Q?C+skCSIo0rekpM14kB3IJR0NtKMJ3lZml2n1NQy1cPckta9iWDpDxbYIDE?=
 =?iso-8859-1?Q?0Q4ezR17VX8Z9VvFFFI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7038.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a45d58-4967-4692-1754-08dde9603255
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 14:02:32.6702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgqVOskkBkkQPpW7D1DtqPKfPLs1N8NYQJF8m8YQR15Dfg4sBfRGy4Z0mdSi7b3ADwbcGl/joEnby8bv1JqoWg2GDBdFvxvLwnlmznHCs98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6782

The Renesas R-Car Gen4 platform requires the GICv3 driver,
including support for the Interrupt Translation Service (ITS).

Without explicitly selecting GICV3, it was possible to create a
configuration with RCAR4=3Dy and GICV3=3Dn, leading to a build failure
due to unmet dependencies.

GICv3 driver (GICV3) [Y/n/?] (NEW) n
WARNING: unmet direct dependencies detected for HAS_ITS
  Depends on [n]: GICV3 [=3Dn] && !NEW_VGIC [=3Dn] && !ARM_32 [=3Dn]
  Selected by [y]:
  - RCAR4 [=3Dy] && <choice> && ARM_64 [=3Dy]

...

arch/arm/gic-v3-its.c: In function 'gicv3_its_map_guest_device':
arch/arm/gic-v3-its.c:729:41: error: 'struct vgic_dist' has no member named=
 'its_devices'
  729 |     struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *pa=
rent =3D NULL;
      |                                         ^
arch/arm/gic-v3-its.c:755:28: error: 'struct vgic_dist' has no member named=
 'its_devices_lock'
  755 |     spin_lock(&d->arch.vgic.its_devices_lock);
      |                            ^
arch/arm/gic-v3-its.c:768:54: error: 'struct vgic_dist' has no member named=
 'its_devices'
  768 |                 rb_erase(&temp->rbnode, &d->arch.vgic.its_devices);
      |                                                      ^
In file included from ./include/xen/sched.h:6,
                 from ./include/xen/iocap.h:10,
                 from arch/arm/gic-v3-its.c:13:

...

Fix this by adding "select GICV3" to the RCAR4 Kconfig entry.

Fixes: 336fc7a19b49 ("xen/arm: platform: Add support for R-Car Gen4")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/platforms/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g
index c8bc0bfae3..888d0b85d5 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -33,6 +33,7 @@ config RCAR3
 config RCAR4
 	bool "Renesas R-Car Gen4 support"
 	depends on ARM_64
+	select GICV3
 	select HAS_SCIF
 	select HAS_ITS
 	select IPMMU_VMSA
--=20
2.34.1

