Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E050DF9E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312836.530222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixQk-0002q9-Ot; Mon, 25 Apr 2022 12:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312836.530222; Mon, 25 Apr 2022 12:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixQk-0002nB-L8; Mon, 25 Apr 2022 12:03:02 +0000
Received: by outflank-mailman (input) for mailman id 312836;
 Mon, 25 Apr 2022 12:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uj5J=VD=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nixQi-0002n5-OT
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:03:00 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b66981-c48f-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:02:49 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id q14so17502641ljc.12
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 05:02:54 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a19e04f000000b004720d33b1easm198984lfj.72.2022.04.25.05.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:02:52 -0700 (PDT)
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
X-Inumbo-ID: a0b66981-c48f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Z2QfP3nBSkXabdhdfaB6eqqdio2/U/RhPvB3lPD+Pao=;
        b=lpYDpGtxrOQn5xrajUhJXwbUXhyOxOjdyRzr7m44dbrz+0NPBwe/T+YmCwnySSzN75
         ozEBrTQXeq+PnhUTQuum3IpBoXy4R3v3xTqqJB5DMhLLX42mDe6GG92eDN/i4Z/mzYzq
         xka1M+inBE39A6+dpvucVBJiXgHa4bxBzqecI6IUkNDw9qHHVRxN7jyqRsE0o4Bv5jFl
         KzIyDD+y6I6L89FJ2qM0+/704SmsZsiP3avlvjJEud5YimNIBEKk8SDv2xs/JL+5vPks
         svFZkCse1lOk21sdzupq2B1wAVzbvRkSe/hl5nQT6xyddjFsUaqep0tFUE5XJtYLBl2W
         AwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Z2QfP3nBSkXabdhdfaB6eqqdio2/U/RhPvB3lPD+Pao=;
        b=ww7MPlc8HgaZ3sj4yBigJmDDHwS7lRpwdtxfIlyAeFfg3PVn73qc2olwDG29DE+lMg
         jpIDqNO80Osjb66b6LN5dRkxzt/u8NytRzAiPZQDkLbSWs+N2r9HvF+NLC4uqNm0mfr5
         9zVk0vLSxlCwhSReMEVIQKMNx8EPhOqxkvciL6tfhRW3dix4bjd0kNWbqIZt2WuL28HY
         DjDqGDhIdd3pyBASgsts5gvo5Jrt+99Bqc5337GoITNcLc4Sdjw8nmnyxtRd1t3VqU5i
         /0jSksZLd0JcL9Zm3CxEt9hZHgw2fCSIpXJP/E+6lTugn6nPfDAPfwGl6K9pZq96ngUD
         9EAw==
X-Gm-Message-State: AOAM5310781uQb7Evghx3lzn0TIRWaQLzcYR6O82Bc/W4GHWWddJ7bNB
	4HinT2PVxBKBVhuOmKOlc7o=
X-Google-Smtp-Source: ABdhPJz5gsb9QP2Eu88op0SWGichMTrVkYvbSrxtwObXi7vV5qYjfvKgwGLugVvN4IWtrowVnT6x5g==
X-Received: by 2002:a05:651c:12c1:b0:249:7e8c:d5fc with SMTP id 1-20020a05651c12c100b002497e8cd5fcmr10668804lje.33.1650888173691;
        Mon, 25 Apr 2022 05:02:53 -0700 (PDT)
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>
Date: Mon, 25 Apr 2022 15:02:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 25.04.22 10:43, Juergen Gross wrote:


Hello Juergen


Thank you for the feedback.

> On 08.04.22 20:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-mmio
>> based virtio-disk backend (emualator) which is intended to run out of
>> Qemu and could be run in any domain.
>> Although the Virtio block device is quite different from traditional
>> Xen PV block device (vbd) from the toolstack's point of view:
>>   - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>     written to Xenstore are fetched by the frontend (the vdev is not
>>     passed to the frontend)
>
> I thought about the future support on x86.
>
> There we don't have a device tree (and I don't want to introduce it),
> so the only ways to specify the backend domain id would be to:
>
> - add some information to ACPI tables
> - use boot parameters
> - use Xenstore

I understand that, and agree


> Thinking further of hotplugging virtio devices, Xenstore seems to be the
> only real suitable alternative. Using virtio mechanisms doesn't seem
> appropriate, as such information should be retrieved in "platform
> specific" ways (see e.g. specifying an "endpoint" in the virtio IOMMU
> device [1], [2]). I think the Xenstore information for that purpose
> could be rather minimal and it should be device-type agnostic. Having
> just a directory with endpoints and associated backend domids would
> probably be enough (not needed in this series, of course).

Just to make it clear, we are speaking about the possible ways to 
communicate backend domid for another series [1], so about the x86's 
alternative of device-tree bindings "xen,dev-domid" [2].
I was thinking we could avoid using Xenstore at the guest side for that 
purpose, but I didn't think about hotplug...
I assume, all Xenstore bits wouldn't go the outside Xen grant 
DMA-mapping layer (grant-dma-ops.c)?


>
> This doesn't preclude the device tree variant you are using, as this
> would be required for dom0less systems anyway.

good


>
> OTOH I'd like you to modify the commit message to make it more clear
> that in future frontend data might be written to Xenstore in order to
> support other use cases.

ok, will do


>
>>   - the ring-ref/event-channel are not used for the backend<->frontend
>>     communication, the proposed IPC for Virtio is IOREQ/DM
>> it is still a "block device" and ought to be integrated in existing
>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>> logic to deal with Virtio devices as well.
>>
>> For the immediate purpose and an ability to extend that support for
>> other use-cases in future (Qemu, virtio-pci, etc) perform the following
>> actions:
>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>    that in the configuration
>> - Introduce new disk protocol field to libxl_device_disk struct
>>    (with LIBXL_DISK_PROTOCOL_XEN and LIBXL_DISK_PROTOCOL_VIRTIO_MMIO
>>    types) and reflect that in the configuration (new "protocol" option
>>    with "xen" protocol being default value)
>
> And with the hotplug option in mind I start to feel unueasy with naming
> the new Xenstore node "protocol", as the frontend disk nodes for "normal"
> disks already have a "protocol" entry specifying 64- or 32-bit protocol.


I noticed the "protocol" node at the frontend side for traditional Xen 
PV block device which handles yet another purpose, but I didn't think 
much about it
since the new "protocol" node in only for the backend's use. If we start 
thinking of frontend's Xenstore nodes, then yes, will clash...

>
>
> Maybe we should really name it "transport" instead?

... For me the "transport" name is associated with virtio transports: 
mmio, pci, ccw. But, I would be ok with that name. Another possible name 
could be "specification".


>
>
>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>    one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>
>> An example of domain configuration for Virtio disk:
>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
>> protocol=virtio-mmio']
>
> With Roger's feedback this would then be "transport=virtio", the "mmio"
> part should then be something like "adapter=mmio" (in contrast to
> "adapter=pci"), and "adapter" only needed in case of a device tree and
> PCI being available.

ok, will rename. Can we add "adapter" (or whenever the name would be) 
option later, when there is a real need? For now, I mean within the 
current series which adds only virtio-mmio bits on Arm, we can assume 
that "transport=virtio" implies using virtio-mmio.

BTW, if we named the main option "specification", the secondary option 
"transport" would good fit from my PoV.
For example:
disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
specification=virtio, transport=mmio']

But, I am perfectly fine with "transport/adapter".


>
>>
>> Nothing has changed for default Xen disk configuration.
>>
>> Please note, this patch is not enough for virtio-disk to work
>> on Xen (Arm), as for every Virtio device (including disk) we need
>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>> them to the backend, also update Guest device-tree. The subsequent
>> patch will add these missing bits. For the current patch,
>> the default "irq" and "base" are just written to the Xenstore.
>> This is not an ideal splitting, but this way we avoid breaking
>> the bisectability.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> I'm fine with the overall approach and couldn't spot any real issues
> in the code.


Thank you.


[1] 
https://lore.kernel.org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gmail.com/
[2] 
https://lore.kernel.org/xen-devel/1650646263-22047-5-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1649964960-24864-1-git-send-email-olekstysh@gmail.com/


>
>
>
> Juergen
>
> [1]: 
> https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-iommu.tex
> [2]: https://medium.com/@michael2012zhao_67085/virtio-iommu-789369049443

-- 
Regards,

Oleksandr Tyshchenko


