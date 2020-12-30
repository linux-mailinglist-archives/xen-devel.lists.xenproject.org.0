Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4642E758D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 02:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60060.105314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuQMb-0001uW-Ah; Wed, 30 Dec 2020 01:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60060.105314; Wed, 30 Dec 2020 01:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuQMb-0001u6-3X; Wed, 30 Dec 2020 01:33:21 +0000
Received: by outflank-mailman (input) for mailman id 60060;
 Wed, 30 Dec 2020 01:33:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+AK=GC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kuQMZ-0001ti-0Y
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 01:33:19 +0000
Received: from mail-oi1-x234.google.com (unknown [2607:f8b0:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6578238a-08e7-423b-8cf2-8e3b8c136071;
 Wed, 30 Dec 2020 01:33:17 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id 15so17167756oix.8
 for <xen-devel@lists.xenproject.org>; Tue, 29 Dec 2020 17:33:17 -0800 (PST)
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
X-Inumbo-ID: 6578238a-08e7-423b-8cf2-8e3b8c136071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsCxKkk4R0Ca2wayNnrtXj9WZLPTQjHY2sPylFL2k4Y=;
        b=suinbuHavSNxJwdI442sIFHWVXKlACqpdMfZxDTWZkwvygyS5c2KzU2wW8lPTMKppF
         j6DhLZYB3mRe9PORHwUTRxYlmGumIGi1136m1FZ1wRsjMD6PkWsX+Ygp86/muV3SRbYp
         R5fY45sdYXZwSG2eILLKazvMZJ7b8GaLx5JcKqFnIkvrAoSlKy3DPYVP9YY1ORrt6Rd7
         uFQXvUMYj5vVKO+fodCRWlAsg8HaTz4/VN2687HvhgdBYXg2m5P02EaT12R0/BQYu4Mc
         7Lt9EddNdIz6oAmir8kWf8qS96vMKjOSLYPMMHuDcYfl113lJvN9fvKT079U8RpF6bfV
         91oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsCxKkk4R0Ca2wayNnrtXj9WZLPTQjHY2sPylFL2k4Y=;
        b=ONmCm0oT5XsnYrjUWg8WLT3usqvOPjwpPNtKRZfYAcftYnssjX7IaOtO+F+MkZU4KM
         E5JNG8mSIlQCUACRagpybQM7KnpoTfctCBa2k66QvEkf8ku7QdeP7EwB07NL5v73CxbN
         mtc20BQr0C0BPaFkUSxtlIa0RwGwMy2DN8J7uyH9l+4CB5YXz3hOLzeE52YLyVS5AFrH
         a57axu5L4DItb85LinapVr5Iu2pw2n2lu5i/acUpZTCIMH5TRzoc2xGwiBtkkuOoy0+X
         77wKzn1QPjO6A9MuNLYb18NmG5pQT9ONSwGtw/wWvmB9MDZiQQFHeWgXrYZiUjunL1Ko
         t7Zg==
X-Gm-Message-State: AOAM533+PvNhE9YhJiq6EgUYN8K4u/gKFQSEit7zKng3/gRef9tyTe4t
	OQiRz7EtCK+DePzE04w/MaYS+0uTCDbkwdgJiXc=
X-Google-Smtp-Source: ABdhPJzSeqatiQAcxuU0aJoQO6GFStGFjYOOCpTGA88mg530E07wS1Hti6QnUhjGk1N9atGxMq0SvNPlrwQZ3cymV14=
X-Received: by 2002:aca:4fd0:: with SMTP id d199mr3941243oib.33.1609291996366;
 Tue, 29 Dec 2020 17:33:16 -0800 (PST)
MIME-Version: 1.0
References: <CACMJ4GbQ4ZDB0RVbK+EU0+9yyGi0hTtVNxmBnNWDgY56QeDfyg@mail.gmail.com>
 <CABQWM_AXce2OJep8u0c1hL0s2ukb9LGwLtiX5e7315qQJeMgaQ@mail.gmail.com>
In-Reply-To: <CABQWM_AXce2OJep8u0c1hL0s2ukb9LGwLtiX5e7315qQJeMgaQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 29 Dec 2020 17:33:05 -0800
Message-ID: <CACMJ4GbKyvt9-ii4jmhb7TgrXxZicKkAx0BOxM+N0zEqT+4r+w@mail.gmail.com>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
To: Jean-Philippe Ouellet <jpo@vt.edu>
Cc: openxt <openxt@googlegroups.com>, Rich Persaud <persaur@gmail.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Julien Grall <jgrall@amazon.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 4:13 AM Jean-Philippe Ouellet <jpo@vt.edu> wrote:
>
> On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> > Hi all,
> >
> > I have written a page for the OpenXT wiki describing a proposal for
> > initial development towards the VirtIO-Argo transport driver, and the
> > related system components to support it, destined for OpenXT and
> > upstream projects:
> >
> > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1
> >
> > Please review ahead of tomorrow's OpenXT Community Call.
> >
> > I would draw your attention to the Comparison of Argo interface options section:
> >
> > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Comparison-of-Argo-interface-options
> >
> > where further input to the table would be valuable;
> > and would also appreciate input on the IOREQ project section:
> >
> > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Project:-IOREQ-for-VirtIO-Argo
> >
> > in particular, whether an IOREQ implementation to support the
> > provision of devices to the frontends can replace the need for any
> > userspace software to interact with an Argo kernel interface for the
> > VirtIO-Argo implementation.
> >
> > thanks,
> > Christopher
>
> Hi,
>
> Really excited to see this happening, and disappointed that I'm not
> able to contribute at this time. I don't think I'll be able to join
> the call, but wanted to share some initial thoughts from my
> middle-of-the-night review anyway.

Thanks for the review and positive feedback - appreciated.

> Super rough notes in raw unedited notes-to-self form:
>
> main point of feedback is: I love the desire to get a non-shared-mem
> transport backend for virtio standardized. It moves us closer to an
> HMX-only world. BUT: virtio is relevant to many hypervisors beyond
> Xen, not all of which have the same views on how policy enforcement
> should be done, namely some have a preference for capability-oriented
> models over type-enforcement / MAC models. It would be nice if any
> labeling encoded into the actual specs / guest-boundary protocols
> would be strictly a mechanism, and be policy-agnostic, in particular
> not making implicit assumptions about XSM / SELinux / similar. I don't
> have specific suggestions at this point, but would love to discuss.

That is an interesting point; thanks. It is more about the features
and specification of Argo itself and its interfaces than the use of it
to implement a VirtIO transport, but is good to consider. We have a
OpenXT wiki page for Argo development, and have a related item
described there about having the hypervisor and remote guest kernel
provide message context about the communication source to the
receiver, to support policy decisions:

https://openxt.atlassian.net/wiki/spaces/DC/pages/737345538/Argo+Hypervisor-Mediated+data+eXchange+Development

> thoughts on how to handle device enumeration? hotplug notifications?
> - can't rely on xenstore
> - need some internal argo messaging for this?
> - name service w/ well-known names? starts to look like xenstore
> pretty quickly...

I don't think we have a firm decision on this. We have been
considering using ACPI-tables and/or Device Tree for device
enumeration, which is viable for devices that are statically assigned,
and hotplug is an additional case to design for. We'll be looking at
the existing VirtIO transports too.

Handling notifications on a well-known Argo port is a reasonable
direction to go and fits with applying XSM policy to govern Argo port
connectivity between domains.

https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO#Argo:-Device-discovery-and-driver-registration-with-Virtio-Argo-transport

> - granular disaggregation of backend device-model providers desirable

agreed

> how does resource accounting work? each side pays for their own delivery ring?
> - init in already-guest-mapped mem & simply register?

Yes: rings are registered with a domain's own memory for receiving messages.

> - how does it compare to grant tables?

The grant tables are the Xen mechanism for a VM to instruct the
hypervisor to grant another VM permission to establish shared memory
mappings, or to copy data between domains. Argo is an alternative
mechanism for communicating between VMs that does not share memory
between them and provides different properties that are supportive of
isolation and access control.

There's a presentation with an overview of Argo from the 2019 Xen
Design and Developer Summit:
https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
https://www.youtube.com/watch?v=cnC0Tg3jqJQ&list=PLYyw7IQjL-zHmP6CuqwuqfXNK5QLmU7Ur&index=15

>   - do you need to go through linux driver to alloc (e.g. xengntalloc)
> or has way to share arbitrary otherwise not-special userspace pages
> (e.g. u2mfn, with all its issues (pinning, reloc, etc.))?

In the current Argo device driver implementations, userspace does not
have direct access to Argo message rings. Instead the kernel provides
devices that can be used to send and receive data with familiar I/O
primitives via those.

For the VirtIO-Argo transport, userspace would not need to be aware of
the use of Argo - the VirtIO virtual devices will present themselves
to userspace with the same VirtIO device interfaces as when they use
any other transport.

> ioreq is tangled with grant refs, evt chans, generic vmexit
> dispatcher, instruction decoder, etc. none of which seems desirable if
> trying to move towards world with strictly safer guest interfaces
> exposed (e.g. HMX-only)

ack

> - there's no io to trap/decode here, it's explicitly exclusively via
> hypercall to HMX, no?

Yes; as Roger noted in his reply in this thread, the interest in IOREQ
has been motivated by other recent VirtIO activity in the Xen
Community, and whether some potential might exist for alignment with
that work.

> - also, do we want argo sendv hypercall to be always blocking & synchronous?
>   - or perhaps async notify & background copy to other vm addr space?
>   - possibly better scaling?
>   - accounting of in-flight io requests to handle gets complicated
> (see recent XSA)
>   - PCI-like completion request semantics? (argo as cross-domain
> software dma engine w/ some basic protocol enforcement?)

I think implementation of an asynchronous delivery primitive for Argo
is worth exploring given its potential for achieving different
performance characteristics which could enable it to support
additional use cases.
It is likely beyond the scope of the initial VirtIO-Argo driver
development, but enabling VirtIO guest drivers to use Argo will allow
testing to determine which uses of it could benefit from further
investment.

> "port" v4v driver => argo:
> - yes please! something without all the confidence-inspiring
> DEBUG_{APPLE,ORANGE,BANANA} indicators of production-worthy code would
> be great ;)
> - seems like you may want to redo argo hypercall interface too?

The Xen community has plans to remove all the uses of virtual
addresses from the hypervisor interface, and the Argo interface will
need to be updated as part of that work. In addition, work to
incorporate further features from v4v, and some updates to Argo per
items on the OpenXT Argo development wiki page, will also involve some
updates to the interface.

> (at least the syscall interface...)

Yes: a new Argo Linux driver will likely have quite a different
interface to userspace to the current one; it's been discussed in the
OpenXT community and the notes from the discussion are here:

https://openxt.atlassian.net/wiki/spaces/DC/pages/775389197/New+Linux+Driver+for+Argo

There is motivation to support both a networking and non-networking
interface, so that network-enabled guest OSes can use familiar
primitives and software, and non-network-enabled guests are still able
to use Argo communication.

>   - targeting synchronous blocking sendv()?
>   - or some async queue/completion thing too? (like PF_RING, but with
> *iov entries?)
>   - both could count as HMX, both could enforce no double-write racing
> games at dest ring, etc.

The immediate focus is on building a modern, hopefully simple, driver
that unblocks the immediate use cases we have, allowing us to retire
the existing driver, and is suitable for submission and maintenance in
the kernel upstream.

> re v4vchar & doing similar for argo:
> - we may prefer "can write N bytes? -> yes/no" or "how many bytes can
> write? -> N" over "try to write N bytes -> only wrote M, EAGAIN"
> - the latter can be implemented over the former, but not the other way around
> - starts to matter when you want to be able to implement in userspace
> & provide backpressure to peer userspace without additional buffering
> & potential lying about durability of writes
> - breaks cross-domain EPIPE boundary correctness
> - Qubes ran into same issues when porting vchan from Xen to KVM
> initially via vsock

Thanks - that's helpful and will look at that when the driver work proceeds.

> some virtio drivers explicitly use shared mem for more than just
> communication rings:
> - e.g. virtio-fs, which can map pages as DAX-like fs backing to share page cache
> - e.g. virtio-gpu, virtio-wayland, virtio-video, which deal in framebuffers
> - needs thought about how best to map semantics to (or at least
> interoperate cleanly & safely with) HMX-{only,mostly} world
>   - the performance of shared mem actually can meaningfully matter for
> e.g. large framebuffers in particular due to fundamental memory
> bandwidth constraints

This is an important point and given the clear utility of these
drivers it will be worth exploring what can be done to meet their
performance requirements and satisfy the semantics needed for them to
function.  It may be the case that shared memory regions are going to
be necessary for some classes of driver - some investigation required.
Along the lines of the research that Rich included in his reply, it
would be interesting to see whether modern hardware provides
primitives that can support efficient cross-domain data transport that
could be used for this. Thanks for raising it.

Christopher

