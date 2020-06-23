Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC8205113
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 13:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnhN2-0002Bo-71; Tue, 23 Jun 2020 11:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O2Jt=AE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnhN0-0002Bj-Po
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 11:45:42 +0000
X-Inumbo-ID: 108adb0a-b547-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 108adb0a-b547-11ea-b7bb-bc764e2007e4;
 Tue, 23 Jun 2020 11:45:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A63AAF9C;
 Tue, 23 Jun 2020 11:45:40 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200618160403.35199-1-roger.pau@citrix.com>
 <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
 <20200622093123.GI735@Air-de-Roger>
 <5ad66ef4-9406-f35a-5683-ac4608242dd7@suse.com>
 <20200622132410.GJ735@Air-de-Roger>
 <b3142168-09c8-67e8-d210-05f54761051c@suse.com>
 <20200622145659.GL735@Air-de-Roger>
 <9848eebc-f904-cb2f-b5e1-499f5ce6994b@suse.com>
 <20200623092543.GQ735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e994ef6-eeb1-a3d7-2912-b4ab18b64edb@suse.com>
Date: Tue, 23 Jun 2020 13:45:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623092543.GQ735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.06.2020 11:25, Roger Pau Monné wrote:
> On Mon, Jun 22, 2020 at 05:30:11PM +0200, Jan Beulich wrote:
>> On 22.06.2020 16:56, Roger Pau Monné wrote:
>>> On Mon, Jun 22, 2020 at 03:51:24PM +0200, Jan Beulich wrote:
>>>> On 22.06.2020 15:24, Roger Pau Monné wrote:
>>>>> On Mon, Jun 22, 2020 at 01:07:10PM +0200, Jan Beulich wrote:
>>>>>> On 22.06.2020 11:31, Roger Pau Monné wrote:
>>>>>>> On Fri, Jun 19, 2020 at 04:06:55PM +0200, Jan Beulich wrote:
>>>>>>>> On 18.06.2020 18:04, Roger Pau Monne wrote:
>>>>>>>>> Commit e9aca9470ed86 introduced a regression when avoiding sending
>>>>>>>>> IPIs for certain flush operations. Xen page fault handler
>>>>>>>>> (spurious_page_fault) relies on blocking interrupts in order to
>>>>>>>>> prevent handling TLB flush IPIs and thus preventing other CPUs from
>>>>>>>>> removing page tables pages. Switching to assisted flushing avoided such
>>>>>>>>> IPIs, and thus can result in pages belonging to the page tables being
>>>>>>>>> removed (and possibly re-used) while __page_fault_type is being
>>>>>>>>> executed.
>>>>>>>>>
>>>>>>>>> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
>>>>>>>>> TLB flush. Those selected flushes are the page type change (when
>>>>>>>>> switching from a page table type to a different one, ie: a page that
>>>>>>>>> has been removed as a page table) and page allocation. This sadly has
>>>>>>>>> a negative performance impact on the pvshim, as less assisted flushes
>>>>>>>>> can be used.
>>>>>>>>>
>>>>>>>>> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
>>>>>>>>> using an IPI (flush_tlb_mask_sync). Note that the flag is only
>>>>>>>>> meaningfully defined when the hypervisor supports PV mode, as
>>>>>>>>> otherwise translated domains are in charge of their page tables and
>>>>>>>>> won't share page tables with Xen, thus not influencing the result of
>>>>>>>>> page walks performed by the spurious fault handler.
>>>>>>>>
>>>>>>>> Is this true for shadow mode? If a page shadowing a guest one was
>>>>>>>> given back quickly enough to the allocator and then re-used, I think
>>>>>>>> the same situation could in principle arise.
>>>>>>>
>>>>>>> Hm, I think it's not applicable to HVM shadow mode at least, because
>>>>>>> CR3 is switched as part of vmentry/vmexit, and the page tables are not
>>>>>>> shared between Xen and the guest, so there's no way for a HVM shadow
>>>>>>> guest to modify the page-tables while Xen is walking them in
>>>>>>> spurious_page_fault (note spurious_page_fault is only called when the
>>>>>>> fault happens in non-guest context).
>>>>>>
>>>>>> I'm afraid I disagree, because of shadow's use of "linear page tables".
>>>>>
>>>>> You will have to bear with me, but I don't follow.
>>>>>
>>>>> Could you provide some pointers at how/where the shadow (I assume
>>>>> guest controlled) "linear page tables" are used while in Xen
>>>>> context?
>>>>
>>>> See config.h:
>>>>
>>>> /* Slot 258: linear page table (guest table). */
>>>> #define LINEAR_PT_VIRT_START    (PML4_ADDR(258))
>>>> #define LINEAR_PT_VIRT_END      (LINEAR_PT_VIRT_START + PML4_ENTRY_BYTES)
>>>> /* Slot 259: linear page table (shadow table). */
>>>> #define SH_LINEAR_PT_VIRT_START (PML4_ADDR(259))
>>>> #define SH_LINEAR_PT_VIRT_END   (SH_LINEAR_PT_VIRT_START + PML4_ENTRY_BYTES)
>>>>
>>>> These linear page tables exist in the Xen page tables at basically
>>>> all times as long as a shadow guest's vCPU is in context. They're
>>>> there to limit the overhead of accessing guest page tables and
>>>> their shadows from inside Xen.
>>>
>>> Oh, I have to admit I know very little about all this, and I'm not
>>> able to find a description of how this is to be used.
>>>
>>> I think the shadow linear page tables should be per-pCPU, and hence
>>> they cannot be modified by the guest while a spurious page fault is
>>> being processed? (since the vCPU running on the pCPU is in Xen
>>> context).
>>
>> A guest would have for some linear address e.g.
>>
>> vCR3 -> G4 -> G3 -> G2 -> G1
>>
>> visible to some random set of its CPUs (i.e. the same CR3 can be in
>> use by multiple vCPU-s). This will then have shadows like this:
>>
>> pCR3 -> S4 -> S3 -> S2 -> S1
>>
>> The G4 page gets hooked up into LINEAR_PT (i.e. becomes an L3 page)
>> for all vCPU-s that have this very CR3 active. Same goes for S4 and
>> SH_LINEAR_PT respectively. Afaik shadows of guest page tables also
>> don't get created on a per-pCPU basis - a page table either has a
>> shadow, or it doesn't.
>>
>> Hence afaict page tables mapped through these facilities (and
>> reachable while in Xen) can very well be modified "behind our backs".
> 
> Oh, I see. I'm still slightly puzzled because __hvm_copy seems to
> always map the guest page, and sh_gva_to_gfn also seems to just walk
> the guest page tables using the software implemented page table
> walker, and returns a gfn (not a mfn). I was expecting __hvm_copy to
> somehow make use of those shadow page tables when performing accesses
> to guest memory?

No, that's using the guest page table walker plus the p2m table
instead.

> Is shadow code using some of this internally then?

Yes. Just grep the shadow code for linear_l[1234]_table to find
the uses.

Jan

