Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A107D2638B8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:54:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82R-0000O5-Bq; Wed, 09 Sep 2020 21:53:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82Q-0000Nf-Aj
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:58 +0000
X-Inumbo-ID: c14adc10-b10b-494e-89e5-ece30283baa1
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c14adc10-b10b-494e-89e5-ece30283baa1;
 Wed, 09 Sep 2020 21:53:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089Lri3e039225
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LriKY039224;
 Wed, 9 Sep 2020 14:53:44 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089LriKY039224@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Mon, 31 Aug 2020 16:20:45 -0700
Subject: [PATCH 07/11 RFC] gitignore: Create .gitignore file for docs/
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

Going through and breaking targetted matches off of the top-level
.gitignore file.  This is the patch to create docs/.gitignore.

Merge docs/man[1-9]/ together while I'm at it.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
 .gitignore      | 12 ------------
 docs/.gitignore |  8 ++++++++
 2 files changed, 8 insertions(+), 12 deletions(-)
 create mode 100644 docs/.gitignore

diff --git a/.gitignore b/.gitignore
index 4f95d7b016..18339f3bab 100644
--- a/.gitignore
+++ b/.gitignore
@@ -49,16 +49,6 @@ config/Paths.mk
 
 build-*
 dist/*
-docs/tmp.*
-docs/html/
-docs/man/xl.cfg.5.pod
-docs/man/xl.1.pod
-docs/man1/
-docs/man5/
-docs/man7/
-docs/man8/
-docs/pdf/
-docs/txt/
 extras/mini-os*
 install/*
 stubdom/*-minios-config.mk
@@ -251,5 +241,3 @@ tools/python/xen/lowlevel/xl/_pyxl_types.h
 tools/xenstore/xenstore-watch
 tools/xl/_paths.h
 tools/xl/xl
-
-docs/figs/*.png
diff --git a/docs/.gitignore b/docs/.gitignore
new file mode 100644
index 0000000000..532c9d06a0
--- /dev/null
+++ b/docs/.gitignore
@@ -0,0 +1,8 @@
+/figs/*.png
+/html/
+/man/xl.1.pod
+/man/xl.cfg.5.pod
+/man[1-9]/
+/pdf/
+/tmp.*
+/txt/
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




