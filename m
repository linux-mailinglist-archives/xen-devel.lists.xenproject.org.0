Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A149B279
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260062.449084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZb-0006Wz-QF; Tue, 25 Jan 2022 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260062.449084; Tue, 25 Jan 2022 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZb-0006S8-LN; Tue, 25 Jan 2022 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 260062;
 Tue, 25 Jan 2022 11:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZa-0006Mn-3N
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1576b6-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:12 +0100 (CET)
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
X-Inumbo-ID: 1b1576b6-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AnOSnJwU7XBTWsJ/6UnK/xN2yhLgLGPIzUJ+QOu+uf0=;
  b=NMN2vg1SHp0OjgsEniIV4AbxAIxLSgkDolva287hlvlRTJcs7Q65dVP9
   2IljBzGkTST9uMD7B4pcK/FZ1pDKGj9VgVBoRg/zovjb/3omehLLDWY3e
   0GSY3NsmLrafBkIMopA3uZqZokL5Ne9fN3aioptjE951lIjLGU3VGYC08
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PlAjJtaYJiDGtANVh5yBEAeQgHRJjotC05a2vwE4oLKpqGJeFSfO601sBqiXlj7ZYBU36vTOUI
 c4mX3vduYH0mwmsCcC319zy5iB8uK+m4SuaQcbQDmyXZDiALDDJDlTDANJ23IeEUcViTqWaZ4U
 Ri7sl3dc/JpdkMLAl/FHYe3IoB4lj5b7jFphE+AD8jPLTwRVzfDtPYBwYECstchiBM6QQVuCV5
 BkeZ+KrizHhP6qmX3a0T3sb6kjoNJerl5AI81WFjOZB6hnuFYCTI0NTjqFPltN75DZlmsSI8+R
 tZd/25RtlZCDfA4diW1yZC8/
X-SBRS: 5.2
X-MesageID: 62618907
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gt2jD6pSqITHM0oiHQFtd1hNc0VeBmLkYhIvgKrLsJaIsI4StFCzt
 garIBmDOPaDZGLwfIwladm09RgCu5/Sxt42TwJurC88F38V8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncSwEzw4Oq/iosYmfjNqGHh8P4Bnw6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZBHMGo+NEuojxtnEQclNrYjv8uRpEbuSi0AmEmfmrQP2j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZonVmSy2o7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1rrfOliK2OwYvD1QvTx0PFAkHzvjYv9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNP9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyR/HNFBz3ohZPmLy8BhkkeC+F1e5fIVfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMQqLFPWo34wNB/It4wIrKTKuftjU
 Xt8WZ30ZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rNBPRXhXcylTLc2m+qR/K7/YSiI7ST5JNhMk6e57E2CTt/4Lxr6gE
 7DUchIw9WcTclWeeVzVMSgyMe22NXu9xFpiVRER0Z+T8yBLSe6SAG03LfPbpJErq75uy+BaV
 f4Ad5nSC/hDUG2fqT8ccYP8vMppcxHy3VCCOC+sYT4eeZ98RlOWpo+4L1W3rCReXDCqscYeo
 qG70l+JS5Q0WAk/Xt3db+iizg3tsCFFyv5yRUbBPvJaZF7orNpxMyX0g/Jue5MMJBzPyyG0z
 QGTBRtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQDTqm9r+ja
 ONZy+DHHMcGxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLiEZJHlHVoWKFZ3Z+iPz6hJyDzb7PBzK0Tm/i5nurGAVBwKbRWLjSVcKppzMZ8kn
 rh96JJHtVTnh0p4KMuCgwBV63+Ify4JXKgQv50HBJPm11gwwVZYbJ2AUiL77fljsTmX3pXG9
 tNMuJf/ug==
IronPort-HdrOrdr: A9a23:9WEfe6z7WCaENjuDpgdhKrPwEL1zdoMgy1knxilNoHtuA6ilfq
 GV7ZEmPHDP+VUssR0b+OxoW5PvfZq/z+8T3WB5B97LNmTbUQOTXedfBODZsl/d8kPFltK1/J
 0QCpSXV7bLZmSS9/yU3OATKadZ/DD9ysyVuds=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618907"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v9 01/30] build: set XEN_BUILD_EFI earlier
Date: Tue, 25 Jan 2022 11:00:34 +0000
Message-ID: <20220125110103.3527686-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to need the variable XEN_BUILD_EFI earlier.

But a side effect of calculating the value of $(XEN_BUILD_EFI) is to
also to generate "efi/check.o" which is used for further checks.
Thus the whole chain that check for EFI support is moved to
"arch.mk".

Some other changes are made to avoid too much duplication:
    - $(efi-check): Used to avoid repeating "efi/check.*". We don't
      set it to the path to the source as it would be wrong as soon
      as we support out-of-tree build.
    - $(LD_PE_check_cmd): As it is called twice, with an updated
      $(EFI_LDFLAGS).

$(nr-fixups) is renamed to $(efi-nr-fixups) as the former might be
a bit too generic.

In order to avoid exporting MKRELOC, the variable is added to $(MAKE)
command line. The only modification needed is in target "build", the
modification target "$(TARGET)" will be needed with a following patch
"build: avoid re-executing the main Makefile by introducing build.mk".

We can now revert 24b0ce9a5da2, we don't need to override efi-y on
recursion anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - change $(efi-check) to hold the $(basename ) of check.c, and rename
      the variable from $(efi-check-0).
    - unexport MKRELOC, pass it down via command line instead.
    - remove efi-y override which reverts 24b0ce9a5da2
    
    v8:
    - rename to efi-nr-fixups rather than efi-check-relocs
    - use := when assigning variable in makefile when recursive expansion
      isn't needed.
    - no more check of $(efi-y) value for "CFLAGS-$(XEN_BUILD_EFI) +=
      -DXEN_BUILD_EFI".
    
    v7:
    - Do the whole check for EFI support in arch.mk. So efi/check.o is
      produce there and used there, and produce efi/check.efi and use it there.
      Thus avoid the need to repeat the test done for XEN_BUILD_EFI.

 xen/Makefile          |  4 ++--
 xen/arch/x86/Makefile | 46 ++++++-------------------------------------
 xen/arch/x86/arch.mk  | 42 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 1e10d9f68080..f3ff03a7170e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -296,7 +296,7 @@ endif # need-config
 .PHONY: build install uninstall clean distclean MAP
 build install uninstall debug clean distclean MAP::
 ifneq ($(XEN_TARGET_ARCH),x86_32)
-	$(MAKE) -f Rules.mk _$@
+	$(MAKE) -f Rules.mk MKRELOC=$(MKRELOC) _$@
 else
 	echo "*** Xen x86/32 target no longer supported!"
 endif
@@ -404,7 +404,7 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
+	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) MKRELOC=$(MKRELOC) $@
 
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8db4cb98edbb..9fc884813cb5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -121,44 +121,8 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
 
-ifneq ($(efi-y),)
-
-# Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
-# Check if the linker supports PE.
-EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
-# If the above failed, it may be merely because of the linker not dealing well
-# with debug info. Try again with stripping it.
-ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
-EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
-endif
-
-ifeq ($(XEN_BUILD_PE),y)
-
-# Check if the linker produces fixups in PE by default
-nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
-ifeq ($(nr-fixups),2)
-MKRELOC := :
-relocs-dummy :=
-else
-MKRELOC := efi/mkreloc
-relocs-dummy := efi/relocs-dummy.o
-# If the linker produced fixups but not precisely two of them, we need to
-# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
-# recognize the option.
-ifneq ($(nr-fixups),0)
-EFI_LDFLAGS += --disable-reloc-section
-endif
-endif
-
-endif # $(XEN_BUILD_PE)
-
-endif # $(efi-y)
-
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
 
 ifeq ($(CONFIG_LTO),y)
@@ -182,13 +146,13 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
@@ -217,8 +181,10 @@ endif
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 ifeq ($(MKRELOC),:)
+relocs-dummy :=
 $(TARGET).efi: ALT_BASE :=
 else
+relocs-dummy := efi/relocs-dummy.o
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
@@ -250,14 +216,14 @@ endif
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index eea320e618b9..a93fa6d2e4c9 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -60,5 +60,47 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+
+efi-check := arch/x86/efi/check
+
+# Check if the compiler supports the MS ABI.
+XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check).c -o $(efi-check).o,y)
+
+# Check if the linker supports PE.
+EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
+LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
+XEN_BUILD_PE := $(LD_PE_check_cmd)
+
+# If the above failed, it may be merely because of the linker not dealing well
+# with debug info. Try again with stripping it.
+ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
+EFI_LDFLAGS += --strip-debug
+XEN_BUILD_PE := $(LD_PE_check_cmd)
+endif
+
+ifeq ($(XEN_BUILD_PE),y)
+
+# Check if the linker produces fixups in PE by default
+efi-nr-fixups := $(shell $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+
+ifeq ($(efi-nr-fixups),2)
+MKRELOC := :
+else
+MKRELOC := efi/mkreloc
+# If the linker produced fixups but not precisely two of them, we need to
+# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
+# recognize the option.
+ifneq ($(efi-nr-fixups),0)
+EFI_LDFLAGS += --disable-reloc-section
+endif
+endif
+
+endif # $(XEN_BUILD_PE)
+
+export XEN_BUILD_EFI XEN_BUILD_PE
+export EFI_LDFLAGS
+endif
+
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
-- 
Anthony PERARD


