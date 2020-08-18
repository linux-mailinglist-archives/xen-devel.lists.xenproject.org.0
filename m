Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7562485A8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81Ly-0004Qx-Va; Tue, 18 Aug 2020 13:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k81Lx-0004Qr-F7
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:08:37 +0000
X-Inumbo-ID: 77332b2d-4e9b-48a9-917e-9cdbc8e0214d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77332b2d-4e9b-48a9-917e-9cdbc8e0214d;
 Tue, 18 Aug 2020 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Yvs2S7Tdhc/B66yzwTk2IzSt9D56A+hrM3un3SkH/hg=; b=wAyx0PsYylaLlYXu+YKlNCTOwg
 PW+k5fhKnEdtlgDq2femRWmDZ3qFhet2/NquXGdGcIrr95DddUKdABJBq4YBlFHYDrkbXpFl9ZzZ5
 Fs7pYEh+i/bKTPB448kFs783f8s8WpMYp3ZwN2UTAttSjXhguiPcBrXuj/uVwzFapr2c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k81Lt-0004S3-O1; Tue, 18 Aug 2020 13:08:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k81Lt-0002IN-9Y; Tue, 18 Aug 2020 13:08:33 +0000
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org,
 jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
 <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
 <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3db3081d-232a-cce1-cfce-c657be64a0dd@xen.org>
Date: Tue, 18 Aug 2020 14:08:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 18/08/2020 12:30, Jan Beulich wrote:
> On 18.08.2020 12:13, Julien Grall wrote:
>> Hi Jan,
>>
>> On 18/08/2020 09:49, Jan Beulich wrote:
>>> On 13.08.2020 19:22, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 13/08/2020 17:08, Hongyan Xia wrote:
>>>>> On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
>>>>>> On 27.07.2020 16:21, Hongyan Xia wrote:
>>>>>>> From: Wei Liu <wei.liu2@citrix.com>
>>>>>>>
>>>>>>> Rewrite those functions to use the new APIs. Modify its callers to
>>>>>>> unmap
>>>>>>> the pointer returned. Since alloc_xen_pagetable_new() is almost
>>>>>>> never
>>>>>>> useful unless accompanied by page clearing and a mapping, introduce
>>>>>>> a
>>>>>>> helper alloc_map_clear_xen_pt() for this sequence.
>>>>>>>
>>>>>>> Note that the change of virt_to_xen_l1e() also requires
>>>>>>> vmap_to_mfn() to
>>>>>>> unmap the page, which requires domain_page.h header in vmap.
>>>>>>>
>>>>>>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>>>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> ---
>>>>>>> Changed in v8:
>>>>>>> - s/virtual address/linear address/.
>>>>>>> - BUG_ON() on NULL return in vmap_to_mfn().
>>>>>>
>>>>>> The justification for this should be recorded in the description. In
>>>>>
>>>>> Will do.
>>>>>
>>>>>> reply to v7 I did even suggest how to easily address the issue you
>>>>>> did notice with large pages, as well as alternative behavior for
>>>>>> vmap_to_mfn().
>>>>>
>>>>> One thing about adding SMALL_PAGES is that vmap is common code and I am
>>>>> not sure if the Arm side is happy with it.
>>>>
>>>> At the moment, Arm is only using small mapping but I plan to change that soon because we have regions that can be fairly big.
>>>>
>>>> Regardless that, the issue with vmap_to_mfn() is rather x86 specific. So I don't particularly like the idea to expose such trick in common code.
>>>>
>>>> Even on x86, I think this is not the right approach. Such band-aid will impact the performance as, assuming superpages are used, it will take longer to map and add pressure on the TLBs.
>>>>
>>>> I am aware that superpages will be useful for LiveUpdate, but is there any use cases in upstream?
>>>
>>> Superpage use by vmalloc() is purely occasional: You'd have to vmalloc()
>>> 2Mb or more _and_ the page-wise allocation ought to return 512
>>> consecutive pages in the right order. Getting 512 consecutive pages is
>>> possible in practice, but with the page allocator allocating top-down it
>>> is very unlikely for them to be returned in increasing-sorted order.
>> So your assumption here is vmap_to_mfn() can only be called on vmalloc-ed() area. While this may be the case in Xen today, the name clearly suggest it can be called on all vmap-ed region.
> 
> No, I don't make this assumption, and I did spell this out in an earlier
> reply to Hongyan: Parties using vmap() on a sufficiently large address
> range with consecutive MFNs simply have to be aware that they may not
> call vmap_to_mfn().

You make it sounds easy to be aware, however there are two 
implementations of vmap_to_mfn() (one per arch). Even looking at the x86 
version, it is not obvious there is a restriction.

So I am a bit concerned of the "misuse" of the function. This could 
possibly be documented. Although, I am not entirely happy to restrict 
the use because of x86.

> And why would they? They had the MFNs in their hands
> at the time of mapping, so no need to (re-)obtain them by looking up the
> translation.

It may not always be convenient to keep the MFN in hand for the duration 
of the mapping.

An example was discussed in [1]. Roughly, the code would look like:

acpi_os_alloc_memory(...)
{
      mfn = alloc_boot_pages(...);
      vmap(mfn, ...);
}


acpi_os_free_memory(...)
{
     mfn = vmap_to_mfn(...);
     vunmap(...);

     init_boot_pages(mfn, ...);
}

>>>> If not, could we just use the BUG_ON() and implement correctly vmap_to_mfn() in a follow-up?
>>>
>>> My main concern with the BUG_ON() is that it detects a problem long after
>>> it was introduced (when the mapping was established). I'd rather see a
>>> BUG_ON() added there if use of MAP_SMALL_PAGES is deemed unsuitable.
>>
>>  From what you wrote, I would agree that vmalloc() is unlikely going to use superpages. But this is not going to solve the underlying problem with the rest of the vmap area.
>>
>> So are you suggesting to use MAP_SMALL_PAGES for *all* the vmap()?
> 
> As per above - no.
> 
> Jan
> 

[1] 
<a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>

-- 
Julien Grall

