Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E242E248021
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7wct-0007GJ-BO; Tue, 18 Aug 2020 08:05:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7wcr-0007G6-CL
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:05:45 +0000
X-Inumbo-ID: c5c0ea8d-3680-4a08-900a-c592225d40c8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5c0ea8d-3680-4a08-900a-c592225d40c8;
 Tue, 18 Aug 2020 08:05:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDCBBAD9A;
 Tue, 18 Aug 2020 08:06:08 +0000 (UTC)
Subject: Re: [PATCH 08/14] kernel-doc: public/memory.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, ian.jackson@eu.citrix.com, julien@xen.org,
 wl@xen.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-8-sstabellini@kernel.org>
 <5567ef5a-35c4-6dd8-38f5-348c7c3713b1@suse.com>
 <alpine.DEB.2.21.2008071217590.16004@sstabellini-ThinkPad-T480s>
 <73419983-5300-32ca-2f12-7d3673ad543d@suse.com>
 <alpine.DEB.2.21.2008171523440.15985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bcbee62-150e-5336-47cb-a0fde0a92ad1@suse.com>
Date: Tue, 18 Aug 2020 10:05:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008171523440.15985@sstabellini-ThinkPad-T480s>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 00:56, Stefano Stabellini wrote:
> On Mon, 17 Aug 2020, Jan Beulich wrote:
>> On 07.08.2020 23:51, Stefano Stabellini wrote:
>>> On Fri, 7 Aug 2020, Jan Beulich wrote:
>>>> On 07.08.2020 01:49, Stefano Stabellini wrote:
>>>>> @@ -200,90 +236,115 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
>>>>>   */
>>>>>  #define XENMEM_machphys_compat_mfn_list     25
>>>>>  
>>>>> -/*
>>>>> +#define XENMEM_machphys_mapping     12
>>>>> +/**
>>>>> + * struct xen_machphys_mapping - XENMEM_machphys_mapping
>>>>> + *
>>>>>   * Returns the location in virtual address space of the machine_to_phys
>>>>>   * mapping table. Architectures which do not have a m2p table, or which do not
>>>>>   * map it by default into guest address space, do not implement this command.
>>>>>   * arg == addr of xen_machphys_mapping_t.
>>>>>   */
>>>>> -#define XENMEM_machphys_mapping     12
>>>>>  struct xen_machphys_mapping {
>>>>> +    /** @v_start: Start virtual address */
>>>>>      xen_ulong_t v_start, v_end; /* Start and end virtual addresses.   */
>>>>> -    xen_ulong_t max_mfn;        /* Maximum MFN that can be looked up. */
>>>>> +    /** @v_end: End virtual addresses */
>>>>> +    xen_ulong_t v_end;
>>>>> +    /** @max_mfn: Maximum MFN that can be looked up */
>>>>> +    xen_ulong_t max_mfn;
>>>>>  };
>>>>>  typedef struct xen_machphys_mapping xen_machphys_mapping_t;
>>>>>  DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
>>>>>  
>>>>> -/* Source mapping space. */
>>>>> +/**
>>>>> + * DOC: Source mapping space.
>>>>> + *
>>>>> + * - XENMAPSPACE_shared_info:  shared info page
>>>>> + * - XENMAPSPACE_grant_table:  grant table page
>>>>> + * - XENMAPSPACE_gmfn:         GMFN
>>>>> + * - XENMAPSPACE_gmfn_range:   GMFN range, XENMEM_add_to_physmap only.
>>>>> + * - XENMAPSPACE_gmfn_foreign: GMFN from another dom,
>>>>> + *                             XENMEM_add_to_physmap_batch only.
>>>>> + * - XENMAPSPACE_dev_mmio:     device mmio region ARM only; the region is mapped
>>>>> + *                             in Stage-2 using the Normal MemoryInner/Outer
>>>>> + *                             Write-Back Cacheable memory attribute.
>>>>> + */
>>>>>  /* ` enum phys_map_space { */
>>>>
>>>> Isn't this and ...
>>>>
>>>>> -#define XENMAPSPACE_shared_info  0 /* shared info page */
>>>>> -#define XENMAPSPACE_grant_table  1 /* grant table page */
>>>>> -#define XENMAPSPACE_gmfn         2 /* GMFN */
>>>>> -#define XENMAPSPACE_gmfn_range   3 /* GMFN range, XENMEM_add_to_physmap only. */
>>>>> -#define XENMAPSPACE_gmfn_foreign 4 /* GMFN from another dom,
>>>>> -                                    * XENMEM_add_to_physmap_batch only. */
>>>>> -#define XENMAPSPACE_dev_mmio     5 /* device mmio region
>>>>> -                                      ARM only; the region is mapped in
>>>>> -                                      Stage-2 using the Normal Memory
>>>>> -                                      Inner/Outer Write-Back Cacheable
>>>>> -                                      memory attribute. */
>>>>> +#define XENMAPSPACE_shared_info  0
>>>>> +#define XENMAPSPACE_grant_table  1
>>>>> +#define XENMAPSPACE_gmfn         2
>>>>> +#define XENMAPSPACE_gmfn_range   3
>>>>> +#define XENMAPSPACE_gmfn_foreign 4
>>>>> +#define XENMAPSPACE_dev_mmio     5
>>>>>  /* ` } */
>>>>
>>>> ... this also something that wants converting?
>>>
>>> For clarity, I take you are talking about these two enum-related
>>> comments:
>>>
>>> /* ` enum phys_map_space { */
>>> [... various #defines ... ]
>>> /* ` } */
>>>
>>> Is this something we want to convert to kernel-doc? I don't know. I
>>> couldn't see an obvious value in doing it, in the sense that it doesn't
>>> necessarely make things clearer.
>>>
>>> I took a second look at the header and the following would work:
>>>
>>> /**
>>>  * DOC: Source mapping space.
>>>  *
>>>  * enum phys_map_space {
>>>  *
>>>  * - XENMAPSPACE_shared_info:  shared info page
>>>  * - XENMAPSPACE_grant_table:  grant table page
>>>  * - XENMAPSPACE_gmfn:         GMFN
>>>  * - XENMAPSPACE_gmfn_range:   GMFN range, XENMEM_add_to_physmap only.
>>>  * - XENMAPSPACE_gmfn_foreign: GMFN from another dom,
>>>  *                             XENMEM_add_to_physmap_batch only.
>>>  * - XENMAPSPACE_dev_mmio:     device mmio region ARM only; the region is mapped
>>>  *                             in Stage-2 using the Normal MemoryInner/Outer
>>>  *                             Write-Back Cacheable memory attribute.
>>>  * }
>>>  */
>>>
>>> Note the blank line after "enum phys_map_space {" is required.
>>>
>>>
>>> All in all I am in favor of *not* converting the enum comment to
>>> kernel-doc, but I'd be OK with it anyway.
>>
>> Iirc the enum comments were added for documentation purposes. This to
>> me means there are two options at this point:
>> - retain them in a way that the new doc model consumes them,
>> - drop them at the same time as adding the new doc comments.
>>
>> Their (presumed) value is that they identify #define-s which supposed
>> to be enum-like without actually being able to use enums in the public
>> headers (with some exceptions).
> 
> I understand. Then, it doesn't look like we want to keep them in the code
> without converting them to kernel-doc. We could either:
> 
> 1) remove them as part of this series
> 2) convert them to kernel-doc in the top comment as shown above
> 
> I could do either, but my preference is 1) because I think it leads to
> clearer docs.

While I'd slightly prefer 2, I'll be okay with your choice.

Jan

