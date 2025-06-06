Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E958AD096C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 23:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008887.1388075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebF-000441-Ot; Fri, 06 Jun 2025 21:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008887.1388075; Fri, 06 Jun 2025 21:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebF-00041f-Kv; Fri, 06 Jun 2025 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1008887;
 Fri, 06 Jun 2025 21:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyhR=YV=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uNebD-0003tc-OL
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 21:27:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e87d69c-431d-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 23:27:32 +0200 (CEST)
Received: from MW4PR04CA0121.namprd04.prod.outlook.com (2603:10b6:303:84::6)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Fri, 6 Jun
 2025 21:27:27 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::24) by MW4PR04CA0121.outlook.office365.com
 (2603:10b6:303:84::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Fri,
 6 Jun 2025 21:27:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:27:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 16:27:25 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Jun 2025 16:27:24 -0500
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
X-Inumbo-ID: 0e87d69c-431d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMKL5dPCByndrIR0xjno/vYZVVsEOMtxgvbKIYn+qXKOPDvVX9AyBHDo4I2GoTsToQ1hY6MU9RevolTGPWJA3PPkr0m0jhAvsLkw+z7PkYTuiWCRPO3xTec6askLKLNkJRIuYSVdhP9ZfftUa1bhWgiZMkyn0FRlCZXDEObhoukeKJ4JjIoILLg2zqdpQPhhOJu17UlUiom+PbJ8W1BAErQRjx2P/yhSFX06+zSM2kvHqwkAWtF2+yDVudvVPrJg/97L2HxvlB21tUi3q+imN78hMMhRprj4DXVNfPbXStmL2UUijBQkb5J68RbCRzRPgU0VnDw23nPMzLRNIzxABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX+Ldn95Q/8+1w/SZKDv25VhdZMtWs+GiRN7M+zwb8w=;
 b=VNX7h/l98FqrKdxxn7gcTmufi1rnQ6dBoRE6c7MzOr/ROJf2TbYJBsFswFLiK8P5uct2+9tw4wzxhlyIWE+NAh/I9+i0A7WbnItCkF4EHGnZMkWYJnjZMBegVbK4rO9GT0tjJELdW3ZGhSbsmqDOmPN0zLaCIHCMxRejo4SGtorBjivnAQuYx2/uVb9iYlvPbYauUAOOEqOslEfT0moPDYqC+JY+FM71l8znqeryAh4E7DLTdHDhM7AkVcSPs0xjaMro7fGTllig0a85i4gvidaCliL2B3mfEM6qGSAyzul/mul4tX0pmA7aGYXSLCnnqKOOvy2ufTrlNSe7cMrFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX+Ldn95Q/8+1w/SZKDv25VhdZMtWs+GiRN7M+zwb8w=;
 b=yFV4N6ZLPwJp37IqJXihqq1lp8Pm8+mO24cZuyZKxB88dRLWtJLxCfeL1MPx9zSyv4mQ5dGjqoKq4OgA6Fuf7lK6GjGL0fbQNoHhHrW2ZebEy+LtIJL8nHO7dnYcvPoSR8oV7Zo1F6107I/5XT1pikPkUbID9VfInUFk4+/URNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
Date: Fri, 6 Jun 2025 14:27:09 -0700
Message-ID: <20250606212712.1901838-3-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250606212712.1901838-2-victorm.lira@amd.com>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
 <20250606212712.1901838-2-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b8e0bc-bf8a-4939-20c1-08dda540ef7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2M2TTRNaStpYzdwRDFwc2tYczJGWWsvZE1pMElYS1NySk0waFZ2U1lmMkZ5?=
 =?utf-8?B?ck8rUkJWdVkyektSeDRUNG9Jc3ZCZ2JuV05PYWdsandScXAyeWxwYmFFeHU2?=
 =?utf-8?B?UEZUZTl3R21EQUMxU0ZvcHBRUHp5c1NWVHVFRWxvd0tPeFhvTC9FdUpVMUFj?=
 =?utf-8?B?V2lKUzJZS0V6QjdsOVNUazd5bUhnUmdwa2JmUWVUL3E5UnZkTUNDaFREd1o0?=
 =?utf-8?B?OVpoODBmSGhXYmRqSXlLTmxMeWxua09mN2Ivc1psUTFBY2xwYlpBcUEzcGRj?=
 =?utf-8?B?blp6dTdTVG5BUkg2eHluanUwMkhMSDhHMVhYdFNIb29KaWFFVndwNi9neTFx?=
 =?utf-8?B?UUxZT0hLZHZtdXdwelQ3Wm51YWhhMzhZYzFVU2Q1TlcxcEMzdGNlTFRBTmdk?=
 =?utf-8?B?cDJUQnVBa0ZXOWVpck9EcitBc1JHdWJiWnd4bldicVJtbXdnUzNQbHRGdzIw?=
 =?utf-8?B?OGd6MVQ4YTFNNmsxYUxQZEN1YlE0RVU0eEZzakhjOTZpVU8wamVpNEFGNlow?=
 =?utf-8?B?a2Z4ZmQ5WDk0djhzano4TitaQUpvdDZ3bWczVExSVFlKMHJWc3c2RTh0QUVv?=
 =?utf-8?B?NlQvcmVVTW9reHYwaG9mSit0cjgzUGhsSjk1Qjh1dkZzcTJDVkQvaE04U3RY?=
 =?utf-8?B?ZTEwbE8vY3FZdkFoU2NobCt4RWJVS2x3V1QwNjh6NUs0NzJVdnVVbXZ3Y0JW?=
 =?utf-8?B?QmtiVThoL0ZhZnBReUsxM1k0bjlmNHJuWXR0bE4vTTVMY3VLaHZ3WnZkdUdm?=
 =?utf-8?B?QjlLdkEzVTNyaHBueUhRU29sV3o4N00ySXR3Q0xWN1EzekE2N2FLNGhKa29Q?=
 =?utf-8?B?S0dpQkV0UWVDNDhsWTNwVkZzNnBaVlBFUHNJY2pJelp3MVNYam5NTmlGQWFv?=
 =?utf-8?B?ZUJkUmQ4dkhBSVllNVdoalVoRCs5TU96SjMrWTNNNnZrdS85bFI0ZVRXTlhZ?=
 =?utf-8?B?dUFvUUh0UWkwYUlEdk92KzlRS3lyVVViYlBFNkRHUDZjRVRlYWFnZjFZNTRu?=
 =?utf-8?B?KzAzYXNoMWdTMUlmNmFId2ZrRGlqbll0b040OGNXc0FWRW5lMnFNbVovMEtU?=
 =?utf-8?B?K3o2OEVHNlJIWmViaUp4dkNTbUYxUGd1NllZdDNDNVJObHRMWTNVUklWN2FJ?=
 =?utf-8?B?cHpVZEpsZmlVZm91ZVZCb2szV3BNcGVmT3RWU1JmUFJYVVFjYWgyWEpsKzFX?=
 =?utf-8?B?UlQrbktWd1JvUEIzTll4R3JFb0VwSjd6QXBWTnNYY0FvZUtGT0hFaFdwRytO?=
 =?utf-8?B?ZEw5a01KT0lwTjd4WjM5Nm5mVlhVcWlNaGIrbGJldUdxRUFLem1xMC9KMnlh?=
 =?utf-8?B?ZDZ6azl6OEhQTUZBTU9jS243Rm43RzRFeW1HaFdJK3hMN0VJMjdHZVQ0Mndm?=
 =?utf-8?B?dHdZTGIwZ3hVdEJrU0FvR0F1Q2YrTnp6ZHpHSy8yeGtOdmtrYS9YWUFEWHgy?=
 =?utf-8?B?YklVRVFkNjVaMHp2eWo5MnNQdFFmYkVHSFVkSUQvZFVLT2RzRFhwb2cwelZH?=
 =?utf-8?B?ZXZkN0FmU1NUcFVRYmpPQkEyb0YxUnNhNlliMlFvQjcyMVNwUytvTm8rOXFE?=
 =?utf-8?B?UllibStxWHdmK1FRRHk4RGVEaEJ4eEJzUGcwenBZZjRycnhsL2lnanozNm5p?=
 =?utf-8?B?MlIyOSt0MjhWL0pNYlY0MmJKY3h3bzdsaGdlRzNjM0NNSnYrMkttek9CYzFK?=
 =?utf-8?B?NkFsd0NYNU9NYXNaOUJZT1J0a2h6bFZsaWRJZG05TFduNUYyNm1EUmpvMmJF?=
 =?utf-8?B?T0J5R2JVeFp4WTJQUG9WWkVWVCtIVlgwbyt1V2lZTWVmczVGdE9xZ1N1UjRh?=
 =?utf-8?B?TFY3UGJ5cUlNN0xuZElsTkI3bjltbkdsMWJBZk9LaHd0SGZRVGNoMjVROUlo?=
 =?utf-8?B?bmtxQ0J6bXQ3Q1Uwa3FTbEh2bzNOYVRLWmVYOXlGNW90Nnlhbnd4Ny9JS1hj?=
 =?utf-8?B?Sy9Pdldyc1V1NG4wcm1BNEFzQzgyL3RnWWdFZ0JXL1ZhMkFGREJHR1F2UUNI?=
 =?utf-8?B?SVBVdUhrTWFzdVlwbWRtZTZ4NGxtUWFoMFVmTnhGc0h6K3NhSWxCejVOU1Fr?=
 =?utf-8?Q?UOyKhP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:27:27.0249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b8e0bc-bf8a-4939-20c1-08dda540ef7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The marked functions never return to their caller, but lack the
`noreturn' attribute.

Functions that never return should be declared with a `noreturn'
attribute.

The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
currently accepted in Xen), and also Rule 2.1: "A project shall not
contain unreachable code". Depending on the compiler used and the
compiler optimization used, the lack of `noreturn' might lead to the
presence of unreachable code.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes in v2:
- improved commit message
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 3 ++-
 xen/arch/x86/efi/efi-boot.h   | 2 +-
 xen/arch/x86/smp.c            | 2 +-
 xen/arch/x86/traps.c          | 2 +-
 xen/arch/x86/x86_64/traps.c   | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1c348e557d..79214ce56b 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -79,7 +79,8 @@ static int __init cf_check mce_set_verbosity(const char *str)
 custom_param("mce_verbosity", mce_set_verbosity);

 /* Handle unconfigured int18 (should never happen) */
-static void cf_check unexpected_machine_check(const struct cpu_user_regs *regs)
+static void noreturn cf_check
+unexpected_machine_check(const struct cpu_user_regs *regs)
 {
     console_force_unlock();
     printk("Unexpected Machine Check Exception\n");
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0ecf4ca53f..0194720003 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -769,7 +769,7 @@ static void __init efi_arch_blexit(void)
         efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
 }

-static void __init efi_arch_halt(void)
+static void noreturn __init efi_arch_halt(void)
 {
     local_irq_disable();
     for ( ; ; )
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 516dab5528..7936294f5f 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -343,7 +343,7 @@ void __stop_this_cpu(void)
     cpumask_clear_cpu(smp_processor_id(), &cpu_online_map);
 }

-static void cf_check stop_this_cpu(void *dummy)
+static void noreturn cf_check stop_this_cpu(void *dummy)
 {
     const bool *stop_aps = dummy;

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 092c7e4197..34dc077cad 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
           (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }

-void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
+void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs *regs)
 {
     fatal_trap(regs, false);
 }
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index c77f304bb0..8460a4a1ae 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -293,7 +293,7 @@ void show_page_walk(unsigned long addr)
            l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
 }

-void asmlinkage do_double_fault(struct cpu_user_regs *regs)
+void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
     struct extra_state state;
--
2.25.1

