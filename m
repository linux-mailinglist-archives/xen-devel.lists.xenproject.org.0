Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A168B953E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715608.1117372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qpu-00064s-8k; Thu, 02 May 2024 07:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715608.1117372; Thu, 02 May 2024 07:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qpu-000620-5p; Thu, 02 May 2024 07:26:34 +0000
Received: by outflank-mailman (input) for mailman id 715608;
 Thu, 02 May 2024 07:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bu2w=MF=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1s2Qpt-0005vQ-0X
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:26:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b802b9a-0855-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 09:26:31 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-nWDx02wtN0uF5tcpReHdTA-1; Thu, 02 May 2024 03:26:29 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-416ac21981dso7716765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:26:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71e:bf00:eba1:3ab9:ab0f:d676?
 (p200300cbc71ebf00eba13ab9ab0fd676.dip0.t-ipconnect.de.
 [2003:cb:c71e:bf00:eba1:3ab9:ab0f:d676])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b0041b61504565sm933209wmq.28.2024.05.02.00.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:26:26 -0700 (PDT)
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
X-Inumbo-ID: 4b802b9a-0855-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714634790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3FnHssCUF+JogpfMvQcIC1XSfS0ftTV0t9WTQ+Vga4k=;
	b=QpZfy/dxqPqt6alTqZ7cRcBgSKOa/wIVp4zgxBLsdobf1TtFWCtERispbujh8Jw23mrLVM
	278bIiY27QGvbB2stVmYpIBq63fs/Y6V9S3DV8ajfznva5kMdcYwe/8XbpY5CiZCkr+ykV
	aCj2S7PomJt5e7FNJRfmJTPFO4LkWgg=
X-MC-Unique: nWDx02wtN0uF5tcpReHdTA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714634788; x=1715239588;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FnHssCUF+JogpfMvQcIC1XSfS0ftTV0t9WTQ+Vga4k=;
        b=NMA5r0qdn/KNVLz8Mw2Gib+6Lj9HwAVSMV5N9Q23a4QKgLa1Y8UhL/e9ioU4ElHtPu
         A9iiLP0laePUFde3zLlYgMwyocYzQUz5BmooxO6RzWyit0C6Dhx5etucaIumoN6pqAxd
         HIB7iFjLdw5Wx0A/w5Wo+qN321oL/JC2atxPNPFG9lyOUT9RJacWKr/vu6K6LoMscfnu
         wR9f2lHgL9bZ4MuYmL3bt10K/2lBcSWjPVWIkRN97dwzfu0p9K3BDW/njwyZhwFk9+ht
         9dTdJLdoCxJI8DOH9GTxoIYWizuXqyw9cYNKrFRXOz0/LZ8Xq3DyjX9lUQ2egJod4eft
         +LLA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDhGgYRi0XUzwA3HtpL3yk/EsFtvHYKPSMKVku9RUmP/+dy3L3GGPGqOw4vvXtprZcsV09H4kBBQVbseAOK1+MIJmOXA3e6luPUYc8zQ=
X-Gm-Message-State: AOJu0YzQ2kUkjfkJzUf52S6KBikvnafcJ0zSl61c2GVzsw8BnzP5bRnq
	RGOnA6S4378DZyjUpNB+HImE5XIm/IjnUO1LQdvDU7A59Gu+axDJeuY70uKM4uiPI4Ol0xNjjjj
	FWqpWsPdPkF/7XaiPKoAi6cCv2vqi5x7EoZvmsh0ycmJE7C58mzmdOmAm6D4I2aP/
X-Received: by 2002:a05:600c:474b:b0:419:f533:ef88 with SMTP id w11-20020a05600c474b00b00419f533ef88mr1517961wmo.11.1714634787591;
        Thu, 02 May 2024 00:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCDfTji+hFLp33zSZml2ea3sk683NpvOdxSS6BPcqoE+MBESg6R44Zwy0plsW/UyhT56xFcg==
X-Received: by 2002:a05:600c:474b:b0:419:f533:ef88 with SMTP id w11-20020a05600c474b00b00419f533ef88mr1517933wmo.11.1714634787077;
        Thu, 02 May 2024 00:26:27 -0700 (PDT)
Message-ID: <0263b7e8-5800-4f5a-9dc5-bc2b4fbbbbfe@redhat.com>
Date: Thu, 2 May 2024 09:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] xen: Add xen_mr_is_memory()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-15-edgar.iglesias@gmail.com>
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
In-Reply-To: <20240430164939.925307-15-edgar.iglesias@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add xen_mr_is_memory() to abstract away tests for the
> xen_memory MR.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---

[...]

>   #endif
> diff --git a/system/physmem.c b/system/physmem.c
> index ad7a8c7d95..1a5ffcba2a 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>            * because we don't want to map the entire memory in QEMU.
>            * In that case just map the requested area.
>            */
> -        if (block->offset == 0) {
> +        if (xen_mr_is_memory(block->mr)) {
>               return xen_map_cache(block->mr, addr, len, lock, lock,
>                                    is_write);
>           }

I'd have moved that into a separate patch, because this is not a simple 
abstraction here.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


