Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA09B48CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 12:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827308.1241889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5krA-0002yb-83; Tue, 29 Oct 2024 11:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827308.1241889; Tue, 29 Oct 2024 11:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5krA-0002wH-5D; Tue, 29 Oct 2024 11:57:52 +0000
Received: by outflank-mailman (input) for mailman id 827308;
 Tue, 29 Oct 2024 11:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5kr8-0002w7-LU
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 11:57:50 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02236021-95ed-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 12:57:44 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso812044066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 04:57:44 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298db6sm469965166b.131.2024.10.29.04.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 04:57:43 -0700 (PDT)
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
X-Inumbo-ID: 02236021-95ed-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyMjM2MDIxLTk1ZWQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjAzMDY0LjkxMzAxNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730203064; x=1730807864; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7EAB7j50DNMjuKVi66hpnEZDaLqwnd/caUYpNGSW78=;
        b=BPoo7r9c6IFEl3VtkPNNe0mZcW1NvyFw+Db8HPAGovi9o9WdWaxxOxI/rVMnwThxEt
         JDYQjzrB1EXfaVnGrgHouRcqgRYRV19p1wUbcDxCOrASUAYMuQN3HwHENpXo/eNcssZR
         n9oD0hglWy0Rxbh2ZQueL4AoqoabUoFIHslps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203064; x=1730807864;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7EAB7j50DNMjuKVi66hpnEZDaLqwnd/caUYpNGSW78=;
        b=ogUQZUWNabdynVfuMZd8LZfhcE5DUiwc3cv0whoVOGFNK14v5sJN6GkIwaibH8HC+0
         +n1R/dmPO2V41FpQCCQYf7Rv0N+UQn3LbhLzUPPVC5d7bhleCL79UM0UqMvwO41iQ7Uu
         hX5qhEPGDP4JhDnALXohVA1qtNzHsSjQp9r9qqHE8zV+plj39w0lLJHJh3T85SJ6YP9W
         U+CAVWe2UvDu62hF7b5HzYGnpaHfnZq/h/vr+2NmqT1FOOgyAx1+Z3ihu6Jq/zPUne5o
         mn4liJ8fXtYyw7sfyr/dA2m1yGqV9yueW/iCkb3TCEEeaIaIFcvAwoD0Mdxff+J5BTkr
         aUbw==
X-Forwarded-Encrypted: i=1; AJvYcCW7bnE0G3QkfOmXTMMGaiDvTtlPADaBbpj52hzNrvY8w9sb3elI+wnm/STXDNAMT+QOTcUGG2Q1VmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyaNpQP95zs+C3BxjPakRak5SycNYe/pHZ2Ryshu9DMUrQ+Yvf
	YaJ3GcXW6wQJ/VJc+MhfO3xL1m5/3GOqYXdnqEFvR0c1Z2HaQNScmvIKdkn9v/YdJmIXs9GQ2U/
	V
X-Google-Smtp-Source: AGHT+IGrLN7h1vu5x17hzyn181YnfOQf64i0fmWLXTxA+y/l4/imzUWAJPOV/Uz7T3p/gZzl25hHCg==
X-Received: by 2002:a17:907:8689:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9de5edcfdcmr1221785866b.29.1730203064232;
        Tue, 29 Oct 2024 04:57:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 11:57:43 +0000
Message-Id: <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
 <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
In-Reply-To: <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>

Hi,

On Mon Oct 28, 2024 at 5:20 PM GMT, Andrew Cooper wrote:
> On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/a=
sm/xstate.h
> > index 07017cc4edfd..36260459667c 100644
> > --- a/xen/arch/x86/include/asm/xstate.h
> > +++ b/xen/arch/x86/include/asm/xstate.h
> > @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu *v=
)
> >             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> >  }
> > =20
> > +/*
> > + * Fetch a pointer to the XSAVE area of a vCPU
> > + *
> > + * If ASI is enabled for the domain, this mapping is pCPU-local.
> > + *
> > + * @param v Owner of the XSAVE area
> > + */
> > +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> > +
> > +/*
> > + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
> > + *
> > + * If ASI is enabled and v is not the currently scheduled vCPU then th=
e
> > + * per-pCPU mapping is removed from the address space.
> > + *
> > + * @param v           vCPU logically owning xsave_area
> > + * @param xsave_area  XSAVE blob of v
> > + */
> > +#define vcpu_unmap_xsave_area(v, x) ({ (x) =3D NULL; })
> > +
>
> Is there a preview of how these will end up looking with the real ASI
> bits in place?

I expect the contents to be something along these lines (in function form f=
or
clarity):

  struct xsave_struct *vcpu_map_xsave_area(struct vcpu *v)
  {
      if ( !v->domain->asi )
          return v->arch.xsave_area;

      if ( likely(v =3D=3D current) )
          return percpu_fixmap(v, PCPU_FIX_XSAVE_AREA);

      /* Likely some new vmap-like abstraction after AMX */
      return map_domain_page(v->arch.xsave_area_pg);
  }

Where:
  1. v->arch.xsave_area is a pointer to the XSAVE area on non-ASI domains.
  2. v->arch.xsave_area_pg an mfn (or a pointer to a page_info, converted)
  3. percpu_fixmap(v, PCPU_FIX_XSAVE_AREA) is a slot in a per-vCPU fixmap, =
that
     changes as we context switch from vCPU to vCPU.

  /*
   * NOTE: Being a function this doesn't nullify the xsave_area pointer, bu=
t
   * it would in a macro. It's unimportant for the overall logic though.
   */
  void vcpu_unmap_xsave_area(struct vcpu *v, struct xsave_struct *xsave_are=
a)
  {
      /* Catch mismatched areas when ASI is disabled */
      ASSERT(v->domain->asi || xsave_area =3D=3D v->arch.xsave_area);

      /* Likely some new vunmap-like abstraction after AMX */
      if ( v->domain->asi && v !=3D current )
          unmap_domain_page(xsave_area);
  }

Of course, many of these details hang in the balance of what happens to the=
 ASI
series from Roger. In any case, the takeaway is that map/unmap must have
fastpaths for "current" that don't involve mapping. The assumption is that
non-current vCPUs are cold paths. In particular, context switches will unde=
rgo
some refactoring in order to make save/restore not require additional
map/unmaps besides the page table switch and yet another change to further
align "current" with the currently running page tables. Paths like the
instruction emulator go through these wrappers later on for ease of
auditability, but are early-returns that cause no major overhead.

My expectation is that these macros are general enough to be tweakable in
whatever way is most suitable, thus allowing the refactor of the codebase a=
t
large to make it ASI-friendly before the details of the ASI infra are merge=
d,
or even finalised.

>
> Having a macro-that-reads-like-a-function mutating x by name, rather
> than by pointer, is somewhat rude.=C2=A0 This is why we capitalise
> XFREE()/etc which have a similar pattern; to make it clear it's a macro
> and potentially doing weird things with scopes.
>
> ~Andrew

That magic trick on unmap warrants uppercase, agreed. Initially it was all
function calls and after macrofying them I was lazy to change their users.

Cheers,
Alejandro

