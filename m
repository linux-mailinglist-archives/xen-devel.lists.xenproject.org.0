Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB6234598
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1U0u-00053A-CS; Fri, 31 Jul 2020 12:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1U0t-000535-2p
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:19:51 +0000
X-Inumbo-ID: 211537fa-d328-11ea-abaa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211537fa-d328-11ea-abaa-12813bfff9fa;
 Fri, 31 Jul 2020 12:19:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CE8CACE3;
 Fri, 31 Jul 2020 12:20:02 +0000 (UTC)
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
To: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8eb8052-6370-7484-1c9a-f90d83396fa1@suse.com>
Date: Fri, 31 Jul 2020 14:19:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 22:50, Julien Grall wrote:
> On 30/07/2020 11:24, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>
>> The error is caused by the virtual address for the runstate area
>> registered by the guest only being accessible when the guest is running
>> in kernel space when KPTI is enabled.
>>
>> To solve this issue, this patch is doing the translation from virtual
>> address to physical address during the hypercall and mapping the
>> required pages using vmap. This is removing the conversion from virtual
>> to physical address during the context switch which is solving the
>> problem with KPTI.
> 
> To echo what Jan said on the previous version, this is a change in a 
> stable ABI and therefore may break existing guest. FAOD, I agree in 
> principle with the idea. However, we want to explain why breaking the 
> ABI is the *only* viable solution.
> 
>  From my understanding, it is not possible to fix without an ABI 
> breakage because the hypervisor doesn't know when the guest will switch 
> back from userspace to kernel space.

And there's also no way to know on Arm, by e.g. enabling a suitable
intercept?

> The risk is the information 
> provided by the runstate wouldn't contain accurate information and could 
> affect how the guest handle stolen time.
> 
> Additionally there are a few issues with the current interface:
>     1) It is assuming the virtual address cannot be re-used by the 
> userspace. Thanksfully Linux have a split address space. But this may 
> change with KPTI in place.
>     2) When update the page-tables, the guest has to go through an 
> invalid mapping. So the translation may fail at any point.
> 
> IOW, the existing interface can lead to random memory corruption and 
> inacurracy of the stolen time.
> 
>>
>> This is done only on arm architecture, the behaviour on x86 is not
>> modified by this patch and the address conversion is done as before
>> during each context switch.
>>
>> This is introducing several limitations in comparison to the previous
>> behaviour (on arm only):
>> - if the guest is remapping the area at a different physical address Xen
>> will continue to update the area at the previous physical address. As
>> the area is in kernel space and usually defined as a global variable this
>> is something which is believed not to happen. If this is required by a
>> guest, it will have to call the hypercall with the new area (even if it
>> is at the same virtual address).
>> - the area needs to be mapped during the hypercall. For the same reasons
>> as for the previous case, even if the area is registered for a different
>> vcpu. It is believed that registering an area using a virtual address
>> unmapped is not something done.
> 
> This is not clear whether the virtual address refer to the current vCPU 
> or the vCPU you register the runstate for. From the past discussion, I 
> think you refer to the former. It would be good to clarify.
> 
> Additionally, all the new restrictions should be documented in the 
> public interface. So an OS developper can find the differences between 
> the architectures.
> 
> To answer Jan's concern, we certainly don't know all the guest OSes 
> existing, however we also need to balance the benefit for a large 
> majority of the users.
> 
>  From previous discussion, the current approach was deemed to be 
> acceptable on Arm and, AFAICT, also x86 (see [1]).
> 
> TBH, I would rather see the approach to be common. For that, we would an 
> agreement from Andrew and Jan in the approach here. Meanwhile, I think 
> this is the best approach to address the concern from Arm users.

Just FTR: If x86 was to also change, VCPUOP_register_vcpu_time_memory_area
would need taking care of as well, as it's using the same underlying model
(including recovery logic when, while the guest is in user mode, the
update has failed).

>> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>>       virt_timer_restore(n);
>>   }
>>   
>> -/* Update per-VCPU guest runstate shared memory area (if registered). */
>> -static void update_runstate_area(struct vcpu *v)
>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>>   {
>> -    void __user *guest_handle = NULL;
>> +    if ( v->arch.runstate_guest )
>> +    {
>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
>> +
>> +        put_page(v->arch.runstate_guest_page[0]);
>> +
>> +        if ( v->arch.runstate_guest_page[1] )
>> +            put_page(v->arch.runstate_guest_page[1]);
>> +
>> +        v->arch.runstate_guest = NULL;
>> +    }
>> +}
>> +
>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>> +{
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    cleanup_runstate_vcpu_locked(v);
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>> +}
>> +
>> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
>> +{
>> +    unsigned int offset;
>> +    mfn_t mfn[2];
>> +    struct page_info *page;
>> +    unsigned int numpages;
>>       struct vcpu_runstate_info runstate;
>> +    void *p;
>>   
>> -    if ( guest_handle_is_null(runstate_guest(v)) )
>> -        return;
>> +    /* user can pass a NULL address to unregister a previous area */
>> +    if ( vaddr == 0 )
>> +        return 0;
>> +
>> +    offset = vaddr & ~PAGE_MASK;
>> +
>> +    /* provided address must be aligned to a 64bit */
>> +    if ( offset % alignof(struct vcpu_runstate_info) )
> 
> This new restriction wants to be explained in the commit message and 
> public header.

And the expression would imo also better use alignof(runstate).

Jan

