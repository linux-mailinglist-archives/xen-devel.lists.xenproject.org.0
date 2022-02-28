Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F314C625B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 06:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280084.477949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKc-0004xp-J4; Mon, 28 Feb 2022 05:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280084.477949; Mon, 28 Feb 2022 05:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKc-0004uI-Fm; Mon, 28 Feb 2022 05:12:22 +0000
Received: by outflank-mailman (input) for mailman id 280084;
 Mon, 28 Feb 2022 00:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLaL=TL=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOTsk-0007Sm-A7
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 00:27:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dd3808d-982d-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 01:27:15 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6460.eurprd04.prod.outlook.com (2603:10a6:10:10f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 00:27:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 00:27:13 +0000
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
X-Inumbo-ID: 2dd3808d-982d-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz/UXzUP9JI27VcULwbSjESjLDJvZTQczKIpoSCRlHnxnCranwPPl+oJZHEoPkxdHj99ML0tMYianySIIGKIedp/zpAgrhdFTMsFJh8CygNuUAZG03GOTsUvD/ctOWuwnNvsbRGtYeXNdWKXETnLxjbmVJEw7yHFMr7mFlmmfoYWcxZMKuG7MTqBTSK+d2LV7KAa9tMhWt10hqz5Iz2dAbtkHIGfAo/csxANhKEeKBdu3+h8WhcN+hjUXmseZolt/fTl1sH8sHWfmgR7pghr0YLpWz240B+oYWgCN+yZzUYrZkF7km+lmu2geSMp2yV7VMON/LJaepqQKOypyY16mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMGefyqmp9TvgUgnXkoWxjjwX+pIBdIaAGpojmKBTAg=;
 b=RE5tMuozE8Gs3UVgQsr8kLWSkwaG5quWjmUTiqeikKFgxrRv79JbqdYaTKmHyHL3T8R/vXzozdGN4l0gkfdRXRkFLvoXNkywGUh7zA9YO5SIagEFBo01oqHzP9PUHFQ9qbCxHF1f5QekNqHceUG9Gr5ccw6SlFACvsP1JlQJgYd1SqjMrbjk1Tc1kIF7fslZB7oWtiu8TvWkGwRb9kKAyJBLgcdjrX7J9VPbEJ7dJaV6pfAMmTrJmYGzAHjrvW6Zg0XdxvyR0Sp827NSGWfEu6XzCvH9rYMtqQ+cU/NNgh6uOKR/7SVMG51aLMnQIaa6ytQAUVI++dtyaV0op5HH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMGefyqmp9TvgUgnXkoWxjjwX+pIBdIaAGpojmKBTAg=;
 b=BBoPabCOzAgIG3YWEmaY4jB5DZJ1G2nldK7GNVulZwgJtp5FiN2hTyoGAbqcx9OVU3LoCr4cMJs483utsLdLEjX6kuprd6iROOvNboEvuLiA6lIHrR7N4yjgzA7LSZnZkBHY4WG8vEVG3b72AlNjWG9XU8/tWmpAkwI4myBqVBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	wl@xen.org,
	xen-devel@lists.xenproject.org,
	van.freenix@gmail.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/3] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Mon, 28 Feb 2022 09:07:08 +0800
Message-Id: <20220228010711.11566-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aedd7f3-f36e-464a-f0da-08d9fa511092
X-MS-TrafficTypeDiagnostic: DB8PR04MB6460:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6460F54B578D074735187AA7C9019@DB8PR04MB6460.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nr3FxVPNnCmeSsM6+18wjDBRrRN80HZczd8BgN9LhkMvHzRcbU9qmFYz6tXYCTIM+94/t9TPHJZfc0rHH0UvpB/ZxOpstjpPMTpldZAqlTThd7rMZffUanpNGvWWIG2RHL61kZIh8xbUmxmmQiNpt79acoG2eW9bjAVXlQATB2q/Nd4QoLrOTd+xnKGP8WKEHsokP1R6x5H1o2dUlJvrbmK1NnkCLBuudxy0ffLtPg/54d01r7XuCVjvdB15NqwQeomBWJwWtBr+h84u1eS4uIHYu0z8k7Y13IJLHameR3By0fkaFQzWFv69BZhdcUsmWZiDzZ0isieXY/QHQ51PwhSgysmDFpqDEIzUsOAr5vKfScXPksW66fZ6IQjeOZFGisZqQgDgvcI8AwsPY7bnt0plzSLsOsF6vrqNk8821MEdkfwDAxRrvuSyykVYZi4AQ60gIQrCrvmoEI5s660LIe/KT0LMG7aUoi3NNbI0oHgJS4Jg9ODeX58NVG7/sky0ZFZKPfkVj2Fyie8Pg4lxPjJ0egTSVyPkoY/Xsds8VLABYI/7c0ul6idHw5rt0j8mY4b2jkOdR9JD8ymF68vDKxJq+mHQsfBIe0ej6/KKv7n1b63Kna9wr/VdX8U0BZ1UiQw4M62khqGtXi8FQf53y8yxYOjcBw0glBIoDWSfLOCTmoQ2B4mhOFNAICEJxR9oYK2efGk93DxsHRU9vc9EGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6512007)(6506007)(6666004)(316002)(4326008)(8676002)(52116002)(2906002)(2616005)(1076003)(86362001)(26005)(186003)(5660300002)(6486002)(38350700002)(38100700002)(8936002)(7416002)(4744005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3m/kOx/z3Mp95wxTXq8DGphXecYQwlcOjQHnouZc/5W8pKAN5ZWNUCrEraB?=
 =?us-ascii?Q?0+wj4DWrlXJ41MuSnapZUkna8b1Yz2dYPcZTRkT1HZ5fO3G3QjpOGn2tt4xR?=
 =?us-ascii?Q?28js4jy4pZBBJjUJwzatpuO4spZ/pxPFq/Kpjsi3Sxn4o8LLUaM1zFAVGe4/?=
 =?us-ascii?Q?S/PPUPTvL2JuNNkP9KdcNYUo7KJUqsgeUiPIxUMzYupMHtNO2mNhU+vDiYIf?=
 =?us-ascii?Q?0C5LgdCJ6CgpOCcyVybW3f7bT1ObWsjNeeMOHV4/Id46d2JwUbvsv6SJCLYb?=
 =?us-ascii?Q?Xw9h9ozjENBf73JM39t9qnh+IFH4q8mmHNRnoR1jlX9WUlXiCgzQT8VuV/Gz?=
 =?us-ascii?Q?J7SJveo5tNBsUDvUnPZiHDYBH8mL4zVx/EFLUsoEi/H4gtZAFwUlBxRBI7oo?=
 =?us-ascii?Q?PTFmzrIltuOgSzO7DXXhg5gT54zBoyb50AKij8bYfVNaZP85o0K41ugVtYVg?=
 =?us-ascii?Q?J8sGWyjkLOQo8qo5m/XB9f40JGTaJaKwUQU2ANcN9FJcx6sYfLl82MIFrLkt?=
 =?us-ascii?Q?5/1VyLFdZrMLAc9pkYxZfchSBWqanJgku+d56oA7KMkNNUPYe1wrO5mIKWtf?=
 =?us-ascii?Q?KUwaukJqumUg5GiNL4qELuJVVQjBgrRo6dX0QHveq20I6uwINOO8Vh8D1qzC?=
 =?us-ascii?Q?p6jJY766dvfGkCKMTBr4UTV/mGMk9q6vSHvNrudSUARdRH/9OS+iC8rfJMt8?=
 =?us-ascii?Q?GiNBt3TG5nI2GerCneQfvqn+1q8P6B0ZFKsBK/F+5ymc0rOkCJYSPDXJgInB?=
 =?us-ascii?Q?d5NVV9nVKwjWslvKN43r+xFnxLJ0lmyeeF/CIGTppWJXUFXtsFXABZNUGbUl?=
 =?us-ascii?Q?rwxjmABdD4mDmYgBme/ostY6c5Gul8TUkslEGOZYkXpwlIY9fADXKSHXX76Z?=
 =?us-ascii?Q?ISmr/26ZId9m7EUzE26ahtjMBFoGvrpo0nIY/VpBoZhh9TVQ66IE1LVN4RiD?=
 =?us-ascii?Q?JC+l7kGPvVO9Z+1HA9hZuqMd1HGAEWXHIgUtdRLMqkQRZRM+ijdpYpwtvSn5?=
 =?us-ascii?Q?IQcNcDprYFzO/plGIjeBvvpJbidZ7Bk+njJuPYSZZxYGvT27/ZQ/c9W8NkJI?=
 =?us-ascii?Q?BJTzYxpzpZ7UC31HO+Mp6Emwt3D6uu1ag8ZdVzrkyMFqgobRkbLr5H1A83WU?=
 =?us-ascii?Q?rLVXvC4Z7zRS1Sz/wg6QfDBul3Jp10NokJGL1yaNihDsApP0fCIUJ8/gE2+P?=
 =?us-ascii?Q?Krb4ONR9Xb1QTe0qH/uEFAm2U5L8CdUZZfGGN2tX2uCOw2Ii/AvtOVrGwXUW?=
 =?us-ascii?Q?L1hrUp2x3pz6z5wkH+Ni4A/VMW5FkRHfO+xGk2X0iQ9KPO8RfJYRq69u9vWc?=
 =?us-ascii?Q?C2UykKvWlZjGUbn0mhn+Zlgkzm9W9MaH74wswsBbeJEOePi7339X2CX/cEiB?=
 =?us-ascii?Q?dPRzp7BuvDF6u02xIojaN8+gpmq1nwEttr6yELGNCA2CRbwB8DgRxPv6pT+F?=
 =?us-ascii?Q?tt2Y7ekEK7NWVPVkNJdU5tSyKLqOjMmCt6eQoXDq/IrMf+Qe/vgi49o6d+tk?=
 =?us-ascii?Q?F+vFb1rMqhWp6Ks2YSOSu4xnDjlVfHNmJpwwexD09NucQLyfysYId4CHJOK7?=
 =?us-ascii?Q?8uqTYifYqUYyvyX78/t8t2dU5zDJ4aELcT6ZgkQVq2e0hI/R7tBv/VPpUaOW?=
 =?us-ascii?Q?fefOh+AyDZCYscL4ZGGb9AA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aedd7f3-f36e-464a-f0da-08d9fa511092
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:27:13.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T47ZXH2S6aaHsPdJih+6i4xSiohRjFUwkV7zlfqEFNMmjxW/B5sZH4j3XSlg4HrjuUB5G/IwadVDa6v19BREjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6460

From: Peng Fan <peng.fan@nxp.com>

Add i.MX lpuart driver and i.MX8QM platform support.
 - lpuart is the uart IP used in i.MX8QM/QXP/93.
 - Very basic i.MX8QM platform support.

Peng Fan (3):
  xen/arm: Add i.MX lpuart driver
  xen/arm: Add i.MX lpuart early printk support
  xen/arm: Add i.MX8QM platform support

 xen/arch/arm/Kconfig.debug              |  21 ++
 xen/arch/arm/arm64/debug-imx-lpuart.inc |  48 ++++
 xen/arch/arm/platforms/Makefile         |   1 +
 xen/arch/arm/platforms/imx8qm.c         |  44 ++++
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/imx-lpuart.c           | 303 ++++++++++++++++++++++++
 xen/include/xen/imx-lpuart.h            |  64 +++++
 8 files changed, 490 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
 create mode 100644 xen/arch/arm/platforms/imx8qm.c
 create mode 100644 xen/drivers/char/imx-lpuart.c
 create mode 100644 xen/include/xen/imx-lpuart.h

-- 
2.30.0


