Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8DB0880C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046401.1416719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK9e-000473-4G; Thu, 17 Jul 2025 08:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046401.1416719; Thu, 17 Jul 2025 08:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK9e-00044r-1O; Thu, 17 Jul 2025 08:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1046401;
 Thu, 17 Jul 2025 08:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0s4=Z6=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucK9c-00044e-0Z
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:39:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97237b9b-62e9-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 10:39:46 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-o4O_m6OJNsaE1bHeRLvozQ-1; Thu, 17 Jul 2025 04:39:41 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45626532e27so4363535e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:39:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7?
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e89c313sm44617495e9.28.2025.07.17.01.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:39:38 -0700 (PDT)
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
X-Inumbo-ID: 97237b9b-62e9-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752741584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lj6lTZwQRiYuMovgfeEEcoQjPhNrRremaT5OpC4sqYE=;
	b=C3Y7zcr9XFyaKkZlnGENKvW3zyjKR5xNn4HUzGslOKc8e22kDfTIFYpOnnFdu5LIqRq2R4
	SOxBTqQeYoXBO6xJU9LuCrdQN6HF3eYmPk4ooO958liY1lKEwKjGvkbUedN4CE2qas28iG
	GYgPHPDIN5zzS8hapr2TzY5f/D05tB0=
X-MC-Unique: o4O_m6OJNsaE1bHeRLvozQ-1
X-Mimecast-MFC-AGG-ID: o4O_m6OJNsaE1bHeRLvozQ_1752741580
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752741580; x=1753346380;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lj6lTZwQRiYuMovgfeEEcoQjPhNrRremaT5OpC4sqYE=;
        b=X4CRmEKPv7q1lXFJqJz2MuQdMfR8QxwgkgFcXBLHBLKEniBQxzmZwILW1Cd+vlxkgT
         1quG3AsW9Rrp2Bmadha3Qrvg4A5zmr7WdacEZgm4iCozHPwl8dvIX/di29D9nNTDMhZk
         wWe3Ra/siBoR6Z/RwHGy4ieTdEQUeouVAEeVLtTugPWdcHQ931PMA2dCXxBsgLp8vwzZ
         6HHzN4xC+x9RzDJ8mRwW/B8oaFMTJ5schq2LfF0IsJ3ppwoFC7he+tmNDCnrZGlf7DSs
         8cyKN+mvYo/RYVl8LQHqeTDMEAMuBmQgMTRuNhF5zfKd8EmgV+OBZcsQMUF0mIY4DOHk
         +ykA==
X-Forwarded-Encrypted: i=1; AJvYcCVyw8VsFJiEge8eNoUDT0pC8j5rpU3PWRjSd1JOnoj7e/4x8IOwJG2CrC5M+TKmcFcLkw7dD0t/qqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyUvSDi7RfM7OjZZ+crrfC81GE5pfxTzj8EfZLblKwgTc2eic0
	VTC2v/4o8hEzjVjn2zQloVpGd+iOQoSdmOGpPU3/GgdVucmsqSrnJBrlydi9dG/Yd/4+2Fcsdq6
	tLcLf6dENV+hPREWAZpYxMCQELVORGBAXhhgly8NLQsMtf30qqw0kKM6CVSIOMLyNRyKI
X-Gm-Gg: ASbGncs/36zYpxAuBGMlkf4AafV690AXS1lMA2Umgv0LBIaKZghqhwm2FMa7sItCmeA
	HvFFyQ5OqiGO69RKJgKsPrOM6pbh4pJqqWyJBn1cKoFCXvsy2nDTH+Hb22T/E2WyHSJx7t3OkOI
	WeQgVhFnmmA4UdpeS16v+xBatlILrux+BE3hSKPPXhpsxjeUbzpMwgtkZaiNzTuJ4vcd+HKKDbm
	YPzwMMsUL77gX3nNtLvqfc0/Bz/Sl/ABNK+EbZzeRUMsenTfeIKRZXpeO71DpA5fwnh6QJ7XeQF
	paSefkb2lgXdJIdYYgHvRGlYm0rz/3FZDrLZvswiqC4MSSB5qVy2b0jijw6TaPwL/xbI3FbjKVq
	YAMVnbE4DncP5dShNnin/cvBrWg6+AOtoPlgNRC/k4rXw4B3hTsmB2HKM1muv5sf4
X-Received: by 2002:a05:600c:a08c:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-4562e0320ddmr54640235e9.4.1752741579824;
        Thu, 17 Jul 2025 01:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7/rwYshbHQ4mXCqXe0VfAWZwFMFiHguIbQQ20+5zBL9J/LJ0Z7d+RZpnAtH09KGdgkC3Klg==
X-Received: by 2002:a05:600c:a08c:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-4562e0320ddmr54639715e9.4.1752741579349;
        Thu, 17 Jul 2025 01:39:39 -0700 (PDT)
Message-ID: <705fa84f-7a4a-4f74-82bf-5dff51149d94@redhat.com>
Date: Thu, 17 Jul 2025 10:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] fs/dax: use vmf_insert_folio_pmd() to insert the
 huge zero folio
To: Alistair Popple <apopple@nvidia.com>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250715132350.2448901-1-david@redhat.com>
 <20250715132350.2448901-5-david@redhat.com>
 <x32buctb6cdgr7kfwd54blmcqs6d3ixpsujx2qlde2cf6ziayu@mrltytvzg54p>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <x32buctb6cdgr7kfwd54blmcqs6d3ixpsujx2qlde2cf6ziayu@mrltytvzg54p>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PUaKAaB5ckS_Y_lz6MUlkYjHLqxwpgd7zUe4TCsaC7U_1752741580
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.07.25 10:38, Alistair Popple wrote:
> On Tue, Jul 15, 2025 at 03:23:45PM +0200, David Hildenbrand wrote:
>> Let's convert to vmf_insert_folio_pmd().
>>
>> There is a theoretical change in behavior: in the unlikely case there is
>> already something mapped, we'll now still call trace_dax_pmd_load_hole()
>> and return VM_FAULT_NOPAGE.
>>
>> Previously, we would have returned VM_FAULT_FALLBACK, and the caller
>> would have zapped the PMD to try a PTE fault.
>>
>> However, that behavior was different to other PTE+PMD faults, when there
>> would already be something mapped, and it's not even clear if it could
>> be triggered.
>>
>> Assuming the huge zero folio is already mapped, all good, no need to
>> fallback to PTEs.
>>
>> Assuming there is already a leaf page table ... the behavior would be
>> just like when trying to insert a PMD mapping a folio through
>> dax_fault_iter()->vmf_insert_folio_pmd().
>>
>> Assuming there is already something else mapped as PMD? It sounds like
>> a BUG, and the behavior would be just like when trying to insert a PMD
>> mapping a folio through dax_fault_iter()->vmf_insert_folio_pmd().
>>
>> So, it sounds reasonable to not handle huge zero folios differently
>> to inserting PMDs mapping folios when there already is something mapped.
> 
> Yeah, this all sounds reasonable and I was never able to hit this path with the
> RFC version of this series anyway. So I suspect it really is impossible to hit
> and therefore any change is theoretical.

Thanks for the review and test, Alistair!

-- 
Cheers,

David / dhildenb


