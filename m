Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53660749F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427517.676658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olouT-0007Zw-E4; Fri, 21 Oct 2022 10:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427517.676658; Fri, 21 Oct 2022 10:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olouT-0007Xl-9r; Fri, 21 Oct 2022 10:05:49 +0000
Received: by outflank-mailman (input) for mailman id 427517;
 Fri, 21 Oct 2022 10:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RYXF=2W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olouR-0007Xf-5a
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:05:47 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca679280-5127-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:04:46 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id bp11so3736287wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 03:05:45 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003b50428cf66sm2082907wme.33.2022.10.21.03.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:05:44 -0700 (PDT)
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
X-Inumbo-ID: ca679280-5127-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GB+pI3kGAuzpQoXTGpIpiRRFsRdWt5+i8pDVrDo5vB4=;
        b=CzmN+f1TmY8uBHSiAVNQ6zxNfaxGebmiadC1wQAKTZhLYj4FiEtIhMWq0tQPVm0SLK
         XacWht1NGqaR6Y2jUwfAX6IhcpakVK5I5Ftql2ljjangwJsABF4wCMYf/+1KhfnO8qeN
         +nXSa8G/ckLYCwIq5ePsKdGZU2tzFcH1uNhkaHxhtFOVnnTCpJMGdOS9MeubZtkYvuAG
         priGcqXsO1s7WMpoaZIqaQD3k1Rr6tmYW3Cht+70sThqlFsHIdS0KmJ9BG3/PuTq2vzq
         cTibJzhhXONM9xOhAM6lWBPZb3cKY0M1XDdOM33WnNtrOtlwJBh7x8n6Gg9EpsEBfjbl
         h33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GB+pI3kGAuzpQoXTGpIpiRRFsRdWt5+i8pDVrDo5vB4=;
        b=5uib6/s+mxPWsIQ0MGNAFlPPVXuVorxjGzmhvH7YXALHHHNgqewtM6ojr7NXPeRmgk
         XdNjcn1+SJQUQ5cU74wlLgqDQ+IF0Pu4ma5+sGVzWzKgHInOu/MRMhoOAMxjoe1FPXwd
         isL86l0OAzRz7IDeozSyyBLpkTSt9hXOc2PRdR47OEJaYjcn8I2SudpXSaExpRVemj6n
         1/HwsyMPPI53x4m3Ej7uJvCq5MLCFuxjPMSnLdSOHRuVbVkeShV2c/5dIehWwgqGXA9H
         mo8eCDvX9sYectpbXOjyrJTxYG+rOWhLypJ69nmEa71MRCBdwbMEsmYf5ITET6FaM7TU
         oK4Q==
X-Gm-Message-State: ACrzQf1wMyVpSU0OQnM2wdKM+i1Bpn5qBW1hPE43HzeFnp1mzxH0+pOg
	j8sNi1TgW/SOPmr4WXxyuC0HYA==
X-Google-Smtp-Source: AMsMyM56sq1HIy0HWbcR0IYJtQwp46T1S4N7uaKz29DxhotsSlDQw6YPcANPVrmEUULyqMfgiJqRig==
X-Received: by 2002:adf:ee84:0:b0:22c:d1fd:71d4 with SMTP id b4-20020adfee84000000b0022cd1fd71d4mr11781164wro.350.1666346745235;
        Fri, 21 Oct 2022 03:05:45 -0700 (PDT)
Message-ID: <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
Date: Fri, 21 Oct 2022 12:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/22 11:09, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/stream.c    | 492 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   2 files changed, 178 insertions(+), 318 deletions(-)

> -static void net_stream_accept(void *opaque)
> +static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>   {
>       NetStreamState *s = opaque;
> -    struct sockaddr_storage saddr;
> -    socklen_t len;
> -    int fd;
> -
> -    for (;;) {
> -        len = sizeof(saddr);
> -        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
> -        if (fd < 0 && errno != EINTR) {
> -            return;
> -        } else if (fd >= 0) {
> -            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> -            break;
> -        }
> -    }
> +    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
> +    SocketAddress *addr;
> +    int ret;
>   
> -    s->fd = fd;
> -    s->nc.link_down = false;
> -    net_stream_connect(s);
> -    switch (saddr.ss_family) {
> -    case AF_INET: {
> -        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
> -
> -        qemu_set_info_str(&s->nc, "connection from %s:%d",
> -                          inet_ntoa(saddr_in->sin_addr),
> -                          ntohs(saddr_in->sin_port));
> -        break;
> +    if (listen_sioc->fd < 0) {
> +        qemu_set_info_str(&s->nc, "connection error");
> +        return;
>       }
> -    case AF_UNIX: {
> -        struct sockaddr_un saddr_un;
>   
> -        len = sizeof(saddr_un);
> -        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
> -        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
> -        break;
> -    }
> -    default:
> -        g_assert_not_reached();
> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
> +    g_assert(addr != NULL);

Missing propagating Error* (observed in v12).

> +    ret = qemu_socket_try_set_nonblock(listen_sioc->fd);
> +    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
> +        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
> +                          addr->u.fd.str, -ret);
> +        return;
>       }
> +    g_assert(ret == 0);
> +    qapi_free_SocketAddress(addr);
> +
> +    s->nc.link_down = true;
> +    s->listener = qio_net_listener_new();
> +
> +    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
> +    qio_net_listener_set_client_func(s->listener, net_stream_listen, s, NULL);
> +    qio_net_listener_add(s->listener, listen_sioc);
>   }
>   
>   static int net_stream_server_init(NetClientState *peer,
> @@ -283,105 +286,61 @@ static int net_stream_server_init(NetClientState *peer,
>   {
>       NetClientState *nc;
>       NetStreamState *s;
> -    int fd, ret;
> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>   
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET: {
> -        struct sockaddr_in saddr_in;
> -
> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
> -                              errp) < 0) {
> -            return -1;
> -        }
> -
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

Ditto (Error*).

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
> +    qapi_free_SocketAddress(addr);
> +
> +    return;
> +error:
> +    object_unref(OBJECT(s->ioc));
> +    s->ioc = NULL;
>   }


