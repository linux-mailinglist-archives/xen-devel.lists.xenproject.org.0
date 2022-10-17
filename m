Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D46010B7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 16:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424422.671823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQid-00044D-JE; Mon, 17 Oct 2022 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424422.671823; Mon, 17 Oct 2022 14:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQid-000417-Eu; Mon, 17 Oct 2022 14:03:51 +0000
Received: by outflank-mailman (input) for mailman id 424422;
 Mon, 17 Oct 2022 14:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NITi=2S=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1okQic-000411-HD
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 14:03:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8571e25f-4e24-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 16:03:49 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-BTdRU3eOOXilKDYgDHMWrg-1; Mon, 17 Oct 2022 10:03:47 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 ff6-20020a05622a4d8600b0039cbf66e8b5so8514653qtb.19
 for <xen-devel@lists.xenproject.org>; Mon, 17 Oct 2022 07:03:47 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a05620a40c300b006eed14045f4sm8067755qko.48.2022.10.17.07.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 07:03:40 -0700 (PDT)
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
X-Inumbo-ID: 8571e25f-4e24-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666015428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wsrYdoZKYaMd0e3vhZfGJW60dLJna9JuS/wPJsmy1U=;
	b=hX3WFSA2Rt4YqbCPH2XRTiOs2eZ8TEwYVMSW6yDLNzEGNMeGadBHFXGzg1AmKSNFRq9Jqr
	QdEVycPEfyeNyZIT/RbJwTmrPYJeqa/pvnTwteIWmzj6E/PvfUGfpkA2Q2Ahix678Edag0
	GkY5ggA7Q0GyN5mSX/LRr30lfneJ5dU=
X-MC-Unique: BTdRU3eOOXilKDYgDHMWrg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wsrYdoZKYaMd0e3vhZfGJW60dLJna9JuS/wPJsmy1U=;
        b=ctC1maBvzaz7ikMWFrjDXM6lzz/OVYpCKKNrbhxiRvzDCmf8yRq06gCqs5oKZITZdC
         EysCf8pOh9dMdlbiPM0PvC9ILsFLqTTYl+JYkumyeIO53usLmeDiWI1J5kZn3n+GLQBb
         GsXQrZxgJFGLIUh421RJE2+uhvkxlCwMFjo6MWMgaECnm9VstD2z3qKnVMjeuxBfoHRw
         l5pVLO/Kw8U5QMbwAqP9q32nkiHxMpYvleUoxP2N1ZSfp3429aB2+1VkLQTFfL85ZOz9
         rWjaBuzsd5zTOFpvloph1wqG1SOGeZV9Of0jibvT6DKTQoCP72V086PUqLhxFRlWsxcU
         U4pw==
X-Gm-Message-State: ACrzQf2uW4JXHRxceEGwmAwfr/FUM6rpBX7ylpVEHCDx4ANu1Z5RGBcv
	UksknpzLjXB5eVRZrvCzBpUHMsALF90ZnpuIaUWAjisJmu0RwB4OVvgBv0cFq5t8Iz1q/szWc8W
	DSBSJ42WzCGOVink+kvtE2Trk7to=
X-Received: by 2002:a37:f50b:0:b0:6cb:be4d:6ce8 with SMTP id l11-20020a37f50b000000b006cbbe4d6ce8mr7686464qkk.135.1666015421470;
        Mon, 17 Oct 2022 07:03:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4u/YeakeV18+4BITTwq9fc/lh0NkQ58t6fwHnLwPvtzPwpZEHppmatLFZkzJtc37r2pYbT0Q==
X-Received: by 2002:a37:f50b:0:b0:6cb:be4d:6ce8 with SMTP id l11-20020a37f50b000000b006cbbe4d6ce8mr7686418qkk.135.1666015421085;
        Mon, 17 Oct 2022 07:03:41 -0700 (PDT)
Message-ID: <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com>
Date: Mon, 17 Oct 2022 16:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com> <87mt9u4m9d.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87mt9u4m9d.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/22 15:23, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>>
>> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
>> address.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   net/stream.c  | 11 +++++++++--
>>   qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/stream.c b/net/stream.c
>> index 0293e38e5b57..821ae3265356 100644
>> --- a/net/stream.c
>> +++ b/net/stream.c
>> @@ -38,6 +38,7 @@
>>   #include "io/channel.h"
>>   #include "io/channel-socket.h"
>>   #include "io/net-listener.h"
>> +#include "qapi/qapi-events-net.h"
>>   
>>   typedef struct NetStreamState {
>>       NetClientState nc;
>> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>>           s->nc.link_down = true;
>>           qemu_set_info_str(&s->nc, "");
>>   
>> +        qapi_event_send_netdev_stream_eoc(s->nc.name);
>> +
>>           return G_SOURCE_REMOVE;
>>       }
>>       buf = buf1;
>> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>>       g_assert(addr != NULL);
>>       uri = socket_uri(addr);
>>       qemu_set_info_str(&s->nc, uri);
>> -    g_free(uri);
>>       qapi_free_SocketAddress(addr);
>>   
>> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
>> +    g_free(uri);
>>   }
>>   
>>   static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>>       g_assert(addr != NULL);
>>       uri = socket_uri(addr);
>>       qemu_set_info_str(&s->nc, uri);
>> -    g_free(uri);
>>   
>>       ret = qemu_socket_try_set_nonblock(sioc->fd);
>>       if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>>           qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>>                             addr->u.fd.str, -ret);
>> +        g_free(uri);
>>           qapi_free_SocketAddress(addr);
>>           goto error;
>>       }
>> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>>                                               s, NULL);
>>       s->nc.link_down = false;
>>   
>> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
>> +    g_free(uri);
>> +
>>       return;
>>   error:
>>       object_unref(OBJECT(s->ioc));
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 6a1a49749294..69f83bceff3f 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -895,3 +895,49 @@
>>   ##
>>   { 'event': 'FAILOVER_NEGOTIATED',
>>     'data': {'device-id': 'str'} }
>> +
>> +##
>> +# @NETDEV_STREAM_CONNECTED:
>> +#
>> +# Emitted when the netdev stream backend is connected
>> +#
>> +# @netdev-id: QEMU netdev id that is connected
>> +# @uri: The Uniform Resource Identifier identifying the destination address
> 
> Is an URI the appropriate representation here?  It's not how we specify
> such addresses elsewhere in QAPI/QMP...

I put in the event the same information we have in info_str and displayed by the HMP 
command 'info network'. What would be a more appropriate reprensation?

> 
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>> +#
>> +# or
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>> +#
>> +##
>> +{ 'event': 'NETDEV_STREAM_CONNECTED',
>> +  'data': { 'netdev-id': 'str',
>> +            'uri': 'str' } }
>> +
>> +##
>> +# @NETDEV_STREAM_EOC:
> 
> What does "EOC" mean?

End-Of-Connection, this is the nomenclature used in the code when the socket is disconnected.
> 
> Could this be named NETDEV_STREAM_DISCONNECTED, for symmetry with
> NETDEV_STREAM_CONNECTED?

Yes, it can. EOC is shorter, it's why I used it, but if you prefer "disconnected"...

Thanks,
Laurent

> 
>> +#
>> +# Emitted when the netdev stream backend is disconnected
>> +#
>> +# @netdev-id: QEMU netdev id that is disconnected
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_EOC',
>> +#      'data': {'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
>> +#
>> +##
>> +{ 'event': 'NETDEV_STREAM_EOC',
>> +  'data': { 'netdev-id': 'str' } }
> 


