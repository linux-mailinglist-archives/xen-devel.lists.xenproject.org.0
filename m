Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B345DB63
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231216.400019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzY-0001Sc-3K; Thu, 25 Nov 2021 13:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231216.400019; Thu, 25 Nov 2021 13:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzX-0001NV-RH; Thu, 25 Nov 2021 13:40:47 +0000
Received: by outflank-mailman (input) for mailman id 231216;
 Thu, 25 Nov 2021 13:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzV-0007NX-Pl
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489119eb-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:43 +0100 (CET)
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
X-Inumbo-ID: 489119eb-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+DoWpOrefy3bHbiRl5UkcJKrpDvZ4sPNeqaYR9dgkv4=;
  b=WSwm5w6TDp7FLQxhr/edNBrRlwO/jFdGWVuQ9DrF8qwl1A3PNKz7dWvM
   hr/VkKpbeZjUa/jH1ok7bgS/ufeYSZ+oLRN/SoVbtgHZygyM78Z1AwVoi
   yEmfsGLNwphIAHXxDRzHJlkwiVTrS/rwAtCFNxc17nCwhODBdG9cFJe9j
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5SAE3Vdl+VXpcPW9+Tcu0tse76XkPGg7nmppH5xQjGlyzo8CWDvUh5KhCI1YkpWKvwxXU6NYOm
 zheUzYseNFauf97cUhDaJrG9Yuoa5g9LJ37icMMdnpxaH6VrFbJo9PY9sK/K+cJLUk1l9XFjY7
 OWuXxNGs0fyVlv2cGWsdWZtGF8v3sllIeypFnZgCQB4i5qCz6/UhbcMw/Li+xQfOtEgPrK0iWz
 PiykNjzE81XebA1g6rXRWTsN4yW2ZaF/Pj3L5Ny03noHhRDT+FzttF3O3ThkZF509nrWsE2yLm
 2IoF8/le0beND+pFaUgpLKEx
X-SBRS: 5.1
X-MesageID: 60634096
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:li7D1awx9xALB9RWkl96t+dRwCrEfRIJ4+MujC+fZmUNrF6WrkUDz
 jcZCGnXafzYYWPxctslaYiyphtVusfRm9FnTApqrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8ksw
 vZJnML3cxw0EKzuyfUNSRh1NAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JgQRqqGN
 pRxhTxHRTDLUyZNOE0sEbkmkOa1iX7bdz1EgQfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEmevnjS79HoUIG9WQ/PNwnEeawGBVDRQMTEa6utGwkEv4UNVaQ
 2QY4jErrLQy3EWzQ8PhQgajp3qZoh8bXcEWGOo/gCmBxabZ7ByQLnQVRT5GLto9vYk5QiJC/
 l2Dks7tBDdvmKaIUn/b/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTDvw
 RiaoS4mnbIRgMUXkaKh8jjvmCmwr5LESgo04AT/XW+/6A59Iom/aOSA60Xf7PtGBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqUcyFbol3mrqwWW+U4FysSBuPkZEFe9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWB1yflnU
 ap3Z/pAGprz5U5P6DOtD9kQ3rYwrszV7TOCHMurp/hLPFf3WZJ0dVvnGAfRBgzaxPndyOkwz
 zq4H5HXoyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPmux+JN01z/UPyLagE
 pSBtqhwkgSXuJE6AV/SNiALhE3HAf6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg/N0KXEn63mqmYnv6CAXTirY9HmQlDPe/JVCxnMTPZwLq3fYDT
 0qIilmGHMFdHls6V647qpuHljuMgJTUo8oqN2OgHzWZUByEHFFCJ3Ojg/kpDdsLLBmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmU+syInSP0cRVmLdKw7tV5Vm/V
 k6Vo4EIMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBwLbReWiSFbIL9kC68fw
 L8s6JwM9giyqhs2KdLa3CpawHuBcy4bWKI9u5BEXIKy0lg3yktPaID3AzPt5M3dcM1FN0QnL
 2PGhKfGgLgAlEPOf2BqSCrI1OtZw58PpApL3BkJIFHQwojJgfo+3Rtw9zUrT1sKkkUbgrwrY
 mU7ZVdoIaiu/itzgJkRVm+hLAhNGRmF9xGj0FAOjmDYExGlW2GlwLfR4gpREJT1K15hQwU=
IronPort-HdrOrdr: A9a23:ZHX7Q61A/aZmQnHHy9KgcQqjBTdyeYIsimQD101hICG9Lfbo9f
 xGzc5rtiMc1gxwZJh5o6H/BEBEewKvyXcH2/hhAV7CZmfbUQSTXftfBOfZslrd8mjFh5FgPM
 RbAudD4b/LfCVHZK/BiWHSeblAsbz3lJxEnd2z854ud3AXV0gJ1XY7Nu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVwUu2LQlMCUuT/uduOsJ79exYJCz4LgTP+zA+A2frRFRWV4wkZaihIy7s562
 TJ+jaJpplLh8vLiCM0mlWjt6i/V7Pau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXq01oumM
 mkmWZqAywmgUm9QkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimhsdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGeFsRLQkjRNo+ao7bX7HAcEcYb
 RT5fjnlaxrmIahHi/kVmoG+q3lYp18JGbJMxs/Ugr86UkSoJkz9Tpp+CUlpAZ1yHrmI6M0o9
 gsep4Y542mbvVmK56VV91xGPde/AT2MF/x2Fz7GyWQKEnxU0i94aIfpo9Fv92CeJsGyoY/kp
 WEUF4wjx90R6veM7zG4HQQyGG5fIyUZ0Wb9v1j
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634096"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 08/47] build: prepare to always invoke $(MAKE) from xen/, use $(obj)
Date: Thu, 25 Nov 2021 13:39:27 +0000
Message-ID: <20211125134006.1076646-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
index b469ec8f2452..f9af39ba6138 100644
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
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
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
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
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
index 87b927ed865b..ac815f02cb5e 100644
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
-$(EFIOBJ-y): CFLAGS-stack-boundary := $(cflags-stack-boundary)
+$(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS-stack-boundary := $(cflags-stack-boundary)
 
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


