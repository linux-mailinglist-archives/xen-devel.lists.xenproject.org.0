Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C2539543
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 19:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339907.564825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5My-00083G-Vz; Tue, 31 May 2022 17:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339907.564825; Tue, 31 May 2022 17:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5My-00081T-Sm; Tue, 31 May 2022 17:09:24 +0000
Received: by outflank-mailman (input) for mailman id 339907;
 Tue, 31 May 2022 17:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KE28=WH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nw5Mx-00081N-Dn
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 17:09:23 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a59f916-e104-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 19:09:22 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id c19so22500664lfv.5
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 10:09:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a196d06000000b00477cab33759sm3072432lfc.256.2022.05.31.10.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 10:09:21 -0700 (PDT)
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
X-Inumbo-ID: 6a59f916-e104-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oXC+omMyhQE+yQOLbS6KJe5K78bZY03LjtAozxlOWS4=;
        b=TAyjZkyHiTXmbmHCSrE2qWJwfpy2mK18RqayHB9KPwF3D5Pg+bZ6eGYNeN34jbspjz
         XKAIAKaqLBFgTkjxxqEqqjzKoQ4toUSB64OhXxsfMMRXeKBxTuUTXvyIQGUiGfioo7kC
         oMkYvmT4C0UXva0czCxfN3JpmbeZVhWBsYi1qGOpj0WhxatmjVmbr0Qp0zNQmGicVbqD
         XOkcjG3W1KKt5f0akOma0UDAHja0EIq/KJOrVyQ2kluOg8ugvRzH57Wsp2EqTBQKNt5m
         4tqMtwtv+jysyfjiBaAa2EYLry0bXPvGexMdU0w2FewQWJm/hZYWq2QWm7FRLYNLGMi4
         npkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oXC+omMyhQE+yQOLbS6KJe5K78bZY03LjtAozxlOWS4=;
        b=KOoCajg+vB3ofPie6lungNNm3VDC4Prd30ebICI1FIDksJeYXRQY93FyFkbN5Fb35q
         PzmGQtilF5mD8EPUpxY7BxAjFKzhgsOBnEzbxVm6y5fyxe3GoIEJ5/2JA9qHsVBQaUN3
         L6BeW4luJXTuJ5BRFX3CM7Wkh6uUjZnR5B/u+3gjMxmKJQr8l7sblBOZdme8TWHcdunh
         iO9v3Dmc2LURoO41cfB5B4WZVuJg6om6Tathg9l0A9FxB1VB3JfKBLhB0McRZg3YuWN2
         a5C28TvSyJJEL23kNFq7kH7lPVoDNzNrSBmfAoYNl/wnuPKPuiy4OBGCSyp0V/Y4uXJp
         +ENg==
X-Gm-Message-State: AOAM533j4FkxSx4vdha5MqQRXhpnoF+adDs03ERut4cHD/MXX2iHGgm4
	bnl8wb9+FgwLijEDPln5Aqk=
X-Google-Smtp-Source: ABdhPJwx9hqwCt9lTBlhLuxF3159ZiuKQMGeaQRRGSerHfQCM1lHwBJOFfe0u0PJDGwPNceRQMYbag==
X-Received: by 2002:ac2:4f09:0:b0:478:6c80:64fc with SMTP id k9-20020ac24f09000000b004786c8064fcmr26696653lfr.34.1654016961692;
        Tue, 31 May 2022 10:09:21 -0700 (PDT)
Subject: Re: [PATCH V3 5/8] dt-bindings: Add xen,grant-dma IOMMU description
 for xen-grant DMA ops
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig
 <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
 <1653944417-17168-6-git-send-email-olekstysh@gmail.com>
 <15eef004-74c7-0eb5-3f87-86e164ef70ff@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f5aa3337-e1fc-752e-5337-120599ed508b@gmail.com>
Date: Tue, 31 May 2022 20:09:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <15eef004-74c7-0eb5-3f87-86e164ef70ff@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 31.05.22 14:52, Krzysztof Kozlowski wrote:

Hello Krzysztof

> On 30/05/2022 23:00, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Thank you for your patch. There is something to discuss/improve.
>
>> diff --git a/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
>> new file mode 100644
>> index 00000000..ab5765c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iommu/xen,grant-dma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xen specific IOMMU for virtualized devices (e.g. virtio)
>> +
>> +maintainers:
>> +  - Stefano Stabellini <sstabellini@kernel.org>
>> +
>> +description:
>> +  The reference to Xen specific IOMMU node using "iommus" property indicates
>> +  that Xen grant mappings need to be enabled for the device, and it specifies
>> +  the ID of the domain where the corresponding backend resides.
>> +  The binding is required to restrict memory access using Xen grant mappings.
>> +
>> +properties:
>> +  compatible:
>> +    const: xen,grant-dma
>> +
>> +  '#iommu-cells':
>> +    const: 1
>> +    description:
>> +      Xen specific IOMMU is multiple-master IOMMU device.
>> +      The single cell describes the domid (domain ID) of the domain where
>> +      the backend is running.
>> +
>> +required:
>> +  - compatible
>> +  - "#iommu-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    xen_iommu {
> No underscores in node names, generic node names, so this looks like
> "iommu".


ok, will change


>
>> +        compatible = "xen,grant-dma";
>> +        #iommu-cells = <1>;
>> +    };
>> +
>> +    virtio@3000 {
>> +        compatible = "virtio,mmio";
>> +        reg = <0x3000 0x100>;
>> +        interrupts = <41>;
>> +
>> +        /* The backend is located in Xen domain with ID 1 */
>> +        iommus = <&xen_iommu 1>;
> There is no need usually to give consumer examples in provider binding.
> If there is nothing specific here (looks exactly like every IOMMU
> consumer in Linux kernel), drop the consumer.


I got it.  There is nothing specific from the device tree's perspective, 
I was thinking to draw attention to the IOMMU specifier (in our case, 
the master device's ID == backend's domain ID). But  '#iommu-cells' 
description above already clarifies that. Will drop.


>
>> +    };
>
> Best regards,
> Krzysztof

-- 
Regards,

Oleksandr Tyshchenko


