Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB77C067E1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 15:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150345.1481534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHpX-0005v6-EM; Fri, 24 Oct 2025 13:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150345.1481534; Fri, 24 Oct 2025 13:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHpX-0005rz-B1; Fri, 24 Oct 2025 13:27:43 +0000
Received: by outflank-mailman (input) for mailman id 1150345;
 Fri, 24 Oct 2025 13:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Ac/=5B=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vCHpV-0005rp-MK
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 13:27:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c33ca4-b0dd-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 15:27:39 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-_qyopINfMBarXZq66nnOrg-1; Fri, 24 Oct 2025 09:27:36 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42700160169so1380811f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 06:27:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898ccc60sm9453555f8f.34.2025.10.24.06.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 06:27:34 -0700 (PDT)
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
X-Inumbo-ID: 35c33ca4-b0dd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761312458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
	b=EQ9cqlHYeA+Irl1jc/Y/4xpr8sngwljhpizjQoVhiCDNTXiGWBR82HclDrm/eRDudUjJAb
	gZYQzvMaqbKKJf7PyubkSY//kEWLKKNnvErQzmDij9dZA54HZRmjZLa64DQHjp7pVxUcyd
	4owDdD+OpfREioM3SYxjzw8mz+wJ7DM=
X-MC-Unique: _qyopINfMBarXZq66nnOrg-1
X-Mimecast-MFC-AGG-ID: _qyopINfMBarXZq66nnOrg_1761312456
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761312455; x=1761917255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
        b=N0ZT8b1RXk0lJC/1qe3UVPCTpkVQNNFVpXyDnXajx00gI8yLTld3OjzL+JdquQeOnQ
         Ce8TUclRp8TqNmVEYXXr2xc5pj/KkTbB0+PJBJ9PfEleAs2RT6vWnbOdTuE4pG20Coqt
         KgCfuOQaF/BzQ0fJZyx6HicxawsCO+6MpakwvWZg7MDD/G8Q8dogZwXMqQAjg1BJYOLg
         6e8/6Q2nE9Bc9r2LSrDsfLplWEbBUG3Gdkjg08T4X+y578W3wltlzEKqNvLSFpKoJQEK
         sF4vKl0+NCFfiazQeplZB5zcoQqJ09dYCHZpI+Nvx0p2Qo9XSeJYQe2vlr+/MrgO4zE1
         //Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVguxGvkOCQBb1GjV2gzb+WpkotGu2SZhcgF3oILDPPuZjQ4NrI+6R4wRvjBfbAaCA+ENJzbwXrOrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTF7DjfMvdBaAtf0nzWaJq4PbAdMSlJGq+9J4GiCS2vdKs0iP0
	LNBltlTj71uje2/+JROAvplmbQMkDE37LXPKY8dez6q+OZ7Sr1qAYzANNP6asKrqXtwHqgredop
	jx3HsC+S1+z2Lxce2G3k3K6i8iHYI9G5/AaGWB1soDqUuUsRFjAsXIJT4CJHqeSVW60I0
X-Gm-Gg: ASbGncssXy+cUTSuUGi53e/nzjoxfVUKaxEETSRPqD86Yh+v4EBAv20vsLJexF6tb46
	1XbOZc+OcP90GIcpd7qxC8DlkndclTxlywXQ2TiOVObSO8bg8zl+JsEHpMAwItOGUNpG9DikHFG
	tv/6W6f/4wkB4/P+B7tzu+7T/sN7UwtiOuqySxqJvpCw+40nuMUgiwOTZ9JQ6uOJn8GuU1zcsZ1
	v/PyKpT2F+DzXsxBWlm5UzWt/vXuZwtlG/mY83sOoMaa7mko2yEgiylrYacIdbCVz7EFnpIfInV
	Nc/mlfEU0xT7d1X1oFXzo31XqQSgRXHmIcOPHIvLV1lbaJ/W9tSkf7bzr7o7gkTda+EhC27OD8L
	Y6bYuSagBC6ceFsefxvmRo0Dgbf+G8jZwXey5w139Y8VXRWC20zgM4GLQ/E/M2lhXLEc8xmQROF
	C3rGM/E1f60pHtHYAkoMOmLUDyoIY=
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr17804294f8f.18.1761312455514;
        Fri, 24 Oct 2025 06:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6q4w15VA7XMPgV1osu1aNNaqJ9bER4GrjuNDgzSEl5cHuxzuUI4S5/OhMi/rPVse+Lx9Gyg==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr17804231f8f.18.1761312454926;
        Fri, 24 Oct 2025 06:27:34 -0700 (PDT)
Message-ID: <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
Date: Fri, 24 Oct 2025 15:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bSz7jSgQdQx-n0kNcWJZSFwF6LDqgl1lHONW9zdH8DI_1761312456
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.10.25 14:13, Kevin Brodsky wrote:
> On 23/10/2025 21:52, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> [...]
>>>
>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>     followed by an immediate exit/rescheduling and some followed by a
>>>     conditional exit. These functions assume that they are called
>>>     with lazy MMU disabled and we cannot simply use pause()/resume()
>>>     to address that. This patch leaves the situation unchanged by
>>>     calling enable()/disable() in all cases.
>>
>> I'm confused, the function simply does
>>
>> (a) enables lazy mmu
>> (b) does something on the page table
>> (c) disables lazy mmu
>> (d) does something expensive (split folio -> take sleepable locks,
>>      flushes tlb)
>> (e) go to (a)
> 
> That step is conditional: we exit right away if pte_offset_map_lock()
> fails. The fundamental issue is that pause() must always be matched with
> resume(), but as those functions look today there is no situation where
> a pause() would always be matched with a resume().

We have matches enable/disable, so my question is rather "why" you are 
even thinking about using pause/resume?

What would be the benefit of that? If there is no benefit then just drop 
this from the patch description as it's more confusing than just ... 
doing what the existing code does :)

>>
>> Why would we use enable/disable instead?
>>
>>>
>>> * x86/Xen is currently the only case where explicit handling is
>>>     required for lazy MMU when context-switching. This is purely an
>>>     implementation detail and using the generic lazy_mmu_mode_*
>>>     functions would cause trouble when nesting support is introduced,
>>>     because the generic functions must be called from the current task.
>>>     For that reason we still use arch_leave() and arch_enter() there.
>>
>> How does this interact with patch #11?
> 
> It is a requirement for patch 11, in fact. If we called disable() when
> switching out a task, then lazy_mmu_state.enabled would (most likely) be
> false when scheduling it again.
> 
> By calling the arch_* helpers when context-switching, we ensure
> lazy_mmu_state remains unchanged. This is consistent with what happens
> on all other architectures (which don't do anything about lazy_mmu when
> context-switching). lazy_mmu_state is the lazy MMU status *when the task
> is scheduled*, and should be preserved on a context-switch.

Okay, thanks for clarifying. That whole XEN stuff here is rather horrible.

> 
>>
>>>
>>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>>> definition to <asm/pgtable.h> to keep things building.
>>
>> I can see a call in __kernel_map_pages() and
>> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>>
>> I guess that is ... harmless/irrelevant in the context of this series?
> 
> It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
> this series; we're adding new calls to it from the generic layer, but
> existing x86 calls shouldn't be affected.

Okay, I'd like to understand the rules when arch_flush_lazy_mmu_mode() 
would actually be required in such arch code, but that's outside of the 
scope of your patch series.


-- 
Cheers

David / dhildenb


