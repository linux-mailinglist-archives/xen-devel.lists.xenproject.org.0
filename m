Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBA9034BE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738014.1144574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwUa-0008K3-Nr; Tue, 11 Jun 2024 08:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738014.1144574; Tue, 11 Jun 2024 08:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwUa-0008Hu-LE; Tue, 11 Jun 2024 08:04:32 +0000
Received: by outflank-mailman (input) for mailman id 738014;
 Tue, 11 Jun 2024 08:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I6Ds=NN=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sGwUZ-0008Ho-5z
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:04:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39969dd0-27c9-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 10:04:28 +0200 (CEST)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-Qcpa36pOOuW6iPMUKDwWXA-1; Tue, 11 Jun 2024 04:04:19 -0400
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2eae96cecaeso30962451fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 01:04:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c748:ba00:1c00:48ea:7b5a:c12b?
 (p200300cbc748ba001c0048ea7b5ac12b.dip0.t-ipconnect.de.
 [2003:cb:c748:ba00:1c00:48ea:7b5a:c12b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42182ed2b23sm75337235e9.18.2024.06.11.01.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 01:04:17 -0700 (PDT)
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
X-Inumbo-ID: 39969dd0-27c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718093067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hqXBYKFMfHuGo/oWXFTKDIQ0hmdU9g1oFp9QTADLe9k=;
	b=dec9CIfZetR2cYPaBbivWEvSrnc2UqHVfkxbKoFbs9gsRusG1hLtHnQuEfcaR/E2YVn6Rb
	o4NGBkvh0wDqcOyZEDqid/Z56VCcCVH3/VvZoVmyqTqtcaaILI0z0BEOp8s+WLFVqdKWmk
	m9qowwUdWoKYRxEVrBsS9AykH9FEvRw=
X-MC-Unique: Qcpa36pOOuW6iPMUKDwWXA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718093058; x=1718697858;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hqXBYKFMfHuGo/oWXFTKDIQ0hmdU9g1oFp9QTADLe9k=;
        b=fZUrJ8P2MsDv0GOY7o5YtHpFSlubMB1jllp6DmLN6NfRi0OrwiSIitlDEWlauCL5K/
         mx8vvqNCBaXlSGWqnFYpQ4oh/uURMFO9OzhyZY1pjr/rpHrCA7Vm9D+VbIAAK2dqnwZl
         OAjtS6PgXIdqIXrgWAjGtI6knVO3Fl0F0PKySdG7R8lGrmeChyIUhGfCyaXnYrUCbbnp
         aVV7b1G2rwqWLHLA4Y7r8C5JHF/HVxLKNUm3s2CsYjxSbN9samR7Mt+zwQ6GjGl87XNx
         VHnQsOPs0BUkE2R0eLftBZ6maZparfCnA+75pdO+Cg8HsEgaMEeRWYg5r+dl8BZr/BEx
         QtmA==
X-Forwarded-Encrypted: i=1; AJvYcCVTyS/569+WnBZ3fKl8bUdyyVm7frLGQnP64ffBN91lU6fDiP+DY7X8BFkKkHSXrQ7pEsYoi8io5frEiCKiyNYTCjXrPk0ahBTfkVV8g+E=
X-Gm-Message-State: AOJu0YwCwlA9yoY0mcIG/OSDIjqTyDgZFbQk4PEPufVRnKDP+613dFrz
	SMxtXLfvxVSvehpU/9iYCectqKPn06UATNKHUkTzM2xrW3b+ZlYmAXZQpTKklvfb5ZnLGaao6RS
	1zWzQQF5Jj+MhvUJaP7CPfABpQxWEh0vLW5ZnH7C/i3tObEFDuAe2302Op1gj9jyW
X-Received: by 2002:a2e:87cb:0:b0:2eb:f82a:d8d2 with SMTP id 38308e7fff4ca-2ebf82adfe7mr159631fa.41.1718093058332;
        Tue, 11 Jun 2024 01:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKToayglVvfmqXbbZxIgMw6bY+YaaS9CFQLQWFoPjFHVHH1W6TdHfgwTXUw4yHKqwXuMGUGQ==
X-Received: by 2002:a2e:87cb:0:b0:2eb:f82a:d8d2 with SMTP id 38308e7fff4ca-2ebf82adfe7mr159231fa.41.1718093057647;
        Tue, 11 Jun 2024 01:04:17 -0700 (PDT)
Message-ID: <30b5d493-b7c2-4e63-86c1-dcc73d21dc15@redhat.com>
Date: Tue, 11 Jun 2024 10:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: initialize memmap of
 !ZONE_DEVICE with PageOffline() instead of PageReserved()
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
 <20240607090939.89524-3-david@redhat.com>
 <ZmZ_3Xc7fdrL1R15@localhost.localdomain>
 <5d9583e1-3374-437d-8eea-6ab1e1400a30@redhat.com>
 <ZmgAsolx7SAHeDW7@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZmgAsolx7SAHeDW7@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 09:45, Oscar Salvador wrote:
> On Mon, Jun 10, 2024 at 10:56:02AM +0200, David Hildenbrand wrote:
>> There are fortunately not that many left.
>>
>> I'd even say marking them (vmemmap) reserved is more wrong than right: note
>> that ordinary vmemmap pages after memory hotplug are not reserved! Only
>> bootmem should be reserved.
> 
> Ok, that is a very good point that I missed.
> I thought that hotplugged-vmemmap pages (not selfhosted) were marked as
> Reserved, that is why I thought this would be inconsistent.
> But then, if that is the case, I think we are safe as kernel can already
> encounter vmemmap pages that are not reserved and it deals with them
> somehow.
> 
>> Let's take at the relevant core-mm ones (arch stuff is mostly just for MMIO
>> remapping)
>>
> ...
>> Any PageReserved user that I am missing, or why we should handle these
>> vmemmap pages differently than the ones allocated during ordinary memory
>> hotplug?
> 
> No, I cannot think of a reason why normal vmemmap pages should behave
> different than self-hosted.
> 
> I was also confused because I thought that after this change
> pfn_to_online_page() would be different for self-hosted vmemmap pages,
> because I thought that somehow we relied on PageOffline(), but it is not
> the case.

Fortunately not :) PageFakeOffline() or PageLogicallyOffline()  might be 
clearer, but I don't quite like these names. If you have a good idea, 
please let me know.

> 
>> In the future, we might want to consider using a dedicated page type for
>> them, so we can stop using a bit that doesn't allow to reliably identify
>> them. (we should mark all vmemmap with that type then)
> 
> Yes, a all-vmemmap pages type would be a good thing, so we do not have
> to special case.
> 
> Just one last thing.
> Now self-hosted vmemmap pages will have the PageOffline cleared, and that
> will still remain after the memory-block they belong to has gone
> offline, which is ok because those vmemmap pages lay around until the
> chunk of memory gets removed.

Yes, and that memmap might even get poisoned in debug kernels to catch 
any wrong access.

> 
> Ok, just wanted to convince myself that there will no be surprises.
> 
> Thanks David for claryfing.

Thanks for the review and raising that. I'll add more details to the 
patch description!

-- 
Cheers,

David / dhildenb


