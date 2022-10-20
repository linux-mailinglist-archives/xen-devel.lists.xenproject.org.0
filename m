Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEB60611A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426740.675385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVIT-0006XO-R6; Thu, 20 Oct 2022 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426740.675385; Thu, 20 Oct 2022 13:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVIT-0006Tv-OA; Thu, 20 Oct 2022 13:09:17 +0000
Received: by outflank-mailman (input) for mailman id 426740;
 Thu, 20 Oct 2022 13:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olVIS-0006Tp-PG
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:09:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bcd245-5078-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 15:09:15 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id bu30so34359083wrb.8
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 06:09:15 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16623532wrs.53.2022.10.20.06.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:09:13 -0700 (PDT)
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
X-Inumbo-ID: 65bcd245-5078-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Bez4xHPLn5WJXFJpVVxEq/3R2QKdu15flkO5zJuSQQ=;
        b=UPV+tG5TN89IiZQTX27CRyuSxeiBlHBQ4M9T0jaBt9sde1MF/DOSyQXwQFM1fjeNa7
         cSgueIHiXCPdBbgD5Eg/ZnphcP3YqTEMpL04F50bmGswWw4kNng6t7pZwuWYOOc55SXe
         pFylqz2nckdvR1inQi8Jla/2pH0zbVGr8kwY7iDl3Ee4PrWzBjtqH2SazjVVULyaXJ5f
         Tj/lzFHa4iPg1zogcxTpQFEX30FypzusBg531rO9i+8A+VDc7OTFhwUowJi7JVwDK7pc
         1X+VRTn/jiTWIO8k7di1o503+E4KCmStOeSUPlqOV6kTlzkdkQv6JFy+7quUwy0d3keN
         ZV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bez4xHPLn5WJXFJpVVxEq/3R2QKdu15flkO5zJuSQQ=;
        b=F5QlBrRRyTXJ75+gHoJhaKavLAB6m8iQAwVuD1QP0PdnVHEroDiBwSvUjhpIkl1rjO
         qKVOO7fZRNt1o5qMFTij0p/yA5OJmtPLYQ9gRTLEiKJOu1ClYKk8i+si2yEmxmvPh+yV
         Xjtb6xPmevDw+Q3KPUmDWgwGCRkLK1Ac6Sa+JBPR1lGIs6v3EohcM21MxxXqUoQQ+/Ln
         FCgCpeas9z97zaiTqOF/u3YUNQ7NUAlGhk6V8Fj1OcI0vXl6RPjaCD4X/cm2eegrW5NR
         GiXlmaK40spU7Broz84nAlq6rgzCpqnK+z0Sr75Fb6EpLtgjfzRGSPe1YIvMC+BWZLBn
         pz9g==
X-Gm-Message-State: ACrzQf0xqHnBmifXilpeF9SkRvo0M+LZAqZKRmzJeElxGglMnqATGq9C
	GCtAlB22qaScOSIWZEmv+RGrww==
X-Google-Smtp-Source: AMsMyM6bxol5Wjw2EkMMl4l4bD0Uf/WT/FO43/pKMSEiqPzDXKsP9zdewTz1MhzdWAaTwFhBdeAK+w==
X-Received: by 2002:a5d:6301:0:b0:226:d87b:b55c with SMTP id i1-20020a5d6301000000b00226d87bb55cmr8083437wru.560.1666271354690;
        Thu, 20 Oct 2022 06:09:14 -0700 (PDT)
Message-ID: <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
Date: Thu, 20 Oct 2022 15:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
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
 <20221020091624.48368-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   meson           |   2 +-
>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   3 files changed, 180 insertions(+), 319 deletions(-)

>   static int net_stream_server_init(NetClientState *peer,
> @@ -283,105 +287,61 @@ static int net_stream_server_init(NetClientState *peer,
>   {
>       NetClientState *nc;
>       NetStreamState *s;
> -    int fd, ret;
> -
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET: {
> -        struct sockaddr_in saddr_in;
> -
> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
> -                              errp) < 0) {
> -            return -1;
> -        }
> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>   
> -        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> +    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> +    s = DO_UPCAST(NetStreamState, nc, nc);
>   
> -        socket_set_fast_reuse(fd);
> +    s->listen_ioc = QIO_CHANNEL(listen_sioc);
> +    qio_channel_socket_listen_async(listen_sioc, addr, 0,
> +                                    net_stream_server_listening, s,
> +                                    NULL, NULL);
>   
> -        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
> -                             inet_ntoa(saddr_in.sin_addr));
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_UNIX: {
> -        struct sockaddr_un saddr_un;
> -
> -        ret = unlink(addr->u.q_unix.path);
> -        if (ret < 0 && errno != ENOENT) {
> -            error_setg_errno(errp, errno, "failed to unlink socket %s",
> -                             addr->u.q_unix.path);
> -            return -1;
> -        }
> +    return 0;
> +}
>   
> -        saddr_un.sun_family = PF_UNIX;
> -        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
> -                       addr->u.q_unix.path);
> -        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
> -            error_setg(errp, "UNIX socket path '%s' is too long",
> -                       addr->u.q_unix.path);
> -            error_append_hint(errp, "Path must be less than %zu bytes\n",
> -                              sizeof(saddr_un.sun_path));
> -            return -1;
> -        }
> +static void net_stream_client_connected(QIOTask *task, gpointer opaque)
> +{
> +    NetStreamState *s = opaque;
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
> +    SocketAddress *addr;
> +    gchar *uri;
> +    int ret;
>   
> -        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> -
> -        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't create socket with path: %s",
> -                             saddr_un.sun_path);
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> -        if (fd == -1) {
> -            return -1;
> -        }
> -        ret = qemu_socket_try_set_nonblock(fd);
> -        if (ret < 0) {
> -            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
> -                             name, fd);
> -            return -1;
> -        }
> -        break;
> -    default:
> -        error_setg(errp, "only support inet or fd type");
> -        return -1;
> +    if (sioc->fd < 0) {
> +        qemu_set_info_str(&s->nc, "connection error");
> +        goto error;
>       }
>   
> -    ret = listen(fd, 0);
> -    if (ret < 0) {
> -        error_setg_errno(errp, errno, "can't listen on socket");
> -        closesocket(fd);
> -        return -1;
> +    addr = qio_channel_socket_get_remote_address(sioc, NULL);
> +    g_assert(addr != NULL);

Please use:

        addr = qio_channel_socket_get_remote_address(sioc, &error_fatal);

Which is more verbose in case of error, i.e.:

   qemu-system-x86_64: socket family 0 unsupported

Instead of:

   ERROR:../../net/stream.c:321:net_stream_client_connected: assertion 
failed: (addr != NULL)

> +    uri = socket_uri(addr);
> +    qemu_set_info_str(&s->nc, uri);
> +    g_free(uri);
> +
> +    ret = qemu_socket_try_set_nonblock(sioc->fd);
> +    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
> +        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
> +                          addr->u.fd.str, -ret);
> +        qapi_free_SocketAddress(addr);
> +        goto error;
>       }
> +    g_assert(ret == 0);
> +    qapi_free_SocketAddress(addr);
>   
> -    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> -    s = DO_UPCAST(NetStreamState, nc, nc);
> -    s->fd = -1;
> -    s->listen_fd = fd;
> -    s->nc.link_down = true;
>       net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
>   
> -    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
> -    return 0;
> +    /* Disable Nagle algorithm on TCP sockets to reduce latency */
> +    qio_channel_set_delay(s->ioc, false);
> +
> +    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
> +                                            s, NULL);
> +    s->nc.link_down = false;
> +
> +    return;
> +error:
> +    object_unref(OBJECT(s->ioc));
> +    s->ioc = NULL;
>   }


