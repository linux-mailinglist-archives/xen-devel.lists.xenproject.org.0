Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92702573B45
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366873.597791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGf-00037z-S2; Wed, 13 Jul 2022 16:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366873.597791; Wed, 13 Jul 2022 16:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGf-00035O-OA; Wed, 13 Jul 2022 16:31:17 +0000
Received: by outflank-mailman (input) for mailman id 366873;
 Wed, 13 Jul 2022 16:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9THP=XS=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oBfGd-00035D-H4
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:31:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35aef3dd-02c9-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 18:31:13 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 16:31:09 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:31:09 +0000
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
X-Inumbo-ID: 35aef3dd-02c9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhkF1mY16P9ZWJ5u/9a/kH67tB2NkubyXzSrf+ZDF6VsPz36GZUw9ZNAl1rOm+zvw5iCIkRFdvA+PAUqFAPG8cuG+Z3Dr6Pjs6ySmiRem1S0yUJNiietFlrnlY+D6DT31aN6DVa2RmSSPWUqs9X9XJA37poAqLAd6TBIWFNTD7AxS2Q9fJ4euvgHy4lBeqH7wp85ooWYYcGvfwCv+A8LlzDJkE9RQCdwlAPxLVOl3NQmQHvxw5YyO7+FPH7o64Z2ohtoi7Ev4uzvqpBQfFVLpYM5hLcf1j51OWjvlBHsN4xH2A17ti9y4pEfXseFEY8/7CZG4dVTEzHaSQeygqd7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBnG/KHpOC9rWbWx8d1Pz6ZSMmY/aZckRPO5j4SDNSg=;
 b=A1Fmto7gleiaITVmP+rH8HyofyFVyzsBEcPpXsJx2kgQjOsgxWn2JX2sat31eu07I4XcrS1wYOgF79hGW0Cxn2P4bs8jNQoegZTH0U9UUv00vV5Ijnd1IC74+EAPirnJ2kv6fVp0+CSX2hMremMkINn/rag9NCWbsk0ySThCfS8DEXCJIYSm3CYELVuofpnoDd1Vyb5e+THBS8mgFBPYkxpQA4yOcoCD/uBfWcXc46mdkOLxBybi7yZ4dYm14Yp8fsC+0z+FyNrEosNNColvQm2knHBc/VNaNIcZ4qUABAtKAet6NWUEXnQfTuHMsd3cmVo1HPJvWd6ba8nqXsHeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBnG/KHpOC9rWbWx8d1Pz6ZSMmY/aZckRPO5j4SDNSg=;
 b=cE74XqLtp1wPu+dr9yzIzZkXj1bdF5pEE430gAqDFGhKi9uHCBliu/zuEymOiv2AIGnk/3wcWDwVSn07hOX0x/TBfajAhQ+6xluorChIo/QTSgveaSCd0CObYTpSYO4L3nOeyITIg0GDmtUEJq4Eg+nd/+7dyLVOTd5l86T3Hz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v3 0/3] Add extra ImageBuilder features
Date: Wed, 13 Jul 2022 19:30:41 +0300
Message-Id: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::35) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11ef1fc1-f347-4df5-b834-08da64ed1755
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DV0lJdSem15GE/PUHJ0ruAXExDyHAZRhn4JF611DAz0KCd0CvM6mzbWNpaRfq1Srd4rpj/uRIp1algXkD+pLPfK80XzBjENg9CsFY302t5M76GArK4qQVc/M8wo92wK4NjY6BdG/X2YBWuOJwk8ROTO+AXXbF5th9XYn+QdJDrvS/Se0h8W5jpOTR8qTSSl7Fx1zXK58Gj1ZfpOWhGdlK9ViQdVzs/WXDNooDoebSg7HJ9IH3uqGM7KoSQdIR4/3PtFyqiwZ8R0snyLJmxAEi7sHY1XSnUPUrFO2k4YPD0qMIUvl8JzKO63vl+WHe+ctfEdLKx9jpP0xad+WPQHmkK7x7WEVFQ4xY0TfAZVXuy8Nd/coDtNHMT2UZOtbSw2+6J1O1x9saSyM35ThKgsS+ziECPT89u0hSWn+0zQEccMpolJXzYYJPlPDuM/JvnTDVuct2nInE1U2vB2LKo5xI0K19pfAwM5Xy/ruuNyysArCtD7XQUrbhawV/gbhcxZgITCT+o9D/CoZWZflcjdAViGj3dTKF0ln3m8fWlgWIbOByma3Ia6z9BG34MZ4R0fBNoqZCQtReX0p2tGbpGHpJksiLdGzMoa1xaEbUN2wnpB5t9kn3kIlk3W27ctREN4pVmTB1JrXCHb1akWztlGzVhM5wLSpqH3Dls47imq7D817LSrbA2M2lAhMf2/o3MpwTlzktWZ6rEIiontgtW1POrj+juDAxwGY+Xh/Ay907QEy0+2N5VsA6qbgOITAgMG5RUnTIWVWiMUx7BZBhlP2af6EtQEmv/i0kVYsUGxF1l/cEwyvlTCNIDRIAQS8c7hF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(83380400001)(86362001)(38350700002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(4744005)(6666004)(41300700001)(6916009)(6506007)(316002)(52116002)(4326008)(66476007)(66556008)(8676002)(66946007)(186003)(6512007)(2906002)(2616005)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yGn+r/zE3JdICcaPJ7Jfu9P8hQ29LiMvJK0XGY6sFdaUQxa6DpWtysaqlurd?=
 =?us-ascii?Q?/QK2YBGLNhBgiJZPOXw2rNKxeBsd9Ksq86a5LBSgOCBQsRnfhNhhozDFV0N/?=
 =?us-ascii?Q?1FSz+9LC2LbIYcuLhBB02QP3I6Zg1zq7/QOwYnYWZ/7b29Z59HYNxIh4O4/J?=
 =?us-ascii?Q?SeqDFAlnjXwsvShtmcxHwPB4O7v8kbl2YvtdaI2x7cXK/XuqvLyd451Rl7Sq?=
 =?us-ascii?Q?yJkxPGpk41395PCIQkGRt6rH6ECcnVy9Xr2u3dGIcvI//rxIpzduEv/xlMFR?=
 =?us-ascii?Q?DUrzXFehcV+OOA2GWP0eCgPArAH9Ap0JgEvDoVHr5CeP8bgbjSuTO4d9JaMs?=
 =?us-ascii?Q?OhyldStYS/L0/MY/6GkmzoOgaB2dOZuQaqbQpekh24J2OqqGxGCOE9sepkAL?=
 =?us-ascii?Q?sjlExEViyFKbZV/yAqrPJLHGk3R7KFBAuAJ7OTgVjjQ2Ubcx8UzilLMHIgwj?=
 =?us-ascii?Q?zFXIUeoxERNYKlP0DJX1RAG3ts8S2wuroYsQZDlNN2sOz+/MePpZWaSvBj5m?=
 =?us-ascii?Q?Ot16PSLAAm4Wc6ZZlPgf7aMQlXWs4FGEsTwW648xCHR7iDyoE7nBolDyp4zE?=
 =?us-ascii?Q?/lNGgZhPEnN5FidR1x25nhwVJpcxYqfCtldxO6uuvuW30lNs+HDeOjjL/7QY?=
 =?us-ascii?Q?AY0A4ukmd0JFRbWysp6w+uB2K6T/+fZhIXOkJLi6eVq3nW1pAlXbABNnW1Mn?=
 =?us-ascii?Q?dGmbgaPT8g793wa/cAZn7sqZrr1SbA8Eiqz5RmbgbM9AHSE3oCZ3p/5RkHa3?=
 =?us-ascii?Q?8dEkOde/yzgYDLl0lFPKX9uEKHoL5ytu+Jq0rahScp6/VsR54hciS3BCcCt1?=
 =?us-ascii?Q?6ENrPyR4o96UtuyJlm5dfEmAkhedBKoG/5EYz+6sJoSiN/xzK+fdpWnQZqJ5?=
 =?us-ascii?Q?WlYbKYWYERu7FAKuNEG7RbAQlEjVGOKO9KKLa4Fa87WuBQYaUivi7uJ8Sz5s?=
 =?us-ascii?Q?eQHhDemWv8yXEXq890Ee7J+BCdrzoeXCTk4CNKBKBP/Hw0bChPhvQlzfl98R?=
 =?us-ascii?Q?4sOkL6MPkXNUOZ4ueXKFC0Wf93jWMCJoBbYJAIQbzA0yopOeVwSLNH1iTajk?=
 =?us-ascii?Q?hft6XNYywNMgtM5nJ8uaZiG9YZVqWsZ0f2WA4igQLt1zVLfXGW+0MS571h7w?=
 =?us-ascii?Q?x5MESKiyafVZPy/SYCi7IbTVZWMnqmTqNv898nab7bMcKlqmu+t4NV20Hc5Y?=
 =?us-ascii?Q?A/8ezo2ALF7PUQeM+hCfrvMZjuiIK6Ti8ifU6wT6lx3hNEqhdPQKWw/B/UOP?=
 =?us-ascii?Q?ODJqbcbiw2OFRWfpa90YWti0jbTCRvw/ark/h3pXLGalurFQg2cZ31r6Ke1y?=
 =?us-ascii?Q?GwNRgDbzB9+07ZoStgQ2H9p7S/4hiN6eVZnwrBUJlXbn1FvUi9mGMA2T3anp?=
 =?us-ascii?Q?EwrJNUQcWO4nEKjlRjCeFteqj0Rkog2Cd0hu9ttZ3F+PJ537BS1t8BPyXgUZ?=
 =?us-ascii?Q?skAXTX52JjsJMWWYIGXS8kw7LFfuOMwoa665zgkCpdsy0pN2TTCarhNl46Iq?=
 =?us-ascii?Q?YUKX8U8LZXuBvesE8eAjkagdAauF6mGaYR3a9DbJNMFUFEGhJ1hc6ajmfXtE?=
 =?us-ascii?Q?kTfr0dkbkYzpcV8UErOaNyj0pQSZ9W5AZKIhMdyWTGlYhRDMXs9iy0DUHleW?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ef1fc1-f347-4df5-b834-08da64ed1755
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 16:31:09.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0z8s0l4TlA/uIxrjCT8d5ODYSpbXmr0XleCqPE6em8srBOu9bqjHzKYh4D9AmmGId0tEPTE2wqmz3/ctSXA5aE6vGVyAHl3+2xGI36x7XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Hello,

This the v3 version for the patches which have not yet been commited.

Changes in v3:
- Dropped the [PATCH v2 1/4] from the previous series since it's already
been commited
- For PATCH 1/3: No changes
- For PATCH 2/3: Dropped the "-a" parameter and instead sourced the name
of the extra commands file from the ImageBuilder config file, from the
APPEND_EXTRA_CMDS variable. Also described it in README.md.
- For PATCH 3/3: Fixed commit message that still mentioned the "-s"
parameter, which was dropped in v2.

Andrei Cherechesu (3):
  uboot-script-gen: Dynamically compute addr and size when loading
    binaries
  uboot-script-gen: Enable appending extra commands to boot script
  uboot-script-gen: Enable not adding boot command to script

 README.md                |  10 ++-
 scripts/uboot-script-gen | 159 +++++++++++++++++++++++++++++++++------
 2 files changed, 145 insertions(+), 24 deletions(-)

-- 
2.35.1


