Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6EF5062EE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 05:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307706.522953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0L-0001Al-7s; Tue, 19 Apr 2022 03:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307706.522953; Tue, 19 Apr 2022 03:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0L-00018v-4N; Tue, 19 Apr 2022 03:58:17 +0000
Received: by outflank-mailman (input) for mailman id 307706;
 Tue, 19 Apr 2022 03:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qar=U5=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ngf0K-00018p-1Q
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 03:58:16 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe07::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd78f53-bf94-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 05:58:13 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2280.eurprd04.prod.outlook.com (2603:10a6:4:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 03:58:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 03:58:08 +0000
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
X-Inumbo-ID: edd78f53-bf94-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms5MPjiKHs/bSApzkHqv1Ogk0aPJb2izRpxIikKp5v4RkBfwANCf4jO03cLaUXDaoI+m/92DUrhHqrUC03/TphhJcbVLFFssDiNGmsNISMSgrzYz7XPgki+aZT2M1egjImXfznuVroJF6RojdbN4BhZN09d7z5hgky6yCB0ffTJ4+cMBeAVer/F/X8JESiZ4nE7rajCPTdDMGVCo2MSFAqD3MfLoc+Ji0ptPNkJwWV0qRQTMVZBR1A59wzI5EfHUkE8CT77tJ+jYl2sEy/rO3nflYxJ4Sl4cRwAIoWKgS2DvF2+b34n2MTDAOIxJ8Ug5sp6SnFc8+Qt9bzp1NK/c0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW+IeDtv+aHj2fsuq/n5j2nV/+ehu+PafuZidkG7D6s=;
 b=P8fdRKT2SP0BW9Y1KK4TaIN//+QyOi4XEje12NY84k6FJ5MP5U/WF1dMcXVpDTYzfjzddCvNafp0RK/TA34oExbvIGHJ1VFuYLleXATe0rAbulC1Mx7OO1TdgM3vuan+F7AsbsvLbi3tPimyqoZuvQW11rd0SqD5FWDlrmYk75bupeeRG32gUo9L5gXLcoXAdyUmqLrd2w0B1bVxtqgfUy1foi94QgAD7KZNHpPhY+9QzegvzghdyoEVF0/zTB9kYtxhw1W5oPYJhsQJ+HqavUhSv0lIQRvFYePP1KO364BXKY6JJAZ8Kv1Y4wRdPSw0RXXSuwQhwHdXTMQlgIBKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW+IeDtv+aHj2fsuq/n5j2nV/+ehu+PafuZidkG7D6s=;
 b=UL3xsmXhqSlKkPZI3hdtFr2BmrUAyRZthIn6K3vZ/4vt3VAnt0vTUluBUQy5KB/+AI2LGN9XVmfbzpQJUxRYlpsiYas/sRzI6bYhS17lcJR5R7s5VHBH/F1nNBkL6R507cfN3++VwsD3Cl3r7kSOgI2wesGltGzrk+LsWaW0qUw=
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
Subject: [PATCH V6 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Tue, 19 Apr 2022 12:39:25 +0800
Message-Id: <20220419043927.23542-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5646a5d4-e64b-4a48-a4e9-08da21b8d061
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2280:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2280189935967ACD6306D75DC9F29@DB6PR0401MB2280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3si1hs+XLkBHZd9JHFoXkZvO96/b82V+lTSE8iXhXEXo5jQK3jwCYnIasrYbXthbxayD6LnUPrKareZfOZXMmcuVhSslqFOT/TKSUVXAZSPsDmHJRwu714Ncc0hY5VrwqeqgijGlj3pSrhMYhq0GTVObytmgUXgRhQ++c7rY1E3UZ8oViiVTzhl6NSGBarxMi1fmaOj+KXTmCFVNekGESXG4GzqUEMCsU4QLGO6qvpraLSBvKzKapCNkrN5AY2R2Gnhk2RgaZ7WAeC+j/wPo+ARveJkYt3TVrB6sOM52CVUuPA6UAl4jfN4WKN8ppfjoVlBzfRO4uSMqjJYCXD9v0LcMCoSMURc7pwWRzj89AT/vbZboAnBGx6FldJV3WMu6r5ustg9CnMQoFKdIY+xCngvo9S2HEJman/gf6GROI74Xi8UwxxjNb6jEdvfo3Koupt9VsU2WAyOaInpOhCbmH/X72giqgrlO2Neoz5D6OIU7udGhKOazcXYlb/wes3NxijC3uMMuI9405VR30VOdultcGBmJxHr20fq4nxQIja4/2LaX4fSBDfYaPTrpFx2THJ6RReWEj4rB5eYt3dxYYISdgfVS7zw6yJzE5wg5J8Xc8oU6EIS6BD+h0c0QoYxjdBCht2mEP2sJB5RuYzqpPNkjRnw5kr9+BUD+mZ7KTDcp4ZBnqgypvW4Gm5l3TYgfgKsnpFAvkDo0VOO03JpGNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(316002)(38100700002)(38350700002)(66556008)(4326008)(8676002)(1076003)(2616005)(86362001)(6486002)(6512007)(508600001)(186003)(26005)(8936002)(5660300002)(7416002)(6506007)(52116002)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9D9fPAE6eq0e5k86EyWY2pQUCxZxt77+J28LPX5NhO/thxauuaQm4QbUneiP?=
 =?us-ascii?Q?vEo34r3dYSg5EaNqqHN7QKYRSRfFe3dSBgXJBZKeUkPYqzERJDr5LNbO6cQ6?=
 =?us-ascii?Q?lPogXjYVRSPzwkdI86WVmKDstpCDZkMLYEy0g8wBKmE9ZeLeyzEgbISUlVVt?=
 =?us-ascii?Q?4ssshZP/l/u3DKbZdGaRUs3uaNfxuJrmx9ezwNti+Y3M8syst9zohakeYBIX?=
 =?us-ascii?Q?oSAq1M7hpD8hao4CGzTpOz/Sagaw9BM0WJEX87TTbUJ/GDM4242Ca2OIuVPW?=
 =?us-ascii?Q?PIdx6vbGeofBjLQXtSqCd0h0F4zj1F1Lmj0l4ECebcwdiDxN0ivqwPE1YtKw?=
 =?us-ascii?Q?1X7kGmTZobMFSY1QCZiZKHiZ/QF7F2NZX/DsxFIFv0bf+sHc+1ZN91PC4t7+?=
 =?us-ascii?Q?GYzaPvy7DESi8Z437CYpNHDyz46qsf81rdNbiuikFP1psA/LwpHn0qXXXvUC?=
 =?us-ascii?Q?v2SOq/g3crzXDuthzjyoNdWxY4j1t8d7Ewf//V7dkURSUiMEU0Fi6SP9RVzR?=
 =?us-ascii?Q?R1HbeSYF4uw9PxpMg5WVAYDcnc3AcASLOsakE8yENffXazpLRPFIy5MPOmJf?=
 =?us-ascii?Q?CJYcL8NuvkVpth1ZaQnuEIM//mTc74msmmMD4SPISLozZs6BY9jJ8lLzAe/M?=
 =?us-ascii?Q?61ImXBRbDTS03xszlq+TCqc2BDIHU49DRCBkAbIt/1OJznl2kgZvxUKMqzHb?=
 =?us-ascii?Q?1RGJ5AJ5OlrFg1PwZo6djmoJm2DUKNWlh+a5eB1n+VV6mE1tjW6CqMpuaZUk?=
 =?us-ascii?Q?PNRIALLUuzuY8iCcu7cfjz2TIyRxTak+pObHW5EilfFocdr16GUMvKwHS9Vg?=
 =?us-ascii?Q?OBId46RYmVH6hlEAwvS9bV/M5uxOYxDjXJ98+ucjRB8xC0xuS/BZfj2ck5kY?=
 =?us-ascii?Q?10tCkOyrg+8KxJq3ksgYIi1+z2xyOUMhHITvA3nUccGhfEsFwSdwNWPeNhNj?=
 =?us-ascii?Q?6PzT+4QubMdlzoTTaveGrdz7lTbQ51Ewq/qHEcyPH2BGpfMn7AXEW3uagNfQ?=
 =?us-ascii?Q?e4KivFl+qjkiMfm4km3r9zizi81rnwhg3vyC48edEmPFzlaSalmVimvRpq/K?=
 =?us-ascii?Q?tdIWXuG4zxlRgFEzmXcQZ48wttXSofE+JXV2h0heJzDueaiP/0h+7bTkBK4c?=
 =?us-ascii?Q?EA9yYUruT3cznSnLCoChG825i03NUmQbgH/RRayGo7M245nnHg2thb8827gU?=
 =?us-ascii?Q?h/brPNMYObnARDXZ5hpbAcrSKY6FcFrk6Hav5+OQYcMyRf1koBznnr6xbz2C?=
 =?us-ascii?Q?6BowPIKEMCVCm9mmTRacD1ObdllLk9rUZv0ighG8FwrU8OCfcVM5kSEYEd67?=
 =?us-ascii?Q?F3QfxhX/WBKCuKE/rmXCLbZvUf8CAjLArPR78d+c04Led05Tgw0FQorPucNW?=
 =?us-ascii?Q?QuXoDU9IEPznwXhjvoEX0p1Tjpt8Hg2pmHfnMmTeagNoKLz8Tz+HTbMhXV33?=
 =?us-ascii?Q?jyg3PmvWyjxr0W1GHIKOmmptspZk/Lpn8b1bQFf4+VMI2OFNqhoNi/82Bah7?=
 =?us-ascii?Q?omw/MGyafQGu8w4urwnGhEJwqFRXLn5jNkYqW96yXhRj+r/wnAhrQaisEMst?=
 =?us-ascii?Q?i/Bzl/fAaD2bI1JRStomuoE0sV06ITThKG3B1JLxYR523YmGGuNEWiuomIX3?=
 =?us-ascii?Q?ENXpLNC0s6cQCOI1xyaBWO1ddpxRR4GgwCtIdIz3r0fBZ5C/85PQ7z+6i9xZ?=
 =?us-ascii?Q?M2JEcHCkhpkPYMUGRuuBzavjimwYhOUU6FOXaDdMTXUBDELMWwZpnH2/uDMH?=
 =?us-ascii?Q?3qbvS2NTmg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5646a5d4-e64b-4a48-a4e9-08da21b8d061
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 03:58:08.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFrm+teSHxIacgwGVLLNPb5x72qWRGu/s/7KW11/0DGK6fcvgwmidvRNLm+RpimduCgPuHokXwpnlDwjnr4TOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2280

From: Peng Fan <peng.fan@nxp.com>

V6:
 Fix a stale variable check per Stefano's comments.

V5:
 Align code
 drop early_uart_init

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
 xen/arch/arm/arm64/debug-imx-lpuart.inc |  48 +++++
 xen/arch/arm/include/asm/imx-lpuart.h   |  64 ++++++
 xen/drivers/char/Kconfig                |   7 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/imx-lpuart.c           | 275 ++++++++++++++++++++++++
 6 files changed, 409 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
 create mode 100644 xen/drivers/char/imx-lpuart.c

-- 
2.35.1


