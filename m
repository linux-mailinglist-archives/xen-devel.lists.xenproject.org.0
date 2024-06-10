Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14337901D0F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737044.1143160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaXk-0007b5-GQ; Mon, 10 Jun 2024 08:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737044.1143160; Mon, 10 Jun 2024 08:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaXk-0007YH-Dv; Mon, 10 Jun 2024 08:38:20 +0000
Received: by outflank-mailman (input) for mailman id 737044;
 Mon, 10 Jun 2024 08:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iexp=NM=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sGaXi-0007YB-V4
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:38:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c79ffbd9-2704-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 10:38:16 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-0O7pTDAMMqGbMeHa9jzmJQ-1; Mon, 10 Jun 2024 04:38:08 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35f1ddd8a47so594721f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 01:38:08 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f29629231sm157912f8f.67.2024.06.10.01.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 01:38:06 -0700 (PDT)
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
X-Inumbo-ID: c79ffbd9-2704-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718008695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w6nrbStgbGoljYTouWdcfenV64/6o+i5+It1jT8aCEg=;
	b=Jd7djWf3gGJHWkT268XMsa0ZaIsXYN7IKYiDdUv7q4pI8WWRi5NEL4R5Co4WJrlUlUi5xB
	SS9JV+lWklw4KnBE5scNcJQ04AkmGxYocW1Mg60yyFMZDYHU4FgZdCi9kfHIEmf9X9IUKZ
	S+EPASv1y52bJPDW49QBxwoOLpZdiGY=
X-MC-Unique: 0O7pTDAMMqGbMeHa9jzmJQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008687; x=1718613487;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w6nrbStgbGoljYTouWdcfenV64/6o+i5+It1jT8aCEg=;
        b=n8AVnzmJmMYNrjr3+0oSNArvDOA4YgR/2DpcJa2BlO+F7XXeeVccs+LcEt9KDs8VQz
         khk6C5sTHNLYDRvyHSeCeTosIZ77PIJhzrW3cv368PgjwdwoTIf/VwIhQUG/vFTcriIQ
         sk1U5HMDWxigmso5/TyiX5LnMyoG0v/ZjTHE622vhduL6gimVJs71/cKxdx1FCT8iR3e
         t9k+kBhvbVQrw+8rtneMLODnYDFmHylfQMyz2dBCFSGewHActZsinT+xwxo7vK9YcF60
         kSUzSuA+9oUs/Li1xm5RdscGF2TC02+tCqk8XuIk3vXsNZCL07Ip9u9HDu9+5Wpmdibk
         iV9g==
X-Forwarded-Encrypted: i=1; AJvYcCWevfOfgDf9Ri7VmAC3UxCeiOpBvgAXp5NwAY9WEjq+LEWr10FeO6uF3HjX87jkIOuPcUPIblfjskxOwir9SjXK2tVZs6afUZJXAj1CGPM=
X-Gm-Message-State: AOJu0YytpeCwNYmJ2ofQRanXDiHFE75WHEGjceCisSjQmqsIE5qOv+kl
	wneSe77Uw+AFCtIWpWcro/pXfotm+b7GgAxECjvLx7HLx8DHmqKEMiFFBSpYdTNVxgjpt8F5EXd
	9vK53nMGcVRxf1M6rJtcvIrvg4hWpITj3bofOpo40ihkMyg90DE6w09GQAMjJ7VRm
X-Received: by 2002:a5d:5f90:0:b0:35f:22d9:cab3 with SMTP id ffacd0b85a97d-35f22d9cd51mr2249202f8f.36.1718008687513;
        Mon, 10 Jun 2024 01:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXEFywI0gemoc9w1rogNSIeoaxga56ZirfcbsHoHRmzr//4KCG2uOiq+HM1RIZR6Nee59Wpg==
X-Received: by 2002:a5d:5f90:0:b0:35f:22d9:cab3 with SMTP id ffacd0b85a97d-35f22d9cd51mr2249152f8f.36.1718008686974;
        Mon, 10 Jun 2024 01:38:06 -0700 (PDT)
Message-ID: <13070847-4129-490c-b228-2e52bd77566a@redhat.com>
Date: Mon, 10 Jun 2024 10:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
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
 <ZmZ7GgwJw4ucPJaM@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZmZ7GgwJw4ucPJaM@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.24 06:03, Oscar Salvador wrote:
> On Fri, Jun 07, 2024 at 11:09:36AM +0200, David Hildenbrand wrote:
>> In preparation for further changes, let's teach __free_pages_core()
>> about the differences of memory hotplug handling.
>>
>> Move the memory hotplug specific handling from generic_online_page() to
>> __free_pages_core(), use adjust_managed_page_count() on the memory
>> hotplug path, and spell out why memory freed via memblock
>> cannot currently use adjust_managed_page_count().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> All looks good but I am puzzled with something.
> 
>> +	} else {
>> +		/* memblock adjusts totalram_pages() ahead of time. */
>> +		atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
>> +	}
> 
> You say that memblock adjusts totalram_pages ahead of time, and I guess
> you mean in memblock_free_all()

And memblock_free_late(), which uses atomic_long_inc().

> 
>   pages = free_low_memory_core_early()
>   totalram_pages_add(pages);
> 
> but that is not ahead, it looks like it is upading __after__ sending
> them to buddy?

Right (it's suboptimal, but not really problematic so far. Hopefully Wei 
can clean it up and move it in here as well)

For the time being

"/* memblock adjusts totalram_pages() manually. */"

?

Thanks!

-- 
Cheers,

David / dhildenb


