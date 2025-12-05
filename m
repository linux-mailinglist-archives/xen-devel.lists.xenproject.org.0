Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93ABCA97DB
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 23:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179537.1503011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vReHr-0006dR-2r; Fri, 05 Dec 2025 22:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179537.1503011; Fri, 05 Dec 2025 22:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vReHq-0006c0-W5; Fri, 05 Dec 2025 22:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1179537;
 Fri, 05 Dec 2025 22:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOju=6L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vReHp-0006bu-Hw
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 22:28:25 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b47817b7-d229-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 23:28:22 +0100 (CET)
Received: from SN7PR04CA0117.namprd04.prod.outlook.com (2603:10b6:806:122::32)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 22:28:16 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::6d) by SN7PR04CA0117.outlook.office365.com
 (2603:10b6:806:122::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 22:28:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 22:28:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 16:28:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 14:28:15 -0800
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 5 Dec 2025 14:28:14 -0800
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
X-Inumbo-ID: b47817b7-d229-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo4YN5QgygiDIYhrWCgJ5NtHrhZjvJB2yV2ErkPCTmZKxxdzgx0TKAAGifDo2eH/kmZTCmtii/mz5+vhPK+hSqnWoyuRSdyHgZhUDmuvFI2B2nt2aZTiVpK+waJD9lk17/E1HDX5fGF6j0arVmpZSmdGCKIg+6/deN0QlPWiR02Yo/FXqiiCrg/6MlpXQHDBNEl8b7orbVzb32epw3KeFSWTuTidcV/3wJd4yDgeGQIlmeZkhHeDH+nZn6IhbAQwylgusjxZbDuDZ/sKwV2lwDnLpLOpcsnElQX+JeabTTGjrad7zHvFQoV69jQqwR2q1nBynj8phBc4N8x2sWm9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CniC5TJ4opgtxBQMODUCLUTmWodkiItGI6vS5QnA70g=;
 b=hkv5p/SVX4w7J+PZpIyfi+O4j19flkddcjxpK4KgwMnvTYH4yI+2ySvsRansR1p/ha0chWgTCgh8Xks6OfaqYLhL2MHsZCQ9lsVyuyXxxj3TzJA6UJDgJXth8QXFsavpC/PVftogRoDcLL+BZyVh/GdSq3WeS0vtIYoi2Y8NMWhRtFyRdTRfjsHeKE49UatIQsKvTpDn2YdPtUhQqYha4tWIeqSUaW9eIzKYCXeyOGfKpx6q6MBi18KhvMtksetFvTv94AWDQFEN2FMvDZiOyldN9jj02nm2LU2fK/86BuvYbVdwP+5Fira0VzBzOCRkqlw6rwbbsazKGauWO8wOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CniC5TJ4opgtxBQMODUCLUTmWodkiItGI6vS5QnA70g=;
 b=FXmkLO5gk1gyorBfRvxb0TIjFLB2GM2TKMmjOEcZSUtyhjjMZBJcy9f24/mmMkYFzcIW3H/9GxhGmVO1Fn+lDFSHbbZxBubJAAEk9MQCBYO16nCK3O+fzHVIf7tE8EzRwZYnrFvATUzrNM55JZmnLxUkJ4qqIREhaztQch+t/w0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] RFC: xen/x86: Enable --gc-sections
Date: Fri, 5 Dec 2025 17:28:12 -0500
Message-ID: <20251205222813.277164-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0ba73b-4351-428d-dd48-08de344d959b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oXNql7SkiFqYeLO9th62qQ6Z/XMaqGcRCqH5PxNCA+YoIuz43cn7LzQA3qpN?=
 =?us-ascii?Q?hCajnHct27Ju8901RiekPVPEnjC/rMaBMgkm10tsLnKyUJ9Bu5/DqVhZw0Qu?=
 =?us-ascii?Q?D02i6cOqEBRinkf9lUj3HIyHL+3izMqUBAokeVxr4FL2U+t9HYmG9RT7ZcFF?=
 =?us-ascii?Q?lmBiAw4EK+0+u9TcAHNISN3DCZzeSlY/vFgx+G9sozACV0/gR8YM99SSmjB2?=
 =?us-ascii?Q?oe93RAV6yNwbSKEmULlLnrKxiXuZFAQxLBZwWd/ECwwoi+lhXp9aG/72s+W0?=
 =?us-ascii?Q?Iv+penmoAF691BG3HMhCHLFQQ+g5EC2zw0EAohDAnDCx5Wf4jW6PYr4D6OAL?=
 =?us-ascii?Q?RIFSLS58hnNwn/w4xgMWwAEcuEHF7q3xClyCZPWN3IGKc01+y43bTb5UDoky?=
 =?us-ascii?Q?c01qzzcHWOfmRV0HCDIkTSBn6anLjDFWZ32SOZfNoQqxw7cjGvhDs/RzYUR0?=
 =?us-ascii?Q?foPpE2W7pxlEWHhz/ZlSfgbYQ+ohxEja9LJRE63IRyLUBepNZ5PQ8LRrSkuk?=
 =?us-ascii?Q?QrbKFzoiBSUd6EqgO/WXbSJVVIkaKPyiHG1asFjTFiIZsEusc6XhUuO50gya?=
 =?us-ascii?Q?bZfjW1u6IWM2IsjiP+aJqkrPiD+7DwoFyDzpq4vXZ5cqwFXZ7VVnoQTQ6Myb?=
 =?us-ascii?Q?xHugOyUWD2pJYFsemiBjJdunBN7Ah+5+/KEWFFW0l0MaQAYkCGPpt/4dMWYF?=
 =?us-ascii?Q?jnDKAWvP1LQt8ivWZmAwBozeGNV/D7jyAo/dsOZ6csxOSdPuyKPvK1eLYuVq?=
 =?us-ascii?Q?+oepzvE4mQF4uTRXZURbRtv+553dMBGd3y5O+6BKNB1K+x+gCiiW9kmiRLcd?=
 =?us-ascii?Q?/QbBTKW94vgsimyV9tm/eP6RvbUIt2l1lGXuS2phJbaXWfQzdS7vBmI4kQNZ?=
 =?us-ascii?Q?kGIKPbGAgB0DwAa7rRRUDV3c3NwH7nBhROQmaUCH42VrbmYKUpGUebMSOf3N?=
 =?us-ascii?Q?glMNgXXjfGYv7rzxy9Y9Z/faNik01RUvZNQHj6XAfNKIZo044VOrNoP94TLs?=
 =?us-ascii?Q?BaXuI/+zZCRSRHKWWBs9yX64NK+f51XhqbPUbqUyPfyuEWfLzYyZg07nZnVs?=
 =?us-ascii?Q?EXiuhwRzkJZlxx9m92Wov4Kvf4gUFLcu+JXOio7iYGPgqStgpFKIyC3BggVJ?=
 =?us-ascii?Q?2ILPrhXl+WB05be4L7Adx4EQdWrBcKe5JJm+MiyBL9fFJ2e898fR2nvro6Fk?=
 =?us-ascii?Q?m4N/txKAsPDTz2xAFzmKjh5Q0L3ohduAcfS9hMeaZ00AWOJk3sf4lWGr5Xmb?=
 =?us-ascii?Q?0qCflIa7VUoIkGTvuaowp0uT/AFT9NKFEG2XVsb1SWXZ2uMxx5f2i5w8t7Ni?=
 =?us-ascii?Q?p8cQrqQSf+/3Nc9yAQFDIM4BFJSJdhP7EaNKHOAtuU4FTHR9Hd1y6+HIqvFM?=
 =?us-ascii?Q?tTS4cqDgPP4AfJeQZqmfRp3975NpgzQbfMaLcPY8FVsE/GEbwa5OCya84IDy?=
 =?us-ascii?Q?rMoJuU8DUCZV4WrsIyxWFHXf02M7EI2b6/4GrtHefK8P5HdnD4bITapeRe8z?=
 =?us-ascii?Q?jiSqygrehZvNJKRGGDvNgrTwpQ3bfJjXqokbXJI4V7qdxfPFOPEzYGwuhuf6?=
 =?us-ascii?Q?dat/CtdFdOYrf4xkFds=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 22:28:15.9608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0ba73b-4351-428d-dd48-08de344d959b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485

When linking to create xen-syms, add --gc-sections to garbage collect
unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS

We need to add KEEP() to the linker script in assorted places to retain
appropriate data - especially the arrays created therein.

Something is off though.  In a test where memory_add() is unreachable,
it is still included.  I'm not sure, but I am wondering if it's the
alternatives somehow keeping a reference to it.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
With --print-gc-sections on defconfig:
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
 xen/arch/x86/Makefile     |  3 +++
 xen/arch/x86/xen.lds.S    | 38 +++++++++++++++++++-------------------
 xen/include/xen/xen.lds.h | 18 +++++++++---------
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 300cc67407..934c79411a 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -137,18 +137,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	      --gc-sections \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	      --gc-sections \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	      --gc-sections \
 	    $(orphan-handling-y) $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 527872a6db..e3ad58f688 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -76,7 +76,7 @@ SECTIONS
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
-       *(.text.header)
+       KEEP(*(.text.header))
 
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
@@ -98,7 +98,7 @@ SECTIONS
 #endif
        *(.text.__x86_indirect_thunk_*)
 
-       *(.fixup)
+       KEEP(*(.fixup))
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } PHDR(text) = 0x9090
@@ -116,12 +116,12 @@ SECTIONS
        . = ALIGN(8);
        /* Exception table */
        __start___ex_table = .;
-       *(.ex_table)
+       KEEP(*(.ex_table))
        __stop___ex_table = .;
 
        /* Pre-exception table */
        __start___pre_ex_table = .;
-       *(.ex_table.pre)
+       KEEP(*(.ex_table.pre))
        __stop___pre_ex_table = .;
 
        . = ALIGN(PAGE_SIZE);
@@ -212,7 +212,7 @@ SECTIONS
         * as binary blobs. The .altinstructions has enough data to get
         * the address and the length of them to patch the kernel safely.
         */
-       *(.altinstr_replacement)
+       KEEP(*(.altinstr_replacement))
 
 #ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
        . = ALIGN(SMP_CACHE_BYTES);
@@ -225,8 +225,8 @@ SECTIONS
 
        . = ALIGN(POINTER_ALIGN);
        __initdata_cf_clobber_start = .;
-       *(.init.data.cf_clobber)
-       *(.init.rodata.cf_clobber)
+       KEEP(*(.init.data.cf_clobber))
+       KEEP(*(.init.rodata.cf_clobber))
        __initdata_cf_clobber_end = .;
 
        *(.init.rodata)
@@ -234,13 +234,13 @@ SECTIONS
 
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
@@ -248,10 +248,10 @@ SECTIONS
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
@@ -260,21 +260,21 @@ SECTIONS
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
 
@@ -316,7 +316,7 @@ SECTIONS
        *(.data.read_mostly)
        . = ALIGN(8);
        __start_schedulers_array = .;
-       *(.data.schedulers)
+       KEEP(*(.data.schedulers))
        __end_schedulers_array = .;
 
        HYPFS_PARAM
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index f54fb2d152..9a1eb23c73 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -144,32 +144,32 @@
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
 
@@ -177,7 +177,7 @@
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
        __paramhypfs_start = .;   \
-       *(.data.paramhypfs)       \
+       KEEP(*(.data.paramhypfs)) \
        __paramhypfs_end = .;
 #else
 #define HYPFS_PARAM
@@ -187,7 +187,7 @@
 #define LOCK_PROFILE_DATA        \
        . = ALIGN(POINTER_ALIGN); \
        __lock_profile_start = .; \
-       *(.lockprofile.data)      \
+       KEEP(*(.lockprofile.data))\
        __lock_profile_end = .;
 #else
 #define LOCK_PROFILE_DATA
@@ -207,7 +207,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(.data.rel.ro.vpci)      \
+       KEEP(*(.data.rel.ro.vpci))\
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.51.1


