Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F698A10C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807258.1218655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsU-0002PZ-IP; Mon, 30 Sep 2024 11:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807258.1218655; Mon, 30 Sep 2024 11:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsU-0002Ji-Dd; Mon, 30 Sep 2024 11:47:46 +0000
Received: by outflank-mailman (input) for mailman id 807258;
 Mon, 30 Sep 2024 11:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsS-0001MH-IH
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8b2cc8-7f21-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:47:43 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:38 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:38 +0000
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
X-Inumbo-ID: cd8b2cc8-7f21-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKkosaMA/kJDreAGgwdGmI0GSwtX4LXax79OMYcWvCt4Rsx75kOZFObvAiSz+s0Yk54C84U/vu3e5teOHEBjByoHl7eb8aHDze9kN9gm3AL4nuzOiBBhDxXNS1a6UjslOkST7sg9zLTlqlP/92otFsueDOBM9vBebpzzCxTND9go8/+ER3QuyBri3xVbUZSETmlXguIoEO6Aa+4ykq6VneA7qfVGvikODxUeDSFD0Czaqx6iwBcsxdHVE4q+FN8EC+EVeTWrgsj/iazaIVKP+ccMePjGmFrdzipe/sb3fqOvI2hEYRlylpwMWplzZagUurx4kHr9we0HQlyBo8LOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAMtW9aCVAKuBr/JchwN2dClQ0hPHo9johIwHXDxqOE=;
 b=H+G6FhkD8YCrK5oYWBAVOd5nfXTH72wI6UxBdcWGDJMI4nRXX1j1aXG2x6vnh0km/Raur3OvwH7+D3+QA9QGSQ5kU0Hj6rwmP/ut0s/cye1sE3nc36SsERfO5UZGKWN2CUNiM20X6syrB7lnocXNFk5hWch6jvj+hzEexErYIKm66cG7ARagyiscrlaKJh9gYBF9PfUeHFtl9z1VyQqbQjumyWkckPSIYx8KLLZc0Ah3Lx/YLV7i4rCGGFLh2usJAt1muuUSarW2I1fY+d0C/BG7lqtDpDCjO1OyT4R3WMa8NsCbdx3LKqj3v6YAknAxh8IRYsFGIjIx0ARwU8gHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAMtW9aCVAKuBr/JchwN2dClQ0hPHo9johIwHXDxqOE=;
 b=uds+9idW+9q47aAcB0On0ocnmBCQ1qm3f5cOgr9NLpZRM4FX5nSt9lyxkx/xz8OyJUTGmEYFSclvoJ4ujG7/qPaFjoek+ZsjTBYBO8zYDcRa6yBNDcZjfC2x5lAdA1bQGi2hHxnUylbWYXIM8iFkVCoibPz6/EdlxUSS11xVpaweRvL9pJBPllnuGU7HQwXzUsrlqJi+mholkMF56UDO74E/fDlNfWVtNB6uuP3rcTDRxunM4ztc8wv0yE8+39xCCtCKfDl3w0G8SotcCUmdIfP7AFOasgX1Xxc8HdNjI9E0yg3rZOSk8CzFZ1PSEWm5J/6pbTOrfiryJJYxt0Ie1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 8/8] MAINTAINERS: Add myself as maintainer for NXP S32CC
Date: Mon, 30 Sep 2024 14:47:14 +0300
Message-ID: <20240930114715.642978-9-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: f4588e87-8720-4935-825f-08dce145aefb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CcZTXaQE8111vEFCMu6GV45DMaHw9CPFQGIMnJ3ygCBc19W0k8LZLQUY/VDC?=
 =?us-ascii?Q?MS/+oHMoyVjM0utEt4GYvwLkltWRsdlASHFIll5pyb/FbKLkKIl9HUhhQcZT?=
 =?us-ascii?Q?YMXG2FXkS2LhO9YaTMK1waGqF03UC67K2rxN29qIysDUadrD8m8wgRebCWhC?=
 =?us-ascii?Q?CLQ1NaD9UzOmoxdLopkaZYr1//s2/Cw++0y4TuOmGkO310AmQTW7Hv+6mCyE?=
 =?us-ascii?Q?jN/mk6sm1/MeKBcBW7QbOTWPTQJFfuVWDVhR++4LMHtB1i5YRRBgy/uUV21X?=
 =?us-ascii?Q?athzsTh5/fM+bo8Zcvp4xI52RB1wY8qnDZXJhw18nvsGoGqeVr9V150T5aS5?=
 =?us-ascii?Q?ylDvK+T56NK+BvoecdvFNHkIdWmf0Kp8MVzPXZiTYm6+en2B8t8B3NypBpq5?=
 =?us-ascii?Q?7UNW3ymPTVcTj5AC+f7rjVDb7U5oHfWg7zr6xDrQ001SiinRmqAlkR/iU657?=
 =?us-ascii?Q?x4Fb7e+ulLh25DF2NzUleeBCdTTg9MYCskJg4yaQZGahCPlsGdMk9XsMcmxD?=
 =?us-ascii?Q?sa2LvzU2IIWp/FbWgvRofJSr/vrXM2UfkdpFniuWhpFeQ0V1uPii0Xvh8FWS?=
 =?us-ascii?Q?YYhEvWf8jMQq3WHPK7+84/t3dIt7xIUJ204WeOON8GjKZSVy7IIH/x0vbypA?=
 =?us-ascii?Q?IvNNQQnxs0jtWwxvfb8UYTY+wI5gqfkkqO6B4QhSqP1FdDOH6Kyt/4iZheLa?=
 =?us-ascii?Q?EA2LVz+Z90BV7n0w+UwH/By3aUgZv52/lbom/N131nf8yJCzfxZrfDyvMk3C?=
 =?us-ascii?Q?sxlOSSSaq52Of/yu1WMsS+s5IxZ94fJIGoQb1qmc/NnUpMb6FVruy3ZBwjKp?=
 =?us-ascii?Q?bx16pGpQIBNaCfz9eQB/9deB2P7HPuL9yF3mZIrHtWT2UVlAYRSIp10lmzS2?=
 =?us-ascii?Q?YyG/DiUDoP9rBl35P2b2XMjSJJcnpO5FIP1JSZChgj3QD75A42sZkF5oLlXn?=
 =?us-ascii?Q?NUEucSfBKy4poKw2bC0tGdYEGk6DHqOV6m74RUicMB02XbF2QafnFtRMiZf1?=
 =?us-ascii?Q?7PsyhnWhiC7eZTVfIzqZ3i5k9Bu8MkglNOAIrWoYOmau58er6kFZq9eWgzkA?=
 =?us-ascii?Q?SaueizYuIb/YKn7p+y1EbyO8jP5qNsRtoM7iy5uWAMqdG/65oFKJGmhnPBnI?=
 =?us-ascii?Q?2bGVcCNcrMevXb/SaP0clJqX4IoMFn1ss3j9cuVo3IvmC0f5e3qSjKChp0L7?=
 =?us-ascii?Q?Kvg9vl+elA+Xqw3gQJRq+sBonlrw9WFtbWemCJWeABohkn4T9zQ0Am5phjF+?=
 =?us-ascii?Q?PrUyjPtlFgTNn0NCqiCKuhbSq6UsH9DsvQhgrqhS9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tz6H8dh1oktjji1ch/sB/8ltntC8bl9kZ6hiKnjRlmLKKIPcqgKFX4ZiVdA2?=
 =?us-ascii?Q?xAt1k0jW9XLDVLPmq52lIdKmgtMWR6R9vsO0F80NAGLMHynNjVIfQyyF7pB+?=
 =?us-ascii?Q?RusFFaPlfkopKbu6X8on56M0IPE7AnNB0bKEWbXw1/ZDtIAhr3+LXuJ2u7zh?=
 =?us-ascii?Q?hS3M5FwJzkuC7TqF8dffdRlJoSW01CbRMcxJfb/zlxlvcUP96SlfJx6vX5HU?=
 =?us-ascii?Q?sAzZnia0H8eWDKha/tZLgHL/0vhZ/dDc0L5TcIu490E01Ymmp5hAzA97aol8?=
 =?us-ascii?Q?kQ0/6etY3S+cTr7Txd4iduIRsIed9GQ1Wd8jnCns1n/E9gR1LqzM5bZajzTn?=
 =?us-ascii?Q?pkdduV8ihT4O1CUHEtRqewTBerOTfD8hrP3rNLPpINj+uQ9ILd7HW7jo45Ir?=
 =?us-ascii?Q?OqgdCT6Zjh4FWgfWDDTk7Tq+ZkPeWB9jijiltrkyKZnDbrwP2ZtembwHSgk3?=
 =?us-ascii?Q?lArHd2LYv5RDsEE5weDOjnDFh3ddKP1dMZFbwbPm5382MDNN483yXR1EjYDu?=
 =?us-ascii?Q?d4E2+9FWKmyzWN+3TKJrzq+zdv3z0a8RGK05KGmjuGbUaU0SR4+1SvFuD34+?=
 =?us-ascii?Q?vmwMuqhpupqIZLiwX1J8P+79JxY4Jw8/nojTftdnLtS7SfGfkosAtjBph22W?=
 =?us-ascii?Q?MElk+Te1rXGFiSxMKYXXx83K7Bnq6aPJUcKVBoMgKEm2eWY/ZxB73XWDK317?=
 =?us-ascii?Q?sNaDfajpN/QyiF9Ny0ScVGayIJ7A1UXBNfNqjs30/RMrLfj6XDcPwml7LkNZ?=
 =?us-ascii?Q?4giMyeNEaa10QHh3WAhF3EXduyxJeFWbmkFE0CDYiEbyDiO+thSy1ab2yS+C?=
 =?us-ascii?Q?sGwpp7Lvo9RC631UwN9mTcJkXLH4XT56yeMDaEAOMaiML8r0tfAsEijuMpoC?=
 =?us-ascii?Q?caJhfr4Fbg/S7ZBBkMzgK0qB7kqebRLuDjO2QGQiOQ+NnO84uVdRJqZ7nnjY?=
 =?us-ascii?Q?LY6dqB65YGD7Ez9IsrvWvgpOQ0Za1Hr9iQ8+VOss0gTEUIZaOFHoG4JAHyIs?=
 =?us-ascii?Q?34oPVqVcrHgGJ3Akrcs+7SF7N++PooVnPy7013Yr7lq4wTDLKR4kM/NTa1r2?=
 =?us-ascii?Q?HClvHfjOv6TSgruobxwpNzPdDgjoSvdNmEWodysKc0PsCwdR6//gTBQqRoLp?=
 =?us-ascii?Q?/pmqSL6Sd7HONrVLlbxMQd1kZSRI8sJiYbXXaYYflP+WGC5yPGAtlgB9HCLM?=
 =?us-ascii?Q?Qtl9HlnM8sLpZoH3kqR+4f1UcD4RJKYe03z8PD/P0rVdNAaQSIpos9/lv10Z?=
 =?us-ascii?Q?c7wN4RlKOcOOYVlH+keaKxHTUanwi2Me0mDjyMAfxBkFPIJO1wHwPzqaxzdU?=
 =?us-ascii?Q?fpgwzoHbyppG4ADx6gT1nsmDHMf8v6KKksw/X5IoEoNUY3SehHEQZ6LY6VNY?=
 =?us-ascii?Q?pvRbBjFZ0Ubgl5i6CfbVqsdYvPK7rRzh9KWNVa3uk5UWXxnxYgQvtx0VnxpZ?=
 =?us-ascii?Q?U6F7r36uga1wFl0t7dSBTjonoqfW8iXA7Ggk3fOd+ctvw4zqS2R6eVM4VoQw?=
 =?us-ascii?Q?7UYpK1uVzikzv2CXndTNfLYPPKX9OQfppxCLbil18UCTabiTyVHAWY71WBFZ?=
 =?us-ascii?Q?ASSmxZypPV5W67uHXM+eMUkdsSdK6LmAwBStsRVwZRH1XtuzFn8X1eeYsVIV?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4588e87-8720-4935-825f-08dce145aefb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:38.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mragZ3WhIL3cABBzqPX1fA2I87mhzETkyrzeQUCGhe85Mu9JSsNaUMVqtSpZR+GpCK3yQj566c8+sO9tq9fjj1uToVeXkvKnSIoeKLVr/u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Add myself as maintainer for NXP S32CC SoCs Family,
and the S32 Linux Team as relevant reviewers list.

Also add the linflex-uart.c driver to the list of other
UART drivers in the ARM section.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0ebf0939..2e273a5c78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -249,6 +249,7 @@ F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
 F:	xen/drivers/char/imx-lpuart.c
+F:	xen/drivers/char/linflex-uart.c
 F:	xen/drivers/char/meson-uart.c
 F:	xen/drivers/char/mvebu-uart.c
 F:	xen/drivers/char/omap-uart.c
@@ -428,6 +429,13 @@ L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
 F:	config/MiniOS.mk
 
+NXP S32CC FAMILY SUPPORT
+M:	Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+F:	xen/arch/arm/include/asm/linflex-uart.h
+F:	xen/arch/arm/platforms/s32cc.c
+F:	xen/drivers/char/linflex-uart.c
+
 OCAML TOOLS
 M:	Christian Lindig <christian.lindig@citrix.com>
 M:	David Scott <dave@recoil.org>
-- 
2.45.2


