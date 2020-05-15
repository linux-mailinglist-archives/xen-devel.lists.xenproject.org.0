Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B01D4D69
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 14:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZZ7Q-0006rr-4t; Fri, 15 May 2020 12:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E4v=65=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZZ7P-0006rm-5Q
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 12:07:11 +0000
X-Inumbo-ID: 99e03b28-96a4-11ea-a556-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99e03b28-96a4-11ea-a556-12813bfff9fa;
 Fri, 15 May 2020 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C+ktQXzlviggagCmERPsVH4THlGkI7d1rhffwZriee0=; b=LCN4K2mYlOsPOIlJcIM/jUT5lT
 CKLaK5vHA0OwSN/aozX/YawKTZ8jE8MgBdmj7JrZ8CRC5Gws+Bl0I38l7aS+lBiEOgcyCuyK+JM5g
 v+aH2pAlJP24mfd+OehI+YMfbmYSWTfG9dxQLC+IonsqbCRB3Z5ti/VJXVg8AUG0Eoio=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZZ7L-0006f2-Tr; Fri, 15 May 2020 12:07:07 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZZ7L-0001H5-BS; Fri, 15 May 2020 12:07:07 +0000
Subject: Re: Error during update_runstate_area with KPTI activated
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <93D7EBEF-E3E0-4DBB-A5BC-7D326B7AE0DB@arm.com>
 <355d0b59-29d4-a483-73a3-3cdd468c0b77@xen.org>
 <0E6DD742-3C79-4CD2-93A1-6D054377A919@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <19ea976d-5d62-db57-28b2-116b0c4da03f@xen.org>
Date: Fri, 15 May 2020 13:07:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0E6DD742-3C79-4CD2-93A1-6D054377A919@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Hongyan Xia <hx242@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 15/05/2020 11:10, Bertrand Marquis wrote:
> 
> 
>> On 15 May 2020, at 11:00, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 15/05/2020 10:21, Bertrand Marquis wrote:
>>>> On 15 May 2020, at 10:10, Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
>>>>
>>>> On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 15/05/2020 09:38, Roger Pau Monné wrote:
>>>>>> On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com <mailto:julien.grall.oss@gmail.com><mailto:julien.grall.oss@gmail.com>> wrote:
>>>>>>>
>>>>>>> On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com><mailto:andrew.cooper3@citrix.com>> wrote:
>>>>>>>
>>>>>>> On 14/05/2020 18:38, Julien Grall wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 14/05/2020 17:18, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org <mailto:julien@xen.org><mailto:julien@xen.org>> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 14/05/2020 15:28, Bertrand Marquis wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> When executing linux on arm64 with KPTI activated (in Dom0 or in a
>>>>>>> DomU), I have a lot of walk page table errors like this:
>>>>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>>>>>>> 0xffffff837ebe0cd0
>>>>>>> After implementing a call trace, I found that the problem was
>>>>>>> coming from the update_runstate_area when linux has KPTI activated.
>>>>>>> I have the following call trace:
>>>>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>>>>>>> 0xffffff837ebe0cd0
>>>>>>> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
>>>>>>> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
>>>>>>> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
>>>>>>> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
>>>>>>> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
>>>>>>> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
>>>>>>> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
>>>>>>> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
>>>>>>> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
>>>>>>> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
>>>>>>> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
>>>>>>> Discussing this subject with Stefano, he pointed me to a discussion
>>>>>>> started a year ago on this subject here:
>>>>>>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
>>>>>>>
>>>>>>> And a patch was submitted:
>>>>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
>>>>>>>
>>>>>>> I rebased this patch on current master and it is solving the
>>>>>>> problem I have seen.
>>>>>>> It sounds to me like a good solution to introduce a
>>>>>>> VCPUOP_register_runstate_phys_memory_area to not depend on the area
>>>>>>> actually being mapped in the guest when a context switch is being
>>>>>>> done (which is actually the problem happening when a context switch
>>>>>>> is trigger while a guest is running in EL0).
>>>>>>> Is there any reason why this was not merged at the end ?
>>>>>>>
>>>>>>> I just skimmed through the thread to remind myself the state.
>>>>>>> AFAICT, this is blocked on the contributor to clarify the intended
>>>>>>> interaction and provide a new version.
>>>>>>>
>>>>>>> What do you mean here by intended interaction ? How the new hyper
>>>>>>> call should be used by the guest OS ?
>>>>>>>
>>>>>>>  From what I remember, Jan was seeking clarification on whether the two
>>>>>>> hypercalls (existing and new) can be called together by the same OS
>>>>>>> (and make sense).
>>>>>>>
>>>>>>> There was also the question of the handover between two pieces of
>>>>>>> sotfware. For instance, what if the firmware is using the existing
>>>>>>> interface but the OS the new one? Similar question about Kexecing a
>>>>>>> different kernel.
>>>>>>>
>>>>>>> This part is mostly documentation so we can discuss about the approach
>>>>>>> and review the implementation.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I am still in favor of the new hypercall (and still in my todo list)
>>>>>>> but I haven't yet found time to revive the series.
>>>>>>>
>>>>>>> Would you be willing to take over the series? I would be happy to
>>>>>>> bring you up to speed and provide review.
>>>>>>>
>>>>>>> Sure I can take it over.
>>>>>>>
>>>>>>> I ported it to master version of xen and I tested it on a board.
>>>>>>> I still need to do a deep review of the code myself but I have an
>>>>>>> understanding of the problem and what is the idea.
>>>>>>>
>>>>>>> Any help to get on speed would be more then welcome :-)
>>>>>>> I would recommend to go through the latest version (v3) and the
>>>>>>> previous (v2). I am also suggesting v2 because I think the split was
>>>>>>> easier to review/understand.
>>>>>>>
>>>>>>> The x86 code is probably what is going to give you the most trouble as
>>>>>>> there are two ABIs to support (compat and non-compat). If you don't
>>>>>>> have an x86 setup, I should be able to test it/help write it.
>>>>>>>
>>>>>>> Feel free to ask any questions and I will try my best to remember the
>>>>>>> discussion from last year :).
>>>>>>>
>>>>>>> At risk of being shouted down again, a new hypercall isn't necessarily
>>>>>>> necessary, and there are probably better ways of fixing it.
>>>>>>>
>>>>>>> The underlying ABI problem is that the area is registered by virtual
>>>>>>> address.  The only correct way this should have been done is to register
>>>>>>> by guest physical address, so Xen's updating of the data doesn't
>>>>>>> interact with the guest pagetable settings/restrictions.  x86 suffers
>>>>>>> the same kind of problems as ARM, except we silently squash the fallout.
>>>>>>>
>>>>>>> The logic in Xen is horrible, and I would really rather it was deleted
>>>>>>> completely, rather than to be kept for compatibility.
>>>>>>>
>>>>>>> The runstate area is always fixed kernel memory and doesn't move.  I
>>>>>>> believe it is already restricted from crossing a page boundary, and we
>>>>>>> can calculate the va=>pa translation when the hypercall is made.
>>>>>>>
>>>>>>> Yes - this is a technically ABI change, but nothing is going to break
>>>>>>> (AFAICT) and the cleanup win is large enough to make this a *very*
>>>>>>> attractive option.
>>>>>>>
>>>>>>> I suggested this approach two years ago [1] but you were the one
>>>>>>> saying that buffer could cross page-boundary on older Linux [2]:
>>>>>>>
>>>>>>> "I'd love to do this, but we cant.  Older Linux used to have a virtual
>>>>>>> buffer spanning a page boundary.  Changing the behaviour under that will
>>>>>>> cause older setups to explode."
>>>>>>
>>>>>> Sorry this was long time ago, and details have faded. IIRC there was
>>>>>> even a proposal (or patch set) that took that into account and allowed
>>>>>> buffers to span across a page boundary by taking a reference to two
>>>>>> different pages in that case.
>>>>>
>>>>> I am not aware of a patch set. Juergen suggested a per-domain mapping but
>>>>> there was no details how this could be done (my e-mail was left unanswered
>>>>> [1]).
>>>>>
>>>>> If we were using the vmap() then we would need up 1MB per domain (assuming
>>>>> 128 vCPUs). This sounds quite a bit and I think we need to agree whether it
>>>>> would be an acceptable solution (this was also left unanswered [1]).
>>>>
>>>> Could we map/unmap the runtime area on domain switch at a per-cpu
>>>> based linear space area? There's no reason to have all the runtime
>>>> areas mapped all the time, you just care about the one from the
>>>> running vcpu.
>>>>
>>>> Maybe the overhead of that mapping and unmapping would be
>>>> too high? But seeing that we are aiming at a secret-free Xen we would
>>>> have to eventually go that route anyway.
>>> Maybe the new hypercall should be a bit different:
>>> - we have this area allocated already inside Xen and we do a copy of it on any context switch
>>> - the guest is not supposed to modify any data in this area
>>> We could introduce a new hypercall:
>>> - Xen allocate the runstate area using a page aligned address and size
>>
>> At the moment the runstate is 40 bytes. If we were going to follow this proposal, I would recommend to try to have as many runstate as possible in your page.
>>
>> Otherewise, you would waste 4056 bytes per vCPU in both Xen and the guest OS. This would even be worse for 64KB kernel.
> 
> Agree, so it should be one call to have an area with the runstate for all vCPUs, ensure a vCPU runstate has a size and an address which are cache line size aligned to prevent coherency stress.

One 4KB region only going to cover 64 vCPUs. So you would need multiple 
pages. This brings more question on how this would work for vCPU 
online/offline or even hotplug.

The code required in the guest to track them is going to be more complex 
either in Xen or the guest.

> 
>>
>>
>>> - the guest provide a free guest physical space to the hypercall
>>
>> This part is the most tricky part. How does the guest know what is free in its physical address space?
>>
>> I am not aware of any way to do this in Linux. So the best you could do would be to allocate a page from the RAM and tell Xen to replace it with the runstate mapping.
>>
>> However, this also means you are going to possibly shatter a superpage in the P2M. This may affect the performance in long-run.
> 
> Very true, Linux does not have a way to do that.
> What about going the other way around: Xen can provide the physical address to the guest.

Right now, the hypervisor doesn't have an easy to know the layout. Only 
the toolstack has. So you would need a way to tell Xen where the region 
has been reserved.

This region would have to be allocated below 4GB to cater all the type 
of guest. A guest may not use them at all (time accounting is not 
mandatory).

Even if this is a few pages, this is not very ideal. It would be best if 
you let the guest allocate some RAM and then pass the address to Xen.

> 
>>
>>> - Xen maps read-only its own area to the guest at the provided address
>>> - Xen shall not modify any data in the runstate area of other cores/guests (should already be the case)
>>> - We keep the current hypercall for backward compatibility and map the areal during the hypercall and keep the area mapped at all time, we keep doing the copy during context switches
>>> This would highly reduce the overhead by removing the mapping/unmapping.
>>
>> I don't think the overhead is going to be significant with domain_map_page()/domain_unmap_page().
>>
>> On Arm64, the memory is always mapped so map/unmap is a NOP. On Arm32, we have a fast map/unmap implementation.
>>
>> On x86, without SH, most of the memory is also always mapped. So this operation is mostly a NOP. For the SH case, the map/unmap will be used in any access to the guest memory (such as hypercalls access) but it is quite optimized.
>>
>> Note that the current overhead is much more important today as you need to walk the guest PT and P2M (we are talking at multiple map/unmap). So moving to one map/unmap is already going to be a major improvement.
> 
> Agree
> 
>>
>>> Regarding the secret free I do not really think this is something problematic here as we already have a copy of this internally anyway
>>
>> The secret free work is still under review, so what is done in Xen today shouldn't dictate the future.
>>
>> The question to answer is whether we believe leaking the content may be a problem. If the answer is yes, then most likely we will want the internal representation to be mapped on demand or just mapped for Xen PT associated for that domain.
>>
>> My gut feeling is the runstate content is not critical. But I haven't fully thought through yet.
> 
> The runstate information is stored inside xen and then copied to the guest memory during context switch. So even if the guest area is not mapped, this information is still available inside the xen internal copy.
Again, Xen is not secret free today. So the fact Xen has an internal 
copy doesn't mean it is fine to leak the content. For instance, the 
guests' memory regions are always mapped, does it mean the content is 
not sensitive? Definitely not. Hence why the effort behind Secret Hiding.

As I wrote in my previous e-mail, *if* we consider the leaking a 
problem, then we would want the *internal* representation to be mapped 
on demande or just mapped for Xen PT associated for that domain.

But... the runstate area doesn't use up a full page. Today the page may 
also contain secret from a domain. If you always map it, then there is a 
risk to leak that content. This would have to be taken into 
consideration if we follow Roger's approach.
Cheers,

-- 
Julien Grall

