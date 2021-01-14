Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C62F69F9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 19:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67492.120518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07jt-00030B-F0; Thu, 14 Jan 2021 18:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67492.120518; Thu, 14 Jan 2021 18:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07jt-0002zm-B9; Thu, 14 Jan 2021 18:52:57 +0000
Received: by outflank-mailman (input) for mailman id 67492;
 Thu, 14 Jan 2021 18:52:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP1a=GR=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1l07jr-0002zh-H9
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 18:52:55 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d77b1d6a-bd53-4046-b6e8-4ea7aba3839f;
 Thu, 14 Jan 2021 18:52:54 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id c13so3870392pfi.12
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 10:52:54 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id r11sm43351596pjj.2.2021.01.14.10.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:52:52 -0800 (PST)
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
X-Inumbo-ID: d77b1d6a-bd53-4046-b6e8-4ea7aba3839f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tF8uyKERWCoMyAnlRKqJDO1qWaCVQS8YdldPCqsx9S0=;
        b=sJaFTBZ37WgPKnSYnIC9X0ttgJ4KnYrNxbfK23tXhe3FVi2plUEkuCgczIjgNj1soe
         zOgfMT0+s/KHUkB+I8lHtDfOggJsnE+TBYwLFhae8QCqBUKHfhXAvx6taH8R3eQrNryU
         hCeov6owT+z0GIUsPKd2AQykVhGzkhAt7EfpX9InyZPXfN8HL1URiEfPWV3Vk08PnIMr
         vJ89xFZQq+npyP4fyXbsm4M9Q0OfURLHAXeBS6jYm9atoBh443ZHdzRCKQ+Wysf+i4ZI
         zfPeZwqnzRaeFDAUlmAIk8KrE5opaScYFnCLgvucoARS2zz9WsfsCWydTb7yNvShWYlM
         LIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tF8uyKERWCoMyAnlRKqJDO1qWaCVQS8YdldPCqsx9S0=;
        b=RBtwYRutkEOlBl6kvmytGf9wQpgyt0fgGYLBBL/Fs2lXIF72/iGKEZ5lgXJNUjkgtW
         33jukQXexPUy+xOZIz6enAghB43e9db4IHlRDAL/+jW6gx6ya/fpRv/OQt/V0QYskFiA
         QnlZBagPS16w9kt1TfpKK1kDW2UVlc/V7WONObgHj61Oxf0oYwxAK4mZH/i9DI9HAm/7
         h53ZaRoUasJvzV95Rsz3X/L1HojUDl7RNHwuPKLkMJ0tKdZDttxDD5rhSoBqzN5uBnG0
         ALx7fE4D+beHwpQ87DgvTt8ZB5meeBkWOYvVr0GuX7oHCXpqqSDf6TJY3ZXkDJ46a6Hf
         3igQ==
X-Gm-Message-State: AOAM530IeQFv4apPvgMnLZIcZnsJLhQ0+p5/p4cVkKX9ZIMxAgu5ygEO
	jkUpHhat8cetCCobBboiCbY=
X-Google-Smtp-Source: ABdhPJyPo9ML0x66bHS+KgpIhpg94ojy5fT6fH9mQxG7FMKBoEYl0Sy3IFq3hGAQTn1h+1yxXOP42w==
X-Received: by 2002:aa7:81d6:0:b029:19e:2987:7465 with SMTP id c22-20020aa781d60000b029019e29877465mr8761737pfn.29.1610650373721;
        Thu, 14 Jan 2021 10:52:53 -0800 (PST)
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, joro@8bytes.org, will@kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com,
 xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
 bauerman@linux.ibm.com, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, rafael.j.wysocki@intel.com,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org,
 dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Tomasz Figa <tfiga@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-7-tientzu@chromium.org>
 <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
 <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <5f276678-3ab2-ddc8-640c-6dbbe173463c@gmail.com>
Date: Thu, 14 Jan 2021 10:52:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/14/21 1:08 AM, Claire Chang wrote:
> On Wed, Jan 13, 2021 at 7:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 1/5/21 7:41 PM, Claire Chang wrote:
>>> If a device is not behind an IOMMU, we look up the device node and set
>>> up the restricted DMA when the restricted-dma-pool is presented.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> ---
>>
>> [snip]
>>
>>> +int of_dma_set_restricted_buffer(struct device *dev)
>>> +{
>>> +     struct device_node *node;
>>> +     int count, i;
>>> +
>>> +     if (!dev->of_node)
>>> +             return 0;
>>> +
>>> +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
>>> +                                             sizeof(phandle));
>>
>> You could have an early check for count < 0, along with an error
>> message, if that is deemed useful.
>>
>>> +     for (i = 0; i < count; i++) {
>>> +             node = of_parse_phandle(dev->of_node, "memory-region", i);
>>> +             if (of_device_is_compatible(node, "restricted-dma-pool"))
>>
>> And you may want to add here an of_device_is_available(node). A platform
>> that provides the Device Tree firmware and try to support multiple
>> different SoCs may try to determine if an IOMMU is present, and if it
>> is, it could be marking the restriced-dma-pool region with a 'status =
>> "disabled"' property, or any variant of that scheme.
> 
> This function is called only when there is no IOMMU present (check in
> drivers/of/device.c). I can still add of_device_is_available(node)
> here if you think it's helpful.

I believe it is, since boot loader can have a shared Device Tree blob
skeleton and do various adaptations based on the chip (that's what we
do) and adding a status property is much simpler than insertion new
nodes are run time.

> 
>>
>>> +                     return of_reserved_mem_device_init_by_idx(
>>> +                             dev, dev->of_node, i);
>>
>> This does not seem to be supporting more than one memory region, did not
>> you want something like instead:
>>
>>                 ret = of_reserved_mem_device_init_by_idx(...);
>>                 if (ret)
>>                         return ret;
>>
> 
> Yes. This implement only supports one restriced-dma-pool memory region
> with the assumption that there is only one memory region with the
> compatible string, restricted-dma-pool, in the dts. IIUC, it's similar
> to shared-dma-pool.

Then if here is such a known limitation it should be both documented and
enforced here, you shouldn ot be iterating over all of the phandles that
you find, stop at the first one and issue a warning if count > 1?
-- 
Florian

