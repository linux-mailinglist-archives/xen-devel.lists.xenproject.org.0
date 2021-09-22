Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32442414F62
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192982.343746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6N4-00072w-1G; Wed, 22 Sep 2021 17:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192982.343746; Wed, 22 Sep 2021 17:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6N3-00070K-TB; Wed, 22 Sep 2021 17:49:25 +0000
Received: by outflank-mailman (input) for mailman id 192982;
 Wed, 22 Sep 2021 17:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XTvp=OM=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mT6N3-0006zv-7o
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:49:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c2d21b5-1bcd-11ec-b9c4-12813bfff9fa;
 Wed, 22 Sep 2021 17:49:24 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-rlQXclYWMMeNbimgPpj5Jw-1; Wed, 22 Sep 2021 13:49:22 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2825999wrb.20
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 10:49:22 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64dd.dip0.t-ipconnect.de. [91.12.100.221])
 by smtp.gmail.com with ESMTPSA id m4sm3482985wrx.81.2021.09.22.10.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:49:20 -0700 (PDT)
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
X-Inumbo-ID: 6c2d21b5-1bcd-11ec-b9c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632332963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
	b=Ag07l4jLOAcBPXgy08f5PMjSH8BISpFcZxHWZ3NGnZCCw7EE04gLvZDd+bE4A/TshlKUM5
	Y6Z3qfmDFq7fmG6SXXJthZfZldme8mgOvhqpi/w/LyrcsIdAnS4XuiDMVtKiCYaiwv7yB5
	0Yum6r0WiiSNefvjClMXaBHTJ4Ou5Ec=
X-MC-Unique: rlQXclYWMMeNbimgPpj5Jw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
        b=XphXeaQiGrN+EzwMrl3bJuNCvau9YQsSDpDWsi63N2TSBMNljMzAp8H85WzFH/gl2d
         PqOzJ1f3t7rKhrHYmfL7rOwEDw+PfVyPo1cVA+bHkYVTGAujIfJUBdz9FNhzMXDNvmn4
         j0NLTXRO4NfcVlaVEwdIyYz6a+y7bdWdud97PqiyWONPrVr8Sm0AEQxSqbaVoVXDRGHB
         LQw+fWG6fYGgzYEbpq1ejC8Yaw3MQDEHUPIkK8ZEu89fUY/x33atEwW0p2/SJfQPGTDQ
         Qgnbusvf+KDl3GB1jhMW0WwtuExRpYt4faptpcmbdXgE3c5C6lSLw8SDICSLHGuVDguX
         y97g==
X-Gm-Message-State: AOAM531uPDnGx0UX0sQFTl8ctOl0+u1iVDnt4aIX9arckGh3yjfaLBvD
	nRxP/qhtwklZqdpIZJUfDh4DPjSVQUpDtgqMlIsM6Fn1GCQfjTTQU+ett3C78rO8SfouciXLw6b
	LAeQyYgAEXIu9y0Faee7XqrckRtE=
X-Received: by 2002:a05:6000:1844:: with SMTP id c4mr187151wri.355.1632332961339;
        Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDZycGgzlG5PLVo/6Isj0bTJcO/O5J4WdjAYiBchkHxW5ecBClNDAyi9t+1qZPrUoaXfO12g==
X-Received: by 2002:a05:6000:1844:: with SMTP id c4mr187105wri.355.1632332961083;
        Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org, mark.burton@greensocs.com,
 mirela.grujic@greensocs.com, edgari@xilinx.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8ff0d8c9-94f1-cc21-a9f9-bb5fcd1cc3e7@redhat.com>
Date: Wed, 22 Sep 2021 19:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.09.21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..422e1eda67 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority);
>   
> +/**
> + * memory_region_try_add_subregion: Add a subregion to a container
> + *                                  with error handling.
> + *
> + * Behaves like memory_region_add_subregion_overlap(), but errors are
> + * reported if the subregion cannot be added.
> + *
> + * @mr: the region to contain the new subregion; must be a container
> + *      initialized with memory_region_init().
> + * @offset: the offset relative to @mr where @subregion is added.
> + * @subregion: the subregion to be added.
> + * @priority: used for resolving overlaps; highest priority wins.
> + * @errp: pointer to Error*, to store an error if it happens.
> + *
> + * Returns: True in case of success, false otherwise.
> + */
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp);
> +
>   /**
>    * memory_region_get_ram_addr: Get the ram address associated with a memory
>    *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..eac61f8236 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2513,22 +2513,28 @@ done:
>       memory_region_transaction_commit();
>   }
>   
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>   {
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +    subregion->priority = priority;
>       subregion->container = mr;
>       subregion->addr = offset;
>       memory_region_update_container_subregions(subregion);
> +    return true;
>   }
>   
>   void memory_region_add_subregion(MemoryRegion *mr,
>                                    hwaddr offset,
>                                    MemoryRegion *subregion)
>   {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>   }
>   
>   void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority)
>   {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>   }
>   
>   void memory_region_del_subregion(MemoryRegion *mr,
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


