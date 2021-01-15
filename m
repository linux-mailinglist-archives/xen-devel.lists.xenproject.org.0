Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB22F8903
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68788.123297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3c-0003UF-K6; Fri, 15 Jan 2021 22:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68788.123297; Fri, 15 Jan 2021 22:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3c-0003SC-3r; Fri, 15 Jan 2021 22:59:04 +0000
Received: by outflank-mailman (input) for mailman id 68788;
 Fri, 15 Jan 2021 22:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xyq-0001Wj-2i
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:54:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7b4281f-478a-451d-b52d-3c7806537371;
 Fri, 15 Jan 2021 22:52:48 +0000 (UTC)
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
X-Inumbo-ID: d7b4281f-478a-451d-b52d-3c7806537371
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t/wN5r497w7vQLhqSzDZyRk5eZ015ahFg35m5CK+F7I=;
  b=E/V9QABiSgXb+ALEGugU5/sD7m1EgBF+MIMtHIA2pdGEc2Jtpgyt2yJA
   Lx4S7MquQubmDpA5OgTFvBJl7cksAaftqM1bPO4OgWFLYuLo1vJcnin1l
   wurVAgCdx2Fa8U460RtgarTnFUdeKzxue0c3j8vviDULbsh0Z1upSpQVR
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dQZ84jtoEGpafJSkbBrECJ1pJGTpbORqbXZ1iJci+lMm3KuEXEM/6GZwM7TDwReKTe6lpmcwg3
 T1EHeLNOPtzaHWIYjw/FVWEiO6gMt+tpaegSHjx4gc0bRqhE3Te1/bbviQ6qvtfU5Ia4ztu/2B
 3nr0Q3/h+cHzn+Jlps0NteeAr58oxlXtAcGrJqqYZSNQMRg/L4oWLzDbWfwKWUxkd97HwX4ae4
 GLtfrLQ8HnA2RslieaB3MDhUOuX56wgJBKiy2bRyTvkTcKpk7CmDKoxnD8HkAvJhgWpuH5fH7C
 DFs=
X-SBRS: 5.1
X-MesageID: 35217504
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35217504"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 0/5] tools/ocaml/xenstored: structured fuzz testing
Date: Fri, 15 Jan 2021 22:28:59 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Test that live update functionality works correctly by writing a
Quickcheck-style property test that asserts that oxenstored state
is the same whether the live-update command was run or not.

Crowbar is used for supplying random numbers to quickcheck,
which optionally works with AFL as a driver, but can also be used
without external dependencies.

This is also called structured fuzz testing, because we don't fuzz
the xenstore commands or state directly, but generate some valid looking
trees and commands based on fuzzing the parameters of these commands.

Inspired by the 'qcstm' package and presentation at ICFP 2020,
but using 'crowbar' instead, due to its integration with AFL.

This is a work in progress, transaction live updates do not work yet,
and should be split out from this series.

For convenience here is a series with all patches applied,
review welcome either there or on the mailing list:
https://github.com/edwintorok/xen/pull/1

This series hasn't been reviewed yet, but has been in development during
the XSA series.
It (and myself) kept finding new XSAs and bugs to fix, which left the test itself in
an unfinished state, it is possible to improve it to find more bugs.

Edwin Török (5):
  tools/ocaml: add unit test skeleton with Dune build system
  tools/ocaml/xenstored: implement the live migration binary format
  tools/ocaml/xenstored: add binary dump format support
  tools/ocaml/xenstored: add support for binary format
  Add structured fuzzing unit test

 tools/ocaml/.gitignore                        |   2 +
 tools/ocaml/Makefile                          |  52 ++
 tools/ocaml/dune-project                      |   5 +
 tools/ocaml/libs/eventchn/dune                |   8 +
 tools/ocaml/libs/mmap/dune                    |   8 +
 tools/ocaml/libs/xb/dune                      |   7 +
 tools/ocaml/libs/xc/dune                      |   9 +
 tools/ocaml/libs/xs/dune                      |   4 +
 tools/ocaml/xen.opam                          |   0
 tools/ocaml/xenstore.opam                     |   0
 tools/ocaml/xenstored.opam                    |  18 +
 tools/ocaml/xenstored/Makefile                |   3 +-
 tools/ocaml/xenstored/connection.ml           |  63 +-
 tools/ocaml/xenstored/disk.ml                 | 318 ++++++++
 tools/ocaml/xenstored/dune                    |  19 +
 tools/ocaml/xenstored/parse_arg.ml            |   2 +-
 tools/ocaml/xenstored/perms.ml                |   2 +
 tools/ocaml/xenstored/poll.ml                 |   3 +-
 tools/ocaml/xenstored/process.ml              |  12 +-
 tools/ocaml/xenstored/store.ml                |   1 +
 tools/ocaml/xenstored/test/dune               |  11 +
 tools/ocaml/xenstored/test/generator.ml       | 189 +++++
 tools/ocaml/xenstored/test/model.ml           | 253 ++++++
 tools/ocaml/xenstored/test/old/arbitrary.ml   | 261 +++++++
 tools/ocaml/xenstored/test/old/gen_paths.ml   |  66 ++
 .../xenstored/test/old/xenstored_test.ml      | 527 +++++++++++++
 tools/ocaml/xenstored/test/pathtree.ml        |  40 +
 tools/ocaml/xenstored/test/testable.ml        | 364 +++++++++
 tools/ocaml/xenstored/test/types.ml           | 427 ++++++++++
 tools/ocaml/xenstored/test/xenctrl.ml         |  48 ++
 tools/ocaml/xenstored/test/xeneventchn.ml     |  50 ++
 tools/ocaml/xenstored/test/xenstored_test.ml  | 147 ++++
 tools/ocaml/xenstored/test/xs_protocol.ml     | 733 ++++++++++++++++++
 tools/ocaml/xenstored/transaction.ml          | 119 ++-
 tools/ocaml/xenstored/xenstored.ml            | 205 ++++-
 35 files changed, 3918 insertions(+), 58 deletions(-)
 create mode 100644 tools/ocaml/.gitignore
 create mode 100644 tools/ocaml/dune-project
 create mode 100644 tools/ocaml/libs/eventchn/dune
 create mode 100644 tools/ocaml/libs/mmap/dune
 create mode 100644 tools/ocaml/libs/xb/dune
 create mode 100644 tools/ocaml/libs/xc/dune
 create mode 100644 tools/ocaml/libs/xs/dune
 create mode 100644 tools/ocaml/xen.opam
 create mode 100644 tools/ocaml/xenstore.opam
 create mode 100644 tools/ocaml/xenstored.opam
 create mode 100644 tools/ocaml/xenstored/dune
 create mode 100644 tools/ocaml/xenstored/test/dune
 create mode 100644 tools/ocaml/xenstored/test/generator.ml
 create mode 100644 tools/ocaml/xenstored/test/model.ml
 create mode 100644 tools/ocaml/xenstored/test/old/arbitrary.ml
 create mode 100644 tools/ocaml/xenstored/test/old/gen_paths.ml
 create mode 100644 tools/ocaml/xenstored/test/old/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/test/pathtree.ml
 create mode 100644 tools/ocaml/xenstored/test/testable.ml
 create mode 100644 tools/ocaml/xenstored/test/types.ml
 create mode 100644 tools/ocaml/xenstored/test/xenctrl.ml
 create mode 100644 tools/ocaml/xenstored/test/xeneventchn.ml
 create mode 100644 tools/ocaml/xenstored/test/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/test/xs_protocol.ml

-- 
2.29.2


