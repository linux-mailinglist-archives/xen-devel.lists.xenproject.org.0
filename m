Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B66F1DCE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 20:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527476.820135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSWm-0005de-IR; Fri, 28 Apr 2023 18:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527476.820135; Fri, 28 Apr 2023 18:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSWm-0005bM-EH; Fri, 28 Apr 2023 18:09:04 +0000
Received: by outflank-mailman (input) for mailman id 527476;
 Fri, 28 Apr 2023 18:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNg-0006fW-56
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 714437a0-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:59:38 +0200 (CEST)
Received: from BN0PR04CA0185.namprd04.prod.outlook.com (2603:10b6:408:e9::10)
 by DM4PR12MB5119.namprd12.prod.outlook.com (2603:10b6:5:392::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 17:59:35 +0000
Received: from BL02EPF000145BA.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::9e) by BN0PR04CA0185.outlook.office365.com
 (2603:10b6:408:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.25 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145BA.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Fri, 28 Apr 2023 17:59:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:34 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:59:33 -0500
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
X-Inumbo-ID: 714437a0-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNJFPjwP0pZxrbqYJFpKRMh++hOK7cQZCZ1R7MIqhcdVpBTHrQfKWfiWykIV1RQMB2sJ88Gc668TW3520fee6QG66UA5gc3gw4V0VRcyq7sLAxkGWhdxrr/H5yEWuOcC94blk4KlWURuwbvoiOZG0KT3TQD/uX7V+/L7DyiVORZ+fok/pG6lDbRJdngiUMXwt3yYtbfGSaA5EP4KE2qhRwOzUdyt5ixduvWS7w+rMFAtiEwXloxFsTzNkdPfX+eB7yv2dpTepeRTKzzQF8BQihYxCX2iSS3D5dfv0aC4wViDYznNYFcDdJdQVZgV95Ns6oKFtjio5pVph07ONeoPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6Q5ypvhP+q/whBG3MtdTSywgqoOEnfxXXcGmqYwu3k=;
 b=Y7N8UCp3DlCAIXy4CpTb+Ek6w93IpEGfox2FUgYPecwBpV6t0GVBNTPwFcbExIKYNhAhro9qwlJwtTKKwMaDIDni20K2d/YGUIVfgoMDNab6SyFBOgiOeIvYnTrEuwFM9Np492LEDHWbqBN3eZCP2mKrSD22TelGcIj1nP9wFxafx4DN8nCOSLumUleNemDzkDmystlzbuMJfnGxMaDNNueC/7jVl2eOU8bPGnZKP7lLvlnLtX17qdftzazCU2T361sokcvE4ajjSyeDxMKsV2KZSfIA2+okQnzGhz/3WsXaBtshb408Tb2hUamFxrRCUsGOlFJIzVrUUV3fDy+4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6Q5ypvhP+q/whBG3MtdTSywgqoOEnfxXXcGmqYwu3k=;
 b=mLGU3sDV/qaWmiKR9iYGmfZr1UvqMu01Btkd47beQ7oa7mjxXOrNRYllpB8NIQUwIvepwKhgZZH4l57XyUiHlQONzfk7I5L7voRPjTLqHFix7hty66uWXQu9x+h/57/zHsVDGIj04MJkPikFR+WNn0htIaoqexjqDuVcvmPNJqk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6 12/12] xen/arm: p2m: Enable support for 32bit IPA for ARM_32
Date: Fri, 28 Apr 2023 18:55:43 +0100
Message-ID: <20230428175543.11902-13-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145BA:EE_|DM4PR12MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 3971b29a-7fbf-41fd-fdde-08db4812536d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DWLYNZ4mdaXyrDy44o5pO4nuzXBOGZEtLPYFscggbmlZtxJ9wyw+eJqOcOtdlufEtVTrZG4ykzuiEZwQCU+tnGq0ht18PIR4IGQdjspt6y+xtH72sU/DMRANHXEzN59hb35ht3gB2BZj5q1GtxgeT3jIBxIQ5+g4JwgANn6YnhlyxJdtXzWAemfIXshC4MnqYlFps3hYLqWi7Uo5mEOs8kFB4114kWDqJ3nVgUT5F7xacBGtAMzcgE9WzG8CtOVZFHCuN8PdD+f2gvEfbRnx6a8174W4UVzrPbzzqMQOfVtMKr3K9ONqoopTYRsBYBhuBJiNsUD3Ztb+pqwod0jwFOB8d3mImBNgmC7ngwckDzOjm9heyGRiiiHHbEmTKJN2G5xsfFnRakSHxvHCKbke+F60pNonUxHA87yQ120t4ORBaXw6c+LBStNdQecWQmBiNfQWKBD3OwsPwzeUcfv10t3KNBGLGPahLn4YMYoGiy6Htv1T3J/ehIGWtI1gxty3pcNE98GdXqzQMqo+pgUXPdH/2npdtSDCPqZLJ/ZLx8Zu7zICAhMc9O6T90MeIiEt48VWC4gy1iT0s4C5h41JrsZppJFd3M29OY8BB7iFPBeT+4MxvrP4CaQ2JgLcaMdi6gPZVcUy5QZnPzeyVe95zD6AhHFX9p7OZkThXocpO5BgBlZalU77cdVdzxUul8NsIgDMsODZiyLAoOqbsmCW5r8HNpSkpwX7zZe9XUeSe3A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(186003)(26005)(1076003)(41300700001)(81166007)(356005)(6666004)(426003)(83380400001)(47076005)(336012)(36860700001)(2616005)(478600001)(54906003)(40460700003)(82310400005)(7416002)(82740400003)(70206006)(70586007)(4326008)(6916009)(40480700001)(316002)(5660300002)(36756003)(2906002)(103116003)(86362001)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:34.8916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3971b29a-7fbf-41fd-fdde-08db4812536d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145BA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5119

Refer ARM DDI 0406C.d ID040418, B3-1345,

"A stage 2 translation with an input address range of 31-34 bits can
start the translation either:

- With a first-level lookup, accessing a first-level translation
  table with 2-16 entries.

- With a second-level lookup, accessing a set of concatenated
  second-level translation tables"

Thus, for 32 bit IPA, there will be no concatenated root level tables.
So, the root-order is 0.

Also, Refer ARM DDI 0406C.d ID040418, B3-1348
"Determining the required first lookup level for stage 2 translations

For a stage 2 translation, the output address range from the stage 1
translations determines the required input address range for the stage 2
translation. The permitted values of VTCR.SL0 are:
0b00 Stage 2 translation lookup must start at the second level.
0b01 Stage 2 translation lookup must start at the first level.

VTCR.T0SZ must indicate the required input address range. The size of
the input address region is 2^(32-T0SZ) bytes."

Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
input address region is 2^32 bytes.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - New patch.

v2 - 1. Added Ack.

v3 - 1. Dropped Ack. 
2. Rebased the patch based on the previous change.

v4 - 1. t0sz is 0 for 32-bit IPA on Arm32.
2. Updated the commit message to explain t0sz, sl0 and root_order.

v5 - 1. Rebased on top of the changes in the previous patch.

 xen/arch/arm/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 1fe3cccf46..6e13772cbc 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2265,7 +2265,7 @@ void __init setup_virt_paging(void)
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
 #else
-        [0] = { 0 },  /* Invalid */
+        [0] = { 32,      0/*0*/,    0,          1 },
         [1] = { 0 },  /* Invalid */
         [3] = { 0 }  /* Invalid */
 #endif
-- 
2.17.1


