Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0249900BFA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 20:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736599.1142701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFeWM-0005yl-FT; Fri, 07 Jun 2024 18:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736599.1142701; Fri, 07 Jun 2024 18:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFeWM-0005wv-Cb; Fri, 07 Jun 2024 18:41:02 +0000
Received: by outflank-mailman (input) for mailman id 736599;
 Fri, 07 Jun 2024 18:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NiIp=NJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sFeWL-0005wo-8H
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 18:41:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae2715c-24fd-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 20:40:59 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-7sORR8OLOdGNQtveIeT-dQ-1; Fri, 07 Jun 2024 14:40:56 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-35e0f445846so1643870f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 11:40:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:2200:31c4:4d18:1bdd:fb7a?
 (p200300cbc71a220031c44d181bddfb7a.dip0.t-ipconnect.de.
 [2003:cb:c71a:2200:31c4:4d18:1bdd:fb7a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f43sm93769755e9.33.2024.06.07.11.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 11:40:54 -0700 (PDT)
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
X-Inumbo-ID: 7ae2715c-24fd-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717785657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J1hUmjCQX6fG/8RrOn/s4Zg+H1krUQrxIX7N8cOfAjs=;
	b=DCpO61AoaDEQJQ717YrptT/89ioDnru5pC7VE3SEgp5O+BZKzGJ6zszmbjlGzidW6RpXwQ
	o0W0xUydxkfcuc7rALsvYUQiMg7pbaNrXooDQgOV1puO5QGIkLIKtX7kspY3QF/+mkf2an
	2tEvAimo7BeW2eWDAwtNVjTPGerkrQI=
X-MC-Unique: 7sORR8OLOdGNQtveIeT-dQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717785655; x=1718390455;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J1hUmjCQX6fG/8RrOn/s4Zg+H1krUQrxIX7N8cOfAjs=;
        b=b+IvO5NfzFQYIm/H0jfVc0MoLGcxALGvRAhr3SVOhDcCmWhXCKlavNQQ8lHEiK10ts
         Jcd8Jq8A7uEPzwae99IOng3nARTqqG4B4ZJRaF0SYavYgB6nRbZ2tJ3G5uLRIR4fYAIN
         lKiW4ouAzeceKSjqIovWjjYa/oyRWY1Dsqh7SZAQjRVoK/tXEc8fiWK8t+CrCSC6c+6y
         VCA8yq2571AFmCmAd9bypCxuE+XxW3Bi2F1ejQzEyiqOo6BxrorYDRd4YTOi4Plf18oy
         +FYYnQuQJiQpk4AIlPDFNPQDh3z+IwrTUevw3ffe8HnMyrytXRhgBZ7e0vE5PHMDUQYA
         dnww==
X-Forwarded-Encrypted: i=1; AJvYcCXiMxXJyiRhq2a/x2obiUAmoqdEKwjEK6r8nDbijBnXj4FM0hSk9FnPonZgrwFzU518NNSTrIxJMgukR9by0kNsZ4gVm8sbhwquXJXpETE=
X-Gm-Message-State: AOJu0YzZu1I2soPrXBX0JZObRWedv1/SdxBhQM4peu6vpEMHg0SzSDzc
	KwgKyR1yINIzlAaTqurr17amGm1zAQZ/YEU5Fz3Mk4smfK9g3mI838fpHQF62Eskw+Lsh8zK2vq
	J8WD6Hsm/rOzgZ2cO6SYXEDFBmc1aXwLx7Z/9lM/ZIKdJK3svICf3wJ5rYieKC+RE
X-Received: by 2002:a05:600c:3b22:b0:421:1f68:f80c with SMTP id 5b1f17b1804b1-42164a3274cmr33024155e9.25.1717785654966;
        Fri, 07 Jun 2024 11:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjxAAobdln9o8Z+ZSwK+8DP+joAlNWvnty2OQv0sD2CWIRw1H0eU3Abu8j4Jf1XLd5TYqa1A==
X-Received: by 2002:a05:600c:3b22:b0:421:1f68:f80c with SMTP id 5b1f17b1804b1-42164a3274cmr33023775e9.25.1717785654411;
        Fri, 07 Jun 2024 11:40:54 -0700 (PDT)
Message-ID: <b72e6efd-fb0a-459c-b1a0-88a98e5b19e2@redhat.com>
Date: Fri, 7 Jun 2024 20:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 kasan-dev@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>
References: <20240607090939.89524-1-david@redhat.com>
 <20240607090939.89524-2-david@redhat.com>
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
In-Reply-To: <20240607090939.89524-2-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.24 11:09, David Hildenbrand wrote:
> In preparation for further changes, let's teach __free_pages_core()
> about the differences of memory hotplug handling.
> 
> Move the memory hotplug specific handling from generic_online_page() to
> __free_pages_core(), use adjust_managed_page_count() on the memory
> hotplug path, and spell out why memory freed via memblock
> cannot currently use adjust_managed_page_count().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/internal.h       |  3 ++-
>   mm/kmsan/init.c     |  2 +-
>   mm/memory_hotplug.c |  9 +--------
>   mm/mm_init.c        |  4 ++--
>   mm/page_alloc.c     | 17 +++++++++++++++--
>   5 files changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 12e95fdf61e90..3fdee779205ab 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -604,7 +604,8 @@ extern void __putback_isolated_page(struct page *page, unsigned int order,
>   				    int mt);
>   extern void memblock_free_pages(struct page *page, unsigned long pfn,
>   					unsigned int order);
> -extern void __free_pages_core(struct page *page, unsigned int order);
> +extern void __free_pages_core(struct page *page, unsigned int order,
> +		enum meminit_context);
>   
>   /*
>    * This will have no effect, other than possibly generating a warning, if the
> diff --git a/mm/kmsan/init.c b/mm/kmsan/init.c
> index 3ac3b8921d36f..ca79636f858e5 100644
> --- a/mm/kmsan/init.c
> +++ b/mm/kmsan/init.c
> @@ -172,7 +172,7 @@ static void do_collection(void)
>   		shadow = smallstack_pop(&collect);
>   		origin = smallstack_pop(&collect);
>   		kmsan_setup_meta(page, shadow, origin, collect.order);
> -		__free_pages_core(page, collect.order);
> +		__free_pages_core(page, collect.order, MEMINIT_EARLY);
>   	}
>   }
>   
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 171ad975c7cfd..27e3be75edcf7 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -630,14 +630,7 @@ EXPORT_SYMBOL_GPL(restore_online_page_callback);
>   
>   void generic_online_page(struct page *page, unsigned int order)
>   {
> -	/*
> -	 * Freeing the page with debug_pagealloc enabled will try to unmap it,
> -	 * so we should map it first. This is better than introducing a special
> -	 * case in page freeing fast path.
> -	 */
> -	debug_pagealloc_map_pages(page, 1 << order);
> -	__free_pages_core(page, order);
> -	totalram_pages_add(1UL << order);
> +	__free_pages_core(page, order, MEMINIT_HOTPLUG);
>   }
>   EXPORT_SYMBOL_GPL(generic_online_page);
>   
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 019193b0d8703..feb5b6e8c8875 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1938,7 +1938,7 @@ static void __init deferred_free_range(unsigned long pfn,
>   	for (i = 0; i < nr_pages; i++, page++, pfn++) {
>   		if (pageblock_aligned(pfn))
>   			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
> -		__free_pages_core(page, 0);
> +		__free_pages_core(page, 0, MEMINIT_EARLY);
>   	}
>   }

The build bot just reminded me that I missed another case in this function:
(CONFIG_DEFERRED_STRUCT_PAGE_INIT)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index feb5b6e8c8875..5a0752261a795 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1928,7 +1928,7 @@ static void __init deferred_free_range(unsigned long pfn,
         if (nr_pages == MAX_ORDER_NR_PAGES && IS_MAX_ORDER_ALIGNED(pfn)) {
                 for (i = 0; i < nr_pages; i += pageblock_nr_pages)
                         set_pageblock_migratetype(page + i, MIGRATE_MOVABLE);
-               __free_pages_core(page, MAX_PAGE_ORDER);
+               __free_pages_core(page, MAX_PAGE_ORDER, MEMINIT_EARLY);
                 return;
         }
  

-- 
Cheers,

David / dhildenb


