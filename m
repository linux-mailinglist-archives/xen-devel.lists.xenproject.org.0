Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD377C33DD9
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 04:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156001.1485328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGUPL-0001b8-GD; Wed, 05 Nov 2025 03:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156001.1485328; Wed, 05 Nov 2025 03:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGUPL-0001ZX-DQ; Wed, 05 Nov 2025 03:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1156001;
 Wed, 05 Nov 2025 03:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfi=5N=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vGUPJ-0001ZB-Vd
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 03:42:01 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610ea4a3-b9f9-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 04:41:59 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2952048eb88so68096585ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 19:41:58 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601a61418sm43663725ad.96.2025.11.04.19.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 19:41:56 -0800 (PST)
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
X-Inumbo-ID: 610ea4a3-b9f9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762314117; x=1762918917; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=ZFUrLFSIvJXzdpTEHmdcXuSeFp+EA45KB6SNtQliqQ7hnSo6E1DpazS2s8bUNasEII
         0os5G0YfHX33X1C+bPhQxXjBf2e01b2pYiTRiYBc6NcCYC8JbqkdFG6LVr64OBjH4mox
         Gmmq5NtuwHhMNx1sq8wE726zm1wE0pGRY3xevgThDU93ScsWQY7HQOQPl2Q/EuT7rlw9
         a+VKRLpeLqN0k8in09MqZBydNpIe/pLMysyXXnwjAB8iEY/ERdPuD3HP5sG84TrA3xxX
         k+jAMkvWavOcJgarrpveYZM8goNpy11SsRrGs7lIOclyQ/Q2s+1XyQVdpCMZhL2nmZ4r
         hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762314117; x=1762918917;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=fPotHw5TNgAG1DvjKHeeNFw3mdbPW4KCVnVsLGzh8VKTanMkFlkiqWHLflZQOLxD8a
         h4vqwXWWu8Q+/NNicI/DRI2KYvpI4qW4ELZXYzFswyOzF+rQBotKeObOGRZYR5ltmVhH
         MjVU7QUakU6JyVVRbmarY0PPS9ryo/Dhc665IxRPlBfG+4/4lF3M7gnnwzUvBuYgEKJa
         ml+M1Fo9MdwRJnJ7Kg86oak817hk/o83M+Eol7+CpiOJ9niX1+zbInT00VmT7hx1gZJi
         pIsgiACPXHefFpEwDJGer61DEKuuvmIT9OTjZbSeHv/6zNk2y+TsN5uGw13i+DAfbzQT
         TfNw==
X-Forwarded-Encrypted: i=1; AJvYcCXW1g0w5srL7OqAoMzE+O/4UHpLldWWIgIgAqWewsUs19ZBmtjStcmWwenEb2rUk/8J7LFUilQSzJU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfnPvpoL2ECEETEuUdmSCLavDO8QBTqVU7fiw9j0ftugVr6BGv
	oh31smGwkGW0vGfQaEObenzrOdm29lt1uhFtKDK8a0PZtEXuOAhpzIFo
X-Gm-Gg: ASbGncvvnOSK5Xxfk6uNQIoMIByNuMwkEesVODQpuQdrvuBqandhnj9IRFSuKC40COX
	Gcg030dPpG1Tuc9csgTp+YmusiOO94nQQr+j4zcEWFa9jJjuYfsmkl8OdjvFjybQT5gle4cD2tl
	pNPfwmKQHpoU1hMu7SmRqDePyyNUnm5bmDPqiHnBKg0+a+nT9ccS8a5DAL+A/6yENyesvJtPVmo
	9BC7ihSnbgyCQtaddy+V620fRdsn7TRAE70i6FDd3oXKRGXJ3mZfCrU/onX7wc9V/8uPKqa1sl2
	gFVsLIFuldOKDd4e3uyQJNRUsNAFFpCwWfRDGFFDXaFGfAwEBXYjchPFETFbgezXuM+O8TBaA2B
	zHqOeRhb6BzcLMp2blonNbt4OJI1so24La/WiA5qoJoDU7LJYqA5IxS0Oq5E3bYZ390A/qQ==
X-Google-Smtp-Source: AGHT+IHU+u4c4m70sp/Km2qphWV2GETQaiqBJlBLQ9oH8KuDbSRxjLHzXNgoB+GOOUcEEs7QOw2HMQ==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b02d with SMTP id d9443c01a7336-2962ad3340fmr26429125ad.22.1762314116721;
        Tue, 04 Nov 2025 19:41:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-4-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 08:45:06 +0530
Message-ID: <87pl9x41c5.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
>
> Note: the additional this_cpu_ptr() on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..7704dbe8e88d 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	batch->active = 1;
>  }
>  
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	struct ppc64_tlb_batch *batch;
> +
> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
> +
> +	if (batch->index)
> +		__flush_tlb_pending(batch);
> +}
> +

This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
called from several of the places in later patches(). 

Although I think arch_flush_lazy_mmu_mode() will only always be called
in nested lazy mmu case right?

Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
sure the above never gets called in radix_enabled() case. 

I am still going over the patch series, but while reviewing this I
wanted to take your opinion.

Ohh wait.. There is no way of knowing the return value from
arch_enter_lazy_mmu_mode().. I think you might need a similar check to
return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.


-ritesh


>  static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> @@ -49,14 +59,11 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  		return;
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  
> -	if (batch->index)
> -		__flush_tlb_pending(batch);
> +	arch_flush_lazy_mmu_mode();
>  	batch->active = 0;
>  	preempt_enable();
>  }
>  
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> -
>  extern void hash__tlbiel_all(unsigned int action);
>  
>  extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> -- 
> 2.47.0

