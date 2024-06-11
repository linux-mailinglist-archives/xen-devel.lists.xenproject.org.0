Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30170904465
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738676.1145500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH73O-0000a3-Ap; Tue, 11 Jun 2024 19:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738676.1145500; Tue, 11 Jun 2024 19:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH73O-0000Ws-8B; Tue, 11 Jun 2024 19:21:10 +0000
Received: by outflank-mailman (input) for mailman id 738676;
 Tue, 11 Jun 2024 19:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I6Ds=NN=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sH73M-0000Wf-LX
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:21:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be513377-2827-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 21:21:04 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-EDKUggXhPFyS5bAid2De1Q-1; Tue, 11 Jun 2024 15:21:01 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42120e123beso53280505e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 12:21:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c748:ba00:1c00:48ea:7b5a:c12b?
 (p200300cbc748ba001c0048ea7b5ac12b.dip0.t-ipconnect.de.
 [2003:cb:c748:ba00:1c00:48ea:7b5a:c12b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421fd7573c0sm65944095e9.38.2024.06.11.12.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 12:20:59 -0700 (PDT)
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
X-Inumbo-ID: be513377-2827-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718133663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iaiFAJhQM+Rt1OjOGeJr7VugpzhyWLTZGK0DjHGr1/Q=;
	b=exjtnSIFaIDYIvunQw51w6sP15W8su+LrOLt1hBe0XnKmKSSrtY901+A1Wy9cxQrzghBoi
	Laq0P3dAF6fr/unSvamO1CDaaZTkM1ITYBWpfQwlvTWsGplZb2caxQHg5I48srYeLhHfDl
	uj24nyUTf36ujjhaqPNQ3h70nvfnIB8=
X-MC-Unique: EDKUggXhPFyS5bAid2De1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718133660; x=1718738460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iaiFAJhQM+Rt1OjOGeJr7VugpzhyWLTZGK0DjHGr1/Q=;
        b=K7HOnmAtYOzms/86wmhpdnEU1Rlr/a1RDbXajERTucHtMyR/Jcye3jp8R3j9Jlb+me
         eVNG0QRDWJANDaphI082Oc9mogahNEhlt4EWofFBOJN7GykfngOMzN0crOtYj9Y3icqp
         JxaKFvaTDD5Jp3SLRaeWJUH33Xe4bpGfexktruzauN5dX1vY7ftqfjxe9dX7mdB8pD80
         mx168rNjslJCAAzgt1iyR5bNK7iUbb/qbidKRvYIVxSntqQD9etuty9tEYBiZ3aOZZdn
         3nnJoGjAUhvYgl+jrtopI77z93QiVbWBbaxQOh6Apw10Kvg5A1bZh6zWeNX0YLELsuvg
         Vc5A==
X-Forwarded-Encrypted: i=1; AJvYcCVw5u4UD5yaJvmqmZNsFv4nUwW2bIHaDuZjqxZe8z3mtH3CrHVTHXlOzxEbf5qSDu1OC8qGhknlJvJKjqOdQkFgDmST/tCkZRluCrBNvMA=
X-Gm-Message-State: AOJu0Yz528SgFtI2vKWpZavIZd5bLRa/EGQQao4uBJVWcBELoiBL3aVW
	vRvEhiqs6ukZDoETzJx+FNfKUf47rXOVWl9l3g+sVJPggN4rvSqJrygkLsy9AEjEfMpSOp3mMPV
	n9Kb6ZZlLbnGvwr2iIFFtxCeWnNmYdz1Cyj+eiX0GRbiWkPRY5NqtBau2gOy9V52+
X-Received: by 2002:a05:600c:4e87:b0:421:7f30:7cfb with SMTP id 5b1f17b1804b1-4217f308036mr79478505e9.40.1718133660222;
        Tue, 11 Jun 2024 12:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZHgVQLSKwOZIrNSQnQXJqFPIbdpuB578AjS4z7cwEh73NInG9mIJ1L/Lk0ZLrDzgll6w0ZQ==
X-Received: by 2002:a05:600c:4e87:b0:421:7f30:7cfb with SMTP id 5b1f17b1804b1-4217f308036mr79478295e9.40.1718133659765;
        Tue, 11 Jun 2024 12:20:59 -0700 (PDT)
Message-ID: <6165471b-e86b-456b-99c6-c308bf5d6e4c@redhat.com>
Date: Tue, 11 Jun 2024 21:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com,
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
 <2ed64218-7f3b-4302-a5dc-27f060654fe2@redhat.com>
 <20240611121942.050a2215143af0ecb576122f@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240611121942.050a2215143af0ecb576122f@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 21:19, Andrew Morton wrote:
> On Tue, 11 Jun 2024 12:06:56 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>> On 07.06.24 11:09, David Hildenbrand wrote:
>>> In preparation for further changes, let's teach __free_pages_core()
>>> about the differences of memory hotplug handling.
>>>
>>> Move the memory hotplug specific handling from generic_online_page() to
>>> __free_pages_core(), use adjust_managed_page_count() on the memory
>>> hotplug path, and spell out why memory freed via memblock
>>> cannot currently use adjust_managed_page_count().
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>
>> @Andrew, can you squash the following?
> 
> Sure.
> 
> I queued it against "mm: pass meminit_context to __free_pages_core()",
> not against

Ah yes, sorry. Thanks!

-- 
Cheers,

David / dhildenb


