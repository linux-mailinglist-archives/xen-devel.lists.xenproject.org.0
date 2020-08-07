Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2823EC88
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 13:32:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k40bb-0007Go-6P; Fri, 07 Aug 2020 11:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k40ba-0007Gj-3X
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 11:32:10 +0000
X-Inumbo-ID: 3eb016cc-7f66-4fd5-a421-6ddd3735d91f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3eb016cc-7f66-4fd5-a421-6ddd3735d91f;
 Fri, 07 Aug 2020 11:32:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59389AFB4;
 Fri,  7 Aug 2020 11:32:26 +0000 (UTC)
Subject: [PATCH v2 1/7] x86/EFI: sanitize build logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
Message-ID: <07e622b4-bb61-08e8-d96c-e770ec7abc53@suse.com>
Date: Fri, 7 Aug 2020 13:32:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With changes done over time and as far as linking goes, the only special
thing about building with EFI support enabled is the need for the dummy
relocations object for xen.gz uniformly in all build stages. All other
efi/*.o can be consumed from the built_in*.o files.

In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
split between obj-y and obj-bin-y.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop a now stale piece of Makefile logic.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -113,28 +113,35 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
 
+# Check if the compiler supports the MS ABI.
+export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+# Check if the linker supports PE.
+XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
+CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
+EFI_OBJS-$(XEN_BUILD_EFI) := efi/relocs-dummy.o
 
 ifeq ($(CONFIG_LTO),y)
 # Gather all LTO objects together
 prelink_lto.o: $(ALL_OBJS)
 	$(LD_LTO) -r -o $@ $^
 
-prelink-efi_lto.o: $(ALL_OBJS) efi/runtime.o efi/compat.o
-	$(LD_LTO) -r -o $@ $(filter-out %/efi/built_in.o,$^)
+prelink-efi_lto.o: $(ALL_OBJS)
+	$(LD_LTO) -r -o $@ $^
 
 # Link it with all the binary objects
-prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
+prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 
-prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o efi/boot.init.o
+prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
-prelink.o: $(ALL_OBJS)
+prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 
-prelink-efi.o: $(ALL_OBJS) efi/boot.init.o efi/runtime.o efi/compat.o
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %/efi/built_in.o,$^)
+prelink-efi.o: $(ALL_OBJS)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 endif
 
 $(TARGET)-syms: prelink.o xen.lds
@@ -171,12 +178,6 @@ EFI_LDFLAGS += --minor-image-version=$(X
 EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
 EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
 
-# Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
-# Check if the linker supports PE.
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
-CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
-
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 
@@ -223,9 +224,6 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
-efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
-efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: ;
-
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -o $@ $<
 
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -14,6 +14,7 @@ $(call cc-option-add,cflags-stack-bounda
 $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
 
 obj-y := stub.o
-obj-$(XEN_BUILD_EFI) := $(EFIOBJ) relocs-dummy.o
-extra-$(XEN_BUILD_EFI) += buildid.o
+obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ))
+obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ))
+extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o


