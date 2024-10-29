Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E89B4C0A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827453.1242064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5n8T-00087M-0J; Tue, 29 Oct 2024 14:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827453.1242064; Tue, 29 Oct 2024 14:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5n8S-00085N-Tl; Tue, 29 Oct 2024 14:23:52 +0000
Received: by outflank-mailman (input) for mailman id 827453;
 Tue, 29 Oct 2024 14:23:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5n8S-00085F-3E
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:23:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6969f748-9601-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 15:23:48 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso668278266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 07:23:48 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbdecbsm477449666b.5.2024.10.29.07.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 07:23:46 -0700 (PDT)
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
X-Inumbo-ID: 6969f748-9601-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY5NjlmNzQ4LTk2MDEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjExODI4LjEyOTAwOCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730211827; x=1730816627; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONW8wElMnDb8JOIOt2iY3xZ3Ii+2EwBpd2bAnzp6zL8=;
        b=cTRXuUJz9v6xIeFNJMeWccjpa6WW/4L1ftixM4bhRLuhOP7Vz/tlxQkwymIHnJ5n9H
         WNd5XPW4pmpn7oSleKJ/aVXA9z+3l82TvBp0YKj4Xsth2DVGgVCcb9JjhAntYOS1mJbG
         Nu+ii9b303FjekYK/Ah6EYao4ZqYAyHtgQVMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211827; x=1730816627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONW8wElMnDb8JOIOt2iY3xZ3Ii+2EwBpd2bAnzp6zL8=;
        b=jJS660whVBqe7I2BP3hU/3pC5kY0BfOA3d0Pk1NQfKXB2S+hQW+hOQhZYjghCMAwga
         M1qsu+Aq+Uz0grYNKLZNsjAIOGTW0E5kQgvWx7LkbqcdXKLt1fn3DSa1kjpSvr88323i
         PqkSnzJ9iRWw9a8Ge4/rv9Io/8zR8z4slKCyDSPkMDryddfa6OU9Ta7c4Zb2ReFPbYMW
         dclVupbFKrnvFKtmIK2Ad9JkyNw/or3b2wDdahapSRNoYDKMHs73B5K/AN5GmcK7qh8m
         vGaEHZHLE32bi3Kfv0a1RWLhvNY51TnFBn/0MIDfZ+Gil2W9yfx/kDezyt/oVy/61Wk/
         L3ig==
X-Forwarded-Encrypted: i=1; AJvYcCUtA7edd/ROaKyqPmJ1fqns/IPMKFyfmQPbgTNfGB9GKTeiW7Gek+5XbHk05gwDu6l+kgyxL0EXwOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuBlmSqCk0o4WcerrPWQ351z/YiFWtDYfa/PaFBE5Bxjm+TLoi
	xjz6TADr70EvVfSgG6NVcWyBXFvqwItzvgRtB2X8ouEVkkuI96sxJQm3Pj7L5vg=
X-Google-Smtp-Source: AGHT+IHGaBG1kFRJ1osVG8lM3sQKZV0PVq0ywPIODLsxRUFi4kcWB+Mxi+sKcZG9NO+T2qdkgBklxQ==
X-Received: by 2002:a17:906:f598:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9de61ce882mr1157597166b.50.1730211827334;
        Tue, 29 Oct 2024 07:23:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 14:23:45 +0000
Message-Id: <D58CWJPMA1QU.8QJHJUC63WPC@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
 <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
 <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
 <CACHz=ZgDVFMo-if54oivyjK-hr5nnN8PKDp1YT_KL3e3R84HNQ@mail.gmail.com>
In-Reply-To: <CACHz=ZgDVFMo-if54oivyjK-hr5nnN8PKDp1YT_KL3e3R84HNQ@mail.gmail.com>

On Tue Oct 29, 2024 at 1:24 PM GMT, Frediano Ziglio wrote:
> On Tue, Oct 29, 2024 at 11:58=E2=80=AFAM Alejandro Vallejo
> <alejandro.vallejo@cloud.com> wrote:
> >
> > Hi,
> >
> > On Mon Oct 28, 2024 at 5:20 PM GMT, Andrew Cooper wrote:
> > > On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> > > > diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/inclu=
de/asm/xstate.h
> > > > index 07017cc4edfd..36260459667c 100644
> > > > --- a/xen/arch/x86/include/asm/xstate.h
> > > > +++ b/xen/arch/x86/include/asm/xstate.h
> > > > @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcp=
u *v)
> > > >             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> > > >  }
> > > >
> > > > +/*
> > > > + * Fetch a pointer to the XSAVE area of a vCPU
> > > > + *
> > > > + * If ASI is enabled for the domain, this mapping is pCPU-local.
> > > > + *
> > > > + * @param v Owner of the XSAVE area
> > > > + */
> > > > +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> > > > +
> > > > +/*
> > > > + * Drops the XSAVE area of a vCPU and nullifies its pointer on exi=
t.
> > > > + *
> > > > + * If ASI is enabled and v is not the currently scheduled vCPU the=
n the
> > > > + * per-pCPU mapping is removed from the address space.
> > > > + *
> > > > + * @param v           vCPU logically owning xsave_area
> > > > + * @param xsave_area  XSAVE blob of v
> > > > + */
> > > > +#define vcpu_unmap_xsave_area(v, x) ({ (x) =3D NULL; })
> > > > +
> > >
> > > Is there a preview of how these will end up looking with the real ASI
> > > bits in place?
> >
> > I expect the contents to be something along these lines (in function fo=
rm for
> > clarity):
> >
> >   struct xsave_struct *vcpu_map_xsave_area(struct vcpu *v)
> >   {
> >       if ( !v->domain->asi )
> >           return v->arch.xsave_area;
> >
> >       if ( likely(v =3D=3D current) )
> >           return percpu_fixmap(v, PCPU_FIX_XSAVE_AREA);
> >
> >       /* Likely some new vmap-like abstraction after AMX */
> >       return map_domain_page(v->arch.xsave_area_pg);
> >   }
> >
> > Where:
> >   1. v->arch.xsave_area is a pointer to the XSAVE area on non-ASI domai=
ns.
> >   2. v->arch.xsave_area_pg an mfn (or a pointer to a page_info, convert=
ed)
> >   3. percpu_fixmap(v, PCPU_FIX_XSAVE_AREA) is a slot in a per-vCPU fixm=
ap, that
> >      changes as we context switch from vCPU to vCPU.
> >
> >   /*
> >    * NOTE: Being a function this doesn't nullify the xsave_area pointer=
, but
> >    * it would in a macro. It's unimportant for the overall logic though=
.
> >    */
> >   void vcpu_unmap_xsave_area(struct vcpu *v, struct xsave_struct *xsave=
_area)
> >   {
> >       /* Catch mismatched areas when ASI is disabled */
> >       ASSERT(v->domain->asi || xsave_area =3D=3D v->arch.xsave_area);
> >
> >       /* Likely some new vunmap-like abstraction after AMX */
> >       if ( v->domain->asi && v !=3D current )
> >           unmap_domain_page(xsave_area);
> >   }
> >
> > Of course, many of these details hang in the balance of what happens to=
 the ASI
> > series from Roger. In any case, the takeaway is that map/unmap must hav=
e
> > fastpaths for "current" that don't involve mapping. The assumption is t=
hat
> > non-current vCPUs are cold paths. In particular, context switches will =
undergo
> > some refactoring in order to make save/restore not require additional
> > map/unmaps besides the page table switch and yet another change to furt=
her
> > align "current" with the currently running page tables. Paths like the
> > instruction emulator go through these wrappers later on for ease of
> > auditability, but are early-returns that cause no major overhead.
> >
> > My expectation is that these macros are general enough to be tweakable =
in
> > whatever way is most suitable, thus allowing the refactor of the codeba=
se at
> > large to make it ASI-friendly before the details of the ASI infra are m=
erged,
> > or even finalised.
> >
> > >
> > > Having a macro-that-reads-like-a-function mutating x by name, rather
> > > than by pointer, is somewhat rude.  This is why we capitalise
> > > XFREE()/etc which have a similar pattern; to make it clear it's a mac=
ro
> > > and potentially doing weird things with scopes.
> > >
> > > ~Andrew
> >
> > That magic trick on unmap warrants uppercase, agreed. Initially it was =
all
> > function calls and after macrofying them I was lazy to change their use=
rs.
> >
> > Cheers,
> > Alejandro
> >
>
> Why not using static inline functions?

I'd rather use regular function in fact for the final thing. These ones are=
n't
to avoid headaches with const parameters and to allow nullifying the pointe=
r
on exit without requiring a double pointer (which is doubly fun with const
involved).

As they gain more logic it's not impossible for them to be split in most
everything to be done in a function and the rest by the macro to avoid tons=
 of
duplicate codegen everywhere.

Anyhow, all of that can be decided later driven by bloat checkers, benchmar=
ks
and the like. My preference is also towards type-safety where possible.

>
> On the documentation, I found weird that "v" is described quite
> differently for the 2 macros:
> 1) @param v Owner of the XSAVE area;
> 2) @param v           vCPU logically owning xsave_area

(2) should have the content of (1). Will do in v2.

>
> For "x" the documentation is "@param xsave_area  XSAVE blob of v", but
> there's no "xsave_area" parameter.

True. I created these macros from previous functions, and there the paramet=
er
was called xsave_area. It should be "x" here.

>
> (very minors, you can ignore)
>
> Frediano


