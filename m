Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1128CB13B4
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 22:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182193.1505127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Yq-0003f0-Gk; Tue, 09 Dec 2025 21:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182193.1505127; Tue, 09 Dec 2025 21:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Yq-0003cA-BP; Tue, 09 Dec 2025 21:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1182193;
 Tue, 09 Dec 2025 21:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT5Yp-0003Zl-08
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 21:47:55 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c65195-d548-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 22:47:51 +0100 (CET)
Received: from DM5PR07CA0063.namprd07.prod.outlook.com (2603:10b6:4:ad::28) by
 CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Tue, 9 Dec 2025 21:47:41 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::d3) by DM5PR07CA0063.outlook.office365.com
 (2603:10b6:4:ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 21:47:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 21:47:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 15:47:39 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 13:47:37 -0800
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
X-Inumbo-ID: b5c65195-d548-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8mFrTPRNjWkgMR6O7Rt4gYkZsglYTxX2neOPODvZ3XCXgxB1MfotFs1TKFcMW/u7ze17EvBRm+4gDrv1DXu+RYjvB7Da1jc5RNYnf0TrwZczIAEMyk7uY0jqyZlcdjZcjsao71qgFivExObmClqDwGeJoPaDRZSxM2BoT5MnMQGnDlE7QHIRV05eAmJVLjdeM/re3vSi+EDFqcn+ouYjJCz3uk3A4t0VMVJzErbB7sIadfFHn8lmhwziSwGGzu58fVMGjmeojKmN+szY3gdXFF+8QbKA+KeDODmFAUROcKcpaOi+Mr/bkc+hnqDeJzCyXUmzXcDeYKjlZE9vf4LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+8Mr0VTHJBwg/M5BwrjFawejnL3nKjePtafSPwHS4I=;
 b=dnHqPjLYtom5n+KzuByoTZXCcqq7ptL5mxVI+qkq48vyF6yCkT0IjOrpYZSdiN+jr3YM6H15lcaWn8vbq8SLlVQts5yfvk48V2mxRPB2nJBBG/G3JHMgXtcBt8ZguSp6yLbIIqT3WwHR+R6UddsCNsc828aBBiVQ+TI8+gEFNl50iq1q3CGQQALAq+dxUU8ENiP8TJwtvPw1UacpaXR1MUdp53Tv3v5K+MGwHraqLLQ8TpTLUHGUhx6WhTFDJnl2fY7M1u2Jgi7o3mdeLJG8XkarqY7b2NnznhrsYc3Z4jjgC46OVGy6NuEKJjaJNXh8wDEfWKXY6Xoea8b7W0Qebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+8Mr0VTHJBwg/M5BwrjFawejnL3nKjePtafSPwHS4I=;
 b=x6BhoVYLCcjSZs7GWe2G8vcaU3MmEYa1Q0Ym6lpcPuE3ABTD55Y1OX3tR+w2WTDdZcRwgrgh+nroMbyEPYK7YaAtxahR01lfRl7dmPylMXnd7jVZ078dhaWJnpQtF62p4Bu6cWkV4dz0Tnuz9+TGZW6+tu+ZpSoG4KqFkF78veQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
Date: Tue, 9 Dec 2025 16:47:28 -0500
Message-ID: <20251209214728.278949-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209214728.278949-1-jason.andryuk@amd.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c915e0-222b-47ec-465d-08de376c9398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?22SStsWgIUzW/zsmB8Qt9wnXkn2cSQEPXJzSLO2R+N2ZkfI0NyauY+hc7Kmu?=
 =?us-ascii?Q?wR1KngKSA4k/zVhfE/5FdwBGxiX5fy9emV14u1aKLqDcZ/m+aFfDvCuEmGxi?=
 =?us-ascii?Q?n4xBboNi5oMfXw8GK6HjIBajSPujxBVAWXSIbq/4Snhmxs4ssnBNLVkpz3G1?=
 =?us-ascii?Q?3IPIvsHyBw5AdXdWHyniQes+oM5Efo6W8Y4grij1f34W2YXmByx/WTHgo1V0?=
 =?us-ascii?Q?PV00D668e2eDJvuek8S/Avgmddg7GOVYdWlM5RU5chq45lOaa91mi5261Bi1?=
 =?us-ascii?Q?+cgvz0O3oGX1WMEm4DdZQk4ZdNPnJZICwDo5alS9XO0gcyj16ZFcCEn8jwum?=
 =?us-ascii?Q?osQs3hDYTa2IPU0qi495Cv9/t1eOJJdCzmOpFT98Okv2KSTN9P5HCBmoKL8Y?=
 =?us-ascii?Q?i43GEL9RnWcYJCF0SrKfWV2Yq1s18RKVB100ofS3oyUeJuzeWnws1Rdgv3o4?=
 =?us-ascii?Q?RIwSakKyCfvNXNX/umdUnF1Oz9ckq65PphFikJQT6pHgNbMN5YdSza5TVFoI?=
 =?us-ascii?Q?rfMvsQTMcewgHqM6hnzaDG8Zv6adshkIzqbKTukh075jQSXhwsYhaohwJPcG?=
 =?us-ascii?Q?QYR+RltR08N0eRDW4Vx5hxbQGG0a8NgamGO/0Bs8op2rQTrYJoZ5P1jLtihY?=
 =?us-ascii?Q?qYT4E4olbV99uWEiBxoxIenyMy8X7wAfbsqkuAKCwPVoKScf3y21MN44LGpt?=
 =?us-ascii?Q?oYNDb0vqLs9LILLRwCu7TFNYPhJVpPL7TOLHgQg0C9HFbC6RSdbxYULHU1xE?=
 =?us-ascii?Q?Web2N7SlngGsixAZJimwJnxGftoSpzn3MZU43pfoIB/ML6+KKO8j79eDmePW?=
 =?us-ascii?Q?6SGY1sRV9JGrpWHiapXBvEvbtWfGnsbdtUYR6oFpKiJB6fMEhoX3/woSp+YU?=
 =?us-ascii?Q?tAX0+4eYFiyk9vFLzU3dDYlfAxQchc5MJD/rDnHL2RTXM54O6n+89m+TGw+4?=
 =?us-ascii?Q?j3jAi8Wgm2FM9M2S1nlAZklVlRwOQOVN7aqDrK8FfeRPnWshTOExIYSuJVM6?=
 =?us-ascii?Q?UCFaSt0V5LTHVhwUkf4gCElyvnpYBPYTYmlr9tvrTd2ypF/VTwe48HkD/s5J?=
 =?us-ascii?Q?Lq+kxoTj4fdl4dkiBvHyYaIhz44oaIcH+kGpT3rrLBRMROGISQfm4b3nOoqs?=
 =?us-ascii?Q?0lkziqfk+hWDpBnDzomLr3oZ8+MmP0F8aGf2FU5gMBpB7VEpoHARuv5CG4eu?=
 =?us-ascii?Q?wrYp1QfMiwlH5p0GWdXD0lGjcDrIe2GgnR2TexIFsoLrIAGeWP8Y1cudqc/6?=
 =?us-ascii?Q?Av9cD9uudQUBjXbGyxcz1xNBoKz68l7WQBX7It/H+3gq/fsDOikxcKwBjKrU?=
 =?us-ascii?Q?SV9RHOQ425h0ntgA27HRuc1oDSaQIazmZZxjUJe7/B8lm3ANAseAQ0rQfTLW?=
 =?us-ascii?Q?Kc0NzhgvRnwi4IOlecBvZZkcr5psvbVYoXeAic6BFaxGvuv25DxhVYAnQMHh?=
 =?us-ascii?Q?kGqej4h3l2hBp/T0Dim6uSUljFPkt7iHIZs8k20xKNb8Mw+Evnsa7U59GWsc?=
 =?us-ascii?Q?ZL0i/2EpCH7dkJxLHOqyWacE3Yozng2SKfN2GInnzm3EIaJKEEOMGGjPTe1n?=
 =?us-ascii?Q?l1OiqPCMgK7kxfWxOCqdN3IO2u0YEV2mwKnrg+wX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:47:40.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c915e0-222b-47ec-465d-08de376c9398
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345

Add a new Kconfig CONFIG_GC_SECTIONS to control linking with
--gc-sections.  --gc-sections witll garbage collect unused sections.
Combined with CONFIG_CC_SPLIT_SECTIONS, this will remove unreachable
code and data.

Linker scripts need to add KEEP() assorted places to retain
appropriate data - especially the arrays created by the linker script.

This has some affect, but it is inomplete.  In a test where memory_add()
is unreachable, it is still included.  I'm not sure, but it seems that
alternatives keep a relocation reference to it.

Only ELF xen is supported.  xen.efi fails to link with many undefined
references when using --gc-sections.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v1:
Add Kconfig
select CC_SPLIT_SECTIONS
remove KEEP from .fixup
Add KEEP to .text.entry.* (Only needed with Jan's "common: honor
CONFIG_CC_SPLIT_SECTIONS also for assembly functions" ?)
Add ARM, RISC-V and PPC

Pipeline passes:
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/pipelines/2205223331

It defaults CONFIG_GC_SECTIONS=y and adds --print-gc-sections

With --print-gc-sections on x86 defconfig + GC_SECTIONS=y debug=y:
ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
ld: removing unused section '.text.bitmap_find_free_region' in file 'prelink.o'
ld: removing unused section '.text.bitmap_release_region' in file 'prelink.o'
ld: removing unused section '.text.domain_has_ioreq_server' in file 'prelink.o'
ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
ld: removing unused section '.text.in_atomic' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_next_hole' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_prev_hole' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_gang_lookup_slot' in file 'prelink.o'
ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
ld: removing unused section '.text.xmem_pool_get_used_size' in file 'prelink.o'
ld: removing unused section '.text.xmem_pool_get_total_size' in file 'prelink.o'
ld: removing unused section '.text.xmem_pool_maxalloc' in file 'prelink.o'
ld: removing unused section '.text.xlat_start_info' in file 'prelink.o'
ld: removing unused section '.text.elf_sym_by_name' in file 'prelink.o'
ld: removing unused section '.text.elf_sym_by_index' in file 'prelink.o'
ld: removing unused section '.text.elf_get_ptr' in file 'prelink.o'
ld: removing unused section '.text.elf_lookup_addr' in file 'prelink.o'
ld: removing unused section '.text.serial_vuart_info' in file 'prelink.o'
ld: removing unused section '.text.pci_find_next_cap' in file 'prelink.o'
ld: removing unused section '.text.free_hvm_irq_dpci' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier_init' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier_dec' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier' in file 'prelink.o'
ld: removing unused section '.text.apei_read_mce' in file 'prelink.o'
ld: removing unused section '.text.apei_check_mce' in file 'prelink.o'
ld: removing unused section '.text.apei_clear_mce' in file 'prelink.o'
ld: removing unused section '.text.efi_halt_system' in file 'prelink.o'
ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 'prelink.o'
ld: removing unused section '.text.get_vvmcs_real_safe' in file 'prelink.o'
ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 'prelink.o'
ld: removing unused section '.text.set_vvmcs_real_safe' in file 'prelink.o'
ld: removing unused section '.text.domain_set_alloc_bitsize' in file 'prelink.o'
ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
ld: removing unused section '.text.unset_nmi_callback' in file 'prelink.o'
ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
ld: removing unused section '.text.xxh64' in file 'prelink.o'
ld: removing unused section '.discard' in file 'prelink.o'
ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 'prelink.o'
ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 'prelink.o'
ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 'prelink.o'
ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 'prelink.o'
ld: removing unused section '.rodata.play_dead.str1.1' in file 'prelink.o'
ld: removing unused section '.data.rel.ro.local.fetch_type_names' in file 'prelink.o'
---
 xen/Makefile              |  3 +++
 xen/arch/arm/Makefile     |  6 +++---
 xen/arch/arm/xen.lds.S    | 22 +++++++++++-----------
 xen/arch/ppc/Makefile     |  6 +++---
 xen/arch/ppc/xen.lds.S    | 14 +++++++-------
 xen/arch/riscv/Makefile   |  6 +++---
 xen/arch/riscv/xen.lds.S  | 14 +++++++-------
 xen/arch/x86/Makefile     |  6 +++---
 xen/arch/x86/xen.lds.S    | 34 +++++++++++++++++-----------------
 xen/common/Kconfig        |  9 +++++++++
 xen/include/xen/xen.lds.h | 20 ++++++++++----------
 11 files changed, 76 insertions(+), 64 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e6cf287425..aeb5dcf2ee 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
 
 include $(srctree)/arch/$(SRCARCH)/arch.mk
 
+XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
+
 # define new variables to avoid the ones defined in Config.mk
 export XEN_CFLAGS := $(CFLAGS)
 export XEN_AFLAGS := $(AFLAGS)
 export XEN_LDFLAGS := $(LDFLAGS)
+export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
 export CFLAGS_UBSAN
 
 endif # need-config
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7494a0f926..3ac5ff88cc 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -87,19 +87,19 @@ endif
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..178af612a2 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -63,7 +63,7 @@ SECTIONS
 
        . = ALIGN(4);
        __proc_info_start = .;
-       *(.proc.info)
+       KEEP(*(.proc.info))
        __proc_info_end = .;
   } :text
 
@@ -103,7 +103,7 @@ SECTIONS
   . = ALIGN(8);
   .arch.info : {
       _splatform = .;
-      *(.arch.info)
+      KEEP(*(.arch.info))
       _eplatform = .;
   } :text
 
@@ -116,7 +116,7 @@ SECTIONS
   . = ALIGN(8);
   .teemediator.info : {
       _steemediator = .;
-      *(.teemediator.info)
+      KEEP(*(.teemediator.info))
       _eteemediator = .;
   } :text
 
@@ -127,7 +127,7 @@ SECTIONS
        *(.init.text)
        _einittext = .;
        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
-       *(.altinstr_replacement)
+       KEEP(*(.altinstr_replacement))
   } :text
   . = ALIGN(PAGE_SIZE);
   __init_data_begin = .;
@@ -137,18 +137,18 @@ SECTIONS
 
        . = ALIGN(POINTER_ALIGN);
        __setup_start = .;
-       *(.init.setup)
+       KEEP(*(.init.setup))
        __setup_end = .;
 
        __initcall_start = .;
-       *(.initcallpresmp.init)
+       KEEP(*(.initcallpresmp.init))
        __presmp_initcall_end = .;
-       *(.initcall1.init)
+       KEEP(*(.initcall1.init))
        __initcall_end = .;
 
        . = ALIGN(4);
        __alt_instructions = .;
-       *(.altinstructions)
+       KEEP(*(.altinstructions))
        __alt_instructions_end = .;
 
        LOCK_PROFILE_DATA
@@ -159,9 +159,9 @@ SECTIONS
 
        . = ALIGN(8);
        __ctors_start = .;
-       *(.ctors)
-       *(.init_array)
-       *(SORT(.init_array.*))
+       KEEP(*(.ctors))
+       KEEP(*(.init_array))
+       KEEP(*(SORT(.init_array.*)))
        __ctors_end = .;
   } :text
   __init_end_efi = .;
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index e80690d3b8..42db3d6f2c 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -14,19 +14,19 @@ $(TARGET): $(TARGET)-syms
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..c91df79468 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -24,7 +24,7 @@ SECTIONS
 
     DECL_SECTION(.text) {
         _stext = .;            /* Text section */
-        *(.text.header)
+        KEEP(*(.text.header))
 
         . = ALIGN(256);
         HIDDEN(_stext_exceptions = .);
@@ -109,13 +109,13 @@ SECTIONS
 
         . = ALIGN(POINTER_ALIGN);
         __setup_start = .;
-        *(.init.setup)
+        KEEP(*(.init.setup))
         __setup_end = .;
 
         __initcall_start = .;
-        *(.initcallpresmp.init)
+        KEEP(*(.initcallpresmp.init))
         __presmp_initcall_end = .;
-        *(.initcall1.init)
+        KEEP(*(.initcall1.init))
         __initcall_end = .;
 
         LOCK_PROFILE_DATA
@@ -126,9 +126,9 @@ SECTIONS
 
         . = ALIGN(8);
         __ctors_start = .;
-        *(.ctors)
-        *(.init_array)
-        *(SORT(.init_array.*))
+        KEEP(*(.ctors))
+        KEEP(*(.init_array))
+        KEEP(*(SORT(.init_array.*)))
         __ctors_end = .;
     } :text
 
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d667234949..0cb0e88a72 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -24,19 +24,19 @@ $(TARGET): $(TARGET)-syms
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 45d2e053d0..e57db6b914 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -18,7 +18,7 @@ SECTIONS
     _start = .;
     .text : {
         _stext = .;            /* Text section */
-        *(.text.header)
+        KEEP(*(.text.header))
 
         *(.text.cold)
         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
@@ -103,13 +103,13 @@ SECTIONS
 
         . = ALIGN(POINTER_ALIGN);
         __setup_start = .;
-        *(.init.setup)
+        KEEP(*(.init.setup))
         __setup_end = .;
 
         __initcall_start = .;
-        *(.initcallpresmp.init)
+        KEEP(*(.initcallpresmp.init))
         __presmp_initcall_end = .;
-        *(.initcall1.init)
+        KEEP(*(.initcall1.init))
         __initcall_end = .;
 
         LOCK_PROFILE_DATA
@@ -120,9 +120,9 @@ SECTIONS
 
         . = ALIGN(8);
         __ctors_start = .;
-        *(.ctors)
-        *(.init_array)
-        *(SORT(.init_array.*))
+        KEEP(*(.ctors))
+        KEEP(*(.init_array))
+        KEEP(*(SORT(.init_array.*)))
         __ctors_end = .;
     } :text
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 300cc67407..3fd4cf44ab 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -136,19 +136,19 @@ CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_FINAL_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(orphan-handling-y) $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 2aa41306ca..e4135edd28 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -76,12 +76,12 @@ SECTIONS
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
-       *(.text.header)
+       KEEP(*(.text.header))
 
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
        *(.text.entry)
-       *(.text.entry.*)
+       KEEP(*(.text.entry.*))
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
@@ -116,7 +116,7 @@ SECTIONS
        . = ALIGN(8);
        /* Exception table */
        __start___ex_table = .;
-       *(.ex_table)
+       KEEP(*(.ex_table))
        __stop___ex_table = .;
 
        . = ALIGN(PAGE_SIZE);
@@ -207,7 +207,7 @@ SECTIONS
         * as binary blobs. The .altinstructions has enough data to get
         * the address and the length of them to patch the kernel safely.
         */
-       *(.altinstr_replacement)
+       KEEP(*(.altinstr_replacement))
 
 #ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
        . = ALIGN(SMP_CACHE_BYTES);
@@ -220,8 +220,8 @@ SECTIONS
 
        . = ALIGN(POINTER_ALIGN);
        __initdata_cf_clobber_start = .;
-       *(.init.data.cf_clobber)
-       *(.init.rodata.cf_clobber)
+       KEEP(*(.init.data.cf_clobber))
+       KEEP(*(.init.rodata.cf_clobber))
        __initdata_cf_clobber_end = .;
 
        *(.init.rodata)
@@ -229,13 +229,13 @@ SECTIONS
 
        . = ALIGN(POINTER_ALIGN);
        __setup_start = .;
-       *(.init.setup)
+       KEEP(*(.init.setup))
        __setup_end = .;
 
        __initcall_start = .;
-       *(.initcallpresmp.init)
+       KEEP(*(.initcallpresmp.init))
        __presmp_initcall_end = .;
-       *(.initcall1.init)
+       KEEP(*(.initcall1.init))
        __initcall_end = .;
 
        *(.init.data)
@@ -243,10 +243,10 @@ SECTIONS
        *(.init.data.rel.*)
        . = ALIGN(4);
        __trampoline_rel_start = .;
-       *(.trampoline_rel)
+       KEEP(*(.trampoline_rel))
        __trampoline_rel_stop = .;
        __trampoline_seg_start = .;
-       *(.trampoline_seg)
+       KEEP(*(.trampoline_seg))
        __trampoline_seg_stop = .;
        /*
         * struct alt_inst entries. From the header (alternative.h):
@@ -255,21 +255,21 @@ SECTIONS
         */
        . = ALIGN(8);
         __alt_instructions = .;
-        *(.altinstructions)
+        KEEP(*(.altinstructions))
         __alt_instructions_end = .;
         . = ALIGN(4);
         __alt_call_sites_start = .;
-        *(.alt_call_sites)
+        KEEP(*(.alt_call_sites))
         __alt_call_sites_end = .;
 
        LOCK_PROFILE_DATA
 
        . = ALIGN(8);
        __ctors_start = .;
-       *(SORT_BY_INIT_PRIORITY(.init_array.*))
-       *(SORT_BY_INIT_PRIORITY(.ctors.*))
-       *(.init_array)
-       *(.ctors)
+       KEEP(*(SORT_BY_INIT_PRIORITY(.init_array.*)))
+       KEEP(*(SORT_BY_INIT_PRIORITY(.ctors.*)))
+       KEEP(*(.init_array))
+       KEEP(*(.ctors))
        __ctors_end = .;
   } PHDR(text)
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 401d5046f6..7e40a921a7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -680,4 +680,13 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+config GC_SECTIONS
+	bool "Garbage Collect Sections"
+	select CC_SPLIT_SECTIONS
+	help
+	  During final linking, garbage collect unused sections.  This will
+	  reduce the size of the final Xen binary
+
+	  Only supported for ELF/Multiboot xen/xen.gz, not EFI xen.efi.
+
 endmenu
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 2d66d618b3..4703523cb2 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -144,46 +144,46 @@
   . = ALIGN(POINTER_ALIGN);  \
   DECL_SECTION(.adev.info) { \
       _asdevice = .;         \
-      *(.adev.info)          \
+      KEEP(*(.adev.info))    \
       _aedevice = .;         \
   } :text
 
 #define BUGFRAMES                               \
     __start_bug_frames_0 = .;                   \
-    *(.bug_frames.0)                            \
+    KEEP(*(.bug_frames.0))                      \
     __stop_bug_frames_0 = .;                    \
                                                 \
     __start_bug_frames_1 = .;                   \
-    *(.bug_frames.1)                            \
+    KEEP(*(.bug_frames.1))                      \
     __stop_bug_frames_1 = .;                    \
                                                 \
     __start_bug_frames_2 = .;                   \
-    *(.bug_frames.2)                            \
+    KEEP(*(.bug_frames.2))                      \
     __stop_bug_frames_2 = .;                    \
                                                 \
     __start_bug_frames_3 = .;                   \
-    *(.bug_frames.3)                            \
+    KEEP(*(.bug_frames.3))                      \
     __stop_bug_frames_3 = .;
 
 #define DT_DEV_INFO         \
   . = ALIGN(POINTER_ALIGN); \
   DECL_SECTION(.dev.info) { \
        _sdevice = .;        \
-       *(.dev.info)         \
+       KEEP(*(.dev.info))   \
        _edevice = .;        \
   } :text
 
 #define SCHEDULER_ARRAY              \
        . = ALIGN(8);                 \
        __start_schedulers_array = .; \
-       *(.data.schedulers)           \
+       KEEP(*(.data.schedulers))     \
        __end_schedulers_array = .;
 
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
        __paramhypfs_start = .;   \
-       *(.data.paramhypfs)       \
+       KEEP(*(.data.paramhypfs)) \
        __paramhypfs_end = .;
 #else
 #define HYPFS_PARAM
@@ -193,7 +193,7 @@
 #define LOCK_PROFILE_DATA        \
        . = ALIGN(POINTER_ALIGN); \
        __lock_profile_start = .; \
-       *(.lockprofile.data)      \
+       KEEP(*(.lockprofile.data))\
        __lock_profile_end = .;
 #else
 #define LOCK_PROFILE_DATA
@@ -213,7 +213,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(.data.rel.ro.vpci)      \
+       KEEP(*(.data.rel.ro.vpci))\
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.52.0


