Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E046C1EBC86
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6dB-00046s-6o; Tue, 02 Jun 2020 13:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6dA-00046l-Ax
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:07:00 +0000
X-Inumbo-ID: f130c57e-a4d1-11ea-9dbe-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f130c57e-a4d1-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 13:06:59 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s19so9996920edt.12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jq/8DuZTwVrHzI5sV2zSQsVEqQI0253zJLMQa/OcF1I=;
 b=1gLKxNIMLOMirKgcKQe0Os6Rv2ch8K9aJoPz8cqc5f9wTAw0He17nGfidIzY6WUVVc
 RmOWwlKmc8Ffa21fSBSgWDlgLPLBA+ngPGb1msLI0gZiFYOhdtGiPMvrAf0bmOdg10Dh
 6cABkEw412lVUxrdC1lp2WkmmFIH6KmwIEv+5JQtznbYR+38jg3KfSWqGnJcmBlCcnm4
 wTY4PZQha1B18bdabwiehDzXAzbkYAVxe1LvA/gd2Q22NZQaweSInW2yuKKNQC0z2aCV
 jxKpGLs2IdXmt4sDYHvVPuNv6gYWv+Eyn31Ok7Kg+jNeJ9lN9XGfd99SiBrT0KEqOUfY
 tx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jq/8DuZTwVrHzI5sV2zSQsVEqQI0253zJLMQa/OcF1I=;
 b=nlBvDrYECK89BwboQRwELb5xChuE3IxijHT30x8cI4OMhhpx25Gg9VVk5IVAiN+8dN
 QEz89vnepwyT+GKzUD8VWQkKaErJ81sdv7lypsoRpz17+YSrQLyKZU9GAdVsNOYy3U8E
 8nDyLGiGTgf5b5sJvxruAud+OPEc4tuUzT+IRCmh5XVNuG7B0MkWyMXKI7cfas1hRCzZ
 gZVyNiuuOxR5wRE+ulh5jjNw16Fjv8o6NAYHcoaqLXvIhlpxhxYiXmjCSVZGdFoPyxzb
 vkXSHkoo6/zgRvZ7i1pHs/+HPxqKHwztWrjZ0WNHw5avlA2Jztjq29qsyy1uRWa6I1lu
 hBmw==
X-Gm-Message-State: AOAM531lf+edeZSm6T32TR1iSuTEEOhJZ1/mATif5p+1EbEKdBViVbMz
 Ce/YTUct38/YlmU0LtxxHCWMIyjQc5I=
X-Google-Smtp-Source: ABdhPJxFd8GpfDtFM+Hr+tYNOdGH+dC2TicLFi4931qEws0ZQKVyHFr4BsrIrTT9XmYoHW3Bbt6TpA==
X-Received: by 2002:a50:a981:: with SMTP id n1mr25239615edc.377.1591103218309; 
 Tue, 02 Jun 2020 06:06:58 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id i15sm1550976edy.80.2020.06.02.06.06.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 06:06:57 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id l26so2854965wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:06:57 -0700 (PDT)
X-Received: by 2002:a1c:1b13:: with SMTP id b19mr4005212wmb.84.1591103217442; 
 Tue, 02 Jun 2020 06:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <682dde916f982e2889b2be2263418e9506a82c1e.1590028160.git.tamas@tklengyel.com>
 <20200602125433.GY1195@Air-de-Roger>
In-Reply-To: <20200602125433.GY1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 07:06:21 -0600
X-Gmail-Original-Message-ID: <CABfawhk0kySfAKTGzXPo1OZWUn4ZoRSwSfBLR5DK_hwCAm=snA@mail.gmail.com>
Message-ID: <CABfawhk0kySfAKTGzXPo1OZWUn4ZoRSwSfBLR5DK_hwCAm=snA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 3/3] xen/vm_event: Add safe to disable vm_event
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 6:54 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, May 20, 2020 at 08:31:54PM -0600, Tamas K Lengyel wrote:
> > Instead of having to repeatedly try to disable vm_events,
>
> Why not use a hypercall continuation instead so that this is all
> hidden from the caller?
>
> I take that the current interface requires the user to repeatedly
> issue hypercalls in order to disable vm_events until one of those
> succeeds?

No, it succeeds right away. And then the guest crashes in unique and
unpredictable ways.

>
> > request a specific
> > vm_event to be sent when the domain is safe to continue with shutting d=
own
> > the vm_event interface.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  xen/arch/x86/hvm/hvm.c            | 38 ++++++++++++++++++++++++++-----
> >  xen/arch/x86/hvm/monitor.c        | 14 ++++++++++++
> >  xen/arch/x86/monitor.c            | 13 +++++++++++
> >  xen/include/asm-x86/domain.h      |  1 +
> >  xen/include/asm-x86/hvm/monitor.h |  1 +
> >  xen/include/public/domctl.h       |  2 ++
> >  xen/include/public/vm_event.h     |  8 +++++++
> >  7 files changed, 71 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index e6780c685b..fc7e1e2b22 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
> >          v->arch.hvm.inject_event.vector =3D HVM_EVENT_VECTOR_UNSET;
> >      }
> >
> > -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_=
enabled )
> > +    if ( unlikely(v->arch.vm_event) )
> >      {
> > -        struct x86_event info;
> > +        struct domain *d =3D v->domain;
> > +
> > +        if ( v->arch.monitor.next_interrupt_enabled )
> > +        {
> > +            struct x86_event info;
> > +
> > +            if ( hvm_get_pending_event(v, &info) )
> > +            {
> > +                hvm_monitor_interrupt(info.vector, info.type, info.err=
or_code,
> > +                                      info.cr2);
> > +                v->arch.monitor.next_interrupt_enabled =3D false;
> > +            }
> > +        }
> >
> > -        if ( hvm_get_pending_event(v, &info) )
> > +        if ( d->arch.monitor.safe_to_disable )
> >          {
> > -            hvm_monitor_interrupt(info.vector, info.type, info.error_c=
ode,
> > -                                  info.cr2);
> > -            v->arch.monitor.next_interrupt_enabled =3D false;
> > +            const struct vcpu *check_vcpu;
> > +            bool pending_op =3D false;
> > +
> > +            for_each_vcpu ( d, check_vcpu )
> > +            {
> > +                if ( vm_event_check_pending_op(check_vcpu) )
>
> Don't you need some kind of lock here, since you are poking at another
> vCPU which could be modifying any of those bits?
>
> > +                {
> > +                    pending_op =3D true;
> > +                    break;
> > +                }
> > +            }
> > +
> > +            if ( !pending_op )
> > +            {
> > +                hvm_monitor_safe_to_disable();
> > +                d->arch.monitor.safe_to_disable =3D false;
> > +            }
> >          }
> >      }
> >  }
> > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> > index f5d89e71d1..75fd1a4b68 100644
> > --- a/xen/arch/x86/hvm/monitor.c
> > +++ b/xen/arch/x86/hvm/monitor.c
> > @@ -300,6 +300,20 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_=
t gfn, uint32_t pfec,
> >      return monitor_traps(curr, true, &req) >=3D 0;
> >  }
> >
> > +void hvm_monitor_safe_to_disable(void)
> > +{
> > +    struct vcpu *curr =3D current;
> > +    struct arch_domain *ad =3D &curr->domain->arch;
>
> const
>
> > +    vm_event_request_t req =3D {};
> > +
> > +    if ( !ad->monitor.safe_to_disable )
> > +        return;
>
> Should this rather be an ASSERT? I don't think you are supposed to
> call hvm_monitor_safe_to_disable when the bit is not set?
>
> > +
> > +    req.reason =3D VM_EVENT_REASON_SAFE_TO_DISABLE;
>
> I think you cat set the field at definition time.
>
> > +
> > +    monitor_traps(curr, 0, &req);
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> > index 1517a97f50..86e0ba2fbc 100644
> > --- a/xen/arch/x86/monitor.c
> > +++ b/xen/arch/x86/monitor.c
> > @@ -339,6 +339,19 @@ int arch_monitor_domctl_event(struct domain *d,
> >          break;
> >      }
> >
> > +    case XEN_DOMCTL_MONITOR_EVENT_SAFE_TO_DISABLE:
> > +    {
> > +        bool old_status =3D ad->monitor.safe_to_disable;
> > +
> > +        if ( unlikely(old_status =3D=3D requested_status) )
> > +            return -EEXIST;
> > +
> > +        domain_pause(d);
> > +        ad->monitor.safe_to_disable =3D requested_status;
>
> Maybe I'm missing something, but I don't see any check that others
> events are disabled before safe_to_disable is set?
>
> In the same way, you should prevent setting any events when
> safe_to_disable is set IMO, likely returning -EBUSY in both cases.
>
> Thanks, Roger.

Thanks for the feedback again. I won't have the bandwidth to address
these so I'm dropping this patch. If Bitdefender is so inclined to
pick-up later they are welcome to do so. This is only needed if their
buggy feature is enabled.

Tamas

