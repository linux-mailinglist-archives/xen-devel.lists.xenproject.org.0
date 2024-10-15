Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C499EE2C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 15:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819201.1232488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0hxA-00063n-M6; Tue, 15 Oct 2024 13:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819201.1232488; Tue, 15 Oct 2024 13:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0hxA-00060e-J8; Tue, 15 Oct 2024 13:51:12 +0000
Received: by outflank-mailman (input) for mailman id 819201;
 Tue, 15 Oct 2024 13:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ede6=RL=bounce.vates.tech=bounce-md_30504962.670e734b.v1-83347e98641045a8b4fecea3cf005f14@srs-se1.protection.inumbo.net>)
 id 1t0hx9-00060V-IG
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 13:51:11 +0000
Received: from mail186-1.suw21.mandrillapp.com
 (mail186-1.suw21.mandrillapp.com [198.2.186.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877fd267-8afc-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 15:51:09 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4XSb972qmyzBsThdf
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 13:51:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 83347e98641045a8b4fecea3cf005f14; Tue, 15 Oct 2024 13:51:07 +0000
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
X-Inumbo-ID: 877fd267-8afc-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729000267; x=1729260767;
	bh=gzZg6UEljP8T81s1pJ+1JDrId+580NlT2jt8ZXi5zAI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZkPMMXy8XA4pjF5zrEp/o2CZQYalDlKYcR4yCuqr1NiaIGzRU/cYvWPtxrAb97Wjs
	 dMGVW4wb984KJGvCvTeq4zBvylCtqUxoSH5VgvDriI5798PyOgsaQzxzyxVEayfuM1
	 tgyR+Ka38Yo0VKTYBYXwPIBJxx6L1fGzdnRGEFeKx8Abt3jbCxNhlti+vbIsmMftQn
	 hUznAe8HGfU/8WYbV6Nj2Q5KTeG87ghHBdIWhcPdSPHEX3bE6aKn8RVDtsTFiTqO0h
	 cLty381OLTVTtPTiLWvZud5wCFrhiCx0Fb4VR6dtJa54yX/mpIIkZM8M0kZw2sbeRt
	 hSjTAXnoLUnrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729000267; x=1729260767; i=anthony.perard@vates.tech;
	bh=gzZg6UEljP8T81s1pJ+1JDrId+580NlT2jt8ZXi5zAI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ea9PVLQ8iWqQd6vMI04BOQQBvYTvTbaba1yrTjQ+qlXk0jvLD+O93cDkgMbi6/S+j
	 wKrCLWEiViTI8A/bLePTRuoE4wjb7KN8bTSYgEK6wryFAv5wsgCoq8Qh9U05/HiCjq
	 diO40Dgjz27kMFd6z97k1ASYgCnZs1vLWtiD8oJVBo9DknPJNaVVJEcusv4ywb0IHl
	 SiUOyEmu1l0eDRACNWkQ0bdnRs+MSvoTxjxCGXGfhV7xqng7nMbO5iJxedB5pWMe8s
	 2gWxt1zmSDHEe/PEFbxUZalKyuqNHPsrZ/79VtA47Cl/7Uw3g8bTcS4nh22EttNtx5
	 iaDozkbmdsFng==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/6]=20x86/boot:=20create=20a=20C=20bundle=20for=2032=20bit=20boot=20code=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729000265969
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zw5zSURbpInM5oBY@l14>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com> <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14> <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
In-Reply-To: <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.83347e98641045a8b4fecea3cf005f14?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241015:md
Date: Tue, 15 Oct 2024 13:51:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
> On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD
> <anthony.perard@vates.tech> wrote:
> >
> > On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
> > > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > > index 1199291d2b..23ad274c89 100644
> > > --- a/xen/arch/x86/boot/Makefile
> > > +++ b/xen/arch/x86/boot/Makefile
> > > @@ -1,4 +1,5 @@
> > >  obj-bin-y +=3D head.o
> > > +obj-bin-y +=3D built_in_32.o
> >
> > I don't quite like that this new object name is "built_in_32.o",
> > It's really closed to "built_in.*" which is used by Rules.mk to collect
> > all objects in a subdirectory. I don't really have a better suggestion =
at
> > the moment.
> >
> 
> It was cbundle.o before, but people preferred built_in_32.o.
> It's a collection of object files like built_in.o so it does not seem
> so bad to me.
> But seen other replies, some other people prefer "bundle".

Yeah, I guess it's ok (built_in_32 that is; now that I gave a better
review of the rest of the Makefile changes).

> > > @@ -9,9 +10,6 @@ targets   +=3D $(obj32)
> > >
> > >  obj32 :=3D $(addprefix $(obj)/,$(obj32))
> > >
> > > -$(obj)/head.o: AFLAGS-y +=3D -Wa$(comma)-I$(obj)
> > > -$(obj)/head.o: $(obj32:.32.o=3D.bin)
> > > -
> > >  CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(XEN_TREEWIDE_CF=
LAGS))
> > >  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=
=3D3
> > > @@ -25,14 +23,34 @@ $(obj32): XEN_CFLAGS :=3D $(CFLAGS_x86_32) -fpic
> > >  $(obj)/%.32.o: $(src)/%.c FORCE
> > >       $(call if_changed_rule,cc_o_c)
> > >
> > > +orphan-handling-$(call ld-option,--orphan-handling=3Derror) :=3D --o=
rphan-handling=3Derror
> > >  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) :=3D --no-warn-=
rwx-segments
> > >  LDFLAGS_DIRECT +=3D $(LDFLAGS_DIRECT-y)
> > >  LD32 :=3D $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> > >
> > > -%.bin: %.lnk
> > > -     $(OBJCOPY) -j .text -O binary $< $@
> > > -
> > > -%.lnk: %.32.o $(src)/build32.lds
> > > -     $(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> > > -
> > > -clean-files :=3D *.lnk *.bin
> > > +$(obj)/build32.final.lds: AFLAGS-y +=3D -DFINAL
> > > +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.ld=
s.S FORCE
> > > +     $(call if_changed_dep,cpp_lds_S)

Could you add:

    targets +=3D build32.final.lds build32.other.lds

otherwise, the if_changes macro doesn't work, and the target keeps been
rebuilt. `make V=3D2` will tell you the same thing.

> > > +# link all 32bit objects together
> > > +$(obj)/built_in_32.tmp.o: $(obj32)
> > > +     $(LD32) -r -o $@ $^
> > > +
> > > +$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.tm=
p.o
> > > +## link bundle with a given layout
> >
> > Could you put the comment aligned with the rest of the recipe? That way
> > it won't visually separate the rule into several pieces. You can
> > prefix it with @ so it doesn't show in build logs:
> >
> >         @# comments
> >
> 
> Yes, they look more or less the same but technically pretty different.
> The "## XXX" is a comment for make command, the "\t@#comment" is a way
> to tell make to not print the command before launching it so make will
> launch a shell command "# comment".
> Yes, indentation does not make it clear. Not that launching a shell to
> execute a comment will take a long time. On the other hand, here that
> comment is more for the rule than for the shell. Maybe something like
> 
> target:
>       command \
>            # do something
> 
> (personally I found it even more ugly)

How about removing the comments? I mean the command line is
self-explanatory here. Same thing about the objcopy comment.
(Or a comment before the rule, when really needed)

> > > +     $(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$=
(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
> >
> > I think this wants to be: -T $(filter %.lds,$^) -Map $(patsubst %.bin,%=
.map,$@) -o $(patsubst %.bin,%.o,$@) $(filter %.o,$^)
> >
> > :-(, maybe that's lots of $(patsubst,), not sure which is better betwee=
n
> > $(patsubst,) and using the stem $*.
> >
> 
> Not strong about stem or patsubst.

Actually, I found a better suggestion (after reading the previous path
which remind me about an existing feature that I don't really use), the
use of Substitution References
(https://www.gnu.org/software/make/manual/make.html#Substitution-Refs)

This is a shorter version than patsubst, but works very well here, the
recipe can look like this:
    $(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=3Dmap) -o $(@:bin=3D=
o) $(filter %.o,$^)
    $(OBJCOPY) -j .text -O binary $(@:bin=3Do) $@
    rm -f $(@:bin=3Do)

(It is likely fine to keep the reference to the lds script as $<,
instead of using $(filter,).)

BTW, do we need the rules that generate the input of this rules
(built_in_32.tmp.o that is), or can this one takes all 32bit objects as
input?

> The 2 filters seem good, they suggest lds for the script and objects
> for the input, which makes sense.

> > Also, if something tries to use built_in_32.tmp.bin, we have a rule tha=
t
> > remove it's prerequisite.
> >
> > BTW, everything is kind of temporary in a build system, beside the few
> > files that we want to install on a machine, so having a target named
> > with "*tmp*" isn't great. But having a rule that create "*tmp*" file bu=
t
> > remove them before the end of its recipe is fine (or those *tmp* aren't
> > use outside of this recipe).
> >
> 
> Mumble... yes, I think the XX.tmp.o was a temporary internal rule file.
> So we still don't agree on one name, and now we want to find also
> another, tricky.
> More or less if it can help, one is a 32 bit object file that bundle
> together multiple 32 bits object files while the other is the
> conversion of the 32 bits bundle file to 64 bits.
> XXX_32.o and XXX_32as64.o ??

We may not need the rule for it :-).

> > > +## extract binaries from object
> > > +     $(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
> > > +     rm -f $(obj)/built_in_32.$(*F).o
> > > +
> > > +# generate final object file combining and checking above binaries
> > > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_3=
2.final.bin
> >
> > So, "other" isn't part of "final", I don't really know what those two
> > things contains so naming wise I can't suggest anything useful.

Instead of "other", is "control" (like in science experiment where you
have a control group), or "offseted" (which seems to be how this second
binary is constructed) would be better names for this *.bin? It seems
the script take both input and play the game of the 7 differences, to
find clues about the location of some symbols, right?.

> > But, is "built_in_32.S" really only depends on those two .bin? SHouldn'=
t
> > it get regenerated if the script changes, or the .lds that --script
> > option seems to use? What is the "--map" option, an input or output?
> 
> Both map file and linker script are dependency of the bin files so no pro=
blems.
> Yes, potentially you want to generate if the python script change.
> Potentially also if Makefile, make, ld or any other command change,
> but that possibly is kind of "we don't usually care".

Actually, for the hypervisor, we usually care about changes which could
lead to a different output. While changes of build toolchain aren't
really track (even if there's a patch that have a small improvement
toward it that was never committed), many other changes are been tracked
and act upon. The macros $(if_changes*,) from Linux's Kbuild are a great
help.

If the build system doesn't regenerate targets when a developer try to
debug some complex problem, it isn't going to help. We can easily have a
situation where the developer adds printf earlier and earlier and
earlier to try to find out where Xen crash, to find out later that the
build system was working against them by not rebuilding the file that
should be rebuilt. So if we can avoid some frustration and time lost,
it's better :-).

> > But I guess we can ignore the ".map" file because it's part of the
> > ".bin".
> >
> 
> Yes, I suppose they are, although we can make it explicit both
> generating them and using as dependencies.

Having a rule that generate several targets is complicated to write in
GNU Make 3.80, the rule is more likely to be called several time in
parallel. So let's ignored the .map file, as it should only be used
along side the .bin.

> > Another thing that might be useful to do, is to use the "if_changed"
> > make macro, that way if the command line of the script changes, make
> > can remake the output. But maybe it's a bit complicated for this recipe
> > because it doesn't uses $< or $^.
> >
> 
> I usually simply add Makefile to the dependencies. It works too.

Having "Makefile" as prerequisite is both too much and not enough. This
lead to rebuild due to unrelated changes in the Makefile and if the
command line change (like more command line option modified in a variable
in a different Makefile or the environment) the target doesn't gets
rebuilt.

That's where $(if_changed,) helps.

> > > +     $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> > > +             --script $(obj)/build32.final.lds \
> > > +             --bin1 $(obj)/built_in_32.other.bin \
> > > +             --bin2 $(obj)/built_in_32.final.bin \
> > > +             --map $(obj)/built_in_32.final.map \
> > > +             --exports cmdline_parse_early,reloc \
> > > +             --output $@

I can think of one example where $(if_changed,) is going to really help,
by looking at this command line:
    One does update the .c file to add a function that they like to
    export, run `make`, realize they forgot to update the makefile so
    update it, run `make`, it's still doesn't work...
    Maybe run `make clean; make`, or something else...

So, could you use $(if_changed,) ?
Probably:
quiet_cmd_combine =3D GEN     $@
cmd_combine =3D $(PYTHON) ...
$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final=
.bin FORCE
    $(call if_changes,combine)
targets +=3D built_in_32.S

GEN, for generate, or it could be PY instead, because python script can
be slow to compile which could explain why the build system output is
making a pause on this target (on slow machines that is). Or it could be
COMBINE, or something else, but it's not really necessary to explain,
the target name is often enough to figure out what's happening, when
needed.

> > > +
> > > +clean-files :=3D built_in_32.*.bin built_in_32.*.map build32.*.lds
> > > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build3=
2.lds.S
> > > similarity index 70%
> > > rename from xen/arch/x86/boot/build32.lds
> > > rename to xen/arch/x86/boot/build32.lds.S
> > > index 56edaa727b..50c167aef0 100644
> > > --- a/xen/arch/x86/boot/build32.lds
> > > +++ b/xen/arch/x86/boot/build32.lds.S
> > > @@ -15,22 +15,47 @@
> > >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> > >   */
> > >
> > > -ENTRY(_start)
> > > +#ifdef FINAL
> > > +# define GAP 0
> > > +# define MULT 0
> > > +# define TEXT_START
> > > +#else
> > > +# define GAP 0x010200
> > > +# define MULT 1
> > > +# define TEXT_START 0x408020

So I've read the python script a bit, and notice that the two values GAP
and TEXT_START are also written verbatim in it, without comment, so
looks like magic number there. Could you at least put a comment in the
python script? (Something thing that could be better were if the
Makefile itself provided those number to both the lds script and the
python script, but I don't know if it's possible.)

> > > +#endif
> > > +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> >
> > Is  ^ this a stray space?
> >
> 
> Yes, a single ASCII character 32. Surely we don't want tabs. Other
> parts of the file use 2 spaces indentation, others 8 spaces. Or are
> you suggesting to not indent them?

Yes, that what "stray" imply, also I mean only the last line as imply by
the use singular. Sorry, I could have try to be a bit more precise.

All the indentation within the #ifdef #endif are fine, but why is
#define still indented after the last #endif?

> >
> > Overall, it's kind of mostly style comment that I had, so feel free to
> > ignore most of them.
> >
> 
> Naming can be cumbersome but usually helps readability.

Yes, also sorry for the half-baked previous review, it could have been bett=
er.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


