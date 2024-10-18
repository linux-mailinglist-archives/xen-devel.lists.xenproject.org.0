Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58C9A3EB2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821860.1235819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mPL-0008Hu-OE; Fri, 18 Oct 2024 12:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821860.1235819; Fri, 18 Oct 2024 12:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mPL-0008FX-Kw; Fri, 18 Oct 2024 12:48:43 +0000
Received: by outflank-mailman (input) for mailman id 821860;
 Fri, 18 Oct 2024 12:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1mPK-0008FO-4u
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:48:42 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c1aa035-8d4f-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 14:48:39 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e6010a3bbfso551792b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:48:39 -0700 (PDT)
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
X-Inumbo-ID: 4c1aa035-8d4f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729255718; x=1729860518; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4VdeTmbrICVlOel0MWaDhEqdpbnLSshtNF4xIcqBgA=;
        b=cFTSVNqlrZVbQc2PFZoFxa0mUQvMjpRfuJ1HXUuMxMspUMYLDn4VCR+T89JyonoI+E
         +FbStPxF9FrqUmRQNT0VJN7+dJGySlqnKAzjkowzNltQ3iwCsL8avCgxrGpVA0fqvWJv
         wHTkXez7ZKLY4eAWI5HXgzk/SF1d2aT8tBrqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729255718; x=1729860518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4VdeTmbrICVlOel0MWaDhEqdpbnLSshtNF4xIcqBgA=;
        b=VtKucVBokJuWGvDjRvfIIXsPrm9elhB46ZWF2UoZ10okmDmJPt8wYDX3Qo+F65FlwC
         ItyyUFyCpUr2pvs8EqVHT0zBqidpkEzu4fX47a7SST7UalNaNY5o18PN6xQV8pDESzxc
         +8NO1zUGrmYCw21IEmXO4C4UUwENlamSzgam1x53vK4v0VuiotM29do8fRb6i6TdmdPq
         GbEacV7rRoxAhAjiCBDpMufAJSw90PkmdU7VMXUEW2e1fhmdZIRSxlV1Voh92sTbMYoj
         aP0cDsI1k5fxF6oieM1BoRjSKc9PpzPgL87TfHaiWtySsPfdJFodEWruFrAG0xu2niOx
         +XvA==
X-Gm-Message-State: AOJu0YyznWkuV1ALKQ8nGoH7q39UgTjCXWfZ1AUSib17uOpEvOpwb4Bw
	KE1THIBLxCIFDweuD4ArbGon4qC2VsRBvvz8m9f8txjmcMXUBBa1K5b+er1gHiBeaVnkr2kj0QE
	yycS+czec0L3rXAzW7ul4KI0o9MgQAQtXxusHlA==
X-Google-Smtp-Source: AGHT+IEyGI4tT33pvobv6qms9ch0EkYFcgXsN7HUv3fN06sNLxLdhW5n+9oDgoST7v7sa+XvDXy+pmzzaMfgZ9PzCvw=
X-Received: by 2002:a05:6808:15a6:b0:3e5:ff2b:8e78 with SMTP id
 5614622812f47-3e602da2a47mr2380272b6e.31.1729255718355; Fri, 18 Oct 2024
 05:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com> <ZxJJZvOCQLzU_Q5s@macbook.local>
In-Reply-To: <ZxJJZvOCQLzU_Q5s@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 13:48:27 +0100
Message-ID: <CACHz=Zif6tirzF3QSLYLOvDFuaE3o9=Cu+ybm4ns7vNkAKCROg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 12:41=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> > The current method to include 32 bit C boot code is:
> > - compile each function we want to use into a separate object file;
> > - each function is compiled with -fpic option;
> > - convert these object files to binary files. This operation removes GO=
P
> >   which we don't want in the executable;
> > - a small assembly part in each file add the entry point;
> > - code can't have external references, all possible variables are passe=
d
> >   by value or pointer;
> > - include these binary files in head.S.
> >
> > There are currently some limitations:
> > - code is compiled separately, it's not possible to share a function
> >   (like memcpy) between different functions to use;
> > - although code is compiled with -fpic there's no certainty there are
> >   no relocations, specifically data ones. This can lead into hard to
> >   find bugs;
> > - it's hard to add a simple function;
> > - having to pass external variables makes hard to do multiple things
> >   otherwise functions would require a lot of parameters so code would
> >   have to be split into multiple functions which is not easy.
> >
> > Current change extends the current process:
> > - all object files are linked together before getting converted making
> >   possible to share code between the function we want to call;
> > - a single object file is generated with all functions to use and
> >   exported symbols to easily call;
> > - variables to use are declared in linker script and easily used inside
> >   C code. Declaring them manually could be annoying but makes also
> >   easier to check them. Using external pointers can be still an issue i=
f
> >   they are not fixed. If an external symbol is not declared this gives =
a
> >   link error.
> >
> > Some details of the implementation:
> > - C code is compiled with -fpic flags (as before);
> > - object files from C code are linked together;
> > - the single bundled object file is linked with 2 slightly different
> >   script files to generate 2 bundled object files;
> > - the 2 bundled object files are converted to binary removing the need
> >   for global offset tables;
> > - a Python script is used to generate assembly source from the 2
> >   binaries;
> > - the single assembly file is compiled to generate final bundled object
> >   file;
> > - to detect possible unwanted relocation in data/code code is generated
> >   with different addresses. This is enforced starting .text section at
> >   different positions and adding a fixed "gap" at the beginning.
> >   This makes sure code and data is position independent;
> > - to detect used symbols in data/code symbols are placed in .text
> >   section at different offsets (based on the line in the linker script)=
.
> >   This is needed as potentially a reference to a symbol is converted to
> >   a reference to the containing section so multiple symbols could be
> >   converted to reference to same symbol (section name) and we need to
> >   distinguish them;
> > - --orphan-handling=3Derror option to linker is used to make sure we
> >   account for all possible sections from C code;
> >
> > Current limitations:
> > - the main one is the lack of support for 64 bit code. It would make
> >   sure that even the code used for 64 bit (at the moment EFI code) is
> >   code and data position independent. We cannot assume that code that
> >   came from code compiled for 32 bit and compiled for 64 bit is code an=
d
> >   data position independent, different compiler options lead to
> >   different code/data.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v2:
> > - removed W^X limitation, allowing data;
> > - added some comments to python script;
> > - added extension to python script;
> > - added header to generated assembly code from python script;
> > - added starting symbol to generated assembly code from python script
> >   to make disassembly more clear;
> > - other minor style changes to python script.
> >
> > Changes since v4:
> > - add build32.final.lds build32.other.lds to targets macro;
> > - place some comments over a rule, not inside;
> > - simplified linking and producing binary rule;
> > - renamed built_in_32 to built-in-32, coding style;
> > - fix minor indentation;
> > - put magic numbers in Makefile and propagate them;
> > - minor variable cleanups in Python script;
> > - add dependency to Python script.
> >
> > Changes since v5:
> > - renamed "other" and "final" phases to "base" and "offset";
> > - use if_changed macro to generate built-in-32.S.
> > ---
> >  xen/arch/x86/boot/.gitignore                  |   5 +-
> >  xen/arch/x86/boot/Makefile                    |  47 +++-
> >  .../x86/boot/{build32.lds =3D> build32.lds.S}   |  35 ++-
> >  xen/arch/x86/boot/cmdline.c                   |  12 -
> >  xen/arch/x86/boot/head.S                      |  12 -
> >  xen/arch/x86/boot/reloc.c                     |  14 --
> >  xen/tools/combine_two_binaries.py             | 220 ++++++++++++++++++
> >  7 files changed, 292 insertions(+), 53 deletions(-)
> >  rename xen/arch/x86/boot/{build32.lds =3D> build32.lds.S} (70%)
> >  create mode 100755 xen/tools/combine_two_binaries.py
> >
> > diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignor=
e
> > index a379db7988..7e85549751 100644
> > --- a/xen/arch/x86/boot/.gitignore
> > +++ b/xen/arch/x86/boot/.gitignore
> > @@ -1,3 +1,4 @@
> >  /mkelf32
> > -/*.bin
> > -/*.lnk
> > +/build32.*.lds
> > +/built-in-32.*.bin
> > +/built-in-32.*.map
> > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > index 1199291d2b..5da19501be 100644
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,4 +1,5 @@
> >  obj-bin-y +=3D head.o
> > +obj-bin-y +=3D built-in-32.o
> >
> >  obj32 :=3D cmdline.32.o
> >  obj32 +=3D reloc.32.o
> > @@ -9,9 +10,6 @@ targets   +=3D $(obj32)
> >
> >  obj32 :=3D $(addprefix $(obj)/,$(obj32))
> >
> > -$(obj)/head.o: AFLAGS-y +=3D -Wa$(comma)-I$(obj)
> > -$(obj)/head.o: $(obj32:.32.o=3D.bin)
> > -
> >  CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(XEN_TREEWIDE_CFLA=
GS))
> >  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
> > @@ -25,14 +23,47 @@ $(obj32): XEN_CFLAGS :=3D $(CFLAGS_x86_32) -fpic
> >  $(obj)/%.32.o: $(src)/%.c FORCE
> >       $(call if_changed_rule,cc_o_c)
> >
> > +orphan-handling-$(call ld-option,--orphan-handling=3Derror) :=3D --orp=
han-handling=3Derror
> >  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) :=3D --no-warn-rw=
x-segments
> >  LDFLAGS_DIRECT +=3D $(LDFLAGS_DIRECT-y)
> >  LD32 :=3D $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> >
> > -%.bin: %.lnk
> > -     $(OBJCOPY) -j .text -O binary $< $@
> > +text_gap :=3D 0x010200
> > +text_diff :=3D 0x408020
> > +
> > +$(obj)/build32.base.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DIFF=
=3D$(text_diff)
> > +$(obj)/build32.offset.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DI=
FF=3D$(text_diff) -DFINAL
> > +$(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.=
S FORCE
> > +     $(call if_changed_dep,cpp_lds_S)
> > +
> > +targets +=3D build32.offset.lds build32.base.lds
> > +
> > +# link all 32bit objects together
> > +$(obj)/built-in-32.tmp.o: $(obj32)
> > +     $(LD32) -r -o $@ $^
> > +
> > +# link bundle with a given layout and extract a binary from it
> > +$(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.=
o
> > +     $(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=3Dmap) -o $(@:=
bin=3Do) $(filter %.o,$^)
> > +     $(OBJCOPY) -j .text -O binary $(@:bin=3Do) $@
> > +     rm -f $(@:bin=3Do)
> > +
> > +quiet_cmd_combine =3D GEN     $@
> > +cmd_combine =3D \
> > +     $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> > +             --gap=3D$(text_gap) --text-diff=3D$(text_diff) \
> > +             --script $(obj)/build32.offset.lds \
> > +             --bin1 $(obj)/built-in-32.base.bin \
> > +             --bin2 $(obj)/built-in-32.offset.bin \
> > +             --map $(obj)/built-in-32.offset.map \
> > +             --exports cmdline_parse_early,reloc \
> > +             --output $@
>
> See xen/Rules.mk, for consistency the indentation should be done with
> spaces when defining variables.  That would also allow to align the
> options.
>

Changed.

Is there a reason why these variables (I think the correct make
terminology is macros) use "=3D" and not ":=3D" ?

> > +
> > +targets +=3D built-in-32.S
> >
> > -%.lnk: %.32.o $(src)/build32.lds
> > -     $(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> > +# generate final object file combining and checking above binaries
> > +$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.o=
ffset.bin \
> > +             $(srctree)/tools/combine_two_binaries.py FORCE
>
> Can you indent this using spaces also, so it's on the same column as
> the ':'?
>

Changed.

> > +     $(call if_changed,combine)
> >
> > -clean-files :=3D *.lnk *.bin
> > +clean-files :=3D built-in-32.*.bin built-in-32.*.map build32.*.lds
> > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.=
lds.S
> > similarity index 70%
> > rename from xen/arch/x86/boot/build32.lds
> > rename to xen/arch/x86/boot/build32.lds.S
> > index 56edaa727b..e3f5e55261 100644
> > --- a/xen/arch/x86/boot/build32.lds
> > +++ b/xen/arch/x86/boot/build32.lds.S
> > @@ -15,22 +15,47 @@
> >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > -ENTRY(_start)
> > +#ifdef FINAL
> > +#  undef GAP
> > +#  define GAP 0
> > +#  define MULT 0
> > +#  define TEXT_START
> > +#else
> > +#  define MULT 1
> > +#  define TEXT_START TEXT_DIFF
> > +#endif
>
> In other places we use a single space between the hash and the define.
>

Changed.
This file has very weird indentation rules.

> > +#define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> > +
> > +ENTRY(dummy_start)
> >
> >  SECTIONS
> >  {
> >    /* Merge code and data into one section. */
> > -  .text : {
> > +  .text TEXT_START : {
> > +        /* Silence linker warning, we are not going to use it */
> > +        dummy_start =3D .;
> > +
> > +        /* Declare below any symbol name needed.
> > +         * Each symbol should be on its own line.
> > +         * It looks like a tedious work but we make sure the things we=
 use.
> > +         * Potentially they should be all variables. */
>
> The style is wrong for the opening and closing comment delimiters.
>
> I think it would be best if this was written in a more natural style.
>
> /*
>  * Any symbols used should be declared below, this ensures which
>  * symbols are visible to the 32bit C boot code.
>  */
>

But why to remove the "Potentially they should be all variables.".
Surely something not written is more clear than something written, but
on the other way it carries no information.

> I don't think you need to mention that each symbol should be on it's
> own line.
>

Yes, this is also enforced by Python script, so you can't do that
mistake in any case.

> Thanks, Roger.

Frediano

