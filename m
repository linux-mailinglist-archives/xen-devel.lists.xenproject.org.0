Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B73690C3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 13:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116196.221839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtbZ-0005vM-MP; Fri, 23 Apr 2021 11:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116196.221839; Fri, 23 Apr 2021 11:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtbZ-0005uw-IA; Fri, 23 Apr 2021 11:04:13 +0000
Received: by outflank-mailman (input) for mailman id 116196;
 Fri, 23 Apr 2021 11:04:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtbY-0005uo-9E
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:04:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60db8bb4-ba7b-4966-9e62-05e671b44324;
 Fri, 23 Apr 2021 11:04:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B153B0D0;
 Fri, 23 Apr 2021 11:04:10 +0000 (UTC)
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
X-Inumbo-ID: 60db8bb4-ba7b-4966-9e62-05e671b44324
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3E4zY1ba3W2J+Wx0AnoEmzDCGCNqdtMSeVue/LO/Frk=;
	b=UXHKBV5YlqGmVQOdZENFX6MBQ856rFAbZRnaQUbP/FNzR8iDTyoqoTNWGPM9Htwx/RSp/d
	SrTV8qP2xIp8rk7koz0dD+aqRMRIt6nJ9WcD+w3b8XchenYvTCCzrt+KgaWgFbz1z4IwOi
	McaKmNytJ+3OREHdB2/pd4EeP27n9S0=
Subject: [PATCH v2 2/3] x86/EFI: keep debug info in xen.efi
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Message-ID: <084ef874-3ef2-cb52-bc4b-3b9d78c826ae@suse.com>
Date: Fri, 23 Apr 2021 13:04:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... provided the linker supports it (which it does as of commit
2dfa8341e079 ["ELF DWARF in PE output"]).

Without mentioning debugging sections, the linker would put them at
VA 0, thus making them unreachable by 32-bit (relative or absolute)
relocations. If relocations were resolvable (or absent) the resulting
binary would have invalid section RVAs (0 - __image_base__, truncated to
32 bits). Mentioning debugging sections without specifying an address
will result in the linker putting them all on the same RVA. A loader is,
afaict, free to reject loading such an image, as sections shouldn't
overlap. (The above describes GNU ld 2.36 behavior, which - if deemed
buggy - could change.)

Make sure our up-to-16Mb padding doesn't unnecessarily further extend
the image.

Take the opportunity and also switch to using $(call ld-option,...).

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comment to linker script.
---
This way we could also avoid discarding .comment for xen.efi.

I'd like to point out that the linking of the debug info takes far
longer than the linking of the "normal" parts of the image. The change
therefore has the downside of slowing down debug builds.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -129,8 +129,14 @@ export XEN_BUILD_EFI := $(shell $(CC) $(
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 # Check if the linker supports PE.
-EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
+EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
+XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
+# If the above failed, it may be merely because of the linker not dealing well
+# with debug info. Try again with stripping it.
+ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
+EFI_LDFLAGS += --strip-debug
+XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
+endif
 
 ifeq ($(XEN_BUILD_PE),y)
 
@@ -235,6 +241,9 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+ifeq ($(CONFIG_DEBUG_INFO),y)
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
+endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
 	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -312,10 +312,70 @@ SECTIONS
     *(.reloc)
     __base_relocs_end = .;
   }
-  /* Trick the linker into setting the image size to exactly 16Mb. */
-  . = ALIGN(__section_alignment__);
-  DECL_SECTION(.pad) {
-    . = ALIGN(MB(16));
+  /*
+   * Explicitly list debug section for the PE output so that they don't end
+   * up at VA 0 which is below image base and thus invalid. Also use the
+   * NOLOAD directive, despite currently ignored by ld for PE output, in
+   * order to record that we'd prefer these sections to not be loaded into
+   * memory.
+   *
+   * Note that we're past _end here, so if these sections get loaded they'll
+   * be discarded at runtime anyway.
+   */
+  .debug_abbrev ALIGN(1) (NOLOAD) : {
+     *(.debug_abbrev)
+  }
+  .debug_info ALIGN(1) (NOLOAD) : {
+    *(.debug_info)
+    *(.gnu.linkonce.wi.*)
+  }
+  .debug_types ALIGN(1) (NOLOAD) : {
+    *(.debug_types)
+  }
+  .debug_str ALIGN(1) (NOLOAD) : {
+    *(.debug_str)
+  }
+  .debug_line ALIGN(1) (NOLOAD) : {
+    *(.debug_line)
+    *(.debug_line.*)
+  }
+  .debug_line_str ALIGN(1) (NOLOAD) : {
+    *(.debug_line_str)
+  }
+  .debug_names ALIGN(4) (NOLOAD) : {
+    *(.debug_names)
+  }
+  .debug_frame ALIGN(4) (NOLOAD) : {
+    *(.debug_frame)
+  }
+  .debug_loc ALIGN(1) (NOLOAD) : {
+    *(.debug_loc)
+  }
+  .debug_loclists ALIGN(4) (NOLOAD) : {
+    *(.debug_loclists)
+  }
+  .debug_ranges ALIGN(8) (NOLOAD) : {
+    *(.debug_ranges)
+  }
+  .debug_rnglists ALIGN(4) (NOLOAD) : {
+    *(.debug_rnglists)
+  }
+  .debug_addr ALIGN(8) (NOLOAD) : {
+    *(.debug_addr)
+  }
+  .debug_aranges ALIGN(1) (NOLOAD) : {
+    *(.debug_aranges)
+  }
+  .debug_pubnames ALIGN(1) (NOLOAD) : {
+    *(.debug_pubnames)
+  }
+  .debug_pubtypes ALIGN(1) (NOLOAD) : {
+    *(.debug_pubtypes)
+  }
+  /* Trick the linker into setting the image size to no less than 16Mb. */
+  __image_end__ = .;
+  .pad ALIGN(__section_alignment__) : {
+    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
   }
 #elif defined(XEN_BUILD_EFI)
   /*


