Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E809D8C7D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 19:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843082.1258738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFeBH-0004qA-9L; Mon, 25 Nov 2024 18:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843082.1258738; Mon, 25 Nov 2024 18:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFeBH-0004o4-4v; Mon, 25 Nov 2024 18:51:31 +0000
Received: by outflank-mailman (input) for mailman id 843082;
 Mon, 25 Nov 2024 18:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFeBF-0004ny-NJ
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 18:51:29 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 439322d9-ab5e-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 19:51:22 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so60315265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 10:51:22 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3bfa27sm4321365a12.37.2024.11.25.10.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 10:51:20 -0800 (PST)
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
X-Inumbo-ID: 439322d9-ab5e-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQzOTMyMmQ5LWFiNWUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTYwNjgyLjM0MTU0Niwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732560681; x=1733165481; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb46oBOebjFb43MCtBtE5N1mN0Cq0rZVW/IK9z6L43c=;
        b=Wsn8srZtpmXYVsdxbCX4lnVIr29XQY5r5Da9F/6z7MzvuZkmTq6fLwPUhEP0902FQT
         hp+6MaY5pIAUcwwJ97rTxVgWMC376Ijf23vZdYdG01ewtFOpUsc7Dy6ur/k798bY5Mo5
         J0hBXB0LuQzip6E+ZOhPde5IpHKArH8kWEx2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560681; x=1733165481;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wb46oBOebjFb43MCtBtE5N1mN0Cq0rZVW/IK9z6L43c=;
        b=txxRX3MnhJ04havVAzR1x5B6lFA0e5ymMUqS+pwInqcPi9ARjMFfJgEYrQeRM67g2Z
         Z/6OyHe4IhpKicfj782irJ5Qntb7NbzocvvaEVglqGoJpQjbigLjS8NDRZvlXANEiJNC
         Jww+NRcasF1cGNB7B2S+KuZ1IYZrAg7VzWCl1G+TXxeFH/5nRV7m0X02SnUDU02s/lgP
         mS3hTwe30gHChcgKLoR2EUq27VdPcgzHYexjeUC84PMM/Bf4vQf387HOVbD9s1exubvK
         gRVBEIH+6SADLiqFzU5S7tPbY81fOwAKOgAZ65HWnc+KbesRlWlrngKCPNmVzBQGVzRA
         wgmg==
X-Forwarded-Encrypted: i=1; AJvYcCUMdjHsVHRUA0ANu8NEzPdj5/wFbwoQAbyufmtWdqNMm7hI0u8FNblr/WjNUPQSLm3hg2gAM2gan00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVDdyMYkolOFvIT14559hpw+v5UhnfES9rvEfOHah0RLS99/P6
	5HV+0Kjln/Lt/ELFbsAdyN69kJhQhkO3JYXc/LE8ychIXDRbfTRS+mbqpl//6KA=
X-Gm-Gg: ASbGncud4t0H2HNSMUnwjldP3P41Slqn8Q37vtk5aeNhM/Y1bMeaZotbVuVDo4VL4Vj
	nzZEpnmNvp0wpbCKAoY/gW8t4jLFdjek7/D9ESJZbPz6gkk5fu80Rr+PsJYbw3SveIBkT4BcKFl
	PEKMTa66E5Ue0cvx9ncl5AcI4rIPQwVvDCOZ5AJRB8IF3MqJiWWOTg5Bjq+szN0pQSI4PpFvX/h
	1cPevU6hyjwbl3DGi4Omx+Kz6dzz7g9MB0pB4TXe3ONoTpABvAarv5s
X-Google-Smtp-Source: AGHT+IGxHM4ypUeRI8xtUBo3kaWy/gIh7z2BZqxyrjcpO6CwNrm6V+w3aDAwBzSpqphHWs6DSEBGJA==
X-Received: by 2002:a05:6000:2d06:b0:382:4fee:c263 with SMTP id ffacd0b85a97d-38260b5385emr11345253f8f.20.1732560681555;
        Mon, 25 Nov 2024 10:51:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 18:51:16 +0000
Message-Id: <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Samuel Thibault"
 <samuel.thibault@ens-lyon.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
In-Reply-To: <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>

Hi Jan,

Thanks for having a look.

On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
> On 15.11.2024 12:51, Alejandro Vallejo wrote:
> > Describe sysctl/readconsole as a TOML specification, remove old
> > hand-coded version and replace it with autogenerated file.
> >=20
> > While at it, transform the console driver to use uint8_t rather than
> > char in order to mandate the type to be unsigned and ensure the ABI is
> > not defined with regards to C-specific types.
>
> Yet the derived C representation imo then should still be using char, not
> uint8_t.

There's 2 issued addressed by this patch.

  1. The removal of char from the external headers (and the Xen driver).
  2. The replacement of the existing struct by the autogenerated one.

(1) wants doing irrespective of (2). char has neither a fixed width nor a f=
ixed
sign. Which is irrelevant for ABI purposes in this case because what we rea=
lly
meant is "give me a pointer" in this hypercall, but it may be important in
other cases.

IOW, char should've never made it to the definition of the public ABI, and =
I'm
merely taking the chance to take it out. Happy to extract this patch and se=
nd
it separately.

> In particular it would be a good sign if the Xen sources wouldn't
> need to change, unlike happens here (altering types of a few internals of
> the console machinery).

And that would be the case if Xen had uniform naming conventions and its AB=
I
was fully unambiguous. The process of uniformizing the naming convention an=
d
disambiguating the ABI is bound to cause (non-functional) changes, mostly i=
n
the naming conventions side of things.

Naming conventions can be _MOSTLY_ sorted by creating compat #defines and
typedefs that match the old types. I can do that, but note that even then s=
ome
code would have to change in order to i.e: s/struct OLD_NAME/NEW_NAME_T/

If this is deemed important for backporting changes, I can do it for invasi=
ve
replacements, like the createdomain flags.

On the topic of changing types, The present case is an ABI inconsistency ca=
se.
My intention is to keep the ABI fixed as a matter of principle (if anything=
,
because the domU ABI cannot be changed). However, changing the way C repres=
ents
said ABI is a requirement if the current definition is ambiguous. In those
cases we ought to change C to ensure there's one and only one way of
interpreting it.

>
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  stubdom/Makefile                              |  2 +-
> >  tools/rust/Makefile                           | 19 ++++++++
> >  .../xenbindgen/extra/sysctl/readconsole.toml  | 43 +++++++++++++++++++
> >  xen/drivers/char/console.c                    | 12 +++---
> >  xen/include/public/autogen/sysctl.h           | 35 +++++++++++++++
>
> In the build tree, having an autogen subdir under public/ _may_ be okay
> (personally I dislike even that). I didn't manage to spot adjustments to
> how files are eventually installed, yet at that point there clearly
> shouldn't be any autogen subdir(s) anymore. How the individual files come
> into existence is, imo, nothing consumers of the interface ought to (need
> to) care about.

Anthony already mentioned an error while building QEMU, which I'm guessing
comes from the same problem. The stitching is definitely up for discussion.=
 I
got far enough to allow the compilation of `dist` to go through, but didn't
think incredibly hard about the finer details (like the install targets).

In principle, renaming `autogen` to `abi` and adding its contents to the li=
st of
installed headers ought to sort that particular concern?=20

>
> > --- /dev/null
> > +++ b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
> > @@ -0,0 +1,43 @@
> > +[[structs]]
> > +name =3D "xen_sysctl_readconsole"
> > +description =3D "Read console content from Xen buffer ring."
> > +
> > +[[structs.fields]]
> > +name =3D "clear"
> > +description =3D "IN: Non-zero -> clear after reading."
> > +typ =3D { tag =3D "u8" }
> > +
> > +[[structs.fields]]
> > +name =3D "incremental"
> > +description =3D "IN: Non-zero -> start index specified by `index` fiel=
d."
> > +typ =3D { tag =3D "u8" }
> > +
> > +[[structs.fields]]
> > +name =3D "_pad"
> > +description =3D "Unused."
> > +typ =3D { tag =3D "u16" }
> > +
> > +[[structs.fields]]
> > +name =3D "index"
> > +description =3D """
> > +IN:  Start index for consuming from ring buffer (if @incremental);
> > +OUT: End index after consuming from ring buffer."""
> > +typ =3D { tag =3D "u32" }
> > +
> > +[[structs.fields]]
> > +name =3D "buffer"
> > +description =3D """
> > +IN: Virtual address to write console data.
> > +
> > +NOTE: The pointer itself is IN, but the contents of the buffer are OUT=
."""
> > +typ =3D { tag =3D "ptr", args =3D { tag =3D "u8" } }
> > +
> > +[[structs.fields]]
> > +name =3D "count"
> > +description =3D "IN: Size of buffer; OUT: Bytes written to buffer."
> > +typ =3D { tag =3D "u32" }
> > +
> > +[[structs.fields]]
> > +name =3D "rsvd0_a"
> > +description =3D "Tail padding reserved to zero."
> > +typ =3D { tag =3D "u32" }
>
> Up to here I wasn't able to spot any documentation on what it to be writt=
en
> in which way.

You're right that the specification is not itself specified. I neglected to=
 do
so to avoid having to rewrite it should we settle on a different markup
language.

Much of your confusion seems to stem from simultanuously looking at a new
markup language and a new schema for it. Let me try to unpick some of that.=
..

> I already struggle with the double square brackets. The TOML
> doc I found when searching the web doesn't have such. Taking just the exa=
mple
> above also doesn't allow me to conclude how e.g. nested structures would =
be
> specified.

The schema is represented by the contents of `spec.rs`. All structs with a
Deserialize attribute (i.e: #[derive(Foo, Bar, Deserialize)]) map to some
"table" in TOML.

When I say "struct" now I mean a struct inside the generator that represent=
s
the input file (_NOT_ a struct representing a hypercall).

The rules are as follows. The whole file is deserialized in a single struct
(InFileDef). When there's a single square bracket (which I don't think I've
required yet), that means that what follows is a "table" with the name betw=
een
the brackets. There's several ways to represent table

    Regular tables:           [foo]
                              bar =3D "some_bar"
                              baz =3D "some_baz"

                              [foo2]
                              bar =3D "blergh"

    Inline tables:            foo =3D { bar =3D "some_bar", baz =3D "some_b=
az" }
                              foo2 =3D { bar =3D "blergh" }

Both of those deserialize to the same thing (it's C for ease of explaining =
it
here, but it's actually Rust in the generator).

                struct infiledef {
                    struct {
                        char *bar; // points to "some_bar"
                        char *baz; // points to "some_baz"
                    } foo;
                    struct {
                        char *bar; // points to "blergh"
                    } foo2;
                };

The double brackets are adding one more element to a "list"

That is. This TOML...

                             [[foos]]
                             bar =3D "some_bar"
                             baz =3D "some_baz"

                             [[foos]]
                             bar =3D "some_bar"
                             baz =3D "some_baz"

... deserializes to...

                struct foodef {
                    char *bar;
                    char *baz;
                }

                struct infiledef {
                    struct foodef *foos;
                };

The last bit of relevant information is that you can identify which table y=
ou
want to add to with dots. So [[structs.fields]] is saying "Add this field t=
o
the list of fields of the current hypercall struct".

The "typ" field is a bit quirky (I have a solution to simplify it), but tha=
t
uses inline tables.

> Really, when talk was of some form of IDL, I expected to see
> something IDLish (im particular closer to typical programming languages w=
e
> use). Whereas TOML, aiui, is more an easy language for config files of al=
l
> sorts.

I might've been unclear in the talk. One of my goals is to _not_ define a n=
ew
language. Or I'll just exchange one problem for two. Maybe I should've call=
ed
it an Interface Definition Schema, rather than Language.

The key benefit here is that, while the generators can be tricky, the parse=
r is
all done and strictly specified. We can experiment with YAML (Anthony alrea=
dy
asked about it). But it really is a matter of getting used to. TOML is
fantastic for saving horizontal space. And multi-line comments are neatly
organized.

>
> What I have in mind wouldn't allow for descriptions, yet I'm not sure tha=
t's
> relevant. The description ought to, first of all, live in the primary sou=
rce
> (i.e. the IDL itself) anyway. Commentary there might be possible to extra=
ct
> into proper (machine generated/derived) documentation.

Not sure I follow, these TOML files _are_ the IDL itself.

The descriptions here are propagated to the generated code, so they are
infinitely helpful when reaching the type via e.g: cscope, LSPs, etc.

>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -42,6 +42,8 @@
> >  #include <asm/vpl011.h>
> >  #endif
> > =20
> > +#include <public/xen.h>
>
> Why would this be needed all of the sudden?
>

Because of the new XEN_GUEST_HANDLE_64(uint8) type. The macro is quite ugly=
 and
requires being declared ahead.

> > --- /dev/null
> > +++ b/xen/include/public/autogen/sysctl.h
> > @@ -0,0 +1,35 @@
> > +/*
> > + * sysctl
> > + *
> > + * AUTOGENERATED. DO NOT MODIFY
> > + */
> > +#ifndef __XEN_AUTOGEN_SYSCTL_H
> > +#define __XEN_AUTOGEN_SYSCTL_H
> > +
> > +/* Read console content from Xen buffer ring. */
> > +struct xen_sysctl_readconsole {
> > +    /* IN: Non-zero -> clear after reading. */
> > +    uint8_t clear;
> > +    /* IN: Non-zero -> start index specified by `index` field. */
> > +    uint8_t incremental;
> > +    /* Unused. */
> > +    uint16_t _pad;
> > +    /*
> > +     * IN:  Start index for consuming from ring buffer (if @incrementa=
l);
> > +     * OUT: End index after consuming from ring buffer.
> > +     */
> > +    uint32_t index;
> > +    /*
> > +     * IN: Virtual address to write console data.
> > +     *
> > +     * NOTE: The pointer itself is IN, but the contents of the buffer =
are OUT.
> > +     */
> > +    XEN_GUEST_HANDLE_64(uint8) buffer;
> > +    /* IN: Size of buffer; OUT: Bytes written to buffer. */
> > +    uint32_t count;
> > +    /* Tail padding reserved to zero. */
> > +    uint32_t rsvd0_a;
> > +};
> > +
> > +#endif /* __XEN_AUTOGEN_SYSCTL_H */
> > +
>
> If this file is auto-generated, why would it need committing? And yes, th=
ere
> is the connected question: Will everyone then need to have a Rust compile=
r
> available?

Committing it is required precisely so that no one needs to have a Rust
compiler available. The last patch in the series checks the generated code
matches the specs byte by byte. It has the nice benefit that you can git-gr=
ep
for it and tags work even without compiling first. You also get all
architectures upfront and it's a lot easier to review changes to the genera=
tor
because CI will scream to you if the outputs diverge.

>
> Nit: For anything that is committed, it would be nice if those files were=
 as
> tidy as possible style-wise. Most of the above looks entirely okay, just
> that there is an unnecessary trailing blank line.

I did go out of my way to prettify the output.

The trailing newline was intentional to make it C++03-compatible. I can get=
 rid
of it, as it doesn't matter a whole lot.

>
> Jan

Cheers,
Alejandro

