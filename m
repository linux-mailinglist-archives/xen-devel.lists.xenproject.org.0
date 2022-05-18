Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8D52C7EA
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 01:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332524.556220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrTPA-0004ms-RK; Wed, 18 May 2022 23:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332524.556220; Wed, 18 May 2022 23:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrTPA-0004k5-OI; Wed, 18 May 2022 23:48:36 +0000
Received: by outflank-mailman (input) for mailman id 332524;
 Wed, 18 May 2022 23:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/mK=V2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nrTP8-0004jz-Pf
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 23:48:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06fa85a7-d705-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 01:48:33 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id f4so6210862lfu.12
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 16:48:33 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 q7-20020ac25107000000b0047255d211e3sm83430lfb.274.2022.05.18.16.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 16:48:32 -0700 (PDT)
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
X-Inumbo-ID: 06fa85a7-d705-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1UX9tyiY5Mk4r18rRaJBtwzhf1ZkmkQKY6AoHo3gkeU=;
        b=EOyUOmigcDiFSJvJvzr7SPnBBZOwM/2TtEwTD7jMMFA5XBQ/9fKlvqJpOV7W2t8GbK
         B8/80L59bPmxdfqwuyULyEbfFosEabN28Arqc/CGnHTIyHRWiujQceUHclJvVfjgVYQE
         lokfslEw8Tlser1eUC0JYMR5PPVVJ66H2uLntTHLTSKGDfRzDozIrZEVxY0wHtbsuiSL
         w835ogeyqZnJtEHC22eLFPj298OPdDLzS0I2dBzRyEHdWjzjYo5AQPhBrPsryyU3qyDc
         FgR/E/y5U41uYg8J4mT74V4NTW17TC7cHmZbDghtyW0LTdgdlc5AuS0pbYMOpYZikfZO
         Yo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1UX9tyiY5Mk4r18rRaJBtwzhf1ZkmkQKY6AoHo3gkeU=;
        b=ankB1i9FJipM1vx1MBdjEZL9DoZGJdg6kGC3Iw5NL3qgw2QAYZDfoFZxfvdDqZiM10
         9qhC7boGDa8S6XX7P93UR8EFS4ONDJmwoUNQ4qdhw3UN/M8QJ+Cl4YnQ1oy/qYdWd0Qv
         fuPRs6T16vOGyD2nOG1ebiO0pT6Oztm4nk1s0kMKsgE1ihunqOR/ZeTAJzVroEFmI0rd
         lMASzjTe5rT0WZgiS9ll5gx3VD3dhU5Qa48+nVdYy+axqgVkhcOZG1PIDUgMHBCNDn2F
         WjB4pBZf/QcqPrxqY/2jSctuOKwnuEAcO19Jcu1zX3t7Kp1SRmswu8b+3XCQmT732o5V
         9DUg==
X-Gm-Message-State: AOAM532KiGNZx3PrV+mZIO3A+FAaeH800Pa266hygREdNRkls6SxShYX
	R1F0vpnH/KSZuifCnGNXAl0=
X-Google-Smtp-Source: ABdhPJzSuJPZWc7BEOcp2vhD63R+kj8rGQqC2ji1faQfxLn5GP6aKbG88ceT3bgy+m/z5SjBgVVpFA==
X-Received: by 2002:a05:6512:169a:b0:44a:fea7:50a5 with SMTP id bu26-20020a056512169a00b0044afea750a5mr1314227lfb.498.1652917712865;
        Wed, 18 May 2022 16:48:32 -0700 (PDT)
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
To: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig
 <hch@infradead.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
 <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
 <20220518185904.GA3685644-robh@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <40758f3b-cab3-2096-1711-18837bc2f73b@gmail.com>
Date: Thu, 19 May 2022 02:48:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220518185904.GA3685644-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.05.22 21:59, Rob Herring wrote:

Hello Rob, Arnd

> On Wed, May 18, 2022 at 03:32:27PM +0100, Arnd Bergmann wrote:
>> On Sat, May 7, 2022 at 7:19 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>> diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
>>> index 10c22b5..29a0932 100644
>>> --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
>>> +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
>>> @@ -13,6 +13,9 @@ description:
>>>     See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
>>>     more details.
>>>
>>> +allOf:
>>> +  - $ref: /schemas/arm/xen,dev-domid.yaml#
>>> +
>>>   properties:
>>>     compatible:
>>>       const: virtio,mmio
>>> @@ -33,6 +36,10 @@ properties:
>>>       description: Required for devices making accesses thru an IOMMU.
>>>       maxItems: 1
>>>
>>> +  xen,dev-domid:
>>> +    description: Required when Xen grant mappings need to be enabled for device.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>> Sorry for joining the discussion late. Have you considered using the
>> generic iommu
>> binding here instead of a custom property? This would mean having a device
>> node for the grant-table mechanism that can be referred to using the 'iommus'
>> phandle property, with the domid as an additional argument.
>>
>> It does not quite fit the model that Linux currently uses for iommus,
>> as that has an allocator for dma_addr_t space, but it would think it's
>> conceptually close enough that it makes sense for the binding.
> Something common is almost always better.

agree


>
> That may also have the issue that fw_devlink will make the 'iommu'
> driver a dependency to probe.

Looks like I ran into it while experimenting. I generated the following 
nodes in guest DT using Xen toolstack:

[snip]

         xen_dummy_iommu {
                 compatible = "xen,dummy-iommu";
                 #iommu-cells = <0x01>;
                 phandle = <0xfde9>;
         };
         virtio@2000000 {
                 compatible = "virtio,mmio";
                 reg = <0x00 0x2000000 0x00 0x200>;
                 interrupts = <0x00 0x01 0xf01>;
                 interrupt-parent = <0xfde8>;
                 dma-coherent;
                 iommus = <0xfde9 0x01>;
         };

[snip]


And got:

virtio-mmio 2000000.virtio: deferred probe timeout, ignoring dependency


>
> Rob

-- 
Regards,

Oleksandr Tyshchenko


