Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56EFC34FE5
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 10:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156085.1485388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGaHm-0006xq-BS; Wed, 05 Nov 2025 09:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156085.1485388; Wed, 05 Nov 2025 09:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGaHm-0006wK-81; Wed, 05 Nov 2025 09:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1156085;
 Wed, 05 Nov 2025 09:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfi=5N=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vGaHl-0006wE-IX
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 09:58:37 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe5b8a40-ba2d-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 10:58:36 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2947d345949so58170875ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 01:58:36 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601972ad1sm55039695ad.19.2025.11.05.01.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 01:58:33 -0800 (PST)
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
X-Inumbo-ID: fe5b8a40-ba2d-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336714; x=1762941514; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=lBzuQpApAGx7metxHb33KfHkArgkuW282qzwaLO01tQXmhw+PtIbiTvecqhXBfzYND
         z4K6LwFew7NYfX7aBUPKBW7Nu0yp2Mgg+exhFVqFxe7JtKA+c6rbYhM3cEQKzxK9Rme1
         JaWINeCKqcxobGtO1ZUp2hMCMWyWPjnku2Lm6dOdvW1f6TWFWbPn2M1BLEAApgrWRNeb
         qDWpvCmCXbKUAFQ8YkPO9FbqhULFPtdfyBs4XvLGTc6oZFzg9n4VeO3ibqLC5RqdMAPf
         hqyGy56gn3cG5atJWtMFSm2cEbNFO4H5DX9dp0OOt9NF/XncH4dEajjSIHE8pUrYzhtq
         556g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336714; x=1762941514;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=EmXhddQ+69awcponKA4TdRKd99CsxWhrGg+Qxrh0jZmlihxJU5lfyJOQpW38ELB7LS
         6XenC6HK7vlgUaU349/JuOGdE83tCEYN8NB6cLpxUHpQJ1+vD4Dufq/1aJCRXIRTWdDq
         hcyJVskFD9IFNICHUfIysBB/VrZoHseuTlasmq2t7dHy72B+2SgASjDqwwaovuQcjgh9
         mQosmjLWRGcqf7H26c4wTe3LeFVaPCCcsX4go2ROUJ8mRwZZc5MNQHCDYZmRaesWHZUI
         gSNDe4cO9D+2+40KgWi8I8RkFHCeMfAjp5Lr00MG7yC37J128OX+a/4pTyaOngZU4FdP
         6YoA==
X-Forwarded-Encrypted: i=1; AJvYcCXAxDTvgCXGaCgmhUfersBFQaGrDYEpSE24scySnTvW0UadrsUwShOWog00PDQ2aI2B0+byU3QY4zw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcqrUmQtshuyWiKB1ci76E7OjG5h7OfcjUlGPckKNG+b53z12k
	YRlLzfE+5+ClVNHUgzgBo6CehDOWNdnGmOoRtwI5GYptzhIBXPsLg6tw
X-Gm-Gg: ASbGncvgNkclmowDueIp+u3fPcFHsikyNMq8YFW2W4vJGzi4gfuz1+NI4iwRcapTcnh
	mEfcGsKHIXmbmrSIbnlsVVHpABhP9CgGTTXVIH25q03OjQrmSiFjT//TKP5XVmFwkUgTbuvuo7W
	KKAcPgbjY2ljoXDuldDjri/ErgekO+d+tvHfBgvy03ifAcb+2rfSQUGQd5E9rRxxUEExZBMnLxe
	xJBKe5l38GIOMTOV9QMJLI70tLydoL6lg+r2K95gUs+S2NcoIbUoSfe1SVV0SQrHvFm6hqUVqtx
	lkcg8fCh0d/6MTvUP35Fzps5avpza0iA7UgbQbpFSGbcXE1AuVEs9sZ4D2JWyF5id8N4djhyJOe
	AqvqXKWE3KtXqxT+bUAcH17D9CStqUpXCKWhxoLE8cY5JNrPr7borKtGJYRkF+DBZELLg/Q==
X-Google-Smtp-Source: AGHT+IHbi+0zqKpbA9V2mHcqMUNAu2olVZcwJU6s62eDD+69tSv+JW/d6KHzoaPAbvo+C4JRz5nOFw==
X-Received: by 2002:a17:903:19ce:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2962adb2b0fmr33595265ad.7.1762336714441;
        Wed, 05 Nov 2025 01:58:34 -0800 (PST)
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
In-Reply-To: <87pl9x41c5.ritesh.list@gmail.com>
Date: Wed, 05 Nov 2025 15:19:35 +0530
Message-ID: <87jz044xn4.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com> <87pl9x41c5.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Upcoming changes to the lazy_mmu API will cause
>> arch_flush_lazy_mmu_mode() to be called when leaving a nested
>> lazy_mmu section.
>>
>> Move the relevant logic from arch_leave_lazy_mmu_mode() to
>> arch_flush_lazy_mmu_mode() and have the former call the latter.
>>
>> Note: the additional this_cpu_ptr() on the
>> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
>> patch.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 146287d9580f..7704dbe8e88d 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>  	batch->active = 1;
>>  }
>>  
>> +static inline void arch_flush_lazy_mmu_mode(void)
>> +{
>> +	struct ppc64_tlb_batch *batch;
>> +
>> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> +
>> +	if (batch->index)
>> +		__flush_tlb_pending(batch);
>> +}
>> +
>
> This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
> called from several of the places in later patches(). 
>
> Although I think arch_flush_lazy_mmu_mode() will only always be called
> in nested lazy mmu case right?
>
> Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
> sure the above never gets called in radix_enabled() case. 
>
> I am still going over the patch series, but while reviewing this I
> wanted to take your opinion.
>
> Ohh wait.. There is no way of knowing the return value from
> arch_enter_lazy_mmu_mode().. I think you might need a similar check to
> return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.
>

Now that I have gone through this series, it seems plaussible that since
lazy mmu mode supports nesting, arch_flush_lazy_mmu_mode() can get
called while the lazy mmu is active due to nesting.. 

That means we should add the radix_enabled() check as I was talking in
above i.e. 

@@ -38,6 +38,9 @@ static inline void arch_flush_lazy_mmu_mode(void)
 {
        struct ppc64_tlb_batch *batch;

+       if (radix_enabled())
+               return;
+
        batch = this_cpu_ptr(&ppc64_tlb_batch);

        if (batch->index)

Correct? Although otherwise also I don't think it should be a problem
because batch->index is only valid during hash, but I still think we can
add above check so that we don't have to call this_cpu_ptr() to check
for batch->index whenever flush is being called.

-ritesh

