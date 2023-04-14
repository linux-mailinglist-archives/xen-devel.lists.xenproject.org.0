Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4176E2A58
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521216.809665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcR-0002Ld-3X; Fri, 14 Apr 2023 18:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521216.809665; Fri, 14 Apr 2023 18:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcQ-0002Iz-Ve; Fri, 14 Apr 2023 18:57:58 +0000
Received: by outflank-mailman (input) for mailman id 521216;
 Fri, 14 Apr 2023 18:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWbr=AF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pnOcO-0001yf-UQ
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:57:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430e94da-daf6-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 20:57:55 +0200 (CEST)
Received: from CY8PR19CA0009.namprd19.prod.outlook.com (2603:10b6:930:44::14)
 by SA3PR12MB7997.namprd12.prod.outlook.com (2603:10b6:806:307::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Fri, 14 Apr
 2023 18:57:52 +0000
Received: from CY4PEPF0000C976.namprd02.prod.outlook.com
 (2603:10b6:930:44:cafe::b6) by CY8PR19CA0009.outlook.office365.com
 (2603:10b6:930:44::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 18:57:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C976.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Fri, 14 Apr 2023 18:57:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:51 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 14 Apr 2023 13:57:49 -0500
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
X-Inumbo-ID: 430e94da-daf6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0H+L5MXch2APCSZxtNrT9Hh69YGQLyk+gOXnGelPqesd81rc4Z2e47jp+NOUEMMI2MTpPWPVdo08r2ZkO6tLYMNkV1YPQvhfvmeUYlGTCRUryXzK5n3N1pXFhyuh2BUVHS6n/UKpqFmvuj75sqoZl0Z9WR3KCu9rTITjmjtV/SPbHA2UDR6Y6qaliZJIoQopcotNipfEqdgxq8aT4vBn49Vc0o0OmNYBRDH0sCC1bmrcH0Lil78Qs5d5guAsSN9wpq6/xheCZMq+dzGD52N4PhbIV3Os4v1tLw7RL5/R4lhe/kmXrlNGhjhWjLLxuPz1LQGint5Tb/i6Cxz1TM2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al+YVBo/rFHAhzjUVn24nt7jKtL9yJFrezw5/WN9ImY=;
 b=IQ2pGTKD88+zuMPdA4wet/rig4/wySpAUmtkJ7Q5wxyP6pjpmfiBYb++Pb0DR/D0U5d16BdI8fRwCQhCkSNJt4dY2iiCeV/0Mt7fMfj2ZSWzLGoovbWsJU3RBaJ1ffF1tzwxfWO1bhwG4NUF2+Ob0z22AhZi/kSlYS4PJUlyGHZTGa72zIe0hKWp/j6ub013MP5RlPGiONui/59ZqQKpfwjjtZlCOU/zM7fYBQ7vTzexQ/B215AapaPW2C/eCmlTC0Pq0Q5uy1FujaiZhwoEQV88c2h3Z13tyAT+2Cv1+7XU1RPvzb8PX5vVDIIkVM7iy//mXgvDSkpyuKePXdpkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al+YVBo/rFHAhzjUVn24nt7jKtL9yJFrezw5/WN9ImY=;
 b=yYbMAe8et+HIY/oo+xWHW5dJ6PnoJQ7ZB485hAvYwdM1zVkZyAc46Cp9II7PgMKmtxByG/dlivHaZntZNbjbmRytIDtym/t9hxmikLzm86xLRsaAdR4DxsTEn0sGsGFQAWlhD720yDj8boZSj1+hPnZDhgvITRNbgR+doCvxpx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: fix unitialized use warning
Date: Fri, 14 Apr 2023 14:57:14 -0400
Message-ID: <20230414185714.292881-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414185714.292881-1-stewart.hildebrand@amd.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C976:EE_|SA3PR12MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d4bc59-f055-4c3c-33af-08db3d1a261d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HwO0CmzPGZaR7SXgWQBDb+ReAr9FYZhx95Uu3HjoATsfs5OwjYwfvxgBL/t8rcYE2GHPFGbT7DXYU0Wv+MAuNbbEGzpU7qjUzkwB/FQn0q5KWBW+g0Nf/t1gpTOvQNaRGAGo6fp85+l3iEaimAG3EzCWGtA9B5mLwN6vM2UoBIvZKHI64YdZhZiSzMRKZXkB4RqpTAo5x/r04w8ZHhU+vPRFts7PxxdA9V1zC1t4u4tHSZHiEI7RICbPTk0w43uiD1kkxjwPyxt5jUQzKtftu1zik3XQZlqsoJ9ToX0nhL14b5/aA5ctZEe0Cyz2qSoBefdXqVj+MTVNTpiNOKEU0+caFZLx3ctCH4vRrXcW5m9UMMSrXoGUO1pdlscHvw8I7SZMRb3m0p1URYM+nTYdMlFqHnCojf1ccy1fvZy5DR9HqquApX5+AQya/OGuQbDvtQuOB/lj0U6ZSLmaxd37KE9Vbk1+19IouDtT95zZZDVWoTa5VyarWXXQktdgaB/XlyBMA4cBJnbx4OvNOeUfBVvYFwvOnGLoThBB7MmiAVAryBhR461x3IdPd+dgT7DcpkCwrxOW/6PD5AgGvqI0HW5B+Mp+/jrYC87C9r6HFC8MnyGv0TEcTL+KVLz38tjXorUPsCH2RMEaKS12Fmkf+dvzFIS61gkLSghn1SUq4HGYpT9EAi+McxMKgq6Q+151ZOk9j3egKE5bInDQKxFNt580w46XB3ln1ARSPf4Ym28=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(316002)(82310400005)(81166007)(54906003)(82740400003)(36860700001)(356005)(70206006)(70586007)(8676002)(4326008)(6916009)(86362001)(478600001)(336012)(47076005)(426003)(2616005)(186003)(26005)(41300700001)(36756003)(1076003)(2906002)(83380400001)(40460700003)(44832011)(40480700001)(8936002)(6666004)(5660300002)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:57:51.9856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d4bc59-f055-4c3c-33af-08db3d1a261d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C976.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7997

When building the hypervisor with -Og, we encounter the following error:

arch/arm/domain_build.c: In function ‘make_cpus_node’:
arch/arm/domain_build.c:2040:12: error: ‘clock_valid’ may be used uninitialized [-Werror=maybe-uninitialized]
 2040 |         if ( clock_valid )
      |            ^
arch/arm/domain_build.c:1947:10: note: ‘clock_valid’ was declared here
 1947 |     bool clock_valid;
      |          ^~~~~~~~~~~
cc1: all warnings being treated as errors

Fix it by initializing the variable.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
See previous discussion here
https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00741.html
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4f9d4f9d8867..18b350734a8e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1944,7 +1944,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
     /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
     char buf[13];
     u32 clock_frequency;
-    bool clock_valid;
+    bool clock_valid = false;
     uint64_t mpidr_aff;
 
     dt_dprintk("Create cpus node\n");
-- 
2.40.0


