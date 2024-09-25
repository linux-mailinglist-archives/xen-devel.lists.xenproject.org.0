Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0B9862BA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804158.1215244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjN-0005yH-EI; Wed, 25 Sep 2024 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804158.1215244; Wed, 25 Sep 2024 15:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjM-0005XZ-6B; Wed, 25 Sep 2024 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 804158;
 Wed, 25 Sep 2024 15:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uO0=QX=flex--ardb.bounces.google.com=3HSb0ZggKCXgWnZX+cepckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@srs-se1.protection.inumbo.net>)
 id 1stTXc-0002k3-3m
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:56 +0000
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [2a00:1450:4864:20::44a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df17d99-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:54 +0200 (CEST)
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-374b35856aeso2101130f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:54 -0700 (PDT)
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
X-Inumbo-ID: 3df17d99-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276574; x=1727881374; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/+lA7axzWVX738v6MDlUUydsjXBcrFQn3zDJoV9Zlw=;
        b=VVGRj2y5erPwaW+8XNNsTfbXqGhWy5vPBQJjfy+BJd8WFHZT+zPXIwcj2MqhcFnb3r
         rU2Ujmyq3qrM4JbmjkdvxQwukWhowpbT/zzO7XEnwPOhuhAe0e1KpEODBOTi2fZ0Goum
         UvGINIngab8JnKWGNW6hjRVrozY4Icu66k+ZR7Z0yM/0meoT2uhX/25pmwfnL0VtAw5a
         lfrjxMd+COtfM2FQiYc4OeKORF1o+gkhro8EgimK7mPFlbX4ZhYnDu7oVABvX/tmV7sX
         dIjJCrv+dccRg3sFxkXaOTDxIeGVoc+k8ynFhcmrbEMiMDWFoe/MLkKylW06eGJcmyKY
         0pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276574; x=1727881374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/+lA7axzWVX738v6MDlUUydsjXBcrFQn3zDJoV9Zlw=;
        b=mUiRzuMxjFjZClU6PChqlJj0HFZQhKM/2YdHBAHImQCQOjNZBDOjJN5cbuooNxEEXZ
         Cxaw1J39+X8LWPi057pDoeJx+aaYA92MX57mBX1uYZYsBvaaeqMKABO+WfbJ40N1uQkT
         3n3pJRhAImyUgkzsP1PLC8QPdjYmX5nV0GkTbzVikc7ECOne2hbYbEaoTYC/sMNX3L+O
         rkL9ghtIH9KlymZjdF9+BzyCUAtiMXNJ5iS8xhFOnJdn69VXpi5HW8CQ2H4CwXt/yQ1x
         BiC6NkIw73cNhuB0mCrdJBidSWd7SvY7KeCLf18lq6Ez6TJ6V9Wn7YmVyyvIUGCl1ps0
         UwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUByXotHkIoxUFKRXR1i8MmheTXe8vxClqT81vOP+rhipSBEXT56jDnPyPgqxEt3dfLHC1AAbvBZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3EIbwMoYCTcejpzU1HEJswAKb9CBLWPnQMKXto3xUROpN92L+
	vi112Z4wKwY9jp2Z07w4Oe2Q4LZwTR8sR5Wl9Fp/V6TjmNOAyV4hjb9Hw3alvZMck+kV7g==
X-Google-Smtp-Source: AGHT+IFNuvMvba4376xFzsyJ1BUDwRQ77lLDg4NDppuY0o3Frk8EdeKG+tmu68nrB2OUMQBq6qGzN/uY
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:54cc:0:b0:374:c4ab:a87 with SMTP id
 ffacd0b85a97d-37cc24daa31mr1689f8f.10.1727276573709; Wed, 25 Sep 2024
 08:02:53 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:25 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4435; i=ardb@kernel.org;
 h=from:subject; bh=kANZ4hMlm4/UDKey8x5hppB+h4SVBsDN4bipEdg9xMY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6vknrr8ZmOQrG7s3Nc2KdXJ4vibh1dcKsQf8Readb
 AEJHvkdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKL/Rj+Z1Y035g4dcnETV4f
 AzeGy0dnuYj7Gs68XGu9U01C7fDJWEaGptn9D/zPzyrzzArfXiITGJrvprug4muz0/qrb5bc6L/ LCQA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-55-ardb+git@google.com>
Subject: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

As an intermediate step towards enabling PIE linking for the 64-bit x86
kernel, enable PIE codegen for all objects that are linked into the
kernel proper.

This substantially reduces the number of relocations that need to be
processed when booting a relocatable KASLR kernel.

Before (size in bytes of the reloc table):

  797372 arch/x86/boot/compressed/vmlinux.relocs

After:

  400252 arch/x86/boot/compressed/vmlinux.relocs

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile                 | 11 ++++++++++-
 arch/x86/boot/Makefile            |  1 +
 arch/x86/boot/compressed/Makefile |  2 +-
 arch/x86/entry/vdso/Makefile      |  1 +
 arch/x86/realmode/rm/Makefile     |  1 +
 include/asm-generic/vmlinux.lds.h |  1 +
 6 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b78b7623a4a9..83d20f402535 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -193,13 +193,22 @@ else
         KBUILD_RUSTFLAGS += -Cno-redzone=y
         KBUILD_RUSTFLAGS += -Ccode-model=kernel
 
+        PIE_CFLAGS-y := -fpie -mcmodel=small \
+                        -include $(srctree)/include/linux/hidden.h
+
+        PIE_CFLAGS-$(CONFIG_CC_IS_GCC) += $(call cc-option.-mdirect-extern-access)
+        PIE_CFLAGS-$(CONFIG_CC_IS_CLANG) += -fdirect-access-external-data
+
         ifeq ($(CONFIG_STACKPROTECTOR),y)
                 KBUILD_CFLAGS += -mstack-protector-guard-symbol=fixed_percpu_data
+
+                # the 'small' C model defaults to %fs
+                PIE_CFLAGS-$(CONFIG_SMP) += -mstack-protector-guard-reg=gs
         endif
 
         # Don't emit relaxable GOTPCREL relocations
         KBUILD_AFLAGS_KERNEL += -Wa,-mrelax-relocations=no
-        KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no
+        KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no $(PIE_CFLAGS-y)
 endif
 
 #
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9cc0ff6e9067..4d3ba35cb619 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -57,6 +57,7 @@ KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
+KBUILD_CFLAGS_KERNEL :=
 
 $(obj)/bzImage: asflags-y  := $(SVGA_MODE)
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f2051644de94..c362d36b5b69 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -73,7 +73,7 @@ LDFLAGS_vmlinux += -T
 hostprogs	:= mkpiggy
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
-sed-voffset := -e 's/^\([0-9a-fA-F]*\) [ABCDGRSTVW] \(_text\|__start_rodata\|__bss_start\|_end\)$$/\#define VO_\2 _AC(0x\1,UL)/p'
+sed-voffset := -e 's/^\([0-9a-fA-F]*\) [ABbCDdGRSTtVW] \(_text\|__start_rodata\|__bss_start\|_end\)$$/\#define VO_\2 _AC(0x\1,UL)/p'
 
 quiet_cmd_voffset = VOFFSET $@
       cmd_voffset = $(NM) $< | sed -n $(sed-voffset) > $@
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index c9216ac4fb1e..7af9fecf9abb 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -141,6 +141,7 @@ endif
 endif
 
 $(obj)/vdso32.so.dbg: KBUILD_CFLAGS = $(KBUILD_CFLAGS_32)
+$(obj)/vdso32.so.dbg: KBUILD_CFLAGS_KERNEL :=
 
 $(obj)/vdso32.so.dbg: $(obj)/vdso32/vdso32.lds $(vobjs32) FORCE
 	$(call if_changed,vdso_and_check)
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index a0fb39abc5c8..70bf0a26da91 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -67,3 +67,4 @@ KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
 		   -I$(srctree)/arch/x86/boot
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
+KBUILD_CFLAGS_KERNEL :=
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 2b079f73820f..3a084ac77109 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -349,6 +349,7 @@
 	*(DATA_MAIN)							\
 	*(.data..decrypted)						\
 	*(.ref.data)							\
+	*(.data.rel*)							\
 	*(.data..shared_aligned) /* percpu related */			\
 	*(.data.unlikely)						\
 	__start_once = .;						\
-- 
2.46.0.792.g87dc391469-goog


