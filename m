Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC66F1F76F1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 12:55:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhJn-0004Kr-Cp; Fri, 12 Jun 2020 10:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjhJm-0004Km-3E
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 10:53:50 +0000
X-Inumbo-ID: fef32cbc-ac9a-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef32cbc-ac9a-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KGjSSLk5xxy0yFM4r8xdlW1IaCb/+o4gHuOlupnMnu0=; b=PDrIdHz/Xxw3aWki97B82HtAcb
 uHhBnuJe3O+auAoaNj2ZhYKwurCbTLZESH1de4MAAsVHz8ql2FhxQCOpgnHaBhIMk12M0Ez10zWsa
 R3yGMZYlBHovqk9qYczmFqaksiLeq4pZlnX3COK386wFEGjvEI7Vjv/psvR8vl8KW5z4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhJg-0007M2-MJ; Fri, 12 Jun 2020 10:53:44 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhJg-0000E8-9s; Fri, 12 Jun 2020 10:53:44 +0000
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
Date: Fri, 12 Jun 2020 11:53:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 11/06/2020 12:58, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0

I think you want to add a bit more context explaining the reason on the 
failure. I.e. this is because the virtual address used by the runstate 
is only accessible when running in kernel space.

> 
> This patch is modifying the register runstate area handling on arm to
> convert the guest address during the hypercall. During runtime context
> switches the area is mapped to update the guest runstate copy.
> The patch is also removing the initial copy which was done during the
> hypercall handling as this is done on the current core when the context
> is restore to go back to guest execution on arm.

This is explaining what the commit does but not why we want to translate 
the virtual address at hypercall time. More importantly, this doesn't 
explain the restrictions added on the hypercall and why they are fine.

Note that they also should be documented in the public header.

> 
> As a consequence if the register runstate hypercall is called on one
> vcpu for an other vcpu, the area will not be updated until the vcpu
> will be executed (on arm only).

The code below suggests the hypercall will just fail if you call it from 
a different vCPU. Is that correct?

> 
> On x86, the behaviour is not modified, the address conversion is done
> during the context switch and the area is updated fully during the
> hypercall.
> inline functions in headers could not be used as the architecture
> domain.h is included before the global domain.h making it impossible
> to use the struct vcpu inside the architecture header.
> This should not have any performance impact as the hypercall is only
> called once per vcpu usually.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/domain.c        | 109 +++++++++++++++++++++++++++++------
>   xen/arch/x86/domain.c        |  30 +++++++++-
>   xen/arch/x86/x86_64/domain.c |   4 +-
>   xen/common/domain.c          |  19 ++----
>   xen/include/asm-arm/domain.h |   8 +++
>   xen/include/asm-x86/domain.h |  16 +++++
>   xen/include/xen/domain.h     |   4 ++
>   xen/include/xen/sched.h      |  16 +----
>   8 files changed, 153 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..739059234f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -19,6 +19,7 @@
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   #include <xen/wait.h>
> +#include <xen/domain_page.h>
>   
>   #include <asm/alternative.h>
>   #include <asm/cpuerrata.h>
> @@ -275,36 +276,104 @@ static void ctxt_switch_to(struct vcpu *n)
>       virt_timer_restore(n);
>   }
>   
> -/* Update per-VCPU guest runstate shared memory area (if registered). */
> -static void update_runstate_area(struct vcpu *v)
> +void arch_cleanup_runstate_guest(struct vcpu *v)

I would prefer if this is name arch_vcpu_cleanup_runstate() as this is 
per-vCPU and not per-domain information.

>   {
> -    void __user *guest_handle = NULL;
> -    struct vcpu_runstate_info runstate;
> +    spin_lock(&v->arch.runstate_guest.lock);
>   
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> -        return;
> +    /* cleanup previous page if any */
> +    if ( v->arch.runstate_guest.page )
> +    {
> +        put_page_and_type(v->arch.runstate_guest.page);

get_page_from_gva() is only grabbing a reference on the page. So you 
want to use put_page() here.

Note that we don't have type reference on Arm, so it equivalent to 
put_page(). But this wouldn't be technically correct :).

> +        v->arch.runstate_guest.page = NULL;
> +        v->arch.runstate_guest.offset = 0;
> +    }
>   
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    spin_unlock(&v->arch.runstate_guest.lock);
> +}
>   
> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +int arch_setup_runstate_guest(struct vcpu *v,
> +                            struct vcpu_register_runstate_memory_area area)

The indentation looks off here.

Also, same remark for the naming.


> +{
> +    struct page_info *page;
> +    unsigned offset;
> +
> +    spin_lock(&v->arch.runstate_guest.lock);
> +
> +    /* cleanup previous page if any */
> +    if ( v->arch.runstate_guest.page )
>       {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> -        smp_wmb();
> +        put_page_and_type(v->arch.runstate_guest.page);

Same remark here. Although I would prefer if we try to have a common 
helper to cleaning up the runstate. Maybe cleanup_runstate_vcpu_locked()?

> +        v->arch.runstate_guest.page = NULL;
> +        v->arch.runstate_guest.offset = 0;
> +    }
> +
> +    offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
> +        return -EINVAL;
> +    }
> +
> +    /* provided address must be aligned to a 64bit */
> +    if ( offset % alignof(struct vcpu_runstate_info) )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not aligned\n");
> +        return -EINVAL;
> +    }
> +
> +    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);

In the current implementation, 0 was used to unregister the runstate 
area. I think we want to keep that feature and not throw an error.

> +    if ( !page )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
> +        return -EINVAL;
>       }
>   
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    v->arch.runstate_guest.page = page;
> +    v->arch.runstate_guest.offset = offset;
> +

In the current implementation, the runstate area was update with the 
latest information during the hypercall. This doesn't seem to happen 
anymore. Is there any specific reason?

> +    spin_unlock(&v->arch.runstate_guest.lock);
> +
> +    return 0;
> +}
> +
> +
> +/* Update per-VCPU guest runstate shared memory area (if registered). */
> +static void update_runstate_area(struct vcpu *v)
> +{
> +    struct vcpu_runstate_info *guest_runstate;
> +    void *p;
> +
> +    spin_lock(&v->arch.runstate_guest.lock);
>   
> -    if ( guest_handle )
> +    if ( v->arch.runstate_guest.page )
>       {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        p = __map_domain_page(v->arch.runstate_guest.page);
> +        guest_runstate = p + v->arch.runstate_guest.offset;
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            smp_wmb();
> +        }
> +
> +        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
>           smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            smp_wmb();

Why do you need this barrier?


[...]

> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 4e2f582006..3a7f53e13d 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -11,6 +11,7 @@
>   #include <asm/vgic.h>
>   #include <asm/vpl011.h>
>   #include <public/hvm/params.h>
> +#include <public/vcpu.h>

Why do you need to add this new include?

>   #include <xen/serial.h>
>   #include <xen/rbtree.h>
>   
> @@ -206,6 +207,13 @@ struct arch_vcpu
>        */
>       bool need_flush_to_ram;
>   
> +    /* runstate guest info */
> +    struct {
> +        struct page_info *page;  /* guest page */
> +        unsigned         offset; /* offset in page */

Please use unsigned int.

Cheers,

-- 
Julien Grall

