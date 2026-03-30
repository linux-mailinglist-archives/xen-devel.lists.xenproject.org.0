Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LgwCSFpymnG8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:14:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9335ADFE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267525.1556997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BVG-0006df-OV; Mon, 30 Mar 2026 12:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267525.1556997; Mon, 30 Mar 2026 12:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BVG-0006bY-La; Mon, 30 Mar 2026 12:13:58 +0000
Received: by outflank-mailman (input) for mailman id 1267525;
 Mon, 30 Mar 2026 12:13:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ca6902.v1-42acbbf6014e4024bb2f48564484fbd8@bounce.vates.tech>)
 id 1w7BVE-0006bS-W4
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:13:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BVE-003vEH-Bf
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:13:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ca6902.v1-42acbbf6014e4024bb2f48564484fbd8@bounce.vates.tech>)
 id 69ca68fb-bab6-0a2a0a5309dd-0a2a4508b11c-42
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:13:56 +0200
Received: from [198.2.179.37] (helo=mail179-37.suw41.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69ca6902.v1-42acbbf6014e4024bb2f48564484fbd8@bounce.vates.tech>)
 id 69ca6902-1950-0a2a45080019-c602b325dd49-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:13:55 +0200
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4fkqst4cJXzG0CBMd
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 12:13:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 42acbbf6014e4024bb2f48564484fbd8; Mon, 30 Mar 2026 12:13:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774872834; x=1775142834;
	bh=8/UEoCpZgSsa/b7GuIF8NEs0PMrAel8kk9xZN9ljZb4=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RSV7sX3WkfWGHnsfyQghtG8deP1aTV1h9tcowxjf/4kdRwGvFCNyiNNBOq1XQlwRT
	 Gp+8lqEcpcYn4Eyy/GVpTJtHjDLnGmfYkRafyXnInywCazCCQ+mwNIWGKiBACdsUlx
	 tP7h6LjCy4UP8EOKnGqRL1oej9eeUw3OgdN/p2KQc2dP5azlnNQ5Q5A+hDrbxG1AOj
	 3WZsYJ8LyfweLDncqqJ1kepSuMI/snqj2D7mD1QxkfJhViyHkEgApKN+RryitqtXu3
	 dnnw2m9Jeo9iH4I62zdVxYj70UEWPvLJ7fDr0wCnUkF8jR4CKiPdAuvvsVXWNdOb2V
	 XTtKfch6Tt+Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774872834; x=1775133334; i=teddy.astie@vates.tech;
	bh=8/UEoCpZgSsa/b7GuIF8NEs0PMrAel8kk9xZN9ljZb4=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FjfHojRPHKxVbVOirgIkXCEiz3LY3QjJRReQeqIf7oU0QS3mAaQeIGjS4pHxeqApm
	 Xd+OZorH7atLW/vSfNqZEhGlC71mEy/v4h+7Gr4TkT+fwKUKsZvFaJc+2etaLlTkjY
	 JEvaj/sPe+qYBCmVXaVUlqJRrBc1WlUdttYQNvlDKVj+FfMvDdDMAED7cSF9QKGnTf
	 KZwaHjbUxWTK/rLKIYE3Ifb4GFIdKic/5DIUqCNqy569dbOFjHplrvLcKPLlHHSYIx
	 1hDS1quLmMHiJ0az4t14q7R++yc61vt7b9v0VICMtxPsaqmqncC/UtzgxmLc2ZgpuD
	 xZLrOlnuCxDGA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Mapping=20non-pinned=20memory=20from=20one=20Xen=20domain=20into=20another?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774872833084
Message-Id: <bd136f57-3d16-482a-9014-be44183bc86f@vates.tech>
To: "Demi Marie Obenour" <demiobenour@gmail.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, "Val Packett" <val@invisiblethingslab.com>, "Ariadne Conill" <ariadne@ariadne.space>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
Cc: "Xen developer discussion" <xen-devel@lists.xenproject.org>
In-Reply-To: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.42acbbf6014e4024bb2f48564484fbd8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260330:md
Date: Mon, 30 Mar 2026 12:13:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1774872836-F0E1B726-9ACFCCC3/0/0
X-purgate-type: clean
X-purgate-size: 10061
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:val@invisiblethingslab.com,m:ariadne@ariadne.space,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,kvack.org,invisiblethingslab.com,ariadne.space];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_SPAM(0.00)[1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 78C9335ADFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(back to the original problem)

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

(...)

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
>    move it within VRAM or system RAM, or it temporarily inaccessible
>    so that other VRAM can be accessed.
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

To me there are multiples problems :
- mapping a host-owned page into the guest
- make such mapping "non-persistent", i.e letting Linux discard it
- tracking guest access to such "non-existent mappings" (to remap it)

All problems could be mixed into a single solution, but I don't think 
it's a good idea, that means various kind of MM events for Linux could 
originate from Xen. There is also the "process disappeared" situation 
that could cause of lof of problems for the kernel. In KVM, the guest 
existence is tied to the process by construction but with Xen, things 
are different.
But I think at least for the virtio-gpu use-case, these can be separated.

Here is a approach (multiples parties) :

The first 2 problems can be solved in a "simple" way, just make a 
"reverse foreign map" with a MMU notifier attached to it. If Linux wants 
to discard the mapping, the remote mapping in the guest is unmapped.
(something still needs to be done for doing that for VRAM)

The 3rd one is a bit trickier. It's mostly a result of the 2nd problem 
e.g swap or RAM/VRAM migration. The page has disappeared in the guest. 
That could be dealt with a slightly modified ioreq server, but instead 
of responding to read/writes, it would just act on "accesses" (it's 
mostly to avoid having to emulate the read/writes in the device model).

So overall, pages are mapped but "may disappears" (by kernel) and device 
model (e.g QEMU) would need to remap them explicitly if that happens and 
guest needs it.

What do you think ?

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
> 
> Furthermore:
> 
> - Borrowed memory isn't mapped into the IOMMU of any PCIe devices
>    the guest has attached, because IOTLB faults generally are not
>    replayable.
> 
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
> ## Privileges required for memory lending
> 
> For obvious reasons, the domain lending the memory must be privileged
> over the domain borrowing it.  The lending domain does not inherently
> need to be privileged over the whole system.  However, supporting
> situations where the providing domain is not dom0 will require
> extensions to Xen's permission model, except for the case where the
> providing domain only serves a single VM.
> 
> Memory lending hypercalls are not subject to the restrictions of
> XSA-77.  They may safely be delegated to VMs other than dom0.
> 
> ## Userspace API
> 
> To the extent possible, the memory lending API should be similar
> to KVM's uAPI.  Ideally, userspace should be able to abstract over
> the differences.  Using the API should not require root privileges
> or be equivalent to root on the host.  It should only require a file
> descriptor that only allows controlling a single domain.
> 
> ## Future directions: Creating & running Xen VMs without special privileg=
es
> 
> With the exception of a single page used for hypercalls, it is
> possible for a Xen domain to *only* have borrowed memory.  Such a
> domain can be managed by an entirely unprivileged userspace process,
> just like it would manage a KVM VM.  Since the "host" in this scenario
> only needs privilege over a domain it itself created, it is possible
> (once a subset of XSA-77 restrictions are lifted) for this domain
> to not actually be dom0.
> 
> Even with XSA-77, the domain could still request dom0 to create and
> destroy the domain on its behalf.  Qubes OS already allows unprivileged
> guests to cause domain creation and destruction, so this does not
> introduce any new Xen attack surface.
> 
> This could allow unprivileged processes in a domU to create and manage
> sub-domUs, just as if the domU had nested virtualization support and
> KVM was used.  However, this should provide significantly better
> performance than nested virtualization.



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



