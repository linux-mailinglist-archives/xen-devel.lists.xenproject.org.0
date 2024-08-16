Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC75953EAD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 03:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778334.1188385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1selKi-00051l-W1; Fri, 16 Aug 2024 01:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778334.1188385; Fri, 16 Aug 2024 01:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1selKi-0004y0-SQ; Fri, 16 Aug 2024 01:00:48 +0000
Received: by outflank-mailman (input) for mailman id 778334;
 Fri, 16 Aug 2024 01:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDq=PP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1selKh-0004Dj-80
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 01:00:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e88::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d348b9-5b6a-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 03:00:44 +0200 (CEST)
Received: from DM6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:5:80::23) by
 PH7PR12MB6936.namprd12.prod.outlook.com (2603:10b6:510:1ba::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.19; Fri, 16 Aug 2024 01:00:37 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:80:cafe::2c) by DM6PR08CA0010.outlook.office365.com
 (2603:10b6:5:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 01:00:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 01:00:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 20:00:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 20:00:36 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 15 Aug 2024 20:00:35 -0500
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
X-Inumbo-ID: f6d348b9-5b6a-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ7MGXkFj7fTIW7P+R/QaAh46jNPY98lwH9mT06oSsUNYWe8JkAiZkwEpzejoV4DooZk1T4KbkXXEAxYTjGXfeSSpF/KGQ/H4wM8kamL3xTb69NNskcazqmmUC2pJsF/24rWGaO46e3+qJlJqGoCV8Af93Gxbry5D/kdaI50tOLXPQd7SAzGH7AxNVdbtTEtqyvXnxCqz/b/2AVg70O8rm7kgh4MPJS60MPB+PgXvBeNbHCT2oRg2MJgHvb/lk8yPqQik5s9hFX3cNFtFgEYtZ8ptWYQRwIcCXteOe0X4o50+JfM6jeZss/bC1iiuGUwxVB7EGLMJcOx03h0eGBPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkbsKAQ/YfMSYzGIs1nV6lSw/u0yO2EDs5ryQTixoJw=;
 b=GN0LSkNwtOsQRPa5RvOnKwqNvGdiiUFVmAqaeQYHvlm8C1e3ILJR+M7Dh4wtGlFB50gJoiDv21yGGb+oYujm6FpPQaWfg9AGPRBRLWo5aiNHLRlt+a9dXqWfiwOksbhfHTJQMJQddA8unbY6QOMa/uYQJuxcuAzuEejqRgSYjZ6/jas4ElFwnisVe4Q0FOqAA+b8rgKWiZ95jfWk6S/oAl7NpWam/AyUE+PmGe7FKr/odUKfKrA+Im2tVDNyWPAOi4LMqf0wPECOjdDCaeDRsvnWS7yXEVkcEGRlzqrsJWN49V2p5lTGTNzhwMyLZJJMTWUZTmqj0sidLdarw8UHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkbsKAQ/YfMSYzGIs1nV6lSw/u0yO2EDs5ryQTixoJw=;
 b=yLmC1NOeu6jvCMJiyrESzybiljmz9cxMQ77Uwu0Uw3eT7dlVKp3TTqszZU8s2jGzFbRouBeRCyNJ52MA5cOLPAbYyP3U1W4VBiQ3HxlmnzHPOxoPOx/HFLchE9ivRyuhcKuSeSkjbhGfEZRgj/Sw7FaK10P5MsvRsJA7FG4KHyw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] automation: add default QEMU_TIMEOUT value if not already set
Date: Thu, 15 Aug 2024 18:00:34 -0700
Message-ID: <20240816010034.2199142-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH7PR12MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: dd87c0d7-ef46-42e0-1df1-08dcbd8ed6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gPbiGwkDS+EvR5EoaDz3/k+CvFRYS3oaqMNujuocYAESG9afbbQgVO25Dv1X?=
 =?us-ascii?Q?AUWfpZQKXy131l+NGQ48EnHOkdVlslBNhh/XpNOI3hbVK9C5ZEiGBnqO1YTO?=
 =?us-ascii?Q?sbPhdAlxLl10sQrmLsPoQzjq4hKJJDr2pOw9iqH0Bn3db+RVR+FGyoxdD9RT?=
 =?us-ascii?Q?HpHfQIQARhGRvOUKcgNntekxCvbK0pC/NE8NJOdhiqATTcIFyZQjSpTT8VuR?=
 =?us-ascii?Q?DHB7qc0uiFWY2p8hVHqdNv7WwUIjKL+YwfGyBop4LTNA00CqQUMsi0hFzBTq?=
 =?us-ascii?Q?Id+nj9NcReH2yGG5/vCeYyfr+mfOHvrlJNQfGISlXcb5AR0OKPJk9tuW4Ejg?=
 =?us-ascii?Q?PSDr0/uI5V+9ta9J2X8i6W6njGG0JG/O0xZDpuZAMHqZkfxt6wkvIjEmI8CX?=
 =?us-ascii?Q?c6EC/UhIGi9i4csIpNXSwJKDRDCxsV5rOWQuoQi2xaJxnx/4dWhRz62USYTv?=
 =?us-ascii?Q?dX2TQQsuXKlbjBVl8pyMAXMqYLJ7DcXBBiSybLGHlVQxqyRK4R6NxDRCJkzl?=
 =?us-ascii?Q?fQx//FnKzeAONSB05VfcQBOIK1QWdHBIEk3x62uBsuRgX1CpXfy5JNYeyHM2?=
 =?us-ascii?Q?smaPgBJn4P3aY0s7o709DU+KLeUlDgmxE99Y988M3hTBEhr38flSam1Pnggx?=
 =?us-ascii?Q?hCPxM1tRFYpOTTeLhIpxpxXG9ffoJ9cAqRmXAPc4O7YeUcTU5TVKoR4jdpj+?=
 =?us-ascii?Q?dE7GxPeiovglaQspvWh5jD2jdDgtN5LZhmrLm9wesLXcCkIGhAss2mG4endT?=
 =?us-ascii?Q?xfKf7s+3m9ERdP+timw+K1If4g5SVRS+f9XDLR9sRwnbPg7blWP5szXEjXWv?=
 =?us-ascii?Q?2X71ljx8dT4UHBTlXkwKppdBgTxLjrsggUMMNHQIpQW2OKssTKUc+S4IqYVg?=
 =?us-ascii?Q?T1S9bnWguo++cu+6TrWee0sJTBZYLZPFgiz4Zsgzjw4Zis22l63SdI9wGpZB?=
 =?us-ascii?Q?OkI/8Q9CYfA5L0NgUfG+kbAfw0rkclOJkPzlwXMAbH+0u2kpVddk68vnKzw4?=
 =?us-ascii?Q?iXFL7OIPZPcAwR09Py/s91e0hSLIMTTcs7OnvHzqgJAohiJGKHtEv1bwcr1d?=
 =?us-ascii?Q?2VNFHTppWlzkvk2GR6OptbA9iLpumJb4iP/AlJ2tAlo6QRT/5GEb2lPMaEQl?=
 =?us-ascii?Q?16FUg9hQ5jHJ0Av5Q7z4BDeL/5GVh38A7F29Xv5U2i1atyo/7qnQAm4tCuzR?=
 =?us-ascii?Q?TUGJtplxOSGWivgb5OO7pBCFyZbSqUcg870lWG8OovMXd2comauhdmpSJJNM?=
 =?us-ascii?Q?xChj3q+LvOgpYq3+yFQpIG2kgpUlur0T8/a9nT0R4lf5hqH3U3hzD2Qxbaun?=
 =?us-ascii?Q?2koqRT8Z7/2ZSxKQFz0krXpyU4hIIwA8bZRQcm4/zjW5yzGxvceo25FuCk0l?=
 =?us-ascii?Q?CkJjf4DRGU/Tz18E095k6M0LO2CiYSVMtCVP4H7olSGyxpRiyUEsFeYj3/79?=
 =?us-ascii?Q?+tYgQ4rDLyyQlFaKCLDyidb+8o7ShA1P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 01:00:36.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd87c0d7-ef46-42e0-1df1-08dcbd8ed6f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6936

The expectation is that QEMU_TIMEOUT should be set as a Gitlab CI/CD
variable but if not we should be able to run the pipeline anyway.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/scripts/qemu-key.exp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
index 35eb903a31..787f1f08cb 100755
--- a/automation/scripts/qemu-key.exp
+++ b/automation/scripts/qemu-key.exp
@@ -1,6 +1,10 @@
 #!/usr/bin/expect -f
 
-set timeout $env(QEMU_TIMEOUT)
+if {[info exists env(QEMU_TIMEOUT)]} {
+    set timeout $env(QEMU_TIMEOUT)
+} else {
+    set timeout 1500
+}
 
 log_file -a $env(QEMU_LOG)
 
-- 
2.25.1


