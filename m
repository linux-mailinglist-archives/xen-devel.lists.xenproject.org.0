Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CB64F0EA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464884.723430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP3-0007Bv-2m; Fri, 16 Dec 2022 18:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464884.723430; Fri, 16 Dec 2022 18:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP2-00079J-W3; Fri, 16 Dec 2022 18:25:48 +0000
Received: by outflank-mailman (input) for mailman id 464884;
 Fri, 16 Dec 2022 18:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP1-0006tv-7I
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d08c929-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:25:44 +0100 (CET)
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
X-Inumbo-ID: 0d08c929-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g4p5R9xtV45SffUqomxDtezBVesWLTVPg0ts1Qe1yj4=;
  b=SBBM9u6RTX/jVga/MIPCsEsa/21uOsQSxPCX8TJ1YTXc4EmlPrKf7rhQ
   LVzRe13rgtNhEYAdb5S8OqKMlo9PdAWSw77T0h5bO9//3zBDMt/Nok8KY
   l7rMFcssRZDOe0py3KobZgWKVuvWfkuWDHVN+/dSlT2pPzZkXwUAfdpdC
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88806404
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zPj6MKqN9QV137olXYOHQu6/bCFeBmLbZRIvgKrLsJaIsI4StFCzt
 garIBnTPv/fYGWhfI8ibonnpkhSv8SAz9BgQVBury42RnwS9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzidNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAClQY0yErcKr+qi2YcxLl+s9I8/uBapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzBUtlOT47Yw+W/Q5AdwzKLsIJzefdniqcB9zhbI/
 jyapziR7hcyBYSQ4iObq0uWme7BpR3SQdseRYbi6as/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIssKwz+UqDXtT7GRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAZJHEPTTUJRgwE55/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3OA2/56SlZebS/aqeNzkn08/lGKb+wGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxb4M4PFyhJEfUQD1
 XCzL66R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+hcaQHfN7FptP/ayOkwz
 zq4H5LaoyizrcWkOnWHmWLtBQ5iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ895m5Ytzgp
 ynnMmcBkQqXuJEyAVnSApyVQO+1DMkXQLNSFXBEAGtELFB/OdfysftCKcRnFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:9FDtm6NiOblQ1MBcTyb155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE7gr5K0tQ4OxoWZPwNk80kKQY3WB/B8bHYOCLggqVxeJZnP3fKl/bakrDH4dmvM
 8OHZSWY+eAbmSS+PyKhTVQZOxQouVvnprJuc7ui1NWCS16YaBp6Al0TiyBFFdteQVADZ0lUL
 KB+8tuvVObCDwqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEiKfwgwVX1p0sPwfGC
 n+4kbED5eYwr2GIyznpiDuBlNt6ZXcI+54dYGxYw4uW3TRY0iTFcRcsva5zUgISamUmS0XeZ
 /30l4d1o1ImgnsV3Dwrh331wb61jEyr3fk1F+DmHPm5df0XTQgFqN69PBkmzbimjodVetHod
 F29nPcs4ASAQLLnSz76dSNXxZ2llCsqX5nleIIlXRQXYYXdbcU9OUkjTdoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DSEkfvc6e1SRQgRlCvj4l7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTdq55DPdpe7rHNoUMe2OzDIu/GyWZKEhcAQOxl3fe2sRI2N2X
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88806404"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 00/11] OCaml fixes
Date: Fri, 16 Dec 2022 18:25:09 +0000
Message-ID: <cover.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

Various OCaml fixes, some of which got Acked already.

Note: the Data_abstract_val got Acked but not yet commited because we thought
there might be a better way with finalizers/etc.
It is not possible to use finalizers here but there is a new followup patch in
this series that detects use-after-free and raises an exception without
trigerring undefined behaviour or crashes (see 'xb: check for unmapped ring').

The formatting patch was controversial during the 4.17 freeze, but master is
open now, and both the maintainer and myself agree with it,
so I think we should be able to do it now.
I've split it up into 2: add the formatting rules, and the actual formatting,
so that it is easier to redo the formatting patch when this gets backported.

I think we should just commit it rather than worry that there might be more
bugfixes to come after and attempt to rebase the bugfixes without the
formatting patch (introducing bugs in the process), especially that one of the
patches not yet posted to fix use of enter/leave changes quite a significant
part of all C stubs, and I don't have a way of developing those patches without
the formatting patch.

The rest are various bugfixes to the C bindings, and I have more to send
after I've tested them
(almost all uses of enter/leave blocking section are
wrong because they access OCaml values in non-safe ways with _H,
but the GC may have already moved them which would cause a crash,
that changes a lot of bindings and needs more testing before sending out,
and I've got a few more OCaml 5 fixes too).

Edwin Török (11):
  tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper
  tools/ocaml/xenstored/Makefile: use ocamldep -sort for linking order
  CODING_STYLE(tools/ocaml): add 'make format' and remove tabs
  tools/ocaml: run "make format"
  CODING-STYLE(tools/ocaml): add .editorconfig to clarify indentation
    uses spaces
  tools/ocaml: add .clang-format
  fixup! tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
  tools/ocaml/libs/mmap: mark mmap/munmap as blocking and raise
    Unix_error on failure
  tools/ocaml/libs/xb: check for unmapped ring before accessing it
  tools/ocaml/xenstored: validate config file before live update
  tools/ocaml/libs/xb: drop Xs_ring.write

 .editorconfig                                 |   20 +
 tools/ocaml/.clang-format                     |    9 +
 tools/ocaml/Makefile                          |    5 +
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c |  194 +-
 tools/ocaml/libs/mmap/mmap_stubs.h            |    8 +-
 tools/ocaml/libs/mmap/xenmmap.ml              |    2 +-
 tools/ocaml/libs/mmap/xenmmap.mli             |    4 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  123 +-
 tools/ocaml/libs/xb/op.ml                     |   76 +-
 tools/ocaml/libs/xb/packet.ml                 |   30 +-
 tools/ocaml/libs/xb/partial.ml                |   48 +-
 tools/ocaml/libs/xb/xb.ml                     |  416 ++--
 tools/ocaml/libs/xb/xb.mli                    |  106 +-
 tools/ocaml/libs/xb/xenbus_stubs.c            |   50 +-
 tools/ocaml/libs/xb/xs_ring.ml                |   31 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c           |  221 +-
 tools/ocaml/libs/xc/xenctrl.ml                |  326 +--
 tools/ocaml/libs/xc/xenctrl.mli               |   12 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 1556 ++++++-------
 tools/ocaml/libs/xentoollog/caml_xentoollog.h |    6 +-
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  196 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          | 2022 ++++++++---------
 tools/ocaml/libs/xs/queueop.ml                |   48 +-
 tools/ocaml/libs/xs/xs.ml                     |  220 +-
 tools/ocaml/libs/xs/xs.mli                    |   46 +-
 tools/ocaml/libs/xs/xsraw.ml                  |  300 +--
 tools/ocaml/libs/xs/xst.ml                    |   76 +-
 tools/ocaml/libs/xs/xst.mli                   |   20 +-
 tools/ocaml/test/dmesg.ml                     |   26 +-
 tools/ocaml/test/list_domains.ml              |    4 +-
 tools/ocaml/test/raise_exception.ml           |    4 +-
 tools/ocaml/test/xtl.ml                       |   28 +-
 tools/ocaml/xenstored/Makefile                |    6 +-
 tools/ocaml/xenstored/config.ml               |  156 +-
 tools/ocaml/xenstored/connection.ml           |  578 ++---
 tools/ocaml/xenstored/connections.ml          |  294 +--
 tools/ocaml/xenstored/disk.ml                 |  218 +-
 tools/ocaml/xenstored/domain.ml               |  116 +-
 tools/ocaml/xenstored/domains.ml              |  298 +--
 tools/ocaml/xenstored/event.ml                |   28 +-
 tools/ocaml/xenstored/history.ml              |   62 +-
 tools/ocaml/xenstored/logging.ml              |  478 ++--
 tools/ocaml/xenstored/packet.ml               |   20 +-
 tools/ocaml/xenstored/parse_arg.ml            |  132 +-
 tools/ocaml/xenstored/perms.ml                |  216 +-
 tools/ocaml/xenstored/poll.ml                 |   68 +-
 tools/ocaml/xenstored/poll.mli                |    4 +-
 tools/ocaml/xenstored/process.ml              | 1210 +++++-----
 tools/ocaml/xenstored/quota.ml                |   74 +-
 tools/ocaml/xenstored/select_stubs.c          |   62 +-
 tools/ocaml/xenstored/stdext.ml               |  190 +-
 tools/ocaml/xenstored/store.ml                |  752 +++---
 tools/ocaml/xenstored/symbol.ml               |    2 +-
 tools/ocaml/xenstored/syslog.ml               |   48 +-
 tools/ocaml/xenstored/syslog_stubs.c          |   68 +-
 tools/ocaml/xenstored/systemd_stubs.c         |   10 +-
 tools/ocaml/xenstored/transaction.ml          |  352 +--
 tools/ocaml/xenstored/trie.ml                 |  222 +-
 tools/ocaml/xenstored/trie.mli                |   22 +-
 tools/ocaml/xenstored/utils.ml                |  146 +-
 tools/ocaml/xenstored/xenstored.ml            |  987 ++++----
 61 files changed, 6569 insertions(+), 6483 deletions(-)
 create mode 100644 .editorconfig
 create mode 100644 tools/ocaml/.clang-format

--
2.34.1


