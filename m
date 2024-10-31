Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232919B7C34
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828714.1243701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vdw-0006nc-04; Thu, 31 Oct 2024 13:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828714.1243701; Thu, 31 Oct 2024 13:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vdv-0006lA-T9; Thu, 31 Oct 2024 13:55:19 +0000
Received: by outflank-mailman (input) for mailman id 828714;
 Thu, 31 Oct 2024 13:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=35SK=R3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6Vdu-0006kc-KW
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 13:55:18 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a37e3b-978f-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 14:55:14 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c935d99dc5so1246426a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 06:55:14 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5649405dsm73003866b.10.2024.10.31.06.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 06:55:12 -0700 (PDT)
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
X-Inumbo-ID: c0a37e3b-978f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMwYTM3ZTNiLTk3OGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzgyOTE0LjE1NjcyOCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730382913; x=1730987713; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiCRnpXsSiY6bncEVllpoxXx/3NG00oLxBsTZ3Gkekw=;
        b=fAcc0cO5oLiW2CKg9raFgLLf1dlrAhet3X15wzt4Lpt4TclDAZQh2TXlDFCivdF91M
         D3pgtjKBeJTvC3xUfVFEMoK4QoflB8CbRSbVTSjaf1ifl93mO//RUexKaxD3KWTJetxZ
         SZcIEd5eXxrg7jP+e9KUBSM/1zdLepiYoMf5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382913; x=1730987713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YiCRnpXsSiY6bncEVllpoxXx/3NG00oLxBsTZ3Gkekw=;
        b=ookeDfKk4di4WxacywzkMLfAO5bQBq9nQH9IbfTl0HOVo9Gwxi6LgWiFKLtTAvFipG
         ajZx0R6TUxUF8hN2JyVaGWiKGUyQSYMtO8U24IqyN8Gwg8qMGH9xT63Ko3sl29+eLFCe
         jFEKioImo5U0H/S4E5i/1+X3HLld9ntVrSB9ZFha2f039BzP8da/+q7f7DIbJ5P1bSay
         qVDiEfvxt0JGKMiaer2LMLANlL0wdyKs9NFP5tX2+wuxj8kESMlWdUqo1jqSumOU2md1
         GjID1xttGZEgWHm11CpahsehfbvZsY17UTpnqkvW8buhx1PzeNXW87b3HkIRLDXyG5B+
         6PRA==
X-Forwarded-Encrypted: i=1; AJvYcCUI67xsHyC8MFfltBHVKjGyKqVyMnhije57OKSSPWqL8uWh5jl4sGL+nonlDupYAVUqJzwlTWqKIs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+KHW2aHQyChik1cEAmGBcoyV+NUacyKzOOgIvrPTflnrAcI7j
	mvEhWu5ZaWXNry/YvUVih+SQgaKjvOf72X8jTi/HDmI7R5Tu1TVRlU+lCwsYRKk=
X-Google-Smtp-Source: AGHT+IGyJ654FLwZob/s13RukOu0q09Ahoz34ujpCPTeT1dTKazZUq1igw/Nkzcqf/66c6dcB7Keug==
X-Received: by 2002:a17:907:ea0:b0:a99:f9d6:5590 with SMTP id a640c23a62f3a-a9de6331185mr1861225066b.60.1730382913361;
        Thu, 31 Oct 2024 06:55:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 13:55:10 +0000
Message-Id: <D5A1JR5UB8PT.HIR8RAR7ZJBS@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall"
 <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Christian Lindig"
 <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive
 types
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <3bf067c7-617c-42c0-bf6d-4387d97658ae@suse.com>
 <D598HGJY330K.3NA7GQLUSJJ9K@cloud.com>
 <dbc778eb-0c5f-4b99-ab04-020f8b69738b@suse.com>
In-Reply-To: <dbc778eb-0c5f-4b99-ab04-020f8b69738b@suse.com>

On Thu Oct 31, 2024 at 7:57 AM GMT, Jan Beulich wrote:
> On 30.10.2024 16:08, Alejandro Vallejo wrote:
> >=20
> > In the course of preparing this answer I just noticed that altp2m_opts =
suffers
> > from the exact same annoyance, with the exact same fix. I just noticed =
while
> > rebasing my Rust branch.
>
> Hardly the only other one. See GTF_type_mask or XEN_DOMCTL_PFINFO_LTAB_MA=
SK.
>
> > On Wed Oct 30, 2024 at 9:14 AM GMT, Jan Beulich wrote:
> >> On 29.10.2024 19:16, Alejandro Vallejo wrote:
> >>> Non-boolean bitfields in the hypercall ABI make it fairly inconvenien=
t to
> >>> create bindings for any language because (a) they are always ad-hoc a=
nd are
> >>> subject to restrictions regular fields are not (b) require boilerplat=
e that
> >>> regular fields do not and (c) might not even be part of the core lang=
uage,
> >>> forcing avoidable external libraries into any sort of generic library=
.
> >>>
> >>> This patch (it's a series merely to split roughly by maintainer) is o=
ne such
> >>> case that I happened to spot while playing around. It's the grant_ver=
sion
> >>> field, buried under an otherwise empty grant_opts.
> >>>
> >>> The invariant I'd like to (slowly) introduce and discuss is that fiel=
ds may
> >>> have bitflags (e.g: a packed array of booleans indexed by some enumer=
ated
> >>> type), but not be mixed with wider fields in the same primitive type.=
 This
> >>> ensures any field containing an integer of any kind can be referred b=
y pointer
> >>> and treated the same way as any other with regards to sizeof() and th=
e like.
> >>
> >> While I don't strictly mind, I'm also not really seeing why taking add=
resses
> >> or applying sizeof() would be commonly necessary. Can you perhaps prov=
ide a
> >> concrete example of where the present way of dealing with grant max ve=
rsion
> >> is getting in the way? After all your use of the term "bitfield" doesn=
't
> >> really mean C's understanding of it, so especially (c) above escapes m=
e to a
> >> fair degree.
> >=20
> > Wall of text ahead, but I'll try to stay on point. The rationale should=
 become
> > a lot clearer after I send an RFC series with initial code to autogener=
ate some
> > hypercall payloads from markup. The biggest question is: Can I create a
> > definition language such that (a) it precisely represents the Xen ABI a=
nd (b)
> > is fully type-safe under modern strongly-typed languages?
> >=20
> > I already have a backbone I can define the ABI in, so my options when I=
 hit
> > some impedance mismatch are:
> >=20
> >   1. Change the ABI so it matches better my means of defining it.
> >   2. Change the means to define so it captures the existing ABI better.
> >=20
> > Most of the work I've done has moved in the (2) direction so far, but I=
 found a
> > number of pain points when mapping the existing ABI to Rust that, while=
 not
> > impossible to work around, are quite annoying for no clear benefit. If
> > possible, I'd like to simplify the cognitive load involved in defining,=
 using
> > and updating hypercalls rather than bending over backwards to support a
> > construct that provides no real benefit. IOW: If I can define an ABI th=
at is
> > _simpler_, it follows that it's also easier to not make mistakes and it=
's
> > easier to generate code for it.
> >=20
> > The use of packed fields is one such case. Even in C, we create extra m=
acros
> > for creating a field, modifying it, fetching it, etc. Patches 2-6 are s=
trict
> > code removals. And even in the most extreme cases the space savings are=
 largely
> > irrelevant because the hypercall has a fixed size. We do want to pack _=
flags_
> > as otherwise the payload size would explode pretty quickly on hypercall=
s with
> > tons of boolean options, but I'm not aware of that being problematic fo=
r wider
> > subfields (like the grant max version).
> >=20
> > Now, being more concrete...
> >=20
> > ##################################################################
> > # IDL is simpler if the size is a property of the type
> > ##################################################################
> >=20
> > Consider the definition of the (new) max_grant_version type under the I=
DL I'm
> > working on (it's TOML, but I don't particularly care about which markup=
 we end
> > up using).
> >=20
> >   [[enums]]
> >   name =3D "xen_domaincreate_max_grant_version"
> >   description =3D "Content of the `max_grant_version` field of the doma=
in creation hypercall."
> >   typ =3D { tag =3D "u8" }
> >=20
> >   [[enums.variants]]
> >   name =3D "off"
> >   description =3D "Must be used with gnttab support compiled out"
> >   value =3D 0
> >=20
> >   [[enums.variants]]
> >   name =3D "v1"
> >   description =3D "Allow the domain to use up to gnttab_v1"
> >   value =3D 1
> >=20
> >   [[enums.variants]]
> >   name =3D "v2"
> >   description =3D "Allow the domain to use up to gnttab_v2"
> >   value =3D 2
> >=20
> > Note that I can define a type being enumerated, can choose its specific
> > variants and its width is a property of the type itself. With bitfields=
 you're
> > always in a weird position of the width not being part of the type that=
 goes
> > into it.
> >=20
> > Should I need it as a field somewhere, then...
> >=20
> >   [[structs.fields]]
> >   name =3D "max_grant_version"
> >   description =3D "Maximum grant table version the domain may be bumped=
 to"
> >   typ =3D { tag =3D "enum", args =3D "xen_domaincreate_max_grant_versio=
n" }
> >=20
> > ... at which point the size of the field is given by an intrinsic prope=
rty of
> > the type (the typ property on the enums table) I previously defined. It=
's
> > extensible, composable and allows me to generate readable code in both =
C and
> > Rust.
> >=20
> > Should I need to support full bitfields I would require a means of stat=
ing the
> > start and end bits of every field, which is very bad for the sanity of =
whoever
> > wants to maintain coherency in the ABI.
> >=20
> > ##################################################################
> > # Rust and Go don't like bitfields...
> > ##################################################################
> >=20
> > ... and neither does C, even if for historic reasons they do exist in t=
he
> > standard.
>
> I don't think that's just for historic reasons. To interface with hardwar=
e,
> alternative approaches are often more cumbersome. See how we're (slowly)
> moving to using bitfields more in Xen, in favor of tons of #define-s and
> more or less open-coded masking operations.
>
> > On a slight tangent, neither Rust nor Go support bitfields in the
> > core language. This was a deliberate design decision of their respectiv=
e
> > designers. I can't speak for Go as I'm not a Go developer, but Rust doe=
s have a
> > very well-known, well-supported and very common external crate ("bitfla=
gs")
> > that allows very ergonomic semantics for definition of packed booleans.=
 As an
> > example here's the flags for domain create, as spitted out by the gener=
ator I
> > have.
> >=20
> > (comments removed for brevity). This defines a bitmap indexed by the fl=
ags
> > type, represented by a 32bit primitive. It's type-safe from the PoV tha=
t I
> > can't just write 1 << 15 to a variable of this type and expect anything=
 but
> > screams from the compiler.
> >=20
> >   bitflags! {
> >       #[repr(C)]
> >       #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
> >       pub struct XenDomaincreateFlags: u32 {
> >           const Hvm =3D 1 << 0;
> >           const Hap =3D 1 << 1;
> >           const S3Integrity =3D 1 << 2;
> >           const OosOff =3D 1 << 3;
> >           const XsDomain =3D 1 << 4;
> >           const Iommu =3D 1 << 5;
> >           const NestedVirt =3D 1 << 6;
> >           const Vpmu =3D 1 << 7;
> >       }
> >   }
> >=20
> > This enables callers to have type-safe variables in a pretty ergonomic =
fashion:
> >=20
> >   let flags =3D XenDomainCreateFlags::Hvm |
> >               XenDomainCreateFlags::Hap |
> >               XenDomainCreateFlags::Iommu;
> >=20
> > and assignments to its related struct would follow regular assignment r=
ules.
> >=20
> > ##################################################################
> > # IOW
> > ##################################################################
> >=20
> > Supporting general bitfields is annoying, even in C. Adding support in =
IDL for
> > them is a headache if we want the descriptions to help us catch mistake=
s and
> > language support is poor using this constructs (at best).
> >=20
> > Can we please get rid of them?
>
> I remain undecided. If we set forth as a goal to avoid such in the new AB=
I
> that has been mentioned for many years, that would be a more clear cut.

That's the direction I want to move on, but there's a chicken-and-egg
situation. I want to avoid the effort I'm putting in adding cross-language
support to the hypercall boundary to be necessarily gated on introducing a
whole new ABI that hasn't yet been openly discussed. And at the same time, =
I'd
like the IDL to provide comfortable means to statically validate the invari=
ants
we impose on the new ABI. Simpler semantics make for simpler validation.

IOW, it's not modifying EVERYTHING so it fits in my little hole that I'm af=
ter,
but a general nod that for future changes this would be taken into account =
to
avoid taking one forward and two back every other fortnight

>
> Just taking the example of the gnttab max version: By switching to
>
>     uint8_t max_grant_version;
>     uint8_t rsvd0[3];
>
> you actively make it more cumbersome to re-use the rest of the 32-bit fie=
ld
> as (boolean) flags.

Only the following 8 bits. The last 16 can become a uint16_t worth of flags
without issues. Note that this minor annoyance is becasuse of the redefinit=
ion
of a uint32_t as a composite, not because of having unpacked fields.

> It may reasonably work for the first 8, with early
> provisions it may also work for 16, yet it'll be harder / uglier for more
> than that.

But at that point you're discussing the effects of a binary-compatible
re-definition of an existing field, not the effects of new fields on any
hypercall. While stylistically desirable, nothing forces grant-related fiel=
ds
to be adjacent in the struct.

You are right that should we need 20 new bits this reserved array wouldn't =
be
very adequate to hold them. But it doesn't have to. We're free to allocate =
a
new field, just as we would if we needed 31 new bits rather than 20. In
practice when we need a few bits in the future I'd expect to just allocate
the last 16bits out of the array, turn them into a uint16_t, and use that a=
s a
flags field.

Or I can redefine the whole 32bits to be the max_grant_version/altp2m_mode.

Both options are binary compatible, and I went for this one in order to giv=
e
back some unused space.

> Allowing such is, after all, the idea behind the present
> "packing". (The issue would similarly exist in the new ABI, yet we could
> simply decide up front that we're willing to pay that price, perhaps even
> outlining up front how to best limit undesirable effects when doing so.)

Just a note that adding fields need not break the ABI. It happens to do so =
in
this hypercall because "arch" can itself change, but that wouldn't be an AB=
I
breakage if it was passed as a pointer instead (which we ought to do if we
happen to break the ABI again before new ABI lands).

>
> Just to mention it - you didn't really answer the sizeof() / address-taki=
ng
> question I raised. You provided a lot of other _useful_ background though=
.
>
> Jan

There's nothing major in those two. It's an existing restriction on packed
fields we could lift by unpacking them. The real meat is in the rest of the
background rationale.

Things are slightly more annoying in Rust because I might be forced to give=
 a
mutable reference to the whole packed field (and hope the callee only mutat=
es
what I want it to) in cases where I would rather give a single mutable
reference to one of its constituents instead. Not major, but annoying.

By far the biggest sigh would be having to describe hypercalls by bit offse=
ts
rather than simpler primitive types.

Cheers,
Alejandro

