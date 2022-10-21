Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449A607ACC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427753.677183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0p-0004B5-RQ; Fri, 21 Oct 2022 15:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427753.677183; Fri, 21 Oct 2022 15:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0p-00048B-NW; Fri, 21 Oct 2022 15:32:43 +0000
Received: by outflank-mailman (input) for mailman id 427753;
 Fri, 21 Oct 2022 15:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0o-0000nK-FH
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99164067-5155-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 17:32:41 +0200 (CEST)
Received: from DS7PR06CA0025.namprd06.prod.outlook.com (2603:10b6:8:54::31) by
 PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 15:32:37 +0000
Received: from CY4PEPF0000B8EA.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::84) by DS7PR06CA0025.outlook.office365.com
 (2603:10b6:8:54::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EA.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 15:32:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:35 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:34 -0500
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
X-Inumbo-ID: 99164067-5155-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGRLw49Iz2wznc96DnBagju+OSoTmzDGiZUhF6Js7xPNxrTcibG+X1ACXY2ji+5Q55kETUjVImDIhrvtUpKfJLGkXXWNLrgSoEhINMk4dSvA/FmaiooP/X8yCYKlo5c5bgkI/dh7JbrWBl96eUaxMepabOJYGZDqi4m6xiBVsgfADg5cgi7Y70/tI1pLWk4CQl9jbjQuW5s3rD6+HcQi22KN4QN07UwT3nW3bF9vdRC8XxvmyR48KCKWk5cv87+8s6TdQjb21eZLC/dcalsnNPFxeFnON21wzY0awl8MJkqQpWvIdx5XvHMqV+DHaQNTsn7ZkjRHqjLXfM+T3r9M3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai9EcEkOkTt5okEc7oZTbCy/K+W9d1rnSC3OXLOLx8M=;
 b=dr6VRYFrR0Tk1FzqPTVSjT4iCGgOfKAb8P9XPFTMfhzlARBWRWsco+phSjOug/d+/CcPl/fsDqS8i9VsqZoAsBv1DZUg+Kgb6ODajHECZx7tzWfkTA1RBA+ZNXDy+c6KUP+nfXnGzjxTP81zQAmy4a0ShaO1stGgY96y9eWuFXaIqylZ0WlCKRwgyMj9HGNQHecUxyLNcmPc2/qRTctrC2GWzuFxDyOLNbWTzonXKBbJPD01E/PdgSu71meYKYmYxG49F4wH45tdzTABRg3nXQ1lbSxdg7gBmjYerE1YXP3CgkebZv0BniPYIy6f6nGBtQmF8I7HWnYZ73PwU2oJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai9EcEkOkTt5okEc7oZTbCy/K+W9d1rnSC3OXLOLx8M=;
 b=YoR6uuInlrhLxjNJA14dCBq2Tb9pnEUzPfIpuZilwIANVdRFSyIe6KFG0BVNQeQuviWaY5yHphynIneCI6RV8+FItRpxgyv4liAuCNYUNmZOAicr+Qg1PzKxj3L9cbfptUYp7CACLG6E3byx0bVE4uWZMGmbW9bmZVVwHl021zQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 11/12] Arm: GICv3: Define macros to read/write 64 bit
Date: Fri, 21 Oct 2022 16:31:27 +0100
Message-ID: <20221021153128.44226-12-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EA:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8cce88-def7-4af0-afa1-08dab3797bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HUIINYLI1+i7t8hUz+WcQmMMKNEXfdBy3olTo7KijNvpqxtPGeZjJTs9J8Hh/bZMMBe3P/6EiY1lhfvBXYBWbPX2SrkNE1Pk31IeOH5sw+9iClEXpvxc50Ldc2PjZu78T0+ODDaGHmYP1PNWeMJii4svX1j6H6zh+XUO3/JtokKMN0B0yI7Z/dmkfHCGXB0OjMvkHSFneFw3aVBn66jveJ9AJLW5/t3lr36ZCaRCgpgRZ58cIB1W1aBoy8sboJmHwmsjEFGxO+l0Qfil/Ffi6LhDCHSNn0ULmmyk3jnHkH0ELAcflLxdvJXTG8FWZiammIuDO9aKpPGFnoELceaf1e1M3z9FxSixqTOKweoCiQrflyER9WGN7v9j08tJASdruo2uLozpyNTi2QDlTlT33nMkrxOeFC2O7JQ38/jti8O7TzHUtCR8PHF0ec//3UO35h7olLAk9YjnUOVzOHvLBgJCsI+LnIb77FXeI6vFp1OaBnqgGn8Tiu5+E61bkJP48i1Sz7Z7haFJlp4sAu2z7mJYYyxvtzo/AAumYwDKESUgw8bSeXV6lqx3yThrXXepxBPnSj03pzaxuTA2wlHyR+1U0fsm+/Qh3ZNzCwUl/Wm9q0x9CDqwZmob5BEdmCndlqnovoP0SQiLUCgxpByoaaxXuuX39uWbgK+Ymu6ad48eFjNVnCXApHCwyspxfnptdjaGCik9bctNEvHRyheH4gp/Ka3QvxtiYD1IlaM2nWm8SNk+8bBB1fGon2UkPbZ4QbXGnXajTn6tjeAB3qLzcdhu7X5zVGIEbhxlGRX7SPKuh5kCT2zvuWQG5z5WiaL0
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(8936002)(316002)(26005)(2616005)(36860700001)(5660300002)(6666004)(336012)(70586007)(4326008)(8676002)(41300700001)(70206006)(1076003)(186003)(2906002)(40480700001)(36756003)(40460700003)(82310400005)(54906003)(81166007)(426003)(6916009)(356005)(47076005)(82740400003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:37.5203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8cce88-def7-4af0-afa1-08dab3797bd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235

Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
This in turn calls readl_relaxed()/writel_relaxed() twice for the lower
and upper 32 bits.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/arm32/io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 73a879e9fb..6a5f563fbc 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -80,10 +80,14 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
                                         __raw_readw(c)); __r; })
 #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                                         __raw_readl(c)); __r; })
+#define readq_relaxed(c) ({ u64 __r = (le64_to_cpu(readl_relaxed(c+4)) << 32) | \
+                                        readl_relaxed(c); __r; })
 
 #define writeb_relaxed(v,c)     __raw_writeb(v,c)
 #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
 #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
+#define writeq_relaxed(v,c)     writel_relaxed(((uint64_t)v&0xffffffff), c); \
+                                    writel_relaxed((((uint64_t)v)>>32), (c+4));
 
 #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
 #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
-- 
2.17.1


