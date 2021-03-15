Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C462333AD32
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 09:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97867.185675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLiRn-0007aR-GX; Mon, 15 Mar 2021 08:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97867.185675; Mon, 15 Mar 2021 08:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLiRn-0007a2-DK; Mon, 15 Mar 2021 08:19:31 +0000
Received: by outflank-mailman (input) for mailman id 97867;
 Mon, 15 Mar 2021 08:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LiIB=IN=redhat.com=jasowang@srs-us1.protection.inumbo.net>)
 id 1lLiRl-0007Zx-9k
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 08:19:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5679f1a9-fdce-4205-86d9-f5cf756af2c9;
 Mon, 15 Mar 2021 08:19:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-JTYACgGdPaStKMrDzo-FLQ-1; Mon, 15 Mar 2021 04:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B0E93920;
 Mon, 15 Mar 2021 08:19:19 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-245.pek2.redhat.com
 [10.72.12.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4292E501D4;
 Mon, 15 Mar 2021 08:19:02 +0000 (UTC)
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
X-Inumbo-ID: 5679f1a9-fdce-4205-86d9-f5cf756af2c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615796368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rRxAEJP0yb8hy5xLsHkEvRLysybMMWDqJwpU7ye9LI=;
	b=FRnHwA1mAbJCTuuN3rKx8pCngIS7aV3rgcM5H4Ums3BIBR7MP4Xu4nsnzOFoJVd5y8PEOr
	npD9hD1+ZkUymYT8UpzUiPR59nckUYTVvq6S9lh5dIK5oqhX5c3G5QFPuQfRedaA/4pz1+
	oERSDfj/ykT4sqHlclhC8O8GqHS7caM=
X-MC-Unique: JTYACgGdPaStKMrDzo-FLQ-1
Subject: Re: [PATCH v7 0/5] Introducing QMP query-netdev command
To: Alexey Kirillov <lekiravi@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paul Durrant <paul@xen.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Vincenzo Maffione <v.maffione@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
 <32641615544652@mail.yandex-team.ru>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <583ade39-fd95-b5af-6d8f-c2126e341cbe@redhat.com>
Date: Mon, 15 Mar 2021 16:19:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32641615544652@mail.yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/3/12 下午6:29, Alexey Kirillov 写道:
> ping
>
> Patchew page: https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.ru


Applied.

Thanks


>
> 03.03.2021, 13:01, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
>> This patch series introduces a new QMP command "query-netdev" to get
>> information about currently attached backend network devices (netdevs).
>>
>> Also, since the "info_str" field of "NetClientState" is now deprecated,
>> we no longer use it for netdevs, only for NIC/hubports.
>>
>> The HMP command "info network" now also uses QAPI structure inside.
>>
>> Usage example:
>>
>> -> { "execute": "query-netdev" }
>> <- { "return": [
>>           {
>>               "listen": "127.0.0.1:90",
>>               "type": "socket",
>>               "peer-id": "hub0port1",
>>               "id": "__org.qemu.net1"
>>           },
>>           {
>>               "script": "/etc/qemu-ifup",
>>               "downscript": "/etc/qemu-ifdown",
>>               "ifname": "tap0",
>>               "type": "tap",
>>               "peer-id": "net5",
>>               "vnet_hdr": true,
>>               "id": "tap0"
>>           },
>>           {
>>               "ipv6": true,
>>               "ipv4": true,
>>               "host": "10.0.2.2",
>>               "ipv6-dns": "fec0::3",
>>               "ipv6-prefix": "fec0::",
>>               "net": "10.0.2.0/255.255.255.0",
>>               "ipv6-host": "fec0::2",
>>               "type": "user",
>>               "peer-id": "net0",
>>               "dns": "10.0.2.3",
>>               "hostfwd": [
>>                   {
>>                       "str": "tcp::20004-:22"
>>                   }
>>               ],
>>               "ipv6-prefixlen": 64,
>>               "id": "netdev0",
>>               "restrict": false
>>           }
>>       ]
>>     }
>>
>> v6->v7:
>> - Use macroses QAPI_LIST_PREPEND and QAPI_LIST_APPEND for lists.
>> - Reorder NetBackend entries in alphabetical order.
>>
>> v5->v6:
>> - Add QAPI visitor to generate info_str replacement directly from NetdevInfo.
>> - Make info_str dynamically allocated.
>> - Make commit messages more meaningful.
>>
>> v4->v5:
>> - Enable qtest of query-netdevs for AVR and RX archs.
>> - Bump "Since" version in QAPI to 6.0.
>>
>> v3->v4:
>> - Rename "query-netdevs" to "query-netdev".
>> - Copy netdev drivers to new QAPI enum "NetBackend".
>>
>> v2->v3:
>> - Remove NIC and hubports from query-netdevs.
>> - Remove several fields from NetdevInfo since they are unnecessary.
>> - Rename field @peer to @peer-id.
>> - Add support of vhost-vdpa.
>> - Keep "info_str" for NIC/hubports, but remove it for netdevs.
>>
>> v1->v2:
>> - Rewrite HMP "info network" to get information from results of QMP command.
>> - Remove obsolete field "info_str" from "NetClientState".
>>
>> Alexey Kirillov (5):
>>    qapi: net: Add query-netdev command
>>    tests: Add tests for query-netdev command
>>    net: Move NetClientState.info_str to dynamic allocations
>>    hmp: Use QAPI NetdevInfo in hmp_info_network
>>    net: Do not fill legacy info_str for backends
>>
>>   hw/net/xen_nic.c | 5 +-
>>   include/net/net.h | 5 +-
>>   include/qapi/hmp-output-visitor.h | 30 +++++
>>   net/l2tpv3.c | 8 +-
>>   net/net.c | 73 +++++++++--
>>   net/netmap.c | 7 ++
>>   net/slirp.c | 124 ++++++++++++++++++-
>>   net/socket.c | 92 ++++++++++----
>>   net/tap-win32.c | 10 +-
>>   net/tap.c | 107 +++++++++++++++--
>>   net/vde.c | 25 +++-
>>   net/vhost-user.c | 20 +++-
>>   net/vhost-vdpa.c | 15 ++-
>>   qapi/hmp-output-visitor.c | 193 ++++++++++++++++++++++++++++++
>>   qapi/meson.build | 1 +
>>   qapi/net.json | 80 +++++++++++++
>>   tests/qtest/meson.build | 3 +
>>   tests/qtest/test-query-netdev.c | 120 +++++++++++++++++++
>>   18 files changed, 856 insertions(+), 62 deletions(-)
>>   create mode 100644 include/qapi/hmp-output-visitor.h
>>   create mode 100644 qapi/hmp-output-visitor.c
>>   create mode 100644 tests/qtest/test-query-netdev.c
>>
>> --
>> 2.25.1
>
> -- 
> Alexey Kirillov
> Yandex.Cloud
>
>


