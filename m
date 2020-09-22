Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C32746BA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKlEP-0004yZ-5L; Tue, 22 Sep 2020 16:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKlEO-0004yR-3P
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:33:28 +0000
X-Inumbo-ID: 694e5f71-aa14-499f-b7f9-e86ac3db35c4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694e5f71-aa14-499f-b7f9-e86ac3db35c4;
 Tue, 22 Sep 2020 16:33:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q8so18728338lfb.6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1v9v9EExFb9Rf0i2MjeeYu2loX+FvK6BwanBphSuQ5g=;
 b=kwqoSPYarCKrTPrIhE448caeQ3Q7wOQzIxTvywwuv7xd/SHWqRMVfQYNztCbW2Dn3J
 ZihCYPDmACZ07u3Hti6edGfZzVpzX1ieCS+2md/y4N0ezX/H1dbwWq8p2vo/RJta6+Ki
 89X3ukdxPSZCDOS+te+LKfP06QTukCwZpzIUUKjwFxTEAevNMZS7NBijxn40etTzvrMn
 jlIS8GH6BoSkmkfz7sXPr8DtoGPzUYwx0xP+8VGvcJ8SdVem0D180BIc8c3F8Mz4TMVw
 99mkTT/tfrSG6UB73Az3wgGzDuQB0SqHiUUY1oMXwkvrvxeILf0xj8ygxlAuSacX3zsV
 x1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1v9v9EExFb9Rf0i2MjeeYu2loX+FvK6BwanBphSuQ5g=;
 b=Ig1Twt+r6E8bUePhg7UoPAUlPPZPDuFYrh45344k66iswAajnEz7Vyn8mB7t0jex9A
 dmsMUmUrIYXovFClo9KzsuZ+a0zTLDPiHbdJbP4Rpgfsvt0A9PkQ0rlh7HWep1UNVMLG
 tnRM+/83kj/OlA9KBgN2EWSyDumiXDOFFdy4m1pnncB/5YKUczFQagg4v4ndoDM0F/yD
 xso7H61dT+SU7WJnqMz3HvGXcvEqDpmJ4fcxVUWWMBkAJVFAY/W7UBidP+Ft9pl25Wp7
 Upylii6bOPqLUP4raJ+HYAm/S7Y9nCqEy/wxMNStoHeT8NOIgJkhvIDIPEQnxZSGLyrx
 fBtQ==
X-Gm-Message-State: AOAM533JzkqSF/f+0bIq0BGFwHoOzreTg8dlh47lj1SZPLvwHFWRWkPW
 t4hz52BTxPq93CqGX9Bk2Vw=
X-Google-Smtp-Source: ABdhPJwgj7dVctx4V+qPoScA0yJhUERwibPWNrzkrXAGyx4br4NxjNucYxAoNdiwDMWIo+QaoRMhgA==
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1870922lfq.281.1600792406210; 
 Tue, 22 Sep 2020 09:33:26 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 21sm3689925lfk.206.2020.09.22.09.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:33:25 -0700 (PDT)
Subject: Re: [PATCH V1 06/16] xen/ioreq: Make x86's
 hvm_ioreq_(page/vcpu/server) structs common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-7-git-send-email-olekstysh@gmail.com>
 <1c02f776-a9ae-ac7f-4d17-35745c324c91@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dae2e811-f7a8-acbf-3e13-2b2448025878@gmail.com>
Date: Tue, 22 Sep 2020 19:33:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c02f776-a9ae-ac7f-4d17-35745c324c91@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 14.09.20 18:16, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -23,6 +23,40 @@
>>   
>>   #include <asm/hvm/ioreq.h>
>>   
>> +struct hvm_ioreq_page {
>> +    gfn_t gfn;
>> +    struct page_info *page;
>> +    void *va;
>> +};
>> +
>> +struct hvm_ioreq_vcpu {
>> +    struct list_head list_entry;
>> +    struct vcpu      *vcpu;
>> +    evtchn_port_t    ioreq_evtchn;
>> +    bool             pending;
>> +};
>> +
>> +#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
>> +#define MAX_NR_IO_RANGES  256
>> +
>> +struct hvm_ioreq_server {
>> +    struct domain          *target, *emulator;
>> +
>> +    /* Lock to serialize toolstack modifications */
>> +    spinlock_t             lock;
>> +
>> +    struct hvm_ioreq_page  ioreq;
>> +    struct list_head       ioreq_vcpu_list;
>> +    struct hvm_ioreq_page  bufioreq;
>> +
>> +    /* Lock to serialize access to buffered ioreq ring */
>> +    spinlock_t             bufioreq_lock;
>> +    evtchn_port_t          bufioreq_evtchn;
>> +    struct rangeset        *range[NR_IO_RANGE_TYPES];
>> +    bool                   enabled;
>> +    uint8_t                bufioreq_handling;
>> +};
> Besides there again being the question of hvm_ prefixes here,
> is the bufioreq concept something Arm is meaning to make use
> of? If not, this may want to become conditional ...
The hvm_ prefixes will be removed.
Regarding bufioreq concept I agree with what Julien said. Although we 
don't need it right away on Arm we can use it later on for the virtio 
improvements.

-- 
Regards,

Oleksandr Tyshchenko


