Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDWNEW7WmGl7NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2716B0A8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237612.1539882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL8-0000kM-OF; Fri, 20 Feb 2026 21:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237612.1539882; Fri, 20 Feb 2026 21:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL8-0000hl-GY; Fri, 20 Feb 2026 21:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1237612;
 Fri, 20 Feb 2026 21:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL6-0008Ew-MR
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3e4ef94-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:07 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-481188b7760so21122925e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:07 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:06 -0800 (PST)
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
X-Inumbo-ID: b3e4ef94-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624027; x=1772228827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++I7y0Fz5SNLOYdyOKbflTxyKYPA97MXE/g2maqbcaQ=;
        b=vk25ojic1m2Jr1Uc8xYH10oJ60/hXch9uMSBQg3XYs+ArESqN1Jobwlh+i9WbcMkJC
         1BWuzTsCn8SRnZw8+lv+KGFpLgQLIeEFB7BDhk1xZ47Q5EY2VneDqLVS/OwGlT5EBg0/
         H+i7AaNAvsUpWWDD3kZYsFpz7bDG8v1eBNCv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624027; x=1772228827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++I7y0Fz5SNLOYdyOKbflTxyKYPA97MXE/g2maqbcaQ=;
        b=r5LEQHMP2sG3j3KAtIno4R85Q1vmMaqLlA2AnpWHljv8HBmS2ZAtx/AkYAO1cetK/g
         7ushFvrZli0yccEd1HbezUJ78Di/OiBHxhoKhyaI/RN3FceIGYOyU1bDo9kmqf6IwgMJ
         NBE9k4Ib70wcQB6ylSAXTDpiRCaJdZ9lS4bGJJyLONv70yWaAQW2EJRZ5nPnBqiLAQxu
         3GlQacUVoPCdm+RPNbMl+j23PzDzl4NhPIXnTgRohyH/TvzFi4DaHA0mHXaZmJ2S9kGd
         89L8bDMSHcr/OLrIzUh1tf4I2zjyShaApaPnE3MRqpXMIPT6NF0GzX1h5jLSST+HVML+
         0bQQ==
X-Gm-Message-State: AOJu0Yw9S7Auah2bvufiBVkJaPFLm8wu02NbU92xM8pmerphK7V8gCR/
	WaDdKRvLwfByp4rpSHxV5RNPLP8Tb8zmfCsF5Sh+2tjht1FK/9jqrFyOIgBMwva/watqost0r26
	FiZix2KTO4w==
X-Gm-Gg: AZuq6aJK9wGs05svOVMGYz15WGlSaU84M3aHLBhSr3Ju5/iFFpAIUo7Dt5iApcXEi1b
	NjNWhsd0L+yQAA8OoiKx1HY4iWlvUDyFAPhJiDHs7h1o1/p1xnR1mma32TFJrtjchluoORIEgDc
	JRbicZ8tPdQUqIhVKtLrrJAebGNyzPVnDc8Yqob3tDJSgZFVSkxVVn+Jqgur8HVzU09ygrcgtDv
	85tL56JNb5PlAUz665KSPY6iVzgT3ZysfQ7hHOhfs3aARnnYDrcTXOmySkkdEvWqNbaaPMAVM9U
	BjEnjAcojRxgfDIXBlKZYfeRuH8PqEZwPJSwND5c0JDjyq6TaCP+xS9+U/6GBR9l/6hlrjQ/dbX
	M0h9jgKu/g0/N3GbdHtSnjIv7U2l5gtVOzw09T4lrnnFYXi6D23dvYuwLpaU463rXx5qAD9aECM
	Ihx8FDVZ4/CHKwUKkJTsh0//ZixZBbyFl3a4avMkeAkYxZ96QCgxKz/nWisqFDHPAhZjsI5aw=
X-Received: by 2002:a05:600c:8b2c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483a95e24ebmr19094485e9.16.1771624026566;
        Fri, 20 Feb 2026 13:47:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 05/12] x86: Adjust annotations of asm-used identifiers
Date: Fri, 20 Feb 2026 21:46:46 +0000
Message-Id: <20260220214653.3497384-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EDB2716B0A8
X-Rspamd-Action: no action

do_entry_int82() is only called by assembly so gains asmlinkage.

pvh_start_info_pa and early_hypercall_insn are data used by assembly, and need
a SAF-1 annotation.

For the remaining SAF-1 anntations on functions, convert them to asmlinkage
for consistency.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/boot/cmdline.c       | 3 +--
 xen/arch/x86/boot/reloc.c         | 3 +--
 xen/arch/x86/guest/xen/pvh-boot.c | 2 +-
 xen/arch/x86/guest/xen/xen.c      | 2 +-
 xen/arch/x86/pv/hypercall.c       | 2 +-
 xen/arch/x86/traps.c              | 3 +--
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 196c580e9151..5db5c7b20bf6 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -334,8 +334,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 }
 #endif
 
-/* SAF-1-safe */
-void cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
+void asmlinkage cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
 {
     if ( !cmdline )
         return;
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 7a375ad41c1c..82c2d237aab6 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -346,8 +346,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
     return mbi_out;
 }
 
-/* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in)
+void *asmlinkage reloc(uint32_t magic, uint32_t in)
 {
     memctx ctx = { trampoline_phys + TRAMPOLINE_HEAP_END };
 
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index e14d7e20e942..8d8f4a34e445 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -22,7 +22,7 @@
 
 /* Initialised in head.S, before .bss is zeroed. */
 bool __initdata pvh_boot;
-uint32_t __initdata pvh_start_info_pa;
+uint32_t __initdata pvh_start_info_pa; /* SAF-1-safe */
 
 static multiboot_info_t __initdata pvh_mbi;
 static module_t __initdata pvh_mbi_mods[8];
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 315e5ded05ab..8e13c2fbf307 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -40,7 +40,7 @@ DEFINE_PER_CPU(struct vcpu_info *, vcpu_info);
  *     0 vmcall
  *   > 0 vmmcall
  */
-int8_t __initdata early_hypercall_insn = -1;
+int8_t __initdata early_hypercall_insn = -1; /* SAF-1-safe */
 
 /*
  * Called once during the first hypercall to figure out which instruction to
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 17581d232e19..b3b9a3255531 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -180,7 +180,7 @@ void pv_ring1_init_hypercall_page(void *p)
     }
 }
 
-void do_entry_int82(struct cpu_user_regs *regs)
+void asmlinkage do_entry_int82(struct cpu_user_regs *regs)
 {
     if ( unlikely(untrusted_msi) )
         check_for_unexpected_msi((uint8_t)regs->entry_vector);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3c01c5eb53b5..29ea6054abab 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1336,8 +1336,7 @@ void asmlinkage do_int3(struct cpu_user_regs *regs)
     pv_inject_hw_exception(X86_EXC_BP, X86_EVENT_NO_EC);
 }
 
-/* SAF-1-safe */
-void do_general_protection(struct cpu_user_regs *regs)
+void asmlinkage do_general_protection(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
     struct vcpu *v = current;
-- 
2.39.5


