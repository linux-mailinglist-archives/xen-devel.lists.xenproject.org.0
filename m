Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDX/MWnRwmnRmQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:01:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD731A6DC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261224.1554310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5634-0001p7-T9; Tue, 24 Mar 2026 18:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261224.1554310; Tue, 24 Mar 2026 18:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5634-0001nK-QR; Tue, 24 Mar 2026 18:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1261224;
 Tue, 24 Mar 2026 18:00:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c2d129.v1-0b4b279376b94a448135603ca331192e@bounce.vates.tech>)
 id 1w5632-0001nE-Sf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:00:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5631-00BcEG-Kb
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:00:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c2d129.v1-0b4b279376b94a448135603ca331192e@bounce.vates.tech>)
 id 69c2d124-bab6-0a2a0a5309dd-0a2a4505bf60-20
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:00:11 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c2d129.v1-0b4b279376b94a448135603ca331192e@bounce.vates.tech>)
 id 69c2d12a-5aeb-0a2a45050019-c602b42fe45f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:00:11 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fgHr94mczzPm0wVT
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:00:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0b4b279376b94a448135603ca331192e; Tue, 24 Mar 2026 18:00:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774375209; x=1774645209;
	bh=5UEBEVoFw//9avZMtrqgrtr3/YITnllGPjBvoyHdWeI=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hLkiZOrDG9As5kyfosM0F1LL4DLWqr05QUIfHVTq8Myv2hQXII2jiy99OvOc1WCPv
	 QqaLKxs7iYNRH4uPL75Wb8JH9Kcg7dPpc1iaKqvb4wErHvzZacPkkIlVDq+skt1EQh
	 +otb+nU1Dt7Lifmt0owdYci3gEp8TvTYBYdyt8ArUzwLx5EysvT3cGHzSY2WduTVtN
	 r9MMs+AjHJaOYcAYUIllu/bR3Oa2Sia9INQiablRIFZx8CqWZt5SbNjNvzfciTCLSx
	 gvmhijR4bDn8icFoXrRDMaVT8UobdWIoUTtxJSuZ3rmYq8JC++xOyARPrjYHmuHvLw
	 SnlnrfMLBYmYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774375209; x=1774635709; i=teddy.astie@vates.tech;
	bh=5UEBEVoFw//9avZMtrqgrtr3/YITnllGPjBvoyHdWeI=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mOxAh5Q0RqZ5wMwrHUAf8WnRtJMVLgV9KqPfzeMArXJd9d87rdL35NHv9lELwLT4s
	 9Do6WCwyzd4Flvb4yIXwmo4bLVkD5eUhqvIWCKMhleEaa8Tetofoy7XVzJUi45MOwa
	 8xHqsLWvAsjhnyK/zTZsd3D8YgO7/5oGXXAxOf1a8xoRkNVJw3LVbE/l5PaBSynn5d
	 r50zdJdTFt0Jqo5MBZ9ZApgcdibbPXsj/Vz5tNzoopXLKlngH1XsEyQ9hu0/USFLYl
	 /WXV/bv59ZNwmScTs39pEbkGCW5rIcO3hHQ2tCO8tHt3ZPv/JVI4bMNdoQPsWONUzd
	 VHPmA27VnUSpw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Mapping=20non-pinned=20memory=20from=20one=20Xen=20domain=20into=20another?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774375206965
Message-Id: <5123c11c-3b8a-4633-809f-16c24418a4ce@vates.tech>
To: "Demi Marie Obenour" <demiobenour@gmail.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, "Jan Beulich" <jbeulich@suse.com>, "Val Packett" <val@invisiblethingslab.com>, "Ariadne Conill" <ariadne@ariadne.space>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Juergen Gross" <jgross@suse.com>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
In-Reply-To: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0b4b279376b94a448135603ca331192e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260324:md
Date: Tue, 24 Mar 2026 18:00:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1774375211-22A87488-3D2CCEE8/0/0
X-purgate-type: clean
X-purgate-size: 11259
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org,lists.freedesktop.org,kvack.org,suse.com,invisiblethingslab.com,ariadne.space,citrix.com];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:jbeulich@suse.com,m:val@invisiblethingslab.com,m:ariadne@ariadne.space,m:andrew.cooper3@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:url];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.272];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 92FD731A6DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I assume all this only concerns HVM/PVH DomU, I don't think it is doable 
for PV DomU (if that matters).

Le 24/03/2026 =C3=A0 15:17, Demi Marie Obenour a =C3=A9crit=C2=A0:
> Here is a proposed design document for supporting mapping GPU VRAM
> and/or file-backed memory into other domains.  It's not in the form of
> a patch because the leading + characters would just make it harder to
> read for no particular gain, and because this is still RFC right now.
> Once it is ready to merge, I'll send a proper patch.  Nevertheless,
> you can consider this to be
> 
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> 
> This approach is very different from the "frontend-allocates"
> approach used elsewhere in Xen.  It is very much Linux-centric,
> rather than Xen-centric.  In fact, MMU notifiers were invented for
> KVM, and this approach is exactly the same as the one KVM implements.
> However, to the best of my understanding, the design described here is
> the only viable one.  Linux MM and GPU drivers require it, and changes
> to either to relax this requirement will not be accepted upstream.
> ---
> # Memory lending: Mapping pageable memory, such as GPU VRAM, from one Xen=
 domain into another
> 
> ## Background
> 
> Some Linux kernel subsystems require full control over certain memory
> regions.  This includes the ability to handle page faults from any
> entity accessing this memory.  Such entities include not only that
> kernel's userspace, but also kernels belonging to other guests.
> 
> For instance, GPU drivers reserve the right to migrate data between
> VRAM and system RAM at any time.  Furthermore, there is a set of
> page tables between the "aperture" (mapped as a PCI BAR) and the
> actual VRAM.  This means that the GPU driver can make the memory
> temporarily inaccessible to the CPU.  This is in fact _required_
> when resizable BAR is not supported, as otherwise there is too much
> VRAM to expose it all via a single BAR.
> 
> Since the backing storage of this memory must be movable, pinning
> it is not supported.  However, the existing grant table interface
> requires pinned memory.  Therefore, such memory currently cannot be
> shared with another guest.  As a result, implementing virtio-GPU blob
> objects is not possible.  Since blob objects are a prerequisite for
> both Venus and native contexts, supporting Vulkan via virtio-GPU on
> Xen is also impossible.
> 

I'm not sure Vulkan fully allow memory to be moved between RAM and VRAM. 
Or at least, you would need to lie a bit on the 
VK_MEMORY_HEAP_DEVICE_LOCAL_BIT property.

So I assume there is a way to choose between having memory as VRAM or as 
RAM somehow, unless it is only a hint ?

> Direct Access to Differentiated Memory (DAX) also relies on non-pinned
> memory.  In the (now rare) case of persistent memory, it is because
> the filesystem may need to move data blocks around on disk.  In the
> case of virtio-pmem and virtio-fs, it is because page faults on write
> operations are used to inform filesystems that they need to write the
> data back at some point.  Without these page faults, filesystems will
> not write back the data and silent data loss will result.
> 
> There are other use-cases for this too.  For instance, virtio-GPU
> cross-domain Wayland exposes host shared memory buffers to the guest.
> These buffers are mmap()'d file descriptors provided by the Wayland
> compositor, and as such are not guaranteed to be anonymous memory.
> Using grant tables for such mappings would conflict with the design
> of existing virtio-GPU implementations, which assume that GPU VRAM
> and shared memory can be handled uniformly.
> 
> Additionally, this is needed to support paging guest memory out to the
> host's disks.  While this is significantly less efficient than using
> an in-guest balloon driver, it has the advantage of not requiring
> guest cooperation.  Therefore, it can be useful for situations in
> which the performance of a guest is irrelevant, but where saving the
> guest isn't appropriate.
> 
> ## Informing drivers that they must stop using memory: MMU notifiers
> 
> Kernel drivers, such as xen_privcmd, in the same domain that has
> the GPU (the "host") may map GPU memory buffers.  However, they must
> register an *MMU notifier*.  This is a callback that Linux core memory
> management code ("MM") uses to tell the driver that it must stop
> all accesses to the memory.  Once the memory is no longer accessed,
> Linux assumes it can do whatever it wants with this memory:
> 
> - The GPU driver can move it from VRAM to system RAM or visa versa,
>   move it within VRAM or system RAM, or it temporarily inaccessible
>   so that other VRAM can be accessed.
> - MM can swap the page out to disk/zram/etc.
> - MM can move the page in system RAM to create huge pages.
> - MM can write the pages out to their backing files and then free them.
> - Anything else in Linux can do whatever it wants with the memory.
> 
> Suspending access to memory is not allowed to block indefinitely.
> It can sleep, but it must finish in finite time regardless of what
> userspace (or other VMs) do.  Otherwise, bad things (which I believe
> includes deadlocks) may result.  I believe it can fail temporarily,
> but permanent failure is also not allowed.  Once the MMU notifier
> has succeeded, userspace or other domains **must not be allowed to
> access the memory**.  This would be an exploitable use-after-free
> vulnerability.
> 
> Due to these requirements, MMU notifier callbacks must not require
> cooperation from other guests.  This means that they are not allowed to
> wait for memory that has been granted to another guest to no longer
> be mapped by that guest.  Therefore, MMU notifiers and the use of
> grant tables are inherently incompatible.


> 
> ## Memory lending: A different approach
> 
> Instead, xen_privcmd must use a different hypercall to _lend_ memory to
> another domain (the "guest").  When MM triggers the guest MMU notifier,
> xen_privcmd _tells_ Xen (via hypercall) to revoke the guest's access
> to the memory.  This hypercall _must succeed in bounded time_ even
> if the guest is malicious.
> 
> Since the other guests are not aware this has happened, they will
> continue to access the memory.  This will cause p2m faults, which
> trap to Xen.  Xen normally kills the guest in this situation which is
> obviously not desired behavior.  Instead, Xen must pause the guest
> and inform the host's kernel.  xen_privcmd will have registered a
> handler for such events, so it will be informed when this happens.
> 
> When xen_privcmd is told that a guest wants to access the revoked
> page, it will ask core MM to make the page available.  Once the page
> _is_ available, core MM will inform xen_privcmd, which will in turn
> provide a page to Xen that will be mapped into the guest's stage 2
> translation tables.  This page will generally be different than the
> one that was originally lent.
> 
> Requesting a new page can fail.  This is usually due to rare errors,
> such as a GPU being hot-unplugged or an I/O error faulting pages
> from disk.  In these cases, the old content of the page is lost.
> 
> When this happens, xen_privcmd can do one of two things:
> 
> 1. It can provide a page that is filled with zeros.
> 2. It can tell Xen that it is unable to fulfill the request.
> 
> Which choice it makes is under userspace control.  If userspace
> chooses the second option, Xen injects a fault into the guest.
> It is up to the guest to handle the fault correctly.
> 
Is it some ioreq-like mechanism where :
- A guest access a "non-ready" page
- Nothing there -> pagefault (e.g NPF) and guest vCPU is blocked
- Xen asks Dom0 what to do (event channel, VIRQ, ...)
- Dom0 explicitly maps memory to the guest (or do any other operation)
- Guest resumes execution with the page mapped

Something that looks a bit similar to "memory paging".

> ## Restrictions on lent memory
> 
> Lent memory is still considered to belong to the lending domain.
> The borrowing domain can only access it via its p2m.  Hypercalls made
> by the borrowing domain act as if the borrowed memory was not present.
> This includes, but is not limited to:
> 
> - Using pointers to borrowed memory in hypercall arguments.
> - Granting borrowed memory to other VMs.
> - Any other operation that depends on whether a page is accessible
>    by a domain.

What about emulated instructions that refers to this memory ?

> 
> Furthermore:
> 
> - Borrowed memory isn't mapped into the IOMMU of any PCIe devices
>    the guest has attached, because IOTLB faults generally are not
>    replayable.
> 

Given that (as written bellow) Borrowed memory is a part of some form of 
emulated BAR or special region, there is no guarantee that DMA will work 
properly anyway (unless P2P DMA support is advertised).

Splitting the IOMMU side from the P2M is not a good idea as it rules out 
the "IOMMU HAP PT Share" optimization.

> - Foreign mapping hypercalls that reference lent memory will fail.
>    Otherwise, the domain making the foreign mapping hypercall could
>    continue to access the borrowed memory after the lease had been
>    revoked.  This is true even if the domain performing the foreign
>    mapping is an all-powerful dom0.  Otherwise, an emulated device
>    could access memory whose lease had been revoked.
> 
> This also means that live migration of a domain that has borrowed
> memory requires cooperation from the lending domain.  For now, it
> will be considered out of scope.  Live migration is typically used
> with server workloads, and accelerators for server hardware often
> support SR-IOV.
> 
> ## Where will lent memory appear in a guest's address space?
> 
> Typically, lent memory will be an emulated PCI BAR.  It may be emulated
> by dom0 or an alternate ioreq server.  However, it is not *required*
> to be a PCI BAR.
> 

---

While the design could work (albeit the implied complexity), I'm not a 
big fan of it, or at least, it needs to consider some constraints for 
having reasonable performance.
One of the big issue is that a performance-sensitive system (virtualized 
GPU) is interlocking with several "hard to optimize" subsystem like P2M 
or Dom0 having to process a paging event.

Modifying the P2M (especially removing entries) is a fairly expensive 
operation as it sometimes requires pausing all the vCPUs each time it's 
done.

If it's done at 4k granularity, it would also lack superpage support, 
which wouldn't help either. (doing things at the 2M+ scale would help, 
but I don't know enough how MMU notifier does things.

While I agree that grants is not a adequate mechanism for this (for 
multiples reasons), I'm not fully convinced of the proposal.
I would prefer a strategy where we map a fixed amount of RAM+VRAM as a 
blob, along with some form of cooperative hotplug mechanism to 
dynamically provision the amount.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



