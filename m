Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168771F3CD6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jieVE-0001pr-Vn; Tue, 09 Jun 2020 13:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jieVD-0001pm-WC
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:41:20 +0000
X-Inumbo-ID: e5b16c14-aa56-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b16c14-aa56-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 13:41:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71235B1E7;
 Tue,  9 Jun 2020 13:41:21 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/livepatch: Make livepatching compatible with
 CET Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200608200259.17681-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <620e5f66-2802-24e7-bb6e-285e99f12975@suse.com>
Date: Tue, 9 Jun 2020 15:41:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200608200259.17681-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.06.2020 22:02, Andrew Cooper wrote:
> Do we ever write into .rodata?  AFAICT, we introduce new fuctions for
> references to new .rodata, rather than modifying existing .rodata.  If however
> we do modify .rodata, then the virtual regions need extending with information
> about .rodata so we can zap those dirty bits as well.

Inspired by looking at setup_virtual_regions(), do exception fixup
or bug frame tables possibly get patched?

> @@ -58,6 +59,10 @@ int arch_livepatch_safety_check(void)
>  
>  int arch_livepatch_quiesce(void)
>  {
> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
> +    if ( cpu_has_xen_shstk )
> +        write_cr4(read_cr4() & ~X86_CR4_CET);
> +
>      /* Disable WP to allow changes to read-only pages. */
>      write_cr0(read_cr0() & ~X86_CR0_WP);
>  
> @@ -68,6 +73,29 @@ void arch_livepatch_revive(void)
>  {
>      /* Reinstate WP. */
>      write_cr0(read_cr0() | X86_CR0_WP);
> +
> +    /* Clobber dirty bits and reinstate CET, if applicable. */
> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
> +    {
> +        unsigned long tmp;
> +
> +        reset_virtual_region_perms();
> +
> +        write_cr4(read_cr4() | X86_CR4_CET);
> +
> +        /*
> +         * Fix up the return address on the shadow stack, which currently
> +         * points at arch_livepatch_quiesce()'s caller.
> +         *
> +         * Note: this is somewhat fragile, and depends on both
> +         * arch_livepatch_{quiesce,revive}() being called from the same
> +         * function, which is currently the case.
> +         */
> +        asm volatile ("rdsspq %[ssp];"
> +                      "wrssq %[addr], (%[ssp]);"
> +                      : [ssp] "=&r" (tmp)
> +                      : [addr] "r" (__builtin_return_address(0)));
> +    }

To be safe against LTO I think this wants accompanying with making
both functions noinline.

As to the fragility - how about arch_livepatch_quiesce() returning
__builtin_return_address(0) to its caller, for passing into here
for verification? This would also make more noticeable that the
two should be be called from the same function (or else the "token"
would need passing further around).

> @@ -91,6 +92,18 @@ void unregister_virtual_region(struct virtual_region *r)
>      remove_virtual_region(r);
>  }
>  
> +void reset_virtual_region_perms(void)
> +{
> +    const struct virtual_region *region;
> +
> +    rcu_read_lock(&rcu_virtual_region_lock);
> +    list_for_each_entry_rcu( region, &virtual_region_list, list )
> +        modify_xen_mappings((unsigned long)region->start,
> +                            ROUNDUP((unsigned long)region->end, PAGE_SIZE),
> +                            PAGE_HYPERVISOR_RX);
> +    rcu_read_unlock(&rcu_virtual_region_lock);
> +}

Doesn't this result in shattering the trailing (and currently still
only) 2Mb page mapping .text in the xen.efi case? With the
expectation of the approach changing in 4.15 this may not need
addressing, but should imo be mentioned as a shortcoming in the
description then.

Also - how about "restore" instead of "reset"?

Finally, while indeed not a lot of code, should it nevertheless go
inside #ifdef CONFIG_LIVEPATCH?

Jan

