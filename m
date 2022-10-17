Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24F60101E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 15:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424398.671781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQ5g-0007Mv-Lg; Mon, 17 Oct 2022 13:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424398.671781; Mon, 17 Oct 2022 13:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQ5g-0007KQ-J6; Mon, 17 Oct 2022 13:23:36 +0000
Received: by outflank-mailman (input) for mailman id 424398;
 Mon, 17 Oct 2022 13:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9T87=2S=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1okQ5f-0007KK-0y
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 13:23:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b54c9b-4e1e-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 15:23:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-CRqCwp25Oc6MqzgD10q8nw-1; Mon, 17 Oct 2022 09:23:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169002800467;
 Mon, 17 Oct 2022 13:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B64AD2027063;
 Mon, 17 Oct 2022 13:23:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A895421E691D; Mon, 17 Oct 2022 15:23:26 +0200 (CEST)
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
X-Inumbo-ID: e5b54c9b-4e1e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666013012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LHpPs+irzkXe85yd4/kosVsQIrZAQ/OsKy5vMtWSLo=;
	b=FR0LJDbelsRcV9PEicefmfDJbXSSDyF5lFSmHx+wWNHmZgT1KEIN998RSWNYDt7kjdngis
	OygZtmmVk6Ss764wEFFy1eP6EbUKhz7Uad1zQvq+cQ0mIXXDwY/fy+xo29tS/uCXqAFRiT
	z4+48NVlu9tcJWf4wyscJc8KDW73Az0=
X-MC-Unique: CRqCwp25Oc6MqzgD10q8nw-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Jason Wang <jasowang@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Greg Kurz <groug@kaod.org>,  Eric
 Blake <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Thomas Huth
 <thuth@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Paul
 Durrant <paul@xen.org>,  David Gibson <david@gibson.dropbear.id.au>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
References: <20221011200539.1486809-1-lvivier@redhat.com>
	<20221011200539.1486809-18-lvivier@redhat.com>
Date: Mon, 17 Oct 2022 15:23:26 +0200
In-Reply-To: <20221011200539.1486809-18-lvivier@redhat.com> (Laurent Vivier's
	message of "Tue, 11 Oct 2022 22:05:39 +0200")
Message-ID: <87mt9u4m9d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Laurent Vivier <lvivier@redhat.com> writes:

> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>
> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
> address.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  net/stream.c  | 11 +++++++++--
>  qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/net/stream.c b/net/stream.c
> index 0293e38e5b57..821ae3265356 100644
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
> +        qapi_event_send_netdev_stream_eoc(s->nc.name);
> +
>          return G_SOURCE_REMOVE;
>      }
>      buf = buf1;
> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>      g_assert(addr != NULL);
>      uri = socket_uri(addr);
>      qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>      qapi_free_SocketAddress(addr);
>  
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
>  }
>  
>  static void net_stream_server_listening(QIOTask *task, gpointer opaque)
> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>      g_assert(addr != NULL);
>      uri = socket_uri(addr);
>      qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>  
>      ret = qemu_socket_try_set_nonblock(sioc->fd);
>      if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>          qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>                            addr->u.fd.str, -ret);
> +        g_free(uri);
>          qapi_free_SocketAddress(addr);
>          goto error;
>      }
> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>                                              s, NULL);
>      s->nc.link_down = false;
>  
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
> +
>      return;
>  error:
>      object_unref(OBJECT(s->ioc));
> diff --git a/qapi/net.json b/qapi/net.json
> index 6a1a49749294..69f83bceff3f 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -895,3 +895,49 @@
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
> +# @uri: The Uniform Resource Identifier identifying the destination address

Is an URI the appropriate representation here?  It's not how we specify
such addresses elsewhere in QAPI/QMP...

> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
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
> +# @NETDEV_STREAM_EOC:

What does "EOC" mean?

Could this be named NETDEV_STREAM_DISCONNECTED, for symmetry with
NETDEV_STREAM_CONNECTED?

> +#
> +# Emitted when the netdev stream backend is disconnected
> +#
> +# @netdev-id: QEMU netdev id that is disconnected
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_EOC',
> +#      'data': {'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_EOC',
> +  'data': { 'netdev-id': 'str' } }


