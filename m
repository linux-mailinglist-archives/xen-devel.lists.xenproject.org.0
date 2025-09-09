Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ADEB4A90B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116105.1462515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv5x-0006JA-0D; Tue, 09 Sep 2025 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116105.1462515; Tue, 09 Sep 2025 09:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv5w-0006Ge-Tg; Tue, 09 Sep 2025 09:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1116105;
 Tue, 09 Sep 2025 09:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezXQ=3U=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1uvv5v-0006GY-HC
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:56:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523225e5-8d63-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 11:56:58 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-o90Z3dI_OpWxzfEadYHFyw-1; Tue, 09 Sep 2025 05:56:53 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b96c2f4ccso32051005e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 02:56:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34?
 (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de.
 [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df16b2971sm5934435e9.7.2025.09.09.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:56:50 -0700 (PDT)
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
X-Inumbo-ID: 523225e5-8d63-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757411816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v9v9HEY+peb6y/djARujyPjanSQs6bY1lozPYtVGaPg=;
	b=Tzu7DdkvQzs7M1WEFk9+yZ2wOjVaifo7TX98jxaeX/rSaERnI2FL3cQ/eEyudYaLMHNbo4
	zp06tZLvLJEYPrqheo7YjReLalxFlvyPABOUVR310KyBUFZH+rgTLO+ROhjD7p0uWyJ9VA
	aFZyY6Hy5lOSV+WbwReHvZRAKJRQBpU=
X-MC-Unique: o90Z3dI_OpWxzfEadYHFyw-1
X-Mimecast-MFC-AGG-ID: o90Z3dI_OpWxzfEadYHFyw_1757411812
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411812; x=1758016612;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9v9HEY+peb6y/djARujyPjanSQs6bY1lozPYtVGaPg=;
        b=N/uC8UCdod014vMb9xgH7O7VzPF3akgXSRA3xLAZ3rc2wC3qrmni/7JsagRLfyLnrA
         GR1QZUJs20fNYdYt0QwjzG8Q7eZo3P2GwXWD2lbP6wk++TQir9qNA8ytRcMb+KOCv5XR
         /oYQxxrlK5+6PlEgHsgkZpxTQUxoUZ8GGYCWYR9Qd/yzmdpmuR8fMzp/ryZIe0Bm2ZiT
         fvQhoztCd2SEGHSojAVKGsDK1oeSu/UTzz6uw+1sj/2IQ8dxkSjMd7ueBqXlERJ9ryle
         POmivZhkPMMPDiKK9Bs8EBheTc0O0LwcGKd8YPOaNHVg2hSn/Fn1eMjkL8ROmV3+PRom
         oMug==
X-Forwarded-Encrypted: i=1; AJvYcCVE+RVRJcMZayEDf1It2nVqT70MJOwnerfUbVFVlRpWKKuOECvR5Na06m4c8DIGZY8Y0KlAhVjivqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkUzyIZHepx4D9LdyIUrF0PqJz8oqH4dbg9ZxwKOZSYnfY9XFF
	phiiQf7ypxVQ/WNkAYolQlafqfv143UE1Ul1WkOj8u7/kN2V1zt5E9ILNLw2G4PT+aFjvkoJkB4
	bmXxby3iQvti/AhXBlKZ3KF5q11BCQcJCI9iI9SWm9htLiqyXlEXDIOmPngW982vcqcnI
X-Gm-Gg: ASbGnctR3w/K4OilNbJN4lZdTV3QGsI3YRj4mjE91blH46DL/Mo0IQ7jETFOdCeZJ9J
	J5/g1rp1pre1SSPnBrqaRL43rWDOs5+cI3gsu9JUDcnHbTa8QMFQZIYQI8f/QfhhzrzM1boDQJA
	4BhD6DVFVqy/3784eAj5HYuTmQrdvzl7yoJBDlzl5pH4wVPon24Vw4z/sz7Bx2Q7Jj7alL8M1Ok
	ELDUmd3X5pEAphv+lvWB4FTyfOiMP8kUOL6X+RJaHCMBTtLSSmqNLj1UVU3stS03F1i8BUd+3nQ
	GA5Q/Sx9UZNeC2ojf9fkgFKvxjtzMiNc4Wl9niIHzIkCmoiz7BUbkmIrQziNMah4lZBBJJDUfHm
	GnUi51re7nORhWf+28+cMnDnX8N9UuGojFUIy1epgHGqibrtxSnU4i3Jk9N5P4eixzwE=
X-Received: by 2002:a05:600c:3b83:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-45de3c20088mr82989955e9.6.1757411811940;
        Tue, 09 Sep 2025 02:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxA/lg+jOMLOS5VKnviegUlnV1FAVtarDrgFAYvQcjN5JtjPJvVcivfNI/KeNLfzLwRHX8LA==
X-Received: by 2002:a05:600c:3b83:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-45de3c20088mr82989315e9.6.1757411811384;
        Tue, 09 Sep 2025 02:56:51 -0700 (PDT)
Message-ID: <57f49b72-2126-48f0-a4ef-4b138bd0bead@redhat.com>
Date: Tue, 9 Sep 2025 11:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
 <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>
 <360712fa-f7a0-4674-acc4-76f79141fe4f@suse.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <360712fa-f7a0-4674-acc4-76f79141fe4f@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yQhwREWW_c3o_KuNxbl9WhqiXQ11EO85Hwpv6RtB-N0_1757411812
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.09.25 11:37, Jürgen Groß wrote:
> On 09.09.25 11:13, David Hildenbrand wrote:
>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>> Commit 49147beb0ccb ("x86/xen: allow nesting of same lazy mode")
>>> originally introduced support for nested lazy sections (LAZY_MMU and
>>> LAZY_CPU). It later got reverted by commit c36549ff8d84 as its
>>> implementation turned out to be intolerant to preemption.
>>>
>>> Now that the lazy_mmu API allows enter() to pass through a state to
>>> the matching leave() call, we can support nesting again for the
>>> LAZY_MMU mode in a preemption-safe manner. If xen_enter_lazy_mmu() is
>>> called inside an active lazy_mmu section, xen_lazy_mode will already
>>> be set to XEN_LAZY_MMU and we can then return LAZY_MMU_NESTED to
>>> instruct the matching xen_leave_lazy_mmu() call to leave
>>> xen_lazy_mode unchanged.
>>>
>>> The only effect of this patch is to ensure that xen_lazy_mode
>>> remains set to XEN_LAZY_MMU until the outermost lazy_mmu section
>>> ends. xen_leave_lazy_mmu() still calls xen_mc_flush()
>>> unconditionally.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>    arch/x86/include/asm/paravirt.h       |  6 ++----
>>>    arch/x86/include/asm/paravirt_types.h |  4 ++--
>>>    arch/x86/xen/mmu_pv.c                 | 11 ++++++++---
>>>    3 files changed, 12 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
>>> index 65a0d394fba1..4ecd3a6b1dea 100644
>>> --- a/arch/x86/include/asm/paravirt.h
>>> +++ b/arch/x86/include/asm/paravirt.h
>>> @@ -529,14 +529,12 @@ static inline void arch_end_context_switch(struct
>>> task_struct *next)
>>>    #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>>    static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>>    {
>>> -    PVOP_VCALL0(mmu.lazy_mode.enter);
>>> -
>>> -    return LAZY_MMU_DEFAULT;
>>> +    return PVOP_CALL0(lazy_mmu_state_t, mmu.lazy_mode.enter);
>>>    }
>>>    static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>>>    {
>>> -    PVOP_VCALL0(mmu.lazy_mode.leave);
>>> +    PVOP_VCALL1(mmu.lazy_mode.leave, state);
>>>    }
>>>    static inline void arch_flush_lazy_mmu_mode(void)
>>> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/
>>> paravirt_types.h
>>> index bc1af86868a3..b7c567ccbf32 100644
>>> --- a/arch/x86/include/asm/paravirt_types.h
>>> +++ b/arch/x86/include/asm/paravirt_types.h
>>> @@ -45,8 +45,8 @@ typedef int lazy_mmu_state_t;
>>>    struct pv_lazy_ops {
>>>        /* Set deferred update mode, used for batching operations. */
>>> -    void (*enter)(void);
>>> -    void (*leave)(void);
>>> +    lazy_mmu_state_t (*enter)(void);
>>> +    void (*leave)(lazy_mmu_state_t);
>>>        void (*flush)(void);
>>>    } __no_randomize_layout;
>>>    #endif
>>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>>> index 2039d5132ca3..6e5390ff06a5 100644
>>> --- a/arch/x86/xen/mmu_pv.c
>>> +++ b/arch/x86/xen/mmu_pv.c
>>> @@ -2130,9 +2130,13 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t
>>> phys, pgprot_t prot)
>>>    #endif
>>>    }
>>> -static void xen_enter_lazy_mmu(void)
>>> +static lazy_mmu_state_t xen_enter_lazy_mmu(void)
>>>    {
>>> +    if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
>>> +        return LAZY_MMU_NESTED;
>>> +
>>
>> You mention above "preemption-safe manner" above, so I am wondering,
>> what if we get preempted immediately after doing the this_cpu_read() and get
>> scheduled on another CPU?
>>
> 
> This should still be correct: preemption needs a context switch to happen,
> so xen_start_context_switch() and xen_end_context_switch() are involved.
> Those are dealing with this problem by doing the right thing in the old
> and the new context.

Thanks, that makes sense. Would be valuable to add that detail to the 
patch description.

-- 
Cheers

David / dhildenb


