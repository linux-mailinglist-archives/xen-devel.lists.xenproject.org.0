Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB47C8D02
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616864.959169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMlU-0001ES-Al; Fri, 13 Oct 2023 18:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616864.959169; Fri, 13 Oct 2023 18:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMlU-0001CN-7a; Fri, 13 Oct 2023 18:20:00 +0000
Received: by outflank-mailman (input) for mailman id 616864;
 Fri, 13 Oct 2023 18:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMJ7=F3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qrMlS-0001CA-6w
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:19:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c9177f4-69f5-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 20:19:56 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so3686578a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 11:19:56 -0700 (PDT)
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
X-Inumbo-ID: 1c9177f4-69f5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697221196; x=1697825996; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0exkzigYjCynzbnJQu8JnrQ0VCvKe1L1o155nHPvIQ=;
        b=d4o+WjgNfS75iFK4SW5pCVEOumhIrbs2uTZ+AkgbaqHZXvGG3ARJw1XutCz7G2uTTN
         xlG4+B74V2aZVsLFauyICXx6eXEuvqYGaoIX+5t0qfDjI6jFRVL8itwvaQqSnyAqMS+H
         1PLKCWVvW5Z1xmd6dQcHr90yMM99Ix26QCpHqOLIKRimHJTRXIAm7JF+/NB6B0Zo1Oxc
         QZHXjauN8liEK0hsNDHTZNtZ+aHmkzAJEoFz1oxpcGIGO84OQQkSFCQNffylT8Q7KeWf
         sNVULzFDzLB5SaqzlWuFE5U7nGfDS3l/FUfvu4FDF7Cu5rG1rvuBj0yM0OfFLg4wLW+q
         y5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697221196; x=1697825996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0exkzigYjCynzbnJQu8JnrQ0VCvKe1L1o155nHPvIQ=;
        b=tKTUxC3iAVz7zjxesrRS+M57s/KCtVkMKtf5eqyOu4zTVRFTgc9aQlN2Eb5i++E0Rk
         AZzGh2r+ObM5vyQju6WN+nTKLuZlMuiAp8rxrE6IfuFVpHV2uAXYs5I30maWvE1kDd+9
         EKda+RDQVzEbcofI8OLkdD1p6HZEWFAKoIm7WzO17IzgLbvcNpvifJ5pf7CAGTVVdz0E
         9XljIq3u8C4B6v3PoRsT6dXyFAifizwf2SG1XDU3JMs/sev/8x0cuIZN+hzFEytaba1k
         afOMxy55+plJztTsMBkzQyTC9A4AMUiEaW7vxFo5hZA1RCu6Ua5dFLjd+yUY+nXYyvn9
         jZSg==
X-Gm-Message-State: AOJu0YxTJ0hcLKq06XQdNOvGuTHYpohq9pRIb+0NCqnOQOzCPtLhPvqP
	jZbHJG/mYPAez7KkZiO2zyEMhyiSZ3LPH/a3jaI=
X-Google-Smtp-Source: AGHT+IFbNiIX6/ULO8X8yCSIGnQtzYCarr/gXTjiNPfLhOCE4S5Pa/TiD8MBt0ZVpqRWb9UkYXbpAZR/Ltl2qGwUn8o=
X-Received: by 2002:a05:6402:f1c:b0:53d:e990:b8dc with SMTP id
 i28-20020a0564020f1c00b0053de990b8dcmr7329570eda.3.1697221195690; Fri, 13 Oct
 2023 11:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231010173924.44167-1-jandryuk@gmail.com> <9cda7031-286f-42e6-a23f-80c284931696@intel.com>
In-Reply-To: <9cda7031-286f-42e6-a23f-80c284931696@intel.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 13 Oct 2023 14:19:43 -0400
Message-ID: <CAKf6xpt1UdvJw7YZ5K6TBes_kXUv+7qm+gGW98=hPTu2p53eEg@mail.gmail.com>
Subject: Re: [PATCH v3] acpi/processor: sanitize _OSC/_PDC capabilities for
 Xen dom0
To: "Wilczynski, Michal" <michal.wilczynski@intel.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for taking a look, Michal.

On Fri, Oct 13, 2023 at 12:17=E2=80=AFPM Wilczynski, Michal
<michal.wilczynski@intel.com> wrote:
>
> Hi,
>
> On 10/10/2023 7:39 PM, Jason Andryuk wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> >
> > The Processor capability bits notify ACPI of the OS capabilities, and
> > so ACPI can adjust the return of other Processor methods taking the OS
> > capabilities into account.
> >
> > When Linux is running as a Xen dom0, the hypervisor is the entity
> > in charge of processor power management, and hence Xen needs to make
> > sure the capabilities reported by _OSC/_PDC match the capabilities of
> > the driver in Xen.
> >
> > Introduce a small helper to sanitize the buffer when running as Xen
> > dom0.
> >
> > When Xen supports HWP, this serves as the equivalent of commit
> > a21211672c9a ("ACPI / processor: Request native thermal interrupt
> > handling via _OSC") to avoid SMM crashes.  Xen will set bit
> > ACPI_PROC_CAP_COLLAB_PROC_PERF (bit 12) in the capability bits and the
> > _OSC/_PDC call will apply it.
> >
> > [ jandryuk: Mention Xen HWP's need.  Support _OSC & _PDC ]
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > v3:
> > Move xen_sanitize_pdc() call to arch_acpi_set_proc_cap_bits() to cover
> > _OSC and _PDC.
> > drivers/xen/pcpu.c is CONFIG_DOM0 && CONFIG_X86
> >
> > v2:
> > Move local variables in acpi_processor_eval_pdc() to reuse in both cond=
itions.
> > ---
> >  arch/x86/include/asm/acpi.h           | 13 +++++++++++++
> >  arch/x86/include/asm/xen/hypervisor.h |  9 +++++++++
> >  drivers/xen/pcpu.c                    | 21 +++++++++++++++++++++
> >  3 files changed, 43 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> > index c8a7fc23f63c..cc8d1669d6e8 100644
> > --- a/arch/x86/include/asm/acpi.h
> > +++ b/arch/x86/include/asm/acpi.h
> > @@ -16,6 +16,9 @@
> >  #include <asm/x86_init.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/irq_vectors.h>
> > +#include <asm/xen/hypervisor.h>
> > +
> > +#include <xen/xen.h>
> >
> >  #ifdef CONFIG_ACPI_APEI
> >  # include <asm/pgtable_types.h>
> > @@ -127,6 +130,16 @@ static inline void arch_acpi_set_proc_cap_bits(u32=
 *cap)
> >       if (!cpu_has(c, X86_FEATURE_MWAIT) ||
> >           boot_option_idle_override =3D=3D IDLE_NOMWAIT)
> >               *cap &=3D ~(ACPI_PROC_CAP_C_C1_FFH | ACPI_PROC_CAP_C_C2C3=
_FFH);
> > +
> > +     if (xen_initial_domain()) {
> > +             /*
> > +              * When Linux is running as Xen dom0, the hypervisor is t=
he
> > +              * entity in charge of the processor power management, an=
d so
> > +              * Xen needs to check the OS capabilities reported in the=
 _PDC
>
> I would argue the phrasing here is unfortunate - it's not really _PDC buf=
fer anymore,
> it's more processor capabilities buffer [1]. Your phrasing would indicate=
 that this
> buffer is somehow _PDC specific.

Ok.

> BTW this file is x86 specific code - are you sure it's appropriate to inv=
olve Xen
> hypervisor here ? I understand this case if x86 specific, but still.

The Xen hypercall is x86-specific.  I see
`arch_acpi_set_proc_cap_bits()` as a hook to set arch-specific bits.
Looking at Xen/x86 as the arch, it makes sense.  The other option
would be a Xen conditional back in the acpi code.  Keeping it with the
x86 code therefore made more sense to me.

> > +              * buffer matches what the hypervisor driver supports.
> > +              */
> > +             xen_sanitize_pdc(cap);
>
> Same here as in [1], I would call this function xen_sanitize_proc_cap_buf=
fer(),
> or something along those lines for better readability and correctness.

Ok.

> > +     }
> >  }
> >
> >  static inline bool acpi_has_cpu_in_madt(void)
> > diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/a=
sm/xen/hypervisor.h
> > index 7048dfacc04b..c6c2f174fa30 100644
> > --- a/arch/x86/include/asm/xen/hypervisor.h
> > +++ b/arch/x86/include/asm/xen/hypervisor.h
> > @@ -100,4 +100,13 @@ static inline void leave_lazy(enum xen_lazy_mode m=
ode)
> >
> >  enum xen_lazy_mode xen_get_lazy_mode(void);
> >
> > +#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI)
> > +void xen_sanitize_pdc(uint32_t *buf);
> > +#else
> > +static inline void xen_sanitize_pdc(uint32_t *buf)
> > +{
> > +     BUG();
> > +}
> > +#endif
> > +
> >  #endif /* _ASM_X86_XEN_HYPERVISOR_H */
> > diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
> > index b3e3d1bb37f3..859bb6027105 100644
> > --- a/drivers/xen/pcpu.c
> > +++ b/drivers/xen/pcpu.c
> > @@ -47,6 +47,9 @@
> >  #include <asm/xen/hypervisor.h>
> >  #include <asm/xen/hypercall.h>
> >
> > +#ifdef CONFIG_ACPI
> > +#include <acpi/processor.h>
> > +#endif
> >
> >  /*
> >   * @cpu_id: Xen physical cpu logic number
> > @@ -400,4 +403,22 @@ bool __init xen_processor_present(uint32_t acpi_id=
)
> >
> >       return online;
> >  }
> > +
> > +void xen_sanitize_pdc(uint32_t *cap)
> > +{
> > +     struct xen_platform_op op =3D {
> > +             .cmd                    =3D XENPF_set_processor_pminfo,
> > +             .u.set_pminfo.id        =3D -1,
> > +             .u.set_pminfo.type      =3D XEN_PM_PDC,
>
> It would probably be best to rename this constant as well so it's
> not misleading.

That is a Xen constant, so we can't change it.

> > +     };
> > +     u32 buf[3] =3D { ACPI_PDC_REVISION_ID, 1, *cap };
> > +     int ret;
> > +
> > +     set_xen_guest_handle(op.u.set_pminfo.pdc, buf);
> > +     ret =3D HYPERVISOR_platform_op(&op);
> > +     if (ret)
> > +             pr_info("sanitize of _PDC buffer bits from Xen failed: %d=
\n",
> > +                     ret);
>
> Shouldn't an error be pr_err ?

Sure.

> > +     *cap =3D buf[2];
> > +}
> >  #endif

Thanks,
Jason

