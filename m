Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054E32B661
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:59:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92800.174922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOHu-0001Po-60; Wed, 03 Mar 2021 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92800.174922; Wed, 03 Mar 2021 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOHu-0001PS-2a; Wed, 03 Mar 2021 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 92800;
 Wed, 03 Mar 2021 09:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4P7r=IB=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lHOHs-0001PK-D5
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:59:24 +0000
Received: from forwardcorp1o.mail.yandex.net (unknown [2a02:6b8:0:1a2d::193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a408df4d-be1d-4b82-bccb-2f2374b324dd;
 Wed, 03 Mar 2021 09:59:21 +0000 (UTC)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 0F2642E159C;
 Wed,  3 Mar 2021 12:59:19 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Yde6ClwwhQ-xIxSMHKG; Wed, 03 Mar 2021 12:59:18 +0300
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:880d:3c89:fcd8:ca75])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w0BjtEeJGw-xInKm6qD; Wed, 03 Mar 2021 12:59:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a408df4d-be1d-4b82-bccb-2f2374b324dd
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614765558; bh=13Oc7DM6MmyK0eAsUQqEpz94FAGI8joGzd7oyzYKa04=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=lsjkEAg8bmshp+24u6p+ZrCu8qCeGK3XkCx20rlU2rdTOCNRpN0T+Bhk+rM8P65Wh
	 jXSOSAsrj8apT0LPvYY2kSBOK5KYY1i2vU+oP/Q5KDIKQZa79PIG8hu/77pmkQKOLv
	 YDFOsosnNqsIV6QltOwlhvMJfxDgW76hpjost+7c=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	yc-core@yandex-team.ru
Subject: [PATCH v7 0/5] Introducing QMP query-netdev command
Date: Wed,  3 Mar 2021 12:59:05 +0300
Message-Id: <20210303095910.78277-1-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a new QMP command "query-netdev" to get
information about currently attached backend network devices (netdevs).

Also, since the "info_str" field of "NetClientState" is now deprecated,
we no longer use it for netdevs, only for NIC/hubports.

The HMP command "info network" now also uses QAPI structure inside.

Usage example:

-> { "execute": "query-netdev" }
<- { "return": [
         {
             "listen": "127.0.0.1:90",
             "type": "socket",
             "peer-id": "hub0port1",
             "id": "__org.qemu.net1"
         },
         {
             "script": "/etc/qemu-ifup",
             "downscript": "/etc/qemu-ifdown",
             "ifname": "tap0",
             "type": "tap",
             "peer-id": "net5",
             "vnet_hdr": true,
             "id": "tap0"
         },
         {
             "ipv6": true,
             "ipv4": true,
             "host": "10.0.2.2",
             "ipv6-dns": "fec0::3",
             "ipv6-prefix": "fec0::",
             "net": "10.0.2.0/255.255.255.0",
             "ipv6-host": "fec0::2",
             "type": "user",
             "peer-id": "net0",
             "dns": "10.0.2.3",
             "hostfwd": [
                 {
                     "str": "tcp::20004-:22"
                 }
             ],
             "ipv6-prefixlen": 64,
             "id": "netdev0",
             "restrict": false
         }
     ]
   }

v6->v7:
- Use macroses QAPI_LIST_PREPEND and QAPI_LIST_APPEND for lists.
- Reorder NetBackend entries in alphabetical order.

v5->v6:
- Add QAPI visitor to generate info_str replacement directly from NetdevInfo.
- Make info_str dynamically allocated.
- Make commit messages more meaningful.

v4->v5:
- Enable qtest of query-netdevs for AVR and RX archs.
- Bump "Since" version in QAPI to 6.0.

v3->v4:
- Rename "query-netdevs" to "query-netdev".
- Copy netdev drivers to new QAPI enum "NetBackend".

v2->v3:
- Remove NIC and hubports from query-netdevs.
- Remove several fields from NetdevInfo since they are unnecessary.
- Rename field @peer to @peer-id.
- Add support of vhost-vdpa.
- Keep "info_str" for NIC/hubports, but remove it for netdevs.

v1->v2:
- Rewrite HMP "info network" to get information from results of QMP command.
- Remove obsolete field "info_str" from "NetClientState".

Alexey Kirillov (5):
  qapi: net: Add query-netdev command
  tests: Add tests for query-netdev command
  net: Move NetClientState.info_str to dynamic allocations
  hmp: Use QAPI NetdevInfo in hmp_info_network
  net: Do not fill legacy info_str for backends

 hw/net/xen_nic.c                  |   5 +-
 include/net/net.h                 |   5 +-
 include/qapi/hmp-output-visitor.h |  30 +++++
 net/l2tpv3.c                      |   8 +-
 net/net.c                         |  73 +++++++++--
 net/netmap.c                      |   7 ++
 net/slirp.c                       | 124 ++++++++++++++++++-
 net/socket.c                      |  92 ++++++++++----
 net/tap-win32.c                   |  10 +-
 net/tap.c                         | 107 +++++++++++++++--
 net/vde.c                         |  25 +++-
 net/vhost-user.c                  |  20 +++-
 net/vhost-vdpa.c                  |  15 ++-
 qapi/hmp-output-visitor.c         | 193 ++++++++++++++++++++++++++++++
 qapi/meson.build                  |   1 +
 qapi/net.json                     |  80 +++++++++++++
 tests/qtest/meson.build           |   3 +
 tests/qtest/test-query-netdev.c   | 120 +++++++++++++++++++
 18 files changed, 856 insertions(+), 62 deletions(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c
 create mode 100644 tests/qtest/test-query-netdev.c

-- 
2.25.1


