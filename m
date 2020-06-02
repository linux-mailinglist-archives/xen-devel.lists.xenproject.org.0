Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B641EBBE5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:41:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6Dv-00011I-IU; Tue, 02 Jun 2020 12:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6Dt-00011D-HY
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:40:53 +0000
X-Inumbo-ID: 4b3f562e-a4ce-11ea-9947-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b3f562e-a4ce-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 12:40:52 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id l27so12633483ejc.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/BNPzpCU+JYVl4JM0G4t79R1G/0WgOO94YUq/xwsvh0=;
 b=fPnUp5DNceOrBqVXbvFIrQlzoS9c09Xtj9tSLPsRIhW2E/5cz0qeFXna7Fh8PxxuPq
 Vy3/pQFMF818322BU0BwEkfSwXdJ6nBMpuh4zOpQtKimsE1fd5f2s9u9pePOFG5pZC5a
 xZe9Y3UjsFejnfFjRvqpyQL7ggKUgav1tFL/TK4rEVDzGDod+Wadxa/wHfwysxQQvhMc
 O3I4npJ/QRn3zow4xzEx9oBTgR1aw+1GpDQDeSJnY81//mizdQ5aTF6UeEtIy5WHOSk1
 YT3xwuBBjOv+6b3EUYjy9ACDzMVP05gjLxr1GohYPwvaJ//KAMyIAYiNhnAPnJlGC3x8
 GVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/BNPzpCU+JYVl4JM0G4t79R1G/0WgOO94YUq/xwsvh0=;
 b=ih3UdfDKWiwyl5HIk+Od+yX1V3/zYe0RaaI/VBUBq/wD5sdHBNX5kSi9xPrhVOnGXJ
 fdcO8AkLhFF045dfRs6PDn59phiH138KbEk7JQ33hqy0eP/PDkWH8jGPzbZoXHEJvDLj
 vGKCMU7ItXtC0sPlkqDR+kVqdELNu2ZeV9Dw2S2wsjK3SU6AphQJ/a1SPzScRoxqX5Ob
 JmCry8Zhs/werO/BTPSJT/vGWRfeAow3B9+i21gsGli7XotVUYOvJQwgaB260oShJhgu
 FzhLHyadfAJhClpgI4YDzo9jGunBPmnA3SzCTkFqjWchy5DUzYyYl2UAWUr2SJBi1NKG
 8CHQ==
X-Gm-Message-State: AOAM532PDCu2cjmo84OOsdlOV67HSPUXqTQONCbC33yClAcYHgQjLxK5
 88K0Kt4VZw9tG0tWtVSGFYSZJuk/k/4=
X-Google-Smtp-Source: ABdhPJy38H8K/vqWFNCOXGODY9EbIbiw7NLzLx4mb2oEwk9p9m5NR9pYMS0Zg/tRSJ8wYYdQ3p6mwA==
X-Received: by 2002:a17:906:af84:: with SMTP id
 mj4mr17496679ejb.473.1591101650611; 
 Tue, 02 Jun 2020 05:40:50 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id cx13sm1510951edb.20.2020.06.02.05.40.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 05:40:49 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id e1so3265481wrt.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:40:49 -0700 (PDT)
X-Received: by 2002:adf:e648:: with SMTP id b8mr27260840wrn.386.1591101648925; 
 Tue, 02 Jun 2020 05:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
In-Reply-To: <20200602110223.GW1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 06:40:12 -0600
X-Gmail-Original-Message-ID: <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
Message-ID: <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
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

On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> > Extend the monitor_op domctl to include option that enables
> > controlling what values certain registers are permitted to hold
> > by a monitor subscriber.
>
> I think the change could benefit for some more detail commit message
> here. Why is this useful?

You would have to ask the Bitdefender folks who made the feature. I
don't use it. Here we are just making it optional as it is buggy so it
is disabled by default.

>
> There already seems to be some support for gating MSR writes, which
> seems to be expanded by this commit?

We don't expand on any existing features, we make an existing feature optio=
nal.

>
> Is it solving some kind of bug reported?

It does, please take a look at the cover letter.

>
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  xen/arch/x86/hvm/hvm.c       | 25 ++++++++++++++++---------
> >  xen/arch/x86/monitor.c       | 10 +++++++++-
> >  xen/include/asm-x86/domain.h |  1 +
> >  xen/include/public/domctl.h  |  1 +
> >  4 files changed, 27 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 09ee299bc7..e6780c685b 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_def=
er)
> >      {
> >          ASSERT(v->arch.vm_event);
> >
> > -        if ( hvm_monitor_crX(CR0, value, old_value) )
> > +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> > +             v->domain->arch.monitor.control_register_values )
> >          {
> >              /* The actual write will occur in hvm_do_resume(), if perm=
itted. */
> >              v->arch.vm_event->write_data.do_write.cr0 =3D 1;
> > @@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_def=
er)
> >      {
> >          ASSERT(v->arch.vm_event);
> >
> > -        if ( hvm_monitor_crX(CR3, value, old) )
> > +        if ( hvm_monitor_crX(CR3, value, old) &&
> > +             v->domain->arch.monitor.control_register_values )
> >          {
> >              /* The actual write will occur in hvm_do_resume(), if perm=
itted. */
> >              v->arch.vm_event->write_data.do_write.cr3 =3D 1;
> > @@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_def=
er)
> >      {
> >          ASSERT(v->arch.vm_event);
> >
> > -        if ( hvm_monitor_crX(CR4, value, old_cr) )
> > +        if ( hvm_monitor_crX(CR4, value, old_cr) &&
> > +             v->domain->arch.monitor.control_register_values )
>
> I think you could return control_register_values in hvm_monitor_crX
> instead of having to add the check to each caller?

We could, but this way the code is more consistent.

>
> >          {
> >              /* The actual write will occur in hvm_do_resume(), if perm=
itted. */
> >              v->arch.vm_event->write_data.do_write.cr4 =3D 1;
> > @@ -3587,13 +3590,17 @@ int hvm_msr_write_intercept(unsigned int msr, u=
int64_t msr_content,
> >
> >          ASSERT(v->arch.vm_event);
> >
> > -        /* The actual write will occur in hvm_do_resume() (if permitte=
d). */
> > -        v->arch.vm_event->write_data.do_write.msr =3D 1;
> > -        v->arch.vm_event->write_data.msr =3D msr;
> > -        v->arch.vm_event->write_data.value =3D msr_content;
> > -
> >          hvm_monitor_msr(msr, msr_content, msr_old_content);
> > -        return X86EMUL_OKAY;
> > +
> > +        if ( v->domain->arch.monitor.control_register_values )
>
> Is there any value in limiting control_register_values to MSR that
> represent control registers, like EFER and XSS?

I don't know, you would have to ask Bitdefender about it who made this feat=
ure.

>
> > +        {
> > +            /* The actual write will occur in hvm_do_resume(), if perm=
itted. */
> > +            v->arch.vm_event->write_data.do_write.msr =3D 1;
> > +            v->arch.vm_event->write_data.msr =3D msr;
> > +            v->arch.vm_event->write_data.value =3D msr_content;
> > +
> > +            return X86EMUL_OKAY;
> > +        }
>
> You seem to change the previous flow of the function here, that would
> just call hvm_monitor_msr and return previously.
>
> Don't you need to move the return from outside the added if condition
> in order to keep previous behavior? Or else the write is committed
> straight away.

That's exactly what we want to achieve. Postponing the write is buggy.
We want to make that feature optional. Before Bitdefender contributed
that feature writes were always commited straight away, so with this
patch we are actually reverting default behavior to what it was like
to start with.

>
> >      }
> >
> >      if ( (ret =3D guest_wrmsr(v, msr, msr_content)) !=3D X86EMUL_UNHAN=
DLEABLE )
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
>
> I think strictly speaking you need to use 1 here, since this variable
> is not a boolean.

Sure.

Thanks,
Tamas

