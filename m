Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EDE39F6E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 14:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138454.256291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaxM-0007Ug-Se; Tue, 08 Jun 2021 12:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138454.256291; Tue, 08 Jun 2021 12:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaxM-0007RP-OC; Tue, 08 Jun 2021 12:35:44 +0000
Received: by outflank-mailman (input) for mailman id 138454;
 Tue, 08 Jun 2021 12:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GltA=LC=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lqaxM-0007Oq-0A
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 12:35:44 +0000
Received: from mx.upb.ro (unknown [141.85.13.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e435a3d-c40f-4b75-b4a5-51754ef705cd;
 Tue, 08 Jun 2021 12:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 10425B560199;
 Tue,  8 Jun 2021 15:35:40 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ifZF8FZnpxHz; Tue,  8 Jun 2021 15:35:38 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id EA895B560192;
 Tue,  8 Jun 2021 15:35:37 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C75VuhEwhfYB; Tue,  8 Jun 2021 15:35:37 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 4345EB56018F;
 Tue,  8 Jun 2021 15:35:37 +0300 (EEST)
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
X-Inumbo-ID: 0e435a3d-c40f-4b75-b4a5-51754ef705cd
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 0/5] Fix redefinition errors for toolstack libs
Date: Tue,  8 Jun 2021 15:35:24 +0300
Message-Id: <cover.1623155575.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For replication I used gcc 10.3 on an Alpine system. In order to replicat=
e the
redefinition error for PAGE_SIZE one should install the 'fortify-headers'
package which will change the chain of included headers by indirectly inc=
luding
/usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.

Changes since v1:
- Use XC_PAGE_* macros instead of PAGE_* macros

Changes since v2:
- Define KDD_PAGE_* macros for changes in debugger/kdd/

Changes since v3:
- Use sysconf(_SC_PAGESIZE) instead of getpagesize()

Costin Lupu (5):
  tools/debugger: Fix PAGE_SIZE redefinition error
  tools/libfsimage: Fix PATH_MAX redefinition error
  tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
  tools/libs/gnttab: Fix PAGE_SIZE redefinition error
  tools/ocaml: Fix redefinition errors

 tools/debugger/kdd/kdd-xen.c                  | 15 ++++------
 tools/debugger/kdd/kdd.c                      | 19 ++++++-------
 tools/debugger/kdd/kdd.h                      |  7 +++++
 tools/libfsimage/ext2fs/fsys_ext2fs.c         |  2 ++
 tools/libfsimage/reiserfs/fsys_reiserfs.c     |  2 ++
 tools/libs/foreignmemory/core.c               |  2 +-
 tools/libs/foreignmemory/freebsd.c            | 10 +++----
 tools/libs/foreignmemory/linux.c              | 23 +++++++--------
 tools/libs/foreignmemory/minios.c             |  2 +-
 tools/libs/foreignmemory/netbsd.c             | 10 +++----
 tools/libs/foreignmemory/private.h            |  9 +-----
 tools/libs/gnttab/freebsd.c                   | 28 +++++++++----------
 tools/libs/gnttab/linux.c                     | 28 +++++++++----------
 tools/libs/gnttab/netbsd.c                    | 23 +++++++--------
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 10 +++----
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  4 +++
 tools/ocaml/libs/xl/xenlight_stubs.c          |  4 +++
 17 files changed, 98 insertions(+), 100 deletions(-)

--=20
2.20.1


