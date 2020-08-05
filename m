Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A034D23D3D4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 00:13:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ReF-0004Qx-Jb; Wed, 05 Aug 2020 22:12:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3ReD-0004Qs-RY
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 22:12:33 +0000
X-Inumbo-ID: d0410a6e-f0e0-4738-b0a6-31b8b9e5adb7
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0410a6e-f0e0-4738-b0a6-31b8b9e5adb7;
 Wed, 05 Aug 2020 22:12:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so14031191ljo.12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0J9dQqXxpUpqjksZBdycZsJ8XR9I4aZNdsZm+8ZNLUo=;
 b=XsUqtkA8P2Kf6TMHxNulA53u5KJ5YjuoJc6zFKSqGk44gwQdKhSYDgDq94W8NZuCIb
 JeHg6VHJmfsv+ewTeYEakT/Z+xh4F7OwJ+uNs7OeyUdtR77Q4/q8HVkdStsB5Wu4FM2N
 XE8oiax6Mr/mrn++D8Kz4xDHgiu6efvQwhKCf3g5modFRx+/SbRR5hP8Wmh2lZYD2A9W
 z6Y5V8BBaSTnUQ43LFbRITg04yKfiKHVczjF8TNGfz/nSURJdj3S3iAiCwzhOKEixvKZ
 sWWbiZqpQPFS6fjUJKyz/QTtg11ObxZ+miZvf6HSEphLhM6PedHo0JabjlJ/yV58M9xW
 B9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0J9dQqXxpUpqjksZBdycZsJ8XR9I4aZNdsZm+8ZNLUo=;
 b=SOMUg/qGEA48W7DJ0ImVjnAo6KOkeimeEoZGOGlj9cadNw/u8VZi5xfjA/K89cS+Kw
 +UZjYMB3ZeULq+hI2XLgw6JfcfPyC+Z5RSr2bHjsnsUf65eyYn9jXgQ0Ew5AT3iEHk6H
 t1qlRxS7d5GsBxzkNajw4Z+V73sKUpFbHgLezlPfBsRWsXxKKTIEsPNFl+klN1Q/li29
 i5lIuFgwcR3OUPA+oUyTSnlV9TZy6RgIoWuDFFDmRR807dOpgUv3TKJbE5xxSQ16PHoN
 qN4zQZlT3zBEaTkkXgkGwfPUPpZDMMfe/4A5ng8xjDSm/D9TqpA/EV8MgHAeP0aAjTRB
 U9yA==
X-Gm-Message-State: AOAM530SAqSuxZyWhltIBuMfAjkTeEgetMZwed7Bf28Me+f1jVveB+rg
 4XlNzY8Yt4IU68zZdPmQZp0=
X-Google-Smtp-Source: ABdhPJzLUK1uz4JnIFsfT4QmH56gQ+EvaO3JMxw80Vu7bsgYKHZCse4nWGc3sCL0uD8c7PFHJMKz6g==
X-Received: by 2002:a2e:82cb:: with SMTP id n11mr2246202ljh.352.1596665551654; 
 Wed, 05 Aug 2020 15:12:31 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y26sm1435000ljm.132.2020.08.05.15.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 15:12:30 -0700 (PDT)
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
To: Jan Beulich <jbeulich@suse.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <1487bf45-3696-8052-ab98-149e612fff80@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <12116823-2e68-8f21-6a31-fca234f26ebf@gmail.com>
Date: Thu, 6 Aug 2020 01:12:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1487bf45-3696-8052-ab98-149e612fff80@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 19:15, Jan Beulich wrote:

Hi, Jan

> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/public/hvm/dm_op.h
>> +++ b/xen/include/public/hvm/dm_op.h
>> @@ -417,6 +417,20 @@ struct xen_dm_op_pin_memory_cacheattr {
>>       uint32_t pad;
>>   };
>>   
>> +/*
>> + * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
>> + *                         IRQ lines.
>> + * XXX Handle PPIs.
>> + */
>> +#define XEN_DMOP_set_irq_level 19
>> +
>> +struct xen_dm_op_set_irq_level {
>> +    uint32_t irq;
>> +    /* IN - Level: 0 -> deasserted, 1 -> asserted */
>> +    uint8_t  level;
>> +};
> If this is the way to go (I've seen other discussion going on),
> please make sure you add explicit padding fields and ...

ok


>
>> +
>> +
>>   struct xen_dm_op {
> ... you don't add double blank lines.

ok


-- 
Regards,

Oleksandr Tyshchenko


