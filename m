Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82FB607545
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427581.676798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpVX-0000d5-13; Fri, 21 Oct 2022 10:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427581.676798; Fri, 21 Oct 2022 10:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpVW-0000a6-U8; Fri, 21 Oct 2022 10:44:06 +0000
Received: by outflank-mailman (input) for mailman id 427581;
 Fri, 21 Oct 2022 10:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opYQ=2W=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olpVV-0000Pz-9r
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:44:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ea166c-512d-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:43:04 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-JvMOhRKmM4KX9qQXO3c1Ag-1; Fri, 21 Oct 2022 06:43:54 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 22-20020ac85756000000b0039cf0d41e2cso2199578qtx.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 03:43:54 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bz12-20020a05622a1e8c00b0039a1146e0e1sm7904582qtb.33.2022.10.21.03.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:43:52 -0700 (PDT)
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
X-Inumbo-ID: 23ea166c-512d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666349043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlhzrGdNNXcUHQesRH8bQ4YpN+DZcGJ2lAA8SoLbHRk=;
	b=eiL3r1Gxe6pIH1OXM1yFBnUYPyyAiWFPdqAsB5n72RkpnM/QqYXKLe/Tt7xb+++RisvCbb
	ugqwj9iqIcO0MFzbOQkHQUx1E3kkOubSbsYdyaxGAeIq8IXJMkdZ9VfYgFCI8sZhXmISu0
	1GGbFhrSH6DBB/6ZKJ834Rmzs2vakr8=
X-MC-Unique: JvMOhRKmM4KX9qQXO3c1Ag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlhzrGdNNXcUHQesRH8bQ4YpN+DZcGJ2lAA8SoLbHRk=;
        b=1xxryqZ9XLEtcBTNIMmoPWZkuBaaZPyOE0wFt7af2qLCBkq5dAsf0JxJ0H+NBVGG2l
         1Eto+uYpVcpWpWb6C4QQKY9gTgSlgw0NfxvLVWaESj+oY1EI3P+Z/CAoRTVaEcjpK3xg
         1fLYEsOiRLVtcBv3V++fiAqrKc/j9i37psVEoZ4RdYOT36Akd9PFq9bHNzS4Hl1DOEao
         o2dokiIaujhLbB742Ef0/Gop3YX8z7svqWjqoB/G3iYNG2gWzFl2ZbLJ3jaz3/QG9Glo
         7KV+6Ae64BUex8+AD31B3nAKQCTY5JwfX5DXzwVgloUq5mOVH9IKpx3B1Pu/P3U8Z/Q5
         5iDw==
X-Gm-Message-State: ACrzQf1klkdlMl5y+r1WzJIs+I8yc1sX8pjRtyjKd0wqnNZAyVqtWC6S
	ezHIbA7tdKRqpPoLSnxV5h2Trp7sBD1NDpH+ys5sk60Ag2ArotuFDyAngqY3ncSLzIK2sGWCZ+M
	wEYsyq8mSehA6/3z7QdryzPdhz5M=
X-Received: by 2002:a05:620a:178b:b0:6ee:e0a3:1f27 with SMTP id ay11-20020a05620a178b00b006eee0a31f27mr13228088qkb.267.1666349033810;
        Fri, 21 Oct 2022 03:43:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM611EjOL522oIGakwDiiXV4Y0dKdy9c7EPJKbB8GjbY87oLC9A+yV2u/dKW1Qlv9YtxTj59wQ==
X-Received: by 2002:a05:620a:178b:b0:6ee:e0a3:1f27 with SMTP id ay11-20020a05620a178b00b006eee0a31f27mr13228065qkb.267.1666349033545;
        Fri, 21 Oct 2022 03:43:53 -0700 (PDT)
Message-ID: <881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com>
Date: Fri, 21 Oct 2022 12:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
 <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
 <87tu3x1n2m.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87tu3x1n2m.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/22 12:35, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 21/10/22 11:09, Laurent Vivier wrote:
>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>> This allows net/stream to use all the available parameters provided by
>>> SocketAddress.
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>    net/stream.c    | 492 +++++++++++++++++-------------------------------
>>>    qemu-options.hx |   4 +-
>>>    2 files changed, 178 insertions(+), 318 deletions(-)
>>
>>> -static void net_stream_accept(void *opaque)
>>> +static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>>>    {
>>>        NetStreamState *s = opaque;
>>> -    struct sockaddr_storage saddr;
>>> -    socklen_t len;
>>> -    int fd;
>>> -
>>> -    for (;;) {
>>> -        len = sizeof(saddr);
>>> -        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
>>> -        if (fd < 0 && errno != EINTR) {
>>> -            return;
>>> -        } else if (fd >= 0) {
>>> -            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
>>> -            break;
>>> -        }
>>> -    }
>>> +    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
>>> +    SocketAddress *addr;
>>> +    int ret;
>>>    -    s->fd = fd;
>>> -    s->nc.link_down = false;
>>> -    net_stream_connect(s);
>>> -    switch (saddr.ss_family) {
>>> -    case AF_INET: {
>>> -        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
>>> -
>>> -        qemu_set_info_str(&s->nc, "connection from %s:%d",
>>> -                          inet_ntoa(saddr_in->sin_addr),
>>> -                          ntohs(saddr_in->sin_port));
>>> -        break;
>>> +    if (listen_sioc->fd < 0) {
>>> +        qemu_set_info_str(&s->nc, "connection error");
>>> +        return;
>>>        }
>>> -    case AF_UNIX: {
>>> -        struct sockaddr_un saddr_un;
>>>    -        len = sizeof(saddr_un);
>>> -        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>>> -        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
>>> -        break;
>>> -    }
>>> -    default:
>>> -        g_assert_not_reached();
>>> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
>>> +    g_assert(addr != NULL);
>>
>> Missing propagating Error* (observed in v12).
> 
> *If* this is really a programming error: what about &error_abort?

assert() informs the compiler that following code will not use addr with a NULL value, I 
don't think &error_abort does that. This could avoid an error report in code static analyzer.

Thanks,
Laurent


