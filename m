Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4801D7A58
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:48:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jag8F-0001ct-IT; Mon, 18 May 2020 13:48:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jag8D-0001cf-Ow
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:48:37 +0000
X-Inumbo-ID: 45b9a482-990e-11ea-b07b-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45b9a482-990e-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 13:48:37 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id n24so885197ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=R49DYIk8gyxYrhl4FSK3W75EuNxo2wOsvTGnhEq4JfU=;
 b=b+VZR+XtXiIYNliszTZlNWqkslMz6n81+V5cVXg9putYBJpmO1P6rNvsQQP5Dw/Fmd
 M5KyAAr6tFIPhaN5l3kLmPKq1QhNfPW+DWKTSsabVsrXbL5iDuw6C+fPRHWU8JNcmRgD
 zHLqejt7wMjzaCWNHhQ9hK5bTq0ESqy4AdaZijJnZytBU0lJHtafvh82scuz739gZmqn
 KWqLHhrHqBVfaA5O/0t+FJIusFkZokgZ/K6w14Iqcf3sOgYdJ1x7ea3xaBRpcYOIYV1g
 lvqZE0oNfv/FZoAOR8QhOEA9Z0gHw5lFoSUAmYfEPf6sp/oGp/fRbIC5fB178ZpuwC/9
 UA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=R49DYIk8gyxYrhl4FSK3W75EuNxo2wOsvTGnhEq4JfU=;
 b=m7PAWzzF8xRSUUu97d9AvBxGCv/VzQmrwleznYi7ebT/TUhKFz2F20orj6FKfazKtK
 UDz72MGyd1KxeyhQ5M+8OPQa6y31Ni9/Nvb/jtScvHZKq1bR0sQzH6g/KBuSySSGfQFN
 8vYCEzE28xpK2dMv/pQgroXsVTshro0vrqnJBu2VTvnEY+2AdUoI4JyjqWVQPjcLQCA4
 ZxlbHlBrSFA981uXh78Xy/S5TUfarhW2fAcZlxGnX4KghlTxTtGv4kVe2DAJBrOGbZ9C
 AzRWX+Hro19NKegD7fkRbMw8pWi2IZfk4AaLaVZyFTYEx/zIPRHHONFwVveehVVoT40y
 QSNQ==
X-Gm-Message-State: AOAM531lhc9aIVAoF7YMvN6RkHnDwN4v1J/RR81nDFovczxgMvEhbQQh
 AziwtEOjpfavWMs0ZPzGaBRfA2ypR17rViTpzyqKuQ==
X-Google-Smtp-Source: ABdhPJxpLscWtuMpNcYVCo8WVvccspGP2jZgzCvt+WybYfC+eyFdfWnKmHS8cnDhfwf98RL0sHcDjDnGvuuBSHclpTs=
X-Received: by 2002:a17:906:f53:: with SMTP id
 h19mr2041779ejj.343.1589809716216; 
 Mon, 18 May 2020 06:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Mon, 18 May 2020 06:48:35 -0700 (PDT)
X-Originating-IP: [5.35.46.227]
In-Reply-To: <000001d62d19$b3866510$1a932f30$@xen.org>
References: <1589808344-1687-1-git-send-email-kda@linux-powerpc.org>
 <000001d62d19$b3866510$1a932f30$@xen.org>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Mon, 18 May 2020 16:48:35 +0300
Message-ID: <CAOJe8K3RTjNZyNBZqs56GKk-yaKwB4svOmgw9xt3vjzH6r5fBg@mail.gmail.com>
Subject: Re: [PATCH v3] public/io/netif.h: add a new extra type for XDP
To: paul@xen.org
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/18/20, Paul Durrant <xadimgnik@gmail.com> wrote:
>> -----Original Message-----
>> From: Denis Kirjanov <kda@linux-powerpc.org>
>> Sent: 18 May 2020 14:26
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; jgross@suse.com
>> Subject: [PATCH v3] public/io/netif.h: add a new extra type for XDP
>>
>> The patch adds a new extra type to be able to diffirentiate
>> between RX responses on xen-netfront side with the adjusted offset
>> required for XDP processing.
>>
>> The offset value from a guest is passed via xenstore.
>>
>> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
>> ---
>> v3:
>> - updated the commit message
>>
>> v2:
>> - added documentation
>> - fixed padding for netif_extra_info
>> ---
>>  xen/include/public/io/netif.h | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/include/public/io/netif.h
>> b/xen/include/public/io/netif.h
>> index 9fcf91a..ec56a15 100644
>> --- a/xen/include/public/io/netif.h
>> +++ b/xen/include/public/io/netif.h
>> @@ -161,6 +161,13 @@
>>   */
>>
>>  /*
>> + * "netfront-xdp-headroom" is used to add an extra space before packet
>> data
>> + * for XDP processing. The value is passed by the frontend to be
>> consistent
>> + * between both ends. If the value is greater than zero that means that
>> + * an RX response is going to be passed to an XDP program for
>> processing.
>> + */
>
> I think 'used to add extra space' is probably the wrong phrase. How about
> 'is used to request that extra space is added'
> It also does not state what unit the value is specified in so you need
> something to clarify that.
Ok.

I also don't understand what "The
> value is passed by the frontend to be consistent between both ends" means.
> What happens if the backend is older and does not know
> what this key means?

Looks like it has also be stated here since I've added another value
"feature-xdp-headroom" which is set by  the netback side.

>
>   Paul
>
>> +
>> +/*
>>   * Control ring
>>   * ============
>>   *
>> @@ -985,7 +992,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>>  #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>>  #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>>  #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
>> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
>> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
>> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>>
>>  /* netif_extra_info_t flags. */
>>  #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
>> @@ -1018,6 +1026,10 @@ struct netif_extra_info {
>>              uint8_t algorithm;
>>              uint8_t value[4];
>>          } hash;
>> +        struct {
>> +            uint16_t headroom;
>> +            uint16_t pad[2]
>> +        } xdp;
>>          uint16_t pad[3];
>>      } u;
>>  };
>> --
>> 1.8.3.1
>
>
>

