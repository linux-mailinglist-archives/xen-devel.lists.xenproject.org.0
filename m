Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE494DC832
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291587.494994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqga-000149-Ln; Thu, 17 Mar 2022 14:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291587.494994; Thu, 17 Mar 2022 14:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqga-00010W-IE; Thu, 17 Mar 2022 14:01:04 +0000
Received: by outflank-mailman (input) for mailman id 291587;
 Thu, 17 Mar 2022 14:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfHd=T4=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nUqgY-0000hx-Dm
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:01:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2eda1d-a5fa-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:01:01 +0100 (CET)
Received: from BN9PR03CA0176.namprd03.prod.outlook.com (2603:10b6:408:f4::31)
 by MN2PR02MB5888.namprd02.prod.outlook.com (2603:10b6:208:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 14:00:57 +0000
Received: from BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::be) by BN9PR03CA0176.outlook.office365.com
 (2603:10b6:408:f4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Thu, 17 Mar 2022 14:00:57 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT055.mail.protection.outlook.com (10.13.2.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 14:00:57 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 17 Mar 2022 14:00:56 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 17 Mar 2022 14:00:56 +0000
Received: from [10.108.8.223] (port=9027 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nUqgS-0004ME-8e; Thu, 17 Mar 2022 14:00:56 +0000
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
X-Inumbo-ID: ad2eda1d-a5fa-11ec-853c-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGLPawwRjNjjxC9NG5py8snL69qROJLZn/APbDVdc+tzlnWPikvC5MysxYZq0OA2A3wEWnVGZpwRtLCujqiLWP22K5IgxBNnmRyJiQnfLcluIudmxLzwo3GulBuH1kJ9cMtEblohbrxtsHX58t5hHhr9DUmSf0XiEq9M/C9xLNalyJ1H1jXj6fATnVFUqIxaMh1RV+JoyvCBo2lt+GAYqmMun7eMLMJf0eU10cGk7mHhss8LkMioD+i1FsVSUkguf+muZ5/4LSYG2RpoJZ7uJpb/5+62Ak46W2DHMflXuoOi292TAbh67jQ/w5nJJBJUnZ8/mbtNwcli8NCMFREz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mg1rcUV+64uiAhbrtzygMvcZnG6+I4jbMdmSaOC8CU=;
 b=mPRB2gF18RJbTz8krNWwka9tX6KLbWNxEHV1ipsXzil60lxcPsIq/g42RsxQhPjMhxTsIGUrCTKojiChT3fq5dbtzNXW2jPA8sKbm0+nj/MF0VtMl247VmmY3C4Ld+gDNgI9J0yzEo7+baFTRaw5usdnBaft2aFDcwzN9eNXjWH85lM7XDY8nYCO7mdA4yojCoi+JXoLrx4FyehPEw1N9O0i0tAUedM4EpVrdd7/dZbbHcsdwbLBiVcYgJlR05KdHDvhQs5domVffcyA0E+hafyzTDbgiL4bOirqZyXt1uu4kvNCn6m6RvfJ46m5rFTjUmwLZ6yk6JMvTJ2LHDKAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Mg1rcUV+64uiAhbrtzygMvcZnG6+I4jbMdmSaOC8CU=;
 b=A/2UasP48Krh1NB83lMkFGiveX5aov8+CXMqmRRO/71csGhUJZYlImDFc4Ej3IUEFWLp1tHY461noHty524R6JEKdRW3u6Uzwz1l+Nx0y7yfmNHVQbYBFRhMPagJuA38YWftgH2ZDENBFhsOLj54eBEQVZ8VvM2IHked8GCbZv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [PATCH v11 2/3] xen/arm64: io: Handle the abort due to access to stage1 translation table
Date: Thu, 17 Mar 2022 14:00:45 +0000
Message-ID: <20220317140046.64563-3-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317140046.64563-1-ayankuma@xilinx.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0908830e-a972-4f1a-63fa-08da081e8f7b
X-MS-TrafficTypeDiagnostic: MN2PR02MB5888:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB588885562FD54B5B7BA8306BB2129@MN2PR02MB5888.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FNgEwJlboksNuQiq8jkUVcqGBSkZICQ+oBKAPK8z5to3C/16lQPhHuqvcleNkzNDAY7d+SJRIPlvFv+uTYi6hrytICdawDK756DybL7OyPIbGZm9lQEtWb5yiWLX5voy7jxJfDYX+eYWPVX1dI/4pS0R56shZCMYs5tBxylPVdvzsG9HnbDdI2/abHaeYCMReO34LSQAQhCSIRX2UoYmm4oXpu2xoxF6hSq7L/spPDAgsHdFhTr+x9c2C+z6R90TjHU81R+hWolDz9LpgKCxRUIEjWY9pSNzWzxFAAWE8qIXrEn6BEBPJrsUiqIpX6Zm8PDo1Ta2Kh+FyEMHmD56A1EXQmEBX9xq7l7woMnQz+vvm/NR6Zc3WGFiGZJN406QFWm/fPrYoZdKoxl+I0RVhtfTbHzM5TgXIsRbuLta4yvpRuQG35WicNxBOh6CpbzbwIOyKIQ8bAi1I91N50ex+tEpsmDtC9HMLVOl4vCZBCiRXci0zlZeIQPUeLxkYwx8eH48m0qY3W89wylf1PBAc9xd5FkJY5ywBMrvIOoCtt/oSJ5AqQl/nGnVVwuRYrC0OjjHByDsjnsx2Cv3NMPqo+wtzRIcAQTYzcYqbT+4XA35YVgUNPswIckyt29RoO22AapK+SLd617LN3IkJC+aX064NSxnxFBsQo2h/afnQA4bJtbp02uzo6VzFWn8M7hzE2E5usqeOIt8Nn99aDh34w1DKTI4PZW3Sedovnl8pyA=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(6916009)(186003)(316002)(70206006)(70586007)(1076003)(508600001)(336012)(426003)(4326008)(9786002)(8936002)(107886003)(36860700001)(6666004)(2616005)(54906003)(82310400004)(7696005)(2906002)(36756003)(5660300002)(7416002)(356005)(7636003)(8676002)(83380400001)(47076005)(40460700003)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:00:57.3897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0908830e-a972-4f1a-63fa-08da081e8f7b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5888

If the abort was caused due to access to stage1 translation table, Xen
will try to set the p2m entry (assuming that the Stage 1 translation
table is in a non MMIO region).
If there is no such entry found, then Xen will try to map the address as
a MMIO region (assuming that the Stage 1 translation table is in a
direct MMIO region).

If that fails as well, then there are the two following scenarios:-
1. Stage 1 translation table being in an emulated MMIO region - Xen
can read the region, but it has no way to return the value read to the
CPU page table walker (which tries to go through the stage1 tables to
resolve the translation fault).

2. Stage 1 translation table address is invalid.

In both the above scenarios, Xen will forward the abort to the guest.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v1..v8 - NA

v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
instructions (for which ISS is not..." into a separate patch of its own.
The reason being this is an existing bug in the codebase.

v10 - 1. Enabled checking for stage1 translation table address in the
MMIO region. The reason being Arm Arm does not have any restrictions.
2. Updated the commit message to explain all the possible scenarios.

v11 - 1. Fixed some wordings in comments and commit message (pointed
by Julien in v10).

 xen/arch/arm/io.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index fd903b7b03..6f458ee7fd 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
         return;
     }
 
+    /*
+     * At this point, we know that the stage1 translation table is either in an
+     * emulated MMIO region or its address is invalid . This is not expected by
+     * Xen and thus it forwards the abort to the guest.
+     */
+    if ( info->dabt.s1ptw )
+    {
+        info->dabt_instr.state = INSTR_ERROR;
+        return;
+    }
+
     /*
      * Armv8 processor does not provide a valid syndrome for decoding some
      * instructions. So in order to process these instructions, Xen must
-- 
2.17.1


