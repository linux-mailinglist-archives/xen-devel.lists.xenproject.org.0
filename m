Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569EACE74D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 01:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006051.1385331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsr-0004O9-St; Wed, 04 Jun 2025 23:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006051.1385331; Wed, 04 Jun 2025 23:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsr-0004KT-PI; Wed, 04 Jun 2025 23:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1006051;
 Wed, 04 Jun 2025 23:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhEg=YT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uMxsq-0003tB-Gi
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 23:51:00 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2009::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c17ac33b-419e-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 01:50:55 +0200 (CEST)
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 23:50:50 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::98) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 4 Jun 2025 23:50:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 23:50:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:50:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:50:49 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 18:50:48 -0500
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
X-Inumbo-ID: c17ac33b-419e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9cS8h8KjuGtpmkFqoLkJUTCZR6LKXO8MASbiiXVvPZfzlEnn1zEYjXOQoJsVegDj8kZbmL7/RsmM88nt/7LiPfTnCx++sjGH8mn3WWPCFqpEmIvt/AHszGPSOR/DFoC1+ihLPcVeTcFSXa6Vz3uojuoGl4SXnSnWl83OCrqUDaKPyOQSpjFku1KKEo5rVU6mfkYLKQc8f8icYfOcsvOEXwy+PPfijXNr7SZSiCHR47Zf3Ah8uf0bezfDaAYd5TNaXpxw1fzDVQjjl+TnLYJRA+GJR+glH0coFWpBA6Fyeu7hlk/9VtNBvIl9tItd9ytH/NVsgZy3S6txWb/SVMqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsU8ZFwE0tMqVtPeYMWkPu3IcPpAH6M2QRMph/pkbco=;
 b=yA+W5N0qEi3HBq0LBcZVh3iz7ITdKuqwx1bHKgHyDgsLEtAvF+k3NHz93leSBKQU/DcGK76aG9LDWsquRs5AW5j8egvKprlwJqgS89Wma52XkXkaBke5QK5P50mhh8XPKZwqamGutx3m6X1p29enLxJQYbxS66lu9PDLpE9Tar2ZUP7t/apzwRXj7vvC1l74bbCOeWXt5coMO6A7n0RNxgBO01qfG9l3aHOnJNAytKF043l0zwv2NtINrCtWscjhN/fv6kPAN44gmP1SYZQ1hDFHMQxEg1dh7lLlv3HXQUF8ph52ZWlosd6J/kOg0RvC16T+U1T2NNKzAe4nMOkTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsU8ZFwE0tMqVtPeYMWkPu3IcPpAH6M2QRMph/pkbco=;
 b=Rolboj8QEeqrHR2qsJlX/PHPtBzNP/X+i+Q9jXNACAGetOdG8xhyKGlo4zyNFnQ+jK3q4mXhQkImduDZn30ZCLUXe3xe1/8b76j/daBWhmlZDJvKg2WmsJ+p5konOyWX4XBojIXisaSRx4ix0mG3cJK8BZz8zKn1/Syo+P1xJzw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 3/3] xen/x86: add missing noreturn attributes
Date: Wed, 4 Jun 2025 16:49:57 -0700
Message-ID: <20250604235034.1595881-3-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250604235034.1595881-2-victorm.lira@amd.com>
References: <20250604235034.1595881-1-victorm.lira@amd.com>
 <20250604235034.1595881-2-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: dcca156b-42a0-4a37-e362-08dda3c2a252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2piM2VpaHpTZG11d3M0MmJka3lqbmdVOWllZkd0T1oremJaaEo3YmErN3RN?=
 =?utf-8?B?dEFIWXhDZjJnQjA0cENKd3hYWXFFNHYzdzFnYnZGTlZzRzk4dHlzNGdGMzdC?=
 =?utf-8?B?RDROMk4rZFFnODFzaThERWkrdHRpZ2I1NmVjRnhJRnZjTU9wUGp3aDNLODlq?=
 =?utf-8?B?cEo5UVdzbnJHVFd3SllDQUlyQkZRYXJ5NlUyK21HYS8rTHhDeTFHdEViSm5E?=
 =?utf-8?B?aXZJbmk5cEh0cno5ZzdQeFgvenVyN0ZOZW55eUt2bDZVTnVUdldhWXFMdTRt?=
 =?utf-8?B?am9tSVdHeEFrNWNrbmpZQzdpakFOVTFkTmEwZ0pEcWsvcitOOFE2cC82MnZR?=
 =?utf-8?B?T29kcm5Vci9xalhjVlhMVTdCZnpVZDY1cFhQTTRSNjVnTGFlS3NRQzEyQmEz?=
 =?utf-8?B?ajlQOXhobGllNEI2ZzVLZ3FPTDR2bG9lWGROamRLWldweUg2VmRyMzMyMlow?=
 =?utf-8?B?bzg5SFFDS2lhcGdHNWhpL1M2ZVZJb0xJZVhnUlNLZTc2dGdyQ0w1V29iTWU2?=
 =?utf-8?B?UHlTQm50ZkRRV05rV2Z3a0JDK1RTdlgydWt3UlhQTExyZmRIMnhUZGRrdk1l?=
 =?utf-8?B?NUNMVENLSzcrclpIV2NIK2wrVzVWRExRM2t3QjBUTzRJa0VIYUNESW1xTjF1?=
 =?utf-8?B?Q2ZKelJ6UnFaOFRIYk5QU0Q1RFZqR2p1QlRLTVVPdXhMclpGNlk1MUQ4NXd4?=
 =?utf-8?B?QWtzYlpxZDVmUWNOQmpsOGFpOSsrV0ZjYWZVb2Q3SjJPdzJYOWloc3VKN25z?=
 =?utf-8?B?L3k2NGYvcFU3TkhWSTlheDMvMkN0MDVCNi9VT2tGaHFOYXRUcU0wL0p6S1JX?=
 =?utf-8?B?d3ppdVpQV2MyakdmaVJQdEExVjFPOXMyRGV2Q1BkTDhEeVBObjljN0hleDYz?=
 =?utf-8?B?YkFjWlBsdUZkTTR3T1Q4bHR0UjJRWlRYL09WTlBQcDljWFRWdXowbkZ4YzlO?=
 =?utf-8?B?RDFFbGlQMHZmRmpxcW1DdGNka292c0o0S2pqVEUybU5pUGZabjNiZmN4YnRo?=
 =?utf-8?B?TDdsWnBKN1dlY2llMFpiRG96YVl6Zk5mRXlKN2tGK0pWbDQ4ajI0THpYZVBh?=
 =?utf-8?B?VlR5bHhxVEtKSWZleEF6ZEFkak9INUZsNXdndCsyY1hCemZoemVOK1NJYlRJ?=
 =?utf-8?B?djJMOUE0SGdGaTNGVW95TThYU0FoQmNsMFFpcHNSTkEzcGg0QUNLVU4yN21u?=
 =?utf-8?B?NXlRSFpXTXFRTFFKdjVJc2M1Wmk4Uzh4QmZrUkF5bXgzbHBaVTc1NUVIMExO?=
 =?utf-8?B?QjZHTzl6bTFWeHc0KzNzT3lVbVRPWVZFYjRUMGZqVjU0a3dmaXJ2dGIzaFhE?=
 =?utf-8?B?NzVxdWpLZ1VYZ3loajNwRGUxNWZjdk5QZUd0MStDVEJTSWpRamduWnNmNzIz?=
 =?utf-8?B?MW9ZZ3czajMyM3gyS01Td2w2a1FMVjkyaXpNQTRkTmFHN1FCelppVjdOY28x?=
 =?utf-8?B?Y0grSGY2UTRVY3BEY2JBM1BwQndOR1RXVXdKaEErd1huUi9KVkpEOUxMMExH?=
 =?utf-8?B?eWNXdzJPaklRSFFjdEl6MDl4cXVpb3laVENvYTJHMkF2bHJIY1VBQ2trSWNH?=
 =?utf-8?B?cURTVklxcWpiT0YvaWh0M2k5dFJ3YXBWR3VRUlJ5QTVuN3MzdTA5TklpekdZ?=
 =?utf-8?B?c21hSEZ6QjgyWDBGMkdDOXRLeTJtQXBiSG4zVWxLK1hyVjAvcmgzdDNlMm41?=
 =?utf-8?B?L0pBVlBicjR0VTJ0aW9GWDIyNXhzRnhsZ2xaSjl6bWNnUDc0ZzdwR0pINTlY?=
 =?utf-8?B?eXpaU2Q1NnBBZ1IreGlsMVRySzgvcGVPOGhacUtZWFV0T1Yrd0hpNjBud0Vl?=
 =?utf-8?B?aFNvR3RQeXZmc3crR0tQdUhwYTdnUU9PdmozUkhVSGxBelhtdUxZb2lhMzVw?=
 =?utf-8?B?Mmpoeldsb093a3FDU3JPNkxlZUxnSlFJQURaNVJiWHVhOXVaT0RvYndzbEcr?=
 =?utf-8?B?YWdSb2F1YjRyVDY4K0lKQm5LZElycHplZmFIZFNtVUNCS1BQd1k5M3RUVXpU?=
 =?utf-8?B?ZUlFWEJZWmZNY1BSbVM3b1Y3MVUrTUhTaE9CVWIvTS8rMmd6RnExN2lXSmhU?=
 =?utf-8?Q?FbqREU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:50:49.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcca156b-42a0-4a37-e362-08dda3c2a252
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The marked functions never return to their caller, but
lack the `noreturn' attribute, therefore causing a violation
of MISRA C Rule 2.1: "A project shall not contain unreachable code".

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
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

