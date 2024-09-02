Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A3968174
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787603.1197019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Bl-0001ik-3M; Mon, 02 Sep 2024 08:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787603.1197019; Mon, 02 Sep 2024 08:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Bl-0001fu-0C; Mon, 02 Sep 2024 08:13:29 +0000
Received: by outflank-mailman (input) for mailman id 787603;
 Mon, 02 Sep 2024 08:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zhad=QA=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sl2Bk-0000lK-1l
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:13:28 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2244ab-6903-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:13:26 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3df09d398faso2036647b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:13:26 -0700 (PDT)
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
X-Inumbo-ID: 3a2244ab-6903-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725264805; x=1725869605; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8ZX2bpF10T+jfhR+e+We0IPz1zcVdM58CnUY1jIyqs=;
        b=dsAbhFZBb0zXawyKA0+ZLQPiKEa0NCmFnYVDSxMFdrGiBEJk+ZeA757KgMRTCjeJXS
         YP3UWgP6aiFiFSHdePOglTTnlgDf+xjKJpN+18dbdMyQgKFkW5iisbpJ38j7n0TGgpnf
         nfZL7JkLL6fwjJG0H+Pz6MjV5YLbGogxfnUNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264805; x=1725869605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8ZX2bpF10T+jfhR+e+We0IPz1zcVdM58CnUY1jIyqs=;
        b=S7LSKTbbN+cv+D/2GZcciRPM6a4q/9khh0LapEFBzPaqKEYDCx3sWkkiDNVT2KwzBt
         54z9wAZKG8n0ZZGskY3lHZHrKi30p32jFBeJMkMIMRAoHFvizVZmoH5PLUH3/X3Sedyq
         qbd14ICBGpPcc05vcaZgBlQhpngc51cy2wpDBa7wx/VK3vjueD2WtWLBm7qIloWFuNM5
         1dpfxpf1OUlmK5wcM2SfNxLHeUdQEDFeaGhN6h6HEgHzK2D1J5RDksBtncUURbi+DSmy
         A4gkoVoGNprpCd7tTWNaCp7xkri1OmxckAiUap/FxjLapq1xSr3TqaPg5yKXvknxWbQW
         Yivg==
X-Gm-Message-State: AOJu0YwjESYDL02M7A4Ewpm4hU4sTN19z23jIJ6P8fDA05Q7xj+6nTFb
	s2CWMoVxoxGNM6R8MsClHGzRE5QgRwrE0wVVTpOeur1jT4d4lAGgZIKOmp301rnA5+535beprzk
	UWdaNSPjjxAnNCTQFD7f5PdZpxUeF6Jlt4NUZsg==
X-Google-Smtp-Source: AGHT+IE0N3PVo7KEVa1FyWGg/lRM2iUCbwjjFvEu20rQ3vZJ2ZoOS1PRjlQnJcs7W6E78/GBjJdPpl6nPyuvYkL5fiE=
X-Received: by 2002:a05:6808:f14:b0:3db:15ed:2a21 with SMTP id
 5614622812f47-3df1c96485fmr7048839b6e.16.1725264804811; Mon, 02 Sep 2024
 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 2 Sep 2024 09:13:13 +0100
Message-ID: <CAEfZLvmShVwi5_KHpuJ3xfpAjvaafx_Xob5ZPjTG9wN=JCCK8w@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[gmail is a bit terrible and defaults to reply to single person not
reply all, resent]

There is one bug here that would cause a crash, and several instances
of undefined behaviour.

On Mon, Sep 2, 2024 at 9:10=E2=80=AFAM Edwin Torok <edwin.torok@cloud.com> =
wrote:
>
> On Fri, Aug 30, 2024 at 6:53=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > We should be doing this unilaterally.
>
> Agreed, but we should do it safely, since last time I did this I
> learned about a few more instances of behaviours I previously thought
> to be safe, but that are undefined behaviour.
> Which probably means we have a bunch of other code to fixup (I should
> really finish my static analyzer project, and update it with the newly
> learned rules to catch all these...).
> See below for comments.
>
> Although there is one bug here we've previously known to avoid:
> String_val cannot be dereferenced with the lock released, that one is
> an OCaml value and will cause actual problems,
> so we need to caml_copy_string that one.
>
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Christian Lindig <christian.lindig@citrix.com>
> > CC: David Scott <dave@recoil.org>
> > CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> > CC: Rob Hoes <Rob.Hoes@citrix.com>
> > CC: Andrii Sultanov <andrii.sultanov@cloud.com>
> >
> > Also pulled out of a larger cleanup series.
> > ---
> >  tools/ocaml/libs/xc/xenctrl_stubs.c | 63 +++++++++++++++++++++++++++--
> >  1 file changed, 60 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/=
xenctrl_stubs.c
> > index c78191f95abc..20487b21008f 100644
> > --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> > +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> > @@ -312,7 +312,10 @@ CAMLprim value stub_xc_domain_max_vcpus(value xch_=
val, value domid,
> >         xc_interface *xch =3D xch_of_val(xch_val);
> >         int r;
> >
> > +       caml_enter_blocking_section();
> >         r =3D xc_domain_max_vcpus(xch, Int_val(domid), Int_val(max_vcpu=
s));
>
> We need to move the Int_val macros out of here, domid is registered as
> a GC root, so the GC *will* write to it (it'll write the same value).
> So in practice it probably won't cause any observable corruption, but
> is still undefined behaviour and may not play nicely with compiler
> optimizations.
>
> This would probably be easier to review in a git tree, because there
> isn't enough context in the patch to see which values are registered
> as GC roots or not.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (r)
> >                 failwith_xc(xch);
> >
> > @@ -329,7 +332,10 @@ value stub_xc_domain_sethandle(value xch_val, valu=
e domid, value handle)
> >
> >         domain_handle_of_uuid_string(h, String_val(handle));
> >
> > +       caml_enter_blocking_section();
> >         i =3D xc_domain_sethandle(xch, Int_val(domid), h);
>
> GC root, need to move the macro out and assign to a local value.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (i)
> >                 failwith_xc(xch);
> >
> > @@ -391,7 +397,10 @@ CAMLprim value stub_xc_domain_shutdown(value xch_v=
al, value domid, value reason)
> >         xc_interface *xch =3D xch_of_val(xch_val);
> >         int ret;
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_domain_shutdown(xch, Int_val(domid), Int_val(reason)=
);
>
> GC roots again.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > @@ -503,7 +512,10 @@ CAMLprim value stub_xc_domain_getinfo(value xch_va=
l, value domid)
> >         xc_domaininfo_t info;
> >         int ret;
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_domain_getinfo_single(xch, Int_val(domid), &info);
>
> GC root.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > @@ -546,7 +558,10 @@ CAMLprim value stub_xc_vcpu_context_get(value xch_=
val, value domid,
> >         int ret;
> >         vcpu_guest_context_any_t ctxt;
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_vcpu_getcontext(xch, Int_val(domid), Int_val(cpu), &=
ctxt);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if ( ret < 0 )
> >                 failwith_xc(xch);
> >
> > @@ -584,10 +599,14 @@ CAMLprim value stub_xc_vcpu_setaffinity(value xch=
_val, value domid,
> >                 if (Bool_val(Field(cpumap, i)))
> >                         c_cpumap[i/8] |=3D 1 << (i&7);
> >         }
> > +
> > +       caml_enter_blocking_section();
> >         retval =3D xc_vcpu_setaffinity(xch, Int_val(domid),
> >                                      Int_val(vcpu),
> >                                      c_cpumap, NULL,
> >                                      XEN_VCPUAFFINITY_HARD);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         free(c_cpumap);
> >
> >         if (retval < 0)
> > @@ -612,10 +631,13 @@ CAMLprim value stub_xc_vcpu_getaffinity(value xch=
_val, value domid,
> >         if (c_cpumap =3D=3D NULL)
> >                 failwith_xc(xch);
> >
> > +       caml_enter_blocking_section();
> >         retval =3D xc_vcpu_getaffinity(xch, Int_val(domid),
> >                                      Int_val(vcpu),
> >                                      c_cpumap, NULL,
> >                                      XEN_VCPUAFFINITY_HARD);
>
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (retval < 0) {
> >                 free(c_cpumap);
> >                 failwith_xc(xch);
> > @@ -639,9 +661,13 @@ CAMLprim value stub_xc_sched_id(value xch_val)
> >  {
> >         CAMLparam1(xch_val);
> >         xc_interface *xch =3D xch_of_val(xch_val);
> > -       int sched_id;
> > +       int ret, sched_id;
> > +
> > +       caml_enter_blocking_section();
> > +       ret =3D xc_sched_id(xch, &sched_id);
> > +       caml_leave_blocking_section();
> >
> > -       if (xc_sched_id(xch, &sched_id))
> > +       if (ret)
> >                 failwith_xc(xch);
> >
> >         CAMLreturn(Val_int(sched_id));
> > @@ -674,7 +700,10 @@ CAMLprim value stub_xc_evtchn_reset(value xch_val,=
 value domid)
> >         xc_interface *xch =3D xch_of_val(xch_val);
> >         int r;
> >
> > +       caml_enter_blocking_section();
> >         r =3D xc_evtchn_reset(xch, Int_val(domid));
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (r < 0)
> >                 failwith_xc(xch);
> >         CAMLreturn(Val_unit);
> > @@ -811,7 +840,10 @@ CAMLprim value stub_xc_send_debug_keys(value xch_v=
al, value keys)
> >         xc_interface *xch =3D xch_of_val(xch_val);
> >         int r;
> >
> > +       caml_enter_blocking_section();
> >         r =3D xc_send_debug_keys(xch, String_val(keys));
>
> This is clearly unsafe because String_val dereferences an OCaml value
> with the lock released, which is not allowed.
> You need to copy the string to a C string, and free it afterwards.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (r)
> >                 failwith_xc(xch);
> >         CAMLreturn(Val_unit);
> > @@ -952,7 +984,11 @@ CAMLprim value stub_xc_domain_set_memmap_limit(val=
ue xch_val, value domid,
> >         int retval;
> >
> >         v =3D Int64_val(map_limitkb);
> > +
> > +       caml_enter_blocking_section();
> >         retval =3D xc_domain_set_memmap_limit(xch, Int_val(domid), v);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (retval)
> >                 failwith_xc(xch);
> >
> > @@ -1203,8 +1239,11 @@ CAMLprim value stub_xc_domain_ioport_permission(=
value xch_val, value domid,
> >         c_nr_ports =3D Int_val(nr_ports);
> >         c_allow =3D Bool_val(allow);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_domain_ioport_permission(xch, Int_val(domid),
> >                                          c_start_port, c_nr_ports, c_al=
low);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > @@ -1225,8 +1264,11 @@ CAMLprim value stub_xc_domain_iomem_permission(v=
alue xch_val, value domid,
> >         c_nr_pfns =3D Nativeint_val(nr_pfns);
> >         c_allow =3D Bool_val(allow);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_domain_iomem_permission(xch, Int_val(domid),
> >                                          c_start_pfn, c_nr_pfns, c_allo=
w);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > @@ -1245,8 +1287,11 @@ CAMLprim value stub_xc_domain_irq_permission(val=
ue xch_val, value domid,
> >         c_pirq =3D Int_val(pirq);
> >         c_allow =3D Bool_val(allow);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_domain_irq_permission(xch, Int_val(domid),
> >                                        c_pirq, c_allow);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > @@ -1309,7 +1354,9 @@ CAMLprim value stub_xc_domain_test_assign_device(=
value xch_val, value domid, val
> >         func =3D Int_val(Field(desc, 3));
> >         sbdf =3D encode_sbdf(domain, bus, dev, func);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_test_assign_device(xch, Int_val(domid), sbdf);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> >
> >         CAMLreturn(Val_bool(ret =3D=3D 0));
> >  }
> > @@ -1328,8 +1375,10 @@ CAMLprim value stub_xc_domain_assign_device(valu=
e xch_val, value domid, value de
> >         func =3D Int_val(Field(desc, 3));
> >         sbdf =3D encode_sbdf(domain, bus, dev, func);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_assign_device(xch, Int_val(domid), sbdf,
> >                                XEN_DOMCTL_DEV_RDM_RELAXED);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> >
> >         if (ret < 0)
> >                 failwith_xc(xch);
> > @@ -1350,7 +1399,9 @@ CAMLprim value stub_xc_domain_deassign_device(val=
ue xch_val, value domid, value
> >         func =3D Int_val(Field(desc, 3));
> >         sbdf =3D encode_sbdf(domain, bus, dev, func);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_deassign_device(xch, Int_val(domid), sbdf);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> >
> >         if (ret < 0)
> >                 failwith_xc(xch);
> > @@ -1379,8 +1430,11 @@ CAMLprim value stub_xc_get_cpu_featureset(value =
xch_val, value idx)
> >                 /* To/from hypervisor to retrieve actual featureset */
> >                 uint32_t fs[fs_len], len =3D fs_len;
> >                 unsigned int i;
> > +               int ret;
> >
> > -               int ret =3D xc_get_cpu_featureset(xch, Int_val(idx), &l=
en, fs);
> > +               caml_enter_blocking_section();
> > +               ret =3D xc_get_cpu_featureset(xch, Int_val(idx), &len, =
fs);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +               caml_leave_blocking_section();
> >
> >                 if (ret)
> >                         failwith_xc(xch);
> > @@ -1403,7 +1457,10 @@ CAMLprim value stub_xc_watchdog(value xch_val, v=
alue domid, value timeout)
> >         int ret;
> >         unsigned int c_timeout =3D Int32_val(timeout);
> >
> > +       caml_enter_blocking_section();
> >         ret =3D xc_watchdog(xch, Int_val(domid), c_timeout);
>
> Haven't checked these anymore, but I assume they are GC roots.
>
> > +       caml_leave_blocking_section();
> > +
> >         if (ret < 0)
> >                 failwith_xc(xch);
> >
> > --
> > 2.39.2
> >

