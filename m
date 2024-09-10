Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED19739F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795660.1205084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x0-0005r8-Qd; Tue, 10 Sep 2024 14:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795660.1205084; Tue, 10 Sep 2024 14:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x0-0005o6-Mo; Tue, 10 Sep 2024 14:34:38 +0000
Received: by outflank-mailman (input) for mailman id 795660;
 Tue, 10 Sep 2024 14:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1wz-0005Zc-9E
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:37 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd9e417e-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:36 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:33 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:33 +0000
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
X-Inumbo-ID: cd9e417e-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnVi7kpxBAKNPND15HZnbiOxquyimq+fe4sBiqgd6WPMCqV32j0RYLfhekdT3uzIfXwVbYPu6Oz1xT7I8GIQT2mbQSPU8MZIcaHF9WbKAPelMm3Crtdrkd1do1fjwCtliJEce3DTwXIpYAJ4mZSSRx+T5b52c8m9UNyckja6R/UnJRTUPiScnazbX5WYxFdtyn12ycTUNXehe5aRw5eh6QIkcSnXaL21hqx37IGbG+iZ+8A892VX9S4CD3PXu5X8D7YD2McTcA7fNykQw5keirjbnUNtNBN99QJxtEb5Y5KLN8cv6IyTVlXyjxoZ15Ffd9O5l3OLMsAkPr2nHy4Kcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5eQuW950cPNkYt2yPpXs5kb5B8fWwDZsKI3Z8Ff/MU=;
 b=JpBBEeevD5Z308SxqWF01ahOtWE2NgdALnyxIo0oKEVY5clTTKxNF9cMNlSwXemJV9axrD8hMclftGe87qL0yzfd3KGpgvVXc+utJ+h4Lo233nVIjrKWsOTgv3mvn7nKDNS6eOAMePyOxoysVgUa3onrxEdyxfaNqMm4LA7FPMYd0gC8NyTku/4wRL7SQL2pwzGQEPIPps9Z42Wx1zlZPGofrTRJTMwvrbpE0SnLVYyR2ic9bnn6bfR5ygRCDgzhBl6SdtF4fYu4CLwyI7a+NTvdV8fT7Krpkz4t2txLRs8iP63A+INdvI4bts/aYm9zJzHNh2U5O6Nn573FZajXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5eQuW950cPNkYt2yPpXs5kb5B8fWwDZsKI3Z8Ff/MU=;
 b=E9OX7PuOSj2RUJKnYIa3WMsypKN051JkHNN4MjMImIVTSZ3vX/I7geRt1Jxk72sLaxGeNZHK/wuo4J1GmGt6slv9Et4UAXHX7U/nvz5D5m0k1IkPrehfwCfbr02vDhMEGNVs+M0DbFm/ZU9pq7haUU977oBWUMfPRrEOICUuytQ2U7Yfh87oe+yN9bRwGXO4nCc2xWArasdy6Pi4LffglahTU5HaCQfw9vAENvbiAWrw4VYXInr610vI/oXI+YRJyYaw1YYaFnsBQb1G6xj6kHw7HvjS1l+aHQknRoeOFobEmImCVo4s/tT1r72heBWt+aw77iDc9JNbHk0H8uzatQ==
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
Subject: [PATCH v1 1/5] xen/arm: Add NXP LINFlexD UART Driver
Date: Tue, 10 Sep 2024 17:34:07 +0300
Message-ID: <20240910143411.178704-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: c1152014-a353-4ce6-6f1b-08dcd1a5b011
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0256TDS8ethuCk3SpCeMbRJThXGQdVXou4U0Jlx0dSUdfJFXoSVFVtiO8Hm?=
 =?us-ascii?Q?UvCi2tQMx2vMSmwlNqLgmwus/btd0d16e91wzpvi29u7wtnPQOrDvm8xzHdG?=
 =?us-ascii?Q?m0EL5xLRRm91/Gy0OsOc5xSCd1JQkQ6LIBzUYR7gxA0pF6eUj5of1BDkk24i?=
 =?us-ascii?Q?Q3k1UR1gKqXOMASAnYW4QMbA45h2avuCsmZOPg3g29oqbwQI/Z0t1rDzKYS1?=
 =?us-ascii?Q?WEkonp2fGnoeGvtEGD/XUQz/XWpPy52+rNb0lwojj1DkMtHHCOA5aOCnJtbB?=
 =?us-ascii?Q?9JQ9vyiMwRctunE1TGxZ7La902NoHCb6OMmC7Ydwn262wie32zcTzIBZ4o/z?=
 =?us-ascii?Q?gg/hNo5gDt7WsXimJNNkGpkrE0t6f4+QRqRvdwD2aumwti+K6H/LtpH+8xF/?=
 =?us-ascii?Q?sQPW4ppTGa+nxIftLICv8Hr5WrG0NT9IwCIn3PpDpC2f7YBueRreRJHJo+bX?=
 =?us-ascii?Q?03AOXNZCePcDTdB7lBbMj2YZxzP5YnZx8ca/Z/RC4h5bSmN0gwqmTStbMtpb?=
 =?us-ascii?Q?NXAoO3OWKFDK95l65KVekNceQ2pACVyRqOKBDxVznJXWk3OsLQbfCAt0QZn7?=
 =?us-ascii?Q?5Yac0K4QnQ2eNpSsqaOhOcDBeAjpYsJgE9x6R3+HkDqa75wPfi2iTrrz4WZW?=
 =?us-ascii?Q?4M+HTTO8/Sh1a+kzksArj4DTkxoeX/2gb6tF1bQP2dpZxyY7c341zBK6u8cP?=
 =?us-ascii?Q?MlZPM8hyVwdad1fIl7LqHfVK5bgTLIZrCEdaXUxCPiLXiozbdR12yro6F/p1?=
 =?us-ascii?Q?d3SMpEm17eTA7OePx7fgbuLHEZw1anCJ0kmLhGPqmIS/XKfM2SQGEIXzUbAD?=
 =?us-ascii?Q?oThlSIfnlwIMs17G2X4Q23ORYVIQ0OBR/OKGccrv4BRSz3Te6iqHC5hBm3JC?=
 =?us-ascii?Q?Nh3f39en+C+18UqTpnZ/zf4rhLKj+beVQNe4EWuOgQScwGR1nNj2aw3PBONp?=
 =?us-ascii?Q?/EouG3xOa3dYRo+MR7rQnAZEUIFtktWZz//X1kqp1bf3UIGBEHxKNTzp/msl?=
 =?us-ascii?Q?8wpKIoRWndB3yGAWL9AlmJ3X6CwlwlFfAvcTPjkOBui9HB4RPnPgFIVSACQ2?=
 =?us-ascii?Q?uwYA2J+H1e9J8dMQmzTUHTiKtP93kdsxWFrZxC1hHQ4XAZwq7KACWMMAecdK?=
 =?us-ascii?Q?07zhuZcmpJlvgdJFNw9QURw1+n0F+ispgkIQ4VruAR5MjLbHqtw95/FHpmUu?=
 =?us-ascii?Q?0auAtJQQw58jhtTjgNOiUglkpycNTCjeXWuS1wMTLzYAmUOVXzyN/6odIl7H?=
 =?us-ascii?Q?0cnjUL4kjErb/SF3gQqlSS+Ne+zy6SC1Kn8Vzz8UYes6MMtClV6aicZFWuFm?=
 =?us-ascii?Q?65q6opwv8ZzVcFtffMfnH0TfPlRK7MwHAqWX9i3JZAdwLK2E0ssOUC8tfoiJ?=
 =?us-ascii?Q?x6QlWzeSisEFPwwwzFu0QK2sD/ESd9j4zVHdmGO064GFao9k8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3fATO7oSomNvzbrXwOPSqviv9z1J+/aA1au3D1OL8o5cNoR1Xft2jwyUneIR?=
 =?us-ascii?Q?dhoukU3vednZL+cCjdyjyn/Slltiw6Pd79rhDt9EBobvBRfUUR5V36s/EHSZ?=
 =?us-ascii?Q?/JpEmms0aL/B8TYYnIhUPwkRVexjg2JBK+WjNjE8W153QnBT4HjuT52cCAed?=
 =?us-ascii?Q?RDJdmg7KTptr/8y+M+UGcThnTofAMcM7M2uH6FgKaZhgpG2Vkj3IDL0Podba?=
 =?us-ascii?Q?HGs2JqcVjyu8UhplK+B1QPSOmvMzfAFpru1Saz4XzJoKaX180FfHusF5pnqI?=
 =?us-ascii?Q?PmyWW2foF+2yNHCO5kvnC+fo210WWPoJXiCENYmmKGr0qgvaQ9b1VKh/BHe9?=
 =?us-ascii?Q?IHAGxBcO9sy8qCt45OjBMh5iRuig4skMqnC8k+3rBwh2NnUA0rGvbBYn8xD7?=
 =?us-ascii?Q?UjUGB9S/alRuThes7xSJShpQS6ctztFAfxv4JxOZIx/FeKPSYZh0rrwlzPZN?=
 =?us-ascii?Q?NAF3U6cWUXTUqOjKJzXrEPACb6j71XFV3wbwWlPIUirEWGi1ITHVsXmdAkn4?=
 =?us-ascii?Q?FVU9YSeyU99lNAGyKVYcHLJRXBf4Dakk1JDh3L6TbURiE1zsbkR8BeN0OJXB?=
 =?us-ascii?Q?ry4vNF90rVsw+JafXqjjNLd8L2voXuVhGD6oXl1YqfwQbjCOXPYlGLnMkHY1?=
 =?us-ascii?Q?6E0d/fmoCNpGIh2RQmqDIqiQgegPAnUkld/XIzttxMD8FcWz74Vrxo11kP7/?=
 =?us-ascii?Q?5gcDIr2MuplWeB6dddLFNzikVZ7pbzjZDYGND30FCQmyshdIqt2bmltFBAra?=
 =?us-ascii?Q?iM3UStCmHEGc6byrrgh73ffDEXmGXgYteuazVWFevRpmN0viGlR3saLv+WV1?=
 =?us-ascii?Q?cny2DoiZspATru6agiOMTpoaxjY3IwhbFAotFuFVCt/kLiojwdgvpZEedL5i?=
 =?us-ascii?Q?1aQ2E42EuMXPmyhxmeo1sjgNJGpBzBPKd/Vy2/2ZI/b+b7ouQo1Ps5eiDsBN?=
 =?us-ascii?Q?bNI4+xnWi9/HVY4z7h1Zvuoui3bLBiaEt0YsISd7fWsvbFiuyCNb8erx8YbP?=
 =?us-ascii?Q?XUFUc2k0TF4Yf4WCozCyBWwGn6x5eTPPE2DXthR1I8BNwfVh5J0hOgYJyQe2?=
 =?us-ascii?Q?8q8inB547sXj7+K0wt465Q0Qsprb0F21dLZrJzvG/e+7RujF9sQO86OV4LP7?=
 =?us-ascii?Q?FtqAexlku+AaaMygUmd/aoB8pf6Mn4cUvLXcAdTs/UzQYAWhknjwE9WO+nS8?=
 =?us-ascii?Q?oM/V5HM6GDywuC5qbXW3bB9UYu/HNWUvJ1rfYxRSaXQkrsofPkvGtTxX46u2?=
 =?us-ascii?Q?1I2ClqXEObA4MIfadmI3X8hwFeP3bNiPAvNEXwymRv/GblkBdB1oijrvTAhz?=
 =?us-ascii?Q?6D8Ko58NrhzAR8krLE2qRuMlYEFs3dsVqGOn0e4rutIl8Qgvl3Zuix2NScET?=
 =?us-ascii?Q?qMd57Xo0+04xY6xqJ5Di2fi7fUpQUkk+CbZaeWXv4TV1cXOH4nhW51ooK6fr?=
 =?us-ascii?Q?FA5wFWG0iuhismwK28Ngv4jThKiItR5E0oDMcfDMgGJxzG1i4NBs/6gpQzim?=
 =?us-ascii?Q?xVQg0NwiMTuMxuOUhcauGTVnICaLS5Qn8oMmBwEblg6mNZeYsiSBhipznhmk?=
 =?us-ascii?Q?7kPw0csaa8AEys65Orz71eewQjRsYvykQROEabybpiwT/d66rdPs4nwWFat3?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1152014-a353-4ce6-6f1b-08dcd1a5b011
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:33.6517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF12S2YsROut/ZWpbkYjN6M0FQsoJfTBgEH3CZF+t8mqHmuFqhaq9bVv9ys+7v9dkDjdEVp4f3WZ6U+86UjU+EuCgUNra91KhGMgKgFax+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

The LINFlexD UART is an UART controller available on NXP S32
processors family targeting automotive (for example: S32G2, S32G3,
S32R).

S32G3 Reference Manual:
https://www.nxp.com/webapp/Download?colCode=RMS32G3.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
---
 xen/arch/arm/include/asm/linflex-uart.h |  62 ++++
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/linflex-uart.c         | 365 ++++++++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
 create mode 100644 xen/drivers/char/linflex-uart.c

diff --git a/xen/arch/arm/include/asm/linflex-uart.h b/xen/arch/arm/include/asm/linflex-uart.h
new file mode 100644
index 0000000000..62dc54d155
--- /dev/null
+++ b/xen/arch/arm/include/asm/linflex-uart.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/include/asm/linflex-uart.h
+ *
+ * Common constant definition between early printk and the UART driver
+ * for NXP LINFlexD UART.
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2018, 2021, 2024 NXP
+ */
+
+#ifndef __ASM_ARM_LINFLEX_UART_H
+#define __ASM_ARM_LINFLEX_UART_H
+
+/* 32-bit register offsets */
+#define LINCR1          (0x0)
+#define LINIER          (0x4)
+#define LINSR           (0x8)
+#define UARTCR          (0x10)
+#define UARTSR          (0x14)
+#define LINFBRR         (0x24)
+#define LINIBRR         (0x28)
+#define BDRL            (0x38)
+#define BDRM            (0x3C)
+#define UARTPTO         (0x50)
+
+#define LINCR1_INIT     BIT(0, U)
+#define LINCR1_MME      BIT(4, U)
+#define LINCR1_BF       BIT(7, U)
+
+#define LINSR_LINS      GENMASK(15, 12)
+#define LINSR_LINS_INIT BIT(12, U)
+
+#define LINIER_DRIE     BIT(2, U)
+#define LINIER_DTIE     BIT(1, U)
+
+#define UARTCR_UART     BIT(0, U)
+#define UARTCR_WL0      BIT(1, U)
+#define UARTCR_PC0      BIT(3, U)
+#define UARTCR_TXEN     BIT(4, U)
+#define UARTCR_RXEN     BIT(5, U)
+#define UARTCR_PC1      BIT(6, U)
+#define UARTCR_TFBM     BIT(8, U)
+#define UARTCR_RFBM     BIT(9, U)
+#define UARTCR_RDFLRFC  GENMASK(12, 10)
+#define UARTCR_TDFLTFC  GENMASK(15, 13)
+#define UARTCR_ROSE     BIT(23, U)
+#define UARTCR_OSR      GENMASK(27, 24)
+
+#define UARTSR_DTFTFF   BIT(1, U)
+#define UARTSR_DRFRFE   BIT(2, U)
+
+#endif /* __ASM_ARM_LINFLEX_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 3f836ab301..e175d07c02 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -13,6 +13,14 @@ config HAS_CADENCE_UART
 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
 	  based board, say Y.
 
+config HAS_LINFLEX
+	bool "NXP LINFlexD UART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the NXP LINFlexD UART. If you have an NXP S32G or S32R
+	  based board, say Y.
+
 config HAS_IMX_LPUART
 	bool "i.MX LPUART driver"
 	default y
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index e7e374775d..d3b987da1d 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
+obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
diff --git a/xen/drivers/char/linflex-uart.c b/xen/drivers/char/linflex-uart.c
new file mode 100644
index 0000000000..4ca8f732ae
--- /dev/null
+++ b/xen/drivers/char/linflex-uart.c
@@ -0,0 +1,365 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/drivers/char/linflex-uart.c
+ *
+ * Driver for NXP LINFlexD UART.
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2018, 2021-2022, 2024 NXP
+ */
+
+#include <xen/config.h>
+#include <xen/console.h>
+#include <xen/errno.h>
+#include <xen/serial.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/linflex-uart.h>
+
+#define LINFLEX_CLK_FREQ        (125000000)
+#define LINFLEX_BAUDRATE        (115200)
+#define LINFLEX_LDIV_MULTIPLIER (16)
+
+static struct linflex_uart {
+    uint32_t baud, clock_hz;
+    uint32_t irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} linflex_com;
+
+static uint32_t linflex_uart_readl(struct linflex_uart *uart, uint32_t off)
+{
+    return readl(uart->regs + off);
+}
+
+static void linflex_uart_writel(struct linflex_uart *uart, uint32_t off,
+                                uint32_t val)
+{
+    writel(val, uart->regs + off);
+}
+
+static void linflex_uart_writeb(struct linflex_uart *uart, uint32_t off,
+                                uint8_t val)
+{
+    writeb(val, uart->regs + off);
+}
+
+static uint32_t linflex_uart_get_osr(uint32_t uartcr)
+{
+    return (uartcr & UARTCR_OSR) >> 24;
+}
+
+static uint32_t linflex_uart_tx_fifo_mode(struct linflex_uart *uart)
+{
+    return linflex_uart_readl(uart, UARTCR) & UARTCR_TFBM;
+}
+
+static uint32_t linflex_uart_rx_fifo_mode(struct linflex_uart *uart)
+{
+    return linflex_uart_readl(uart, UARTCR) & UARTCR_RFBM;
+}
+
+static uint32_t linflex_uart_ldiv_multiplier(struct linflex_uart *uart)
+{
+    uint32_t uartcr, mul = LINFLEX_LDIV_MULTIPLIER;
+
+    uartcr = linflex_uart_readl(uart, UARTCR);
+    if ( uartcr & UARTCR_ROSE )
+        mul = linflex_uart_get_osr(uartcr);
+
+    return mul;
+}
+
+static void linflex_uart_flush(struct serial_port *port)
+{
+	struct linflex_uart *uart = port->uart;
+
+	if ( linflex_uart_tx_fifo_mode(uart) )
+		while ( linflex_uart_readl(uart, UARTCR) & UARTCR_TDFLTFC );
+            cpu_relax();
+
+	if ( linflex_uart_rx_fifo_mode(uart) )
+		while ( linflex_uart_readl(uart, UARTCR) & UARTCR_RDFLRFC );
+            cpu_relax();
+}
+
+static void __init linflex_uart_init_preirq(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t ibr, fbr, divisr, dividr, ctrl;
+
+    /* Disable RX/TX before init mode */
+    ctrl = linflex_uart_readl(uart, UARTCR);
+    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
+    linflex_uart_writel(uart, UARTCR, ctrl);
+
+    /*
+    * Smoothen the transition from early_printk by waiting
+    * for all pending characters to transmit
+    */
+    linflex_uart_flush(port);
+
+    /* Init mode */
+    ctrl = LINCR1_INIT;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    /* Waiting for init mode entry */
+    while ( (linflex_uart_readl(uart, LINSR) & LINSR_LINS) != LINSR_LINS_INIT )
+        cpu_relax();
+
+    /* Set Master Mode */
+    ctrl |= LINCR1_MME;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    /* Provide data bits, parity, stop bit, etc */
+    divisr = uart->clock_hz;
+    dividr = (uint32_t)(uart->baud * linflex_uart_ldiv_multiplier(uart));
+
+    ibr = (uint32_t)(divisr / dividr);
+    fbr = (uint32_t)((divisr % dividr) * 16 / dividr) & 0xF;
+
+    linflex_uart_writel(uart, LINIBRR, ibr);
+    linflex_uart_writel(uart, LINFBRR, fbr);
+
+    /* Set preset timeout register value */
+    linflex_uart_writel(uart, UARTPTO, 0xF);
+
+    /* Setting UARTCR[UART] bit is required for writing other bits in UARTCR */
+    linflex_uart_writel(uart, UARTCR, UARTCR_UART);
+
+    /* 8 bit data, no parity, UART mode, Buffer mode */
+    linflex_uart_writel(uart, UARTCR, UARTCR_PC1 | UARTCR_PC0 | UARTCR_WL0 |
+                        UARTCR_UART);
+
+    /* end init mode */
+    ctrl = linflex_uart_readl(uart, LINCR1);
+    ctrl &= ~LINCR1_INIT;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    /* Enable RX/TX after exiting init mode */
+    ctrl = linflex_uart_readl(uart, UARTCR);
+    ctrl |= UARTCR_RXEN | UARTCR_TXEN;
+    linflex_uart_writel(uart, UARTCR, ctrl);
+}
+
+static void linflex_uart_interrupt(int irq, void *data)
+{
+    struct serial_port *port = data;
+    struct linflex_uart *uart = port->uart;
+    uint32_t sts;
+
+    sts = linflex_uart_readl(uart, UARTSR);
+
+    if ( sts & UARTSR_DRFRFE )
+        serial_rx_interrupt(port);
+
+    if ( sts & UARTSR_DTFTFF )
+        serial_tx_interrupt(port);
+}
+
+static void __init linflex_uart_init_postirq(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    uart->irqaction.handler = linflex_uart_interrupt;
+    uart->irqaction.name = "linflex_uart";
+    uart->irqaction.dev_id = port;
+
+    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocate linflex_uart IRQ %d\n",
+                uart->irq);
+        return;
+    }
+
+    /* Enable interrupts */
+    temp = linflex_uart_readl(uart, LINIER);
+    temp |= (LINIER_DRIE | LINIER_DTIE);
+    linflex_uart_writel(uart, LINIER, temp);
+    dprintk(XENLOG_DEBUG, "IRQ %d enabled\n", uart->irq);
+}
+
+static int linflex_uart_tx_ready(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+
+    if ( linflex_uart_tx_fifo_mode(uart) )
+        return (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 ? 1 : 0;
+
+    /*
+    * Buffer Mode => TX is waited to be ready after sending a char,
+    * so we can assume it is always ready before.
+    */
+    return 1;
+}
+
+static void linflex_uart_putc(struct serial_port *port, char c)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t uartsr;
+
+    if ( c == '\n' )
+        linflex_uart_putc(port, '\r');
+
+    linflex_uart_writeb(uart, BDRL, c);
+
+    /* Buffer Mode */
+    if ( !linflex_uart_tx_fifo_mode(uart) )
+    {
+        while ( (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 )
+                cpu_relax();
+
+        uartsr = linflex_uart_readl(uart, UARTSR) | (UARTSR_DTFTFF);
+        linflex_uart_writel(uart, UARTSR, uartsr);
+    }
+}
+
+static int linflex_uart_getc(struct serial_port *port, char *pc)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t ch, uartsr, rx_fifo_mode;
+
+    rx_fifo_mode = linflex_uart_rx_fifo_mode(uart);
+
+    if ( rx_fifo_mode )
+        while ( linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE )
+            cpu_relax();
+    else
+        while ( !(linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE) )
+            cpu_relax();
+
+    ch = linflex_uart_readl(uart, BDRM);
+    *pc = ch & 0xff;
+
+    if ( !rx_fifo_mode ) {
+        uartsr = linflex_uart_readl(uart, UARTSR) | UARTSR_DRFRFE;
+        linflex_uart_writel(uart, UARTSR, uartsr);
+    }
+
+    return 1;
+}
+
+static int __init linflex_uart_irq(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+
+    return ((uart->irq > 0) ? uart->irq : -1);
+}
+
+static const struct vuart_info *linflex_uart_vuart_info(
+                struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+
+    return &uart->vuart;
+}
+
+static void linflex_uart_start_tx(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    temp = linflex_uart_readl(uart, LINIER);
+    linflex_uart_writel(uart, LINIER, temp | LINIER_DTIE);
+}
+
+static void linflex_uart_stop_tx(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    temp = linflex_uart_readl(uart, LINIER);
+    temp &= ~(LINIER_DTIE);
+    linflex_uart_writel(uart, LINIER, temp);
+}
+
+static struct uart_driver __read_mostly linflex_uart_driver = {
+    .init_preirq = linflex_uart_init_preirq,
+    .init_postirq = linflex_uart_init_postirq,
+    .tx_ready = linflex_uart_tx_ready,
+    .putc = linflex_uart_putc,
+    .flush = linflex_uart_flush,
+    .getc = linflex_uart_getc,
+    .irq = linflex_uart_irq,
+    .start_tx = linflex_uart_start_tx,
+    .stop_tx = linflex_uart_stop_tx,
+    .vuart_info = linflex_uart_vuart_info,
+};
+
+static int __init linflex_uart_init(struct dt_device_node *dev, const void *data)
+{
+    const char *config = data;
+    struct linflex_uart *uart;
+    paddr_t addr, size;
+    int res;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart = &linflex_com;
+
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("linflex-uart: Unable to retrieve the base address of the UART\n");
+        return res;
+    }
+
+    res = platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("linflex-uart: Unable to retrieve the IRQ\n");
+        return -EINVAL;
+    }
+    uart->irq = res;
+
+    uart->regs = ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("linflex-uart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    uart->clock_hz = LINFLEX_CLK_FREQ;
+    uart->baud = LINFLEX_BAUDRATE;
+
+    uart->vuart.base_addr = addr;
+    uart->vuart.size = size;
+    uart->vuart.data_off = BDRL;
+    uart->vuart.status_off = UARTSR;
+    uart->vuart.status = UARTSR_DTFTFF;
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &linflex_uart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+static const struct dt_device_match linflex_uart_dt_compat[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("nxp,s32g2-linflexuart"),
+    DT_MATCH_COMPATIBLE("nxp,s32g3-linflexuart"),
+    DT_MATCH_COMPATIBLE("fsl,s32v234-linflexuart"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(linflex_uart, "NXP LINFlexD UART", DEVICE_SERIAL)
+    .dt_match = linflex_uart_dt_compat,
+    .init = linflex_uart_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.45.2


