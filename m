Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DA8A00D7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703596.1099332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwW-0001Fv-6w; Wed, 10 Apr 2024 19:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703596.1099332; Wed, 10 Apr 2024 19:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwW-0001Cs-4D; Wed, 10 Apr 2024 19:49:12 +0000
Received: by outflank-mailman (input) for mailman id 703596;
 Wed, 10 Apr 2024 19:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkSW=LP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rudwV-0001Ay-1P
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:49:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 643ed77f-f773-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 21:49:08 +0200 (CEST)
Received: from SN6PR05CA0029.namprd05.prod.outlook.com (2603:10b6:805:de::42)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 19:49:03 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::8c) by SN6PR05CA0029.outlook.office365.com
 (2603:10b6:805:de::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 19:49:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 19:49:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 14:49:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 14:49:00 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 14:48:59 -0500
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
X-Inumbo-ID: 643ed77f-f773-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAEFP7xCU3nCE5az1K0l/P8vq2pbvhqJyl78vO8I0fqu+pViAe6j9FbXgj7tgEnMtV+weEk9TmfOlMfg+0SW62Egne2iVR0o+TD9ghqPj9FkuO0OaPdzeeFP0u/M3+/QQ1BaZBys8TgeKhBGKQ6csnku29ZH5esO0Dpkj5a2oRXZAkjGns9Cy5HOpkWkQLI/n1bsGvUa12nepu6FiiLvVkFn1p8Eingx4MjSEKBbeQbsIKNuJGM1WmIdD2oePKAJBXAqmdunGCHB0evfjF1O0WiSsZpkJ6EteQqX24cCFUqWEz7iFuahbALjw6KSRv8RtVUaojdYvP3Azwnru+bI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkbpZW9hMkc53U7U+wRYozFG0AyYVfEuOqSKx2pbsjo=;
 b=m2ixDhHsgYrIRUqb/WPyvfaP49yCSDvdfwMPmC7F3ekCZma1WFgqEmcStgfzYYgRWynPCpxNfGFRsab3Vq51s2DPnOa0Jl9MeKyyY7sEMapC8YGvkEWhx6HwrXYJ2ND19FCP/MPbU9C1cq1ktjqjBdrtQ/RsobySnd/TAp1+i6NjvZHau/tom9NM/uX2S+rcHRleA07qFqF7pgvsanSRn05SW4yiXh0tVExk3ehbN4fCmIk2mhLV0igkwJsmtPTZZRiOcMd9y+wVSLNgQCNS1V7KDbQCvGmOtWZAXIGDSCTK3e3G1tQYFQ8HbKhyRpy+WGIDThruSC0BEBgyJkuONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkbpZW9hMkc53U7U+wRYozFG0AyYVfEuOqSKx2pbsjo=;
 b=ApsEdYA5s63vSjsSGnBGBiGyf1oCwla8ipRXAswsyfcXsgnz6P1z1DsPf+yGp6iAFy7AavmCZxe7wjpVJS/GN7+Ed4rfeLAorHo6bSXrPyTFTLzP9e6iZ2inMxjO3wkcOGD882lQSK30YqA4rCGq7/LE7sHHz0eajS+IcAJSMOU=
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
	<pbonzini@redhat.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH 2/5] x86/pvh: Make PVH entrypoint PIC for x86-64
Date: Wed, 10 Apr 2024 15:48:47 -0400
Message-ID: <20240410194850.39994-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410194850.39994-1-jason.andryuk@amd.com>
References: <20240410194850.39994-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: e5af0b23-221b-4d88-41f3-08dc59974539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M4J5Yl9NB++fZpNjgzq0ZJOqlEasUG7FhFUaICwBwScpv7DxbuFM5QA9lbeKoYGULPpalbck66dZi/5Ex8aGYLfNHr6TU+F75utTzN3wED24jhjtGTesSXdRZTpzA60Oun+EOU05JbJCKl8QRzuM7lkk5aQfct9sYY0olKJSPEEPkHSPIqeRPFy31hSzkjeMNsZLA2XwGXdR/T6EGDOc2FULmTAHcDJbAdhCkN5YrUHUyZ8V3nRmWd/2afw0LzeVInadOx/wbvhiFFepiwrsXUAGr9WTBgRU7xjVexwPKDYVBo6Z+9Pk+XX3AfVheA5teNKF/iDKUtiDRP0LK/xYGyIAkbK1KbJAVDnXvqpCz0RbTi7zQzN5flZapbuBfj3+thz/TeK1XkfVaLXw4Y7mg2Q/MKNFc6G5Sate1bDubaDv2wlx/9jf6Z/Nh+6Pe6V7h3jVUzCQ+d6bIc5VTorGNtenDxegsroDJ8Gmp5MTr7EomZtDmejvbsMveb6XE87sF5fBYYAyh5+hO4wiD6KMNorAZyIrZoeXZsLroK5Wvy2i38kEDEylWXUh5yHu/Iliafzuv7Kbd6G/drK44k60LbPh03LfDJ/iXBq9g3aPVjFt8xMoW9rF4de6wdL34ktXipjl7UQNwn2H1aLJzdgsgsjOAlGtYQkyIcPgGzz24GJ2A91BJlFJbN5HcNIJKC+9tCbHBKKHgFXX449ZMEIsUVY1GSP3rHzd1dB0Frhx/OHxKRoaYQ0YfjpP1aVyQT7SvTuEdClIRwedoGjBaOJRUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(7416005)(82310400014)(1800799015)(36860700004)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 19:49:01.5456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5af0b23-221b-4d88-41f3-08dc59974539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986

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
---
 arch/x86/platform/pvh/head.S | 44 ++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..bb1e582e32b1 100644
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
@@ -84,28 +103,33 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
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
+	leal rva(canary)(%ebp), %eax
 	xor %edx, %edx
 	wrmsr
 
 	call xen_prepare_pvh
 
 	/* startup_64 expects boot_params in %rsi. */
-	mov $_pa(pvh_bootparams), %rsi
-	mov $_pa(startup_64), %rax
+	lea rva(pvh_bootparams)(%ebp), %rsi
+	lea rva(startup_64)(%ebp), %rax
 	ANNOTATE_RETPOLINE_SAFE
 	jmp *%rax
 
@@ -143,7 +167,7 @@ SYM_CODE_END(pvh_start_xen)
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
 	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
+	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
-- 
2.44.0


