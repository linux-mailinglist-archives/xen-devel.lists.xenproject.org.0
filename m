Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611E606444
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426926.675714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXOH-0002D0-CM; Thu, 20 Oct 2022 15:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426926.675714; Thu, 20 Oct 2022 15:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXOH-00029X-84; Thu, 20 Oct 2022 15:23:25 +0000
Received: by outflank-mailman (input) for mailman id 426926;
 Thu, 20 Oct 2022 15:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BcH=2V=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olXOG-00029R-Ho
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:23:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 221f7845-508b-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 17:23:23 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-SyeEJrmBNe27JQLtZrowjg-1; Thu, 20 Oct 2022 11:23:20 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 k9-20020ac85fc9000000b00399e6517f9fso15292014qta.18
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bk18-20020a05620a1a1200b006ec771d8f89sm7645948qkb.112.2022.10.20.08.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:23:19 -0700 (PDT)
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
X-Inumbo-ID: 221f7845-508b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666279402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMafXDcBqKdvZpHSUPYR6MPcYJqX4ipPzdBK8RxDOKw=;
	b=IJiYk2/towOBpdYR2Gt+mV0A4zR6Tai4K6ojOWjdqLcsMpPpbOepmKuQihC0jHQEHO692z
	BeWv6M8VvK3ZsvBx8sIbrCbAaTgfJxwWG5FSJc7EY5Spdu/bjq87t10lHp0Gk5XVATOOSA
	/6aDC/5/UtDG9Wq3Utvzy7MHDN4xtmc=
X-MC-Unique: SyeEJrmBNe27JQLtZrowjg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMafXDcBqKdvZpHSUPYR6MPcYJqX4ipPzdBK8RxDOKw=;
        b=f901KvgaTk8Xmz9f/3XpparZO546tFZrw9JLZDqOoGbvpOlsDEajecz+YXL9P2JcOZ
         yt/R+H88Vu3Pm1rEEu57VmTzFHZgiotToFw9PEhctpIS1Md3j4CMeFZWyJeOvelZHWIb
         wHlMa/u+CTuyEUb8lcobStryQ1Kh4V+JF+yRObp8Ty868PSMffjvwhnL1d+w/jkuq4dX
         HCl+dDXR/zEOFxWVPGzXmd0tcg1O6C8PfNjulTf06IMm6JxcHu7YhmUOusXZxVDYvegs
         tdIeIJasAhDmx0pDRpLvVy6OSTK13uei5vEDqUIgjX9vuAkqPxsn7anZp0Ww6XhQzVC1
         WOFQ==
X-Gm-Message-State: ACrzQf3VNu0Qi01RQN22csXYhcDBRU5GQ4d6C5DYfQuBsa5uJ6FHEeg6
	UH7dIBRfI3e9g9aaTBQkSaNlRwnTc8lzaevhkvd+so/sgmY+euI1ePmXKZeXN7jomQx3wxCFMWv
	51LDuYJCYS5tNnIxtocOlW+DC138=
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id v17-20020a05620a0f1100b006cfbe4ee953mr9747467qkl.437.1666279400414;
        Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IAM5fKOIcH08J7hWh9Ggvk8a/9IWJQskowqJlbJBxrjSIfRgNk1w/mWkvaP3l64jsbd26/A==
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id v17-20020a05620a0f1100b006cfbe4ee953mr9747449qkl.437.1666279400159;
        Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
Message-ID: <b1fd6fdf-fd91-b3af-978c-b50c3b1c8763@redhat.com>
Date: Thu, 20 Oct 2022 17:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
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
 <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/22 15:09, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>> This allows net/stream to use all the available parameters provided by
>> SocketAddress.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   meson           |   2 +-
>>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>>   qemu-options.hx |   4 +-
>>   3 files changed, 180 insertions(+), 319 deletions(-)
> 
>>   static int net_stream_server_init(NetClientState *peer,
>> @@ -283,105 +287,61 @@ static int net_stream_server_init(NetClientState *peer,
>>   {
>>       NetClientState *nc;
>>       NetStreamState *s;
>> -    int fd, ret;
>> -
>> -    switch (addr->type) {
>> -    case SOCKET_ADDRESS_TYPE_INET: {
>> -        struct sockaddr_in saddr_in;
>> -
>> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
>> -                              errp) < 0) {
>> -            return -1;
>> -        }
>> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>> -        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
>> -        if (fd < 0) {
>> -            error_setg_errno(errp, errno, "can't create stream socket");
>> -            return -1;
>> -        }
>> -        qemu_socket_set_nonblock(fd);
>> +    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
>> +    s = DO_UPCAST(NetStreamState, nc, nc);
>> -        socket_set_fast_reuse(fd);
>> +    s->listen_ioc = QIO_CHANNEL(listen_sioc);
>> +    qio_channel_socket_listen_async(listen_sioc, addr, 0,
>> +                                    net_stream_server_listening, s,
>> +                                    NULL, NULL);
>> -        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
>> -                             inet_ntoa(saddr_in.sin_addr));
>> -            closesocket(fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    }
>> -    case SOCKET_ADDRESS_TYPE_UNIX: {
>> -        struct sockaddr_un saddr_un;
>> -
>> -        ret = unlink(addr->u.q_unix.path);
>> -        if (ret < 0 && errno != ENOENT) {
>> -            error_setg_errno(errp, errno, "failed to unlink socket %s",
>> -                             addr->u.q_unix.path);
>> -            return -1;
>> -        }
>> +    return 0;
>> +}
>> -        saddr_un.sun_family = PF_UNIX;
>> -        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>> -                       addr->u.q_unix.path);
>> -        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>> -            error_setg(errp, "UNIX socket path '%s' is too long",
>> -                       addr->u.q_unix.path);
>> -            error_append_hint(errp, "Path must be less than %zu bytes\n",
>> -                              sizeof(saddr_un.sun_path));
>> -            return -1;
>> -        }
>> +static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>> +{
>> +    NetStreamState *s = opaque;
>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
>> +    SocketAddress *addr;
>> +    gchar *uri;
>> +    int ret;
>> -        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>> -        if (fd < 0) {
>> -            error_setg_errno(errp, errno, "can't create stream socket");
>> -            return -1;
>> -        }
>> -        qemu_socket_set_nonblock(fd);
>> -
>> -        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, errno, "can't create socket with path: %s",
>> -                             saddr_un.sun_path);
>> -            closesocket(fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    }
>> -    case SOCKET_ADDRESS_TYPE_FD:
>> -        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>> -        if (fd == -1) {
>> -            return -1;
>> -        }
>> -        ret = qemu_socket_try_set_nonblock(fd);
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>> -                             name, fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    default:
>> -        error_setg(errp, "only support inet or fd type");
>> -        return -1;
>> +    if (sioc->fd < 0) {
>> +        qemu_set_info_str(&s->nc, "connection error");
>> +        goto error;
>>       }
>> -    ret = listen(fd, 0);
>> -    if (ret < 0) {
>> -        error_setg_errno(errp, errno, "can't listen on socket");
>> -        closesocket(fd);
>> -        return -1;
>> +    addr = qio_channel_socket_get_remote_address(sioc, NULL);
>> +    g_assert(addr != NULL);
> 
> Please use:
> 
>         addr = qio_channel_socket_get_remote_address(sioc, &error_fatal);
> 
> Which is more verbose in case of error, i.e.:
> 
>    qemu-system-x86_64: socket family 0 unsupported
> 
> Instead of:
> 
>    ERROR:../../net/stream.c:321:net_stream_client_connected: assertion failed: (addr != NULL)
> 

I put an assert() here because I consider to have NULL here is a programming error, not an 
user error.

"It should not happen".

Thanks,
Laurent


