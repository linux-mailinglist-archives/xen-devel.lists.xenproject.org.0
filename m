Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D34F96A6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 15:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301576.514743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofA-0006vu-VF; Fri, 08 Apr 2022 13:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301576.514743; Fri, 08 Apr 2022 13:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofA-0006se-SC; Fri, 08 Apr 2022 13:28:32 +0000
Received: by outflank-mailman (input) for mailman id 301576;
 Fri, 08 Apr 2022 13:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SA5n=US=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncof9-0006sY-3E
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 13:28:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6db23df-b73f-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 15:28:29 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 13:28:26 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 13:28:25 +0000
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
X-Inumbo-ID: c6db23df-b73f-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey3UXQUWn+D59xWuPlAthpB9zY+zMTYoDhXvDiY4q8tIIarN8aowGy5DqAz2EUjhovxYiUhRM+xKTga6YpudDuTBSdtCoYfU8K7Rj7IlOkzNQKQZjqmxlxU/zgdF87oCAcFwhvqlsU8zJKPDEvVEzBPxLlEkM2d74axGi4JQ02AMK+c0lbQhIUvbthfLPWx8HcCwuMMidJF0S003teAadWOdtxQ0yhl7b38Ay7RmCvdPFe8akqbw9dGN4nL+LOojLkayg42scDhOHOaSzs8hdQou1YQ0lCXJKuALcW1sw8hEXAlPBf8n7hqzk2MR5kHMso+M97BDLeAd+Px19NrcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj4aoEwaCJpMNFh0cDJdxM3bLEEMVtTQDia5GLR+WRc=;
 b=FIBKKl0nqzHoi4+5ClCfQnz/7lGR9a9Xyoqbgn8IzLb3Y74AiLXZem3S5Pd85iVnsivRU5gQmMjNbSjm+U1DVuTY/YNEqG2Bioa/Y2p4o6JxX23aWiSDF7QpPM9HuanGUw1XMFaq0+PIK/Xv4CmRwDKgMoy4YHutSqzkZMFjzmXN9RAEGcW732xoYujmWHLgc3h9RMTwKieOyv2ae7LP6Ba0bNYqbp5WTWIBB9vkG7KDARxjFMiM2fB3DOyQF+aIOw3ZOgLKI0w7BGszuLvn7VE2+1h+y9nukNhmLCS1QCZFkV8pdpPAa40E0OBBHbGaqd5XXVyJpjT1QVWKBMUybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj4aoEwaCJpMNFh0cDJdxM3bLEEMVtTQDia5GLR+WRc=;
 b=EJwqqa+s9xUTY6WRTgXsqxC3Tm/duGwzz51P7UIRvjPzvU9kpk626dW4kERzykhd/Sgdh1fh394ntlUYv5YNoUJIWfW0d9eKJRGaVguagpFtFaInpRpKinaSfYK7+pdVlqt+NQk6IqWIc7BpxIrE69RlrVpba9pbmiWTtCaZnFs=
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
Subject: [PATCH V4 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Fri,  8 Apr 2022 22:09:30 +0800
Message-Id: <20220408140932.17968-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbacc201-50d0-4d8a-f36a-08da1963a8da
X-MS-TrafficTypeDiagnostic: AM7PR04MB6949:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6949AA3D8615CB0FC4A87589C9E99@AM7PR04MB6949.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5zMmRsbSu9odXkXk7u2uamK/2ZvbmnPsEqR9D2EjMKRo36UHnX9Ts4U6HCFaAOT2k/3JeN9SdSxGUF0hNhPoPqtJ+U3ZwnLMhizpSB9c2IlJpOI8A1J31bTOKY5AK3QZBXENN/gun9GbARFYqComd4XWW5t/SvlskIz0pmAPRDwFFd5+gckx8OCcyDsspj7goI95lVS0Qg4npnGk8B1L5TNKxNZt1UVHNYiZy2PbLX2uUYh6dFqNX8rjRxhMSQ4T36mn0eGPX+8ptaq7whX7+Na19/Lmi8Y0CchLsGoOchU7KetR8HUBH+WiYEXLdoHlGYRPA96CPdJTaaBV2AmHqpX7mv+B81esmBtgc/Mp2BlZZSFcbMO5Fg7AILqwa8z4EsfBKKBbQ3hRHJYCNf3n66Dvk0+1qFWk/r+fD6lXnD46S/ch8cAwBKoDKM8Z7CWRDtWsfLSnWpgSWqdsgcIDWH2nJliyQcdNhLbA/xj03CjivgZPaMoc9cWI/57tQqbAMRooe991RK735mKqDChHW3AZzJ+/OlMZBNLfsQCGNG7thWmWsLUuBb1ANRV/G/V910HV444GV23CKBd83EnEL4Z6usZpVfCyvCXtzS1nGBmcpO9E8sc1bjr+9N4SDMBAuUzI80XqbpSgEQBg/D2n2JALAfxWCKwofNNJG51+KlczkP+8lvDA8AnzW6DOa5ofPIOyEv3bX65BlTUeu+efZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6512007)(8676002)(52116002)(6666004)(6506007)(4326008)(508600001)(2906002)(5660300002)(86362001)(7416002)(38100700002)(2616005)(186003)(26005)(38350700002)(1076003)(66556008)(316002)(66946007)(66476007)(8936002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PylUa2CeE9vavL/F56KajXbz5oRh2CpkTAtek0Y6c26NrxY3zjYPcUA6X+52?=
 =?us-ascii?Q?Zazo10S109SJi23jmJK4waP3NoXFRzK5s4WrtWeMmPGbX44THqoWyXHARmrc?=
 =?us-ascii?Q?na7jOTeadOZWqs3FfkWprU12q/vZQGX0f7Bi5NKH1F3s3AGXpnMEP5xixoAX?=
 =?us-ascii?Q?95fE7ftX60sV1sRqdQ6Aie374/n6UkWGmDvkcVYJE3ELgfKIXi38J9G+2NGw?=
 =?us-ascii?Q?4fOfxZiRpew3uSvIRcLJ6qti7iZbjDH0uqj2zJgeAt1pFMNo7ZuLRpIwVXVn?=
 =?us-ascii?Q?Qkj9NC/A9EUuw0Mtd3c0Ofh6Y2M4O2rqKCR7OnTpEKP4yy+lUq4gh6qYeb/g?=
 =?us-ascii?Q?KibP+LnH6w+x9sdMZsca7iWEGKzDmqHcpwGRKRyoTaoZmZseYEWU+nq8gqOn?=
 =?us-ascii?Q?M+9GyBJmUZ2ZfPYebnax0JnbaSgxvWlxykbrB/ZLy8TrUz5FEdxc36MKBasY?=
 =?us-ascii?Q?nRLpmd56EwxlQXb3Jq8C9E+a/qgzH0RdYmT4DUbGSpmmzknQYXy/z8r+ugkf?=
 =?us-ascii?Q?LcMjm9oOf5p7bL7d2IxvhkX6+k7+4kuXJd8nwroAxzPq9T/Zd2DGRjLBtQlu?=
 =?us-ascii?Q?Iys6l+xglJXy9idDwfA3cLvmtLvCUoO7hQ4aTLkuEhVRPZzWvCxU0WW5yFqR?=
 =?us-ascii?Q?DZLnuh52rMVZgslbmEQTHvhabTEyfgrE5wdIsthkRfOkJoAPyUf7pMWTEmEq?=
 =?us-ascii?Q?LP5mxzr+qN+r+esRF2Il/4Q0Tzl3zDzcV4a7k2mW2APrA/Jg8vY9vqfvIci2?=
 =?us-ascii?Q?8htiZxkfT3GVNVKvO4ZHTWrMnWV2o1qvhj50kcG06Ge2PObWJ7ZNdsNXOL5t?=
 =?us-ascii?Q?isJVyeNPIemX8NNw//eITnEoYtZ9lg7H4ZQJyfceEqW3hfnSvy/u1Vwc5O3y?=
 =?us-ascii?Q?sjCoPBc28Yn0avRVGKI3lOqd4xeDABG89yFXHXo2oQ3B5qYeW/noWPwwOprJ?=
 =?us-ascii?Q?CwPL4wp/T+eBIedZ11qzEE+NMjjPx3JsK/5pue7bRQ0wq1QE4pMPO7HOLnDC?=
 =?us-ascii?Q?7yvdO2AHIGicjfTgcV37Svdlee24LVrW2qTiJvf/wuAx74t2EkSgS7izai/5?=
 =?us-ascii?Q?oSsMMUNPFlSXwE9XBDQY02D3j7oyA8QEjuAEDEoGs4QfvJgs1qDI//d8sv/U?=
 =?us-ascii?Q?AGX/gdip+OsveiXev4Yvf0eLOS88W7P0t1HfNCTgeu71jetv3fd3HAogtdZv?=
 =?us-ascii?Q?XeFNdDBp5x7CfclyIvBwbphEaS9h6Ml5rIjPxWM7QFBfQsMFuar0fFF2P7Po?=
 =?us-ascii?Q?IRyEXQOG+YiY9bv63I58zDXQtsvED+lvMHi5aMU2PZ6w0ZN7GaiAS6aYH8gZ?=
 =?us-ascii?Q?wbkjn1iHiMRGGgKzHYmYk7lKM719M2FoWe/m/bHHfHXp5HX+5B3kFkhFLu3j?=
 =?us-ascii?Q?j10qgSaUTcSEsitjKoZiA/Lf5ea2z7jJhWnlE/MfKVQzyCM/hpMMWXvQ7jkB?=
 =?us-ascii?Q?jnQctihm1uiXYsL3EibFlKS/f2z1nrmOW2iPNcN9Mvbp+FIV3L4KMoR4tFy7?=
 =?us-ascii?Q?b/FIzDHNfbE3v58+YqByRFbgXACu5zWMU0vLpewjbKVgFHRZrSfLmQsfQmv0?=
 =?us-ascii?Q?PdFQIjpKrTYA2GFtFrCiDXmA24TlWgYUM/QrJwmnv+MMqlqCKHPIJq6GlL0i?=
 =?us-ascii?Q?lHlyixY0miFXiRrp1Fmc4w13ykAjnVnsFHjY2hYbhmdt7Q30PPnb1KQgrGEK?=
 =?us-ascii?Q?uT7gFsaxx5gVpNcxLwmNih1VoASXw2YI9B0LHi+jLo5jEcs5hI9qm6PxQv3/?=
 =?us-ascii?Q?jN5Bp767yg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbacc201-50d0-4d8a-f36a-08da1963a8da
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 13:28:25.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/cyXppO0EuvAZvX9SANDicZ1Y6UQdbKv/BF9yKu6p5GekrUoC5ytQaHwIBGgghdqr9neXnGMCme+rj9M/J2yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

From: Peng Fan <peng.fan@nxp.com>

V4:
 Wrong v3 version, some BIT definition are mixed in patch 1,2. 

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


