Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AB9B6706
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 16:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828288.1243160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6AJT-0006jv-E2; Wed, 30 Oct 2024 15:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828288.1243160; Wed, 30 Oct 2024 15:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6AJT-0006iD-BC; Wed, 30 Oct 2024 15:08:47 +0000
Received: by outflank-mailman (input) for mailman id 828288;
 Wed, 30 Oct 2024 15:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6AJS-0006i7-Hu
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 15:08:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d927501f-96d0-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 16:08:41 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so859674766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 08:08:41 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b30f58991sm573811366b.159.2024.10.30.08.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 08:08:40 -0700 (PDT)
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
X-Inumbo-ID: d927501f-96d0-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ5Mjc1MDFmLTk2ZDAtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzAwOTIxLjM5OTE5Niwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730300921; x=1730905721; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fCPrXdzKU9A5ktmalVD/c3ZJOVao6JDehvFDz9nCs8=;
        b=W+RKsC+ur3ttlhTBFVasdndlJstog2kEhm5CTvUKcvBFB24sK+8rQMFpxUZUsiU8AG
         p9NP2q6hZ21QZ3w9Cu+Uaaw9ueLs5w4VRhYbvNdnkViq0rdIi1VJcXQ/XkAEAWf4bMqy
         fb0ZX0Ptwb1UeBTAvld+5SmI3BEzwt3N6RhxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300921; x=1730905721;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6fCPrXdzKU9A5ktmalVD/c3ZJOVao6JDehvFDz9nCs8=;
        b=jvo/EjCz9iNz1lgf1Pn2Qk3M/V/uv4TVLN5i4EcevZDJ98MIRlkc3dfTh9sOl0Rn6V
         9MkPGYbfRsLTAOvxpJToGwvzejiVJKMdxtpqoiXW82UJlGCxiO64x/I/vaa8aDuuA54H
         zrrW9nRRQgK5zkTzD+SOW8JwFn4kugcq5HBENzoridjWM+LxL4Im/h3XlIFhtpXuj4oC
         pMPa6/0msVEXzakvswAkBNPsQHTsgLsfMVQTQcn6OHZ9s0riFAvo+SXixLaS5A/LXTmo
         //gvfYpahfl7XCQGUIvzvV00mb2KL0+O3Dax5r8eiBPXgnPSjgFCv1oAZsv5D/X+YhVU
         406w==
X-Forwarded-Encrypted: i=1; AJvYcCXSdyZMfWPeKf/xWA6P6xUzb3HMrlQ5MSUqauSL7DyJPy224JA2Kw4eRWBRLiqnhzdwSUVaWt9+AeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPygjWaCjE1MspvRI4AOed1SEzIaJsihlPhtGRPT4dWAD8MbUe
	Wiw7D2EdY8y4xmnsP24fvcprppazdHfw2Uv8cEEotxckaiMrGs8XatPg96K8d/A=
X-Google-Smtp-Source: AGHT+IFH0TZyn0X38HyeYobQOJwhcvzogUsAQ52dx7vON1fs7W4gvMkMiwVOk0Hr4yObMBW63rzT3A==
X-Received: by 2002:a17:907:6093:b0:a9a:26a5:d508 with SMTP id a640c23a62f3a-a9e3a5757c8mr323086966b.9.1730300920642;
        Wed, 30 Oct 2024 08:08:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 15:08:38 +0000
Message-Id: <D598HGJY330K.3NA7GQLUSJJ9K@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
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
X-Mailer: aerc 0.18.2
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <3bf067c7-617c-42c0-bf6d-4387d97658ae@suse.com>
In-Reply-To: <3bf067c7-617c-42c0-bf6d-4387d97658ae@suse.com>


In the course of preparing this answer I just noticed that altp2m_opts suff=
ers
from the exact same annoyance, with the exact same fix. I just noticed whil=
e
rebasing my Rust branch.

On Wed Oct 30, 2024 at 9:14 AM GMT, Jan Beulich wrote:
> On 29.10.2024 19:16, Alejandro Vallejo wrote:
> > Non-boolean bitfields in the hypercall ABI make it fairly inconvenient =
to
> > create bindings for any language because (a) they are always ad-hoc and=
 are
> > subject to restrictions regular fields are not (b) require boilerplate =
that
> > regular fields do not and (c) might not even be part of the core langua=
ge,
> > forcing avoidable external libraries into any sort of generic library.
> >=20
> > This patch (it's a series merely to split roughly by maintainer) is one=
 such
> > case that I happened to spot while playing around. It's the grant_versi=
on
> > field, buried under an otherwise empty grant_opts.
> >=20
> > The invariant I'd like to (slowly) introduce and discuss is that fields=
 may
> > have bitflags (e.g: a packed array of booleans indexed by some enumerat=
ed
> > type), but not be mixed with wider fields in the same primitive type. T=
his
> > ensures any field containing an integer of any kind can be referred by =
pointer
> > and treated the same way as any other with regards to sizeof() and the =
like.
>
> While I don't strictly mind, I'm also not really seeing why taking addres=
ses
> or applying sizeof() would be commonly necessary. Can you perhaps provide=
 a
> concrete example of where the present way of dealing with grant max versi=
on
> is getting in the way? After all your use of the term "bitfield" doesn't
> really mean C's understanding of it, so especially (c) above escapes me t=
o a
> fair degree.

Wall of text ahead, but I'll try to stay on point. The rationale should bec=
ome
a lot clearer after I send an RFC series with initial code to autogenerate =
some
hypercall payloads from markup. The biggest question is: Can I create a
definition language such that (a) it precisely represents the Xen ABI and (=
b)
is fully type-safe under modern strongly-typed languages?

I already have a backbone I can define the ABI in, so my options when I hit
some impedance mismatch are:

  1. Change the ABI so it matches better my means of defining it.
  2. Change the means to define so it captures the existing ABI better.

Most of the work I've done has moved in the (2) direction so far, but I fou=
nd a
number of pain points when mapping the existing ABI to Rust that, while not
impossible to work around, are quite annoying for no clear benefit. If
possible, I'd like to simplify the cognitive load involved in defining, usi=
ng
and updating hypercalls rather than bending over backwards to support a
construct that provides no real benefit. IOW: If I can define an ABI that i=
s
_simpler_, it follows that it's also easier to not make mistakes and it's
easier to generate code for it.

The use of packed fields is one such case. Even in C, we create extra macro=
s
for creating a field, modifying it, fetching it, etc. Patches 2-6 are stric=
t
code removals. And even in the most extreme cases the space savings are lar=
gely
irrelevant because the hypercall has a fixed size. We do want to pack _flag=
s_
as otherwise the payload size would explode pretty quickly on hypercalls wi=
th
tons of boolean options, but I'm not aware of that being problematic for wi=
der
subfields (like the grant max version).

Now, being more concrete...

##################################################################
# IDL is simpler if the size is a property of the type
##################################################################

Consider the definition of the (new) max_grant_version type under the IDL I=
'm
working on (it's TOML, but I don't particularly care about which markup we =
end
up using).

  [[enums]]
  name =3D "xen_domaincreate_max_grant_version"
  description =3D "Content of the `max_grant_version` field of the domain c=
reation hypercall."
  typ =3D { tag =3D "u8" }

  [[enums.variants]]
  name =3D "off"
  description =3D "Must be used with gnttab support compiled out"
  value =3D 0

  [[enums.variants]]
  name =3D "v1"
  description =3D "Allow the domain to use up to gnttab_v1"
  value =3D 1

  [[enums.variants]]
  name =3D "v2"
  description =3D "Allow the domain to use up to gnttab_v2"
  value =3D 2

Note that I can define a type being enumerated, can choose its specific
variants and its width is a property of the type itself. With bitfields you=
're
always in a weird position of the width not being part of the type that goe=
s
into it.

Should I need it as a field somewhere, then...

  [[structs.fields]]
  name =3D "max_grant_version"
  description =3D "Maximum grant table version the domain may be bumped to"
  typ =3D { tag =3D "enum", args =3D "xen_domaincreate_max_grant_version" }

... at which point the size of the field is given by an intrinsic property =
of
the type (the typ property on the enums table) I previously defined. It's
extensible, composable and allows me to generate readable code in both C an=
d
Rust.

Should I need to support full bitfields I would require a means of stating =
the
start and end bits of every field, which is very bad for the sanity of whoe=
ver
wants to maintain coherency in the ABI.

##################################################################
# Rust and Go don't like bitfields...
##################################################################

... and neither does C, even if for historic reasons they do exist in the
standard. On a slight tangent, neither Rust nor Go support bitfields in the
core language. This was a deliberate design decision of their respective
designers. I can't speak for Go as I'm not a Go developer, but Rust does ha=
ve a
very well-known, well-supported and very common external crate ("bitflags")
that allows very ergonomic semantics for definition of packed booleans. As =
an
example here's the flags for domain create, as spitted out by the generator=
 I
have.

(comments removed for brevity). This defines a bitmap indexed by the flags
type, represented by a 32bit primitive. It's type-safe from the PoV that I
can't just write 1 << 15 to a variable of this type and expect anything but
screams from the compiler.

  bitflags! {
      #[repr(C)]
      #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
      pub struct XenDomaincreateFlags: u32 {
          const Hvm =3D 1 << 0;
          const Hap =3D 1 << 1;
          const S3Integrity =3D 1 << 2;
          const OosOff =3D 1 << 3;
          const XsDomain =3D 1 << 4;
          const Iommu =3D 1 << 5;
          const NestedVirt =3D 1 << 6;
          const Vpmu =3D 1 << 7;
      }
  }

This enables callers to have type-safe variables in a pretty ergonomic fash=
ion:

  let flags =3D XenDomainCreateFlags::Hvm |
              XenDomainCreateFlags::Hap |
              XenDomainCreateFlags::Iommu;

and assignments to its related struct would follow regular assignment rules=
.

##################################################################
# IOW
##################################################################

Supporting general bitfields is annoying, even in C. Adding support in IDL =
for
them is a headache if we want the descriptions to help us catch mistakes an=
d
language support is poor using this constructs (at best).

Can we please get rid of them?

>
> > I'd like to have a certain consensus about this general point before go=
ing
> > establishing this restriction in the IDL system I'm working on.
> >=20
> > My preference would be to fold everything into a single patch if we dec=
ide to
> > follow through with this particular case. As I said before, the split i=
s
> > artificial for review.
>
> That's not just a preference, but a requirement, or else the build will b=
reak
> in the middle of the series (harming bisection at the very least).
>
> Jan

Yes, indeed. As I said, I'm more interested in the discussion now rather th=
an
the details of committing it.

Cheers,
Alejandro

