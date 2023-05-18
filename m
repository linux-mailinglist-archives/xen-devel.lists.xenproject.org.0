Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A370812D
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536316.834521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcgE-00038F-Lm; Thu, 18 May 2023 12:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536316.834521; Thu, 18 May 2023 12:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcgE-00035t-IQ; Thu, 18 May 2023 12:24:26 +0000
Received: by outflank-mailman (input) for mailman id 536316;
 Thu, 18 May 2023 12:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Na5m=BH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pzcgD-00035n-W8
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:24:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb96c1a6-f576-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 14:24:23 +0200 (CEST)
Received: from DM6PR01CA0014.prod.exchangelabs.com (2603:10b6:5:296::19) by
 PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 12:24:20 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::71) by DM6PR01CA0014.outlook.office365.com
 (2603:10b6:5:296::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 12:24:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.20 via Frontend Transport; Thu, 18 May 2023 12:24:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 07:24:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 05:24:18 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 07:24:17 -0500
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
X-Inumbo-ID: eb96c1a6-f576-11ed-b22c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTmm9UlEQWtuk2D7fA0Dr+jvyIN/GkgbQoHzz81aybSSt1uWx6ZBbDfU1zt61TFWIbFKgDOMmI0AbZEidhbtuYeRb4IlBYbA0gc2y0VehjtFoVc0nbQw1h94RQ8a5f778uIQcynTh3XOiXeSXtya+JofG5ewPD79W4VNATtEUSewRLyS/ALztr3mFMQhd5Dw68TjYO9H5aAQbBDASXGlkGW6WrwmQ89nivU88eQwICs2/43JEULVIObVeiJhLe+v/XAovdTK7yPMs9VmZy1oHpPeOgdRUrqsNoBKcbTM6r9v7AQtleSx8uPZ/CK69dNwwaqfkPn9Sm/+ht4fBEARig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKM0BHsOw2bp+YWztYBo8GjCfLhaPqBDI4+n/Jlij88=;
 b=g8+1iFVNOZaD8FlYDQQWe0e4odBlRs+N6xA36mcypXqqBziX728OT69mZet6nbd5fPAPbvzp+8xi35r5wc5QHc42/ojBXuptPJ0Ic1zRY5t3Q+nr6ptVXGSyzIDKuOMYbAKMTtPFP0VdbYjcpt5rnRwNJ8A/ZthnrHbMGMS9pAuQ1DwWqnSMF1ZNgnh6jAEflpUfZ+AH5GkShEDz6IO1JA7F/5ZZ1Jj3T0LqRWD9V8MMfQ+nqS2IxRiQ8mRO38HGbMSN+WXOZWlwTRiCOinmgWsgtcd5ymk28+xy6A3q9w/JAnMzEoRKVNTSbM2knJxRJN07bV5P9XayWIqb3zpXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKM0BHsOw2bp+YWztYBo8GjCfLhaPqBDI4+n/Jlij88=;
 b=A5HYqUvKZjK0Y5xN+kZtYAerSObq/RHh7/YPnEiasqq6y3+3BHGfQQhoyZSq5hA2NAXzm7B38lsz3rPfx9HiygfpjDSzLObvXUOnBe02hObZUC1AykEre4OHCd0VYjk+AmmG8eRdC6gyXNZN0QlO/Ujzt32GMKsRzOZ83tDp5Zc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, <luca.fancellu@arm.com>
Subject: [PATCH] automation: Enable parallel build with cppcheck analysis
Date: Thu, 18 May 2023 14:24:15 +0200
Message-ID: <20230518122415.8698-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbdbc52-848c-4086-c7ac-08db579acdf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FPiWh7qdelt2wX5nw0JIL5jbk3WNT9ywDUE2nH2reaSLZ1QjT1ZDe9xyItE4i29qyJ3oEjO5Ms0SHW7tsZRnwLHK0aIzTB7bIyStF+hlyMvBDS/oXUcl1ojiMWfD/WQImGSJSCnQzUkourlTDileYPCzgvVZEmcRsP7qgBO67mhp3BHOPduLS01f9bsEtt4AlXrm+6MYfz50DFDZXTnhrKRKm/SI+lVSK+SQBOHG1eE3C+b3nVZnxAKsPSUPVz/8BpIaCYc9NdQX0+9o6w9cCB/8Kv2mpLW0ajrEcf+n4YqCmvEQ41gs6YHDY9hcpSr9nkxGjNq4ay+8nOmUPknxkT5lqBc2+TeDyHM2HHU2YPlrM/t/mB0OOCEXZA+SBi3hylvfXJcvXAhIpQATbGjNYSqiPEaUXivfjsjnAPqiw0OGR3J8nN8irKH7BKUAUagdx6xy4VeL0L51jAXsQnU9hQQQAl1LnzXBhPjkFMHSUynSXLQqzB6DWTbv/Vp6QdETFWSaRuqnaLuQ+/SJxe0x9EE3skjbfjH+al6yOQe2AqIPLpGhlG0aD+cgH2txlRhqkN7j6Njkr5n+p3m55A9PSJD61sC2J2rch40hsDg8Vsnz5Y0r6oJcMDOa6GOL4kjJf1Enk5Jf1MCBP84ipczrxiOs30BFbhilqUAaYuroi4vfKiEAePDAx6MbFyGZhpf5Bn33fL22prZzAyEq/b4ALj4ZyEdGVfIPo+b2eD8mh0SZgI66tVaDzSw7cyg0UY0Rm0kcqdf9ZcQHiyVaTx41EQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(1076003)(4744005)(2906002)(186003)(40460700003)(86362001)(26005)(83380400001)(40480700001)(336012)(426003)(36860700001)(2616005)(36756003)(81166007)(47076005)(356005)(82740400003)(316002)(41300700001)(6916009)(4326008)(70206006)(70586007)(54906003)(5660300002)(478600001)(44832011)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:24:19.4227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbdbc52-848c-4086-c7ac-08db579acdf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254

The limitation was fixed by the commit:
45bfff651173d538239308648c6a6cd7cbe37172

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 9085cba35281..38c48ae6d826 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -39,10 +39,8 @@ cp xen/.config xen-config
 mkdir -p binaries
 
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
-    # Cppcheck analysis invokes Xen-only build.
-    # Known limitation: cppcheck generates inconsistent reports when running
-    # in parallel mode, therefore do not specify -j<n>.
-    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
+    # Cppcheck analysis invokes Xen-only build
+    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
 
     # Preserve artefacts
     cp xen/xen binaries/xen
-- 
2.25.1


