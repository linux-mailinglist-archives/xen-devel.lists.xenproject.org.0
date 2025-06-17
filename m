Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8550ADDAED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018403.1395299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaVu-00081s-6u; Tue, 17 Jun 2025 17:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018403.1395299; Tue, 17 Jun 2025 17:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaVu-0007zg-44; Tue, 17 Jun 2025 17:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1018403;
 Tue, 17 Jun 2025 17:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LFW=ZA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uRaVt-0007za-6Z
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:54:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1841b3bf-4ba4-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 19:54:22 +0200 (CEST)
Received: from MW4PR04CA0057.namprd04.prod.outlook.com (2603:10b6:303:6a::32)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:54:17 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::e1) by MW4PR04CA0057.outlook.office365.com
 (2603:10b6:303:6a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 17:54:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 17:54:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 12:54:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 12:54:14 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 12:54:13 -0500
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
X-Inumbo-ID: 1841b3bf-4ba4-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCcpXkDdfrjOl4dCUkINYe+EtcUDoE+42/khsPDX4CDfaXQtuNo3cwGYMhbzReTF5SSpjPR4fKnbw/Oaf5n9kTGJrNfCr4toEINiNbAQ/BsNNKqCj+7f2H15l474/7rb8hIjlDO5FfdflI6AQQrvDlxKkREsg/KhJV4VhUi+oCWQW0reTVU5tL/rRpj3o33gIXi49jzhqbYpEWyEZrGkDpLnM8U2UxsZ1nWHb2z75mKUsOam8rNAU2PhblmbQJPB76OwwRx8jpKqdoASeyOoXad4+nriAkwfzCbOVx/6N15FhOtuJOmgsSxHHKufEZRhzYq83k/Z7omh0B40PxKydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbf8WffqeqpYzH93KaXhGWMu3rJ0HjAVyQhb8//6aww=;
 b=Lkc/KLIO4u2XtnfUYMqubgG41m5KJ7VdFRv7ulIKbTedlj6hGYkqF95ogAIw/phMvZuLw45tMK68g/Tt5UgN1FNXux4O9Djk/zoVAYn5KWRf+jIdWxBvic+d0Rs4lWnR14oUTKQGRaVJqoqrpdxiqGa8HGWD2ChwJGEtkcNDItECUTgeCj+DhXXWMw8JEa+eNr7bk3yRuan6lZS3fxkZhS/xiggWzMBz8mKY8oTD8IAfaTB2wU9CUPRkMaAor6yvO/a0Im3medrsKkO5dmXMnxpARI9eYKG30Rz7+2mUddL2xS8VFc08ENxuxvmUDqR2kHpunkGiCJEQ06PC0Jk7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbf8WffqeqpYzH93KaXhGWMu3rJ0HjAVyQhb8//6aww=;
 b=5l9gfwSLjq4YbZYl0xwxPi/8BSgssj4XbAeqrSR0asdZJojEr3/91eB4Rlz6A3IE8UQJUvYmofBoiHRAMB/dFwruYo7m/24xXH4tqT7+5SvZW8oJwo3JH7E6PT/bsYi00v7ehFIaCDxVaj69iK6VqPF38+6v/nIIZ2vnhmvTh1I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 0/2] arm: extended regions fixes
Date: Tue, 17 Jun 2025 13:54:03 -0400
Message-ID: <20250617175411.398083-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: bed19be2-cd01-41a3-1b3f-08ddadc7f9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sp+qlJ5mM1CzrPJFE4kvZJQvWdp8EbwcSbMUs55+ID35gXkdMRWlvN1c8JxM?=
 =?us-ascii?Q?Wy1T2JFB+kbnCzkIH4MldUQDiZcGdQ8QdSnAh9D4hH4ekmkf5Upjlzq0CRKM?=
 =?us-ascii?Q?EilbY5Qn/7EiAHAT6nck2UKzU3ADCWosz9t87iGkHDxGf3P+uk6fPP1SMb25?=
 =?us-ascii?Q?EtgN+iKYtu21TrIcjhnTXa96srevlueLaAtiTGdUBJb0Knde6tiQXioHB5jq?=
 =?us-ascii?Q?rjd5fv7b8b0tIaN6AHJRf+ev+KpDFwV2JlmMRZI5vWihT3bQO1+Jc4zBsZB8?=
 =?us-ascii?Q?jzVjMM6wxstqb4jIEK46INNs8z11nG6fqlNhuo4FRgGPqqcEtBvgM3oI+V55?=
 =?us-ascii?Q?vIU0nyaZRfUbZhZKuQeZryFugEqCXvnIwmUezpuKzzz6R9i0CvqIltyHA4a2?=
 =?us-ascii?Q?tcUTnphUcedcM/XPdj1f/mys3yp7fjOlmD4b72Uw242EJkVV7TSapHyRmL9C?=
 =?us-ascii?Q?P2S5qT/UBow+oNzqrYIOejO/4enMdMsOfI77UgU7wNednYbbExvtLLQhy52r?=
 =?us-ascii?Q?DAI9PhFmcc33zPX0Azrp3TtxEQmlWDzDT0kM6ESRLtag1vzoZepz6GgpysgW?=
 =?us-ascii?Q?0qvFDP6ztdci2q6C3C+w/JzkUANwDr2yLGQv20ByknrrpxSKAbKTNbXLNNRC?=
 =?us-ascii?Q?32+D2jMxuB3mTTMIzZGb/XHM28qIQ0OBbJAaCSW+IuinR8Zfx90+3KTORjgC?=
 =?us-ascii?Q?danHB50L7lyoUZ05yeG3GPP1wvb59HMqQMIkR3es9X+i/EaObYrW6+f6e2lb?=
 =?us-ascii?Q?G2hBei/pjtEX/1ho2Ol3Gxr+6uMVncYB4B1FPdIWMEATN12CDz/ioVygPnDu?=
 =?us-ascii?Q?37yJpP4fFa7jeepMlFb5jtYfy5GGQ/O+o0ywRzCDxhhPL50AIcgMT8GfOwoz?=
 =?us-ascii?Q?lXhp8QdD7ObcPK6fRAs9iaHsNr36433S/S/4V52XRZFDMxxc1hYyaYUuv11N?=
 =?us-ascii?Q?4srMbpQbM802Jd9a8b41BwCWoaRezn5K0+ELspAOczo3KbV/qlhR7ci+zhY4?=
 =?us-ascii?Q?m7XpT/IOvmeYyvWH07nltWPe5dF0ykaohOdl2pdUfN5oJEhvrpKkyfKLOlE5?=
 =?us-ascii?Q?ZV5vv83iQqCAjkAUZdGXdFmtr62njx/ny+lE6bwSLDiKO9I1mrZsmWP2TGJ5?=
 =?us-ascii?Q?5Sba1sSZG11EcQPsRsI8e/PO84Q9YuJiFvSWw0ZOphqLH+OW7vB7YpmSLNA/?=
 =?us-ascii?Q?UJFA1jZauXa3LCCU6LM+3wy9K3FpXqfcQFp/GknNFZP8i2RS01iJuQvTpETy?=
 =?us-ascii?Q?X8YDyc+mlhEnPkNvc83bBsTpMABvAP3zqhU1ZaG0+r6GTT9lkIICihNYvUIS?=
 =?us-ascii?Q?rfL1cpJFXbtL1aDMEov4zfp1rA/ZaZAFZ3hdRFrg3qZkhBpXMA+sfAT3Fnnk?=
 =?us-ascii?Q?aezeY3uwKJbUqaJSRNQqO29979G4SxvcPv8tnZb4WMLre8Pss+1IzyjgR/zj?=
 =?us-ascii?Q?T5BL0u/Vt0Gokp9jyPBuSXS8HB8n0nixbVyyq3oysRWDY06/dWni5mlwHix3?=
 =?us-ascii?Q?LAsUQye6kUtqV70hppReK+HHlMVIG2utvV4G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:54:15.3769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed19be2-cd01-41a3-1b3f-08ddadc7f9a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

v5->v6:
* minor updates - see individual patches

v4->v5:
* see individual patches

v3->v4:
* see individual patches

v2->v3:
* drop committed patches
* add ("xen/arm: exclude xen,reg from direct-map domU extended regions")

v1->v2:
* rebase
* address feedback

Stewart Hildebrand (2):
  xen/arm: exclude xen,reg from direct-map domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c          | 110 +++++++++++++++++++++-----
 xen/arch/arm/domain_build.c           |  80 +++++++++++++++++--
 xen/common/device-tree/domain-build.c |   5 ++
 3 files changed, 171 insertions(+), 24 deletions(-)


base-commit: 14c57887f36937c1deb9eeca852c3a7595d2d0b8
-- 
2.49.0


