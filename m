Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDB2638BA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82l-0000Xu-W5; Wed, 09 Sep 2020 21:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82k-0000Wv-8P
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:54:18 +0000
X-Inumbo-ID: 50fc969b-8c2c-43d7-8a9e-387fac720c69
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50fc969b-8c2c-43d7-8a9e-387fac720c69;
 Wed, 09 Sep 2020 21:54:17 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089Ls137039244
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:54:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089Ls1sf039243;
 Wed, 9 Sep 2020 14:54:01 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092154.089Ls1sf039243@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Tue, 1 Sep 2020 15:29:53 -0700
Subject: [PATCH 09/11 RFC] gitignore: Create .gitignore file for config/
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

Since it seems I'm removing all path-specific entries from .gitignore,
the ones for config/ need their own file too.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
 .gitignore        | 5 -----
 config/.gitignore | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 create mode 100644 config/.gitignore

diff --git a/.gitignore b/.gitignore
index 3fea6c6b15..877c2579ab 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,17 +44,12 @@ config.log
 config.status
 config.cache
 config.h
-config/Toplevel.mk
-config/Paths.mk
 
 build-*
 dist/*
 extras/mini-os*
 install/*
 tools/*/build/lib*/*.py
-config/Tools.mk
-config/Stubdom.mk
-config/Docs.mk
 tools/libs/toolcore/headers.chk
 tools/libs/toollog/headers.chk
 tools/libs/evtchn/headers.chk
diff --git a/config/.gitignore b/config/.gitignore
new file mode 100644
index 0000000000..54ad25c672
--- /dev/null
+++ b/config/.gitignore
@@ -0,0 +1,5 @@
+/Docs.mk
+/Paths.mk
+/Stubdom.mk
+/Tools.mk
+/Toplevel.mk
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




