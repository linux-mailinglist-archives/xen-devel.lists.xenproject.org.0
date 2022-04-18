Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533B504E42
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307091.522403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQH-000452-Tn; Mon, 18 Apr 2022 09:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307091.522403; Mon, 18 Apr 2022 09:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQH-00040C-MJ; Mon, 18 Apr 2022 09:11:53 +0000
Received: by outflank-mailman (input) for mailman id 307091;
 Mon, 18 Apr 2022 09:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNOD-0006ub-Eb
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:45 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe08::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c68361-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:44 +0200 (CEST)
Received: from AS8PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:311::33)
 by HE1PR0802MB2489.eurprd08.prod.outlook.com (2603:10a6:3:d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:24 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::86) by AS8PR05CA0028.outlook.office365.com
 (2603:10a6:20b:311::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:24 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Mon, 18 Apr 2022 09:09:23 +0000
Received: from 0675bfe1463d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 060C464D-32CF-48A5-80EC-4AC72AB3D0C0.1; 
 Mon, 18 Apr 2022 09:09:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0675bfe1463d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:16 +0000
Received: from AM6PR0502CA0051.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::28) by VE1PR08MB5629.eurprd08.prod.outlook.com
 (2603:10a6:800:1a6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:14 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::b3) by AM6PR0502CA0051.outlook.office365.com
 (2603:10a6:20b:56::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:13 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:11 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:08 +0000
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
X-Inumbo-ID: 49c68361-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29LYeiieE23CD0WLwJtnSYLtGaVHDf97F/bctCj7n5U=;
 b=Ki2e13f7txQp2lVU1auB2Mskus6Vu3CeqUunChNJF3PNL9PWPBoHQN4r/pRVj+YC7j73D2DxAYl0ldcA1AHJMqidYRPWqanpAeT6HCbq0rjguxOBbkO844wS/btll53P6ozf6vuZOWNF84lDIVc75oBCFR4aW9ewRpiKAcCadnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65cdb1ba32225669
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnUbvlFfTLseXlX229YjrFVy49gUlyHRQ1XUjIDI9eRkFv+e+zXzij53P2QPvak147CUgrm9WsNr+WXuiQ0WPEBhTlwens/olTlZK5PO9VEybSeB/3c/CbyOZPFAXP4sMXRZnfctfkzT9tiEcDaQGtJa2S9LXAQuP9MaEsFjuol5faaqfXyNP74L24ImUs6nQUuVEglPvajP02cj1NpRf4LkCmA01dTiQl5Am0QDcs3aeuyq8CgO+1b6NiyacD2mLx1Sg9Fk1UmStsiK3stvgl2FzDqSCwM49pKlXJOrlytx/zX+hXvmCtXCr38szNcBY51miXEJyQ1t2N+pk4ujvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29LYeiieE23CD0WLwJtnSYLtGaVHDf97F/bctCj7n5U=;
 b=S4h+BmdlbhNyndFyKuzmOqXQy0lpZfIeg32RbMPgmEw0tFi2SUtPoXZPYGVTN3Epdo8bPmPivcnCqOt+bQ8Hlislto3Gv8bcLfwZkXDqf1uNzgf4/b40Z7UxwnMq+qxRYBa6Z5HvAYPe1Hcqg+dzyD9u/k6/7PA56QheQKktQ3Zgu2qCkA+tjzrAHj76KQIkxg19pxym4K+hVOEfoQi+u4vIu4QW17eVZzI7UQ+mj+fi+A2k5AfEJTEzGBlXcnfXwLRjVwa68WQCMzD5aoNjCYs0d6UzglBd7IyxzPqbX2sXt34jPtZefsdBPBIXqhk6P9iAyySppwIm/i5UIIoaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29LYeiieE23CD0WLwJtnSYLtGaVHDf97F/bctCj7n5U=;
 b=Ki2e13f7txQp2lVU1auB2Mskus6Vu3CeqUunChNJF3PNL9PWPBoHQN4r/pRVj+YC7j73D2DxAYl0ldcA1AHJMqidYRPWqanpAeT6HCbq0rjguxOBbkO844wS/btll53P6ozf6vuZOWNF84lDIVc75oBCFR4aW9ewRpiKAcCadnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Mon, 18 Apr 2022 17:07:30 +0800
Message-ID: <20220418090735.3940393-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 65092e79-f4c7-48a7-aa5b-08da211b21cf
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5629:EE_|AM5EUR03FT013:EE_|HE1PR0802MB2489:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB24899E2F38E3D3966EAC6F189EF39@HE1PR0802MB2489.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7IKQK5lDBBDGYu0rD2Pr0OrXLlFPQVESNGhFivy8MMmjZgSDFxXHdWvvYnRC+HPZz7kWKVVRWj8jhZQm+/ceZ0HMR7b156QxWxiulakBfX8djucS1gD9luwNbz5FSA1f2VQgz8EJV4UEePE6uusEwSnvr5W64yHzDSRpe6ptMhG2654Rc6hSftguphMQwREN8tQN4a4VW9Ahnc5q/DpRhppCvpBh/GbgdjK8qLgrUD8S5c9G4MgrzhnxUd/VUIl3JSPKUvtbHAOQmyZjt7aiJOxyGhdX9gflUP++48Baw5GrXOA+dLv3W+dencJ7Q/NDkwmklrCLbfwAehX1jslDRnroep8xsGOQg8p5dnESLxKQKQbA8DtRFIwDbmxCR+/GaouqyGLB/G/aJDpLeFNz7yZI23i/FoAORyJggsMWIS3zV0f1fBfT40S+sCuF0DlaAiMcyFfIpVsBofRO3FEWC1B4gn8hyZZjl2AYSgXjMNMBdBS0vajE2z3/Ezw0liN81R2EwfrfqSw4EEUI6UQew1Jhs20EWlf6frjHhAAVe6cYSu5EIY0N2LA9Wc5W4puEIcyEVhNOYmub96ZD/hYFi4U5dqK9nz9nh5/Ck6KBv66khVUUdGhMG9jTkzy9usNxf/LeBdSCETI9QFwmowEueQ2e8Z2sdAY7CMS3E0X5ImQtw4TlhbFbbX8Ls9gooZVg
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36860700001)(83380400001)(36756003)(82310400005)(316002)(2906002)(5660300002)(86362001)(47076005)(8936002)(44832011)(6666004)(508600001)(426003)(356005)(336012)(7696005)(81166007)(1076003)(2616005)(110136005)(26005)(186003)(54906003)(70586007)(70206006)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5629
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	400928e9-6c96-4e76-3289-08da211b1b80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OC58Yi+c2HFoaJ4N/2psBKHyhFtkz9Ni2sKz7FegMCGwfzWOMFxbicr3Z0tUAknR6QVlnn929VSd47t2a0m+6AyOXqSFDq6kv1lpWLXIqU8n2sS2zfCuw8fVnE1j9wDWgSznxidbi0oSmwN8oDjhE+GtLcVd8xTItLLNb0dqWPYd3ux+kkChuGyxwfZlm58NzhS4GoejeKs5LMM0tLB6onBcmiIs5QnMZP3ZQQoN24DbRUULovQTq4FUjDGBC2nAiibbpiHtZXRLi+istMuK6JWiBEA9w1DVvpxttkoqDsw28yG91ft6XKLEN5iwCNvsRDcVX5Mv+VYx/2sbEOXNoS6o7B66Bxptuv8aE3WEudYXBj+M+uTnNWZCslliTxnA7swDRfLJlHXAOV4N/5QilusswNhjwdCJuNQ4B5wRog0uZ89p/4KwXpF+xKs/ClPy1Bz8+i2WjmkbobrClbPxU5ElHvn8wbNT0XDtPgrIiPSvJGDo0sh9ZZG8bBsfH3Fg9A3mesFaleKj7wt5FoB8BBcW0eeKRXjTj3DXfJ1u+t+vYCXal/KwnTRkayZi08wtwT6dKwPKv6cviLO4g0vSYZRoxsIGY5xCD84WlqdfM8pdo12dvYSKij2ij8BYQm+FRC7IJdnJ7drA3iZotFJknv7PdfJxk5fH7lvYxBu/jyj9Sle6lHO3zWfUTJD5IHEM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(36756003)(2906002)(83380400001)(5660300002)(54906003)(426003)(186003)(36860700001)(316002)(47076005)(336012)(44832011)(107886003)(1076003)(6666004)(2616005)(7696005)(508600001)(8676002)(4326008)(70586007)(86362001)(70206006)(26005)(110136005)(450100002)(81166007)(40460700003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:24.0656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65092e79-f4c7-48a7-aa5b-08da211b21cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2489

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved when we moved the definition of
   "MAX_NUMNODES" to x86 ARCH header file. And we reserve the
   "MAX_NUMNODES" definition in common header file through a
   conditional compilation for some architectures that don't
   need to define "MAX_NUMNODES" in their ARCH header files.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages.

Because when node_spanned_pages is 0, this node has no memory,
numa_scan_node will print warning message for such kind of nodes:
"Firmware Bug or mis-configured hardware?".

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
4. Use conditional macro to gate MAX_NUMNODES for other architectures.
---
 xen/arch/x86/include/asm/numa.h | 6 +++---
 xen/include/xen/numa.h          | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index bada2c0bb9..1f268ce77d 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -4,6 +4,7 @@
 #include <xen/cpumask.h>
 
 #define NODES_SHIFT 6
+#define MAX_NUMNODES    (1 << NODES_SHIFT)
 
 typedef u8 nodeid_t;
 
@@ -26,7 +27,6 @@ extern int compute_hash_shift(struct node *nodes, int numnodes,
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
 extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
@@ -62,9 +62,9 @@ extern struct node_data node_data[];
 static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 { 
 	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+	ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
 	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
+	ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
 	return nid; 
 } 
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..91b25c5617 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -10,7 +10,9 @@
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
+#ifndef MAX_NUMNODES
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


