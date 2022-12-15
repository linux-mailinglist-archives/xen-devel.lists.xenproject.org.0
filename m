Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9664E1D9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463765.722080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyq-0000Tr-Me; Thu, 15 Dec 2022 19:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463765.722080; Thu, 15 Dec 2022 19:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyq-0000QE-Fa; Thu, 15 Dec 2022 19:33:20 +0000
Received: by outflank-mailman (input) for mailman id 463765;
 Thu, 15 Dec 2022 19:33:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyo-0006KU-Tk
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b2f647-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:18 +0100 (CET)
Received: from DS7PR07CA0017.namprd07.prod.outlook.com (2603:10b6:5:3af::14)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 19:33:12 +0000
Received: from DS1PEPF0000E643.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::6f) by DS7PR07CA0017.outlook.office365.com
 (2603:10b6:5:3af::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.13 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E643.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.9 via Frontend Transport; Thu, 15 Dec 2022 19:33:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 11:33:10 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:09 -0600
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
X-Inumbo-ID: 52b2f647-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqUfJaGLBhYdgVd71pA74NpcmBICD0/sol8EoHZkdTt8WwltGKmf3j4tFZ4IBhAD02a4M/8LDfozJU+2bCUMl+mR8DrRSw2sLplTnEuNtQOTq9+fGjjwCcG0NHGPVGX8Mwk9gN8Zt7rJXe95N90alxAqUtkXP9gya7dW4xZC0rT4TaoyNv3jewoJXQEieXR1KRyeGU4JpERAcK0sV2OWSn7OXjAItcKQDbDgqSE4Zol4XDGF3TWmUR1LnajKYFFbDq4ehK+d9ohJ7FG2atBr+RylLNRgfrFjEPXD9mVsChOyLpYEvYZNkX3b2WaUiKKmn834nRsbohHJDO2sHGyNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5+olvGyXYR/FH3N6U5mKGmd6Dy3PG3BDHmi9oMXULE=;
 b=N+GHsaFKPeXrFU99lw1lcl2dYbKoga//yfaH/nHSOYNicsfTTazahN2f/7Gy+KxKokom8zboF31bw4LFYz2dTHRy2Q58hULPLCDTdNU3SKAqrmUZyCIlMPtWePkOJSIjcdxUl2GZkwNRgl9rMofzmQIlmlKJSEZEh3/KbQgRKh1EiyQDXpCqPgo88uIttgylcwpRtzAgSAHfmIV6tWwJex2gKA8JfRH9/ABtw3HysPhJmsIAfmUYXoO2JW4IhWQA4BiTRIwo76HdQsDCibsj2WqpMpVInYnX9BJNv1PTZyVWgcJix/GehaXzM2sTJ0h8oCIS911E+6GzqvFQA/AECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5+olvGyXYR/FH3N6U5mKGmd6Dy3PG3BDHmi9oMXULE=;
 b=DGLCxaJGqU5PM+ILngrxnd2Ow6RIpQWzBUn39oRXOqo+r/NF0MzXFjLz8vtoLFQ79ix2alP7bfzY4MC71ijapKIJnbqMnuanolTTGYk5p3+2hFCOQteqotAegZL5x9pfuWhpWeMeeShO0U755U9Zzl7kMDziOT2WoVqNc643sTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 7/9] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Thu, 15 Dec 2022 19:32:43 +0000
Message-ID: <20221215193245.48314-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E643:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b3080f-6fda-40ec-c39a-08daded333e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lcZ6K2t9pLv3ohU+b+89CbGpj85HyW1ynD3jSgcPbwiOCYry+86Yd1scvXlWc7fovuEgcKA4K5GBSo+vSS4fhdBRZcmZeYvbw3Pi039W/SM9gRpTPw/ZCpcUd6VROeg0fzp32xKPJ3T57F9Hd0+oBtvq/iKWwRQwmnsuUF3tAENtFjn+GcQEL/sO/2pJBpfMdEWPBUe/VRX6kKYyuK5WOUwkVAoPEHLXVpS7J+B1lJTdPW9SaqSF1a/k4slCm/mP486F4QuXxQYzUWL5XclS+E3IkabHmLGjin2PJBuw6XfCNUSGFrqU9V7/ShS6oHsKRefaEXIk9ijbw4GAD/rFe4OPZQVIP4BbKr4J8egURg9uA4x654NznJFNQ/2J6wc3RcFSxN8TRY29dW3ydsQKt2kv4sOA/c5wf0H/ismKjbQGJb4R7qfuXPrX2r2iLqulwJ1VmbaEOvL2RQZoiHf2K/5YRnmLhRGnO6WI+bvHW9bbyeLudEwRQ93sP2Hc7iliC5uoYeeRkjjmVw+1AhN4CK1UpaacPuOkVUxbJB625Z3gpYrLkxFbc1e90ssPUmaZ1WNdEx+7ouCtY9VR++G/zPADPb90zq01OaYRS6PLJJCpkRXhomyh2coH1SYZ/HJmbM1q3NzPVrb6CmyqgVB2W33317sz0+9urTvUHh699ga1xvOZ6OAmPiftgkbdrCmWFD+i8Je7cT9TitUL0XmQp1SKeLmHm8+Jhw5bTk13Lvk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(426003)(47076005)(40460700003)(86362001)(81166007)(356005)(40480700001)(2906002)(5660300002)(8936002)(41300700001)(82310400005)(4326008)(6666004)(186003)(26005)(1076003)(2616005)(336012)(8676002)(316002)(70586007)(70206006)(54906003)(6916009)(478600001)(82740400003)(36756003)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:11.5792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b3080f-6fda-40ec-c39a-08daded333e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E643.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264

zeroeth_table_offset is not accessed for ARM_32.
This is a left over of the following commit

"
commit 5fa6e9abfb11
Author: Ian Campbell <ian.campbell@citrix.com>
Date:   Thu Sep 18 01:09:48 2014 +0100

    xen: arm: Implement variable levels in dump_pt_walk
"

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/lpae.h | 10 ++++++++++
 xen/arch/arm/mm.c               |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..35769debf9 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -161,6 +161,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
 
 /* Generate an array @var containing the offset for each level from @addr */
+#ifdef CONFIG_ARM_64
 #define DECLARE_OFFSETS(var, addr)          \
     const unsigned int var[4] = {           \
         zeroeth_table_offset(addr),         \
@@ -168,6 +169,15 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
         second_table_offset(addr),          \
         third_table_offset(addr)            \
     }
+#else
+#define DECLARE_OFFSETS(var, addr)          \
+    const unsigned int var[4] = {           \
+        0,                                  \
+        first_table_offset(addr),           \
+        second_table_offset(addr),          \
+        third_table_offset(addr)            \
+    }
+#endif
 
 /*
  * Standard entry type that we'll use to build Xen's own pagetables.
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 630175276f..be939fb106 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -184,7 +184,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
     static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
     const mfn_t root_mfn = maddr_to_mfn(ttbr);
     const unsigned int offsets[4] = {
+#ifdef CONFIG_ARM_64
         zeroeth_table_offset(addr),
+#else
+        0,
+#endif
         first_table_offset(addr),
         second_table_offset(addr),
         third_table_offset(addr)
-- 
2.17.1


