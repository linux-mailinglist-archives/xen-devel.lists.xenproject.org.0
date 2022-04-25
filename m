Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCA50E0F0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312896.530314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyJe-00049b-W0; Mon, 25 Apr 2022 12:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312896.530314; Mon, 25 Apr 2022 12:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyJe-00047W-S5; Mon, 25 Apr 2022 12:59:46 +0000
Received: by outflank-mailman (input) for mailman id 312896;
 Mon, 25 Apr 2022 12:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uj5J=VD=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1niyJd-0003Kc-Dy
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:59:45 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 941410cf-c497-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:59:44 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id p10so26017365lfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 05:59:44 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a2e6808000000b0024f0d945657sm569596lja.106.2022.04.25.05.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:59:43 -0700 (PDT)
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
X-Inumbo-ID: 941410cf-c497-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PV1OyG4ThNPMavMonLhk2qdWsUplxU+qfgH+2AePe5c=;
        b=TkZxbLKU87tgO+0xSrzRZL2k/XlviaFVl3KCmRBVQkmOYy9qo3CpJbFP9q7Pejza4L
         6KCzey0npciJq5pn05OZwKbhRBriyAy8PbZdZwwWl32ciN75jF+U6i/lJRrmKT0yFQty
         Z2pS6P1wRGU13Nv0e2yILEt+grspI4qJnvRFksW/orUaC82T78Tx+sztPXi6orJANM3Z
         6i37VzEF1Ep3w55YKaDNBm10p4Sj/ZgbffvzA/gxYd+KD8h0mry5frzfXfoWvqbLloB5
         J1Yaz4xZVG6q9Cz+xVcXYUkyUl2EFbMRYanks261PXlUMtVEh7gtF6NQkPsa4kpACvBe
         dnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PV1OyG4ThNPMavMonLhk2qdWsUplxU+qfgH+2AePe5c=;
        b=2I/kFLZicZzj1UyM0NY/RLgahqh6CtMxDtnp0GOglWTMVrWXiu5wVVxNyVzSHn/c1L
         p0RTL9REpzzE3T6kc4RPGXVLpc2mPSi+VSh5DLuJS5tIM3wVfVpuiokUW+FZoFvaHC5X
         nBrWtW10j9GabxwYucbNjK9Mz8EBiunWbNpFtUzyfvDHNO1ZaBO3roWuZmnpOOdImxY1
         E7j70MyhqCyIJ8n0Xe0E+Vqn+9JUD5c+0LqzfKKLDWVwTykqQllXcBpE91a+aPawo2/u
         E+Y6lUOVjcu/Ha/0FGgRKvLJfN/QTiY+vctL6WE4N2uOFin3DWM70kob0RTxDXeb4A96
         hCCg==
X-Gm-Message-State: AOAM5314gLXQQHurd/AFwZPFMKe8okbHGoC3tCwKH8PACi772f4df9j/
	t6NJzQnXUNi9GjWFn9bA3/g=
X-Google-Smtp-Source: ABdhPJzjR3+jsmAK9OKPkHlmSQpFqNKjXYek6QlWZhfRj0f7Vd5I9TKBY7ScsH0l+dU+xMiZJXyMLg==
X-Received: by 2002:a05:6512:3f86:b0:44a:f5bf:ec9a with SMTP id x6-20020a0565123f8600b0044af5bfec9amr13044251lfa.490.1650891583963;
        Mon, 25 Apr 2022 05:59:43 -0700 (PDT)
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
 <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>
 <e657458d-d33e-a340-d9fe-152ec97eefec@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6dcea33d-0beb-d408-ed89-e1989bfa14e8@gmail.com>
Date: Mon, 25 Apr 2022 15:59:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e657458d-d33e-a340-d9fe-152ec97eefec@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 25.04.22 15:09, Juergen Gross wrote:

Hello Juergen

> On 25.04.22 14:02, Oleksandr wrote:
>>
>> On 25.04.22 10:43, Juergen Gross wrote:
>>
>>
>> Hello Juergen
>>
>>
>> Thank you for the feedback.
>>
>>> On 08.04.22 20:21, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch adds basic support for configuring and assisting 
>>>> virtio-mmio
>>>> based virtio-disk backend (emualator) which is intended to run out of
>>>> Qemu and could be run in any domain.
>>>> Although the Virtio block device is quite different from traditional
>>>> Xen PV block device (vbd) from the toolstack's point of view:
>>>>   - as the frontend is virtio-blk which is not a Xenbus driver, 
>>>> nothing
>>>>     written to Xenstore are fetched by the frontend (the vdev is not
>>>>     passed to the frontend)
>>>
>>> I thought about the future support on x86.
>>>
>>> There we don't have a device tree (and I don't want to introduce it),
>>> so the only ways to specify the backend domain id would be to:
>>>
>>> - add some information to ACPI tables
>>> - use boot parameters
>>> - use Xenstore
>>
>> I understand that, and agree
>>
>>
>>> Thinking further of hotplugging virtio devices, Xenstore seems to be 
>>> the
>>> only real suitable alternative. Using virtio mechanisms doesn't seem
>>> appropriate, as such information should be retrieved in "platform
>>> specific" ways (see e.g. specifying an "endpoint" in the virtio IOMMU
>>> device [1], [2]). I think the Xenstore information for that purpose
>>> could be rather minimal and it should be device-type agnostic. Having
>>> just a directory with endpoints and associated backend domids would
>>> probably be enough (not needed in this series, of course).
>>
>> Just to make it clear, we are speaking about the possible ways to 
>> communicate backend domid for another series [1], so about the x86's 
>> alternative of device-tree bindings "xen,dev-domid" [2].
>> I was thinking we could avoid using Xenstore at the guest side for 
>> that purpose, but I didn't think about hotplug...
>> I assume, all Xenstore bits wouldn't go the outside Xen grant 
>> DMA-mapping layer (grant-dma-ops.c)?
>
> I think it would be another driver under drivers/xen/ without the need to
> touch any other frontend related file or Xen-related architecture 
> specific
> code.


ok


>
>
>>> And with the hotplug option in mind I start to feel unueasy with naming
>>> the new Xenstore node "protocol", as the frontend disk nodes for 
>>> "normal"
>>> disks already have a "protocol" entry specifying 64- or 32-bit 
>>> protocol.
>>
>>
>> I noticed the "protocol" node at the frontend side for traditional 
>> Xen PV block device which handles yet another purpose, but I didn't 
>> think much about it
>> since the new "protocol" node in only for the backend's use. If we 
>> start thinking of frontend's Xenstore nodes, then yes, will clash...
>>
>>>
>>>
>>> Maybe we should really name it "transport" instead?
>>
>> ... For me the "transport" name is associated with virtio transports: 
>> mmio, pci, ccw. But, I would be ok with that name. Another possible 
>> name could be "specification".
>
> Yeah, looking at the virtio spec this makes sense.
>
> So I would be fine with "specification".


ok, thank you for the confirmation.


>
>>>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>>>    one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>>>
>>>> An example of domain configuration for Virtio disk:
>>>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
>>>> protocol=virtio-mmio']
>>>
>>> With Roger's feedback this would then be "transport=virtio", the "mmio"
>>> part should then be something like "adapter=mmio" (in contrast to
>>> "adapter=pci"), and "adapter" only needed in case of a device tree and
>>> PCI being available.
>>
>> ok, will rename. Can we add "adapter" (or whenever the name would be) 
>> option later, when there is a real need? For now, I mean within the 
>> current series which adds only virtio-mmio bits on Arm, we can assume 
>> that "transport=virtio" implies using virtio-mmio.
>
> Yes, we should add it only when needed.


ok, good


>
>>
>> BTW, if we named the main option "specification", the secondary 
>> option "transport" would good fit from my PoV.
>> For example:
>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
>> specification=virtio, transport=mmio']
>
> Fine with me.


perfect


>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


