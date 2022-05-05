Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E351BCE8
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 12:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321921.543077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYT9-0007gT-9P; Thu, 05 May 2022 10:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321921.543077; Thu, 05 May 2022 10:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYT9-0007dn-5s; Thu, 05 May 2022 10:12:23 +0000
Received: by outflank-mailman (input) for mailman id 321921;
 Thu, 05 May 2022 10:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iwW6=VN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nmYT7-0007dh-LV
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:12:21 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d95108dd-cc5b-11ec-a406-831a346695d4;
 Thu, 05 May 2022 12:12:20 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id d5so5423980wrb.6
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 03:12:20 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bj20-20020a0560001e1400b0020c5253d8edsm908950wrb.57.2022.05.05.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 03:12:18 -0700 (PDT)
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
X-Inumbo-ID: d95108dd-cc5b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eb2ZcFrJLchDQJ3uoZwQrPbJ1hCXeW171xzslTdT/U4=;
        b=G89l6j5DRWAvV3zCYyVoZKkWWBGnZmD3gVlBJDJs1rBbWZGMduvsJXgjawnSyEvdry
         wK8X2CVN4x+NPbTCSj/Hhf99L/9GOZ1OJbxwihCOn/RX0Kl5nqvbEsQh3FNzrbb1gixQ
         UCiBZhzKSWWfPKfAk9noqtj32u52IDzcaLqLzCgHlvFdrC+eqqa6vTfXWDUFbgRqFBqB
         6sLFoZLkvMkYbyxOtL/JwMxWfZNOPan9v832XXd/QrVzjHj+WBf2G+buT/KWnTlMphbF
         UxWVKrDxlAdR/Thq9GPIpuJJU5fg+AoBHmdU1+Fi9uoVPjtOmPBSchUkefm3TRpzF2/C
         pz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eb2ZcFrJLchDQJ3uoZwQrPbJ1hCXeW171xzslTdT/U4=;
        b=qHsPk9brhYhGkU8PDovKmjhByh+q2p1Ck5cbMu/w0CmoOVVQfBHquWXp1+nKWzGrqR
         LAuaHfFFC6fYeyJ2lU7CAvqGzzX6zpZcqgCQK2O2zJLCBcuUZ1ar+APAo4c+tiOkck8T
         nCwZzHqlK0h+/p8Fn+QDgLh9WEYLj2QksMd5ih9mu+q3kd+0JbK8/631t3XSgkjnSjFN
         sZ2/0cvXFYRoTR49AsKwQxVVu8MoisCbyNxYd0JKIWS43LuKZCgYg8MSY+a02neTQwzn
         eFYfSDx8KE+bQCwqw1vXCqfrh2S2K4q5aideQJ6NQQMWOgk0wfFrCF/O5JiQKpY5FrEe
         7TQg==
X-Gm-Message-State: AOAM531pmFIsDRQKrTi0i3uyPMKrvSKXhyg6UQyi5kGxh4UXhiFXWPQT
	G/22T6qorcZy+PsJPsk5TBk=
X-Google-Smtp-Source: ABdhPJw7Wbi8fb/wzTczoS25ioRejgwcD7Tq0/bwbcNAYzBrRJZFfWNBH1Dc95FX1erDQ/IFeDBlUg==
X-Received: by 2002:a05:6000:144d:b0:20c:7829:2a44 with SMTP id v13-20020a056000144d00b0020c78292a44mr8970101wrx.663.1651745539758;
        Thu, 05 May 2022 03:12:19 -0700 (PDT)
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
 <accbc6be-82c1-dfd2-586f-816141415d7c@gmail.com>
 <YnHCgBsQ90cJ58+0@robh.at.kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <87009e86-8999-eac9-a5c9-feef196f69fc@gmail.com>
Date: Thu, 5 May 2022 13:12:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YnHCgBsQ90cJ58+0@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 04.05.22 03:02, Rob Herring wrote:

Hello Rob

> On Tue, May 03, 2022 at 08:09:32PM +0300, Oleksandr wrote:
>> On 03.05.22 00:59, Rob Herring wrote:
>>
>> Hello Rob
>>
>>
>>> On Fri, Apr 22, 2022 at 07:51:01PM +0300, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Introduce Xen specific binding for the virtualized device (e.g. virtio)
>>>> to be used by Xen grant DMA-mapping layer in the subsequent commit.
>>>>
>>>> This binding indicates that Xen grant mappings scheme needs to be
>>>> enabled for the device which DT node contains that property and specifies
>>>> the ID of Xen domain where the corresponding backend resides. The ID
>>>> (domid) is used as an argument to the grant mapping APIs.
>>>>
>>>> This is needed for the option to restrict memory access using Xen grant
>>>> mappings to work which primary goal is to enable using virtio devices
>>>> in Xen guests.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Changes RFC -> V1:
>>>>      - update commit subject/description and text in description
>>>>      - move to devicetree/bindings/arm/
>>>> ---
>>>>    .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>>>>    1 file changed, 37 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>>>> new file mode 100644
>>>> index 00000000..ef0f747
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>>>> @@ -0,0 +1,37 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Xen specific binding for the virtualized device (e.g. virtio)
>>>> +
>>>> +maintainers:
>>>> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> +
>>>> +select: true
>>> Do we really need to support this property everywhere?
>>  From my understanding - yes.
>>
>> As, I think, any device node describing virtulized device in the guest
>> device tree can have this property.  Initially (in the RFC series) the
>> "solution to restrict memory access using Xen grant mappings" was
>> virtio-specific.
>>
>> Although the support of virtio is a primary target of this series, we
>> decided to generalize this work and expand it to any device [1]. So the Xen
>> grant mappings scheme (this property to be used for) can be theoretically
>> used for any device emulated by the Xen backend.
>>
>>
>>>> +
>>>> +description:
>>>> +  This binding indicates that Xen grant mappings scheme needs to be enabled
>>>> +  for that device and specifies the ID of Xen domain where the corresponding
>>>> +  device (backend) resides. This is needed for the option to restrict memory
>>>> +  access using Xen grant mappings to work.
>>>> +
>>>> +properties:
>>>> +  xen,dev-domid:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      The domid (domain ID) of the domain where the device (backend) is running.
>>>> +
>>>> +additionalProperties: true
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    virtio_block@3000 {
>>> virtio@3000
>> ok, will change
>>
>>
>>>> +            compatible = "virtio,mmio";
>>>> +            reg = <0x3000 0x100>;
>>>> +            interrupts = <41>;
>>>> +
>>>> +            /* The device is located in Xen domain with ID 1 */
>>>> +            xen,dev-domid = <1>;
>>> This fails validation:
>>>
>>> Documentation/devicetree/bindings/arm/xen,dev-domid.example.dtb: virtio_block@3000: xen,dev-domid: [[1]] is not of type 'object'
>>>           From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/virtio/mmio.yaml
>> Thank you for pointing this out, my fault, I haven't "properly" checked this
>> before. I think, we need to remove "compatible = "virtio,mmio"; here
> Uhh, no. That just means the example is incomplete. You need to add this
> property or reference this schema from virtio/mmio.yaml.

ok, I got it


>
>
>> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> index 2daa8aa..d2f2140 100644
>> --- a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
>> @@ -28,7 +28,7 @@ additionalProperties: true
>>   examples:
>>     - |
>>       virtio_block@3000 {
>> -            compatible = "virtio,mmio";
>> +            /* ... */
>>               reg = <0x3000 0x100>;
>>               interrupts = <41>;
>>
>>
>>
>>> The property has to be added to the virtio/mmio.yaml schema. If it is
>>> not needed elsewhere, then *just* add the property there.
>> As I described above, the property is not virtio specific and can be used
>> for any virtualized device for which Xen grant mappings scheme needs to be
>> enabled (xen-grant DMA-mapping layer).
> But that's a finite list of devices, right?

Right


> In any case, you have to
> list the property anywhere it can be used.

Agree


If I got it right, we need to add to virtio/mmio.yaml something like:


diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml 
b/Documentation/devicetree/bindings/virtio/mmio.yaml
index 10c22b5..29a0932 100644
--- a/Documentation/devicetree/bindings/virtio/mmio.yaml
+++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
@@ -13,6 +13,9 @@ description:
    See 
https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
    more details.

+allOf:
+  - $ref: /schemas/arm/xen,dev-domid.yaml#
+
  properties:
    compatible:
      const: virtio,mmio
@@ -33,6 +36,10 @@ properties:
      description: Required for devices making accesses thru an IOMMU.
      maxItems: 1

+  xen,dev-domid:
+    description: Required when Xen grant mappings need to be enabled 
for device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
  required:
    - compatible
    - reg


This passed validation.


Could you please clarify, is my understanding correct?


>
> Rob

-- 
Regards,

Oleksandr Tyshchenko


