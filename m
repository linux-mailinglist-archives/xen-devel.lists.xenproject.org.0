Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94C1DC4BD
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 03:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jba0r-0002K4-Es; Thu, 21 May 2020 01:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCrj=7D=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jba0q-0002Jz-9j
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 01:28:44 +0000
X-Inumbo-ID: 684dbefc-9b02-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 684dbefc-9b02-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 01:28:43 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k19so5428916edv.9
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvUTjO36+ARpFUBm1M1MQO4pROw0xKLgs4hkEFY4Hr0=;
 b=AfJEpZwPFkoIVKQOF3pKkfl90esJmuGjuhAQkuZwEC2sffLm67SAMGgkQYtXFBIj6o
 8KQVYd2Z//ykhHMsVUmSlO77vaUe2S3g0j6B3HApYSm51mTw9me5GIXWITIweCjl2Pz2
 XgzCVTKC+rWqqEJIRyQuJRaBgsg+fQfO2A6kG3G6c9rlUobWU4ISuktON+s2vkn+hvbW
 J7Oy886zXjXXxMtDyi7qqfrPHKfREMS4C+BluvN4sz3Erp9p5QY8etknOjRF9tCwVqVB
 CGJkD/oqpNXUayS735If8AOywHIgEODe7Na9p32k2Xy4n6B5xn7R5+LmqvpQ9lKvNG0W
 wGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvUTjO36+ARpFUBm1M1MQO4pROw0xKLgs4hkEFY4Hr0=;
 b=DZta3ozP7iV0F1zy+VI7Zz2p9g0tKkBv3y8+TqYTVR8I/o/dy1FJlzWbzprWmJFqfh
 E/0F3wdN91VvAfPQBMuuXItRIwJNbSSZ/Ub8RaY7lBEIey9kF0fioBELCX0JAma67Ys+
 JOYMbGS9WPdbf5Evb0rg+Exk38C144AqefQIIeJfBw/FipIXet1mIz6hBpcsEgvXK4VA
 7wmOn134GHKeqJst6b18fal6gFEk/Q8jVH4R+y+dLcxzq+JLgG3K46Hnf7fRPywmSlZ9
 4vQmwnfZcc6/Z009Ov+EF7SAoff98hueJt9S4w9LosIEbXaHxl3o3HE6PzaYI/bIeal1
 dB1Q==
X-Gm-Message-State: AOAM533zje3kVkgN25cuhPPTsNhKSaidATjkqrXdRPXy4QnEtx4nh4B/
 AJIVuASlXTuvG0fQldTw11RFUfKEvQ4=
X-Google-Smtp-Source: ABdhPJzTb/tj8Y9vvRs5quUI8IId0yPtwsH4QdKneJOaniLCQP0d49EBg88JmUkdCkx1/QUfVFLfHQ==
X-Received: by 2002:a50:9e2c:: with SMTP id z41mr5736987ede.193.1590024522010; 
 Wed, 20 May 2020 18:28:42 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id cq10sm3196530edb.48.2020.05.20.18.28.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 18:28:41 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id z4so4190685wmi.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 18:28:40 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr7126410wme.154.1590024520148; 
 Wed, 20 May 2020 18:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589561218.git.tamas@tklengyel.com>
 <72d4d282dd20b79ebdbaf1f70865ea38b075c5c0.1589561218.git.tamas@tklengyel.com>
 <ec19beb2-6e69-4e62-b260-0d76b2a7f5a7@suse.com>
 <CABfawhmg+ZtzKvJecAJE8=C+rnPiywUy8vO81Yz9dC4j2h-feg@mail.gmail.com>
 <d0cd29c0-3070-ceb2-cd21-4ae359a0ec57@suse.com>
In-Reply-To: <d0cd29c0-3070-ceb2-cd21-4ae359a0ec57@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 20 May 2020 19:28:03 -0600
X-Gmail-Original-Message-ID: <CABfawhnjp8a3XEpbTiZ5VGyZ9uFQqow0Gzf1sVei64MzOX6XVA@mail.gmail.com>
Message-ID: <CABfawhnjp8a3XEpbTiZ5VGyZ9uFQqow0Gzf1sVei64MzOX6XVA@mail.gmail.com>
Subject: Re: [PATCH 1/3] xen/monitor: Control register values
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 7:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.05.2020 15:42, Tamas K Lengyel wrote:
> > On Wed, May 20, 2020 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.05.2020 18:53, Tamas K Lengyel wrote:
> >>> Extend the monitor_op domctl to include option that enables
> >>> controlling what values certain registers are permitted to hold
> >>> by a monitor subscriber.
> >>
> >> This needs a bit more explanation, especially for those of us
> >> who aren't that introspection savvy. For example, from the text
> >> here I didn't expect a simple bool control, but something where
> >> actual (register) values get passed back and forth.
> >>
> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -2263,9 +2263,10 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
> >>>      {
> >>>          ASSERT(v->arch.vm_event);
> >>>
> >>> -        if ( hvm_monitor_crX(CR0, value, old_value) )
> >>> +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> >>> +             v->domain->arch.monitor.control_register_values )
> >>>          {
> >>> -            /* The actual write will occur in hvm_do_resume(), if permitted. */
> >>> +            /* The actual write will occur in hvm_do_resume, if permitted. */
> >>
> >> Please can you leave alone this and the similar comments below.
> >> And for consistency _add_ parentheses to the one new instance
> >> you add?
> >
> > I changed to because now it doesn't fit into the 80-line limit below,
> > and then changed it everywhere _for_ consistency.
>
> The 80-char limit is easy to deal with - wrap the line.
>
> >>> --- a/xen/arch/x86/monitor.c
> >>> +++ b/xen/arch/x86/monitor.c
> >>> @@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
> >>>                                struct xen_domctl_monitor_op *mop)
> >>>  {
> >>>      struct arch_domain *ad = &d->arch;
> >>> -    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
> >>> +    bool requested_status;
> >>> +
> >>> +    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
> >>> +    {
> >>> +        ad->monitor.control_register_values = true;
> >>
> >> And there's no way to clear this flag again?
> >
> > There is. Disable the monitor vm_event interface and reinitialize.
>
> Quite heavy handed, isn't it?

Not really. It's perfectly suitable for what its used for. You either
need this feature for the duration of your monitoring or you don't.
There is no in-between.

Tamas

