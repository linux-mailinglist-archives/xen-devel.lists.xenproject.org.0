Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7C50CB49
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 16:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311654.528916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niGtc-00070Y-DU; Sat, 23 Apr 2022 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311654.528916; Sat, 23 Apr 2022 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niGtc-0006yK-A8; Sat, 23 Apr 2022 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 311654;
 Sat, 23 Apr 2022 14:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJIN=VB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1niGtb-0006xy-8P
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 14:37:59 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f827e9a6-c312-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 16:37:58 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id y32so18971325lfa.6
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 07:37:58 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a196f0b000000b00471c56b7a3dsm641075lfc.74.2022.04.23.07.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 07:37:57 -0700 (PDT)
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
X-Inumbo-ID: f827e9a6-c312-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9Q3pZjqL2YRbxMi3ZEZPC+BgttCsWqeK314Feyp4SQ4=;
        b=O6lRTdmyP9SYSA3U8hfLl6p8PcytluSsbHwEFXxwQ+ubIxxSVZKbp9ABI4a104ybmE
         4B0KpBf9zDgnV1i4oYkJNepeB9/rfyra7k5PI9DZqHke1VwN6482HV8XrLngsjtfpsFr
         6bM8w36eLRa4VwfIxnHVhQfOZg/AaPvpoW8tB1wDHi0T7pELIli9N4UTO8TGcKuvFaKm
         eOZaalv2Z8+00j28i8eI7dMT0V4YIeOFmc8x7xswIRAT1Q9HRGUBVnLTfkM6C5KtYtu2
         I9VW/XbIJHjaJqcC0s3p2b54l8r+mGP1Bv8UyPsSSwS8lK/HSTCCWDhUQlDqrMwBzC0h
         BFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9Q3pZjqL2YRbxMi3ZEZPC+BgttCsWqeK314Feyp4SQ4=;
        b=BV5YHpq9TpzgMgYvklOwlqJyhoBfpzV89lzM+SCzaLlHSOOFaJ3HSMSV2osMXl+gAG
         svYvsjUScQjFKWb3PYuxT+mwJisgKOTnWh1m9Lz1zlTPC4aIpmY47hlNed63wGA8R5F7
         9Nr2fkiUFtadj6u67c6Sr1mw+6m/P09mDkKGEj8A8Bsf3ueW1czLlGy+rlWKbBpCIV36
         T71G4evZOqFekquL7RBhRFhJwjneWkUK5v3njnkO8Ideak2NykWL8xuwNVpxdwKBzE2v
         kp2CdgABHnWrwB9JTj4pRN70TeEYzSteweC8ltqy1Z8tKrIECgH9zychkXMEthcCm547
         N/CQ==
X-Gm-Message-State: AOAM533tZY7cspuSUH+OXs8xYfaEM0UNZMxrbz4xJhp2ooGo0po28uf9
	8KJuS+ozPwmUrCXOEj224mU=
X-Google-Smtp-Source: ABdhPJx8PYPHNf3hIYDk6xxcUZ5Cz4AjHRjZCng72eHk60GDl8rPACcXENIApaJQbCkMeAProiKKeA==
X-Received: by 2002:a05:6512:150f:b0:45d:ccac:c43c with SMTP id bq15-20020a056512150f00b0045dccacc43cmr7231892lfb.604.1650724677772;
        Sat, 23 Apr 2022 07:37:57 -0700 (PDT)
Subject: Re: [PATCH V1 4/6] dt-bindings: Add xen, dev-domid property
 description for xen-grant DMA ops
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Wang <jasowang@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204221527500.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <638a5b09-ce9e-ab7e-0a5e-d81afe851cc1@gmail.com>
Date: Sat, 23 Apr 2022 17:37:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204221527500.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 23.04.22 02:00, Stefano Stabellini wrote:

Hello Stefano

> On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Introduce Xen specific binding for the virtualized device (e.g. virtio)
>> to be used by Xen grant DMA-mapping layer in the subsequent commit.
>>
>> This binding indicates that Xen grant mappings scheme needs to be
>> enabled for the device which DT node contains that property and specifies
>> the ID of Xen domain where the corresponding backend resides. The ID
>> (domid) is used as an argument to the grant mapping APIs.
>>
>> This is needed for the option to restrict memory access using Xen grant
>> mappings to work which primary goal is to enable using virtio devices
>> in Xen guests.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Looks OK to me. Just a couple of grammar improvements below. Aside from
> those, I have no further comments.

thank you, I agree with proposed comments, will update



>
>
>> ---
>> Changes RFC -> V1:
>>     - update commit subject/description and text in description
>>     - move to devicetree/bindings/arm/
>> ---
>>   .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> new file mode 100644
>> index 00000000..ef0f747
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xen specific binding for the virtualized device (e.g. virtio)
> NIT: Xen specific binding for virtualized devices (e.g. virtio)
>
>
>> +maintainers:
>> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> +
>> +select: true
>> +
>> +description:
>> +  This binding indicates that Xen grant mappings scheme needs to be enabled
>> +  for that device and specifies the ID of Xen domain where the corresponding
>> +  device (backend) resides. This is needed for the option to restrict memory
>> +  access using Xen grant mappings to work.
> NIT:
>
> This binding indicates that Xen grant mappings need to be enabled for
> the device, and it specifies the ID of the domain where the
> corresponding device (backend) resides. The property is required to
> restrict memory access using Xen grant mappings.
>
>
>> +properties:
>> +  xen,dev-domid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The domid (domain ID) of the domain where the device (backend) is running.
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    virtio_block@3000 {
>> +            compatible = "virtio,mmio";
>> +            reg = <0x3000 0x100>;
>> +            interrupts = <41>;
>> +
>> +            /* The device is located in Xen domain with ID 1 */
>> +            xen,dev-domid = <1>;
>> +    };

-- 
Regards,

Oleksandr Tyshchenko


