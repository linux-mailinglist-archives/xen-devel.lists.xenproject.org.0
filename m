Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4272F42AD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 04:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66281.117658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzXHF-000520-OD; Wed, 13 Jan 2021 03:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66281.117658; Wed, 13 Jan 2021 03:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzXHF-00051b-Ka; Wed, 13 Jan 2021 03:56:57 +0000
Received: by outflank-mailman (input) for mailman id 66281;
 Wed, 13 Jan 2021 03:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIdB=GQ=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1kzXHD-00051U-On
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 03:56:55 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2682ede-5c08-4cdc-9cf6-57b4015e4b7d;
 Wed, 13 Jan 2021 03:56:54 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id x126so410703pfc.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 19:56:54 -0800 (PST)
Received: from [10.230.29.29] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b4sm605572pju.33.2021.01.12.19.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 19:56:52 -0800 (PST)
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
X-Inumbo-ID: f2682ede-5c08-4cdc-9cf6-57b4015e4b7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tVybN2uO9LxG9ltd3tCKTHJYv7lU36O5UathtbI9Q9Q=;
        b=jLig4OWz6r5npRBnWnkYmtzqG5FaXvnjSp/GwVihv4kwV2tapBGwAF3xjarDP4svmh
         mmN3Em4/UnH964tt6spkMXBvTXAa1Xjxi6HY2VwIUlElZ/L/49drfsdWJz7rkYT/pJvu
         yntpxB6D25C4BgTjLzt3HccAWYqhBQRzY5xmbmcHg9uBakUAJ4cTw8WcABTwfYSf2utS
         bVK9ADZgPBqt1M4K8HOhkKFeNAlDtYVBHRWT6ioSEXPxxCLeolZujd32j7r9fme4RUHN
         48XR8U765COw3RQNjeJq5sRrwMZ2sbfbQ/6nLd1YYq7tC2A1pN/yQ3g/lIYtxVpVamT0
         EzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tVybN2uO9LxG9ltd3tCKTHJYv7lU36O5UathtbI9Q9Q=;
        b=GYYx1RggFi4m4Ug+pempR4aOVYliaGPgkvlmyuhtlU2W6fWpLDAyf17I1v0RpRjp/+
         CaQGNFjN4fHS+FtmncfoPNjnqKyI1DzsRU0agzAt/lp23Xw3TmQm3fiWgrM1z+DcyhNT
         nwzb/6uPArXeswiQ+zM+C9y8A6CNZneJdHxiGzAVMFlFr2IMvz3F9uXnORoP847f9fw1
         fKegzqaDfbFVNO6bg9oufv7yasXgsMPzp6Tbo1zO/uLAxRQZS566yfrsDH/3Ug4OAbUd
         6TEUGKWQLORaDIifVBcAYARB6EmkOXo6LPM2c31DEUCDYgyORhMF9bq0prL1UW2TzVjt
         gUHw==
X-Gm-Message-State: AOAM530rgusw1m1WTqEPBXX4OWIS6+z/FZlybgWiJTSpUTp9oVh4JsH3
	10gzDisOKdT8a1FMjJgbtng=
X-Google-Smtp-Source: ABdhPJyNiwxgLNGhX03OzTQQ31jD0Jl7mxbRLHzGfQFw82uojIWRVt9otXa8r8jCLr9MzK1TtdQTHQ==
X-Received: by 2002:a62:65c1:0:b029:1aa:ba52:fdfd with SMTP id z184-20020a6265c10000b02901aaba52fdfdmr143707pfb.7.1610510213683;
        Tue, 12 Jan 2021 19:56:53 -0800 (PST)
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Tomasz Figa <tfiga@chromium.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com,
 xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
 bauerman@linux.ibm.com, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
 <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
 <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
Date: Tue, 12 Jan 2021 19:56:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/12/2021 6:29 PM, Tomasz Figa wrote:
> Hi Florian,
> 
> On Wed, Jan 13, 2021 at 3:01 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 1/11/21 11:48 PM, Claire Chang wrote:
>>> On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>
>>>> On 1/7/21 9:42 AM, Claire Chang wrote:
>>>>
>>>>>> Can you explain how ATF gets involved and to what extent it does help,
>>>>>> besides enforcing a secure region from the ARM CPU's perpsective? Does
>>>>>> the PCIe root complex not have an IOMMU but can somehow be denied access
>>>>>> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
>>>>>> still some sort of basic protection that the HW enforces, right?
>>>>>
>>>>> We need the ATF support for memory MPU (memory protection unit).
>>>>> Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
>>>>> region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
>>>>> that specific regions.
>>>>
>>>> OK so you do have a protection unit of some sort to enforce which region
>>>> in DRAM the PCIE bridge is allowed to access, that makes sense,
>>>> otherwise the restricted DMA region would only be a hint but nothing you
>>>> can really enforce. This is almost entirely analogous to our systems then.
>>>
>>> Here is the example of setting the MPU:
>>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>>>
>>>>
>>>> There may be some value in standardizing on an ARM SMCCC call then since
>>>> you already support two different SoC vendors.
>>>>
>>>>>
>>>>>>
>>>>>> On Broadcom STB SoCs we have had something similar for a while however
>>>>>> and while we don't have an IOMMU for the PCIe bridge, we do have a a
>>>>>> basic protection mechanism whereby we can configure a region in DRAM to
>>>>>> be PCIe read/write and CPU read/write which then gets used as the PCIe
>>>>>> inbound region for the PCIe EP. By default the PCIe bridge is not
>>>>>> allowed access to DRAM so we must call into a security agent to allow
>>>>>> the PCIe bridge to access the designated DRAM region.
>>>>>>
>>>>>> We have done this using a private CMA area region assigned via Device
>>>>>> Tree, assigned with a and requiring the PCIe EP driver to use
>>>>>> dma_alloc_from_contiguous() in order to allocate from this device
>>>>>> private CMA area. The only drawback with that approach is that it
>>>>>> requires knowing how much memory you need up front for buffers and DMA
>>>>>> descriptors that the PCIe EP will need to process. The problem is that
>>>>>> it requires driver modifications and that does not scale over the number
>>>>>> of PCIe EP drivers, some we absolutely do not control, but there is no
>>>>>> need to bounce buffer. Your approach scales better across PCIe EP
>>>>>> drivers however it does require bounce buffering which could be a
>>>>>> performance hit.
>>>>>
>>>>> Only the streaming DMA (map/unmap) needs bounce buffering.
>>>>
>>>> True, and typically only on transmit since you don't really control
>>>> where the sk_buff are allocated from, right? On RX since you need to
>>>> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
>>>> them from a pool that already falls within the restricted DMA region, right?
>>>>
>>>
>>> Right, but applying bounce buffering to RX will make it more secure.
>>> The device won't be able to modify the content after unmap. Just like what
>>> iommu_unmap does.
>>
>> Sure, however the goals of using bounce buffering equally applies to RX
>> and TX in that this is the only layer sitting between a stack (block,
>> networking, USB, etc.) and the underlying device driver that scales well
>> in order to massage a dma_addr_t to be within a particular physical range.
>>
>> There is however room for improvement if the drivers are willing to
>> change their buffer allocation strategy. When you receive Wi-Fi frames
>> you need to allocate buffers for the Wi-Fi device to DMA into, and that
>> happens ahead of the DMA transfers by the Wi-Fi device. At buffer
>> allocation time you could very well allocate these frames from the
>> restricted DMA region without having to bounce buffer them since the
>> host CPU is in control over where and when to DMA into.
>>
> 
> That is, however, still a trade-off between saving that one copy and
> protection from the DMA tampering with the packet contents when the
> kernel is reading them. Notice how the copy effectively makes a
> snapshot of the contents, guaranteeing that the kernel has a
> consistent view of the packet, which is not true if the DMA could
> modify the buffer contents in the middle of CPU accesses.

I would say that the window just became so much narrower for the PCIe
end-point to overwrite contents with the copy because it would have to
happen within the dma_unmap_{page,single} time and before the copy is
finished to the bounce buffer.
-- 
Florian

