Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1E1ECFBA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 14:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgSTF-0006nj-O6; Wed, 03 Jun 2020 12:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecxI=7Q=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jgSTE-0006nV-AW
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 12:26:12 +0000
X-Inumbo-ID: 685293b2-a595-11ea-9dbe-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 685293b2-a595-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 12:26:11 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id gl26so1930188ejb.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJ5W6AxroBMLD68IaEhFmZy4K36m34K2nIdGZSm2vB8=;
 b=oxh35808L0reWI07HJzgVLpcJ2ClaFwGumrNPds6D3/P2yHHugicz71Ju3s0/OEDod
 v/k3XjIveBc/xe/GCgeBQvY32IKmvCNHFBkWWGCI7IbmMdTy5lSyQH1VoruUMp2Q6rf3
 W8UjkKw/NXucIANHacVhJY3DOfH9RHO8CgYhfgXlIGAYYPNQxiOFESIaaOMT+iAu2DEx
 X+k5jT26VeHS6S5dPM6xl/2lHCTUXr9AkQVbKIXLgL02G0sB1I5nhXSHw5yp6oadNKVm
 cISRiPm/cYREtudy3LKo4yPM0I/jY+TxLENioNXx7gy6M3O50PNefpNU0scUOzGAorIm
 uYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJ5W6AxroBMLD68IaEhFmZy4K36m34K2nIdGZSm2vB8=;
 b=PG3dlm39igNYaXOYsfZWJpgo2H8vBWJF6PoP/uvBO0KBy7Gzf9gAVI4aZUNI9GMXe8
 DYNFY/spalYn/aUNMvoHfVYBSkCiizbT0GkZTmq8LPyEwduqFbuYtpINybawH2eq/ftq
 dbLcvTJhE4iQq8IhCSSPCX30h/Z6qYfPFA1RDiwgtdRGkko+s/WgNYgwPqS54QuX8qrZ
 IobC+KNaUSDdDCKJ5XrvZqemkhtcndcg0BOVOAl4renvVP4S0TOtwXnDh3UvTKVw/yxb
 GsnUiNmBjnyk1BbrvzLmNBpKndbBhsIauumSp41HLS1iOVMs0egzOI988Mp1MEKrmNX3
 u8Vg==
X-Gm-Message-State: AOAM531laIkQ6KmOvst/Y7sHmVAOGDACNuzLxfEmwXSxzJhOOWDVdSCD
 qQrg0jeW4OeHFtzdrXe251UoqmNFFyg=
X-Google-Smtp-Source: ABdhPJwN7ROwWqEZTJ+pFtur98VTAZ6ShX82sB8trP8oOuiiTsFKO2R0gA5l1P8EBBJj1tuoeP76VA==
X-Received: by 2002:a17:906:746:: with SMTP id
 z6mr13108987ejb.12.1591187169208; 
 Wed, 03 Jun 2020 05:26:09 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id a7sm591133edx.3.2020.06.03.05.26.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 05:26:08 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id u13so1738340wml.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 05:26:07 -0700 (PDT)
X-Received: by 2002:a05:600c:23ce:: with SMTP id
 p14mr8553265wmb.77.1591187167541; 
 Wed, 03 Jun 2020 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200602134909.66581-1-tamas@tklengyel.com>
 <20200603082824.GC1195@Air-de-Roger>
In-Reply-To: <20200603082824.GC1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 3 Jun 2020 06:25:31 -0600
X-Gmail-Original-Message-ID: <CABfawhnfwMrEYhhsQik_SjVZ2qqL2L2UaSQ6zdR5uBEWvvN8=g@mail.gmail.com>
Message-ID: <CABfawhnfwMrEYhhsQik_SjVZ2qqL2L2UaSQ6zdR5uBEWvvN8=g@mail.gmail.com>
Subject: Re: [PATCH v3 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
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

On Wed, Jun 3, 2020 at 2:28 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Tue, Jun 02, 2020 at 07:49:09AM -0600, Tamas K Lengyel wrote:
> > For the last couple years we have received numerous reports from users =
of
> > monitor vm_events of spurious guest crashes when using events. In parti=
cular,
> > it has observed that the problem occurs when vm_events are being disabl=
ed. The
> > nature of the guest crash varied widely and has only occured occasional=
ly. This
> > made debugging the issue particularly hard. We had discussions about th=
is issue
> > even here on the xen-devel mailinglist with no luck figuring it out.
> >
> > The bug has now been identified as a race-condition between register ev=
ent
> > handling and disabling the monitor vm_event interface.
> >
> > Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny registe=
r writes
> > if refused by  vm_event reply" is the patch that introduced the error. =
In this
>
> FWIW, we use the 'Fixes:' tag in order to make it easier for
> maintainers of stable trees to know which bugfixes to pick. This
> should have:
>
> Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_eve=
nt reply')
>
> Before the SoB.
>
> > patch the default behavior regarding emulation of register write events=
 is
> > changed so that they get postponed until the corresponding vm_event han=
dler
> > decides whether to allow such write to take place. Unfortunately this c=
an only
> > be implemented by performing the deny/allow step when the vCPU gets sch=
eduled.
> > Due to that postponed emulation of the event if the user decides to pau=
se the
> > VM in the vm_event handler and then disable events, the entire emulatio=
n step
> > is skipped the next time the vCPU is resumed. Even if the user doesn't =
pause
> > during the vm_event handling but exits immediately and disables vm_even=
t, the
> > situation becomes racey as disabling vm_event may succeed before the gu=
est's
> > vCPUs get scheduled with the pending emulation task. This has been part=
icularly
> > the case with VMS that have several vCPUs as after the VM is unpaused i=
t may
> > actually take a long time before all vCPUs get scheduled.
> >
> > In this patch we are reverting the default behavior to always perform e=
mulation
> > of register write events when the event occurs. To postpone them can be=
 turned
> > on as an option. In that case the user of the interface still has to ta=
ke care
> > of only disabling the interface when its safe as it remains buggy.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>
> Thanks for taking care of this!
>
> > ---
> >  xen/arch/x86/hvm/hvm.c            | 14 ++++++++------
> >  xen/arch/x86/hvm/monitor.c        | 13 ++++++++-----
> >  xen/arch/x86/monitor.c            | 10 +++++++++-
> >  xen/include/asm-x86/domain.h      |  1 +
> >  xen/include/asm-x86/hvm/monitor.h |  7 +++----
> >  xen/include/public/domctl.h       |  1 +
> >  6 files changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 74c9f84462..5bb47583b3 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -3601,13 +3601,15 @@ int hvm_msr_write_intercept(unsigned int msr, u=
int64_t msr_content,
> >
> >          ASSERT(v->arch.vm_event);
> >
> > -        /* The actual write will occur in hvm_do_resume() (if permitte=
d). */
> > -        v->arch.vm_event->write_data.do_write.msr =3D 1;
> > -        v->arch.vm_event->write_data.msr =3D msr;
> > -        v->arch.vm_event->write_data.value =3D msr_content;
> > +        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
> > +        {
> > +            /* The actual write will occur in hvm_do_resume(), if perm=
itted. */
> > +            v->arch.vm_event->write_data.do_write.msr =3D 1;
> > +            v->arch.vm_event->write_data.msr =3D msr;
> > +            v->arch.vm_event->write_data.value =3D msr_content;
> >
> > -        hvm_monitor_msr(msr, msr_content, msr_old_content);
> > -        return X86EMUL_OKAY;
> > +            return X86EMUL_OKAY;
> > +        }
> >      }
> >
> >      if ( (ret =3D guest_wrmsr(v, msr, msr_content)) !=3D X86EMUL_UNHAN=
DLEABLE )
> > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> > index 8aa14137e2..36894b33a4 100644
> > --- a/xen/arch/x86/hvm/monitor.c
> > +++ b/xen/arch/x86/hvm/monitor.c
> > @@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigned lo=
ng value, unsigned long old)
> >              .u.write_ctrlreg.old_value =3D old
> >          };
> >
> > -        if ( monitor_traps(curr, sync, &req) >=3D 0 )
> > -            return 1;
> > +        return monitor_traps(curr, sync, &req) >=3D 0 &&
> > +            curr->domain->arch.monitor.control_register_values;
>
> Nit (it can be fixed while committing IMO): curr should be aligned to
> monitor.

This is the established style already in-place, see
http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/arch/x86/hvm/mo=
nitor.c;h=3D8aa14137e25a47d3826843441e244decf81dc855;hb=3Drefs/heads/stagin=
g#l76:

  76     return curr->domain->arch.monitor.emul_unimplemented_enabled &&
  77         monitor_traps(curr, true, &req) =3D=3D 1;

I don't really care either way but at least we should be consistent.

>
> >      }
> >
> > -    return 0;
> > +    return false;
> >  }
> >
> >  bool hvm_monitor_emul_unimplemented(void)
> > @@ -77,7 +77,7 @@ bool hvm_monitor_emul_unimplemented(void)
> >          monitor_traps(curr, true, &req) =3D=3D 1;
> >  }
> >
> > -void hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t ol=
d_value)
> > +bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t ol=
d_value)
> >  {
> >      struct vcpu *curr =3D current;
> >
> > @@ -92,8 +92,11 @@ void hvm_monitor_msr(unsigned int msr, uint64_t new_=
value, uint64_t old_value)
> >              .u.mov_to_msr.old_value =3D old_value
> >          };
> >
> > -        monitor_traps(curr, 1, &req);
> > +        return monitor_traps(curr, 1, &req) >=3D 0 &&
> > +            curr->domain->arch.monitor.control_register_values;
>
> Same here.
>
> >      }
> > +
> > +    return false;
> >  }
> >
> >  void hvm_monitor_descriptor_access(uint64_t exit_info,
> > diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> > index bbcb7536c7..1517a97f50 100644
> > --- a/xen/arch/x86/monitor.c
> > +++ b/xen/arch/x86/monitor.c
> > @@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
> >                                struct xen_domctl_monitor_op *mop)
> >  {
> >      struct arch_domain *ad =3D &d->arch;
> > -    bool requested_status =3D (XEN_DOMCTL_MONITOR_OP_ENABLE =3D=3D mop=
->op);
> > +    bool requested_status;
> > +
> > +    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS =3D=3D mop->op )
> > +    {
> > +        ad->monitor.control_register_values =3D true;
> > +        return 0;
>
> I think this would be better implemented in arch_monitor_domctl_op
> which already handles other XEN_DOMCTL_MONITOR_OP_* options, and also
> skips the arch_monitor_domctl_event call?

Hm, yea, that would be better placement for it, you are right.

>
> > +    }
> > +
> > +    requested_status =3D (XEN_DOMCTL_MONITOR_OP_ENABLE =3D=3D mop->op)=
;
> >
> >      switch ( mop->event )
> >      {
> > diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.=
h
> > index e8cee3d5e5..6fd94c2e14 100644
> > --- a/xen/include/asm-x86/domain.h
> > +++ b/xen/include/asm-x86/domain.h
> > @@ -418,6 +418,7 @@ struct arch_domain
> >           * This is used to filter out pagefaults.
> >           */
> >          unsigned int inguest_pagefault_disabled                       =
     : 1;
> > +        unsigned int control_register_values                          =
     : 1;
> >          struct monitor_msr_bitmap *msr_bitmap;
> >          uint64_t write_ctrlreg_mask[4];
> >      } monitor;
> > diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/include/asm-x86/hv=
m/monitor.h
> > index 66de24cb75..a75cd8545c 100644
> > --- a/xen/include/asm-x86/hvm/monitor.h
> > +++ b/xen/include/asm-x86/hvm/monitor.h
> > @@ -29,15 +29,14 @@ enum hvm_monitor_debug_type
> >  };
> >
> >  /*
> > - * Called for current VCPU on crX/MSR changes by guest.
> > - * The event might not fire if the client has subscribed to it in onch=
angeonly
> > - * mode, hence the bool return type for control register write events.
> > + * Called for current VCPU on crX/MSR changes by guest. Bool return si=
gnals
> > + * whether emulation should be postponed.
> >   */
> >  bool hvm_monitor_cr(unsigned int index, unsigned long value,
> >                      unsigned long old);
> >  #define hvm_monitor_crX(cr, new, old) \
> >                          hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
> > -void hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_va=
lue);
> > +bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_va=
lue);
> >  void hvm_monitor_descriptor_access(uint64_t exit_info,
> >                                     uint64_t vmx_exit_qualification,
> >                                     uint8_t descriptor, bool is_write);
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 1ad34c35eb..cbcd25f12c 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1025,6 +1025,7 @@ struct xen_domctl_psr_cmt_op {
> >  #define XEN_DOMCTL_MONITOR_OP_DISABLE           1
> >  #define XEN_DOMCTL_MONITOR_OP_GET_CAPABILITIES  2
> >  #define XEN_DOMCTL_MONITOR_OP_EMULATE_EACH_REP  3
> > +#define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4
>
> Could you please add a note that this is broken?

Sure.

Thanks,
Tamas

