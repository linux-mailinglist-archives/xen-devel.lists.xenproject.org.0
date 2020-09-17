Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7A26DC64
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 15:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kItaS-00059e-3U; Thu, 17 Sep 2020 13:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t+a8=C2=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kItaR-00059Z-8T
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 13:04:31 +0000
X-Inumbo-ID: 416b247b-74ff-4cc5-8caa-0bb9fbabfb52
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 416b247b-74ff-4cc5-8caa-0bb9fbabfb52;
 Thu, 17 Sep 2020 13:04:27 +0000 (UTC)
Date: Thu, 17 Sep 2020 13:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600347866;
 bh=Cu/LsOLTlT5rw6ZNMqoibl+gFRVFvnOdYXYWgv70rA4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=vE06UTerStQ9JoAXPGBAlQ81LM46qMCd4so6kcb/dFfg2KEvfA0C6avdYPpyGhF67
 uZT9bnKJqQC5OkJM323cG0BVqPvk7/IYaF9bZGowuLCjhIJKIGK8Ib19MAjLCT5UMQ
 W2a5Y5kwB6QVrjPRYfGQs7r/NFXmB9HHXywChoys=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
In-Reply-To: <bce3b96d-8e40-0f46-81a8-1cffb464dbd6@suse.com>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
 <bce3b96d-8e40-0f46-81a8-1cffb464dbd6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, September 17, 2020 8:33 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:
> On 14.09.2020 13:50, Trammell Hudson wrote:
> [...]
> > +For all the examples the `.pad` section ended at 0xffff82d041000000.
> > +All the sections are optional (`.config`, `.kernel`, `.ramdisk`, `.xsm=
`,
> > +`.ucode` (x86) and `.dtb` (ARM)) and the order does not matter.
> > +The virtual addresses do not need to be contiguous, although they shou=
ld not
> > +be overlapping and should all be greater than the last virtual address=
 of the
> > +hypervisor components.
>
> The .pad section is there really only for padding the image. Its space
> could in principle be used for placing useful stuff (and hence to limit
> overall in-memory image size). That said, there is a plan for a change
> which may involve using the initial part of .pad, but that's not certain
> yet. I'm pointing this out to clarify that there may be a valid reason
> to avoid re-using the .pad space, at least for now.

The instructions show how to append after the .pad region, so there is
no reuse of that space.  I wish objcopy had an --append-region option
so that the user didn't have to do this extra math and adjust sizes.

> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -375,27 +375,36 @@ static void __init noreturn efi_arch_post_exit_bo=
ot(void)
> > efi_xen_start(fdt, fdt_totalsize(fdt));
> > }
> > -static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle,=
 char *section)
> > +static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *ima=
ge,
> >
> > -                                             EFI_FILE_HANDLE dir_handl=
e,
> >
> >
> > -                                             char *section)
> >
> >
>
> Could I talk you into constifying "section" at this occasion - afaics
> there should be no fallout here or in the other three places where
> the same would apply.

I'm always in favor of adding more constness.  Is it ok to have that
as part of this patch since we're changing the signature on the function?

> [...]
> > -   if ( read_section(image, ".ucode", &ucode, NULL) )
> > -          return;
> > -   name.s =3D get_value(&cfg, section, "ucode");
>
> With the Arm change already in mind and with further similar
> changes further down, may I suggest to consider passing
> 'section' into read_section(), thus guaranteeing consistent
> naming between image section and config file items, not only now
> but also going forward? read_section() would then check for the
> leading dot followed by the specified name.

That could work, I think.  Let me test it out for v5.

> [...]
> > -   file->ptr =3D (void *)pe_find_section(image->ImageBase, image->Imag=
eSize,
> > -                                          name, &file->size);
>
> This casting away of const-ness worries me. The sole reason why
> the "ptr" member is non-const looks to be the two parsing functions
> for the config file. How about we make "ptr" const void * and add a
> new "char *str" field? While it won't guarantee correct code to
> be written, it at least allows doing so.

That's what I found in the const cleanup patch -- only the config file
parser needed to modify the contents.  It would potentially fail if someone
modified the build to include the config in a read-only text segment,
but they would find out fairly quickly that didn't work...

> [...]
> > -          if ( !read_section(loaded_image, ".kernel", &kernel, option_=
str) )
> > -              read_file(dir_handle, s2w(&name), &ramdisk, NULL);
> > -              read_file(dir_handle, s2w(&name), &kernel, option_str);
>
> As before, I disagree with the idea of taking pieces from disk and
> pieces from the unified image. If you continue to think this is a
> reasonable thing to do, may I ask that you add a rationale of this
> model to the description?

It allows distributions to continue with the status quo if they want a
signed kernel + config, but allow a user provided initrd (which is what
the shim protocol does today).  Qubes, for instance, has discussed that
as a path forward to allow a trusted kernel, while also allowing users
to rebuild their own initrd since it contains machine specific data.

The config is signed, so an attacker can not add any new lines to it.
So if the config file has no "ramdisk" or "xsm" line then get_value()
will return NULL and the read_file() will not be attempted.
If, however, the config file has an "ramdisk /boot/initrd.gz",
but not ".ramdisk" PE section, then that is an explicit statement
from the signer that they want to load that file from disk, even
though the initrd.gz is not included in the signature.

> > --- /dev/null
> > +++ b/xen/common/efi/pe.c
> > +#define PE_HEADER_MACHINE_ARM64 0xaa64
> > +#define PE_HEADER_MACHINE_X64 0x8664
> > +#define PE_HEADER_MACHINE_I386 0x014c
>
> This list isn't meant to be a complete one anyway, so please omit
> the I386 item as it's not needed anywhere.

Sure.  This file is almost verbatim from systemd-boot, so it has
a few things like that which are not relevant.

> > +struct PeFileHeader {
> > -   UINT16 Machine;
> > -   UINT16 NumberOfSections;
> > -   UINT32 TimeDateStamp;
> > -   UINT32 PointerToSymbolTable;
> > -   UINT32 NumberOfSymbols;
> > -   UINT16 SizeOfOptionalHeader;
> > -   UINT16 Characteristics;
> >     +} attribute((packed));
> >
> > +struct PeHeader {
> > -   UINT8 Magic[4];
> > -   struct PeFileHeader FileHeader;
> >     +} attribute((packed));
>
> At the example of these two (i.e. may extend to others): When the
> packed attribute doesn't really have any impact on structure layout
> (and will just adversely affect alignof() when applied to the struct
> or any of the fields), please omit it.

In this case the packed does not affect the layout, but if PeFileHeader
started with a UINT64, for instance, then padding would be added to
PeHeader to align it without the packed.

> > +struct PeSectionHeader {
> > -   UINT8 Name[8];
>
> Better char?

Maybe? I've heard that some programs use non-7bit ascii in there for things
that are not normal sections (and the names are compared with memcp()).

> > +const void *__init pe_find_section(const CHAR8 *image, const UINTN ima=
ge_size,
> > -                                     const char *section_name, UINTN *=
size_out)
> > -   const struct DosFileHeader dos =3D (const void)image;
>
> If the type of "image" was "const void *", there wouldn't be any cast
> needed here (and again further down). And I don't think you actually
> need "image" to be a pointer to a particular type?

I don't think it needs to be any particular type (and CHAR* is a holdover
from the systemd-boot code).  However, there is quite a bit of pointer
math done on it that avoids casts:

pe =3D (const void *) &image[offset];

If image were void*, then this would have to be written as something like:

pe =3D (const void *)((uintptr_t)image + offset);

(unless the gnu extension that allows void* math is enabled)

> > -   const struct PeSectionHeader *sect;
> > -   if ( name_len > sizeof(sect->Name) ||

> > +#elif defined(x86_64)
> >
> > -   if ( pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_X64 )
> > -          return NULL;
> >
> >
> >
> > +#else
> >
> > -   /* unknown architecture */
> > -   return NULL;
> >     +#endif
> >
>
> Instead of this, further up please #define a single constant (e.g.
> PE_HEADER_MACHINE) to check against without any #ifdef-ary here.
> This then also should lead to a build error (instead of the
> function returning NULL at runtime) when no enabling was done for
> a possible future port.

Ok.

> > -   for ( i =3D 0; i < pe->FileHeader.NumberOfSections; i++ )
> > -   {
> > -          sect =3D (const void *)&image[offset];
> >
> >
>
> Please limit the scope of sect to the body of this loop, at which
> point this assignment can become the initializer.

sect was used earlier for sizeof math to validate the name.

It's also a little odd that the style guide calls for declaring variable
in limited scopes, while also disallowing for loop scoped variables.

> > -          if ( memcmp(sect->Name, section_name, name_len) !=3D 0 ||
> > -               image_size < sect->VirtualSize + sect->VirtualAddress )
>
> Wouldn't this latter part of the condition better be treated as an
> error, rather than getting silently ignored? The more if the falling
> back to on-disk files got retained?

Possibly.  Since the signature has been validated on the entire image,
this would mean that the signer signed a bogus unified image for some
reason.  Probably should throw an error of some sort; wasn't sure if
it made sense to include that sort of panic behaviour this deep in the
code.

I'll pickup the style guide issues in v5 as well.

--
Trammell


