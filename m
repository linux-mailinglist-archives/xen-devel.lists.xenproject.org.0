Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B32621862
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440122.694216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcg-0002Xw-PC; Tue, 08 Nov 2022 15:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440122.694216; Tue, 08 Nov 2022 15:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcg-0002V0-Ir; Tue, 08 Nov 2022 15:34:46 +0000
Received: by outflank-mailman (input) for mailman id 440122;
 Tue, 08 Nov 2022 15:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQce-0001RY-Mn
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb18ef8-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:43 +0100 (CET)
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
X-Inumbo-ID: ddb18ef8-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921683;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DOGFJCdrDDATd+X1NcZtCSbYvFjIMcP3itquODoYrYY=;
  b=FAt7iuunw/9dFQatGT7lDnBV0uqh+tnTIYZouh4k0f1g0invcaZ4f4CK
   VJexcNNLjcc88oULPo+iuvf0kFCvdstZCm2PQtJpYcxUuXmLkw4cz9QEq
   YiRE+OwUqu8Wh2t1Ng7Ogdf1mCBZE55ezWeLOamrSWBXRXY9KshH5qGwt
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83996681
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YsiNjaoJwYcjGQZpZfOl8OB5F2NeBmIUZRIvgKrLsJaIsI4StFCzt
 garIBnSaPjYYWP2ctwkPd/n8koF6pbUzIVgSgJt+yA1EyoVopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzylNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABkrbzSoi/yN+q2cZcpy2sJ+N5DgJIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzBUtlOT47Yw+W/Q5AdwzKLsIJzefdniqcB9zh3J9
 zyYrz2R7hcyKoa86QHVzEuVhczyjwDxaL8JEv6m36s/6LGU7jNKU0BHPbehmtG1g1Czc8hSI
 EsV/mwpt6da3FOvZsnwWVu/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 lKPhcKvOjVpv5WcU3fb/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5KNq+RpdHrIgvv5
 B+psnQ42q5KhtYEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374105CHx7ZiHCgUpLj2WZWqwXIVDIT4iNaxwtRoMmj1gYXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyhFWfg5lWLuHblNuVPO+szZ7TqNLa0XMjz9iebODJJrYett3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGOmbP+7DkicxAGOHwBg5UGK7HZeVE+SDhJ5j246epJRrGJVp99zo/gl
 kxRkGcDoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:xhcxfK0Q5yoo+c3/taXBPwqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="83996681"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 00/15] OCaml fixes for Xen 4.17
Date: Tue, 8 Nov 2022 15:33:52 +0000
Message-ID: <cover.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These are the patches that I have outstanding for Xen 4.17.
I have included a reason why I'm requesting them to be included in 4.17
after the --- line in each individual patch, see also a summary below.

For convenience the patches are also available in a git repo:
```
git remote add edwintorok https://github.com/edwintorok/xen.git
git fetch edwintorok private/edvint/for-4.17
git log -p origin/master..private/edvint/for-4.17
```
And viewable with a browser too:
https://github.com/edwintorok/xen/compare/private/edvint/for-4.17

* 3 patches related to OCaml 5 support
https://patchwork.kernel.org/project/xen-devel/list/?series=680975
These have already been posted to the list previously, but not
yet committed to master (I probably didn't use the correct subject and
CC line for patches meant for 4.17, I think I've fixed that now)

* Makefile.rules followup
Also part of https://patchwork.kernel.org/project/xen-devel/list/?series=680975
these address some review feedback that I received after patches got
committed

* oxenstored live update bugfixes
Testing of oxenstored live update has revealed some bugs (some of which
got discovered on the C side too and fixed during one of the previous
XSAs, but unfortunately none of that discussion is public, and we've
ended up rediscovering the issue in the OCaml implementation too,
which reminded me of the XSA discussions at the time).
This brings the OCaml live update handling of event channels closer to
the C xenstored version.
It also fixes a few more bugs regarding logging and exception handling
during live update, and during out of memory situations (theoretical now
after XSA-326 fix).

* a bugfix for a xenctrl binding
Xen returns uninitialized data as part of a paging op domctl when a
domain is dying. Workaround in the C stub by always initializing the
domctl arguments to detect this.
Xen fix in hypervisor side will be done separately, but even then having
this is useful defensive coding.
This is a 9 year old bug that still happens today, I've encountered it
while testing this very series, hence the inclusion here.

I expect most of these to be straight forward bugfixes, the only one
slightly controversial might be the indentation one: changing tabs to
spaces to match Xen coding style.

I was unsure whether to include it here,
but I think it is best to have it in 4.17 to simplify future
(security) backports from master to 4.17, and avoid having to deal with
whitespace issues all the time when writing patches.
The code here used a style that was different from Xen's, and also
different from every other piece of code that I work on, and OCaml indentation
tools also only support spaces, not tabs, so there really is no reason
to keep the code as is (initially I thought it uses tabs to follow Xen
style, but after reading CODING_STYLE I realized that is not true).
It is very easy to verify that the patch changes nothing with `git diff
-w`, or `git log -p -1`.

Edwin Török (15):
  tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0
    compat
  tools/ocaml/libs/xc: OCaml 5.0 compatibility
  tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper
  tools/ocaml/xenstored/Makefile: use ocamldep -sort for linking order
  tools/ocaml/Makefile.rules: do not run ocamldep on distclean
  tools/ocaml/Makefile.rules: hide -include on *clean
  CODING_STYLE(tools/ocaml): add 'make format' and remove tabs
  tools/ocaml/libs/evtchn: add xenevtchn_fdopen bindings
  tools/ocaml/xenstored/store.ml: fix build error
  tools/ocaml/xenstored: keep eventchn FD open across live update
  tools/ocaml/xenstored: do not rebind event channels after live update
  tools/ocaml/xenstored: log live update issues at warning level
  tools/ocaml/xenstored: set uncaught exception handler
  tools/ocaml/xenstored/syslog_stubs.c: avoid potential NULL dereference
  tools/ocaml/libs/xc: fix use of uninitialized memory in
    shadow_allocation_get

 tools/ocaml/Makefile                          |    5 +
 tools/ocaml/Makefile.rules                    |    4 +-
 tools/ocaml/libs/eventchn/xeneventchn.ml      |   11 +-
 tools/ocaml/libs/eventchn/xeneventchn.mli     |   14 +-
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c |  199 +-
 tools/ocaml/libs/mmap/mmap_stubs.h            |    9 +-
 tools/ocaml/libs/mmap/xenmmap.ml              |    2 +-
 tools/ocaml/libs/mmap/xenmmap.mli             |    4 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  114 +-
 tools/ocaml/libs/xb/op.ml                     |   76 +-
 tools/ocaml/libs/xb/packet.ml                 |   30 +-
 tools/ocaml/libs/xb/partial.ml                |   48 +-
 tools/ocaml/libs/xb/xb.ml                     |  422 ++--
 tools/ocaml/libs/xb/xb.mli                    |  106 +-
 tools/ocaml/libs/xb/xenbus_stubs.c            |   50 +-
 tools/ocaml/libs/xb/xs_ring.ml                |   28 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c           |  216 +-
 tools/ocaml/libs/xc/abi-check                 |    2 +-
 tools/ocaml/libs/xc/xenctrl.ml                |  330 +--
 tools/ocaml/libs/xc/xenctrl.mli               |   12 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 1428 ++++++------
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
 tools/ocaml/xenstored/connection.ml           |  594 ++---
 tools/ocaml/xenstored/connections.ml          |  304 +--
 tools/ocaml/xenstored/define.ml               |    6 +-
 tools/ocaml/xenstored/disk.ml                 |  218 +-
 tools/ocaml/xenstored/domain.ml               |  104 +-
 tools/ocaml/xenstored/domains.ml              |  320 +--
 tools/ocaml/xenstored/event.ml                |   12 +-
 tools/ocaml/xenstored/history.ml              |   62 +-
 tools/ocaml/xenstored/logging.ml              |  467 ++--
 tools/ocaml/xenstored/packet.ml               |   20 +-
 tools/ocaml/xenstored/parse_arg.ml            |  106 +-
 tools/ocaml/xenstored/perms.ml                |  216 +-
 tools/ocaml/xenstored/poll.ml                 |   68 +-
 tools/ocaml/xenstored/poll.mli                |    4 +-
 tools/ocaml/xenstored/process.ml              | 1212 +++++-----
 tools/ocaml/xenstored/quota.ml                |   74 +-
 tools/ocaml/xenstored/select_stubs.c          |   62 +-
 tools/ocaml/xenstored/stdext.ml               |  190 +-
 tools/ocaml/xenstored/store.ml                |  752 +++---
 tools/ocaml/xenstored/symbol.ml               |    2 +-
 tools/ocaml/xenstored/syslog.ml               |   48 +-
 tools/ocaml/xenstored/syslog_stubs.c          |   33 +-
 tools/ocaml/xenstored/systemd_stubs.c         |   10 +-
 tools/ocaml/xenstored/transaction.ml          |  352 +--
 tools/ocaml/xenstored/trie.ml                 |  222 +-
 tools/ocaml/xenstored/trie.mli                |   22 +-
 tools/ocaml/xenstored/utils.ml                |  146 +-
 tools/ocaml/xenstored/xenstored.ml            | 1051 ++++-----
 64 files changed, 6557 insertions(+), 6388 deletions(-)


base-commit: e61a78981364925a43c9cc24dc77b62ff7b93c9f
-- 
2.34.1


