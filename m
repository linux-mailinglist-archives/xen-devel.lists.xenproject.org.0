Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F666E13A3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520869.808974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u0-0003Uz-Ns; Thu, 13 Apr 2023 17:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520869.808974; Thu, 13 Apr 2023 17:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u0-0003QK-Ho; Thu, 13 Apr 2023 17:38:32 +0000
Received: by outflank-mailman (input) for mailman id 520869;
 Thu, 13 Apr 2023 17:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0ty-0000rf-Jp
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff6d9a91-da21-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:28 +0200 (CEST)
Received: from BN9PR03CA0804.namprd03.prod.outlook.com (2603:10b6:408:13f::29)
 by CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:38:25 +0000
Received: from BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::d0) by BN9PR03CA0804.outlook.office365.com
 (2603:10b6:408:13f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT103.mail.protection.outlook.com (10.13.176.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:38:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:23 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:22 -0500
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
X-Inumbo-ID: ff6d9a91-da21-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQn2M8pWbl2jB7tc/Ag8Zx07cgVO49EN7iGXkxIbIW+FZUV+jqbOcXIq1sENatxoLbtEhB0Zyj/OL7W5CEOFbBYmQu32o+hGsRAnx1UeHuvmmUZwFEZHPjxmpp9/3FERydTxtBUiDLOJB8JMzOqFVvDuZo9g/WdIkTvm7Fane1K+u+k1wOBFG6eyq9u4YbAevnJYmstQWZfv5u+uUpWk5sbFCOeOdKQtSq9LtehYDkxKnEItGGOf0WgiM2Ty0LsEVINg4ltwHbu2bLnmCdQuXjIGkahE/gLBx2yjnF0AoixxIOpbEpidOp7PVFfAxaO5tESklzqokz4Rjk6ZbMvFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYDtZ/9ITc1VO1Lc7mTKB3Dr1Wuk5Ug6oJSWDmGegSc=;
 b=A43q0DJB7kb2klo9rLvydenhxMyVW3/danjiK3WNmgAoPqPwKVDGOhGpMC1zvbtJGHHlOkkmYvlWmFh1hRMg/L/zc4m4Wj4jDeH0V5YjVmoTJWxiQHPDeFFoX7cSIA/tKR1Id5Ypnrh3bZLmNvAx3YRiuQlfjROVB/ikwGRWwS4IJfcZW0pRL/qlOGO5Bk2icKeYtyYMP3sjik41nE0jOd7JOG1dHZB3mb1/Zi8rm0aJjrcC8PmfPYvtKZcaGkj+J1CvvuG2N3gEgGxKJ+hZdJm/oO8pJIy+zWQ7rArmtDcEdJCPXeMF6Qyws0fou9r2d/iqOA7SwYWApgZHdR3UMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYDtZ/9ITc1VO1Lc7mTKB3Dr1Wuk5Ug6oJSWDmGegSc=;
 b=B74EyGQmT0A80kK5WDbx9XYlYeIgKjTcAZ/wBrClnIDoB/UYIgKbYMWrUjSySxnRKbYu9ILLBW/4Fktpy0M1Yd8GaLXswY34OL3ZRb/5JZ7p1dDdEan8l0enr+dKRHE9P+eglWo3p2eI52K1puT0GVlW+rOT/8OSTW1/EdFLVwM=
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
Subject: [XEN v5 07/10] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Thu, 13 Apr 2023 18:37:32 +0100
Message-ID: <20230413173735.48387-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT103:EE_|CO6PR12MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: a09b65e1-a62c-4f92-61d3-08db3c45e1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aMbQQyI0lhjB3Ol7ogO4+excqyipn5GqqqDSeN/UqMAq9vzOnoFksbyhlkHEk2P0n86ZZeMpenwIQ+cogYthlkd5q7xYOFsRpzmCGDsVfAj6+nqRFgpqKpW+F2pxUAbutXyBqdUstnApCphwDvhcpdaHLAjfpKQPzTR4iSy1guPC1woiN2bploUbzHWSgOQ9Gd3O56hACfjUALgjuwbsDayZ7hKzdTpjNbae3mvHPZyFTf57PMzV6RqOZHMBB7gocl5TB18SxkpPuHW9Sw7uKG2/gbCtSPOlkCCMccMsnBnVwAl6x6XpFpN9JgPJ7b/Ci3bfADvA3dvChmnZQO7ed069ao89BHm0caX3h3KGx0TcZ/74nzbwKKe4rS3hIzWt/GgDclhqZ8evNXXDfp/NZOVF0fLqOw//3RhgQCOcaxZWjtgrLa+v7MqktRdpYeYHrE9cjBtvoYPt30mfByFuFMhbXWuDRdzuIocaSqKmtuVLf+AoBsf8mKxZwnUyyL4rrjxbZ6bMP/skcA0F5vKddUgVyJShphqw96MKTwjApHojV5WLSNEyMMbsXuWvkRzbdpkkMrTs+gg6yN3srKAUaleITMpoc5W3Qt9kq/mE3hvbuZc1myOJuVtKX8mKbbpgY5CSg8eqi8uoPHKf4CoGJqc6syA6qjMOZlmeeg9Wx7H29e0H7hoYKNd46RHO7umEfrFGBSl5TeKA172PFskc/WJ6oulYJPEqkmbvg433Fvg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(316002)(41300700001)(81166007)(1076003)(26005)(186003)(86362001)(6666004)(47076005)(356005)(36860700001)(2616005)(82310400005)(426003)(336012)(83380400001)(82740400003)(6916009)(4326008)(54906003)(36756003)(40480700001)(70206006)(70586007)(8676002)(8936002)(5660300002)(2906002)(7416002)(103116003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:24.3756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09b65e1-a62c-4f92-61d3-08db3c45e1f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459

When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
"va >> ZEROETH_SHIFT" causes an overflow.
Also, there is no zeroeth level page table on Arm32.

Also took the opportunity to clean up dump_pt_walk(). One could use
DECLARE_OFFSETS() macro instead of declaring the declaring an array
of page table offsets.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
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
index 6dc37be97e..247510ac57 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -221,12 +221,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
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


