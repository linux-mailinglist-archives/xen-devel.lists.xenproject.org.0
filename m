Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A0607AC0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427740.677128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0N-0001Ve-71; Fri, 21 Oct 2022 15:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427740.677128; Fri, 21 Oct 2022 15:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0N-0001Sn-3C; Fri, 21 Oct 2022 15:32:15 +0000
Received: by outflank-mailman (input) for mailman id 427740;
 Fri, 21 Oct 2022 15:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0L-0000AU-Gs
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8815fba4-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:12 +0200 (CEST)
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 15:32:08 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::87) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:07 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:06 -0500
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
X-Inumbo-ID: 8815fba4-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcHTjNjvS1jAWXNebH74PccSqFd7KGuR4XsHHqC949oyBqFmesrNeZiUILyKL0H+kJh10wu1bzOeboChKVqjLSoOqBUBrwDei9e0L6HvLDDTocAkfOOKsNRCvnh8ie/zP6nlH9ORtshnrSiLJgjVLgZiIteTgr50QZEQLDhX1dgapMEIoOPyKPlJ3QxogM7kmxNSGXsBSGK6pMbi+qrdrdMH52PRi7DMzSBJqJhOLA20s/ZzHBC9EhwU65R5YZ1/1HAnX/TgTJapTWYFU6OsyL7HGhz58ZnJ7DCxQlYemStOktCRq/MVzxc+7/8yI2vEZfJB4v3hG0S5Ht8uUsc5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3z1fYyjNNFULchMYPGXqvwacdX9nW9qmaUMKuj/M3A=;
 b=MXflJ8A/mAsFIuDw3RbocJkvWeyj3ljYnRh7dEPcEtVjGN/iuwbH8UYhXamWaPIJUvsINmdx+KIKhhArJTJ9BUFT/77zT8u44UpTYA4V8FLFMiXsQ45v34TiD/KM13PzTNHVJRxcE6U06QrRojLca8Pyv8hcZmyHByXOrYw5wPXL+SJwQrCsG+xPNtDoJxyWB9YQNZyQ0VL1vBPPMeae3dxgseX5JHlmL+CKyxYo9LJxMpC2JGgeNCsMiVg6zOQv9UmjpPrHeNQ1SgOXekl6p/JdcHdp6T/RQCuRaOYrEe4vTpgl41t4M+yV3gOCOa3AzISDfDrAmzYZxJyuUhGTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3z1fYyjNNFULchMYPGXqvwacdX9nW9qmaUMKuj/M3A=;
 b=x+hjeR/kGqA+zLETj2Ta8PT0VHLtXwEcYfjOM7y47E1UG6w71hunllmtn67YqsOKy8fQ/bSZdB4U+6tUaXhOIJz7Drs5OpsJ6QjF9rpR4dQUEjVbPRd/xXreAylmjGtPL3MbFZ62S82GzurFZL5MllNxpmfme5SZvVpgFiHfl9M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 04/12] Arm: GICv3: Emulate GICR_TYPER on AArch32
Date: Fri, 21 Oct 2022 16:31:20 +0100
Message-ID: <20221021153128.44226-5-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|MW4PR12MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5d9836-905d-4508-a848-08dab3796a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dhxz+fe6OvZFIQrAnIXbWKmMqu89GV6SlAMrlJzxfn5zcHHyJtplTlDsCdfCkYR3f6KF4fSYAMtcFH1ixhVk1iBg/qe6Iow8q1yXsSUMH5JjSm10OVRtPKd8lH35qFz2+XPE+GVPMHh+0FPEZMqoOvgrCOVmYRwf0FoEm/xEbZLnZIM1+mxoV+w24lL3LXc1tKEVQHnm3eOsbJvJjxEbYVNXQ8mcEIxKppa+s1MhmJ4tmxDh3FMOtBXxb3I0YQkDb1DIhLGm3sIsFzNgSZPHD8D5XRzEQe5T/OiXuX3g71fUqEDlEFl7aoXvrpbxhLf1yMtUdJhcWWz/ro4lYfNHanGE+iWwuBhi02sRCz8gAghErTm/61ZUNTlUViIu5VSnCUKC+WyB0wll+95zcwpbIeM95+sypb7RkdeLWXv1WMh6MNPMDfy1ILt8NBLtw6q2X2JnnO62qKHTR5PJyI3KHxuPAmR7SliuZKjBLTibgfYkonyq7oOV89jRaj+W6LUM9qIPJO8+T82tTgAjaNgtk+oQ4kBFAav17tKDTvJYmkFxwsDl50NF0+sZDG/E4sq68T8NhWWFr5oV3tgGMEWWILosmfsW/Y/zW7DUZWGoyzuE4jTJnWvoI/F96MyFP3DgZwusd2r9qrgeWCpZsCxdSZ1rmRXGj0+IlzgMUHyc16KGWvZgbke3c3lAw1QjiOzqmIGTsex74zQTXoEuKfxfk8H9TcW66Tym8HSL8E/hMzmk5eiHKcZCm2vBMJDvUtYcYaEJdbla96zenzFI/jZwzhac7BzmDJLKstTk1Pxutww=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(26005)(6666004)(1076003)(83380400001)(36860700001)(478600001)(336012)(47076005)(186003)(426003)(5660300002)(40480700001)(8936002)(2616005)(6916009)(54906003)(316002)(4326008)(70206006)(8676002)(41300700001)(82310400005)(70586007)(36756003)(2906002)(356005)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:08.3667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5d9836-905d-4508-a848-08dab3796a6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626

Refer Arm IHI 0069H ID020922,
The upper 32 bits of GICR_TYPER represent the affinity
whereas the lower 32 bits represent the other bits (eg processor
number, etc).
MPIDR_AFFINITY_LEVEL() returns a 32 bit number on aarch32. Thus, this
is appended to return GICR_TYPER register.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/vgic-v3.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index c31140eb20..d86b41a39f 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -190,14 +190,18 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
 
     case VREG64(GICR_TYPER):
     {
-        uint64_t typer, aff;
+        uint64_t typer;
+        uint32_t aff;
 
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 24 |
+               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 16 |
+               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 8 |
+               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0));
         typer = aff;
+
+        typer = typer << 32;
+
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
 
-- 
2.17.1


