Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7E9D9749
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 13:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843697.1259315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFufY-0007nV-W2; Tue, 26 Nov 2024 12:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843697.1259315; Tue, 26 Nov 2024 12:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFufY-0007lF-T1; Tue, 26 Nov 2024 12:27:52 +0000
Received: by outflank-mailman (input) for mailman id 843697;
 Tue, 26 Nov 2024 12:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEbF=SV=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFufX-0007l9-OE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 12:27:51 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d776df7f-abf1-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 13:27:46 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ffc3f2b3a9so30688511fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 04:27:46 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa533b04d87sm450276766b.97.2024.11.26.04.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 04:27:44 -0800 (PST)
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
X-Inumbo-ID: d776df7f-abf1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmEiLCJoZWxvIjoibWFpbC1sajEteDIyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ3NzZkZjdmLWFiZjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjI0MDY2LjM2OTg3NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732624066; x=1733228866; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXB1EGV+ZOevMMaqUmppIUl5c5hInUzInu2PPh6msWY=;
        b=GnJZ5Anl4yutt16He5uREYrnnhOKDNhfO5zQfNmaE2NXTPTQQ4XqKso70ab4ecaFE9
         +R0Z6m/S7dciw75Lzf8bOmBH9gIPS0MNXiZlpr2ZVT12ZO6SJbtNXzuY41qeaXgEj+Kc
         wQmsyvuDcrKOvj43N1qj3e/oIuDi+Dc6oOMgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732624066; x=1733228866;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EXB1EGV+ZOevMMaqUmppIUl5c5hInUzInu2PPh6msWY=;
        b=Z6o+PD80VQWWnI+b23Auo1+wjqoP0Achef9n65SqC8uvXz4oBuHwNuWDAzFG7Vqs31
         KPpNqkLIbhMP4USb+amxFjoxKz8iP1VYMD4KuOnE47kSuBQ1W02Gyd7EINw1fpXEU0Wm
         siH5Uf4ekeVjfoyuEmDpVMjk65lHhwN9/azsj20O7Mhof4BKjN4uZIfwfPtuoTg70Z61
         kGqXDNxmH2Bn9edlmf7NgW4lyWt9DwBbfKcDEzpI8GRjhNkPvO9a/GIMC18WmiLCEeQs
         B/1vB9dZfmuwvbXG+nuWkngsqYVSue70BJqrOBwYUp4GNS0ZQY9UcJ+yrZQww6kA+QBO
         e7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVevirxMh+6Tn269U8SIj9QxBhqLr3QaF3mL72rWx5O2DXHVuzqfXdieV8bxWeEfKOZuE9/U5WZWIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgsc//JYLHS/aen9YnVM0AlWf7jATXjGRMsSt3/V3p1jEKaFYp
	TCxWs5LFmFIjsxvBSy0LiEasVjCHWNx2Tb/TntZ8b/TC9csGhiFVEPL2QuU/KJA=
X-Gm-Gg: ASbGncsMhV0SE59nUBA9t3XJMC4/MdKoTRb2F6nTD5sTnrs1H3Q6B883RqqUzzlYI3c
	ZdZIgyNL3j+mW4QI92FHPoZaSa8PFVKdlnJByTFdS6I0JZFCAE51WntHgugRNUFo+U1ETY0hibK
	zB+oCxuFyMocaOnzX/kmTMftBqmapqC1qcTOXOVa5t9F3Msa0NAfogRJzODeZqV4wmhDsxru0Vx
	btkR2dSiMKXBEeXwZMBqOTnaDBYZ787kiiXEBz/VKmtXFK7a+Ec2/ypdhK9K7t7F4lvBEy1vGLB
	DfwB
X-Google-Smtp-Source: AGHT+IH3sgkjD7DjfEDySgT8A2nBLXegLzImJ+T5vrOzzt6ZjAmSzp1la5+DKarZLJmYUbJSnsKvQQ==
X-Received: by 2002:a05:6512:3406:b0:53d:a4e0:c3ca with SMTP id 2adb3069b0e04-53dd39a4eb0mr11460386e87.43.1732624065435;
        Tue, 26 Nov 2024 04:27:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Nov 2024 12:27:43 +0000
Message-Id: <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Samuel Thibault"
 <samuel.thibault@ens-lyon.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
 <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
In-Reply-To: <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>

On Tue Nov 26, 2024 at 9:40 AM GMT, Jan Beulich wrote:
> On 25.11.2024 19:51, Alejandro Vallejo wrote:
> > On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
> >> On 15.11.2024 12:51, Alejandro Vallejo wrote:
> >>> Describe sysctl/readconsole as a TOML specification, remove old
> >>> hand-coded version and replace it with autogenerated file.
> >>>
> >>> While at it, transform the console driver to use uint8_t rather than
> >>> char in order to mandate the type to be unsigned and ensure the ABI i=
s
> >>> not defined with regards to C-specific types.
> >>
> >> Yet the derived C representation imo then should still be using char, =
not
> >> uint8_t.
> >=20
> > There's 2 issued addressed by this patch.
> >=20
> >   1. The removal of char from the external headers (and the Xen driver)=
.
> >   2. The replacement of the existing struct by the autogenerated one.
> >=20
> > (1) wants doing irrespective of (2). char has neither a fixed width nor=
 a fixed
> > sign. Which is irrelevant for ABI purposes in this case because what we=
 really
> > meant is "give me a pointer" in this hypercall, but it may be important=
 in
> > other cases.
> >=20
> > IOW, char should've never made it to the definition of the public ABI, =
and I'm
> > merely taking the chance to take it out. Happy to extract this patch an=
d send
> > it separately.
>
> Well, work towards fully getting char out of the public headers may indee=
d be
> worthwhile. Otoh with char being the basic addressing granularity, I thin=
k
> the ABI is pretty much tied to sizeof(char) =3D=3D 1, imo limiting the
> worthwhile-ness quite a bit.

Let me put it another way. If I were to create a separate patch stripping c=
har
and using uint8_t instead, what are my chances of getting an Acked-by? Or n=
ot a
NAK, at least. (there's other maintainers that I need that from, but one st=
ep
at a time).

>
> Signed-ness of plain char doesn't really matter as long as it's used only=
 for
> what really are characters (or strings thereof). And that looks the be pr=
etty
> much the case throughout the public headers.

Maybe. Still, as a general principle caller and callee ought to agree on si=
ze,
alignment and sign for every type. I'd rather not make exceptions for that
invariant unless truly well motivated. And in this case it's a case of
requiring trivial non-functional changes.

>
> >> In particular it would be a good sign if the Xen sources wouldn't
> >> need to change, unlike happens here (altering types of a few internals=
 of
> >> the console machinery).
> >=20
> > And that would be the case if Xen had uniform naming conventions and it=
s ABI
> > was fully unambiguous. The process of uniformizing the naming conventio=
n and
> > disambiguating the ABI is bound to cause (non-functional) changes, most=
ly in
> > the naming conventions side of things.
> >=20
> > Naming conventions can be _MOSTLY_ sorted by creating compat #defines a=
nd
> > typedefs that match the old types. I can do that, but note that even th=
en some
> > code would have to change in order to i.e: s/struct OLD_NAME/NEW_NAME_T=
/
>
> Here we already disagree: I think we'd better avoid any typedef-s in the =
public
> interface when they're not strictly needed (e.g. in order to declare asso=
ciated
> handles). Imo we simply shouldn't introduce more into the name space than
> actually required.

I really don't want to pollute the spec files with tidbits of how C happene=
d to
case its identifiers originally.

> > If this is deemed important for backporting changes, I can do it for in=
vasive
> > replacements, like the createdomain flags.
> >=20
> > On the topic of changing types, The present case is an ABI inconsistenc=
y case.
> > My intention is to keep the ABI fixed as a matter of principle (if anyt=
hing,
> > because the domU ABI cannot be changed). However, changing the way C re=
presents
> > said ABI is a requirement if the current definition is ambiguous. In th=
ose
> > cases we ought to change C to ensure there's one and only one way of
> > interpreting it.
>
> I wonder what concrete cases of ambiguity you're thinking of here.
>

Anything where the size, alignment or sign of a type might not be up for
interpretation. This "char" case is one. So are things like xen_sysctl_memi=
nfo
due to using raw uint64_t rather than uint64_aligned_t.

> >>>  xen/include/public/autogen/sysctl.h           | 35 +++++++++++++++
> >>
> >> In the build tree, having an autogen subdir under public/ _may_ be oka=
y
> >> (personally I dislike even that). I didn't manage to spot adjustments =
to
> >> how files are eventually installed, yet at that point there clearly
> >> shouldn't be any autogen subdir(s) anymore. How the individual files c=
ome
> >> into existence is, imo, nothing consumers of the interface ought to (n=
eed
> >> to) care about.
> >=20
> > Anthony already mentioned an error while building QEMU, which I'm guess=
ing
> > comes from the same problem. The stitching is definitely up for discuss=
ion. I
> > got far enough to allow the compilation of `dist` to go through, but di=
dn't
> > think incredibly hard about the finer details (like the install targets=
).
> >=20
> > In principle, renaming `autogen` to `abi` and adding its contents to th=
e list of
> > installed headers ought to sort that particular concern?=20
>
> Not really, no. That only gives the child a different name. Imo the origi=
nal
> tree structure shouldn't change. By the end of the conversion work, all-
> generated stuff would simply replace all-hand-written stuff.

I'm afraid that introduces a lot of undue complexity. Putting everything
autogenerated in the same folder where only autogenerated headers live (fro=
m
the same generator) provides for easy ways of checking whether files are st=
ale
or not. Trying to surgically replace C would require either a C parser or m=
agic
tokens in the header (yuck!).

I want to avoid anyone having to explicitly include the new headers, but th=
ey
do definitely want to be installed in the targets alongside the rest of the
public headers. Because they are public headers.

>
> >>> --- /dev/null
> >>> +++ b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
> >>> @@ -0,0 +1,43 @@
> >>> +[[structs]]
> >>> +name =3D "xen_sysctl_readconsole"
> >>> +description =3D "Read console content from Xen buffer ring."
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "clear"
> >>> +description =3D "IN: Non-zero -> clear after reading."
> >>> +typ =3D { tag =3D "u8" }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "incremental"
> >>> +description =3D "IN: Non-zero -> start index specified by `index` fi=
eld."
> >>> +typ =3D { tag =3D "u8" }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "_pad"
> >>> +description =3D "Unused."
> >>> +typ =3D { tag =3D "u16" }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "index"
> >>> +description =3D """
> >>> +IN:  Start index for consuming from ring buffer (if @incremental);
> >>> +OUT: End index after consuming from ring buffer."""
> >>> +typ =3D { tag =3D "u32" }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "buffer"
> >>> +description =3D """
> >>> +IN: Virtual address to write console data.
> >>> +
> >>> +NOTE: The pointer itself is IN, but the contents of the buffer are O=
UT."""
> >>> +typ =3D { tag =3D "ptr", args =3D { tag =3D "u8" } }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "count"
> >>> +description =3D "IN: Size of buffer; OUT: Bytes written to buffer."
> >>> +typ =3D { tag =3D "u32" }
> >>> +
> >>> +[[structs.fields]]
> >>> +name =3D "rsvd0_a"
> >>> +description =3D "Tail padding reserved to zero."
> >>> +typ =3D { tag =3D "u32" }
> >>
> >> Up to here I wasn't able to spot any documentation on what it to be wr=
itten
> >> in which way.
> >=20
> > You're right that the specification is not itself specified. I neglecte=
d to do
> > so to avoid having to rewrite it should we settle on a different markup
> > language.
> >=20
> > Much of your confusion seems to stem from simultanuously looking at a n=
ew
> > markup language and a new schema for it. Let me try to unpick some of t=
hat...
> >=20
> >> I already struggle with the double square brackets. The TOML
> >> doc I found when searching the web doesn't have such. Taking just the =
example
> >> above also doesn't allow me to conclude how e.g. nested structures wou=
ld be
> >> specified.
> >=20
> > The schema is represented by the contents of `spec.rs`. All structs wit=
h a
> > Deserialize attribute (i.e: #[derive(Foo, Bar, Deserialize)]) map to so=
me
> > "table" in TOML.
> >=20
> > When I say "struct" now I mean a struct inside the generator that repre=
sents
> > the input file (_NOT_ a struct representing a hypercall).
> >=20
> > The rules are as follows. The whole file is deserialized in a single st=
ruct
> > (InFileDef). When there's a single square bracket (which I don't think =
I've
> > required yet), that means that what follows is a "table" with the name =
between
> > the brackets. There's several ways to represent table
> >=20
> >     Regular tables:           [foo]
> >                               bar =3D "some_bar"
> >                               baz =3D "some_baz"
> >=20
> >                               [foo2]
> >                               bar =3D "blergh"
> >=20
> >     Inline tables:            foo =3D { bar =3D "some_bar", baz =3D "so=
me_baz" }
> >                               foo2 =3D { bar =3D "blergh" }
> >=20
> > Both of those deserialize to the same thing (it's C for ease of explain=
ing it
> > here, but it's actually Rust in the generator).
> >=20
> >                 struct infiledef {
> >                     struct {
> >                         char *bar; // points to "some_bar"
> >                         char *baz; // points to "some_baz"
> >                     } foo;
> >                     struct {
> >                         char *bar; // points to "blergh"
> >                     } foo2;
> >                 };
> >=20
> > The double brackets are adding one more element to a "list"
> >=20
> > That is. This TOML...
> >=20
> >                              [[foos]]
> >                              bar =3D "some_bar"
> >                              baz =3D "some_baz"
> >=20
> >                              [[foos]]
> >                              bar =3D "some_bar"
> >                              baz =3D "some_baz"
> >=20
> > ... deserializes to...
> >=20
> >                 struct foodef {
> >                     char *bar;
> >                     char *baz;
> >                 }
> >=20
> >                 struct infiledef {
> >                     struct foodef *foos;
> >                 };
> >=20
> > The last bit of relevant information is that you can identify which tab=
le you
> > want to add to with dots. So [[structs.fields]] is saying "Add this fie=
ld to
> > the list of fields of the current hypercall struct".
> >=20
> > The "typ" field is a bit quirky (I have a solution to simplify it), but=
 that
> > uses inline tables.
> >=20
> >> Really, when talk was of some form of IDL, I expected to see
> >> something IDLish (im particular closer to typical programming language=
s we
> >> use). Whereas TOML, aiui, is more an easy language for config files of=
 all
> >> sorts.
> >=20
> > I might've been unclear in the talk. One of my goals is to _not_ define=
 a new
> > language. Or I'll just exchange one problem for two. Maybe I should've =
called
> > it an Interface Definition Schema, rather than Language.
> >=20
> > The key benefit here is that, while the generators can be tricky, the p=
arser is
> > all done and strictly specified. We can experiment with YAML (Anthony a=
lready
> > asked about it). But it really is a matter of getting used to. TOML is
> > fantastic for saving horizontal space. And multi-line comments are neat=
ly
> > organized.
>
> It may indeed be a matter of getting used to, yet I'm afraid your explana=
tions
> above make the situation yet more confusing, at least for the moment. Jus=
t to
> explain my expectations some: I don't really speak e.g. Python or Perl, b=
ut the
> languages are self-explanatory above that I can at least roughly follow n=
ot
> overly involved pieces of code written therein. An interface specificatio=
n imo
> certainly falls in the group of "not overly involved". Yet the (so far sm=
all)
> pieces of TOML that there aren't as self-explanatory as I'd have expected=
 them
> to be.

That's fair. I'll have it translated to YAML for comparison, as  I suspect
it'll be easier on the eye.

>
> >> What I have in mind wouldn't allow for descriptions, yet I'm not sure =
that's
> >> relevant. The description ought to, first of all, live in the primary =
source
> >> (i.e. the IDL itself) anyway. Commentary there might be possible to ex=
tract
> >> into proper (machine generated/derived) documentation.
> >=20
> > Not sure I follow, these TOML files _are_ the IDL itself.
> >=20
> > The descriptions here are propagated to the generated code, so they are
> > infinitely helpful when reaching the type via e.g: cscope, LSPs, etc.
>
> Yet they are full-fledged attributes, when normally I'd expect such to be
> comments (thus clearly separating "code" from "non-code").

A comment in TOML (or YAML) would stay at the markup because the parser wou=
ld
never see it. It must be an attribute so it's brought to it's intended
destination (the .h/.rs files). While it'd be desirable to have a connectio=
n
between the spec files and their generated counterparts at the LSP-level, I=
'm
not aware of any way of doing so. And by and large, unless you're actively
adding another hypercall, you really shouldn't care.

>
> As to propagating to generated code - hmm, yes, for use of cscope and ali=
ke
> it may indeed be helpful to propagate, if such tools can't associate back
> the generated files to their origins. My general take though is that
> generated code is something you look at as a human only when actually
> dealing with their generation. For all other purposes one would prefer th=
e
> "original" source.

I'd say it's the other way around. I only look at the source material when
working on the generation. In general, I care about what was generated (if
anything, because that's where cscope took me while traversing the tree.

Of course, all this assumes all information in the source file has been
propagated to the generated file. And that's the case here.

>
> >>> --- a/xen/drivers/char/console.c
> >>> +++ b/xen/drivers/char/console.c
> >>> @@ -42,6 +42,8 @@
> >>>  #include <asm/vpl011.h>
> >>>  #endif
> >>> =20
> >>> +#include <public/xen.h>
> >>
> >> Why would this be needed all of the sudden?
> >>
> >=20
> > Because of the new XEN_GUEST_HANDLE_64(uint8) type. The macro is quite =
ugly and
> > requires being declared ahead.
>
> How's that different from the earlier XEN_GUEST_HANDLE_PARAM(char)?

I'll have a go at removing it. I wrote that a while ago and I no longer
remember the specifics of why it was required.

>
> >>> --- /dev/null
> >>> +++ b/xen/include/public/autogen/sysctl.h
> >>> @@ -0,0 +1,35 @@
> >>> +/*
> >>> + * sysctl
> >>> + *
> >>> + * AUTOGENERATED. DO NOT MODIFY
> >>> + */
> >>> +#ifndef __XEN_AUTOGEN_SYSCTL_H
> >>> +#define __XEN_AUTOGEN_SYSCTL_H
> >>> +
> >>> +/* Read console content from Xen buffer ring. */
> >>> +struct xen_sysctl_readconsole {
> >>> +    /* IN: Non-zero -> clear after reading. */
> >>> +    uint8_t clear;
> >>> +    /* IN: Non-zero -> start index specified by `index` field. */
> >>> +    uint8_t incremental;
> >>> +    /* Unused. */
> >>> +    uint16_t _pad;
> >>> +    /*
> >>> +     * IN:  Start index for consuming from ring buffer (if @incremen=
tal);
> >>> +     * OUT: End index after consuming from ring buffer.
> >>> +     */
> >>> +    uint32_t index;
> >>> +    /*
> >>> +     * IN: Virtual address to write console data.
> >>> +     *
> >>> +     * NOTE: The pointer itself is IN, but the contents of the buffe=
r are OUT.
> >>> +     */
> >>> +    XEN_GUEST_HANDLE_64(uint8) buffer;
> >>> +    /* IN: Size of buffer; OUT: Bytes written to buffer. */
> >>> +    uint32_t count;
> >>> +    /* Tail padding reserved to zero. */
> >>> +    uint32_t rsvd0_a;
> >>> +};
> >>> +
> >>> +#endif /* __XEN_AUTOGEN_SYSCTL_H */
> >>> +
> >>
> >> If this file is auto-generated, why would it need committing? And yes,=
 there
> >> is the connected question: Will everyone then need to have a Rust comp=
iler
> >> available?
> >=20
> > Committing it is required precisely so that no one needs to have a Rust
> > compiler available.
>
> How would that work? If I make a change to what currently is a public hea=
der,
> I'd still need to have one available, wouldn't I?

If you want to make a change to the public ABI, then yes. But that's reason=
aly
rare. What I want to avoid is _everyone_ needing a Rust compiler just to bu=
ild,
or indeed pushing the Rust dependency as a build-dependency on every
downstream. That might come to pass, as the efforts to Rust-ify the toolsta=
ck
come to fruition, but we're not there yet.

As for one-off changes, it's actually fairly easy to determine what a new f=
ield
in the spec would look like in the final file. You could even write it by h=
and.
CI will validate the C headers match the spec outputs.

When they don't match, CI tells you the diff.

>
> > The last patch in the series checks the generated code
> > matches the specs byte by byte. It has the nice benefit that you can gi=
t-grep
> > for it and tags work even without compiling first. You also get all
> > architectures upfront and it's a lot easier to review changes to the ge=
nerator
> > because CI will scream to you if the outputs diverge.
> >=20
> >>
> >> Nit: For anything that is committed, it would be nice if those files w=
ere as
> >> tidy as possible style-wise. Most of the above looks entirely okay, ju=
st
> >> that there is an unnecessary trailing blank line.
> >=20
> > I did go out of my way to prettify the output.
> >=20
> > The trailing newline was intentional to make it C++03-compatible. I can=
 get rid
> > of it, as it doesn't matter a whole lot.
>
> I haven't followed the development of C++ very closely; my experience wit=
h it
> is mostly from far more than 20 years ago. What's that C++03 compatibilit=
y
> requirement?
>
> Jan

It's really unimportant. -Wnewline-eof, I think it was. There's a pedantic
paragraph in the C++ spec from 2003 that states that if a file is not
newline-terminated it's UB to parse it. I tend to newline-terminate my file=
s
for easy `cat`-ing them together in the rare occasions where that's useful =
for
something.

Regardless, it's trully unimportant, I'll just get rid of that final newlin=
e.

Cheers,
Alejandro

