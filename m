Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF0A27D49
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 22:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881878.1292052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfQQb-00078Z-AL; Tue, 04 Feb 2025 21:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881878.1292052; Tue, 04 Feb 2025 21:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfQQb-000777-7X; Tue, 04 Feb 2025 21:25:53 +0000
Received: by outflank-mailman (input) for mailman id 881878;
 Tue, 04 Feb 2025 21:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uBag=U3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tfQQZ-000771-1T
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 21:25:51 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a6784be-e33e-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 22:25:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so42064855e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 13:25:49 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d966faasm227375e9.23.2025.02.04.13.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:25:48 -0800 (PST)
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
X-Inumbo-ID: 9a6784be-e33e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738704348; x=1739309148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0yZ3rGNBWFbwR7tcrMEb20ea+rfzWXUZz9frnWzuoa8=;
        b=ngujnvaE9RVkgW7iBXBfiucAmgY9UNHnhZHfx623zJarHQxoBSrA9bHnLvlbvdeco0
         /i1SbYp33I/x+LEBywdheeONpUr0uaTqJ9TeMkomhlRocLUgM2WaSyb76SgOiwKUJT+Y
         GvUyk394d1P8nmaHj2HteWpcRmp9t9vSpYaKqw044ueGfRZRVTtteskZrHbCEXa9Jz7+
         HWKOlbeROcbpy1rHD77VsRy8D5zA1OuMMU7kzUaO7NzVIUhg+RSPq7pM+xCexggI5dUM
         jQW7ttpRpZD82O+YPMsDAqqQGYAUXvy4P55adQiW31JHZV0TEzju2xHRCWbfGQq3sU/2
         XB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738704348; x=1739309148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yZ3rGNBWFbwR7tcrMEb20ea+rfzWXUZz9frnWzuoa8=;
        b=fIT5Sf9/1dUdzDXGQkeJ0W9VRYckW9/uOvEmepvfqeTBUlqxR7xYTtxvCfsmzZEp3j
         gB6+7OFaXHYW9AJWm90JbRUS8u2MX+7pFKYvKQ7WpjndnvTgj9tuv+y0uyzr31fIgJb0
         8yvjQdscKNJRBpqpH8/DBQ4LWeCO/synBavwjGupRvOLn0bX1YvJ71+Edy11biVXR9E8
         R2pCY9LevaxVXG4P0Hp/GGEesnpN6tK0uD5J/+th/88krH2moMlW6Y8iYn0CJq8FFYn6
         Z0RKB3CCpFlhVayfJBiLl4gtDd0gAbkDIqvGZ7vtKglBeyWUWpCNOXRYtJkTNHu89n5i
         LVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVJPZepnrKoy4n+f4SGddvuZFphmwNo7kHaeFreTzonI1C62amu01heMNgwVkilmW7LfnS0UCLqok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmdOrk8Tio0IiwyXfcBYcXX16wnwlzaEldKqb2yxGq7XPk192M
	nfuip758yRvL3utlF4L6Umu/ms39lHaMMOEAxRDg6qvN6y98WTWSy9Od3vaAk1Q=
X-Gm-Gg: ASbGnctvmwUD6o1nybwGWssfpzZbNe/HTS9wCHBlIEPNfZo64djl2gkqT6hcqdSBAiN
	ScfEaKB3M1OCh6yWrXGahlsrlTjPdWtNiJ2/Nf75ofino4vf00eUAnfPq2EOlCRJHZwDN86X+Ns
	xXnSajVyDXvM3jzZPjL6AfmPSS85kXdm1L2PWZJcExccBMP1UCae0r2J4zn9GebjC5g2Em/wUaN
	nR03HI5hVpYUjMTXjeeqCr+V2vk1YRgiKUsPEvhzVT4XkkcXJd0D1W97e9rIQhEL9isRP2OxBI6
	G6f6t90uK2SFXChviy+aM4ckYG7ajglppZ5/aOphPBWrGMwv4iHuDKMcs8c=
X-Google-Smtp-Source: AGHT+IEKxmr8p6Gdjx/D0eeb7pj0vKXisGW1fMr/aKDXpj9R2377FaYU+L0nppkxwZjSdcCGKmolEQ==
X-Received: by 2002:a05:600c:3c8f:b0:438:e231:d35e with SMTP id 5b1f17b1804b1-4390d34d20cmr1876685e9.0.1738704348532;
        Tue, 04 Feb 2025 13:25:48 -0800 (PST)
Message-ID: <02ea4b41-3594-4ead-90d3-0ab06f2be7fa@linaro.org>
Date: Tue, 4 Feb 2025 22:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 9/9] hw/xen: Have legacy Xen backend inherit from
 DYNAMIC_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-10-philmd@linaro.org>
 <9A2B297A-6270-4482-B1B6-81F518C07C1E@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9A2B297A-6270-4482-B1B6-81F518C07C1E@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bernhard,

On 27/1/25 10:46, Bernhard Beschow wrote:
> Am 25. Januar 2025 18:13:43 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Because the legacy Xen backend devices can optionally be plugged on the
>> TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.
>> Remove the implicit TYPE_XENSYSDEV instance_size.
>>
>> Untested, but I'm surprised the legacy devices work because they
>> had a broken instance size (QDev instead of Sysbus...), so accesses
>> of XenLegacyDevice fields were overwritting sysbus ones.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> include/hw/xen/xen_pvdev.h  | 3 ++-
>> hw/xen/xen-legacy-backend.c | 7 ++-----
>> 2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
>> index 0c984440476..48950dc2b57 100644
>> --- a/include/hw/xen/xen_pvdev.h
>> +++ b/include/hw/xen/xen_pvdev.h
>> @@ -32,7 +32,8 @@ struct XenDevOps {
>> };
>>
>> struct XenLegacyDevice {
>> -    DeviceState        qdev;
>> +    SysBusDevice parent_obj;
> 
> This then needs sysbus.h rather than qdev-core.h include.
> 
> Moreover, the patch in the reply needs to be inserted into the series before this patch.
> 
> Both are needed for the patch to compile.

Per your reply on patch #7, might I include your

Tested-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Bernhard Beschow <shentey@gmail.com>
(or R-b)

squashing:

-- >8 --
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index 48950dc2b57..629bec90d09 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -1,7 +1,7 @@
  #ifndef QEMU_HW_XEN_PVDEV_H
  #define QEMU_HW_XEN_PVDEV_H

-#include "hw/qdev-core.h"
+#include "hw/sysbus.h"
  #include "hw/xen/xen_backend_ops.h"

  /* ------------------------------------------------------------- */
---

?

