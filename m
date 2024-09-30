Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0A98A10E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807250.1218576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsK-0000Ei-I2; Mon, 30 Sep 2024 11:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807250.1218576; Mon, 30 Sep 2024 11:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsK-0000D9-EU; Mon, 30 Sep 2024 11:47:36 +0000
Received: by outflank-mailman (input) for mailman id 807250;
 Mon, 30 Sep 2024 11:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsI-0000Cy-UY
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7cc1765-7f21-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:47:33 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:30 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:30 +0000
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
X-Inumbo-ID: c7cc1765-7f21-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVIoG+YplFbPgemqjPSBSP5diNvtpNroXHGJrS6EbGvjV16mRVp3zl+HtD8Rdler81N1xKBN+fxC0bSjFoBCzn2ytjLLkW44YRBar9f9zP56N6AbtWXjBOf7TAUryV8/GTicrNrJy8j8HHrDV90yt1Fbp49/DqWA84v/3A8i0kPua67pvke7ZL+sHgeDuLqPv56ZdPcA79TPab1jgYH1H4DXLvV/Ncoi8c6kOGLL1ywQR6Mn2OpKQkH2NQwpGPAY4mqsFdmoE2TNN9+XnXXngUyUWhaj7yMlEa6qxRAp2pw8CX9MAhWdKw87FCGdfr0iRNJOidBxvDAXovv/oJFkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ktb7BFEA+nwWhTb7xzRuQ8LAB28nGozc1HHijK7ALA=;
 b=Cs+jdRo8R9W36d40NP4Y2OfZ4b4qWtHuvu7u5DFAwsgJ4cy2HihRI/Byvdv8tT9b4MrG+5g5N2ODkTX8ko8v66I1BqYA6uPNvNYQBko3EGjnSzqpny8WPOHxrM/pI3VsC++kXgp94rGbObDWmABT/75/JCI4353x6IKKnsHQtiqDSLWHaNRTifcsKYpRWfdGXaliFjT1OcBIUzAShOq33A+pmSIiMPnOdyQ2dwV4XBO+jQn6BGRIYpm1tI+MS1jPx7ySASaxloZ/Ry/iDw43k6RL2ddyQ4AlyYN6MuLnDzI0J9LEwOX6oNKqC/lglMCY/z6tCNvHDwrWcuQNHh2L0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ktb7BFEA+nwWhTb7xzRuQ8LAB28nGozc1HHijK7ALA=;
 b=C+McCWFELtG42IdlU7e0EmLswLNRxeYbCsU2wO90Qs49+C3YkbiguSrYP6NJUToxW0wb4Udqg2Ie1Os4l/TTSWbh5tuUIlr00khjT0XR9F1TNvRRA06R90p7LU1xgav8fReWqHyAI29Uf98u7UgVCIbQ0ygxKEC58K8Of6JUn8jY7gPAYmFMkMMzBEw/IQbaCt59L+Fj+BOzl7U7D5dB/YdMeKaYICmtm1nqXRcXh9xB/RltCUXdx2IPIPJmluIApUwZhZTM2tvhCwsLMhKM2rKziGVVtz3YKJbgAAeH6cV+Gs5XlSADjrRwxzmkICv47sYpFTqIWkQ8oLd8pHppiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	s32@nxp.com,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/8] xen/arm: Add support for S32CC platforms and LINFlexD UART
Date: Mon, 30 Sep 2024 14:47:06 +0300
Message-ID: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d3d0ea-c815-4e7a-fa1c-08dce145a9b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6BWA0ScaXtjHNisMMXdZGG8/gGoquYgGlPAynlwzf53ZIA7bpd+2JTFj7mT/?=
 =?us-ascii?Q?PGpMWmT1OeTjyJV6JpfRqTeov+bNrIEie2tyTBjG9/v+ln2Ukd5ZZsvTuzQO?=
 =?us-ascii?Q?0BvwgPXsJTKvb6WMpQl9y+yYog3z8nntrWzfUvkkGlnoIg4AkVBp22leksI5?=
 =?us-ascii?Q?paai85Ksbyif9YFW7c6i5e0BHtrZThW5eq4ES3EQgMWSKULl0cKebtPINJLx?=
 =?us-ascii?Q?dXK4J8DiDnr3ftqDnk8Y9G3zGRdFFQ+NaGEDIXvAix6s74cW+vmZk02yfYA6?=
 =?us-ascii?Q?FGozFC60GjZLk5utfVnalVJLueicRQ3uBOWu1V6KG6XywDWRdjlAN9BuEGXo?=
 =?us-ascii?Q?L/xxD4uxZDtBQeS6kFJNlII8e4a8eIBeTBRanqqYPx736doynG/14ofHMUyu?=
 =?us-ascii?Q?FhaC8CcJ3O+3BLrGwM8HfIbuHaoTg0vVmEriCl8uVltrvfUfnjv2TDI36AqW?=
 =?us-ascii?Q?+Ky/ANeLp3mvNuowc1ubLIg8CzsM/8Pt7Eh+fAjFAbeVLIuuIbO0fy/q+9fM?=
 =?us-ascii?Q?SVlCSp7LPNsujdFnPw+x1AEaQRdm3uHr4cYzeooyzv/irqf4ERe3Eewco+a/?=
 =?us-ascii?Q?FijRBDLNEpNp5rZb56yT01bdpBI3C93xfo7rfxXS7hNlUW4X5OwUHqVXPORK?=
 =?us-ascii?Q?zcXVu8TqGeTxzKK40dlS58hIZh7Ce78LKhZZVa3ze5AT3uJ0HFXH3sbaX0V3?=
 =?us-ascii?Q?ENe0l40gwileAg7G+VJrjsogupWqrrp3DI9bbwThEEBoojpsmd65eQY7/caq?=
 =?us-ascii?Q?27Z+ggOEKVVFu9hfxrtm8nkP7e2FDqsx1VOQ7HIr/3TK0iQtWDNu5hy6Yano?=
 =?us-ascii?Q?WOG2V8Jy3YrN81OJDuHJzgzK0ij6cw5pvmPJkWl5NxrdDbdGMASiK3X/4jWk?=
 =?us-ascii?Q?3imbySOPEH9Suc+BDTS6mSbZkVc08GBBlKEVcnHmHWoA3s6kPHeibupKLANs?=
 =?us-ascii?Q?88T9WdURkinHBwyZM3xqWcPQe49PKTJyS16tIEDQm/FsrdnUP3RWYw3Awtqv?=
 =?us-ascii?Q?3pY6BW2AKSGDTO1IUu8VjHcJ0cDBboABE4UzCxTa9Cy7wpN9dm3AYtsI1WIV?=
 =?us-ascii?Q?SqnuvLry7gENO4NE9GyllwrxJcyd35wv4Q8zMQ5wRl1o9AW5TZ2sXFh8nNpq?=
 =?us-ascii?Q?rQanokQYOXvEoibRl8koPY5Cu84ki/hl6b9LPYyRhKqmQVNHPspjh4as9XKC?=
 =?us-ascii?Q?x7P2kyChWt4AK8y+xjTFc/XD1lksmOzR399nYZanuQ1hbmr8sDsumg/OZw+z?=
 =?us-ascii?Q?+YSRhgw6Wkhts+fp/XKD2uVbRoEqpJyEQAkjenC6ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g/Bj2j10NlBA+Rea/Fcg1Y2lfKCy7b9Gil8SAbdk118DmOXmAaavhjj1lUhP?=
 =?us-ascii?Q?axf6MiUiWNRfk7Dgptb8fxMUlXncHpUSw/prfrBoWhoEpRVeJXUSnCnHDfIu?=
 =?us-ascii?Q?qZzY+YC6SvtSRfn/42OwPAfbJUcuHI6rn+UatrhHdRwVfg1uDV7IhLo96cwP?=
 =?us-ascii?Q?3hbaiHR2JMC2tNalKnkmZWz+qGbtUx0JBpSPS2YcRme6lmGfIFH6tHzoPOpY?=
 =?us-ascii?Q?GgToFrNkUbEz4C0k3+ElW20y+8AEcvbwV2oKMp3QclQbnvfa2aYfq4Vid/VD?=
 =?us-ascii?Q?A85wDUfhx6Sb9he14eByPuh7qJoHBTRg0FgyyQMqQDi/mUaS5JIW0x7o8i3b?=
 =?us-ascii?Q?BppgM5kZKt4BIeNa7gbC7qptcaNHGaAK7xmTq5WoA19tue6OUmsn6KRZENF/?=
 =?us-ascii?Q?fZ1ZXchVoBdOByLPoWpWW4/e3xJN+hFev9TcanuSRC27AV20yYhioVYOLsJ4?=
 =?us-ascii?Q?o/ismvFiHKMDqcCZOdBFXHU8H4NHrxf+py/bznhuJus5xoVsXgWtpY3gER5e?=
 =?us-ascii?Q?G2jpgXgFERnLXoHgM0OuPYIqpZqqzJ0xxwivSgY1Aqxx02AFzUAt6SCmgflx?=
 =?us-ascii?Q?0gRlf1hbSev4SRyx832VnCTYuImW3otcoEScbseyDToE9AuuBJ2nnFzRmyie?=
 =?us-ascii?Q?Z54EGtC35nS4nm4Kk1e8Cs1xic7S9eDKq1eFbpi3Y93MgJt+lTrHjLL/dFYj?=
 =?us-ascii?Q?X2gqiUi7NjuU/TTlu+/sAAFv4RBBnuoXhDFv+4nJ+apA8iIGtPlslT+U8TNA?=
 =?us-ascii?Q?sQoACHH5JyeSKBN89SSCY6dXolz6bUJiz/NT+M6B6I7hRdT3IPKvEKRnK/zv?=
 =?us-ascii?Q?l9Dqkjynx0LW8mpE2PFHyEKwo0MrxMy7UFha0IJVaB+VNaPYMSqGzbgTFaPW?=
 =?us-ascii?Q?EHA1RZuSp4OyGUpJPGAAvqH4R1PUqnyMJM1LgU3NOOQ0IlMdKJ07nCLCN0LT?=
 =?us-ascii?Q?5xKq3E/yGKQzuKdwmVmEI19TFeyfQGLJ8HbsfF+OLGBozI6AbTnSSX8Jwc9e?=
 =?us-ascii?Q?VWe6BuNgL7rYkALVWkijvSZwWX7OqbosBFoZ+J2qezquKIg/cZgpG565u/th?=
 =?us-ascii?Q?TC6XNYjll6c48whNNJjGfhi87UgMCNID09NIzSQudJMzkjptdfsiqURvo5qW?=
 =?us-ascii?Q?Xmn8Beec/m2fU+NKE0l6i7Tn8cR3GJ9fLjv3+jCCKmn4JQQ1wUIPzE+faSKB?=
 =?us-ascii?Q?Gc+IJvnZ7qet34/Vgy4c2w4DTWv5nQR0zDLfXVcdr34v6kOYR67Ao+06xqm5?=
 =?us-ascii?Q?rMMNqBKB5XOkZLboPBcoz9D+IyC1ubXp87U3otft3bWYez3G1+EWN3Bm5gtS?=
 =?us-ascii?Q?gQZPmqc82b7V/WdTsFBgx6guR76mMMpQDOGb905IiRwoHc27ZauDTZGkfC5q?=
 =?us-ascii?Q?jTjSGB7BwM0WwEdkizZ7nNncaNhMrATDkznO7v89Ikaicquv3k0G6ZUVu+rg?=
 =?us-ascii?Q?SAOGFG2oj1PiH7Bd51indGTdBNnIgp+C1ARlOn5yTh0AVHqH8XG6DNSyMdAn?=
 =?us-ascii?Q?KPdPvEQJ01ID2byCiF6VRvr2V2KojSkv5WECxKg2Frt4dbuYFWrbaGdsVNss?=
 =?us-ascii?Q?vY8LQMt/GLHV+9y+eJ61x0RgTPVcO5zNXQwlDS3vPz7dTk0r0e/c/q9iyQnf?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d3d0ea-c815-4e7a-fa1c-08dce145a9b1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:29.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpKM68g3HjzqcnwSICLLhXQ1gdoKXtqpzX6GmSyoE7MX36RXx83kCn+GJi/EWl3wnVILSjTpRwM9SrEzz5HF2+GAY7/RYmQwuqkvaPtimpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This patch series adds support for NXP Automotive S32CC platform
family, which includes S32G [0] and S32R [1].

First patch adds the driver for the NXP LINFlexD UART, available
on S32V, S32G and S32R automotive processors. The compatibles in
the driver match the ones in upstream Linux [2]. The 2nd patch
adds early printk support via LINFlexD UART.

The 3rd patch introduces a generic mechanism for forwarding SCMI
over SMC calls to firmware running at EL3, selected via
CONFIG_SCMI_SMC. The 4th patch refactors the SiP SMC handling in
vSMC mechanism, to rely firstly on `platform_smc()` if implemented,
then on the previously introduced generic SCMI handling/forwarding
mechanism if enabled.

The 5th patch adds S32CC platform code stub and configs to enable
the required drivers for S32CC platforms.

The 6th, 7th and 8th patches modify the CHANGELOG.md, SUPPORT.md
and MAINTAINERS files, respectively, to add mentions about LINFlexD
UART support, S32CC platforms support, and the new SCMI-SMC layer
introduced.

[0] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32g-vehicle-network-processors:S32G-PROCESSORS
[1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32r-radar-processing:S32R-FAMILY
[2] https://elixir.bootlin.com/linux/v6.11/source/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml#L27

v1->v2:
  - linflex-uart: 
    - Addressed coding style comments from Julien:
      - spaces vs. tabs
      - indentation
      - license issue
      - comments format
      - code reusage
      - misplaced loop exit
    - Made the pointer to struct linflex_uart const in most functions
    since it's not modified
    - Added support for customizable baud rate through console options,
    parsing what Xen gets in its bootargs. other parameters following
    <baud> are discarded for the moment.
  - SCMI SMC handling:
    - Added a generic `scmi-smc` layer (enabled by CONFIG_SCMI_SMC)
    to enable forwarding SCMI requests over SMC to EL3 FW if issued
    by Dom0. If the SCMI firmware node is not found in Dom0's DT during
    initialization, it fails silently as it's not mandatory.
    - Changed the handling for SiP SMCs in vsmc.c to firstly try
    the `platform_smc()` callback if implemented, then try to
    handle the SiP SMC as SCMI if enabled and SMC ID matches.
  - S32CC Platform support:
    - Added dependency on CONFIG_SCMI_SMC
    - Removed the S32CC platform-specific forwarding to EL3 mechanism.
    - Dropped unused headers
  - CHANGELOG.md:
    - Added mentions about S32CC support and SCMI-SMC layer.
  - SUPPORT.md:
    - Added SCMI over SMC forwarding to EL3 feature for Arm as supported.
  - MAINTAINERS:
    - Added myself as maintainer for S32CC platforms and NXP S32 Linux Team
    as reviewer list.

Andrei Cherechesu (8):
  xen/arm: Add NXP LINFlexD UART Driver
  xen/arm: Add NXP LINFlexD UART early printk support
  xen/arm: Add SCMI over SMC calls handling layer
  xen/arm: vsmc: Enable handling SiP-owned SCMI SMC calls
  xen/arm: platforms: Add NXP S32CC platform code
  CHANGELOG.md: Add NXP S32CC and SCMI-SMC layer support mentions
  SUPPORT.md: Describe SCMI-SMC layer feature
  MAINTAINERS: Add myself as maintainer for NXP S32CC

 CHANGELOG.md                            |   4 +
 MAINTAINERS                             |   8 +
 SUPPORT.md                              |   8 +
 xen/arch/arm/Kconfig                    |  10 +
 xen/arch/arm/Kconfig.debug              |  12 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/arm64/debug-linflex.inc    |  58 ++++
 xen/arch/arm/include/asm/linflex-uart.h |  63 ++++
 xen/arch/arm/include/asm/scmi-smc.h     |  52 ++++
 xen/arch/arm/platforms/Kconfig          |  11 +
 xen/arch/arm/platforms/Makefile         |   1 +
 xen/arch/arm/platforms/s32cc.c          |  32 ++
 xen/arch/arm/scmi-smc.c                 | 163 ++++++++++
 xen/arch/arm/vsmc.c                     |  19 +-
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/linflex-uart.c         | 381 ++++++++++++++++++++++++
 17 files changed, 831 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/debug-linflex.inc
 create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
 create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
 create mode 100644 xen/arch/arm/platforms/s32cc.c
 create mode 100644 xen/arch/arm/scmi-smc.c
 create mode 100644 xen/drivers/char/linflex-uart.c

-- 
2.45.2


