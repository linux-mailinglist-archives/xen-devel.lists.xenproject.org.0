Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE79B4BCB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827436.1242033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mxD-00054t-Ic; Tue, 29 Oct 2024 14:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827436.1242033; Tue, 29 Oct 2024 14:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mxD-00052m-Fi; Tue, 29 Oct 2024 14:12:15 +0000
Received: by outflank-mailman (input) for mailman id 827436;
 Tue, 29 Oct 2024 14:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5mxB-00052g-Pw
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:12:13 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c824c66d-95ff-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 15:12:08 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso854591166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 07:12:08 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a083466sm476000866b.193.2024.10.29.07.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 07:12:07 -0700 (PDT)
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
X-Inumbo-ID: c824c66d-95ff-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM4MjRjNjZkLTk1ZmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjExMTI4LjA3MTE3LCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730211127; x=1730815927; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEjEv6rKdJWFhkF6klgf6zynOVSw9JjzPsJnmF27QEU=;
        b=SHo6D/FuyUL+eIiPKBSR1CWHEy/gWYKIeD2lPoJx/+XRt+B6R42ifHPlZMIDo3u6IL
         34aFZ0LLzpwUAGnT4SQHIevlXlYNMKP7KJWOxag09sMAGBXuk8n9xb8wDRY3qThdJT7c
         vOJkKgJGwhX76CmiDy7S8JlXVFoJ+RdhcsT74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211127; x=1730815927;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KEjEv6rKdJWFhkF6klgf6zynOVSw9JjzPsJnmF27QEU=;
        b=Aa5hpXGq7WdzV6iC67BWKFLox2TizuwSQLalmwv4hKxxaT45fk1M7IXWEwgSQvEAiU
         MNVm+Z4TL//6VWhbxW+pkuwbNNV1FlT8uXhSuaj8MtbEeyvnJy5yU3sKe3Lbo5KNr/Hx
         iBSOrP7zfmqbK+0HyDHA1TvFZZJ0Qup4hCFoOqb9mQzeDJ7c+D30pIxXtWfSpb7xLw/C
         kP2J4j7M4U8ZUA/UHT+zz3kBZZFSLafuID3EXpBcHlvSDt59QO/C3dUuqNiOFbJfLBjl
         VSTDobimUXAWUBguJ3PAbXtdsggmt0a3EzVENZRfho5NACR6Qp4FXG1orWHX1QeNKOQq
         L1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUt1QEtfRCLJA76k1095mjAEfXgmiiVoU0WAsK5DR5KlDstEF0sQ2yr3G7dcpePrTVx+h/SABOy8UE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdJQozhkdF8MeHHVpSvGw9KHBeKrsEtKf3kNz+F8o2jE0czIwB
	A9zssRd6pAAg72jCWLWVOw+ZynbRQKV2KawOEQDZmYa8sxNEMfTJ2DLVzTakkK8=
X-Google-Smtp-Source: AGHT+IFHZfiMg9IWjQn7tb4bnP66oo6sICHvk1jsiYq+hMwRClMmUr0yEUfGmhIBk1LG3D6FeXFEng==
X-Received: by 2002:a17:907:78c:b0:a8d:3d36:3169 with SMTP id a640c23a62f3a-a9de6451243mr1009582366b.63.1730211127413;
        Tue, 29 Oct 2024 07:12:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 14:12:05 +0000
Message-Id: <D58CNM331F0K.RBY98EPVSZND@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
 <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
 <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
 <6064d51b-f1df-4119-8c38-0f63f888c7af@suse.com>
In-Reply-To: <6064d51b-f1df-4119-8c38-0f63f888c7af@suse.com>

On Tue Oct 29, 2024 at 1:28 PM GMT, Jan Beulich wrote:
> On 29.10.2024 12:57, Alejandro Vallejo wrote:
> > On Mon Oct 28, 2024 at 5:20 PM GMT, Andrew Cooper wrote:
> >> On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> >>> diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include=
/asm/xstate.h
> >>> index 07017cc4edfd..36260459667c 100644
> >>> --- a/xen/arch/x86/include/asm/xstate.h
> >>> +++ b/xen/arch/x86/include/asm/xstate.h
> >>> @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu =
*v)
> >>>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> >>>  }
> >>> =20
> >>> +/*
> >>> + * Fetch a pointer to the XSAVE area of a vCPU
> >>> + *
> >>> + * If ASI is enabled for the domain, this mapping is pCPU-local.
> >>> + *
> >>> + * @param v Owner of the XSAVE area
> >>> + */
> >>> +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> >>> +
> >>> +/*
> >>> + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
> >>> + *
> >>> + * If ASI is enabled and v is not the currently scheduled vCPU then =
the
> >>> + * per-pCPU mapping is removed from the address space.
> >>> + *
> >>> + * @param v           vCPU logically owning xsave_area
> >>> + * @param xsave_area  XSAVE blob of v
> >>> + */
> >>> +#define vcpu_unmap_xsave_area(v, x) ({ (x) =3D NULL; })
> >>> +
> >>
> >> Is there a preview of how these will end up looking with the real ASI
> >> bits in place?
> >=20
> > I expect the contents to be something along these lines (in function fo=
rm for
> > clarity):
> >=20
> >   struct xsave_struct *vcpu_map_xsave_area(struct vcpu *v)
> >   {
> >       if ( !v->domain->asi )
> >           return v->arch.xsave_area;
> >=20
> >       if ( likely(v =3D=3D current) )
> >           return percpu_fixmap(v, PCPU_FIX_XSAVE_AREA);
> >=20
> >       /* Likely some new vmap-like abstraction after AMX */
> >       return map_domain_page(v->arch.xsave_area_pg);
> >   }
>
> I'd like to ask that map_domain_page() be avoided here from the beginning=
, to
> take AMX into account right away. I've been sitting on the AMX series for
> years, and I'd consider it pretty unfair if it was me to take care of suc=
h an
> aspect, when instead the series should (imo) long have landed.
>
> Jan

Of course. This is just pseudo-code for explanation purposes, but I didn't =
want
to introduce imaginary functions. In the final thing we'll want to map an a=
rray
of MFNs if the XSAVE area is large enough.

I am already accounting for the XSAVE area to possibly exceed a single page=
 (3
after AMX, I think?). Part of this abstraction stems from that want, in fac=
t,
as otherwise I could simply stash it all away under map_domain_page() and l=
et
that take care of everything. We'll want map_domain_pages_contig() or somet=
hing
along those lines that takes an array of mfns we've previously stored in
arch_vcpu. But that's a tomorrow problem for when we do have a secret area =
to
create those mappings on.

For today, I'd be happy with most code to stop assuming there will be a poi=
nter
in the vcpu.

Cheers,


