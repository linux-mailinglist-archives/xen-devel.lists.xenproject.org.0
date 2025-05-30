Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA7AC8FB6
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000932.1381139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdA-0000cj-Vb; Fri, 30 May 2025 13:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000932.1381139; Fri, 30 May 2025 13:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdA-0000Zw-SO; Fri, 30 May 2025 13:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1000932;
 Fri, 30 May 2025 13:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdA-0008Jy-3F
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:40 +0000
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net
 [46.105.79.203]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 998debce-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:18:39 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.148.22])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4b83ht5zchz289h
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:38 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-m2hqt (unknown [10.110.118.244])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A20CDC61DA;
 Fri, 30 May 2025 13:18:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-m2hqt with ESMTPSA
 id 8EEPHi2wOWjlBgAAzgKK1w
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:37 +0000
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
X-Inumbo-ID: 998debce-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-101G00483e32f39-353f-424e-a8fc-ffe6f4f47263,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
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
Subject: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch entry point
Date: Fri, 30 May 2025 16:17:45 +0300
Message-ID: <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12695084403030340764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkedugeefudeigeduieejleelkeefvddvhfehheevhfdukeejieefgedtudevhedtnecuffhomhgrihhnpehhvggrugdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=REsQ4rGltjGtDGspVocQv2/Sf60+XBS+U8hI4FuZ0Cs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611118; v=1;
 b=AJwlGqENjuhLsTTl6afFnjmyNEklFCTYMEsMItvkax4JAE++9kXAudWVUE0Lebmf1/Q1s0rS
 WheNkVDW2KggJSxITVxdTJWi2n27BBlyEQSqAhaoUu6t/iplLrw/lY3nhRpwBroHZ11kqBDa5IE
 lyNLfF4RMGmsosWhP2nkjIVmjxJAd8LmlYdn8M8HAz2zAXqDS6IHLBOJjiSkamNhjC09ZTp6tD0
 nm0Qt1yJ4o/tQMf9uPyhH3jBFlVivGM2j5EEvkQnRnjrEQILOxOaoaobsGn/kJTco71kouDgWaB
 zSJsx4SufdBqMVBfzVUn0miVYgdF5G2S2LPDGSWYFf2pw==

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
index 77bb7a9e21..a69107bd81 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -4,6 +4,7 @@
 #include <public/xen.h>
 #include <asm/asm_defns.h>
 #include <asm/fixmap.h>
+#include <asm/intel-txt.h>
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


