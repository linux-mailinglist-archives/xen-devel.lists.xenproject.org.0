Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD224C03538
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 22:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149679.1481248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1cC-0004Tf-KC; Thu, 23 Oct 2025 20:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149679.1481248; Thu, 23 Oct 2025 20:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1cC-0004Rs-HP; Thu, 23 Oct 2025 20:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1149679;
 Thu, 23 Oct 2025 20:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MccR=5A=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vC1cB-0004Rm-Gz
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 20:08:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16b88e7c-b04c-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 22:08:50 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-uGJXRFlmN0ioA_-zE7QBpQ-1; Thu, 23 Oct 2025 16:08:47 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-470fd59d325so5354225e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 13:08:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342373sm135497185e9.12.2025.10.23.13.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 13:08:45 -0700 (PDT)
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
X-Inumbo-ID: 16b88e7c-b04c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
	b=bCF3xmyqGhAxt2D2zsQiWIznqj3FOVeCl8+sQxO6yKNFtnMpL135Jc/DC0DOkc1XLWUoc2
	pXdCjS8oBzwVVJ+12YJR+8XrsXAnhVOMz+56GtAw8+/GYjuqBssaC6vW/Gpnz3v8BQlVns
	H/8D9KEJKADshfRX0oPJFucs6QKMZ7g=
X-MC-Unique: uGJXRFlmN0ioA_-zE7QBpQ-1
X-Mimecast-MFC-AGG-ID: uGJXRFlmN0ioA_-zE7QBpQ_1761250126
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250126; x=1761854926;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
        b=b6St/AIyN7BfRcXIII5HevOZC01CR+CjfXa6AKTQmNfcg1l9IrvzK9OmcBpQ+D3NhU
         Bt+j5h06NNpkrnjIX1oEThp7Ds8jGcnVgAmlJqt+zkJe96bGEP7Bz2GGAHRsM0AwhdbX
         TIQgrBG+ad9Dy2CsgV2BfFzNd8SwW18LTrucl0EfuN3BF7ILHWWu7gAS97SCyjcGe0G3
         RuGDDnwlTR3gRwwUjOiW4i2yTvkiGQ/IRzNP7DqkjjUe0wz5532DEk8VibXRY++mrtuq
         EiUtHVXHPSa+rMbBFnGqxZPzKmi8TE4ZkS5BEELRAvYbwZ6njX3LlyeGZMOovfG2X8Zd
         yA2w==
X-Forwarded-Encrypted: i=1; AJvYcCUyetH1xUxQWKEVD4z+nPne9aQVl5qm59WhycFkOr0RpkQcPaDiHK7BJSEolEhUp9sjfhPCKQlWGm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yym69XzYOzc0HpoHouGbqnUrKi6DFvNEKKtfWbdt0U3LjhOL0rQ
	5RMcTE9cP6/uTPDSC6uBYq8zONDwcS42EUTUoNHGTJevRy1zCDFMOOcSXkOzCyBt/+PzXmaZvtH
	3V4TIuXtPGZRJBCdSgVCkYbqB2P4EBfQYc3rGZoKtM0frkc/0CUB9I3EDcTXJmAAPagYn
X-Gm-Gg: ASbGncvVtCV8abB9mVpcGQF3RZWj2MCdtnVOJLVPymbTmHoTW81I9DU6LT1J1x3FFYv
	rWQmNqSLK6CeI72aU9uJTEq1lN5ys7u8XUF22jupr1S5MNQKbFRbv15CtH4h9IZoCxpZQ61zk20
	HECtIjsfQT92YY89HzJWDyg//81gBRiwx5rZGXmcraway+9S3ArHaZlEpO4P7A3uE9w5SHpML/r
	JpsT+dogLmo9A1kUlHpvPtO4dsRlqvRnJi+h84DYcCex7vfqOMDtUCeULazyOVjmNupYJTDi60h
	sVnXFUjBc75MWRtB+Foy43X1TqQxjWE0KiWzUQgpV3W+5ePl7cQv2kPswImu40zC25mCYrrj0i9
	EUWBC1sX6YUE3FG/pBZlxkH59cu2UXasqT+6tPWJUdQGbvrBpFVXibB8tX1po7iPWE7wrWWQ1vc
	TN5neR6MbMXQ4GnE9aq9PCeiTD4KY=
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr213019365e9.30.1761250126430;
        Thu, 23 Oct 2025 13:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhLOfkc2goKkbSV/WelWxssM1PnfK27SOZ93tRWz4irrY4Van7GhpXF/QUV/ppkvRzGCYJqQ==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr213018935e9.30.1761250125948;
        Thu, 23 Oct 2025 13:08:45 -0700 (PDT)
Message-ID: <28f2ebe9-cfed-41c3-803f-8756dca0e300@redhat.com>
Date: Thu, 23 Oct 2025 22:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] mm: bail out of lazy_mmu_mode_* in interrupt
 context
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
 <20251015082727.2395128-13-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-13-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f_w3sJnX1btb3pAq-1vkA70moqmikK2DQcCXtfFpsvc_1761250126
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.25 10:27, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt mode (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively).
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
> have in_lazy_mmu_mode() return false to disable any optimisation.
> Also remove the arm64 handling that is now redundant; x86/Xen has
> its own internal tracking so it is left unchanged.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h | 17 +----------------
>   include/linux/pgtable.h          | 16 ++++++++++++++--
>   include/linux/sched.h            |  3 +++
>   3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 944e512767db..a37f417c30be 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
>   
>   static inline void queue_pte_barriers(void)
>   {
> -	if (in_interrupt()) {
> -		emit_pte_barriers();
> -		return;
> -	}
> -

That took me a while. I guess this works because in_lazy_mmu_mode() == 0 
in interrupt context, so we keep calling emit_pte_barriers?


-- 
Cheers

David / dhildenb


