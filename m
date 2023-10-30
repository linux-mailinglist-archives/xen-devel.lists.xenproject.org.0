Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA97DBAD7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625117.974052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSO3-0007Ik-AH; Mon, 30 Oct 2023 13:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625117.974052; Mon, 30 Oct 2023 13:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSO3-0007Gl-7R; Mon, 30 Oct 2023 13:32:59 +0000
Received: by outflank-mailman (input) for mailman id 625117;
 Mon, 30 Oct 2023 13:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=crLw=GM=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qxSO1-0007Gf-T7
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:32:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d834a5-7728-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 14:32:56 +0100 (CET)
Received: from CY5PR16CA0021.namprd16.prod.outlook.com (2603:10b6:930:10::27)
 by CH3PR12MB8283.namprd12.prod.outlook.com (2603:10b6:610:12a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Mon, 30 Oct
 2023 13:32:52 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:10:cafe::e4) by CY5PR16CA0021.outlook.office365.com
 (2603:10b6:930:10::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27 via Frontend
 Transport; Mon, 30 Oct 2023 13:32:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 13:32:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 08:32:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 30 Oct
 2023 06:32:51 -0700
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 08:32:49 -0500
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
X-Inumbo-ID: d4d834a5-7728-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpZyE/C0X54UpWzQR45HYD4v/HcX8CsKWBLetRP8LHsiCGe5VZlAzJPxli1ixXezw55x/lO910pexrzEP6N1T8LlMiGRfRy8jMc4xsbSbrL/JSH8y53MFCBy56tHKyl0Co+C8GTpDHyhbTw/ep/hQFKpPaWm5fyo43rU2V5zLNkMFxUh2LSWMfSYtsLI4y4WHqlOcdbbGjAuG6VuC2q8DhBZr3CVzynxhmv32x5xbh6jdlCuhSnUZLCd5f4a4jy1wcUZwQ2ZZSv4HKVOuQNOfQxD9lKaD88QxrjH7zsBaSpbnbzDMlISptN/mesDUcJTmMRRrTGr8ocKI9VLGF/Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRNOFM+joOHAbAw9dAW+1GbPZ2653qeOKPOddfMLiSw=;
 b=IFpbgUa7kFYNbgpxYPodzPAPO/ogH50ZDgLPnd4SQqqOluVR/WS3sXwpFDMc2s5ShsaKwAm4KwikomWv0Hgf/hh4MPWtTbzBEcd0rv3vh4Wa5M4vkNKnjEBYWDaMjIXWBGpzCQU7dmSjrBVIUmTEJG4je0nUe0Bv/N2JcTVZ++ojAM3BV3qjr5anqkBNXPE2pvp3KSW84LvzHJWQFf0LGWL1u/efBFwvMtpF5rLbSDmywBdH8MEhkYyWsqfduIHAmsOOhMM9stEK6J8hk9KbQbjBm5YXO193odRKAt01Qi0RXXzWUn+WPNKkOrs9joirFhhsaW7plMxWJWslFvZcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRNOFM+joOHAbAw9dAW+1GbPZ2653qeOKPOddfMLiSw=;
 b=OYZ7fMECQpa349zxiT/DJRlD5vjTLrpzcZgjJNflLYoiES9//obp9TYOkQtYaq7lk3UE3lheW2GBcag0Vl73GqT/t0ROyVtedmamTPeYMCwkCupQ1zjPvXKMDUkZAYTRHOv9gb+kgtunRoQkG1KO4rYrgTUwHzykWcRBrdDo/YI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/hvm/dom0: fix PVH initrd and metadata placement
Date: Mon, 30 Oct 2023 15:32:40 +0200
Message-ID: <20231030133240.116758-1-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH3PR12MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: d942d39d-328e-4f8c-505e-08dbd94cb752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmdNL+7kDC9qt7YG1/t/xylUd3s0+x1rPpLpADLl6OklhDUkI1vIR0Gra6OQqaahgqm7NV+eGBdxpln63kIYdoBnlABctyOVR8q9URiaDksiuvwoM0wub697skXxtdNf1NIOHjFqb6YX83S06U23Yb+8g31LL9DVQwQMcylVStn4ss2KUMlMh9ZLBelk8AeQ/iwjgYuNC8axpUCWO4Lsbz4FUarmtQaA0UsXhwvMkVeBswk6F6wZmARR8794wPdsc2KvV1lgami6qqhkemDB1BOYu/calNZjSedgTukmS4r8Uc0KuyHtKcSi1PFvEnEYcM0SATd7DuyBUU6paYRDrowCOeLA7jTvj6hpsmUa1xJrpv5krEBSu7VX0c1jW2smzIylKxSFbOakgM3Mai5L08ONNXlcK2zhWdGIqrAy8gMEDnQVmlXPcifN16O04UDC9C8+s449nIMVIUkJrBzZOXgFfOXTmpeqR35UsBPIBtrwhHv8JOHagmUYORSntnJmASY75ctBgHBPZtS5StPnnQaT88il1mziv/l94Q3oOwasGIwUkFFbwYbmN0EJ2Wow45xu4eJvZUV7bomXN+tL/qoGTQLrNWGSAqloeu9zTqb1vgBx3vP45/n+7OMABjvOLwKjuRBhKL0OMEYeiqMGiBk8m8vFH2OhhefiGKb/xLDgnOXlsygPYbCNfGIUM94kVH+37YG8Ff8ii+egFJEtZr13PdE0jdutfufFvF/HViYq4WL8IzyYZS+spEtFAejPPBzP4a9S8Ig7Qvrp7HnyrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(478600001)(6666004)(70206006)(70586007)(426003)(336012)(26005)(41300700001)(2616005)(1076003)(2906002)(54906003)(316002)(16576012)(8936002)(8676002)(5660300002)(6916009)(4326008)(44832011)(86362001)(36756003)(36860700001)(83380400001)(47076005)(81166007)(82740400003)(356005)(66899024)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:32:51.8330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d942d39d-328e-4f8c-505e-08dbd94cb752
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8283

Given that start < kernel_end and end > kernel_start, the logic that
determines the best placement for dom0 initrd and metadata, does not
take into account the three cases below:
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
---

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


