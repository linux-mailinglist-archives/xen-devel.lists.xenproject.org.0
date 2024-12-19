Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF39F7A4C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861111.1273126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd6-0000Kr-GA; Thu, 19 Dec 2024 11:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861111.1273126; Thu, 19 Dec 2024 11:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd6-0000I2-Cf; Thu, 19 Dec 2024 11:23:44 +0000
Received: by outflank-mailman (input) for mailman id 861111;
 Thu, 19 Dec 2024 11:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd3-00089J-Qg
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b278c8ef-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:40 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:38 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:38 +0000
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
X-Inumbo-ID: b278c8ef-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNKwD6UqSYkW/MZ6v3FY1+O3rCl+SF4ToaWdB8bLguFn5chHF6mSaOyedXnjG7UfYZe4WnVX3DN0gnJidRCECIsblMaq/cLf2mXq+G0AY4wa1tif9b6n8mugSscAAl9TrU99vw0gaGqa8InMhu5pauPu131r2SW+QSIwVHmp2euLGY8p0nOYUncqAcMwMz3K+K36JG3OqXPHkNTGIwuNw+eruwnn8/p2v0ColOEwGsWeT7tv25OkkTV3qqRuE6AgqFRpT9HJpnFYjk9+3OUfZvMPXy8Ho5GbrwrCZfkp6GzmKscaQgkSPtDQ/hiA1z9BAWaP3czxu+a7K+fl+2dg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMUaJq6ve1Tou6rEBX7gkP59r1mDg0K+CG0KwNKwM5I=;
 b=RFyWCFJ0Z4VtkQsap1BJvBPeZOETI3ueJKek8KU2W3QRbAiV3kvWEv9zQYKq0ZUf7nYFhqgDYgG13yI092sdDqrs8R4xVyEpwq4mS29vXMFrkDK4sjACaBIw7wK7ON1ksM6vIfImdEy1EVa0PkZFjR0NL12MEifE0mW40VjFmerBrcJ6/OYfVJ4bNH+Ey2dTgSAKTv53UsedY3w2GvFbbV3e3S6uQeQKlKNK0cigCM75gxH7IwN0NU0GBPbV1FFHVEzqAGQ6OkTnve1Bwt3N/+IZUBegSfUHDC2HMRecu46FNpd0oHPZDfPUn51b/c4BMHU1aTPS9mt2uJPz5SaIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMUaJq6ve1Tou6rEBX7gkP59r1mDg0K+CG0KwNKwM5I=;
 b=NqzEBju8LouqijJTigN9UpM3Ps9rJRNWkGM/J4e635i0XVu2mBFNeEImo8qX6UsnH6MDQV6NnjBgjAA0nA9I2OffOCT7Lhd3dr52kmHWnf7ad6+I0tE4UabvTxn4ylI62q+VT+S0um+7bajNGvF3q9A8oc2gioxl8HMu5IZ1Hmnt8enrg8CPAuVa1WUvaCuFzfkKnVSkiNkxCKyWJrThdzkTFqJlQdA55DRG1QXqL02dBQdXdnn80jeawXnahErQMGN0LEh/Ytbev8TeR6d8SGmG4OnUtcVG39sq0hQHXpotFowOW5+/P+XOXvbUhlSNx8GRsvcvByDqbEerQuSX1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 4/6] CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer support mentions
Date: Thu, 19 Dec 2024 13:23:13 +0200
Message-ID: <20241219112315.2461048-5-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ffc055-fad0-4332-b5d9-08dd201f94b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/eE8bZiKVFMNEkukrSrq4N10Unuyppeuzaix6fJ43ZbfHgTJ2HMvK4+QumGB?=
 =?us-ascii?Q?47fDlOXmES1UFNTm/lRFL0m85tpsz033nuHwpxtQ4BjieYYCrWEMO2ZVx87C?=
 =?us-ascii?Q?AqMfJt9/QPqkBii+fq/0rKhBgOh9JDDQqwGmzejmhb99ej8upz0hDM64cVjV?=
 =?us-ascii?Q?uUr4FDh6tiDLkwxTjs6tQzneAp+2QPc0309dRu+mLWcNH6QXc9na5WreFvV3?=
 =?us-ascii?Q?Q7yA76R4Ri+52DpFWxyzQfsMkJsBeW8enr/dyqzlMkdmY3bL7dDWA8WRFzTK?=
 =?us-ascii?Q?TlYUBKkZQ3su6zoYSp3i3R/KaysI4lUIx1jheyDQ2ApqeDsXRI5Hdv2soY1K?=
 =?us-ascii?Q?2idvHV5fIIiD48wbLXpzvWj/mpoQENIMYmMhw7I6rgxr9VCzk7yBvSYia3v3?=
 =?us-ascii?Q?zP+pmnm18Z7Ij2rVnuf6yg3EtlBOflaJP8gE2Q1DzjJsFPyxfKUlD6x2k1Ic?=
 =?us-ascii?Q?W32Trv5PZBI5bTFva4Zwc5BbgfXVpiXeCTeQkj2OLS9eYFuRA8VeuxLP+RwB?=
 =?us-ascii?Q?YdUER2nLhVtddMNn/VEr7kslTSmmArMrLvA6hXV6t+g6M02ySCxJfmAmZD2n?=
 =?us-ascii?Q?QtCpUzFv2HDsqE58z7BlLRiKsKnv/paZVO2IsecZvPmg5Z4Yt1GK9tqx3LOz?=
 =?us-ascii?Q?qjoUnAVCFm+Lkzz7oJeS+pdNDtMZvNQ9+uWq4DHpiiKqgxGYkonwXd1VbNrf?=
 =?us-ascii?Q?lMBbGno8ILqc+I4Y6TiKUqjeNaovd/AqUlDlv+GNge5gyg7IEML3Ir4tCDcA?=
 =?us-ascii?Q?QnbfYABCQK37DKqQkrnEn6akjpRgAyjIIGJ2kogk1PlhgIIh71ZF88AKGiE7?=
 =?us-ascii?Q?gWn3MLKrXYV8sh7xREkOO9Hp6UInxCrSycj3VfMRSw/JP6G8sHY8gCmG9qgG?=
 =?us-ascii?Q?DknL3WoGdwz/WYoaetHwPGvRhLCpZxxWxJlGCrZfzEr7Du5uWPOCD05EQTSM?=
 =?us-ascii?Q?0VtK1DUoNjYqPrpNZoQ73MrrlxbTnFnqbyF28tTDWsxEL3pkVsea+tbrU63e?=
 =?us-ascii?Q?EgdKS2SNAc/HX3JKHm8xLa4mNG3V5BziByJqNl3flLKxm8wV7Hngh6AGeoPM?=
 =?us-ascii?Q?B+7W1WTqbARctAmWHFli3HZT1xO68QD3SMokKzj59mZ8ZQDB6AmYF5MJWfP0?=
 =?us-ascii?Q?3gWosdTUIvKbrXbpNgYFogTDRg/OrlUVzbUNrg48MYfXby8hA00uMe+7NIIQ?=
 =?us-ascii?Q?vOoZdR95uoE7NdJiVpoWKVx0/vdyuDo+wkHxs6vlrQ+u+Tfxg31P7+IEuloq?=
 =?us-ascii?Q?AmXEFhcH7WMt5E93PwwNDbIo2TOva3YN9jraE2gR5NJ2k1Q0ORmRgOA2FB9t?=
 =?us-ascii?Q?Fv83a1D610/0ff6MqCw5cUapVCPsWjQSuXWTDe/UmEQU/ekMZcelqibfnH75?=
 =?us-ascii?Q?RUr30wW9FVTmF7sVlNQ02qkiXZCl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AGutJgO7Gf+eqtnufWV3vVyZYA3+TZ4h6QTxt4/AtKKFn4argOgNYY8RZhrX?=
 =?us-ascii?Q?sknlHqcv7MeUNadMJcUL56Yzge99tk4lVSAInoGnAUXWE9xkff7/dI3nCyIf?=
 =?us-ascii?Q?+KAxLp3HGkMtARRMffeoRhMIh3KARh522uoKyh75LH4XMUROFyQVTPa9DQQd?=
 =?us-ascii?Q?sARolK+UDM6yIAaM6NCastq0UHtJizakP0UmU6pjjKjpAJ5GkaO1fwjfAP43?=
 =?us-ascii?Q?EaaJ9XS9GwuwZAyazLFWBEsC034hqZdsfpvQ8v9Lfni9pGlEyegmMR5bFknI?=
 =?us-ascii?Q?Md5/cVuZfO7RrM71RPfg27O70YX7JCwY/mJPV90vP9GpfOzowM5NiPSvq2tL?=
 =?us-ascii?Q?B2rWaJiUFPRJ78c5NSSoQfpHfxiBbhhP/lzXRADPnLjG4gXTdKjETfRbv+Q1?=
 =?us-ascii?Q?BrzUWuHx7zquaXPY0kXZbTpaQtWjFevaVemy+hyVr7CqZZ0h6N+KA6vAPHMZ?=
 =?us-ascii?Q?dYArXqpWnHzX+U8P1dmLxmsW8lv3Mu2bnkVHdR9HBlzowWoPyYs1KgUnROQ1?=
 =?us-ascii?Q?NSS2SKgp9J+3jz2HDLaqj3RG0p1iwd9eIL1lgIfvpkDLRiPPx4jx6pGpYC7D?=
 =?us-ascii?Q?Ohz+zQn80SRmm34sbNfWFfjSMpwyqSTZlHCCC51ZI9E4nQY3RrtM1a/d2k2F?=
 =?us-ascii?Q?uT+jvfuIUBbCJhI8QwefkqTOu1rE45fN98drrV8tnf0yb7zdsVnUg0u7uMfL?=
 =?us-ascii?Q?y0EunkzZsLhkMytu+jbGIh8vkfkQMRm/cgyviBzubJBlVXuIjsyjF38Yt16A?=
 =?us-ascii?Q?89Zkp5Zbq0aO6hYqVQJZM0ZSbdPLoreqEQZAfZVmgXs6dizuumAV8J+EBBms?=
 =?us-ascii?Q?VrliKVahEdhKEXLvQkcntzBtnFlq/xanuhDwG5nExGRdlNfATpGSgpPbY0tp?=
 =?us-ascii?Q?Rcphe7OEvvzSwvL0TLTEPVj3xLavpCfLS/lwwDVEEj1Mhr2onD9tySUSftki?=
 =?us-ascii?Q?rSPZUTWEaitEYm6xP528XYHKB1MwbyI6imWYGqy9lF0QmSY9iXyJYzyUFvOU?=
 =?us-ascii?Q?SohZw88ycoIIy/Cy6PJjYwsESdzUv4H6jbdXhiy82Hj6KFU1IapmAhm7jxZi?=
 =?us-ascii?Q?4cXKzfL3LhDZ5YfDYmYClaRubhhQbYnYexUrtivFLrTCsZxzezw6E6hlju1V?=
 =?us-ascii?Q?Qs9yYeFu3X5kMydsAus/C/MeV2j/hr+Rd3K13+xybl0js+Er0T61AG84xzQy?=
 =?us-ascii?Q?3CBytvgsgeth54xJ+OOmRK6kb/VNzKJJSn+GZVdchkYbLoppcFk5vuSGf14c?=
 =?us-ascii?Q?MkNDk8Nt6Dtrad5I/6V9OUJzwiSap3KJSQ0JiQeTaWWm7wOVidiy1GOwE+jq?=
 =?us-ascii?Q?Ev5uVDQl5STcWb+Pk/AZUYBDDY4gZKgoaCkwvHJy3Bhi8JkkgFeP4GyI9GiK?=
 =?us-ascii?Q?HyVJQXE3aZHXMpsc5HSN0Ivqg8UgY3Zo4kauUbsLG6wNMfRBzXvgrJSdjERp?=
 =?us-ascii?Q?KUJWLheIs0vS5RWVRSgwFmvfFjBoPUb9DqH7LKSfU2diRlA0CaYFCDxQj8rV?=
 =?us-ascii?Q?I7OSz5lVHQB2zgAoZsWh8oTvtm7stVL93Ncw83RStiVmO7xZl4P0dJR6o50P?=
 =?us-ascii?Q?q10TJcwdRRZdfmg8/hzp7LPRicgpnWXiCm/Z8Ii9B04jPbnF5JLFXHqJehj+?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ffc055-fad0-4332-b5d9-08dd201f94b4
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:36.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kmqnwft7PDrExYmMotRhpKZdWMMZmPlB2cMsQPPYJLsw4B+8Ftc5YIAUrxWTFP7+b0RfJp/rBjTpWATizhFTJX3TjGl/qh6JPgFfQfdjclo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


