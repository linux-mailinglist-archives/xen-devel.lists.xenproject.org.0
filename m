Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8979495D617
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782601.1192137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5Z-0003A7-IF; Fri, 23 Aug 2024 19:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782601.1192137; Fri, 23 Aug 2024 19:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5Z-00036c-BX; Fri, 23 Aug 2024 19:36:49 +0000
Received: by outflank-mailman (input) for mailman id 782601;
 Fri, 23 Aug 2024 19:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sha5X-0002Oa-P4
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:36:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2418::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0886edd0-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:36:47 +0200 (CEST)
Received: from BN9PR03CA0603.namprd03.prod.outlook.com (2603:10b6:408:106::8)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 19:36:41 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::59) by BN9PR03CA0603.outlook.office365.com
 (2603:10b6:408:106::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 19:36:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 19:36:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 14:36:37 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 14:36:36 -0500
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
X-Inumbo-ID: 0886edd0-6187-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec25Fu0KVgOkM4yHYb1LTlK5N9XXSUUFcpstMD10M3FKFcnlqmcJoGuALa0E3v/eSTnF7awDjj5jIixjeFTsT8pzOzURfYRXONuxmfltTCWw2Oc3duUWzrjt+ZGRYNQ1wTGKJv+0yY3hriiKSnrjKZhhwVn2q/nTBzn91QuJk6WUqzywnAHiMg0BopnDILQI1pJ2rJkwd8tlbiWXGRBRk73ntB/stQirYrRhviwXyY9TaytjajansIg7kqwY4V1ujJoWMVH6rFVCSaV9i3FaH+EnlKZV9vZEt0DssaylAsn7Q7OCImwBvjsJFGTc1Y6/cz34fUAZ4Qg1yW82S3sZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=726QpRcn+lvf4rCuApM2KwRHNgakfInv/OKNIzKT6VQ=;
 b=pMzY17WE7Z+Q64BVu/+mXTipzfGBqP8LRFacc6Hfw0mwIcCjKARD7m3pFWZgwlWeJKZhdWgyf+CqZTdk175IYi5TFu+wDY59oaSlBH39kMXt5GvA/of4IdVtp1m98frqlxa8XHLqU3QmevR5Ef2wIUUHealFG8wA+Pybsz7nPyFG6CvXddERB9iHN9wd9f4uLG38gZhpiZhJhgIdeb40NXSciPF0lkRycIrmAB15853Bw01F/TJ+az2A3saVEHE3T/pJAzjiCw3c/x6PRVDzbtqF+7FC7s+rSDw9JEExhrO2KgEEihmXoPS700hR+CIJN8TXYzDsQIwE2N1l4eMifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=726QpRcn+lvf4rCuApM2KwRHNgakfInv/OKNIzKT6VQ=;
 b=ALsNO2kVBUmJ2vUnwUE1CXvArrfVNOqZFf17Aop7yZKl9HufKx3nohIM3b4HuPkIgIEjTygJfjN5TbyC36tB07e9ftlcFQrbroJj8bNNqNr2pTBb9FXi/8bQmhwYUjljAOnlsphJhV5oWHM2V388aiUMHRpl2N/Uk+JLdDI9+60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v3 2/5] x86/pvh: Make PVH entrypoint PIC for x86-64
Date: Fri, 23 Aug 2024 15:36:27 -0400
Message-ID: <20240823193630.2583107-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823193630.2583107-1-jason.andryuk@amd.com>
References: <20240823193630.2583107-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f063824-6117-4102-c97d-08dcc3aae8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6VL/RPA3wdiowMbkNy1f1F3Kkr5OHmKjey+aP+IGeny5J5dPWadp+Vr7/KbJ?=
 =?us-ascii?Q?IU/znlteWzqOaHDKIab35BDhdRMPwiBzLYuo1SsJ10XwnVmMu8rMVmQWwYvn?=
 =?us-ascii?Q?3gqCn9e7dNqoke3SHTGW83XK54PmDzdnCuQrO1MO+mZXMHpizzHT95C1QVnX?=
 =?us-ascii?Q?9p1GzMUNUNZarjwP/dnWEllcDLLsewFf3m7SR2zQzYX9xmgcK9ZmX+47o9Ir?=
 =?us-ascii?Q?ktf6xvByWe9H8Mf5yBoEzatuJmumaBQICgXC6WvfteL3fGZZVCd0cB+hYLFQ?=
 =?us-ascii?Q?IDqNzTQtL/8Q1+nz1r98izAnUxTaGNmzevXolKOQTT7Jz2s45h565vY9awdL?=
 =?us-ascii?Q?Q1r3GX+vpQv+Ylz1ORicQFcrwx/MuuZRMbXdFvpAE9POQ5ZewTL37I4u3HrY?=
 =?us-ascii?Q?vr07j786qyZZ2LU/FjHEOYmcD23Cf/lJyUTT6chXYOkUT6dqyvfQEFIfl5Hs?=
 =?us-ascii?Q?vT5EyKDtnDQcCYxQMastdGwGcR1H1d36bz0zuEzCvvH3KSU88L1L8gvifwWn?=
 =?us-ascii?Q?ofep+lRZJIkgWLQyNkdjLiw3oOpSrNQ2pf8tlzCzzIQpF8IGs9CSXx1L5/+E?=
 =?us-ascii?Q?Df0mxbktz4xkFd12vvYKlN/EwocNms7bWOjq6Q7JjH8YwswPYe91iTje8Cme?=
 =?us-ascii?Q?hvqk4mDm1nS+LnudxjColk/o1djRd21fwfr3nQrmL6QrzK1KUXWDyu7n72zc?=
 =?us-ascii?Q?YiPLeP3w5TTxxpijhPNaxqkO+vOTkdPgJk2+RpRDbowYwZFAqbP/E+SfX350?=
 =?us-ascii?Q?EagGJUVfWvTqQpBrTx2wTq+/cccUXuG456Wjn4TB22m/3bfs101oLbfio9bb?=
 =?us-ascii?Q?NHYXHoe0EpILEWMKev3dHJXTxJTH+IVrH47kwe4I/KOFt4xXplnAz76NztrJ?=
 =?us-ascii?Q?Rd9U9UpjeaT6DZvQNYW5anT2bTcPfPxsDE6nB1PSVv0FZ5P3iMsz3LW7l+V1?=
 =?us-ascii?Q?1X+oBhOXiP2ih6xiFXct9GSuLowhh5x+nS+XDVgOmp2fRP4z3z4+SPJ5OUWF?=
 =?us-ascii?Q?e9/kn+1ASj7Wjts8Xkfeps81gQ+VpxG1c3TYkgfigcKttKO/HVmS33iAlhM9?=
 =?us-ascii?Q?a0d43qf44GUkVf9uvxgJqQWvOTe5j5Z+Zeextx4Pgg2SXxO1wya+Y6cfMW5l?=
 =?us-ascii?Q?fTFeSeT0P0S3vbKnIBrAg2WeseMuGDmdzoALCnLUA++9K1P/Uidu3sCK24fT?=
 =?us-ascii?Q?VSjOxIAFrRTMWLJ28FqjKhKpp0xG/E5WGG8K2sddUBgUeZ4KmNrdwmqshV1s?=
 =?us-ascii?Q?CuIExXOh22lSAYG4CM5Ho462zy05NxYgdSLXVA2Z7Ln3HX1FivbZh7VbsDnK?=
 =?us-ascii?Q?9/PGKCRfYXgE32/T9zuOqJUO7cfvuYfogtBSPeB+RSsbWDSeND38qExIi5JI?=
 =?us-ascii?Q?/6XXM5Cbol37RDpcrYTl7FkdD4ehqG+d5SOvT5hMDZea3fLy5WCEGRdAIMI8?=
 =?us-ascii?Q?HZRzVmV9miuzt8CFJh7fYY2z0wlXkfspfHjVZVeDbLaeFaJEk16QaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:36:39.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f063824-6117-4102-c97d-08dcc3aae8fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

The PVH entrypoint is 32bit non-PIC code running the uncompressed
vmlinux at its load address CONFIG_PHYSICAL_START - default 0x1000000
(16MB).  The kernel is loaded at that physical address inside the VM by
the VMM software (Xen/QEMU).

When running a Xen PVH Dom0, the host reserved addresses are mapped 1-1
into the PVH container.  There exist system firmwares (Coreboot/EDK2)
with reserved memory at 16MB.  This creates a conflict where the PVH
kernel cannot be loaded at that address.

Modify the PVH entrypoint to be position-indepedent to allow flexibility
in load address.  Only the 64bit entry path is converted.  A 32bit
kernel is not PIC, so calling into other parts of the kernel, like
xen_prepare_pvh() and mk_pgtable_32(), don't work properly when
relocated.

This makes the code PIC, but the page tables need to be updated as well
to handle running from the kernel high map.

The UNWIND_HINT_END_OF_STACK is to silence:
vmlinux.o: warning: objtool: pvh_start_xen+0x7f: unreachable instruction
after the lret into 64bit code.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use rip-relative loads in 64bit mode
Direct jmp to startup_64
---
 arch/x86/platform/pvh/head.S | 46 ++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..ba4d0eab4436 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -7,6 +7,7 @@
 	.code32
 	.text
 #define _pa(x)          ((x) - __START_KERNEL_map)
+#define rva(x)          ((x) - pvh_start_xen)
 
 #include <linux/elfnote.h>
 #include <linux/init.h>
@@ -54,7 +55,25 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
-	lgdt (_pa(gdt))
+	/*
+	 * See the comment for startup_32 for more details.  We need to
+	 * execute a call to get the execution address to be position
+	 * independent, but we don't have a stack.  Save and restore the
+	 * magic field of start_info in ebx, and use that as the stack.
+	 */
+	mov  (%ebx), %eax
+	leal 4(%ebx), %esp
+	ANNOTATE_INTRA_FUNCTION_CALL
+	call 1f
+1:	popl %ebp
+	mov  %eax, (%ebx)
+	subl $rva(1b), %ebp
+	movl $0, %esp
+
+	leal rva(gdt)(%ebp), %eax
+	leal rva(gdt_start)(%ebp), %ecx
+	movl %ecx, 2(%eax)
+	lgdt (%eax)
 
 	mov $PVH_DS_SEL,%eax
 	mov %eax,%ds
@@ -62,14 +81,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	mov %eax,%ss
 
 	/* Stash hvm_start_info. */
-	mov $_pa(pvh_start_info), %edi
+	leal rva(pvh_start_info)(%ebp), %edi
 	mov %ebx, %esi
-	mov _pa(pvh_start_info_sz), %ecx
+	movl rva(pvh_start_info_sz)(%ebp), %ecx
 	shr $2,%ecx
 	rep
 	movsl
 
-	mov $_pa(early_stack_end), %esp
+	leal rva(early_stack_end)(%ebp), %esp
 
 	/* Enable PAE mode. */
 	mov %cr4, %eax
@@ -84,30 +103,33 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	wrmsr
 
 	/* Enable pre-constructed page tables. */
-	mov $_pa(init_top_pgt), %eax
+	leal rva(init_top_pgt)(%ebp), %eax
 	mov %eax, %cr3
 	mov $(X86_CR0_PG | X86_CR0_PE), %eax
 	mov %eax, %cr0
 
 	/* Jump to 64-bit mode. */
-	ljmp $PVH_CS_SEL, $_pa(1f)
+	pushl $PVH_CS_SEL
+	leal  rva(1f)(%ebp), %eax
+	pushl %eax
+	lretl
 
 	/* 64-bit entry point. */
 	.code64
 1:
+	UNWIND_HINT_END_OF_STACK
+
 	/* Set base address in stack canary descriptor. */
 	mov $MSR_GS_BASE,%ecx
-	mov $_pa(canary), %eax
+	leal canary(%rip), %eax
 	xor %edx, %edx
 	wrmsr
 
 	call xen_prepare_pvh
 
 	/* startup_64 expects boot_params in %rsi. */
-	mov $_pa(pvh_bootparams), %rsi
-	mov $_pa(startup_64), %rax
-	ANNOTATE_RETPOLINE_SAFE
-	jmp *%rax
+	lea pvh_bootparams(%rip), %rsi
+	jmp startup_64
 
 #else /* CONFIG_X86_64 */
 
@@ -143,7 +165,7 @@ SYM_CODE_END(pvh_start_xen)
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
 	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
+	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
-- 
2.34.1


