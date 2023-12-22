Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EC81CA78
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659335.1028883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfAv-0005vD-E2; Fri, 22 Dec 2023 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659335.1028883; Fri, 22 Dec 2023 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfAv-0005st-9p; Fri, 22 Dec 2023 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 659335;
 Fri, 22 Dec 2023 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGfAu-0005sn-BA
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:02:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67390324-a0ca-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:02:47 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e62c1245eso1667143e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:02:47 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z27-20020a195e5b000000b0050bf774b7c2sm543396lfi.274.2023.12.22.05.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:02:45 -0800 (PST)
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
X-Inumbo-ID: 67390324-a0ca-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703250167; x=1703854967; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7416tEImjH6lSBKQ1ZUeENcGTgYyQ3DlEVj4N4VWgfg=;
        b=Jm/4Xf1AGbIaN0pat0eWkE0LycuGb6qVfVR3c5t1d2i92kRW9wnervRt7L72RmmVjV
         noZlK3b4knRdleuNwj9Mh1K4PIovs03foLQuwhnL9CRpo1/z3DpQeGgFYtqWawMCJvMz
         NVjZp5UvDo13r7UIBjtpFU3DKDJlHXtkKDnq9l8JkhboQHsSyOBSiNecDbzZk9zusFI/
         cmqoFT52eqeT2eHwGAr/YhmYQLnJA+225zVUDSBWegD3NGw8HCRoi4WJAENO6U68lFWl
         0bzLcjyyFscb35VEyBJs9yEqX3owijHeeZgrnIPtSkMM01kgm82eXLVSpMuxb+rQUJy9
         dh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250167; x=1703854967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7416tEImjH6lSBKQ1ZUeENcGTgYyQ3DlEVj4N4VWgfg=;
        b=EXHZacoYOlQTKF7QUFYOVg+HBHO3nHWZpMOuP6ugh3ru4xxV9bnxY42y/4ZyKSvvO0
         BZilPGsztyi0am9szeIg5ycnOvB2oyVE7fSxPPSix/ljiDqmAdFzmzURgmUIjV7qr5xj
         Ph8I/iKByYfovTaaeYAmMfAKLPbWbwZpEvetBYl93PrYEFZzmM/+V2DGt1e/7afUu5Ls
         KuAALtfeJcBOEMvMnjE281jd5A1m0Pvt666OFYoINCq85HO6mwI3RR1wPwh0SkJR0xc/
         0upG/7D4nf+1nmqR5yQcFIgvr7N0kbnGSKVK7iCjWShrwJWYiibwsF91Q8kk1IlGX3ep
         DL6w==
X-Gm-Message-State: AOJu0YwqE15ETlm3muXyJZ3ErpsrZtJX1WVdC4BXLsn5xYOXHiiVHEhP
	tL0zuSFPGMJy7HQOFqnANSg=
X-Google-Smtp-Source: AGHT+IFZr/CD2jqMlBHntS0c0VCd2zFSdpYY2G1+tyQhOWX/CMuAutH1PmX2kzhNRc3j8OWfyRuPEA==
X-Received: by 2002:ac2:4c11:0:b0:50e:6ec3:3de9 with SMTP id t17-20020ac24c11000000b0050e6ec33de9mr43209lfq.54.1703250166380;
        Fri, 22 Dec 2023 05:02:46 -0800 (PST)
Message-ID: <09579f818b778d3f7db3f2dd33e39b9d712e86c3.camel@gmail.com>
Subject: Re: [PATCH v6 4/9] xen/asm-generic: introduce stub header monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,  Jan Beulich <jbeulich@suse.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,  Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Fri, 22 Dec 2023 15:02:44 +0200
In-Reply-To: <a4dccfb1-6bbf-418d-b8c5-1e99c75d1b64@citrix.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
	 <a4dccfb1-6bbf-418d-b8c5-1e99c75d1b64@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-12-20 at 16:33 +0000, Andrew Cooper wrote:
> On 20/12/2023 2:08 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
> > generic/monitor.h
> > new file mode 100644
> > index 0000000000..74e4870cd7
> > --- /dev/null
> > +++ b/xen/include/asm-generic/monitor.h
> > @@ -0,0 +1,57 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * include/asm-generic/monitor.h
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
>=20
> Turn this into a static inline like the others, and you can delete:
>=20
> arch/ppc/stubs.c:100
>=20
> int arch_monitor_domctl_event(struct domain *d,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop)
> {
> =C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> }
>=20
> because new architectures shouldn't have to stub one random piece of
> a
> subsystem when using the generic "nothing special" header.
>=20
> Given the filtering for arch_monitor_domctl_op(), this one probably
> wants to be ASSERT_UNREACHABLE(); return 0.
What you wrote makes sense. However, doing it that way may limit the
reuse of other parts of the asm-generic header. It would require
introducing an architecture-specific monitor.h header, which would be
nearly identical.

For instance, at present, the only difference between Arm, PPC, and
RISC-V is arch_monitor_domctl_event(). If this function is implemented
with BUG_ON("unimplemented"), reusing the asm-generic monitor.h header
for Arm (as it is partly done now) becomes challenging.

To address this, I propose wrapping arch_monitor_domctl_event() in
#ifdef:

#ifndef HAS_ARCH_MONITOR_DOMCTL_EVENT
int arch_monitor_domctl_event(struct domain *d,
                              struct xen_domctl_monitor_op *mop)
{
    BUG_ON("unimplemented");
}
#endif

In the architecture-specific monitor.h, you would define
HAS_ARCH_MONITOR_DOMCTL_EVENT and provide the architecture-specific
implementation of the function. For example, in the case of Arm:

#ifndef __ASM_ARM_MONITOR_H__
#define __ASM_ARM_MONITOR_H__

#include <xen/sched.h>
#include <public/domctl.h>

#define HAS_ARCH_MONITOR_DOMCTL_EVENT

#include <asm-generic/monitor.h>

static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
{
    uint32_t capabilities =3D 0;

    capabilities =3D (1U << XEN_DOMCTL_MONITOR_EVENT_GUEST_REQUEST |
                    1U << XEN_DOMCTL_MONITOR_EVENT_PRIVILEGED_CALL);

    return capabilities;
}

int monitor_smc(void);

#endif /* __ASM_ARM_MONITOR_H__ */

This approach maintains a clean and modular structure, allowing for
architecture-specific variations while reusing the majority of the code
from the generic header.

Does it make sense?

~ Oleksii

