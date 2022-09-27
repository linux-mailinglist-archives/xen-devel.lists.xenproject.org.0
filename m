Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A421F5EBEED
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412365.655641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bp-00064F-EC; Tue, 27 Sep 2022 09:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412365.655641; Tue, 27 Sep 2022 09:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bp-00061U-90; Tue, 27 Sep 2022 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 412365;
 Tue, 27 Sep 2022 09:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bn-00061I-Et
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d5ece49-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:41 +0200 (CEST)
Received: from BN8PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:70::45)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:38 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::f9) by BN8PR04CA0032.outlook.office365.com
 (2603:10b6:408:70::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:47:37 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:36 -0500
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
X-Inumbo-ID: 6d5ece49-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebn6BkBmOuFfpg5WEtLL+Koz0Gcl8H0yZJfQw0g/nBcH2Sbid8DULn3ihwo30ZlE0qVELFZOwsIYCHNATet25pipIhGdulhutOTmVxTG/CbTTdS2aTH0DNXiJIiSjamOWCTU3vOrPG0Ov9Vt5Y7be+qsrZyRKQN4OIOqb5Kyvs3jpK4XjcL+s7r3iDXPbgIIVQtCCl1QsrQgPtDl0uqcwWKbWuCj6TBTvPR3mtw+wU1+lc+er6U6PEEiiJXefvOysj6NxLfxiFOQ3myq8k09RhdW/lLKtU3wSnZdDEl2EFm3x2ukYptVI40XX8D7GDkQBQyHkw+QGr2NrPDoGMRw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62JB3de8FPX7JJGSCy3DTcwAGOHx6Y0JArP/iptZGcc=;
 b=byvIGWodI7s34W50JdzFiDteAakBdWwIJbffso25vo7oT4mnBk+5TZcdLw3H8z44XX4gqKNfcskpIYDddhr3Xkn/WrrYdjDvkyJoGp/KbfH99qgSFIeKhwNPNmhWVj/6w5aPElNjCq5h/tazboLDdmhWULW3bDRbWzQKAK8MPUgvN+bxs/hmYw7HRTI+0sU6V+sbO6PI/+5/m7Iq9bnaVKVdizvraVXh6e+FeozYvVy5NvAlEmLZt48uCelM7qUeXPXcbzUOv+KBK5zC+u+Z+rXcO5PtJKgUipd6MHNTT+1HReMjpcuNnI0NJ1rOAu5H5dpfiMiwPiSaTytV6LzkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62JB3de8FPX7JJGSCy3DTcwAGOHx6Y0JArP/iptZGcc=;
 b=kUALXBuAMA2PXfGv6igWawRHObyrXAh9DmM1yqJlyTZ9QZrLc0qTzqYdmjvGqXCODQ+1JkGhUJit6OYJ+2q7orkasTYvQ5dDhD5Q/lUa2/tlQuaXh2tqdc2J4q07M5F3h21FGMGyaLAY3V2/UWpTq6Hmdi7GwZr/JsKpN9prUFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh: Fix typo in DEBIAN_FRONTENT
Date: Tue, 27 Sep 2022 11:47:18 +0200
Message-ID: <20220927094727.12762-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fdd18c-61c6-4e1c-4c9e-08daa06d5006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPNifa2KJmnPRFyRrvkLfO4L90T7jD3ykAU4MjdtXfotJNr5RnljyS4RFjD8tWuBS78K2zNAWqLHN8SotzftnKJ2KAGNu8JF1AmBLUd3+3HmUXdTMUxdvQJh6zofIe6mQ9pGyPlaUOvXYvKYkpFyXWzPBvErIF/Sw7kUYVWwUD9d6XkCUyb3kfClj2198BGi4xUR57VrX2PyI8tzcyBsO18qNXUIPrx+l+R10YxXso3t4JLQfWo7KDC9kO2FdYRCfQZ54XKBhtZNZQOcLE4ZudAeQrEBmwUVBw5GNaTjxFkKs0OAl/rhgr2Z7qU5YQCfNot6dsJBPXtx7dcNomkpZFZ5m2LUHKArdAOkCT1uASGd/5W7F8WO+9pzutVlOSMy+2qkmg9IjjdfrGez7vpQV+8olt2J+/CCoj+GkeySTBQSrFvNBE5YjrqexUpxi+I9PFqHE7s9yeBYb/m69KPL56rYhtuUPYuqTBCwFArJTdmoWWYPdljSSW7ArdKYfOBbMXS8HC9/cBUlq/csbtfKN7LOfh4lmuYoBbouslGc/RuGZ7zX+7l3r7wJZYfTqReutd8xSw/gpmwSLST1AuPIBr45C/K6KyizhpY9w7iuUFEuzLmCpVgK2KjQsgX8OBy0i3Pmwqtard+ADSNJXJ02oYdJ9Wu0msd+vavTO3dixLBcSOcWCSm1JjUMkYV2LjOlqCi1poz4cdgrDHk3UtqNRfne/YjS2sPT4X/i1B26Aa36xSMMHzRJZ0pkAKxAyx4blNRGHW1Y48v4sBYAegFu6UgT+6Ojk9TI58n+ezhZZ+TZo+cOYNBUoPzv6aHdfJ1F
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(44832011)(5660300002)(26005)(8936002)(6666004)(40460700003)(83380400001)(41300700001)(82740400003)(36860700001)(1076003)(36756003)(2616005)(186003)(2906002)(82310400005)(81166007)(336012)(426003)(47076005)(356005)(6916009)(54906003)(70586007)(70206006)(40480700001)(4326008)(86362001)(316002)(8676002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:38.0034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fdd18c-61c6-4e1c-4c9e-08daa06d5006
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940

The correct variable name is DEBIAN_FRONTEND and not DEBIAN_FRONTENT.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
CC: Henry Wang <Henry.Wang@arm.com>

Rationale for taking this patch for 4.17:
Setting DEBIAN_FRONTEND to noninteractive menas that we need zero interaction
while installing/upgrading the system via apt-get. It accepts the default
answer to all the questions (using apt-get -y only works for "yes"/"no"
prompts). With the typo not fixed, we might get stuck in CI jobs.
The risk is very low as we perform pre-push testing using GitLab CI to make
sure the changes will not break the pipeline.

Changes in v3:
- new patch
---
 automation/scripts/qemu-smoke-arm32.sh | 2 +-
 automation/scripts/qemu-smoke-arm64.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
index 530f3892fdd3..c8ae0bfb9b1c 100755
--- a/automation/scripts/qemu-smoke-arm32.sh
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -2,7 +2,7 @@
 
 set -ex
 
-export DEBIAN_FRONTENT=noninteractive
+export DEBIAN_FRONTEND=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends device-tree-compiler \
                                             curl \
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index f803835779f4..5b566072f72a 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -38,7 +38,7 @@ fi
 "
 fi
 
-export DEBIAN_FRONTENT=noninteractive
+export DEBIAN_FRONTEND=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends u-boot-qemu \
                                             u-boot-tools \
-- 
2.25.1


