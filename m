Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47094F71D1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 04:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300221.511928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUa-0004kb-7L; Thu, 07 Apr 2022 02:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300221.511928; Thu, 07 Apr 2022 02:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUa-0004hC-2H; Thu, 07 Apr 2022 02:03:24 +0000
Received: by outflank-mailman (input) for mailman id 300221;
 Thu, 07 Apr 2022 02:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqs0=UR=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncHUX-0004h6-HZ
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 02:03:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e501d563-b616-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 04:03:19 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2437.eurprd04.prod.outlook.com (2603:10a6:4:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 02:03:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 02:03:16 +0000
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
X-Inumbo-ID: e501d563-b616-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcXLPsOLv94e2IW82L1h/Y7RYtcm9tq5eCu+hyxklA+StRobFfiVnIXrrYDjXbNtE9srGtM/2qQ5Kn1lh5iwoe37GTefdPUA6QrgeYbMD+OrdN63+uih8OhK9ZQqkuyY0hqLPpLD9X6POQsF+AJYyCaM8XXdjpP9vkOrLqcZDKtAlKJ0d57ilkWmF9an6UdAAurTIQ9jeO7VdOALUelLjZ72b9vJFGg4plCj/x0VfSK5AKClJ1aiTnniXXiC8ZnnDDCP+1OazSrv+UuMkof6U+x1L9sesk63Vd8+a8ErAWi012RLUnd+XWegnHbVaDsI0NdOrsc7AwxTlXzSsAfdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMtO8m5P0hklnRQ8pvPMxCuv6RmFAE2YYFGpQFQtUYs=;
 b=fKBCh8Fi5ZzQdwuLJ8s0n/fzlEaStCEKYCUl/s7lHkpe1OV7pLI9nNzA/YoKJCbiIwBZzFtZxuFPgWQc9YVGEAwTwIOxngyUQ0Rewc1LpZI8EJ7s1P3fGPeZj8MwugXU5SVxBQ7V8qTXiUWlOVCTAQTconf2IHCwKH8Lx3wlEheICC7RBralaR5SIcpO5dvwBztkdrK2kfyRhyqh7CtXQvfCYOkoLlsEGToVRB6WYTE4ukvJGmqtaJ2ttjZpyCiDb++zkK6VLAdpH8c50H56YHaoxj5LCOEhFPUVrka8MGog25AlYY96RGWJRVrqJ53240y+KH0LfpgMPUiaG47ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMtO8m5P0hklnRQ8pvPMxCuv6RmFAE2YYFGpQFQtUYs=;
 b=IIIw6rIiebzH0mgayg0w8CONDgAU4one8PF5LvTpnMdrZZWBNv0H/vILoCo4BRFVhryIhJZgJjxl0ZOVbKVnWfCdvgIR5OuyOyiUQpw74fyjSZ8D92VrzgQfPKTIvkH7+/oD2v8trxpHWDOMPb8Dlf8Jw/NcgwACjNs9odoEEkM=
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
	michal.orzel@arm.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Thu,  7 Apr 2022 10:44:16 +0800
Message-Id: <20220407024418.9827-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c55ea0a4-a54e-4a2b-068f-08da183ac780
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2437:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2437D5C90B112B8625C289BDC9E69@DB6PR0401MB2437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PMAgaPjde+Gv6UpMQWGvgYRLHM1+KQYL5TFsKY7PStVxb0vBLMNSkiu9Gl9cE59bE3+NhwH6g6Vz6sWIIgeJsDaV9N1FSe4Dgp5eljC6Ksx0luFijoCLhN5bCVt9NceYwcP5T7pCh1P8AX5pLVHGU8rOxquzRAe0BOGiwalnRXUh0a0qjJTGydtkEwg2Njpr9vy+yXikuLQiwJoVNINbhSM/aZXAr3biUC2GIqi/Ctay4sj5DCyaLEbKSNAt9n90TvCH35Y8TpP4Gp6XbP6m8YhvJYSvjX1kbMmvOnT4jpliDCu/idH6Mwx5OZNELefe+tHj/+WuH1U0MB2toGnGX4pbvNBTll/QvmBPurCG4LT2/NbH9mhllh+1NSQXCXhHlfGOoCpVjoDRNRAqrUg8xpAED49nIdM89rCzoeRVWO3Mzz8k4oYAK9VrofSoQm9YB06eSywC9TWgjTX7Zo4icYFJxn6uuavq9+JXfQKSclVFlGa5W4mYlhYNM4zFOxQVVVJonwWlX8mVrJd/Ag14O+mU9VqjvlLOkmxB55pfQo2U+ZrhQB/zxUuo7EJ0E2SuU+T7XyPiuCgykk5IgWJSYEQz//CAKFH2YhLVAvsY5Z+Os62RtpI24etbSMVowmX0s3aTVeLN4pA+ChtB/4UsUe8fOiMCea3NHcU+iI1rUEEkFPNCxSlvNTDVz7lPZafz6dua2Xd9Rj6Gj0Hlurb5Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(52116002)(6506007)(8676002)(4326008)(7416002)(6486002)(2616005)(1076003)(66476007)(316002)(508600001)(5660300002)(66556008)(66946007)(8936002)(38350700002)(38100700002)(6512007)(2906002)(86362001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T52KuZUsbbm8znE4JdzsByLxbBwGVg2rG4visaipTnKn8chCJb+OvVKqgRNn?=
 =?us-ascii?Q?oFL7JMOCv4aqXhjIzvhA4/gM1OHq3r7/TyTjtygvcZaqS+NSY/EQ56mEurDI?=
 =?us-ascii?Q?qUPoFR9MozC3i3+3eS+RT63UrLt2wgmdzU43mB69sjtnACTstw3jFXPnXtsi?=
 =?us-ascii?Q?7ujzX3HxxQRNSv8pgCCRpOUlDOQIZ8nbWyUlm/hO+8PwNd05rpZT8JPOZIqV?=
 =?us-ascii?Q?2e1cbEYxgi+yPsdXZQIgszG7r5Dz6p9reAJz7a5+g4s+GZ+WMAG3iA7hYcBO?=
 =?us-ascii?Q?2t8ThE65icSwm22pSeg9Q5aWlOjClaP3DNp9yjEb9dQbvY/4C9eiKrMIVzg5?=
 =?us-ascii?Q?sqW0UfkQ57ymgr5dm1igaF6qg+6vpSBamVbB5wfokH/lsbPzpgqihR+jIqyV?=
 =?us-ascii?Q?/EZTGbuU+bq8LR0ncSmzcBuBQ1s1b+4WDWmKlB99hNvLKGlAC75qxgWKqrrs?=
 =?us-ascii?Q?xsRKfS5m85S507M9qQtnBBdD6WoUm0tARboAIqOFuQDg8keOQRrzTp5velJT?=
 =?us-ascii?Q?NW/6g4G/R6oZFNJ6XNIquYMWAjFbRBDWCzpEh6fDHsrRBGLFPge3ICl4oiSO?=
 =?us-ascii?Q?GwCOpgaAhxS76KQf7KNfsZkNNeCZ9LdDTJ5/onPC/3N80YOj/bf1ImHnl6vP?=
 =?us-ascii?Q?xJzniuiDaepjGUqp5U7LhZWaIdnKd3rhD+/Fw0qVzMJQGK79u2sXNGzveLbA?=
 =?us-ascii?Q?VgSsZZWnp5jb+9acWNnA4+1tfeD8xYN8bxe0MxQUmuH7uSmCLTae3cUXI/F1?=
 =?us-ascii?Q?cRwilg3tp3PDAJin1K4FCSDNxr1reay2LiGwX9qG+AMDA8yvGjbEUl47V7uu?=
 =?us-ascii?Q?5fuY3kSlO6jf4CHTm3n4H300VXraSdGRfpL+OCKvcbGKGHFR5uQ3lyQrDbVJ?=
 =?us-ascii?Q?XGGjtofQGMbyeF8d5+nhzrnhkh8TiD36JeWkOLuAVL0I1jfkC1zbAxUJoUts?=
 =?us-ascii?Q?qVOqJ+Ff1QioJbuVRjaMHlOhrXGGRBtVPDUSxHYcKZCxVZklkMjYWltaLqbh?=
 =?us-ascii?Q?shdcTcQU6/USWPb52ZxiQ0ZpmQzy9OyfMmV4N5+YaaV2tTl2UskvqLWvdMoe?=
 =?us-ascii?Q?3qZhsDEu16KuHO6jBhBNf+s8EJdhk4yE6uTdqWWI+VOBYIbdJDDxAsunct0u?=
 =?us-ascii?Q?yQP+L9HRl3KGi1/eN0iEw83eBD7ZrpljUHq9sqw6UAQEZ/GUj95W1o6V6S/f?=
 =?us-ascii?Q?SsfgxIrkGJDhc8FoGUiICkcTSl4ftEKOX71jjVKEv5dtCSfUQcAqdNh6nsU6?=
 =?us-ascii?Q?RzrKj9HQ+HpKH3+t7ExGBACcc55rkJBZvU9JqZEl9La6Edfp+u+MnwDcfa0k?=
 =?us-ascii?Q?t+vz2gLapcnVC8dUgD+hxMdt8U01Ya8SKMnLZ09bP8ZHZsS0Pwaya75S4MK6?=
 =?us-ascii?Q?v+zT6EiFdwGrpEViDLYMYjN7aPE3gUsLlv2h694XdisFW+/4jwuT7ab5UhzX?=
 =?us-ascii?Q?iJI4D8hJUvFLSTkzEKchoiNyNJDvg84z6CLQ1go84VzOO2YUB120riyDaKJa?=
 =?us-ascii?Q?D6eh9kjz2296QA2Iw05XfeSVMUlL4u0n498TkspVwbfNubAPi5S54V69ugFc?=
 =?us-ascii?Q?cb1LPUfc6OuxmpRWL/RtkRhVxggJ2S0hG7Izojn5elXPpfF4GZ26yTQKl2N6?=
 =?us-ascii?Q?eHUIh+xWSLEAJGaHJgbbjSefhxY8DsXlFIPZRaIrjbV6HQhIX4ThwlDQcZTf?=
 =?us-ascii?Q?Xx4JEuXdrZahRSYpqCw5YZM92EvfFcHinzSCRcqn29n9SgCkPjt1Ohq2whzY?=
 =?us-ascii?Q?mjuNB7ovog=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55ea0a4-a54e-4a2b-068f-08da183ac780
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 02:03:16.4008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAy3ChpNy7UcOS+A2vcITLAkWniHMApW7ODDgo8Tm8419w137sZKq4qzXQIjJc0TH4dX+z9zDXv2/mGCwHhHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2437

From: Peng Fan <peng.fan@nxp.com>

V3:
 Addressed Michal's comments.
 Add Henry's T-b

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
 xen/arch/arm/include/asm/imx-lpuart.h   |  64 ++++++
 xen/drivers/char/Kconfig                |   7 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/imx-lpuart.c           | 276 ++++++++++++++++++++++++
 6 files changed, 414 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
 create mode 100644 xen/drivers/char/imx-lpuart.c

-- 
2.35.1


