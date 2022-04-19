Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3A506C25
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 14:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308084.523609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmnS-0003yw-As; Tue, 19 Apr 2022 12:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308084.523609; Tue, 19 Apr 2022 12:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmnS-0003w5-7h; Tue, 19 Apr 2022 12:17:30 +0000
Received: by outflank-mailman (input) for mailman id 308084;
 Tue, 19 Apr 2022 12:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr1R=U5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngmnQ-0003vz-Et
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 12:17:28 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad388f2c-bfda-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 14:17:27 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id bq30so29059182lfb.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 05:17:27 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a19500f000000b0046bb76678bcsm1497380lfb.131.2022.04.19.05.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 05:17:26 -0700 (PDT)
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
X-Inumbo-ID: ad388f2c-bfda-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c4jLu+nEjW6ZyZXVzGI5SDD7yHtnUvhBe/fmRqUVNIQ=;
        b=XHTyOUDABQ14gZmVv1k6ZT33I2aAbve42wB0HyHQxv7GIG6L7ZAKcuW2rGSxXu/ygr
         JnWzRmFHo9x1ZE21q1MdOXNxgM0G6U0dzM3232itmYKA3MVrjrU/MLuccHMgIGDrN3hH
         D3+yMStuFAvLXza9j2W/bcrz9OIx2WmpcXkiVEVsqxbasDR23Ydv/wFqPV9IL4cz2XuP
         +09gFQTuxn7+b56CTrbPi8/Pq6zYk0zHk6sQvCLKjT9J2p/G9SV4KjVtjs3cOMisAS2O
         mivwFNQc84cRhVQafMN71BdlBSk1jKUOclNnS4aoAd2n+l9UOg0Iyj5GA7Yfjtxo1el9
         KIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c4jLu+nEjW6ZyZXVzGI5SDD7yHtnUvhBe/fmRqUVNIQ=;
        b=D5WbHCOyQdRF3ojaqKoXOupBHxuMbrptEgFN5+b/EBbRZL/qx+ZB/qiBZJ6U/zpO4f
         4T9h6S5S8MBGEDvCGFugtzQytxoIgCbYxh8gsQ9WoUO+SbwMwmdWN1PevR/E0cSaHTZS
         2g8F/Mzer52WYRJUqE/mwRj9Fd/hICRbMoO8vg32uh4MEzSsC84Bso2V6y+ITuP5b/w7
         k9ct3b2fgIjJyorYr3BkWfwH8OptCX1HRvm3RiYU/RETYlftPeYbZaOgm+ZK3h3DvugE
         lea8DYRdxs/ptM199e+kDFd/IzCyfgQRFd+tE+tQs8rilYGbaK/kqw7Aqu2EL9pzWN4x
         BBWw==
X-Gm-Message-State: AOAM533IyUhWrF5uM6Q4zFOdz8CiJJlCIEMhw+f75DSiEHVCIcQzwCMB
	7dmfIhNGXgmswQohXx1SSIU=
X-Google-Smtp-Source: ABdhPJwkKAkPv72l8VLD2wXgvdqXMSxh5RJKyI64dvC+KXpqtAP43wJmw6LIPT1nv21iuUsXGSy77w==
X-Received: by 2002:a05:6512:c28:b0:471:9a7d:de9e with SMTP id z40-20020a0565120c2800b004719a7dde9emr5320943lfu.440.1650370646660;
        Tue, 19 Apr 2022 05:17:26 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
To: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
 <YlpdBHKT1bYzZe2e@infradead.org>
 <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
 <alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6a04cc34-fbb3-44d8-c1a4-03bda5b3deb1@gmail.com>
Date: Tue, 19 Apr 2022 15:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello Stefano, Juergen


On 18.04.22 22:11, Stefano Stabellini wrote:
> On Mon, 18 Apr 2022, Oleksandr wrote:
>> On 16.04.22 09:07, Christoph Hellwig wrote:
>>
>> Hello Christoph
>>
>>> On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini wrote:
>>>> This makes sense overall. Considering that the swiotlb-xen case and the
>>>> virtio case are mutually exclusive, I would write it like this:
>>> Curious question:  Why can't the same grant scheme also be used for
>>> non-virtio devices?  I really hate having virtio hooks in the arch
>>> dma code.  Why can't Xen just say in DT/ACPI that grants can be used
>>> for a given device?
> [...]
>
>> This patch series tries to make things work with "virtio" devices in Xen
>> system without introducing any modifications to code under drivers/virtio.
>
> Actually, I think Christoph has a point.
>
> There is nothing inherently virtio specific in this patch series or in
> the "xen,dev-domid" device tree binding.


Although the main intention of this series was to enable using virtio 
devices in Xen guests, I agree that nothing in new DMA ops layer 
(xen-virtio.c) is virtio specific (at least at the moment). Regarding 
the whole patch series I am not quite sure, as it uses 
arch_has_restricted_virtio_memory_access().


>   Assuming a given device is
> emulated by a Xen backend, it could be used with grants as well.
>
> For instance, we could provide an emulated e1000 NIC with a
> "xen,dev-domid" property in device tree. Linux could use grants with it
> and the backend could map the grants. It would work the same way as
> virtio-net/block/etc. Passthrough devices wouldn't have the
> "xen,dev-domid" property, so no problems.
>
> So I think we could easily generalize this work and expand it to any
> device. We just need to hook on the "xen,dev-domid" device tree
> property.
>
> I think it is just a matter of:
> - remove the "virtio,mmio" check from xen_is_virtio_device
> - rename xen_is_virtio_device to something more generic, like
>    xen_is_grants_device
> - rename xen_virtio_setup_dma_ops to something more generic, like
>    xen_grants_setup_dma_ops
>
> And that's pretty much it.

+ likely renaming everything in that patch series not to mention virtio 
(mostly related to xen-virtio.c internals).


Stefano, thank you for clarifying Christoph's point.

Well, I am not against going this direction. Could we please make a 
decision on this? @Juergen, what is your opinion?



-- 
Regards,

Oleksandr Tyshchenko


