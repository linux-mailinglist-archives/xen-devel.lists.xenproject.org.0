Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B8A77E29
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934504.1336191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzctS-0001SK-By; Tue, 01 Apr 2025 14:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934504.1336191; Tue, 01 Apr 2025 14:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzctS-0001Px-98; Tue, 01 Apr 2025 14:47:10 +0000
Received: by outflank-mailman (input) for mailman id 934504;
 Tue, 01 Apr 2025 14:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzctQ-0001L3-Dn
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:47:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eaf8b27-0f08-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:47:06 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so454408f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:47:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66a96dsm14091348f8f.44.2025.04.01.07.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 07:47:05 -0700 (PDT)
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
X-Inumbo-ID: 2eaf8b27-0f08-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743518826; x=1744123626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1ng98cg6r0EpaZ0hRdZSynFb1XZuzv1vYF46lpGdfU=;
        b=wFtIsmytnUIbr+D4iM406rxPBUtra3qRwjbGQ1A0wQkWKvkA2HIN/fNxRnBGsVPgWi
         fBc5hojjIHO9lbuICyO+5x1q5mm9GFi61nFT8NzgMq2vn3XKqnSVOSl62/DOLrDNU5No
         h0v/99CRAXTW4gAxe+RFNREQKlaRapTOKCjUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518826; x=1744123626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1ng98cg6r0EpaZ0hRdZSynFb1XZuzv1vYF46lpGdfU=;
        b=wQU77hKnrOlu0r6BBsNpnGrFIf+gISY25Dmnk2zCNA35XjvUohVUAnsWh08Vpr6zHV
         ZIZMDmeKVlMEApwfb5HsdO67oiVS8j6owXQtMVIV0NCK6Y5r0zjqYl0oCcVj4uxqTF2u
         iY7amC3QHnAT15tXP9exbHi9pZ0TMMIuNcXJlxjcoymdC2MhxlCOb1J2MjxWJb7DA3Mn
         MGlHWZhx9EPL3SMijIWZF4AfqnQHtMZIN+gQjUzrUX9YgbLVuAOVwXgMYgMxwgcuR+lU
         6WXy2vaoOCMScm98CTO58KJfWC6KzEQuQy6XZ9ATUgM8w7aM1Xsd2TmAdNWtNuGxieqM
         ZK0g==
X-Gm-Message-State: AOJu0Yxhl4nhHGLGWPacd60LuP/RE4TgKHI0EGmnf2FNlgzHfRsfyR4F
	RcB5kKU28sKaIKZWC6mkk8cD3eJhD/ZYnf2QF6tjf17zVkvxcoQIw8RMM2sS9xje6Se2OpO6GL+
	WvXw=
X-Gm-Gg: ASbGncs5E23/Rre6dYxxyZD6iwq4R+1yjPGpI8+zpRI3XvMZSiXII0tqC6zvEhFArFT
	4qQ6Jt6bYRCDP7Boq/DkucBFp+LzclWNI2EjvA+12eJYXcaB8vAfKJrp1kMUvw4Ln58gChlFUdb
	nMTgWZTtQeAr2uuBTY3OY5i/EOF2Fg77f9LvCuVv+4AlvY3nGwSLf0NjSqYe+0uL7E/NLE+6rYG
	FL00uNPPHyYhowKtUlsfu4/XR94KQk9oH5a/y7rxKev1UMm+mnv9H+0ajoQIHMIlKOaSogcY02f
	NkiLphX6gMpjKggYOrjHaWMCWi8OAHl4/Dj7XpLxhV+qjqILtDMYvcuLRPhmWdVzo1/6YYnkrRl
	y5JY28f8BojVjVqjXuw==
X-Google-Smtp-Source: AGHT+IFpPFkWRyeQp3pd7RYDaNWk6Aj7tRtunrZmPS+65o57D8DsP9c6hEky4TvxrottFPKWuuq01Q==
X-Received: by 2002:a5d:47c1:0:b0:391:2995:5ef2 with SMTP id ffacd0b85a97d-39c12114e24mr10673851f8f.37.1743518825863;
        Tue, 01 Apr 2025 07:47:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/arch: Simplify $(TARGET)-syms rule
Date: Tue,  1 Apr 2025 15:47:03 +0100
Message-Id: <20250401144703.961836-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In all cases, "-T $(obj)/xen.lds" can be factored out by appending to
XEN_LDFLAGS.  This takes the $(LD) commands from multi-line to single-line.

x86 uses $(build_id_linker) for all links, so factor that out too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This is based on top of Roger's "xen: remove -N from the linker command line".

x86 might want to follow ARM's lead and only use $(build_id_linker) on the
final link.  It also wants extending to PPC/RISC-V

$(orphan-handling-y) needs making common and using ouside of x86 too.
---
 xen/arch/arm/Makefile   | 10 ++++------
 xen/arch/ppc/Makefile   | 10 ++++------
 xen/arch/riscv/Makefile | 10 ++++------
 xen/arch/x86/Makefile   | 10 ++++------
 4 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 129a109d6ec5..811adf3567c4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -96,21 +96,19 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
+$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(dot-target).0.o -o $(dot-target).1
+	$(LD) $(XEN_LDFLAGS) $< $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	$(LD) $(XEN_LDFLAGS) $< $(build_id_linker) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index cf27bcebb25a..9ba23ecfff7e 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -11,21 +11,19 @@ obj-y += tlb-radix.o
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
 
+$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(dot-target).0.o -o $(dot-target).1
+	$(LD) $(XEN_LDFLAGS) $< $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	$(LD) $(XEN_LDFLAGS) $< $(build_id_linker) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 516f5d505ca8..92e084db91a2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -15,21 +15,19 @@ obj-y += vm_event.o
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
+$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(dot-target).0.o -o $(dot-target).1
+	$(LD) $(XEN_LDFLAGS) $< $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	$(LD) $(XEN_LDFLAGS) $< $(build_id_linker) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c2f1dcf301d6..b5227aeabb81 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -138,21 +138,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
+$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds $(build_id_linker)
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).0.o -o $(dot-target).1
+	$(LD) $(XEN_LDFLAGS) $< $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(orphan-handling-y) $(dot-target).1.o -o $@
+	$(LD) $(XEN_LDFLAGS) $< $(orphan-handling-y) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map

base-commit: debe8bf537ec2c69a4734393cd2b0c7f57f74c0c
prerequisite-patch-id: 7911818c8833f061c9476332975b9aecb69bc26d
-- 
2.39.5


