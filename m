Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE32C0333F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 21:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149585.1481176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC18G-0004aw-RP; Thu, 23 Oct 2025 19:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149585.1481176; Thu, 23 Oct 2025 19:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC18G-0004UD-Ni; Thu, 23 Oct 2025 19:37:56 +0000
Received: by outflank-mailman (input) for mailman id 1149585;
 Thu, 23 Oct 2025 19:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MccR=5A=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vC18F-0004Pm-3T
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 19:37:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b7e31d-b047-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 21:37:52 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-sLiV5guJO-ii2JPfckTYZQ-1; Thu, 23 Oct 2025 15:37:46 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-471125c8bc1so16183635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 12:37:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b5esm130845595e9.15.2025.10.23.12.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 12:37:44 -0700 (PDT)
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
X-Inumbo-ID: c2b7e31d-b047-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=;
	b=Uv0IzlEYd9eMSrrtJk83Zko/JAjIpv8Gca/r2/ClRfUNPB0JBtETYDXa8P78bKNSD8PhDW
	nCTw+im79LyfxGL0fkKafqulvB3Ra7BuY9I8WS5g8pYoBPcwwq/exPZkP02FvAprPP7UIb
	toa3DMTDz5UkXD4e5r5aRIznLye2zcI=
X-MC-Unique: sLiV5guJO-ii2JPfckTYZQ-1
X-Mimecast-MFC-AGG-ID: sLiV5guJO-ii2JPfckTYZQ_1761248265
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248265; x=1761853065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=;
        b=IGvdBpCaHWHNLPCKEMFVbmk8wS3k63Vy8ZcDCBtyEvNlOw6Dq68Ns4keMDwK7sVjzF
         h/6k/hh//UZMO1Fxqw/P992lqhlpwBbFmOZr3O4Qbd1IT3Q3Y4b4lBwQnLH3vZC1j6aE
         rg0jIsCSPA445uothkmCQdcet642y1XYXZsSJISrclN4sJkvfdn1T30HvtAAk/6rkSCu
         IF2aGBmN7J7PvkxZnMBdslYA4aKTU4igwVmJe2nhkWXnxjl6IELm2AegZps5x0li9F4T
         p6ZagG/dUDZX+Z1VWzMVYHXxZlJUShwcorFucHTNmOvyCSi+wMAf4xwxAnoEujvrS+k3
         rOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1wef6Fv4IPKTlgY4sweVg+6MfLQ8EZfO77eldmSDcDJw528NCeMOLjeLlOZ+GC0rOMfSbXtqMt7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpWS4Tj+GPz/wEsV/xPxFyaWONe7GSdZdRgre+uOZbTNyIJz6s
	MK2cCMXr+k8CwzHvd91aOxb64S1128IU7SDHYTihjuZ3bBsqJlLDMmqZfQB/NGdl+Tej96sAFq4
	qnjE7TZR381uiVXIYTZksg4QMHCWiLRKJ7Ntifw3Ic52ZD1U7xLUk2oRPlGnQlZ0xtllL
X-Gm-Gg: ASbGncs7ARc8yW/lEkQg88uX31q8dac5vXJ2hkgEOcxUf1xmFhgPiU4awRqEaQ7x8Oc
	dQ0YiPJcCHqHicuPDzcI6FP3LD2+DwY7JBmFbPRKYupJ9xwmwD3T3hAcX/iQ/oAdtYezLXCD9jS
	S+VK5SLnwI1fvN7lPhElb/PE76Nww80QqZGJLKsWvw8lHiylwfX71pbfIB9SzdhTFrgH6UP2WFT
	pYrINjT6ep3/JDVVqsnDCtVOPYMPXlN/Ngiq2lEJ+XhgiRa2gttCFwQogJ8MrVQ/sh+bCS/kQWa
	nD1+7A3/w2xPAXKHqYmQ8jAeQNGLqZDZPM4ivMPYkm6V5cdFNa9xky7VIOiLw5RCh9zTVBFc+A+
	kaETwgkpkNiXCJrwVggtwx2UM/EyFFWn8aGlMtSCDou2cQB/sGWF4FFnku0zk2XdO8qe9LpADB2
	HOIDXDXQwLQPLRIcjdAoSVUMvetps=
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr175792275e9.16.1761248265274;
        Thu, 23 Oct 2025 12:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZq8ETk/dxv6lw5okKbvprrCeAKa5W7ysoK9CYeQHAr2H0Pl+EqcgQ1cUF8EEIwcu7bpKOCw==
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr175791855e9.16.1761248264842;
        Thu, 23 Oct 2025 12:37:44 -0700 (PDT)
Message-ID: <b0373792-a7fa-41c4-9bf8-979c10be49a0@redhat.com>
Date: Thu, 23 Oct 2025 21:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] sparc/mm: implement arch_flush_lazy_mmu_mode()
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
 <20251015082727.2395128-5-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-5-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M6QqOmHgMNcNmRDqEeRpvbOkLQejCigCXf99NKvUIBs_1761248265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.25 10:27, Kevin Brodsky wrote:
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/sparc/include/asm/tlbflush_64.h | 2 +-
>   arch/sparc/mm/tlb.c                  | 9 ++++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..925bb5d7a4e1 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -43,8 +43,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   
>   void flush_tlb_pending(void);
>   void arch_enter_lazy_mmu_mode(void);
> +void arch_flush_lazy_mmu_mode(void);
>   void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
>   
>   /* Local cpu only.  */
>   void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..7b5dfcdb1243 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -59,12 +59,19 @@ void arch_enter_lazy_mmu_mode(void)
>   	tb->active = 1;
>   }
>   
> -void arch_leave_lazy_mmu_mode(void)
> +void arch_flush_lazy_mmu_mode(void)
>   {
>   	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>   
>   	if (tb->tlb_nr)
>   		flush_tlb_pending();
> +}
> +
> +void arch_leave_lazy_mmu_mode(void)
> +{
> +	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> +

Just like for ppc now a double this_cpu_ptr(). I'd similarly just 
replicate the two statements.

> +	arch_flush_lazy_mmu_mode();
>   	tb->active = 0;
>   	preempt_enable();
>   }


-- 
Cheers

David / dhildenb


