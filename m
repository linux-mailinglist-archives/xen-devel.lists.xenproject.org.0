Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C287DCAC9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625605.975052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlyw-0007Ce-GX; Tue, 31 Oct 2023 10:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625605.975052; Tue, 31 Oct 2023 10:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlyw-0007Az-DE; Tue, 31 Oct 2023 10:28:22 +0000
Received: by outflank-mailman (input) for mailman id 625605;
 Tue, 31 Oct 2023 10:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZpMf=GN=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qxlyv-0007At-51
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:28:21 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35c0ce32-77d8-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 11:28:19 +0100 (CET)
Received: from PA7P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2df::18)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 10:28:16 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10a6:102:2df:cafe::3a) by PA7P264CA0030.outlook.office365.com
 (2603:10a6:102:2df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Tue, 31 Oct 2023 10:28:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 10:28:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 05:28:14 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 31 Oct 2023 05:28:12 -0500
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
X-Inumbo-ID: 35c0ce32-77d8-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJWnm/cIXK1q/LElyi8mcpcc0KnaC990+eAoS8q68xdHRpzrhwbHuNYGAM+FFmtGY+Xk0T03NPJah3hcxUlfCrx97+J4IYiStzA1Ke+pIpgtUbVhEBHYnsz3v2MBQ2MIXRZT8Ngc1rLtY04ssyJFFENF6npFSQYypLu7DLbmvEERFsINOi5UF9jR1gd56TIbm9DFbo0Z7sTM+xTM3itook4bu1SFjKNJjRBkyJVON4eQ8WzSmh6SEJ3FdRFi1B50queVkhc71a54hY2A0GMO7uVUk9Yl5r6aEukSstuPJiSDaN5bcVCAJ4k7w11Tzz7xLQeU185ya4YRwDM8qBGoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGl9MqzhP1Oim7igMrrYAJM5bYqCurIVrY6eOC4lji8=;
 b=Co3z64ksyXuTsbDMdAhBocjJ+VNKAOCUlzPSNSX8AfkQKfM7Yfe62tG2TLU2TMa47yyeHWiNVW8bAqx+6QnWSlPCx7e1p6C1Qlk6qIZJiG56wAETOaaQOkIPT9khVbmsAqsBYwYEuEdYcZuN23gPE2RpIa0oImScfvHCNCYCvjQ7nX3XMX7Jyuo4EVKh0EvqSQvK2wP3KLFZYSvuBncouxU6chQzGURwvji5r2he6Eg3fciwCT/CNJBh/BFjEo8gWOZHvPeASZ0NUS59uIzD0+M5CHq2WIFwTrjFgc+UwpcPX0oTW95hkZTTp1OTJp9FG2CLi7r7GLdgdtcSQj1ZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGl9MqzhP1Oim7igMrrYAJM5bYqCurIVrY6eOC4lji8=;
 b=tT8axbQQjcKwr3DlHjkNkUiSscZGCyay+y5IiXK56hwn4Mw7O2w7EbvMOHeJicPusAsnq8PzoFF/I8xsG8LEk7LIRJ4ZMuVh4KV+2qDJv4z+i2IwGrRPaC2oD3WH8RPFnYKrO477/B0ktX1M8GlO9vdHlxmAB63n81SfMhDXG1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3] x86/hvm/dom0: fix PVH initrd and metadata placement
Date: Tue, 31 Oct 2023 12:26:57 +0200
Message-ID: <20231031102657.152207-1-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 6876bdf1-91e2-434f-3170-08dbd9fc1732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uG0dwUpZdNK/jmCMHCJi4d2L/h6zF1zYNhvG1XaiXosn+IxIpPpCI88cncH5ql/qA4sEcZs4X7FQWybv6gpns+wNUEs6ZH/POtCNZvnfRNVu1t6wxpA5u43zIyRaJIQDHCPMViq74nkLKrlPrwL1NrVseo97odmy1Tad+LfMmofeSrSge7ZX2Oqey/SufG4io71Y3zO+fAha9yi/1MfxZvMDQxn/Y1MQM3rKuZjBYwzKO+XEr1VqWyU9panvLlkzgzXb1mETakXqrccDyqdNGvNJ0u2YWCVp9Z8Az0MVvXcpCG6onIS5N6wLiGJjN11gQI1b4nyRBt0R9Y9lQVSwFoTKdMH8vtoAttkUmFhB6sWSTeNIFHKOrfCws+6PEp/z1W2+9bmAM9H3YBPqvAZVTy50txl1y4Hax3mpqDg4lUFnidxyPWuLBGXt3+YjKhIsvarZbURAoxIAY7Z5sXjUJFBTSXXYewEhBCIt+ZrBunhJ8fwmxRWhQt54g/3kfsicADZFrz5uN4t7qzlHz/Wj3+zwRMik9mO/VwivWTLq9dn/2Kb7JFbXJY+koJ/fTm+yI5uDc3NVzyKDo4dIy9D2RspxNpA+OuZcJFEttYjSOVCcJOxc87kur9+AnfzLu0JO71qL3ct9AFGATDAYPoa/WX0AwbVfhVF08v+JSa2MQ9Mp3A3rTpBmH1CcpbpObiCP2F/vQdACY/fsivaZjWbn/gQfn4LsphKpZOweXNDvozvFwikjfwfxCgV5g05O9/PiIMjfnSK1w9qitqEGWmc3VQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(66899024)(40460700003)(40480700001)(426003)(36756003)(26005)(2616005)(336012)(86362001)(1076003)(6666004)(36860700001)(83380400001)(81166007)(82740400003)(47076005)(356005)(2906002)(478600001)(44832011)(41300700001)(54906003)(70206006)(70586007)(316002)(16576012)(6916009)(8936002)(4326008)(8676002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:28:14.6583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6876bdf1-91e2-434f-3170-08dbd9fc1732
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

Zephyr image consists of multiple non-contiguous load segments
that reside in different RAM regions. For instance:
ELF: phdr: paddr=0x1000 memsz=0x8000
ELF: phdr: paddr=0x100000 memsz=0x28a90
ELF: phdr: paddr=0x128aa0 memsz=0x7560
ELF: memory: 0x1000 -> 0x130000

However, the logic that determines the best placement for dom0
initrd and metadata, assumes that the image is fully contained
in a single RAM region, not taking into account the cases where:
(1) start > kernel_start && end > kernel_end
(2) start < kernel_start && end < kernel_end
(3) start > kernel_start && end < kernel_end

In case (1), the evaluation will result in end = kernel_start,
i.e. end < start, and will load initrd in the middle of the kernel.
In case (2), the evaluation will result in start = kernel_end,
i.e. end < start, and will load initrd at kernel_end, that is out
of the memory region under evaluation.
In case (3), the evaluation will result in either end = kernel_start
or start = kernel_end but in both cases will be end < start, and
will either load initrd in the middle of the image, or arbitrarily
at kernel_end.

This patch reorganizes the conditionals to include so far unconsidered
cases as well, uniformly returning the lowest available address.

Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---

Changes in v3:
    - mention Zephyr in commit message (Roger)

Changes in v2:
    - cover further cases of overlap (Jan)
    - mention with an in-code comment that a proper, more fine-grained
      solution can be implemented using a rangeset (Roger)

 xen/arch/x86/hvm/dom0_build.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index c7d47d0d4c..62debc7415 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -515,16 +515,23 @@ static paddr_t __init find_memory(
 
         ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
 
+        /*
+         * NB: Even better would be to use rangesets to determine a suitable
+         * range, in particular in case a kernel requests multiple heavily
+         * discontiguous regions (which right now we fold all into one big
+         * region).
+         */
         if ( end <= kernel_start || start >= kernel_end )
-            ; /* No overlap, nothing to do. */
+        {
+            /* No overlap, just check whether the region is large enough. */
+            if ( end - start >= size )
+                return start;
+        }
         /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
-            end = kernel_start;
-        else
-            start = kernel_end;
-
-        if ( end - start >= size )
+        else if ( kernel_start > start && kernel_start - start >= size )
             return start;
+        else if ( kernel_end < end && end - kernel_end >= size )
+            return kernel_end;
     }
 
     return INVALID_PADDR;
-- 
2.34.1


