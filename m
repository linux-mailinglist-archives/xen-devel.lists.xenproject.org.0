Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70F25F6F2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 11:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFDu0-0008Ow-37; Mon, 07 Sep 2020 09:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIG9=CQ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kFDty-0008Or-9a
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 09:57:30 +0000
X-Inumbo-ID: 30661f9b-3a3d-4370-a6fa-8dd8b7c8e896
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30661f9b-3a3d-4370-a6fa-8dd8b7c8e896;
 Mon, 07 Sep 2020 09:57:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so13752626wme.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=2foMdhoOlyYQOorpwlyrLLwX5mFOy5PgD7OX7FUDqus=;
 b=g1bU1rlEBLuUzzjVrqO95tY6libRFHa7NfvJE94XyrOHD1kocaeaBgzAFFn5cYTkAy
 dq6G9U4V66iUcgNY1yFewZZOwXXR7LqEEJmPP4HEy75G//Oy7jTCu22qmc4KVPZTEJUe
 91UDE5X6Y/RnIVlPK0IZ1CoTFywOEhwqCUjYy5wbEeARtmlZT9S6O6sEvU21fazzohEn
 MYXUzlnljdh+vOiixPKpXTCafJ5yIUHnFvY/YR4EXT23kGQ4okwgzwLmRh5ZTqXJW7yp
 kLZyflaeM0wKwMRmiDh3ANPdUoqZlDrr3jW39EeKx+FiPsycyEp1D+TB3rwgVYm3U9g8
 EOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=2foMdhoOlyYQOorpwlyrLLwX5mFOy5PgD7OX7FUDqus=;
 b=PJFO0OvKG93HpF5gH8idXnZXor0SSoxWspabsfiuaNVbRk5XxL/UHORPLx+BdDXbia
 6Iy8LMbqf7QU0DaZsD2pDL9M6UUKsiN8LWm4ud7Gkj+qRT49XbEiPc5Yc0FXffAxJy4P
 /ySRkn+7rmdgbTP+EbaF+Ap7C0+RyEiatR3X/XAyzfl/GLJYny694hBH4FjSn5QA6UOV
 4GnafJRQ5Gs6omu4vX4hIJ5ghpbSYM/jE3DtbZtLKGLt/Dtf0LW3VY0EsGOJtZqr5KFQ
 mAVYqI2oS1/5smxXHcBeewxqhtafVwEvRsbJogpVhnWP+cAdDHzpEwDwqRMYLkEXDQLr
 YrhQ==
X-Gm-Message-State: AOAM5300/Kw4XS/KAG9yiWdnjQwm80qH5lNjjE7adcOX00T9B9O7+s79
 NAav3GcjOW/ZdZGEE64neP0=
X-Google-Smtp-Source: ABdhPJxvoTXX+AgICSWc/lpVUcd8WrpZcbKdvVjeYIfoUcpotOUuIU00d64/NQBcwIkVWYwgyOigfw==
X-Received: by 2002:a1c:a107:: with SMTP id k7mr12609464wme.67.1599472648197; 
 Mon, 07 Sep 2020 02:57:28 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:3c6c:b8a:a5a4:79be])
 by smtp.gmail.com with ESMTPSA id b11sm27577367wrt.38.2020.09.07.02.57.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 02:57:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>,
 "'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
 <003301d682d6$d4b5ba20$7e212e60$@xen.org>
 <7efe7de4-bde4-a769-5817-b64b0e757a3f@suse.com>
In-Reply-To: <7efe7de4-bde4-a769-5817-b64b0e757a3f@suse.com>
Subject: RE: [PATCH v3] x86/HVM: more consistently set I/O completion
Date: Mon, 7 Sep 2020 10:58:18 +0100
Message-ID: <003c01d684fd$6a187b70$3e497250$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKLGnh8NTAXxwELiAxasezQUK7x/AIpa6ilAXxvJQGn1pYKsA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 07 September 2020 10:43
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'Wei Liu'
> <wl@xen.org>; 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>; 'Jun =
Nakajima' <jun.nakajima@intel.com>;
> 'Kevin Tian' <kevin.tian@intel.com>; 'George Dunlap' =
<George.Dunlap@eu.citrix.com>
> Subject: Re: [PATCH v3] x86/HVM: more consistently set I/O completion
>=20
> On 04.09.2020 18:17, Paul Durrant wrote:
> >> @@ -2610,8 +2612,13 @@ static const struct x86_emulate_ops hvm_
> >>      .vmfunc        =3D hvmemul_vmfunc,
> >>  };
> >>
> >> +/*
> >> + * Note that passing HVMIO_no_completion into this function serves =
as kind
> >> + * of (but not fully) an "auto select completion" indicator.
> >> + */
> >>  static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
> >> -    const struct x86_emulate_ops *ops)
> >> +    const struct x86_emulate_ops *ops,
> >> +    enum hvm_io_completion completion)
> >>  {
> >>      const struct cpu_user_regs *regs =3D hvmemul_ctxt->ctxt.regs;
> >>      struct vcpu *curr =3D current;
> >> @@ -2642,16 +2649,31 @@ static int _hvm_emulate_one(struct hvm_e
> >>          rc =3D X86EMUL_RETRY;
> >>
> >>      if ( !hvm_ioreq_needs_completion(&vio->io_req) )
> >> +        completion =3D HVMIO_no_completion;
> >
> > The comment doesn't mention that passing in something other than
> > HVMIO_no_completion could get overridden. Is that intentional?
>=20
> Well, it was, but since you seem to be asking for it I've added
> "When there's no completion needed, the passed in value will be
>  ignored in any case."

That sounds ok.

>=20
> >> +    else if ( completion =3D=3D HVMIO_no_completion )
> >> +        completion =3D (vio->io_req.type !=3D IOREQ_TYPE_PIO ||
> >> +                      hvmemul_ctxt->is_mem_access) ? =
HVMIO_mmio_completion
> >> +                                                   : =
HVMIO_pio_completion;
> >> +
> >> +    switch ( vio->io_completion =3D completion )
> >
> > I thought we tended to avoid assignments in control flow statements.
>=20
> In if() we do, because of the ambiguity whether =3D=3D might have
> been meant instead. But in switch() there's imo no such
> ambiguity - if =3D=3D was really meant, if() would better be used
> anyway. We have quite a few cases of this elsewhere, and I think
> some of them are reasonably recent introductions. As you're the
> maintainer of the file, if you strongly think I shouldn't do so,
> I'll switch of course.

No, that's ok; I was just seeking clarification of when this style is =
acceptable.

>=20
> >> @@ -2727,8 +2752,8 @@ int hvm_emulate_one_mmio(unsigned long m
> >>      hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
> >>                            guest_cpu_user_regs());
> >>      ctxt.ctxt.data =3D &mmio_ro_ctxt;
> >> -    rc =3D _hvm_emulate_one(&ctxt, ops);
> >> -    switch ( rc )
> >> +
> >> +    switch ( rc =3D _hvm_emulate_one(&ctxt, ops, =
HVMIO_no_completion) )
> >
> > Again, why move the assignment into the switch statement?
>=20
> For consistency with the other cases where this gets introduced
> in this patch, at least. I for one consider this the more concise
> way of writing such code.
>=20
> >> --- a/xen/arch/x86/hvm/vmx/realmode.c
> >> +++ b/xen/arch/x86/hvm/vmx/realmode.c
> >> @@ -97,15 +97,11 @@ static void realmode_deliver_exception(
> >>  void vmx_realmode_emulate_one(struct hvm_emulate_ctxt =
*hvmemul_ctxt)
> >>  {
> >>      struct vcpu *curr =3D current;
> >> -    struct hvm_vcpu_io *vio =3D &curr->arch.hvm.hvm_io;
> >>      int rc;
> >>
> >>      perfc_incr(realmode_emulations);
> >>
> >> -    rc =3D hvm_emulate_one(hvmemul_ctxt);
> >> -
> >> -    if ( hvm_ioreq_needs_completion(&vio->io_req) )
> >> -        vio->io_completion =3D HVMIO_realmode_completion;
> >> +    rc =3D hvm_emulate_one(hvmemul_ctxt, =
HVMIO_realmode_completion);
> >
> > Ok, I guess the override of completion is intentional to deal with
> > this case. Perhaps expand the comment above _hvm_emulate_one() then.
>=20
> Right, done as per above. Let me know whether the text still isn't
> sufficient.
>=20
> >> --- a/xen/include/asm-x86/hvm/emulate.h
> >> +++ b/xen/include/asm-x86/hvm/emulate.h
> >> @@ -48,6 +48,8 @@ struct hvm_emulate_ctxt {
> >>
> >>      uint32_t intr_shadow;
> >>
> >> +    bool is_mem_access;
> >> +
> >
> > Whilst you mention in the commit comment why this is added, I don't
> > see any consumer if it in this patch. Will the come later?
>=20
> hvmemul_validate() sets the field, and _hvm_emulate_one() consumes
> it.
>=20

Oh yes, I see it now.

With the comment addition...

Reviewed-by: Paul Durrant <paul@xen.org>

> Jan


