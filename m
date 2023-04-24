Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3A6EC7C9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525209.816276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRt-0003Vg-M9; Mon, 24 Apr 2023 08:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525209.816276; Mon, 24 Apr 2023 08:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRt-0003Tn-Hd; Mon, 24 Apr 2023 08:21:25 +0000
Received: by outflank-mailman (input) for mailman id 525209;
 Mon, 24 Apr 2023 08:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QOl=AP=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pqrRs-0002wP-1Y
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:21:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdcc21ab-e278-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 10:21:21 +0200 (CEST)
Received: from DM6PR07CA0105.namprd07.prod.outlook.com (2603:10b6:5:330::8) by
 SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.31; Mon, 24 Apr
 2023 08:21:17 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::b2) by DM6PR07CA0105.outlook.office365.com
 (2603:10b6:5:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 08:21:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 08:21:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:21:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:21:16 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 03:21:14 -0500
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
X-Inumbo-ID: fdcc21ab-e278-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8FC0XbDaSGc5RHITZFFOvPU1twvx0+O2uJ/L+UrfaSxFBxo53IW8SjpywggItLJNUFGc5KUm10afLNpO5Qlc6cFpJ5CXjJojjUEvvMbvUw32BnjueLMjDOSH1Mm2LgOBltDaS49GJjQUuv0pjxTliQpRObNxLBkCkL/KPpZybN8jHFVpV16pV6T3nZYfBpuGtagFbx4SynSUlLe+qNo7+DmOFSoeJiHl5hXHUTWlteABN7FAja8KdyCNJEMRYZoxtflPd2waoqZAlh+z9Oo/0m/mzqTKUdMZgCNIDkmghavzqUZFr5RY20A+CdarAufqyd8thDklhHnZJcsaxdi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLJl8NuTEtKiCgcahKscn4Cu5cCYjQA1mE/ixk7iJfk=;
 b=DZO5UJ9J4acgEvg3PjhowLVUmjjMZAXiFQyCBhsCW4RBhbUXElEV0EwApxJ7KYBqHjxEzNmLXpO9BMRMIZ8838rUTWJhIf3PD/D3FX8m3lAoYhG6ClAhkderGWcS8J9D03T/xZQBcko3hTNlSOXRI4208J28R2BNyB0EWrwAYzfS34aRume7zibjualDY32Ukb+9lYhREx2bhxG5+Qt5Xx1c0r1gnWbP1PPbikS8Tmd6Rx+jqnRZ83pC4VM3K/leLRSctIQ3jI7yXQ2RoNjyK/2sA+dGuvolZ1yj/NDvgLzoQPbWuLaU14dUQSyuOSNj0itFm1wuCjn2d5PyZx8xSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLJl8NuTEtKiCgcahKscn4Cu5cCYjQA1mE/ixk7iJfk=;
 b=TOWpWF+5TokNpEQNiQF28yIZ0LjQ1W71JL5pK5ez1igh4yfyNrDQeULEq0Af/MDHL1nrCplSAocn+2xrBUIjy/GHROxA4zfoaF1gKPkA0yjwGHkuZlSJ5qp2L70ZZOLX3X4oNQFs6MRJbP5aZOhy+6tRAOVcYP7MOZOY/fe2bME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 2/3] x86/vmx: replace enum vmx_msr_intercept_type with the msr access flags
Date: Mon, 24 Apr 2023 11:20:37 +0300
Message-ID: <20230424082038.541122-3-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
References: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT005:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 939b278f-4e43-4a68-1506-08db449ce037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ShtoRzldRtAD+WGvNnfSe2+t3at5cAj5tYcz9HReR7BB4m2ROu1W0Csm2GqzSgY5qOr/Wj1gNdeGZ74Lx7bFvyZH6oGDw6Se2tq8R+gN7X7KAnVmzAzK9CLOKT/9V+QQOZBzZpWlBpv9ryUtgcOg8A7WyTosTPEqql/0rYjNk2u7/WuzQN4aVpjyKY7WoTB6dGaaepZNNgFF1vgrvsqltFoWdOxhjImn26jE/yJgWyqT5WCi0hHUs8OGyUDd65ZTGgGy/iBpkoyGrkm2f+TzhI9v/8hpPpLFDXKY5yuDo5p+fLkkCXRIc7ysPg0wrz3LA6YGJyIXDv2yxRXMIEnJWcBWGuxFftDL+NiY4yW19s9RDKigZ9qFVtSiqmsmmCIfJIhs8I8va7ifKEVthoc5QUwU1R8m+tPLDpRtyaq430AbPFjrSu1l6+sZS6hveeMY1H7D12P7TSti/aleuAbCOgtXbcNEEU+ql5jKhiwo1DX3LY93Ixo0hCRztF9sutp6cO/Grlsql7I3D+LQD6knAWV1kzYGlyD0Eq3b2HbBXAFf5A1hiXxdZjnlmZ3/ekmgHSNKNKRbXSlvTejL/LCzSBFc5LqjyVu5vGPdKp+67CbtJpl0JgLRQnrfhEEttD5WsV/olfyHtXZiwpCET6KF35iQ5lCetnIt/17OiJpWNGpYe/isqZ09+rfntE9ZlKslALCSf32sqHbPinm37BYvMEtunzWqTMOYAillVYODBxA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(40470700004)(46966006)(36840700001)(54906003)(36756003)(4326008)(6916009)(2906002)(186003)(44832011)(70586007)(70206006)(16576012)(316002)(6666004)(30864003)(41300700001)(5660300002)(36860700001)(478600001)(40480700001)(81166007)(356005)(426003)(336012)(82740400003)(47076005)(8676002)(82310400005)(8936002)(86362001)(83380400001)(1076003)(26005)(2616005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:21:16.9412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 939b278f-4e43-4a68-1506-08db449ce037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911

Replace enum vmx_msr_intercept_type with the msr access flags, defined
in hvm.h, so that the functions {svm,vmx}_{set,clear}_msr_intercept()
share the same prototype.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---

Changes in v2:
  - change from int to unsigned int the type of param type, reported by Jan

 xen/arch/x86/cpu/vpmu_intel.c           | 24 +++++++-------
 xen/arch/x86/hvm/vmx/vmcs.c             | 36 ++++++++++----------
 xen/arch/x86/hvm/vmx/vmx.c              | 44 ++++++++++++-------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 12 ++-----
 4 files changed, 54 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 35e350578b..395830e803 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -219,22 +219,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
 
     /* Allow Read/Write PMU Counters MSR Directly. */
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     /* Allow Read PMU Non-global Controls Directly. */
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), VMX_MSR_R);
+        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
-    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
@@ -242,21 +242,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), VMX_MSR_R);
+        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
-    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static inline void __core2_vpmu_save(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index b209563625..e7b67313a2 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -892,7 +892,7 @@ static void vmx_set_host_env(struct vcpu *v)
 }
 
 void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             enum vmx_msr_intercept_type type)
+                             unsigned int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
     struct domain *d = v->domain;
@@ -906,17 +906,17 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
 
     if ( msr <= 0x1fff )
     {
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             clear_bit(msr, msr_bitmap->read_low);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             clear_bit(msr, msr_bitmap->write_low);
     }
     else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
     {
         msr &= 0x1fff;
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             clear_bit(msr, msr_bitmap->read_high);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             clear_bit(msr, msr_bitmap->write_high);
     }
     else
@@ -924,7 +924,7 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
 }
 
 void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           enum vmx_msr_intercept_type type)
+                           unsigned int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
 
@@ -934,17 +934,17 @@ void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
 
     if ( msr <= 0x1fff )
     {
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             set_bit(msr, msr_bitmap->read_low);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             set_bit(msr, msr_bitmap->write_low);
     }
     else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
     {
         msr &= 0x1fff;
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             set_bit(msr, msr_bitmap->read_high);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             set_bit(msr, msr_bitmap->write_high);
     }
     else
@@ -1151,17 +1151,17 @@ static int construct_vmcs(struct vcpu *v)
         v->arch.hvm.vmx.msr_bitmap = msr_bitmap;
         __vmwrite(MSR_BITMAP, virt_to_maddr(msr_bitmap));
 
-        vmx_clear_msr_intercept(v, MSR_FS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_GS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_SHADOW_GS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_FS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_GS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_SHADOW_GS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, MSR_RW);
         if ( paging_mode_hap(d) && (!is_iommu_enabled(d) || iommu_snoop) )
-            vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
-            vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, MSR_RW);
     }
 
     /* I/O access bitmap. */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 096c69251d..8a873147a5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -791,7 +791,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
      */
     if ( cp->feat.ibrsb )
     {
-        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
         rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
         if ( rc )
@@ -799,7 +799,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     }
     else
     {
-        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
         rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
         if ( rc && rc != -ESRCH )
@@ -809,20 +809,20 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 
     /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.ibrsb || cp->extd.ibpb )
-        vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_PRED_CMD, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_PRED_CMD, MSR_RW);
 
     /* MSR_FLUSH_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.l1d_flush )
-        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, MSR_RW);
 
     if ( cp->feat.pks )
-        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_PKRS, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_PKRS, MSR_RW);
 
  out:
     vmx_vmcs_exit(v);
@@ -1418,7 +1418,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 
             vmx_get_guest_pat(v, pat);
             vmx_set_guest_pat(v, uc_pat);
-            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
@@ -1429,7 +1429,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
-                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
             hvm_asid_flush_vcpu(v); /* no need to flush cache */
         }
     }
@@ -1883,9 +1883,9 @@ static void cf_check vmx_update_guest_efer(struct vcpu *v)
      * into hardware, clear the read intercept to avoid unnecessary VMExits.
      */
     if ( guest_efer == v->arch.hvm.guest_efer )
-        vmx_clear_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+        vmx_clear_msr_intercept(v, MSR_EFER, MSR_R);
     else
-        vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+        vmx_set_msr_intercept(v, MSR_EFER, MSR_R);
 }
 
 static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
@@ -2312,7 +2312,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     struct vcpu *v;
 
     for_each_vcpu ( d, v )
-        vmx_set_msr_intercept(v, msr, VMX_MSR_W);
+        vmx_set_msr_intercept(v, msr, MSR_W);
 }
 
 static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
@@ -3479,17 +3479,17 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
             {
                 for ( msr = MSR_X2APIC_FIRST;
                       msr <= MSR_X2APIC_LAST; msr++ )
-                    vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
+                    vmx_clear_msr_intercept(v, msr, MSR_R);
 
-                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, MSR_R);
             }
             if ( cpu_has_vmx_virtual_intr_delivery )
             {
-                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, MSR_W);
             }
         }
         else
@@ -3500,7 +3500,7 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
            SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
         for ( msr = MSR_X2APIC_FIRST;
               msr <= MSR_X2APIC_LAST; msr++ )
-            vmx_set_msr_intercept(v, msr, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, msr, MSR_RW);
 
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
@@ -3636,7 +3636,7 @@ static int cf_check vmx_msr_write_intercept(
                         return X86EMUL_OKAY;
                     }
 
-                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+                    vmx_clear_msr_intercept(v, lbr->base + i, MSR_RW);
                 }
             }
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 51641caa9f..af6a95b5d9 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -633,18 +633,10 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-
-/* MSR intercept bitmap infrastructure. */
-enum vmx_msr_intercept_type {
-    VMX_MSR_R  = 1,
-    VMX_MSR_W  = 2,
-    VMX_MSR_RW = VMX_MSR_R | VMX_MSR_W,
-};
-
 void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             enum vmx_msr_intercept_type type);
+                             unsigned int type);
 void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           enum vmx_msr_intercept_type type);
+                           unsigned int type);
 void vmx_vmcs_switch(paddr_t from, paddr_t to);
 void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector);
 void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-- 
2.34.1


