Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F0A4B9DC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899925.1307858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1X4-0001gW-Ik; Mon, 03 Mar 2025 08:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899925.1307858; Mon, 03 Mar 2025 08:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1X4-0001eQ-EZ; Mon, 03 Mar 2025 08:52:14 +0000
Received: by outflank-mailman (input) for mailman id 899925;
 Mon, 03 Mar 2025 08:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8eIf=VW=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1tp1X2-0001Dj-SC
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:52:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb131bc0-f80c-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 09:52:11 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-uwwI43YOPC63LUVaDya3Rg-1; Mon, 03 Mar 2025 03:52:06 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-390e27150dbso3880648f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 00:52:06 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb?
 (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de.
 [2003:cb:c734:9600:af27:4326:a216:2bfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485e13fsm13623429f8f.100.2025.03.03.00.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 00:52:04 -0800 (PST)
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
X-Inumbo-ID: cb131bc0-f80c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740991930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AD0BhRUSKUKI9Ce/AzRts0lu/YIF74G3wU8/3/wY5qk=;
	b=SxCeuxHehVcWI9BQYOmfFok5FXhF/OLd1+8LK+EKIVz1uydNDF2Dy9dk1yNafIsTv4or/e
	ssU+0E5QJxVaNBn61Btn8k4Fg2m5ieoPXHexQkYGEWBCOaVzw9bKKonbGljeDYeb0+0e+M
	FnxXtx0vZIfELC7HrjnTSLlCsVQPiRQ=
X-MC-Unique: uwwI43YOPC63LUVaDya3Rg-1
X-Mimecast-MFC-AGG-ID: uwwI43YOPC63LUVaDya3Rg_1740991926
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991925; x=1741596725;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AD0BhRUSKUKI9Ce/AzRts0lu/YIF74G3wU8/3/wY5qk=;
        b=N5Mrm7ZSKWnVDMOfAYAuV2JzNUQDar/CjkoUt2OuzViXwfEu1Pw04WObBgeGpp8nfO
         bR48wbrI8H53sAXIayqq0R/Nh1e4EloeZzGA17QlUF9DXY4GAYge3zdKDzQNpfP/LIEE
         xKOsjB9xdGwEpSJyWghXGJUuAEqZGgOAS3r8zQ15mkNPAyd3t83YiC04GounuBk/NoKa
         W50IA3N0PqSMDHTgphS3FfkTTDpad7BOjajZWsOSlnzozJtXEWkKsoM2gq/a4bPEvNMv
         HJw8j0O1pXciG6+zscoO0MqK8dTaks7CF8cJMBR3/HXGR71Iu4WuCtmBDbu65+CxkM8/
         yyvg==
X-Forwarded-Encrypted: i=1; AJvYcCXhhj4DVr/Zs+TlMLd9vlJia428t6pdNmOhZQUI/dKyNuW8HJhOSmTmgjKNf7quKQViMaJNhXJ/qQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzERSaUMfgflJsVaNIe2yd2HqnjAvbPZ4pX5L5txl+/xvLfFNEC
	YrJpvvdm7wqBBK3220eE1s3EXwwt73LAP0j3hHw0vSWJyPqqtp2kNIjyP4RjVw2VPHyr8GP1Nkg
	Pp9dCVeoAeX6bWSdrp3fXgP06PxCDBuIeEKhBQJ2/tdeCk+BfslJxxnJn0RLS6d6g
X-Gm-Gg: ASbGnctTYs9Zx65AjAXBx9R1y8U4oRgQnart5iZ9UaLijUhi8t0VIMwTyO3JlwT5q8O
	TveX9ud4dt3YKKJ7MhOpDuuKrE5JDLWW3r/Aj5sFTBRxNJ2p00Yx9w6gqk6rcAxYINF4goHidcB
	DycLva/faixUako4BGirOO10VNOB92n52CbdseBR4vtURd5xBUi6S4YyHbYSFqkxFoYKAFjsrnZ
	lk73fNeUekc3vtG/p/GSILrkL4EUCXAV6WdCoMT0cjBRNSdfSMw7HrboSieQKZH3AnfjaFOwR+N
	rGHOi5f+rNo5nnaL1M+DZpJE777abJAP1yWcRZ02J7npA2lDYN6IpmLhFA83cOr2Z+5ofMImq0X
	7qhIGwU67n46L0w+Xfk/750XYzf4JKrB7S9zqEDo/VP0=
X-Received: by 2002:a5d:6d89:0:b0:390:f88c:a689 with SMTP id ffacd0b85a97d-390f88cadabmr5755544f8f.47.1740991925674;
        Mon, 03 Mar 2025 00:52:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3sqppN55tl5C45qFk6psMYLYRvi/O7tktf2gORA/1QEyfox9eLasRdl1uBOhQIOjNr4hTpA==
X-Received: by 2002:a5d:6d89:0:b0:390:f88c:a689 with SMTP id ffacd0b85a97d-390f88cadabmr5755517f8f.47.1740991925267;
        Mon, 03 Mar 2025 00:52:05 -0800 (PST)
Message-ID: <0db13472-d056-4e41-a42c-f4ca60483176@redhat.com>
Date: Mon, 3 Mar 2025 09:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] sparc/mm: Avoid calling
 arch_enter/leave_lazy_mmu() in set_ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-4-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250302145555.3236789-4-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mM9A57ZSNF6KO7-IbFRE-5HdaUEKkRm2sa6rXhJN064_1740991926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.03.25 15:55, Ryan Roberts wrote:
> With commit 1a10a44dfc1d ("sparc64: implement the new page table range
> API") set_ptes was added to the sparc architecture. The implementation
> included calling arch_enter/leave_lazy_mmu() calls.
> 
> The patch removes the usage of arch_enter/leave_lazy_mmu() since this
> implies nesting of lazy mmu regions which is not supported. Without this
> fix, lazy mmu mode is effectively disabled because we exit the mode
> after the first set_ptes:
> 
> remap_pte_range()
>    -> arch_enter_lazy_mmu()
>    -> set_ptes()
>        -> arch_enter_lazy_mmu()
>        -> arch_leave_lazy_mmu()
>    -> arch_leave_lazy_mmu()
> 
> Powerpc suffered the same problem and fixed it in a corresponding way
> with commit 47b8def9358c ("powerpc/mm: Avoid calling
> arch_enter/leave_lazy_mmu() in set_ptes").
> 
> Fixes: 1a10a44dfc1d ("sparc64: implement the new page table range API")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/sparc/include/asm/pgtable_64.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 2b7f358762c1..dc28f2c4eee3 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -936,7 +936,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pte, unsigned int nr)
>   {
> -	arch_enter_lazy_mmu_mode();
>   	for (;;) {
>   		__set_pte_at(mm, addr, ptep, pte, 0);
>   		if (--nr == 0)
> @@ -945,7 +944,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_val(pte) += PAGE_SIZE;
>   		addr += PAGE_SIZE;
>   	}
> -	arch_leave_lazy_mmu_mode();
>   }
>   #define set_ptes set_ptes
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


