Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056920B10B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:56:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomyC-00030W-1M; Fri, 26 Jun 2020 11:56:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jomyA-00030R-PJ
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:56:34 +0000
X-Inumbo-ID: 145e7dae-b7a4-11ea-82a7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 145e7dae-b7a4-11ea-82a7-12813bfff9fa;
 Fri, 26 Jun 2020 11:56:33 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tyUtj61jX4bdVkTmDqu4HNLaPYwMZVTG9iOeaExSB4PTRMOiBxVOWXovZ7JDwHlaVj5vztjmx3
 VP/5BH1yS0/beGMKAZO1rofB2ZDAyRRDsS1XGuaFEKu56v3lcz3Z1bNEQwsSLZ4E1Ky6Wih1v0
 NtjjQGxobMbtQDAG/trhQlP3/O46Uq5GUa2dGRirJ1JveWhWjWN5BLm00cVv0TlbFUidaOcfCv
 n8ZASLt+95h03tZsfBOf8qx2/KJjDMtXfHpU95nPM+eDnWZJgn3/px4Iz4JhywJSg/FhgOUB4I
 VH0=
X-SBRS: 2.7
X-MesageID: 21024998
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21024998"
Subject: Re: [PATCH for-4.14] x86/livepatch: Make livepatching compatible with
 CET Shadow Stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200608200259.17681-1-andrew.cooper3@citrix.com>
 <620e5f66-2802-24e7-bb6e-285e99f12975@suse.com>
 <6e353c85-b957-bdbe-6428-737b5bc8e801@citrix.com>
 <d503e23a-f7ca-3a21-940d-9c57aa5d440a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ac1aca68-5402-746b-8a17-3354e530eafd@citrix.com>
Date: Fri, 26 Jun 2020 12:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d503e23a-f7ca-3a21-940d-9c57aa5d440a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 15/06/2020 16:16, Jan Beulich wrote:
>>>> @@ -58,6 +59,10 @@ int arch_livepatch_safety_check(void)
>>>>  
>>>>  int arch_livepatch_quiesce(void)
>>>>  {
>>>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>>>> +    if ( cpu_has_xen_shstk )
>>>> +        write_cr4(read_cr4() & ~X86_CR4_CET);
>>>> +
>>>>      /* Disable WP to allow changes to read-only pages. */
>>>>      write_cr0(read_cr0() & ~X86_CR0_WP);
>>>>  
>>>> @@ -68,6 +73,29 @@ void arch_livepatch_revive(void)
>>>>  {
>>>>      /* Reinstate WP. */
>>>>      write_cr0(read_cr0() | X86_CR0_WP);
>>>> +
>>>> +    /* Clobber dirty bits and reinstate CET, if applicable. */
>>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
>>>> +    {
>>>> +        unsigned long tmp;
>>>> +
>>>> +        reset_virtual_region_perms();
>>>> +
>>>> +        write_cr4(read_cr4() | X86_CR4_CET);
>>>> +
>>>> +        /*
>>>> +         * Fix up the return address on the shadow stack, which currently
>>>> +         * points at arch_livepatch_quiesce()'s caller.
>>>> +         *
>>>> +         * Note: this is somewhat fragile, and depends on both
>>>> +         * arch_livepatch_{quiesce,revive}() being called from the same
>>>> +         * function, which is currently the case.
>>>> +         */
>>>> +        asm volatile ("rdsspq %[ssp];"
>>>> +                      "wrssq %[addr], (%[ssp]);"
>>>> +                      : [ssp] "=&r" (tmp)
>>>> +                      : [addr] "r" (__builtin_return_address(0)));
>>>> +    }
>>> To be safe against LTO I think this wants accompanying with making
>>> both functions noinline.
>> Hmm true.
>>
>>> As to the fragility - how about arch_livepatch_quiesce() returning
>>> __builtin_return_address(0) to its caller, for passing into here
>>> for verification? This would also make more noticeable that the
>>> two should be be called from the same function (or else the "token"
>>> would need passing further around).
>> This I'm less certain about, as its fairly invasive to common code, just
>> to bodge around something I don't expect to last very long into the 4.15
>> timeframe.
> I don't see it  being invasive - there's a new local variable needed
> in both of apply_payload() and revert_payload(), and of course the
> call sites would need adjustment.

Exactly - the call site adjustment is what makes it invasive in common
code, and all other architectures.

Any getting this wrong will die with #CP[near ret] anyway.

The only thing passing that value around would do is let you tweak the
error message slightly before we crash out.

>>>> @@ -91,6 +92,18 @@ void unregister_virtual_region(struct virtual_region *r)
>>>>      remove_virtual_region(r);
>>>>  }
>>>>  
>>>> +void reset_virtual_region_perms(void)
>>>> +{
>>>> +    const struct virtual_region *region;
>>>> +
>>>> +    rcu_read_lock(&rcu_virtual_region_lock);
>>>> +    list_for_each_entry_rcu( region, &virtual_region_list, list )
>>>> +        modify_xen_mappings((unsigned long)region->start,
>>>> +                            ROUNDUP((unsigned long)region->end, PAGE_SIZE),
>>>> +                            PAGE_HYPERVISOR_RX);
>>>> +    rcu_read_unlock(&rcu_virtual_region_lock);
>>>> +}
>>> Doesn't this result in shattering the trailing (and currently still
>>> only) 2Mb page mapping .text in the xen.efi case?
>> Not any more or less than its already clobbered by this logic in the
>> alternatives path, I think?
> Not afaict, there we have
>
>     if ( cpu_has_xen_shstk )
>         modify_xen_mappings(XEN_VIRT_START + MB(2),
>                             (unsigned long)&__2M_text_end,
>                             PAGE_HYPERVISOR_RX);

Hmm ok.  I'll make a note.

>>>  With the
>>> expectation of the approach changing in 4.15 this may not need
>>> addressing, but should imo be mentioned as a shortcoming in the
>>> description then.
>>>
>>> Also - how about "restore" instead of "reset"?
>> Why?  We're not passing some state sideways into the new mappings -
>> we're resetting them to their expected values.
> To me as a non-native speaker "reset" means more like some initial
> state, whereas "restore" means more like "to some intended state".

I feel that is a very subjective interpretation, but even if we go with
it, the fact the function is void distinguishes the two.

~Andrew

