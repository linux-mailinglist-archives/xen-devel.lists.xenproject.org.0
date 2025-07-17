Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F76B0958B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047430.1417929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV08-0003rL-HY; Thu, 17 Jul 2025 20:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047430.1417929; Thu, 17 Jul 2025 20:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV08-0003oT-EY; Thu, 17 Jul 2025 20:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1047430;
 Thu, 17 Jul 2025 20:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0s4=Z6=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucV06-0003oL-Il
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:14:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac5f230-634a-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 22:14:40 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-n9AhBr-lMqyrJo356WRJHQ-1; Thu, 17 Jul 2025 16:14:37 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a54a8a0122so757869f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:14:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae?
 (p200300d82f352b00b1a5704a6a0c09ae.dip0.t-ipconnect.de.
 [2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8026e4sm59374615e9.11.2025.07.17.13.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 13:14:35 -0700 (PDT)
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
X-Inumbo-ID: aac5f230-634a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752783279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QlYYu3k/BYRc6Kiix2dPUNypQutbN2D0tRZWGefeAe0=;
	b=CDRwIJK8ExvupyRFOJgHsDXJRunhlV05GKSz7HULnosxB+9rqwzsjvGxr2RvKJHGdQS4Lj
	sbsktbcG/mGlT5EkD4O8AL98s/SOnicQDlye42V6o/wXyDSRSBtrxUJuPpKojq3bIGjrAi
	wxve42Lpe1Ve8SnJc5Qy5i8Ms9ok98A=
X-MC-Unique: n9AhBr-lMqyrJo356WRJHQ-1
X-Mimecast-MFC-AGG-ID: n9AhBr-lMqyrJo356WRJHQ_1752783276
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783276; x=1753388076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QlYYu3k/BYRc6Kiix2dPUNypQutbN2D0tRZWGefeAe0=;
        b=WkkQrHllRCCWljRGmdBS3L/WX7QBU1nI7qCbUFTYqf7l4BgwJysxqZB+VDhhKldVWK
         r5weeNUST7VTQllp99xvP1+IMV2/Kd0qUC20D7t3TksRS5YUJdJ42myBTQTf4b1fXAP6
         Wt/r+DY+/d5Q64ct5g9CpkXZ7zmMshKWDNTOFdxLq2bBWyTld8dATUWynuqa+7s+9adU
         Mx+2YXA08gF+qm1iIzo6z4kMYbv5O4ZCg+/rJDNhxBMm3QiLdtxEp+SybVSj76V1rGl2
         JchYQ8F+b2/uRwAC/kCZ/ZJsAES86g8BtNyWf5PWAeKpzV413so3K2ImV27q8+Yid8QU
         1w6A==
X-Forwarded-Encrypted: i=1; AJvYcCUyJmcVuck6ScQrbbBrzBKTxpXu0LBPvOu+ohpMqP2Ur8voPKyQVFgVLhU/OBj74q5ewh9CAPBz2zQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5qIj+VCW141EY1P4D7j+8hehVPrplFwbcp6PZ4e2UVKiBcLj/
	K+dFjkQ3vqZjJLwhdYyT8XItx+HVv4IPHwvjBKH5OIvEdTZ5R0ckh/7BkrOLSr6WKro3QBnaYvb
	ev8AvGkJnpXZ/203u1lXPKk3oqiVMaKbLlLtI0fM1G0UnfNVr7lYOkrGdCGWPmTm5f+Xu
X-Gm-Gg: ASbGncvaJFH5pta2kGqSUmevAoCF/u7s4O5TnntvwbUSutweqMmqnLSHwGCqh82i7B9
	6Be4cVBt+wziwZ2LJ3Q0BRODdD81wLkxnZy4o/zpaJaVW5kAL503Wy42paWZVbHDAFZ7uyYkRA0
	PlFdi032NaBZfp/dctKds86O0EpBDSRz3UIoSsX2Zhjb3DpH16oUBiDbwkhpYs6ozyxOWmgMyZh
	SDOAQYQeWo7n5h/HVeXR6e9+tcp2lFNU3WMYNcHYZSka1xoWpwVU+OordsUC0sS0fuJ5jmsrCmg
	7rqLT00xLw4yy6EbM41Qka3mCGD0ksLgBBeZOlKPj/jPBE1RIk7s9S78H0ndasFEWQz4ZWztVOo
	Wq/2fsXTUjqfwFQO5fdN6lpyDXayPoWr2xmJMI50C7si4yRw0dtHzhrQiHiIjOXOn
X-Received: by 2002:a05:6000:992:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b61b0ec0dbmr197213f8f.9.1752783276426;
        Thu, 17 Jul 2025 13:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXZyoKOBqIpYS/jO2KmsvWvIMoN9zXhccC8DWWsod9nvdf0NNHfT+L/AueK3GG0g1XLIDWaQ==
X-Received: by 2002:a05:6000:992:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b61b0ec0dbmr197194f8f.9.1752783275956;
        Thu, 17 Jul 2025 13:14:35 -0700 (PDT)
Message-ID: <fdc7f162-e027-493c-bfa1-3e3905930c24@redhat.com>
Date: Thu, 17 Jul 2025 22:14:33 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <4750f39e-279b-4806-9eee-73f9fcc58187@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8pQDAqxqW8JQd0-qD4Urr80XONUHey2A8ap-1Nbn70_1752783276
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.07.25 22:03, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 01:52:11PM +0200, David Hildenbrand wrote:
>> Let's introduce vm_normal_page_pud(), which ends up being fairly simple
>> because of our new common helpers and there not being a PUD-sized zero
>> folio.
>>
>> Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
>> structuring the code like the other (pmd/pte) cases. Defer
>> introducing vm_normal_folio_pud() until really used.
> 
> I mean fine :P but does anybody really use this?

This is a unified PFN walker (!hugetlb + hugetlb), so you can easily run 
into hugetlb PUDs, DAX PUDs and huge pfnmap (vfio) PUDs :)

-- 
Cheers,

David / dhildenb


