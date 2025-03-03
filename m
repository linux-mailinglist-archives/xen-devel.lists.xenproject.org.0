Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7865A4B9E1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899941.1307868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1Xn-0002I0-UA; Mon, 03 Mar 2025 08:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899941.1307868; Mon, 03 Mar 2025 08:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1Xn-0002Fm-QS; Mon, 03 Mar 2025 08:52:59 +0000
Received: by outflank-mailman (input) for mailman id 899941;
 Mon, 03 Mar 2025 08:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8eIf=VW=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1tp1Xm-0001Dj-Ny
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:52:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e67fc786-f80c-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 09:52:57 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-C-bCpjm-MzmIWUy8hFaF0A-1; Mon, 03 Mar 2025 03:52:52 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so21868125e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 00:52:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb?
 (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de.
 [2003:cb:c734:9600:af27:4326:a216:2bfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b8d6bc3fcsm122643735e9.0.2025.03.03.00.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 00:52:50 -0800 (PST)
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
X-Inumbo-ID: e67fc786-f80c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740991976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L2Teo9Rbchbz42+Q6lAs3ttlkWMO9/zXQmWUHGDFFeQ=;
	b=MvR+cGPavUsl3/jZDJh1Rh1PIvLsQCP03A6RihuXRMrIkjjAZek80A8iKCIBrSI5qXBSzE
	rDU6CSLl5LX+mjnz2S1i7gEEnfhMa1PmTGAB2xzE0B+nHjh8b4bvXotEJYBMnOskmVMS3P
	VHzFzpMFHZXlBei1szpvTEgVC7fQ+04=
X-MC-Unique: C-bCpjm-MzmIWUy8hFaF0A-1
X-Mimecast-MFC-AGG-ID: C-bCpjm-MzmIWUy8hFaF0A_1740991971
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991971; x=1741596771;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L2Teo9Rbchbz42+Q6lAs3ttlkWMO9/zXQmWUHGDFFeQ=;
        b=S9GQG8TkcfEsRIA8JMJFZJaNBthy0Q+uxm9FtGtyfMpik05GS4qDCnMo68Lgn+884D
         8jl+UrE+8iV8iJMPqSDZPLZ4YO12raVXvkmzGqjfpyNCpWcsVq7bOaQ8hiHdbF/SvrRv
         lUL6pRXGVZfmZ/Zwo3/N/u+dmTB6LQjIwAJAZ4kgMUJohB/dReSkg14ToU0bY6YtSQNX
         8an4jOSKU3Q7686rIwB7wHl5bSmhUOvqVxqU4a8Fn3IQodFcsMcqM+ryIxrVetTMGqMH
         N1jxyoCbvyoz0vNLywDkOQM0AmIDiMSNR4JjzphfVMbQwgR7s912kHWidolgs26r7+zg
         lP1w==
X-Forwarded-Encrypted: i=1; AJvYcCWXXAfvJwmPMVeQQmgna2K76mi30BQi+fFpJ/RXZnc2po3vs+Q7ARq+xRAfwgPsMIKQHQPFwIFsT2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6/FRZjFg+gw48vzRyMawo4chYCfCDmlMdWvLRYGHHEf4cajSW
	WeDXzQCBqxc/m7WhjbapXY4o6AC9MMA2n3y+y/hzesV/aaOZHkZAnZxLoMzI3appwN2JuEcVpuz
	ruI0DargVXMzGFyPu9GtoLWCEZDrJITw8zjwyTgTZjniGPQ7v9Axj3312NPCfLdHS
X-Gm-Gg: ASbGncuyrVftgqcq87ozBJaBRKVyo2JHTjZRa083YZKKTLthDEwvdv84M4wGuvXJUNQ
	8kSyWeLPFw3beO1UNadZWF172l5ZgRd1+Ge6JomkQo43BKq2VEm9h6Haei/xII+PaR1vIXSBCp1
	7oBQ7LIQAKhDaBWi/Q51DaNcyzczjVUik6SnXxKJGPLmkUy1Q3VME+1L0CL4d5QeinmHAqDybuw
	CgnoMBloyg0RoLtuWrqGdEeXXssFuIa3Rfqer9vLZSoOkb4A7r6eNEUCy5ii8Aj6M+tVpIs2W5C
	cu39exGQxNa7PsGg4efDHxNnY4zqX1Z66lXURXb+tyw6A8b7ZY/rbZPni1fm3+hei1ZB1CWCI+I
	5gkArE5wJJGq1TNWSVXRzHRUQI5MW1VqBNOs6SvLBDoo=
X-Received: by 2002:a05:600c:1c9f:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43ba6188e94mr94869005e9.0.1740991971264;
        Mon, 03 Mar 2025 00:52:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlTwiOKza9n0r0V0jJ5URyFDI8eh36wv7IjAnT7iFLb3kZ3OtN1WSRH/ph1nyV3LFOLXmlUQ==
X-Received: by 2002:a05:600c:1c9f:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43ba6188e94mr94868805e9.0.1740991970936;
        Mon, 03 Mar 2025 00:52:50 -0800 (PST)
Message-ID: <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
Date: Mon, 3 Mar 2025 09:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix lazy mmu docs and usage
From: David Hildenbrand <david@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-2-ryan.roberts@arm.com>
 <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tpv313W1E65ElnzQsY90QfiHRetdgtoNAse6-aAXzw4_1740991971
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.03.25 09:49, David Hildenbrand wrote:
> On 02.03.25 15:55, Ryan Roberts wrote:
>> The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
>> is a bit of a mess (to put it politely). There are a number of issues
>> related to nesting of lazy mmu regions and confusion over whether the
>> task, when in a lazy mmu region, is preemptible or not. Fix all the
>> issues relating to the core-mm. Follow up commits will fix the
>> arch-specific implementations. 3 arches implement lazy mmu; powerpc,
>> sparc and x86.
>>
>> When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
>> 6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
>> expected that lazy mmu regions would never nest and that the appropriate
>> page table lock(s) would be held while in the region, thus ensuring the
>> region is non-preemptible. Additionally lazy mmu regions were only used
>> during manipulation of user mappings.
>>
>> Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
>> updates") started invoking the lazy mmu mode in apply_to_pte_range(),
>> which is used for both user and kernel mappings. For kernel mappings the
>> region is no longer protected by any lock so there is no longer any
>> guarantee about non-preemptibility. Additionally, for RT configs, the
>> holding the PTL only implies no CPU migration, it doesn't prevent
>> preemption.
>>
>> Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
>> arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
>> set_ptes(), used by x86. So after this commit, lazy mmu regions can be
>> nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
>> page table range API") and commit 9fee28baa601 ("powerpc: implement the
>> new page table range API") did the same for the sparc and powerpc
>> set_ptes() overrides.
>>
>> powerpc couldn't deal with preemption so avoids it in commit
>> b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
>> which explicitly disables preemption for the whole region in its
>> implementation. x86 can support preemption (or at least it could until
>> it tried to add support nesting; more on this below). Sparc looks to be
>> totally broken in the face of preemption, as far as I can tell.
>>
>> powewrpc can't deal with nesting, so avoids it in commit 47b8def9358c
>> ("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
>> which removes the lazy mmu calls from its implementation of set_ptes().
>> x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
>> nesting of same lazy mode") but as far as I can tell, this breaks its
>> support for preemption.
>>
>> In short, it's all a mess; the semantics for
>> arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
>> result the implementations all have different expectations, sticking
>> plasters and bugs.
>>
>> arm64 is aiming to start using these hooks, so let's clean everything up
>> before adding an arm64 implementation. Update the documentation to state
>> that lazy mmu regions can never be nested, must not be called in
>> interrupt context and preemption may or may not be enabled for the
>> duration of the region.
>>
>> Additionally, update the way arch_[enter|leave]_lazy_mmu_mode() is
>> called in pagemap_scan_pmd_entry() to follow the normal pattern of
>> holding the ptl for user space mappings. As a result the scope is
>> reduced to only the pte table, but that's where most of the performance
>> win is. While I believe there wasn't technically a bug here, the
>> original scope made it easier to accidentally nest or, worse,
>> accidentally call something like kmap() which would expect an immediate
>> mode pte modification but it would end up deferred.
>>
>> arch-specific fixes to conform to the new spec will proceed this one.
>>
>> These issues were spotted by code review and I have no evidence of
>> issues being reported in the wild.
>>
> 
> All looking good to me!
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 

... but I do wonder if the set_ptes change should be split from the 
pagemap change.

-- 
Cheers,

David / dhildenb


