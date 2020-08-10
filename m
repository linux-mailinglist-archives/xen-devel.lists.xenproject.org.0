Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2524134D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 00:39:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5GQd-00008s-NN; Mon, 10 Aug 2020 22:38:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clbu=BU=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1k5GQc-00008n-V4
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 22:38:03 +0000
X-Inumbo-ID: 3ea5796a-7e7c-4262-9a14-29338de17ed8
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ea5796a-7e7c-4262-9a14-29338de17ed8;
 Mon, 10 Aug 2020 22:38:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f18so897436wmc.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDsiuLPQ59OP1+i2xJ/jl++wqzTXI6dpK6NdpqI0a28=;
 b=aYw4TuF/9xzpkpCvhbHDgrmbLO7ufHfKK5m5btLFjv/da3idv1CJ+0k3u5i0759LYU
 McNRMdKAru+g2rLq30sESl/nK3qxyvX5NtTabp/nNZraiav7FMFdZcOZSFWejLde7X1f
 YuK4YDKdXy4D05mQW82m+hp4nZTaElzcxoRWUpw94mkdqkRurveE02/qSwQpaJoSNY7q
 iDuPkx5RaUQWjGMDFqzcHduyHIs4BLjKWrMxILyisvlj599eYdLJ+eVMnMH3msptDpYE
 rx0uFP0Cu2R1XPEW+0WIIyCPCmcsrz0RzKDuFgBD5k62DkgqTKl/i0paXgcS4iB3XXoh
 +pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDsiuLPQ59OP1+i2xJ/jl++wqzTXI6dpK6NdpqI0a28=;
 b=CzGR1QFzwOQR8pG4vDTmppDR7ClQAzZCVvYO3Ixez/0u2nEk1brArviMpdlnEVDdNn
 7jDkjVQCxe7sHXZbpwuknqdtjRtDTErV7YwGZf88tE+gKOiPlXFf/mJq5HjtdlokvsJa
 0hv3GDVfWB152NJk92px4IYrVlck//Pmxp7WMX6rcRJxvbC3z8XAXXFOppdHzoPmJ0/c
 /2/c+1gpl8p/eTjBhSmgV4qyfKLmf04Ypz6I1glBVU1oy6I/ecM3FA+MdEFd/HP+/M2O
 5KMhklnjsNVRAiwfSwd8DXMwU2gYM0utLpba6VK0qx1/tDjVuln+yfFdHmz89+Rh8rWb
 O+3g==
X-Gm-Message-State: AOAM5336ljEJzSWC8z/5jDJyENMBJJfbTXQ012KsZY96xGoOTXXYGob5
 naF6HaCtLd2jf5VZ/pKpH+zhI1VJ5kGmgJQ0yaw=
X-Google-Smtp-Source: ABdhPJyJFZKkVxDdmu7DqL8Zc4lYiAm68TbqKneMEczWt/q/Ui/nTACz/yxfM96NFcyTe4RTjkTJVBWb/YZzZ1i7/E0=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr1260039wma.79.1597099080842; 
 Mon, 10 Aug 2020 15:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
 <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
 <48a130dc-57fd-0627-d188-ddff4abf6778@gmail.com>
In-Reply-To: <48a130dc-57fd-0627-d188-ddff4abf6778@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 10 Aug 2020 23:37:49 +0100
Message-ID: <CAJ=z9a3x7LgztG2KQKza8n3Y7xJsoO+DSmyi8Pxm1BgQOBs=xQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 10 Aug 2020 at 21:29, Oleksandr <olekstysh@gmail.com> wrote:
>
>
> On 10.08.20 22:00, Julien Grall wrote:
>
> Hi Julien
>
> >
> >>>
> >>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
> >>>>>    */
> >>>>>   void leave_hypervisor_to_guest(void)
> >>>>>   {
> >>>>> +#ifdef CONFIG_IOREQ_SERVER
> >>>>> +    /*
> >>>>> +     * XXX: Check the return. Shall we call that in
> >>>>> +     * continue_running and context_switch instead?
> >>>>> +     * The benefits would be to avoid calling
> >>>>> +     * handle_hvm_io_completion on every return.
> >>>>> +     */
> >>>>
> >>>> Yeah, that could be a simple and good optimization
> >>>
> >>> Well, it is not simple as it is sounds :).
> >>> handle_hvm_io_completion() is the function in charge to mark the
> >>> vCPU as waiting for I/O. So we would at least need to split the
> >>> function.
> >>>
> >>> I wrote this TODO because I wasn't sure about the complexity of
> >>> handle_hvm_io_completion(current). Looking at it again, the main
> >>> complexity is the looping over the IOREQ servers.
> >>>
> >>> I think it would be better to optimize handle_hvm_io_completion()
> >>> rather than trying to hack the context_switch() or continue_running().
> >> Well, is the idea in proposed dirty test patch below close to what
> >> you expect? Patch optimizes handle_hvm_io_completion() to avoid extra
> >> actions if vcpu's domain doesn't have ioreq_server, alternatively
> >> the check could be moved out of handle_hvm_io_completion() to avoid
> >> calling that function at all.
> >
> > This looks ok to me.
> >
> >> BTW, TODO also suggests checking the return value of
> >> handle_hvm_io_completion(), but I am completely sure we can simply
> >> just return from leave_hypervisor_to_guest() at this point. Could you
> >> please share your opinion?
> >
> > From my understanding, handle_hvm_io_completion() may return false if
> > there is pending I/O or a failure.
>
> It seems, yes
>
>
> >
> > In the former case, I think we want to call handle_hvm_io_completion()
> > later on. Possibly after we call do_softirq().
> >
> > I am wondering whether check_for_vcpu_work() could return whether
> > there are more work todo on the behalf of the vCPU.
> >
> > So we could have:
> >
> > do
> > {
> >   check_for_pcpu_work();
> > } while (check_for_vcpu_work())
> >
> > The implementation of check_for_vcpu_work() would be:
> >
> > if ( !handle_hvm_io_completion() )
> >   return true;
> >
> > /* Rest of the existing code */
> >
> > return false;
>
> Thank you, will give it a try.
>
> Can we behave the same way for both "pending I/O" and "failure" or we
> need to distinguish them?

We don't need to distinguish them. In both cases, we will want to
process softirqs. In all the failure cases, the domain will have
crashed. Therefore the vCPU will be unscheduled.

>
> Probably we need some sort of safe timeout/number attempts in order to
> not spin forever?

Well, anything based on timeout/number of attempts is flaky. How do
you know whether the I/O is just taking a "long time" to complete?

But a vCPU shouldn't continue until an I/O has completed. This is
nothing very different than what a processor would do.

In Xen case, if an I/O never completes then it most likely means that
something went horribly wrong with the Device Emulator. So it is most
likely not safe to continue. In HW, when there is a device failure,
the OS may receive an SError (this is implementation defined) and
could act accordingly if it is able to recognize the issue.

It *might* be possible to send a virtual SError but there are a couple
of issues with it:
     * How do you detect a failure?
     * SErrors are implementations defined. You would need to teach
your OS (or the firmware) how to deal with them.

I would expect quite a bit of effort in order to design and implement
it. For now, it is probably best to just let the vCPU spin forever.

This wouldn't be an issue for Xen as do_softirq() would be called at
every loop.

Cheers,

