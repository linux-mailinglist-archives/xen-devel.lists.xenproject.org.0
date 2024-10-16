Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B892F9A045E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819634.1233093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zTX-0005pH-SQ; Wed, 16 Oct 2024 08:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819634.1233093; Wed, 16 Oct 2024 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zTX-0005mq-Ol; Wed, 16 Oct 2024 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 819634;
 Wed, 16 Oct 2024 08:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0zTW-0005mc-MJ
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:33:46 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a9ad453-8b99-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 10:33:44 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5e5b5715607so361317eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 01:33:44 -0700 (PDT)
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
X-Inumbo-ID: 5a9ad453-8b99-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729067623; x=1729672423; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azditVijaAgaL//+6f2JjVPbZEUHT+OesQroxv5VlzM=;
        b=Lkgqc6O50oRWjHbHQ925A1uMslFcVGIRE976yOEWUIrNJHa2esqa60ueQneB9WSp7t
         FA86K20QL+BRUWuA7Vj8fUzL4OYAnBGpv0XGsshz5sdowCJH+aAGbB1jaxgyHW3DHWUW
         eIeuWgBlsJZoYUZFPbgE+ZtPP84Ja1PhJAsdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067623; x=1729672423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azditVijaAgaL//+6f2JjVPbZEUHT+OesQroxv5VlzM=;
        b=lTGyyYb/IeG9p7+8+VJwbDEFs8kQfBH6pxvztFIxtOKa5GiJT1jKipfTCy/DvXR4LP
         QMBks2faMU/LTkroZhPEO1ivc2LAXoRziNksXyUgsKSBpCxyHzFx6STeOZYvIczp8M/1
         yOAKDgvmLtBZrM5qYm+KAQl4679Jaes2kr3mFRjo+aBPc1FQH1GdW/2NSLQACrmjM6Tn
         M0LFjFwnNi4fruIERSfoLkDVP6pdWofrQDi8mquRI46rXy9Y4IQIARxiOmYym0ceH/px
         MuFElUO4Z35uN+OdwEbgduUbardYpsk1IhUzoe9HzRljArHHXbWkCJQwt/WzxY/JXzn1
         PdAg==
X-Gm-Message-State: AOJu0YwUMJJ6QFLIs5UmvQosXYZlhlP8J6Xdj2CQhjzIqj/9SUTUbjYe
	x5yxGvM38ospSiSb17ZBBGsZ29CZLuw587iNChWrTnQ5w29g+fLnp1YfgA+ZOfnt/Op67xtVN5U
	t0zn6bXDLvWwzMrucQtu+O7xJ7RYNxqLfFk46SA==
X-Google-Smtp-Source: AGHT+IE0rwF/yJB13ZD52nhWRDEYzKIpGI++oh9e9MsksSMbeU5b7M4cxTlWCXVI5BxnavVDBaz/IY27R6xPOqMhdhs=
X-Received: by 2002:a05:6820:5104:b0:5eb:61b1:a74b with SMTP id
 006d021491bc7-5eb61b1a80fmr370382eaf.0.1729067623019; Wed, 16 Oct 2024
 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
 <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com> <Zw5zSURbpInM5oBY@l14>
In-Reply-To: <Zw5zSURbpInM5oBY@l14>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 16 Oct 2024 09:33:32 +0100
Message-ID: <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 2:51=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
> > On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD
> > <anthony.perard@vates.tech> wrote:
> > >
> > > On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
> > > > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefil=
e
> > > > index 1199291d2b..23ad274c89 100644
> > > > --- a/xen/arch/x86/boot/Makefile
> > > > +++ b/xen/arch/x86/boot/Makefile
> > > > @@ -1,4 +1,5 @@
> > > >  obj-bin-y +=3D head.o
> > > > +obj-bin-y +=3D built_in_32.o
> > >
> > > I don't quite like that this new object name is "built_in_32.o",
> > > It's really closed to "built_in.*" which is used by Rules.mk to colle=
ct
> > > all objects in a subdirectory. I don't really have a better suggestio=
n at
> > > the moment.
> > >
> >
> > It was cbundle.o before, but people preferred built_in_32.o.
> > It's a collection of object files like built_in.o so it does not seem
> > so bad to me.
> > But seen other replies, some other people prefer "bundle".
>
> Yeah, I guess it's ok (built_in_32 that is; now that I gave a better
> review of the rest of the Makefile changes).
>

Renamed to built-in-32 for CODING_STYLE

> > > > @@ -9,9 +10,6 @@ targets   +=3D $(obj32)
> > > >
> > > >  obj32 :=3D $(addprefix $(obj)/,$(obj32))
> > > >
> > > > -$(obj)/head.o: AFLAGS-y +=3D -Wa$(comma)-I$(obj)
> > > > -$(obj)/head.o: $(obj32:.32.o=3D.bin)
> > > > -
> > > >  CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(XEN_TREEWIDE_=
CFLAGS))
> > > >  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > > >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=
=3D3
> > > > @@ -25,14 +23,34 @@ $(obj32): XEN_CFLAGS :=3D $(CFLAGS_x86_32) -fpi=
c
> > > >  $(obj)/%.32.o: $(src)/%.c FORCE
> > > >       $(call if_changed_rule,cc_o_c)
> > > >
> > > > +orphan-handling-$(call ld-option,--orphan-handling=3Derror) :=3D -=
-orphan-handling=3Derror
> > > >  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) :=3D --no-war=
n-rwx-segments
> > > >  LDFLAGS_DIRECT +=3D $(LDFLAGS_DIRECT-y)
> > > >  LD32 :=3D $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> > > >
> > > > -%.bin: %.lnk
> > > > -     $(OBJCOPY) -j .text -O binary $< $@
> > > > -
> > > > -%.lnk: %.32.o $(src)/build32.lds
> > > > -     $(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> > > > -
> > > > -clean-files :=3D *.lnk *.bin
> > > > +$(obj)/build32.final.lds: AFLAGS-y +=3D -DFINAL
> > > > +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.=
lds.S FORCE
> > > > +     $(call if_changed_dep,cpp_lds_S)
>
> Could you add:
>
>     targets +=3D build32.final.lds build32.other.lds
>

Added

> otherwise, the if_changes macro doesn't work, and the target keeps been
> rebuilt. `make V=3D2` will tell you the same thing.
>
> > > > +# link all 32bit objects together
> > > > +$(obj)/built_in_32.tmp.o: $(obj32)
> > > > +     $(LD32) -r -o $@ $^
> > > > +
> > > > +$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.=
tmp.o
> > > > +## link bundle with a given layout
> > >
> > > Could you put the comment aligned with the rest of the recipe? That w=
ay
> > > it won't visually separate the rule into several pieces. You can
> > > prefix it with @ so it doesn't show in build logs:
> > >
> > >         @# comments
> > >
> >
> > Yes, they look more or less the same but technically pretty different.
> > The "## XXX" is a comment for make command, the "\t@#comment" is a way
> > to tell make to not print the command before launching it so make will
> > launch a shell command "# comment".
> > Yes, indentation does not make it clear. Not that launching a shell to
> > execute a comment will take a long time. On the other hand, here that
> > comment is more for the rule than for the shell. Maybe something like
> >
> > target:
> >       command \
> >            # do something
> >
> > (personally I found it even more ugly)
>
> How about removing the comments? I mean the command line is
> self-explanatory here. Same thing about the objcopy comment.
> (Or a comment before the rule, when really needed)
>

Moved on top of the rule (slightly changed).

> > > > +     $(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32=
.$(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
> > >
> > > I think this wants to be: -T $(filter %.lds,$^) -Map $(patsubst %.bin=
,%.map,$@) -o $(patsubst %.bin,%.o,$@) $(filter %.o,$^)
> > >
> > > :-(, maybe that's lots of $(patsubst,), not sure which is better betw=
een
> > > $(patsubst,) and using the stem $*.
> > >
> >
> > Not strong about stem or patsubst.
>
> Actually, I found a better suggestion (after reading the previous path
> which remind me about an existing feature that I don't really use), the
> use of Substitution References
> (https://www.gnu.org/software/make/manual/make.html#Substitution-Refs)
>
> This is a shorter version than patsubst, but works very well here, the
> recipe can look like this:
>     $(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=3Dmap) -o $(@:bin=
=3Do) $(filter %.o,$^)
>     $(OBJCOPY) -j .text -O binary $(@:bin=3Do) $@
>     rm -f $(@:bin=3Do)
>
> (It is likely fine to keep the reference to the lds script as $<,
> instead of using $(filter,).)
>

Done

> BTW, do we need the rules that generate the input of this rules
> (built_in_32.tmp.o that is), or can this one takes all 32bit objects as
> input?
>

Better not to do it In some conditions it can generate slightly
different results (like different object alignments) making the
algorithm fail.

> > The 2 filters seem good, they suggest lds for the script and objects
> > for the input, which makes sense.
>
> > > Also, if something tries to use built_in_32.tmp.bin, we have a rule t=
hat
> > > remove it's prerequisite.
> > >
> > > BTW, everything is kind of temporary in a build system, beside the fe=
w
> > > files that we want to install on a machine, so having a target named
> > > with "*tmp*" isn't great. But having a rule that create "*tmp*" file =
but
> > > remove them before the end of its recipe is fine (or those *tmp* aren=
't
> > > use outside of this recipe).
> > >
> >
> > Mumble... yes, I think the XX.tmp.o was a temporary internal rule file.
> > So we still don't agree on one name, and now we want to find also
> > another, tricky.
> > More or less if it can help, one is a 32 bit object file that bundle
> > together multiple 32 bits object files while the other is the
> > conversion of the 32 bits bundle file to 64 bits.
> > XXX_32.o and XXX_32as64.o ??
>
> We may not need the rule for it :-).
>

Not sure if we are asking a change and how.

> > > > +## extract binaries from object
> > > > +     $(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
> > > > +     rm -f $(obj)/built_in_32.$(*F).o
> > > > +
> > > > +# generate final object file combining and checking above binaries
> > > > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in=
_32.final.bin
> > >
> > > So, "other" isn't part of "final", I don't really know what those two
> > > things contains so naming wise I can't suggest anything useful.
>
> Instead of "other", is "control" (like in science experiment where you
> have a control group), or "offseted" (which seems to be how this second
> binary is constructed) would be better names for this *.bin? It seems
> the script take both input and play the game of the 7 differences, to
> find clues about the location of some symbols, right?.
>

I don't know the game and I think people not familiar with it won't
find new names more readable but less.
Not saying that current names are good, they just need to be located
at different addresses with some "magic" in the middle.

> > > But, is "built_in_32.S" really only depends on those two .bin? SHould=
n't
> > > it get regenerated if the script changes, or the .lds that --script
> > > option seems to use? What is the "--map" option, an input or output?
> >
> > Both map file and linker script are dependency of the bin files so no p=
roblems.
> > Yes, potentially you want to generate if the python script change.
> > Potentially also if Makefile, make, ld or any other command change,
> > but that possibly is kind of "we don't usually care".
>
> Actually, for the hypervisor, we usually care about changes which could
> lead to a different output. While changes of build toolchain aren't
> really track (even if there's a patch that have a small improvement
> toward it that was never committed), many other changes are been tracked
> and act upon. The macros $(if_changes*,) from Linux's Kbuild are a great
> help.
>
> If the build system doesn't regenerate targets when a developer try to
> debug some complex problem, it isn't going to help. We can easily have a
> situation where the developer adds printf earlier and earlier and
> earlier to try to find out where Xen crash, to find out later that the
> build system was working against them by not rebuilding the file that
> should be rebuilt. So if we can avoid some frustration and time lost,
> it's better :-).
>
> > > But I guess we can ignore the ".map" file because it's part of the
> > > ".bin".
> > >
> >
> > Yes, I suppose they are, although we can make it explicit both
> > generating them and using as dependencies.
>
> Having a rule that generate several targets is complicated to write in
> GNU Make 3.80, the rule is more likely to be called several time in
> parallel. So let's ignored the .map file, as it should only be used
> along side the .bin.
>
> > > Another thing that might be useful to do, is to use the "if_changed"
> > > make macro, that way if the command line of the script changes, make
> > > can remake the output. But maybe it's a bit complicated for this reci=
pe
> > > because it doesn't uses $< or $^.
> > >
> >
> > I usually simply add Makefile to the dependencies. It works too.
>
> Having "Makefile" as prerequisite is both too much and not enough. This
> lead to rebuild due to unrelated changes in the Makefile and if the
> command line change (like more command line option modified in a variable
> in a different Makefile or the environment) the target doesn't gets
> rebuilt.
>
> That's where $(if_changed,) helps.
>
> > > > +     $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> > > > +             --script $(obj)/build32.final.lds \
> > > > +             --bin1 $(obj)/built_in_32.other.bin \
> > > > +             --bin2 $(obj)/built_in_32.final.bin \
> > > > +             --map $(obj)/built_in_32.final.map \
> > > > +             --exports cmdline_parse_early,reloc \
> > > > +             --output $@
>
> I can think of one example where $(if_changed,) is going to really help,
> by looking at this command line:
>     One does update the .c file to add a function that they like to
>     export, run `make`, realize they forgot to update the makefile so
>     update it, run `make`, it's still doesn't work...
>     Maybe run `make clean; make`, or something else...
>
> So, could you use $(if_changed,) ?
> Probably:
> quiet_cmd_combine =3D GEN     $@
> cmd_combine =3D $(PYTHON) ...
> $(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.fin=
al.bin FORCE
>     $(call if_changes,combine)
> targets +=3D built_in_32.S
>
> GEN, for generate, or it could be PY instead, because python script can
> be slow to compile which could explain why the build system output is
> making a pause on this target (on slow machines that is). Or it could be
> COMBINE, or something else, but it's not really necessary to explain,
> the target name is often enough to figure out what's happening, when
> needed.
>

It just looks more complicated to me. It happened to me, if you don't
use the exported symbol no reason to have it exported from the object,
if you use it the link will fail and it won't take long to fix it.

> > > > +
> > > > +clean-files :=3D built_in_32.*.bin built_in_32.*.map build32.*.lds
> > > > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/buil=
d32.lds.S
> > > > similarity index 70%
> > > > rename from xen/arch/x86/boot/build32.lds
> > > > rename to xen/arch/x86/boot/build32.lds.S
> > > > index 56edaa727b..50c167aef0 100644
> > > > --- a/xen/arch/x86/boot/build32.lds
> > > > +++ b/xen/arch/x86/boot/build32.lds.S
> > > > @@ -15,22 +15,47 @@
> > > >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> > > >   */
> > > >
> > > > -ENTRY(_start)
> > > > +#ifdef FINAL
> > > > +# define GAP 0
> > > > +# define MULT 0
> > > > +# define TEXT_START
> > > > +#else
> > > > +# define GAP 0x010200
> > > > +# define MULT 1
> > > > +# define TEXT_START 0x408020
>
> So I've read the python script a bit, and notice that the two values GAP
> and TEXT_START are also written verbatim in it, without comment, so
> looks like magic number there. Could you at least put a comment in the
> python script? (Something thing that could be better were if the
> Makefile itself provided those number to both the lds script and the
> python script, but I don't know if it's possible.)
>

It can be done I suppose:
- 2 macros in Makefile
- pass values into linker scripts using variables
- 2 options for Python script
- pass values to Python script

> > > > +#endif
> > > > +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> > >
> > > Is  ^ this a stray space?
> > >
> >
> > Yes, a single ASCII character 32. Surely we don't want tabs. Other
> > parts of the file use 2 spaces indentation, others 8 spaces. Or are
> > you suggesting to not indent them?
>
> Yes, that what "stray" imply, also I mean only the last line as imply by
> the use singular. Sorry, I could have try to be a bit more precise.
>
> All the indentation within the #ifdef #endif are fine, but why is
> #define still indented after the last #endif?
>

Oh.. that single space. Historic, copy&paste, there were 2 defines in
the past one for each block. Removed.

> > >
> > > Overall, it's kind of mostly style comment that I had, so feel free t=
o
> > > ignore most of them.
> > >
> >
> > Naming can be cumbersome but usually helps readability.
>
> Yes, also sorry for the half-baked previous review, it could have been be=
tter.
>
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

