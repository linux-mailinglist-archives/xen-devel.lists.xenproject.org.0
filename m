Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D63762AD
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 11:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123889.233746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewcg-0003qX-Ei; Fri, 07 May 2021 09:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123889.233746; Fri, 07 May 2021 09:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewcg-0003of-Aq; Fri, 07 May 2021 09:18:14 +0000
Received: by outflank-mailman (input) for mailman id 123889;
 Fri, 07 May 2021 09:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lewcf-0003oX-Kr
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:18:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lewcc-0003n8-U3; Fri, 07 May 2021 09:18:10 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lewcc-0007Je-HL; Fri, 07 May 2021 09:18:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=R7SEY595wkS8fOnvg/gOY/3rkZgF5EuFwck16pzVcAU=; b=5Ds4XHo+4MIYbDq5Xmle4RxQnB
	8AWH8EL+uhh/NhCP5mvMg4avIWEeBIDx67u0b3WLq5ZRJ7fnQbo6D33LUfg2rYEnV3WJomd/1F+WC
	ZFL9gCt5Htm6bNb9+mzvky0+bIRGawuOZKPuHjiqEqP6OsGO+y3SHVhHGmJrR/vyXUSs=;
Message-ID: <288e5af69a356060b9fce6c6fa77324950dac2c2.camel@xen.org>
Subject: Re: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
From: Hongyan Xia <hx242@xen.org>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org, paul@xen.org, raphning@amazon.com,
 maghul@amazon.com,  Julien Grall <jgrall@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Fri, 07 May 2021 10:18:06 +0100
In-Reply-To: <20210506104259.16928-2-julien@xen.org>
References: <20210506104259.16928-1-julien@xen.org>
	 <20210506104259.16928-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-06 at 11:42 +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Administrators often require updating the Xen hypervisor to address
> security vulnerabilities, introduce new features, or fix software
> defects.
> Currently, we offer the following methods to perform the update:
> 
>     * Rebooting the guests and the host: this is highly disrupting to
> running
>       guests.
>     * Migrating off the guests, rebooting the host: this currently
> requires
>       the guest to cooperate (see [1] for a non-cooperative solution)
> and it
>       may not always be possible to migrate it off (i.e lack of
> capacity, use
>       of local storage...).
>     * Live patching: This is the less disruptive of the existing
> methods.
>       However, it can be difficult to prepare the livepatch if the
> change is
>       large or there are data structures to update.

Might want to mention that live patching slowly consumes memory and
fragments the Xen image and degrades performance (especially when the
patched code is on the critical path).

> 
> This patch will introduce a new proposal called "Live Update" which
> will
> activate new software without noticeable downtime (i.e no - or
> minimal -
> customer).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  docs/designs/liveupdate.md | 254
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 254 insertions(+)
>  create mode 100644 docs/designs/liveupdate.md
> 
> diff --git a/docs/designs/liveupdate.md b/docs/designs/liveupdate.md
> new file mode 100644
> index 000000000000..32993934f4fe
> --- /dev/null
> +++ b/docs/designs/liveupdate.md
> @@ -0,0 +1,254 @@
> +# Live Updating Xen
> +
> +## Background
> +
> +Administrators often require updating the Xen hypervisor to address
> security
> +vulnerabilities, introduce new features, or fix software
> defects.  Currently,
> +we offer the following methods to perform the update:
> +
> +    * Rebooting the guests and the host: this is highly disrupting
> to running
> +      guests.
> +    * Migrating off the guests, rebooting the host: this currently
> requires
> +      the guest to cooperate (see [1] for a non-cooperative
> solution) and it
> +      may not always be possible to migrate it off (i.e lack of
> capacity, use
> +      of local storage...).
> +    * Live patching: This is the less disruptive of the existing
> methods.
> +      However, it can be difficult to prepare the livepatch if the
> change is
> +      large or there are data structures to update.
> +
> +This document will present a new approach called "Live Update" which
> will
> +activate new software without noticeable downtime (i.e no - or
> minimal -
> +customer pain).
> +
> +## Terminology
> +
> +xen#1: Xen version currently active and running on a droplet.  This
> is the
> +“source” for the Live Update operation.  This version can actually
> be newer
> +than xen#2 in case of a rollback operation.
> +
> +xen#2: Xen version that's the “target” of the Live Update operation.
> This
> +version will become the active version after successful Live
> Update.  This
> +version of Xen can actually be older than xen#1 in case of a
> rollback
> +operation.

A bit redundant since it was mentioned in Xen 1 already.

> +
> +## High-level overview
> +
> +Xen has a framework to bring a new image of the Xen hypervisor in
> memory using
> +kexec.  The existing framework does not meet the baseline
> functionality for
> +Live Update, since kexec results in a restart for the hypervisor,
> host, Dom0,
> +and all the guests.
> +
> +The operation can be divided in roughly 4 parts:
> +
> +    1. Trigger: The operation will by triggered from outside the
> hypervisor
> +       (e.g. dom0 userspace).
> +    2. Save: The state will be stabilized by pausing the domains and
> +       serialized by xen#1.
> +    3. Hand-over: xen#1 will pass the serialized state and transfer
> control to
> +       xen#2.
> +    4. Restore: The state will be deserialized by xen#2.
> +
> +All the domains will be paused before xen#1 is starting to save the
> states,
> +and any domain that was running before Live Update will be unpaused
> after
> +xen#2 has finished to restore the states.  This is to prevent a
> domain to try
> +to modify the state of another domain while it is being
> saved/restored.
> +
> +The current approach could be seen as non-cooperative migration with
> a twist:
> +all the domains (including dom0) are not expected be involved in the
> Live
> +Update process.
> +
> +The major differences compare to live migration are:
> +
> +    * The state is not transferred to another host, but instead
> locally to
> +      xen#2.
> +    * The memory content or device state (for passthrough) does not
> need to
> +      be part of the stream. Instead we need to preserve it.
> +    * PV backends, device emulators, xenstored are not recreated but
> preserved
> +      (as these are part of dom0).
> +
> +
> +Domains in process of being destroyed (*XEN\_DOMCTL\_destroydomain*)
> will need
> +to be preserved because another entity may have mappings (e.g
> foreign, grant)
> +on them.
> +
> +## Trigger
> +
> +Live update is built on top of the kexec interface to prepare the
> command line,
> +load xen#2 and trigger the operation.  A new kexec type has been
> introduced
> +(*KEXEC\_TYPE\_LIVE\_UPDATE*) to notify Xen to Live Update.
> +
> +The Live Update will be triggered from outside the hypervisor (e.g.
> dom0
> +userspace).  Support for the operation has been added in kexec-tools 
> 2.0.21.
> +
> +All the domains will be paused before xen#1 is starting to save the
> states.
> +In Xen, *domain\_pause()* will pause the vCPUs as soon as they can
> be re-
> +scheduled.  In other words, a pause request will not wait for
> asynchronous
> +requests (e.g. I/O) to finish.  For Live Update, this is not an
> ideal time to
> +pause because it will require more xen#1 internal state to be
> transferred.
> +Therefore, all the domains will be paused at an architectural
> restartable
> +boundary.
> +
> +Live update will not happen synchronously to the request but when
> all the
> +domains are quiescent.  As domains running device emulators (e.g
> Dom0) will
> +be part of the process to quiesce HVM domains, we will need to let
> them run
> +until xen#1 is actually starting to save the state.  HVM vCPUs will
> be paused
> +as soon as any pending asynchronous request has finished.
> +
> +In the current implementation, all PV domains will continue to run
> while the
> +rest will be paused as soon as possible.  Note this approach is
> assuming that
> +device emulators are only running in PV domains.
> +
> +It should be easy to extend to PVH domains not requiring device
> emulations.
> +It will require more thought if we need to run device models in HVM
> domains as
> +there might be inter-dependency.
> +
> +## Save
> +
> +xen#1 will be responsible to preserve and serialize the state of
> each existing
> +domain and any system-wide state (e.g M2P).
> +
> +Each domain will be serialized independently using a modified
> migration stream,
> +if there is any dependency between domains (such as for IOREQ
> server) they will
> +be recorded using a domid. All the complexity of resolving the
> dependencies are
> +left to the restore path in xen#2 (more in the *Restore* section).
> +
> +At the moment, the domains are saved one by one in a single thread,
> but it
> +would be possible to consider multi-threading if it takes too long.
> Although
> +this may require some adjustment in the stream format.
> +
> +As we want to be able to Live Update between major versions of Xen
> (e.g Xen
> +4.11 -> Xen 4.15), the states preserved should not be a dump of Xen
> internal
> +structure but instead the minimal information that allow us to
> recreate the
> +domains.
> +
> +For instance, we don't want to preserve the frametable (and
> therefore
> +*struct page\_info*) as-is because the refcounting may be different
> across
> +between xen#1 and xen#2 (see XSA-299). Instead, we want to be able
> to recreate
> +*struct page\_info* based on minimal information that are considered
> stable
> +(such as the page type).
> +
> +Note that upgrading between version of Xen will also require all the
> hypercalls
> +to be stable. This will not be covered by this document.
> +
> +## Hand over
> +
> +### Memory usage restrictions
> +
> +xen#2 must take care not to use any memory pages which already
> belong to
> +guests.  To facilitate this, a number of contiguous region of memory
> are
> +reserved for the boot allocator, known as *live update bootmem*.
> +
> +xen#1 will always reserve a region just below Xen (the size is
> controlled by
> +the Xen command line parameter liveupdate) to allow Xen growing and
> provide
> +information about LiveUpdate (see the section *Breadcrumb*).  The
> region will be
> +passed to xen#2 using the same command line option but with the base
> address
> +specified.

The size of the command line option may not be the same depending on
the size of Xen #2.

> +
> +For simplicity, additional regions will be provided in the
> stream.  They will
> +consist of region that could be re-used by xen#2 during boot (such
> as the
> +xen#1's frametable memory).
> +
> +xen#2 must not use any pages outside those regions until it has
> consumed the
> +Live Update data stream and determined which pages are already in
> use by
> +running domains or need to be re-used as-is by Xen (e.g M2P).
> +
> +At run time, Xen may use memory from the reserved region for any
> purpose that
> +does not require preservation over a Live Update; in particular it
> __must__ not be
> +mapped to a domain or used by any Xen state requiring to be
> preserved (e.g
> +M2P).  In other word, the xenheap pages could be allocated from the
> reserved
> +regions if we remove the concept of shared xenheap pages.
> +
> +The xen#2's binary may be bigger (or smaller) compare to xen#1's
> binary.  So
> +for the purpose of loading xen#2 binary, kexec should treat the
> reserved memory
> +right below xen#1 and its region as a single contiguous space. xen#2
> will be
> +loaded right at the top of the contiguous space and the rest of the
> memory will
> +be the new reserved memory (this may shrink or grow).  For that
> reason, freed
> +init memory from xen#1 image is also treated as reserved liveupdate
> update

s/update//

This is explained quite well actually, but I wonder if we can move this
part closer to the liveupdate command line section (they both talk
about the initial bootmem region and Xen size changes). After that, we
then talk about multiple regions and how we should use them.

> +bootmem.
> +
> +### Live Update data stream
> +
> +During handover, xen#1 creates a Live Update data stream containing
> all the
> +information required by the new Xen#2 to restore all the domains.
> +
> +Data pages for this stream may be allocated anywhere in physical
> memory outside
> +the *live update bootmem* regions.
> +
> +As calling __vmap()__/__vunmap()__ has a cost on the downtime.  We
> want to reduce the
> +number of call to __vmap()__ when restoring the stream.  Therefore
> the stream
> +will be contiguously virtually mapped in xen#2.  xen#1 will create
> an array of

Using vmap during restore for a contiguous range sounds more like
implementation and optimisation detail to me rather than an ABI
requirement, so I would s/the stream will be/the stream can be/.

> +MFNs of the allocated data pages, suitable for passing to
> __vmap()__.  The
> +array will be physically contiguous but the MFNs don't need to be
> physically
> +contiguous.
> +
> +### Breadcrumb
> +
> +Since the Live Update data stream is created during the final
> **kexec\_exec**
> +hypercall, its address cannot be passed on the command line to the
> new Xen
> +since the command line needs to have been set up by **kexec(8)** in
> userspace
> +long beforehand.
> +
> +Thus, to allow the new Xen to find the data stream, xen#1 places a
> breadcrumb
> +in the first words of the Live Update bootmem, containing the number
> of data
> +pages, and the physical address of the contiguous MFN array.
> +
> +### IOMMU
> +
> +Where devices are passed through to domains, it may not be possible
> to quiesce
> +those devices for the purpose of performing the update.
> +
> +If performing Live Update with assigned devices, xen#1 will leave
> the IOMMU
> +mappings active during the handover (thus implying that IOMMU page
> tables may
> +not be allocated in the *live update bootmem* region either).
> +
> +xen#2 must take control of the IOMMU without causing those mappings
> to become
> +invalid even for a short period of time.  In other words, xen#2
> should not
> +re-setup the IOMMUs.  On hardware which does not support Posted
> Interrupts,
> +interrupts may need to be generated on resume.
> +
> +## Restore
> +
> +After xen#2 initialized itself and map the stream, it will be
> responsible to
> +restore the state of the system and each domain.
> +
> +Unlike the save part, it is not possible to restore a domain in a
> single pass.
> +There are dependencies between:
> +
> +    1. different states of a domain.  For instance, the event
> channels ABI
> +       used (2l vs fifo) requires to be restored before restoring
> the event
> +       channels.
> +    2. the same "state" within a domain.  For instance, in case of
> PV domain,
> +       the pages' ownership requires to be restored before restoring
> the type
> +       of the page (e.g is it an L4, L1... table?).
> +
> +    3. domains.  For instance when restoring the grant mapping, it
> will be
> +       necessary to have the page's owner in hand to do proper
> refcounting.
> +       Therefore the pages' ownership have to be restored first.
> +
> +Dependencies will be resolved using either multiple passes (for
> dependency
> +type 2 and 3) or using a specific ordering between records (for
> dependency
> +type 1).
> +
> +Each domain will be restored in 3 passes:
> +
> +    * Pass 0: Create the domain and restore the P2M for HVM. This
> can be broken
> +      down in 3 parts:
> +      * Allocate a domain via _domain\_create()_ but skip part that
> requires
> +        extra records (e.g HAP, P2M).
> +      * Restore any parts which needs to be done before create the
> vCPUs. This
> +        including restoring the P2M and whether HAP is used.
> +      * Create the vCPUs. Note this doesn't restore the state of the
> vCPUs.
> +    * Pass 1: It will restore the pages' ownership and the grant-
> table frames
> +    * Pass 2: This steps will restore any domain states (e.g vCPU
> state, event
> +      channels) that wasn't

Sentence seems incomplete.

Hongyan


