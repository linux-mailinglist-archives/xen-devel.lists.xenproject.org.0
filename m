Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36222CF615
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 22:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45072.80535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klIYJ-0003qf-9A; Fri, 04 Dec 2020 21:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45072.80535; Fri, 04 Dec 2020 21:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klIYJ-0003qG-5h; Fri, 04 Dec 2020 21:23:43 +0000
Received: by outflank-mailman (input) for mailman id 45072;
 Fri, 04 Dec 2020 21:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOLy=FI=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1klIYH-0003qB-7Y
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 21:23:41 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e36ca147-12da-4a4c-876a-6d8f8ec145fd;
 Fri, 04 Dec 2020 21:23:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v14so6610265wml.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 13:23:40 -0800 (PST)
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
X-Inumbo-ID: e36ca147-12da-4a4c-876a-6d8f8ec145fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBkisH7qkt4tTks6hPY848K8Xv8nx74W1YCkO3MSs78=;
        b=FrwZUo3xb4GJ2XCMYiKx6j+u9fsesFpOeFfg9mWR8Y/MbbuFtHYhGweL8FRRJpQ1Fu
         TT05l0v4kSoDWxEHBTGxu+G0/NsWZgChvthEMQB5qo+PD1qegkVo30vTzBfaEaCkduqf
         TxMoffSc98r4Byl479ghTPk7V6RANs34jEoDRDYEDQ10Kr+BolyI2kWJKNNsN12v4TNz
         x6dg2kceyG/he3EH2Mt5JSeQldC6RDKfOlJm9iE4WWmrtqADDGbo9Nfj39Sps8wz5+5r
         QdaQC/MDc6lJPHZLDZfWRQN02maR3qOhkTHt8sUggzWiaCWl6jN/GyY5BUnsA8hSVfo2
         I/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBkisH7qkt4tTks6hPY848K8Xv8nx74W1YCkO3MSs78=;
        b=O4OQEu/NOFNMqHXDqKifh7WIuDKT0D9mnQ18AVMSZFCUOe0nEefY9lS7siSGy2Lq+h
         jiL6B46S7bthTZv4dHQE87fvdzHwU9tTkwlT/7W+nDuKv5tROoJ31KOoepdbULbk2agx
         2WtgS2tXb/yGkCyVExVkYqk4xe8ejXqW2sbtgkkbXUQNZat3rVi8dsSSCLbSt4R/wlI4
         J7iJ31AayNohBBOnIS6hrftQb4wXenadq2Von8PqCzditIiiX/lm9yEJeFFugmfaCYuz
         Cc8rQ7rddRPyEvZuxBedLKq3HzWoa+5hTbjbpo5pYWhIpsNAuv0DwNThUowvoN911Cu/
         nlSg==
X-Gm-Message-State: AOAM533DjW9uwioZmcDMjfd01dd+CIb4K4D9FVZ3kJySzFJHWsCMQ8lz
	VWgcmBeQJ4J6E6NZsZe7MxdtkXKqW7/Chafutqg=
X-Google-Smtp-Source: ABdhPJyDago5jgo8lT/b6tX8BLqNd48NQMnJrZtGH1jlRB2oYa35oUPd0fjyJN66ZAOSGkjfWsCl1yskmo0vd2+EJp4=
X-Received: by 2002:a1c:4843:: with SMTP id v64mr6328377wma.186.1607117019180;
 Fri, 04 Dec 2020 13:23:39 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com> <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
 <5862eb24-d894-455a-13ac-61af54f949e7@xen.org> <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
 <CAJ=z9a2yEsvUcu8c=pjv5ymLgLHebZCJcTh7c+yeW44J6jDgWw@mail.gmail.com>
In-Reply-To: <CAJ=z9a2yEsvUcu8c=pjv5ymLgLHebZCJcTh7c+yeW44J6jDgWw@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 4 Dec 2020 16:23:03 -0500
Message-ID: <CABfawhmqk8aOEe4RMUtTjq_jgSCuGrL5vpuNdRBPNmmxRnfxFg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 4, 2020 at 2:22 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Fri, 4 Dec 2020 at 19:15, Tamas K Lengyel <tamas.k.lengyel@gmail.com> wrote:
> >
> > On Fri, Dec 4, 2020 at 10:29 AM Julien Grall <julien@xen.org> wrote:
> > >
> > >
> > >
> > > On 04/12/2020 15:21, Tamas K Lengyel wrote:
> > > > On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
> > > >>
> > > >> Hi Jan,
> > > >>
> > > >> On 03/12/2020 10:09, Jan Beulich wrote:
> > > >>> On 02.12.2020 22:10, Julien Grall wrote:
> > > >>>> On 23/11/2020 13:30, Jan Beulich wrote:
> > > >>>>> While there don't look to be any problems with this right now, the lock
> > > >>>>> order implications from holding the lock can be very difficult to follow
> > > >>>>> (and may be easy to violate unknowingly). The present callbacks don't
> > > >>>>> (and no such callback should) have any need for the lock to be held.
> > > >>>>>
> > > >>>>> However, vm_event_disable() frees the structures used by respective
> > > >>>>> callbacks and isn't otherwise synchronized with invocations of these
> > > >>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> > > >>>>> to wait to drop to zero before freeing the port (and dropping the lock).
> > > >>>>
> > > >>>> AFAICT, this callback is not the only place where the synchronization is
> > > >>>> missing in the VM event code.
> > > >>>>
> > > >>>> For instance, vm_event_put_request() can also race against
> > > >>>> vm_event_disable().
> > > >>>>
> > > >>>> So shouldn't we handle this issue properly in VM event?
> > > >>>
> > > >>> I suppose that's a question to the VM event folks rather than me?
> > > >>
> > > >> Yes. From my understanding of Tamas's e-mail, they are relying on the
> > > >> monitoring software to do the right thing.
> > > >>
> > > >> I will refrain to comment on this approach. However, given the race is
> > > >> much wider than the event channel, I would recommend to not add more
> > > >> code in the event channel to deal with such problem.
> > > >>
> > > >> Instead, this should be fixed in the VM event code when someone has time
> > > >> to harden the subsystem.
> > > >
> > > > I double-checked and the disable route is actually more robust, we
> > > > don't just rely on the toolstack doing the right thing. The domain
> > > > gets paused before any calls to vm_event_disable. So I don't think
> > > > there is really a race-condition here.
> > >
> > > The code will *only* pause the monitored domain. I can see two issues:
> > >     1) The toolstack is still sending event while destroy is happening.
> > > This is the race discussed here.
> > >     2) The implement of vm_event_put_request() suggests that it can be
> > > called with not-current domain.
> > >
> > > I don't see how just pausing the monitored domain is enough here.
> >
> > Requests only get generated by the monitored domain.
>
> If that's the case, then why is vm_event_put_request() able to
> deal with a non-current domain?
>
> I understand that you are possibly trusting who may call it, but this
> looks quite fragile.

I didn't write the system. You probably want to ask that question from
the original author.

Tamas

