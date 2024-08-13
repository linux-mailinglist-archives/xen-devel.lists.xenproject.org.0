Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D395053E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 14:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776208.1186344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqp8-0000rF-9H; Tue, 13 Aug 2024 12:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776208.1186344; Tue, 13 Aug 2024 12:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqp8-0000ps-6U; Tue, 13 Aug 2024 12:40:26 +0000
Received: by outflank-mailman (input) for mailman id 776208;
 Tue, 13 Aug 2024 12:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdqp7-0000pT-8X
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 12:40:25 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35e2b92a-5971-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 14:40:24 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135dso6276787a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 05:40:24 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5be9a0946easm409939a12.55.2024.08.13.05.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 05:40:23 -0700 (PDT)
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
X-Inumbo-ID: 35e2b92a-5971-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723552824; x=1724157624; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQEBnOfKllVY+kVrofMMNPEdDjB5AuMAdrl5+DwXEus=;
        b=d1OOpDkhmB0++kVnI4Uo9u5ECjgIYNF/7w1jGJpf946Zsbo5PyeW7Oy5pRccYMU3Sm
         AgYfvR3mhp0TCwW89sJs7PWtcIIBqcgWcKKPw9VT45S/UOQRLmBZOyWE8Xl7HnpMOOsK
         9w5Wgo52b6iAbRvic5MgbX1AgzHZ3qeom0UuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552824; x=1724157624;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQEBnOfKllVY+kVrofMMNPEdDjB5AuMAdrl5+DwXEus=;
        b=rtvqvYy1k54+kr0oJjf8H108vEeS4y7fpOmkGrEkdmPMUMRjwkvzfIcSDlpGHrRTFZ
         YCTZSHyoXEsCR2/1NY5eJiRTEglcjy7diap6dELbyOh/Ze6k4ofLsievjIf4eLwQ626X
         rw+zaQtxkAzwMOCVVlxNQHy4yzPHgyL3k8XxWgWDNMIEfLYyQX7OCbIoTQwBWCwmYe0q
         qI3qWJQm/tTp4SRdC9HsdIEayGU9ahuvkvU+m42LRYn8k+sSOKpjfQrhexfDgFPtMdZD
         g8zGlDhGCRphpwDpUoEIXARrz3vYO9DsX691aaZnC9iPifrLpv4DqB0KZ1bLJsFE+1Dd
         qXOw==
X-Forwarded-Encrypted: i=1; AJvYcCVPDrV17rpo2jHHlkPbGoEqFgFATf9uEF7p7GwXdCULfA2zVDGW/vWJc3+2mm+veRsNJOCOLwF+Tpio891enZtF2N02cQ4iS7ZVqF3KIwU=
X-Gm-Message-State: AOJu0YyBpyd61WVE9ULG3IJMZPBcyyNEV0iNlueF5XOkG/1RxO9RsVAt
	Wm6zvC+ea77eye7n4Gj0WiMTf4/7OXnJb6r7da9ag1EJWd+cMZH9Nz33jNNGlgU=
X-Google-Smtp-Source: AGHT+IHMciy8q1FOxet9Zm1VGxcEGjGy4cxaAipK70SV/z04ihtp/s0sfXxxTg7OkulFDKicVdSbHw==
X-Received: by 2002:a05:6402:35c8:b0:5a2:6e1c:91e9 with SMTP id 4fb4d7f45d1cf-5bd44c14c71mr2626804a12.7.1723552823602;
        Tue, 13 Aug 2024 05:40:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Aug 2024 13:40:21 +0100
Message-Id: <D3ESHFJW8P2L.1YUEIVC4C77KJ@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/fpu: Split fpu_setup_fpu() in two
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
 <20240808134150.29927-3-alejandro.vallejo@cloud.com>
 <7f001aa8-ee42-4617-8fc4-e4a45d4228e2@suse.com>
In-Reply-To: <7f001aa8-ee42-4617-8fc4-e4a45d4228e2@suse.com>

On Mon Aug 12, 2024 at 4:23 PM BST, Jan Beulich wrote:
> On 08.08.2024 15:41, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1164,10 +1164,25 @@ static int cf_check hvm_load_cpu_ctxt(struct do=
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
> > +     * On Xen 4.1 and later the FPU state is restored on later HVM con=
text in
> > +     * the migrate stream, so what we're doing here is initialising th=
e FPU
> > +     * state for guests from even older versions of Xen.
> > +     *
> > +     * In particular:
> > +     *   1. If there's an XSAVE context later in the stream what we do=
 here for
> > +     *      the FPU doesn't matter because it'll be overriden later.
> > +     *   2. If there isn't and the guest didn't use extended states it=
's still
> > +     *      fine because we have all the information we need here.
> > +     *   3. If there isn't and the guest DID use extended states (coul=
d've
> > +     *      happened prior to Xen 4.1) then we're in a pickle because =
we have
> > +     *      to make up non-existing state. For this case we initialise=
 the FPU
> > +     *      as using x87/SSE only because the rest of the state is gon=
e.
>
> Was this really possible to happen? Guests wouldn't have been able to
> turn on CR4.OSXSAVE, would they?
>
> Jan

You may be right, but my reading of the comment and the code was that
xsave_enabled(v) might be set and the XSAVE hvm context might be missing in=
 the
stream. The archives didn't shed a lot more light than what the code alread=
y
gives away.

Otherwise it would've been far simpler to unconditionally pass
v->arch.xsave_area to the second parameter and let the xsave area to be
overriden by the follow-up HVM context with its actual state.

If my understanding is wrong, I'm happy to remove (3), as I don't think it
affects the code anyway. I thought however that it was a relevant data poin=
t
to leave paper trail for.

Cheers,
Alejandro

