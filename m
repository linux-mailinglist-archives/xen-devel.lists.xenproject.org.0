Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF271F56EA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1tu-0007YP-9J; Wed, 10 Jun 2020 14:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jj1ts-0007YJ-Eu
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:40:20 +0000
X-Inumbo-ID: 4e3a459a-ab28-11ea-b457-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e3a459a-ab28-11ea-b457-12813bfff9fa;
 Wed, 10 Jun 2020 14:40:19 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LXLyQSAYIV3y4elC6AA7h3YJiThMVot3oc3SYtuLk3HYYJJ7a0Yr/OsDhz5EWyoYs/V/0b8Vws
 cEK1vtkKrsGECudqwcXkZq8O73X0LtQ2MRIEDeDk68pkPFXh8HBYvfESkmxzag6L/0EQYHnLJO
 qViXQ1OHf5A+6/xostZ5AC7mtsTNaoIDwuG77dD4vS4Yuj0V4Yo9v/RPrhMk/VyM2IvIkGpoly
 lpAJhE290AuhxcuRwcXn9SbfYKcIn8aH1c4FzHO9i2KBeOaWjM9/3D0fx7T8S64fhc8nUNaCNT
 Nzs=
X-SBRS: 2.7
X-MesageID: 20453573
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="20453573"
Subject: Re: [PATCH for-4.14] x86/livepatch: Make livepatching compatible with
 CET Shadow Stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200608200259.17681-1-andrew.cooper3@citrix.com>
 <620e5f66-2802-24e7-bb6e-285e99f12975@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6e353c85-b957-bdbe-6428-737b5bc8e801@citrix.com>
Date: Wed, 10 Jun 2020 15:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <620e5f66-2802-24e7-bb6e-285e99f12975@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paul Durrant <paul@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/06/2020 14:41, Jan Beulich wrote:
> On 08.06.2020 22:02, Andrew Cooper wrote:
>> Do we ever write into .rodata?  AFAICT, we introduce new fuctions for
>> references to new .rodata, rather than modifying existing .rodata.  If however
>> we do modify .rodata, then the virtual regions need extending with information
>> about .rodata so we can zap those dirty bits as well.
> Inspired by looking at setup_virtual_regions(), do exception fixup
> or bug frame tables possibly get patched?

If they're not in .rodata, they really ought to be.

That said, neither of those tables should get touched - we add new
subset tables in the livepatch, which covers anything arising from
modified code.  This means we don't merge/resort the table on load, or
edit the table at all on unload.

>
>> @@ -58,6 +59,10 @@ int arch_livepatch_safety_check(void)
>>  
>>  int arch_livepatch_quiesce(void)
>>  {
>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>> +    if ( cpu_has_xen_shstk )
>> +        write_cr4(read_cr4() & ~X86_CR4_CET);
>> +
>>      /* Disable WP to allow changes to read-only pages. */
>>      write_cr0(read_cr0() & ~X86_CR0_WP);
>>  
>> @@ -68,6 +73,29 @@ void arch_livepatch_revive(void)
>>  {
>>      /* Reinstate WP. */
>>      write_cr0(read_cr0() | X86_CR0_WP);
>> +
>> +    /* Clobber dirty bits and reinstate CET, if applicable. */
>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
>> +    {
>> +        unsigned long tmp;
>> +
>> +        reset_virtual_region_perms();
>> +
>> +        write_cr4(read_cr4() | X86_CR4_CET);
>> +
>> +        /*
>> +         * Fix up the return address on the shadow stack, which currently
>> +         * points at arch_livepatch_quiesce()'s caller.
>> +         *
>> +         * Note: this is somewhat fragile, and depends on both
>> +         * arch_livepatch_{quiesce,revive}() being called from the same
>> +         * function, which is currently the case.
>> +         */
>> +        asm volatile ("rdsspq %[ssp];"
>> +                      "wrssq %[addr], (%[ssp]);"
>> +                      : [ssp] "=&r" (tmp)
>> +                      : [addr] "r" (__builtin_return_address(0)));
>> +    }
> To be safe against LTO I think this wants accompanying with making
> both functions noinline.

Hmm true.

> As to the fragility - how about arch_livepatch_quiesce() returning
> __builtin_return_address(0) to its caller, for passing into here
> for verification? This would also make more noticeable that the
> two should be be called from the same function (or else the "token"
> would need passing further around).

This I'm less certain about, as its fairly invasive to common code, just
to bodge around something I don't expect to last very long into the 4.15
timeframe.

>
>> @@ -91,6 +92,18 @@ void unregister_virtual_region(struct virtual_region *r)
>>      remove_virtual_region(r);
>>  }
>>  
>> +void reset_virtual_region_perms(void)
>> +{
>> +    const struct virtual_region *region;
>> +
>> +    rcu_read_lock(&rcu_virtual_region_lock);
>> +    list_for_each_entry_rcu( region, &virtual_region_list, list )
>> +        modify_xen_mappings((unsigned long)region->start,
>> +                            ROUNDUP((unsigned long)region->end, PAGE_SIZE),
>> +                            PAGE_HYPERVISOR_RX);
>> +    rcu_read_unlock(&rcu_virtual_region_lock);
>> +}
> Doesn't this result in shattering the trailing (and currently still
> only) 2Mb page mapping .text in the xen.efi case?

Not any more or less than its already clobbered by this logic in the
alternatives path, I think?

>  With the
> expectation of the approach changing in 4.15 this may not need
> addressing, but should imo be mentioned as a shortcoming in the
> description then.
>
> Also - how about "restore" instead of "reset"?

Why?  We're not passing some state sideways into the new mappings -
we're resetting them to their expected values.

>
> Finally, while indeed not a lot of code, should it nevertheless go
> inside #ifdef CONFIG_LIVEPATCH?

Tbh, it could be CONFIG_XEN_SHSTK if we decide to go down that route.

~Andrew

