Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA859D625F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841958.1257426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWbn-0000rd-Rj; Fri, 22 Nov 2024 16:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841958.1257426; Fri, 22 Nov 2024 16:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWbn-0000ph-Og; Fri, 22 Nov 2024 16:34:15 +0000
Received: by outflank-mailman (input) for mailman id 841958;
 Fri, 22 Nov 2024 16:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ep2p=SR=bounce.vates.tech=bounce-md_30504962.6740b27e.v1-a31070d2a5534cdba6a139ac35c3f248@srs-se1.protection.inumbo.net>)
 id 1tEWbl-0000pb-RY
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 16:34:14 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c9157c-a8ef-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 17:34:07 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xw0zf1FwnzG0CSN8
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 16:34:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a31070d2a5534cdba6a139ac35c3f248; Fri, 22 Nov 2024 16:34:06 +0000
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
X-Inumbo-ID: 97c9157c-a8ef-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk3YzkxNTdjLWE4ZWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjkzMjQ3Ljg2MTA5Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDBiMjdlLnYxLWEzMTA3MGQyYTU1MzRjZGJhNmExMzlhYzM1YzNmMjQ4QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732293246; x=1732553746;
	bh=CxIlHsYgIuCCv+drcwRIX/K6ZdsEnVb652U/edEcHGw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GOUSOOjTXKDKp8RC2QvTFsSr4FkDBrI2VNVX5EKJxEiQXbi/kk1IyqHMPs7QS/gPA
	 ChraVFWaMgibP8oTEwFVE6I/WhXsTOVemtrcQ1tjPBnyilFwPXCdKCB2UWYUJ7GedC
	 biHmWUOCpFh0oHCHfUoaBwVYXwFmFffkCQ2hO375xkB9lOkP6Bl5UTczdOCmiKS8LV
	 Vtt2KslpEN6CdiaRMtYTASKP7rnDj2J5txQvsmh/Zequb9Y60nz0xUs+4cxkFz51z/
	 WtEHvcyt/GaWbMt2ByhmxLsNeCmRmsxtcUwOiQiyaKBgf5BRY6JnBJM/kCgsQe6lI4
	 KphQaVjGej05A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732293246; x=1732553746; i=anthony.perard@vates.tech;
	bh=CxIlHsYgIuCCv+drcwRIX/K6ZdsEnVb652U/edEcHGw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oC+1naX7hOLsmCztL/822fuVDZNuMGscYGRJIQTPF0wXEwNoxby1H18H1xgu4cHY+
	 kdwSlwtn4Klq+GAP8SGjTIJVudVE2/j9hahR3fu7KAkvSWwcBu3+nX5RyIcypdESRA
	 igPfDOFJqcN/nPVG3ngSpIdj4kjHWiBfxAvWIuKZRCEu91brliCgdlSqZ2dIRkrglb
	 0g+zU1OlBGEBshvfuyhWt+Fh5DNeRcbE1V65bv4AOQMPWSxX3eVy7uurlOC5L5BJZ9
	 huWyoutzO06kONrN2oKQq5bXnopPNdLX2SgPYL0WIBgxJ+pki0GBJRnWbT23g++VnC
	 EePnHeeHpxpQA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2000/25]=20Introduce=20xenbindgen=20to=20autogen=20hypercall=20structs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732293244525
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Christian Lindig" <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Samuel Thibault" <samuel.thibault@ens-lyon.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Tim Deegan" <tim@xen.org>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Teddy Astie" <teddy.astie@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
Message-Id: <Z0Cye-0TEzvdu61W@l14>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <Zz9yEUj1_t1SSKE_@l14> <D5SQEZIL2SZV.QR3X5MRVQJJP@cloud.com>
In-Reply-To: <D5SQEZIL2SZV.QR3X5MRVQJJP@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a31070d2a5534cdba6a139ac35c3f248?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241122:md
Date: Fri, 22 Nov 2024 16:34:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Nov 22, 2024 at 01:12:24PM +0000, Alejandro Vallejo wrote:
> On Thu Nov 21, 2024 at 5:47 PM GMT, Anthony PERARD wrote:
> > On Fri, Nov 15, 2024 at 11:51:29AM +0000, Alejandro Vallejo wrote:
> > > This series is the result of my "Interfacing Rust with Xen" talk in Xen Summit.
> > > It adds a hypercall ABI IDL parser and generator to the xen tree, replaces a
> > > couple of existing hypercalls, creates a Rust crate with autogenerated contents
> > > an creates a CI job to ensure nothing goes out of sync.
> > >
> > > The changes are fairly invasive because the various autogenerated items appear
> > > in many places (specially the domaincreate flags). However, the changes to the
> > > hypervisor are all mechanical and not functional (not intentionally so, at
> > > least).
> >
> > I tried to build QEMU with this series applied, and the build failed. In
> > this case nothing important, the "autogen" directory just need to be
> > installed. But I fear the changes introduce to the API (like change
> > of case for the flags) will also be done to other API that project
> > outside of the xen repo use, and thus introduce unneeded breakage.
> 
> That's bizarre, I run the series in CI and it came out green.
> 
>   https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1543402100
> 
> And I can do `make dist` without issues locally.
> 
> There might be some flaky dependency somewhere. I admit I'm not sure how the
> headers are installed for the QEMU build.

So, I'm pretty sure the CI have QEMU been built via Xen's build system.
As such, we set $PKG_CONFIG_PATH to "tools/pkg-config". And I think
QEMU's build system will just use that pkgconfig and exctract the
include path from it, and it point to the in-tree include directory,
which has the "autogen" symlink.

What I often do is `make dist`, and then build QEMU with that created
dist directory. It's almost like installing Xen on my system and trying
to build QEMU.

> > Should the changes also introduce a compatibility with the previous API?
> 
> Jan mentioned something to that effect when I first proposed the change to
> grant_opts, but at the time the why was a bit lacking in substance. I then sent
> this whole thing to show the why in context.

Yes, I've seen that other series after this one, and it help to explain
why some change help. Like the one changing the case of the flags.

> A more compatible alternative would be to retroactively widen the single
> subfield inside *_opts to occupy the whole field. Then we can suitably extend
> the masking macros to u32, keep them around for compatibility (outside the
> autogenerated stuff; say, in xen.h) and the API would be preserved.
> 
> Does that sound like a better approach?

I don't know. For flags, having macro/define/const with the old name
would be fairly easy to provide. For new fields on the other end, it
might just be better to break the build and require some adjustment.

> That said, I was under the impression the API to be maintained was in libxl and
> everything else was fair game so long as libxc et al. were suitably updated.
> 
> What do we actually promise externally?

I don't know to be honest, breaking the API might be ok. Quite often,
whenever we want to interface with Xen, we copy the Xen's header into
that project (OVMF for sure, Linux and FreeBSD I guess). For QEMU,
there's also header been copied, for the PV devices. I don't know why
QEMU includes domctl.h from outside the project (this is how I
discovered autogen directory was missing). It might just be included via
the header of one of the library.

> > > I've split the generator in reasonably small pieces, but it's still not a small
> > > tool. The Rust backend remains monolithic in a single patch until the RFC goes
> > > further. It mirrors the C backend for the most part.
> > > 
> > > The hypercall ABI is specified in a schema of TOML. Most of it should be fairly
> > > obvious as to what it does and means, with the possible exception of the "typ"
> > > field. That has the look of a dictionary because that helps the deserializer to
> > > automatically resolve the typ to a convenient Rust enum type (Typ). In time,
> > > that will become something nicer to write, but that's fairly far in my list of
> > > priorities at the moment.
> >
> > Instead of creating your own IDL specification, did you look for
> > existing project that would do just that? That is been able to describe
> > the existing ABI in IDL and use an existing project to generate C and
> > Rust headers.
> >
> > I kind of look into this, but there's quite a few project to explore and
> > I didn't really spend enough time. Also, there's probably quite a lot
> > that are for client-server interfaces rather than syscall/hypercalls, or
> > they impose a data format.
> >
> 
> I looked a fair bit. Alas, the biggest case for this is web microservices, so
> the overwhelming majority of IDL projects focus on end-to-end RPC. That is,
> given pairs of functions for producers/consumers and a byte-based comms channel
> (typically a socket), they create their own ABI serialising on one side and
> deserialising on the other. That's not adequate here because we care about the
> precise semantics of the ABI at the hypercall boundary to avoid pushing a
> deserialiser in the hypervisor.
> 
> Protocol buffers, flatbuffers and Cap'n Proto all fall in this category, and
> gRPC is a higher level construct using protocol buffers or flatbuffers. So all
> those are off the table, and virtually all others suffer from the same sin.
> 
> A notable exception is Kaitai Struct (https://kaitai.io/), because it was
> designed to represent binary formats. I really wanted to use it, but Rust is
> not officially supported and the last release dates from 2022. All in all, it
> doesn't sound like something alive enough for use in a serious existing
> project.

Thanks!

Yeah, Kaitai looks almost like it could do the job, but it doesn't look
to be available in Debian repo. So yes, xenbindgen sounds like a better
candidate. At least, it gives us an other example on a way to describe
binary struct, and it's YAML :-), more or less.

But I'm all in for xenbindgen now.

> >
> > Next, on the file format choice, is TOML the best for describing an ABI,
> > or would other existing file format make it a bit easier to read, like
> > JSON or YAML? (I quite like using YAML so I have a bias toward it :-),
> > and that's the format used for the CI). I don't think it mater much for
> > Serde which file format is used.
> 
> Sure. I don't really care which. I can use serde to convert anything to
> anything else anyway. I happened to already have something set up for TOML, so
> I shamelessly reused it. But I'm happy to use something else.
> 
> I'm halfway through formalising evtchn atm (with a few addition to the
> generator), but I'll try migrating the specs to YAML and JSON to see how they
> look like.
> 
> I'm only frontally opposed to XML :)

:-), I agree.

I'm not going to be the primary consumer of those files so I don't mind
too much. It just that I don't like having to repeat
'[[structs.fields]]' sooo many times, I'm not familiar enough with TOML
to know if it is a limitation of the format, or not. I would think that
in YAML or JSON, we could avoid this repeats, with something like:

    structs:
    - name: xen_sysctl_readconsole
      description: "..."
      fields:
        - name: clear
          description: "..."
          typ: u8
        - name: incremental
          typ: u8
        - name: buffer
          typ:
            tag: ptr
            args: u8

Not sure it's valid YAML for "buffer", but otherwise, we can probably
something similar in JSON, with just a few {} and loads of "".

> > > After the series sysctl::readconsole and domctl::createdomain are autogenerated
> > > from their formalized forms. In the course of formalizing the ABI it became
> > > apparent readconsole has a different ABI in 32 and 64 bits. While benign in
> > > that particular case, it's yet one more reason to formalize the ABI in a
> > > language agnostic way and have it machine-checked.
> > > 
> > > ======== The Plan ===========
> > > 
> > > So, the idea of the series is to adjust 2 meaningful hypercalls to TOML-based
> > > specifications (sysctl::readconsole and domctl::createdomain). The series is
> > > organised in the following chunks of work
> > > 
> > >   1. Sanitise domctl::createdomain to remove packed subfields.
> > >   2. Introduce xenbindgen (IDL parser and generator for C).
> > >   3. Specify hypercalls in TOML, and replace the hand-crafted public bits.
> > >   4. Introduce Rust generator for xenbindgen.
> > >   5. Introduce a xen-sys crate, with the autogenerated Rust constructs.
> > >   6. Introduce CI checks for Rust linters, ABI validation and autogenerated
> > >      file consistency.
> > > 
> > > Future work involves migrating more hypercalls, in the same way patch 12 does.
> > > Most hypercalls should not take the amount of churn createdomain did. With the
> > > foundations laid down the involved work should be simple.
> > > 
> > > I have considered integrating the hypercall generation in the build process.
> > > That forces the Rust toolchain to be in the list of build dependencies for
> > > downstreams, which might be complicated or annoying. For the time being, I
> > > think checking in the autogenerated files and confirming in CI that they are
> > > in-sync is (imo) more than enough.
> >
> > Having the generated header files been committed sound like a good idea
> > for now. For better or for worth we've got a few of those already, so
> > it isn't a first.
> 
> So long as CI checks for consistency (and it does here), it shouldn't be a
> problem and helps a lot with review. I have noticed a few times regressions
> while developing merely because it became apparent in `git status`.

Having CI check from the start is a good idea. I kind of tried to do
that for the autoconf and the *.gen.go files, but that not done (and I
think I've sent something to the list).

> > But the way the different pieces are spread out in the repository in
> > this patch series will make it difficult for future contributor to update
> > the hypercall ABI. They'll be meet with an "autogenerated file, don't
> > modify" with little clue as to how actually regenerate them. For that I
> > think it would be better to have the IDL description (TOML files) in
> > that "xen/public/include" directory or at the very least in "xen/".
> 
> I can move the specs to <root>/xen/abi, or something like that. Having it in
> the include folder might risk installing them on the targets, and while that
> shouldn't matter it's better if we only ship .h files there.
> 
> Regardless of this, I should add a bit more context to the message in the
> headers they reference where the spec lives and some README.

Sounds good.

> > Second, with "xenbindgen" been in in "tools/", this introduce a soft
> > dependency of "xen" on "tools", which should be avoided even if the
> > build system of "xen/" doesn't call into xenbindgen today. So I think it
> > would be better to have xenbindgen either live in "xen/" or in a
> > different directory at the root of the repo. There's already Kconfig in
> > "xen/" so xenbindgen isn't going to be the first parser/generator in
> > "xen/" directory.
> 
> I don't disagree, but what do I do with xen-sys then? Should I put it with the
> hypervisor somewhere in <root>/xen? <root>/xen/rust/xen-sys, maybe?
> 
> Otherwise the same coupling exists between xen and tools, except in the other
> direction.

Coupling in one direction is fine, but going back and fort is not.
Unless we had a single non-recursive build system, but that not the
case, will never be, as the build system for "xen/" is fine and doesn't
need to be shared with anything else (or at least that my point of view).

As for "xen-sys", that just another "tools/libs", so that can live in
"tools/".

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

