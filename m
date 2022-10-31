Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C66139C8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433035.685940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUb-0003Od-98; Mon, 31 Oct 2022 15:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433035.685940; Mon, 31 Oct 2022 15:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUb-0003LU-4p; Mon, 31 Oct 2022 15:14:25 +0000
Received: by outflank-mailman (input) for mailman id 433035;
 Mon, 31 Oct 2022 15:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUZ-0001KF-M2
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2b33758-592e-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:14:23 +0100 (CET)
Received: from BN8PR03CA0029.namprd03.prod.outlook.com (2603:10b6:408:94::42)
 by SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:20 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::af) by BN8PR03CA0029.outlook.office365.com
 (2603:10b6:408:94::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:18 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:17 -0500
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
X-Inumbo-ID: b2b33758-592e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNFufZ3uYA95z5tMniuK6MgVCrzABkjx0bI3JozzpL+fABa2pcd22E01oM4FXLXhctsxTfkx2oPDvmBwwHF9C1rA8tsRZK+HCd4bjWlFNKRfHIWeph0sE8tPKgKOQInaUNyqQq38cIbLow3e6eMCH7DJLnS2aWeMPw0iKiIUyRmO56CfC0NXNgOfzdBWqRTHunS5/JQzDCc48BnMMvc+Ht3CQDNdfM181mG4302cGlX6d3R6S7km6gX+v+iyXd10cqF757bWQbQLxsfH2rS/wl+G8Ehg73mTuaa1RZidfxc4apMKZm6AIf/MXvLo9/Kw7tSiV2w2Lr7ugjncZpqZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssqD6eDVxRSMIkTCVK1fqChl6nBTtHT7TooGtjeWbYQ=;
 b=AHQ9BwiBrtLXD4Par8Ov/NxBF46Gq7qIQqAVXDaeI+b2m/OcXkzxjU8ebjzlycPW3d79uqokO9/ib7hCuR40iApG6hV+fVWBikQ5ydW//6Cj3dkGxjOAU367qnGJeyHgPJACAoub0QOhOqxU/eLHdTIuT36pk+Jkg+d5KET2plpSKV+yK92Jdvp4V5Bxh8APDOS90dWynfmceaQzlLrev6wONYSMQEpjhxuWJUCvuQeuCh6ZN4i7cf3oOOcXnsN/p29BEvgPXdOZoiayYcbV3l15RX19FdC/HEf/0lPxZDtGlHM+G+a6mYzdzSVJbLjDfY1gaxiCcPP8pobhgi0nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssqD6eDVxRSMIkTCVK1fqChl6nBTtHT7TooGtjeWbYQ=;
 b=hJ3UsfOE72xPkF5jbTBmX4nVQYDdF8SxPgtacMWTrmCto0JBzXD/sWvshtqllF7h1jABVvecCqLE9Ur2f+k9ueI3JxDMjWB6U8r9EMC6p+4TmPO+hBYTPWcYz0ekPEyGU3cNZp1GIo1JNnqV+xfuXwt7d73Re3gFIFy8d2Xur9Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Date: Mon, 31 Oct 2022 15:13:25 +0000
Message-ID: <20221031151326.22634-12-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 817997c4-64d5-4f93-355f-08dabb529557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m4PCC5K6hhyznZfO+zO0ygAnQgAt+px1ZRTWOx9cBxJVifT8n2rD7kBxROJbNlNFE15FiBBfXLKiPfLEnkUGS0mI8O0z5YQPA7c6SvaBYZ58gsF39ZWAROquTF6YG5igIZE2NgGvlUz5TskZwY9ZnFbZALIk3QK20+NjqHQuu7VT7BdU/XTCi65uVwT9QY4YXYlXzTlTIP0WEwjxMAY7HxLwMr+rSEcTgE5hi7iQ30ZB/PD2bQiQKuCyppUi/lasgHgSqq1lRP1PAMXLba7eC8F+GcNuo52HvYcq8EzjJIGQdVEz3k767SMuK7x83Mh7PZ5M7A0PfJFPwe5iV3uqfwXQ+VREzUdqQjz96Hf2CcC0fxxqytoxNyCYcelGeXQ0keySbCxPEZACPyUNEYCEvnhkN+yro0oQt2uZCJisreC6Baapx1BvFiD2TKiP+qT1qJwmFbtzZEJDyFeN2G2RNcJ2opdGZd7fbzrTN76fxMGKDwmXrA5DmJoLB9fLelZchI8MPb4AAI2skk8DMnSGP0D6B1NSzPqmn4tBeY1Y/SFnOABBaMKk36fRs65qage2R9UrUxay8T33UHoih60zj1ZqdzfvhLOKhb6hBIJUPy6wEpRPnmkywbXLHqKl0MERf+8JH9zjMAM4lARYAEFXhGkTyKfMpp43VyxS9EiWYZablWCWv/1k3XpNNWzPnJF8iJJQ29FYR28aP4PlT+g+Qohc8XdPjAArOY99N4FydatLl8z0TL92yACfceR5SIuYFdM1TXSeYVFLt0dTl8x5ESPyiWLhaO5x+SqenP6jof7WjTb4uLWRPlv0aUXZdzP6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(70586007)(70206006)(8676002)(54906003)(316002)(6916009)(36860700001)(356005)(81166007)(83380400001)(2906002)(36756003)(478600001)(1076003)(8936002)(40480700001)(41300700001)(5660300002)(4326008)(336012)(2616005)(186003)(40460700003)(82740400003)(426003)(6666004)(47076005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:19.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817997c4-64d5-4f93-355f-08dabb529557
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219

Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
This uses ldrd/strd instructions.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
2. No need to use le64_to_cpu() as the returned byte order is already in cpu
endianess.

 xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 73a879e9fb..d9d19ad764 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
         return val;
 }
 
+static inline u64 __raw_readq(const volatile void __iomem *addr)
+{
+        u64 val;
+        asm volatile("ldrd %Q1, %R1, %0"
+                     : "+Qo" (*(volatile u64 __force *)addr),
+                       "=r" (val));
+        return val;
+}
+
+static inline void __raw_writeq(u64 val, const volatile void __iomem *addr)
+{
+    asm volatile("strd %Q1, %R1, %0"
+                 : "+Q" (*(volatile u64 __force *)addr)
+                 : "r" (val));
+}
+
 #define __iormb()               rmb()
 #define __iowmb()               wmb()
 
@@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
                                         __raw_readw(c)); __r; })
 #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                                         __raw_readl(c)); __r; })
+#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
+                                        __raw_readq(c)); __r; })
 
 #define writeb_relaxed(v,c)     __raw_writeb(v,c)
 #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
 #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
+#define writeq_relaxed(v,c)     __raw_writeq((__force u64) cpu_to_le64(v),c)
 
 #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
 #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
 #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
+#define readq(c)                ({ u64 __v = readq_relaxed(c); __iormb(); __v; })
 
 #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
 #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
 #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
+#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
 
 #endif /* _ARM_ARM32_IO_H */
-- 
2.17.1


