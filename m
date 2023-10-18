Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D17CDA53
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 13:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618523.962265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4iv-00073L-7T; Wed, 18 Oct 2023 11:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618523.962265; Wed, 18 Oct 2023 11:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4iv-00071Q-2m; Wed, 18 Oct 2023 11:28:25 +0000
Received: by outflank-mailman (input) for mailman id 618523;
 Wed, 18 Oct 2023 11:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w+tR=GA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qt4it-00071K-B6
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 11:28:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7118ba45-6da9-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 13:28:21 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so11043236a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 04:28:21 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ck25-20020a0564021c1900b0053dab756073sm2631047edb.84.2023.10.18.04.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 04:28:20 -0700 (PDT)
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
X-Inumbo-ID: 7118ba45-6da9-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697628500; x=1698233300; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LgkL+Vi4mgV7ko/0mCDMpWCFqm3DxvFOY0j3mWBFV4=;
        b=ePfqDzm1QjBZ+SIi8FX6E1q8K9fHBHgYUXxF6Iyss0xU2UHAt8KWJxhG2Y8muaX2+n
         uvytqxhMi5DD86GNOPJL9u6DfWjBuXqx7rF6DaCb7QJqGBI36v1+z+zZ1vfsibKnETh/
         KMSPRpKSpSc4/GRzHwIBBVip/TNnQJS6+WO5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628500; x=1698233300;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LgkL+Vi4mgV7ko/0mCDMpWCFqm3DxvFOY0j3mWBFV4=;
        b=riXLVVg6SJyKM6DWGHggwjk8ws3UzepKILvvlQkGTKFfy8z4PFScvJxBqO9GNFX2tu
         EQ6uhDE/N4vw2/7mJyxuQ2aHnKSjUy0/m+/YbDS3CqpYnfHL/XkiIepMWNYbMw9szqYo
         bwXdujnLCcDyDKedxRwrP+9FBOnL5p1eCeveOTaT2ehK4B7394GkIsI1YRKViXwYu4BT
         MlJAFz9xyG3TbQjwS4IW2rtTEj281d74Vs5a/QTVkyxiaGEpTUno5ZzWPdK5mlKBamoY
         hqcLBtgS/nJrFLyTMc/rAP+cJOQRYrleWmH2yQEEA9AcYMdg7JbQn01BM55BjeeQVzGE
         1Lsw==
X-Gm-Message-State: AOJu0YxoG3iRQvA+Ku7ohc+1WMUteBh51lUrRDD5ms2lLcQ6J/6TAc+8
	pP7WTV/dG/4wOA0PbmDnuwgz7Q==
X-Google-Smtp-Source: AGHT+IFKuK5gV9+bZo57KVbX9e+E6GE0MUkqynpMEMfiZtF0Y2DQqIQvabb3P6etOxsDjy9uKpZSnw==
X-Received: by 2002:a50:9992:0:b0:53e:1741:d76b with SMTP id m18-20020a509992000000b0053e1741d76bmr3065969edb.39.1697628500362;
        Wed, 18 Oct 2023 04:28:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5aQc9fRFwlAIle0JWFaxCdbd"
Message-ID: <f23a183c-92d1-4789-b43f-d17476693307@citrix.com>
Date: Wed, 18 Oct 2023 12:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <652ea390.170a0220.fc514.3c38@mx.google.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <652ea390.170a0220.fc514.3c38@mx.google.com>

This is a multi-part message in MIME format.
--------------5aQc9fRFwlAIle0JWFaxCdbd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2023 4:09 pm, Alejandro Vallejo wrote:
> The page is pretty nice overall and I quite liked it. Just a few extra
> questions below, as I'm not familiar with this side of things,
>
> On Mon, Oct 16, 2023 at 05:24:50PM +0100, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Henry Wang <Henry.Wang@arm.com>
>>
>> Rendered form:
>>   https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/domid-lifecycle.html
>>
>> I'm not sure why it's using the alibaster theme and not RTD theme, but I
>> don't have time to debug that further at this point.
>>
>> This was written mostly while sat waiting for flights in Nanjing and Beijing.
>>
>> If while reading this you spot a hole, congratulations.  There are holes which
>> need fixing...
>> ---
>>  docs/glossary.rst                         |   9 ++
>>  docs/hypervisor-guide/domid-lifecycle.rst | 164 ++++++++++++++++++++++
>>  docs/hypervisor-guide/index.rst           |   1 +
>>  3 files changed, 174 insertions(+)
>>  create mode 100644 docs/hypervisor-guide/domid-lifecycle.rst
>>
>> diff --git a/docs/glossary.rst b/docs/glossary.rst
>> index 8ddbdab160a1..1fd1de0f0e97 100644
>> --- a/docs/glossary.rst
>> +++ b/docs/glossary.rst
>> @@ -50,3 +50,12 @@ Glossary
>>  
>>       By default it gets all devices, including all disks and network cards, so
>>       is responsible for multiplexing guest I/O.
>> +
>> +   system domain
>> +     Abstractions within Xen that are modelled in a similar way to regular
>> +     :term:`domains<domain>`.  E.g. When there's no work to do, Xen schedules
>> +     ``DOMID_IDLE`` to put the CPU into a lower power state.
>> +
>> +     System domains have :term:`domids<domid>` and are referenced by
>> +     privileged software for certain control operations, but they do not run
>> +     guest code.
>> diff --git a/docs/hypervisor-guide/domid-lifecycle.rst b/docs/hypervisor-guide/domid-lifecycle.rst
>> new file mode 100644
>> index 000000000000..d405a321f3c7
>> --- /dev/null
>> +++ b/docs/hypervisor-guide/domid-lifecycle.rst
>> @@ -0,0 +1,164 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Lifecycle of a domid
>> +====================
>> +
>> +Overview
>> +--------
>> +
>> +A :term:`domid` is Xen's numeric identifier for a :term:`domain`.  In any
>> +operational Xen system, there are one or more domains running.
>> +
>> +Domids are 16-bit integers.  Regular domids start from 0, but there are some
>> +special identifiers, e.g. ``DOMID_SELF``, and :term:`system domains<system
>> +domain>`, e.g. ``DOMID_IDLE`` starting from 0x7ff0.  Therefore, a Xen system
>> +can run a maximum of 32k domains concurrently.
>> +
>> +.. note::
>> +
>> +   Despite being exposed in the domid ABI, the system domains are internal to
>> +   Xen and do not have lifecycles like regular domains.  Therefore, they are
>> +   not discussed further in this document.
>> +
>> +At system boot, Xen will construct one or more domains.  Kernels and
>> +configuration for these domains must be provided by the bootloader, or at
>> +Xen's compile time for more highly integrated solutions.
>> +
>> +Correct functioning of the domain lifecycle involves ``xenstored``, and some
>> +privileged entity which has bound the ``VIRQ_DOM_EXC`` global event channel.
>> +
>> +.. note::
>> +
>> +   While not a strict requirement for these to be the same entity, it is
>> +   ``xenstored`` which typically has ``VIRQ_DOM_EXC`` bound.  This document is
>> +   written assuming the common case.
>> +
>> +Creation
>> +--------
>> +
>> +Within Xen, the ``domain_create()`` function is used to allocate and perform
>> +bare minimum construction of a domain.  The :term:`control domain` accesses
>> +this functionality via the ``DOMCTL_createdomain`` hypercall.
>> +
>> +The final action that ``domain_create()`` performs before returning
>> +successfully is to enter the new domain into the domlist.  This makes the
>> +domain "visible" within Xen, allowing the new domid to be successfully
>> +referenced by other hypercalls.
>> +
>> +At this point, the domain exists as far as Xen is concerned, but not usefully
>> +as a VM yet.  The toolstack performs further construction activities;
>> +allocating vCPUs, RAM, copying in the initial executable code, etc.  Domains
>> +are automatically created with one "pause" reference count held, meaning that
>> +it is not eligible for scheduling.
>> +
>> +When the toolstack has finished VM construction, it send an ``XS_INTRODUCE``
>> +command to ``xenstored``.  This instructs ``xenstored`` to connect to the
>> +guest's xenstore ring, and fire the ``@introduceDomain`` watch.  The firing of
>> +this watch is the signal to all other components which care that a new VM has
>> +appeared and is about to start running.
> Presumably the xenstore ring is memory shared between xenstore and the
> newly created domain. Who establishes that connection? For the case where
> xenstore lives in dom0 things are _simpler_ because it lives in the same VM
> as the toolstack, but I suspect things are hairier when xenstore is in its
> own stubdomain. A description of the grant dance (if any), would be helpful.
>
> In that same line, having mermaid sequence diagrams would make these
> descriptions easier to follow:
>
>   https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/

"how to connect to Xenstore" is the subject of a different document I
have planned.

I'll likely xlink it with this doc when it's done, but it's not
something to get mixed up in here, because it's extraordinary
complicated when all cases are considered.

>> +
>> +When the ``XS_INTRODUCE`` command returns successfully, the final action the
> Not knowing the internals I find the wording weird, though that might be my
> own misunderstanding. I imagine you mean "... when xenstore replies with
> the successful completion of the ``XS_INTRODUCE`` command...". Considering
> the "xenstore ring" mentioned before, I assume all xenstore comms are
> async.

All xenbus commands generate a reply.  Here I technically mean "the
reply from XS_INTRODUCE says success", but the libxenstore library wraps
them as blocking operations.

And now I'm staring at the code, I notice that libxl fails to check the
return value and assumes success... /sigh

>
>> +toolstack performs is to unpause the guest, using the ``DOMCTL_unpausedomain``
>> +hypercall.  This drops the "pause" reference the domain was originally created
>> +with, meaning that the vCPU(s) are eligible for scheduling and the domain will
>> +start executing its first instruction.
>> +
>> +.. note::
>> +
>> +   It is common for vCPUs other than 0 to be left in an offline state, to be
>> +   started by actions within the VM.
> Peculiar choice of words. I guess you don't want to pinch your fingers
> precluding other toolstack implementations doing something different. One
> possible way to express it is that "Conventionally, other vCPUs other than
> 0 are left in an offline state to be started by actions within the VM.
> This is non-normative, however, and custom Xen-based systems may
> choose to do otherwise."
>
> As is, it's unclear whether the unconventional behaviour is assumed to be a
> real possibility, a known existing bug, or uncertainty about the past,
> present and future.

There are some architectures which only support starting every thread of
a core at once.  (That said, I'm pretty sure OpenSBI already abstracts
this behaviour for kernels on RISC-V.)

When virtualised, we have the ability to undo that misbehaviour and give
the VM a nicer executing environment.


>
>> +
>> +Termination
>> +-----------
>> +
>> +The VM runs for a period of time, but eventually stops.  It can stop for a
>> +number of reasons, including:
>> +
>> + * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
> nit: I would 's/guest kernel/guest', but that's just me. Internally the
> kernel may very well be a passive shim where the active intelligence is in
> some disaggregated network of userspace components, making the kernel just
> an accidental proxy.

Fine.

>
>> +   hypercall.  The hypercall also includes the reason for the shutdown,
>> +   e.g. ``poweroff``, ``reboot`` or ``crash``.
>> +
>> + * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
>> +   interrupts disabled is interpreted as a shutdown request as it is a common
>> +   code pattern for fatal error handling when no better options are available.
>> +
>> + * Indirectly from fatal exceptions.  In some states, execution is unable to
>> +   continue, e.g. Triple Fault on x86.
>> +
>> + * Directly from the device model, via the ``DMOP_remote_shutdown`` hypercall.
>> +   E.g. On x86, the 0xcf9 IO port is commonly used to perform platform
>> +   poweroff, reset or sleep transitions.
>> +
>> + * Directly from the toolstack.  The toolstack is capable of initiating
>> +   cleanup directly, e.g. ``xl destroy``.  This is typically an administration
>> +   action of last resort to clean up a domain which malfunctioned but not
>> +   terminated properly.
> This one is at a different abstraction layer than the others. The hypercall(s)
> being used would be more helpful, along with a line saying that the
> toolstack makes use of this through e.g: ``xl destory``.

It is a different abstraction, but it's relevant to how a VM may
terminate, and "how to implement xl destroy" isn't.
>> +
>> + * Directly from Xen.  Some error handling ends up using ``domain_crash()``
>> +   when Xen doesn't think it can safely continue running the VM.
>> +
>> +Whatever the reason for termination, Xen ends up calling ``domain_shutdown()``
>> +to set the shutdown reason and deschedule all vCPUs.  Xen also fires the
>> +``VIRQ_DOM_EXC`` event channel, which is a signal to ``xenstored``.
>> +
>> +Upon receiving ``VIRQ_DOM_EXC``, ``xenstored`` re-scans all domains using the
>> +``SYSCTL_getdomaininfolist`` hypercall.  If any domain has changed state from
>> +running to shut down, ``xenstored`` fires the ``@releaseDomain`` watch.  The
>> +firing of this watch is the signal to all other components which care that a
>> +VM has stopped.
>> +
>> +.. note::
>> +
>> +   Xen does not treat reboot differently to poweroff; both statuses are
>> +   forwarded to the toolstack.  It is up to the toolstack to restart the VM,
>> +   which is typically done by constructing a new domain.
>> +
>> +.. note::
>> +
>> +   Some shutdowns may not result in the cleanup of a domain.  ``suspend`` for
>> +   example can be used for snapshotting, and the VM resumes execution in the
>> +   same domain/domid.  Therefore, a domain can cycle several times between
>> +   running and "shut down" before moving into the destruction phase.
>> +
>> +Destruction
>> +-----------
>> +
>> +The domain object in Xen is reference counted, and survives until all
>> +references are dropped.
> What a "reference" means might help. I'd like to think it means any
> pointer to a domain, and any domid in hypervisor memory, but...
>
>> +
>> +The ``@releaseDomain`` watch is to inform all entities that hold a reference
>> +on the domain to clean up.  This may include:
> ... this statement leads me to believe only references held by trusted
> parties are collected, and by their choice (not by force). What about pages
> granted to other domains that may not whish (or be able to) comply?

That's not a question I can reasonably answer here.  There is an
atomic_t refcount in struct domain and that's ultimately what controls
the freeing of the structure, and oustanding mappings are one source
holding a ref, but there are others too.  e.g. there's one ref held for
the domain having a non-zero memory allocation.

>
>> +
>> + * Paravirtual driver backends having a grant map of the shared ring with the
>> +   frontend.
> On a related tangent, what happens if your driver domain is compromised?
> Does it suddenly hold all your domains (and their RAM!) hostage because it
> won't act upon ``@releaseDomain``?

Xen has no support for revocable grants.  It has been an issue under
discussion for more than a decade, but nothing has been completed.

If a rogue driver domain holds your memory hostage, tough.  The overall
system can recover by destroying the driver domain; one action in
DOMCTL_destroydomain is to unmap all oustanding mapped grants, which
will allow both domains to be cleaned up.
>> + * A device model with a map of the IOREQ page(s).
>> +
>> +The toolstack also has work to do in response to ``@releaseDomain``.  It must
>> +issue the ``DOMCTL_destroydomain`` hypercall.  This hypercall can take minutes
>> +of wall-clock time to complete for large domains as, amongst other things, it
>> +is freeing the domain's RAM back to the system.
>> +
>> +The actions triggered by the ``@releaseDomain`` watch are asynchronous.  There
>> +is no guarantee as to the order in which actions start, or which action is the
>> +final one to complete.  However, the toolstack can achieve some ordering by
>> +delaying the ``DOMCTL_destroydomain`` hypercall if necessary.
>> +
>> +Freeing
>> +-------
>> +
>> +When the final reference on the domain object is dropped, Xen will remove the
> nit: 's/will remove/removes'
>> +domain from the domlist.  This means the domid is no longer visible in Xen,
>> +and no longer able to be referenced by other hypercalls.
>> +
>> +Xen then schedules the object for deletion at some point after any concurrent
>> +hypercalls referencing the domain have completed.
>> +
>> +When the object is finally cleaned up, Xen fires the ``VIRQ_DOM_EXC`` event
>> +channel again, causing ``xenstored`` to rescan an notice that the domain has
>> +ceased to exist.  It fires the ``@releaseDomain`` watch a second time to
>> +signal to any components which care that the domain has gone away.
> At which point did the grant tables drop the domid references? Are we relying
> on the goodwill of the grant destination?

No - all of that is done in the previous section.  While there are
grants of the domain's mapped, it's refcount won't drop to 0.

~Andrew
--------------5aQc9fRFwlAIle0JWFaxCdbd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17/10/2023 4:09 pm, Alejandro
      Vallejo wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">The page is pretty nice overall and I quite liked it. Just a few extra
questions below, as I'm not familiar with this side of things,

On Mon, Oct 16, 2023 at 05:24:50PM +0100, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: George Dunlap <a class="moz-txt-link-rfc2396E" href="mailto:George.Dunlap@eu.citrix.com">&lt;George.Dunlap@eu.citrix.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:wl@xen.org">&lt;wl@xen.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
CC: Henry Wang <a class="moz-txt-link-rfc2396E" href="mailto:Henry.Wang@arm.com">&lt;Henry.Wang@arm.com&gt;</a>

Rendered form:
  <a class="moz-txt-link-freetext" href="https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/domid-lifecycle.html">https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/domid-lifecycle.html</a>

I'm not sure why it's using the alibaster theme and not RTD theme, but I
don't have time to debug that further at this point.

This was written mostly while sat waiting for flights in Nanjing and Beijing.

If while reading this you spot a hole, congratulations.  There are holes which
need fixing...
---
 docs/glossary.rst                         |   9 ++
 docs/hypervisor-guide/domid-lifecycle.rst | 164 ++++++++++++++++++++++
 docs/hypervisor-guide/index.rst           |   1 +
 3 files changed, 174 insertions(+)
 create mode 100644 docs/hypervisor-guide/domid-lifecycle.rst

diff --git a/docs/glossary.rst b/docs/glossary.rst
index 8ddbdab160a1..1fd1de0f0e97 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -50,3 +50,12 @@ Glossary
 
      By default it gets all devices, including all disks and network cards, so
      is responsible for multiplexing guest I/O.
+
+   system domain
+     Abstractions within Xen that are modelled in a similar way to regular
+     :term:`domains&lt;domain&gt;`.  E.g. When there's no work to do, Xen schedules
+     ``DOMID_IDLE`` to put the CPU into a lower power state.
+
+     System domains have :term:`domids&lt;domid&gt;` and are referenced by
+     privileged software for certain control operations, but they do not run
+     guest code.
diff --git a/docs/hypervisor-guide/domid-lifecycle.rst b/docs/hypervisor-guide/domid-lifecycle.rst
new file mode 100644
index 000000000000..d405a321f3c7
--- /dev/null
+++ b/docs/hypervisor-guide/domid-lifecycle.rst
@@ -0,0 +1,164 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Lifecycle of a domid
+====================
+
+Overview
+--------
+
+A :term:`domid` is Xen's numeric identifier for a :term:`domain`.  In any
+operational Xen system, there are one or more domains running.
+
+Domids are 16-bit integers.  Regular domids start from 0, but there are some
+special identifiers, e.g. ``DOMID_SELF``, and :term:`system domains&lt;system
+domain&gt;`, e.g. ``DOMID_IDLE`` starting from 0x7ff0.  Therefore, a Xen system
+can run a maximum of 32k domains concurrently.
+
+.. note::
+
+   Despite being exposed in the domid ABI, the system domains are internal to
+   Xen and do not have lifecycles like regular domains.  Therefore, they are
+   not discussed further in this document.
+
+At system boot, Xen will construct one or more domains.  Kernels and
+configuration for these domains must be provided by the bootloader, or at
+Xen's compile time for more highly integrated solutions.
+
+Correct functioning of the domain lifecycle involves ``xenstored``, and some
+privileged entity which has bound the ``VIRQ_DOM_EXC`` global event channel.
+
+.. note::
+
+   While not a strict requirement for these to be the same entity, it is
+   ``xenstored`` which typically has ``VIRQ_DOM_EXC`` bound.  This document is
+   written assuming the common case.
+
+Creation
+--------
+
+Within Xen, the ``domain_create()`` function is used to allocate and perform
+bare minimum construction of a domain.  The :term:`control domain` accesses
+this functionality via the ``DOMCTL_createdomain`` hypercall.
+
+The final action that ``domain_create()`` performs before returning
+successfully is to enter the new domain into the domlist.  This makes the
+domain "visible" within Xen, allowing the new domid to be successfully
+referenced by other hypercalls.
+
+At this point, the domain exists as far as Xen is concerned, but not usefully
+as a VM yet.  The toolstack performs further construction activities;
+allocating vCPUs, RAM, copying in the initial executable code, etc.  Domains
+are automatically created with one "pause" reference count held, meaning that
+it is not eligible for scheduling.
+
+When the toolstack has finished VM construction, it send an ``XS_INTRODUCE``
+command to ``xenstored``.  This instructs ``xenstored`` to connect to the
+guest's xenstore ring, and fire the ``@introduceDomain`` watch.  The firing of
+this watch is the signal to all other components which care that a new VM has
+appeared and is about to start running.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Presumably the xenstore ring is memory shared between xenstore and the
newly created domain. Who establishes that connection? For the case where
xenstore lives in dom0 things are _simpler_ because it lives in the same VM
as the toolstack, but I suspect things are hairier when xenstore is in its
own stubdomain. A description of the grant dance (if any), would be helpful.

In that same line, having mermaid sequence diagrams would make these
descriptions easier to follow:

  <a class="moz-txt-link-freetext" href="https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/">https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/</a>
</pre>
    </blockquote>
    <br>
    "how to connect to Xenstore" is the subject of a different document
    I have planned.<br>
    <br>
    I'll likely xlink it with this doc when it's done, but it's not
    something to get mixed up in here, because it's extraordinary
    complicated when all cases are considered.<br>
    <br>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+When the ``XS_INTRODUCE`` command returns successfully, the final action the
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Not knowing the internals I find the wording weird, though that might be my
own misunderstanding. I imagine you mean "... when xenstore replies with
the successful completion of the ``XS_INTRODUCE`` command...". Considering
the "xenstore ring" mentioned before, I assume all xenstore comms are
async.</pre>
    </blockquote>
    <br>
    All xenbus commands generate a reply.  Here I technically mean "the
    reply from XS_INTRODUCE says success", but the libxenstore library
    wraps them as blocking operations.<br>
    <br>
    And now I'm staring at the code, I notice that libxl fails to check
    the return value and assumes success... /sigh<br>
    <br>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+toolstack performs is to unpause the guest, using the ``DOMCTL_unpausedomain``
+hypercall.  This drops the "pause" reference the domain was originally created
+with, meaning that the vCPU(s) are eligible for scheduling and the domain will
+start executing its first instruction.
+
+.. note::
+
+   It is common for vCPUs other than 0 to be left in an offline state, to be
+   started by actions within the VM.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Peculiar choice of words. I guess you don't want to pinch your fingers
precluding other toolstack implementations doing something different. One
possible way to express it is that "Conventionally, other vCPUs other than
0 are left in an offline state to be started by actions within the VM.
This is non-normative, however, and custom Xen-based systems may
choose to do otherwise."

As is, it's unclear whether the unconventional behaviour is assumed to be a
real possibility, a known existing bug, or uncertainty about the past,
present and future.</pre>
    </blockquote>
    <br>
    There are some architectures which only support starting every
    thread of a core at once.  (That said, I'm pretty sure OpenSBI
    already abstracts this behaviour for kernels on RISC-V.)<br>
    <br>
    When virtualised, we have the ability to undo that misbehaviour and
    give the VM a nicer executing environment.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+Termination
+-----------
+
+The VM runs for a period of time, but eventually stops.  It can stop for a
+number of reasons, including:
+
+ * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">nit: I would 's/guest kernel/guest', but that's just me. Internally the
kernel may very well be a passive shim where the active intelligence is in
some disaggregated network of userspace components, making the kernel just
an accidental proxy.</pre>
    </blockquote>
    <br>
    Fine.<br>
    <br>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+   hypercall.  The hypercall also includes the reason for the shutdown,
+   e.g. ``poweroff``, ``reboot`` or ``crash``.
+
+ * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
+   interrupts disabled is interpreted as a shutdown request as it is a common
+   code pattern for fatal error handling when no better options are available.
+
+ * Indirectly from fatal exceptions.  In some states, execution is unable to
+   continue, e.g. Triple Fault on x86.
+
+ * Directly from the device model, via the ``DMOP_remote_shutdown`` hypercall.
+   E.g. On x86, the 0xcf9 IO port is commonly used to perform platform
+   poweroff, reset or sleep transitions.
+
+ * Directly from the toolstack.  The toolstack is capable of initiating
+   cleanup directly, e.g. ``xl destroy``.  This is typically an administration
+   action of last resort to clean up a domain which malfunctioned but not
+   terminated properly.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This one is at a different abstraction layer than the others. The hypercall(s)
being used would be more helpful, along with a line saying that the
toolstack makes use of this through e.g: ``xl destory``.</pre>
    </blockquote>
    <br>
    It is a different abstraction, but it's relevant to how a VM may
    terminate, and "how to implement xl destroy" isn't.<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+ * Directly from Xen.  Some error handling ends up using ``domain_crash()``
+   when Xen doesn't think it can safely continue running the VM.
+
+Whatever the reason for termination, Xen ends up calling ``domain_shutdown()``
+to set the shutdown reason and deschedule all vCPUs.  Xen also fires the
+``VIRQ_DOM_EXC`` event channel, which is a signal to ``xenstored``.
+
+Upon receiving ``VIRQ_DOM_EXC``, ``xenstored`` re-scans all domains using the
+``SYSCTL_getdomaininfolist`` hypercall.  If any domain has changed state from
+running to shut down, ``xenstored`` fires the ``@releaseDomain`` watch.  The
+firing of this watch is the signal to all other components which care that a
+VM has stopped.
+
+.. note::
+
+   Xen does not treat reboot differently to poweroff; both statuses are
+   forwarded to the toolstack.  It is up to the toolstack to restart the VM,
+   which is typically done by constructing a new domain.
+
+.. note::
+
+   Some shutdowns may not result in the cleanup of a domain.  ``suspend`` for
+   example can be used for snapshotting, and the VM resumes execution in the
+   same domain/domid.  Therefore, a domain can cycle several times between
+   running and "shut down" before moving into the destruction phase.
+
+Destruction
+-----------
+
+The domain object in Xen is reference counted, and survives until all
+references are dropped.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">What a "reference" means might help. I'd like to think it means any
pointer to a domain, and any domid in hypervisor memory, but...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+The ``@releaseDomain`` watch is to inform all entities that hold a reference
+on the domain to clean up.  This may include:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">... this statement leads me to believe only references held by trusted
parties are collected, and by their choice (not by force). What about pages
granted to other domains that may not whish (or be able to) comply?</pre>
    </blockquote>
    <br>
    That's not a question I can reasonably answer here.  There is an
    atomic_t refcount in struct domain and that's ultimately what
    controls the freeing of the structure, and oustanding mappings are
    one source holding a ref, but there are others too.  e.g. there's
    one ref held for the domain having a non-zero memory allocation.<br>
    <br>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+ * Paravirtual driver backends having a grant map of the shared ring with the
+   frontend.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">On a related tangent, what happens if your driver domain is compromised?
Does it suddenly hold all your domains (and their RAM!) hostage because it
won't act upon ``@releaseDomain``?</pre>
    </blockquote>
    <br>
    Xen has no support for revocable grants.  It has been an issue under
    discussion for more than a decade, but nothing has been completed.<br>
    <br>
    If a rogue driver domain holds your memory hostage, tough.  The
    overall system can recover by destroying the driver domain; one
    action in DOMCTL_destroydomain is to unmap all oustanding mapped
    grants, which will allow both domains to be cleaned up.<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:652ea390.170a0220.fc514.3c38@mx.google.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * A device model with a map of the IOREQ page(s).
+
+The toolstack also has work to do in response to ``@releaseDomain``.  It must
+issue the ``DOMCTL_destroydomain`` hypercall.  This hypercall can take minutes
+of wall-clock time to complete for large domains as, amongst other things, it
+is freeing the domain's RAM back to the system.
+
+The actions triggered by the ``@releaseDomain`` watch are asynchronous.  There
+is no guarantee as to the order in which actions start, or which action is the
+final one to complete.  However, the toolstack can achieve some ordering by
+delaying the ``DOMCTL_destroydomain`` hypercall if necessary.
+
+Freeing
+-------
+
+When the final reference on the domain object is dropped, Xen will remove the
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">nit: 's/will remove/removes'
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+domain from the domlist.  This means the domid is no longer visible in Xen,
+and no longer able to be referenced by other hypercalls.
+
+Xen then schedules the object for deletion at some point after any concurrent
+hypercalls referencing the domain have completed.
+
+When the object is finally cleaned up, Xen fires the ``VIRQ_DOM_EXC`` event
+channel again, causing ``xenstored`` to rescan an notice that the domain has
+ceased to exist.  It fires the ``@releaseDomain`` watch a second time to
+signal to any components which care that the domain has gone away.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">At which point did the grant tables drop the domid references? Are we relying
on the goodwill of the grant destination?</pre>
    </blockquote>
    <br>
    No - all of that is done in the previous section.  While there are
    grants of the domain's mapped, it's refcount won't drop to 0.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------5aQc9fRFwlAIle0JWFaxCdbd--

