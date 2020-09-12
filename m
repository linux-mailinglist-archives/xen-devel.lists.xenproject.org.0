Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE1267ABD
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 15:59:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH62g-0002iF-IG; Sat, 12 Sep 2020 13:58:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kH62e-0002hh-Ks
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 13:58:12 +0000
X-Inumbo-ID: 1bc3f102-75cc-4c60-bf33-a0361d8fe03b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bc3f102-75cc-4c60-bf33-a0361d8fe03b;
 Sat, 12 Sep 2020 13:58:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3471BAC8B;
 Sat, 12 Sep 2020 13:58:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] tools/build: fix python xc bindings
Date: Sat, 12 Sep 2020 15:58:07 +0200
Message-Id: <20200912135807.28293-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
was just wrong: there is one function from libxenguest used in the
bindings, so readd the library again.

While at it remove the unused PATH_LIBXL setting.

Fixes: 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/python/setup.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8254464aff..1afe800479 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -10,7 +10,7 @@ PATH_XEN      = XEN_ROOT + "/tools/include"
 PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"
 PATH_LIBXENEVTCHN = XEN_ROOT + "/tools/libs/evtchn"
 PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
-PATH_LIBXL    = XEN_ROOT + "/tools/libxl"
+PATH_LIBXENGUEST = XEN_ROOT + "/tools/libs/guest"
 PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
 
 xc = Extension("xc",
@@ -19,10 +19,11 @@ xc = Extension("xc",
                                       PATH_LIBXENTOOLLOG + "/include",
                                       PATH_LIBXENEVTCHN + "/include",
                                       PATH_LIBXENCTRL + "/include",
+                                      PATH_LIBXENGUEST + "/include",
                                       "xen/lowlevel/xc" ],
-               library_dirs       = [ PATH_LIBXENCTRL ],
-               libraries          = [ "xenctrl" ],
-               depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so" ],
+               library_dirs       = [ PATH_LIBXENCTRL, PATH_LIBXENGUEST ],
+               libraries          = [ "xenctrl", "xenguest" ],
+               depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so", PATH_LIBXENGUEST + "/libxenguest.so" ],
                extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
                sources            = [ "xen/lowlevel/xc/xc.c" ])
 
-- 
2.26.2


