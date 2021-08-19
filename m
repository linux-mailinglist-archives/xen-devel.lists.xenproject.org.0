Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007523F2029
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169064.308818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6E-0000hi-Fj; Thu, 19 Aug 2021 18:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169064.308818; Thu, 19 Aug 2021 18:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6E-0000ep-CK; Thu, 19 Aug 2021 18:49:10 +0000
Received: by outflank-mailman (input) for mailman id 169064;
 Thu, 19 Aug 2021 18:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErsO=NK=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGn6D-0000ee-0I
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:49:09 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21538bc1-011e-11ec-a652-12813bfff9fa;
 Thu, 19 Aug 2021 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 7C694B5601CB;
 Thu, 19 Aug 2021 21:49:06 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vR5X3jCQjZze; Thu, 19 Aug 2021 21:49:04 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 6D56FB5603BC;
 Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MLGuf4FYdmuI; Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 75E72B560300;
 Thu, 19 Aug 2021 20:50:16 +0300 (EEST)
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
X-Inumbo-ID: 21538bc1-011e-11ec-a652-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/4] Introduce XEN_PAGE_* definitions for mapping guests memory
Date: Thu, 19 Aug 2021 20:50:08 +0300
Message-Id: <cover.1629395092.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series tries to fix a side-effect introduced by commits 0dbb4be7 and
d1b32abd which added a dependency to xenctrl for foreignmemory and gnntab
libraries library only because they needed to use the XC_PAGE_* values.

These changes introduce the XEN_PAGE_* definitions that will be used by a=
ny
toolstack component that doesn't need a dependency to xenctrl library.

Changes since v1:
- Use same page definitions for both x86_64 and ARM (i.e. a single page.h=
 file)
- Introduce xen_mk_long()

Costin Lupu (4):
  public: Add page related definitions for accessing guests memory
  libs/ctrl: Use Xen values for XC_PAGE_* definitions
  libs/foreignmemory: Use XEN_PAGE_* definitions
  libs/gnttab: Use XEN_PAGE_* definitions

 tools/include/xenctrl.h            |  7 +++---
 tools/libs/foreignmemory/core.c    |  2 +-
 tools/libs/foreignmemory/freebsd.c | 10 ++++-----
 tools/libs/foreignmemory/linux.c   | 18 +++++++--------
 tools/libs/foreignmemory/minios.c  | 10 +--------
 tools/libs/foreignmemory/netbsd.c  | 10 ++++-----
 tools/libs/foreignmemory/private.h |  2 +-
 tools/libs/foreignmemory/solaris.c |  6 ++---
 tools/libs/gnttab/freebsd.c        | 20 ++++++++---------
 tools/libs/gnttab/linux.c          | 20 ++++++++---------
 tools/libs/gnttab/netbsd.c         | 20 ++++++++---------
 xen/include/public/page.h          | 36 ++++++++++++++++++++++++++++++
 xen/include/public/xen.h           |  3 +++
 13 files changed, 98 insertions(+), 66 deletions(-)
 create mode 100644 xen/include/public/page.h

--=20
2.20.1


