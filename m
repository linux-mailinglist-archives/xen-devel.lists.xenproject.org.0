Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453231DE2C3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3np-0003mi-EC; Fri, 22 May 2020 09:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mxZ=7E=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jc3no-0003mX-2F
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:17:16 +0000
X-Inumbo-ID: 04ecedae-9c0d-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04ecedae-9c0d-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:17:12 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id e2so12109750eje.13
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Eqky+1kINiJQLtida+8tK4ZgG7067EJfvfBCZJi95cY=;
 b=BgxOpeC+8AaBkF74inRXsRr7NNHl3A+mRw18tiY6wQp4tnjkuLrEw6vJe6hgFxV4AV
 9QaEd0NSV56HHOhAmfQvVvfvWqH0dN/0ri9dJcKl39n05Wx98cE1INsDglnnCxC6BS3r
 F4hchr8iCyEpyd97v4D/JUKcfLgJGEelRp/kHBTBBGueWu26VZPsvhEjZiSN3+yOYoog
 /krjl3NYk+tFZk7gWvfKjwOYLoLq4algiAgIXtG2bN9jXNTsF5ibnakgBhlG81QqVQI6
 v16c4ERpRIJK6t0QJlecPKxNpbwrRVxsH1ss+2258to1h9lyy9Gjhs28jOxgCqoQ9kzE
 xmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Eqky+1kINiJQLtida+8tK4ZgG7067EJfvfBCZJi95cY=;
 b=WzHC0+8mtiV56GTpMTuRHXgbOIto7Tj72rfhlmbzZ7zthCl8UYqUWGrEOVFPrjeTQX
 pUDMFJs9BLRZk4BnQTLviHT8OCdAMKm32BOrF9Ujd3yn/NS9sr9FEX2hi8gm1pJXHo/Y
 CEtQreBXQhn3+PkwaPF7GpUomWUnXSAV4YR2aTEX6wD7rCo7RHKnX7nUf6SN/tnWzCWb
 xCaRnpXVBehSIy9oP3vBC3kb5VpOJyH7QenP1z5kjL4BwpmlAl+w/wfLV1F1FFjPxKeo
 E3K67vyvXLeak3KblmXQ69YI0f4eUzkcIJFUlMy2uI0FhyJAPdc93zxYS9cyqrO3xxCl
 /Oew==
X-Gm-Message-State: AOAM5325LHrHegISan0Rkx25u6OGEH7B0H1dkKFo74SVTo/HJffbUuAS
 AXbC6PXG6t9yvPIAnlCSYG855wxA9VlKR0/raim4hw==
X-Google-Smtp-Source: ABdhPJyb5+yX0ysifnCaPcrgVcXX14yJBr9fAzS5tdMQi9OpYE2XbiLDOyO2r0H3lQ5K2coyjzSRj3w677yzj8ggoxQ=
X-Received: by 2002:a17:906:1313:: with SMTP id
 w19mr7712209ejb.79.1590139031582; 
 Fri, 22 May 2020 02:17:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Fri, 22 May 2020 02:17:10 -0700 (PDT)
X-Originating-IP: [5.35.46.149]
In-Reply-To: <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
 <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Fri, 22 May 2020 12:17:10 +0300
Message-ID: <CAOJe8K3wZCkc2d1nxYqesTm2Cnt3QjsLDPn7U5KJbC7Bc=oVKA@mail.gmail.com>
Subject: Re: [PATCH v4] public/io/netif.h: add a new extra type for XDP
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/22/20, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com> wrote:
> On 5/18/20 6:04 PM, Denis Kirjanov wrote:
>> The patch adds a new extra type to be able to diffirentiate
>> between RX responses on xen-netfront side with the adjusted offset
>> required for XDP processing.
>>
>> The offset value from a guest is passed via xenstore.
>>
>> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
>> ---
>> v4:
>> - updated the commit and documenation
>>
>> v3:
>> - updated the commit message
>>
>> v2:
>> - added documentation
>> - fixed padding for netif_extra_info
>> ---
>> ---
>>   xen/include/public/io/netif.h | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/include/public/io/netif.h
>> b/xen/include/public/io/netif.h
>> index 9fcf91a..a92bf04 100644
>> --- a/xen/include/public/io/netif.h
>> +++ b/xen/include/public/io/netif.h
>> @@ -161,6 +161,17 @@
>>    */
>>
>>   /*
>> + * "xdp-headroom" is used to request that extra space is added
>> + * for XDP processing.  The value is measured in bytes and passed by
>
> not sure that we should use word "bytes" here as the rest of the
> protocol (mostly)
>
> talks about octets. It is somewhat mixed here, no strong opinion

sure, but since the public header mixes it I've decided to use that word.


>
>> + * the frontend to be consistent between both ends.
>> + * If the value is greater than zero that means that
>> + * an RX response is going to be passed to an XDP program for
>> processing.
>> + *
>> + * "feature-xdp-headroom" is set to "1" by the netback side like other
>> features
>> + * so a guest can check if an XDP program can be processed.
>> + */
>> +
>> +/*
>>    * Control ring
>>    * ============
>>    *
>> @@ -985,7 +996,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>>   #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>>   #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>>   #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
>> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
>> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
>> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>>
>>   /* netif_extra_info_t flags. */
>>   #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
>> @@ -1018,6 +1030,10 @@ struct netif_extra_info {
>>               uint8_t algorithm;
>>               uint8_t value[4];
>>           } hash;
>> +        struct {
>> +            uint16_t headroom;
> why do you need "pad" field here?

To state that we have a fixed size available.

>> +            uint16_t pad[2]
>> +        } xdp;
>>           uint16_t pad[3];
>>       } u;
>>   };

