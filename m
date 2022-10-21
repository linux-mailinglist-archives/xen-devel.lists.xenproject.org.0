Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C33606F9B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 07:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427293.676201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olku6-0003e8-SV; Fri, 21 Oct 2022 05:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427293.676201; Fri, 21 Oct 2022 05:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olku6-0003bz-PT; Fri, 21 Oct 2022 05:49:10 +0000
Received: by outflank-mailman (input) for mailman id 427293;
 Fri, 21 Oct 2022 05:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1olku5-0003bt-7l
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 05:49:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13120e88-5104-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 07:49:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-4DTeeM-2PU2WpFpu9IYBjA-1; Fri, 21 Oct 2022 01:49:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689EF1C09B80;
 Fri, 21 Oct 2022 05:49:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 100741121315;
 Fri, 21 Oct 2022 05:48:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACD4321E6686; Fri, 21 Oct 2022 07:48:55 +0200 (CEST)
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
X-Inumbo-ID: 13120e88-5104-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666331345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBX5KiLXbX7P8P3a+cVBh7Xtwe9pVLfUZQSamsMuzpw=;
	b=LF0NIm/57hDEF+T7TVMxv+bKmkGY6rzVlVkSOf6eSWJCQu/RE3qZTfySGFHuC2BDQhIInO
	NYMSKUGkG58G75RMsBplRqwN+uDMiuk4RSz/txZgga0EsYS6vJK7E5baJA5OtYf8UTdqH0
	QDvnMhLhkJOV66KRcJ5U+aq8vDgVsTw=
X-MC-Unique: 4DTeeM-2PU2WpFpu9IYBjA-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,  Thomas Huth
 <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano
 Stabellini <sstabellini@kernel.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Eric Blake <eblake@redhat.com>,
  xen-devel@lists.xenproject.org,  "Michael S. Tsirkin" <mst@redhat.com>,
  Stefan Weil <sw@weilnetz.de>,  Paolo Bonzini <pbonzini@redhat.com>,
  Jason Wang <jasowang@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
Date: Fri, 21 Oct 2022 07:48:55 +0200
In-Reply-To: <20221020162558.123284-18-lvivier@redhat.com> (Laurent Vivier's
	message of "Thu, 20 Oct 2022 18:25:58 +0200")
Message-ID: <87pmel4th4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Laurent Vivier <lvivier@redhat.com> writes:

> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

Use cases?

Could similar event signalling be useful for other kinds of netdev
backends?

> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
> address.

No more.  Easy fix: scratch "the URI of".

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  net/stream.c  |  9 +++++++--
>  qapi/net.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/net/stream.c b/net/stream.c
> index 95d6b910407d..cac01d4d792a 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -38,6 +38,7 @@
>  #include "io/channel.h"
>  #include "io/channel-socket.h"
>  #include "io/net-listener.h"
> +#include "qapi/qapi-events-net.h"
>  
>  typedef struct NetStreamState {
>      NetClientState nc;
> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>          s->nc.link_down = true;
>          qemu_set_info_str(&s->nc, "");
>  
> +        qapi_event_send_netdev_stream_disconnected(s->nc.name);
> +
>          return G_SOURCE_REMOVE;
>      }
>      buf = buf1;
> @@ -244,8 +247,8 @@ static void net_stream_listen(QIONetListener *listener,
>      uri = socket_uri(addr);
>      qemu_set_info_str(&s->nc, uri);
>      g_free(uri);
> +    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
>      qapi_free_SocketAddress(addr);
> -

Don't add this blank line in PATCH 15, please.

>  }
>  
>  static void net_stream_server_listening(QIOTask *task, gpointer opaque)
> @@ -327,7 +330,6 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>          goto error;
>      }
>      g_assert(ret == 0);
> -    qapi_free_SocketAddress(addr);
>  
>      net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
>  
> @@ -338,6 +340,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>                                              s, NULL);
>      s->nc.link_down = false;
>  
> +    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
> +    qapi_free_SocketAddress(addr);
> +
>      return;
>  error:
>      object_unref(OBJECT(s->ioc));

Could put the qapi_free_SocketAddress() in its final place in PATCH 15
already to reduce churn.  Up to you.

> diff --git a/qapi/net.json b/qapi/net.json
> index 39388b1b6c41..c37b24717382 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -895,3 +895,52 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @NETDEV_STREAM_CONNECTED:
> +#
> +# Emitted when the netdev stream backend is connected
> +#
> +# @netdev-id: QEMU netdev id that is connected
> +# @addr: The destination address
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { "event": "NETDEV_STREAM_CONNECTED",
> +#      "data": { "netdev-id": "netdev0",
> +#                "addr": { "port": "47666", "ipv6": true,
> +#                          "host": "::1", "type": "inet" } },
> +#      "timestamp": { "seconds": 1666269863, "microseconds": 311222 } }
> +#
> +# or
> +#
> +# <- { "event": "NETDEV_STREAM_CONNECTED",
> +#      "data": { "netdev-id": "netdev0",
> +#                "addr": { "path": "/tmp/qemu0", "type": "unix" } },
> +#      "timestamp": { "seconds": 1666269706, "microseconds": 413651 } }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_CONNECTED',
> +  'data': { 'netdev-id': 'str',
> +            'addr': 'SocketAddress' } }
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

Schema looks good to me.


