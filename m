Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62527EAD7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762.2541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNd26-0000yT-Nw; Wed, 30 Sep 2020 14:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762.2541; Wed, 30 Sep 2020 14:24:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNd26-0000y4-Kw; Wed, 30 Sep 2020 14:24:38 +0000
Received: by outflank-mailman (input) for mailman id 762;
 Wed, 30 Sep 2020 14:24:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNd24-0000xz-VE
 for xen-devel@lists.xen.org; Wed, 30 Sep 2020 14:24:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d82a2ace-576f-4eb0-8e3d-bbf07ddc8125;
 Wed, 30 Sep 2020 14:24:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92BC4ABAD;
 Wed, 30 Sep 2020 14:24:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNd24-0000xz-VE
	for xen-devel@lists.xen.org; Wed, 30 Sep 2020 14:24:37 +0000
X-Inumbo-ID: d82a2ace-576f-4eb0-8e3d-bbf07ddc8125
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d82a2ace-576f-4eb0-8e3d-bbf07ddc8125;
	Wed, 30 Sep 2020 14:24:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601475874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NdvDZ/8EHzE555s2hS/caQIWcEDRZquVjIg1gnPcRcI=;
	b=UHIAAibdqEzrNeX99Adpiq0sLWldK5wDknbxjdufrTrbQezriI/CQxvrfey0QiIynGMX2A
	hvAB4AN0jhdT+eVPblEou7B4QkzTZyM42MQid+3g/4o6xIyPUuAMRffqkrqHB3BioOcymJ
	ObV3ERTmOUoJgai7AwASsd3naTakg/8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92BC4ABAD;
	Wed, 30 Sep 2020 14:24:34 +0000 (UTC)
Subject: Re: [XEN PATCH v14 2/8] xen: Add support for VMware cpuid leaves
To: Don Slutz <don.slutz@gmail.com>
Cc: xen-devel@lists.xen.org,
 Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92061c7f-5d85-839b-0e03-0495a942d004@suse.com>
Date: Wed, 30 Sep 2020 16:24:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.08.2020 18:51, Don Slutz wrote:
> Since I need to change xen/arch/x86/hvm/Makefile; also add
> a newline at end of file.

Should this have been removed?

Also please update / trim your Cc list. I've dropped / replaced a
number of entries which I'm sure would have bounced.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -597,6 +597,11 @@ int arch_domain_create(struct domain *d,
>      }
>      d->arch.emulation_flags = emflags;
>  
> +    if ( is_hvm_domain(d) )
> +    {
> +        d->arch.hvm.vmware_hwver = config->arch.vmware_hwver;
> +    }

As per the description it's not like any value is okay. Shouldn't
you refuse bad values in arch_sanitise_domain_config()?

Also please drop the unnecessary braces.

> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += svm/
>  obj-y += vmx/
>  obj-y += viridian/
> +obj-y += vmware/

Generally we try to sort such lists alphabetically. I realize a
mistake was already made when Viridian gained its own subdir, but
please don't widen the issue.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -68,6 +68,7 @@
>  #include <asm/hvm/viridian.h>
>  #include <asm/hvm/vm_event.h>
>  #include <asm/altp2m.h>
> +#include <asm/hvm/vmware.h>

Like above, please try to honor (partial) sorting in #include-s
as well.

> @@ -4109,6 +4110,13 @@ static int hvm_allow_set_param(struct domain *d,
>      {
>      /* The following parameters should only be changed once. */
>      case HVM_PARAM_VIRIDIAN:
> +        /* Disallow if vmware_hwver is in use */
> +        if ( d->arch.hvm.vmware_hwver )
> +        {
> +            rc = -EOPNOTSUPP;
> +            break;
> +        }
> +        /* Fall through */

Afaic the comment is too redundant with the code. If at least it
wouldn't name the field name, but say e.g. "VMware emulation",
things would already be better. Using something like "can't
coexist" instead of "disallow" may further improve usefulness.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/vmware/vmware.c
> @@ -0,0 +1,82 @@
> +/*
> + * arch/x86/hvm/vmware/cpuid.c
> + *
> + * Copyright (C) 2012-2015 Verizon Corporation
> + *
> + * This file is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License Version 2 (GPLv2)
> + * as published by the Free Software Foundation.
> + *
> + * This file is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details. <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/version.h>
> +#include <xen/hypercall.h>
> +#include <xen/domain_page.h>
> +#include <xen/param.h>
> +#include <asm/guest_access.h>
> +#include <asm/guest/hyperv-tlfs.h>
> +#include <asm/paging.h>
> +#include <asm/p2m.h>
> +#include <asm/apic.h>
> +#include <asm/hvm/support.h>
> +#include <public/sched.h>
> +#include <public/hvm/hvm_op.h>

Please sort each sub-section alphabetically, and please remove
ones you don't really need - the list looks surprisingly long for
just CPUID handling.

> +/*
> + * VMware hardware version 7 defines some of these cpuid levels,
> + * below is a brief description about those.
> + *
> + *     Leaf 0x40000000, Hypervisor CPUID information
> + * # EAX: The maximum input value for hypervisor CPUID info (0x40000010).
> + * # EBX, ECX, EDX: Hypervisor vendor ID signature. E.g. "VMwareVMware"
> + *
> + *     Leaf 0x40000010, Timing information.
> + * # EAX: (Virtual) TSC frequency in kHz.
> + * # EBX: (Virtual) Bus (local apic timer) frequency in kHz.
> + * # ECX, EDX: RESERVED
> + */
> +
> +void cpuid_vmware_leaves(const struct vcpu *v, uint32_t leaf,
> +                         uint32_t subleaf, struct cpuid_leaf *res)
> +{
> +    struct domain *d = current->domain;

Surely v->domain, and please add const.

> +    ASSERT(has_vmware_cpuid(d));
> +    ASSERT(leaf >= 0x40000000 && leaf < 0x40000100);

What earlier check guarantees this?

> +    leaf -= 0x40000000;
> +
> +    switch ( leaf )
> +    {
> +    case 0x0:
> +        res->a = 0x40000010; /* Maximum leaf */
> +        memcpy(&res->b, "VMwa", 4);
> +        memcpy(&res->c, "reVM", 4);
> +        memcpy(&res->d, "ware", 4);
> +        break;
> +
> +    case 0x10:
> +        /* (Virtual) TSC frequency in kHz. */
> +        res->a = d->arch.tsc_khz;
> +        /* (Virtual) Bus (local apic timer) frequency in kHz. */
> +        res->b = 1000000ull / APIC_BUS_CYCLE_NS;
> +        res->c = 0;          /* Reserved */
> +        res->d = 0;          /* Reserved */
> +        break;
> +    }

No further dependency on the selected version?

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -885,8 +885,11 @@ static void do_trap(struct cpu_user_regs *regs)
>  int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
>  {
>      const struct domain *d = v->domain;
> -    /* Optionally shift out of the way of Viridian architectural MSRs. */
> -    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
> +    /*
> +     * Optionally shift out of the way of Viridian or VMware
> +     * architectural leaves.
> +     */
> +    uint32_t base = is_viridian_or_vmware_cpuid(d) ? 0x40000200 : 0x40000000;
>  
>      switch ( idx - base )
>      {
> @@ -901,8 +904,11 @@ int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
>  int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
>  {
>      struct domain *d = v->domain;
> -    /* Optionally shift out of the way of Viridian architectural MSRs. */
> -    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
> +    /*
> +     * Optionally shift out of the way of Viridian or VMware
> +     * architectural leaves.
> +     */
> +    uint32_t base = is_viridian_or_vmware_cpuid(d) ? 0x40000200 : 0x40000000;
>  
>      switch ( idx - base )
>      {

How do these (MSR related) changes correspond to the subject of this
change? (Mentioning why they're needed in the description would help.)

Also your choice of name (is_viridian_or_vmware_cpuid()) wouldn't scale
if there were one or more further hypervisor emulations added. I don't
have a good suggestion for a name right away, but one should be found.

> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -474,6 +474,18 @@ static inline bool hvm_get_guest_bndcfgs(struct vcpu *v, u64 *val)
>  #define has_viridian_synic(d) \
>      (is_viridian_domain(d) && (viridian_feature_mask(d) & HVMPV_synic))
>  
> +#define vmware_feature_mask(d) \
> +    ((d)->arch.hvm.vmware_hwver)

Why "mask"? This is simply a numeric value, isn't it? Also why do
this and ...

> +#define is_vmware_domain(d) \
> +    (is_hvm_domain(d) && vmware_feature_mask(d))
> +
> +#define has_vmware_cpuid(d) \
> +    (is_hvm_domain(d) && (vmware_feature_mask(d) >= 7))

... these not live in the new vmware.h?

> --- /dev/null
> +++ b/xen/include/asm-x86/hvm/vmware.h
> @@ -0,0 +1,33 @@
> +/*
> + * asm-x86/hvm/vmware.h
> + *
> + * Copyright (C) 2012-2015 Verizon Corporation
> + *
> + * This file is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License Version 2 (GPLv2)
> + * as published by the Free Software Foundation.
> + *
> + * This file is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details. <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef ASM_X86_HVM_VMWARE_H__
> +#define ASM_X86_HVM_VMWARE_H__
> +
> +#include <xen/types.h>
> +
> +void cpuid_vmware_leaves(const struct vcpu *v, uint32_t leaf,
> +                         uint32_t subleaf, struct cpuid_leaf *res);

At the example of this, as per ./CODING_STYLE please avoid the use
of uint<N>_t when more basic types (unsigned int here) are fine to
use. With that you won't need xen/types.h anymore. You'll want to
forward-declare the two struct-s the prototype uses in any event,
though.

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -304,6 +304,7 @@ struct xen_arch_domainconfig {
>                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
>                                       XEN_X86_EMU_VPCI)
>      uint32_t emulation_flags;
> +    uint32_t vmware_hwver;
>  };

As per the comment above this struct XEN_DOMCTL_INTERFACE_VERSION
would need bumping with such an addition, unless it already has
been in the current release cycle.

Also - is VMware really x86-only?

Jan

