Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCBB2A4CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086092.1444323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzrX-0003eh-A5; Mon, 18 Aug 2025 13:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086092.1444323; Mon, 18 Aug 2025 13:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzrX-0003c7-77; Mon, 18 Aug 2025 13:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1086092;
 Mon, 18 Aug 2025 13:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUli=26=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1unzrV-0003c1-Jw
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:25:21 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6e71c7d-7c36-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 15:25:16 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-74374a65f35so3209128a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:25:16 -0700 (PDT)
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
X-Inumbo-ID: c6e71c7d-7c36-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755523515; x=1756128315; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbgjEWrFgywzJCgyLCGykrKsOpFZVL7XFoZn1TUjcck=;
        b=NdvWCSR20KYKr5srsEL02WLyjZUGdK1uJv9uREtkrypSILO7aY0LVjgpGgFHgdG1rJ
         kexVMAIV1UZOHMMyJzqjjWqBBxPIJ2+RloXCWpJfh/2ZW5e9+hOPEIg8kstpdkXAB4qo
         XAdOXz22wQzCA3JM6wKAQl31FaVUdUkS9KZ54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523515; x=1756128315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbgjEWrFgywzJCgyLCGykrKsOpFZVL7XFoZn1TUjcck=;
        b=lQfXcbDywEDD3hcV2ay7w7X3OnxwErVZ/e5xo+U6DVLtvyZRHcafvU/zEt3SG4BNfo
         tWUPp1oxQL0r8vrfR9/JS8YNq5X/2vxylm88SdtzCdo3/078KfC7GujJ91ZGnPUVsHbP
         QSco3SwwwmVRfLXcF2zo3l6iI5j3KU/udwzhIcYwC74n+Caq7FngViwUL7+GA0DTCbf1
         EqCyBUCVcVldRrH0k4u+TaUT24Qoj6Peg+EHlqZ14s52/yR1ObrGsRylCC7FDdCCL+d1
         rE1xP6ase9o/cOab1kko60M4llsGMVVdSL+E/LOHJHGZ4o8sOQ2ge5MlWyfJV3wxgvD/
         8new==
X-Forwarded-Encrypted: i=1; AJvYcCVR0h8JyCTLAU5+Hd89/dwnK6fNLlxxuX/SMVpyEaKogDPimvig+3Ap6JvWGam5zWrtkGf3JedPsug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKKb67wXOcOjY9o75v3MwV3hfhfDFdtWxoCaoz4SZOM2iayIoO
	J68Wyk4tEHVWx6A43HSvDBoFuyWY3u/VbLROP1Y7OHQQSLIewe8tltYngFPSTWPqXd7SO1BkSo2
	20BOqwXDDL2+KG4F8dh0Z455MwA5qJlNgOyDcxtR0GA==
X-Gm-Gg: ASbGncssMsVou660gq/1qyTHyJuCPh8hLpj2/Tdzcr2AheHUgWeHaRi2LyniQy/2ypm
	jugvlL0NE+ZmXJqetFfqB22OLbbn0jNv20ALUMIaGubN0+XyqWXvEFqtUQmP4SwAm1BqZ1CPk0N
	+v6JQoENk/zm7/O24KLhZyu04+uIqf/Ziu6KpKS0tx85BqgMYDOmzWpgTSeyjhZnX86Zuxf23Yx
	Zzr2A==
X-Google-Smtp-Source: AGHT+IF0EZhS2xMnu9d+NYT2sH6vXpo3zpk6nGHQKbvjF2mgnKVGxqF/igHyxeTcRxnfq+wGqxL/+KAM+N7Z3+dH/LY=
X-Received: by 2002:a05:6808:6ec3:b0:435:e4ee:d779 with SMTP id
 5614622812f47-435ebb2a587mr8745764b6e.4.1755523514709; Mon, 18 Aug 2025
 06:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-7-andrew.cooper3@citrix.com> <f1693582-ff30-47a2-8be5-2fbe9c812594@suse.com>
In-Reply-To: <f1693582-ff30-47a2-8be5-2fbe9c812594@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 18 Aug 2025 14:25:03 +0100
X-Gm-Features: Ac12FXwVU_sC29BLEVf2bJf0TCQ1uI0_b1NYY7YiLAR_yenqe_vSCnC87FnWM9U
Message-ID: <CACHz=Zgp8c+n4yQKSw2BVEdHKjOw2SrKquixfdDDGrRxrVGDDg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] x86/msr: Split out tsc.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 2:07=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.08.2025 22:41, Andrew Cooper wrote:
> > The TSC functionality is only related to MSRs by write_tsc(), and this =
really
> > does not want to be available as widely as is currently is.
> >
> > asm/time.h shouldn't be including asm/msr.h, but this turns out to be
> > sufficiently tangled that I've chosen to break it out into it's own pat=
ch.
> >
> > No functional change.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one nit:
>
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/tsc.h
> > @@ -0,0 +1,46 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef X86_TSC_H
> > +#define X86_TSC_H
> > +
> > +#include <asm/alternative.h>
> > +
> > +static inline uint64_t rdtsc(void)
> > +{
> > +    uint64_t low, high;
> > +
> > +    asm volatile ( "rdtsc" : "=3Da" (low), "=3Dd" (high) );
> > +
> > +    return (high << 32) | low;
> > +}
> > +
> > +static inline uint64_t rdtsc_ordered(void)
> > +{
> > +    uint64_t low, high, aux;
> > +
> > +    /*
> > +     * The RDTSC instruction is not serializing.  Make it dispatch ser=
ializing
> > +     * for the purposes here by issuing LFENCE (or MFENCE if necessary=
) ahead
> > +     * of it.
> > +     *
> > +     * RDTSCP, otoh, "does wait until all previous instructions have e=
xecuted
> > +     * and all previous loads are globally visible" (SDM) / "forces al=
l older
> > +     * instructions to retire before reading the timestamp counter" (A=
PM).
> > +     */
> > +    alternative_io_2("lfence; rdtsc",
> > +                     "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
> > +                     "rdtscp",        X86_FEATURE_RDTSCP,
> > +                     ASM_OUTPUT2("=3Da" (low), "=3Dd" (high), "=3Dc" (=
aux)),
> > +                     /* no inputs */);
> > +
> > +    return (high << 32) | low;
> > +}
> > +
> > +#define __write_tsc(val) wrmsrl(MSR_IA32_TSC, val)
> > +#define write_tsc(val) ({                                       \
> > +    /* Reliable TSCs are in lockstep across all CPUs. We should \
> > +     * never write to them. */                                  \
>
> This comment may want to become a proper Xen-style one while being moved.
>
> Jan
>

Does it make sense to move the comment out of the macro?

Frediano

