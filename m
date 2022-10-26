Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D660E91C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 21:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430761.682810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onmFi-00049z-RL; Wed, 26 Oct 2022 19:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430761.682810; Wed, 26 Oct 2022 19:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onmFi-00047T-OU; Wed, 26 Oct 2022 19:39:50 +0000
Received: by outflank-mailman (input) for mailman id 430761;
 Wed, 26 Oct 2022 19:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctE9=23=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1onmFh-00047M-Bw
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 19:39:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23e33cf-5565-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 21:39:47 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-w1HIvh77NyKPmCwgOdp3fg-1; Wed, 26 Oct 2022 15:39:44 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso4994115wrb.18
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 12:39:44 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b0022ae401e9e0sm6243967wrc.78.2022.10.26.12.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:39:41 -0700 (PDT)
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
X-Inumbo-ID: f23e33cf-5565-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666813186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUFP9VXXAZ+kSQdE/F04mInbZThaEABWviF23B44Qo8=;
	b=DTjSHT6FnxB3pK9COBtRi+UKMfTzGZ18znCFGzANyPcTi2dYMyqJiprBKdIm9vXGgzFNKM
	y0YJqkxq1YGIiHi1c2lEJGC9m5uTcXD+3nFgqUv4qkaUTcybkusUJlBMTkn0nfufch+ATW
	CkKoo60cmM9hA1n2xgHPFOdfd/dF96A=
X-MC-Unique: w1HIvh77NyKPmCwgOdp3fg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUFP9VXXAZ+kSQdE/F04mInbZThaEABWviF23B44Qo8=;
        b=Nsd7hubH0VzNUsGWecuVSeBgJw+J+a+cd2qDgwvrgfDOapAymF7QF7sf8IMZSR1qVb
         ipK3K0MgMGBYtRyiaf1FSxRD4cA1BEDHAPMCmSRc9VIX3Jj7P+i/SvRw7B2cjLrzmn87
         PqIoJrnyHVX3Km6x5Hm+U3WkHsMamc71IElK4rMu01YlIZqsX4/Ad2Gm3uD37dIO3ys/
         auAnj8D3+D2cwSf358iezXx+IukmToATothg0dHkGoooDuxksAWX9dT32MePQPXWg6nx
         sS4FlPvz+zYSJklznzPJlXu0iS/Nt4BpOdkZoNd9xBVBqHdUAXfh1yhSOJuqUVww29Ga
         9wRA==
X-Gm-Message-State: ACrzQf1bcwWNKIz/RYZysFuEV4jiBImxUfZmSZUSnt8xE2tt6pZ3YeTn
	ZG8t0vm8YC9OBpUqWh2jp2fdNJ1YZZua402BkjgIOlE9sf1Bgw6ikUGw9Ij1k/PAXHDjRvE+EXu
	GZb9x9Z6rBxAdVG6rnGowfycuZag=
X-Received: by 2002:a05:600c:4e8a:b0:3c6:de26:9d6e with SMTP id f10-20020a05600c4e8a00b003c6de269d6emr3615258wmq.117.1666813182426;
        Wed, 26 Oct 2022 12:39:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XpfNr5DFiR2iaFQU1FRspM6+jmQxlo4TAtOlDYDi8YgHu1uoAKiKMqXZOqN6x/jK6CdR3jg==
X-Received: by 2002:a05:600c:4e8a:b0:3c6:de26:9d6e with SMTP id f10-20020a05600c4e8a00b003c6de269d6emr3615242wmq.117.1666813182194;
        Wed, 26 Oct 2022 12:39:42 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:39:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Greg Kurz <groug@kaod.org>, Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	xen-devel@lists.xenproject.org,
	Ralph Schmieder <ralph.schmieder@gmail.com>,
	Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v11 00/17] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20221026153926-mutt-send-email-mst@kernel.org>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 11, 2022 at 10:05:22PM +0200, Laurent Vivier wrote:
> "-netdev socket" only supports inet sockets.
> 
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.


Acked-by: Michael S. Tsirkin <mst@redhat.com>


this is Jason's area though.

> As discussed in:
> 
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> 
> This series adds support of unix socket type using SocketAddress QAPI structure.
> 
> Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).
> 
> Some examples of CLI syntax:
> 
>   for TCP:
> 
>   -netdev stream,id=socket0,addr.type=inet,addr.host=localhost,addr.port=1234
>   -netdev stream,id=socket0,server=off,addr.type=inet,addr.host=localhost,addr.port=1234
> 
>   -netdev dgram,id=socket0,\
>           local.type=inet,local.host=localhost,local.port=1234,\
>           remote.type=inet,remote.host=localhost,remote.port=1235
> 
>   for UNIX:
> 
>   -netdev stream,id=socket0,addr.type=unix,addr.path=/tmp/qemu0
>   -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=/tmp/qemu0
> 
>   -netdev dgram,id=socket0,\
>           local.type=unix,local.path=/tmp/qemu0,\
>           remote.type=unix,remote.path=/tmp/qemu1
> 
>   for FD:
> 
>   -netdev stream,id=socket0,addr.type=fd,addr.str=4
>   -netdev stream,id=socket0,server=off,addr.type=fd,addr.str=5
> 
>   -netdev dgram,id=socket0,local.type=fd,addr.str=4
> 
> v11:
>   - use qemu_set_info_str() in hw/net/xen_nic.c
>   - fix link_down state in stream client mode
>   - cleanup error case in net_stream_receive()
>   - update qapi version to 7.2
> 
> v10:
>   - add Red Hat copyright
>   - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD
>   - remove redundente _stream / _dgram in functions name
>   - move net_dgram_init() into net_init_dgram()
>   - address Thomas' comments on qtest
>   - add a function qemu_set_info_str() to set info string
>   - tested stream netdev with fd type using qrap/passt and
>     "-netdev stream,addr.type=fd,server=off,addr.str=5,id=netdev0"
> 
> v9:
>   - add events to report stream connection/disconnection
>   - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()
>     net_dgram_connect() and net_dgram_send() that are only
>     needed by net/stream.c
>   - remove from net/stream.c send_fn
>   - add Red Hat copyright
>   - add original net/socket.c Stefano's patch (EINVAL)
> 
> v8:
>   - test ipv4 and ipv6 parameters (stream inet)
>   - test abstract parameter (stream unix)
>   - add SocketAddressInet supported parameters in qemu-options.hx
>     (only stream, supported by the move to QIO)
>   - with qio_channel_writev() replace (ret == -1 && errno == EAGAIN)
>     by (ret == QIO_CHANNEL_ERR_BLOCK)
> 
> v7:
>   - add qtests
>   - update parameters table in net.json
>   - update socket_uri() and socket_parse()
> 
> v6:
>   - s/netdev option/-netdev option/ PATCH 4
>   - s/ / /
>   - update @NetdevStreamOptions and @NetdevDgramOptions comments
>   - update PATCH 4 description message
>   - add missing return in error case for unix stream socket
>   - split socket_uri() patch: move and rename, then change content
> 
> v5:
>   - remove RFC prefix
>   - put the change of net_client_parse() into its own patch (exit() in the
>     function)
>   - update comments regarding netdev_is_modern() and netdev_parse_modern()
>   - update error case in net_stream_server_init()
>   - update qemu-options.hx with unix type
>   - fix HMP "info network" with unix protocol/server side.
> 
> v4:
>   - net_client_parse() fails with exit() rather than with return.
>   - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
>     own line in qapi/net.json
>   - add a comment in qapi/net.json about parameters usage
>   - move netdev_is_modern() check to qemu_init()
>   - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
>     to parse parameters and detect type value.
>   - add a blank line after copyright comment
> 
> v3:
>   - remove support of "-net" for dgram and stream. They are only
>     supported with "-netdev" option.
>   - use &error_fatal directly in net_client_inits()
>   - update qemu-options.hx
>   - move to QIO for stream socket
> 
> v2:
>   - use "stream" and "dgram" rather than "socket-ng,mode=stream"
>     and ""socket-ng,mode=dgram"
>   - extract code to bypass qemu_opts_parse_noisily() to
>     a new patch
>   - do not ignore EINVAL (Stefano)
>   - fix "-net" option
> 
> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> CC: Stefano Brivio <sbrivio@redhat.com>
> CC: Daniel P. Berrangé <berrange@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> 
> Laurent Vivier (15):
>   net: introduce convert_host_port()
>   net: remove the @errp argument of net_client_inits()
>   net: simplify net_client_parse() error management
>   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
>   net: introduce qemu_set_info_str() function
>   qapi: net: add stream and dgram netdevs
>   net: stream: add unix socket
>   net: dgram: make dgram_dst generic
>   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
>   net: dgram: add unix socket
>   qemu-sockets: move and rename SocketAddress_to_str()
>   qemu-sockets: update socket_uri() and socket_parse()  to be consistent
>   net: stream: move to QIO to enable additional parameters
>   tests/qtest: netdev: test stream and dgram backends
>   net: stream: add QAPI events to report connection state
> 
> Stefano Brivio (2):
>   net: socket: Don't ignore EINVAL on netdev socket connection
>   net: stream: Don't ignore EINVAL on netdev socket connection
> 
>  hmp-commands.hx             |   2 +-
>  hw/net/xen_nic.c            |   5 +-
>  include/net/net.h           |   7 +-
>  include/qemu/sockets.h      |   4 +-
>  meson                       |   2 +-
>  monitor/hmp-cmds.c          |  23 +-
>  net/clients.h               |   6 +
>  net/dgram.c                 | 622 ++++++++++++++++++++++++++++++++++++
>  net/hub.c                   |   2 +
>  net/l2tpv3.c                |   3 +-
>  net/meson.build             |   2 +
>  net/net.c                   | 186 ++++++++---
>  net/slirp.c                 |   5 +-
>  net/socket.c                |  36 +--
>  net/stream.c                | 389 ++++++++++++++++++++++
>  net/tap-win32.c             |   3 +-
>  net/tap.c                   |  13 +-
>  net/vde.c                   |   3 +-
>  net/vhost-user.c            |   3 +-
>  net/vhost-vdpa.c            |   2 +-
>  qapi/net.json               | 112 ++++++-
>  qemu-options.hx             |  14 +
>  softmmu/vl.c                |  16 +-
>  tests/qtest/meson.build     |   1 +
>  tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++
>  util/qemu-sockets.c         |  25 ++
>  26 files changed, 1771 insertions(+), 132 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>  create mode 100644 tests/qtest/netdev-socket.c
> 
> -- 
> 2.37.3
> 


