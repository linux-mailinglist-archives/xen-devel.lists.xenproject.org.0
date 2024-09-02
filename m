Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17A968C81
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788299.1197792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAM1-0000BU-1N; Mon, 02 Sep 2024 16:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788299.1197792; Mon, 02 Sep 2024 16:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAM0-00008O-V4; Mon, 02 Sep 2024 16:56:36 +0000
Received: by outflank-mailman (input) for mailman id 788299;
 Mon, 02 Sep 2024 16:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zhad=QA=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1slALz-000063-K9
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:56:35 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e8191c1-694c-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 18:56:33 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5d5c7f23f22so2594233eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:56:33 -0700 (PDT)
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
X-Inumbo-ID: 4e8191c1-694c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725296192; x=1725900992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/3eqK+GZUJQ6ftrucdmX8AdYiqtnRRZT5E54ejb+8=;
        b=e4K5hxtaXU2N83J47GxhSQLhqZ/ojH82eErd9/eh2ELgI3cHz/rLqu0bxE9T46ZS0O
         q6ybxan5NR52k1WdiGC5uaeU1clmSKTZQItWZthE3QwXJso9BMC6faGmh5oD3XKSeiou
         fA81N72UrrXK0L2q/zPxa3f4SJNaCbi32mNlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296192; x=1725900992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh/3eqK+GZUJQ6ftrucdmX8AdYiqtnRRZT5E54ejb+8=;
        b=e7S+WfdBVsk2z6KSR6kba7p6aXB0Cg7lWfsmaUNqwfD1BPStHIedmYPSh14qpgICo2
         mDR+LB0f0RFm5YySDH7++SuePKL7XCawo2haQ+mBHV+sOw/fPtHZK44uBKVLIgZIxFgX
         /grhtRW3hOWVTziNblErv2uOwlVMXEUD2ZcrQBFQXK7bZBaIY/MyrIHPSWOP4gmoLWPt
         1EVLpfk0466Rhj1TmcWLivoSPU6UVlyhlSHHCQAJNnZ+N/YgZpzWLRpJoXO+Y1btZNEi
         usWiF9CclhvmLp2mMWZQ9uEdAi1ZfZA4mZcyEQbO/a2mOpEAX/pij+PbEhWsQrIKZw4e
         Mfig==
X-Gm-Message-State: AOJu0Yx1CKo3BJUofX4X6zEjhxT18AuHZCmEkytGAhvPesYwTTMu6vtm
	GE9eM7VEq+NNORaRpcCd9HK7/4ER6+zwneilTMmhpoccOE8hpumtlVOdAJ/ZFp+xUlm4cWZTTYk
	1z2R+rXsgu0ehLS5JFfxni/hwNXRXEQ5UrEM3kQ==
X-Google-Smtp-Source: AGHT+IERElg/GV5+Vp4VVYH0i2mG/z9DnSn4ArHdfhJR4vtrCDZOcghbVueTRGIP1uHM2zioZHbXUYKmrcCGOaI5WzE=
X-Received: by 2002:a05:6820:2707:b0:5ce:d2e3:b18 with SMTP id
 006d021491bc7-5dfad03f169mr10254604eaf.8.1725296192095; Mon, 02 Sep 2024
 09:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
 <CAEfZLvkhqA9urPyFqPp+bAeF-+X8dAs3+iC2NnpMdrUSwpuH5w@mail.gmail.com> <dfb2a806-65ff-49f1-8955-7eceea2bc566@citrix.com>
In-Reply-To: <dfb2a806-65ff-49f1-8955-7eceea2bc566@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 2 Sep 2024 17:56:21 +0100
Message-ID: <CAEfZLvkMw9E+2VgVipTO0+ZgPtR3ZA91wayTq=CDLkxBL3n81A@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 5:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 02/09/2024 9:10 am, Edwin Torok wrote:
> > On Fri, Aug 30, 2024 at 6:53=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >> We should be doing this unilaterally.
> > Agreed, but we should do it safely, since last time I did this I
> > learned about a few more instances of behaviours I previously thought
> > to be safe, but that are undefined behaviour.
> > Which probably means we have a bunch of other code to fixup (I should
> > really finish my static analyzer project, and update it with the newly
> > learned rules to catch all these...).
> > See below for comments.
> >
> > Although there is one bug here we've previously known to avoid:
> > String_val cannot be dereferenced with the lock released, that one is
> > an OCaml value and will cause actual problems,
> > so we need to caml_copy_string that one.
> >
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Christian Lindig <christian.lindig@citrix.com>
> >> CC: David Scott <dave@recoil.org>
> >> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> >> CC: Rob Hoes <Rob.Hoes@citrix.com>
> >> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
> >>
> >> Also pulled out of a larger cleanup series.
> >> ---
> >>  tools/ocaml/libs/xc/xenctrl_stubs.c | 63 +++++++++++++++++++++++++++-=
-
> >>  1 file changed, 60 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc=
/xenctrl_stubs.c
> >> index c78191f95abc..20487b21008f 100644
> >> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> >> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> >> @@ -312,7 +312,10 @@ CAMLprim value stub_xc_domain_max_vcpus(value xch=
_val, value domid,
> >>         xc_interface *xch =3D xch_of_val(xch_val);
> >>         int r;
> >>
> >> +       caml_enter_blocking_section();
> >>         r =3D xc_domain_max_vcpus(xch, Int_val(domid), Int_val(max_vcp=
us));
> > We need to move the Int_val macros out of here, domid is registered as
> > a GC root, so the GC *will* write to it (it'll write the same value).
>
> How?
>
> As value's, both domid and max_vcpu are integers living in GPRs.

domid and max_vcpus are registered with CAMLparam macro, so their
address is registered as a GC root,
which the GC will see and go and update.
The compiler may have cached this in a GPR, but we can't rely on that.

In particular if you run the thread sanitizer in OCaml 5 it'll warn
all over the place about this (I haven't gotten as far as having a
full build with Xen and OCaml 5, I only have a XAPI build so far).
See here for a discussion https://github.com/ocaml/ocaml/pull/13188.
The GC could avoid the potential race here by checking whether the
value is an integer prior to updating it, but that might have a
(small) performance impact, so it is not done.

>
> These expressions are not dereferencing  into the Ocaml Heap.

No, but they are reachable from a C pointer that is registered as a GC
root in the OCaml GC.
(the CAMLparam macro registers all its parameters as GC roots).

Another option is to not register integers with CAMLparam, but that
breaks symmetry, and it'd then be very easy to forget to register an
OCaml parameter.

Best regards,
--Edwin

>
> ~Andrew

