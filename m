Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760E6139C2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433023.685841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUF-00005x-Id; Mon, 31 Oct 2022 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433023.685841; Mon, 31 Oct 2022 15:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUF-0008VP-F3; Mon, 31 Oct 2022 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 433023;
 Mon, 31 Oct 2022 15:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUD-0008Dn-Rw
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b0abd2-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:01 +0100 (CET)
Received: from BN8PR07CA0020.namprd07.prod.outlook.com (2603:10b6:408:ac::33)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 15:13:58 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::47) by BN8PR07CA0020.outlook.office365.com
 (2603:10b6:408:ac::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:13:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:13:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:13:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:13:57 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:13:55 -0500
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
X-Inumbo-ID: a5b0abd2-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avRwN0G+ApTkyA8fRoS2jvSo444A4oHY6yqNU3dJ3eZ0xoe8J1lwFkSZdAR/NPJUnB8pKYY0IOnE5GTZGdooEjzuWKgWyW5GlrGn++QeDTnuVP16eVdzZVNMTZirXHUVdMM0wd2Nj84kHubGvyU7rVRtXLu7dAdxn8F95dWYBpNl3ZQiW1L9C2ZTs+8UurmDMryLyQZDP9srrLEKGSj5X9tz350gj11Whzv5iSWnY+pfIv9MOcGeKO02lhFehqWVZeA4VCiySOWy7V9WJHgK7vKkOQUbG+omUywmRmsPTzS984dYBl5VruWniUuNVQzeeBOsUcgRUX8odws0tMuboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCcH6I2IShWjy514ECFK3D/NJBnq9VO1ALaP7nT1HEk=;
 b=H6IGreBIVOArGkD5KWVUyAjEHjHMI9yN+GU3w2qeVxvXze2x9atYkfWJuo9DgcRHzjp2rUel9ROEwo/+I2HHFpiD9rJSsX/T0zSxnLxIT54HB9/R0ktvWJj/BXZWSHbXpYc2AjPSpOwu/yO06XCTccujN2S95XuCT6f/4zAUipDVb0xhJeiBJS2kE2zlNjqrw8PT4KCDexvG4AV9VNgPHjcaKWEnXG9YPIUBjOlVGuwcRWNTjh9TjrMLt3Vgk1SLshHtfsmQp0yzCx0R7QCoqaf4m6XWy73Ae/ijGYVf78QJNRIOeCzO2OoX6VO15rZvc0TJc97yLMEEUIy+PknnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCcH6I2IShWjy514ECFK3D/NJBnq9VO1ALaP7nT1HEk=;
 b=rkJuPrIMpEkhJdkHBVTJ62us0ZD51WZagQwUZPPz9ru7VnoYY1DaKTwkrDdmulfThSxftfZzqXCU1E1NjmBZRQnH58lvPIahprh+/W4zsz1FVfjFPHi15Qa5PbBDImjzGvD6u95pc35ljclroom4Wj3YVjQOkXdFb7g0d9cXYqA=
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
Subject: [XEN v2 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable for Aarch64 only
Date: Mon, 31 Oct 2022 15:13:15 +0000
Message-ID: <20221031151326.22634-2-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b40064-74d7-478b-23a4-08dabb528867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otvrLXU7ddqHrK+99F4qQ1k3FBoKQ8Gg+QvQs28l0VmTvSVte3VL+40rNSlfCOsw5JAZH93O/XLp+NEyNBEHoM80tH1xntkRIV+Yl4reZfE0MqOD3rTWFDJ/gJrxzgrQihxMfPLElxqqSeB90/qYzYWrV0Rwr+7Yj72Mv1XB7uhGQ6t1AgW5SDGkFmrF29lqf5UfODy9Bz3Q4Gd+W6a5jBVlcCYUVDb+D73EtqBAn0PY+2Xe+R/kRM8kOUhg43CGvF5Mj9IPeBFMAjrRrt95BngDO0tMzAYVvkqfxhmOoMdm2KRbcOfXvTC6MszZuCQL7LXJ3XAj3mcZR3cnm3/OC46bIRm7J3gobbA7GXAxU/jxav9disCoQ9mCcoP3KzfY5VOu9UtP+6LFpxSCL+2H4Qk5g3jCl9f1vejwTfaxPyGdJcpfrwpJZLttAedGgTSHb0O2F/VSCnJ70jHUXFWD9ZVyvi0YACwqCqu/Q0y+cccHMT1WvV8S+cvaqT47sYcCeiGqFHQVSJJu0t+UW9iwC39P+g1j+9DhSUYSTgl2Ah6Nf2lYkTgNO9/hbv47VF8tx4XBhOHzHwNSnexCaHq52PcEYmOsvwow0djBekb1oLI2/n9LEFKyZWkW2Xm1lvwEQ3zEeF9ZwBZONNptmvuOkgPgJk4KIhh1nHf2LdVegfl/+Tz5s54BRD8LqJrM5G85eW+sbb4MdK/iElHuIij4jCsTdLAXCYviaIIAJvPUwQZSsLFbdi3+2hQR5CRu5/viKiEC0xUmqKTSCFSQC3dtYOdSCyr1NndUtn52vIMIY1E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(26005)(8676002)(356005)(41300700001)(81166007)(4326008)(36756003)(36860700001)(47076005)(2616005)(83380400001)(426003)(8936002)(336012)(40460700003)(5660300002)(54906003)(82740400003)(186003)(2906002)(1076003)(6916009)(478600001)(316002)(6666004)(70206006)(82310400005)(70586007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:13:57.6050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b40064-74d7-478b-23a4-08dabb528867
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102

Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state
only. Thus, vgic_v3_emulate_sysreg is enabled for CONFIG_ARM_64 only.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from -
v1 - 1. Updated the commit message.

 xen/arch/arm/vgic-v3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 015446be17..3f4509dcd3 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1519,6 +1519,7 @@ static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
     }
 }
 
+#ifdef CONFIG_ARM_64
 static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
 {
     struct hsr_sysreg sysreg = hsr.sysreg;
@@ -1539,6 +1540,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
         return false;
     }
 }
+#endif
 
 static bool vgic_v3_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr)
 {
@@ -1562,8 +1564,10 @@ static bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
 {
     switch (hsr.ec)
     {
+#ifdef CONFIG_ARM_64
     case HSR_EC_SYSREG:
         return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
     case HSR_EC_CP15_64:
         return vgic_v3_emulate_cp64(regs, hsr);
     default:
-- 
2.17.1


