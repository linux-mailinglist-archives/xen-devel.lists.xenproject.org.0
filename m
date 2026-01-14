Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21860D1D3BF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 09:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202679.1518133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwYo-0001ue-DG; Wed, 14 Jan 2026 08:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202679.1518133; Wed, 14 Jan 2026 08:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwYo-0001t8-9u; Wed, 14 Jan 2026 08:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1202679;
 Wed, 14 Jan 2026 08:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfwYn-0001qy-AX
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 08:49:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb7c1b7-f125-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 09:49:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso66606335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 00:49:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee54b90d5sm17229895e9.2.2026.01.14.00.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:48:59 -0800 (PST)
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
X-Inumbo-ID: deb7c1b7-f125-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768380540; x=1768985340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xiGVfVIHdprF755XGvSlBfxNYTkiMWZtddiwyb5XCgA=;
        b=NeG/+/TX33LwlFgHGRBgAg3IJdN8W7jsvMrMwLvcIUiVasF7jqJTFa+2pkp4vuv/vZ
         gmh6zXI/ymht8zUr2BJgfgcOdCQ+XZOjc7UjiDGc8UM9XPKfvsRhIyG66Uj/EKkpxZP0
         ItXlMbrv0jFucaBXGvlr9CGfIfxcqJZcDp+qIpqfUxrHr9vNiuRGzgGFJuBT8PfACG3l
         en91lqBvv4MIWkiNTjVBHLEdmbY0mndWg8dnu2UDrKQTfvGDYUUnTwzymYiuTa6yhIJL
         7eWMQx4h/aX3QlixxP6lyxQuxTGGPfXoyULygCZLvTRKLQyLoQqk1OLVYHheWqNQVd58
         UJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380540; x=1768985340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiGVfVIHdprF755XGvSlBfxNYTkiMWZtddiwyb5XCgA=;
        b=YUHErZPVdUiWr/mGgosqeJ/U6mkEwloAamjm7gjP5sZdUhjfSCmgO+cu5y6pGQh1yC
         f5GlbVzxefEH5jYIttlPUtjEbGTffSvniQTXVGcJ+pjgSrsEhVfHQR3hyAVBVHHys65f
         FUQJTHmrjuhKyFAh5FovP6PmmpkRdFxR1N1k+zWfF5V/8tXQOcfvpSXctuPrrdJl+P/u
         RWG5M/NKritdj3i4LHAD+Q3T+jF7O9mjT+IY91uJxnnQ8mG45jHAuxc6LENueSc1juU9
         PWZXh82SD6f/2PpomPkKBZ0eDjFSGfHz4W+QdU9JZnf8YCE9rN2BbPB81/EzedVIFMJI
         Ylug==
X-Forwarded-Encrypted: i=1; AJvYcCVaHUw9hjGk/Dl5kr+mwsY2SYLornx5fYs4oZ9YgCswANmXdPiVTHYo4wkpiAQ0b66G4+3dqCensG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcr0HEVInBTP+YBJ5bhjBHr7B7AvZgYnG06uVAmxp6+5IOnN5D
	WLvDKCeZ5Dcqd9UmJ+NBgADHkGHcQqZpCwsAGkO7urlvjBn7dEC3ElyxWqksuC+r1Q==
X-Gm-Gg: AY/fxX6+hr4fBlvoBq3rKRvQ0bh1SUlAEmOEbLIn+e0ghRXH8YPOF1/c0dM9Yxs/AvJ
	9Z4e6M6HsvKSBZ3GREv6MOEgzcBfXOTUsFpGlhr5kIp94i1NA7t7khjmcVaLvSWnabnzI3hTo61
	8fSx4gTHDJwjQQW635jQdlIEz4qeXKCSNYAwnCUshGu4JpSXXNieO1Szs4pGFvyp0WP1mDmxIOD
	UyZ5+/6O1nPbQh7r0q0/0nkdeBSvUREaExdnx5kIRmtUd5Yjd2KrPePubnP6krkGv4IpwMo2iqn
	b99bszhSFrJQkX8WvhuruvyFqozpk59umsAD+ijPfKMu1Azu9obgpTAk1MG6JlPuQMdwdpXhDGI
	/+/EfD+lFBSC1ZcKXP+wLeRsSszv1blTu7MCYwg9MZCKTuQYPKh+mMTid8gDrt7bGz2xMdA5yr1
	RfoOfhscLqLvkVbv6g7s+P9n2N3jT7sxZR/JN6WZMGXMhTlfdzWQo+DMVdpmgMkSU43zVqmQUsM
	+c=
X-Received: by 2002:a05:600c:4751:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-47ee4827277mr11826695e9.25.1768380539565;
        Wed, 14 Jan 2026 00:48:59 -0800 (PST)
Message-ID: <b535344e-1f27-4d5c-85aa-1529868f85fc@suse.com>
Date: Wed, 14 Jan 2026 09:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
 <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com> <aWZQLL997K3MTQY4@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aWZQLL997K3MTQY4@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 15:01, Roger Pau Monné wrote:
> On Fri, Jan 09, 2026 at 12:19:26PM +0100, Jan Beulich wrote:
>> On 08.01.2026 18:55, Roger Pau Monne wrote:
>>> The current model of falling back to allocate unscrubbed pages and scrub
>>> them in place at allocation time risks triggering the watchdog:
>>>
>>> Watchdog timer detects that CPU55 is stuck!
>>> ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
>>> CPU:    55
>>> RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
>>> RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
>>> [...]
>>> Xen call trace:
>>>    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
>>>    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
>>>    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
>>>    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
>>>    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
>>>    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
>>>
>>> The maximum allocation order on x86 is limited to 18, that means allocating
>>> and scrubbing possibly 1G worth of memory in 4K chunks.
>>>
>>> Start by limiting dirty allocations to CONFIG_DOMU_MAX_ORDER, which is
>>> currently set to 2M chunks.  However such limitation might cause
>>> fragmentation in HVM p2m population during domain creation.  To prevent
>>> that introduce some extra logic in populate_physmap() that fallback to
>>> preemptive page-scrubbing if the requested allocation cannot be fulfilled
>>> and there's scrubbing work to do.  This approach is less fair than the
>>> current one, but allows preemptive page scrubbing in the context of
>>> populate_physmap() to attempt to ensure unnecessary page-shattering.
>>>
>>> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> I'm not particularly happy with this approach, as it doesn't guarantee
>>> progress for the callers.  IOW: a caller might do a lot of scrubbing, just
>>> to get it's pages stolen by a different concurrent thread doing
>>> allocations.  However I'm not sure there's a better solution than resorting
>>> to 2M allocations if there's not enough free memory that is scrubbed.
>>>
>>> I'm having trouble seeing where we could temporary store page(s) allocated
>>> that need to be scrubbed before being assigned to the domain, in a way that
>>> can be used by continuations, and that would allow Xen to keep track of
>>> them in case the operation is never finished.  IOW: we would need to
>>> account for cleanup of such temporary stash of pages in case the domain
>>> never completes the hypercall, or is destroyed midway.
>>
>> How about stealing a bit from the range above MEMOP_EXTENT_SHIFT to
>> indicate that state, with the actual page (and order plus scrub progress)
>> recorded in the target struct domain? Actually, maybe such an indicator
>> isn't needed at all: If the next invocation (continuation or not) finds
>> an in-progress allocation, it could simply use that rather than doing a
>> real allocation. (What to do if this isn't a continuation is less clear:
>> We could fail such requests [likely not an option unless we can reliably
>> tell original requests from continuations], or split the allocation if
>> the request is smaller, or free the allocation to then take the normal
>> path.) All of which of course only for "foreign" requests.
>>
>> If the hypercall is never continued, we could refuse to unpause the
>> domain (with the allocation then freed normally when the domain gets
>> destroyed).
> 
> I have done something along this lines, introduced a couple of
> stashing variables in the domain struct and stored the progress of
> scrubbing in there.
> 
>> As another alternative, how about returning unscrubbed pages altogether
>> when it's during domain creation, requiring the tool stack to do the
>> scrubbing (potentially allowing it to skip some of it when pages are
>> fully initialized anyway, much like we do for Dom0 iirc)?
> 
> It's going to be difficult for the toolstack to figure out which pages
> need to be scrubbed, we would need a way to tell it the unscrubbed
> regions in a domain physmap?

My thinking here was that the toolstack would have to assume everything
is unscrubbed, and it could avoid scrubbing only those pages which it
knows it fully fills with some data.

>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
>>>  
>>>                  if ( unlikely(!page) )
>>>                  {
>>> +                    nodeid_t node = MEMF_get_node(a->memflags);
>>> +
>>> +                    if ( memory_scrub_pending(node) ||
>>> +                         (node != NUMA_NO_NODE &&
>>> +                          !(a->memflags & MEMF_exact_node) &&
>>> +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
>>> +                    {
>>> +                        scrub_free_pages(node);
>>> +                        a->preempted = 1;
>>> +                        goto out;
>>> +                    }
>>
>> At least for order 0 requests there's no point in trying this. With the
>> current logic, actually for orders up to MAX_DIRTY_ORDER.
> 
> Yes, otherwise we might force the CPU to do some scrubbing work when
> it won't satisfy it's allocation request anyway.
> 
>> Further, from a general interface perspective, wouldn't we need to do the
>> same for at least XENMEM_increase_reservation?
> 
> Possibly yes.  TBH I would also be fine with strictly limiting
> XENMEM_increase_reservation to 2M order extents, even for the control
> domain.  The physmap population is the only that actually requires
> bigger extents.

Hmm, that's an option, yes, but an ABI-changing one.

Jan

