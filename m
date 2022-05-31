Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E088D539020
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 13:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339554.564426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw0SK-0005Iu-N7; Tue, 31 May 2022 11:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339554.564426; Tue, 31 May 2022 11:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw0SK-0005H8-JM; Tue, 31 May 2022 11:54:36 +0000
Received: by outflank-mailman (input) for mailman id 339554;
 Tue, 31 May 2022 11:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lzr1=WH=linaro.org=krzysztof.kozlowski@srs-se1.protection.inumbo.net>)
 id 1nw0Q8-0005Dc-3T
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 11:52:20 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e60e39b-e0d8-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 13:52:17 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id h11so17136787eda.8
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 04:52:17 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c13-20020a50d64d000000b0042617ba63cfsm8278497edj.89.2022.05.31.04.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 04:52:16 -0700 (PDT)
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
X-Inumbo-ID: 1e60e39b-e0d8-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pgwp2VdYx+Vpnhun4TNi+eC2topHBL0Uwk1ptGJfZcE=;
        b=iS5jhowOcF/lfXAMYJ1n2lLpF7hUtwsQikH8pir763iCnTkaHoMbpuD2JWonqpofGu
         qjyArBVFBAgZQ9fQpr/S/sNnTQgp1XR5p/rqsj3MhdJ+R24/EaY9Jbv7/STxX0BhfOae
         vvpJfMMcFbUtqlhICqYrW8DyeWTZfTB31dRM0WNqVaDsLbFsSSYIr3kJMkl8EIu8eyG0
         IjQQuD7laFKec1PktUnxtrsiM3a+rYcN+wihWCwjJw7hyQww5pG4m0uXI4PcjIotDFcu
         f+NP9XC8R9LGUd3NPhygDtKFvwynWln1GjMt/3m1CHmsTLxPB1Nv/M1Gb8i3wsWht7ok
         zmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pgwp2VdYx+Vpnhun4TNi+eC2topHBL0Uwk1ptGJfZcE=;
        b=HwLHP02j2myKoykIPklrw5GeDhNdes6kHrUqMGGTnhD1w69Fv9Hi/tj0JEoQbiBQMq
         pFBNPpZgbRwgb0XA/ywyr5QawY4ue27J1gqBooeQT/3KsIJabF7cDHR84bAJsaodw+D2
         Cf6u/qM4nQjMIhCYGZEXYCh00k/aeC5bsyDot41OgQgO0Oi8y8YJfiYS+BseE7new3yr
         7S3fC06rtjHSdCUPK5igLohYCF+bkAhSxD09uLAa8YfMG7ncv4G+PSI2KonLQV6RAmP1
         se0H6tk2xFkWjPf1aFst0FtUVwtaeLuc1OPJZRK/D2BNz2acGXe3usVrgYY7rka4UnvD
         F9Kw==
X-Gm-Message-State: AOAM531BmPQkLBLqjZdWG5KFDaXQ5USvFg6ry5kkvnlA5edrpfKpw/A3
	WiAjpQ0+91xva2co9MEelbURbA==
X-Google-Smtp-Source: ABdhPJzLoz1xLJgBhIhIcXu/CVKt7lUZqurHOJkAtVo1mU8l+2AAQXVVLJ65/yyrjl+Cx6OqWRo0rg==
X-Received: by 2002:aa7:c852:0:b0:42d:70d8:2864 with SMTP id g18-20020aa7c852000000b0042d70d82864mr19815609edt.379.1653997936660;
        Tue, 31 May 2022 04:52:16 -0700 (PDT)
Message-ID: <15eef004-74c7-0eb5-3f87-86e164ef70ff@linaro.org>
Date: Tue, 31 May 2022 13:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V3 5/8] dt-bindings: Add xen,grant-dma IOMMU description
 for xen-grant DMA ops
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1653944417-17168-6-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2022 23:00, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> new file mode 100644
> index 00000000..ab5765c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/xen,grant-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific IOMMU for virtualized devices (e.g. virtio)
> +
> +maintainers:
> +  - Stefano Stabellini <sstabellini@kernel.org>
> +
> +description:
> +  The reference to Xen specific IOMMU node using "iommus" property indicates
> +  that Xen grant mappings need to be enabled for the device, and it specifies
> +  the ID of the domain where the corresponding backend resides.
> +  The binding is required to restrict memory access using Xen grant mappings.
> +
> +properties:
> +  compatible:
> +    const: xen,grant-dma
> +
> +  '#iommu-cells':
> +    const: 1
> +    description:
> +      Xen specific IOMMU is multiple-master IOMMU device.
> +      The single cell describes the domid (domain ID) of the domain where
> +      the backend is running.
> +
> +required:
> +  - compatible
> +  - "#iommu-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    xen_iommu {

No underscores in node names, generic node names, so this looks like
"iommu".

> +        compatible = "xen,grant-dma";
> +        #iommu-cells = <1>;
> +    };
> +
> +    virtio@3000 {
> +        compatible = "virtio,mmio";
> +        reg = <0x3000 0x100>;
> +        interrupts = <41>;
> +
> +        /* The backend is located in Xen domain with ID 1 */
> +        iommus = <&xen_iommu 1>;

There is no need usually to give consumer examples in provider binding.
If there is nothing specific here (looks exactly like every IOMMU
consumer in Linux kernel), drop the consumer.

> +    };


Best regards,
Krzysztof

