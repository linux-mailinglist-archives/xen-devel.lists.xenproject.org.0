Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB79F626F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860097.1272184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2l-0006kb-21; Wed, 18 Dec 2024 10:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860097.1272184; Wed, 18 Dec 2024 10:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2k-0006j5-SF; Wed, 18 Dec 2024 10:12:38 +0000
Received: by outflank-mailman (input) for mailman id 860097;
 Wed, 18 Dec 2024 10:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2i-0006CD-Ln
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99db5b92-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:35 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:31 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:31 +0000
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
X-Inumbo-ID: 99db5b92-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLdTkwbiACPER+oNnFSZeB7O5o85zc6gDG4DzUA6btanyN1vBld5VB1kQ+rjt6cJfo/A+uKRcpLs61u/CjniwPrYfBoYob5kTjXNuFWyoHBnmGV7rNlH6WsCG0KAODhAm3XWQYDMBZ8atyNWXyZ82eSWnwoFTIdfb8H4nfwIEcvO8hDgsa0NSMHzra0V06PZd4uOPrG4wY5cNrS7eY/WIuqx0PkxxYVpQvE6dEp4aHmHS/89/fJmpS9G3kHn2bzEmDcnYOG+h8g3N60FKw71qAi1spcoZYju6nzerA0cM4TGAQNxyPgSJpzD5MXg870+He75Z5rjMXsETUeJ2QeMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alPIWHc1qzA8rblJaAC2okTD6jSXkIMNBqCwCgtHwlc=;
 b=yHagXES3McaAkBEYsWMfDqwOGxPsfA8kXdhen0+DcXy5M9wMdENyfHg33bMRj8VcoPSbcYFp4N+GYAprApiEDhOaNuGasR39JRpK9ierL/kB0bqIhQHYGTAFwgpnq7i2pFtRmfUeWKve1abM4rFNMPW29DopS0vLlVoRKCoireWeMISow5r4nWGigQ7KXn94/riuMbcE/8tM15my5tbipB81LmjwpQyJYYt86lP//UPTOBfDoRYS1D3wy0mTJYlZpXvCFL19XKgvNTT0hRo41JLDBrTdeazNzHSnNkqu4O1mv3DDzzNrVYMH7ZIQDuH+OTh677OM+m5QYXC+cQhaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alPIWHc1qzA8rblJaAC2okTD6jSXkIMNBqCwCgtHwlc=;
 b=czUrLWgW56BAGl8Tdb6IveQiNPbcAdIHCayMgfPfkNPSJjDKJgNdaHdcqhNHvYvcgrJwKb4o0J6F7b8+lCarj9u1urR4CWdnspLjNW9o3Pc6soI4DelmMs1u0VmchYQplSpTNT/en6XqtMZWJstUZv8pyGlpt8rAvMDXmNgMDpyBQ/Lba4RKbofMSR5VxwSHclhYfYSeyJjodLuNHhji0oqBHxqN/2yEUbxG+1uKopkLRfhWKnPPJU+6kHesVY3P1iQ+HCvWh20NUERIkSbMxisQLSIcdYPGyo9u350SgFFXLCS4owRYBY1+LZS8QTWTKikv9JXOQeoETG4SHQQQQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 4/6] CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer support mentions
Date: Wed, 18 Dec 2024 12:11:39 +0200
Message-ID: <20241218101142.1552618-5-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 665b6a2b-7a7d-4b29-41a7-08dd1f4c7bf9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQbn55WdSXG7RPFvC1cS3KlEsQ2morlX+LSRzK8whpqZYJTGSEHyW1FfTEy6?=
 =?us-ascii?Q?mdxxIKccVz5AkyHZr5WYs/36bXS5pqs4TdVOiJStGVHvZZ5E8qhTQfl/qknL?=
 =?us-ascii?Q?woXktPrKNBRDm9CyyE0H/vCtPKRLV1kksCIio9KIFGDckZxZ0cuWOWaHXLkK?=
 =?us-ascii?Q?q7TOXo88uGBJJKdAhPo/b/2u2Oo8+Sd1ysWSgj+YfHrAE01iB6s37QaLU3w2?=
 =?us-ascii?Q?RBXoabM7dMu4tdY57YfFMA29+YS8cfF6HN1gP/QAeu300qTbF5v6jpTHmoim?=
 =?us-ascii?Q?yWAnSRU+S24BdrwP+w+nAkoRiVhJxgw4AqeAbe5IBGK54eRyhz2afWM1E6A1?=
 =?us-ascii?Q?r6tedjWWF2lgBUvS7cBp4FscIfLOGGCoX3/fle+nDhvmA5kxn2/j2WICe5jF?=
 =?us-ascii?Q?TWbIXAZuyo1tTdKlUXxSaIpE0ogOT68Bu9t8wHJ2uu5EXhUKJVqPpzZKgveg?=
 =?us-ascii?Q?L3hVspK2qfzn+mFMhuMp+OFgESs7xNZoKiGg/cFlklq2oO7LFwPHtpDApgL3?=
 =?us-ascii?Q?2GbKd8lz6YxRTjPiyNOcUyDET5OOo726Etn4V5551I0DBOQjm2Ki4VLQMBuQ?=
 =?us-ascii?Q?MDMTI8luQVtOqpVk+khvKHizdD6uJ5oFT6m3GznMQETrYSGoXS4OgvQYiiVF?=
 =?us-ascii?Q?IhWZ+uv5qagvg2wZ3WSbuukGyvqgm/zMh6feda7uQkFpLvisNma+Uh6SwTjQ?=
 =?us-ascii?Q?DBA8jvMqMRBf70/x5E4yBAkbLBfYOVI+QUIOLc2sJSEmEGHkyU1BxtVDPfAw?=
 =?us-ascii?Q?NUr7H4ZBDldxmjBNgCOSTjigSiyK7SwqlewwZjLX/rOVWdxYhfkjmH+eaNqt?=
 =?us-ascii?Q?oPr2WrItgrSW3hcKSf0WiRK12NLYN+PJMDysfvf23ouLurFB+cZxoDu7P4bn?=
 =?us-ascii?Q?HCc0v4q+ax6KT8x81iyP85BDLtlbVC+AWiPc9Mljt6qd2mcCNQVK1dkuEMgW?=
 =?us-ascii?Q?fNHJV55qFJKir1+wd8P4J/VuQjHhgYiLHbGrS1EruoOhe3UAhp1Ui9NLhAee?=
 =?us-ascii?Q?7qpchDwtf2x0rNiQQEgrklN3H+ZoZ6GA4aDD6rOaK+GQ0ZWmEMOVciSuBMQh?=
 =?us-ascii?Q?raftNoYv/aLyiBWLFqwlSwdUzv6M/CE2i69QsB+pvlw9jXuYnAGxfSy8Svu7?=
 =?us-ascii?Q?6u7ZUa9SKOgIypiRnq5p2RrXYXlVnCQV+vqxcxSu0ucN2zPFjno1GZvn9I4S?=
 =?us-ascii?Q?WtDgTIOnfTAhmCpl4smG++zUY8OO3v4aX8MPA87vN+37WVqi1MQcNnwn+ze8?=
 =?us-ascii?Q?O3Gf6V4UF8BN+5cUozJX+pll/lwimRED6MzNCwaNU3V8n0H6cks0vUw+7y35?=
 =?us-ascii?Q?Ia3Ee4hU8XNGtR5NLpIyApssBu/gpUnR2615g5hbJ4kwRaHJSsxAWiZjVMh4?=
 =?us-ascii?Q?hik6ehuAWwoCQx8L/1sxLTz1l8e7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2p9y69EEBOYVU+fLYRipmzUO/ZcS7Hphd1Tg63Vtx8uddm29cdR5c3UePh1G?=
 =?us-ascii?Q?N3EbzoGBLGl4W+QGNOo0u6k0C22EvKZtGM6PmW/vxpTvButaC9daNmlH4aU8?=
 =?us-ascii?Q?r83Z7nn7CX6wZkQrvmncvTJkQ7CLR01S2VPEjke8sOlsqcs2bfyUf5txDV00?=
 =?us-ascii?Q?7ZC5PdSpki3CwUE7kmc53kzqZODP/m7sObuogTS9f00Tfzn6JSr1T75j8cst?=
 =?us-ascii?Q?q8AhiYSnMPnNM48Bo0PD0dUp9j7sEJRLacp0DlHQ2FujwpKP3FY+na3KBGgw?=
 =?us-ascii?Q?/VOZ6vXIdFb4gZzvtB673u+0PA2Z6KbHNnQYt3DxCyyZhzpq1sVioddOditU?=
 =?us-ascii?Q?ZJd45YWM9V7ubhTgLYq1nhsdnLovPQwyACMLXweCaLcmfJkPzajcsyXQCiL9?=
 =?us-ascii?Q?aH74k/QMQ0UOH0wTlRxe6Jh8pBurgX2fmpAx+tt2INXBrgALmTTJCTJ7Kb/b?=
 =?us-ascii?Q?uggZZHf2AstP7nJcn2E5C8dU/Hk+m/57n1L0bBiYmO2V9wHEedazJvJzlQjH?=
 =?us-ascii?Q?fh34gVDdbyuHuQNxQ9TsWAfz0eMMHsJU09oiAokmqc1kIQb3qXyYdafC6R9C?=
 =?us-ascii?Q?q6IDJIhM2mqRW0PQjDOPyft1Da16p4lq+uu5A0TNjr/2CS3raFneTK0yTilT?=
 =?us-ascii?Q?3d9Q+s/0MuQ/HsmiAH3VkxbtqFRX70lQjNySfYrsOc9zkriWIvSSI6WBuvbm?=
 =?us-ascii?Q?3Z6x/dRwkBtoneVsiacezl/rMvxj0hxCrg8wMgsz+XOtwCqzc+ApYrJCUPZA?=
 =?us-ascii?Q?u3yIqvz8I6Wh04QtiaBBKW7b/jLL6oLpl+97RSEJ0NeGmbm9xXLSOcypkj8h?=
 =?us-ascii?Q?En0FDTL1qOvraL/k+x2NSypjCypUl09KuYhCj4L+8Q80l5nOPHlc9RzSeOrQ?=
 =?us-ascii?Q?xoqfy1mrIN0jebmQce+AOZRN/ZvLMJqXWFuoeKH/gt9S06cGTd5iOBHVp6lf?=
 =?us-ascii?Q?YYoETnzvhgltuP6W6TeUKWKqw+unlZAMWIAP5cXYkYrCfA7Yz3l/sg4cbr7a?=
 =?us-ascii?Q?hoVVAcBPvzo23zlj40hwBzDewdLX1kxAPCO0d1yXJUehiGi1C2eQ7iUB4s1h?=
 =?us-ascii?Q?Mo01mRObHPsNJ13kjDDD8Dr9MFj5WjyO29N9Hgyps8QxK7hwtGCcZ/VKB3e3?=
 =?us-ascii?Q?oZs0zLf5XHPIE/JNxT+KNDZuiGL94Bb9pDflaoNjCfK8i7pkb80vSqqFDJpC?=
 =?us-ascii?Q?9QJcL8Y6jC9iMpIRm3zA9gjOsFBldKf1F9XDDdtNqo4ANB4HqSKVmkwJWCZN?=
 =?us-ascii?Q?c79yw/9lFbCr8IPX5c/easlrAJUFbJ8o1ToAhSVi8YPSPLpwmMDLzOmdunAS?=
 =?us-ascii?Q?fsnBlmF8CvbeK3Dr2upez4FqgF2T2/pOzsfbHkmQmLc3pyl4iF6bxIdpdOXx?=
 =?us-ascii?Q?UgGOqBE9KNZ32lcC3d3RPDjtqiZ863g1tZC0DZDuWP66dbDwNaZ9x6cJ8u4q?=
 =?us-ascii?Q?eqUa9HUwytY4k1QENqsiMw1Oi6Ry4kILGl/3gR+06TKE8gjAfpD5q/HhDT2C?=
 =?us-ascii?Q?ToG6Jgz9bOyieXUIu5GwOURRY4zz3QqVgbMMersWKJeWKPgO3cs9MhiPrtox?=
 =?us-ascii?Q?AFCirBkaH+KoSU1BBvlZAmPMhAKdHSXjSFlgeXr2uVCEHo2YfW4JCVsy8b5u?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665b6a2b-7a7d-4b29-41a7-08dd1f4c7bf9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:31.6278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgqf5pjCfIjPj8AwMqeK1CL5E91gh4pGMgozj5th6a7CAaa53QJuXmUovtllPD/I1uF6AIy9qI37T94AiVzWjWM1NcmpkQCUZxC108xHaPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 15f681459f..bda43b1efb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Added
  - On Arm:
    - Experimental support for Armv8-R.
+   - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
+   - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
+     forwarding the calls to EL3 FW if coming from hwdom.
  - On x86:
    - xl suspend/resume subcommands.
 
-- 
2.45.2


