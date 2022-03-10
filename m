Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3EB4D50D5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288559.489370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqu-0003Jg-68; Thu, 10 Mar 2022 17:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288559.489370; Thu, 10 Mar 2022 17:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqt-0003HD-V3; Thu, 10 Mar 2022 17:45:27 +0000
Received: by outflank-mailman (input) for mailman id 288559;
 Thu, 10 Mar 2022 17:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Vk=TV=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nSMqs-0003Et-4J
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:45:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcacf8aa-a099-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:45:24 +0100 (CET)
Received: from DS7PR03CA0219.namprd03.prod.outlook.com (2603:10b6:5:3ba::14)
 by DM6PR02MB4860.namprd02.prod.outlook.com (2603:10b6:5:10::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 17:45:21 +0000
Received: from DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::eb) by DS7PR03CA0219.outlook.office365.com
 (2603:10b6:5:3ba::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 10 Mar 2022 17:45:21 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT051.mail.protection.outlook.com (10.13.4.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:45:20 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Mar 2022 17:45:19 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 10 Mar 2022 17:45:19 +0000
Received: from [10.108.8.223] (port=47674 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nSMqk-00062C-Jp; Thu, 10 Mar 2022 17:45:18 +0000
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
X-Inumbo-ID: dcacf8aa-a099-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC0POvUCGY22IqX4w8cDzMRsnwrX5gDB9BahAXMgnsMq7TaayNOqrJ13GLxxbStfEj2xJBK7TTQWd/L78HmhBv3xwUCLSuxRCe1PCFzc6wtlGRp0b+cxT5Pr4jGcLNQR93gc3QJlyI2qzFWgTRXVelexkN2DdJeEBPgAWV/cYgIQFwG3UV+kgNzQzdng/h3jBtT0677huhc+2AqaBJSUzXg6hpcp1HnZFWiiXiLfPucXUhEKDsqXkEbgUgajS9KGxP68MJHbF0j+hghnbxDBvFiaLits+VN/TMqjjkoYcAiGLnbpHHh9OhGBWJtQAvBZJaELPexpi1oAwV5MlYKEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+THwbN4oTMoGKFH1lRCrmOSyHRnq+hrefN92IPF7io=;
 b=NxLpeD/ECAWW5f3oLQVhaRGvjhp6tTvpbBMNHqv2/wTsub+4YTxV0oqnOtuMg+pJTThM7oygTV2mkSRbU9iRkJwmgDoYi9wm3zKzR4PGRvDHaccK/4PC5vvV8Cnn+DKqz5wLXLxgsQcVpSMT+tpYLeQE85JR8s1zL50hp7eT2CLMWjXp0f8ixP3io6MOt9XW91hryl1txC/QYnD0PajK4o7SGbjYVMh72s5z6aKp6WiAQRBaZw4eNHIyiXwn9ZW3vNbbvRu2ojUjwuxFO/rBvjOxbnbgRj/xFnCRLh9WlspKUjuXx8NAqovHw+TlKlXuYHwC35TBKsJ1EvXHYip+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+THwbN4oTMoGKFH1lRCrmOSyHRnq+hrefN92IPF7io=;
 b=Mv2vtrv4ibpGfW5bnBZnPEkt14N1zTLmN0X1bM6yQH0kVg2eWjvU9ofs28dT8azGBpK+Tzeqjv/BWMW57EXu2GBY7DDIZ2JtafRakj6WFhCtsjcMDvJe0NP3m87ttCtU9mqDxr6jy7nEn1/9pqz3C9AEBWv/Z5QEN6r+LEFbo9c=
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
Subject: [XEN v10 3/4] xen/arm64: io: Handle the abort due to access to stage1 translation table
Date: Thu, 10 Mar 2022 17:45:00 +0000
Message-ID: <20220310174501.62040-4-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310174501.62040-1-ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 537e6435-fd6d-4a4c-50a7-08da02bdbf50
X-MS-TrafficTypeDiagnostic: DM6PR02MB4860:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB4860EFD4F370141388D348B4B20B9@DM6PR02MB4860.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUzf2Jn6iZUQe64FK7vLO416Hns+lrUh6wnuJWKxMVdyXrKdhE446MDt+tSlPZjLzp8yIlKtmKWRTOyuoP/URU283nSe3iWvAzfftUiY9S5tp5pV92xRkgzNyIKT/XO0fv+qPCp3BMOzQBjSQtg8woonAnWqAiBbGDu8E9V3VruwTN1glnSu/bU1dfC1Ipzw8zHpaMMEDy0ojtg1Q2/4TNestLXE9Vny/6uuLIMeCMvApkRPHHiOJxmyUaqrIMuUH8PnkRorCiLyyxfRzgtOS0MOv5UOKt3bJZ3GQh0PA3OQgVJroSldnyMpWeHreeyucdXR/1t315NrB2sSb2XJzPUYYkhwSTk3SzpP++Fgai07r6ws7BD9nKDD8pbiQFFx1CwUPwabJDWKlZTUI/SscNhLiXnK4iGBW4IfFYXnFWIQYIyKnad4IJtlOLJ3VP36+UR4KSk/wMeVhzsvMrWPA3odSIM5j6WmNR15wsv9W69o4m1d+6DZWoJAmRhEV1ouZj1jimGkHud5oj03Q8x4LrgzhqI9kUu29mb2R+NCKvj/keIuEfVlvuRDvUijNpdqKvXsdVj0H92bnMUOROZftP8pFAFZUGp0z0BgzDJlMSiYwjqN5eZcgQ3rAWwYjH6xsbVcmuIUOnLZqzw1dj5H5g7x+qav4zZioDeH1qZjCo61juZRrig8Z6H/hJOWNOjkB/4R+uBEJcSe6iQ9K6m7ht3z5PwV0kv79akd+nH1KGA=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(70586007)(2906002)(8676002)(356005)(4326008)(82310400004)(54906003)(7636003)(107886003)(40460700003)(6916009)(8936002)(5660300002)(9786002)(7416002)(47076005)(508600001)(7696005)(316002)(36860700001)(186003)(26005)(36756003)(336012)(426003)(83380400001)(1076003)(6666004)(2616005)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:45:20.5164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 537e6435-fd6d-4a4c-50a7-08da02bdbf50
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4860

If the abort was caused due to access to stage1 translation table, Xen
will try to set the p2m entry (assuming that the Stage 1 translation
table is in the non MMIO region).
If there is no such entry found, then Xen will try to map the address as
a MMIO region (assuming that the Stage 1 translation table is in the
direct MMIO region).

If that fails as well, then there are the two following scenarios:-
1. Stage 1 translation table being in the emulated MMIO region - Xen
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

 xen/arch/arm/io.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index fd903b7b03..e6c77e16bf 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
         return;
     }
 
+    /*
+     * At this point, we know that the stage1 translation table is either in the
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


