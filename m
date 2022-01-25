Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEF49B27D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260066.449131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZl-0007uF-9h; Tue, 25 Jan 2022 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260066.449131; Tue, 25 Jan 2022 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZl-0007qC-5H; Tue, 25 Jan 2022 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 260066;
 Tue, 25 Jan 2022 11:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZj-0006Mn-El
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20c40fb2-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:21 +0100 (CET)
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
X-Inumbo-ID: 20c40fb2-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i0oyy+xKuS3Z/jMCxCUhGFl0CUdFaE9LwKV/ozLJibE=;
  b=Pb0JxFlp2eBYMLFeHS+VZENMbK2HPdK7W1C7wLkblVci9SayR5gR8CWi
   AQQIopq68LQ/1Wp24XCmlsOHs8cm5a2G+Qs+q0i0yYg8VqwGWyYAFZRK8
   X6nYI4mehnWKauoebr5uAGytw+Yx0ztfikisLhPxWv3sFgObzOrQbC9Mu
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: M1opyXUW/lY2VsRHvf3fR5MCLALfpOQRo4ZUo3+82t1Pl78MmmwzysVzikFdIaDOAYRjrU406Z
 Z7lE47++FiEzFWSTNziFoN68/X4Z7UMOHSKtGScKNyM/u+9NN0CiAK84OkEzQahvqpymY5pHAs
 cyPjyAEgW/baz6Tl9W4iNNFoTqGjxsyDo5yPMa1WbnoL2ExvEeXcWXUDugB1356xTpNGfVAfO9
 h+H4r4hF3JGw9XDFPFpKtrJ9Mk0WhFm3SOkvx2y6RGm8HhygxmSW/LigRe1iktPwdUIpvzVqoD
 xDRUrnx49vpZER9gSz9Bu7Wq
X-SBRS: 5.2
X-MesageID: 62618927
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ryN2vaKScK8/LrQtFE+Ro5MlxSXFcZb7ZxGr2PjKsXjdYENSgmNTz
 mtJCjiCPvqOYjH3Kd1/PdixpkIDv5XUz9A3SlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2m2PtWw
 cxzjqaBZhUVA5z1o8IDejNXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq2JkeTKyBD
 yYfQSMxUgzGOgRrBgwWOZ4Gl8yC12DTeCIN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2m2orv/Cm2X8Qo16PLe17OJwiVufgGkaEgQLVECTqOO8zEW5Xrp3J
 1QP/ysyrYA77EGxUsTmRBq8vWKFuRgHHdFXFoUS5A6Bx6XO6i6FF2MESXhHc9Vgu8goLRQo3
 FKUm9LiBRR0raaYD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vX3Fiv5x
 zSipS03lbIVy8UM0s2T5kvbijihopzISA8d5QjNWG+hqARja+aNZZGs6FXdxeZNKsCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGBKbqnlmBqcazQWC6UKeTLlrxi9XDkg8Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8ykiwyBBErE0pB
 XuMnS9A514+AL8v8je5Tvx1PVQDlnFnnjO7qXwWIn2aPVuiiJy9FO9t3LimNLlRAEa4TOP9q
 Yo32yyikE03bQEGSnOLmbP/1HhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO19INQ5zvsKyLaZp
 hlRv3O0LnKl2RUrzi3RMhhehE7HB84j/RrXwwRyVbpX55TTSdn2t/pOH3fGVbIm6PZi3ZZJo
 wotIK297gB0Ym2foVw1NMClxKQ7LUjDrV/QY0KNPWZuF7Y9F12h0oK1JWPHqXhRZhdbQONj+
 dVMICuBH8paL+mjZe6LAM+SI6SZ5ChEx7kqDhKWe7G+uizEqeBXFsA4tddvS+lkFPkJ7mbyO
 9++DUhKqO/TjZUy9dWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7A
 xrd+tRTNbiTFtniFVodeFgsYuiZjKlGkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZdPuQKlixcsPtKXtQxu9jyBfi4aTqEqlpAGG4u32AAl/U5PPM7HASjs7ZDRN9gVahs2I
 iWZjbbpjqhHwhaQaGI6EHXA0LYPhZkKvxwWnlYOK07Qx4jAj/4zmhZQ7S42XkJeyRAei7B/P
 W1iNktUI6SS/mg32JgfDj70QwwRVgeE/kHRykcSkDyLRkalYWXBMWkhNLvf50se6W9dImBW8
 bzwJLwJito2kBUdBhcPZHM=
IronPort-HdrOrdr: A9a23:55sZsKB+adQUZb7lHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618927"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 05/30] build: prepare to always invoke $(MAKE) from xen/, use $(obj)
Date: Tue, 25 Jan 2022 11:00:38 +0000
Message-ID: <20220125110103.3527686-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In a future patch, when building a subdirectory, we will set
"obj=$subdir" rather than change directory.

Before that, we add "$(obj)" and "$(src)" in as many places as
possible where we will need to know which subdirectory is been built.
"$(obj)" is for files been generated during the build, and "$(src)" is
for files present in the source tree.

For now, we set both to "." in Rules.mk and Makefile.clean.

A few places don't tolerate the addition of "./", this is because make
remove the leading "./" in targets and dependencies in rules, so these
will be change later.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Notes:
    v8:
    - acked
    - rebased

 xen/Rules.mk                            |  5 ++-
 xen/arch/arm/Makefile                   | 14 ++++----
 xen/arch/x86/Makefile                   | 48 ++++++++++++-------------
 xen/arch/x86/boot/Makefile              | 14 ++++----
 xen/arch/x86/efi/Makefile               |  6 ++--
 xen/common/Makefile                     |  8 ++---
 xen/common/libelf/Makefile              |  4 +--
 xen/common/libfdt/Makefile              |  6 ++--
 xen/include/Makefile                    | 44 +++++++++++------------
 xen/scripts/Makefile.clean              |  5 ++-
 xen/xsm/flask/Makefile                  | 36 +++++++++----------
 xen/xsm/flask/policy/mkaccess_vector.sh |  7 ++--
 12 files changed, 103 insertions(+), 94 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 77d359bedaf8..60d1d6c4f583 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -3,6 +3,9 @@
 # Makefile and are consumed by Rules.mk
 #
 
+obj := .
+src := $(obj)
+
 -include $(BASEDIR)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
@@ -21,7 +24,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
 # The filename build.mk has precedence over Makefile
-include $(firstword $(wildcard build.mk) Makefile)
+include $(firstword $(wildcard $(src)/build.mk) $(src)/Makefile)
 
 # Linking
 # ---------------------------------------------------------------------------
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 14952275772b..c993ce72a341 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -90,18 +90,18 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
+$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -111,13 +111,13 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
 .PHONY: include
 include:
 
-xen.lds: xen.lds.S FORCE
+$(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed,cpp_lds_S)
 
-dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
+$(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
 .PHONY: clean
 clean::
-	rm -f xen.lds
+	rm -f $(obj)/xen.lds
 	rm -f $(BASEDIR)/.xen-syms.[0-9]*
 	rm -f $(TARGET).efi
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a830b5791e8b..db97ae8c07f0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -81,7 +81,7 @@ extra-y += asm-macros.i
 extra-y += xen.lds
 
 ifneq ($(CONFIG_HVM),y)
-x86_emulate.o: CFLAGS-y += -Wno-unused-label
+$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
@@ -112,8 +112,8 @@ syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
 
 $(TARGET): TMP = $(@D)/.$(@F).elf32
-$(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
-	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
+$(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
+	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
 	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
 	od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
 		{ echo "No Multiboot1 header found" >&2; false; }
@@ -123,27 +123,27 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
-note.o: $(TARGET)-syms
+$(obj)/note.o: $(TARGET)-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 \
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
@@ -162,25 +162,25 @@ ifdef SOURCE_DATE_EPOCH
 EFI_LDFLAGS += --no-insert-timestamp
 endif
 
-$(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
+$(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 ifeq ($(MKRELOC),:)
 relocs-dummy :=
 $(TARGET).efi: ALT_BASE :=
 else
-relocs-dummy := efi/relocs-dummy.o
-$(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
+relocs-dummy := $(obj)/efi/relocs-dummy.o
+$(TARGET).efi: ALT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
 ifneq ($(build_id_linker),)
 ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
 CFLAGS-y += -DBUILD_ID_EFI
 EFI_LDFLAGS += $(build_id_linker)
-note_file := efi/buildid.o
+note_file := $(obj)/efi/buildid.o
 # NB: this must be the last input in the linker call, because inputs following
 # the -b option will all be treated as being in the specified format.
 note_file_option := -b pe-x86-64 $(note_file)
 else
-note_file := note.o
+note_file := $(obj)/note.o
 endif
 else
 note_file :=
@@ -189,25 +189,25 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 extra-y += efi.lds
-$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
 	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
@@ -219,14 +219,14 @@ $(TARGET).efi: FORCE
 endif
 
 # These should already have been rebuilt when building the prerequisite of "prelink.o"
-efi/buildid.o efi/relocs-dummy.o: ;
+$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 
 .PHONY: include
 include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
 
-asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
+$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
+$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	echo '#if 0' >$@.new
 	echo '.if 0' >>$@.new
 	echo '#endif' >>$@.new
@@ -240,14 +240,14 @@ $(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
 	echo '#endif' >>$@.new
 	$(call move-if-changed,$@.new,$@)
 
-efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S FORCE
+$(obj)/efi.lds: AFLAGS-y += -DEFI
+$(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed,cpp_lds_S)
 
-boot/mkelf32: boot/mkelf32.c
+$(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
 
-efi/mkreloc: efi/mkreloc.c
+$(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
 
 .PHONY: clean
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d2eb277d428f..0aec8a464364 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,8 +1,8 @@
 obj-bin-y += head.o
 
-DEFS_H_DEPS = defs.h $(BASEDIR)/include/xen/stdbool.h
+DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) video.h \
+CMDLINE_DEPS = $(DEFS_H_DEPS) $(src)/video.h \
 	       $(BASEDIR)/include/xen/kconfig.h \
 	       $(BASEDIR)/include/generated/autoconf.h
 
@@ -14,10 +14,10 @@ RELOC_DEPS = $(DEFS_H_DEPS) \
 	     $(BASEDIR)/include/xen/const.h \
 	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
 
-head.o: cmdline.S reloc.S
+$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
 
-cmdline.S: cmdline.c $(CMDLINE_DEPS) build32.lds
-	$(MAKE) -f build32.mk $@ CMDLINE_DEPS="$(CMDLINE_DEPS)"
+$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
+	$(MAKE) -f build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
 
-reloc.S: reloc.c $(RELOC_DEPS) build32.lds
-	$(MAKE) -f build32.mk $@ RELOC_DEPS="$(RELOC_DEPS)"
+$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
+	$(MAKE) -f build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index abae493bf344..e08b4d8e4808 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -3,16 +3,16 @@ CFLAGS-y += -fshort-wchar
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 
-%.o: %.ihex FORCE
+$(obj)/%.o: $(src)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
-boot.init.o: buildid.o
+$(obj)/boot.init.o: $(obj)/buildid.o
 
 EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-$(EFIOBJ-y): CFLAGS_stack_boundary := $(cflags-stack-boundary)
+$(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
 obj-y := stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 141d7d40d3dc..ca839118e4d1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -75,13 +75,13 @@ obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(BASEDIR)/)$(KCONFIG_CONFIG)
-config.gz: $(CONF_FILE)
+$(obj)/config.gz: $(CONF_FILE)
 	gzip -n -c $< >$@
 
-config_data.o: config.gz
+$(obj)/config_data.o: $(obj)/config.gz
 
-config_data.S: $(BASEDIR)/tools/binfile FORCE
-	$(call if_changed,binfile,config.gz xen_config_data)
+$(obj)/config_data.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
 
 clean::
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index a92326c982e9..8a4522e4e141 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -7,10 +7,10 @@ OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
 
 CFLAGS-y += -Wno-pointer-sign
 
-libelf.o: libelf-temp.o FORCE
+$(obj)/libelf.o: $(obj)/libelf-temp.o FORCE
 	$(call if_changed,objcopy)
 
-libelf-temp.o: $(libelf-objs) FORCE
+$(obj)/libelf-temp.o: $(addprefix $(obj)/,$(libelf-objs)) FORCE
 	$(call if_changed,ld)
 
 extra-y += libelf-temp.o $(libelf-objs)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6bd207cf8ffa..6708af12e583 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,4 +1,4 @@
-include Makefile.libfdt
+include $(src)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
@@ -8,10 +8,10 @@ nocov-y += libfdt.o
 
 CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
 
-libfdt.o: libfdt-temp.o FORCE
+$(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 	$(call if_changed,objcopy)
 
-libfdt-temp.o: $(LIBFDT_OBJS) FORCE
+$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
 	$(call if_changed,ld)
 
 extra-y += libfdt-temp.o $(LIBFDT_OBJS)
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 95daa8a28975..d2f5a956a11a 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -39,57 +39,57 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
+public-$(CONFIG_X86) := $(wildcard $(src)/public/arch-x86/*.h $(src)/public/arch-x86/*/*.h)
+public-$(CONFIG_ARM) := $(wildcard $(src)/public/arch-arm/*.h $(src)/public/arch-arm/*/*.h)
 
 .PHONY: all
-all: $(headers-y)
+all: $(addprefix $(obj)/,$(headers-y))
 
-compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $@ >>$@.new; \
+$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(BASEDIR)/tools/compat-build-header.py
+	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
-compat/%.i: compat/%.c Makefile
+$(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py xlat.lst <$< >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(src)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh $(src)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
 		$(SHELL) $(BASEDIR)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
 	done <$(patsubst compat/%,compat/.xlat/%,$(basename $<)).lst >$@.new
 	mv -f $@.new $@
 
-.PRECIOUS: compat/.xlat/%.lst
-compat/.xlat/%.lst: xlat.lst Makefile
+.PRECIOUS: $(obj)/compat/.xlat/%.lst
+$(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 	mkdir -p $(@D)
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' xlat.lst | uniq)
+xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(src)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) config/auto.conf Makefile
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
 	cat $(filter %.h,$^) >$@.new
 	mv -f $@.new $@
 
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
-all: headers.chk headers99.chk headers++.chk
+all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h) $(public-y))
+PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
 
-PUBLIC_C99_HEADERS := public/io/9pfs.h public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out public/%ctl.h public/xsm/% public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
+PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
 
 public/io/9pfs.h-prereq := string
 public/io/pvcalls.h-prereq := string
 
-headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
@@ -97,7 +97,7 @@ headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
 	done >$@.new
 	mv $@.new $@
 
-headers99.chk: $(PUBLIC_C99_HEADERS) Makefile
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	rm -f $@.new
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
@@ -107,7 +107,7 @@ headers99.chk: $(PUBLIC_C99_HEADERS) Makefile
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
-headers++.chk: $(PUBLIC_HEADERS) Makefile
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
 	rm -f $@.new
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
@@ -116,7 +116,7 @@ headers++.chk: $(PUBLIC_HEADERS) Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
-	      -include stdint.h -include public/xen.h                         \
+	      -include stdint.h -include $(src)/public/xen.h                  \
 	      $(foreach j, $($(i)-prereq), -include c$(j)) -S -o /dev/null -  \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
@@ -126,7 +126,7 @@ endif
 ifeq ($(XEN_TARGET_ARCH),x86_64)
 .PHONY: lib-x86-all
 lib-x86-all:
-	$(MAKE) -C xen/lib/x86 all
+	$(MAKE) -C $(obj)/xen/lib/x86 all
 
 all: lib-x86-all
 endif
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 8582ec35e4da..c3b0681611da 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -3,11 +3,14 @@
 # Cleaning up
 # ==========================================================================
 
+obj := .
+src := $(obj)
+
 clean::
 
 include $(BASEDIR)/scripts/Kbuild.include
 
-include Makefile
+include $(src)/Makefile
 
 # Figure out what we need to clean from the various variables
 # ==========================================================================
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 11c530dcf458..51fd37f6c4d5 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -4,46 +4,46 @@ obj-y += flask_op.o
 
 obj-y += ss/
 
-CFLAGS-y += -I./include
+CFLAGS-y += -I$(obj)/include
 
 AWK = awk
 
-FLASK_H_DEPEND = policy/security_classes policy/initial_sids
-AV_H_DEPEND = policy/access_vectors
+FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
+AV_H_DEPEND = $(src)/policy/access_vectors
 
-FLASK_H_FILES = include/flask.h include/class_to_string.h include/initial_sid_to_string.h
-AV_H_FILES = include/av_perm_to_string.h include/av_permissions.h
-ALL_H_FILES = $(FLASK_H_FILES) $(AV_H_FILES)
+FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
+AV_H_FILES := av_perm_to_string.h av_permissions.h
+ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
 
-$(obj-y) ss/built_in.o: $(ALL_H_FILES)
+$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
 extra-y += $(ALL_H_FILES)
 
-mkflask := policy/mkflask.sh
+mkflask := $(src)/policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
-cmd_mkflask = $(SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
+cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
 
-$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
+$(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
-mkaccess := policy/mkaccess_vector.sh
+mkaccess := $(src)/policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
-cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
+cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
 
-$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
+$(addprefix $(obj)/%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 	$(call if_changed,mkaccess)
 
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
-flask-policy.o: policy.bin
+$(obj)/flask-policy.o: $(obj)/policy.bin
 
-flask-policy.S: BINFILE_FLAGS := -i
-flask-policy.S: $(BASEDIR)/tools/binfile FORCE
-	$(call if_changed,binfile,policy.bin xsm_flask_init_policy)
+$(obj)/flask-policy.S: BINFILE_FLAGS := -i
+$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
 targets += flask-policy.S
 
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
-policy.bin: FORCE
+$(obj)/policy.bin: FORCE
 	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
 	        -C $(XEN_ROOT)/tools/flask/policy \
 	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
index 942ede4713f1..ad9772193bff 100755
--- a/xen/xsm/flask/policy/mkaccess_vector.sh
+++ b/xen/xsm/flask/policy/mkaccess_vector.sh
@@ -8,9 +8,12 @@ set -e
 awk=$1
 shift
 
+output_dir=$1
+shift
+
 # output files
-av_permissions="include/av_permissions.h"
-av_perm_to_string="include/av_perm_to_string.h"
+av_permissions="$output_dir/av_permissions.h"
+av_perm_to_string="$output_dir/av_perm_to_string.h"
 
 cat $* | $awk "
 BEGIN	{
-- 
Anthony PERARD


