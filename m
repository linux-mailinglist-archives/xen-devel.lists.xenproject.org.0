Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6657FD6F3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 13:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643894.1004425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Jr9-0001t4-IP; Wed, 29 Nov 2023 12:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643894.1004425; Wed, 29 Nov 2023 12:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Jr9-0001py-Fd; Wed, 29 Nov 2023 12:39:55 +0000
Received: by outflank-mailman (input) for mailman id 643894;
 Wed, 29 Nov 2023 12:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZl0=HK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8Jr7-0001pd-Il
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 12:39:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63b2ebab-8eb4-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 13:39:51 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9c30c7eafso3142321fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 04:39:51 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p7-20020ac24ec7000000b0050bbc5efe03sm481726lfr.235.2023.11.29.04.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 04:39:50 -0800 (PST)
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
X-Inumbo-ID: 63b2ebab-8eb4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701261591; x=1701866391; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HJU9eB60rDmTTW4wIL0PGpbJ70bNu1jy9UKSmV/FZ8Y=;
        b=RZA6MN1Px54paNmcQllRDYLmob1/aYa+CW10fkiw6FXap3at3uSYfUbke5WuFkyYv/
         UaZQPRt3upCstEP/9VUwx+zDB5wDoY56sXerqWkGLkjK6b2VovsFPAqZrXmZdVVIGqPt
         XJd5jbxLEkP3th2F3lvoDf/cWTSI4q0SU3mDAgJGzhGPOCkMlqChZLxUY1rNioVrEf2I
         t58SsgCuHpOHSrU4Okt0xO3hQHdB33GwPkonw/ziWz8vaTleZ5Qjci5lxB5SL2Gb7CvF
         VzCYi+MrOI/UOKfkYRu7SVoedRUeWgPP6vZyStDcIvkY3h32hnCknNLlI0ahWHdvZHrt
         YOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701261591; x=1701866391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJU9eB60rDmTTW4wIL0PGpbJ70bNu1jy9UKSmV/FZ8Y=;
        b=a296yPtgD+kJy5jM2oCF78511wHGcysPqiS4zqHQHcd6r5W3Q5p8Pqsww96+/wXNk/
         X/uNJlVvUbRSi5Cvr0jZh/qFNQc41VT12HBZ/J5B5g5wrExP0f5xJtn72qzDWIuyfXQv
         Q1vJu6nvJWE2CptwzZ/3tzUDhfvt2Wy9v2L7s3+qFQkbnIHmll63d0hYSnwfzjzUtLo2
         HpPJohL/87xLRgs+/AabPjj2UI4zVGTGugjUBwkcwL5ghGa/WCW+LPQmirx+g9LxMmk5
         EErYRlLkh5Ij357iXlMK5wlNMrIngsvKcbsWNsWJeR22LEYJtOWZWq3G9r/Q4dPVDKXY
         bFXg==
X-Gm-Message-State: AOJu0YwxclbV0TqBns5oVStkTpQw2M9RKCAjijtUqytBXaYZmJeH/DrM
	B7YP51iAEE/rIbZ7gXaa0PI=
X-Google-Smtp-Source: AGHT+IE5BnlR/eYfJHdY/jTHiRNeCc3+zN1s6/amUDUhSgzUgNPzwOQHR714huyJFyHEM/Nl1VBrIg==
X-Received: by 2002:a19:7b02:0:b0:509:1067:c20d with SMTP id w2-20020a197b02000000b005091067c20dmr9991115lfc.39.1701261590491;
        Wed, 29 Nov 2023 04:39:50 -0800 (PST)
Message-ID: <c1501f5f5e1047b06be1e41461b222711a4b4882.camel@gmail.com>
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header
 monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jan Beulich <jbeulich@suse.com>
Date: Wed, 29 Nov 2023 14:39:49 +0200
In-Reply-To: <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
	 <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Shawn,

On Tue, 2023-11-28 at 16:21 -0600, Shawn Anastasio wrote:
> Hi Oleksii,
>=20
> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> > The header is shared between several archs so it is
> > moved to asm-generic.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>.
> > ---
> > Changes in V4:
> > =C2=A0- Removed the double blank line.
> > =C2=A0- Added Acked-by: Jan Beulich <jbeulich@suse.com>.
> > =C2=A0- Update the commit message
> > ---
> > Changes in V3:
> > =C2=A0- Use forward-declaration of struct domain instead of " #include
> > <xen/sched.h> ".
> > =C2=A0- Add ' include <xen/errno.h> '
> > =C2=A0- Drop PPC's monitor.h.
> > ---
> > Changes in V2:
> > 	- remove inclusion of "+#include <public/domctl.h>"
> > 	- add "struct xen_domctl_monitor_op;"
> > 	- remove one of SPDX tags.
> > ---
> > =C2=A0xen/arch/ppc/include/asm/Makefile=C2=A0 |=C2=A0 1 +
> > =C2=A0xen/arch/ppc/include/asm/monitor.h | 43 ---------------------
> > =C2=A0xen/include/asm-generic/monitor.h=C2=A0 | 62
> > ++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 63 insertions(+), 43 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/ppc/include/asm/monitor.h
> > =C2=A0create mode 100644 xen/include/asm-generic/monitor.h
> >=20
> > diff --git a/xen/arch/ppc/include/asm/Makefile
> > b/xen/arch/ppc/include/asm/Makefile
> > index 319e90955b..bcddcc181a 100644
> > --- a/xen/arch/ppc/include/asm/Makefile
> > +++ b/xen/arch/ppc/include/asm/Makefile
> > @@ -5,6 +5,7 @@ generic-y +=3D div64.h
> > =C2=A0generic-y +=3D hardirq.h
> > =C2=A0generic-y +=3D hypercall.h
> > =C2=A0generic-y +=3D iocap.h
> > +generic-y +=3D monitor.h
> > =C2=A0generic-y +=3D paging.h
> > =C2=A0generic-y +=3D percpu.h
> > =C2=A0generic-y +=3D random.h
> > diff --git a/xen/arch/ppc/include/asm/monitor.h
> > b/xen/arch/ppc/include/asm/monitor.h
> > deleted file mode 100644
> > index e5b0282bf1..0000000000
> > --- a/xen/arch/ppc/include/asm/monitor.h
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/* Derived from xen/arch/arm/include/asm/monitor.h */
> > -#ifndef __ASM_PPC_MONITOR_H__
> > -#define __ASM_PPC_MONITOR_H__
> > -
> > -#include <public/domctl.h>
> > -#include <xen/errno.h>
> > -
> > -static inline
> > -void arch_monitor_allow_userspace(struct domain *d, bool
> > allow_userspace)
> > -{
> > -}
> > -
> > -static inline
> > -int arch_monitor_domctl_op(struct domain *d, struct
> > xen_domctl_monitor_op *mop)
> > -{
> > -=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on PPC. */
> > -=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > -}
> > -
> > -int arch_monitor_domctl_event(struct domain *d,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
> > -
> > -static inline
> > -int arch_monitor_init_domain(struct domain *d)
> > -{
> > -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on PPC. *=
/
> > -=C2=A0=C2=A0=C2=A0 return 0;
> > -}
> > -
> > -static inline
> > -void arch_monitor_cleanup_domain(struct domain *d)
> > -{
> > -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on PPC. */
> > -}
> > -
> > -static inline uint32_t arch_monitor_get_capabilities(struct domain
> > *d)
> > -{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
>=20
> I'm not sure how I feel about this assertion being dropped in the
> generic header. In general my philosophy when creating these stub
> headers was to insert as many of these assertions as possible so we
> don't end up in a scenario where during early bringup I miss a
> function
> that was originally stubbed but ought to be implemented eventually.
>=20
> Looking at ARM's monitor.h too, it seems that this function is the
> only
> one that differs from the generic/stub version. I'm wondering if it
> would make sense to leave this function out of the generic header, to
> be
> defined by the arch similar to what you've done with some other
> functions in this series. That would also allow ARM to be brought in
> to
> using the generic variant.
Thanks for the comment.

For RISC-V, I did in the same way ( about BUG() and unimplemented for
time being functions ).

I agree that such implementation isn't correct for generic header. I
think the best one solution will be to include <asm-generic/monitor.h>
in <asm/monitor.h> whwere only this function will be implemented (
because implementation of other functions are the same for Arm, PPC and
RISC-V ).

>=20
> > -=C2=A0=C2=A0=C2=A0 return 0;
> > -}
> > -
> > -#endif /* __ASM_PPC_MONITOR_H__ */
> > diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
> > generic/monitor.h
> > new file mode 100644
> > index 0000000000..6be8614431
> > --- /dev/null
> > +++ b/xen/include/asm-generic/monitor.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * include/asm-GENERIC/monitor.h
> > + *
> > + * Arch-specific monitor_op domctl handler.
> > + *
> > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> > + * Copyright (c) 2016, Bitdefender S.R.L.
> > + *
> > + */
> > +
> > +#ifndef __ASM_GENERIC_MONITOR_H__
> > +#define __ASM_GENERIC_MONITOR_H__
> > +
> > +#include <xen/errno.h>
> > +
> > +struct domain;
> > +struct xen_domctl_monitor_op;
> > +
> > +static inline
> > +void arch_monitor_allow_userspace(struct domain *d, bool
> > allow_userspace)
> > +{
> > +}
> > +
> > +static inline
> > +int arch_monitor_domctl_op(struct domain *d, struct
> > xen_domctl_monitor_op *mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on GENERIC. */
> > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > +}
> > +
> > +int arch_monitor_domctl_event(struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
> > +
> > +static inline
> > +int arch_monitor_init_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on GENERI=
C. */
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline
> > +void arch_monitor_cleanup_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on GENERIC. */
> > +}
> > +
> > +static inline uint32_t arch_monitor_get_capabilities(struct domain
> > *d)
> > +{
>=20
> See previous comment.
>=20
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +#endif /* __ASM_GENERIC_MONITOR_H__ */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: BSD
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */

~ Oleksii

