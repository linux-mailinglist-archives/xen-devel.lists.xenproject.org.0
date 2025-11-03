Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B020C2CF85
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 17:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155404.1484901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFx2k-0008Bk-Da; Mon, 03 Nov 2025 16:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155404.1484901; Mon, 03 Nov 2025 16:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFx2k-00088d-AI; Mon, 03 Nov 2025 16:04:30 +0000
Received: by outflank-mailman (input) for mailman id 1155404;
 Mon, 03 Nov 2025 16:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFFD=5L=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vFx2j-00088X-1X
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 16:04:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21c6348-b8ce-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 17:04:26 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-r3oPNyyuMOKPTp55RJ_C3Q-1; Mon, 03 Nov 2025 11:04:03 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477171bbf51so24501495e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Nov 2025 08:04:00 -0800 (PST)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169?
 (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de.
 [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c48daa0sm167032215e9.3.2025.11.03.08.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:03:44 -0800 (PST)
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
X-Inumbo-ID: c21c6348-b8ce-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762185860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
	b=dZ6AuP8/2qAtpqlSlKRPID7Jlfi8b8H6CI6Al8Qtr88j53fY+IGjFc9rLyjSwgocHiQjlm
	3Pgf0+RoCrs/uKAVs3kysFUpQ236UXTfTDBmG4Cj72DyXQjPV75pXxrnSZmDmWUvZbNYyh
	a8EkEYmJFS/BaKG1+wlqMboBeNEhE2Q=
X-MC-Unique: r3oPNyyuMOKPTp55RJ_C3Q-1
X-Mimecast-MFC-AGG-ID: r3oPNyyuMOKPTp55RJ_C3Q_1762185830
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185825; x=1762790625;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
        b=RdC9Et876Gu8PV2ff8k55oMcFTYHwz5XNT299BzahpvA/+PEFqll2jOT9Id28jWBD6
         XKHw1wGY8OBDNYWDFVwaXHj6LySbnTGZt7spmRKEHKKPTWO1CVjW/RhZ6HT2TqnP+IOr
         dMGVjlfddSb7JlR2J2eTLx9+0MErvgG4I+v+3fXlCfsWg+p4ghFGa6iEfeJnrF6MTvD2
         BcQCl4qnAaCIbRxfZYh/f4h7FoO7Mv8Zc9ZziUPXDgX9a8SwSGKN4nfwEudOziJQphd5
         VYwnwqVbxLblY47xfHpLMhCHT2g2PQ2PLpUnxfLk4wRsHL0i2C9os3454BNS+9nJHNJQ
         EBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWYFfBuUQdqHduH47kIAiQdo2Ykvlq/Zmob07Ei3/6DSTcr/RYlq2tQi3AxfFl3VqA+Uyv/dY8ark=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrVKz3JIQlkM2FZU+Q3zOUUWJ1t5Y6qvwX9viyF9jBbR0Qx/T7
	XRTbbOBlyuSj/y2GLVM5paWSH8VzJJAuD7YRDz1n+EJZ7sfvgLRlrgfvrknl24C3ZkYSKN1WkFr
	gczz9A50LdnIpk9fl0bgOMVQ8h2dnsYZ/WZpCgos2h5N3+HuoBCzGJHJg4UFCTXRp30aP
X-Gm-Gg: ASbGncsOf2U9DkcKQqonZum4f3/lviCuOVSCPy9IolJT3o6xgPHf/j5ciJD4TbuoPrq
	A+1/ILCbZ5N85tE0wqLZYb1zJZoSiZC7KmVztxDe1aYGEPr0O8J8ZB1QeFNlWEnkVeORTGUUnm+
	Cz6nl1lmWyQ3nAwXWUU7q1y2GWHOeK46fzcpuB9j3Mb2rkWLANCMbaTarJptOjqeVvsZ4OW0Gb3
	ujVjEwQeTRCU9U59x2+pENb+HJ2oEO87C6WPDVC5I8k4J+5idV4t759WVYqEJdZlvI47v6Lq0oO
	OOfkOrfDo7Js1FDC6gH5UKlNK3Nt5VrVgLTA/3lL24gZvmGB/5wbaHMRmPUcn7rm7XQEmnSgA08
	ynQWrm4pw60/WgG1tAKlzBqxjyO8siIUZ8+NlpKdQLJdBs93nOrjj5y+UBepj1Lh9Sl508+q+23
	VYg1r613fYh9v/6FGN7yP1xzdM/hc=
X-Received: by 2002:a05:600d:831c:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477542a7ee4mr3985135e9.19.1762185825555;
        Mon, 03 Nov 2025 08:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5tyJHb+sues0m+7ZNZilqyo2L9Cho1JQDhJMCuFOgAOZW6Lsc8SY3FhL38SgCM772181+5A==
X-Received: by 2002:a05:600d:831c:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477542a7ee4mr3984625e9.19.1762185825048;
        Mon, 03 Nov 2025 08:03:45 -0800 (PST)
Message-ID: <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Date: Mon, 3 Nov 2025 17:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-9-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oLJBq5WEohlje9fvKVf9kuj7n6Fzc9Ai0cPhk_jH5NU_1762185830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 11:09, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>   arch/arm64/include/asm/thread_info.h |  3 +--
>   2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 535435248923..61ca88f94551 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>   
>   static inline void queue_pte_barriers(void)
>   {
> -	unsigned long flags;
> -
>   	if (in_interrupt()) {
>   		emit_pte_barriers();
>   		return;
>   	}
>   
> -	flags = read_thread_flags();
> -
> -	if (flags & BIT(TIF_LAZY_MMU)) {
> -		/* Avoid the atomic op if already set. */
> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
> -			set_thread_flag(TIF_LAZY_MMU_PENDING);
> -	} else {
> +	if (in_lazy_mmu_mode())
> +		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);

You likely don't want a test_and_set here, which would do a 
test_and_set_bit() -- an atomic rmw.

You only want to avoid the atomic write if already set.

So keep the current

	/* Avoid the atomic op if already set. */
	if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
		set_thread_flag(TIF_LAZY_MMU_PENDING);

-- 
Cheers

David


