Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AAA82651
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944085.1342655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VWZ-0006L7-70; Wed, 09 Apr 2025 13:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944085.1342655; Wed, 09 Apr 2025 13:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VWZ-0006JF-2c; Wed, 09 Apr 2025 13:31:27 +0000
Received: by outflank-mailman (input) for mailman id 944085;
 Wed, 09 Apr 2025 13:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scqd=W3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u2VUk-0001T2-CX
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac399df3-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:33 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7468.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:29:28 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:29:28 +0000
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
X-Inumbo-ID: ac399df3-1546-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1Sehf7EMtcHaEs9OOxP56eHQxjRVJPICPYwtpcih3j/4tCYIkhiZqOMDWI1b93z14JXEcr0GBsR0YXLITlyQufDCaigjrX1VkkwjEUUu63HfytMFlh5TWD0j7xIsYSLcwZVw5iZS96BiKaZEOKimYpvkD+13IsGTdHuM7VZM7y/nSiEeCzHlfpsvyEBbo6Vvc14ZJjYL7sbDHOvbaLyLrWSL3J8yDimK4R49o1KY023YMPbekmasB+ZIlqITi9Luq2lswVczPT4OP3YCgNZ58tDUq+GXQZS/7GFVaiX8epevdAbfmirSPjyVJ2GHbbU8EXmNC37Z/zGndpzI9ylXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJuqNZxW3mG85YtuGgnelqvRuZNDO16hFg7fEmceMJs=;
 b=NuoLsWv8mvS0Cacx8b9bPsvVxJhyKBNIvsmyaC45JAlnpqHmTX6nDlaCYXWPKih5mTfu67kCURX5S+3W7IPO2HlJbEI5ncuLC5z+MPNnDYCr8JPa/tm7zaP/Uqw+Ft7ArnDVnvD496ezh7KFXRQeGbN7oCL68DAFGbO9zhMrP6UJ7xuaYrHEhw/OoDcUPCRuikc8+pNWFS07j65mEsZKLsFnA22tuSAY111QiJ/bZEfLp31NDJLjJIpFc+N0zI8n2vv/X0YSt1czOV5vIkJh0KBW1s0EETYrs2qD2Icg5ZtpZstu3VsgHjeHMd+jBBchraAYFRNmmsWpa1dP7yTLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJuqNZxW3mG85YtuGgnelqvRuZNDO16hFg7fEmceMJs=;
 b=kASAyK6BfoLCLpcx1q2FHPxFJigcTmJ2UKgOfHbysCG4A/jfnFyG0hQFbz/7n36wL0hdvGSFyBihmb5sPam9SEMgECZAqnI06UkiMGxKU4IpuPyJ6eK9pEhpsv6cCRLlOBOOCjLMgx4Zu0Ne3OiG4nd/V1XioTxyLtXhM5pi7l4OheJF0gfbLv92Be7mwkPblXHAGgx8+SXOPY8TwRmHm4u7gHDivfynLDcZwLyDZW5WJtzNH25cF0PTnntTzXm1/Fr9FMzkdSHVui6HG3fN1x7MM5gyhQrEQjsuUdMrOreUOET8ifMl3uO8oPAImwgUUj2mu+zw0lMsww1q8d7Qlg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v3 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbqVNr1oqgbs5VOEWX9UPIk7Sjtw==
Date: Wed, 9 Apr 2025 13:29:28 +0000
Message-ID:
 <43f32fb392bfcb22b36281655242eead3fbbfa67.1744203405.git.mykyta_poturai@epam.com>
References: <cover.1744203405.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744203405.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7468:EE_
x-ms-office365-filtering-correlation-id: 00457dab-e74c-4015-a244-08dd776a8d8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NPHdmuegS+CJaaYB//kluvaM+eOfODG+BX/b8K/fdmcb/EzdGXkFsoUVIA?=
 =?iso-8859-1?Q?+5SzeYcceail7BFve67rh7ojzsgb5gYEfwqFW9B0fuw6TrfhB4X0OpIbUk?=
 =?iso-8859-1?Q?0updu3TVM32TyeyC9xtdhOJKpMN7eYQQfszY9KNvc41iJvSyf9MUv/0O8X?=
 =?iso-8859-1?Q?hAjIqe3wN6Y5vMI22ZLwzrz0aNk9QkGyR1h0c6tEpW5WJfEDDC2tHdftZq?=
 =?iso-8859-1?Q?l6WpcUkR6kw4fbrFikklcOo93ISr+iq0M7w2AlFV8Ocq4D0hoChyIFGHiq?=
 =?iso-8859-1?Q?5eXrGgCorPvoG5rqeNtD8AF8pPV6w+cMcxfOuzS7m4NJo8HIbuZNIKg/hb?=
 =?iso-8859-1?Q?JUiW6Nmr0+FdKw3E7eXJ+f+QzBhOw2aPiOseIx5iJPcXiQFbzy1CrDFJ7r?=
 =?iso-8859-1?Q?63FsHGIhnckjifW2VedyroQHqJDaTTQnpIfgMo2+Nv4mwNJW37C7eQZKz5?=
 =?iso-8859-1?Q?86m2C1xiLK121oAWsf8I55gVWcJi2thkiGDJBOwzcu4AZA0EYqyvIqPM5y?=
 =?iso-8859-1?Q?Fa3igUPTMUBO/vB/InEBD0W3EXZ5tNgobNyEMlYx2JLV7S3Q6RhPW4nhcB?=
 =?iso-8859-1?Q?1MY6VpcrPg2+R/ya/49eFFvkajxuL9TJfYg7gfnzxEYC39Foov+WoIHtiX?=
 =?iso-8859-1?Q?H4ersW/6LqNolHRr0kE+UjM86AxdPn4AZLi+nME0JHLJ3apIIP3V3+X/Z4?=
 =?iso-8859-1?Q?6ZnIA6axBUGmJzN0OMl1OgDQrNSa5PkabJ/FWx3wtxuDQQj0D2rwHsbgUR?=
 =?iso-8859-1?Q?1t82bTrYZ9txanT+AZDDfc8Mo0voG7ewhitFcqpj265fT2jyuo7h0odc22?=
 =?iso-8859-1?Q?mxqM9FXDA2QqtvZlvkV5dC67D/2z5y9WqnRMHbNONKptXkYrD/Au+/RL50?=
 =?iso-8859-1?Q?5xZl2x4JmZaxZl9xGPY5X+lrtPHTU77NfRCmgU6NAOUj1je8457BPFyt6y?=
 =?iso-8859-1?Q?kkAs9CK4PTHVhmNfh0k5G8SCEDbMEVf8/CBI6q3ORsy2vV1fi2YX3xgcdH?=
 =?iso-8859-1?Q?XUVCZAvF7r7Hbert2B2oy+mVTgP+nxTR0cRZBnt+OhCuRDeJH+WpEvsf/8?=
 =?iso-8859-1?Q?1OucpnAb745LaJuJjbcrRhw7I8J+oTQRkB1hUPfXGn30I8nYiwp0bYhW65?=
 =?iso-8859-1?Q?CVe3zKUH/62bNULsJJWpZpXOr3cEiNYsnlZiWg8QkRdVYhZgtzWGZoR1CJ?=
 =?iso-8859-1?Q?dY4UOTcO1Ii5IFG6A9h1lirwtm7teH5hHfRKfQWrRBzjifkNuD6dL1yrE0?=
 =?iso-8859-1?Q?yh8aBtFMD4OPVtX/Y+nZe/r1GjrrQYxFjVKjFhydPNyvWLhlusP0jow4lx?=
 =?iso-8859-1?Q?6pkmZx+Uh14BHG5pede+eVK2LxC0B27xqubJ8BugIBjy+qkZwGnxDgW/+Z?=
 =?iso-8859-1?Q?wzK5C7qau6RYTuy8C1k1yW2rSi3b4+0Dp0XTRqfHSroEPS0Sw/aQt3PLZ9?=
 =?iso-8859-1?Q?aGGE+Cx4YSCUQUP+AbhAyuMSYvGy93ns93/xbg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ge8TwWNs0dyBbAjcZaBOX5p14QqEwYnWTUhpV4cxMNH5H0tHFVJocl6KHo?=
 =?iso-8859-1?Q?za4qKixH5xncUnVCpxY/2/Ya1/C9SNGjHBmeKqoA+1mK8iOuQKQx0/aTUA?=
 =?iso-8859-1?Q?LOGwBWDVbCLvGLS1B6ekH9VhLydGF+SfrPFcbGGgvQDFCCXBM6NR7mIpnp?=
 =?iso-8859-1?Q?zQHfp6dNH1vHehko2POWqWHLfC0qkiXf0/fS/J5tDO9xB60EREOPIqUuLR?=
 =?iso-8859-1?Q?GKnLDdUExKm6Cb5IK6PzaBnLu3s7IpdnFTGmTHi2REQ3PsDcjoUYBYm8W6?=
 =?iso-8859-1?Q?3vI6MhFdfQZCP+32s1QG49d8VpJCaiYtCxezGhNgbenNDAQv7XNrIjjnt7?=
 =?iso-8859-1?Q?nvmlqEysR1ETwvGc5NKT4JD0blKbi9GONy5MCbuE3UNQqUhxSKInO9paYa?=
 =?iso-8859-1?Q?Mw7ntUzH/ntO03cmuuDTomRJMJ5hiUP+B45F31Dxp+hZkIsWvnpPoHtRnE?=
 =?iso-8859-1?Q?jK7ynldufSBqLG8/1q7TDK6TdM8DQb67DYLVwWZwgJ1tIUg0tN/8Jp722Z?=
 =?iso-8859-1?Q?3OxqVl/RSRTRvviK/rS6bSLL7pthDp9wCrey0pykyU8RQDZdtgLjnnanWj?=
 =?iso-8859-1?Q?8skEjIETGl96I3GuanY3m8JogEWXArQ7ajx4CdKtj12fhRzst651CCidf6?=
 =?iso-8859-1?Q?UREMZ2Wm18EiNczqOlYbDXrvbOeqFYj8ApqkSgd6PsYqU7phqkDC55unn6?=
 =?iso-8859-1?Q?lZSBL7kcY71L9XWDbSb2N/OR8WYqu02ePmODyG0YJA7T0pYjZzv0ZXSnMr?=
 =?iso-8859-1?Q?ge2rABaiX8WZmk+oA2/GERGgehdmz7Ssl7UV2xiUryIfK7wX6twYXUxBju?=
 =?iso-8859-1?Q?wZUGE70W6b8271WSOvIxypuY7gdqfbPDMg1y3ZoaW5xG1RaBl+RGYD7HbX?=
 =?iso-8859-1?Q?y4qKf45xNH4V6Yh/kEOyuPvsPou9+iRQWfZHcDABsUw+xQgEZWGDt0dn97?=
 =?iso-8859-1?Q?5tgZQo/OgGy5zLGBB1LWkUdTd2KO7XXlsQo58Zc31H2jvxXAsjcnhbZpqQ?=
 =?iso-8859-1?Q?4Q+OVQtWJkz/ZLmCyzY6RX+r0IKKdcWS91rfnuHPODIqTnIsfRZtnUG7Vo?=
 =?iso-8859-1?Q?CEnMnJZO0n1RBnqQkvcwO6zDQXM/hKX1TzOz8l9RVfDKwtm3u8+2MLw0K+?=
 =?iso-8859-1?Q?GpPDZx3xEAG/dxbbkIqcbRGBsXMHNIKO0rnLNKKejfZ2FNHQtiPrfuOARA?=
 =?iso-8859-1?Q?eJgN8QZjQaniYs4THmVmauFQ+wRy43vTKH+Zbk4viZwMCofRY+XoQIhdkW?=
 =?iso-8859-1?Q?+KddLNkrsEXMzlmuoEX1Iofq78K3o4bLeua3S1j4jC9x1ZhswAMbfgr0YX?=
 =?iso-8859-1?Q?d5ipKW4QriTZeczj8wXukFXR7wzqH8Vzj6vBAL9p/ia4QAkO6/zavqXrDq?=
 =?iso-8859-1?Q?M7IctngAi2nYi49Yz8rVs0BcsTfxQciRoFa5hLvuknR1cASB0yA8zRcsBm?=
 =?iso-8859-1?Q?RkK+bB2ZC0QPpg4rw7F+zOwQpurAI7+EO6Dk+XqYi4XiP1XbrNPJ8lgD9L?=
 =?iso-8859-1?Q?qDIwntATxj/ZmoZ8lluQDtzRWWM9PMtcA2SVx8kR2vxgR5jlKqEugPb/jU?=
 =?iso-8859-1?Q?H+k1nTpHErm/5StMjaasHd/OwXR5SsASKx2g8byRY0H4OZbYRCsauOKJ6Z?=
 =?iso-8859-1?Q?XH5EMM7iJVhz62Q3MCJSZBPEgaLmCtjeKpq9/X2OBlQDpRHNF7Q/J1yQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00457dab-e74c-4015-a244-08dd776a8d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:29:28.0904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KYoBLVVeDTYZ3yZchuMrGp3nla5tPgV9gTeLMFjH939kyQoyjR6tXuCzhg++yW+xKhYPg/bezbWKXrbsrd0Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7468

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller, specifically
targeting the S4 and V4H SoCs. The implementation includes configuration
read/write operations for both root and child buses. For accessing the
child bus, iATU is used for address translation.

Code common to all DesignWare PCI host controllers is located in a
separate file to allow for easy reuse in other DesignWare-based PCI
host controllers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* add priv allocation to dw_pcie_host_probe

v1->v2:
* move designware code in a separate file
---
 xen/arch/arm/pci/Makefile         |   2 +
 xen/arch/arm/pci/pci-designware.c | 403 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h | 102 ++++++++
 xen/arch/arm/pci/pci-host-rcar4.c | 103 ++++++++
 4 files changed, 610 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

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
index 0000000000..dcbd07ced3
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -0,0 +1,403 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
+#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffff))
+
+static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    if ( size =3D=3D 4 )
+        *val =3D readl(addr);
+    else if ( size =3D=3D 2 )
+        *val =3D readw(addr);
+    else if ( size =3D=3D 1 )
+        *val =3D readb(addr);
+    else
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static int dw_pcie_write(void __iomem *addr, int size, uint32_t val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    if ( size =3D=3D 4 )
+        writel(val, addr);
+    else if ( size =3D=3D 2 )
+        writew(val, addr);
+    else if ( size =3D=3D 1 )
+        writeb(val, addr);
+    else
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t =
reg,
+                                 size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+
+    dw_pcie_read(addr, size, &val);
+    return val;
+}
+
+static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg=
,
+                              size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+
+    dw_pcie_write(addr, size, val);
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
+    if ( val =3D=3D 0xffffffff )
+        priv->iatu_unroll_enabled =3D true;
+
+    printk(XENLOG_DEBUG "%s iATU unroll: %sabled\n",
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
+        printk(XENLOG_ERR "Read ATU address failed\n");
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
+        printk(XENLOG_ERR "Write ATU address failed\n");
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
+static uint32_t dw_pcie_enable_ecrc(uint32_t val)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
+                                             uint8_t func_no, int index,
+                                             int type, uint64_t cpu_addr,
+                                             uint64_t pci_addr, uint64_t s=
ize)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
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
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
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
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
+                                        uint8_t func_no, int index, int ty=
pe,
+                                        uint64_t cpu_addr, uint64_t pci_ad=
dr,
+                                        uint64_t size)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if ( priv->iatu_unroll_enabled )
+    {
+        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type, cpu_ad=
dr,
+                                         pci_addr, size);
+        return;
+    }
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
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
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
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int ind=
ex,
+                                      int type, uint64_t cpu_addr,
+                                      uint64_t pci_addr, uint64_t size)
+{
+    __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr, s=
ize);
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
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                              PCIE_ATU_TYPE_CFG0, bridge->child_cfg->phys_=
addr,
+                              busdev, bridge->child_cfg->size);
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
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr, 0,
+                                  bridge->child_cfg->size);
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
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr, 0,
+                                  bridge->child_cfg->size);
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
+    priv =3D xzalloc_bytes(sizeof(struct dw_pcie_priv));
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
index 0000000000..a15ba9a329
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -0,0 +1,102 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/pci.h>
+#include <xen/init.h>
+
+#ifndef __PCI_DESIGNWARE_H__
+#define __PCI_DESIGNWARE_H__
+
+#define PCIBIOS_SUCCESSFUL              0x00
+#define PCIBIOS_BAD_REGISTER_NUMBER     0x87
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
+#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), x)
+#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), x)
+#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), x)
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
+#define LINK_WAIT_IATU                  9
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
index 0000000000..cae1b4254d
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,103 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
+static int __init pci_host_generic_probe(struct dt_device_node *dev,
+                                         const void *data)
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
+.init =3D pci_host_generic_probe,
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

