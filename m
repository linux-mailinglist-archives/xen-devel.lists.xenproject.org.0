Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B0642615
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 10:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453348.710967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p285a-0003Ze-Bn; Mon, 05 Dec 2022 09:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453348.710967; Mon, 05 Dec 2022 09:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p285a-0003W2-8w; Mon, 05 Dec 2022 09:48:42 +0000
Received: by outflank-mailman (input) for mailman id 453348;
 Mon, 05 Dec 2022 09:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p285Y-0003Vv-Lj
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 09:48:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1c9fb1-7481-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 10:48:38 +0100 (CET)
Received: from MW2PR16CA0068.namprd16.prod.outlook.com (2603:10b6:907:1::45)
 by MN2PR12MB4517.namprd12.prod.outlook.com (2603:10b6:208:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 09:48:31 +0000
Received: from CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::6) by MW2PR16CA0068.outlook.office365.com
 (2603:10b6:907:1::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Mon, 5 Dec 2022 09:48:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT095.mail.protection.outlook.com (10.13.174.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 09:48:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 03:48:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 03:48:25 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 03:48:21 -0600
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
X-Inumbo-ID: fe1c9fb1-7481-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqmnQFN5xuvJA4SZkTYPlLGTNCWkH+DhvYScYUaGthtgSG3cLWoF7mnI49S2LzSXasStIQuR2ZadyBeCsESaA7alMHmjQnJ8c3l/JTGiXerzYG6TtG6uUnBFeaowqDlFIYQ+lvnq+4tnU5OLxKuhp6RrcLJV7AFcGm7xxnpcG4s6jbjKWxUXAGWqWz9qYLW3FsJyKWSUadr5xvgI3vml4n4Lq0oIKz0+5y5VkZwBrA0wpWstUrLUsWentwqDbkSDjh7X7A9Mtq0Juk+8ygwOhp3ioFkZj939PFfLu8go0hlVqv9f4G5a/5Gc5IYFaPys0MWh5LuWCbH0NWa2gPZb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20ryNnGNPQDT4mK1apo5Tw0vv1oAeHdsEvs0Z36DP40=;
 b=WespqZxU2uuTnOE0xbBKnPFnYlIW+VpaYfcpcYZhBOmKYA9VVN05Jhm89DWzpkpnWj1feNd7f7taSERvewlLxOmfnSXacU2ZhfkW2pFpCn3usbr6BL8HLiDnHaZPVwdyYLMyvKBIqWQkJjbSzPB3zagSNFtt4ifJuukKJuKMYdGaIqk6rkFCngaLtbXzqqhoksoy3QcBS7W2WuhRro4Byj726os1MpDlqoXvqIJ9Ym9DunVbPBG3MDRswn3qEgbj41h+vkOi4ofHxh/gHjapgXRkgiF5iUVOuoyD0sjY5WexjGOIa7+LuH6+yyc2elEzOV4kYGqavRl1gvxEqDN9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20ryNnGNPQDT4mK1apo5Tw0vv1oAeHdsEvs0Z36DP40=;
 b=DoNrW3rkRnHeOSvCa+Vz3mZiLVcP+bi/vcHYA8EjpA0MrNbZ/82Bgo/ckvT7x2i0RQV9PK2r5Q0yJibv2lRu3jaFR/q9iUCKfEn/lprWzbEWljmGLETGoC2cYfmaz2xJ8fGSj8meft9L8x7JGPV0jacK2cK64gxJgj5qykN/N0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <bobbyeshleman@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4] xen/page_alloc: Relax the BUILD_BUG_ON() in xenheap_max_mfn()
Date: Mon, 5 Dec 2022 09:48:17 +0000
Message-ID: <20221205094817.21062-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT095:EE_|MN2PR12MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d82896-cd03-4200-78bd-08dad6a5de13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QqHLvwbRbLHz43TEkSEmzgvpybW7xCkNlq1nh1bzKjKyZPMftlYXc4sauaj8PYbMNXkA0CBky1RskJAisM9TxduvWKN99Cwedq7+EbQlT/ZbvxnmrkNN7xb2yfo84DhGaCeCO+OalnVEu8t4C/Vyety+N8w8HxOMnFwYcvi7V5L7Uxh7p2KBUdw11Oi5xe8gt5wafk60JLh13LLUzfRGj2+oabz+ydSRjHKTKQTA6knGX4DomO08peqrR5eobk5oVRu2xd9ySSBiDiFn7tY0TLSC+jZGk40BZCmXSVxHJmBPbSCRoEx/v5tEaqG21YdEO2NzDTHC8qWmXh/U1zkgpEx52oEJ5s5GKUJBhG7JUvulHNgoAMzf+w+/i92ov8erIoyufZQv2Forjszb8E6eT6IzoVByUyl3eCdgzr1iVUEGAHgK8qaRov2OvTaNcdlmL6yqOSl+STMapJg8e3py9K2jUUADwK5KwgknITCoH+oeUNa0+VFcToyaO5homQKUq9D98x3+DXMDCQP8ya2GL5cqkcmwByZV94ACufzn0j2hIYl1pHGnORUUiHTTuZBb+RngiYoFYRO2c+7P512tHCSWmHxVK4F8ILj2TfdOHe4vbHAmD+43/A42S8Iw0qfLI09eJ/qub9U8deB6CNGdeS//79i3YDy+UtoekVOza+YFo5t2cJELU58Gkn7st7TWiIWdwrn7fc3HFxZr+d8idD8QsJbcK2Aj4J70SIFBBrQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(1076003)(336012)(186003)(316002)(54906003)(6916009)(478600001)(103116003)(82740400003)(40480700001)(356005)(81166007)(86362001)(40460700003)(36756003)(83380400001)(26005)(47076005)(2616005)(426003)(82310400005)(6666004)(5660300002)(2906002)(41300700001)(36860700001)(4326008)(8676002)(70586007)(70206006)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 09:48:30.8550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d82896-cd03-4200-78bd-08dad6a5de13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4517

In the near future, we are considering to use a common xen/domain heap for
Arm 32-bit V8-R. In this setup, both PADDR_BITS and BITS_PER_LONG will be
32. Therefore, the condition PADDR_BITS >= BITS_PER_LONG will become true.

Looking at the commit that introduce the BUILD_BUG_ON (88e3ed61642b
"x86/NUMA: make init_node_heap() respect Xen heap limit") and the current
use, it seems this check was mainly to ensure that the shift of xenheap_bits
is not going to be undefined (>> N for a N-bit type is undefined).

So far, all the shifts are using "xenheap_bits - PAGE_SHIFT". Therefore, the
existing code should work for 32-bit architecture as long as the result of
the substraction is below 32.

Therefore relax the BUILD_BUG_ON() to check that (PADDR_BITS - PAGE_SHIFT)
is not equal of above BITS_PER_LONG.

Note that we would need further precaution if we ended up to use
'xenheap_bits' alone in shifts.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Julien Grall <julien@xen.org>
---

Currently this change will not have any impact on the existing architectures.
The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs

------------------------------------------------
| Arch      |   PADDR_BITS    |   BITS_PER_LONG |
------------------------------------------------
| Arm_64    |   48            |   64            |
| Arm_32    |   40            |   32            |
| RISCV_64  |   56            |   64            |
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

v3 :-
1. Updated the commit message.
2. Added Julien's SOB.

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


