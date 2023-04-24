Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037656EC7CA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525210.816287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRz-0003u3-2p; Mon, 24 Apr 2023 08:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525210.816287; Mon, 24 Apr 2023 08:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRy-0003qK-Vi; Mon, 24 Apr 2023 08:21:30 +0000
Received: by outflank-mailman (input) for mailman id 525210;
 Mon, 24 Apr 2023 08:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QOl=AP=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pqrRx-0002wP-Do
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:21:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012caa17-e279-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 10:21:27 +0200 (CEST)
Received: from MW4PR04CA0240.namprd04.prod.outlook.com (2603:10b6:303:87::35)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 08:21:20 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::16) by MW4PR04CA0240.outlook.office365.com
 (2603:10b6:303:87::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 08:21:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 08:21:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:21:18 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 03:21:17 -0500
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
X-Inumbo-ID: 012caa17-e279-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQHOFTg5LDC8AuUINx3rtFIeffax/z53phTYUpiVD8K2y3nWy+TbTEeVw2Q7V9rSLdZJhhKnURCY/3m6iu/PC0eHyaDzGbG9rF5xd8n1nfJT1FmY1YGe7aNFrkt48oOYU8t1PYOLxBAKDH9h33lUE0OPyuEbIQWgha5+R68CmUK9cWwYXTbRVX+BeOIFtOE16MtIVrX9vbwlWP24nGemDHan9MPFdt50EQ7I9+80vTAD5IAwTh+YLnd00L0y3TmQBr6winAc1Ulw6Xj0V36G0rYaKUUnnv6/ByvbwN+fi6/xfPSHtxDHu9qjUW9PLc2r0r38tbTGWWG8svSxb1MZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsJJg35SdGTTC2bSQZuKwbd3Cr24cZUb+TyVYaHwI5A=;
 b=XEdCcuBUAaBJYU06Iu6o1UZmZObiWQ0laNlsFw3MYfSGacF7SI4Z2OPU2g8E6FAdf+wa1uOCS9OwoR6DTBdmtKuxl+6pmJpX1PWKh0r+R40uF4yVyMix6bb1kaou2trkBp2iW4qteLoAVlDStz7P4Fs9me2S66KC+m2XW1OfIfzVvk+GTGG2NKBST8ltPGRrSdTuzKc2hvSGNsasl9Hqf2Dj5akhNQnFDc1KaTqjxeexX4FwVsAQyCtJEgO43R8/n6hu9S6ulxVr4GBPnaCwSnoQ16eU6LTqyZAaq7oFHIGc+ooaZ2+NdAPBPmE6IwTTWhjdbUv0YYKLZDFyK54wkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsJJg35SdGTTC2bSQZuKwbd3Cr24cZUb+TyVYaHwI5A=;
 b=F6X+ymiTsSshlTcG93xG3puoplcraaOGVjV7jbV7n4aZOyFN3jd1uWVH/Ur2U1RX/OU7vhrbWmTRwyr+PDjZu+jTUCCwLvpA9lE8nXgwXpqSRLiIolReafNwOsvrkpb7v9sOrzOPevyxvYqu7fBLyHNjygqb90FUPe5h9uAXU1g=
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
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 3/3] x86/hvm: create hvm_funcs for {svm,vmx}_{set,clear}_msr_intercept()
Date: Mon, 24 Apr 2023 11:20:38 +0300
Message-ID: <20230424082038.541122-4-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
References: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bff983-5563-4151-185e-08db449ce1e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z9hANcABW7CmQe4DK4uY5GHrSsvcFmfdp/vybTPNqg/6f3aNkBy8k9uE8sn+1u9bd4oEH/TWrbQyf5znFMh/pRaCMT3l1s2/GauMM1XcBc3+a1mj37xzcGhGCaR+FgQb1U5G/okVz656C4Ts1eWX5TNq4XBkn6IPyd6ITg64/6xFNgYFrz6NVT/j1C1cOK3K+WzGcG1f6oaR59FvWZCkIsqbIMgAoZexiW3dusUBrjX7gBgPPe9PTx7VFsMfnqpRPT8TVomsubQxGN3KjkbPkuhyq/gfxLj1UVAw/ZEX8IHgS8OPVCfWshgLJdIbVWvItHkACqh+HnrYrGo53sZJEiTC3ZYSWz91HNDaHykRO+VP2+Dvb1pDZdwIllLeIljq0GkpgHJvApuQB6ARONmbt2+KOUDCq++ZhbtnlHluoXsbIujVUkYX16pBeE6v8qYrAypcg848wju4Hod5Izn6MMEcefMdHCzQ01H2zFaf7xtT7rbo/kMp6M16wbet4Jay8FLTSnKPdwpgOuRG+iRvPt9OL7VGuaY/3BY0OQKWp5TTFe6KwK3+2qo0YCfa94KU5r2qDrDfIvAq3NJnTuEukuGu15rYlmTLFV9OfL7FvJHzgj6xJhUqxX8AIktmpMlOCDc3gqKfPTyftPHsCTGbtmbMDFbOR2qHqoqFFQpCych1+eqaSZ2oS2L2qLmGahSDNx/cakIwZGQDBMX7d/OJ0uYbbTn4FKtLv/oxPlQl9no=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(70206006)(70586007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(82310400005)(36756003)(86362001)(40480700001)(356005)(26005)(186003)(1076003)(81166007)(478600001)(6666004)(36860700001)(83380400001)(47076005)(2616005)(336012)(426003)(16576012)(82740400003)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:21:19.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bff983-5563-4151-185e-08db449ce1e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

Add hvm_funcs hooks for {set,clear}_msr_intercept() for controlling the msr
intercept in common vpmu code.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---

Changes in v2:
  - change the parameter types to unsigned int

 xen/arch/x86/cpu/vpmu_amd.c             | 10 ++++-----
 xen/arch/x86/cpu/vpmu_intel.c           | 24 ++++++++++----------
 xen/arch/x86/hvm/svm/svm.c              |  7 +++---
 xen/arch/x86/hvm/vmx/vmcs.c             |  8 +++----
 xen/arch/x86/hvm/vmx/vmx.c              |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      | 30 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h |  8 +++----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  8 +++----
 8 files changed, 65 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index da8e906972..77dee08588 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -154,9 +154,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_clear_msr_intercept(v, counters[i], MSR_RW);
-        svm_set_msr_intercept(v, ctrls[i], MSR_W);
-        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
+        hvm_clear_msr_intercept(v, counters[i], MSR_RW);
+        hvm_set_msr_intercept(v, ctrls[i], MSR_W);
+        hvm_clear_msr_intercept(v, ctrls[i], MSR_R);
     }
 
     msr_bitmap_on(vpmu);
@@ -169,8 +169,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_set_msr_intercept(v, counters[i], MSR_RW);
-        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
+        hvm_set_msr_intercept(v, counters[i], MSR_RW);
+        hvm_set_msr_intercept(v, ctrls[i], MSR_RW);
     }
 
     msr_bitmap_off(vpmu);
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 395830e803..ed32d4d754 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -219,22 +219,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
 
     /* Allow Read/Write PMU Counters MSR Directly. */
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
+        hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
+        hvm_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
+            hvm_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     /* Allow Read PMU Non-global Controls Directly. */
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
+        hvm_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
-    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
+    hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    hvm_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
@@ -242,21 +242,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
+        hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
+        hvm_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
+            hvm_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
+        hvm_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
-    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
+    hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    hvm_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static inline void __core2_vpmu_save(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 3ee0805ff3..cbd8eff270 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -277,7 +277,8 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
     return msr_bit;
 }
 
-void svm_set_msr_intercept(struct vcpu *v, unsigned int msr, unsigned int flags)
+void cf_check svm_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                    unsigned int flags)
 {
     unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
 
@@ -291,8 +292,8 @@ void svm_set_msr_intercept(struct vcpu *v, unsigned int msr, unsigned int flags)
         __set_bit(msr * 2 + 1, msr_bit);
 }
 
-void svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             unsigned int flags)
+void cf_check svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                      unsigned int flags)
 {
     unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e7b67313a2..c051bcb91b 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -891,8 +891,8 @@ static void vmx_set_host_env(struct vcpu *v)
               (unsigned long)&get_cpu_info()->guest_cpu_user_regs.error_code);
 }
 
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             unsigned int type)
+void cf_check vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                      unsigned int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
     struct domain *d = v->domain;
@@ -923,8 +923,8 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
         ASSERT(!"MSR out of range for interception\n");
 }
 
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           unsigned int type)
+void cf_check vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                    unsigned int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8a873147a5..6a33e92b0a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2742,6 +2742,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+    .set_msr_intercept    = vmx_set_msr_intercept,
+    .clear_msr_intercept  = vmx_clear_msr_intercept,
     .enable_msr_interception = vmx_enable_msr_interception,
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 5740a64281..96ff235614 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -213,6 +213,10 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
+    void (*set_msr_intercept)(struct vcpu *v, unsigned int msr,
+                              unsigned int flags);
+    void (*clear_msr_intercept)(struct vcpu *v, unsigned int msr,
+                                unsigned int flags);
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
 
     /* Alternate p2m */
@@ -647,6 +651,20 @@ static inline int nhvm_hap_walk_L1_p2m(
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
+static inline void hvm_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                         unsigned int flags)
+{
+    if ( hvm_funcs.set_msr_intercept )
+        alternative_vcall(hvm_funcs.set_msr_intercept, v, msr, flags);
+}
+
+static inline void hvm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                           unsigned int flags)
+{
+    if ( hvm_funcs.clear_msr_intercept )
+        alternative_vcall(hvm_funcs.clear_msr_intercept, v, msr, flags);
+}
+
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
@@ -905,6 +923,18 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline void hvm_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                         unsigned int flags)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void hvm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                           unsigned int flags)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 94deb0a236..5e84b4f4c1 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -603,10 +603,10 @@ void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
 
-void svm_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           unsigned int flags);
-void svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             unsigned int flags);
+void cf_check svm_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                    unsigned int flags);
+void cf_check svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                      unsigned int flags);
 #define svm_disable_intercept_for_msr(v, msr) \
     svm_clear_msr_intercept(v, msr, MSR_RW)
 #define svm_enable_intercept_for_msr(v, msr) \
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index af6a95b5d9..7f7d785977 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -633,10 +633,10 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             unsigned int type);
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           unsigned int type);
+void cf_check vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                                      unsigned int type);
+void cf_check vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                                    unsigned int type);
 void vmx_vmcs_switch(paddr_t from, paddr_t to);
 void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector);
 void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-- 
2.34.1


