Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D184DE90
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 11:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678105.1055149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY1ti-0006jQ-Pd; Thu, 08 Feb 2024 10:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678105.1055149; Thu, 08 Feb 2024 10:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY1ti-0006gD-MU; Thu, 08 Feb 2024 10:44:50 +0000
Received: by outflank-mailman (input) for mailman id 678105;
 Thu, 08 Feb 2024 10:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Up58=JR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rY1th-0006g7-HV
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 10:44:49 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13842ea3-c66f-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 11:44:47 +0100 (CET)
Received: from DM6PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:100::44)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10; Thu, 8 Feb
 2024 10:44:42 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::f5) by DM6PR03CA0067.outlook.office365.com
 (2603:10b6:5:100::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Thu, 8 Feb 2024 10:44:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 10:44:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 8 Feb
 2024 04:44:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 8 Feb
 2024 02:44:40 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 8 Feb 2024 04:44:39 -0600
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
X-Inumbo-ID: 13842ea3-c66f-11ee-8a4a-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2bcZFAkakoZypWyc7LQEQYZwWGo0Jb6fu//3u/ZZabzF/eboREq16Je2Lg+JyOmsUGptmytC2Culdtsa17p+985WdNF4sEZnLXMdNJDk/hWPAZncvhLOHYqnRXOqq57/Pji9z4n5awAXz74+16F/D9Qo8Wi1Pa/Xr5OiEQPH3KH/nnMtXK9M+kRlK0RWIKfd+YvCo+e8NKK4RQRDVncjheitfQ5TZyrJXvDy8LMCFfLBmvn4LzeMKUVOI1eeGFmUtZ9eJgnd4SeMKesKwJzaSgm8sbdHTR5ATVQUnf7jnsrUzEVPiRaAYeiuWBxghQlwNgwZ/NnAVegdmWX/lYqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qe6SRiNUmo8alfoEpeT1FGLlqpS/CEq6DFcwSK5kqkw=;
 b=TWtBHGWo1nB0eVHAjLHCQjTMafIXRmFPqpUTcvurws7IDciFgk31b7hvYoxfm0HFIV08nrLwLExnLtGO8Nquo7qicuhqAnQowGvowMtnYjllOGGjdo3O4y1ixc/ZF5tfn9ciNJJwglpL6SQV+NJ9Xr80NVXV95oZlum34/AhChAY/sW7AWsMtstJtEf6gNYfG3lrm5LccE4ga2z4Lj4z+x4G22n2ia0C74/MRtOuYxjT121OHcEkH3vr5G3gyhpAFkXSM/JPQwj8ovNm6GrhL/fjxiBAyPnAAGh0Jj1gmiLfyQroXI+OMxbVIXMa5+DGoDmX9IPrFRSYVY6bsSjRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qe6SRiNUmo8alfoEpeT1FGLlqpS/CEq6DFcwSK5kqkw=;
 b=kJMezAY4MCN0m0O3VdW2RYEVk56PaAB61QNmwSxYWnmMiWUGGK6lRqbHFoRwvP5j0eAgAzhKLhhHRPXMUlTsw3ooSr8sFIHLiWYJtVUwXHTHyj/B+bH3sblxzbO4rpiR9uVg+BTe8EeDHjerY1eBAD/TluUW+rlPnUz+4E0SK6M=
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
Subject: [PATCH] xen/arm: Fix UBSAN failure in start_xen()
Date: Thu, 8 Feb 2024 11:43:39 +0100
Message-ID: <20240208104339.37826-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b20c5b1-5205-4f79-1f7c-08dc2892f4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRthpoS3OagOnjDMjqB+nProMbElFIIdTlvrIY8CUsErkGRkSIHEWCDE2WnL2xMXw+GxkQkX/qUIrkB2tUPALLYJpTmzZAldFvnYXQUWIULNGrejcXv+GlyHtRUQD+VdHtibWFqtyddrAcJkw2zxCCsxEo3Z2NSGOoRmkEXISAafgoJaCkoXDlgzN9iCD/qttREKyRazJxaUWPLExOwZmy11fh0Lyp5EXS0g9rIUpful/15Nj/kddz9jRnr7+8U2uZ1WQlG+DkB2CwnbpPhTousAp+t1Sei2QGV6FLWsLtQl9DQ0aW1kariHSQBS2giKXPYKzJm83YJIOzC3smK7gLK8KvLhyx07o2YmVqPlei1x/ng+ps5KLL5OEKhWPzTCCmNo2MO7aVKU0J6Ot8o/fRu3Orrg0zw02JuXqsvIX5K7DzcqZ0Kuc5I3qwx1iADfqgUwE+trZRmmjtANGUXwy5b6J2nnSosQBJngfgoOobiP1npohNxnCGO1GLcntYDEgkIfpK7uXuJ/N9gh8zMa7nqomzxdCxxxm90zsDSgcB+SeBDTjdBLWT/GzWDPaS3kwSoK69JNrv+u5udj8i5nIRKd3iU0uoSwuDlaCmBwbwQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799012)(186009)(40470700004)(36840700001)(46966006)(41300700001)(2906002)(8936002)(44832011)(5660300002)(8676002)(4326008)(83380400001)(1076003)(426003)(336012)(478600001)(26005)(2616005)(36756003)(86362001)(6916009)(316002)(54906003)(70586007)(70206006)(82740400003)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 10:44:41.5297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b20c5b1-5205-4f79-1f7c-08dc2892f4c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538

When running Xen on arm32, in scenario where Xen is loaded at an address
such as boot_phys_offset >= 2GB, UBSAN reports the following:

(XEN) UBSAN: Undefined behaviour in arch/arm/setup.c:739:58
(XEN) pointer operation underflowed 00200000 to 86800000
(XEN) Xen WARN at common/ubsan/ubsan.c:172
(XEN) ----[ Xen-4.19-unstable  arm32  debug=y ubsan=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<0031b4c0>] ubsan.c#ubsan_epilogue+0x18/0xf0 (PC)
(XEN)    [<0031d134>] __ubsan_handle_pointer_overflow+0xb8/0xd4 (LR)
(XEN)    [<0031d134>] __ubsan_handle_pointer_overflow+0xb8/0xd4
(XEN)    [<004d15a8>] start_xen+0xe0/0xbe0
(XEN)    [<0020007c>] head.o#primary_switched+0x4/0x30

The failure is reported for the following line:
(paddr_t)(uintptr_t)(_start + boot_phys_offset)

This occurs because the compiler treats (ptr + size) with size bigger than
PTRDIFF_MAX as undefined behavior. To address this, switch to macro
virt_to_maddr(), given the future plans to eliminate boot_phys_offset.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7e28f62d09f1..424744ad5e1a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -736,7 +736,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
 
     /* Register Xen's load address as a boot module. */
     xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
+                             virt_to_maddr(_start),
                              (paddr_t)(uintptr_t)(_end - _start), false);
     BUG_ON(!xen_bootmodule);
 
-- 
2.25.1


