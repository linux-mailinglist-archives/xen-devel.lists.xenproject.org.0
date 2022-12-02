Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214086406EB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 13:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451934.709726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15H9-0003HS-Do; Fri, 02 Dec 2022 12:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451934.709726; Fri, 02 Dec 2022 12:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15H9-0003Eo-AR; Fri, 02 Dec 2022 12:36:19 +0000
Received: by outflank-mailman (input) for mailman id 451934;
 Fri, 02 Dec 2022 12:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJJJ=4A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p15H7-0003Ei-Eh
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 12:36:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e86b784a-723d-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 13:36:15 +0100 (CET)
Received: from BN1PR13CA0015.namprd13.prod.outlook.com (2603:10b6:408:e2::20)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 12:36:08 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::b8) by BN1PR13CA0015.outlook.office365.com
 (2603:10b6:408:e2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Fri, 2 Dec 2022 12:36:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 12:36:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 06:36:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 04:36:06 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Dec 2022 06:36:04 -0600
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
X-Inumbo-ID: e86b784a-723d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn6JTb43WcLoLon/rgn9B7W9vG23WUB08COZsB7nRiFHKb/c3tUFfqdmLHz9YglISF/4b7W4zRiftS4S6mP3n7HQITh39p9Cd8nfF5spmF4/lQGe1EX8RgsHdsjQl7/Fh9BES+Nyw1PspvUDTuyY+hPktT4RcklGJ0OvqCX+MuYK6p33xEHbW6gRhmBWjkiqZTj3I2+Upb8LcBUFCSSwZnyUpW6SzqMxlJSLi90WiXpAhQgeSD9gIp2P4fr8BNnRcllczjCsL1ZtzoZOzfdq7AxV4Es6iwqnGXA/a1CM0i+AbO+Uc02T7HlASIuKtkODA9i/A8xYhrFxuBYHGj14Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgHT1+lbjR4JTCrqNY8MheImjOa7MHsLTBAZGqdrZJM=;
 b=J6+EHcHWmLTDjHCaA3m6RlM0uztS9AR+7R8Pf3e1LUXS0VNkFeGgPfTsSsb1R7BZrK8aw27BumjvxSMGtLEeUa7ewiGwRIRFTDTF6g7u5vHgJcl7GdvUfUbmX/hDdX8ZXVgo8rtNQTznjlCQcU85s/9dLbTzSBtA6tI47bsfXIDhxmF6LKPzgJruqzOgUJq8XHIuS0QqM+7mT1lYExbSqhXGOtvJoijf/h4Fvhs+QbNBqx4Lrv2GxwedrE/1+AqlMvENU0csszZ9EYeLRId7zpja70iigpswf1iKodJTqHc3+s8fpDLQ/7UPS8zambwK+/pbbaFirOuf7kn+JUlwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgHT1+lbjR4JTCrqNY8MheImjOa7MHsLTBAZGqdrZJM=;
 b=fCipbyKHzwdrKO5cykjI1mJbMcqNzW1V5ZiLJJGvqdNh1mskBCrXOWk9JVpNaspI289g8t7Bi8MHFYxlgLZVOPtn4ewrCGniAgW2rzKAVWH0uepGSISfQ8l5I6odz3v5+//+mGNuPt0gAXzvqkLf1QZbpanuclHclijMYNTEzEM=
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
	<bobbyeshleman@gmail.com>, <alistair.francis@wdc.com>,
	<connojdavis@gmail.com>, <wl@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as a rhs operand of shift operator
Date: Fri, 2 Dec 2022 12:35:59 +0000
Message-ID: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT043:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d395dc-39e6-4161-6de6-08dad461c962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJAM8npwqPkMcR0Jqc+fp9oWfVrgy/T4mFYkjqyWaxgoar5US8ZoqH9XbWuWW7twBxD88LZCZa3zF7rLOElNCrz00lJIF2FdIEUTkGWCG8OXSFVZfDEMhYEyh0l22CBEVLP0CfRtOFkE4tM+XfbRokFFLn1SmUhlV5M9zbRhGFv4yFzUJ1nqSkT70lq6NfiXbXYQZ1CuvlrDX2eE+uY72TAWGU0azQ66sIii1J/yf+mlPv6320eMdqHHryeH09xLTQhoKOCjSi8dAj9d5xLR094lGVsuyVVwUL7rVFwA5OyVByneeH+gJGsP8Xg3WqwPD19R3Sgj9J8te8aqZmiFaOrOuOf/mAOetNX/bK4O6+kaRLj54aKiNkEpUf+g71ADu/NohjDxKuzNKcNYzl4vSxzCYMowlI4UwlpkDa/d5FXTqE3Mn8CzxUwNNDr9t+uinkwAiBLnaCrBd5BkMW6J8MIK4IUVgOTgjPAukeQ3YNuEA361A+p1ybSKNf4DE5oOE3OVxIWqzWKJId500AT0D+/uo1jDA95OLZfP8wGg9rfGC5uJN+3ZcLZf9Ktmbgzlad3fx8PBtyalGlodMH5ScV9JFc9JpQJRDcLqUz7tujEnLf3g51Yyp98FbQXHeO0Eo8x28QY/vZPR2elKw+VTNzGIjz1UZGRg5h/FRliIFI9ejkKUssdu/XQ+09uwGCkfSgudbKj4dfib90YBHPvuyXJpEsnhz0PqoICz/3voaVI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(356005)(6666004)(478600001)(81166007)(86362001)(103116003)(40480700001)(36756003)(82740400003)(1076003)(336012)(36860700001)(186003)(47076005)(2616005)(426003)(40460700003)(83380400001)(4326008)(41300700001)(5660300002)(26005)(82310400005)(8936002)(7416002)(70206006)(8676002)(54906003)(316002)(6916009)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 12:36:08.1465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d395dc-39e6-4161-6de6-08dad461c962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287

We want to ensure that "xenheap_bits - PAGE_SHIFT" is strictly less than
the number of bits to represent unsigned long as it is used a rhs operand
to shift mfn.
It is also important to note that the "xenheap_bits - PAGE_SHIFT" is never
used to shift an address (rather than a frame number), and going forward
then also shouldn't be (perhaps unless further precautions are taken).

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

v2 :-
1. Updated the commit message.

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


