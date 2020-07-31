Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43476234DDC
	for <lists+xen-devel@lfdr.de>; Sat,  1 Aug 2020 01:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1e3p-00082s-Kt; Fri, 31 Jul 2020 23:03:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F22U=BK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1e3n-00082n-OC
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 23:03:31 +0000
X-Inumbo-ID: 0cd2032c-d382-11ea-ac72-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd2032c-d382-11ea-ac72-12813bfff9fa;
 Fri, 31 Jul 2020 23:03:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76EFF2072A;
 Fri, 31 Jul 2020 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596236609;
 bh=gS8LaeQahirFzsum+tAEXBlS4nE/w36LX8Jon4RvuHQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1gZUPV7mvNbmvy0wnFgKj8uDmxjqhNi0P9yAk3ZZZxXBHKlNalyIBQUDK//uiRWVT
 gUu/idUsf3g2X2/2c2Rw5yQBy9qQS4LC1R2Gt1GfF8Im+Fzue2lBO1/vtuihua78nF
 QJRwZX6MlLK3UYavQXv+iHLWddbS+KedjuAdvf/s=
Date: Fri, 31 Jul 2020 16:03:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
In-Reply-To: <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
Message-ID: <alpine.DEB.2.21.2007311018330.1767@sstabellini-ThinkPad-T480s>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 31 Jul 2020, Bertrand Marquis wrote:
> Sorry missed some points in my previous answer.
> 
> > On 30 Jul 2020, at 22:50, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > To avoid extra work on your side, I would recommend to wait a bit before sending a new version. It would be good to at least settle the conversation in v2 regarding the approach taken.
> > 
> > On 30/07/2020 11:24, Bertrand Marquis wrote:
> >> At the moment on Arm, a Linux guest running with KTPI enabled will
> >> cause the following error when a context switch happens in user mode:
> >> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> >> The error is caused by the virtual address for the runstate area
> >> registered by the guest only being accessible when the guest is running
> >> in kernel space when KPTI is enabled.
> >> To solve this issue, this patch is doing the translation from virtual
> >> address to physical address during the hypercall and mapping the
> >> required pages using vmap. This is removing the conversion from virtual
> >> to physical address during the context switch which is solving the
> >> problem with KPTI.
> > 
> > To echo what Jan said on the previous version, this is a change in a stable ABI and therefore may break existing guest. FAOD, I agree in principle with the idea. However, we want to explain why breaking the ABI is the *only* viable solution.
> > 
> > From my understanding, it is not possible to fix without an ABI breakage because the hypervisor doesn't know when the guest will switch back from userspace to kernel space. The risk is the information provided by the runstate wouldn't contain accurate information and could affect how the guest handle stolen time.
> > 
> > Additionally there are a few issues with the current interface:
> >   1) It is assuming the virtual address cannot be re-used by the userspace. Thanksfully Linux have a split address space. But this may change with KPTI in place.
> >   2) When update the page-tables, the guest has to go through an invalid mapping. So the translation may fail at any point.
> > 
> > IOW, the existing interface can lead to random memory corruption and inacurracy of the stolen time.
> > 
> >> This is done only on arm architecture, the behaviour on x86 is not
> >> modified by this patch and the address conversion is done as before
> >> during each context switch.
> >> This is introducing several limitations in comparison to the previous
> >> behaviour (on arm only):
> >> - if the guest is remapping the area at a different physical address Xen
> >> will continue to update the area at the previous physical address. As
> >> the area is in kernel space and usually defined as a global variable this
> >> is something which is believed not to happen. If this is required by a
> >> guest, it will have to call the hypercall with the new area (even if it
> >> is at the same virtual address).
> >> - the area needs to be mapped during the hypercall. For the same reasons
> >> as for the previous case, even if the area is registered for a different
> >> vcpu. It is believed that registering an area using a virtual address
> >> unmapped is not something done.
> > 
> > This is not clear whether the virtual address refer to the current vCPU or the vCPU you register the runstate for. From the past discussion, I think you refer to the former. It would be good to clarify.
> > 
> > Additionally, all the new restrictions should be documented in the public interface. So an OS developper can find the differences between the architectures.
> > 
> > To answer Jan's concern, we certainly don't know all the guest OSes existing, however we also need to balance the benefit for a large majority of the users.
> > 
> > From previous discussion, the current approach was deemed to be acceptable on Arm and, AFAICT, also x86 (see [1]).
> > 
> > TBH, I would rather see the approach to be common. For that, we would an agreement from Andrew and Jan in the approach here. Meanwhile, I think this is the best approach to address the concern from Arm users.
> > 
> >> inline functions in headers could not be used as the architecture
> >> domain.h is included before the global domain.h making it impossible
> >> to use the struct vcpu inside the architecture header.
> >> This should not have any performance impact as the hypercall is only
> >> called once per vcpu usually.
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >>   Changes in v2
> >>     - use vmap to map the pages during the hypercall.
> >>     - reintroduce initial copy during hypercall.
> >>   Changes in v3
> >>     - Fix Coding style
> >>     - Fix vaddr printing on arm32
> >>     - use write_atomic to modify state_entry_time update bit (only
> >>     in guest structure as the bit is not used inside Xen copy)
> >> ---
> >>  xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
> >>  xen/arch/x86/domain.c        |  29 ++++++-
> >>  xen/arch/x86/x86_64/domain.c |   4 +-
> >>  xen/common/domain.c          |  19 ++---
> >>  xen/include/asm-arm/domain.h |   9 ++
> >>  xen/include/asm-x86/domain.h |  16 ++++
> >>  xen/include/xen/domain.h     |   5 ++
> >>  xen/include/xen/sched.h      |  16 +---
> >>  8 files changed, 206 insertions(+), 53 deletions(-)
> >> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >> index 31169326b2..8b36946017 100644
> >> --- a/xen/arch/arm/domain.c
> >> +++ b/xen/arch/arm/domain.c
> >> @@ -19,6 +19,7 @@
> >>  #include <xen/sched.h>
> >>  #include <xen/softirq.h>
> >>  #include <xen/wait.h>
> >> +#include <xen/vmap.h>
> >>    #include <asm/alternative.h>
> >>  #include <asm/cpuerrata.h>
> >> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
> >>      virt_timer_restore(n);
> >>  }
> >>  -/* Update per-VCPU guest runstate shared memory area (if registered). */
> >> -static void update_runstate_area(struct vcpu *v)
> >> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
> >>  {
> >> -    void __user *guest_handle = NULL;
> >> +    if ( v->arch.runstate_guest )
> >> +    {
> >> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
> >> +
> >> +        put_page(v->arch.runstate_guest_page[0]);
> >> +
> >> +        if ( v->arch.runstate_guest_page[1] )
> >> +            put_page(v->arch.runstate_guest_page[1]);
> >> +
> >> +        v->arch.runstate_guest = NULL;
> >> +    }
> >> +}
> >> +
> >> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
> >> +{
> >> +    spin_lock(&v->arch.runstate_guest_lock);
> >> +
> >> +    cleanup_runstate_vcpu_locked(v);
> >> +
> >> +    spin_unlock(&v->arch.runstate_guest_lock);
> >> +}
> >> +
> >> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
> >> +{
> >> +    unsigned int offset;
> >> +    mfn_t mfn[2];
> >> +    struct page_info *page;
> >> +    unsigned int numpages;
> >>      struct vcpu_runstate_info runstate;
> >> +    void *p;
> >>  -    if ( guest_handle_is_null(runstate_guest(v)) )
> >> -        return;
> >> +    /* user can pass a NULL address to unregister a previous area */
> >> +    if ( vaddr == 0 )
> >> +        return 0;
> >> +
> >> +    offset = vaddr & ~PAGE_MASK;
> >> +
> >> +    /* provided address must be aligned to a 64bit */
> >> +    if ( offset % alignof(struct vcpu_runstate_info) )
> > 
> > This new restriction wants to be explained in the commit message and public header.
> 
> ok
> 
> > 
> >> +    {
> >> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> >> +                ": Invalid offset\n", vaddr);
> > 
> > We usually enforce 80 character per lines except for format string. So it is easier to grep them in the code.
> 
> Ok i will fix this one and the following ones.
> But here PRIvaddr would break any attempt to grep something in fact.
> 
> > 
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    page = get_page_from_gva(v, vaddr, GV2M_WRITE);
> >> +    if ( !page )
> >> +    {
> >> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> >> +                ": Page is not mapped\n", vaddr);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    mfn[0] = page_to_mfn(page);
> >> +    v->arch.runstate_guest_page[0] = page;
> >> +
> >> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> >> +    {
> >> +        /* guest area is crossing pages */
> >> +        page = get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
> >> +        if ( !page )
> >> +        {
> >> +            put_page(v->arch.runstate_guest_page[0]);
> >> +            gprintk(XENLOG_WARNING,
> >> +                    "Cannot map runstate pointer at 0x%"PRIvaddr
> >> +                    ": 2nd Page is not mapped\n", vaddr);
> >> +            return -EINVAL;
> >> +        }
> >> +        mfn[1] = page_to_mfn(page);
> >> +        v->arch.runstate_guest_page[1] = page;
> >> +        numpages = 2;
> >> +    }
> >> +    else
> >> +    {
> >> +        v->arch.runstate_guest_page[1] = NULL;
> >> +        numpages = 1;
> >> +    }
> >>  -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> >> +    p = vmap(mfn, numpages);
> >> +    if ( !p )
> >> +    {
> >> +        put_page(v->arch.runstate_guest_page[0]);
> >> +        if ( numpages == 2 )
> >> +            put_page(v->arch.runstate_guest_page[1]);
> >>  -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
> >> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> >> +                ": vmap error\n", vaddr);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    v->arch.runstate_guest = p + offset;
> >> +
> >> +    if (v == current)
> >> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
> >> +    else
> >>      {
> >> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> >> -        guest_handle--;
> >> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> >> -        __raw_copy_to_guest(guest_handle,
> >> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> >> -        smp_wmb();
> >> +        vcpu_runstate_get(v, &runstate);
> >> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
> >>      }
> >>  -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> >> +    return 0;
> >> +}
> >> +
> >> +int arch_vcpu_setup_runstate(struct vcpu *v,
> >> +                             struct vcpu_register_runstate_memory_area area)
> >> +{
> >> +    int rc;
> >> +
> >> +    spin_lock(&v->arch.runstate_guest_lock);
> >> +
> >> +    /* cleanup if we are recalled */
> >> +    cleanup_runstate_vcpu_locked(v);
> >> +
> >> +    rc = setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
> >> +
> >> +    spin_unlock(&v->arch.runstate_guest_lock);
> >>  -    if ( guest_handle )
> >> +    return rc;
> >> +}
> >> +
> >> +
> >> +/* Update per-VCPU guest runstate shared memory area (if registered). */
> >> +static void update_runstate_area(struct vcpu *v)
> >> +{
> >> +    spin_lock(&v->arch.runstate_guest_lock);
> >> +
> >> +    if ( v->arch.runstate_guest )
> >>      {
> >> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> >> -        smp_wmb();
> >> -        __raw_copy_to_guest(guest_handle,
> >> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> >> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> >> +        {
> >> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> >> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
> >> +                    v->runstate.state_entry_time);
> > 
> > NIT: You want to indent v-> at the same level as the argument from the first line.
> 
> Ok
> 
> > 
> > Also, I think you are missing a smp_wmb() here.
> 
> The atomic operation itself would not need a barrier.
> I do not see why you think a barrier is needed here.
> For the internal structure ?

We need to make sure the other-end sees the XEN_RUNSTATE_UPDATE change
before other changes. Otherwise, due to cpu reordering, the writes could
be seen in reverse order. (Technically the reader would have to use a
read-barrier but that's a separate topic.)

