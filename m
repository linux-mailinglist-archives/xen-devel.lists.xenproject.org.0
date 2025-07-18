Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE07B0A195
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048500.1418723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucivI-00030J-JN; Fri, 18 Jul 2025 11:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048500.1418723; Fri, 18 Jul 2025 11:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucivI-0002xk-GZ; Fri, 18 Jul 2025 11:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1048500;
 Fri, 18 Jul 2025 11:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JDB3=Z7=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucivH-0002xZ-Bz
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:06:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45984e94-63c7-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:06:37 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-XVX2pKKmMDy-zFv0tsBI-A-1; Fri, 18 Jul 2025 07:06:34 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45611579300so14925295e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 04:06:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f43:8900:f364:1333:2a67:d49e?
 (p200300d82f438900f36413332a67d49e.dip0.t-ipconnect.de.
 [2003:d8:2f43:8900:f364:1333:2a67:d49e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b740c51sm16819475e9.19.2025.07.18.04.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 04:06:32 -0700 (PDT)
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
X-Inumbo-ID: 45984e94-63c7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752836796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=21+i6/3q/KbRZs7c78B9Zaciwq4VXi+y94ZoRHHKkFg=;
	b=Q6ghCjhzEf3B3ry1MH8Kp6b9+6wxKV8vZbYPgdJVItblodhrs+nhB8dppSHM8k/5Gxq93G
	LYMYSWRjWjinMelDistziDK4N3BEKNKMFzbqnhnbxHkAyldRNZwsedlpMRJ+bjHidtZ9yR
	qrGkkWxzlRCAQ7WWFEvGxWr+K4NRbaA=
X-MC-Unique: XVX2pKKmMDy-zFv0tsBI-A-1
X-Mimecast-MFC-AGG-ID: XVX2pKKmMDy-zFv0tsBI-A_1752836794
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836793; x=1753441593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=21+i6/3q/KbRZs7c78B9Zaciwq4VXi+y94ZoRHHKkFg=;
        b=dlBKD/MLpKY63PvoH34HYfZunIjN5yYPccnpjmYAsSiHialL6yJABnSKg2Y72Pnzrj
         wDv4qWXQmpovzLK0R1Ez01L5c81Fk32KCO88rH+/45pj3FqBNihf2Aos/BpP655vzbk4
         EENQOFva1VltuwKPYbuRadI19ASBl0MgYQdtL/KpJ+BTaaeaOl1bpKEoyrJXUm27k/ah
         qTK/gouEgAbTf2YlYeagVGOlAeyemt/VF/c/6cRGRIKNlSWGrInBV/FyxEnbPOSOIqjf
         Yk476weNwNMPtDadBuVR4K8X3Xnm6b3W9nVIA84S7ln+teMFTOoVyv+kNUDo2OE2uNX6
         l6VA==
X-Forwarded-Encrypted: i=1; AJvYcCW0nx/JWT+sWHU81cO9RQ9GFHPOJDq9ippmkAvL08TI6Mhr/zFLgcWgF1cyj7w5dsrQtLiIY/IKRs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyf6yqUqz8t6ff36H4ksfhqFf22sOE99oeRI2YpnRO/aba4xvMl
	ZrMSf6BAk3IXIEomLSepONyVzhk3Yf9TSA+Xe/UMzuCa65sefU9zAeJUddq025wyesyGW2e2naL
	IXRStkTPBQnn2z+oQO+HujXJsf22c5Epj5kjosgGytAA1u1SCbvNrHDMA+OfDmDCUs3Ob
X-Gm-Gg: ASbGncvnGkkyaoZ1ZR5860fw2yvdIw6VSfCL6Bz2yKJx9EHclld+P2FuaDehior6Pju
	pPDPG2c8RzZf2zFRO1krCqWTSg8qwbfZcyc7fSH9dzPCZzKmOJEGSZ76GY+uQ3wD3E0KP3JAPLs
	GHbUHw83fOiJnFKP3XDw+TnEWefZa03q/UYK0QVHXAALa/7/Dc8lEPsRlmwB9iqgZ16RVPHFytf
	FbeMacErVxeBbP/c7g5unN15MFgr1uP6F6ePnzu6/wcW78PA12n4ouuuRLqCsdGJ//nn+bXdCFG
	ZTCx/nuUIjZ3hEFnjzE/+wJOBRgIb5xt90uafTuKEZXcpmQecBmmW2g1J5jWbLmCqpfjv35myTz
	5fjrb6XlTIGx4WZS/qi6zmLLv9loy6yk4O8c4e0Gd41PR8PpUiaO9gcgcj7U4jIEwXKA=
X-Received: by 2002:a05:600c:1d20:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-4562e36c7a6mr117551385e9.17.1752836793571;
        Fri, 18 Jul 2025 04:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcJiqGxI9oDWWi5nW5+YKTz9nonD/LjKsAIai1+MhX5KKmpqdahPoV4Oxx3e4BuJMcH10ZFA==
X-Received: by 2002:a05:600c:1d20:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-4562e36c7a6mr117550875e9.17.1752836793013;
        Fri, 18 Jul 2025 04:06:33 -0700 (PDT)
Message-ID: <889dade6-8b3d-4cce-93ec-827886f7cb2c@redhat.com>
Date: Fri, 18 Jul 2025 13:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] mm: introduce and use vm_normal_page_pud()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-9-david@redhat.com>
 <4750f39e-279b-4806-9eee-73f9fcc58187@lucifer.local>
 <fdc7f162-e027-493c-bfa1-3e3905930c24@redhat.com>
 <15adb09d-4cdb-435d-927d-0c648d8239dc@lucifer.local>
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
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
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
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <15adb09d-4cdb-435d-927d-0c648d8239dc@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W0Y3oYaO8mdgomzlc20yg05X_DUqOtKabMTItK9F99E_1752836794
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.25 12:47, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 10:14:33PM +0200, David Hildenbrand wrote:
>> On 17.07.25 22:03, Lorenzo Stoakes wrote:
>>> On Thu, Jul 17, 2025 at 01:52:11PM +0200, David Hildenbrand wrote:
>>>> Let's introduce vm_normal_page_pud(), which ends up being fairly simple
>>>> because of our new common helpers and there not being a PUD-sized zero
>>>> folio.
>>>>
>>>> Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
>>>> structuring the code like the other (pmd/pte) cases. Defer
>>>> introducing vm_normal_folio_pud() until really used.
>>>
>>> I mean fine :P but does anybody really use this?
>>
>> This is a unified PFN walker (!hugetlb + hugetlb), so you can easily run
>> into hugetlb PUDs, DAX PUDs and huge pfnmap (vfio) PUDs :)
> 
> Ahhh ok. I hate hugetlb so very very much.
> 
> Oscar is doing the Lord's work improving things but the trauma is still
> there... :P
> 
> Also yeah DAX ahem.
> 
> I'm not familiar with huge pfnmap PUDs, could you give me a hint on this? :>)

vmf_insert_pfn_pmd(), called from  drivers/vfio/pci/vfio_pci_core.c

Essentially, we create huge PUDs when mapping device BARs to user space.

-- 
Cheers,

David / dhildenb


