Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D22C03342
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 21:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149598.1481189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC18e-0005Gz-3L; Thu, 23 Oct 2025 19:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149598.1481189; Thu, 23 Oct 2025 19:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC18d-0005Dl-Vy; Thu, 23 Oct 2025 19:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1149598;
 Thu, 23 Oct 2025 19:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MccR=5A=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vC18c-0004y7-Si
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 19:38:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d21dd692-b047-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 21:38:17 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-B-6kHokUMnKif1XAu_DuiA-1; Thu, 23 Oct 2025 15:38:14 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47496b3c1dcso8857305e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 12:38:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898eb549sm5405252f8f.41.2025.10.23.12.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 12:38:12 -0700 (PDT)
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
X-Inumbo-ID: d21dd692-b047-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VQ7IyiPkbQDl/6FlpFFPP3SSIBn2cmNYnYEr3eJHlB0=;
	b=QkjyFc65kpdNxryx1WPWWOCWXMaD8niycaI+HCyTEaWYS+WBVJK3umLwMSadZUCfgMs9io
	crQIyv+ql1Q/DuslTukWBpiW5wAGnrp8sRgPgXtQ55o6DsXZrP1ND1M1GawZj+EduKunDT
	wyGaaejFx1UlazlvjbKSOmYxDXdYuB0=
X-MC-Unique: B-6kHokUMnKif1XAu_DuiA-1
X-Mimecast-MFC-AGG-ID: B-6kHokUMnKif1XAu_DuiA_1761248293
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248293; x=1761853093;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ7IyiPkbQDl/6FlpFFPP3SSIBn2cmNYnYEr3eJHlB0=;
        b=Dv0w66NF+/BRRMn7JpjvrpuLN2fdQ5XadgabWFI6edFst03NNknqr1sMCCepGD+P41
         eupZTKPsGw0Sejj5F2KbILhv4xeUozmgtE81EAWMsPwxVuog+o/UPenWEg3SXbEOkv+d
         lTVdopr2dSyaUJIPiosDp9ePVnIL0Z3hL0VAlHwvs1SaXA31jChmNavCBMD3Uy78Nx5S
         RLO4It3eRCu1oRdtEdmxYJYFbpfI9pMGmmtjsKD6L8CqadvXKfaLID7q983xZcdqrH+/
         k8gVrbIWlqpPPtTr8FMzpLRa2ipqyIBBv+3pO8LD0yYpoO061jIAmCmQ3z/HzowmvB9k
         1rfA==
X-Forwarded-Encrypted: i=1; AJvYcCWuyldQaUBhfWk3Sg0PkbB4Z8FTdoTr9PgqIgj1w2Dkxvkl+br0p/kV74XsXAcYdb3E+bVgROIucdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeYkv7SI1m8cXyND2ZSrElbVF8SHEl4PG1h3U1X+DJTmDvVgTD
	+HOFthxx4CFOQX4wgym928F7uYivcbt08+GJ73caoxNRdgsw0sV2uShOkPzKWITMk4BnxO6QdwU
	L+449YL6Uxuly5r+wr8xMq/YVpN0E4RQukqPbUKEXsr5E9cW/56KE6Tv1IHK8CU6w/Jim
X-Gm-Gg: ASbGncvDa1ke5YFeXJzLdPKlZ3GtR4QMTNIgz2BuFM5NsgGDHg5Ph5Qz+Bi2eMh20Sb
	Lg01RycLtHLfS40ZKAZ/oI/oL/mnc/cyd+hRsYj+6i+47Pd7Rq5k4beQx4yuye6lP71IlUlu6eo
	ZTTXTHV2ZN4M56zblbd4x2yBU7pjSd+UOmmWEVk8csdTs0Jhmq2ofW75m7JKO2yS0h0a+kmxhGm
	ZjFWaO48AVirOZIvKx+tlaC+AqbWvkJZ0UA/s9YuG4LIq2NUNSTc+oPp6Xtj3Xf6do9DPiL6t1f
	zqmLuv4N/22mSc33gCMBQ1j5X0CUhKMVQilb9jrkUYP/vEDnhQwDhuOZUsVlUv3wNbENjopdmem
	M0tcQVgpM6aF2d1wnyQ0IpLVSI2Yj+lTCL9ofuwpqZDSae220VsdqojGKtRaOGbxxm0G66fkMXv
	Xaxu4rMnkWp8g32qg8bAw74bNrMMc=
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-4711791e7a4mr225365555e9.34.1761248293302;
        Thu, 23 Oct 2025 12:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK4kvb9VXDfRke79DTEDXEtAKVHmaVqzR/ZxHwP2FSjJo/KXXf7lv5KID4JKHr2iZrwUPcWA==
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-4711791e7a4mr225365155e9.34.1761248292920;
        Thu, 23 Oct 2025 12:38:12 -0700 (PDT)
Message-ID: <dd3011ec-23cc-4431-95a3-a0c2965e7062@redhat.com>
Date: Thu, 23 Oct 2025 21:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
To: Kevin Brodsky <kevin.brodsky@arm.com>, Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-6-kevin.brodsky@arm.com>
 <aPNjd2dg3YN-TZKH@kernel.org> <3836a43f-809e-419d-a85d-74606d9daa0f@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3836a43f-809e-419d-a85d-74606d9daa0f@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iX0aaPrgzscP48RLsMPbxdbr3R0IkHxtqd-ZDoX-PsY_1761248293
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.10.25 12:37, Kevin Brodsky wrote:
> On 18/10/2025 11:52, Mike Rapoport wrote:
>>> @@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
>>>    * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>>    * and the mode cannot be used in interrupt context.
>>>    */
>>> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>> +#ifndef CONFIG_ARCH_LAZY_MMU
>>>   static inline void arch_enter_lazy_mmu_mode(void) {}
>>>   static inline void arch_leave_lazy_mmu_mode(void) {}
>>>   static inline void arch_flush_lazy_mmu_mode(void) {}
>>> diff --git a/mm/Kconfig b/mm/Kconfig
>>> index 0e26f4fc8717..2fdcb42ca1a1 100644
>>> --- a/mm/Kconfig
>>> +++ b/mm/Kconfig
>>> @@ -1372,6 +1372,9 @@ config PT_RECLAIM
>>>   config FIND_NORMAL_PAGE
>>>   	def_bool n
>>>   
>>> +config ARCH_LAZY_MMU
>>> +	bool
>>> +
>> I think a better name would be ARCH_HAS_LAZY_MMU and the config option fits
>> better to arch/Kconfig.
> 
> Sounds fine by me - I'm inclined to make it slightly longer still,
> ARCH_HAS_LAZY_MMU_MODE, to avoid making "LAZY_MMU" sound like some HW
> feature.

LGTM.

-- 
Cheers

David / dhildenb


