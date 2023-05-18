Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B170841C
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536419.834731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzepm-0003UD-7t; Thu, 18 May 2023 14:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536419.834731; Thu, 18 May 2023 14:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzepm-0003Rs-4M; Thu, 18 May 2023 14:42:26 +0000
Received: by outflank-mailman (input) for mailman id 536419;
 Thu, 18 May 2023 14:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzepl-0003Qv-9x
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:42:25 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32eca288-f58a-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:42:23 +0200 (CEST)
Received: from SJ0PR03CA0245.namprd03.prod.outlook.com (2603:10b6:a03:3a0::10)
 by DM4PR12MB5326.namprd12.prod.outlook.com (2603:10b6:5:39a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 14:42:21 +0000
Received: from CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:3a0:cafe::f2) by SJ0PR03CA0245.outlook.office365.com
 (2603:10b6:a03:3a0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:42:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT093.mail.protection.outlook.com (10.13.175.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:42:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:42:17 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:42:16 -0500
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
X-Inumbo-ID: 32eca288-f58a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1ytZ9+1/jjUtOKV2xnBBUtBFccy7gY3JEPHzcduwLOydo886bmdhUZzcYn17U0Epcb2sSnwMT9YnrUttBjYyeTKBeCcvGztaIcC4jVPrgS9vAS4VzWXgxs2dlcN9ZXak3sR0cJMLF3FFTOfCJCGRIjz6jh8jUmFp73+losru7GNZB63YkF6gdE8BjOCpRKhgYttCVPJJS9yhUUVwFFkEjY76o91onxVMKADe5zb3gGnLLbH/kBZYrbSpsROS3vpLQd8G50kA2grOMGbMV7Qip/EBjM6Ka8+NV6b3Qyc51vnDpaU08ETaBy1QIJgbl4Lugvc6C8acO4a27UpC878Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S39xs8zKJNXxpJ6L+8N1p//laX3Tu7QlivwVG5FaGX0=;
 b=G1U+XtoGmrB/hRrojmjGvTg1/XQC872Hu6H9acixnQqP8kgI6m3Zq1N5x1XHXmxY55Ica42V5Fwa0c+YMFuwQEAzmTX7kcFRNacvwnkivmwSfKQkiiDd6goSplw/aN9Ne0yczb28hWKdb9vFASmX7aRkcoiyYj4sC8Pt7eEtbPovBvYlcJn74uPmwjkKp5pH+r9AXR6QUFq+TwDZ2hPQv3YMh83+36Nvn1ch32XIUilNAUhr9rhtz5p/pVlZ1Ih9z4UCYk0yr3PiD2JvIav344Xi9QAJ3QKRUgDqGf9C2qCkFM9UVee6waH+1KrseX15YOd11AK3HMzwrYTZbnsgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S39xs8zKJNXxpJ6L+8N1p//laX3Tu7QlivwVG5FaGX0=;
 b=TAsE1B73aaMxisiJ0wMMX7VZTmaIGJCQ8gJwwUtuleD8Wq4wkIUsGhYb97mpFUQ+IFfwBCloOSlnNM0KUCvkIidLeFWfWCCE4A+WY31W1tuxz3i2w8p+fSwj4hzRzNJst9hY9cTkHssZGNerniCi8AexXT949rRfzoUXFNCpcus=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 10/11] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Thu, 18 May 2023 15:39:19 +0100
Message-ID: <20230518143920.43186-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT093:EE_|DM4PR12MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8a2e8d-598c-4549-0786-08db57ae14ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GfcY/a1Ux/k4PtXxNmQNowT1RJhJeykLBnEv8rBjAiqQ8GoNDuQxssfxgeJjK/E9CYSeXhHZdmZeaP+MZKRYpf09lL315a+UpsB3miICqGreIZ/I8qFVjd3/xE49tnxS8TZffHcD3wf0o7EYdVNx926KufAG0p/cXjmvfWGp+XpsKxlJwPVIqnRN9aIsULGa6GnIEtWkST04SU3r5TmBdKfOEtUdw5Z6JfXAFq+03qtTqXZ5HepLmrbWNAf0b6Tgh2L6ZhlgQxWsTAZcoF9HZYtk7R3AJnOVmSdKh2hZVrMkSbKYnhL3YCVd/d7Bv2xIkKzKqdPkv8seWIZfXYFQ4yfqZhmg0xnwHkxwU+mdpEneS0o0xnhs5EWaoc4hNeMacDFUo2Je1ezowB9IZWCKJFWpEkCvymd4MtHUntIptX0hiK8X4WvJzGUnKC+afGzcw4M0BgolX5fvAJwHaMUVaUghQUi4SbFe5H7Gw5yk4ATc4uTV/vDJFwM4Ft17YOF2KH4G/SIR6Q+vB668MHXNMqg12OnnFSAKJjrZk9RCZLvueqmJUCjs+PaugujXzWRISriiWUhXNT/hyRyw9CDX/upbl4kEK/HfQ85gwW4hz1scb/Nm60Wqr0WKeJ8RSJ6+M58I3/E/QmRAZ9PAGN+eNuSIps2lmUSRmMTfXrr+rSbtDeW/UG9zlANX+OQieNeVWQvnNahYn2KKz/jjnpYejTIEa0cBc0XtGqEL/1UlSE82JJAaDv3aQs2DmOtv9fUn7Mis9PFn+YUR+PDhDSRwhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(63350400001)(426003)(47076005)(336012)(186003)(1076003)(2616005)(54906003)(478600001)(63370400001)(26005)(83380400001)(2906002)(8676002)(36756003)(5660300002)(8936002)(6916009)(81166007)(82740400003)(103116003)(40460700003)(7416002)(41300700001)(356005)(70206006)(70586007)(82310400005)(40480700001)(86362001)(4326008)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:42:18.4173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8a2e8d-598c-4549-0786-08db57ae14ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5326

When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
"va >> ZEROETH_SHIFT" causes an overflow.
Also, there is no zeroeth level page table on Arm32.

Also took the opportunity to clean up dump_pt_walk(). One could use
DECLARE_OFFSETS() macro instead of declaring an array of page table
offsets.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from -

v1 - Removed the duplicate declaration for DECLARE_OFFSETS.

v2 - 1. Reworded the commit message. 
2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.

v3 - 1. Added R-b and Ack.

v4 - 1. Removed R-b and Ack as we use CONFIG_PHYS_ADDR_T_32
instead of CONFIG_ARM_PA_BITS_32. This is to be in parity with our earlier
patches where we use CONFIG_PHYS_ADDR_T_32 to denote 32-bit physical addr
support.

v5 - 1. Added R-b and Ack.

v6 - 1. No changes.

 xen/arch/arm/include/asm/lpae.h | 4 ++++
 xen/arch/arm/mm.c               | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..7d2f6fd1bd 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
+#ifdef CONFIG_PHYS_ADDR_T_32
+#define zeroeth_table_offset(va)  0
+#else
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
+#endif
 
 /*
  * Macros to define page-tables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 5ef5fd8c49..e460249736 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -233,12 +233,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 {
     static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
     const mfn_t root_mfn = maddr_to_mfn(ttbr);
-    const unsigned int offsets[4] = {
-        zeroeth_table_offset(addr),
-        first_table_offset(addr),
-        second_table_offset(addr),
-        third_table_offset(addr)
-    };
+    DECLARE_OFFSETS(offsets, addr);
     lpae_t pte, *mapping;
     unsigned int level, root_table;
 
-- 
2.17.1


