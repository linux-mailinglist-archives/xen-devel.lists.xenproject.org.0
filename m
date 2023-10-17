Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA387CC71A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 17:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618285.961735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslgy-0007O1-Np; Tue, 17 Oct 2023 15:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618285.961735; Tue, 17 Oct 2023 15:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslgy-0007LX-KY; Tue, 17 Oct 2023 15:09:08 +0000
Received: by outflank-mailman (input) for mailman id 618285;
 Tue, 17 Oct 2023 15:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6d0P=F7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qslgx-0007LR-JB
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 15:09:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d3442dd-6cff-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 17:09:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso355390666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 08:09:05 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 hx3-20020a170906846300b009b2b47cd757sm1406874ejc.9.2023.10.17.08.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 08:09:04 -0700 (PDT)
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
X-Inumbo-ID: 1d3442dd-6cff-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697555345; x=1698160145; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grXiTKgnvAvhGRo/vc3pmvz20DZyzjE2OS69aWDpo24=;
        b=Fn2N2uKt6FjNj0SZY+wNuywkSC95e5FCGUHgeePnRTisiXK++JGCMWG4pFqudwWdTx
         szWGfauISHGUSs+xlurEXb5fmrvoVg3N6jXtty3BJfD4TV6Cbd8Vn35rM2Vb7nzME1Bp
         ThZkN4NJPtea/KWTl3A6OKEjrpDGJ9DTIZ2Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555345; x=1698160145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grXiTKgnvAvhGRo/vc3pmvz20DZyzjE2OS69aWDpo24=;
        b=K9M2b9X0IlYL6sE0WRoxaqzz9v4l3f6zt6VHgGUQr3cMn4cxjqzLoFBp4mUf2e/N5h
         47QS6vj3r19FmC0BojZwf/cQ13XHGM2fGSOE0RrmYKDmsmc97TLBtZrE3s/sokB8uIMV
         qkYcXizKwq0VsQYecev4Pmwp7tdy+TyfPq9UlwPVLP7n6RSybmXQAbZbirGSBxHWCKb0
         Dp75gw4wKp7OTxVoopgwdi1Hb5ynXW2tk2wtaCrilziCQt2kj4J6IGqt/0w5/uE8jsZd
         IrdkYZsJ2W+U4zjjY2CHl8DjtHNscsYKxyQqWkktUoCdOjaizm417RD24wBGO8STX4ZF
         imzQ==
X-Gm-Message-State: AOJu0YzXQiM7714JO3G3CRzcGR59ep28cWm51Yam0bVdtyCnngmjmZ7N
	3XUgLqbBhBgGWXnLNF1A27V5dg==
X-Google-Smtp-Source: AGHT+IFjp1oOuaqA+Z71qHOVFc+lY1ZDwW7mMmwgn+UGrlIjcn3THN8GLfLSFkpzd1QoRhtvMVpyOA==
X-Received: by 2002:a17:907:a0c9:b0:9c4:4b20:44a1 with SMTP id hw9-20020a170907a0c900b009c44b2044a1mr2110375ejc.65.1697555345197;
        Tue, 17 Oct 2023 08:09:05 -0700 (PDT)
Message-ID: <652ea390.170a0220.fc514.3c38@mx.google.com>
X-Google-Original-Message-ID: <ZS6jjsmJqwYymBBQ@EMEAENGAAD19049.>
Date: Tue, 17 Oct 2023 16:09:02 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016162450.1286178-1-andrew.cooper3@citrix.com>

The page is pretty nice overall and I quite liked it. Just a few extra
questions below, as I'm not familiar with this side of things,

On Mon, Oct 16, 2023 at 05:24:50PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> Rendered form:
>   https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/domid-lifecycle.html
> 
> I'm not sure why it's using the alibaster theme and not RTD theme, but I
> don't have time to debug that further at this point.
> 
> This was written mostly while sat waiting for flights in Nanjing and Beijing.
> 
> If while reading this you spot a hole, congratulations.  There are holes which
> need fixing...
> ---
>  docs/glossary.rst                         |   9 ++
>  docs/hypervisor-guide/domid-lifecycle.rst | 164 ++++++++++++++++++++++
>  docs/hypervisor-guide/index.rst           |   1 +
>  3 files changed, 174 insertions(+)
>  create mode 100644 docs/hypervisor-guide/domid-lifecycle.rst
> 
> diff --git a/docs/glossary.rst b/docs/glossary.rst
> index 8ddbdab160a1..1fd1de0f0e97 100644
> --- a/docs/glossary.rst
> +++ b/docs/glossary.rst
> @@ -50,3 +50,12 @@ Glossary
>  
>       By default it gets all devices, including all disks and network cards, so
>       is responsible for multiplexing guest I/O.
> +
> +   system domain
> +     Abstractions within Xen that are modelled in a similar way to regular
> +     :term:`domains<domain>`.  E.g. When there's no work to do, Xen schedules
> +     ``DOMID_IDLE`` to put the CPU into a lower power state.
> +
> +     System domains have :term:`domids<domid>` and are referenced by
> +     privileged software for certain control operations, but they do not run
> +     guest code.
> diff --git a/docs/hypervisor-guide/domid-lifecycle.rst b/docs/hypervisor-guide/domid-lifecycle.rst
> new file mode 100644
> index 000000000000..d405a321f3c7
> --- /dev/null
> +++ b/docs/hypervisor-guide/domid-lifecycle.rst
> @@ -0,0 +1,164 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Lifecycle of a domid
> +====================
> +
> +Overview
> +--------
> +
> +A :term:`domid` is Xen's numeric identifier for a :term:`domain`.  In any
> +operational Xen system, there are one or more domains running.
> +
> +Domids are 16-bit integers.  Regular domids start from 0, but there are some
> +special identifiers, e.g. ``DOMID_SELF``, and :term:`system domains<system
> +domain>`, e.g. ``DOMID_IDLE`` starting from 0x7ff0.  Therefore, a Xen system
> +can run a maximum of 32k domains concurrently.
> +
> +.. note::
> +
> +   Despite being exposed in the domid ABI, the system domains are internal to
> +   Xen and do not have lifecycles like regular domains.  Therefore, they are
> +   not discussed further in this document.
> +
> +At system boot, Xen will construct one or more domains.  Kernels and
> +configuration for these domains must be provided by the bootloader, or at
> +Xen's compile time for more highly integrated solutions.
> +
> +Correct functioning of the domain lifecycle involves ``xenstored``, and some
> +privileged entity which has bound the ``VIRQ_DOM_EXC`` global event channel.
> +
> +.. note::
> +
> +   While not a strict requirement for these to be the same entity, it is
> +   ``xenstored`` which typically has ``VIRQ_DOM_EXC`` bound.  This document is
> +   written assuming the common case.
> +
> +Creation
> +--------
> +
> +Within Xen, the ``domain_create()`` function is used to allocate and perform
> +bare minimum construction of a domain.  The :term:`control domain` accesses
> +this functionality via the ``DOMCTL_createdomain`` hypercall.
> +
> +The final action that ``domain_create()`` performs before returning
> +successfully is to enter the new domain into the domlist.  This makes the
> +domain "visible" within Xen, allowing the new domid to be successfully
> +referenced by other hypercalls.
> +
> +At this point, the domain exists as far as Xen is concerned, but not usefully
> +as a VM yet.  The toolstack performs further construction activities;
> +allocating vCPUs, RAM, copying in the initial executable code, etc.  Domains
> +are automatically created with one "pause" reference count held, meaning that
> +it is not eligible for scheduling.
> +
> +When the toolstack has finished VM construction, it send an ``XS_INTRODUCE``
> +command to ``xenstored``.  This instructs ``xenstored`` to connect to the
> +guest's xenstore ring, and fire the ``@introduceDomain`` watch.  The firing of
> +this watch is the signal to all other components which care that a new VM has
> +appeared and is about to start running.
Presumably the xenstore ring is memory shared between xenstore and the
newly created domain. Who establishes that connection? For the case where
xenstore lives in dom0 things are _simpler_ because it lives in the same VM
as the toolstack, but I suspect things are hairier when xenstore is in its
own stubdomain. A description of the grant dance (if any), would be helpful.

In that same line, having mermaid sequence diagrams would make these
descriptions easier to follow:

  https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/

> +
> +When the ``XS_INTRODUCE`` command returns successfully, the final action the
Not knowing the internals I find the wording weird, though that might be my
own misunderstanding. I imagine you mean "... when xenstore replies with
the successful completion of the ``XS_INTRODUCE`` command...". Considering
the "xenstore ring" mentioned before, I assume all xenstore comms are
async.

> +toolstack performs is to unpause the guest, using the ``DOMCTL_unpausedomain``
> +hypercall.  This drops the "pause" reference the domain was originally created
> +with, meaning that the vCPU(s) are eligible for scheduling and the domain will
> +start executing its first instruction.
> +
> +.. note::
> +
> +   It is common for vCPUs other than 0 to be left in an offline state, to be
> +   started by actions within the VM.
Peculiar choice of words. I guess you don't want to pinch your fingers
precluding other toolstack implementations doing something different. One
possible way to express it is that "Conventionally, other vCPUs other than
0 are left in an offline state to be started by actions within the VM.
This is non-normative, however, and custom Xen-based systems may
choose to do otherwise."

As is, it's unclear whether the unconventional behaviour is assumed to be a
real possibility, a known existing bug, or uncertainty about the past,
present and future.

> +
> +Termination
> +-----------
> +
> +The VM runs for a period of time, but eventually stops.  It can stop for a
> +number of reasons, including:
> +
> + * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
nit: I would 's/guest kernel/guest', but that's just me. Internally the
kernel may very well be a passive shim where the active intelligence is in
some disaggregated network of userspace components, making the kernel just
an accidental proxy.

> +   hypercall.  The hypercall also includes the reason for the shutdown,
> +   e.g. ``poweroff``, ``reboot`` or ``crash``.
> +
> + * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
> +   interrupts disabled is interpreted as a shutdown request as it is a common
> +   code pattern for fatal error handling when no better options are available.
> +
> + * Indirectly from fatal exceptions.  In some states, execution is unable to
> +   continue, e.g. Triple Fault on x86.
> +
> + * Directly from the device model, via the ``DMOP_remote_shutdown`` hypercall.
> +   E.g. On x86, the 0xcf9 IO port is commonly used to perform platform
> +   poweroff, reset or sleep transitions.
> +
> + * Directly from the toolstack.  The toolstack is capable of initiating
> +   cleanup directly, e.g. ``xl destroy``.  This is typically an administration
> +   action of last resort to clean up a domain which malfunctioned but not
> +   terminated properly.
This one is at a different abstraction layer than the others. The hypercall(s)
being used would be more helpful, along with a line saying that the
toolstack makes use of this through e.g: ``xl destory``.

> +
> + * Directly from Xen.  Some error handling ends up using ``domain_crash()``
> +   when Xen doesn't think it can safely continue running the VM.
> +
> +Whatever the reason for termination, Xen ends up calling ``domain_shutdown()``
> +to set the shutdown reason and deschedule all vCPUs.  Xen also fires the
> +``VIRQ_DOM_EXC`` event channel, which is a signal to ``xenstored``.
> +
> +Upon receiving ``VIRQ_DOM_EXC``, ``xenstored`` re-scans all domains using the
> +``SYSCTL_getdomaininfolist`` hypercall.  If any domain has changed state from
> +running to shut down, ``xenstored`` fires the ``@releaseDomain`` watch.  The
> +firing of this watch is the signal to all other components which care that a
> +VM has stopped.
> +
> +.. note::
> +
> +   Xen does not treat reboot differently to poweroff; both statuses are
> +   forwarded to the toolstack.  It is up to the toolstack to restart the VM,
> +   which is typically done by constructing a new domain.
> +
> +.. note::
> +
> +   Some shutdowns may not result in the cleanup of a domain.  ``suspend`` for
> +   example can be used for snapshotting, and the VM resumes execution in the
> +   same domain/domid.  Therefore, a domain can cycle several times between
> +   running and "shut down" before moving into the destruction phase.
> +
> +Destruction
> +-----------
> +
> +The domain object in Xen is reference counted, and survives until all
> +references are dropped.
What a "reference" means might help. I'd like to think it means any
pointer to a domain, and any domid in hypervisor memory, but...

> +
> +The ``@releaseDomain`` watch is to inform all entities that hold a reference
> +on the domain to clean up.  This may include:
... this statement leads me to believe only references held by trusted
parties are collected, and by their choice (not by force). What about pages
granted to other domains that may not whish (or be able to) comply?

> +
> + * Paravirtual driver backends having a grant map of the shared ring with the
> +   frontend.
On a related tangent, what happens if your driver domain is compromised?
Does it suddenly hold all your domains (and their RAM!) hostage because it
won't act upon ``@releaseDomain``?

> + * A device model with a map of the IOREQ page(s).
> +
> +The toolstack also has work to do in response to ``@releaseDomain``.  It must
> +issue the ``DOMCTL_destroydomain`` hypercall.  This hypercall can take minutes
> +of wall-clock time to complete for large domains as, amongst other things, it
> +is freeing the domain's RAM back to the system.
> +
> +The actions triggered by the ``@releaseDomain`` watch are asynchronous.  There
> +is no guarantee as to the order in which actions start, or which action is the
> +final one to complete.  However, the toolstack can achieve some ordering by
> +delaying the ``DOMCTL_destroydomain`` hypercall if necessary.
> +
> +Freeing
> +-------
> +
> +When the final reference on the domain object is dropped, Xen will remove the
nit: 's/will remove/removes'
> +domain from the domlist.  This means the domid is no longer visible in Xen,
> +and no longer able to be referenced by other hypercalls.
> +
> +Xen then schedules the object for deletion at some point after any concurrent
> +hypercalls referencing the domain have completed.
> +
> +When the object is finally cleaned up, Xen fires the ``VIRQ_DOM_EXC`` event
> +channel again, causing ``xenstored`` to rescan an notice that the domain has
> +ceased to exist.  It fires the ``@releaseDomain`` watch a second time to
> +signal to any components which care that the domain has gone away.
At which point did the grant tables drop the domid references? Are we relying
on the goodwill of the grant destination?

> +
> +E.g. The second ``@releaseDomain`` is commonly used by paravirtual driver
> +backends to shut themselves down.
> +
> +At this point, the toolstack can reuse the domid for a new domain.
> diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
> index e4393b06975b..af88bcef8313 100644
> --- a/docs/hypervisor-guide/index.rst
> +++ b/docs/hypervisor-guide/index.rst
> @@ -6,6 +6,7 @@ Hypervisor documentation
>  .. toctree::
>     :maxdepth: 2
>  
> +   domid-lifecycle
>     code-coverage
>  
>     x86/index
> 
> base-commit: dc9d9aa62ddeb14abd5672690d30789829f58f7e
> prerequisite-patch-id: 832bdc9a23500d426b4fe11237ae7f6614f2369c
> -- 
> 2.30.2
> 
> 

Thanks,
Alejandro

