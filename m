Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC75EBEEC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412367.655662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bq-0006Yd-V6; Tue, 27 Sep 2022 09:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412367.655662; Tue, 27 Sep 2022 09:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bq-0006Wi-RZ; Tue, 27 Sep 2022 09:47:46 +0000
Received: by outflank-mailman (input) for mailman id 412367;
 Tue, 27 Sep 2022 09:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bp-00061I-9Y
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ef4f21a-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:44 +0200 (CEST)
Received: from DM6PR11CA0072.namprd11.prod.outlook.com (2603:10b6:5:14c::49)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 09:47:40 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::be) by DM6PR11CA0072.outlook.office365.com
 (2603:10b6:5:14c::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:47:38 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:37 -0500
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
X-Inumbo-ID: 6ef4f21a-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmgIT6NSWnCLUnHTaAHWo23x/WYkLeSHRCuGGae5AYqG/VJWw5YFuGF78fRof5/0NN4JGEuqA7kbOPnWciOrRxzo4LNcmhb0qjwrBId4yZ84HqU5EFQq32xZRJc+OrEO3f+80XHeqr4CYbnOmvCDXoGY3SwYxF807vipth/SBjWMtCTHuCiGqC7Xq4+GBUCqOraKbcureBDslSGLngNYKDHlkQ3SGJXTCK+M0dZRC+prou4LN/kmDsah/zqVV7xEFs+jP3pH2R6GRUPG5RmQatc75wjsvCC+sKuGbLj7VMTGOckNrA7qpSsnxO3QYPWWwqQ7mZpUlRNxM7UtmfNhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQbVPFIY/NyyF4wKIhFPxHeyMQW/G5sZuOSae7Gxd0k=;
 b=PJf+obH4jF3rHuVcaQhy5gcNyWsn6h4XRtv7tfKcMzozoFAkWUyXIJ30Hnf8VaRG1vpUrIauzzKpbKwftjlr54OhnV+Os1rFenP7GuTjAQUeJnxYjeC9798kkk2SXfGZfj/nAk7L6Q7zEDIDpIxJyYp4jlIS1bOPn8XoQ3B6EXbvQrOcI/wL3z8+zDw95QVgLV1uTf779mBFGJjxBvLteV/bOd3Gi77dcjMEWqWoHSyTR5glgvuRa/aOD+vMIS2qq5Y2aws5iy+uUqfQBGspk+U2bzZSa0A6zsGZpPRwbXD/PJUc2YiqQgAu0CAg8dScNiKyGBb8sUuuK5pVf8iXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQbVPFIY/NyyF4wKIhFPxHeyMQW/G5sZuOSae7Gxd0k=;
 b=zcqFbcm9NupXzSRmJ+hU07XcdOQ0ZhmhjY7EDi06EOxlSui9HUQcrypJxKTR0MlhXCT4cm0XHljgBpN2+aA7U7hlxhQuOT7hhj4p/x+wg7qqajNsCiVIsKBxGwSjMInOvFzNEQZnBDJ3LyjdZhv/+aRmy/fe82C7YGQZpBhkYsA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v3 02/10] automation: Add randconfig build jobs for arm64 alpine container
Date: Tue, 27 Sep 2022 11:47:19 +0200
Message-ID: <20220927094727.12762-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 552d782b-f1fc-4eb2-186d-08daa06d50fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4+80iuSCP8lXly94fE4HeGd88BY2RmWrD1lR2EAaBG+OTVSKbxS1XGBcREPGQysjvrHg20hYXB7KSyuBSs1RTBsCajtDwUW6pkviROFSM/ctfKTRR9LBqHjTv3/0esnSbu1tTVU1vBLfKOq6xjgQuzwJmrHIaYDXckuUAbPQ50zvqQhXPwTABajV9Rs8cKrbOJHFf4SIlG0/r68dRrfSiXU/1SKIGYduNRybgoIHxk+YUb232cMGeFpQh0e2ShLFOJm69/db9KZkZvf2i5HPGL19i/x4Pp05w3L5Q7lm1UgzPTHcnKrgtdQEUHhsryzPAY8XZS6yxgvP5w96aII1pCTO9WCcDKqBg98vSOeOHu9sffw22mS318KvrrJv1BiPiSOkhgglgOTbDYafxVQNtKuaOU8NmztRm5V7tLfEnHD9SVCZ6AD9BzFA3YJLHcpb7yzgK//8lXfVUft5rJB77udEtIEpWYQJdIgboHEQ8PpDRlo5PGbt0+U/03G/yme7K5gk1r+bOUh0S1qgCik7M5B1kWqSVZxrdNCezwCKceSjaBbvrxRHfryj5/8hqUCJofOGYW/ceZ+CSMHO4kB7bwfbHFxCCu+dbX5qXw9cSvuHByFclbvQ4omen0VAtt2UN2zdRvfu6pzdqHMq+Am7odvB+Y0VR1NnxnqOBEcXwJ0jy+VA65SpghaSBQjIbihpZjHv1NjPafJooHUPBWtCoKFZXPcbFP1wQoNwWyFS/t88N52zzSu3ks/1bP7jr30Y5FEHj71yHefZBK1SiAfDnVxIsiIWXAwow5Bdv7nk6SJ2ROryNm4dfnglR9I/s8c4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(316002)(81166007)(6916009)(40480700001)(82740400003)(356005)(40460700003)(8936002)(36756003)(5660300002)(86362001)(70586007)(4326008)(70206006)(8676002)(41300700001)(2906002)(26005)(2616005)(336012)(44832011)(47076005)(186003)(82310400005)(426003)(478600001)(6666004)(1076003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:39.5830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 552d782b-f1fc-4eb2-186d-08daa06d50fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212

For arm64 we perform builds using debian and alpine containers.
We are missing the randconfig build jobs for the latter, so add them.
This way for each container we have 4 fundamental build jobs:
- defconfig non-debug/debug
- randconfig non-debug/debug

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v3:
- none
Changes in v2:
- none
---
 automation/gitlab-ci/build.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a39ed72aac6d..d931441b910a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -566,6 +566,18 @@ alpine-3.12-gcc-debug-arm64:
   variables:
     CONTAINER: alpine:3.12-arm64v8
 
+alpine-3.12-gcc-arm64-randconfig:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
+
+alpine-3.12-gcc-debug-arm64-randconfig:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
+
 alpine-3.12-gcc-arm64-staticmem:
   extends: .gcc-arm64-build
   variables:
-- 
2.25.1


