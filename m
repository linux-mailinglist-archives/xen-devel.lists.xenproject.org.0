Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80158A96FE8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962759.1353933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDO-0000po-Py; Tue, 22 Apr 2025 15:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962759.1353933; Tue, 22 Apr 2025 15:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDO-0000mL-Mk; Tue, 22 Apr 2025 15:07:14 +0000
Received: by outflank-mailman (input) for mailman id 962759;
 Tue, 22 Apr 2025 15:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDN-0000lQ-U4
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:13 +0000
Received: from 9.mo584.mail-out.ovh.net (9.mo584.mail-out.ovh.net
 [46.105.40.176]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 784a0c4c-1f8b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:07:13 +0200 (CEST)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.139.54])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvh2KgYz1YL3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:12 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-w2sd9 (unknown [10.110.178.161])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 05C811FEDD;
 Tue, 22 Apr 2025 15:07:10 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-w2sd9 with ESMTPSA
 id gjHvMp6wB2hCUgIAGwf5/A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:10 +0000
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
X-Inumbo-ID: 784a0c4c-1f8b-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-106R00600220e96-ded3-40a4-a6af-caa494199e46,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 03/21] x86/boot: add MLE header and new entry point
Date: Tue, 22 Apr 2025 18:06:37 +0300
Message-ID: <e92fd3dc9241b56686eba65f255eea16462d8954.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12727172547972674716
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekudegfeduieegudeijeelleekfedvvdfhheehvefhudekjeeifeegtdduveehtdenucffohhmrghinhephhgvrggurdhssgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=C/zzp0aIagiRDRrNb1hyYGPHNAie/7wpVquzYMh9D/s=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334432; v=1;
 b=auk5A/R6YHWHvx1XnF4GvLDHLDBtWcmvNNfqC7u2is7mNE5UMP0AzCURaqHc5VcWnMoU8Sfc
 t4O+v5Gh2ynvSqGtOmbf8TIuacg/jqjxA9l59nwogPyEfv3e/c8txFV8U5hZ5WmpVmDbtNVwagb
 ToAIyn/bihPLHBderKuCWCU9RusWgl/qCTGQ66QA+Xin73jPC093zNuBtDStXuisAkztwvg98Mv
 0Xm3RRoM7HNwuIe/zzjePj8b0IYpiYGUK+RysuEOIGqHbjwW+RKsjMvcGf6YDmgtkiLSlffvLoG
 TGjlN07ALlNihncoDcwKVidPf4MhTQPHx22uLk6QdRVqg==

From: Kacper Stojek <kacper.stojek@3mdeb.com>

Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 docs/hypervisor-guide/x86/how-xen-boots.rst |  5 ++
 xen/arch/x86/boot/head.S                    | 53 +++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005c..050fe9c61f 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -55,6 +55,11 @@ If ``CONFIG_PVH_GUEST`` was selected at build time, an Elf note is included
 which indicates the ability to use the PVH boot protocol, and registers
 ``__pvh_start`` as the entrypoint, entered in 32bit mode.
 
+A combination of Multiboot 2 and MLE headers is used to implement DRTM for
+legacy (BIOS) boot. The separate entry point is used mainly to differentiate
+from other kinds of boots. It moves a magic number to EAX before jumping into
+common startup code.
+
 
 xen.gz
 ~~~~~~
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e21..cd951ad2dc 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -4,6 +4,7 @@
 #include <public/xen.h>
 #include <asm/asm_defns.h>
 #include <asm/fixmap.h>
+#include <asm/intel_txt.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/msr-index.h>
@@ -126,6 +127,25 @@ multiboot2_header:
         .size multiboot2_header, . - multiboot2_header
         .type multiboot2_header, @object
 
+        .balign 16
+mle_header:
+        .long   0x9082ac5a  /* UUID0 */
+        .long   0x74a7476f  /* UUID1 */
+        .long   0xa2555c0f  /* UUID2 */
+        .long   0x42b651cb  /* UUID3 */
+        .long   0x00000034  /* MLE header size */
+        .long   0x00020002  /* MLE version 2.2 */
+        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
+        .long   0x00000000  /* First valid page of MLE */
+        .long   0x00000000  /* Offset within binary of first byte of MLE */
+        .long   (_end - start)  /* Offset within binary of last byte + 1 of MLE */
+        .long   0x00000723  /* Bit vector of MLE-supported capabilities */
+        .long   0x00000000  /* Starting linear address of command line (unused) */
+        .long   0x00000000  /* Ending linear address of command line (unused) */
+
+        .size mle_header, .-mle_header
+        .type mle_header, @object
+
         .section .init.rodata, "a", @progbits
 
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
@@ -332,6 +352,38 @@ cs32_switch:
         /* Jump to earlier loaded address. */
         jmp     *%edi
 
+        /*
+         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
+         *
+         * CPU is in 32b protected mode with paging disabled. On entry:
+         * - %ebx = %eip = MLE entry point,
+         * - stack pointer is undefined,
+         * - CS is flat 4GB code segment,
+         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
+         *   would make it impossible to initialize GDTR, because GDT base must
+         *   be relocated in the descriptor, which requires write access that
+         *   CS doesn't provide. Instead we have to assume that DS is set by
+         *   SINIT ACM as flat 4GB data segment.
+         *
+         * Additional restrictions:
+         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
+         *   some capabilities might be reported as disabled even if they are
+         *   supported by CPU
+         * - interrupts (including NMIs and SMIs) are disabled and must be
+         *   enabled later
+         * - trying to enter real mode results in reset
+         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
+         *   which is supported by a given SINIT ACM
+         */
+slaunch_stub_entry:
+        /* Calculate the load base address. */
+        mov     %ebx, %esi
+        sub     $sym_offs(slaunch_stub_entry), %esi
+
+        /* Mark Secure Launch boot protocol and jump to common entry. */
+        mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax
+        jmp     .Lset_stack
+
 #ifdef CONFIG_PVH_GUEST
 ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
 
@@ -371,6 +423,7 @@ __start:
         /* Restore the clobbered field. */
         mov     %edx, (%ebx)
 
+.Lset_stack:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
-- 
2.49.0


