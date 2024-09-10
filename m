Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B79739F9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795659.1205073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1wz-0005cB-EK; Tue, 10 Sep 2024 14:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795659.1205073; Tue, 10 Sep 2024 14:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1wz-0005Zi-AG; Tue, 10 Sep 2024 14:34:37 +0000
Received: by outflank-mailman (input) for mailman id 795659;
 Tue, 10 Sep 2024 14:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1wy-0005Zc-K5
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:36 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd166c2f-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:35 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:32 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:31 +0000
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
X-Inumbo-ID: cd166c2f-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6gWmAfZ5ZkiB3S/WTdBQv9n6jf7y12HG0/DfjRgWXrLbTuOP0bU9KAcJfUaTAhgqImlPR3pzkUp3br1ZSleuIKVXqs1u8hGuydePoziTB2RGi4XdvySxobC0vdZff0OKbzJeAEpsft2kjjTiCtN+8tYN7xSmedH7us7DKSbTxHlPf+sh8xpeXAqK/qXxAOunUk8i7D7jNg9HtpfjdOTJd00gtecX+MUQ7+t7QqVSjjHEAUqEguRXM5tU1Lj7D3Axh7M7j4j38fi5bd2d/aBfNqyjkis6XA97g+CSW5bWcGF+lvrSdQrmwIQeLn1VXCQ5LX7qGx2mnHMNsbOKo0R6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKxifwFavsRjdRLWnNccc3YUbxUKZXbR9Xq+y4urWPk=;
 b=O9C6SelCNghianH55vl1n+pM2kQ+gbU8yfQhiiVYFa93aYBU6RLCLgR0sWsjigCwxHjPqBmknWYQM2++AxZgLDFQ/seLseBRD7z5LNsAbvoKMPQcLQ10LaYhMRDkv21bjFXehncBxRK4MrlY+ieIYPjtOOfmWSLQtBPeN5/hfo1GUFr/ohe+LkNhaNc9j4o9yJut1/GQ48FevTQH/oncGPUTwlO38NSaa0sBceNzvdN9VsEEybpd9sYjowpL04zF27lVXFg8eLlYgc4v+A+vZLPCjLz+qMcNwOH5EBPYmPInwxLMaJlfevGA8RnqYhrwc3NKKWEq2uelp853POzJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKxifwFavsRjdRLWnNccc3YUbxUKZXbR9Xq+y4urWPk=;
 b=EO+Itu6ggRagOPWe/K/YOXOwqbtN6o34pLaeovCeuJrujDftIs4Scz4yw/JDdMbIuCUwziDELsc7LVP1pwuaX1CP0ZyiblmypuMjz9jmrg4z3b7OozGOeBJ0uPaS7XK9prPNWl7PL1139dRIF2It4w4h53ksz+re7Y/JUwnuo0CtNSDshrzk6lbmPsaSwwIxb/69nTglEUgnbSkY1ycVYSPNFG31eBvhpd+Zli17XIsGaS/VtLvUxoz8Unwc17pI9ShEv0Vree0nqg+3U6JlM9sknic+EwAiZRQsw7Cjmia9AJuYWF4uVvNDYftzFEsVIfOCNA87BG7Bk2Sazpid+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1 0/5] xen/arm: Add support for S32CC platforms and LINFlexD UART
Date: Tue, 10 Sep 2024 17:34:06 +0300
Message-ID: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cd04ef-c02b-4ef5-6273-08dcd1a5af02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MOcwxIsUhdqrBL88xNsoCE4zH5DBNoZXZv384DFUFUOebKayOCYadRKLVXw5?=
 =?us-ascii?Q?QwPRIKeI3ZEFOU6g69pq7Z9ewwkhcijhnh1DmBzuVsRzSagusyZQXU/DjiHC?=
 =?us-ascii?Q?dGe+cmG/axPavM/j1vZry+Ib77nR0GKHIfWGriYqcFqS1BQqhZDw5/5X0LlJ?=
 =?us-ascii?Q?FYibC332eplcQBsyX3vrrc/12Z+W5RF8tzirGxbanwv/rC9Z5RQmCq/13wQP?=
 =?us-ascii?Q?2eFC6YgyT7SU4ncK5LKXMOmNtW25dmuNAvpbhjPtoSufe87cmULYnxXDz7si?=
 =?us-ascii?Q?y5eF12xWFwi5dXjrCjogn163iZ++5Wp51Iicg8m3A3b+Y22VgDG0dKSaL3pf?=
 =?us-ascii?Q?9jlin+remunXgXgVssSgVPrB8Vk/d0k7ZwthmWxvAlZxh+e/ZQiH9Xq3u7if?=
 =?us-ascii?Q?ULVpn4Bl9k7mLDlRtpLffffva3hmXwAybeJV5sBdar8QjP1TFVuIrwWGsqRr?=
 =?us-ascii?Q?RbosvjqIbpwbAuMAw+wg1ooXUZp979+jRE27do3m0MKDBYUF13bGCxqrEcqh?=
 =?us-ascii?Q?LbVrOH3PdecCtpy3P7nPFEs53MsJlY5fu1wxgAM2syrewirMmH0lkAKkRD1U?=
 =?us-ascii?Q?Y9Ld0JxAdHhzGtQHnXDICeK/BdNXLVfIuIPqpMWbdvUZDjuCckgphJSYeRPt?=
 =?us-ascii?Q?c7/Q9CKiosNh3KtrPDxryXxKxbg3wYnggx72sx4lICv/c9zw9aXJlZKyKjJy?=
 =?us-ascii?Q?4Vbf5GAtovJkOuSzKSbgc53FVEaRHGmAv+piPVCUGe4C3qnE+WQ2qcr7lmLz?=
 =?us-ascii?Q?bD2Szuw25OIvEL0Ur/KD5ens05hNWWFIL32FrNwh+5J65d5oZ0K+4zYjnuZz?=
 =?us-ascii?Q?CNoXAoZnxY6UsXJd80iuaT+xig6OoEvyCji4OokXdn7AMFIj5opDrVOvhMt6?=
 =?us-ascii?Q?h67g5ZD8ynEencbC26FnvJuou5aXQCucKDTn9qQR91DI6VcWQBZk8xUvX0WS?=
 =?us-ascii?Q?LxUV73ny+l2n0yxl4vZfB5+hiCFVgYwo60N/0MmTfF5Bw5qrdKx/ipzzbz3u?=
 =?us-ascii?Q?nexLtdbS5g46imXkOj/9xxhlvAy5ukBL1LnuPcVEclg7jdVyPg+4DLSKjwtj?=
 =?us-ascii?Q?1kaoGB7RRdGjH0sj2XEXSili2Bp1vkeeZ7XjEehCUtiuxNDsD81fYVXkCeNI?=
 =?us-ascii?Q?IprxS2sIDLCcg555RglWevlE5qOzD8kcVZNO28wxEUrywUw2FzhLvUa1gu56?=
 =?us-ascii?Q?xa6pVEghNT2+xc8iU8g48WoLVm7XHwhJGxeOs1iiFap8eGhivmet4Jx4qtE9?=
 =?us-ascii?Q?F7X/d9zsrQ34fYLFC7uV0xekN9+o6vY0UdIv/bxe9qXodeJunOm/vXszTPc5?=
 =?us-ascii?Q?dDOSxuGVCp0dODcyGkfV4CQsYy2MGAoVWOY/rAcp1MGgE1VMiU8IfwQu8wYT?=
 =?us-ascii?Q?pPuvgEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQ1cHSZInpNH2swaix66lEMQ2nY0Je/ytxLCsqjreE/JmKpdYlWb2Vfw/B4Z?=
 =?us-ascii?Q?iOPq1w3PgQtCCmEajL+5fv47NPO9BdluxJDOzy0h/wqeLi3dhq4PjGMaXZQk?=
 =?us-ascii?Q?ooe1ut0rqPOH5XjaB/d2ZyyGLPu/4JPM5JaAGDEz4PsgJ6OT1f/dNDuDykVO?=
 =?us-ascii?Q?ZRpn2KRqOrBcsD2NRLE0XVBPSU96jMgWCxa7U4DvffkBOHGf61LCNO7oQBQZ?=
 =?us-ascii?Q?8Y7tiptmQIun/ix5cJfd/RFWUHej9UHgjS26NrQe4Gn6lSWH96e4iHrBslpS?=
 =?us-ascii?Q?qNnnrbpywbNaT7eG4OTEDIkXzze5ZlZ0BL3O2vI4a6KVJkpbbZysfv4oKsKC?=
 =?us-ascii?Q?qHWyTm0F6XplS6hOlgdwV7OF++Z+SygvZ7STcgxz2pg571BO0h8m2QJrQtb1?=
 =?us-ascii?Q?r+miLaNfpCPo/LJKWArlEIAN37Ap0sGYpZm3jwZng8IEg54ItJ4UhwGrr3D2?=
 =?us-ascii?Q?QMxneBJ6y17de0j9IccLTMeF5YTeBsxhHwPZUDB3q9XxESbpVzeJ7LtFqNkq?=
 =?us-ascii?Q?G5DPzKeMrZjDOPQ/Kf62itJPkt8U1CSnIhXykfcplEuXDPvilkkaNvsYd8PR?=
 =?us-ascii?Q?lpzoDcivmfGe1L1UCrDI/IBQbAtArGCJNw9YSfgJOoGKMD8LK7HxM8O/EpHn?=
 =?us-ascii?Q?QvtsL77YxrW+6zvrJba+YCcXqsvd0KCNp9OK04KJ+EIInIXvjx8Segk1LHIY?=
 =?us-ascii?Q?FqsSCP+stga+DpP5s33ozU+TtmQ3sflji40YGSw4Zc7NVp8/lysvfykxsWcf?=
 =?us-ascii?Q?SMyxJ2Bi299MZaID3FmFOLI1lzPKa5xfkAmd2fgKQP8y2iO7Jnrc5p4Aoh3v?=
 =?us-ascii?Q?xM5gxlQT+UgGr3YRy5kGcxK6kmjMq3Rl0p+Enevc97NCRbKy6tNsovilL7SJ?=
 =?us-ascii?Q?Hr6M/XMrWcs+ZI0QvHzICWUgOLM4AjeAIYRZGn1bY/UP5VARfvjoAAPlT7LX?=
 =?us-ascii?Q?ldTvJP3qT2qGkVSsbPtsCuyOM8JwFLSZlfnsihNTKw4ALjFNwiASuZn16E6l?=
 =?us-ascii?Q?mZU//TkL8hkSe4rLSu7g6daWelHBVBUFR5RJ8HiFMjwCsr06aAAAzWm2CJVf?=
 =?us-ascii?Q?SbdjaPLqgXauRadCRVuh44iX5mAXrcGKAifnPkZpkS7jTcZOtxO8y5TgmLhU?=
 =?us-ascii?Q?oG0WkNFTe24fbeB8L5mI7v2DjGSAfEjqodMGIMfUfa80okq/jPVNxMXIFRCA?=
 =?us-ascii?Q?R0iRmoeoFzWajs5VVrWekQGcnJp5WJ4qGwgDxBxL/eRpRR637VDihtRYo6Xr?=
 =?us-ascii?Q?nOBELrq345gBLnIak5B1kN4bgxxi4Y+zoEBm+badvKTjdcDKuI4uWSGMZuwe?=
 =?us-ascii?Q?9gO+6WunarlT+3AptT+AGxOnj26rK0Jt8ngnClzbGdKivR5PQB+vRyszlGTU?=
 =?us-ascii?Q?U+WyR9f7B6IOrxsPCF+uCKL9XLj0ON8hFIrKrf+GLSCE0g4YM53decwztm7b?=
 =?us-ascii?Q?+blwhy6c36VL27pIwpQ3mBD6LyE5sS35Fn+eIKcekcYCxEqghZb+V/5DqjlI?=
 =?us-ascii?Q?he++wd2TkBxmdXrbVY+N95X9ToGvZJNpeviF6X5Ndti8Bk+v4KKPDpGAZKwh?=
 =?us-ascii?Q?llLDEJ2TRxLhDn0Vsq1A+8rY2o+65PAK7puLoLTay3a3YSh60EjXDgkwwsl/?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cd04ef-c02b-4ef5-6273-08dcd1a5af02
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:31.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUIWktfH7rJXSlE78CkNtOdeCi/IL0nZXEoXfsjlY78RTvrXOGYIttxlboyO3Ik/R2LuSucYZ9EtpX9agsJpA5HsXxoAVqOIN8puaZVG0xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This patch series adds support for NXP Automotive S32CC platform
family, which includes S32G [0] and S32R [1].

First patch adds the driver for the NXP LINFlexD UART, available
on S32V, S32G and S32R automotive processors. The compatibles in
the driver match the ones in upstream Linux [2]. The second patch
adds early printk support via LINFlexD UART.

The third patch introduces the S32CC platforms and adds the
platform-specific code, which enables forwarding SCMI over SMC
calls to software running at EL3. The fourth patch adds support
for an early printk menuconfig option for S32CC platforms using
the LINFlexD UART.

The fifth patch enables the workaround for ARM Cortex-A53 erratum
1530924, already implemented in Xen for other cores via
ARM64_WORKAROUND_AT_SPECULATE.

[0] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32g-vehicle-network-processors:S32G-PROCESSORS
[1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32r-radar-processing:S32R-FAMILY
[2] https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml#L27

Andrei Cherechesu (5):
  xen/arm: Add NXP LINFlexD UART Driver
  xen/arm: Add NXP LINFlexD UART early printk support
  xen/arm: platforms: Add NXP S32CC platform code
  xen/arm: Enable early printk for S32CC via LINFlexD UART
  xen/arm: Enable workaround for Cortex-A53 erratum #1530924

 docs/misc/arm/silicon-errata.txt        |   1 +
 xen/arch/arm/Kconfig.debug              |  18 ++
 xen/arch/arm/arm64/debug-linflex.inc    |  58 ++++
 xen/arch/arm/cpuerrata.c                |   6 +
 xen/arch/arm/include/asm/linflex-uart.h |  62 ++++
 xen/arch/arm/platforms/Kconfig          |  10 +
 xen/arch/arm/platforms/Makefile         |   1 +
 xen/arch/arm/platforms/s32cc.c          |  84 ++++++
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/linflex-uart.c         | 365 ++++++++++++++++++++++++
 11 files changed, 614 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-linflex.inc
 create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
 create mode 100644 xen/arch/arm/platforms/s32cc.c
 create mode 100644 xen/drivers/char/linflex-uart.c

-- 
2.45.2


