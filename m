Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF5518ABA
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 19:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319799.540194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlw1q-0003Oo-Le; Tue, 03 May 2022 17:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319799.540194; Tue, 03 May 2022 17:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlw1q-0003Mb-IN; Tue, 03 May 2022 17:09:38 +0000
Received: by outflank-mailman (input) for mailman id 319799;
 Tue, 03 May 2022 17:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nwV=VL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nlw1o-0003MV-S3
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 17:09:36 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cebfe149-cb03-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 19:09:35 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so31457985lfb.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 10:09:35 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a19ae0f000000b0046ba69295e6sm991362lfc.1.2022.05.03.10.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 10:09:33 -0700 (PDT)
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
X-Inumbo-ID: cebfe149-cb03-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zJs4+MMRWZw/5d9ErRntMPYDHkeYPubfbBu5PoJ/OL4=;
        b=M8YnGgqOtzjrYDRuAmiWTIN0idz0aB1XK23Uw+aNk4CfbYy5aKVITKbBOMASf1yAua
         BgpgVejpIWt8F6mYbpZ1fCm1sjp9iu2AjIo/0vd3sBkasOA0RrTEuUAJ6mQOWQqVeq/O
         BqSxjkrx9WDaAFcutE4wvDiQqMrbSgdyiQ0TOVxxXqv5w8GeoXBgF7aZ+MxcSzk15Y8e
         +1W9wBTeyxRmh+fB0IFa3uURqquKs04Bl4ddkmB4yTgcmom0ydsORiv+WE2n/M+E59Wk
         su6MC/cBHQzbjTguGmt0qezOEvsqpcxwEsxAmk4LvxoqWGtGAocx94WxhC2Ls1TnRWy9
         06JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zJs4+MMRWZw/5d9ErRntMPYDHkeYPubfbBu5PoJ/OL4=;
        b=Iw1ilpernMvS86V92yRJxO5SE2aNF8QfLDC4/woc53W9x0xoDWknNzqt+jDVw4+RSq
         AOkbYDY6+IZ8C1WcAV6BoYbmzIxTpmE5KqFbUnQ1fwu3s5BIWNA8Z3U5DVcecdHddjnA
         R5NThQc058yIz67j7yx2KrjO9/JiIUQNqUXWx3f0RK/0VuCOWThI0aMhzioLik9M3LZU
         smsmikqhmASsdA/W10V17QzKQnrJDtWnlMUzh+XQJVO8Zbeme9WkZkxRQdnM8D0AxCsJ
         RMb+lnN9NfX4z5Nb9Cea+FIPs/hFGXzCwp/RwWvRfizoAZnBW2Fny3Zt3psUjiH3ihHk
         ZtIQ==
X-Gm-Message-State: AOAM530feIaWcZmUROggU9sJo0TwhyZr80FS82FkbNGnd8MzdRuMSEHn
	D3NW6ZuprIJsV7braVtbV+4=
X-Google-Smtp-Source: ABdhPJzv6H6M8/xo8EzW/O4pDdx28m5jcypFmJdLpM4hdPg4n724T8DEh4HH50LEA43Trj5o8JzjrQ==
X-Received: by 2002:ac2:4add:0:b0:471:fc6d:a71d with SMTP id m29-20020ac24add000000b00471fc6da71dmr12040907lfp.350.1651597775052;
        Tue, 03 May 2022 10:09:35 -0700 (PDT)
Subject: Re: [PATCH V1 4/6] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
To: Rob Herring <robh@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
 <YnBUUclJqkvKsV2o@robh.at.kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <accbc6be-82c1-dfd2-586f-816141415d7c@gmail.com>
Date: Tue, 3 May 2022 20:09:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YnBUUclJqkvKsV2o@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 03.05.22 00:59, Rob Herring wrote:

Hello Rob


> On Fri, Apr 22, 2022 at 07:51:01PM +0300, Oleksandr Tyshchenko wrote:
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
>> +
>> +maintainers:
>> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> +
>> +select: true
> Do we really need to support this property everywhere?

 From my understanding - yes.

As, I think, any device node describing virtulized device in the guest 
device tree can have this property.  Initially (in the RFC series) the 
"solution to restrict memory access using Xen grant mappings" was 
virtio-specific.

Although the support of virtio is a primary target of this series, we 
decided to generalize this work and expand it to any device [1]. So the 
Xen grant mappings scheme (this property to be used for) can be 
theoretically used for any device emulated by the Xen backend.


>> +
>> +description:
>> +  This binding indicates that Xen grant mappings scheme needs to be enabled
>> +  for that device and specifies the ID of Xen domain where the corresponding
>> +  device (backend) resides. This is needed for the option to restrict memory
>> +  access using Xen grant mappings to work.
>> +
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
> virtio@3000

ok, will change


>
>> +            compatible = "virtio,mmio";
>> +            reg = <0x3000 0x100>;
>> +            interrupts = <41>;
>> +
>> +            /* The device is located in Xen domain with ID 1 */
>> +            xen,dev-domid = <1>;
> This fails validation:
>
> Documentation/devicetree/bindings/arm/xen,dev-domid.example.dtb: virtio_block@3000: xen,dev-domid: [[1]] is not of type 'object'
>          From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/virtio/mmio.yaml

Thank you for pointing this out, my fault, I haven't "properly" checked 
this before. I think, we need to remove "compatible = "virtio,mmio"; here


diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml 
b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
index 2daa8aa..d2f2140 100644
--- a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
+++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
@@ -28,7 +28,7 @@ additionalProperties: true
  examples:
    - |
      virtio_block@3000 {
-            compatible = "virtio,mmio";
+            /* ... */
              reg = <0x3000 0x100>;
              interrupts = <41>;



>
> The property has to be added to the virtio/mmio.yaml schema. If it is
> not needed elsewhere, then *just* add the property there.

As I described above, the property is not virtio specific and can be 
used for any virtualized device for which Xen grant mappings scheme 
needs to be enabled (xen-grant DMA-mapping layer).


[1] 
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop/


>
> Rob

-- 
Regards,

Oleksandr Tyshchenko


