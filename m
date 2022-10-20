Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF8605EB5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426604.675152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTbM-0001mK-Id; Thu, 20 Oct 2022 11:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426604.675152; Thu, 20 Oct 2022 11:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTbM-0001k1-F3; Thu, 20 Oct 2022 11:20:40 +0000
Received: by outflank-mailman (input) for mailman id 426604;
 Thu, 20 Oct 2022 11:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTbK-0001jt-Lj
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:20:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 341cb733-5069-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:20:29 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so2202000wms.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:20:36 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003b505d26776sm2545599wma.5.2022.10.20.04.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:20:34 -0700 (PDT)
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
X-Inumbo-ID: 341cb733-5069-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AKfW1OUl6IVvhKHx6nJlHKq3zd67ntMW1dov1zxRho=;
        b=FMotvRwwEiFz1GxmIERePaKPM5upqrmqPcTullTf9hS3/aU7g5iTHQHJIL+w65Y86g
         j21yM8XI2m7gv3PjNalhgUmf9CB6HpkOZa+odEipHSB/5A7LR7yJ2SzmWasAXpQMqM3X
         P5CIVcRmoOTJscvptAjsXltXMnMihamN0mBL/y9NcBKh6GOIyZpFzgIhA5/zvPbjRpfS
         hc24RWM7MPJzROqC1WqVpZE7amibHvx294sFNuhJ2b7lLAnD4pZosvw2LVUsybAdR96u
         jYXiSX7FRizBydH9ocMQQenJCuH5FidZAFMZrZF6tg1EtqCyvmnLkU+eMiHAWUO867cs
         BwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AKfW1OUl6IVvhKHx6nJlHKq3zd67ntMW1dov1zxRho=;
        b=4KPb71QbEo9xhY0oLv4RLKXgddBy8LOsGWKJXN4gPqhetK6UYM1mYmWZNG53ELRBnw
         vDAJ4v6KijHEChDX19j1kZtO7R212Z7FmRvwBik0osSFC0B4gVLteUo6366Ejo9FyXOk
         EMRBbrxgvjNqhaGmr2SQPeBoifwE74gu5xx9k8XmgXWNJGy5ye1izQk3B1H7s1DkLOU9
         IgvV+4kZpptBs2Dfo+nAoKeuShB1lP3HPQU6sPKTZeVhA8R2Je6DqAspjlEcRBGRwzZ1
         zrS5IInwmoRFM2vRTKF4ZiEzQ1rL9DvevBkHnva6SGxblt7rq3sjHb0JY/2x5AqWYdyL
         R7vQ==
X-Gm-Message-State: ACrzQf3LDOiqgagoBy+EDNWPmPxmxN0Ot6o/mOZ5S1ISPoeskjLx1VSo
	uLSTxlorfcbDZ8n0Pb21mW+vSg==
X-Google-Smtp-Source: AMsMyM4QDDxP5/5Q9nlSXHAonkPSNRZL2wP8LdhUoluTBCjES4Xd2hEjKZvm/R4uC3EI9C5UphPzrA==
X-Received: by 2002:a05:600c:1906:b0:3c6:db8a:2178 with SMTP id j6-20020a05600c190600b003c6db8a2178mr27121822wmq.7.1666264836321;
        Thu, 20 Oct 2022 04:20:36 -0700 (PDT)
Message-ID: <50b6debc-97e1-b827-098b-aa34f772e685@linaro.org>
Date: Thu, 20 Oct 2022 13:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 17/17] net: stream: add QAPI events to report
 connection state
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-18-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-18-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/22 11:16, Laurent Vivier wrote:
> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
> 
> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
> address.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/stream.c  | 11 +++++++++--
>   qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/net/stream.c b/net/stream.c
> index 95d6b910407d..8ad757cefbdf 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -38,6 +38,7 @@
>   #include "io/channel.h"
>   #include "io/channel-socket.h"
>   #include "io/net-listener.h"
> +#include "qapi/qapi-events-net.h"
>   
>   typedef struct NetStreamState {
>       NetClientState nc;
> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>           s->nc.link_down = true;
>           qemu_set_info_str(&s->nc, "");
>   
> +        qapi_event_send_netdev_stream_disconnected(s->nc.name);
> +
>           return G_SOURCE_REMOVE;
>       }
>       buf = buf1;
> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>       g_assert(addr != NULL);
>       uri = socket_uri(addr);
>       qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>       qapi_free_SocketAddress(addr);
>   
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);

Maybe worth converting to g_autofree.

>   }
>   
>   static void net_stream_server_listening(QIOTask *task, gpointer opaque)
> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>       g_assert(addr != NULL);
>       uri = socket_uri(addr);
>       qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>   
>       ret = qemu_socket_try_set_nonblock(sioc->fd);
>       if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>           qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>                             addr->u.fd.str, -ret);
> +        g_free(uri);
>           qapi_free_SocketAddress(addr);
>           goto error;
>       }
> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>                                               s, NULL);
>       s->nc.link_down = false;
>   
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
> +
>       return;
>   error:
>       object_unref(OBJECT(s->ioc));
> diff --git a/qapi/net.json b/qapi/net.json
> index 39388b1b6c41..569ab7fd37e3 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -895,3 +895,49 @@
>   ##
>   { 'event': 'FAILOVER_NEGOTIATED',
>     'data': {'device-id': 'str'} }
> +
> +##
> +# @NETDEV_STREAM_CONNECTED:
> +#
> +# Emitted when the netdev stream backend is connected
> +#
> +# @netdev-id: QEMU netdev id that is connected
> +# @uri: The Uniform Resource Identifier identifying the destination address
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},

Unrelated, but interesting. The URI should be 'tcp:[::1]:1234', we miss
this IPv6 case when parsing SOCKET_ADDRESS_TYPE_INET in socket_uri().

> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +# or
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_CONNECTED',
> +  'data': { 'netdev-id': 'str',
> +            'uri': 'str' } }
> +
> +##
> +# @NETDEV_STREAM_DISCONNECTED:
> +#
> +# Emitted when the netdev stream backend is disconnected
> +#
> +# @netdev-id: QEMU netdev id that is disconnected
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_DISCONNECTED',
> +#      'data': {'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_DISCONNECTED',
> +  'data': { 'netdev-id': 'str' } }


