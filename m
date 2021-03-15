Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B133B4B4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98027.185880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnOw-0004fx-6O; Mon, 15 Mar 2021 13:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98027.185880; Mon, 15 Mar 2021 13:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnOw-0004fY-2h; Mon, 15 Mar 2021 13:36:54 +0000
Received: by outflank-mailman (input) for mailman id 98027;
 Mon, 15 Mar 2021 13:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLnOu-0004fR-Q1
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:36:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30edc4db-3a29-46af-8724-30dfb3be76d5;
 Mon, 15 Mar 2021 13:36:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1F4DAE15;
 Mon, 15 Mar 2021 13:36:49 +0000 (UTC)
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
X-Inumbo-ID: 30edc4db-3a29-46af-8724-30dfb3be76d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615815410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzV566CCmb8PhJv0y/Ywr9jy92JK01zrOmtc5+tgWjc=;
	b=Tmi8V83ipnb14Ub/SIMltcQeIb8OObUgBnaTCFKx9bxWKje6wNWMnsWCC2GAfdJduMDyY9
	wNQcS/7qUyve0mhzgb1CQH0KoFQCLiQ0A66KYFyO1NTCYDIDvPTKI+N9ZgjEcbZd2Efjji
	X06LtB9Kb479QWCae9SFduLXP/Vvbvw=
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
Date: Mon, 15 Mar 2021 14:36:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 01:51, Bobby Eshleman wrote:
> From: Daniel Kiper <daniel.kiper@oracle.com>
> 
> This patch introduces xen.mb.efi which contains a manually built PE
> header.
> 
> This allows us to support Xen on UEFI Secure Boot-enabled hosts via
> multiboot2.
> 
> xen.mb.efi is a single binary that is loadable by a UEFI loader or via
> the Multiboot/Multiboot2 protocols.

What's missing here yet very important is why the existing xen.efi
doesn't fit and can't be made fit.

> Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> ---

Besides (or instead of) the series-wide change log, please have
per-patch changes info here.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -266,29 +266,31 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  
> +define install_xen_links
> +	$(INSTALL_DATA) $(TARGET)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION)$1
> +	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION)$1
> +	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION)$1
> +	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)$1
> +endef

If you abstract this away, please take the opportunity to fold
"-f -s" into a single option.

>  .PHONY: _install
>  _install: D=$(DESTDIR)
>  _install: T=$(notdir $(TARGET))
>  _install: Z=$(CONFIG_XEN_INSTALL_SUFFIX)
>  _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  	[ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)
> -	$(INSTALL_DATA) $(TARGET)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION)$(Z)
> -	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION)$(Z)
> -	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION)$(Z)
> -	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)$(Z)
> +	$(call install_xen_links,$(Z))
> +	$(call install_xen_links,.mb.efi)

This is common code, so will affect Arm as well. I don't think
your addition can be unconditional.

>  	[ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)
>  	$(INSTALL_DATA) $(TARGET)-syms $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION)
>  	$(INSTALL_DATA) $(TARGET)-syms.map $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION).map
>  	$(INSTALL_DATA) $(KCONFIG_CONFIG) $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION).config
>  	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
>  		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
> -		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
>  		if [ -e $(TARGET).efi.map ]; then \
>  			$(INSTALL_DATA) $(TARGET).efi.map $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map; \
>  		fi; \
> -		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
> -		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
> -		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
> +		$(call install_xen_links,.efi)) \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \

Since this part of the patch is a non-negligible fraction of the
patch and since this installation step doesn't need to be an
integral part of the change, may I suggest / ask that you split
this off into a separate change? Possibly the installing of the
new binary could remain here, but then the breaking out of the
install_xen_links macro (which imo also would better use dashes
in place of the underscores) could still be factored out.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -110,7 +110,7 @@ syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>  
>  $(TARGET): TMP = $(@D)/.$(@F).elf32
> -$(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
> +$(TARGET): $(TARGET).mb.efi $(TARGET)-syms $(efi-y) boot/mkelf32

While perhaps mostly cosmetic, I'd prefer additions to be done
after the existing (pseudo-)dependencies, not as the very first
item. $(TARGET)-syms still is the main dependency here, and it
should remain this way.

Speaking of (pseudo-)dependencies - I was hoping that we could
avoid further extending this sub-optimal approach.

> @@ -119,6 +119,11 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
>  		{ echo "No Multiboot2 header found" >&2; false; }
>  	mv $(TMP) $(TARGET)
>  
> +$(TARGET).mb.efi: $(TARGET)-syms
> +	$(OBJCOPY) -O binary -S --change-section-address \
> +		".efi.pe.header-`$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __image_base__$$/0x\1/p'`" \
> +		$(TARGET)-syms $(TARGET).mb.efi

The quoting is very hard to follow here. While using the shell's
$() would already seem to be an improvement, I don't see why you
shouldn't be able to have make construct the tail of the section
name by using $(shell ...). This way, in case of someone needing
to debug this, the resulting command line would be more explict.

I have to admit I could also do with a few words in the
description as to what this playing with a specific section's
address is actually needed for, and how it's guaranteed that
this isn't going to end in confusion (e.g. because of trying to
put the section at where other stuff is already sitting, perhaps
just partially). It's also unclear to me why the new address is
calculated by subtracting the image base address. The PE file
header is, aiui, assumed to live at RVA 0, i.e. precisely at the
image base.

Further - why the -S? xen.efi comes with a proper symbol table.

And finally I'm not convinced of it being a good idea to use
__image_base__ here - that symbol exists only to help the linker
script cover both ELF and PE binaries. It would be good is new
road blocks towards eliminating this crutch could be avoided.
Can't you e.g. get the main program header's specified address
and subtract XEN_IMG_OFFSET?

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -7,6 +7,8 @@ CFLAGS += -I$(BASEDIR)/include
>  CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
>  CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
>  CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
> +CFLAGS += -DXEN_LOAD_ALIGN=XEN_IMG_OFFSET
> +CFLAGS += -DXEN_FILE_ALIGN=0x20

The former is merely coincidence - I don't think you want to
use an offset value as alignment. For both of them I think once
you go this far, you also want to consolidate with xen.efi's
--section-alignment= and --file-alignment= settings, such that
the values don't need to be kept in sync "manually".

What I could see is deriving XEN_IMG_OFFSET from a
hypothetical XEN_SECTION_ALIGN value, because we indeed want
the first section (.text) to start at the 2nd large page from
the image base.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -1,3 +1,4 @@
> +#include <xen/compile.h>
>  #include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
>  #include <public/xen.h>

Why?

> --- /dev/null
> +++ b/xen/arch/x86/boot/pecoff.S
> @@ -0,0 +1,123 @@
> +#include <xen/compile.h>
> +#include <asm/page.h>
> +
> +#define sym_offs(sym)     ((sym) - __XEN_VIRT_START)
> +
> +        .section .efi.pe.header, "a", @progbits
> +
> +GLOBAL(efi_pe_head)

I don't think this should be global. But I'll also comment on the
linker script part using it. In any event there you only care
about efi_pe_head - efi_pe_head_end, i.e. the size of this section.
Linker scripts have SIZEOF() for this purpose - is it not possible
to use that here?

> +        /*
> +         * Legacy EXE header.
> +         *
> +         * Most of it is copied from binutils package, version 2.30,
> +         * include/coff/pe.h:struct external_PEI_filehdr and
> +         * bfd/peXXigen.c:_bfd_XXi_only_swap_filehdr_out().
> +         *
> +         * Page is equal 512 bytes here.
> +         * Paragraph is equal 16 bytes here.

"is equal" is not very clear imo. How about '"Page" refers to an
aligned block of 512 bytes here'?

> +         */
> +        .short  0x5a4d                               /* EXE magic number. */
> +        .short  0x90                                 /* Bytes on last page of file. */
> +        .short  0x3                                  /* Pages in file. */
> +        .short  0                                    /* Relocations. */
> +        .short  0x4                                  /* Size of header in paragraphs. */
> +        .short  0                                    /* Minimum extra paragraphs needed. */
> +        .short  0xffff                               /* Maximum extra paragraphs needed. */
> +        .short  0                                    /* Initial (relative) SS value. */
> +        .short  0xb8                                 /* Initial SP value. */
> +        .short  0                                    /* Checksum. */
> +        .short  0                                    /* Initial IP value. */
> +        .short  0                                    /* Initial (relative) CS value. */
> +        .short  0x40                                 /* File address of relocation table. */
> +        .short  0                                    /* Overlay number. */
> +        .fill   4, 2, 0                              /* Reserved words. */
> +        .short  0                                    /* OEM identifier. */
> +        .short  0                                    /* OEM information. */
> +        .fill   10, 2, 0                             /* Reserved words. */
> +        .long   Lpe_header - efi_pe_head             /* File address of the PE header. */
> +
> +Lpe_header:

Was this meant to have a leading '.' (also again further down)?
Else I don't see what the uppercase L is about.

> +        /*
> +         * PE/COFF header.
> +         *
> +         * The PE/COFF format is defined by Microsoft, and is available from
> +         * https://docs.microsoft.com/en-us/windows/win32/debug/pe-format
> +         *
> +         * Some ideas are taken from Linux kernel and Xen ARM64.
> +         */
> +        .ascii  "PE\0\0"                             /* PE signature. */
> +        .short  0x8664                               /* Machine: IMAGE_FILE_MACHINE_AMD64 */
> +        .short  1                                    /* NumberOfSections. */

So like in xen-syms / xen.gz everything gets munged into a
single section? Not very nice, I would say.

> +        .long   XEN_COMPILE_POSIX_TIME               /* TimeDateStamp. */

This wants to honor SOURCE_DATE_EPOCH (where for xen.efi we
pass --no-insert-timestamp to the linker). Perhaps a missed
re-base?

> +        .long   0                                    /* PointerToSymbolTable. */
> +        .long   0                                    /* NumberOfSymbols. */
> +        .short  Lsection_table - Loptional_header      /* SizeOfOptionalHeader. */

Nit: Too many blanks before the comment.

> +        .short  0x226                                /* Characteristics:
> +                                                      *   IMAGE_FILE_EXECUTABLE_IMAGE |
> +                                                      *   IMAGE_FILE_LARGE_ADDRESS_AWARE |
> +                                                      *   IMAGE_FILE_DEBUG_STRIPPED |
> +                                                      *   IMAGE_FILE_LINE_NUMS_STRIPPED
> +                                                      */

You don't specify IMAGE_FILE_RELOCS_STRIPPED here, but you also
don't seem to generate base relocations. How is this going to
work?

> +Loptional_header:
> +        .short  0x20b                                /* PE format: PE32+ */
> +        .byte   0                                    /* MajorLinkerVersion. */
> +        .byte   0                                    /* MinorLinkerVersion. */
> +        .long   __2M_rwdata_end - efi_pe_head_end    /* SizeOfCode. */
> +        .long   0                                    /* SizeOfInitializedData. */
> +        .long   0                                    /* SizeOfUninitializedData. */

Everything's code?

> +        .long   sym_offs(efi_mb_start)               /* AddressOfEntryPoint. */
> +        .long   sym_offs(start)                      /* BaseOfCode. */
> +        .quad   sym_offs(__image_base__)             /* ImageBase. */

This last value is zero, isn't it? Can a PE image validly live
at address 0? I have to admit that I question all of the
sym_offs() uses here and below, which goes along with the lack
of base relocations mentioned above.

> +        .long   XEN_LOAD_ALIGN                       /* SectionAlignment. */
> +        .long   XEN_FILE_ALIGN                       /* FileAlignment. */
> +        .short  2                                    /* MajorOperatingSystemVersion. */
> +        .short  0                                    /* MinorOperatingSystemVersion. */
> +        .short  XEN_VERSION                          /* MajorImageVersion. */
> +        .short  XEN_SUBVERSION                       /* MinorImageVersion. */
> +        .short  2                                    /* MajorSubsystemVersion. */
> +        .short  0                                    /* MinorSubsystemVersion. */
> +        .long   0                                    /* Win32VersionValue. */
> +        .long   __pe_SizeOfImage                     /* SizeOfImage. */

I'm not convinced of the utility of how you calculate this
value just to use it here. Right now the value has to be
MB(16) - any smaller value will cause breakage.

> +        .long   efi_pe_head_end - efi_pe_head        /* SizeOfHeaders. */
> +        .long   0                                    /* CheckSum. */
> +        .short  0xa                                  /* Subsystem: EFI application. */
> +        .short  0                                    /* DllCharacteristics. */
> +        .quad   0                                    /* SizeOfStackReserve. */
> +        .quad   0                                    /* SizeOfStackCommit. */
> +        .quad   0                                    /* SizeOfHeapReserve. */
> +        .quad   0                                    /* SizeOfHeapCommit. */
> +        .long   0                                    /* LoaderFlags. */
> +        .long   0x6                                  /* NumberOfRvaAndSizes. */
> +
> +        /* Data Directories. */
> +        .quad   0                                    /* Export Table. */
> +        .quad   0                                    /* Import Table. */
> +        .quad   0                                    /* Resource Table. */
> +        .quad   0                                    /* Exception Table. */
> +        .quad   0                                    /* Certificate Table. */
> +        .quad   0                                    /* Base Relocation Table. */

Based on what was the number of directory entries chosen here?
6 is a pretty unusual value - typically it would be 16, I
think. I'm fine if this is for space savings (and known to be
compatible), but then why not strip the other unused ones as
well? Then again for the build ID don't you need the 7th
entry (see xen.efi)? Or are you intentionally not exposing it
in the PE way (in which case saying so, and why, would be
needed in the description)?

> +Lsection_table:
> +        .ascii  ".text\0\0\0"                        /* Name. */
> +        .long   __2M_rwdata_end - efi_pe_head_end    /* VirtualSize. */
> +        .long   sym_offs(start)                      /* VirtualAddress. */
> +        .long   __pe_text_raw_end - efi_pe_head_end  /* SizeOfRawData. */
> +        .long   efi_pe_head_end - efi_pe_head        /* PointerToRawData. */

Isn't this a file offset? If so, can it legitimately and
reliably be calculated by a difference of two addresses?

> +        .long   0                                    /* PointerToRelocations. */
> +        .long   0                                    /* PointerToLinenumbers. */
> +        .short  0                                    /* NumberOfRelocations. */
> +        .short  0                                    /* NumberOfLinenumbers. */
> +        .long   0xe0500020                           /* Characteristics:
> +                                                      *   IMAGE_SCN_CNT_CODE |
> +                                                      *   IMAGE_SCN_ALIGN_16BYTES |
> +                                                      *   IMAGE_SCN_MEM_EXECUTE |
> +                                                      *   IMAGE_SCN_MEM_READ |
> +                                                      *   IMAGE_SCN_MEM_WRITE
> +                                                      */

At least the alignment specification here is fake. I realize
it doesn't matter for loading purposes, but if an arbirary
value was chosen it should imo be said so in a comment, to
avoid future readers wondering.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -32,7 +32,8 @@ static void __init edd_put_string(u8 *dst, size_t n, const char *src)
>  }
>  #define edd_put_string(d, s) edd_put_string(d, ARRAY_SIZE(d), s)
>  
> -extern const intpte_t __page_tables_start[], __page_tables_end[];
> +extern intpte_t __page_tables_start[], __page_tables_end[];

I'm afraid I'm against this, no matter that it may be difficult
to do differently what you do below. IOW ...

> @@ -568,6 +569,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>  
>  static void __init efi_arch_memory_setup(void)
>  {
> +    intpte_t *pte;
>      unsigned int i;
>      EFI_STATUS status;
>  
> @@ -592,6 +594,13 @@ static void __init efi_arch_memory_setup(void)
>      if ( !efi_enabled(EFI_LOADER) )
>          return;
>  
> +    if ( efi_enabled(EFI_MB_LOADER) )
> +        for ( pte = __page_tables_start; pte < __page_tables_end; pte += ARRAY_SIZE(l2_directmap) )
> +            /* Skip relocating the directmap because start_xen() does this for us when
> +             * when it updates all superpage-aligned mappings.  */
> +            if ( (pte != (intpte_t *)l2_directmap) && (get_pte_flags(*pte) & _PAGE_PRESENT) )
> +                *pte += xen_phys_start;

... I consider this an RFC hack for which a clean solution
wants to be found (note how __setup_arch() gets away without
such). Also nit: Comment style.

> @@ -724,7 +733,18 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>  
> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +void EFIAPI efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
> +
> +void EFIAPI __init noreturn
> +efi_mb_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    __set_bit(EFI_MB_LOADER, &efi_flags);
> +    efi_start(ImageHandle, SystemTable);
> +}
> +
> +void __init efi_multiboot2(EFI_HANDLE ImageHandle,
> +                           EFI_SYSTEM_TABLE *SystemTable,
> +                           multiboot2_tag_module_t *dom0_kernel)
>  {

Hmm, yet another entry point. See also at the very bottom.

> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -15,9 +15,19 @@
>   * Here we are in EFI stub. EFI calls are not supported due to lack
>   * of relevant functionality in compiler and/or linker.
>   *
> - * efi_multiboot2() is an exception. Please look below for more details.
> + * efi_mb_start() and efi_multiboot2() are the exceptions.
> + * Please look below for more details.
>   */
>  
> +asm (
> +    "    .text                         \n"
> +    "    .globl efi_mb_start           \n"
> +    "efi_mb_start:                     \n"
> +    "    mov    %rcx,%rdi              \n"
> +    "    mov    %rdx,%rsi              \n"
> +    "    call   efi_multiboot2         \n"
> +    );

Okay, this I understand is for calling conventions translation.
A comment saying so would be nice. Plus I don't see why this
then uses "call", not "jmp".

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -63,7 +63,22 @@ SECTIONS
>  
>    start_pa = ABSOLUTE(start - __XEN_VIRT_START);
>  
> +#ifdef EFI
>    . = __XEN_VIRT_START + XEN_IMG_OFFSET;
> +#else
> +  /*
> +   * Multiboot2 with an EFI PE/COFF header.
> +   *
> +   * The PE header must be followed by .text section which
> +   * starts at __XEN_VIRT_START + XEN_IMG_OFFSET address.
> +   */
> +  . = __XEN_VIRT_START + XEN_IMG_OFFSET - efi_pe_head_end + efi_pe_head;
> +
> +  DECL_SECTION(.efi.pe.header) {
> +       *(.efi.pe.header)
> +  } :NONE
> +#endif

"Must be followed" in the comment is about file layout, not
address layout. Yet the latter is what matters in the linker
script. If there is a true requirement for it to be exactly
like this, more explanation is needed in the comment. But it
seems more likely to me that this simply isn't correct. As
said elsewhere, the executable header of a PE image lives at
RVA 0 afaict.

> @@ -289,6 +304,13 @@ SECTIONS
>         *(.data.rel)
>         *(.data.rel.*)
>         CONSTRUCTORS
> +       /*
> +        * A la the PE/COFF spec, the PE file data section must end at the
> +        * alignment boundary equal to FileAlignment in the optional header,
> +        * i.e., XEN_FILE_ALIGN.
> +        */
> +       . = ALIGN(XEN_FILE_ALIGN);
> +       __pe_text_raw_end = .;
>    } :text

What is a "PE file data section"? Yes, the file size of a
section must be a multiple of the specified file alignment.
With the present value of 32 bytes this isn't much of an
issue, but already in case we were in need of going up to
512 bytes I'd say this is undue overhead for the ELF image.

I could see you not advancing . here (by using

       __pe_text_raw_end = ALIGN(XEN_FILE_ALIGN);

) and then making sure the generated image gets padded as
necessary.

> @@ -392,5 +417,14 @@ ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
>  ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
>      "wakeup stack too small")
>  
> +#ifndef EFI
> +ASSERT(efi_pe_head_end == _start, "PE header does not end at the beginning of .text section")

As said earlier - I question this relationship.

> +ASSERT(_start == __XEN_VIRT_START + XEN_IMG_OFFSET, ".text section begins at wrong address")

I'd then hope this could go away as well.

> +ASSERT(IS_ALIGNED(_start,      XEN_FILE_ALIGN), "_start misaligned")

I can't see how this could trigger when the former one doesn't.

> +ASSERT(IS_ALIGNED(__bss_start, XEN_FILE_ALIGN), "__bss_start misaligned")

What is this trying to verify?

> +ASSERT(IS_ALIGNED(__pe_SizeOfImage, XEN_LOAD_ALIGN), "__pe_SizeOfImage is not multiple of XEN_LOAD_ALIGN")

This looks odd too, but I've commented on __pe_SizeOfImage further
up already anyway.

> +ASSERT(XEN_LOAD_ALIGN >= XEN_FILE_ALIGN, "XEN_LOAD_ALIGN < XEN_FILE_ALIGN")

Why? I would generally consider the two values pretty much
independent.

> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -11,6 +11,7 @@ extern unsigned int efi_flags;
>  #define EFI_BOOT	0	/* Were we booted from EFI? */
>  #define EFI_LOADER	1	/* Were we booted directly from EFI loader? */
>  #define EFI_RS		2	/* Can we use runtime services? */
> +#define EFI_MB_LOADER	4	/* xen.mb.efi booted directly from EFI loader? */

Is a separate flag really needed? I realize this is connected to
the page table relocation approach, so might go away anyway.

Jan

