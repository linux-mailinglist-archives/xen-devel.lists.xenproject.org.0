Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589CC6B7877
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509253.784688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhue-0007so-A8; Mon, 13 Mar 2023 13:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509253.784688; Mon, 13 Mar 2023 13:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhue-0007qe-72; Mon, 13 Mar 2023 13:08:28 +0000
Received: by outflank-mailman (input) for mailman id 509253;
 Mon, 13 Mar 2023 13:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E75v=7F=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pbhuc-0007qY-MX
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:08:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22a34674-c1a0-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 14:08:25 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:08:20 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:08:20 +0000
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
X-Inumbo-ID: 22a34674-c1a0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExG/uhiTUAJz/Rqp1T6T4IHBH3E4AvGtzF5vV5DAaOO7r2KAZPjuja6ONakMatBCDqY5j6vG1s5Xf0uYx5TstwGHO3kWrk9GnE65PMjWVDa+Ah+r2wqVA6ASq0J4Y7L94pADsJ+vpE5mLR5YGKS5c4qBb9+r0OEyol8h7Q5zj6iV7CebwQh6cscG5UWwtEBFyWyTgq2E1fiI87Mt0hlMsLa9cdpFDHCwBXG+nV6aNfqKPDc6ptnI06fmNAMF+ZBbpQOBC6BpbJZ6fP4wUEm7mHKyysJK6J8zYUsFCaXjnWjEh9ojjy6zyQHLazWG4jfQUQIhNUlkpj4NQqgJimhAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HveRXjE7WkEwWdvVZdbgoST0v0U007njgzyEMA8jgDY=;
 b=FugOCUuQQQw7ByIeE8DpgISAdu0sMQLAVlHjoEVbci7OEJDSVgSJcFffG6BcHvcqTc0hh5ww+YFE4VhnF/R2GgbIxVWn+3NfW/ve04bP1kn+5p9slGtPf3RIPlxB4vtX5sGuWGxU7tNgun8KYuTXfAilCNZaRm81/3FxXDFWL+UFKI1p9eVv/u0V4UXAcqSDJV4Tbq05zCBGP2xUXxvEtktEhWeyRL2SjTQuoNK2fksPU8R+ExzwGPLKgc81ghIsoWnSwFBja+AkMmvLGZ7FX8gPL2gwXxvm8A91rtjD9cGhSHaCB3/DmloPlQx7b8k6LasulTfjqK3zCdW1kPEABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HveRXjE7WkEwWdvVZdbgoST0v0U007njgzyEMA8jgDY=;
 b=GRMS8F0rS6R3cEGakEy4Un9hDDIdSaNAPVXXbCHdWmUjEJLqlNEG+1R39jPjrfDXS8LaTwBvyxZvDk7piPWBaGGA7LqGBkXUpoE/EnoNrrSBnRmkgg6gbvSjeNreNOIDPvwM63J/ylzI/b9ZbXv974L0CCWe8Do3NzmFgIsXIdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	sstabellini@kernel.org,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v3 0/2] Fix ARM Generic Timer interrupt parsing
Date: Mon, 13 Mar 2023 15:08:01 +0200
Message-Id: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0001.eurprd03.prod.outlook.com
 (2603:10a6:208:14::14) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|DU2PR04MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 268d79e0-d8a8-48fd-babe-08db23c40491
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AoK49Kh1Xd34kmOweLjW/vvpZfhT/pql7hGKwHuIxZUMr5NYFAHNLFyIuO92MJSTbmUZqjZcgpbQkPbsqnVVPYhG5ZZTBl5jushnqjEhTH60jHvQnP+pfsXcLzRlrKWj68CPDiN0fUMq4Rl0aAU8bX1q/NLNJh3kMuJEPhSZdakCpsGQpd7zwBIcSkBxuIU4ESwggRY09BV7lRZ8A+V9ZzVb6/fSGGRd+ZrAeUnf+sc9k6AQh+ojHZe9tgzY0tZmIMGkuW/yQOsNbz5U22+ZalGe73LMyCJkEQuIOUX5j28RBHzTUDUKexCIqoC58KffTjAtceqHDBRnb2Q9IQwPkkkpEPzDjmVCz7y2IYlBm+7m1O47jB0/NfvySFsoLTzygjNmLwxmxezXtfip2Tz0A5coIzkXS4QbAOL/+Iamdl0IfiQHKNHnrsk+FSn9rw7ni99C6wu9mlbSDDXPtY8PUS48+MjodeLg4umdaubNITGPeodUhdFWRum7/VifcXA0zC+eiMhcowU96mWAf0fRT2xRa1ZU5JDHXoH76iSSNi+hXPHPWIR9nQ8j9b05jEsPZouWYrWaE7DxIFPA8yZ5cbnCORVPA37l+S0mFvmxng7XmBe1XoZzxVNxbmqx9Ro8xAwODuI9WJrT173kNyvX7ixsE1MCTw/zfr39OXTUQKQ35ZSM+BePmamZ+FbTIunfDrtOXR8cepnAGvbYGNR293WcShaSRk8uWU/4eqhPWqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(2616005)(186003)(6512007)(26005)(1076003)(6506007)(83380400001)(8936002)(6666004)(38100700002)(5660300002)(6486002)(66556008)(66476007)(8676002)(4326008)(52116002)(38350700002)(6916009)(66946007)(41300700001)(2906002)(478600001)(316002)(86362001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YW8+r116Mt6pdAcZU1YOtTW4Q1qTvSa8RdNnZcl7xlsh18NIDYHG4eXYFIlg?=
 =?us-ascii?Q?INNNJTbXHyGIrU8EL/yBYw+VqqqCG7FjEPN0JPM66kNsPwPsKRhlQtZrC5LL?=
 =?us-ascii?Q?Hq0fprJ0pdrJu7VH3XQGmuXgG+yoMZm4pZOl+4NMURFnNfYff9DHI3kikEUM?=
 =?us-ascii?Q?7BOl2p35an3F/4CfaS1oNbbEMiHiTftKNYOJTXdl6XvjgHDYOasw4ma0mwBg?=
 =?us-ascii?Q?pmZNuG19FvutttnZc/hvPn00tvNqK4EkWIxdgJkCDlUCIKQtfL/6Sp2Cu2OX?=
 =?us-ascii?Q?RlMPZDUa0fAkqT9WuSwmMWR6A4rynCRsW9OX1Ns51+lkvifvM6TIMCnn0O64?=
 =?us-ascii?Q?cPqTWar/tb3RJyLGbqflOzjbFiUw+GxQtZYIqBfQ47IuSGsW9vzB/vWYK9uK?=
 =?us-ascii?Q?bFlbJPze8K4+fBGgN41LQpW4Oy6HF+LfOi8DZDH8/tZza7JdIYwwUrawdmOk?=
 =?us-ascii?Q?6EiE/OLKBm8YlgaZJEOkWsHt2l0j/SsYi8PUmjjLWZRXlsnbNKUMKwdmck2y?=
 =?us-ascii?Q?VT8vUn86wH83wOoZ1mbBFnEwtcdagSKZuqvT4dhjgJqUUs6AlKL0rxZ3S429?=
 =?us-ascii?Q?H4hfO9yBbwm+F3RuTFFwHDF7sUQEa67v0LsUzuoZ5AIMPmphrubHAvGujsYv?=
 =?us-ascii?Q?AFjYn0Q8AHCnlbtWwYeC8ttouRHpVlhIrp3RteW+oC6VG4hK/EsWMWmCjzar?=
 =?us-ascii?Q?RXgB37/XCGROT1RRvB8IUSDVWs6awuq1XFA/dGS9ROIEXuxWJ7lf9DF5KSFX?=
 =?us-ascii?Q?iO0NKA6+A0r1bul6UE6Ee/FoSBntpHZub/qfD2x51qkH1Kdy/rv/vT8QcQso?=
 =?us-ascii?Q?eeUuxVoie8FLYIL6e4OkKN6db9tW8Tozeo+r6wxl1hK65DwMURsXGa06KRuX?=
 =?us-ascii?Q?AyuBMGihqH4JC1SXKw5Y7PHwUDjHHybj+DcfK3CwHU5gZ8dzKUYNvVYjBA3l?=
 =?us-ascii?Q?dWfus74AhSgreofgKZsVGoJD/pkcf1gMNds2fjuDH/cHpIcdK+xrelvlMV5Q?=
 =?us-ascii?Q?8D4lXtBZkEByaA2FDo3b4lEJkH85elKhRaTDE5+QTBZM06Ls0ZZcLcGjuy0a?=
 =?us-ascii?Q?lA49J/h84o/0mgtf5my99DaNv2e+Us5g//hHj/At+ES3H84gEqzhVw1OQoIC?=
 =?us-ascii?Q?cHEhnJwi9BNC5EucmTU6RaCgQhqZvHy1GHHDp2I+ygDAMWriFLiZ6gziOSFx?=
 =?us-ascii?Q?uGoLctqKtfd8JpqCNt03dxNwxBNlYti5Kp62qTrn6oH4Ooq3JLelEW49dEfL?=
 =?us-ascii?Q?V/rdfZJ+L1vLlTguUuNyNqG0nToc8QGkd9NhRcSx63BIXuNFq/lCA9b/7ccl?=
 =?us-ascii?Q?mAlIF3LxMGQzqgtyUs3WWF1JoBAtsQsje8t97PVd9jB96gQ1Qi7zhzrSznyq?=
 =?us-ascii?Q?V10jpSdrCwuCTH7kC1f6o4wDxDOUef3o71DdGlR8+Ncl4yvdg6mrV4TjqQqq?=
 =?us-ascii?Q?ANZ+hDMGFMxvoKqvYROpL6j+SmAIB5wdMmEI1KpYkaabaQ/Ht+d93941Xicn?=
 =?us-ascii?Q?EyWTz/cBpuIFD4fwcWMs2wFQBPvbzzCDsbUChisQtGiIUlNVuc81bZu8MpvH?=
 =?us-ascii?Q?5qvft9Hnnl66jNblpzrIC0ZkQ+12O7eEAqIk2r6AX2oKq2DVx4vtb/MWMjmt?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268d79e0-d8a8-48fd-babe-08db23c40491
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:08:20.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLxA04uM3c4FljvPpUtxa6v+W6Md7N+Ezed4ct/H664pU2ZwKzMcpIFeDr2Zx8LsrcdCXVuihFMlJ9tMn6rwG53/UL0dHjQG0qBdJUB/bS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This 2-patch series fixes the parsing of the ARM Generic Timer
interrupts from the device tree.

If the generic timer interrupts order in the DT was different than
the expected order in Xen code, these interrupts would no longer be
correctly parsed and registered by Xen, and would result in boot
failure.

This method with using "interrupt-names" for the generic timer
interrupts instead of having them hardcoded in the DTB in a specific
order is the newer approach already implemented in Linux. Xen did not
have the necessary code for this approach, and it has been implemented
by the means of this patch series.

Functionality should remain the same if "interrupt-names" is not
present in the Generic Timer DTB node of the platform, but the
interrupts should then still be present in the expected "sec-phys",
"phys", "virt", "hyp-phys", "hyp-virt" order. If "interrupt-names"
is present, now it is also correctly handled.

Changes v2->v3:
 - Fixed 2nd commit message to mention that treating 0 as a valid
return for platform_get_irq would lead to a BUG() when trying to
reserve vIRQ being SGI instead of "during vgic_reserve_virq()".
 - Moved timer_irq_names[] in the init_dt_xen_time() function
as it's only used there, and marked it as __initconst and
also as const ptr.

Changes v1->v2:
 - Rebased on latest staging as of 2023-03-09
 - Fixed coding style of comment added in 2nd commit
 - Added to 2nd commit message explanation as to why 0 should
be treated as an error case for platform_get_irq


Andrei Cherechesu (2):
  arch/arm: irq: Add platform_get_irq_byname() implementation
  arch/arm: time: Add support for parsing interrupts by names

 xen/arch/arm/include/asm/irq.h        |  2 ++
 xen/arch/arm/include/asm/time.h       |  3 ++-
 xen/arch/arm/irq.c                    | 14 +++++++++++
 xen/arch/arm/time.c                   | 26 +++++++++++++++++---
 xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
 5 files changed, 46 insertions(+), 34 deletions(-)

-- 
2.35.1


