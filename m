Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33259B4786
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827249.1241811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jt4-0006EI-ID; Tue, 29 Oct 2024 10:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827249.1241811; Tue, 29 Oct 2024 10:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jt4-0006By-FM; Tue, 29 Oct 2024 10:55:46 +0000
Received: by outflank-mailman (input) for mailman id 827249;
 Tue, 29 Oct 2024 10:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5jt3-0006Bs-Bg
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:55:45 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56464e85-95e4-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 11:55:40 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso71644781fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:55:40 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297a57sm466263766b.133.2024.10.29.03.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 03:55:39 -0700 (PDT)
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
X-Inumbo-ID: 56464e85-95e4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU2NDY0ZTg1LTk1ZTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk5MzQwLjU1MjgyMSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730199340; x=1730804140; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USMVftzZtmL5U61SNPJQvqXv/IG/IdbmddF6iydMXQs=;
        b=hAw28YqA3ecTAOjh4BzCIuyDX+lpaEyGBc1xxHMB3Oy3z5FFXHEIHbrjiZURfG+FVL
         ZT2VgPx0I5O1/UgRv27se/rBNlAX2v/VDxnJHfdI+7fFvrM6Zd72YfdjAP4ZhiHUbJ5O
         wour9j7GKkfpBhC4CEAyT8g6bgp04KgjoxLaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199340; x=1730804140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USMVftzZtmL5U61SNPJQvqXv/IG/IdbmddF6iydMXQs=;
        b=JhbQDIWcIU1FLV+kbVqTzjPw6BXkIzyQJ9zwgXTg13Vn4fxcYqV3/lRozVPP02aYpO
         rzT2XyY4xkZ5OUt+LoAWkIPeJ/JpSK1ZPFySPpmYc5D6d+ubqNJHfwN3C/0xclQJo6ZH
         2MxGnwD+TOihT0PXqaHaBvHp+wqouInUWqWNhC/d+J5x0mGctP/Dl31p2NvPZP3FPn/0
         knXZ2zOWt91JQo8/xxeDB+ucAJngGoH4CwnbKYqN+7y3mHOBSQsY9kRwlFdd/hW8Bsvi
         vWj2vqHNLz04zGIJfiE9hGRN+cJgNhfHHbrjS2g1VccKa7x9a57wrSyc7ggsYRCZDlM+
         knzw==
X-Forwarded-Encrypted: i=1; AJvYcCV9++tXnYzEv40qFhd91ISSty6dbzePxXdmGAWL+PaMz1ZlQ/pUTWTGnPqbPvyuMcs5A35Dbe5/VuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzkP6H7sgXYsTJtgJPiUI/iPmz+Z6nfvXrnUriMd/Owd9Ym5kF
	JnAvzlrbVQ5U1VwCykA6DQhAFcuNBcXjPY46YKm8NM4rXIGwYz0rqg9HLRC7OcQ=
X-Google-Smtp-Source: AGHT+IEuWT8LnQrYGwEDPL3hFirIT5KYRNL5k8TLoSy/D3GtBo1sc482HclFw6h/VFW8iToFW2xiRQ==
X-Received: by 2002:a2e:a541:0:b0:2fc:9869:2e0b with SMTP id 38308e7fff4ca-2fcbdfc70abmr74160761fa.20.1730199339903;
        Tue, 29 Oct 2024 03:55:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 10:55:38 +0000
Message-Id: <D588H7B9CSAR.3K4MD7ZXGB03G@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
 <52225fba-97cc-49eb-8714-fee5d2e86262@suse.com>
In-Reply-To: <52225fba-97cc-49eb-8714-fee5d2e86262@suse.com>

On Tue Oct 29, 2024 at 8:19 AM GMT, Jan Beulich wrote:
> On 28.10.2024 16:49, Alejandro Vallejo wrote:
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
>
> Taking the umap commentary into account, I think this needs to expand
> some, to also symmetrically cover what the unmap comment says regarding
> "v is [not] the currently scheduled vCPU".

Yes, that's fair.

> This may then also help
> better see the further outlook, as Andrew was asking for.

Sure, I'll answer his comment in a jiffy with a rough approximation of what=
 I
expect them to contain.

>
> > + * @param v Owner of the XSAVE area
> > + */
> > +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> > +
> > +/*
> > + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
>
> Nit: I expect it drops the mapping, not the area.

Yes, although even the mapping might not be dropped if we can credibly avoi=
d
it. Regardless, yes this needs rewriting.

The particulars are murky and should become easier to see with the pseudo-c=
ode
I'm about to answer Andrew with

>
> > + * If ASI is enabled and v is not the currently scheduled vCPU then th=
e
> > + * per-pCPU mapping is removed from the address space.
> > + *
> > + * @param v           vCPU logically owning xsave_area
> > + * @param xsave_area  XSAVE blob of v
> > + */
> > +#define vcpu_unmap_xsave_area(v, x) ({ (x) =3D NULL; })
> > +
> >  #endif /* __ASM_XSTATE_H */

Cheers,
Alejandro

