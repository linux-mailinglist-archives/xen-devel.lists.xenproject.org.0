Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6E5BA75D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 09:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407826.650463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ5dV-0003FE-5J; Fri, 16 Sep 2022 07:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407826.650463; Fri, 16 Sep 2022 07:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ5dV-0003DR-22; Fri, 16 Sep 2022 07:19:41 +0000
Received: by outflank-mailman (input) for mailman id 407826;
 Fri, 16 Sep 2022 07:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnJL=ZT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oZ5dT-0003DL-Qk
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 07:19:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc5f38c-358f-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 09:19:37 +0200 (CEST)
Received: from BN9PR03CA0963.namprd03.prod.outlook.com (2603:10b6:408:109::8)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 07:19:33 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::92) by BN9PR03CA0963.outlook.office365.com
 (2603:10b6:408:109::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16 via Frontend
 Transport; Fri, 16 Sep 2022 07:19:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 07:19:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 16 Sep
 2022 02:19:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 16 Sep
 2022 00:19:30 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 16 Sep 2022 02:19:29 -0500
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
X-Inumbo-ID: ebc5f38c-358f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae6mqHZ1OaZnbTRYxcaRiCnSyH+5gleKA/iQPEkRFpnrPC3JcX6YMDXe4wcLfZCBjlKkJxoNkZlvTGezBHqJuTQUyo/at/42gy66YYHutcx6UtTLgYVERnrcIgeI8maIbP3msECwFjynCeHP754II2CrBXYbhb567NrV2SNsDhcmgXxlD3CPYv+ZqFHdPJ5Tn4QtsSOpDZ7bO+gifX9pM0/gN/Nj7I+u8l1EgbXVck7QIymc6Pf4M9qwLykZKqkA4CSqYVs2cpOxI4eT9uxoosuvvfiYGbZp2RXzsN/xGhoSU9v3Kv6y2MS9H8Myph9EscIIt4mLfTNV8iOPaQM2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYLwhphNxjPniBivxpg6SChjQHPi6Sajt8Scuh1Scvc=;
 b=HLyY97+MIGXBYpbTf3yrrfQRRrw3d5woLKM4oRMfDGGK9ILWUUINrNsxKxc2nUvIlbGxj0FpDDoY6j2axo+0GDGw1wKkxhzyK5s6By5fsCELCjaMuyYBgebvAcJI3BHVGEjkuIsNZNg8h+2L2YTG68UdOTAt0DePKuD4wNf+svCbzx0vELekIMrlMM0AIPxITApbgkTdPXsXLJN6Zo+UaRrIG/oFeYSN7lelr7Js/W956Aw0VvRdDxFTvIPrJllZrt1iFXszZnDxOiDlW36PY0jqjBlMtG7J0oPVKgcbsoYxAd+GjVNWlZ9Y56SLhS+9+QRD6DCRzbs0XMF0z9rWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYLwhphNxjPniBivxpg6SChjQHPi6Sajt8Scuh1Scvc=;
 b=LhpaK3TGNsLVhAsbDX2ePhnZVoW7JGoMyuHn21Gk27SENrd15xUW/8nNnnh8sN2zdEDUhwhmk7nbElNp27Kv41WgmoGzqyNOYn+ihE1BrGBnmthuF9V9Ep0ytPQbA7ymVb0Fq1AWvlZvb2O+hJR2oxe47/J9mG4EpfntalDSW/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [for-4.17] xen/arm: domain_build: Do not use dprintk unconditionally
Date: Fri, 16 Sep 2022 09:19:20 +0200
Message-ID: <20220916071920.8287-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: fec4159c-159b-47cc-3b88-08da97b3cd61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JJuPHNqA1AC66kn8GhAndLPcM/o8WusngN26ywQRJ9dOh0Xv3eTyINUnaP+X5NH6SjEzOUVxe2ayVsidyMsGes3EKKlMpkNT+kJzaZpvILYxGuTfLCfEonQXQrWAXtR+yjt0M5y2MhqUs8gDHTSD4L9l7nE/HI4KUC1M+dGWCd+H4q+LbgFQYFPe3XWWPudc5buBF0MV2xe7cclZKppKrJXZ3H8jV3ker1Tue4f88Xp9/3YD5rqn+Fe9oht9rVqL2bFtyRTQVsqbCkB71Gz8mOnxBfWj07ocLVZjC6HAX4h7zk+bovNJNrkVkLO8G849zJ44mE/BWSZvOrVkjWQ4W2yMkjToBoXSt/XD65xzJTZRPJUQRruzydLv/eKoXFYBPmomoXzkpT7u8ZX5/h2sCB9EvlN7f8jn3vMJmhCLrNDB5dci6E01yKPW0+JMU8vXzJcQ+nPXKvskos8ITuPaKdZcHuF+38jzv6m8Qmuu7/m40AAPvFh27mX0mE6xYJcv3G4utDoOClOCd3dY0B2aOYJFtBCVLTQVNBQ7oefNsJt8ZHEqnddstmr32mSIpft9xVFqXKd9fIIlcBvkbY1EK8NOR3rOyBZ/QaX59eyPsSqXXCPd5OoJn1+5guy6l8pu6yLFiHsIhgvxcRJ4pSeEpwqDDXT1PVPN5qpZiFrjf54zcTgyldcyV1Kl/+ah5vojRnQ/gwZf81ennRxOju1mLiloz17Shl5tySDy200Hu1Y6hFoO73TiTeSeNOI8ihHEU8Pzzf3ZiOgKk8zeHq31VAbH/fRAZz3mP3DTyYTcPWX0fYkfz6AghaVtzRUO+gwq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(2906002)(356005)(5660300002)(44832011)(40460700003)(82740400003)(1076003)(186003)(336012)(2616005)(83380400001)(478600001)(82310400005)(26005)(41300700001)(6666004)(40480700001)(8936002)(8676002)(86362001)(36756003)(70206006)(4326008)(70586007)(54906003)(426003)(316002)(6916009)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 07:19:32.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec4159c-159b-47cc-3b88-08da97b3cd61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074

Using dprintk results in printing additionally file name and line
number. This is something we do not want when printing regular
information unconditionally as it looks like as if there was some issue.
It also makes the logging inconsistent.

Fix this by switching to printk because this information may also be
helpful on the release builds (it would still require setting loglvl to
"info" or lower level).

Fixes: 5597f32f409c ("xen/arm: assign static shared memory to the default owner dom_io")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Rationale for taking this patch for 4.17:
Current code results in an abnormal behavior [1] and was introduced by
the 4.17 feature (static shared memory). Even though it can only be seen
on a debug build, it should be fixed now so that we have a consistent
behavior across all the logs.

[1]:
(XEN) arch/arm/domain_build.c:847: d0: allocate static shared memory BANK 0x00000070000000-0x00000080000000.
---
 xen/arch/arm/domain_build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 01c2aaccd82d..f47e77876a25 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -844,9 +844,9 @@ static int __init assign_shared_memory(struct domain *d,
     unsigned long nr_pages, nr_borrowers, i;
     struct page_info *page;
 
-    dprintk(XENLOG_INFO,
-            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-            d, pbase, pbase + psize);
+    printk(XENLOG_INFO
+           "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
+           d, pbase, pbase + psize);
 
     smfn = acquire_shared_memory_bank(d, pbase, psize);
     if ( mfn_eq(smfn, INVALID_MFN) )
-- 
2.25.1


