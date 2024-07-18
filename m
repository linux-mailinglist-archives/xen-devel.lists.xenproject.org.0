Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D46C93513C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 19:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760670.1170562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUss-0001K5-LK; Thu, 18 Jul 2024 17:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760670.1170562; Thu, 18 Jul 2024 17:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUss-0001Ho-IJ; Thu, 18 Jul 2024 17:25:38 +0000
Received: by outflank-mailman (input) for mailman id 760670;
 Thu, 18 Jul 2024 17:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiOu=OS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sUUsr-0001Hi-OF
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 17:25:37 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb45d91-452a-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 19:25:36 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so150274a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 10:25:36 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820e3dsm585694166b.194.2024.07.18.10.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 10:25:35 -0700 (PDT)
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
X-Inumbo-ID: beb45d91-452a-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721323536; x=1721928336; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9V0OS3KMlvXPuE+v2E26dH5fSQlgeRx81+aUTw86j0=;
        b=QY0o5PaJJBkw0V4GSLVg4YxsAJ/jWcdag7oaZd+a7JgSlT9C7+xj/+z8sBIkld77cb
         wM5TypqsOtqoPWDpbos62sNzL5TwPUb191bM2xLJCZGnn6q8CeXxl3slLafY6mqhhpnO
         5G5DlszgS2NYNs5GjoBZRtRs4ZIRvD3UHKE+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323536; x=1721928336;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9V0OS3KMlvXPuE+v2E26dH5fSQlgeRx81+aUTw86j0=;
        b=NmrZc3hwynoChfKvSkd7hLDHpw5NdzRXOcl5TZydF2wpJI8bbRIhTbIMN/ERgHIWIq
         o8oZ/OGPC8dIRq4eRXh51olw/8lecZTnUvGyGINP+fh5S5pinR/KWJVYHbwtSJoZLf+o
         PP40zEfxkqna8ZGnStV1D2K+2ls75FUkzJAJcRVb8bac5BrB+wxXwNvJCb8SyyLVtxCK
         s12S0uRCkgKP6rPUiVLKk0sJafCpdQ93FtPaw06eDod8z/KoyvyronRpYZlf2dQU0Cf0
         i7A5xBcyjQ+Yt7RgjelzFbOwkxYjXV2jhN4MB0v+FiP/0imPxQp26lE8XLK0UroNesa4
         7LDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbE/qPhx21mrbkKuvP1q4lYjnpD5BXbGLxCJ4BLx9dOBpCN+vlLVua5hIhaVe8sK8NI+MakICXPfcP/F7dq/4b9I1WaKBYBEWgh4qQP/k=
X-Gm-Message-State: AOJu0Yw9hY/Oh1EvRbgsTKXaMeU5ZPmCrlDS7IIVeDibgZ4nGBgDTQZH
	C41qWDy7yAY3T0N3dGidtxkTXvHZDtfW1/q7pavqWjf8BadPfWjUhUqBAIfJ7p8=
X-Google-Smtp-Source: AGHT+IEl54UWMHQDDisHDhkFmqqjwHpQW32cjdgItlOPEBkmER1pCISf8Jw/O3PWk978bw6p82pVfg==
X-Received: by 2002:a17:906:6d0f:b0:a72:64f0:552e with SMTP id a640c23a62f3a-a7a0f159d32mr399572266b.19.1721323535673;
        Thu, 18 Jul 2024 10:25:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 18:25:33 +0100
Message-Id: <D2SU9MKGLSB7.1J9TBL8HPU4AP@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20 4/4] x86/fpu: Split fpu_setup_fpu() in two
X-Mailer: aerc 0.17.0
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <da30dedcfa68d7c30375b96c85424e13ec6d458b.1720538832.git.alejandro.vallejo@cloud.com> <c311ef0f-7d86-4a2b-b056-9bfa0665113e@suse.com>
In-Reply-To: <c311ef0f-7d86-4a2b-b056-9bfa0665113e@suse.com>

On Thu Jul 18, 2024 at 1:19 PM BST, Jan Beulich wrote:
> On 09.07.2024 17:52, Alejandro Vallejo wrote:
> > It's doing too many things at once and there's no clear way of defining=
 what
> > it's meant to do. This patch splits the function in two.
> >=20
> >   1. A reset function, parameterized by the FCW value. FCW_RESET means =
to reset
> >      the state to power-on reset values, while FCW_DEFAULT means to res=
et to the
> >      default values present during vCPU creation.
> >   2. A x87/SSE state loader (equivalent to the old function when it too=
k a data
> >      pointer).
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > I'm still not sure what the old function tries to do. The state we star=
t vCPUs
> > in is _similar_ to the after-finit, but it's not quite (`ftw` is not -1=
). I went
> > for the "let's not deviate too much from previous behaviour", but maybe=
 we did
> > intend for vCPUs to start as if `finit` had just been executed?
>
> A relevant aspect here may be that what FSXR and XSAVE area have is only =
an
> abridged form of the tag word, being only 8 bits in size. 0x00 there is
> equivalent to FTW=3D0xffff (all st(<N>) empty). That's not quite correct =
for
> the reset case indeed, where FTW=3D0x5555 (i.e. all st(<N>) zero, requiri=
ng

I missed the tag being abridged. That makes a lot of sense, thanks.

> the abridged form to hold 0xff instead). While no-one has reported issues
> there so far, I think it wouldn't be inappropriate to correct this.

Ack, I'll add it on v2.

>
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1162,10 +1162,17 @@ static int cf_check hvm_load_cpu_ctxt(struct do=
main *d, hvm_domain_context_t *h)
> >      seg.attr =3D ctxt.ldtr_arbytes;
> >      hvm_set_segment_register(v, x86_seg_ldtr, &seg);
> > =20
> > -    /* Cover xsave-absent save file restoration on xsave-capable host.=
 */
> > -    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
> > -                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_reg=
s : NULL,
> > -                   FCW_RESET);
> > +    /*
> > +     * On Xen 4.1 and later the FPU state is restored on a later HVM c=
ontext, so
> > +     * what we're doing here is initialising the FPU state for guests =
from even
> > +     * older versions of Xen. In general such guests only use legacy x=
87/SSE
> > +     * state, and if they did use XSAVE then our best-effort strategy =
is to make
> > +     * an XSAVE header for x87 and SSE hoping that's good enough.
> > +     */
> > +    if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
> > +        vcpu_setup_fpu(v, &ctxt.fpu_regs);
> > +    else
> > +        vcpu_reset_fpu(v, FCW_RESET);
>
> I'm struggling with the use of "later" in the comment. What exactly is th=
at
> meant to express? Fundamentally the XSAVE data is fully backwards compati=
ble
> with the FXSR one, I think, so the mentioning of "best-effort" isn't quit=
e
> clear to me either.

I meant that the XSAVE state (including FPU/SSE state) is passed not on the=
 HVM
context struct being process _here_, but another one that will arrive later=
 on
in the stream. There's 3 interesting cases regarding extended states:

  1. If there is an XSAVE context later in the stream, what we do here for =
the
     FPU doesn't matter because it'll be overriden later. That's fine.
  2. If there isn't and the guest didn't use extended states  it's still fi=
ne
     because we have all the information we need here.
  2. If there isn't but the guest DID use extended states (could've happene=
d
     prior to Xen 4.1) then we're in a pickle because we have to make up
     non-existing state. This is what I meant by best effort.

Seeing how you got confused the comment probably needs to be rewritten to
better reflect this.

>
> > --- a/xen/arch/x86/i387.c
> > +++ b/xen/arch/x86/i387.c
> > @@ -310,41 +310,25 @@ int vcpu_init_fpu(struct vcpu *v)
> >      return xstate_alloc_save_area(v);
> >  }
> > =20
> > -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
> > -                    const void *data, unsigned int fcw_default)
> > +void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw)
> >  {
> > -    fpusse_t *fpu_sse =3D &v->arch.xsave_area->fpu_sse;
> > -
> > -    ASSERT(!xsave_area || xsave_area =3D=3D v->arch.xsave_area);
> > -
> > -    v->fpu_initialised =3D !!data;
> > -
> > -    if ( data )
> > -    {
> > -        memcpy(fpu_sse, data, sizeof(*fpu_sse));
> > -        if ( xsave_area )
> > -            xsave_area->xsave_hdr.xstate_bv =3D XSTATE_FP_SSE;
> > -    }
> > -    else if ( xsave_area && fcw_default =3D=3D FCW_DEFAULT )
> > -    {
> > -        xsave_area->xsave_hdr.xstate_bv =3D 0;
> > -        fpu_sse->mxcsr =3D MXCSR_DEFAULT;
> > -    }
> > -    else
> > -    {
> > -        memset(fpu_sse, 0, sizeof(*fpu_sse));
> > -        fpu_sse->fcw =3D fcw_default;
> > -        fpu_sse->mxcsr =3D MXCSR_DEFAULT;
> > -        if ( v->arch.xsave_area )
> > -        {
> > -            v->arch.xsave_area->xsave_hdr.xstate_bv &=3D ~XSTATE_FP_SS=
E;
> > -            if ( fcw_default !=3D FCW_DEFAULT )
> > -                v->arch.xsave_area->xsave_hdr.xstate_bv |=3D X86_XCR0_=
X87;
> > -        }
> > -    }
> > +    v->fpu_initialised =3D false;
> > +    *v->arch.xsave_area =3D (struct xsave_struct) {
> > +        .fpu_sse =3D {
> > +            .mxcsr =3D MXCSR_DEFAULT,
> > +            .fcw =3D fcw,
> > +        },
> > +        .xsave_hdr.xstate_bv =3D fcw =3D=3D FCW_RESET ? X86_XCR0_X87 :=
 0,
> > +    };
> > +}
>
> Old code checked against FCW_DEFAULT uniformly. You switching to checking
> against FCW_RESET is no functional change only because all callers pass
> either of the two values. I wonder whether the new function's parameter
> wouldn't want to be a boolean (reset vs init).

I agree, and It's effectively what it is. The problem with the boolean is t=
hat
it's utterly unreadable at the call sites.

    vcpu_reset_fpu(v, true); /* Is this reset or set-to-default? */
    vcpu_reset_fpu(v, FCW_RESET); /* Clear to be a reset */

I could also split it in 2, so we end up with these:

  * vcpu_setup_fpu(v, data): Copies x87/SSE state
  * vcpu_reset_fpu(v): Reset to power-on state
  * vcpu_set_default_fpu(v): Reset to default state

Thinking about it, I kind of prefer this second approach. Thoughts?

>
> > -    if ( xsave_area )
> > -        xsave_area->xsave_hdr.xcomp_bv =3D 0;
> > +void vcpu_setup_fpu(struct vcpu *v, const void *data)
> > +{
> > +    v->fpu_initialised =3D true;
> > +    *v->arch.xsave_area =3D (struct xsave_struct) {
> > +        .fpu_sse =3D *(fpusse_t*)data,
>
> First of all please never cast away const. See Misra rule 11.8. And then
> a nit again: Blank ahead of the latter of the two *-s, please.
>

Bah, yes. You're right. Casting to (const fpusse_t *) instead should appeas=
e
the UB gods.

> > --- a/xen/arch/x86/include/asm/i387.h
> > +++ b/xen/arch/x86/include/asm/i387.h
> > @@ -31,10 +31,29 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool =
need_stts);
> >  void vcpu_restore_fpu_lazy(struct vcpu *v);
> >  void vcpu_save_fpu(struct vcpu *v);
> >  void save_fpu_enable(void);
> > -
> >  int vcpu_init_fpu(struct vcpu *v);
> > -struct xsave_struct;
> > -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
> > -                    const void *data, unsigned int fcw_default);
> >  void vcpu_destroy_fpu(struct vcpu *v);
> > +
> > +/*
> > + * Restore `v`'s FPU to known values
> > + *
> > + * If fcw =3D=3D FCW_RESET, then the reset state is power-on RESET.
> > + *
> > + * Otherwise `mxcsr` is set to `MXCSR_DEFAULT`, `fcw` is overriden wit=
h the
> > + * `fcw` argument and everything else is zeroed out.
>
> Backticks are used for two different purposes here, which I'm afraid is
> confusing. You want to make it easy to tell function arguments from other
> entities, imo.
>

Fair enough, sure.

> > + * @param v   vCPU containing the FPU
> > + * @param fcw Intended FPU Control Word
> > + */
> > +void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw);
> > +
> > +/*
> > + * Load x87/SSE state into `v`'s FPU
>
> Applicable here then as well.
>
> Jan

Cheers,
Alejandro

