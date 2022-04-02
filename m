Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F674EFEC1
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 07:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297729.507223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtJ-0004xv-De; Sat, 02 Apr 2022 05:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297729.507223; Sat, 02 Apr 2022 05:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtJ-0004vg-AN; Sat, 02 Apr 2022 05:01:37 +0000
Received: by outflank-mailman (input) for mailman id 297729;
 Sat, 02 Apr 2022 05:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWb+=UM=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1naVtH-0004va-Lp
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 05:01:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f71fecfa-b241-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 07:01:33 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8216.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:01:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.019; Sat, 2 Apr 2022
 05:01:29 +0000
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
X-Inumbo-ID: f71fecfa-b241-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBZ2+gimV/Ia5ZdFaaje5vc3O/k9rXlh/5guzwvdfRnJGCLdfb66q4bl720QAn4UDRrHfuUjayontJjEAR5KF4LImQQZHaYdsikcyLrfB07uXfegm4jY6o1r3Us5UGsALCpzohjObtyff4fc76tOTw4IEhOGIhMBh4W1+8lfcE4bexbLHAThM9vCEwMxjSQTUlWrME6itLYale4+7cXiQnSmjh69c9eBeeh57/gEhOi+w6Hth+vpi9eQiyjeZiLnkDykv8XEFUYICX6SpyOth/FhAH+QJQmdnBgPPOkPlHVS/qfH0nGoPYGdOTIBytlzoFjAz5uGSvtvYoN1ea6T3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4sphDOEHNfNIqaIxfIem1SDkzqyrrnlsDDHgWUZYA4=;
 b=LcygTlZyMkvtGVHXQXWx2yIkSHCxgVEE/7RFdcYrxdPJybPGeyNQFq0pi741NJ0NUrpVXMdKEP0uRE7pQFYkVJSGe3n3DaPwR+6WNwCyOwHZUEtmGRPGcw3MXTqVKwYEFXXE07CqMsLuyVNK+oOblS8kMAVS5xJXb0fzICCQRVgypdpTwY/4JyP65CVJ9EAbwy92rQji4e38CHq12BYQrfLWiXyEvha7HyvwwTYhk9vMCaOUmhblOf8itMoTTl5pohA0lx5AMmrdhU6vzVWHD04gA3cUXSWLiVJ6NulPbcxZSlx38JbWjBWWYNybz+lHmVWYgfPZi5WnIjilGhSM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4sphDOEHNfNIqaIxfIem1SDkzqyrrnlsDDHgWUZYA4=;
 b=M8yLRRxYUC+/n8eIf46HiDLPqCfhAskIEplVZC/9Gu37f9xNbxJaORQaKvGziNKc99eh13YZ0zNE+re07UNGL/d3rjyQL2NJ1H16cNEhpVGRApBHuKt0EFavXfBwBN0yOH7qhIG5v2Xg5zJ/N1Nxk3OxRCfni0+K6r2gnQKd1OQ=
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
Subject: [PATCH V2 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Sat,  2 Apr 2022 13:42:21 +0800
Message-Id: <20220402054223.10304-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9090d4ee-b67d-46f2-0a95-08da1465d914
X-MS-TrafficTypeDiagnostic: AS8PR04MB8216:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8216AFE1DE77AF915F99CC66C9E39@AS8PR04MB8216.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fWmB18fO8BpO/2iKNwS6j03AIHdawlqyiv9cZs3LgnN64PGHMS3V+f9zBf3se6gvc2UXXbhM0THIaIZdgUXz9KOuFPhahu7IVRppxhqS+ogr6DchyP8h/J3dMWsdrP2qzn/9gBsbtWajrOhJ+mwCJWIcqm5JQKfiMHji5l1qU8HMkYVQLdnDpSLx1UK8l8+iYFrPvOzJS5TVV0RWImM9Bn4QZTCW+yoJO3WtTx5r8hHwVsLxJNVSZrKQFfU7yv5xyk/alV3etnvzQZWpAg5A5Jlfwq6iYdwAe8lUuCrJ0KH6HeNQvzZpNU+4nxcSGaQYYd9iMArEhrsCj9lSNXoLIvsJTvFB8phIrihv0x7+KYeZJOFsWu5vC2I0or/+6dHdKo49uz5LZZLtVIckWpdFUeOY8ulgFG1MQbHUt/KXHun/+FluDZ/wrNNCpHYtpV3RsCEaElevHctDf0vjEMkNcaEuv4CVj841c9NqtQz4xMIXMw67s87nM53mEzAVLoUNBwlEk1B35wyr+kTNmhsi2cO8473TkPhSbplWr8sE5M9LTWDl17OBVKnc1fY3EdXTM+fhrcsnwg9GKSdPLV35riUwRhPaAsYDNH4bJAa0cXnGO98H3xAIq3wlI8CsUt0tMbjxJRMJLd/03qeWL7VfmSCRHb/73w0iiQTUAKfvl11fCsCqUQ0no8P0TMsVbIXva+gQo0ZBCQ325O8hY7axw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(4326008)(6486002)(508600001)(4744005)(38100700002)(38350700002)(66946007)(8676002)(66476007)(6666004)(66556008)(8936002)(5660300002)(86362001)(316002)(2616005)(1076003)(6512007)(6506007)(186003)(52116002)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YDBIJhulRKzQxrkWMzhL5ukKrCvNCZdTRNR0z4no8ffcvOHODTx8ln7f6OB6?=
 =?us-ascii?Q?UR3x2aYdZXon9fHnN21f92Sq/9V0QoFUPT4UU+YtLDIrkJ7Qhgp2CG/wkzWE?=
 =?us-ascii?Q?TBSd+GOuaEpvvIX3oG53SsT16hrLHkpNsQwfOh29n/VByXz2O296VNTRXwBw?=
 =?us-ascii?Q?yl6R+8g8RmUpzvF0Iy68RsEfa5Qy92LPIV7EEsHTB2K+O4NBGwplZSd8gVO0?=
 =?us-ascii?Q?U0H/lxCS2rolAut0c8WJglQbyuTxJ6k82EFtwSIGrmjnC8ysuTR8Pcf3iOlt?=
 =?us-ascii?Q?WoBo+qjLRmc9/tHEMVl6NPzFoXO6hgPHnrpIyeVOaVrJunjdkBZQdc+1seCh?=
 =?us-ascii?Q?e16MYaLi1nWCDakMQfnKqEq8au1hM9xeQ7U0/9SlHhnKyTGroSAUefBKeZWQ?=
 =?us-ascii?Q?TWvU0JKbf/i/FL47ITXBGnAEB9X0JIjyeZ6xv2+wsUiYZGzHFGBorgBYNpGR?=
 =?us-ascii?Q?sXpY3X4U1sJmgHQHltVi206xke06npvoaAUKhmARnQsLrtBbnMbNAtw8PrUd?=
 =?us-ascii?Q?qP230ck0aeSvp9D7EUwb1x2fmgvZ6eST5V6Sy7IhBxMaV0ngJNpXm9/OozLU?=
 =?us-ascii?Q?c5dTLpoLyEVpwh7WNjrC+CwrIpHQy+re3aY/FHrFECFIY7VxrjecfEibWooE?=
 =?us-ascii?Q?fBALjjLzgDxq8A3F720gsQHxc6zz183C55SxVqvEvH3IWCtuEB9zJ/KqqQTn?=
 =?us-ascii?Q?uDOlo0y9WXtvM8yQ0DGUYSjrfp/gqz1F5y6z1/m7E6V8X2OFeeGTNFftmoYS?=
 =?us-ascii?Q?J6Q1T3ufHm/EU2EMYe75uiOHSN9shKFk4M5kkVeuhp7KI2r/OImRxFlGTXfj?=
 =?us-ascii?Q?4UlKRsqn7rLlwW8is49L73gmA3RFBbrAbX9MibhOvmZ99DVnu39Emh/D6Uvu?=
 =?us-ascii?Q?8u5iee13Zl9CrPPHbxWltGp1sqaKN8MJUE1lHah6lyNJJpwYEVQJ4Yc6qrFS?=
 =?us-ascii?Q?C7JE0G+qkwYuHCv72VUurP9TrzhLEa7kbdI9Nl8mrDZslpCf+DE4Y1uGch4B?=
 =?us-ascii?Q?Zndgpo4ZedbxOPucXx9w0zvm0Kk4kL5QysGBisDrMmpvYNpnmzzLRcOa8A8B?=
 =?us-ascii?Q?kGRI/kqqAS6i5OLmbFE2ZOuRqPNgSL9zz+gsEuAjFW3wXBJDky0Nz9tMS4Kb?=
 =?us-ascii?Q?scDEio02bcAG/51L6KDACx9QH2invMAMNz+cgH3z4vBmrp7r1R6CODI+2T5P?=
 =?us-ascii?Q?2zYQZvEeZ8mFyRkojvLBihn1c49R+C7gp2YozcxxYinQmgcVb9fZFsxGsIuQ?=
 =?us-ascii?Q?peF9mpp5RF2TT5mG6AewutLI8dscJddqhe+ErdP5cj9hZwsAJgBu1+x83h0r?=
 =?us-ascii?Q?OwWEYWCik8CTKVdWJoClCGuPQ9McOtI0XikUi+l7aWQ5bqq97/jQ84dD2xTK?=
 =?us-ascii?Q?UnnrNKYppRNvehEe+9RtTQNXwGmaNa1UH9y7fSAjUSSyUPii55GU86VOaA8g?=
 =?us-ascii?Q?fB4SsinyWxA0mhhjLmPJmlse5ihZTvNR0sth4Zpog/MOQtn4UJogGBOU0PAI?=
 =?us-ascii?Q?4P7jS85gTSUQsHm1GsJpXfdWIUUij6wD53DR6gzxOGRQKb0agRlf2MmESvbL?=
 =?us-ascii?Q?7YYJPMaaSRYldcIplOJbZa6Gm9l4HyHEBb1v8vWJUOntEDkiFSuYAzDVtSpb?=
 =?us-ascii?Q?W0XpzV4sweLtKOv6AOcilgQv9G6CQNsMQBGHd4OsWa+Wu0Z07ih6StwSkQZs?=
 =?us-ascii?Q?JDhxLAMMTYhbUUZjMTe79Tv8DU7q1a1WCUcuQyG3dOJV2/rxGuh08Wu8oYE0?=
 =?us-ascii?Q?fvAxflrPAw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090d4ee-b67d-46f2-0a95-08da1465d914
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:01:29.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLZqgD75ECSGvYuhnLaWaO7IjFiR5jMy/OHeCe4AIvhqUVo7PbhJSaODcZeb1pVbI+hqDYucuXeyo2gaCZOq0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8216

From: Peng Fan <peng.fan@nxp.com>

V2:
 Per Julien's comments, fix coding style issue, drop unneeded code

Add i.MX lpuart driver and i.MX8QM platform support.
 - lpuart is the uart IP used in i.MX8QM/QXP/93.
 - Very basic i.MX8QM platform support.

Peng Fan (2):
  xen/arm: Add i.MX lpuart driver
  xen/arm: Add i.MX lpuart early printk support

 xen/arch/arm/Kconfig.debug              |  14 ++
 xen/arch/arm/arm64/debug-imx-lpuart.inc |  52 +++++
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/imx-lpuart.c           | 275 ++++++++++++++++++++++++
 xen/include/xen/imx-lpuart.h            |  64 ++++++
 6 files changed, 414 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
 create mode 100644 xen/drivers/char/imx-lpuart.c
 create mode 100644 xen/include/xen/imx-lpuart.h

-- 
2.35.1


