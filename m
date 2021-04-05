Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFAC3543DD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105393.201728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbO-000287-AR; Mon, 05 Apr 2021 15:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105393.201728; Mon, 05 Apr 2021 15:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbO-00027k-7R; Mon, 05 Apr 2021 15:57:22 +0000
Received: by outflank-mailman (input) for mailman id 105393;
 Mon, 05 Apr 2021 15:57:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbM-00027V-9M
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbK-0002n6-Cy; Mon, 05 Apr 2021 15:57:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbJ-00053b-TX; Mon, 05 Apr 2021 15:57:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=1GqICW/O9fKSb94+mzq/HGQFUX5If7mWeUd6pvOkBFY=; b=bvu0XCkxaPx45nkPtYZpTbXk0g
	swkcbZyG1lETz8WlL3dplJSKeAnjacM5cZurrefJ2FyB1+5Is9apqGs8Dqk4un0JHN/MKM/oMu5dU
	ZMRORl0p7ZC0GsS+PE9efyXL9D/F0pj5Dpy3n/zTjzVhKQiEGll+aOI0POhkL8F2zbik=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Tim Deegan <tim@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 00/14] Use const whether we point to literal strings (take 1)
Date: Mon,  5 Apr 2021 16:56:59 +0100
Message-Id: <20210405155713.29754-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

By default, both Clang and GCC will happily compile C code where
non-const char * point to literal strings. This means the following
code will be accepted:

    char *str = "test";

    str[0] = 'a';

Literal strings will reside in rodata, so they are not modifiable.
This will result to an permission fault at runtime if the permissions
are enforced in the page-tables (this is the case in Xen).

I am not aware of code trying to modify literal strings in Xen.
However, there is a frequent use of non-const char * to point to
literal strings. Given the size of the codebase, there is a risk
to involuntarily introduce code that will modify literal strings.

Therefore it would be better to enforce using const when pointing
to such strings. Both GCC and Clang provide an option to warn
for such case (see -Wwrite-strings) and therefore could be used
by Xen.

This series doesn't yet make use of -Wwrite-strings because
the tree is not fully converted. Instead, it contains some easy
and likely non-controversial use const in the code.

The major blockers to enable -Wwrite-strings are the following:
    - xen/common/efi: union string is used in both const and
    non-const situation. It doesn't feel right to specific one member
    const and the other non-const.
    - libxl: the major block is the flexarray framework as we would use
    it with string (now const char*). I thought it would be possible to
    make the interface const, but it looks like there are a couple of
    places where we need to modify the content (such as in
    libxl_json.c).

Ideally, I would like to have -Wwrite-strings unconditionally used
tree-wide. But, some of the area may required some heavy refactoring.

One solution would be to enable it tree-wide but turned it off at a
directroy/file level.

Any opinions?

Cheers,

Julien Grall (14):
  xen: Constify the second parameter of rangeset_new()
  xen/sched: Constify name and opt_name in struct scheduler
  xen/x86: shadow: The return type of sh_audit_flags() should be const
  xen/char: console: Use const whenever we point to literal strings
  tools/libs: guest: Use const whenever we point to literal strings
  tools/libs: stat: Use const whenever we point to literal strings
  tools/xl: Use const whenever we point to literal strings
  tools/firmware: hvmloader: Use const in __bug() and __assert_failed()
  tools/console: Use const whenever we point to literal strings
  tools/kdd: Use const whenever we point to literal strings
  tools/misc: Use const whenever we point to literal strings
  tools/top: The string parameter in set_prompt() and set_delay() should
    be const
  tools/xenmon: xenbaked: Mark const the field text in stat_map_t
  tools/xentrace: Use const whenever we point to literal strings

 tools/console/client/main.c         |  4 +-
 tools/console/daemon/io.c           | 10 ++--
 tools/debugger/kdd/kdd.c            | 10 ++--
 tools/firmware/hvmloader/util.c     |  4 +-
 tools/firmware/hvmloader/util.h     |  4 +-
 tools/include/xenguest.h            | 10 ++--
 tools/libs/guest/xg_dom_core.c      |  8 ++--
 tools/libs/guest/xg_dom_elfloader.c |  4 +-
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 tools/libs/guest/xg_dom_x86.c       |  9 ++--
 tools/libs/guest/xg_private.h       |  2 +-
 tools/libs/stat/xenstat_linux.c     |  4 +-
 tools/libs/stat/xenstat_qmp.c       | 12 ++---
 tools/misc/xen-detect.c             |  2 +-
 tools/misc/xenhypfs.c               |  6 +--
 tools/xenmon/xenbaked.c             |  2 +-
 tools/xentop/xentop.c               | 12 ++---
 tools/xentrace/xenalyze.c           | 71 +++++++++++++++--------------
 tools/xentrace/xenctx.c             |  4 +-
 tools/xl/xl.h                       |  8 ++--
 tools/xl/xl_console.c               |  2 +-
 tools/xl/xl_utils.c                 |  4 +-
 tools/xl/xl_utils.h                 |  4 +-
 xen/arch/x86/mm/shadow/multi.c      | 12 ++---
 xen/common/rangeset.c               |  2 +-
 xen/common/sched/private.h          |  4 +-
 xen/drivers/char/console.c          |  4 +-
 xen/include/xen/rangeset.h          |  2 +-
 28 files changed, 113 insertions(+), 109 deletions(-)

-- 
2.17.1


