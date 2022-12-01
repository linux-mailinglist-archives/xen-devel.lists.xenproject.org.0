Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4B63F746
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 19:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451107.708717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0o2R-0008QG-Oy; Thu, 01 Dec 2022 18:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451107.708717; Thu, 01 Dec 2022 18:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0o2R-0008OC-M3; Thu, 01 Dec 2022 18:11:59 +0000
Received: by outflank-mailman (input) for mailman id 451107;
 Thu, 01 Dec 2022 18:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywn3=37=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0o2P-0008O6-PC
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 18:11:57 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3086b69-71a3-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 19:11:56 +0100 (CET)
Received: from CY5PR22CA0067.namprd22.prod.outlook.com (2603:10b6:930:80::12)
 by PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 18:11:52 +0000
Received: from CY4PEPF0000B8EF.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::56) by CY5PR22CA0067.outlook.office365.com
 (2603:10b6:930:80::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 18:11:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000B8EF.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Thu, 1 Dec 2022 18:11:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 12:11:49 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 1 Dec 2022 12:11:48 -0600
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
X-Inumbo-ID: a3086b69-71a3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9wBOhLlNJODU5z0yfmxO0SnxGzQwyanHS9mzfdp1b0N1ErVH97CLPuSjlZQ6mrVM/uNF4wlieFp5gbm6BOouMEvbGsvOPjfFsvRQd6ZP3y0SzRrRgijdY7BK2xfiY1ROhTRpoJY1tMpiF1ZXdkWvZXutYMoSB7LAJv4ZGbBa3Col7tFAa0jbhcjd/c1UZ+spd2BlBwzcchX5zHtlMS6ScbWHqqRWFdJNSYpjgG5u4dLe4ZO4yIMolmfmIf3zWTPHdqQogibpDWGQC3ptc1MzLrdRLKLeG15MVcbedDXSWRJFvIIigBDrS3uJcWprLFu24RjCvs1zUFedjM4WqcP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBk54R9gCaMVtABGteSoPyhIV2+CBrDX7Da5bY9h0OY=;
 b=YB+Pm2MTesJJUs3FArtBMP3Ign4YJo7iblUOFVMgb2WG6McDe1+gWXQ3W6QP/r2KUvT8dtiAPTv7DIeUYBdiekVAy5+q2iMU3azy1eLpzwGftfGDLTmPPVCy5HCc0Z20S5ACPwoh/Ex6MkSM59u3eWHqg2KP/Y1pGR11cGlWyokPkX8Qk8Qj23n1uyNks9i5qDeYYkF5bWsFIu43KqXlLhoEPI+10PcuDnlAmXf/NmrkHa9xjA/QH5pvvxyHNXO4p6pnUmMP/+t2LsTNHv348oYYFRpmGrSoluMLpDWKt5uGL5nBW2JdVdcpp1pnsnHXDvF3cdoEaWgVmMCbkavyPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBk54R9gCaMVtABGteSoPyhIV2+CBrDX7Da5bY9h0OY=;
 b=hHz9/pOETeLlvpzWq8yjc5xlYSUtm97dS9dgnbOTWxMxygDWc52N9NccmE4LBv3vI3TSsbKeXwFZNB8GNFuwldO8lb2PKFEVk+xvoN5FncsNisOZpEMTK60I7ebBsGo5ZmqM59uRg/JRSnjeYb+8DF9KdQgSEbcJbOW9LzWNWTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v2] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used to shift "unsigned long"
Date: Thu, 1 Dec 2022 18:11:45 +0000
Message-ID: <20221201181145.45279-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EF:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: ad91d816-865d-4166-746b-08dad3c7856a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DeWajChwOYHatO/zI7Tr3KfXVFwuZJWnLG1fChq/Ij2CUuWi93pXRyry1r8Ygm5XKSY/7pZQtbcUsDHYMVTx3viPr1yjUXsOzrmmhoI2b5+29LQO+ktINqovUZP+d6io3+zNYprbAM+yPToRlujPPs2SKF4A9MUTlF/N2UMOmoLeBWQQ+5QyZ2hcJ80m453IUVKDlJcGOWcDObpsGQfIdsDVZUwJqR4erx8kr9LTfo/SGnxaYlwbT91qlLWg4rGICWMTBwQjMjdMkc54rYUcS8tR6ovFxdbdniLwMlRDwtYvVbJJaTnJHVHh+smsmhyXyJg2GAlD8BUAgaZM4kDWsTbEJF/Q6EmeBjEPVpsYhkE3w5bNKntGD3uU/0p+3MX8sFUhCCJ9j6W9F28IFKGcIS6xu9fcfaYTenqNlF/q36nMKZD/XcSgciy351yzy5VuDx9DOVJC3WMySyvX8DtJnxel+1ff2pKrR1cQ9F+rvgcY9YOqrPtCTqCosiDbR61uP6ERfdQtIMM1JFz5LCuftJmGj7wdKpCHoKypplkSL545X31xQjVfqbxXRbJ29uveZLpdo48Y4KfTWBuEEcF8cppcCyCA5iOaxDZt70Zhol2uNAY5j7tIBxqkKkqC6IMYd8rCsoYrkZcysOz+/I/uRdUNVws5Tq8jbHg3R8dFBNP5mZW8JlWbcYbccsN59EwQiW6aWbyRCUKnrNXOrcRNAWFQE1LKPvjgL68zn+8RNuY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(26005)(316002)(103116003)(4326008)(36860700001)(54906003)(70206006)(41300700001)(6916009)(8936002)(5660300002)(82740400003)(47076005)(40480700001)(356005)(83380400001)(426003)(81166007)(86362001)(6666004)(40460700003)(478600001)(8676002)(1076003)(82310400005)(2616005)(70586007)(186003)(336012)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 18:11:51.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad91d816-865d-4166-746b-08dad3c7856a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564

Machine frame number (mfn) is used to represent the hardware page address.
This is an unsigned long variable. We need to check if it can hold the complete
range of hardware page addresses. To ensure this we check that the count of bits
represented by 'unsigned long' added to the bit index of page size, should be
less than the count of bits required to represent the maximum physical address.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Currently this change will not have any impact on the existing architectures.
The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs

------------------------------------------------
| Arch      |   PADDR_BITS    |   BITS_PER_LONG |
------------------------------------------------
| Arm_64    |   48            |   64            |
| Arm_32    |   40            |   32            |
| RISCV_64  |   Don't know    |   64            |
| x86       |   52            |   64            |
-------------------------------------------------

However, this will change when we introduce a platform (For eg Cortex-R52) which
supports 32 bit physical address and BITS_PER_LONG. This platform does not follow
the same code path as Arm_32.
Thus, I have introduced this change as I don't see it causing a regression on
any of the supported platforms.

Changes from v1:-
1. Changed the check from "(PADDR_BITS > BITS_PER_LONG)" to "((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG)"
2. Updated the commit message to explain the reason for this.

 xen/common/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..c5b8c7444f 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
 {
     ASSERT(!first_node_initialised);
     ASSERT(!xenheap_bits);
-    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
+    BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);
     xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
     printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
 }
-- 
2.17.1


