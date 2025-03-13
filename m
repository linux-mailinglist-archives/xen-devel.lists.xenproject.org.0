Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5501A5EDCC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911412.1317845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdlH-0000zN-Mh; Thu, 13 Mar 2025 08:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911412.1317845; Thu, 13 Mar 2025 08:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdlH-0000xj-Iu; Thu, 13 Mar 2025 08:17:51 +0000
Received: by outflank-mailman (input) for mailman id 911412;
 Thu, 13 Mar 2025 08:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gXIy=WA=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1tsdlF-0000vo-Jw
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:17:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58392fa-ffe3-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:17:48 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-y--O_IVFNf--O2ZP5OjUCQ-1; Thu, 13 Mar 2025 04:17:44 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso3087865e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:17:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:7c00:4ac1:c2c4:4167:8a0f?
 (p200300d82f1a7c004ac1c2c441678a0f.dip0.t-ipconnect.de.
 [2003:d8:2f1a:7c00:4ac1:c2c4:4167:8a0f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d1666sm45451055e9.40.2025.03.13.01.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:17:42 -0700 (PDT)
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
X-Inumbo-ID: a58392fa-ffe3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741853866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d25kVXr7HGSUNn9iASDWypye6xCMoC8F2pO7KRGBFvQ=;
	b=OvySNITN7N4k/bRTNuHnOUxWF83sU5eNbwhUjvjtOuJ8DHs3RNW6fjfzCSE9d0PYtEgfL7
	pP9GOWlzDftOUiUTECHIIF78k05Qo9gRQg5bv6O/nL92wDBt0RVD5I9evCWl8ViNRmrMIs
	ZZOw+NbKOWUIjb0dr7zrDaIQNpUYmxE=
X-MC-Unique: y--O_IVFNf--O2ZP5OjUCQ-1
X-Mimecast-MFC-AGG-ID: y--O_IVFNf--O2ZP5OjUCQ_1741853863
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853863; x=1742458663;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d25kVXr7HGSUNn9iASDWypye6xCMoC8F2pO7KRGBFvQ=;
        b=m9dmmJKtBWgxkJQoMHKSELEPz2PhaxU0+x4LcJiWX1h1ED1HEQRq3Nh3Z3ufOYGRsX
         FcGPJ0iwUdX1Yg4JppfTmz3hxuWricVXoc7CrhQbq+SxjYfJ3ezs/r32L29j3qM8TNAb
         jQ6sGYOWgeosezdCPQcvK4+MsTK2Ct4U2SGlJKYDAuM8B/ImtWllXwYVviZi0G24uCRh
         SWi6EGjwVKE6AmPHJbLg32qKiHtBn4/5jutP4ViGvMKRlqFafPaTVjrmeQHsgC/U4m5w
         81cCPTzvHqdXw/5Ur1fvAVXAcG2/1flAPSBlqG+U0keBF+9ySZoUESPPR7oIVtDer+1u
         pvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfLPmVplQl5vl82kr62U64bGseenqtqmwYR651YMs3AEo7JPnKjmaU3TUv1RzVG3JhVNb1lCQiHY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+zwU4YaPVG0MG/RBEwnQ/CZRmIeY/lVd+bNXNvy13dy1GMyTC
	G0mN3gZFAJGlAgDHIlTYfURd1amlN3PcZaBwvEUjhL+QQZn2tebQvVqyo/FBj0nnhM+Z3A/llAj
	YYeA/p71iZPC0ajfkWEiIg9fEYpmUjMIlOOxDfoGz2eMC6lmutfJoC5ZcxjWXWatT
X-Gm-Gg: ASbGncv+grlXVrZcVhxYzieDFnPe4qzFqWJTLw2EBFd9mOL3HJth98zHMkAZznAD5cK
	HoaG0jHtCHJc3vQ39forL0fudAF2UuqEzP56RDfZ+T+6ka5yJtWtV0uRJF9MO0c70hesF8KRj8P
	htX7tn+LFc/ID2kePGJPJ6mUItfnokp/ZpT94yS0SJPLpit4fzQn37nPr0WPrj6sTD6elXCarl7
	iArctdFsKsr4itjoBuhgnlQlrPHr3w2YGeNu8IQKqO92bxSzPtwup/kf2aVpxUaR0IY4DnF4IC3
	e4SPrKknNR9RQzTSaicIWTNem5AzHOSKn9wA5rsMWFEuSyylRDUXAz2W8jF8i5xfawKK1zsZVJR
	zIpsjX75CNpAprpYhvqZlBVsiIgIXdE4/sNfP4B7Etxc=
X-Received: by 2002:a05:600c:3510:b0:43b:d1ad:9241 with SMTP id 5b1f17b1804b1-43c601d889dmr168277365e9.9.1741853863224;
        Thu, 13 Mar 2025 01:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8xDZePqcXZCtF9AAtTy2leCGXfaU4pDNiDVVh8H66qiKRFFrlJmyfFywifFDAuFvXFuDtZA==
X-Received: by 2002:a05:600c:3510:b0:43b:d1ad:9241 with SMTP id 5b1f17b1804b1-43c601d889dmr168277105e9.9.1741853862785;
        Thu, 13 Mar 2025 01:17:42 -0700 (PDT)
Message-ID: <4e1b5d05-f210-4aaf-a7d2-80458b9f20f9@redhat.com>
Date: Thu, 13 Mar 2025 09:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] meminfo: add a per node counter for balloon drivers
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Nico Pache <npache@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, cgroups@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 jerrin.shaji-george@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, jasowang@redhat.com,
 xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 nphamcs@gmail.com, yosry.ahmed@linux.dev, kanchana.p.sridhar@intel.com,
 alexander.atanasov@virtuozzo.com
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-2-npache@redhat.com>
 <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com>
 <20250313032001-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250313032001-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b6RNTSz3BnAx3BfwiL9DAP2EJoTrDHyekMpVnmQ7X88_1741853863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.03.25 08:20, Michael S. Tsirkin wrote:
> On Wed, Mar 12, 2025 at 11:19:06PM +0100, David Hildenbrand wrote:
>> On 12.03.25 01:06, Nico Pache wrote:
>>> Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
>>> expose it through /proc/meminfo and other memory reporting interfaces.
>>
>> In balloon_page_enqueue_one(), we perform a
>>
>> __count_vm_event(BALLOON_INFLATE)
>>
>> and in balloon_page_list_dequeue
>>
>> __count_vm_event(BALLOON_DEFLATE);
>>
>>
>> Should we maybe simply do the per-node accounting similarly there?
> 
> 
> BTW should virtio mem be tied into this too, in some way? or is it too
> different?

No, we should limit it to actual balloon drivers that e.g., never 
completely remove memory.

-- 
Cheers,

David / dhildenb


