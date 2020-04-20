Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05501B0E14
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:15:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXDC-00058n-Ss; Mon, 20 Apr 2020 14:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AIDV=6E=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jQXDB-00058d-Hs
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:15:49 +0000
X-Inumbo-ID: 6eb12fd0-8311-11ea-9e09-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6eb12fd0-8311-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:15:48 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id x1so8034386ejd.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=js3/PcnLC9eiEFfZ7ktFRlh5Aytzt6B6NIEngxcMNzM=;
 b=ig7YigTdtLIleaXJLOe+ai2QazINZl0eiLexI0bcIRFQ/FAWiSGb0XmeAZh1yFGDWT
 rL1kfkXGFIg6IhZ5Q+/QVY/2pcWXx67WKj4AfWKI6CGX86oRLFm/TWJp9aD4xOz6dZgM
 qY9fNjjLjOY89wMWXpoaEQiw8InIEbPIr5z4k7FJAumhjj3aBq56a6fZPyl3bRvFqyoQ
 BibnOjYBAd8XWapbT8J9VOC2xTxsh0drgDvI5ej1nAYAQRXb5w8+nlCMy2XuXTIHRA7/
 hbzhRWM5xOpFcFTI74MznTuiWT+pKXCP3dc0xixRUgU6+ZErNR1r6+eEzVo9gICNgyHy
 qXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=js3/PcnLC9eiEFfZ7ktFRlh5Aytzt6B6NIEngxcMNzM=;
 b=Le2pq2usSFD60rGRxHIryGuQ0EZLbYfOuAfWTsubBmTLjj1StgSpYf/wBLQ5ln4yFu
 2BpaLbo2eL5ueKsWAziRQat9YnvEp2X551y40xITaQQiYxvVcVIR6TNap+sC98KjHqy6
 WoskcfaLy0T7mW8HmqtpObV6vuajBB3IGbhYteKuhHhyo6g8T2ZxKJfdjx0Mg16Dg4Ro
 Bv70hWvF3rRdQ2MndgIlw2ZytZbAXvfnFyvSuJxZpX53Q23meBfjt0z5NTlBctpANqpI
 eiGXPU6QpPe262UsQu3KOA3kC29F8PAz5D8RCtsIjrMSdIgKmWr6n/KFYfnb3UH9cw6V
 dxBA==
X-Gm-Message-State: AGi0PuapGJCFwEJ350C5vLdjJfeulCCz5JGHpl2JFFAUIXqOXK4JtnDY
 Iz0nTIOt56khTJ7IECMz1RgcLBEd13A=
X-Google-Smtp-Source: APiQypLqwQolzKDjGXL0nmgajG5HzKZphaZpNPLBDVnREQ7MNj+KFjWnUzXxUI6Ej62NnOoIjPtJJA==
X-Received: by 2002:a17:906:11c7:: with SMTP id
 o7mr2571936eja.108.1587392146874; 
 Mon, 20 Apr 2020 07:15:46 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id l2sm161631ejz.29.2020.04.20.07.15.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:15:45 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id u13so12389341wrp.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:15:45 -0700 (PDT)
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr19658737wrx.386.1587392145242; 
 Mon, 20 Apr 2020 07:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
 <20200420074516.GQ28601@Air-de-Roger>
In-Reply-To: <20200420074516.GQ28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Apr 2020 08:15:10 -0600
X-Gmail-Original-Message-ID: <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
Message-ID: <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
Subject: Re: [PATCH v15 1/3] mem_sharing: don't reset vCPU info page during
 fork reset
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 20, 2020 at 1:45 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
> > When a forked VM is being reset while having vm_events active, re-copyi=
ng the
> > vCPU info page can lead to events being lost. This seems to only affect=
 a
> > subset of events (interrupts), while not others (cpuid, MTF, EPT) thus =
it was
>
> I'm slightly lost by the sentence, is the guest or the hypervisor
> the one losing events?
>
> Ie: interrupts are events from a guest PoV, but cpuid or EPT is not
> something that triggers events that are injected to the guest. I think
> the commit message needs clarification.

Sorry, what I meant was software interrupts are not triggered anymore,
ie. int3 and it's associated event is not sent to the monitor
application (VM_EVENT_REASON_SOFTWARE_BREAKPOINT).

>
> > not discovered beforehand. Only copying vCPU info page contents during =
initial
> > fork fixes the problem.
>
> Hm, I'm not sure I understand why this is causing issues. When you
> reset a fork you should reset the vcpu info page, or else event masks wou=
ld
> be in a wrong state?

When we reset a fork we only want to 1) discard any memory allocated
for it 2) reset the vCPU registers. We don't want to reset event
channels or anything else. We have active vm_events on the domain and
the whole point of doing a fork reset is to avoid having to
reinitialize all that as it's quite slow.

> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 50 +++++++++++++++++------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index e572e9e39d..4b31a8b8f6 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1534,28 +1534,6 @@ int mem_sharing_fork_page(struct domain *d, gfn_=
t gfn, bool unsharing)
> >                            p2m->default_access, -1);
> >  }
> >
> > -static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > -{
> > -    unsigned int i;
> > -    int ret =3D -EINVAL;
> > -
> > -    if ( d->max_vcpus !=3D cd->max_vcpus ||
> > -        (ret =3D cpupool_move_domain(cd, d->cpupool)) )
> > -        return ret;
> > -
> > -    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > -    {
> > -        if ( !d->vcpu[i] || cd->vcpu[i] )
> > -            continue;
> > -
> > -        if ( !vcpu_create(cd, i) )
> > -            return -EINVAL;
> > -    }
> > -
> > -    domain_update_node_affinity(cd);
> > -    return 0;
> > -}
> > -
> >  static int copy_vcpu_settings(struct domain *cd, const struct domain *=
d)
> >  {
> >      unsigned int i;
> > @@ -1614,6 +1592,31 @@ static int copy_vcpu_settings(struct domain *cd,=
 const struct domain *d)
> >      return 0;
> >  }
> >
> > +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > +{
> > +    unsigned int i;
> > +    int ret =3D -EINVAL;
> > +
> > +    if ( d->max_vcpus !=3D cd->max_vcpus ||
> > +        (ret =3D cpupool_move_domain(cd, d->cpupool)) )
> > +        return ret;
> > +
> > +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > +    {
> > +        if ( !d->vcpu[i] || cd->vcpu[i] )
> > +            continue;
> > +
> > +        if ( !vcpu_create(cd, i) )
> > +            return -EINVAL;
> > +    }
> > +
> > +    if ( (ret =3D copy_vcpu_settings(cd, d)) )
> > +        return ret;
> > +
> > +    domain_update_node_affinity(cd);
> > +    return 0;
> > +}
>
> I would prefer the code movement to be in a different patch: it makes
> it more difficult to spot non-functional changes being made while
> moving the function around.

I don't think it's worth splitting this patch because of that. The
patch is quite small an the move is trivial to allow the function
bring_up_vcpus be able to call copy_vcpu_settings without having to
pre-declare that function.

Tamas

