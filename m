Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7AC408E0
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157634.1486400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO9c-0002W3-Fd; Fri, 07 Nov 2025 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157634.1486400; Fri, 07 Nov 2025 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO9c-0002Ta-D2; Fri, 07 Nov 2025 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1157634;
 Fri, 07 Nov 2025 14:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijGK=5P=gmail.com=davidhildenbrandkernel@srs-se1.protection.inumbo.net>)
 id 1vHNXU-00034l-Ly
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 14:34:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b891b9-bbe6-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 15:34:06 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso428001f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 06:34:06 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d?
 (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de.
 [2003:d8:2f30:b00:cea9:dee:d607:41d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67845ccsm5465086f8f.36.2025.11.07.06.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 06:34:05 -0800 (PST)
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
X-Inumbo-ID: d0b891b9-bbe6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762526046; x=1763130846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=SVxfm8Us9O/Hl2XZVVBQ/NbJlHz9vYs3S2QXaHnswggcbccnDFykZbIMsboidUsMMa
         F1Ytv1Kd6qlmTjCjeEFeItuseoSWUVPRTmCUG2+XQbdIMq8V2Wlf5t1733vWa1QbS9oX
         5p91sdZyT5rDyd0ETH2CEgN2YfbVOJ+Wzf8UbTlKmY/ECkLb5fph9Cz/cEqSE0y+wpPk
         5hU0Vp1l1wKdVqLP7C3H8fXYxytge/Y51oEYIXBxxJifGq0/BXPQd6O9a+V1D4Kc/PvI
         Yc6kwqtwh4umw/cNPI+wqiXyoOWNd32YaLwrvaMyLYh/AYlT4S5OLOzsw6sQWBfYg+Is
         g59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762526046; x=1763130846;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=WPKTYcafxAT8AmkrAzOsJ1H0qjRAfv9hlg5vy0jjGQX2UDvLCS1ymiBjOkltSlxrTA
         2c5zR4eoP2uSd250n1BQ8y3eo8J6OPR+TdRbIJQPaEKyM0UxESKP8bGfjPtszMbWf0S6
         YP7Dz7WbusonYlU4kqCxQDzixJNCsWQcIdfXAMiIPNdi8dZwGG8H8c9Lq+kTvb/YWEXF
         nnlPFY/A500vloDpjDzaZTzr6OB/7ZHzCCUATuL3L8w2uevi69bO0y2BUWcJu5b5TntF
         SRyVpo5TIIAqCsvBArTqucGM8IGs/czyLHlCLjFWqoZdaLuHHoCJIh6Tkxv050Cl7wlC
         gpew==
X-Forwarded-Encrypted: i=1; AJvYcCXjINX7hZhaKGjbFLm8RwgeJnmeEu7kA4cKND3sXFEcDMNg4GPd2611daQ+ebuYnVAEQHsd1N9G4fE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzxh50Oy0d7V61J4I2p/AvHiA7eUGOSeBtnXwCxA2FeinUseMzA
	l9zUA4ekID+kukWpJlDCPb3nnnVKWy5d9OCecWbNktCI2Z84SYUrOQZx
X-Gm-Gg: ASbGncuCbZNb+20+icw6evCcTWc5iz60O1hXrSmNqpZOw5Q/vvw1LE3m1S+FTdCR/Vu
	uNDj4Ghrja6OVVgyDQPcOpTifPuihyD1lTZ4MVgt+f2E20eY+3amwYrIoct1U9mnW7QhN7xkzzQ
	5PRDsFWlaCytFab7kIcKfEhO/X9zKxazIXdHXjvZ1aqoTPziKoTzC21SXDZm/YAHiMpiFiylrgV
	blncrgYj/wDCzDx3wr2nWqSOUu1nlwOz98TPmbUsFfD4fNQQTbM5NQBt96INSAB5K+ua0j6TX7F
	Lt/nRsST3xW/dQYIDQ9/IikReP+SIMDBjm1UCtCF2t/fuDmDuoDZH92nXSKRt6x0y1HbMNHDTZr
	5zZVpC6BaBHefv4M16AdhHRNR2McB98or0nDLzPLFBQFBFuDZHL96lnwkAmeuX7S8SLkKievH58
	cxSbl9pg9MV58BNtdH6Tvi3qV7l4G8OwttPb+KxaJAHfa8KHRJC+m208hy+ItADXq+JxitB5re5
	uk2v++xw0GrHKazQ/zaIjVstkpiEAw=
X-Google-Smtp-Source: AGHT+IEbeI8C8CzNAXSH/bs89gWIf/ZmK+BLjDzXB4QFwcXH6hASOjwiIfYomA42vxdn493DYIICBw==
X-Received: by 2002:a05:6000:2084:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-42ae5adfd73mr3148986f8f.52.1762526045768;
        Fri, 07 Nov 2025 06:34:05 -0800 (PST)
Message-ID: <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
Date: Fri, 7 Nov 2025 15:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>   #ifndef pte_batch_hint
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index 5d2a876035d6..c49b029d3593 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>>   	pte_t pte;
>>   	int index;
>>   
>> -	arch_leave_lazy_mmu_mode();
>> +	lazy_mmu_mode_pause();
> 
> I wonder if there really are use cases that *require* pause/resume? I think
> these kasan cases could be correctly implemented using a new nest level instead?
> Are there cases where the effects really need to be immediate or do the effects
> just need to be visible when you get to where the resume is?
> 
> If the latter, that could just be turned into a nested disable (e.g. a flush).
> In this case, there is only 1 PTE write so no benefit, but I wonder if other
> cases may have more PTE writes that could then still be batched. It would be
> nice to simplify the API by removing pause/resume if we can?

It has clear semantics, clearer than some nest-disable IMHO.

Maybe you can elaborate how you would change ("simplify") the API in 
that regard? What would the API look like?

