Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A221598A112
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807257.1218646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsT-00024g-3V; Mon, 30 Sep 2024 11:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807257.1218646; Mon, 30 Sep 2024 11:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsS-000229-Vp; Mon, 30 Sep 2024 11:47:44 +0000
Received: by outflank-mailman (input) for mailman id 807257;
 Mon, 30 Sep 2024 11:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsR-0001MH-5C
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb288b6-7f21-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:47:41 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:37 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:37 +0000
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
X-Inumbo-ID: ccb288b6-7f21-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tzv1q2+Wn2uuctfPBeZCd3JIeORRNAdiUE/eC8dscHteLoeg8bHd1FzuC+ID39cxvIOMNDXOpGhATeQIdJSE4zrE4QYZUqGVBi/P63dsmTR/2/677GzKq2L6XpCUTZjU4aDzV8uz1VEZSJoJVCU+k/jmiaYj5LPHKWyVICsKs/cn42dEUXLKUcc4D71nkdtFxUoQmRevWyjrZs84SutXmcmr7RxC/igVLluy1S24xxIV8TKuN++D9rmN4hyVvHQ5h79sPUwUeR0wne1xbu1PgxPmBjQirWzL8VK2PqSlvtpFDZhMDVT4SMhxsfqmJqnBaUkDyRX99nvodiKF5SaSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQbtAb9hJ3I+OfJY6XZzKHd/XY5t2JBFtgYrBFh+FZM=;
 b=jevIdavlnL9ukievVENE/cntdzcA1Bwhjal4EOP106VFtveqR4BW95UjzUBGbfWfkJ57Ok9TLE0fQyMzFfk7M9TgjzKI8/nMs5fY95JhulvGa3tGi2IqRzdUxiobvgaMqdjosmCw+0HNvCqFFByvZ+r7elo+vu1lqRCrCTFY9tNHy4F6GbutJyVe3VxmPcN8zGvIb0edGTRu7i74Y2IZjA/LoMjSg0xTP/oUs/PKXio6To0d7n3EhnnhVa22EQjVDpsLzjTaALJ5bLypFpJAYMcBU9sriogr3SqxtrewgmcLTykjvaW+UvvfdnvgSK8S5EcHGz689trrBMaqcTtX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQbtAb9hJ3I+OfJY6XZzKHd/XY5t2JBFtgYrBFh+FZM=;
 b=W1qJt+9Ot+nKpGeLaU2mOI8h8CMRLhsJ7SGoZdC5HCJ3JOzsfQr56ZF7bWPwOVWT2QNL9JtyPtOVfh8u/vQlhdrgmL8CTqVEJL5MBOJRGkguPmd/ZAgws634W/2T7fK909Hew9xGXLNf+iY+t4x6ThjGxH5TCFHEWS0LPyBNwCgSOFJy4KIo7Cf9UwOiGSjGLoi8jrdgbnuNrxfSgpFObWaiF3HlcDLUa+5GkvQKdwo9tcYN6dawAu8YBdN5kuSrXetVdZZwm65FLZUukgdb9YjF1G6vfxrQY6DMnZss5u9NlhRdMdixdWGdaEKl+/ub9eloOpCN0akt6spQ/PmSWw==
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
Subject: [PATCH v2 7/8] SUPPORT.md: Describe SCMI-SMC layer feature
Date: Mon, 30 Sep 2024 14:47:13 +0300
Message-ID: <20240930114715.642978-8-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d125378d-9d97-488a-758b-08dce145ae73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gdpuzTTcIZ3OQVraYVQyu45LMVLelITOL5mDbZbJedUinNIDg9idd9r2XU+f?=
 =?us-ascii?Q?YwBAL3Vr4cwxo918tgfBKNksDyy5GnA54SWQDoL5O51WDhwcghN34TnTTO2N?=
 =?us-ascii?Q?EgCXFb3hlkEEtDP78fDi/t8X/hKIir6hKCPI2BloDAI7X5XMd+epGaF5pCDr?=
 =?us-ascii?Q?0fyOAr9J8zzhbFUZoT3uuw6ON34kT4F1vOQwSJM7OfX9+f1KIUHGQafWiz3u?=
 =?us-ascii?Q?8b1Qw8Bd7zIEzTHLS7uVJy4LdXtpMmgu3emmN4s3+6kOSJrJK2TOab5xP6od?=
 =?us-ascii?Q?yoLoU/cGeAkfFe0TR1igxFuG07gLunkJebH6KXxtGUJtRCgQtv23r/spELKt?=
 =?us-ascii?Q?uD+FLgEwDo2+NP0WV5PhZbJKailLwhR8g4NWfaHBA5BpUTrMY8ObO0F+uIR+?=
 =?us-ascii?Q?45b2pxFh+6ULngC0iPF+wdTdccaW90ZYSkoSNBFt06/53c56EpNwDRehXoDN?=
 =?us-ascii?Q?ckbfU7mrckgR7EB7oGK7RmggnObaEZAc/SuSpy/j5rEK/5VaqDjbNWrBHcqX?=
 =?us-ascii?Q?lvXs2VT4seZiPQ1JluKL00h68hOm9sw1Z1Mb2YDyjVukzIEk302sBm/wEFtP?=
 =?us-ascii?Q?7RUfp9uwvqPt8YIicfCMQDu65E+9/EZQPtimO+McnQhOvq1Tw0603YY3Xpy2?=
 =?us-ascii?Q?PPYyFiKXhpKRCvZtlghDMLEAj70C+JAiqByjV++kZnp626+5sNYLeWqbldeu?=
 =?us-ascii?Q?h9qvfAVptn1z59jAcPWWMw7mi9lMMr2+M4tM1NEiUtTyDUaVJ/iVhTXSqCfC?=
 =?us-ascii?Q?q7shNm0+xGF7Px9KxyQD5osNvJCqpSATp206V6J3QMpiimHiLSvtFXqYTha+?=
 =?us-ascii?Q?55Wzyrh2w657Aw69es0ubqKrLqyWO3WvguiS22joz3pwq3I1JoBlL93hZPMA?=
 =?us-ascii?Q?3mOzUJzu4cOkE2lKQ3xMZN/BUKCzglkgTaqcO9kfg7VtcnPGPziTXUJkMfQa?=
 =?us-ascii?Q?TMu+0f8LMmO6GfeHMGd3WQQbgfHTGcntWib7x5DG+HkJJf4rWWSQWNf53ZsN?=
 =?us-ascii?Q?4rmFuaWYw6N2GunE57lGyZ9AgZ5ozJttCxUWDdCsF9oza42ZWP42DOlXWN4G?=
 =?us-ascii?Q?kjcAOxuw6gqIr8laT1FDrM1cqWGpGEy2j+IIvDQ1u1J7BhDRL8AwLKXAp3Do?=
 =?us-ascii?Q?XUzk4XY+VdQ4OK/+BZUM8xhwRzwe4Ytt6e2YPuqucvOZWamo8qE1KFqHs+qL?=
 =?us-ascii?Q?Zllqvs3zRfDCa5uCywZe5J++f3nG2OX8HPXguxCt5Twbc06y1ByGBVbDBhac?=
 =?us-ascii?Q?NBYMuLj03sEXTlWeZRYxcDCPeU9Euml5P5JjVasxz9NXj963Tlcrwd8ZMBLM?=
 =?us-ascii?Q?ZWOP+zJN6u27Zcp2xGGSV3KssQMeP2opN565UG/UtX+5Jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4PKI1b/Yyg6QRmQomUchx+3HWezlUjr+XYJ4ERxnDAkH8yjP2qKo/xDcMZ3S?=
 =?us-ascii?Q?lR3eZeggl2WwnGuLXJ1Ax/QCtn04w4UU5J3XCBtU2X30bZJ+jPxbvpAl6Pu1?=
 =?us-ascii?Q?5MruOaj/Rg9m1t6m1Pro6/K528dWVdp7E0JVJ/9SJ/P3Kt0Gy3qIZHYQYJnh?=
 =?us-ascii?Q?k4lhKWFaxVSbpL8g+0wqkxc/k4dIYR0zDe8+H6U1jRd6wJmXKGcqYssW0ORa?=
 =?us-ascii?Q?a/A+a40CHCGm5mBG9Pen/eS3lJ9cmFnXxBVaA+AZQjdtIKCY5dg2f9SG7rSg?=
 =?us-ascii?Q?4UxMzDxSm4yTnRAX80x8a44E7CpfatiRYPmdZRh702aUDH1Sida+H0D9twIL?=
 =?us-ascii?Q?CvuU2OoJxu+o/oOC7P6eXPTKxTQQgV5VTM6f8A8r2klck/V38BJfe9q2pJk1?=
 =?us-ascii?Q?2+5Zwv32q+JCA7DPVKTDaderB+l4/eiV3VkIwL5fd8uADmpl29XaNlPY9l8r?=
 =?us-ascii?Q?NckftzIk/PHLh7NUS73D4iMoj8DH5VDaT0pDrB30Cg/U6JIm+JE0RfAWLRWn?=
 =?us-ascii?Q?tUpJ0U3jwVAgBj2G97agDgnvGqcnfGewSv5erR5Y5dMCdhMSneGtJaezmiQg?=
 =?us-ascii?Q?oSjq/CFuHsoVHsFVI8OU7Hu7KeRnfWGtnsitYfwk475PAuPCz4gGPl9tiYea?=
 =?us-ascii?Q?7Jm8/nqduv3bchOrpHzqkWHytR0izi1VvT2F8AaogKHjH53D1/Ph49sZo00g?=
 =?us-ascii?Q?uEbGFa67xDDax6BOOPWTGSv9G2ePXR4Njr5dB49XhjYiaPNVrrm+bUN7r2rT?=
 =?us-ascii?Q?qKK9c/qiGR/ji8ORBDSieCCii1dXijZcSGtLOxOZX1AUngSdrW50N+oj6s8u?=
 =?us-ascii?Q?n97Cfi6TvvU2fqAKUslVOZXQBRRm80LBDfW1Pd6jW8N6/rcPhZSa6O82bjnn?=
 =?us-ascii?Q?2lu82MJvYgx3m3NWR3L6d05u6HHX5aojrh3FWBzYjU7ffSp2iqqKFYYkRURy?=
 =?us-ascii?Q?bnQBagjiX/Tx2IjSNHuYhGLVyokQF+fzb0BFs+ixcDspB8r26gdVLqtgmCMb?=
 =?us-ascii?Q?juJbdJaJTwrspnSwcgTGU6+1CLBd4MRqZm8tYs4Q6ss+xIXN/YBWSf/IK/AQ?=
 =?us-ascii?Q?Q+vbjodX+pfpTaoIB+ev/g/jSjYvrvvrnNcr67hTqWV8eHRJPUvpO4BugbAp?=
 =?us-ascii?Q?LuZsJVAMOlF7hf/EVRARN2m21PZ+qrwlf3WEO/Qek1JFlBSbT+4eZbY9KSY3?=
 =?us-ascii?Q?K2olU/zn5POSvNx8O3yV48rzP4PzN6rmVmB7KAZwrAtWprLt8QvlS4BmK2eF?=
 =?us-ascii?Q?juyf9H7AVqxmHmVLHpEb0rKJtN8pf2RBxsYQhYwGXdRv80ssQ7+ic5zBDkJC?=
 =?us-ascii?Q?CdT1yO/guypMT4fKWhm1sZi8Uh7j8TDB4hxIbxiXQ1xKmWl9Txy4QbgfrCG6?=
 =?us-ascii?Q?iq5bJugC7gcbxkn+Rr7XwHl9GEpGuLVomLP39i8jLy8DvyzuPMEJtuYEmwpV?=
 =?us-ascii?Q?SWUpHMuqowwOzpgjAGBqW+8miIopD6ib3YDf/at92wxhsP1PVnLxzY3Ga0Ks?=
 =?us-ascii?Q?OFdbV++arwJoSVBS1Kb7HpfuwjTYLuHdXrykUk3ci+VnD03Chhk4Q4dyttVX?=
 =?us-ascii?Q?zrIPt457EfIr2QXNWhoSM2IVyDDxdtX/iV6932zGGj2Po8lwBbdkC2KLlzWq?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d125378d-9d97-488a-758b-08dce145ae73
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:37.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVcpik/V28ac0rVL3ahx41br1yldpXlLgujK0JbKeTScpx/77nE5WaSSmK0My5TFoV0gOjhP6ufZaY2sTeQriozt9jiJf5lD6tlZJBkOcOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Describe the layer which enables SCMI over SMC calls forwarding
to EL3 FW if issued by Dom0. If the SCMI firmware node is not
found in Dom0's DT during initialization, it fails silently
as it's not mandatory.

The SCMI SMCs trapping at EL2 now lets Dom0 perform SCMI ops for
interacting with system-level resources almost as if it would be
running natively.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 SUPPORT.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 23dd7e6424..d8ffddfc44 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -927,6 +927,14 @@ Add/Remove device tree nodes using a device tree overlay binary (.dtbo).
 
     Status: Tech Preview
 
+### Arm: SCMI over SMC calls forwarding to EL3 Firmware
+
+Enable SCMI calls using SMC as doorbell mechanism and Shared Memory for
+transport ("arm,scmi-smc" compatible only) to reach EL3 Firmware if issued
+by Dom0. Some platforms use SCMI for access to system-level resources.
+
+    Status: Supported
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.45.2


