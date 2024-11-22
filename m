Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0F9D5F8E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 14:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841863.1257345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tETSb-0006LV-G0; Fri, 22 Nov 2024 13:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841863.1257345; Fri, 22 Nov 2024 13:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tETSb-0006J4-DJ; Fri, 22 Nov 2024 13:12:33 +0000
Received: by outflank-mailman (input) for mailman id 841863;
 Fri, 22 Nov 2024 13:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMXp=SR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tETSZ-0006Iy-Pe
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 13:12:31 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b4b4ff4-a8d3-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 14:12:26 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so18629195e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 05:12:26 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fb6csm27111145e9.28.2024.11.22.05.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 05:12:25 -0800 (PST)
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
X-Inumbo-ID: 6b4b4ff4-a8d3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZiNGI0ZmY0LWE4ZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjgxMTQ2LjYwMjAyOCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732281146; x=1732885946; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJdU2uoyhGXNdHO4/ckna+U7ru3MKPip5SbgCQY/Q0A=;
        b=eRqhyf2hl/aIFE7vt9zUtnyE/eU+8X9AVrR51UeP3R8miHawu8UGk8uGq45sizFjkf
         CBYJA7//AOjVEu3eWllto09HUMwcblVffgO4J2kpXKDiblFPrzxpGVuh+A1E5S21TKBg
         RuRwpcE368WBJ2A4iawxrdI/alVY2XOtwzxgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732281146; x=1732885946;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJdU2uoyhGXNdHO4/ckna+U7ru3MKPip5SbgCQY/Q0A=;
        b=HXEMwLGbOfzDMfL9N13/H08W9m9gL4CzK7ruzSWgcxw+b9rLHEwNA7esNO2VslOB6D
         8wmSB2g4VSMeriPdjduu8RttNF/D7Kr4K0wB+A/n7vdR2hmntwjgtIcONwgQ2HNcAmT3
         m600qHNncTcJCpBBKxj8MCoI5//Gb6fW60Icbbs8Hw8rRVPGadg65eZ6y36CAuhKmh2f
         GB/PvUcqDmBZ2BoFHBTPPh/QdZTqolp9lZv9tOk/Q7OIfuDDIDABGwA62Fx5RRNTugVj
         R2NhliEBwJV8HDI9J/zQADTVXHjINiUSh1QglyQfDqb8X6nGXLCLuTyg12S25lkkYvxg
         cIxw==
X-Gm-Message-State: AOJu0YzDrNh72CGJVnPAlBoRAFx/W9/YF+rL4S0Z8BdzDB6vScc4lodv
	m7puMKutFm24+kNA1+vvNPJk/z4OD3zWHDlHDjONp3rkhASuP1tbSwEAvPlek4E=
X-Gm-Gg: ASbGncs5CYCtOPEeKnqjAfzlVD3IxunLMeKkpbYoiYvaD+OQUlO562R14VCgYrOCHMp
	3IecbbfFUoQlL9SjE8pWCKAyG1r2y162ivvM77pNscZdZ2LSTwAB/hV7+wljqapA20ZZBL4Dwmt
	clJRiGoTG/wv1qk++KjjKipR0Ipk6aUfvtRLrmWDJvIEt2nXVihRmjLO88ebr7ftp151r7UfkTP
	SB71umJSCWIRgLlrKGF5O5bCsPcLR3I/3GGJNdA7z2y4umB9MOzp8PnHg+ebIWfmIzY0ZHQL38O
	exv3
X-Google-Smtp-Source: AGHT+IFhJhUt0S8+IjNR/CwAZvtFXo9ZeCLX+WoXM7BjTA3C5DEyZ8F8s9qZ0y9qfi+gk8VQkfnB9w==
X-Received: by 2002:a05:600c:1c9a:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-433ce4d4c15mr20348255e9.28.1732281145761;
        Fri, 22 Nov 2024 05:12:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Nov 2024 13:12:24 +0000
Message-Id: <D5SQEZIL2SZV.QR3X5MRVQJJP@cloud.com>
Subject: Re: [RFC PATCH 00/25] Introduce xenbindgen to autogen hypercall
 structs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Anthony PERARD" <anthony.perard@vates.tech>
Cc: <xen-devel@lists.xenproject.org>, "Juergen Gross" <jgross@suse.com>,
 "Julien Grall" <julien@xen.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Christian Lindig"
 <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>,
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Bertrand Marquis"
 <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Samuel Thibault"
 <samuel.thibault@ens-lyon.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, "Tim Deegan" <tim@xen.org>, "Lukasz
 Hawrylko" <lukasz@hawrylko.pl>, =?utf-8?q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Teddy
 Astie" <teddy.astie@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <Zz9yEUj1_t1SSKE_@l14>
In-Reply-To: <Zz9yEUj1_t1SSKE_@l14>

On Thu Nov 21, 2024 at 5:47 PM GMT, Anthony PERARD wrote:

Hi,

> Hi Alejandro,
>
> Nice work :-).

Cheers! And thanks for having a look.

>
> On Fri, Nov 15, 2024 at 11:51:29AM +0000, Alejandro Vallejo wrote:
> > This series is the result of my "Interfacing Rust with Xen" talk in Xen=
 Summit.
> > It adds a hypercall ABI IDL parser and generator to the xen tree, repla=
ces a
> > couple of existing hypercalls, creates a Rust crate with autogenerated =
contents
> > an creates a CI job to ensure nothing goes out of sync.
> >
> > The changes are fairly invasive because the various autogenerated items=
 appear
> > in many places (specially the domaincreate flags). However, the changes=
 to the
> > hypervisor are all mechanical and not functional (not intentionally so,=
 at
> > least).
>
> I tried to build QEMU with this series applied, and the build failed. In
> this case nothing important, the "autogen" directory just need to be
> installed. But I fear the changes introduce to the API (like change
> of case for the flags) will also be done to other API that project
> outside of the xen repo use, and thus introduce unneeded breakage.

That's bizarre, I run the series in CI and it came out green.

  https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/154340210=
0

And I can do `make dist` without issues locally.

There might be some flaky dependency somewhere. I admit I'm not sure how th=
e
headers are installed for the QEMU build.

> Should the changes also introduce a compatibility with the previous API?

Jan mentioned something to that effect when I first proposed the change to
grant_opts, but at the time the why was a bit lacking in substance. I then =
sent
this whole thing to show the why in context.

A more compatible alternative would be to retroactively widen the single
subfield inside *_opts to occupy the whole field. Then we can suitably exte=
nd
the masking macros to u32, keep them around for compatibility (outside the
autogenerated stuff; say, in xen.h) and the API would be preserved.

Does that sound like a better approach?

That said, I was under the impression the API to be maintained was in libxl=
 and
everything else was fair game so long as libxc et al. were suitably updated=
.

What do we actually promise externally?

>
> > I've split the generator in reasonably small pieces, but it's still not=
 a small
> > tool. The Rust backend remains monolithic in a single patch until the R=
FC goes
> > further. It mirrors the C backend for the most part.
> >=20
> > The hypercall ABI is specified in a schema of TOML. Most of it should b=
e fairly
> > obvious as to what it does and means, with the possible exception of th=
e "typ"
> > field. That has the look of a dictionary because that helps the deseria=
lizer to
> > automatically resolve the typ to a convenient Rust enum type (Typ). In =
time,
> > that will become something nicer to write, but that's fairly far in my =
list of
> > priorities at the moment.
>
> Instead of creating your own IDL specification, did you look for
> existing project that would do just that? That is been able to describe
> the existing ABI in IDL and use an existing project to generate C and
> Rust headers.
>
> I kind of look into this, but there's quite a few project to explore and
> I didn't really spend enough time. Also, there's probably quite a lot
> that are for client-server interfaces rather than syscall/hypercalls, or
> they impose a data format.
>

I looked a fair bit. Alas, the biggest case for this is web microservices, =
so
the overwhelming majority of IDL projects focus on end-to-end RPC. That is,
given pairs of functions for producers/consumers and a byte-based comms cha=
nnel
(typically a socket), they create their own ABI serialising on one side and
deserialising on the other. That's not adequate here because we care about =
the
precise semantics of the ABI at the hypercall boundary to avoid pushing a
deserialiser in the hypervisor.

Protocol buffers, flatbuffers and Cap'n Proto all fall in this category, an=
d
gRPC is a higher level construct using protocol buffers or flatbuffers. So =
all
those are off the table, and virtually all others suffer from the same sin.

A notable exception is Kaitai Struct (https://kaitai.io/), because it was
designed to represent binary formats. I really wanted to use it, but Rust i=
s
not officially supported and the last release dates from 2022. All in all, =
it
doesn't sound like something alive enough for use in a serious existing
project.

>
> Next, on the file format choice, is TOML the best for describing an ABI,
> or would other existing file format make it a bit easier to read, like
> JSON or YAML? (I quite like using YAML so I have a bias toward it :-),
> and that's the format used for the CI). I don't think it mater much for
> Serde which file format is used.

Sure. I don't really care which. I can use serde to convert anything to
anything else anyway. I happened to already have something set up for TOML,=
 so
I shamelessly reused it. But I'm happy to use something else.

I'm halfway through formalising evtchn atm (with a few addition to the
generator), but I'll try migrating the specs to YAML and JSON to see how th=
ey
look like.

I'm only frontally opposed to XML :)

>
> > After the series sysctl::readconsole and domctl::createdomain are autog=
enerated
> > from their formalized forms. In the course of formalizing the ABI it be=
came
> > apparent readconsole has a different ABI in 32 and 64 bits. While benig=
n in
> > that particular case, it's yet one more reason to formalize the ABI in =
a
> > language agnostic way and have it machine-checked.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D The Plan =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > So, the idea of the series is to adjust 2 meaningful hypercalls to TOML=
-based
> > specifications (sysctl::readconsole and domctl::createdomain). The seri=
es is
> > organised in the following chunks of work
> >=20
> >   1. Sanitise domctl::createdomain to remove packed subfields.
> >   2. Introduce xenbindgen (IDL parser and generator for C).
> >   3. Specify hypercalls in TOML, and replace the hand-crafted public bi=
ts.
> >   4. Introduce Rust generator for xenbindgen.
> >   5. Introduce a xen-sys crate, with the autogenerated Rust constructs.
> >   6. Introduce CI checks for Rust linters, ABI validation and autogener=
ated
> >      file consistency.
> >=20
> > Future work involves migrating more hypercalls, in the same way patch 1=
2 does.
> > Most hypercalls should not take the amount of churn createdomain did. W=
ith the
> > foundations laid down the involved work should be simple.
> >=20
> > I have considered integrating the hypercall generation in the build pro=
cess.
> > That forces the Rust toolchain to be in the list of build dependencies =
for
> > downstreams, which might be complicated or annoying. For the time being=
, I
> > think checking in the autogenerated files and confirming in CI that the=
y are
> > in-sync is (imo) more than enough.
>
> Having the generated header files been committed sound like a good idea
> for now. For better or for worth we've got a few of those already, so
> it isn't a first.

So long as CI checks for consistency (and it does here), it shouldn't be a
problem and helps a lot with review. I have noticed a few times regressions
while developing merely because it became apparent in `git status`.

>
> But the way the different pieces are spread out in the repository in
> this patch series will make it difficult for future contributor to update
> the hypercall ABI. They'll be meet with an "autogenerated file, don't
> modify" with little clue as to how actually regenerate them. For that I
> think it would be better to have the IDL description (TOML files) in
> that "xen/public/include" directory or at the very least in "xen/".

I can move the specs to <root>/xen/abi, or something like that. Having it i=
n
the include folder might risk installing them on the targets, and while tha=
t
shouldn't matter it's better if we only ship .h files there.

Regardless of this, I should add a bit more context to the message in the
headers they reference where the spec lives and some README.

> Second, with "xenbindgen" been in in "tools/", this introduce a soft
> dependency of "xen" on "tools", which should be avoided even if the
> build system of "xen/" doesn't call into xenbindgen today. So I think it
> would be better to have xenbindgen either live in "xen/" or in a
> different directory at the root of the repo. There's already Kconfig in
> "xen/" so xenbindgen isn't going to be the first parser/generator in
> "xen/" directory.

I don't disagree, but what do I do with xen-sys then? Should I put it with =
the
hypervisor somewhere in <root>/xen? <root>/xen/rust/xen-sys, maybe?

Otherwise the same coupling exists between xen and tools, except in the oth=
er
direction.

>
> > =3D=3D=3D=3D=3D=3D=3D=3D Patch grouping =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >=20
> > Patches 1 and 2 remove packed subfields to allow encoding it in the TOM=
L specs
> > (e.g: see patch 13, replace hand-crafted altp2m_mode). It's non-functio=
nal
> > changes aiming to reach simpler representability.
> >=20
> >   Patch 1.  xen/domctl: Refine grant_opts into max_grant_version
> >   Patch 2.  xen/domctl: Replace altp2m_opts with altp2m_mode
> >=20
> > Patches 3 to 10 are xenbindgen (with the C generator backend only). The
> > Cargo.lock file in patch 4 is required for build reproducibility and is
> > recommended to have checked in the repo.
> >=20
> >   Patch 3.  tools/xenbindgen: Introduce a Xen hypercall IDL generator
> >   Patch 4.  tools/xenbindgen: Add a TOML spec reader
> >   Patch 5.  tools/xenbindgen: Add basic plumbing for the C backend
> >   Patch 6.  tools/xenbindgen: Add xenbindgen's Cargo.lock file
> >   Patch 7.  tools/xenbindgen: Add support for structs in TOML specs
> >   Patch 8.  tools/xenbindgen: Add support for enums in TOML specs
> >   Patch 9.  tools/xenbindgen: Add support for bitmaps in TOML specs
> >   Patch 10. tools/xenbindgen: Add support for includes in the TOML spec=
s
> >=20
> > Patch 11 goes a step beyond and validates the ABI has no implicit paddi=
ng and
> > that all names are unique. In the future, when we define rules for stab=
le ABIs,
> > all of those can be checked here, at generation time.
> >=20
> >   Patch 11. tools/xenbindgen: Validate ABI rules at generation time
> >=20
> > Patches 12 to 19 replace current items in the C headers with autogenera=
ted
> > versions. They should all be mechanical translations.
> >=20
> >   Patch 12. xen: Replace sysctl/readconsole with autogenerated version
> >   Patch 13. xen: Replace hand-crafted altp2m_mode descriptions with
> >             autogenerated ones
> >   Patch 14. xen: Replace common bitmaps in domctl.createdomain with
> >             autogenerated versions
> >   Patch 15. xen/arm: Replace hand-crafted xen_arch_domainconfig with
> >             autogenerated one
>
> I feel like you write "hand-crafted" in those patch description as if it
> is a bad thing. Yet, you replace the hand-crafted C headers by
> hand-crafted IDL. I think a better title could be "Translate
> xen_arch_domainconfig into IDL" to avoid what I feel like is a
> pejorative term.

Far from my intent. I merely meant "non-autogenerated". But point taken.

>
> Also, would it be possible to separate changes to the existing API from
> the patch that introduce the newly generated headers? I think it would
> be much easier to review that the generated headers don't introduce
> any changes over the current one.
>
> Cheers,

Sure, I can do that. createdomainflags is particularly nasty in that sense =
:/

Cheers,
Alejandro

