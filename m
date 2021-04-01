Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753013512AB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104243.199150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtua-0004z4-14; Thu, 01 Apr 2021 09:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104243.199150; Thu, 01 Apr 2021 09:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtuZ-0004yf-U5; Thu, 01 Apr 2021 09:46:47 +0000
Received: by outflank-mailman (input) for mailman id 104243;
 Thu, 01 Apr 2021 09:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtuZ-0004ya-6A
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:46:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc901f13-5f8e-4bce-96b6-4acdf0a0893d;
 Thu, 01 Apr 2021 09:46:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E513AEB6;
 Thu,  1 Apr 2021 09:46:45 +0000 (UTC)
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
X-Inumbo-ID: cc901f13-5f8e-4bce-96b6-4acdf0a0893d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BW+wzkzMZPCZQCOdltyTqhUeMxSr4FMBEpHB0pwsBlk=;
	b=QA0d1jBVxRK9qyx0STCHg7XtbyTxZB614ga8ZOiQZDa7LJYDb9fpTIVSEgX0wpCAj5Uj/A
	PTMiFHE9C3KtfcDB069FojpWeBMvgco0MXy3CsEtMM9gTspbvzWklIQSyMY3PLvggsg57L
	8s29XUIpgzcdhotAk7necnZHqSNmYUw=
Subject: [PATCH 6/8] x86/EFI: avoid use of GNU ld's --disable-reloc-section
 when possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
Date: Thu, 1 Apr 2021 11:46:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As of commit 6fa7408d72b3 ("ld: don't generate base relocations in PE
output for absolute symbols") I'm feeling sufficiently confident in GNU
ld to use its logic for generating base relocations, which was enabled
for executables at some point last year (prior to that this would have
got done only for DLLs).

GNU ld, seeing the original relocations coming from the ELF object files,
generates different relocation types for our page tables (64-bit ones,
while mkreloc produces 32-bit ones). This requires also permitting and
handling that type in efi_arch_relocate_image().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -120,18 +120,37 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/
 	mv $(TMP) $(TARGET)
 
 ifneq ($(efi-y),)
+
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+
 # Check if the linker supports PE.
 EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
 XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
-CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
-# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
-XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
-                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
-                                 echo --disable-reloc-section))
+
+ifeq ($(XEN_BUILD_PE),y)
+
+# Check if the linker produces fixups in PE by default
+nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+ifeq ($(nr-fixups),2)
+MKRELOC := :
+relocs-dummy :=
+else
+MKRELOC := efi/mkreloc
+relocs-dummy := efi/relocs-dummy.o
+# If the linker produced fixups but not precisely two of them, we need to
+# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
+# recognize the option.
+ifneq ($(nr-fixups),0)
+EFI_LDFLAGS += --disable-reloc-section
+endif
 endif
 
+endif # $(XEN_BUILD_PE)
+
+endif # $(efi-y)
+
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
 
 ifeq ($(CONFIG_LTO),y)
@@ -175,7 +194,7 @@ note.o: $(TARGET)-syms
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
 	rm -f $@.bin
 
-EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 $(XEN_NO_PE_FIXUPS)
+EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0
 EFI_LDFLAGS += --section-alignment=0x200000 --file-alignment=0x20
 EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
 EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
@@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
 endif
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
+ifeq ($(MKRELOC),:)
+$(TARGET).efi: ALT_BASE :=
+else
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
+endif
 
 ifneq ($(build_id_linker),)
 ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
@@ -210,16 +233,16 @@ note_file_option ?= $(note_file)
 ifeq ($(XEN_BUILD_PE),y)
 $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< efi/relocs-dummy.o \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
 	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
-	efi/mkreloc $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
+	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
-	efi/mkreloc $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
+	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
--- a/xen/arch/x86/efi/check.c
+++ b/xen/arch/x86/efi/check.c
@@ -2,3 +2,17 @@ int __attribute__((__ms_abi__)) test(int
 {
     return i;
 }
+
+/*
+ * Populate an array with "addresses" of relocatable and absolute values.
+ * This is to probe ld for (a) emitting base relocations at all and (b) not
+ * emitting base relocations for absolute symbols.
+ */
+extern const unsigned char __image_base__[], __file_alignment__[],
+                           __section_alignment__[];
+const void *const data[] = {
+    __image_base__,
+    __file_alignment__,
+    __section_alignment__,
+    data,
+};
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -86,10 +86,12 @@ static void __init efi_arch_relocate_ima
                 }
                 break;
             case PE_BASE_RELOC_DIR64:
-                if ( in_page_tables(addr) )
-                    blexit(L"Unexpected relocation type");
                 if ( delta )
+                {
                     *(u64 *)addr += delta;
+                    if ( in_page_tables(addr) )
+                        *(u64 *)addr += xen_phys_start;
+                }
                 break;
             default:
                 blexit(L"Unsupported relocation type");


