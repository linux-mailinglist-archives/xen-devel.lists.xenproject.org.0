Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECB2CF499
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 20:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45028.80508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klGYS-00073T-BH; Fri, 04 Dec 2020 19:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45028.80508; Fri, 04 Dec 2020 19:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klGYS-000737-7u; Fri, 04 Dec 2020 19:15:44 +0000
Received: by outflank-mailman (input) for mailman id 45028;
 Fri, 04 Dec 2020 19:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOLy=FI=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1klGYQ-000732-EK
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 19:15:42 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a54f2da-c03e-4546-b076-9921267ff6a5;
 Fri, 04 Dec 2020 19:15:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so6401116wrt.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 11:15:41 -0800 (PST)
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
X-Inumbo-ID: 7a54f2da-c03e-4546-b076-9921267ff6a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BInFkaBTq7RoiD4QqVvt4DOGstC1qQ0b1UfsOmig1cs=;
        b=LdvavkxtQ5JGuVRfBnEdHRXwjjLu43bygmUViNH2uAv46JPpp2MdcwBgal6IZkxWlN
         mpb9UMFMltpXzM5991itulvqZWi4Vamlx1hy5nS5gp930Nv5zi4FywOAQRyv4OPE6t/9
         WP8uXpZPX9o/PKaPi4QN9fa/pTMf+4sESbe6MYqZeaARqAFvP911KbGwIll9cJqmRc8t
         pP33aELd/4zgOGi2i95uu8+KpPAm/4KL8lpp+aiXihfjh4kRbYcan8Yp27F/3F7OIH7I
         oB4HRVJnPG+RFMONdHGtFhR5BvXh9kJi9uH0/OnD733u1kp785PHz8J6FC7qGphXvd0n
         QbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BInFkaBTq7RoiD4QqVvt4DOGstC1qQ0b1UfsOmig1cs=;
        b=kyLFM00lcpmToRMLbqTm11UrAwu1eg45FLkPNFb+X1j2n2aC8/bJ0qoQbduQn7vzAU
         oIQF6qjmjnC6vrDQ6MnpUYS9PEZN7UmGgXzGeJJvRwKS0bNNzZ02CoJId7CvwLMcFxLQ
         4+59BZlfKklZcic6URX+7HQuO5xmBTrOkcwkzKib/wZV+WyVcwN3Jbf61qvqt6TE4KWj
         eoGfkOLMhAtfWUoV6NYYFL6BrEotbmqXOXiKs7MASIcAnRHXiU+9O37O4JwUE1FnBs4t
         OL5JskpWLt5XLHg4L9KzYvbP3FpzAbyd7GQJucoroy2Qo3VYA55UMCjoIZmm4HmHstFf
         wCDg==
X-Gm-Message-State: AOAM530+mIDcb0eLMMsLDPAfoKQ6ZrlOx94S9SAYcWgzLtIeEI1KO/U+
	qDVTF8esxTfVTgIBrDv0nbevl9nI0cqK1CoeJYg=
X-Google-Smtp-Source: ABdhPJxGfACeZ+AiB9ITaXrMsVNBAESh8C5YWoCwkr+X3R9NPqoG13ppIGczSR1/wGtsorDbnxUMavp4WNbcvB/d0fk=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr3863673wrw.386.1607109340552;
 Fri, 04 Dec 2020 11:15:40 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com> <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com> <5862eb24-d894-455a-13ac-61af54f949e7@xen.org>
In-Reply-To: <5862eb24-d894-455a-13ac-61af54f949e7@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 4 Dec 2020 14:15:05 -0500
Message-ID: <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 4, 2020 at 10:29 AM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 04/12/2020 15:21, Tamas K Lengyel wrote:
> > On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Jan,
> >>
> >> On 03/12/2020 10:09, Jan Beulich wrote:
> >>> On 02.12.2020 22:10, Julien Grall wrote:
> >>>> On 23/11/2020 13:30, Jan Beulich wrote:
> >>>>> While there don't look to be any problems with this right now, the lock
> >>>>> order implications from holding the lock can be very difficult to follow
> >>>>> (and may be easy to violate unknowingly). The present callbacks don't
> >>>>> (and no such callback should) have any need for the lock to be held.
> >>>>>
> >>>>> However, vm_event_disable() frees the structures used by respective
> >>>>> callbacks and isn't otherwise synchronized with invocations of these
> >>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> >>>>> to wait to drop to zero before freeing the port (and dropping the lock).
> >>>>
> >>>> AFAICT, this callback is not the only place where the synchronization is
> >>>> missing in the VM event code.
> >>>>
> >>>> For instance, vm_event_put_request() can also race against
> >>>> vm_event_disable().
> >>>>
> >>>> So shouldn't we handle this issue properly in VM event?
> >>>
> >>> I suppose that's a question to the VM event folks rather than me?
> >>
> >> Yes. From my understanding of Tamas's e-mail, they are relying on the
> >> monitoring software to do the right thing.
> >>
> >> I will refrain to comment on this approach. However, given the race is
> >> much wider than the event channel, I would recommend to not add more
> >> code in the event channel to deal with such problem.
> >>
> >> Instead, this should be fixed in the VM event code when someone has time
> >> to harden the subsystem.
> >
> > I double-checked and the disable route is actually more robust, we
> > don't just rely on the toolstack doing the right thing. The domain
> > gets paused before any calls to vm_event_disable. So I don't think
> > there is really a race-condition here.
>
> The code will *only* pause the monitored domain. I can see two issues:
>     1) The toolstack is still sending event while destroy is happening.
> This is the race discussed here.
>     2) The implement of vm_event_put_request() suggests that it can be
> called with not-current domain.
>
> I don't see how just pausing the monitored domain is enough here.

Requests only get generated by the monitored domain. So if the domain
is not running you won't get more of them. The toolstack can only send
replies.

Tamas

