Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CD607CDD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 18:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427895.677491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvHN-0005KA-Q8; Fri, 21 Oct 2022 16:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427895.677491; Fri, 21 Oct 2022 16:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvHN-0005HH-N0; Fri, 21 Oct 2022 16:53:53 +0000
Received: by outflank-mailman (input) for mailman id 427895;
 Fri, 21 Oct 2022 16:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNjg=2W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olvHM-0005H9-Ft
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 16:53:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efb13a76-5160-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 18:53:50 +0200 (CEST)
Received: from BN9PR03CA0612.namprd03.prod.outlook.com (2603:10b6:408:106::17)
 by BY5PR12MB4935.namprd12.prod.outlook.com (2603:10b6:a03:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Fri, 21 Oct
 2022 16:53:45 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::ba) by BN9PR03CA0612.outlook.office365.com
 (2603:10b6:408:106::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 16:53:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 16:53:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 11:53:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 11:53:43 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 11:53:42 -0500
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
X-Inumbo-ID: efb13a76-5160-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4Skq+tL9ZrTeaWtwvK2Wai7pV/XJXb2ufOYnA7caGBL2jpP7N/79CRpVGF7alycepzvP1KF1vgDTrMY+8x0nRUwMx6y9GNSXqAkhI7lE6tWlByJlOBfwh1ZBR8Nf0gYWEtNKlfpKFazkOHu/JNI5bStxV7X7ytT8YqQCG6ZI/MGKo78Y5iHt4/TK2uvAh4cJ4gxdUeji6c32vlN+dNaqFlKSU58gZ+wwNIgEwC+sjM7ZEYipaONaGu/0C4/mFPDR7pa3qpvJ1mdbGb1n/yvV9my6E2erd8XxNKKpItgxJRvQBbOVEPqmCtdTLlBg7iYGzCOeYtqrcFp+O0PkKGwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIPnwdLEH/hxki/6fg7zi/AAYz+XnzsGm7q1VuCQFho=;
 b=iKn4sEtXE8sPWK5+cYJ73xBAb5LMG9k+c6kR9qKop6t26KJKpva25USEuGnZ2bD2aIZc6f6AqKLmdx0d4CJOf4Ac7zJZabqyHccgB5B5gHZFWvY45oU2tjQZ03P0pnkj7yXNiPEGUpbXq5KuTSJrJ9AW58ir8HYJ7DGlDogJKy5ginjR98FpgE/kZGodj9j4edAyq8w5yIVHplePy8ZVwqm+VS46OuU3DT1pTzTX/b1k7xyDt3Jagz80AyzjUHt4iYnJ02Scb/ryJJzKUCI5H0PKw/4JBtzKA+Vn5LUUKNPxLnT62/2HAMpFC+mvuqz6EXXhAzJUX3fiq7HN+Etpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIPnwdLEH/hxki/6fg7zi/AAYz+XnzsGm7q1VuCQFho=;
 b=JXl8sFEAfPiF2TjsvmbgYrytwXEp3tbdJJNK1aHJ5e9nmnnd2+VUB463LWDCgsWYf/Xsf/5lucFn69BE0NTA6F8WWJs3MMwLDhCwRLaNNwB8xAnJdSqbyK3GnxSJGaQmfAjOHPL6UaI8N7e2GxOxdYWv8JSHlfdkGI0HTNnbBug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.17] automation: Do not use null scheduler for boot cpupools test
Date: Fri, 21 Oct 2022 18:53:41 +0200
Message-ID: <20221021165341.7905-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|BY5PR12MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: b312ccd4-e500-4d9e-2dd2-08dab384d0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jCDW35/ggetLjIewtb6FOnPBKLHv+73HSvSJ5cTzjuuqgnbSgXZ8u8R39OjELcy69dnHCGJG8cY6AiaKT6kPVAlTyU8vAcgwzhVQkRjSYyaBYZXSMMlGkH5slgxr3Ev3QZpmGov0yBzhKST6d7lOZzVcBgnp2lnMDC+lzv/Xlpcby2JY6FfRlhtvIQJVm1H3LHPyLO332fzSyj8SkVrmvFB2PCE15PUbYjToIkzhn251w503aLbkz0zgSknnVp4KpaIpkDYZSVt0s47QQ58mQr0cxEhbBAIxqGI0FNXkp89/V9+DR8L4d4AMWZy7rAJXoAEIJ0Mbup/UPvTbE+6tvmYx9C96+3C7vUJh7XjU1ryBgq1yT50bMpLsTS7JjEAfyBRP8/65WfNoTgTjHhmVCeFYofZLhIwz5Q2Y3/8G0EWAn3KRuXz5ZN3GuM3+edTkMVwQEa/2n9exh76itb9+dsGzAUIKBzrRjv9JLMcF5fLEFUTZVYZRKndmoAjFbMc+w3OJqPeXG1yKeAp1zZRH7oFNYfyOZ/FwjVJuNk+uwY4ajzc/qJgn/T5WGFhZXqxR0XcxWz5zLB4xaLn/Qwd6w9wDifAVqJ90M+eVXj95mWfYqGlfPMqesnbPxN/nf6bRc4hCp+eB8FLaaZZI7AOZrgPu8WEFB63gb7igFnIPZQe5DCk2L70qxGYaqTH1IYkZpR1vqEwetPD1r0BQn9l7yIAWrEPpLImQHMrxlkAaLWT+bz9HlBO2ECmoxObZfXcOPVvKc00/dTqOvjqYrSqwOK1PhSeM9P/ypxkZfWkE8yh3AXctqxR4Sjth1+3S5oCGLiChOKmli4ZHZ0Io/kdthQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(478600001)(54906003)(316002)(44832011)(8676002)(6916009)(4326008)(26005)(186003)(336012)(1076003)(2906002)(966005)(2616005)(41300700001)(8936002)(82310400005)(356005)(82740400003)(426003)(47076005)(40460700003)(36756003)(36860700001)(70586007)(83380400001)(70206006)(81166007)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:53:44.8858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b312ccd4-e500-4d9e-2dd2-08dab384d0f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4935

Null scheduler is not enabled on non-debug Xen builds so the current
test can lead to a failure on such jobs. We still want to test that we
can assign the cpupool to a domU with a different scheduler than default
one (credit2). Switch to credit as it is enabled by default.

Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This patch acts as a prerequisite before merging the following patch:
https://lore.kernel.org/xen-devel/20221021132238.16056-1-michal.orzel@amd.com/
(to which Henry already gave RAB), that helped to find the issue described
in the comment.
---
 automation/scripts/qemu-smoke-arm64.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 5b566072f72a..a5d8d135b659 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -29,10 +29,10 @@ fi
 fi
 
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
-    # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
+    # Check if domU0 (id=1) is assigned to Pool-1 with credit scheduler
     passed="${test_variant} test passed"
     dom0_check="
-if xl list -c 1 | grep -q Pool-1 && xl cpupool-list Pool-1 | grep -q Pool-1; then
+if xl list -c 1 | grep -q Pool-1 && xl cpupool-list Pool-1 | grep -q credit; then
     echo ${passed}
 fi
 "
@@ -140,7 +140,7 @@ fi
 
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     echo '
-CPUPOOL[0]="cpu@1 null"
+CPUPOOL[0]="cpu@1 credit"
 DOMU_CPUPOOL[0]=0
 NUM_CPUPOOLS=1' >> binaries/config
 fi
-- 
2.25.1


