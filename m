Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99151231337
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 21:55:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0VgO-0000yl-3R; Tue, 28 Jul 2020 19:54:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0VgM-0000yg-Is
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:54:38 +0000
X-Inumbo-ID: 2a6babeb-d10c-11ea-8bce-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a6babeb-d10c-11ea-8bce-bc764e2007e4;
 Tue, 28 Jul 2020 19:54:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9396AD6F;
 Tue, 28 Jul 2020 19:54:47 +0000 (UTC)
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <bertrand.marquis@arm.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
Date: Tue, 28 Jul 2020 21:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 17:52, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> The error is caused by the virtual address for the runstate area
> registered by the guest only being accessible when the guest is running
> in kernel space when KPTI is enabled.
> 
> To solve this issue, this patch is doing the translation from virtual
> address to physical address during the hypercall and mapping the
> required pages using vmap. This is removing the conversion from virtual
> to physical address during the context switch which is solving the
> problem with KPTI.
> 
> This is done only on arm architecture, the behaviour on x86 is not
> modified by this patch and the address conversion is done as before
> during each context switch.
> 
> This is introducing several limitations in comparison to the previous
> behaviour (on arm only):
> - if the guest is remapping the area at a different physical address Xen
> will continue to update the area at the previous physical address. As
> the area is in kernel space and usually defined as a global variable this
> is something which is believed not to happen. If this is required by a
> guest, it will have to call the hypercall with the new area (even if it
> is at the same virtual address).
> - the area needs to be mapped during the hypercall. For the same reasons
> as for the previous case, even if the area is registered for a different
> vcpu. It is believed that registering an area using a virtual address
> unmapped is not something done.

Beside me thinking that an in-use and stable ABI can't be changed like
this, no matter what is "believed" kernel code may or may not do, I
also don't think having arch-es diverge in behavior here is a good
idea. Use of commonly available interfaces shouldn't lead to head
aches or surprises when porting code from one arch to another. I'm
pretty sure it was suggested before: Why don't you simply introduce
a physical address based hypercall (and then also on x86 at the same
time, keeping functional parity)? I even seem to recall giving a
suggestion how to fit this into a future "physical addresses only"
model, as long as we can settle on the basic principles of that
conversion path that we want to go sooner or later anyway (as I
understand).

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1642,6 +1642,30 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>           wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>   }
>   
> +int arch_vcpu_setup_runstate(struct vcpu *v,
> +                             struct vcpu_register_runstate_memory_area area)
> +{
> +    struct vcpu_runstate_info runstate;
> +
> +    runstate_guest(v) = area.addr.h;
> +
> +    if ( v == current )
> +    {
> +        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> +    }

Pointless braces (and I think there are more instances).

> +    else
> +    {
> +        vcpu_runstate_get(v, &runstate);
> +        __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    }
> +    return 0;

Missing blank line before main "return".

Jan

