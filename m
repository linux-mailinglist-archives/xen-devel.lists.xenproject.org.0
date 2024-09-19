Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8197C81C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800587.1210521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEc6-00038z-Il; Thu, 19 Sep 2024 10:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800587.1210521; Thu, 19 Sep 2024 10:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEc6-00036T-F8; Thu, 19 Sep 2024 10:42:18 +0000
Received: by outflank-mailman (input) for mailman id 800587;
 Thu, 19 Sep 2024 10:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mnG=QR=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1srEc4-00033Y-Cq
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:42:16 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4eb6d1d-7673-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 12:42:14 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6c353f2f954so4920656d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 03:42:14 -0700 (PDT)
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
X-Inumbo-ID: d4eb6d1d-7673-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726742533; x=1727347333; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U206wvvyZ7XPHCzf6bud8Ey5DN4HaySELNo/TFFD2WQ=;
        b=S8J2jE/gMt2yZXCC4F8EflW5xdiO04/p73SDvblN3Cbvo/HqueDCcxOx2wUvCs8WE7
         osmHEuum5dGWob6iWNXp5NgF2KOeJ77Iz1xwy/fLUEMXZsAOKSfOnNJexJ6cQrMqG7zq
         2xswaI1SS4ZCtA0HiUibSr5O6tZkOAK6AzyDNUBeK1+ZVM2DjzHg6mBCbP/T0xx+9wTE
         p6gDjAWIOQNVolbv7wTtUEATZEv8YmTtbt7LDIYje6sBOKOVtO2K3Zu461qb0VKy+RPy
         gltP5YLvjoMK0KtHUyJXihH6p0gWGq69VJT4ZKaLqHT6UGB5yBp9tGZOSYhc7Nt1wwaL
         jEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726742533; x=1727347333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U206wvvyZ7XPHCzf6bud8Ey5DN4HaySELNo/TFFD2WQ=;
        b=K1qqADB3Bl68nLTi4zJRkYqonGqTSQjFKDUvq9hzCYnZy4Pjr5n+E8Pdj0dOucxZNd
         ek79HHQJLitwOKVtE/m/BPjHIPdxnFObBlGptOSGHQ5iQw//cfRQngLET6L51uZcA8tT
         bNTvbrZCW1/GdQxbQhaThbqAIY23yFHunY+Ww3m6hUUCTbqxmveECxx3IMgI2dxDtWxi
         IDaRjc3O1vSUQj/ZUui4b4UQUNMe3ruNQwzYnBqQlq5lExv25ST0iDsBxPmjuJts2Ru6
         6mCMJ4mJ4bFrVFSU6qFUJEmOYOr83cHAkTs09u5Rsc81yLVtdUfyq2zj8/SQ+Zra1vnL
         13HQ==
X-Gm-Message-State: AOJu0YynMddClknciVN9jGw0vfth56QEPryvugsGiQZhQZ0h6mpWS8ZR
	jL+h5zlEyfJQHiuG5DFPpWbDEiItZpdaykgrdnwI3lQZKsdwU2fBlNd5ekmwqWwe/MfLoJTbc+w
	/62FUxmS3ZlwOfh1qO814yL2ICkkZQg==
X-Google-Smtp-Source: AGHT+IHu3shrmm2QloeIvNtYWx/YB/M2N35jtqC+/FUTFRS6HWgbr6KYoR7p7x3HPayF6QDrddXwZ5SKx47q9/1dpVM=
X-Received: by 2002:a05:6214:4a06:b0:6c5:279b:5dc7 with SMTP id
 6a1803df08f44-6c573568623mr410503036d6.25.1726742532801; Thu, 19 Sep 2024
 03:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
 <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
In-Reply-To: <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 19 Sep 2024 12:42:01 +0200
Message-ID: <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: Use generic PE/COFF structures
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Any comments on v2 patch?
Just checking if you missed this email or didn't have time for review.

BR,
Milan

On Tue, Aug 27, 2024 at 3:43=E2=80=AFPM Milan Djokic <milandjokic1995@gmail=
.com> wrote:
>
> From: Nikola Jelic <nikola.jelic@rt-rk.com>
>
> Adapted x86 efi parser and mkreloc utility to use generic PE header
> (efi/pe.h), instead of locally defined structures for each component.
>
> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
> ---
> Changes in V2:
>   - Using pe header constants instead of hardcoded values (magic,
>     machine)
> ---
>  xen/arch/x86/efi/mkreloc.c | 134 +++++++++++--------------------------
>  xen/common/efi/pe.c        |  96 ++++++--------------------
>  2 files changed, 61 insertions(+), 169 deletions(-)
>
> diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
> index 083740ab8a..89c525d81e 100644
> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -9,45 +9,7 @@
>  #include <sys/mman.h>
>  #include <unistd.h>
>
> -struct mz_hdr {
> -    uint16_t signature;
> -#define MZ_SIGNATURE 0x5a4d
> -    uint16_t last_page_size;
> -    uint16_t page_count;
> -    uint16_t relocation_count;
> -    uint16_t header_paras;
> -    uint16_t min_paras;
> -    uint16_t max_paras;
> -    uint16_t entry_ss;
> -    uint16_t entry_sp;
> -    uint16_t checksum;
> -    uint16_t entry_ip;
> -    uint16_t entry_cs;
> -    uint16_t relocations;
> -    uint16_t overlay;
> -    uint8_t reserved[32];
> -    uint32_t extended_header_base;
> -};
> -
> -struct pe_hdr {
> -    uint32_t signature;
> -#define PE_SIGNATURE 0x00004550
> -    uint16_t cpu;
> -    uint16_t section_count;
> -    int32_t timestamp;
> -    uint32_t symbols_file_offset;
> -    uint32_t symbol_count;
> -    uint16_t opt_hdr_size;
> -    uint16_t flags;
> -    struct {
> -        uint16_t magic;
> -#define PE_MAGIC_EXE32     0x010b
> -#define PE_MAGIC_EXE32PLUS 0x020b
> -        uint8_t linker_major, linker_minor;
> -        uint32_t code_size, data_size, bss_size;
> -        uint32_t entry_rva, code_rva, data_rva;
> -    } opt_hdr;
> -};
> +#include "../../../include/efi/pe.h"
>
>  #define PE_PAGE_SIZE 0x1000
>
> @@ -55,22 +17,6 @@ struct pe_hdr {
>  #define PE_BASE_RELOC_HIGHLOW  3
>  #define PE_BASE_RELOC_DIR64   10
>
> -struct coff_section {
> -    char name[8];
> -    uint32_t size;
> -    uint32_t rva;
> -    uint32_t file_size;
> -    uint32_t file_offset;
> -    uint32_t relocation_file_offset;
> -    uint32_t line_number_file_offset;
> -    uint16_t relocation_count;
> -    uint16_t line_number_count;
> -    uint32_t flags;
> -#define COFF_SECTION_BSS         0x00000080U
> -#define COFF_SECTION_DISCARDABLE 0x02000000U
> -#define COFF_SECTION_WRITEABLE   0x80000000U
> -};
> -
>  static void usage(const char *cmd, int rc)
>  {
>      fprintf(rc ? stderr : stdout,
> @@ -80,7 +26,7 @@ static void usage(const char *cmd, int rc)
>  }
>
>  static unsigned int load(const char *name, int *handle,
> -                         struct coff_section **sections,
> +                         struct section_header **sections,
>                           uint_fast64_t *image_base,
>                           uint32_t *image_size,
>                           unsigned int *width)
> @@ -88,6 +34,7 @@ static unsigned int load(const char *name, int *handle,
>      int in =3D open(name, O_RDONLY);
>      struct mz_hdr mz_hdr;
>      struct pe_hdr pe_hdr;
> +    struct pe32_opt_hdr pe32_opt_hdr;
>      uint32_t base;
>
>      if ( in < 0 ||
> @@ -96,16 +43,17 @@ static unsigned int load(const char *name, int *handl=
e,
>          perror(name);
>          exit(2);
>      }
> -    if ( mz_hdr.signature !=3D MZ_SIGNATURE ||
> -         mz_hdr.relocations < sizeof(mz_hdr) ||
> -         !mz_hdr.extended_header_base )
> +    if ( mz_hdr.magic !=3D MZ_MAGIC ||
> +         mz_hdr.reloc_table_offset < sizeof(mz_hdr) ||
> +         !mz_hdr.peaddr )
>      {
>          fprintf(stderr, "%s: Wrong DOS file format\n", name);
>          exit(2);
>      }
>
> -    if ( lseek(in, mz_hdr.extended_header_base, SEEK_SET) < 0 ||
> +    if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
>           read(in, &pe_hdr, sizeof(pe_hdr)) !=3D sizeof(pe_hdr) ||
> +         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) !=3D sizeof(pe32_=
opt_hdr) ||
>           read(in, &base, sizeof(base)) !=3D sizeof(base) ||
>           /*
>            * Luckily the image size field lives at the
> @@ -117,35 +65,33 @@ static unsigned int load(const char *name, int *hand=
le,
>          perror(name);
>          exit(3);
>      }
> -    switch ( (pe_hdr.signature =3D=3D PE_SIGNATURE &&
> -              pe_hdr.opt_hdr_size > sizeof(pe_hdr.opt_hdr)) *
> -             pe_hdr.opt_hdr.magic )
> +    switch ( (pe_hdr.magic =3D=3D PE_MAGIC &&
> +              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
> +              pe32_opt_hdr.magic )
>      {
> -    case PE_MAGIC_EXE32:
> +    case PE_OPT_MAGIC_PE32:
>          *width =3D 32;
>          *image_base =3D base;
>          break;
> -    case PE_MAGIC_EXE32PLUS:
> +    case PE_OPT_MAGIC_PE32PLUS:
>          *width =3D 64;
> -        *image_base =3D ((uint64_t)base << 32) | pe_hdr.opt_hdr.data_rva=
;
> +        *image_base =3D ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
>          break;
>      default:
>          fprintf(stderr, "%s: Wrong PE file format\n", name);
>          exit(3);
>      }
>
> -    *sections =3D malloc(pe_hdr.section_count * sizeof(**sections));
> +    *sections =3D malloc(pe_hdr.sections * sizeof(**sections));
>      if ( !*sections )
>      {
>          perror(NULL);
>          exit(4);
>      }
> -    if ( lseek(in,
> -               mz_hdr.extended_header_base + offsetof(struct pe_hdr, opt=
_hdr) +
> -                  pe_hdr.opt_hdr_size,
> +    if ( lseek(in, mz_hdr.peaddr + sizeof(pe_hdr) + pe_hdr.opt_hdr_size,
>                 SEEK_SET) < 0 ||
> -         read(in, *sections, pe_hdr.section_count * sizeof(**sections)) =
!=3D
> -             pe_hdr.section_count * sizeof(**sections) )
> +         read(in, *sections, pe_hdr.sections * sizeof(**sections)) !=3D
> +             pe_hdr.sections * sizeof(**sections) )
>      {
>          perror(name);
>          exit(4);
> @@ -153,12 +99,12 @@ static unsigned int load(const char *name, int *hand=
le,
>
>      *handle =3D in;
>
> -    return pe_hdr.section_count;
> +    return pe_hdr.sections;
>  }
>
>  static long page_size;
>
> -static const void *map_section(const struct coff_section *sec, int in,
> +static const void *map_section(const struct section_header *sec, int in,
>                                 const char *name)
>  {
>      const char *ptr;
> @@ -166,10 +112,10 @@ static const void *map_section(const struct coff_se=
ction *sec, int in,
>
>      if ( !page_size )
>          page_size =3D sysconf(_SC_PAGESIZE);
> -    offs =3D sec->file_offset & (page_size - 1);
> +    offs =3D sec->data_addr & (page_size - 1);
>
> -    ptr =3D mmap(0, offs + sec->file_size, PROT_READ, MAP_PRIVATE, in,
> -               sec->file_offset - offs);
> +    ptr =3D mmap(0, offs + sec->raw_data_size, PROT_READ, MAP_PRIVATE, i=
n,
> +               sec->data_addr - offs);
>      if ( ptr =3D=3D MAP_FAILED )
>      {
>          perror(name);
> @@ -179,15 +125,15 @@ static const void *map_section(const struct coff_se=
ction *sec, int in,
>      return ptr + offs;
>  }
>
> -static void unmap_section(const void *ptr, const struct coff_section *se=
c)
> +static void unmap_section(const void *ptr, const struct section_header *=
sec)
>  {
> -    unsigned long offs =3D sec->file_offset & (page_size - 1);
> +    unsigned long offs =3D sec->data_addr & (page_size - 1);
>
> -    munmap((char *)ptr - offs, offs + sec->file_size);
> +    munmap((char *)ptr - offs, offs + sec->raw_data_size);
>  }
>
>  static void diff_sections(const unsigned char *ptr1, const unsigned char=
 *ptr2,
> -                          const struct coff_section *sec,
> +                          const struct section_header *sec,
>                            int_fast64_t diff, unsigned int width,
>                            uint_fast64_t base, uint_fast64_t end)
>  {
> @@ -208,7 +154,7 @@ static void diff_sections(const unsigned char *ptr1, =
const unsigned char *ptr2,
>      while ( !(diff & (((int_fast64_t)1 << ((disp + 1) * CHAR_BIT)) - 1))=
 )
>          ++disp;
>
> -    for ( i =3D 0; i < sec->file_size; ++i )
> +    for ( i =3D 0; i < sec->raw_data_size; ++i )
>      {
>          uint_fast32_t rva;
>          union {
> @@ -222,7 +168,7 @@ static void diff_sections(const unsigned char *ptr1, =
const unsigned char *ptr2,
>          if ( ptr1[i] =3D=3D ptr2[i] )
>              continue;
>
> -        if ( i < disp || i + width - disp > sec->file_size )
> +        if ( i < disp || i + width - disp > sec->raw_data_size )
>          {
>              fprintf(stderr,
>                      "Bogus difference at %.8s:%08" PRIxFAST32 "\n",
> @@ -250,11 +196,11 @@ static void diff_sections(const unsigned char *ptr1=
, const unsigned char *ptr2,
>              reloc_size +=3D reloc_size & 2;
>              if ( reloc_size )
>                  printf("\t.equ rva_%08" PRIxFAST32 "_relocs,"
> -                             " %#08" PRIxFAST32 "\n",
> +                       " %#08" PRIxFAST32 "\n",
>                         cur_rva, reloc_size);
>              printf("\t.balign 4\n"
>                     "\t.long %#08" PRIxFAST32 ","
> -                          " rva_%08" PRIxFAST32 "_relocs\n",
> +                   " rva_%08" PRIxFAST32 "_relocs\n",
>                     rva, rva);
>              cur_rva =3D rva;
>              reloc_size =3D 8;
> @@ -267,7 +213,7 @@ static void diff_sections(const unsigned char *ptr1, =
const unsigned char *ptr2,
>              exit(3);
>          }
>
> -        if ( !(sec->flags & COFF_SECTION_WRITEABLE) )
> +        if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
>              fprintf(stderr,
>                      "Warning: relocation to r/o section %.8s:%08" PRIxFA=
ST32 "\n",
>                      sec->name, i - disp);
> @@ -285,7 +231,7 @@ int main(int argc, char *argv[])
>      unsigned int i, nsec, width1, width2;
>      uint_fast64_t base1, base2;
>      uint32_t size1, size2;
> -    struct coff_section *sec1, *sec2;
> +    struct section_header *sec1, *sec2;
>
>      if ( argc =3D=3D 1 ||
>           !strcmp(argv[1], "-?") ||
> @@ -328,16 +274,16 @@ int main(int argc, char *argv[])
>
>          if ( memcmp(sec1[i].name, sec2[i].name, sizeof(sec1[i].name)) ||
>               sec1[i].rva !=3D sec2[i].rva ||
> -             sec1[i].size !=3D sec2[i].size ||
> -             sec1[i].file_size !=3D sec2[i].file_size ||
> +             sec1[i].virtual_size !=3D sec2[i].virtual_size ||
> +             sec1[i].raw_data_size !=3D sec2[i].raw_data_size ||
>               sec1[i].flags !=3D sec2[i].flags )
>          {
>              fprintf(stderr, "Mismatched section %u parameters\n", i);
>              return 5;
>          }
>
> -        if ( !sec1[i].size ||
> -             (sec1[i].flags & (COFF_SECTION_DISCARDABLE|COFF_SECTION_BSS=
)) )
> +        if ( !sec1[i].virtual_size ||
> +             (sec1[i].flags & (IMAGE_SCN_MEM_DISCARDABLE | IMAGE_SCN_CNT=
_UNINITIALIZED_DATA)) )
>              continue;
>
>          /*
> @@ -354,10 +300,10 @@ int main(int argc, char *argv[])
>              return 3;
>          }
>
> -        if ( sec1[i].file_size > sec1[i].size )
> +        if ( sec1[i].raw_data_size > sec1[i].virtual_size )
>          {
> -            sec1[i].file_size =3D sec1[i].size;
> -            sec2[i].file_size =3D sec2[i].size;
> +            sec1[i].raw_data_size =3D sec1[i].virtual_size;
> +            sec2[i].raw_data_size =3D sec2[i].virtual_size;
>          }
>          ptr1 =3D map_section(sec1 + i, in1, argv[1]);
>          ptr2 =3D map_section(sec2 + i, in2, argv[2]);
> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> index ef8a2543e0..560f35188d 100644
> --- a/xen/common/efi/pe.c
> +++ b/xen/common/efi/pe.c
> @@ -20,78 +20,28 @@
>   * Lesser General Public License for more details.
>   */
>
> -
>  #include "efi.h"
> +#include "efi/pe.h"
>
> -struct DosFileHeader {
> -    UINT8   Magic[2];
> -    UINT16  LastSize;
> -    UINT16  nBlocks;
> -    UINT16  nReloc;
> -    UINT16  HdrSize;
> -    UINT16  MinAlloc;
> -    UINT16  MaxAlloc;
> -    UINT16  ss;
> -    UINT16  sp;
> -    UINT16  Checksum;
> -    UINT16  ip;
> -    UINT16  cs;
> -    UINT16  RelocPos;
> -    UINT16  nOverlay;
> -    UINT16  reserved[4];
> -    UINT16  OEMId;
> -    UINT16  OEMInfo;
> -    UINT16  reserved2[10];
> -    UINT32  ExeHeader;
> -};
> -
> -#if defined(__arm__) || defined (__aarch64__)
> -#define PE_HEADER_MACHINE 0xaa64
> +#if defined(__arm__) || defined(__aarch64__)
> +#define PE_HEADER_MACHINE IMAGE_FILE_MACHINE_ARM64
>  #elif defined(__x86_64__)
> -#define PE_HEADER_MACHINE 0x8664
> +#define PE_HEADER_MACHINE IMAGE_FILE_MACHINE_AMD64
>  #else
>  #error "Unknown architecture"
>  #endif
>
> -struct PeFileHeader {
> -    UINT16  Machine;
> -    UINT16  NumberOfSections;
> -    UINT32  TimeDateStamp;
> -    UINT32  PointerToSymbolTable;
> -    UINT32  NumberOfSymbols;
> -    UINT16  SizeOfOptionalHeader;
> -    UINT16  Characteristics;
> -};
> -
> -struct PeHeader {
> -    UINT8   Magic[4];
> -    struct PeFileHeader FileHeader;
> -};
> -
> -struct PeSectionHeader {
> -    CHAR8   Name[8];
> -    UINT32  VirtualSize;
> -    UINT32  VirtualAddress;
> -    UINT32  SizeOfRawData;
> -    UINT32  PointerToRawData;
> -    UINT32  PointerToRelocations;
> -    UINT32  PointerToLinenumbers;
> -    UINT16  NumberOfRelocations;
> -    UINT16  NumberOfLinenumbers;
> -    UINT32  Characteristics;
> -};
> -
> -static bool __init pe_name_compare(const struct PeSectionHeader *sect,
> +static bool __init pe_name_compare(const struct section_header *sect,
>                                     const CHAR16 *name)
>  {
>      size_t i;
>
> -    if ( sect->Name[0] !=3D '.' )
> +    if ( sect->name[0] !=3D '.' )
>          return false;
>
> -    for ( i =3D 1; i < sizeof(sect->Name); i++ )
> +    for ( i =3D 1; i < sizeof(sect->name); i++ )
>      {
> -        const char c =3D sect->Name[i];
> +        const char c =3D sect->name[i];
>
>          if ( c !=3D name[i - 1] )
>              return false;
> @@ -105,33 +55,29 @@ static bool __init pe_name_compare(const struct PeSe=
ctionHeader *sect,
>  const void *__init pe_find_section(const void *image, const UINTN image_=
size,
>                                     const CHAR16 *section_name, UINTN *si=
ze_out)
>  {
> -    const struct DosFileHeader *dos =3D image;
> -    const struct PeHeader *pe;
> -    const struct PeSectionHeader *sect;
> +    const struct mz_hdr *mz =3D image;
> +    const struct pe_hdr *pe;
> +    const struct section_header *sect;
>      UINTN offset, i;
>
> -    if ( image_size < sizeof(*dos) ||
> -         dos->Magic[0] !=3D 'M' ||
> -         dos->Magic[1] !=3D 'Z' )
> +    if ( image_size < sizeof(*mz) ||
> +         mz->magic !=3D MZ_MAGIC )
>          return NULL;
>
> -    offset =3D dos->ExeHeader;
> +    offset =3D mz->peaddr;
>      pe =3D image + offset;
>
>      offset +=3D sizeof(*pe);
>      if ( image_size < offset ||
> -         pe->Magic[0] !=3D 'P' ||
> -         pe->Magic[1] !=3D 'E' ||
> -         pe->Magic[2] !=3D '\0' ||
> -         pe->Magic[3] !=3D '\0' )
> +         pe->magic !=3D PE_MAGIC )
>          return NULL;
>
> -    if ( pe->FileHeader.Machine !=3D PE_HEADER_MACHINE )
> +    if ( pe->machine !=3D PE_HEADER_MACHINE )
>          return NULL;
>
> -    offset +=3D pe->FileHeader.SizeOfOptionalHeader;
> +    offset +=3D pe->opt_hdr_size;
>
> -    for ( i =3D 0; i < pe->FileHeader.NumberOfSections; i++ )
> +    for ( i =3D 0; i < pe->sections; i++ )
>      {
>          sect =3D image + offset;
>          if ( image_size < offset + sizeof(*sect) )
> @@ -143,13 +89,13 @@ const void *__init pe_find_section(const void *image=
, const UINTN image_size,
>              continue;
>          }
>
> -        if ( image_size < sect->VirtualSize + sect->VirtualAddress )
> +        if ( image_size < sect->virtual_size + sect->rva )
>              blexit(L"PE invalid section size + address");
>
>          if ( size_out )
> -            *size_out =3D sect->VirtualSize;
> +            *size_out =3D sect->virtual_size;
>
> -        return image + sect->VirtualAddress;
> +        return image + sect->rva;
>      }
>
>      return NULL;
> --
> 2.25.1
>

