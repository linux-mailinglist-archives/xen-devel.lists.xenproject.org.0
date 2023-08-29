Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69278C402
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592138.924771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxc5-0003To-9w; Tue, 29 Aug 2023 12:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592138.924771; Tue, 29 Aug 2023 12:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxc5-0003R0-5p; Tue, 29 Aug 2023 12:14:29 +0000
Received: by outflank-mailman (input) for mailman id 592138;
 Tue, 29 Aug 2023 12:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8Qf=EO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaxc4-0003AX-25
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:14:28 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9850e63a-4665-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 14:14:25 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso65205211fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 05:14:26 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a2e3001000000b002b6c61bac2esm2128102ljw.92.2023.08.29.05.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:14:25 -0700 (PDT)
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
X-Inumbo-ID: 9850e63a-4665-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693311266; x=1693916066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mnWajmEyHsiAnjBTMsrRPcgZOzzHIqHls6BKWXhq8zk=;
        b=Dw1SLfA0J1O+vld319EBUCaEdhIrD3/1iPKWVkbKgUUhNXWrGsZjXz2v4381721UQX
         GGGke6vI7omyXM3L9kci3C3F1oGX0Nwme3iblVDu+oQAfM+VLbtV2E79RFr1RKXu024V
         U2b60xTMGrHEva3GPUZ4+qXASZmdCpRKYw4v/a9dfsndSFYoktJDd3QuB10HCJ1EG/mb
         GfaWC15DJEXXHjdgf6igZVnFzugVW6v1/eXKrp1VobDIPHWqG095hh2JgJJtR/h4cbRR
         BHWuIgaRQspWogzIjFfvTKLDSCSg8JzHr8oCVPx3doASvOOHWhM2S0qqIZknghrUDLm9
         FAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693311266; x=1693916066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnWajmEyHsiAnjBTMsrRPcgZOzzHIqHls6BKWXhq8zk=;
        b=ZVX7gxqbMxpEsfOSm/N/2Uq6Slyt2jmpkS3bEkyv/xZtLYcYU9zzpcVLtp8o9qaNQd
         3dnsIbl8O+L8na/Ns/GjPKMB/sw6RGzCsVB8AbWZsu5A2b6K4+jaoNpHpH+fty5bqhry
         uD87phKLwsSL1R5yGvnRcLrfRAEyYeH/kD6WNq9yYeKrI0wOYVPxFWAdDYphiqOzJFE4
         /ChZVyjAPNF9Sz/wLL7eTqJqmKlkivul4We66lzTe/P6+wlzU71evQVduSdc0VP2ud4C
         wKhjqAt0yDxKlNkbqkQUulBYpU3CMKbR4v2PGpxZTtf4QKl7MiX8Vn5HHYwXNJE94peU
         U/+A==
X-Gm-Message-State: AOJu0Yz9WzVct2ZIoHGFS/0NXICSdS4iAxX8+M7EBQyf6Opuor+wNGig
	svaDxJI27krsD5sQ8IKFpZU=
X-Google-Smtp-Source: AGHT+IF6HpLkTOkMjkt+I8GbaOu+i4p2cfAjmtmV9sJDqFpPhqGGERXsE/ZFdjnQku/dlY2pSlKpdA==
X-Received: by 2002:a2e:4602:0:b0:2bd:180d:67b7 with SMTP id t2-20020a2e4602000000b002bd180d67b7mr1718440lja.40.1693311265650;
        Tue, 29 Aug 2023 05:14:25 -0700 (PDT)
Message-ID: <aa3bac341ad5b1c918cf95c238f60e6f9ea87d18.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] xen: move arm/include/asm/vm_event.h to stubs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 29 Aug 2023 15:14:24 +0300
In-Reply-To: <0b17a63d-ba1f-e8d0-88e3-6824ac17a26f@suse.com>
References: <cover.1693235841.git.oleksii.kurochko@gmail.com>
	 <c61f930fed46e2312f460333401488af4b0adfc4.1693235841.git.oleksii.kurochko@gmail.com>
	 <0b17a63d-ba1f-e8d0-88e3-6824ac17a26f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-08-28 at 18:05 +0200, Jan Beulich wrote:
> On 28.08.2023 17:57, Oleksii Kurochko wrote:
> > asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> > stubs dir.
> >=20
> > Original asm/vm_event.h from ARM was updated:
> > =C2=A0* use SPDX-License-Identifier.
> > =C2=A0* update comment messages of stubs.
> > =C2=A0* update #ifdef
>=20
> When generalizing such a header, more tidying wants doing imo:
>=20
> > --- /dev/null
> > +++ b/xen/include/stubs/asm/vm_event.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier:=C2=A0 GPL-2.0 */
> > +/*
> > + * vm_event.h: stubs for architecture specific vm_event handling
> > routines
> > + *
> > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> > + */
> > +
> > +#ifndef __ASM_STUB_VM_EVENT_H__
> > +#define __ASM_STUB_VM_EVENT_H__
> > +
> > +#include <xen/sched.h>
> > +#include <public/domctl.h>
>=20
> I can't spot why this is being included here. All that's needed ought
> to
> be public/vm_event.h, and even that only if we were to continue to
You are right. I'll change public/domctl.h to public/vm_event.h.

> use
> vm_event_response_t in the function definitions (which isn't really
> necessary).
>=20
> > +static inline int vm_event_init_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Nothing to do. */
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline void vm_event_cleanup_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 memset(&d->monitor, 0, sizeof(d->monitor));
>=20
> This looks to be the sole reason that xen/sched.h is needed. I
> question
> the existence of that field in the first place when this stub is
> being
> used. But I guess cleaning that up as well might be going too far.
What do you mean by the existence of the field? Looking at declaration
of struct domain, monitor field always exists.

Could we leave initialisation of d->monitor for now?

~ Oleksii


