Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7F254C4F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:37:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpl-0005Xt-4E; Thu, 27 Aug 2020 17:37:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpk-00056c-0f
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:37:08 +0000
X-Inumbo-ID: 41af675b-6ad5-49c6-80bd-fe18e06e4b8e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41af675b-6ad5-49c6-80bd-fe18e06e4b8e;
 Thu, 27 Aug 2020 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mxW6XcFyzzb2y4xRJpNGbk7zgqZxTI8HkQCHhXJFMqA=;
 b=If7WI1aaqMqQEksYK9gRZUMnKMS77O/W902Y2v6Kjbgpd5VwiuvRxpf0
 J7gBToTX36FEJ9Ez4hey5HdTNDOGU9opmj//r9E7B5N7pmjgC64V+Q9ZS
 PgN6ni2jb7gdC1KhrZDTRnFvcJ2h5rCjUX1LWJtilYa1IjlMSlsWp+i4p I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: h2sP2WYtcHLWfI1GLQnVeHzVJW3CZIKu5JYZrI/P80nyYbXeeaRRtKi3ZGKhp3EldGZPxP5fWC
 ivEORRsQyKHBmBHpd0lBcj5prRgOGYs5UHr9JsX/tH3PulsoYDaUYtUY1Rbt1c4R4ZwZbb2qF+
 xWBx0jvbX9cxMTumdnXbesMdQOH51Tgf4fk/P2SfIifyssokrUIiVxB1MdJB6IqxvXHsSiOx52
 wQiE+ChvKehM/LYPjoV9V9NIg5yjqYF+b9WVPqw0N/s5141FyZ7VXQbs+EkjLh1RWu82m+oWiw
 /y8=
X-SBRS: 2.7
X-MesageID: 25789258
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25789258"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, "Signed-off-by : Juergen Gross"
 <jgross@suse.com>
Subject: [PATCH v1 0/9] tools/ocaml: use gnttab instead of map_foreign_range
Date: Thu, 27 Aug 2020 18:35:51 +0100
Message-ID: <cover.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

oxenstored currently depends on 2 unstable interfaces from libxenctrl:
* Xenctrl.map_foreign_range
* Xenctrl.domain_getinfo

It is desirable to reduce the use of unstable APIs in xenstored, so that
an update to the hypervisor doesn't break xenstored.

The C version of xenstored has dropped the usage of map_foreign_range in:
38eeb3864de40aa568c48f9f26271c141c62b50b tools/xenstored: Drop mapping of the ring via foreign map
This also made the MFN in oxenstored redundant, which was dropped in:
122b52230aa5b79d65e18b8b77094027faa2f8e2 tools/xenstore: don't store domU's mfn of ring page in xenstored

This series ports those commits and dependencies to oxenstored.

First of all oxenstored currently doesn't have bindings to xengnttab.
There are upstream bindings available at https://github.com/mirage/ocaml-gnt.
A reduced form of that is imported into oxenstored that removes external dependencies
such as Lwt and Io_page.

This also requires changes to xenmmap interface to make it safer: there are now 2 ways to unmap a
Xenmmap.mmap_interface, so we need to use the type system to ensure that we can't call the wrong
one.

Also cleaned up various minor issues in xenmmap bindings (e.g. allocating more bytes than necessary,
due to a confusion between bytes and words in function parameters).

I've tested that I can boot a Linux and Windows VM after these changes.

Note: I thought about replacing Xenmmap.mmap_interface with Bigarray.Array1.t. However Bigarrays
can't be unmapped at arbitrary point in time by design: they can only be GCed.
We require more precise control in oxenstored, so I retained xenmmap as it is, I don't think it can
be simplified further.

A git tree with this and the other series is available at:
https://gitlab.com/edwintorok/xen/-/compare/master...for-upstream

Edwin Török (9):
  tools/ocaml: use common macros for manipulating mmap_interface
  tools/ocaml/libs/mmap: allocate correct number of bytes
  tools/ocaml/libs/mmap: Expose stub_mmap_alloc
  tools/ocaml/libs/xb: import gnttab stubs from mirage
  tools/ocaml: safer Xenmmap interface
  tools/ocaml/xenstored: use gnttab instead of xenctrl's
    foreign_map_range
  tools/ocaml/xenstored: don't store domU's mfn of ring page
  tools/ocaml/libs/mmap: mark mmap/munmap as blocking
  tools/ocaml/libs/mmap: Clean up unused read/write

 tools/ocaml/libs/mmap/mmap_stubs.h    |  11 ++-
 tools/ocaml/libs/mmap/xenmmap.ml      |  17 +++--
 tools/ocaml/libs/mmap/xenmmap.mli     |  13 ++--
 tools/ocaml/libs/mmap/xenmmap_stubs.c |  86 ++++++++-------------
 tools/ocaml/libs/xb/xb.ml             |  10 +--
 tools/ocaml/libs/xb/xb.mli            |   4 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c   |  14 ++--
 tools/ocaml/libs/xc/xenctrl.ml        |   6 +-
 tools/ocaml/libs/xc/xenctrl.mli       |   5 +-
 tools/ocaml/xenstored/Makefile        |  11 ++-
 tools/ocaml/xenstored/domain.ml       |   9 +--
 tools/ocaml/xenstored/domains.ml      |  13 ++--
 tools/ocaml/xenstored/gnt.ml          |  62 +++++++++++++++
 tools/ocaml/xenstored/gnt.mli         |  87 +++++++++++++++++++++
 tools/ocaml/xenstored/gnttab_stubs.c  | 106 ++++++++++++++++++++++++++
 tools/ocaml/xenstored/process.ml      |  16 ++--
 tools/ocaml/xenstored/xenstored.ml    |  11 +--
 17 files changed, 362 insertions(+), 119 deletions(-)
 create mode 100644 tools/ocaml/xenstored/gnt.ml
 create mode 100644 tools/ocaml/xenstored/gnt.mli
 create mode 100644 tools/ocaml/xenstored/gnttab_stubs.c

-- 
2.25.1


