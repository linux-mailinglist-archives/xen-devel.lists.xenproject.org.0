Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B1A646EA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916358.1321462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6d8-00071S-QC; Mon, 17 Mar 2025 09:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916358.1321462; Mon, 17 Mar 2025 09:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6d8-0006z4-NB; Mon, 17 Mar 2025 09:19:30 +0000
Received: by outflank-mailman (input) for mailman id 916358;
 Mon, 17 Mar 2025 09:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fdmo=WE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tu6d7-0006yy-RI
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:19:29 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc3fde5-0310-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:19:28 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-47662449055so19697301cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:19:28 -0700 (PDT)
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
X-Inumbo-ID: ecc3fde5-0310-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742203167; x=1742807967; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMwM0hLA1WU+/2phdnWV/lLWNk8GvmmnmN3KU0xXyJM=;
        b=UAk37f63B+wvnwM/IsqWyUatbuE+DT0sBCMZMHK9bHBLWYgwB86PE80FQ6KFLFhK92
         wgEAZkuWUiS1XygAJyTItQckENP1YJsoDPNpKAu83s+XwXYNF3ZGRWL5B6BwjHYOoeXG
         yiAiScXjwULGN+pp13a7RnI5DA93xYl3dat2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203167; x=1742807967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMwM0hLA1WU+/2phdnWV/lLWNk8GvmmnmN3KU0xXyJM=;
        b=nhThBZf/woBeryNoO3fOjK8F6H0fvGcaD2Vw/JSB7cKvhG07K7jRd1nvjYxzQjLGmJ
         dfrpiVXaaIkHLsstYyoLR/TL0uVfFodp/Vl7rDcAbtPKYr5naM+V14xvgFgT7ZPulhfi
         Z1CwuwAJqrTOmgqbN/UXQhcUjfyKu5TxQWQdUpNyOMl96qjsXKNySpduX0yQS2Bvn8Ef
         5qU4GTb1sW7rYMbD/ev0xtcp4CwgQd/1k4wFiYUkupwfw+2bhZQBmX3qNrTk3aNRL+6w
         mO2isaZ+PRhSn89ZEqJXGfk3xZ1Cvg933uu5Ub8Wz3f56GUMFmeLkskw1zBi7rwiWHhD
         BHEw==
X-Gm-Message-State: AOJu0YwH+aTq7Fnxqrlmv9Ebw4tgi7Up/Gvs7tGw82Bps8KzPave0otO
	tWCfm4sEWXRHkWjtGs6NPHfKsLvpY5zUqA+rMx1+UTJBkZFFcpVuEv0s+ro7kb9JLQMzwZFlJtr
	n+/ALA2OdC5DoyCyRSZI4HaWnuFw6he55UuXFfA==
X-Gm-Gg: ASbGncsqShBr24FK/u1kcp8cFsL0fJEqGWKcvZS6aOGuk6vIzErrtUGm1QwLyfklhQ7
	R/MpfEYRKXkxuS2WmZMPNZBjaZ86UCkx6+C/qW1mO4lYfbp+kWhmNpWDN6yREJbnE+HANMIwjSt
	I1iyySOI8OvEN47FcdgH9IH7N3ybiRzNveIrOUR3/ar32M8T1b
X-Google-Smtp-Source: AGHT+IFwUBLDIRDLVKyJb8UGMbH3n4QsJSD9En+bz+kGfk8iffIuxuC7Zj6hkQ+L0RcTecsDASopyqs6kyCgkC7eIgE=
X-Received: by 2002:a05:6214:21a1:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6eaea7022d1mr152049196d6.0.1742203166948; Mon, 17 Mar 2025
 02:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Mon, 17 Mar 2025 09:19:15 +0000
X-Gm-Features: AQ5f1Jqj4mCQHMGX0PKfqLisSRloIPdraqLwoFC3S6qwc9EAYQVoIl983x_hXJI
Message-ID: <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000e491dc0630864859"

--000000000000e491dc0630864859
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm surprised this isn't already possible. Neat!

On Mon, 17 Mar 2025, 07:19 Sergiy Kibrik, <Sergiy_Kibrik@epam.com> wrote:

> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related
> macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/Kconfig                  |  5 +++++
>  xen/arch/x86/hvm/Makefile             |  2 +-
>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>  xen/arch/x86/include/asm/hvm/domain.h |  4 ++--
>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>  xen/arch/x86/include/asm/hvm/vcpu.h   |  3 ++-
>  7 files changed, 37 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 6e41bc0fb4..34f9b79d98 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -348,6 +348,11 @@ config HYPERV_GUEST
>
>  endif
>
> +config HVM_VIRIDIAN
> +       bool "Viridian enlightenments support" if EXPERT
> +       depends on HVM
> +       default y
> +
>


I don't see why this should be gated by EXPERT, provided a
suitable (now absent) help message was to exist explaining
what it does in plain simple words.

For the title, I'd say it needs to properly state it refers to
enlightenments for guests, rather than enlightenments for
Xen itself when running under Hyper-V. As it is, it sounds
ambiguous (Maybe "Hyper-V enlighnments for guests"?).

On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
rather redundant, and I think just VIRIDIAN works just as well
while being shorter.

 config MEM_PAGING
>         bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>         depends on HVM
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 4c1fa5c6c2..6cc2e74fc4 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -1,6 +1,6 @@
>  obj-$(CONFIG_AMD_SVM) += svm/
>  obj-$(CONFIG_INTEL_VMX) += vmx/
> -obj-y += viridian/
> +obj-$(CONFIG_HVM_VIRIDIAN) += viridian/
>
>  obj-y += asid.o
>  obj-y += dm.o
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 2f31180b6f..4f51d0f66c 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>
> -    rc = viridian_domain_init(d);
> -    if ( rc )
> -        goto fail2;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_domain_init(d);
> +        if ( rc )
> +            goto fail2;
> +    }
>
>      rc = alternative_call(hvm_funcs.domain_initialise, d);
>      if ( rc != 0 )
> @@ -733,7 +736,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>      if ( hvm_funcs.nhvm_domain_relinquish_resources )
>          alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>
> -    viridian_domain_deinit(d);
> +    if ( is_viridian_domain(d) )
> +        viridian_domain_deinit(d);
>
>      ioreq_server_destroy_all(d);
>
> @@ -1637,9 +1641,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>           && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown:
> nestedhvm_vcpu_destroy */
>          goto fail5;
>
> -    rc = viridian_vcpu_init(v);
> -    if ( rc )
> -        goto fail6;
> +    if ( is_viridian_domain(v->domain) )
> +    {
> +        rc = viridian_vcpu_init(v);
> +        if ( rc )
> +            goto fail6;
> +    }
>
>      rc = ioreq_server_add_vcpu_all(d, v);
>      if ( rc != 0 )
> @@ -1669,13 +1676,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
>   fail2:
>      hvm_vcpu_cacheattr_destroy(v);
>   fail1:
> -    viridian_vcpu_deinit(v);
> +    if ( is_viridian_domain(v->domain) )
> +        viridian_vcpu_deinit(v);
>      return rc;
>  }
>
>  void hvm_vcpu_destroy(struct vcpu *v)
>  {
> -    viridian_vcpu_deinit(v);
> +    if ( is_viridian_domain(v->domain) )
> +        viridian_vcpu_deinit(v);
>
>      ioreq_server_remove_vcpu_all(v->domain, v);
>
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 065b2aab5b..b8236dade0 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>       * priority vector and then recurse to handle the lower priority
>       * vector.
>       */
> -    bool missed_eoi = viridian_apic_assist_completed(v);
> +    bool missed_eoi = has_viridian_apic_assist(v->domain) ?
> +                          viridian_apic_assist_completed(v) : false;
>      int vector;
>
>   again:
> @@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>       * NOTE: It is harmless to call viridian_apic_assist_clear() on a
>       *       recursion, even though it is not necessary.
>       */
> -    if ( !missed_eoi )
> +    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
>          viridian_apic_assist_clear(v);
>
>      vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
> @@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
>       * If so, we need to emulate the EOI here before comparing ISR
>       * with IRR.
>       */
> -    if ( viridian_apic_assist_completed(v) )
> +    if ( has_viridian_apic_assist(v->domain) &&
> +         viridian_apic_assist_completed(v) )
>          vlapic_EOI_set(vlapic);
>
>      isr = vlapic_find_highest_isr(vlapic);
> @@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
>      if ( isr >= 0 &&
>           (irr & 0xf0) <= (isr & 0xf0) )
>      {
> -        viridian_apic_assist_clear(v);
> +        if ( has_viridian_apic_assist(v->domain) )
> +            viridian_apic_assist_clear(v);
>          return -1;
>      }
>
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h
> b/xen/arch/x86/include/asm/hvm/domain.h
> index 333501d5f2..bc52504cdd 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -110,9 +110,9 @@ struct hvm_domain {
>
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
> -
> +#ifdef CONFIG_HVM_VIRIDIAN
>      struct viridian_domain *viridian;
> -
> +#endif
>      /*
>       * TSC value that VCPUs use to calculate their tsc_offset value.
>       * Used during initialization and save/restore.
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h
> b/xen/arch/x86/include/asm/hvm/hvm.h
> index 963e820113..1bbeece117 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)
>      (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
>
>  #define is_viridian_domain(d) \
> -    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
> +    (is_hvm_domain(d) && IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
> +                         (viridian_feature_mask(d) & HVMPV_base_freq))
>
>  #define is_viridian_vcpu(v) \
>      is_viridian_domain((v)->domain)
> diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h
> b/xen/arch/x86/include/asm/hvm/vcpu.h
> index 196fed6d5d..bac35ec47a 100644
> --- a/xen/arch/x86/include/asm/hvm/vcpu.h
> +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
> @@ -171,8 +171,9 @@ struct hvm_vcpu {
>
>      /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */
>      struct x86_event     inject_event;
> -
> +#ifdef CONFIG_HVM_VIRIDIAN
>      struct viridian_vcpu *viridian;
> +#endif
>  };
>
>  #endif /* __ASM_X86_HVM_VCPU_H__ */
>

nit: I suspect the code would be far less cluttered with "if viridian..."
if the
init/deinit/etc functions had dummy versions of those functions when
!HVM_VIRIDIAN in the header.

Cheers,
Alejandro

>
>

--000000000000e491dc0630864859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;m surprised this isn&#39;t already possible. Neat!<br><br><div cla=
ss=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 17 Mar 2025, 07:19 Sergiy Kibrik, &lt;<a href=3D"m=
ailto:Sergiy_Kibrik@epam.com">Sergiy_Kibrik@epam.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Add config option HVM_VIRIDIAN that covers=
 viridian code within HVM.<br>
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.<br>
Having this option may be beneficial by reducing code footprint for systems=
<br>
that are not using Hyper-V.<br>
<br>
Signed-off-by: Sergiy Kibrik &lt;<a href=3D"mailto:Sergiy_Kibrik@epam.com" =
target=3D"_blank" rel=3D"noreferrer">Sergiy_Kibrik@epam.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/x86/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0xen/arch/x86/hvm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/hvm/hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 27 ++++++++++++++++++---------<br>
=C2=A0xen/arch/x86/hvm/vlapic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++++----<br>
=C2=A0xen/arch/x86/include/asm/hvm/domain.h |=C2=A0 4 ++--<br>
=C2=A0xen/arch/x86/include/asm/hvm/hvm.h=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0xen/arch/x86/include/asm/hvm/vcpu.h=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A07 files changed, 37 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig<br>
index 6e41bc0fb4..34f9b79d98 100644<br>
--- a/xen/arch/x86/Kconfig<br>
+++ b/xen/arch/x86/Kconfig<br>
@@ -348,6 +348,11 @@ config HYPERV_GUEST<br>
<br>
=C2=A0endif<br>
<br>
+config HVM_VIRIDIAN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Viridian enlightenments support&quot=
; if EXPERT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on HVM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I don&#39;t see why this should be gated by EX=
PERT, provided a</div><div dir=3D"auto">suitable (now absent) help message =
was to exist explaining=C2=A0</div><div dir=3D"auto">what it does in plain =
simple words.</div><div dir=3D"auto"><br></div><div dir=3D"auto">For the ti=
tle, I&#39;d say it needs to properly state it refers to</div><div dir=3D"a=
uto">enlightenments for guests, rather than enlightenments for</div><div di=
r=3D"auto">Xen itself when running under Hyper-V. As it is, it sounds</div>=
<div dir=3D"auto">ambiguous (Maybe &quot;Hyper-V enlighnments for guests&qu=
ot;?).</div><div dir=3D"auto"><br></div><div dir=3D"auto">On a personal nit=
picky preference note, I&#39;d say HVM_VIRIDIAN sounds</div><div dir=3D"aut=
o">rather redundant, and I think just VIRIDIAN works just as well</div><div=
 dir=3D"auto">while being shorter.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
=C2=A0config MEM_PAGING<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Xen memory paging support (UNSUPPORT=
ED)&quot; if UNSUPPORTED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on HVM<br>
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile<br>
index 4c1fa5c6c2..6cc2e74fc4 100644<br>
--- a/xen/arch/x86/hvm/Makefile<br>
+++ b/xen/arch/x86/hvm/Makefile<br>
@@ -1,6 +1,6 @@<br>
=C2=A0obj-$(CONFIG_AMD_SVM) +=3D svm/<br>
=C2=A0obj-$(CONFIG_INTEL_VMX) +=3D vmx/<br>
-obj-y +=3D viridian/<br>
+obj-$(CONFIG_HVM_VIRIDIAN) +=3D viridian/<br>
<br>
=C2=A0obj-y +=3D asid.o<br>
=C2=A0obj-y +=3D dm.o<br>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c<br>
index 2f31180b6f..4f51d0f66c 100644<br>
--- a/xen/arch/x86/hvm/hvm.c<br>
+++ b/xen/arch/x86/hvm/hvm.c<br>
@@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,<br>
=C2=A0 =C2=A0 =C2=A0if ( hvm_tsc_scaling_supported )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;arch.hvm.tsc_scaling_ratio =3D hvm_=
default_tsc_scaling_ratio;<br>
<br>
-=C2=A0 =C2=A0 rc =3D viridian_domain_init(d);<br>
-=C2=A0 =C2=A0 if ( rc )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<br>
+=C2=A0 =C2=A0 if ( is_viridian_domain(d) )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D viridian_domain_init(d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0rc =3D alternative_call(hvm_funcs.domain_initialise, d)=
;<br>
=C2=A0 =C2=A0 =C2=A0if ( rc !=3D 0 )<br>
@@ -733,7 +736,8 @@ void hvm_domain_relinquish_resources(struct domain *d)<=
br>
=C2=A0 =C2=A0 =C2=A0if ( hvm_funcs.nhvm_domain_relinquish_resources )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alternative_vcall(hvm_funcs.nhvm_domain_r=
elinquish_resources, d);<br>
<br>
-=C2=A0 =C2=A0 viridian_domain_deinit(d);<br>
+=C2=A0 =C2=A0 if ( is_viridian_domain(d) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 viridian_domain_deinit(d);<br>
<br>
=C2=A0 =C2=A0 =C2=A0ioreq_server_destroy_all(d);<br>
<br>
@@ -1637,9 +1641,12 @@ int hvm_vcpu_initialise(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (rc =3D nestedhvm_vcpu_initia=
lise(v)) &lt; 0 ) /* teardown: nestedhvm_vcpu_destroy */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail5;<br>
<br>
-=C2=A0 =C2=A0 rc =3D viridian_vcpu_init(v);<br>
-=C2=A0 =C2=A0 if ( rc )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail6;<br>
+=C2=A0 =C2=A0 if ( is_viridian_domain(v-&gt;domain) )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D viridian_vcpu_init(v);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail6;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0rc =3D ioreq_server_add_vcpu_all(d, v);<br>
=C2=A0 =C2=A0 =C2=A0if ( rc !=3D 0 )<br>
@@ -1669,13 +1676,15 @@ int hvm_vcpu_initialise(struct vcpu *v)<br>
=C2=A0 fail2:<br>
=C2=A0 =C2=A0 =C2=A0hvm_vcpu_cacheattr_destroy(v);<br>
=C2=A0 fail1:<br>
-=C2=A0 =C2=A0 viridian_vcpu_deinit(v);<br>
+=C2=A0 =C2=A0 if ( is_viridian_domain(v-&gt;domain) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 viridian_vcpu_deinit(v);<br>
=C2=A0 =C2=A0 =C2=A0return rc;<br>
=C2=A0}<br>
<br>
=C2=A0void hvm_vcpu_destroy(struct vcpu *v)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 viridian_vcpu_deinit(v);<br>
+=C2=A0 =C2=A0 if ( is_viridian_domain(v-&gt;domain) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 viridian_vcpu_deinit(v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0ioreq_server_remove_vcpu_all(v-&gt;domain, v);<br>
<br>
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c<br>
index 065b2aab5b..b8236dade0 100644<br>
--- a/xen/arch/x86/hvm/vlapic.c<br>
+++ b/xen/arch/x86/hvm/vlapic.c<br>
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)<br>
=C2=A0 =C2=A0 =C2=A0 * priority vector and then recurse to handle the lower=
 priority<br>
=C2=A0 =C2=A0 =C2=A0 * vector.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 bool missed_eoi =3D viridian_apic_assist_completed(v);<br>
+=C2=A0 =C2=A0 bool missed_eoi =3D has_viridian_apic_assist(v-&gt;domain) ?=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 viridian_apic_assist_completed(v) : false;<br>
=C2=A0 =C2=A0 =C2=A0int vector;<br>
<br>
=C2=A0 again:<br>
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)<br>
=C2=A0 =C2=A0 =C2=A0 * NOTE: It is harmless to call viridian_apic_assist_cl=
ear() on a<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0recursion, even though it =
is not necessary.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if ( !missed_eoi )<br>
+=C2=A0 =C2=A0 if ( has_viridian_apic_assist(v-&gt;domain) &amp;&amp; !miss=
ed_eoi )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0viridian_apic_assist_clear(v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0vlapic_clear_vector(vector, &amp;vlapic-&gt;regs-&gt;da=
ta[APIC_ISR]);<br>
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0 * If so, we need to emulate the EOI here before compar=
ing ISR<br>
=C2=A0 =C2=A0 =C2=A0 * with IRR.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if ( viridian_apic_assist_completed(v) )<br>
+=C2=A0 =C2=A0 if ( has_viridian_apic_assist(v-&gt;domain) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0viridian_apic_assist_completed(v) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vlapic_EOI_set(vlapic);<br>
<br>
=C2=A0 =C2=A0 =C2=A0isr =3D vlapic_find_highest_isr(vlapic);<br>
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0if ( isr &gt;=3D 0 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (irr &amp; 0xf0) &lt;=3D (isr &amp; 0xf0=
) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 viridian_apic_assist_clear(v);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( has_viridian_apic_assist(v-&gt;domain) )<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 viridian_apic_assist_clear(v);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h<br>
index 333501d5f2..bc52504cdd 100644<br>
--- a/xen/arch/x86/include/asm/hvm/domain.h<br>
+++ b/xen/arch/x86/include/asm/hvm/domain.h<br>
@@ -110,9 +110,9 @@ struct hvm_domain {<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* hypervisor intercepted msix table */<br>
=C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0msixtbl_list=
;<br>
-<br>
+#ifdef CONFIG_HVM_VIRIDIAN<br>
=C2=A0 =C2=A0 =C2=A0struct viridian_domain *viridian;<br>
-<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * TSC value that VCPUs use to calculate their tsc_offs=
et value.<br>
=C2=A0 =C2=A0 =C2=A0 * Used during initialization and save/restore.<br>
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h<br>
index 963e820113..1bbeece117 100644<br>
--- a/xen/arch/x86/include/asm/hvm/hvm.h<br>
+++ b/xen/arch/x86/include/asm/hvm/hvm.h<br>
@@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0(has_hvm_params(d) ? (d)-&gt;arch.hvm.params[HVM_PARAM_=
VIRIDIAN] : 0)<br>
<br>
=C2=A0#define is_viridian_domain(d) \<br>
-=C2=A0 =C2=A0 (is_hvm_domain(d) &amp;&amp; (viridian_feature_mask(d) &amp;=
 HVMPV_base_freq))<br>
+=C2=A0 =C2=A0 (is_hvm_domain(d) &amp;&amp; IS_ENABLED(CONFIG_HVM_VIRIDIAN)=
 &amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(viridian_feature_mask(d) &amp; HVMPV_base_freq))<br>
<br>
=C2=A0#define is_viridian_vcpu(v) \<br>
=C2=A0 =C2=A0 =C2=A0is_viridian_domain((v)-&gt;domain)<br>
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h<br>
index 196fed6d5d..bac35ec47a 100644<br>
--- a/xen/arch/x86/include/asm/hvm/vcpu.h<br>
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h<br>
@@ -171,8 +171,9 @@ struct hvm_vcpu {<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Pending hw/sw interrupt (.vector =3D -1 means nothin=
g pending). */<br>
=C2=A0 =C2=A0 =C2=A0struct x86_event=C2=A0 =C2=A0 =C2=A0inject_event;<br>
-<br>
+#ifdef CONFIG_HVM_VIRIDIAN<br>
=C2=A0 =C2=A0 =C2=A0struct viridian_vcpu *viridian;<br>
+#endif<br>
=C2=A0};<br>
<br>
=C2=A0#endif /* __ASM_X86_HVM_VCPU_H__ */<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">nit: I suspect the code would be f=
ar less cluttered with &quot;if viridian...&quot; if the</div><div dir=3D"a=
uto">init/deinit/etc functions had dummy versions of those functions when</=
div><div dir=3D"auto">!HVM_VIRIDIAN in the header.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto">Alejandro</div><d=
iv dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br></blockquote></div></div></div>

--000000000000e491dc0630864859--

