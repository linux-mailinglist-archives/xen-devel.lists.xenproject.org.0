Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139641DE32E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc43J-0005oq-Fl; Fri, 22 May 2020 09:33:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mxZ=7E=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jc43I-0005ol-HF
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:33:16 +0000
X-Inumbo-ID: 43144c1a-9c0f-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43144c1a-9c0f-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:33:15 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x20so12184071ejb.11
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RH1+WXN6zq8qRr4lfcznEOYCFz+5Fo0QRgFKgbmOPTM=;
 b=jl5osZ4B8Ubh5NjrGD3o/fVYOGZl3EyMgILzYm8J0dpcJXetrJ2hRiuPjSKPlJ35rb
 rbXMMgriVIAnE92LE9wgY+HUQQdqAWc23yRkhVYoWFavogIwnrAB49ithsea2z+ZW6IA
 VVAv5WlPktygdsEkiAEj5VpirmvrkIWhdl4TuvmsQxhaaLCAIqTMuGh/sQEMnnaOTo05
 om0HtfpuzpHJQDshNdoNL9eA+NnpUuErXjpfXnMOEyRC3AQnv2dBOoIMFRr13Ic8eXUe
 JRVi780oFjv/t+qsIbFYWszmOHGyhcDtCH0btyDxm2PCQNi8kWw5iXU9UHIZcmi2N8vw
 9gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RH1+WXN6zq8qRr4lfcznEOYCFz+5Fo0QRgFKgbmOPTM=;
 b=CwpfybQ8Rk73W7SnRyeNOdPb6+GEYqYYli9YaO61v7leN+/ARWEQsOhxFnlCkZrygN
 pd6uSnh6gW4lDzKs9fUYgh6lUkHmYu7GEK0HY0vJ5sDyxiGCHrL5GyUv6syNS8e57tIM
 bGTwvLf/FI6damklJ4WAOF/WSgSpHOBUfuck4sVZMH6Kj9RcLcfV22q5NqC55YwO91nc
 IutTGoXHNWMFI0saut7FW0e1Mr2JA9oCtk9t17tSJnZS3WE7z4wEs51hrmvz2/97O2T4
 +74R7ZZU8x/JgmSQrc1qyr7iUpRs5owKlDwPXcR18fwf1q4sxspMbwyplBXqRWpxPqoB
 4MSQ==
X-Gm-Message-State: AOAM532YiVipAuzYKWtNG6c6f7s3avQcU+wbAbfUUGZdUEUpeiOqPyXa
 INegNyuXD/M63/iCZQDea409qNszA6226CpUcdF7Cw==
X-Google-Smtp-Source: ABdhPJx1yzRZWqJNFKDprfJBjvkP0d18D7w8ZsQp01MpthIgHuSB6XOK9lOtSXPXqukIIhxq4KPp07/9GKS6QvXTp/I=
X-Received: by 2002:a17:906:5f98:: with SMTP id
 a24mr7360453eju.214.1590139994738; 
 Fri, 22 May 2020 02:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Fri, 22 May 2020 02:33:14 -0700 (PDT)
X-Originating-IP: [5.35.46.149]
In-Reply-To: <05f78e98-79b9-b1a7-b892-67033b9cd245@epam.com>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
 <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
 <CAOJe8K3wZCkc2d1nxYqesTm2Cnt3QjsLDPn7U5KJbC7Bc=oVKA@mail.gmail.com>
 <05f78e98-79b9-b1a7-b892-67033b9cd245@epam.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Fri, 22 May 2020 12:33:14 +0300
Message-ID: <CAOJe8K3Zwf7SjDwdPntucgu13meGahDNMi3oaqc6g9Y7Ttoo4Q@mail.gmail.com>
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
> On 5/22/20 12:17 PM, Denis Kirjanov wrote:
>> On 5/22/20, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
>> wrote:
>>> On 5/18/20 6:04 PM, Denis Kirjanov wrote:
>>>> The patch adds a new extra type to be able to diffirentiate
>>>> between RX responses on xen-netfront side with the adjusted offset
>>>> required for XDP processing.
>>>>
>>>> The offset value from a guest is passed via xenstore.
>>>>
>>>> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
>>>> ---
>>>> v4:
>>>> - updated the commit and documenation
>>>>
>>>> v3:
>>>> - updated the commit message
>>>>
>>>> v2:
>>>> - added documentation
>>>> - fixed padding for netif_extra_info
>>>> ---
>>>> ---
>>>>    xen/include/public/io/netif.h | 18 +++++++++++++++++-
>>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/include/public/io/netif.h
>>>> b/xen/include/public/io/netif.h
>>>> index 9fcf91a..a92bf04 100644
>>>> --- a/xen/include/public/io/netif.h
>>>> +++ b/xen/include/public/io/netif.h
>>>> @@ -161,6 +161,17 @@
>>>>     */
>>>>
>>>>    /*
>>>> + * "xdp-headroom" is used to request that extra space is added
>>>> + * for XDP processing.  The value is measured in bytes and passed by
>>> not sure that we should use word "bytes" here as the rest of the
>>> protocol (mostly)
>>>
>>> talks about octets. It is somewhat mixed here, no strong opinion
>> sure, but since the public header mixes it I've decided to use that word.
>>
>>
>>>> + * the frontend to be consistent between both ends.
>>>> + * If the value is greater than zero that means that
>>>> + * an RX response is going to be passed to an XDP program for
>>>> processing.
>>>> + *
>>>> + * "feature-xdp-headroom" is set to "1" by the netback side like other
>>>> features
>>>> + * so a guest can check if an XDP program can be processed.
>>>> + */
>>>> +
>>>> +/*
>>>>     * Control ring
>>>>     * ============
>>>>     *
>>>> @@ -985,7 +996,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>>>>    #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>>>>    #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>>>>    #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
>>>> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
>>>> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
>>>> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>>>>
>>>>    /* netif_extra_info_t flags. */
>>>>    #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
>>>> @@ -1018,6 +1030,10 @@ struct netif_extra_info {
>>>>                uint8_t algorithm;
>>>>                uint8_t value[4];
>>>>            } hash;
>>>> +        struct {
>>>> +            uint16_t headroom;
>>> why do you need "pad" field here?
>> To state that we have a fixed size available.
>
> Well, I would expect "reserved" or something in that case and "pad" in case
>
> there are other fields following (see gso above).

it can be consistent with other names like pad at then end of the structure.

If it really matters I can change it, no problem.

>
> But here I think "pad" is not required, just like mcast doesn't add any
because it's already 6-bytes long

>
>>
>>>> +            uint16_t pad[2]
>>>> +        } xdp;
>>>>            uint16_t pad[3];
>>>>        } u;
>>>>    };

