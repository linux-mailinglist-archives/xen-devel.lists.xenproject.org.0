Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6B1EBBF4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:44:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6H9-0001GG-9Z; Tue, 02 Jun 2020 12:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6H7-0001GB-NA
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:44:13 +0000
X-Inumbo-ID: c29bffec-a4ce-11ea-81bc-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c29bffec-a4ce-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 12:44:12 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id o15so12568477ejm.12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KzNwH7AZbuX1qGWWD4DT1VKxH2TD04CejRr/he0oH7s=;
 b=YkSlxQGMj3cUwQf3aJMUzrhVQwpGAN1TT3slWdgzZMRfr1yb3I5349YL3WoypnFFxT
 q5KRu4z0W1MBs3qFHHMIdXyfMZdO9npQx80dDmac13Z5kwBS6XPdKmdtftTKU1Y6I1zx
 zeHw+hbJgB4ntU0w6yr4xsIEejXxVZ3OhtT+ZcVXUwpEZzD1qlY+CJfmxHTWCHdNR29K
 l4g4FtJyahB0OBE78GZH+lg0PWNXu9ZwglfGB6J7xDNSnbHKtm1yzDwKVFa96CuBeBVi
 UhDl+3puZWoDnjO97G6V9sDM7m4/I085fEp/OHtLoMvVWlQ1OBTDrwM5oEaLLDQuyKdq
 7jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KzNwH7AZbuX1qGWWD4DT1VKxH2TD04CejRr/he0oH7s=;
 b=cM7gKmaCy8rEb7PVO/lkXaYwGjzfvEe02BGbLL6W1RTeUly9+zhEU9GP6/VZpAspzf
 HC+To2BubdStPZL0+AfHraahLzkHM04OGqFJXwcpILYk78BpJVeEFOS8gx4KdoMIUmTF
 eya8mkyhU1QLNpyofiB5ldkepWf+L9UGEMh0eYZZJGfnsnGuyoYyIXcIMGPJaM16bmXy
 SHyhblzMGRFRjxLuM/p2Fvz+Yv8nJkPBg3v7VtFD5f/bLsBpaddv7wtzp4fMNavcbinZ
 YDMw/4AhoH/kkavGSMzPCtGJ651v/XWD1AiRr13L+DJq+iAzxdX8n9cCG9WAnzfRS2WI
 vd+g==
X-Gm-Message-State: AOAM5327apjFHHgIzy7P77Dm0jV/t7y44ux5mMQG33ZtN+S6X2CJXsa6
 DjTg0DCEpjoUaEYP3+ZVcYl2jLol6EM=
X-Google-Smtp-Source: ABdhPJxiZIkrYCtqh+pxOjN2N9+VT+HrohbGn2229AXN0Li5CLYe9p16qyZAW49p9f2K/pxZ3j+ltg==
X-Received: by 2002:a17:906:e0c5:: with SMTP id
 gl5mr22866347ejb.524.1591101851720; 
 Tue, 02 Jun 2020 05:44:11 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id gj10sm1586904ejb.61.2020.06.02.05.44.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 05:44:11 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id r15so2966926wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:44:11 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr4213661wme.154.1591101850829; 
 Tue, 02 Jun 2020 05:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <52492e7b44f311b09e9a433f2e5a2ba607a85c78.1590028160.git.tamas@tklengyel.com>
 <20200602114722.GX1195@Air-de-Roger>
In-Reply-To: <20200602114722.GX1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 06:43:34 -0600
X-Gmail-Original-Message-ID: <CABfawhny=ZgPUKq6oZnpyX7iL+h00H84SJpEDs_UmMAM7Th55A@mail.gmail.com>
Message-ID: <CABfawhny=ZgPUKq6oZnpyX7iL+h00H84SJpEDs_UmMAM7Th55A@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 2/3] xen/vm_event: add
 vm_event_check_pending_op
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 5:47 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, May 20, 2020 at 08:31:53PM -0600, Tamas K Lengyel wrote:
> > Perform sanity checking when shutting vm_event down to determine whethe=
r
> > it is safe to do so. Error out with -EAGAIN in case pending operations
> > have been found for the domain.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  xen/arch/x86/vm_event.c        | 23 +++++++++++++++++++++++
> >  xen/common/vm_event.c          | 17 ++++++++++++++---
> >  xen/include/asm-arm/vm_event.h |  7 +++++++
> >  xen/include/asm-x86/vm_event.h |  2 ++
> >  4 files changed, 46 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> > index 848d69c1b0..a23aadc112 100644
> > --- a/xen/arch/x86/vm_event.c
> > +++ b/xen/arch/x86/vm_event.c
> > @@ -297,6 +297,29 @@ void vm_event_emulate_check(struct vcpu *v, vm_eve=
nt_response_t *rsp)
> >      };
> >  }
> >
> > +bool vm_event_check_pending_op(const struct vcpu *v)
> > +{
> > +    struct monitor_write_data *w =3D &v->arch.vm_event->write_data;
>
> const
>
> > +
> > +    if ( !v->arch.vm_event->sync_event )
> > +        return false;
> > +
> > +    if ( w->do_write.cr0 )
> > +        return true;
> > +    if ( w->do_write.cr3 )
> > +        return true;
> > +    if ( w->do_write.cr4 )
> > +        return true;
> > +    if ( w->do_write.msr )
> > +        return true;
> > +    if ( v->arch.vm_event->set_gprs )
> > +        return true;
> > +    if ( v->arch.vm_event->emulate_flags )
> > +        return true;
>
> Can you please group this into a single if, ie:
>
> if ( w->do_write.cr0 || w->do_write.cr3 || ... )
>     return true;
>
> > +
> > +    return false;
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> > index 127f2d58f1..2df327a42c 100644
> > --- a/xen/common/vm_event.c
> > +++ b/xen/common/vm_event.c
> > @@ -183,6 +183,7 @@ static int vm_event_disable(struct domain *d, struc=
t vm_event_domain **p_ved)
> >      if ( vm_event_check_ring(ved) )
> >      {
> >          struct vcpu *v;
> > +        bool pending_op =3D false;
> >
> >          spin_lock(&ved->lock);
> >
> > @@ -192,9 +193,6 @@ static int vm_event_disable(struct domain *d, struc=
t vm_event_domain **p_ved)
> >              return -EBUSY;
> >          }
> >
> > -        /* Free domU's event channel and leave the other one unbound *=
/
> > -        free_xen_event_channel(d, ved->xen_port);
> > -
> >          /* Unblock all vCPUs */
> >          for_each_vcpu ( d, v )
> >          {
> > @@ -203,8 +201,21 @@ static int vm_event_disable(struct domain *d, stru=
ct vm_event_domain **p_ved)
> >                  vcpu_unpause(v);
> >                  ved->blocked--;
> >              }
> > +
> > +            if ( vm_event_check_pending_op(v) )
> > +                pending_op =3D true;
>
> You could just do:
>
> pending_op |=3D vm_event_check_pending_op(v);
>
> and avoid the initialization of pending_op above. Or alternatively:
>
> if ( !pending_op && vm_event_check_pending_op(v) )
>     pending_op =3D true;
>
> Which avoid repeated calls to vm_event_check_pending_op when at least
> one vCPU is known to be busy.
>
> >          }
> >
> > +        /* vm_event ops are still pending until vCPUs get scheduled */
> > +        if ( pending_op )
> > +        {
> > +            spin_unlock(&ved->lock);
> > +            return -EAGAIN;
>
> What happens when this gets called from vm_event_cleanup?
>
> AFAICT the result there is ignored, and could leak the vm_event
> allocated memory?

Thanks for the feedback. I'm going to drop this patch at let
Bitdefender pick it up if they feel like fixing their buggy feature.
As things stand for my use-case I only need patch 1 from this series.

Tamas

