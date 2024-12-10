Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE519EB3CD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852614.1266361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Uc-00083m-C8; Tue, 10 Dec 2024 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852614.1266361; Tue, 10 Dec 2024 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Uc-00081n-89; Tue, 10 Dec 2024 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 852614;
 Tue, 10 Dec 2024 14:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVUM=TD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tL1Ua-00081f-Jy
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:45:40 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5b357d-b705-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:45:38 +0100 (CET)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-29e65257182so2801830fac.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:45:38 -0800 (PST)
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
X-Inumbo-ID: 6b5b357d-b705-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733841937; x=1734446737; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLGVs3NXHjHw02oEprwUAflxGkcXVQa78J4wQ2tWkj4=;
        b=LjRKvv/4Pm9hOxz69vzNQoUDvSyqkD2T0yPsoNh7fyRPY+2LO/wcWNQM8NMryD+Pd3
         FhizCZhhbvx7KASw/c5ETjn92y3xi1qXHt8zXMitXWtsUWt7EZntgsYPfVJjjkNP2cQH
         cgYNNprIaQIgduCgvjSAXcYcTUiJouDAu+ZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841937; x=1734446737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLGVs3NXHjHw02oEprwUAflxGkcXVQa78J4wQ2tWkj4=;
        b=FGIn2z59cteli+utgEftBTJqJDYOX1JBYvLWttlWN9pR4euoFf6s9+j777gcomCvpd
         yksyPI+L9RS2/fPQzxJJ8lAz6jXevfC7wQxaOwKTTjEKCCrz+ytOshsVHCMhX67GRTei
         5ikSM/MEwrt8rJ2mK7ZOIJWdF8rW8HzChfkcj5TC5CQmEOsDN1Dq7UVCinK4H+y2bUHu
         1/JeF/J8V2S6wM/r88GaWqaGCnt6qcci+4OknTrzRZ6yKOV6E+Fs+OL5F0W1GSKX3DYt
         3Imwdhlq+zThQqUpWropi0m+4uaMyFtQbtQ2indtZuWemiTBaAeVmM2MmCG3Qg3z1VaM
         +OMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAGxzZegUX5apXQw4m67WjXwW53s92cOi9lgAPIUpAyogQ3z1ujbzoar9Cg/zNTtFiNs9Pp5DRjXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycVwilWfk3qpwvzIUdFHZAJgdO+ROjUz0sNVFhRxwnySLLqtwS
	zjIvZ5xGvOcpunUGieUBqYTjVAOJgCfyCISvvJj4rqRm50Y4qBhsRc7a7ZHnE/amG/fHD8RE57g
	NBxR+OXfYwlwNC7ff7kLWPpmn1q7ICHJpFllNwA==
X-Gm-Gg: ASbGncsbWVHqtOKKuONrV9apa8XCx/WFlCKZsrgDGinDWVmBzpDhcCWR3ONoWwNJEOO
	1MwPMVX8kB0mnOqnjEDoGSCWwchtLDlwSHdGtwQ==
X-Google-Smtp-Source: AGHT+IHfLhkUU9Q/x2HFvJrzmbTQYOVH0nDtxC1AMjgRc038cg9iEnoY+ZNw24tNOhWiqiePi9EJoqOfqov9WEDpF9A=
X-Received: by 2002:a05:6870:6b07:b0:297:241b:c48 with SMTP id
 586e51a60fabf-29f735a0d3cmr12413565fac.40.1733841937004; Tue, 10 Dec 2024
 06:45:37 -0800 (PST)
MIME-Version: 1.0
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-4-frediano.ziglio@cloud.com> <d5b856b5-ba0d-489b-9107-7c16b4042c55@suse.com>
In-Reply-To: <d5b856b5-ba0d-489b-9107-7c16b4042c55@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 10 Dec 2024 14:45:25 +0000
Message-ID: <CACHz=ZhQiETp-=wO1XgcJ2BqLSMq79c=0W34ZBrAMSu3epSVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] x86/boot: Move some settings to C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 10:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 22.11.2024 10:33, Frediano Ziglio wrote:
> > Initialise multiboot_ptr and pvh_start_info_pa from C code.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/x86/boot/build32.lds.S           |  3 +++
> >  xen/arch/x86/boot/head.S                  | 10 --------
> >  xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
> >  xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
> >  4 files changed, 26 insertions(+), 16 deletions(-)
>
> From the diffstat alone - is this really a win?
>

Yes, C can be longer then assembly, consider calling a function, assembly:

    foo:

    call foo

C:

   void foo(int x); // declaration (maybe in a separate header)

   void foo(int x) {
       ...
   }

   foo(123);

yes, much longer. Actually we could avoid the declaration, but usually
we explicitly force the compiler to complains about a missing
declaration. The reason is that usually programmers prefer the
compiler to avoid crashes and check for the passed parameters. This
requires more code but pay back the time not having to debug crashes.

If you look more at wide range (so, not only at this patch) the code
for a bit increases adding new files and symbols but after a while the
code starts to reduce (once added headers and preparation).

> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -517,16 +517,6 @@ trampoline_setup:
> >          /*      reloc(magic/eax, info/edx) using fastcall. */
> >          call    reloc
> >
> > -#ifdef CONFIG_PVH_GUEST
> > -        cmpb    $0, sym_esi(pvh_boot)
> > -        je      1f
> > -        mov     %eax, sym_esi(pvh_start_info_pa)
> > -        jmp     2f
> > -#endif
> > -1:
> > -        mov     %eax, sym_esi(multiboot_ptr)
> > -2:
> > -
> >          /* Interrogate CPU extended features via CPUID. */
> >          mov     $1, %eax
> >          cpuid
> > --- a/xen/arch/x86/boot/reloc.c
> > +++ b/xen/arch/x86/boot/reloc.c
> > @@ -17,13 +17,15 @@
> >  #include <xen/types.h>
> >
> >  #include <xen/kconfig.h>
> > -#include <xen/multiboot.h>
> >  #include <xen/multiboot2.h>
> >  #include <xen/page-size.h>
> > +#include <xen/bug.h>
> >
> >  #include <asm/trampoline.h>
> > +#include <asm/setup.h>
> >
> >  #include <public/arch-x86/hvm/start_info.h>
> > +#include <asm/guest/pvh-boot.h>
> >
> >  #ifdef CONFIG_VIDEO
> >  # include "video.h"
> > @@ -347,27 +349,41 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_=
in, memctx *ctx)
> >  }
> >
> >  /* SAF-1-safe */
> > -void *reloc(uint32_t magic, uint32_t in)
> > +void reloc(uint32_t magic, uint32_t in)
> >  {
> >      memctx ctx =3D { trampoline_phys + TRAMPOLINE_HEAP_END };
> >
> > +    void *res;
> > +
>
> Nit: Please avoid blank lines between declarations unless the set of loca=
ls
> is huge, or some really need to stand out.
>

Noted.

> >      switch ( magic )
> >      {
> >      case MULTIBOOT_BOOTLOADER_MAGIC:
> > -        return mbi_reloc(in, &ctx);
> > +        res =3D mbi_reloc(in, &ctx);
> > +        break;
> >
> >      case MULTIBOOT2_BOOTLOADER_MAGIC:
> > -        return mbi2_reloc(in, &ctx);
> > +        res =3D mbi2_reloc(in, &ctx);
> > +        break;
> >
> >      case XEN_HVM_START_MAGIC_VALUE:
> >          if ( IS_ENABLED(CONFIG_PVH_GUEST) )
> > -            return pvh_info_reloc(in, &ctx);
> > +        {
> > +            res =3D pvh_info_reloc(in, &ctx);
> > +            break;
> > +        }
> >          /* Fallthrough */
> >
> >      default:
> >          /* Nothing we can do */
> > -        return NULL;
> > +        res =3D NULL;
>
> Simply keep returning here? No need to write the NULL when the variables
> start out zeroed?
>

Yes, considering pvh_start_info_pa and multiboot_ptr should be already
NULL it makes sense

> >      }
> > +
> > +#ifdef CONFIG_PVH_GUEST
> > +    if ( pvh_boot )
> > +        pvh_start_info_pa =3D (unsigned long)res;
> > +#endif
> > +
> > +    multiboot_ptr =3D (unsigned long)res;
>
> In the assembly original this is an "else" to the if().
>

I suppose the return change above would solve also this.

> Jan

Frediano

