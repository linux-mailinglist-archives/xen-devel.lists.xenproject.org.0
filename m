Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ECB68C086
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490518.759254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2q8-0005te-A8; Mon, 06 Feb 2023 14:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490518.759254; Mon, 06 Feb 2023 14:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2q8-0005qn-6M; Mon, 06 Feb 2023 14:51:28 +0000
Received: by outflank-mailman (input) for mailman id 490518;
 Mon, 06 Feb 2023 14:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP2q6-0005qR-T6
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:51:26 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d22566-a62d-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:51:24 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id hx15so34806305ejc.11
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 06:51:24 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a1709067b9300b008878909859bsm5541253ejo.152.2023.02.06.06.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:51:23 -0800 (PST)
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
X-Inumbo-ID: b9d22566-a62d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRKpTx++j8ZkLjUBv0s8sCh8Yr8bchGn9mv145p6DLU=;
        b=JmvLVVTdWg7Hx7Y2U5kSRNipJJJEGv7BxXIj0Nbrq91QidyYdlOkmRtcuYGTsH3rSd
         mr41lFFz4EHn4l/XR6+tH/TfV61G6bvBDv3nHnY5zXTyIeJMgNC0lIzaSKAF7+mGPfGe
         OBfYOzytEhIqZKVGSJmI7RT8kwDVoNvkVS9anHnvMECdt8vTIXsUvXw7TNM1eMWJBLW5
         jc6Qb8bns1iWLrwjcBJWySRcBkZ5KfJ8qcZOtyllgVtkZHWaHGs7USjPfoNksLDz29zw
         ruwVN4UZxmoLJByPcXiHfMTdKQwkYDhr+UzWh9EoBPk2ZS6uiUc9IV0UURR4ovM0LSJq
         1GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRKpTx++j8ZkLjUBv0s8sCh8Yr8bchGn9mv145p6DLU=;
        b=JhuZr2ZYcEPm8VOk7ipQYgAwI13iMpgT81Izg6iYtSKokvp7Z6JYkX4TUIUsg2eBuY
         YXJpRGKApEQku+odA/Svc9V+/Kf76IC0x4H70zjq7QGGiXBRKL5VMxfSW8t8kW+E5H3R
         94eLjYwpjhMxvQ5P3tc23ZAzv5RNGTTzigO6se2EZa4j5yn30mrin1ACYavb2PuiF1oK
         QmbLcBieKr1PHh4y+Pi2XrLkiUleGqQbPESk3AGYEPEdGAQmK7tzk9gzxC55W6y20/3h
         bSDS3Kgkwyf9Lw3bHy53xdicZvwKFmRUF6tY253O2oB2XO++eZ5+19aQaNDizhOo+pgT
         YqeQ==
X-Gm-Message-State: AO0yUKXS8MXJzfdNkglzYxD2AlUXTWR0AvIs7vtvudOjFmJ3ctK+YIAA
	0hpA/0suVungOf7rVLerPSsrXIN3chw=
X-Google-Smtp-Source: AK7set8zk2jEqy5mosGtBhh+jLWOo73g65w7p1Pi3q780KgZ8BOrbF/RUbbEQqE8PwKrm4PiPDx3nQ==
X-Received: by 2002:a17:906:5945:b0:86e:f478:f598 with SMTP id g5-20020a170906594500b0086ef478f598mr18620878ejr.44.1675695083654;
        Mon, 06 Feb 2023 06:51:23 -0800 (PST)
Message-ID: <1217f21a-5734-26eb-4c32-cc92a7b25f69@gmail.com>
Date: Mon, 6 Feb 2023 16:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused
 dt_irq() and dt_irq_flags() macros
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-3-burzalodowa@gmail.com>
 <C6297387-8616-43BE-9640-3AE99BE164D6@arm.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <C6297387-8616-43BE-9640-3AE99BE164D6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca

On 2/6/23 16:42, Luca Fancellu wrote:
> 
> 
>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
>> Macro dt_irq() is broken because the macro parameter has the same name with
>> the struct dt_irq member "irq".
> 
> I’m not sure about the wording “broken”, it should work anyway or am I wrong?

No, it won't work because the structure member will be substituted as 
well by the macro argument (for instance dt_irq(blah) will be replaced 
by (blah)->blah).

> 
>> Macro dt_irq_flags() is broken as well because struct dt_irq has no member
>> named "flags".
> 
> Yes this depends if the macro was meant to access the structure dt_irq, I’ve had a look
> on the commit introducing it but I could not figure out the usage.

Given the macro name, I assumed that it was meant to be used for 
accessing a dt_irq field.

> 
>>
>> Since no one seems to have ever tried to use them and eventually stumble upon
>> the issues above, remove them instead of fixing them.
>>
>> Fixes: 886f34045bf0 ("xen/arm: Add helpers to retrieve an interrupt description from the device tree")
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>
>> Changes in v3:
>>   - new patch
>>
>> xen/include/xen/device_tree.h | 3 ---
>> 1 file changed, 3 deletions(-)
>>
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 7839a199e311..19a74909cece 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -159,9 +159,6 @@ struct dt_raw_irq {
>>      u32 specifier[DT_MAX_IRQ_SPEC];
>> };
>>
>> -#define dt_irq(irq) ((irq)->irq)
>> -#define dt_irq_flags(irq) ((irq)->flags)
>> -
>> typedef int (*device_tree_node_func)(const void *fdt,
>>                                       int node, const char *name, int depth,
>>                                       u32 address_cells, u32 size_cells,
>> -- 
>> 2.37.2
>>
>>
> 
> They seems indeed unused, so for me the code looks good:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> 

-- 
Xenia

