Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479FF8179
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 21:43:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUGTn-0008Eb-4G; Mon, 11 Nov 2019 20:40:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUGTl-00087w-D2
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 20:40:05 +0000
X-Inumbo-ID: 7070bef2-04c3-11ea-a218-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7070bef2-04c3-11ea-a218-12813bfff9fa;
 Mon, 11 Nov 2019 20:40:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29D0320659;
 Mon, 11 Nov 2019 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573504803;
 bh=tCvoL7f8XR3qj33u4lH5wnzDKyS3EN4/MGA/2PHD2tc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sEZs0Ze3i5bqAaul6aA7VZIGz/ZpL8pk14QVxKdZiukLYIigXah4vto/Xwr+6uAHX
 1VjYmSjWVKoK4Tqi8I79hAGgXA8nOhSwT1VrMBHTd+9Owm6mYAla7HidMV85TZeV5i
 j7q0wlWe5RO9soXnaOEy8O/RGOt2n0w28OUWXoPo=
Date: Mon, 11 Nov 2019 12:40:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191111202443.7154-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.21.1911111239420.2677@sstabellini-ThinkPad-T480s>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-605368278-1573504803=:2677"
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-605368278-1573504803=:2677
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Nov 2019, Andrew Cooper wrote:
> actypes.h and efidef.h both define BOOLEAN as unsigned char, which is buggy in
> combination with logic such as "BOOLEAN b = (a & 0x100);"  Redefine BOOLEAN as
> bool instead, which doesn't truncate.
> 
> Both also define TRUE and FALSE, with actypes.h being extra rude and replacing
> whatever exists thus far.  Drop all uses of TRUE and FALSE, replacing them
> with true/false respectively, and drop the declarations.
> 
> Also drop the pointless conditional declaration of NULL while cleaning this
> up.
> 
> Finally, correct all the comments which which were found by sed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Juergen Gross <jgross@suse.com>
> 
> This is based on top of Rogers patch adjusting part of io_apic.c
> 
> Compile tested on ARM, fully texted on x86.
> 
> RFC for 4.13 - I thought I'd got all of the boolean truncation bugs back in
> 4.8 but clearly not...
> ---
>  xen/arch/x86/io_apic.c               | 12 ++++++------
>  xen/arch/x86/x86_64/mm.c             |  2 +-
>  xen/common/kexec.c                   |  6 +++---
>  xen/common/timer.c                   |  4 ++--
>  xen/drivers/acpi/tables/tbfadt.c     |  4 ++--
>  xen/drivers/passthrough/vtd/utils.c  |  2 +-
>  xen/include/acpi/acconfig.h          |  2 +-
>  xen/include/acpi/actypes.h           | 20 ++------------------
>  xen/include/asm-arm/arm64/efibind.h  |  2 +-
>  xen/include/asm-arm/regs.h           |  2 +-
>  xen/include/asm-x86/regs.h           |  2 +-
>  xen/include/asm-x86/x86_64/efibind.h |  2 +-
>  xen/include/efi/efidef.h             | 11 +----------
>  xen/include/xen/mm.h                 |  2 +-
>  xen/include/xen/sched.h              |  2 +-
>  15 files changed, 25 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 732b57995c..6517eb5ae9 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -285,7 +285,7 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>      {
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector == IRQ_VECTOR_UNASSIGNED )
> -            vector = __ioapic_read_entry(apic, pin, TRUE).vector;
> +            vector = __ioapic_read_entry(apic, pin, true).vector;
>  
>          *(IO_APIC_BASE(apic)+16) = vector;
>      }
> @@ -296,28 +296,28 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>          struct IO_APIC_route_entry entry;
>          bool need_to_unmask = false;
>  
> -        entry = __ioapic_read_entry(apic, pin, TRUE);
> +        entry = __ioapic_read_entry(apic, pin, true);
>  
>          if ( ! entry.mask )
>          {
>              /* If entry is not currently masked, mask it and make
>               * a note to unmask it later */
>              entry.mask = 1;
> -            __ioapic_write_entry(apic, pin, TRUE, entry);
> +            __ioapic_write_entry(apic, pin, true, entry);
>              need_to_unmask = true;
>          }
>  
>          /* Flip the trigger mode to edge and back */
>          entry.trigger = 0;
> -        __ioapic_write_entry(apic, pin, TRUE, entry);
> +        __ioapic_write_entry(apic, pin, true, entry);
>          entry.trigger = 1;
> -        __ioapic_write_entry(apic, pin, TRUE, entry);
> +        __ioapic_write_entry(apic, pin, true, entry);
>  
>          if ( need_to_unmask )
>          {
>              /* Unmask if neccesary */
>              entry.mask = 0;
> -            __ioapic_write_entry(apic, pin, TRUE, entry);
> +            __ioapic_write_entry(apic, pin, true, entry);
>          }
>      }
>  }
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index fa55f3474e..e9d7b80caf 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1077,7 +1077,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
>  }
>  
>  
> -/* Returns TRUE if given descriptor is valid for GDT or LDT. */
> +/* Returns true if given descriptor is valid for GDT or LDT. */
>  int check_descriptor(const struct domain *dom, seg_desc_t *d)
>  {
>      u32 a = d->a, b = d->b;
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index a262cc5a18..8e7540f605 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -33,7 +33,7 @@
>  #include <compat/kexec.h>
>  #endif
>  
> -bool_t kexecing = FALSE;
> +bool kexecing = false;
>  
>  /* Memory regions to store the per cpu register state etc. on a crash. */
>  typedef struct { Elf_Note * start; size_t size; } crash_note_range_t;
> @@ -379,7 +379,7 @@ void kexec_crash(void)
>      if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
>          return;
>  
> -    kexecing = TRUE;
> +    kexecing = true;
>  
>      if ( kexec_common_shutdown() != 0 )
>          return;
> @@ -395,7 +395,7 @@ static long kexec_reboot(void *_image)
>  {
>      struct kexec_image *image = _image;
>  
> -    kexecing = TRUE;
> +    kexecing = true;
>  
>      kexec_common_shutdown();
>      machine_reboot_kexec(image);
> diff --git a/xen/common/timer.c b/xen/common/timer.c
> index 645206a989..29f8f40f88 100644
> --- a/xen/common/timer.c
> +++ b/xen/common/timer.c
> @@ -100,7 +100,7 @@ static void up_heap(struct timer **heap, unsigned int pos)
>  }
>  
>  
> -/* Delete @t from @heap. Return TRUE if new top of heap. */
> +/* Delete @t from @heap. Return true if new top of heap. */
>  static int remove_from_heap(struct timer **heap, struct timer *t)
>  {
>      unsigned int sz = heap_metadata(heap)->size;
> @@ -127,7 +127,7 @@ static int remove_from_heap(struct timer **heap, struct timer *t)
>  }
>  
>  
> -/* Add new entry @t to @heap. Return TRUE if new top of heap. */
> +/* Add new entry @t to @heap. Return true if new top of heap. */
>  static int add_to_heap(struct timer **heap, struct timer *t)
>  {
>      unsigned int sz = heap_metadata(heap)->size;
> diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
> index f11fd5a900..6f30aede9c 100644
> --- a/xen/drivers/acpi/tables/tbfadt.c
> +++ b/xen/drivers/acpi/tables/tbfadt.c
> @@ -250,9 +250,9 @@ void __init acpi_tb_create_local_fadt(struct acpi_table_header *table, u32 lengt
>  
>  	/* Take a copy of the Hardware Reduced flag */
>  
> -	acpi_gbl_reduced_hardware = FALSE;
> +	acpi_gbl_reduced_hardware = false;
>  	if (acpi_gbl_FADT.flags & ACPI_FADT_HW_REDUCED) {
> -		acpi_gbl_reduced_hardware = TRUE;
> +		acpi_gbl_reduced_hardware = true;
>  	}
>  
>  	/*
> diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
> index 7552dd8e0c..4531581846 100644
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -281,7 +281,7 @@ void vtd_dump_iommu_info(unsigned char key)
>              for ( i = 0; i <= reg_01.bits.entries; i++ )
>              {
>                  struct IO_APIC_route_entry rte =
> -                    __ioapic_read_entry(apic, i, TRUE);
> +                    __ioapic_read_entry(apic, i, true);
>  
>                  remap = (struct IO_APIC_route_remap_entry *) &rte;
>                  if ( !remap->format )
> diff --git a/xen/include/acpi/acconfig.h b/xen/include/acpi/acconfig.h
> index 422f29c06c..f0330fb990 100644
> --- a/xen/include/acpi/acconfig.h
> +++ b/xen/include/acpi/acconfig.h
> @@ -87,7 +87,7 @@
>   * Should the subsystem abort the loading of an ACPI table if the
>   * table checksum is incorrect?
>   */
> -#define ACPI_CHECKSUM_ABORT             FALSE
> +#define ACPI_CHECKSUM_ABORT             false
>  
>  /******************************************************************************
>   *
> diff --git a/xen/include/acpi/actypes.h b/xen/include/acpi/actypes.h
> index f3e95abc3a..4aad815f7b 100644
> --- a/xen/include/acpi/actypes.h
> +++ b/xen/include/acpi/actypes.h
> @@ -124,7 +124,7 @@
>   *
>   ******************************************************************************/
>  
> -typedef unsigned char BOOLEAN;
> +typedef bool BOOLEAN;
>  typedef unsigned char UINT8;
>  typedef unsigned short UINT16;
>  typedef COMPILER_DEPENDENT_UINT64 UINT64;
> @@ -260,22 +260,6 @@ typedef acpi_native_uint acpi_size;
>   *
>   ******************************************************************************/
>  
> -/* Logical defines and NULL */
> -
> -#ifdef FALSE
> -#undef FALSE
> -#endif
> -#define FALSE                           (1 == 0)
> -
> -#ifdef TRUE
> -#undef TRUE
> -#endif
> -#define TRUE                            (1 == 1)
> -
> -#ifndef NULL
> -#define NULL                            (void *) 0
> -#endif
> -
>  /*
>   * Mescellaneous types
>   */
> @@ -503,7 +487,7 @@ typedef u32 acpi_event_type;
>   * Event Status - Per event
>   * -------------
>   * The encoding of acpi_event_status is illustrated below.
> - * Note that a set bit (1) indicates the property is TRUE
> + * Note that a set bit (1) indicates the property is true
>   * (e.g. if bit 0 is set then the event is enabled).
>   * +-------------+-+-+-+
>   * |   Bits 31:3 |2|1|0|
> diff --git a/xen/include/asm-arm/arm64/efibind.h b/xen/include/asm-arm/arm64/efibind.h
> index 2b0bf40bf2..08ab70e668 100644
> --- a/xen/include/asm-arm/arm64/efibind.h
> +++ b/xen/include/asm-arm/arm64/efibind.h
> @@ -107,7 +107,7 @@ typedef uint64_t   UINTN;
>  #define POST_CODE(_Data)
>  
>  
> -#define BREAKPOINT()        while (TRUE);    // Make it hang on Bios[Dbg]32
> +#define BREAKPOINT()        while (true);    // Make it hang on Bios[Dbg]32
>  
>  //
>  // Pointers must be aligned to these address to function
> diff --git a/xen/include/asm-arm/regs.h b/xen/include/asm-arm/regs.h
> index 0e3e56b452..f93e1d42b0 100644
> --- a/xen/include/asm-arm/regs.h
> +++ b/xen/include/asm-arm/regs.h
> @@ -53,7 +53,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
>      ASSERT(diff < STACK_SIZE);
>      /* If not a guest frame, it must be a hypervisor frame. */
>      ASSERT((diff == 0) || hyp_mode(r));
> -    /* Return TRUE if it's a guest frame. */
> +    /* Return true if it's a guest frame. */
>      return (diff == 0);
>  }
>  
> diff --git a/xen/include/asm-x86/regs.h b/xen/include/asm-x86/regs.h
> index 725a664e0a..679c38bb76 100644
> --- a/xen/include/asm-x86/regs.h
> +++ b/xen/include/asm-x86/regs.h
> @@ -11,7 +11,7 @@
>      ASSERT(diff < STACK_SIZE);                                                \
>      /* If not a guest frame, it must be a hypervisor frame. */                \
>      ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
> -    /* Return TRUE if it's a guest frame. */                                  \
> +    /* Return true if it's a guest frame. */                                  \
>      (diff == 0);                                                              \
>  })
>  
> diff --git a/xen/include/asm-x86/x86_64/efibind.h b/xen/include/asm-x86/x86_64/efibind.h
> index b013db175d..2b7001f8f4 100644
> --- a/xen/include/asm-x86/x86_64/efibind.h
> +++ b/xen/include/asm-x86/x86_64/efibind.h
> @@ -127,7 +127,7 @@ typedef uint64_t   UINTN;
>  #ifdef EFI_NT_EMULATOR
>      #define BREAKPOINT()        __asm { int 3 }
>  #else
> -    #define BREAKPOINT()        while (TRUE);    // Make it hang on Bios[Dbg]32
> +    #define BREAKPOINT()        while (true);    // Make it hang on Bios[Dbg]32
>  #endif
>  
>  //
> diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
> index 86a7e111bf..fe1750de51 100644
> --- a/xen/include/efi/efidef.h
> +++ b/xen/include/efi/efidef.h
> @@ -22,16 +22,7 @@ Revision History
>  
>  typedef UINT16          CHAR16;
>  typedef UINT8           CHAR8;
> -typedef UINT8           BOOLEAN;
> -
> -#ifndef TRUE
> -    #define TRUE    ((BOOLEAN) 1)
> -    #define FALSE   ((BOOLEAN) 0)
> -#endif
> -
> -#ifndef NULL
> -    #define NULL    ((VOID *) 0)
> -#endif
> +typedef bool            BOOLEAN;
>  
>  typedef UINTN           EFI_STATUS;
>  typedef UINT64          EFI_LBA;
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 8d0ddfb60c..2b5ae8cae4 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -607,7 +607,7 @@ int __must_check donate_page(struct domain *d, struct page_info *page,
>  #define RAM_TYPE_UNUSABLE     0x00000004
>  #define RAM_TYPE_ACPI         0x00000008
>  #define RAM_TYPE_UNKNOWN      0x00000010
> -/* TRUE if the whole page at @mfn is of the requested RAM type(s) above. */
> +/* true if the whole page at @mfn is of the requested RAM type(s) above. */
>  int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
>  /* Returns the page type(s). */
>  unsigned int page_get_ram_type(mfn_t mfn);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9f7bc69293..c43d9311aa 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -552,7 +552,7 @@ static inline bool is_system_domain(const struct domain *d)
>  
>  /*
>   * Use this when you don't have an existing reference to @d. It returns
> - * FALSE if @d is being destroyed.
> + * false if @d is being destroyed.
>   */
>  static always_inline int get_domain(struct domain *d)
>  {
> -- 
> 2.11.0
> 
--8323329-605368278-1573504803=:2677
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-605368278-1573504803=:2677--

