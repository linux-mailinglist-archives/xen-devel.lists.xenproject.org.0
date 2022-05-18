Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83F52BBBA
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332228.555881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKPq-0006mq-72; Wed, 18 May 2022 14:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332228.555881; Wed, 18 May 2022 14:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKPq-0006jj-3m; Wed, 18 May 2022 14:12:42 +0000
Received: by outflank-mailman (input) for mailman id 332228;
 Wed, 18 May 2022 14:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/mK=V2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nrKPo-0006jd-Lg
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:12:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92807625-d6b4-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 16:12:38 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id d15so3878313lfk.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 07:12:38 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 v8-20020ac25608000000b0047255d211absm221374lfd.218.2022.05.18.07.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:12:37 -0700 (PDT)
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
X-Inumbo-ID: 92807625-d6b4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zUpra34RHpxyR0Ls3UM9NaIwGbYcisrFEnw8bjZ1+nY=;
        b=pyUBTpeyMaggkxd4bHlKItfgOSbzEa6zzDLbSMbbVWbXDHlxl6M7pzMumi64afvyYP
         k/h49AGTStKVVKax+VEoTLbr85i7u5VjBFXxnd85wPhRAvoPXv8ms98ptCoDu6wAMKRw
         1WT6BaloTu/JPWlqn9v1z4MCeQJnGZyLGByJO7MtTLr7qebyPt0v8yoGcxhmpX/QvfLQ
         JN3kL8smxfOGZqC4Bsj0XqjKrHLTjov0TkbKHvf4/L0zVjtlxYA6Eo2tra8FlawDvL+l
         BCrjPpLoQtrzbSkMc2k5L8fenGmWJLBk9sp8gtZOQZ/YO3Ls77mv+tX3eWFyLyqW5zRt
         77PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zUpra34RHpxyR0Ls3UM9NaIwGbYcisrFEnw8bjZ1+nY=;
        b=jfCaWPWuXZ7hjb1O0xKh20SR6nHxFvopijm5WIkCXlpFhDMJQ1CnxxvD+qBNijCYyY
         86g5jUq4TVhvSjAH9XKaR4961Qds0jTb1k0HbeMbQbMSlV8SHnA3SwQyB/5lcuNainzJ
         5/TBaT3MThqB4n0nWVRITqcK6E7oDSICG+zA9DFfpowaWdbdrC1xCcROAiFaONGV5bXA
         rA/6LgTuL0sBTPMe2DmXJt5CObWT2YeHKhj++DL6lLUyKXc2lR63QkrMQvvCLEYxIxqR
         yo6tNkhcI4LIF5qcdFFh8D5inp/rNAEVE0W/5VR0S2Se5i/8FOtlDMDXLZa+AOq0Posi
         sPdg==
X-Gm-Message-State: AOAM530iEtKO5GFTdw6B8xllKjb+yRCN8saDdfT5XGMKg9W9cNPgQpR2
	Qi35Yc74PvQrtBXj1II1yUA=
X-Google-Smtp-Source: ABdhPJzp2tFmfVthOY9fdufPSFAz0WW8seYKWhdyy781iXWupDbYQ/8o7UbHzRqy48Qzm/hT285VZg==
X-Received: by 2002:a05:6512:31c3:b0:473:e6ef:368d with SMTP id j3-20020a05651231c300b00473e6ef368dmr20602037lfe.141.1652883157723;
        Wed, 18 May 2022 07:12:37 -0700 (PDT)
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
To: Rob Herring <robh@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
 <20220517002750.GA3638680-robh@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fa3be245-ac3c-5637-13a1-3197e78c874d@gmail.com>
Date: Wed, 18 May 2022 17:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220517002750.GA3638680-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.05.22 03:27, Rob Herring wrote:

Hello Rob, all


> On Sat, May 07, 2022 at 09:19:06PM +0300, Oleksandr Tyshchenko wrote:
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
>> ---
>> Changes RFC -> V1:
>>     - update commit subject/description and text in description
>>     - move to devicetree/bindings/arm/
>>
>> Changes V1 -> V2:
>>     - update text in description
>>     - change the maintainer of the binding
>>     - fix validation issue
>>     - reference xen,dev-domid.yaml schema from virtio/mmio.yaml
>> ---
>>   .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>>   Documentation/devicetree/bindings/virtio/mmio.yaml |  7 ++++
>>   2 files changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> new file mode 100644
>> index 00000000..750e89e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xen specific binding for virtualized devices (e.g. virtio)
>> +
>> +maintainers:
>> +  - Stefano Stabellini <sstabellini@kernel.org>
>> +
>> +select: true
> Omit. No need to apply this on every single node.

ok, will do


>
>> +
>> +description:
>> +  This binding indicates that Xen grant mappings need to be enabled for
>> +  the device, and it specifies the ID of the domain where the corresponding
>> +  device (backend) resides. The property is required to restrict memory
>> +  access using Xen grant mappings.
>> +
>> +properties:
>> +  xen,dev-domid:
> I kind of think 'dev' is redundant. Is there another kind of domid
> possible?


In general, yes. It is driver(frontend) domid. But, at least for now, I 
don't see why we will need an additional property for that.


>   Maybe xen,backend-domid or just xen,domid? I don't know Xen
> too well, so ultimately up to you all.

xen,domid sounds ambiguous to me.

xen,backend-domid sounds perfectly fine to me, I even think it fits better.



Stefano, Juergen, would you be happy with new xen,backend-domid name?

If yes, Stefano could you please clarify, would you be OK if I retained 
your R-b tags (for all patches in current series which touch that 
property) after doing such renaming?




>
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The domid (domain ID) of the domain where the device (backend) is running.
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    virtio@3000 {
>> +            compatible = "virtio,mmio";
>> +            reg = <0x3000 0x100>;
>> +            interrupts = <41>;
>> +
>> +            /* The device is located in Xen domain with ID 1 */
>> +            xen,dev-domid = <1>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
>> index 10c22b5..29a0932 100644
>> --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
>> +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
>> @@ -13,6 +13,9 @@ description:
>>     See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
>>     more details.
>>   
>> +allOf:
>> +  - $ref: /schemas/arm/xen,dev-domid.yaml#
>> +
>>   properties:
>>     compatible:
>>       const: virtio,mmio
>> @@ -33,6 +36,10 @@ properties:
>>       description: Required for devices making accesses thru an IOMMU.
>>       maxItems: 1
>>   
>> +  xen,dev-domid:
>> +    description: Required when Xen grant mappings need to be enabled for device.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> No need to define the type again nor describe it again.
>
> Instead, just change additionalProperties to unevaluateProperties in
> this doc. The diff is the latter takes $ref's into account.

ok, will do. Could you please clarify, shall I use?

unevaluatedProperties: false

or

unevaluatedProperties:

type: object


I am not too familiar with this stuff. Both variants seem to pass 
validation.


Thank you.


>
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.7.4
>>
>>
-- 
Regards,

Oleksandr Tyshchenko


