Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84568A67B0E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919607.1324029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarV-0006bl-Nd; Tue, 18 Mar 2025 17:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919607.1324029; Tue, 18 Mar 2025 17:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarV-0006Z1-KG; Tue, 18 Mar 2025 17:36:21 +0000
Received: by outflank-mailman (input) for mailman id 919607;
 Tue, 18 Mar 2025 17:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarT-00060R-MJ
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:19 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f7a932c-041f-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:36:18 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3012885752dso5851081a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-301539ee99fsm8508710a91.20.2025.03.18.10.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:16 -0700 (PDT)
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
X-Inumbo-ID: 7f7a932c-041f-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319377; x=1742924177; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afzNQQfyUFyqOTFTLz1B2r9ofknuhIv9O17Klkth97o=;
        b=lifBCOgDLXmXzjieJwzXM8i07p6tXolTF/L0smXhkJEn+eVv7FkL9NHdLPjwoxXeoN
         XwSz9vC48vnhlQl/A20A2O8juB8e2b6HEhEMtR4cs+nyPNoBBi7ETaNzDPQTa1ZjpRru
         UOI89PebaXPFIhoKrXXOvN7VixvX8MXU35seY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319377; x=1742924177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afzNQQfyUFyqOTFTLz1B2r9ofknuhIv9O17Klkth97o=;
        b=sRhZT0hVZCMbHEEe6HGmi3i5TjTSOeQ59gce52NZSWIQ5KIQ/8IrMLCb1e92zzIyjm
         Lrs/dOi+inY6XW1SePBzxHukkVKD3Ojts6geLO2gFgXYNJP7F0CZyK6rYKn+Y5dx/DOH
         xUH72rC+NRfw1UOIEFckkofILmc3ehdgzlf7lnau0XKqFdOU1sGgqhHLHQ0nvshD++VG
         5BJ/CliAwrMFFR5Dgy4R47yTlG50kOV2aGmGE7+5cM8g4ccOKTH5ctD5A6Cw09CsaT1Z
         ZlVOzV4CRW0dlQAUasfM40pyByf05TLsyIJU9+MsTfkVkc9kd32FEp0gET1iuatjPVle
         lU6g==
X-Gm-Message-State: AOJu0YwzmQksfW3ccDnUAYT1NPTZ1HKJMNCRUQBuHSA78KmL/K68WgTQ
	dljtC8XPRf2qNICmEonSv1XoNKe4qE2iusMu+br+bj4lw2fAtQGugsjTDcTI1vt/DZ63Z8uHZE6
	4
X-Gm-Gg: ASbGnculEn9axSnoK9r5ztk2A5WeVjg7vqCzRKfwmYJLmgYsb7nh1ykJRmf/CerdIzH
	CpuRTeLOt8L5z/FJTscvTa2ccBjiNY3xx4cZ3wUaEOQhrRIjNUFkHjGyzRuxofWSnjLLycZr8eZ
	4dCrjxmEwVIjFEjOdexbbErikNTCPZuG6F1LSfteeMeqwVxRE2mboDd9VBDnMvI70Xd2rn66WgT
	TVH29vC3/cJRFNkIyVdDeP3N1uCSSyPCN6kudM/2WjXoXP4ELwS0/SK9Sc7UX/l6+idwCXR5ONg
	X39ehtCnXyftu1Otg2UohtSB/rKqD8hG1j3BMDy9Hn4N6B8QEQ==
X-Google-Smtp-Source: AGHT+IESs8x8IkAZxLTS2lTF0bIBzqhtjNgD7seROnQX8yskfy18JdOKC2rIeOv3cDoBuyZ2imJPkg==
X-Received: by 2002:a17:90b:2685:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-301a5b9615amr4801160a91.35.1742319376826;
        Tue, 18 Mar 2025 10:36:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/7] xen: remove -N from the linker command line
Date: Tue, 18 Mar 2025 18:35:43 +0100
Message-ID: <20250318173547.59475-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's unclear why -N is being used in the first place.  It was added by
commit 40828c657dd0c back in 2004 without any justification.

When building a PE image it's actually detrimental to forcefully set the
.text section as writable.  The GNU LD man page contains the following
warning regarding the -N option:

> Note: Although a writable text section is allowed for PE-COFF targets, it
> does not conform to the format specification published by Microsoft.

Remove the usage of -N uniformly on all architectures, assuming that the
addition was simply done as a copy and paste of the original x86 linking
rune.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/Makefile   |  6 +++---
 xen/arch/ppc/Makefile   |  6 +++---
 xen/arch/riscv/Makefile |  6 +++---
 xen/arch/x86/Makefile   | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4837ad467a06..129a109d6ec5 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -97,19 +97,19 @@ ifeq ($(CONFIG_ARM_64),y)
 endif
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 655d212f6687..cf27bcebb25a 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -12,19 +12,19 @@ $(TARGET): $(TARGET)-syms
 	cp -f $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index b0c8270a9947..516f5d505ca8 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -16,19 +16,19 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fdd0..c2f1dcf301d6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -139,19 +139,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(orphan-handling-y) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -212,7 +212,7 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
 	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
 	                -o $(dot-target).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
@@ -222,7 +222,7 @@ endif
 		> $(dot-target).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< \
 	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
 	                -o $(dot-target).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
@@ -231,7 +231,7 @@ endif
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $@ \
-- 
2.48.1


