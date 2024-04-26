Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AA8B3FC5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 20:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713059.1114034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Qj8-0005bF-26; Fri, 26 Apr 2024 18:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713059.1114034; Fri, 26 Apr 2024 18:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Qj7-0005Zi-UD; Fri, 26 Apr 2024 18:55:17 +0000
Received: by outflank-mailman (input) for mailman id 713059;
 Fri, 26 Apr 2024 18:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKup=L7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s0Qj7-0005Za-3I
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 18:55:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c9b805-03fe-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 20:55:15 +0200 (CEST)
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 18:55:10 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::64) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 18:55:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 18:55:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 13:55:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 11:55:07 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 13:55:07 -0500
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
X-Inumbo-ID: 83c9b805-03fe-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHtMGRB8L9LtTXkIEP3clluLnXyYPqSqNAzqLR6f1GGfneDC7+yQxaXg6Mh/Iv2BboaBnPO3d9P+7O/woIoC9VAGJbTVPp27fbsVNBt4ISFcml5X3QTSo0d6xYKrUdc/8jZo1DLLbzBXMoMUfbimM4V0jF6Rw4PqNZYf03Z9zGvFomEBVk8tCKIplPNlgiynrTZz0GX0pQ9yWHLdaVj4dYJMwqJeIU1eLpisZ36/2dEKSpBcclvb7f2HyreuGMuQi0WFvjEp63itVV5vGUajVxFMCigvymlPRYT422TQRXnpLUxoPg+drMf9GYOqmWg9nMmIZYBJVZsob7q4req+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xRYTy8jRKTfWnehr4ShnCN0JVJhIZe/kzc3UMDV5SY=;
 b=hk8yzOCu2L0v28d3lBgOLdCUrBzf8czor4EsIBZUrSg7P3rWXfKMIabmXERqA94Xwz0vGShMitUaaMyiKrFrY6n/MsCIURtDav4JHBUQtVKJ8co0Fnr/CT9bojsxp82A4DnD1P8FH5Yu8wtv5vpIEkjQQaxjMjwXPOvs6GMu2T4d67DF5BGwv+gM6pCA6+fy9mxo/gIprq9pk0PT19DInZo55y/nkWHwSAwRjPMk4EezglxiSP65IrHGfPkFliyAf6vHVQm6jrWVFa+mLOTu8fWEA2zbEElhf0P9FJeBVqCqExv5AYGERCIHnZaTc7va6c3q/KygPce7x+nZORM5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xRYTy8jRKTfWnehr4ShnCN0JVJhIZe/kzc3UMDV5SY=;
 b=mLjyGUMn5DfgccrDRuWpJIUulhczruF3Nlo1N9QYZXWZqnbp3SfmzVsOPIXFy4bPLYOXHqjSTWE71G0IFF0vBMfGRhfn/yckry4qtWib7Z3GoB38Uvu24zl4lzXAooPM+VgRiJ7VBlqUxpXWWPDeGTR1KYl454hfq1gZ3E9K40o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/x86: Fix Syntax warning in gen-cpuid.py
Date: Fri, 26 Apr 2024 00:07:16 -0400
Message-ID: <20240426040716.52126-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e2df2e-3de9-482b-9db3-08dc66226507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9a+pmTLtN9cWtpAaam26fo9Wn85x1LIXYiD9QMkWy1mpiHpbe9yRDMUAiC4b?=
 =?us-ascii?Q?6fnZ3fFCeLFvYKy39h4H7Yq6jsnG9heV6tKoQ5synMAbjTWI/2k1wbmLmszm?=
 =?us-ascii?Q?i+pCNkg1DGjxQy5An791d1Y5XMTIwGKzq4SkgDMvdECEvQpFHbFucMP1Otrk?=
 =?us-ascii?Q?TBJIURJhRju9poS5EzfMPfjptcasnrgdew3PC6G3J7AmKaTio2tNdNoqaegI?=
 =?us-ascii?Q?t5QvA1zeIXdgp5Xe1qrrrsT7RWQRZ814tMIUuyoEFeXVrlpeP/BuPYNrH3o0?=
 =?us-ascii?Q?4AZx8n1gEezQ/qOxwv0rHpmUCZq3OekhHticRoumpBtcv5NtdYIDgsNlEKkc?=
 =?us-ascii?Q?ol2I8Ss1VEfs66RF4a8KyrAihwS6wb/fPphXEN7pOBW0J0TMSq2w+Kdj1JXw?=
 =?us-ascii?Q?7Yo3/tCvLI5AYN4URF9fzWpiYGjbJJ3E/CCfuWATuDtVGwR9iFr1oWUFzG3m?=
 =?us-ascii?Q?8xM789hHtGeoy0FvVKiF1w3TTlprzolz31t9zPwO+OJMfxs9RtULNl8dPUYu?=
 =?us-ascii?Q?7bfh22CZrPd0Swns0fBY9aj6z7GuwAYBAnRc9j0/fbyA8mnc9rOSpHkymSxD?=
 =?us-ascii?Q?dk9IpHR3Wt4kSU3yIwC0OZxPvb1jR3GKQGwZM/gBJM4rlb2Om0vgzZVNLnXB?=
 =?us-ascii?Q?TbQ9/00yT4Jx3Gt4l7Vg2rTOuguuAeO/aaQJ72D2NtDsgp7TmhUy2UPzNxYc?=
 =?us-ascii?Q?nEqc5U6oevCuAhCKQd71EGWIoDKBqtov6CkA4tnIAJjdeS5nMesaV3xF0OH0?=
 =?us-ascii?Q?GryAuOAjxNm4QxtJ1L7SWF3UGqTNju3bYSLPa3qvL2hBJ+JkglTnN/1Kp3JD?=
 =?us-ascii?Q?LjEF7amE3/T1J6Yr0Nw0zH0g5vM1HJ9qWWl/ksbUEmL6JSlwNPmRQCiLVfjT?=
 =?us-ascii?Q?dNUCjR/C6dxyeYdgBwgYiw475mPogSIBMV/8QTmoQ3c2QW39WB1Ab8sKePMp?=
 =?us-ascii?Q?exD9uopdhT+KIIuSHIHKCUioZN5TLBPepZGeKi8ApDOyhXyg07LBbBjIIyk2?=
 =?us-ascii?Q?OLJ4YLKolzGH3HgvaUDafkF1QJ3imXcE6wEGeD2OQQCIj3YJItco3MtMRRpj?=
 =?us-ascii?Q?D1V+PqcgasHNdPpB9afR/2p+xdSNQrIlfUsMcHRwBVap1Mg8a67rjg/pM7Lx?=
 =?us-ascii?Q?Lw5Pec/YL4nHlpvABHew+TIO+yx5Z+nRDJFKRXSxnMZAnR9L6lYv3me/72Q0?=
 =?us-ascii?Q?4IzhgI9QBhXbQ0+ztRAiOzSZ7oUMsyrBTHWYNBiXNn4TdpjtdGO9Mr6YE6dk?=
 =?us-ascii?Q?Vi/us8ZjyBgKMkGx0bkKs2W1EOS+JnvOraIxBJEm2SwV0grhTSMxnkL8qOsb?=
 =?us-ascii?Q?NXfX6RI5p/qJ1RQXgnO/+/gBbUgkUwYFWWUOAGyrJ+e2rbxNvPBUsHEmJwbs?=
 =?us-ascii?Q?tKQnnez2gjotXenciq5WT+1w9dRN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 18:55:08.7811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e2df2e-3de9-482b-9db3-08dc66226507
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

Python 3.12.2 warns:

xen/tools/gen-cpuid.py:50: SyntaxWarning: invalid escape sequence '\s'
  "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
xen/tools/gen-cpuid.py:51: SyntaxWarning: invalid escape sequence '\s'
  "\s+/\*([\w!]*) .*$")

Specify the strings as raw strings so '\s' is read as literal '\' + 's'.
This avoids escaping all the '\'s in the strings.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/tools/gen-cpuid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index bf3f9ec01e..dadeb33080 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -47,8 +47,8 @@ def parse_definitions(state):
     """
     feat_regex = re.compile(
         r"^XEN_CPUFEATURE\(([A-Z0-9_]+),"
-        "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
-        "\s+/\*([\w!]*) .*$")
+        r"\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
+        r"\s+/\*([\w!]*) .*$")
 
     word_regex = re.compile(
         r"^/\* .* word (\d*) \*/$")
-- 
2.44.0


