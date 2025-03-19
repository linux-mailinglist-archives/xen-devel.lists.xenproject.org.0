Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662CA68C27
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920358.1324559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turzF-0002gk-Jx; Wed, 19 Mar 2025 11:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920358.1324559; Wed, 19 Mar 2025 11:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turzF-0002eC-HJ; Wed, 19 Mar 2025 11:53:29 +0000
Received: by outflank-mailman (input) for mailman id 920358;
 Wed, 19 Mar 2025 11:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3vh+=WG=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1turzD-0002e6-P1
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:53:28 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3b8c646-04b8-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 12:53:25 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso4503539f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 04:53:25 -0700 (PDT)
Received: from ?IPV6:2001:4ca0:0:f298:c928:f50:d9c:390e?
 ([2001:4ca0:0:f298:c928:f50:d9c:390e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df31f6sm20696126f8f.6.2025.03.19.04.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:53:24 -0700 (PDT)
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
X-Inumbo-ID: c3b8c646-04b8-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys.tech; s=google; t=1742385205; x=1742990005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojScgRqx2VWqLIGcngAaYu3tTGxI124WLQ8d6UwXSqw=;
        b=z/HZ5bP/MRFit2i1cP9DPacit85K0poqzB8M+FIo+PNm3clT9gTY6caAD43TdhCiga
         KwIlNzNFOqN9VZh9Xc5Eed+3ixwwqZQdVASGHnyofq3F10oBf1KN5dtzaKDM6u16hIPu
         Fkk5HSwBijS7l+NL5dNSx+1FjQNJ7jPMdaFkAiG+Pq46/Gb4d+YSfp3ZeSI3W2cQamly
         UZTdRDTAE4hwmCbQOeVS4QNZ5tzdJeI4dnbFYXw3/JTaVTcjLAetnKBS6Cv4XaNLybrR
         DaIA8VY6FABqhd0nR7yiFZqHwl/Q1hGtrAqF01dCBftDnbGe5fsJOSlPGykB2ccw3lwd
         fAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385205; x=1742990005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojScgRqx2VWqLIGcngAaYu3tTGxI124WLQ8d6UwXSqw=;
        b=qOuWwl9BNZXlJpZDRrJLF0pAvPx4q/hdnKfcwlBL5TSxahJPJkv8R/w92QFkcH7Vv7
         7QfIon7EwZCCNSV33q4hSG3qdDj0gZXwHqxN/hMc609FUreYOT6K+qGi53i3dqxx60Ya
         2NZ1GN3pbySI+2zjlO4Th6fI9NEbYf6pX7j7ZVTgzsN9X6CI21Twy86IlUuHnLBDlBpz
         TGW4LJbRxD8dUBIFzNkWQh/bscpY3DJTrHCf307719AkjgWXXVqJ002xa/dObV6GLbQb
         B4nchfE1gswVhvfraiN5ie8EjLk5h12NAerYcE4BGJjqkJHM0nx7oWAuJG+dHt13aN1n
         uvdA==
X-Forwarded-Encrypted: i=1; AJvYcCVVEv8+XZF6EgRe8alpSo9egbcU9IcrFrgx0f9Xny7DCfs+ziax85/afDSSARnyxNIeTYV7gotB6p0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6I4/CmkW5TCu7T4sG3ndvvfTi200JOusmjTILDRFmBaJLNBd3
	B82Z8TPVY5XA47hpivpcaYVhZvK1smdtbmIrjbKRIrCzlLfiYsRLxt8WyG9DoOU=
X-Gm-Gg: ASbGncvQ0oQmK9nsH7PIPU/oqoRr0ZOr6Y1Miv6gdbu/1UfI2Ea7CLgSpwNU3j5ExG6
	p0+qco4GLYx1y6f2kk2E76d31iGiV06lP8+zM/PsqgV7afTOXP3z6Q2d6Ct0QDRYHLgHr/Pnc5v
	niKrdTbncDb037AZ/mLQx/2RCsl7bOdUIcT4pMCEit28olOlAgp8c5QI9EjI9TPTb/YNk0/XQX5
	cc6CBjIgJKp7NMMQkDamsXQDicuwwUT7vvu1EjNNQj2AKNTE6i9YqHs5kNiNZD6vIUfrTSCwh3i
	AjY49X+6AHu/FlGGeEpRfawsZr4JoBWaxkQm4+agTXDH+yodKIar+Sp3pZ+uqjytj3fr6lQpn7r
	CvBdfRKdRvXjHjfqQ0gUs
X-Google-Smtp-Source: AGHT+IHbk4D8Y+33N61XMvl1CalySe6AckA2gQFFZsxKUKvMAUl1vJmV0CljPC9iboWfQWfyGwNj8g==
X-Received: by 2002:a05:6000:21c5:b0:391:78a:33de with SMTP id ffacd0b85a97d-399739eb2aamr1275687f8f.12.1742385204579;
        Wed, 19 Mar 2025 04:53:24 -0700 (PDT)
Message-ID: <010e8a75-3822-4614-a2ef-2490ea587528@minervasys.tech>
Date: Wed, 19 Mar 2025 12:53:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] analysis of runtime xenheap memory allocations
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, VictorM.Lira@amd.com,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Alex Zuepke <alex.zuepke@minervasys.tech>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, jgross@suse.com,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <53e85609-dba4-4fd2-972c-8c2746074c4a@minervasys.tech>
 <1854625e-c1d4-4c2b-b219-31a6d48f5e47@citrix.com>
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
Autocrypt: addr=andrea.bastoni@minervasys.tech; keydata=
 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
 Id5SuAU=
In-Reply-To: <1854625e-c1d4-4c2b-b219-31a6d48f5e47@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 01:35, Andrew Cooper wrote:
> On 17/03/2025 6:48 pm, Andrea Bastoni wrote:
>> Hi,
>>
>> In the last months we have been working with Stefano's team in AMD at tools to
>> facilitate the analysis of "anonymous" memory allocations performed at "runtime"
>> from the shared Xen heap.
>>
>> - Anonymous here means: allocations that insist on the common Xen heap pool
>>   (i.e., not on a per-domain heap pool).
>> - Runtime here means: system_state >= SYS_STATE_active.
>>
>> TL;DR: A set of patches print a warning stack when anonymous allocations are
>> detected at runtime. Scripts help to parse the stack traces that can be checked
>> to evaluate how problematic certain allocations paths can be or how difficult it
>> could be to update them. A full example of the results is e.g., in [1], and the
>> Readme-details in [2]. Below in the email more details and some commented stack
>> traces.
>>
>> Feedback, especially on the paths that are currently marked as "UNDECIDED"
>> is very welcome.
>>
>> [1]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/x86_64/xilinx-hyperlaunch-x86_64-gcc-debug-virtio-pci-net
>> [2]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/README.md
> 
> Hello,
> 
> A few observations.
> 
> As you note, assigning ownership to current->domain is usually the wrong
> thing.  Setting PGC_allocated however is worse; you've created a
> security vulnerability where guests can free memory that Xen things is
> private to it.
> 
> Similarly, you can't interchange xenheap and domheap like that.  It will
> work on small systems, but not on large ones.  Nevertheless, it's an ok
> start for debugging.

Thank you for the feedback.

As you saw, there are two parts.
Here you're referring to https://gitlab.com/minervasys/public/xen/-/commit/c1d6baae27932d2a7f07e82560deae5f64c5536a
which we used as debugging to find out where the configuration needed
to be updated. This is in a separate branch as the rest of the observations
(minerva/per-domain-xenheap-idea-approach vs minerva/warn)

> Ages ago, I tried to make a start on this problem,
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-fault-ttl
> simply by counting the number of xmalloc()'s to the domain with with
> they were logically associated.  It's stalled because the
> fault-injection test found a refcounting bug and there isn't even an
> agreement on whether it's a bug or not, or how to fix it.

The other part goes along a similar line trying to find e.g., who triggered
the xmalloc.

> I'm struggling to follow the analysis on
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/9207014172 
> However, it appears to be a mix of reports between arm64 and x86_64
> jobs, and they need separating to get a clearer picture.

The job prints a summary of each analyzed log. The actual analysis is created
as artifact of the pipeline and can be downloaded. The output is then
splitted per architecture, similarly to what has been committed here:
https://gitlab.com/minervasys/public/xen/-/tree/minerva/warn/minerva_analysis/1674833972/parsed

> The bottom of each stack trace appears to be doubled.  Is that intentional?

Nice catch. On arm the parser of the logs needs to be modified to
avoid considering this two times:

(XEN) [  240.296766]    [<00000a000022f784>] _xmalloc+0xf0/0x32c (PC)
(XEN) [  240.298386]    [<00000a000022f784>] _xmalloc+0xf0/0x32c (LR)

> Part of the problem is that xmalloc() isn't separated from
> {xen,dom}heap, despite the former being layered on top of the latter. 
> All *heap pages are going to a multiple of 4k as that's the allocation
> unit.  It will probably be better to terminate at _xmalloc() and ignore
> the call down into alloc_domheap_page(). 

Those are tracked separately (and the free also tries to match them
separately): "DEBUG:...xmem_pool_alloc" terminates at the _xmalloc(),
"DEBUG...xmalloc_whole_pages" tracks the replenishments.

> Importantly, _malloc
> allocating another 4k page isn't strictly related to the caller, when
> it's doing so to replenish it's free pool.

Yes, the ownership tracking in free_xenheap_pages() is fuzzy.

> The 1-byte allocations are silly.  bitmap_to_xenctl_bitmap() is buggy
> for trying to cater to an endianness case we simply don't support. 
> There's no memory allocation needed at all.  There are patches to
> resolve this from aaages back, blocked on a request to fix up other
> endian helpers in the meantime.
> 
> evtchn_fifo_init_control() seems to show up a lot, and seems to be the
> only dynamic allocation triggered by the guest itself.  It's reasonably
> large, but probably ought to be allocated up front.  event_fifo is
> pretty ubiquitous these days.  I'm not sure where the alternative sizes
> come from; they ought to all be 392 bytes.

You mean like here?
https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/arm64/qemu-dom0less-arm64-gcc-debug-virtio-pci-net#L222
> // MINERVA: PROB_SAFE
> // 1) evtchn_fifo_init_* should only happen once per domain at boot
> //    (NOTE: Count not always 2)
> // 2) evtchn fifo evtchn can be disabled in favor of the older 2l evtchn
> //    interface that doesn't require allocations (xen_fifo_events=false)
> Domain     : d1
> Occurrences: 2
> Total size : 1424 B
> entry.o#guest_sync_slowpath
>   do_trap_guest_sync
>     traps.c#do_trap_hypercall
>       do_event_channel_op
>         evtchn_fifo_init_control
>           _xzalloc
>             _xmalloc
> 



> I'm concerned by the xfree() in efi_runtime_call() seeing as there's no
> associated allocation that I can see.

The verbose log files contain all the parsed allocation paths
e.g., (https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/x86_64/verbose/xilinx-hyperlaunch-x86_64-gcc-debug-virtio-pci-net#L25)
The summary misses this information. This can be improved.

> Finally, it's not just anonymous allocations you need to worry about. 
> Even ones out of the p2m memory pool are still fatal at the point of
> exhaustion, and can cause safety issues.

Some of the allocations on such paths are tracked, e.g.,

https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/x86_64/xilinx-hyperlaunch-x86_64-gcc-debug-virtio-pci-net#L860
> // MINERVA: UNDECIDED
> // Similar to guest_remove_page
> // allocation related to the memory management of iommu page tables for
> // a domain (the domain is available down the chain).
> // The allocation of the iommu PDE is anonymous.
> // If no memory is available, the domain is crashed.
> // Unclear if only selected VMs can trigger this path.
> Domain     : d0
> Occurrences: 2
> Total size : 8192 B
> svm_stgi_label
>   svm_vmexit_handler
>     hvm_hypercall
>       hvm_memory_op
>         do_memory_op
>           memory.c#xenmem_add_to_physmap_batch
>             xenmem_add_to_physmap_one
>               set_foreign_p2m_entry
>                 p2m.c#set_typed_p2m_entry
>                   p2m_set_entry
>                     p2m-pt.c#p2m_pt_set_entry
>                       iommu_legacy_map
>                         iommu_map
>                           amd_iommu_map_page
>                             iommu_map.c#iommu_pde_from_dfn
>                               iommu_alloc_pgtable
>                                 alloc_domheap_pages

Maybe there is a better place where to terminate / catch these cases?

Thanks,
Andrea

