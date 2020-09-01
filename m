Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21392638BE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:54:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG83A-0000nb-P0; Wed, 09 Sep 2020 21:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG839-0000hS-Sy
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:54:43 +0000
X-Inumbo-ID: 2e4f373a-d08d-4ccd-b453-6639bf5fc402
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e4f373a-d08d-4ccd-b453-6639bf5fc402;
 Wed, 09 Sep 2020 21:54:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LsKvq039271
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:54:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LsKcO039270;
 Wed, 9 Sep 2020 14:54:20 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092154.089LsKcO039270@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Tue, 1 Sep 2020 15:54:54 -0700
Subject: [PATCH 11/11 RFC] gitignore: RFC Prelimiary final cleanup of top-level
 .gitignore
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
 KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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

This sorts .gitignore and cleans a few entries up.

Notably I *think* "dist/*" and "install/*" should be "/dist/*" and
"/install/*" as I'm doubting whether anyone will have those directories
anywhere, but the top.  Yet on top of this there is also an entry for
"dist" which I'm unsure of.

I'm rather concerned about "build-*" as I see the scripts:
"automation/scripts/build-test.sh" and
"automation/gitlab-ci/build-each-commit.sh" already in the repository.
These aren't effected by the .gitignore as they're already being tracked,
but this is a suboptimal situation.

I also note the presence of /tools/qemu-xen-build,
/tools/pygrub/build/, /tools/python/build/ and
/tools/tests/regression/build/ as things which might be useful to
address.

The entry "LibVNCServer*" seems like perhaps it should start with a
slash and/or have a tighter glob?

Some of the very old entries which originate at the begining,
e46056227fa3a7319e859455fa9f10c918451e43 I'm unsure of.  Does anyone
still want "TAGS" ignored?
".git" and ".hg" are obvious, though is there value in them remaining
when Mercurial seems to be disappearing?

What is/was behind c1df7c6ab655bcbf97024e8b79e55ba554cde83f and are those
still useful?  Presently they're still there, but in a situation like
this, removing this is more valuable than leaving them.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
 .gitignore | 70 +++++++++++++++++++++++++-----------------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/.gitignore b/.gitignore
index 5c17736c2e..5f9b8b0297 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,54 +1,50 @@
 !__*__.py
-.hg
-.*.cmd
-*.orig
-*~
-*.swp
-*.o
+*.a
+*.bak
+*.bin
 *.d
 *.d2
+*.gcda
+*.gcno
+*.o
+*.old
 *.opic
-*.a
+*.orig
+*.pc
+*.py[ocd]
 *.so
 *.so.[0-9]*
-*.bin
-*.bak
+*.spit
+*.spot
+*.swp
 *.tar
 *.tar.*z*
 *.tmp
-*.spot
-*.spit
-*.gcno
-*.gcda
-*.old
-*.pc
-*.py[ocd]
-TAGS
-GTAGS
-GRTAGS
+*~
+.*.cmd
+.config
+.git
+.hg
+.vimrc
+.vscode
 GPATH
+GRTAGS
 GSYMS
-tags
+GTAGS
+LibVNCServer*
+TAGS
+autom4te.cache/
+build-*
+config.cache
+config.h
+config.log
+config.status
 cscope.files
 cscope.in.out
 cscope.out
 cscope.po.out
-.config
-.vimrc
-.vscode
-
 dist
+tags
 
-autom4te.cache/
-config.log
-config.status
-config.cache
-config.h
-
-build-*
-dist/*
-extras/mini-os*
-install/*
-LibVNCServer*
-
-.git
+/dist/*
+/install/*
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




