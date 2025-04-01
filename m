Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8BA77BC0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934112.1335936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMS-0000ov-7u; Tue, 01 Apr 2025 13:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934112.1335936; Tue, 01 Apr 2025 13:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMR-0000iG-Ve; Tue, 01 Apr 2025 13:08:59 +0000
Received: by outflank-mailman (input) for mailman id 934112;
 Tue, 01 Apr 2025 13:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMQ-0008KU-J8
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:58 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e5185f-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:08:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso10569369a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:58 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc16d38e3sm7060814a12.24.2025.04.01.06.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:57 -0700 (PDT)
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
X-Inumbo-ID: 78e5185f-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512937; x=1744117737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfWLQG6h7frzFHFbSmMTlSLAtyeTFMN2ST7SsEhdNzA=;
        b=UsP4WOptdov6oxd3WY8aRQ9XNQo5MA98OlOCErowTJONQbpCGdj778+wbAbk3P9EO1
         ehw0tJ36hEA2+XbZavFByRk2TdlAClZ3nnD80jDAKHNd0ctphwMCRTVpq42B/DWjojy+
         jo/uf4gMvk/2zuIKVbPjhf3u4KFj+IoxQ6z4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512937; x=1744117737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfWLQG6h7frzFHFbSmMTlSLAtyeTFMN2ST7SsEhdNzA=;
        b=n79ZsNyUzEMKdh/hRJLKG3n6eEkhvakiamVZv6AQ/mmSaTSqVBcRVCrFWKvZ5m9nOf
         J2eR9d9cdwWYOWGaTf0Qc4LXb8rhGnt5+rTMhxqNxA558cPwjt8T1QCxjDD9bEnm70yT
         W7qRLNGqQXVjw/Ji9LhkbPYfI3PtO71XQQsdO6zB68Y4bjnl1mDi5MEDnBKPY4otnr32
         ZCPVhOodISkj6B9tAIB2sil9JBR3Ov+eUpOVvt92Kj60/LS1onFE1c+cnn3Hyilmp6oI
         iINhholYqVHhKIHJmvdfujc3/K4rErdfVFrtQ3UqgGayRkfedwwTX3QzYMxbwvtrQat+
         /Gng==
X-Gm-Message-State: AOJu0YwTbhG+bPLHsmNTW0OVBPufCQBvy6fTrw1Wu6kncQFfXHTNPPyk
	rctRiEkNwR32IOxkCbdBjrklk5R2Z/591zUl2UXU+JZ1VMziMTMt3aajeXC6XNt6pVNDpqJltHB
	0
X-Gm-Gg: ASbGncug5Oh6PzBmg2wDgjouUFCvnGdEEwS8LFwzMpIn0efDRJvDrHpqhmtMzEnfqse
	v3Jtk8b0LQAy2b0mQgK1442ovej5i7mjFvF7o4nZQXvPA9EUSoWnizDwcbWPFXRiXrB2m6LHZPF
	jBfDdIV+GtFoZ3wq2fag8TszC5MpGem206Z7J8osZkqItKZXhkijrP43ujTGxklhDD2nVzLpHci
	Kn//oGTfnPnqcmx8wl94a62zzxQP8NEb0uis3rLhJ8XndcrC6EpK8rniXR6QE1nuv2slYKlrbp2
	p9BUia5ZTxErD0H29StQvhwOkgatoFGFyGLoHT+N+MfWuqbG7hkdpFJFLXuI
X-Google-Smtp-Source: AGHT+IFBCFclBJDg35uPgPPiBhTX81NYsoap5Pfs68kxM6wnIjcu3k+NCH+4yhuhaKAXVWCJOl7MEg==
X-Received: by 2002:a05:6402:1d4d:b0:5ed:921a:ded6 with SMTP id 4fb4d7f45d1cf-5edfd1242ecmr11615211a12.18.1743512937276;
        Tue, 01 Apr 2025 06:08:57 -0700 (PDT)
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
Subject: [PATCH v2 05/11] xen: remove -N from the linker command line
Date: Tue,  1 Apr 2025 15:08:34 +0200
Message-ID: <20250401130840.72119-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's unclear why -N is being used in the first place.  It was added by
commit 4676bbf96dc8 back in 2002 without any justification.

When building a PE image it's actually detrimental to forcefully set the
.text section as writable.  The GNU LD man page contains the following
warning regarding the -N option:

> Note: Although a writable text section is allowed for PE-COFF targets, it
> does not conform to the format specification published by Microsoft.

Remove the usage of -N uniformly on all architectures, assuming that the
addition was simply done as a copy and paste of the original x86 linking
rune.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


