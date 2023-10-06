Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8277BB2B2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 09:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613261.953702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofcu-00039j-C5; Fri, 06 Oct 2023 07:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613261.953702; Fri, 06 Oct 2023 07:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofcu-00036r-8f; Fri, 06 Oct 2023 07:52:00 +0000
Received: by outflank-mailman (input) for mailman id 613261;
 Fri, 06 Oct 2023 07:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qofct-0002oP-4X
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 07:51:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37843b01-641d-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 09:51:56 +0200 (CEST)
Received: from CYXPR03CA0090.namprd03.prod.outlook.com (2603:10b6:930:d3::26)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Fri, 6 Oct
 2023 07:51:51 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::99) by CYXPR03CA0090.outlook.office365.com
 (2603:10b6:930:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.31 via Frontend
 Transport; Fri, 6 Oct 2023 07:51:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 6 Oct 2023 07:51:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 02:51:50 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Fri, 6 Oct 2023 02:51:48 -0500
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
X-Inumbo-ID: 37843b01-641d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWtCvOK3ksHoD6wmJqoOwGeLteGyHzTVBVcLTPkUOsCQ8ySMBfchlChYuG/zi4jc0H+U9K47AVjf2DlHrvezMo44JT54gxbp/xWWGFEAK7SlYXY5p3SMYa3zV7bDBjtM1Rlw9aSi9xc9OwB0AVszJTINwUYVHXiKThGDtmaFUm1Qa8DQ1nh4wLZV288CYnLvibh5x2OPUe3eUy04v+ReVAGSvSryFVx+O2uMw8/NujwQl2QA6VUFAMmkK/lFnxVSQKlB2kS45Cw5iyoZNjL2HQ2kkGmLNl0fl5pRYhuOsVfUjAU5FQBFwYN8pZfgWrI5wExGEGsR0FSiodivQc5PqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNLFX+dIT6nJ6Pj3VeAo08YpiL8RmZBwDiozheXyVWw=;
 b=fnlvgH6EqWlpywF1AwjFYVzhAGDb3PVgdbTpYp0ckAKrz/hrw0tOynmgqUS2vMKj0CKimnOGqwJKSz8WxAMLKVS9w/wimaATy5LkbaP58kWwNqSwB4oBGFrIIcgqMmIhj9RT51IS8ANu4j8W+VJdK3rJ/38vyvNDfNJHbTVlu+CDOk35L/8bmkqBN/kIrPY8dbNtyVPPzgIKAN6Y43GojtPAvFxxur7BTMrZgcHVE2XEdFS4myylfZ+aAHs45q/xjnO8hylI5s+QjoKi0Gdhda/GPbrbRSc2wOnkvDxnUUpmj6BoFYA20+GTHXUffByRceU9XOp72SiEivaZVYRycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNLFX+dIT6nJ6Pj3VeAo08YpiL8RmZBwDiozheXyVWw=;
 b=g3rqQvGoQxH6tl9/wyWLiEnnWUMkfpsxOBL4heUyiFenYTrcZv+pqf1DFfL3gjBxLQirhtFtfoxlLcj4Q0cVxMoa9BAH27JHgog2xVr0r6gHYQpXTT74mRhmGS9ClQXoFmknG/HCWZ8QyXTz+8US15Gn914oeNlFvSF5K6GWY94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	<Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 1/2] x86: Clarify that up to 5 hypercall parameters are supported
Date: Fri, 6 Oct 2023 09:51:41 +0200
Message-ID: <20231006075142.9803-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006075142.9803-1-michal.orzel@amd.com>
References: <20231006075142.9803-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 61342e72-fb64-4a56-fe6d-08dbc64119be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozrspxtVspl6fgQibqN4MUu9iYp0BtRcvs3J1sqXO78i6F96ZHucXpdc5bFc8tkM9a4iYWcit4r/13M/oC4ddBtIkOslIXGXyp64TaSs8xi4B+ZEHdWKaCay/FjbUDGbE+kbKQ/YaVfQPAtE05fbLtj8jibdtGF68+RkHiaWzBfQ4VCmy0ymRjnzor0EJhHfL3T/zmjn/OSf5SFix+ag6y5xmWc7hpAAWiXaiiTJKn1T3uc8un5SMAisY5tJsyzRWnz6E0TCry5c5VxIx+vwkoz+2Bqh1Tc3SnP72Ge/JkhQI1QkzDaA66edt8Nk87vcb1t5zY1TxI3Fp72uMCpLCVbUfLcE/e7YZU3qYExEOAfbE0mmjFkIdzGnCCUb/DDaFw7gwpPHRBi9Y3KDUOvzbhUE0G9hSr9mY5ZdPhujoSqoDeGROU2uSTYeUoJpVPnrwgKE8ZZ86Dgjue/bM3nbBdSSFIzeEtQtyY1+u6D0IsH0uhDBQ8GDBR9/uuFMr6AjNVSA9Jdg9WYvnABJiWnXxf4a6at2Y417sqN1rUJHvl4aBcrh28XHs/1LI2SI7wiV69LvscAzj+QfZuOcAfum4Q0y1s2AmC9MayAhadpBG7xy3cynq4GLmmsf15hPA8Meve7y++JUWknO1gZRXzDw4RzqFx3mw2t458lddt3Tm2ihDBAzFYG2HiNiOH174IQjznd6iHdwpyluMqZkGkLD+QIqEPAeMtQ5dZAbAeeglT2ct61UKhvbOJJs++1cWgAqjWIey3dAzKn5qIduozbzbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(36860700001)(2616005)(336012)(1076003)(6666004)(426003)(26005)(4326008)(5660300002)(47076005)(478600001)(2906002)(70206006)(41300700001)(8676002)(44832011)(316002)(70586007)(6916009)(8936002)(54906003)(40460700003)(83380400001)(356005)(82740400003)(36756003)(81166007)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:51:50.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61342e72-fb64-4a56-fe6d-08dbc64119be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596

Update public headers and hypercall-abi doc as a consequence of commit
2f531c122e95 ("x86: limit number of hypercall parameters to 5").

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/guest-guide/x86/hypercall-abi.rst   | 8 ++++----
 xen/include/public/arch-x86/xen-x86_32.h | 2 +-
 xen/include/public/arch-x86/xen-x86_64.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index 14c48929d748..7b17af720566 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -4,7 +4,7 @@ Hypercall ABI
 =============
 
 Hypercalls are system calls to Xen.  Two modes of guest operation are
-supported, and up to 6 individual parameters are supported.
+supported, and up to 5 individual parameters are supported.
 
 Hypercalls may only be issued by kernel-level software [1]_.
 
@@ -18,17 +18,17 @@ The registers used for hypercalls depends on the operating mode of the guest.
 
    * - ABI
      - Hypercall Index
-     - Parameters (1 - 6)
+     - Parameters (1 - 5)
      - Result
 
    * - 64bit
      - RAX
-     - RDI RSI RDX R10 R8 R9
+     - RDI RSI RDX R10 R8
      - RAX
 
    * - 32bit
      - EAX
-     - EBX ECX EDX ESI EDI EBP
+     - EBX ECX EDX ESI EDI
      - EAX
 
 32 and 64bit PV guests have an ABI fixed by their guest type.  The ABI for an
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 139438e83534..9e3bf06b121e 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -12,7 +12,7 @@
 
 /*
  * Hypercall interface:
- *  Input:  %ebx, %ecx, %edx, %esi, %edi, %ebp (arguments 1-6)
+ *  Input:  %ebx, %ecx, %edx, %esi, %edi (arguments 1-5)
  *  Output: %eax
  * Access is via hypercall page (set up by guest loader or via a Xen MSR):
  *  call hypercall_page + hypercall-number * 32
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 5d9035ed2230..43f6e3d22001 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -12,7 +12,7 @@
 
 /*
  * Hypercall interface:
- *  Input:  %rdi, %rsi, %rdx, %r10, %r8, %r9 (arguments 1-6)
+ *  Input:  %rdi, %rsi, %rdx, %r10, %r8 (arguments 1-5)
  *  Output: %rax
  * Access is via hypercall page (set up by guest loader or via a Xen MSR):
  *  call hypercall_page + hypercall-number * 32
-- 
2.25.1


