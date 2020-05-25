Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEA1E06A6
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 08:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd6FP-00068Q-Ai; Mon, 25 May 2020 06:06:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jd6FO-00068L-F2
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 06:06:02 +0000
X-Inumbo-ID: ce7c6a0e-9e4d-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce7c6a0e-9e4d-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 06:06:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A634FB327;
 Mon, 25 May 2020 06:06:01 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
Date: Mon, 25 May 2020 08:05:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 18:33, Tamas K Lengyel wrote:
> When running shallow forks without device models it may be undesirable for Xen
> to inject interrupts. With Windows forks we have observed the kernel going into
> infinite loops when trying to process such interrupts, likely because it attempts
> to interact with devices that are not responding without QEMU running. By
> disabling interrupt injection the fuzzer can exercise the target code without
> interference.
> 
> Forks & memory sharing are only available on Intel CPUs so this only applies
> to vmx.

Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
this. Would you mind pointing me at where this restriction is coming from?

> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -256,6 +256,12 @@ void vmx_intr_assist(void)
>      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
>          return;
>  
> +#ifdef CONFIG_MEM_SHARING
> +    /* Block event injection for VM fork if requested */
> +    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
> +        return;
> +#endif

The two earlier returns are temporary as far as the guest is concerned,
i.e. eventually the interrupt(s) will get delivered. The one you add
looks as if it is a permanent thing, i.e. interrupt requests will pile
up and potentially confuse a guest down the road. This _may_ be okay
for your short-lived-shallow-fork scenario, but then wants at least
calling out in the public header by a comment (and I think the same
goes for XENMEM_FORK_WITH_IOMMU_ALLOWED that's already there).

> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -74,6 +74,8 @@ struct mem_sharing_domain
>       * to resume the search.
>       */
>      unsigned long next_shared_gfn_to_relinquish;
> +
> +    bool block_interrupts;
>  };

Please can you avoid unnecessary growth of the structure by inserting
next to the pre-existing bool rather than at the end?

Jan

