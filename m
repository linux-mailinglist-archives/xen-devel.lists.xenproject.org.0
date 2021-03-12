Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8E338A14
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 11:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96972.183981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKf2b-0007jr-Pj; Fri, 12 Mar 2021 10:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96972.183981; Fri, 12 Mar 2021 10:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKf2b-0007jS-MO; Fri, 12 Mar 2021 10:29:09 +0000
Received: by outflank-mailman (input) for mailman id 96972;
 Fri, 12 Mar 2021 10:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDzj=IK=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lKf2a-0007jN-KL
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:29:08 +0000
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 807b39b7-7333-4481-a292-33b60467d891;
 Fri, 12 Mar 2021 10:29:04 +0000 (UTC)
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 83F722E11CD;
 Fri, 12 Mar 2021 13:29:02 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru [5.255.223.100])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 eSTCI30xQeA1-T1xOOk00; Fri, 12 Mar 2021 13:29:02 +0300
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net [2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by sas1-c3eab8bf7b15.qloud-c.yandex.net with LMTP id fGbK2v0HT4-SXSKEVvi
 for <lekiravi@yandex-team.ru>; Fri, 12 Mar 2021 13:28:51 +0300
Received: by vla1-4ea76ba32639.qloud-c.yandex.net with HTTP;
 Fri, 12 Mar 2021 13:28:50 +0300
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
X-Inumbo-ID: 807b39b7-7333-4481-a292-33b60467d891
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1615544942; bh=vlZFGZPWD0GFhxyZili3SYVtAffMSqSg9sin0+OeFHY=;
	h=Cc:Subject:Date:References:To:From:Message-Id;
	b=NEzkEWLk07ZYEqTlK/ZFrENpIVaE54u1lCSNA3oqBLRPnHdaFb5r/UiN1U0HVH+O2
	 ZEDEUTeRcSCQMB1uIfc20MKa0rUOXNJg3xldlyOD9uJ0lLJUuccVifqfuL+U1YHfeq
	 l/ms2wKqtbpGdEzrtXxoqh1EhPmZlJAIInLbXrSk=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Weil <sw@weilnetz.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Michael S. Tsirkin <mst@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paul Durrant <paul@xen.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Vincenzo Maffione <v.maffione@gmail.com>,
	"yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Luigi Rizzo <rizzo@iet.unipi.it>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
Subject: Re: [PATCH v7 0/5] Introducing QMP query-netdev command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 12 Mar 2021 13:29:00 +0300
Message-Id: <32641615544652@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8

ping

Patchew page: https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.ru

03.03.2021, 13:01, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
> This patch series introduces a new QMP command "query-netdev" to get
> information about currently attached backend network devices (netdevs).
>
> Also, since the "info_str" field of "NetClientState" is now deprecated,
> we no longer use it for netdevs, only for NIC/hubports.
>
> The HMP command "info network" now also uses QAPI structure inside.
>
> Usage example:
>
> -> { "execute": "query-netdev" }
> <- { "return": [
>          {
>              "listen": "127.0.0.1:90",
>              "type": "socket",
>              "peer-id": "hub0port1",
>              "id": "__org.qemu.net1"
>          },
>          {
>              "script": "/etc/qemu-ifup",
>              "downscript": "/etc/qemu-ifdown",
>              "ifname": "tap0",
>              "type": "tap",
>              "peer-id": "net5",
>              "vnet_hdr": true,
>              "id": "tap0"
>          },
>          {
>              "ipv6": true,
>              "ipv4": true,
>              "host": "10.0.2.2",
>              "ipv6-dns": "fec0::3",
>              "ipv6-prefix": "fec0::",
>              "net": "10.0.2.0/255.255.255.0",
>              "ipv6-host": "fec0::2",
>              "type": "user",
>              "peer-id": "net0",
>              "dns": "10.0.2.3",
>              "hostfwd": [
>                  {
>                      "str": "tcp::20004-:22"
>                  }
>              ],
>              "ipv6-prefixlen": 64,
>              "id": "netdev0",
>              "restrict": false
>          }
>      ]
>    }
>
> v6->v7:
> - Use macroses QAPI_LIST_PREPEND and QAPI_LIST_APPEND for lists.
> - Reorder NetBackend entries in alphabetical order.
>
> v5->v6:
> - Add QAPI visitor to generate info_str replacement directly from NetdevInfo.
> - Make info_str dynamically allocated.
> - Make commit messages more meaningful.
>
> v4->v5:
> - Enable qtest of query-netdevs for AVR and RX archs.
> - Bump "Since" version in QAPI to 6.0.
>
> v3->v4:
> - Rename "query-netdevs" to "query-netdev".
> - Copy netdev drivers to new QAPI enum "NetBackend".
>
> v2->v3:
> - Remove NIC and hubports from query-netdevs.
> - Remove several fields from NetdevInfo since they are unnecessary.
> - Rename field @peer to @peer-id.
> - Add support of vhost-vdpa.
> - Keep "info_str" for NIC/hubports, but remove it for netdevs.
>
> v1->v2:
> - Rewrite HMP "info network" to get information from results of QMP command.
> - Remove obsolete field "info_str" from "NetClientState".
>
> Alexey Kirillov (5):
>   qapi: net: Add query-netdev command
>   tests: Add tests for query-netdev command
>   net: Move NetClientState.info_str to dynamic allocations
>   hmp: Use QAPI NetdevInfo in hmp_info_network
>   net: Do not fill legacy info_str for backends
>
>  hw/net/xen_nic.c | 5 +-
>  include/net/net.h | 5 +-
>  include/qapi/hmp-output-visitor.h | 30 +++++
>  net/l2tpv3.c | 8 +-
>  net/net.c | 73 +++++++++--
>  net/netmap.c | 7 ++
>  net/slirp.c | 124 ++++++++++++++++++-
>  net/socket.c | 92 ++++++++++----
>  net/tap-win32.c | 10 +-
>  net/tap.c | 107 +++++++++++++++--
>  net/vde.c | 25 +++-
>  net/vhost-user.c | 20 +++-
>  net/vhost-vdpa.c | 15 ++-
>  qapi/hmp-output-visitor.c | 193 ++++++++++++++++++++++++++++++
>  qapi/meson.build | 1 +
>  qapi/net.json | 80 +++++++++++++
>  tests/qtest/meson.build | 3 +
>  tests/qtest/test-query-netdev.c | 120 +++++++++++++++++++
>  18 files changed, 856 insertions(+), 62 deletions(-)
>  create mode 100644 include/qapi/hmp-output-visitor.h
>  create mode 100644 qapi/hmp-output-visitor.c
>  create mode 100644 tests/qtest/test-query-netdev.c
>
> --
> 2.25.1


-- 
Alexey Kirillov
Yandex.Cloud


