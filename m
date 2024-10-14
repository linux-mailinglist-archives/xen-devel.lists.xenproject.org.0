Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9999D4BA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 18:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818796.1232081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Nzu-0004hO-9S; Mon, 14 Oct 2024 16:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818796.1232081; Mon, 14 Oct 2024 16:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Nzu-0004eA-6f; Mon, 14 Oct 2024 16:32:42 +0000
Received: by outflank-mailman (input) for mailman id 818796;
 Mon, 14 Oct 2024 16:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Nzt-0004e4-FW
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 16:32:41 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecfda495-8a49-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 18:32:39 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e5c89b013aso1947985b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 09:32:39 -0700 (PDT)
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
X-Inumbo-ID: ecfda495-8a49-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728923558; x=1729528358; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzzBY1ZhFPH5/v/KiILlLgN1gmTiaKNc2dMaTmOv8CU=;
        b=WusfwasH3232iaJRDpRPHq7zTDcExFgKY/E8qmYqQDgekUJu+LX95fdpnZKoWtBFpE
         rjjjmYtCfc9aWCOD5GIsezo8nAiAKlQmMzVZPigRIFYjcPf0swFEu/QIiP0tXvs5iM+n
         DIVNhcCmld3HZ8FMmQFDPygKe9I/FspTvMf1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923558; x=1729528358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzzBY1ZhFPH5/v/KiILlLgN1gmTiaKNc2dMaTmOv8CU=;
        b=g2Ka18kRzGeGG3ub+WFGuL6JkaVji1X/02cdtIX0821ESm2Y0PfYDZwNTOltM4wzmK
         IK3jRiO7h+oV9TAQtdZ/F9zgSgdl9tKtMQD9vS/4pCV1wDgjWTeuV6wRHTZhhjb15ocZ
         2RMxvgbyGIP/37FBD0E27z2ImTLnPci5T3e9oIIh4Zv4ZniIljYf3/rTWruOJU5oPMg/
         4IFlhY/mfoR4K5AGtgMY53RQ0MWLueCbRa3k3BEwlE71kF0xgJm0Tn0VDwPagoT14M9d
         nymaKk5kQ2TzhAzc/GBiALREOyV6B8cokm34BWU36yvkeDT7G5qzOkPq2UqjEt9j3EsL
         8nNg==
X-Gm-Message-State: AOJu0YzOcvr38fa88KMQpUYq1kD2L/C7pMjzZ0XvskxTZPYl1nkQ99hI
	nHgVCd5RYQKXvk9WUpbrY8rh75MQ+pyKtbxYT2lKBb8faVvRKJsvssJCQkBtcXIl7EYbdvC+hCF
	NDdoWUZDTIG9s/G0zGak+XbNMroXv8fdG9oU2Eb7tukTfMl7cabU=
X-Google-Smtp-Source: AGHT+IGCgPZQ5ZwwUmoSWntLgX+L53Ng2T+9p2seArTPOPdv0Xp4dITbcwKIrxgjknnzAy4gxIDLC7CgUJWl23RwSSo=
X-Received: by 2002:a05:6808:2119:b0:3e3:a7f2:1aa4 with SMTP id
 5614622812f47-3e5c90b9da8mr8375209b6e.8.1728923557749; Mon, 14 Oct 2024
 09:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
In-Reply-To: <Zw05Tb8UvCQAIo+n@l14>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 14 Oct 2024 17:32:26 +0100
Message-ID: <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
> > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > index 1199291d2b..23ad274c89 100644
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,4 +1,5 @@
> >  obj-bin-y +=3D head.o
> > +obj-bin-y +=3D built_in_32.o
>
> I don't quite like that this new object name is "built_in_32.o",
> It's really closed to "built_in.*" which is used by Rules.mk to collect
> all objects in a subdirectory. I don't really have a better suggestion at
> the moment.
>

It was cbundle.o before, but people preferred built_in_32.o.
It's a collection of object files like built_in.o so it does not seem
so bad to me.
But seen other replies, some other people prefer "bundle".

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
> > @@ -25,14 +23,34 @@ $(obj32): XEN_CFLAGS :=3D $(CFLAGS_x86_32) -fpic
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
> > -
> > -%.lnk: %.32.o $(src)/build32.lds
> > -     $(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> > -
> > -clean-files :=3D *.lnk *.bin
> > +$(obj)/build32.final.lds: AFLAGS-y +=3D -DFINAL
> > +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.=
S FORCE
> > +     $(call if_changed_dep,cpp_lds_S)
> > +
> > +# link all 32bit objects together
> > +$(obj)/built_in_32.tmp.o: $(obj32)
> > +     $(LD32) -r -o $@ $^
> > +
> > +$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.tmp.=
o
> > +## link bundle with a given layout
>
> Could you put the comment aligned with the rest of the recipe? That way
> it won't visually separate the rule into several pieces. You can
> prefix it with @ so it doesn't show in build logs:
>
>         @# comments
>

Yes, they look more or less the same but technically pretty different.
The "## XXX" is a comment for make command, the "\t@#comment" is a way
to tell make to not print the command before launching it so make will
launch a shell command "# comment".
Yes, indentation does not make it clear. Not that launching a shell to
execute a comment will take a long time. On the other hand, here that
comment is more for the rule than for the shell. Maybe something like

target:
      command \
           # do something

(personally I found it even more ugly)

> > +     $(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$(*=
F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
>
> I think this wants to be: -T $(filter %.lds,$^) -Map $(patsubst %.bin,%.m=
ap,$@) -o $(patsubst %.bin,%.o,$@) $(filter %.o,$^)
>
> :-(, maybe that's lots of $(patsubst,), not sure which is better between
> $(patsubst,) and using the stem $*.
>

Not strong about stem or patsubst.
The 2 filters seem good, they suggest lds for the script and objects
for the input, which makes sense.

> Also, if something tries to use built_in_32.tmp.bin, we have a rule that
> remove it's prerequisite.
>
> BTW, everything is kind of temporary in a build system, beside the few
> files that we want to install on a machine, so having a target named
> with "*tmp*" isn't great. But having a rule that create "*tmp*" file but
> remove them before the end of its recipe is fine (or those *tmp* aren't
> use outside of this recipe).
>

Mumble... yes, I think the XX.tmp.o was a temporary internal rule file.
So we still don't agree on one name, and now we want to find also
another, tricky.
More or less if it can help, one is a 32 bit object file that bundle
together multiple 32 bits object files while the other is the
conversion of the 32 bits bundle file to 64 bits.
XXX_32.o and XXX_32as64.o ??

> > +## extract binaries from object
> > +     $(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
> > +     rm -f $(obj)/built_in_32.$(*F).o
> > +
> > +# generate final object file combining and checking above binaries
> > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.=
final.bin
>
> So, "other" isn't part of "final", I don't really know what those two
> things contains so naming wise I can't suggest anything useful.
>
> But, is "built_in_32.S" really only depends on those two .bin? SHouldn't
> it get regenerated if the script changes, or the .lds that --script
> option seems to use? What is the "--map" option, an input or output?

Both map file and linker script are dependency of the bin files so no probl=
ems.
Yes, potentially you want to generate if the python script change.
Potentially also if Makefile, make, ld or any other command change,
but that possibly is kind of "we don't usually care".

> But I guess we can ignore the ".map" file because it's part of the
> ".bin".
>

Yes, I suppose they are, although we can make it explicit both
generating them and using as dependencies.

> Another thing that might be useful to do, is to use the "if_changed"
> make macro, that way if the command line of the script changes, make
> can remake the output. But maybe it's a bit complicated for this recipe
> because it doesn't uses $< or $^.
>

I usually simply add Makefile to the dependencies. It works too.

> > +     $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> > +             --script $(obj)/build32.final.lds \
> > +             --bin1 $(obj)/built_in_32.other.bin \
> > +             --bin2 $(obj)/built_in_32.final.bin \
> > +             --map $(obj)/built_in_32.final.map \
> > +             --exports cmdline_parse_early,reloc \
> > +             --output $@
> > +
> > +clean-files :=3D built_in_32.*.bin built_in_32.*.map build32.*.lds
> > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.=
lds.S
> > similarity index 70%
> > rename from xen/arch/x86/boot/build32.lds
> > rename to xen/arch/x86/boot/build32.lds.S
> > index 56edaa727b..50c167aef0 100644
> > --- a/xen/arch/x86/boot/build32.lds
> > +++ b/xen/arch/x86/boot/build32.lds.S
> > @@ -15,22 +15,47 @@
> >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > -ENTRY(_start)
> > +#ifdef FINAL
> > +# define GAP 0
> > +# define MULT 0
> > +# define TEXT_START
> > +#else
> > +# define GAP 0x010200
> > +# define MULT 1
> > +# define TEXT_START 0x408020
> > +#endif
> > +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
>
> Is  ^ this a stray space?
>

Yes, a single ASCII character 32. Surely we don't want tabs. Other
parts of the file use 2 spaces indentation, others 8 spaces. Or are
you suggesting to not indent them?

>
> Overall, it's kind of mostly style comment that I had, so feel free to
> ignore most of them.
>

Naming can be cumbersome but usually helps readability.

> Cheers,
>
> --
>
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>

Frediano

