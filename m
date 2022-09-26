Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682D5EA24A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411617.654597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclug-0001Gg-Li; Mon, 26 Sep 2022 11:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411617.654597; Mon, 26 Sep 2022 11:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclug-0001C6-GN; Mon, 26 Sep 2022 11:04:38 +0000
Received: by outflank-mailman (input) for mailman id 411617;
 Mon, 26 Sep 2022 11:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ocluf-00019b-1O
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0011e77a-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:33 +0200 (CEST)
Received: from MW4PR03CA0210.namprd03.prod.outlook.com (2603:10b6:303:b8::35)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 11:04:30 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::e) by MW4PR03CA0210.outlook.office365.com
 (2603:10b6:303:b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:27 -0500
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
X-Inumbo-ID: 0011e77a-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk4XcQcMWbviSrvndo3NjrZ5h53lXYtKIrc11ydOw1bMmSfB9KZcF75DsSDjAQ0wFdKRf/WqiJ+0mA4LNr0i7c5n9/cMGbTcB2ZRJctuman5ubWUDkbHyKyJsTnd+YrfyWVmb629JbL+uRv7I9vMx6lng2iG3EQs8gpLGpKxmbGy+5UD/DrN8URKm6k3uAieGFbENtZHauTwIVJikKSnrofV5tguni1WaYwIS96oBAPvFXiRu7WrkHwdBZi1o1VbYTpLnqo8YvpFNurGPPTvFqEVD+qIXVlFXbG22qzC/tGBSi/ucXLwmAP9Cn3Ar+YhwzBh3g6SlJ7h+Xd3j1o3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpOdCBVw2/Uk5sfAz8C2OIxTFfIf2yMq4g3IemE/uFA=;
 b=L9PE1PffxfWL9/3un0kFK9HDWPJslc3gHfUW5Sjk5Dq2zjCiitJ9fin9f2sP/QexSoivyrJa6xZsxcGWD3f+xhOJs/R/+eZg9QoAHUqbDw5F1BSNg8X3otKlJne5QdceSUxM7hvZtV08hlkQ+UM5uax6nnZa8WehBX826HxJ2QyVf9eDpYMrFWBnh/W50OU/9DCmRqgUrPcRwKNT+TK62MaCb2pX5qIR8gZLWccqYNPpbVGBkWgBxk08AmVQKu1Fj4biL+ayayIiUI2/HYNt3mS1TLgrKr82mviBu0+zhMTS30qQWgNlLvKpzflHf13AQ7DlrPkPhhybtBlvJ5+OTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpOdCBVw2/Uk5sfAz8C2OIxTFfIf2yMq4g3IemE/uFA=;
 b=JHwC9qGzZk4iNs5RzoLjsUHCqgzUZCpBBJjSAS2g2N8j4LhfdRV7f9k22mCzoguvhSICylMXiV1x2Oi8elwqFXcdUlx3BGLxszNWRsVr2p/wDOhe1ILvSO2DWo1D0SFP83VQw0IQmiDbXsfQ13izzmV82KsUd1husYXP+mFpeoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 02/10] automation: Add randconfig build jobs for arm64 alpine container
Date: Mon, 26 Sep 2022 13:04:15 +0200
Message-ID: <20220926110423.26030-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 850e27ad-4899-427d-32c4-08da9faee29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rPmFXHXHgtub/lJdHITzrX/tHFybkxqJkIcP/1Y1Jd8P7gr+8UhwLJM7K1vHNXb0128hd/XdF9CTe/czRyTVc0ltsEZzxgslJpDs9v/qJ4mV4MQw1QeddYYWqb8E3pWg7Bmc4ZCBI1pY81mCohjiFiwji9hSI4tMj3VezysuKLwIinNNmkZ13VhoNCyoEUD/tbcpF6t12k6YXkQ/cQUEjWPsd3upn9FeRWrVF1zsZe9YuaoS62eLmkMB10082IbhTw7vVvcsVvJ58NsZ1irVezdz+/WMfwbZeecAWxe3YnCGYOr6KT5NO5kzx1q5GcLkFLSQOINsa3GpS8T3XtS1U1GGutAq4VdRbaf5qLXh7mnx5jBnkOjaZV7AOaZEBkU2c9eB6woHv7RGl44/ceRnBqb9rHxcuYyLVUwj+bvjB6CoX7I4ku5JaBVPlxXdQx4q8itmfYnRrJxqULCiUNQ9yg2ahQV9gvbnTHL6CcZ/sezW8gUw5GBsf8YJulbs9VpHHAy5+hJoVKRcSzOT0c1mwgiixqAjnkwPnwn77beSbWo7mgZ4dr8G+iHFULAjGU4vgyJsM6rNuQ+fswOqYlsrsCr+IWyuV/2c34kEopfa+Qc0C46EuBUkorx0wcfiBIwQe3lbZzSu6huTaxZTlyiVgMHWDAseO3O+p9juqy9jS3l8ADfNaRlB4VYklFQCvyucYszjQjayqNfJ0uPyEP0yxWhJ9VLSk0Hs9icJ1xEYJeNfUQNmgLw1hJmmhIuRnFsVuDJfgI+yP83hB0PRDOd5DTkZ4r4qiOxoOQh5kjMLluIznVEgTCEM6hgRQtDpZap
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(426003)(41300700001)(81166007)(8676002)(4326008)(70586007)(70206006)(356005)(26005)(40480700001)(2906002)(44832011)(86362001)(1076003)(186003)(36756003)(2616005)(336012)(8936002)(5660300002)(478600001)(6666004)(36860700001)(82310400005)(316002)(82740400003)(40460700003)(54906003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:29.9616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 850e27ad-4899-427d-32c4-08da9faee29e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224

For arm64 we perform builds using debian and alpine containers.
We are missing the randconfig build jobs for the latter, so add them.
This way for each container we have 4 fundamental build jobs:
- defconfig non-debug/debug
- randconfig non-debug/debug

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
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


