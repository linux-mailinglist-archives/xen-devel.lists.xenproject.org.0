Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03B6E13A8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520878.809006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0uS-0005SX-4h; Thu, 13 Apr 2023 17:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520878.809006; Thu, 13 Apr 2023 17:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0uR-0005Kg-TO; Thu, 13 Apr 2023 17:38:59 +0000
Received: by outflank-mailman (input) for mailman id 520878;
 Thu, 13 Apr 2023 17:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0uI-0000rf-70
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe59::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b131b5c-da22-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:48 +0200 (CEST)
Received: from DM6PR14CA0070.namprd14.prod.outlook.com (2603:10b6:5:18f::47)
 by SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.43; Thu, 13 Apr
 2023 17:38:44 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::db) by DM6PR14CA0070.outlook.office365.com
 (2603:10b6:5:18f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 17:38:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:43 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:41 -0500
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
X-Inumbo-ID: 0b131b5c-da22-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyCC0Wrq25jNWdJuqRlARvbyioVPtBe3BnWn08ydgVjAOrcKsJhgPhjLajeNFNuKsJ0z95iHkQZKTH+ZXYxYscokU2RugHLNVqyEITxUR+5Z8XdGO5BS2CjOAXMiIJz4anzYpft3WdVPLT7xgB93xTPdPTcUZRc4uGba7NnRsYXp9E3OfiU2pHY3YYKRZIwAf2l1n7W5quG2fUbIRRQKFfy9w28aejTtvSiTGXxN2Q9dBOimqop4mSs1Af7JSLKUqXe+w6uHgATKMmd5DU8cruewg4ApvcM1AhdUWoMWnpRLO5zzRK6Yhoa0mzN0OBjpSuzQsrPnykaLmvs63BxyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf1B+8bx5vatlGHL4Tv5xbYFLO09J4Ep2zXFRUGljAc=;
 b=f2+O95wcvF1I+OM851PIc9wfxLgzNrR1vWl+uewcfRKOnEh9se+hQ0JvvIejtOPrgJ6Hljemigq3fIiX1SCj5XBkhp+WZLk+6Q8D5dBgH1fN6vWBmACcJzeqUdYTHjLOxFDQSCEQDHEYFexdzOzzi39+CIfBffxjEknI1MT7/+K5fIpLeMjUCWUlQ4QFyJVGOiBixlVoE13/MYbBra4lc/b/0UFddZhHLVTUNDbHU+cJUck462bepEDpxmJBeJmkEpeo6zcURo5e+T+giKlorU5vYB+Bgk1Xye8sAmecUlvAX3qc2qMebGN9dYEq8QCa4CSkjt67yHeiIwcTzfBAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf1B+8bx5vatlGHL4Tv5xbYFLO09J4Ep2zXFRUGljAc=;
 b=5C7jYlvjlYl3IJJ9QSCqkQZXNAJFN3WP974TtsnanagY2sHy9yTJynyz6WIJcbG5Shu+TzJovEPy2qjSlAiOzyMP0HDGcVDSI48gCWQpIrwkV5OAxk+RRNVsz5Ejj6f81tkwg+RwyTxWyvta0txWSEw4l9gblUUmXCynWsUmgfE=
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
Subject: [XEN v5 10/10] xen/arm: p2m: Enable support for 32bit IPA for ARM_32
Date: Thu, 13 Apr 2023 18:37:35 +0100
Message-ID: <20230413173735.48387-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 963d6794-6a95-4b08-355b-08db3c45edca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ER1z/29ZTOY8UO9h2tgQxGQDoiWQW9PGvVYq5nWExc9gg6pMYgtFW7w1Q5Ra4s+Zi41VAXLs7aRnptqUlgsuKmh5pda5q9gx3uzWw8u0IIxQPbPSlMZrNir88wnNKGTFKl+76f11tgldfVRHelY1X5BNWdaSYPitS/sWeMVP+78mey98PP6pPO62ntHqctcSdfExR6t5p2zK0iQljtupIug3ZzpzNs/QGosKzGwI5AQVROFACm4D0QyvJjn0/D/OQdcMLFwJGDIR/f2BlNt0UY3OZmtn4TNHGwn4+Da6024oqd5dTmXdiSvqho4bZPdpyDSN2G04gwC0Ky400imP0qILQod5l+sTSJns66pQFWmRn7Osb0iv4VMeuHiojBYO06dsEBAyzNbCWdcjQX3Dgz+VPrRK5WEU8JID+/gofpTFkFkA+W+z70Kun4GZb5Oy4dlJVidD6Y8ZM85QhBvIUlPLlh1QXAOLp7evGkjWFJimxaN2UFmn7G0To1hPgjiM0P4R2hjrh+Gl7dQGlMAkWZUgcdiE7pPjsSPbKxbAND6ivh+o0iNJUyQVF0aOJK9YPL7dn8HUgmg0mRqkV6vDY8XQ3VauxGDZfZ+1239M4qJUL32SqiHmo4TFC7jb34xLvBReFU94kwKtTDVnZK58h1n7SGSrqt8TZ7luwAmZ/znEzcvx5/ZMPdzI/ZTXNhwBmh4E50N7rqW6SrJdO/siEKKs1SnnKFzgItXPe4WYHc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(103116003)(82310400005)(40460700003)(36756003)(40480700001)(478600001)(36860700001)(4326008)(6916009)(8676002)(70586007)(70206006)(41300700001)(316002)(54906003)(2616005)(47076005)(83380400001)(426003)(336012)(6666004)(186003)(1076003)(26005)(86362001)(5660300002)(7416002)(356005)(82740400003)(8936002)(81166007)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:44.2105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 963d6794-6a95-4b08-355b-08db3c45edca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613

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

 xen/arch/arm/p2m.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 4583658f92..746b6553e5 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2283,7 +2283,8 @@ void __init setup_virt_paging(void)
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
 #else
-        [1] = { 0 }  /* Invalid */
+        [1] = { 32,      0/*0*/,    0,          1 },
+        [2] = { 0 }  /* Invalid */
 #endif
     };
 
-- 
2.17.1


