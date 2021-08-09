Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7A3E47E6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165018.301550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zc-0005Zk-73; Mon, 09 Aug 2021 14:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165018.301550; Mon, 09 Aug 2021 14:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zc-0005Xr-2p; Mon, 09 Aug 2021 14:48:16 +0000
Received: by outflank-mailman (input) for mailman id 165018;
 Mon, 09 Aug 2021 14:48:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFlj=NA=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mD6Za-0005Xf-NN
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:48:14 +0000
Received: from mx.upb.ro (unknown [141.85.13.241])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1d63661-f920-11eb-9f1d-12813bfff9fa;
 Mon, 09 Aug 2021 14:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 6A53EB560068;
 Mon,  9 Aug 2021 17:48:11 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dAJLpqZI-BFc; Mon,  9 Aug 2021 17:48:09 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 2E363B560090;
 Mon,  9 Aug 2021 17:48:09 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1AFhtEz_sZkN; Mon,  9 Aug 2021 17:48:09 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 54278B560068;
 Mon,  9 Aug 2021 17:48:07 +0300 (EEST)
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
X-Inumbo-ID: d1d63661-f920-11eb-9f1d-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/4] Introduce XEN_PAGE_* definitions for mapping guests memory
Date: Mon,  9 Aug 2021 17:47:55 +0300
Message-Id: <cover.1628519855.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series tries to fix a side-effect introduced by commits 0dbb4be7 and
d1b32abd which added a dependency to xenctrl for foreignmemory and gnntab
libraries library only because they needed to use the XC_PAGE_* values.

These changes introduce the XEN_PAGE_* definitions that will be used by a=
ny
toolstack component that doesn't need a dependency to xenctrl library. =20

Costin Lupu (4):
  public: Add page related definitions for accessing guests memory
  libs/ctrl: Use Xen values for XC_PAGE_* definitions
  libs/foreignmemory: Use XEN_PAGE_* definitions
  libs/gnttab: Use XEN_PAGE_* definitions

 tools/include/xenctrl.h            |  7 +++---
 tools/libs/foreignmemory/core.c    |  2 +-
 tools/libs/foreignmemory/freebsd.c | 10 ++++----
 tools/libs/foreignmemory/linux.c   | 18 +++++++-------
 tools/libs/foreignmemory/minios.c  | 10 +-------
 tools/libs/foreignmemory/netbsd.c  | 10 ++++----
 tools/libs/foreignmemory/private.h |  2 +-
 tools/libs/foreignmemory/solaris.c |  6 ++---
 tools/libs/gnttab/freebsd.c        | 20 ++++++++--------
 tools/libs/gnttab/linux.c          | 20 ++++++++--------
 tools/libs/gnttab/netbsd.c         | 20 ++++++++--------
 xen/include/public/arch-arm/page.h | 34 ++++++++++++++++++++++++++
 xen/include/public/arch-x86/page.h | 34 ++++++++++++++++++++++++++
 xen/include/public/page.h          | 38 ++++++++++++++++++++++++++++++
 14 files changed, 165 insertions(+), 66 deletions(-)
 create mode 100644 xen/include/public/arch-arm/page.h
 create mode 100644 xen/include/public/arch-x86/page.h
 create mode 100644 xen/include/public/page.h

--=20
2.20.1


