Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E090453C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738750.1145609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7WH-0003dQ-NP; Tue, 11 Jun 2024 19:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738750.1145609; Tue, 11 Jun 2024 19:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7WH-0003au-JL; Tue, 11 Jun 2024 19:51:01 +0000
Received: by outflank-mailman (input) for mailman id 738750;
 Tue, 11 Jun 2024 19:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I6Ds=NN=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sH7WG-0003ao-JB
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:51:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec11d165-282b-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 21:50:59 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-MlxRDyHpPaej60Ac1jwDIQ-1; Tue, 11 Jun 2024 15:50:56 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42153125d3eso44059405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 12:50:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c748:ba00:1c00:48ea:7b5a:c12b?
 (p200300cbc748ba001c0048ea7b5ac12b.dip0.t-ipconnect.de.
 [2003:cb:c748:ba00:1c00:48ea:7b5a:c12b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42274379b83sm16254225e9.28.2024.06.11.12.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 12:50:54 -0700 (PDT)
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
X-Inumbo-ID: ec11d165-282b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718135457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VC/FKQpyiv8QuT0prkiboQ+mv2U8+abllOC5cV7bqrg=;
	b=LIHd12/+iiuaD64VAKpt0kUPqHDOin39OncI1af6A8GWSipj7qOYseukDigUEiwfZD20IY
	KvQgDisbRAwu7xDPn+gMuGJtbsuvyRV7QRURfLzED9ZkOTqiVm/B18xWLCEc6RvIFs9lo4
	aW6DmYh144JfkVJ9Ak4Q/qUJUWcMrEY=
X-MC-Unique: MlxRDyHpPaej60Ac1jwDIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135455; x=1718740255;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VC/FKQpyiv8QuT0prkiboQ+mv2U8+abllOC5cV7bqrg=;
        b=V5QZmyjVqULH57uq1dkfVxWs8Gh6DNNvf2x6nzliojxxeNtaf9oXzxG4gVpo7cDet4
         Jpdf+qkihyMCpOPMZf9pU8oe2ognGxuz1Snn0z6KrnAvJmPz3nM1xJYtBN7YXMgMM+uh
         S+GMQ6AmoU2JmPuSu0qm/78BAPEyjNnb7uTHwPNra9mgOOY3RgaWzg7cHF4jAi2R8YYw
         Ovd9GPxJlbUxkwzoUhnvMAFa5EOzqAH3seC6gDif83/eDJGEPv7GmsgSxyBsYVKc9bRK
         6NhrobqyOkAP/f0oakx6wOWtN/Jz47Ujpw/OwwKJXJT9MIA2bwVcLOb5ydWck+qAoKmK
         LRlg==
X-Forwarded-Encrypted: i=1; AJvYcCWUA8ptub3THXiuJcYacwWQ7KaxcgXU19I7jxApVFPxr7JznPGjRftEnXVIPwgld+8mrkA2pzC3GtqINKGtI539MKwnGp+Aq6h0wBZFvIs=
X-Gm-Message-State: AOJu0YxhNZu6hibSGlkgsR4R8A9Rf1kRU3CLy84zlSPuQstGmT2c5NhA
	StsnSjR6YP3TEHM5u/748se+/RlE7JZ3XKXCBXIWWZlAkuScDcYGJyvV2dT+E75+558WmV+gD8t
	bXT13mZxjzenFj9cuwE5yHpIIDuv/+DfJwtVrfiJ6iZFu8MCYG0CU20rPz06v1163
X-Received: by 2002:a05:600c:1c91:b0:421:8028:a507 with SMTP id 5b1f17b1804b1-4218028a5f6mr70330435e9.18.1718135455367;
        Tue, 11 Jun 2024 12:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeIZw5rvJCb1LtW+k52Hf6likkqbQ5y9zsOlyQgFY0I2VYm+kIPKpawNjMsNjEje9W3JPASg==
X-Received: by 2002:a05:600c:1c91:b0:421:8028:a507 with SMTP id 5b1f17b1804b1-4218028a5f6mr70330165e9.18.1718135454911;
        Tue, 11 Jun 2024 12:50:54 -0700 (PDT)
Message-ID: <fff6e4d3-4a11-4481-b28c-edfb072daf35@redhat.com>
Date: Tue, 11 Jun 2024 21:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
To: Tim Chen <tim.c.chen@linux.intel.com>, linux-kernel@vger.kernel.org
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
 <80532f73e52e2c21fdc9aac7bce24aefb76d11b0.camel@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <80532f73e52e2c21fdc9aac7bce24aefb76d11b0.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 21:41, Tim Chen wrote:
> On Fri, 2024-06-07 at 11:09 +0200, David Hildenbrand wrote:
>> In preparation for further changes, let's teach __free_pages_core()
>> about the differences of memory hotplug handling.
>>
>> Move the memory hotplug specific handling from generic_online_page() to
>> __free_pages_core(), use adjust_managed_page_count() on the memory
>> hotplug path, and spell out why memory freed via memblock
>> cannot currently use adjust_managed_page_count().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/internal.h       |  3 ++-
>>   mm/kmsan/init.c     |  2 +-
>>   mm/memory_hotplug.c |  9 +--------
>>   mm/mm_init.c        |  4 ++--
>>   mm/page_alloc.c     | 17 +++++++++++++++--
>>   5 files changed, 21 insertions(+), 14 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 12e95fdf61e90..3fdee779205ab 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -604,7 +604,8 @@ extern void __putback_isolated_page(struct page *page, unsigned int order,
>>   				    int mt);
>>   extern void memblock_free_pages(struct page *page, unsigned long pfn,
>>   					unsigned int order);
>> -extern void __free_pages_core(struct page *page, unsigned int order);
>> +extern void __free_pages_core(struct page *page, unsigned int order,
>> +		enum meminit_context);
> 
> Shouldn't the above be
> 		enum meminit_context context);

Although C allows parameters without names in declarations, this was 
unintended.

Thanks!

-- 
Cheers,

David / dhildenb


