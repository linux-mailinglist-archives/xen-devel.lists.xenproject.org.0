Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530BC32A8B5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92536.174456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9Lo-000154-9u; Tue, 02 Mar 2021 18:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92536.174456; Tue, 02 Mar 2021 18:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9Lo-00014f-67; Tue, 02 Mar 2021 18:02:28 +0000
Received: by outflank-mailman (input) for mailman id 92536;
 Tue, 02 Mar 2021 18:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwSr=IA=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lH9Lm-00014a-8k
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 18:02:26 +0000
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fdcadd3-8d89-4f3e-a28e-69a87c83f820;
 Tue, 02 Mar 2021 18:02:23 +0000 (UTC)
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5F3452E159D;
 Tue,  2 Mar 2021 21:02:21 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AabajxEOFm-2JxSLNDf; Tue, 02 Mar 2021 21:02:21 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2Io02V9K; Tue, 02 Mar 2021 21:02:19 +0300
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
X-Inumbo-ID: 0fdcadd3-8d89-4f3e-a28e-69a87c83f820
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614708141; bh=mWKMmE6/68gzbOL2eN6sq4/sF3RMZWcJV9Nbs34UHA8=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=lbBmMabdS/ETQnzfWQmLx3rqK7Z0qGw/iIzMGVpEnz3zW1D1YoTC1ZMVVagWGearw
	 Xftt/sFk8W4RDClGqymlft+mr27k+vTp59n0nREEdJqofysA4FEN4dv4o3MeMFll1P
	 1CjqNa9fVCXSNTJcsnNne7bCKjqWjR2639SQR4B4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
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
Subject: [PATCH v6 0/5] Introducing QMP query-netdev command
Date: Tue,  2 Mar 2021 21:02:00 +0300
Message-Id: <20210302180205.5009-1-lekiravi@yandex-team.ru>
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
 net/net.c                         |  75 ++++++++++--
 net/netmap.c                      |   7 ++
 net/slirp.c                       | 126 ++++++++++++++++++-
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
 18 files changed, 860 insertions(+), 62 deletions(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c
 create mode 100644 tests/qtest/test-query-netdev.c

-- 
2.25.1


