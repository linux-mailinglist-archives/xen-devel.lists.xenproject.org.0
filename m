Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07970204EAA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 12:00:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnfiK-0000lL-Pi; Tue, 23 Jun 2020 09:59:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6dc=AE=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1jnfiH-0000kc-O2
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 09:59:34 +0000
X-Inumbo-ID: 397c5d9a-b538-11ea-8496-bc764e2007e4
Received: from forwardcorp1p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b6:217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 397c5d9a-b538-11ea-8496-bc764e2007e4;
 Tue, 23 Jun 2020 09:59:28 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id A8CB82E17B0;
 Tue, 23 Jun 2020 12:59:26 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 GETtGuevOX-xHaiKNqk; Tue, 23 Jun 2020 12:59:26 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1592906366; bh=lq34GxPpe2c6C6ooW25hm9bZ9x+6Rh5Aa8JRJt82yb4=;
 h=Cc:Subject:Date:References:To:From:Message-Id;
 b=QTttHJxXJzB2mYT3Pe5fc4qZHJk70g2aurRDCoJkpwIKVMSgJtFLxE4OP1yoDxapX
 jGr++s7uTTPfWBKQUnA6NJM4gztQlonVdcXhnJBE+pSaWQJ5qxtFWm97VW+dc+uQTI
 SjPCejw0wPep6adeHAdhCzb3DEOm6oBahzLbH+TQ=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1o.mail.yandex.net (localhost [::1])
 by mxbackcorp1o.mail.yandex.net with LMTP id 1vFs6nmNIF-1upkCpTv
 for <lekiravi@yandex-team.ru>; Tue, 23 Jun 2020 12:59:07 +0300
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Tue, 23 Jun 2020 12:59:07 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <huth@tuxfamily.org>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
 <87y2sff1qo.fsf@dusky.pond.sub.org>
 <1041781583412683@myt4-457577cc370d.qloud-c.yandex.net>
Subject: Re: [PATCH v2 1/4] qapi: net: Add query-netdevs command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 23 Jun 2020 12:59:17 +0300
Message-Id: <126621592905028@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Eric Blake <eblake@redhat.com>,
 Paul Durrant <paul@xen.org>, Joel Stanley <joel@jms.id.au>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ping

Sorry, I lost a point in discussion.

As I wrote early, main reason for mix frontend and backend devices is for
easy recreation of current state of network. As we have common structure
for all netdevs (`struct NetClientState`), I think, that it'll be good
idea to iterate using `net_clients`.
There is no such trouble to split `query-netdevs` by two, for example,
`query-front-netdevs` and `query-back-netdevs`, but in my opinion it'll
break consistancy in getting links between netdevs.

05.03.2020, 17:26, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
> 05.03.2020, 15:03, "Markus Armbruster" <armbru@redhat.com>:
>>  Alexey Kirillov <lekiravi@yandex-team.ru> writes:
>>
>>>   Add a qmp command that provides information about currently attached
>>>   network devices and their configuration.
>>
>>  Closes a gap in QMP; appreciated!
>>
>>>   Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>>
>>  [...]
>>>   diff --git a/qapi/net.json b/qapi/net.json
>>>   index 1cb9a7d782..4f329a1de0 100644
>>>   --- a/qapi/net.json
>>>   +++ b/qapi/net.json
>>>   @@ -750,3 +750,92 @@
>>>    ##
>>>    { 'event': 'FAILOVER_NEGOTIATED',
>>>      'data': {'device-id': 'str'} }
>>>   +
>>>   +##
>>>   +# @NetdevInfo:
>>>   +#
>>>   +# Configuration of a network device.
>>>   +#
>>>   +# @id: Device identifier.
>>>   +#
>>>   +# @type: Specify the driver used for interpreting remaining arguments.
>>>   +#
>>>   +# @peer: Connected network device.
>>
>>  @peer is optional. I assume its present when the device is connected
>>  (frontend to backend or vice versa). Correct?
>
> Yes, this field stores connected frontend/backend device @id.
>
>>>   +#
>>>   +# @queues-count: Number of queues.
>>
>>  We use plain @queues elsewhere in the schema.
>
> It can conflict with fields inside Netdev*Options, isn't it?
>
>>>   +#
>>>   +# @hub: hubid of hub, if connected to.
>>
>>  How @hub is related to @peer is not quite obvious to me. Can you give
>>  an example where @hub is present?
>
> NetdevHubPortOptions has an option @hubid. @hub gives that id, if
> netdev is connected to the hub via hubport. As example:
>
> HMP:
>
> hub 0
>  \ hub0port1: socket.0: index=0,type=socket,
>  \ hub0port0: virtio-net-pci.0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
>
> QMP:
>
> [
>   {
>     "peer": "hub0port0",
>     "netdev": "hub0port0",
>     "hub": 0,
>     "model": "virtio-net-pci",
>     "macaddr": "52:54:00:12:34:56",
>     "type": "nic",
>     "queues-count": 1,
>     "id": "virtio-net-pci.0"
>   },
>   {
>     "peer": "hub0port1",
>     "listen": "127.0.0.1:90",
>     "hub": 0,
>     "type": "socket",
>     "queues-count": 1,
>     "id": "socket.0"
>   },
>   {
>     "peer": "socket.0",
>     "netdev": "socket.0",
>     "hub": 0,
>     "hubid": 0,
>     "type": "hubport",
>     "queues-count": 1,
>     "id": "hub0port1"
>   },
>   {
>     "peer": "virtio-net-pci.0",
>     "netdev": "virtio-net-pci.0",
>     "hub": 0,
>     "hubid": 0,
>     "type": "hubport",
>     "queues-count": 1,
>     "id": "hub0port0"
>   }
> ]
>
>>>   +#
>>>   +# @perm-mac: Original MAC address.
>>
>>  What does "perm-" mean?
>>
>>  It's optional. When exactly is it present?
>
> @perm-mac is the permanent (original) MAC address. It only used
> for nic, because most of nic realizations can change MAC at
> runtime and/or reset it to default (permanent) value.
>
>>>   +#
>>>   +# Since: 5.0
>>>   +##
>>>   +{ 'union': 'NetdevInfo',
>>>   + 'base': { 'id': 'str',
>>>   + 'type': 'NetClientDriver',
>>>   + '*peer': 'str',
>>>   + 'queues-count': 'int',
>>>   + '*hub': 'int',
>>>   + '*perm-mac': 'str' },
>>>   + 'discriminator': 'type',
>>>   + 'data': {
>>>   + 'nic': 'NetLegacyNicOptions',
>>>   + 'user': 'NetdevUserOptions',
>>>   + 'tap': 'NetdevTapOptions',
>>>   + 'l2tpv3': 'NetdevL2TPv3Options',
>>>   + 'socket': 'NetdevSocketOptions',
>>>   + 'vde': 'NetdevVdeOptions',
>>>   + 'bridge': 'NetdevBridgeOptions',
>>>   + 'hubport': 'NetdevHubPortOptions',
>>>   + 'netmap': 'NetdevNetmapOptions',
>>>   + 'vhost-user': 'NetdevVhostUserOptions' } }
>>
>>  This is a copy of union 'Netdev' with a few additional common members
>>  (@peer, @queues-count, @hub, @perm-mac). I can't see how to avoid the
>>  duplication without adding nesting on the wire.
>>
>>>   +
>>>   +##
>>>   +# @query-netdevs:
>>>   +#
>>>   +# Get a list of @NetdevInfo for all virtual network devices.
>>>   +#
>>>   +# Returns: a list of @NetdevInfo describing each virtual network device.
>>>   +#
>>>   +# Since: 5.0
>>>   +#
>>>   +# Example:
>>>   +#
>>>   +# -> { "execute": "query-netdevs" }
>>>   +# <- { "return": [
>>>   +# {
>>>   +# "peer": "netdev0",
>>>   +# "netdev": "netdev0",
>>>   +# "perm-mac": "52:54:00:12:34:56"
>>>   +# "model": "virtio-net-pci",
>>>   +# "macaddr": "52:54:00:12:34:56",
>>>   +# "queues-count": 1,
>>>   +# "type": "nic",
>>>   +# "id": "net0"
>>>   +# },
>>>   +# {
>>>   +# "peer": "net0",
>>>   +# "ipv6": true,
>>>   +# "ipv4": true,
>>>   +# "host": "10.0.2.2",
>>>   +# "queues-count": 1,
>>>   +# "ipv6-dns": "fec0::3",
>>>   +# "ipv6-prefix": "fec0::",
>>>   +# "net": "10.0.2.0/255.255.255.0",
>>>   +# "ipv6-host": "fec0::2",
>>>   +# "type": "user",
>>>   +# "dns": "10.0.2.3",
>>>   +# "hostfwd": [
>>>   +# {
>>>   +# "str": "tcp::20004-:22"
>>>   +# }
>>>   +# ],
>>>   +# "ipv6-prefixlen": 64,
>>>   +# "id": "netdev0",
>>>   +# "restrict": false
>>>   +# }
>>>   +# ]
>>>   +# }
>>>   +#
>>>   +##
>>>   +{ 'command': 'query-netdevs', 'returns': ['NetdevInfo'] }
>>
>>  Like HMP "info network" and -net, this mixes frontends ("type": "nic")
>>  and backends. Unlike query-chardev and query-block. Hmm.
>>
>>  A long time ago, all we had was -net: "-net nic" for configuring
>>  frontends, "-net none" for suppressing a default frontend + backend, and
>>  "-net anything-else" for configuring backends. "info network" showed
>>  the stuff set up with -net.
>>
>>  In v0.12, we got -device for configuring frontends, and -netdev for
>>  backends. -netdev is like -net less "none", "nic", and the hub
>>  weirdness. "info network" was extended to also show all this.
>>
>>  In v2.12, we got -nic, replacing -net nic.
>>
>>  Unless I'm missing something, -net is just for backward compatibility
>>  now.
>>
>>  What's the use case for query-networks reporting frontends?
>
> In my vision, new QMP command is the replacement for old
> HMP command. It must provide information about all
> network devices, mainly for recreate similar net topology.
> Currently, there are no differrence between fronted and
> backend devices in context of my command, because
> all of them use the same interface in NetClientState.
>
>>
>
> --
> Alexey Kirillov
> Yandex.Cloud

-- 
Alexey Kirillov
Yandex.Cloud



